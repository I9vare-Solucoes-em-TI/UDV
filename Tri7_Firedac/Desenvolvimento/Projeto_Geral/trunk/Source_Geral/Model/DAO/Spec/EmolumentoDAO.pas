unit EmolumentoDAO;

interface

uses
  I9Query,
  I9Query,
  I9Connection,
  DAO,
  Emolumento,
  EmolumentoList,
  Sistema,
  Data.SqlExpr;

type
  IEmolumentoDAO = interface(IDAO<IEmolumento, TEmolumentoList>)
    ['{2699A838-8EC0-4931-A3FB-2A0528BD8F5A}']

    function GetListBySistemaESituacao(
      const vpSistema: ISistema;
      const vpSituacao: Boolean): TEmolumentoList;
  end;

  TEmolumentoDAO = class
  private
    FConnection: TI9Connection;
  public
    constructor Create(
      const vpConnection: TI9Connection); reintroduce;

    function GetList(
      const vpSistema: ISistema): TEmolumentoList; overload;

    function Get(
      const vpEmolumentoID: Integer): IEmolumento;

    function GetList: TEmolumentoList; overload;

    procedure Inserir(
      const vpValue: IEmolumento);
  end;

implementation

uses
  Data.DB,
  System.SysUtils,
  EmolumentoImpl,
  SistemaDAO,
  BooleanHelper;

{ TEmolumentoDAO }

constructor TEmolumentoDAO.Create(
  const vpConnection: TI9Connection);
begin
  inherited Create;
  FConnection := vpConnection;
end;

function TEmolumentoDAO.GetList(
  const vpSistema: ISistema): TEmolumentoList;
{$REGION 'Variáveis'}
var
  viSQLDataSet: TI9Query;
  viEmolumento: IEmolumento;
{$ENDREGION}
begin
  Result := nil;

  viSQLDataSet := TI9Query.Create(nil);
  viSQLDataSet.Connection := FConnection;

  try
    with viSQLDataSet do
    begin
      {$REGION 'Comando SQL SELECT'}
      SQL.Text :=
        'SELECT ' +

        {$REGION 'Colunas'}
        'EMOLUMENTO_ID, ' +
        'DESCRICAO ' +
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_EMOLUMENTO ' +
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +
        'SISTEMA_ID = :P_SISTEMA_ID;';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_SISTEMA_ID').AsInteger := vpSistema.SistemaID;
      {$ENDREGION}

      Open;

      try
        if IsEmpty then
          Exit;

        First;
        Result := TEmolumentoList.Create;

        while not Eof do
          try
            viEmolumento := TEmolumento.Create;

            with viEmolumento do
            begin
              EmolumentoID := FieldByName('EMOLUMENTO_ID').AsInteger;
              Descricao := FieldByName('DESCRICAO').AsString;
              Sistema := vpSistema;
            end;

            Result.Add(viEmolumento);
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

function TEmolumentoDAO.Get(
  const vpEmolumentoID: Integer): IEmolumento;
{$REGION 'Variáveis'}
var
  viSQLDataSet: TI9Query;
{$ENDREGION}
begin
  Result := nil;

  viSQLDataSet := TI9Query.Create(nil);
  viSQLDataSet.Connection := FConnection;

  try
    with viSQLDataSet do
    begin
      {$REGION 'Comando SQL SELECT'}
      SQL.Text :=
        'SELECT ' +

        {$REGION 'Colunas'}
        'DESCRICAO, ' +
        'SISTEMA_ID ' +
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_EMOLUMENTO ' +
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +
        'EMOLUMENTO_ID = :P_EMOLUMENTO_ID;';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_EMOLUMENTO_ID').AsInteger := vpEmolumentoID;
      {$ENDREGION}

      Open;

      try
        if IsEmpty then
          Exit;

        First;
        Result := TEmolumento.Create;

        with Result do
        begin
          EmolumentoID := vpEmolumentoID;
          Descricao := FieldByName('DESCRICAO').AsString;

          if FieldByName('SISTEMA_ID').IsNull.&Not then
            with TSistemaDAO.Create(FConnection) do
              try
                Sistema := Get(FieldByName('SISTEMA_ID').AsInteger);
              finally
                Free;
              end;
        end;
      finally
        Close;
      end;
    end;
  finally
    FreeAndNil(viSQLDataSet);
  end;
end;

function TEmolumentoDAO.GetList: TEmolumentoList;
{$REGION 'Variáveis'}
var
  viSQLDataSet: TI9Query;
  viSistemaDAO: TSistemaDAO;
  viEmolumento: IEmolumento;
{$ENDREGION}
begin
  Result := TEmolumentoList.Create;

  viSQLDataSet := TI9Query.Create(nil);
  viSQLDataSet.Connection := FConnection;

  try
    with viSQLDataSet do
    begin
      {$REGION 'Comando SQL SELECT'}
      SQL.Text :=
        'SELECT ' +

        {$REGION 'Colunas'}
        'EMOLUMENTO_ID, ' +
        'DESCRICAO, ' +
        'SISTEMA_ID ' +
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_EMOLUMENTO;';
        {$ENDREGION}

      {$ENDREGION}

      Open;

      try
        First;
        viSistemaDAO := TSistemaDAO.Create(FConnection);

        try
          while not Eof do
            try
              viEmolumento := TEmolumento.Create;
              with viEmolumento do
              begin
                EmolumentoID := FieldByName('EMOLUMENTO_ID').AsInteger;
                Descricao := FieldByName('DESCRICAO').AsString;

                if FieldByName('SISTEMA_ID').IsNull.&Not then
                  Sistema := viSistemaDAO.Get(
                    FieldByName('SISTEMA_ID').AsInteger);
              end;

              Result.Add(viEmolumento);
            finally
              Next;
            end;
        finally
          FreeAndNil(viSistemaDAO);
        end;
      finally
        Close;
      end;
    end;
  finally
    FreeAndNil(viSQLDataSet);
  end;
end;

procedure TEmolumentoDAO.Inserir(
  const vpValue: IEmolumento);
{$REGION 'Variáveis'}
var
  viSQLDataSet: TI9Query;
{$ENDREGION}
begin
  viSQLDataSet := TI9Query.Create(nil);
  viSQLDataSet.Connection := FConnection;

  try
    with viSQLDataSet do
    begin
      {$REGION 'Comando SQL INSERT'}
      SQL.Text :=
        'INSERT ' +

        {$REGION 'Cláusula INTO'}
        'INTO ' +
        'G_EMOLUMENTO ' +
        {$ENDREGION}

        {$REGION 'Colunas'}
        '(' +
        'EMOLUMENTO_ID, ' +
        'DESCRICAO, ' +
        'SISTEMA_ID' +
        ') ' +
        {$ENDREGION}

        {$REGION 'Cláusula VALUES e Parâmetros'}
        'VALUES ' +
        '(' +
        ':P_EMOLUMENTO_ID, ' +
        ':P_DESCRICAO, ' +
        ':P_SISTEMA_ID' +
        ');';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_EMOLUMENTO_ID').AsInteger := vpValue.EmolumentoID;

      with ParamByName('P_DESCRICAO') do
        if vpValue.Descricao.IsEmpty then
        begin
          DataType := ftString;
          Clear;
          Bound := True;
        end
        else
          AsString := vpValue.Descricao;

      ParamByName('P_SISTEMA_ID').AsInteger := vpValue.Sistema.SistemaID;
      {$ENDREGION}

      ExecSQL;
    end;
  finally
    FreeAndNil(viSQLDataSet);
  end;
end;

end.
