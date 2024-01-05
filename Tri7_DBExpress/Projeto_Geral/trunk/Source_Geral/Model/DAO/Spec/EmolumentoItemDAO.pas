unit EmolumentoItemDAO;

interface

uses
  DAO,
  EmolumentoItem,
  EmolumentoItemList,
  Emolumento,
  EmolumentoPeriodo,
  Data.SqlExpr,
  Data.DB;

type
  IEmolumentoItemDAO = interface(IDAO<IEmolumentoItem, TEmolumentoItemList>)
    ['{FF05D769-A35A-4431-A906-FB901D44799B}']

    function GetByValorIntervalo(
      const vpEmolumento: IEmolumento;
      const vpEmolumentoPeriodo: IEmolumentoPeriodo;
      const vpValor: Currency): IEmolumentoItem;
  end;

  TEmolumentoItemDAO = class
  private
    FSQLConnection: TSQLConnection;

    function CarregarEmolumentoItem(
      const vpValue: TDataSet): IEmolumentoItem;
  public
    constructor Create(
      const vpSQLConnection: TSQLConnection); reintroduce;

    function GetList(
      const vpEmolumento: IEmolumento;
      const vpEmolumentoPeriodo: IEmolumentoPeriodo;
      const vpValor: Currency): TEmolumentoItemList; overload;

    function Get(
      const vpEmolumento: IEmolumento;
      const vpEmolumentoItemID: Integer): IEmolumentoItem; overload;

    function GetList: TEmolumentoItemList; overload;

    function GetList(
      const vpEmolumento: IEmolumento): TEmolumentoItemList; overload;

    function Get(
      const vpEmolumentoItemID: Integer): IEmolumentoItem; overload;

    procedure Inserir(
      const vpValue: IEmolumentoItem);
  end;

implementation

uses
  EmolumentoPeriodoDAO,
  System.SysUtils,
  BooleanHelper,
  EmolumentoDAO,
  EmolumentoItemImpl;

{ TEmolumentoItemDAO }

function TEmolumentoItemDAO.CarregarEmolumentoItem(
  const vpValue: TDataSet): IEmolumentoItem;
{$REGION 'Variáveis'}
var
  viField: TField;
{$ENDREGION}
begin
  Result := TEmolumentoItem.Create;

  with vpValue, Result do
  begin
    viField := FindField('EMOLUMENTO_ITEM_ID');
    if Assigned(viField) then
      EmolumentoItemID := viField.AsInteger;

    viField := FindField('EMOLUMENTO_ID');
    if Assigned(viField) and
      viField.IsNull.&Not then
      with TEmolumentoDAO.Create(FSQLConnection) do
        Emolumento := Get(viField.AsInteger);

    viField := FindField('EMOLUMENTO_PERIODO_ID');
    if Assigned(viField) and
      viField.IsNull.&Not then
      with TEmolumentoPeriodoDAO.Create(FSQLConnection) do
        EmolumentoPeriodo := Get(viField.AsInteger);

    viField := FindField('VALOR_INICIO');
    if Assigned(viField) then
      ValorInicio := viField.AsCurrency;

    viField := FindField('VALOR_FIM');
    if Assigned(viField) then
      ValorFim := viField.AsCurrency;

    viField := FindField('VALOR_EMOLUMENTO');
    if Assigned(viField) then
      ValorEmolumento := viField.AsCurrency;

    viField := FindField('VALOR_TAXA_JUDICIARIA');
    if Assigned(viField) then
      ValorTaxaJudiciaria := viField.AsCurrency;

    viField := FindField('CODIGO');
    if Assigned(viField) then
      Codigo := viField.AsInteger;

    viField := FindField('PAGINA_EXTRA');
    if Assigned(viField) then
      PaginaExtra := viField.AsInteger;

    viField := FindField('VALOR_PAGINA_EXTRA');
    if Assigned(viField) then
      ValorPaginaExtra := viField.AsCurrency;

    viField := FindField('VALOR_OUTRA_TAXA1');
    if Assigned(viField) then
      ValorOutraTaxa1 := viField.AsCurrency;

    viField := FindField('CODIGO_SELO');
    if Assigned(viField) then
      CodigoSelo := viField.AsString;
  end;
end;

constructor TEmolumentoItemDAO.Create(
  const vpSQLConnection: TSQLConnection);
begin
  inherited Create;
  FSQLConnection := vpSQLConnection;
end;

function TEmolumentoItemDAO.GetList(
  const vpEmolumento: IEmolumento;
  const vpEmolumentoPeriodo: IEmolumentoPeriodo;
  const vpValor: Currency): TEmolumentoItemList;
{$REGION 'Variáveis'}
var
  viSQLDataSet: TSQLDataSet;
  viEmolumentoItem: IEmolumentoItem;
{$ENDREGION}
begin
  Result := nil;

  viSQLDataSet := TSQLDataSet.Create(nil);
  viSQLDataSet.SQLConnection := FSQLConnection;

  try
    with viSQLDataSet do
    begin
      {$REGION 'Comando SQL SELECT'}
      CommandText :=
        'SELECT ' +

        {$REGION 'Colunas'}
        'EMOLUMENTO_ITEM_ID, ' +
        'VALOR_INICIO, ' +
        'VALOR_FIM, ' +
        'VALOR_EMOLUMENTO, ' +
        'VALOR_TAXA_JUDICIARIA, ' +
        'CODIGO, ' +
        'PAGINA_EXTRA, ' +
        'VALOR_PAGINA_EXTRA, ' +
        'VALOR_OUTRA_TAXA1, ' +
        'CODIGO_SELO ' +
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_EMOLUMENTO_ITEM ' +
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +
        'EMOLUMENTO_ID = :P_EMOLUMENTO_ID AND ' +
        'EMOLUMENTO_PERIODO_ID = :P_EMOLUMENTO_PERIODO_ID AND ' +
        ':P_VALOR BETWEEN VALOR_INICIO AND VALOR_FIM;';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_EMOLUMENTO_ID').AsInteger := vpEmolumento.EmolumentoID;

      ParamByName('P_EMOLUMENTO_PERIODO_ID').AsInteger := vpEmolumentoPeriodo.
        EmolumentoPeriodoID;

      ParamByName('P_VALOR').AsCurrency := vpValor;
      {$ENDREGION}

      Open;

      try
        if IsEmpty then
          Exit;

        First;
        Result := TEmolumentoItemList.Create;

        while not Eof do
          try
            viEmolumentoItem := CarregarEmolumentoItem(viSQLDataSet);
            viEmolumentoItem.Emolumento := vpEmolumento;
            viEmolumentoItem.EmolumentoPeriodo := vpEmolumentoPeriodo;
            Result.Add(viEmolumentoItem);
          finally
            Next;
          end;
      finally
        Close;
      end;
    end;
  finally
    FreeAndNil(viSQLDataSet);
  end;
end;

function TEmolumentoItemDAO.Get(
  const vpEmolumento: IEmolumento;
  const vpEmolumentoItemID: Integer): IEmolumentoItem;
{$REGION 'Variáveis'}
var
  viSQLDataSet: TSQLDataSet;
{$ENDREGION}
begin
  Result := nil;

  viSQLDataSet := TSQLDataSet.Create(nil);
  viSQLDataSet.SQLConnection := FSQLConnection;

  try
    with viSQLDataSet do
    begin
      {$REGION 'Comando SQL SELECT'}
      CommandText :=
        'SELECT ' +

        {$REGION 'Colunas'}
        'EMOLUMENTO_PERIODO_ID, ' +
        'VALOR_INICIO, ' +
        'VALOR_FIM, ' +
        'VALOR_EMOLUMENTO, ' +
        'VALOR_TAXA_JUDICIARIA, ' +
        'CODIGO, ' +
        'PAGINA_EXTRA, ' +
        'VALOR_PAGINA_EXTRA, ' +
        'VALOR_OUTRA_TAXA1, ' +
        'CODIGO_SELO ' +
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_EMOLUMENTO_ITEM ' +
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +
        'EMOLUMENTO_ITEM_ID = :P_EMOLUMENTO_ITEM_ID;';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_EMOLUMENTO_ITEM_ID').AsInteger := vpEmolumentoItemID;
      {$ENDREGION}

      Open;

      try
        if IsEmpty then
          Exit;

        First;
        Result := CarregarEmolumentoItem(viSQLDataSet);
        Result.EmolumentoItemID := vpEmolumentoItemID;
        Result.Emolumento := vpEmolumento;
      finally
        Close;
      end;
    end;
  finally
    FreeAndNil(viSQLDataSet);
  end;
end;

function TEmolumentoItemDAO.Get(
  const vpEmolumentoItemID: Integer): IEmolumentoItem;
{$REGION 'Variáveis'}
var
  viSQLDataSet: TSQLDataSet;
{$ENDREGION}
begin
  Result := nil;

  viSQLDataSet := TSQLDataSet.Create(nil);
  viSQLDataSet.SQLConnection := FSQLConnection;

  try
    with viSQLDataSet do
    begin
      {$REGION 'Comando SQL SELECT'}
      CommandText :=
        'SELECT ' +

        {$REGION 'Colunas'}
        'EMOLUMENTO_ID, ' +
        'EMOLUMENTO_PERIODO_ID, ' +
        'VALOR_INICIO, ' +
        'VALOR_FIM, ' +
        'VALOR_EMOLUMENTO, ' +
        'VALOR_TAXA_JUDICIARIA, ' +
        'CODIGO, ' +
        'PAGINA_EXTRA, ' +
        'VALOR_PAGINA_EXTRA, ' +
        'VALOR_OUTRA_TAXA1, ' +
        'CODIGO_SELO ' +
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_EMOLUMENTO_ITEM ' +
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +
        'EMOLUMENTO_ITEM_ID = :P_EMOLUMENTO_ITEM_ID;';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_EMOLUMENTO_ITEM_ID').AsInteger := vpEmolumentoItemID;
      {$ENDREGION}

      Open;

      try
        if IsEmpty then
          Exit;

        First;
        Result := CarregarEmolumentoItem(viSQLDataSet);
        Result.EmolumentoItemID := vpEmolumentoItemID;
      finally
        Close;
      end;
    end;
  finally
    FreeAndNil(viSQLDataSet);
  end;
end;

function TEmolumentoItemDAO.GetList(
  const vpEmolumento: IEmolumento): TEmolumentoItemList;
{$REGION 'Variáveis'}
var
  viSQLDataSet: TSQLDataSet;
  viEmolumentoItem: IEmolumentoItem;
  viEmolumentoPeriodoDAO: TEmolumentoPeriodoDAO;
{$ENDREGION}
begin
  Result := TEmolumentoItemList.Create;

  viSQLDataSet := TSQLDataSet.Create(nil);
  viSQLDataSet.SQLConnection := FSQLConnection;

  try
    with viSQLDataSet do
    begin
      {$REGION 'Comando SQL SELECT'}
      CommandText :=
        'SELECT ' +

        {$REGION 'Colunas'}
        'EMOLUMENTO_ITEM_ID, ' +
        'EMOLUMENTO_PERIODO_ID, ' +
        'VALOR_INICIO, ' +
        'VALOR_FIM, ' +
        'VALOR_EMOLUMENTO, ' +
        'VALOR_TAXA_JUDICIARIA, ' +
        'CODIGO, ' +
        'PAGINA_EXTRA, ' +
        'VALOR_PAGINA_EXTRA, ' +
        'VALOR_OUTRA_TAXA1, ' +
        'CODIGO_SELO ' +
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_EMOLUMENTO_ITEM ' +
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +
        'EMOLUMENTO_ID = :P_EMOLUMENTO_ID';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_EMOLUMENTO_ID').AsInteger := vpEmolumento.EmolumentoID;
      {$ENDREGION}

      Open;

      try
        if IsEmpty then
          Exit;

        First;
        viEmolumentoPeriodoDAO := TEmolumentoPeriodoDAO.Create(FSQLConnection);

        try
          while Eof.&Not do
            try
              viEmolumentoItem := CarregarEmolumentoItem(viSQLDataSet);
              viEmolumentoItem.Emolumento := vpEmolumento;
              Result.Add(viEmolumentoItem);
            finally
              Next;
            end;
        finally
          FreeAndNil(viEmolumentoPeriodoDAO);
        end;
      finally
        Close;
      end;
    end;
  finally
    FreeAndNil(viSQLDataSet);
  end;
end;

function TEmolumentoItemDAO.GetList: TEmolumentoItemList;
{$REGION 'Variáveis'}
var
  viSQLDataSet: TSQLDataSet;
  viEmolumentoItem: IEmolumentoItem;
{$ENDREGION}
begin
  Result := TEmolumentoItemList.Create;

  viSQLDataSet := TSQLDataSet.Create(nil);
  viSQLDataSet.SQLConnection := FSQLConnection;

  try
    with viSQLDataSet do
    begin
      {$REGION 'Comando SQL SELECT'}
      CommandText :=
        'SELECT ' +

        {$REGION 'Colunas'}
        'EMOLUMENTO_ITEM_ID, ' +
        'VALOR_INICIO, ' +
        'VALOR_FIM, ' +
        'VALOR_EMOLUMENTO, ' +
        'VALOR_TAXA_JUDICIARIA, ' +
        'CODIGO, ' +
        'VALOR_OUTRA_TAXA1 ' +
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_EMOLUMENTO_ITEM;';
        {$ENDREGION}

      {$ENDREGION}

      Open;

      try
        First;

        while not Eof do
          try
            viEmolumentoItem := CarregarEmolumentoItem(viSQLDataSet);
            Result.Add(viEmolumentoItem);
          finally
            Next;
          end;
      finally
        Close;
      end;
    end;
  finally
    FreeAndNil(viSQLDataSet);
  end;
end;

procedure TEmolumentoItemDAO.Inserir(
  const vpValue: IEmolumentoItem);
{$REGION 'Variáveis'}
var
  viSQLDataSet: TSQLDataSet;
{$ENDREGION}
begin
  viSQLDataSet := TSQLDataSet.Create(nil);
  viSQLDataSet.SQLConnection := FSQLConnection;

  try
    with viSQLDataSet do
    begin
      {$REGION 'Comando SQL INSERT'}
      CommandText :=
        'INSERT ' +

        {$REGION 'Cláusula INTO'}
        'INTO ' +
        'G_EMOLUMENTO_ITEM ' +
        {$ENDREGION}

        {$REGION 'Colunas'}
        '(' +
        'EMOLUMENTO_ITEM_ID, ' +
        'EMOLUMENTO_ID, ' +
        'EMOLUMENTO_PERIODO_ID, ' +
        'VALOR_INICIO, ' +
        'VALOR_FIM, ' +
        'VALOR_EMOLUMENTO, ' +
        'VALOR_TAXA_JUDICIARIA, ' +
        'CODIGO, ' +
        'VALOR_OUTRA_TAXA1' +
        ') ' +
        {$ENDREGION}

        {$REGION 'Cláusula VALUES e Parâmetros'}
        'VALUES ' +
        '(' +
        ':P_EMOLUMENTO_ITEM_ID, ' +
        ':P_EMOLUMENTO_ID, ' +
        ':P_EMOLUMENTO_PERIODO_ID, ' +
        ':P_VALOR_INICIO, ' +
        ':P_VALOR_FIM, ' +
        ':P_VALOR_EMOLUMENTO, ' +
        ':P_VALOR_TAXA_JUDICIARIA, ' +
        ':P_CODIGO, ' +
        ':P_VALOR_OUTRA_TAXA1' +
        ');';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_EMOLUMENTO_ITEM_ID').AsInteger := vpValue.EmolumentoItemID;

      with ParamByName('P_EMOLUMENTO_ID') do
        if Assigned(vpValue.Emolumento) and
          (vpValue.Emolumento.EmolumentoID > 0) then
          AsInteger := vpValue.Emolumento.EmolumentoID
        else
        begin
          DataType := ftInteger;
          Clear;
          Bound := True;
        end;

      with ParamByName('P_EMOLUMENTO_PERIODO_ID') do
        if Assigned(vpValue.EmolumentoPeriodo) and
          (vpValue.EmolumentoPeriodo.EmolumentoPeriodoID > 0) then
          AsInteger := vpValue.EmolumentoPeriodo.EmolumentoPeriodoID
        else
        begin
          DataType := ftInteger;
          Clear;
          Bound := True;
        end;

      ParamByName('P_VALOR_INICIO').AsCurrency := vpValue.ValorInicio;
      ParamByName('P_VALOR_FIM').AsCurrency := vpValue.ValorFim;

      ParamByName('P_VALOR_EMOLUMENTO').AsCurrency := vpValue.ValorEmolumento;

      ParamByName('P_VALOR_TAXA_JUDICIARIA').AsCurrency := vpValue.
        ValorTaxaJudiciaria;

      with ParamByName('P_CODIGO') do
        if vpValue.Codigo > 0 then
          AsInteger := vpValue.Codigo
        else
        begin
          DataType := ftInteger;
          Clear;
          Bound := True;
        end;

      ParamByName('P_VALOR_OUTRA_TAXA1').AsCurrency := vpValue.ValorOutraTaxa1;
      {$ENDREGION}

      ExecSQL;
    end;
  finally
    viSQLDataSet.Free;
  end;
end;

end.
