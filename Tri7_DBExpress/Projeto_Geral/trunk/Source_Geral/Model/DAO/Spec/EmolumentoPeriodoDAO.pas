unit EmolumentoPeriodoDAO;

interface

uses
  I9Query,
  I9Connection,
  DAO,
  EmolumentoPeriodo,
  EmolumentoPeriodoList,
  Sistema,
  Data.SqlExpr;

type
  IEmolumentoPeriodoDAO = interface(IDAO<IEmolumentoPeriodo,
    TEmolumentoPeriodoList>)
    ['{20BADD5B-DE50-4F15-B345-288BFE09FF34}']

    function GetListDistinctByEmolumentoSistema(
      const vpValue: ISistema): TEmolumentoPeriodoList;
  end;

  TEmolumentoPeriodoDAO = class
  private
    FConnection: TI9Connection;
  public
    constructor Create(
      const vpConnection: TI9Connection); reintroduce;

    function Get(
      const vpEmolumentoPeriodoID: Integer): IEmolumentoPeriodo;

    function GetList: TEmolumentoPeriodoList;

    procedure Inserir(
      const vpValue: IEmolumentoPeriodo);
  end;

implementation

uses
  Data.DB,
  System.SysUtils,
  EmolumentoPeriodoImpl,
  BooleanHelper;

{ TEmolumentoPeriodoDAO }

constructor TEmolumentoPeriodoDAO.Create(
  const vpConnection: TI9Connection);
begin
  inherited Create;
  FConnection := vpConnection;
end;

function TEmolumentoPeriodoDAO.Get(
  const vpEmolumentoPeriodoID: Integer): IEmolumentoPeriodo;
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
        'SITUACAO, ' +
        'DATA_INICIAL, ' +
        'ANO ' +
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_EMOLUMENTO_PERIODO ' +
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +
        'EMOLUMENTO_PERIODO_ID = :P_EMOLUMENTO_PERIODO_ID;';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_EMOLUMENTO_PERIODO_ID').AsInteger := vpEmolumentoPeriodoID;
      {$ENDREGION}

      Open;

      try
        if IsEmpty then
          Exit;

        First;
        Result := TEmolumentoPeriodo.Create;

        with Result do
        begin
          EmolumentoPeriodoID := vpEmolumentoPeriodoID;
          Descricao := FieldByName('DESCRICAO').AsString;

          Situacao := Boolean.FromStringAtivoInativo(
            FieldByName('SITUACAO').AsString);

          DataInicial := FieldByName('DATA_INICIAL').AsDateTime;
          Ano := StrToIntDef(FieldByName('ANO').AsString, 0);
        end;
      finally
        Close;
      end;
    end;
  finally
    viSQLDataSet.Free;
  end;
end;

function TEmolumentoPeriodoDAO.GetList: TEmolumentoPeriodoList;
{$REGION 'Variáveis'}
var
  viSQLDataSet: TI9Query;
  viEmolumentoPeriodo: IEmolumentoPeriodo;
{$ENDREGION}
begin
  Result := TEmolumentoPeriodoList.Create;

  viSQLDataSet := TI9Query.Create(nil);
  viSQLDataSet.Connection := FConnection;

  try
    with viSQLDataSet do
    begin
      {$REGION 'Comando SQL SELECT'}
      SQL.Text :=
        'SELECT ' +

        {$REGION 'Colunas'}
        '* ' +
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_EMOLUMENTO_PERIODO;';
        {$ENDREGION}

      {$ENDREGION}

      Open;

      try
        First;

        while not Eof do
          try
            viEmolumentoPeriodo := TEmolumentoPeriodo.Create;

            with viEmolumentoPeriodo do
            begin
              EmolumentoPeriodoID := FieldByName(
                'EMOLUMENTO_PERIODO_ID').AsInteger;

              Descricao := FieldByName('DESCRICAO').AsString;

              Situacao := Boolean.FromStringAtivoInativo(
                FieldByName('SITUACAO').AsString);

              DataInicial := FieldByName('DATA_INICIAL').AsDateTime;
              Ano := StrToIntDef(FieldByName('ANO').AsString, 0);
            end;

            Result.Add(viEmolumentoPeriodo);
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

procedure TEmolumentoPeriodoDAO.Inserir(
  const vpValue: IEmolumentoPeriodo);
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
        'G_EMOLUMENTO_PERIODO ' +
        {$ENDREGION}

        {$REGION 'Cláusula VALUES e Parâmetros'}
        'VALUES ' +
        '(' +
        ':P_EMOLUMENTO_PERIODO_ID, ' +
        ':P_DESCRICAO, ' +
        ':P_SITUACAO, ' +
        ':P_DATA_INICIAL, ' +
        ':P_ANO' +
        ');';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_EMOLUMENTO_PERIODO_ID').AsInteger := vpValue.
        EmolumentoPeriodoID;

      with ParamByName('P_DESCRICAO') do
        if vpValue.Descricao.IsEmpty then
        begin
          DataType := ftString;
          Clear;
          Bound := True;
        end
        else
          AsString := vpValue.Descricao;

      ParamByName('P_SITUACAO').AsString := vpValue.Situacao.ToCharAtivoInativo;

      with ParamByName('P_DATA_INICIAL') do
        if vpValue.DataInicial > 0 then
          AsDateTime := vpValue.DataInicial
        else
        begin
          DataType := ftDateTime;
          Clear;
          Bound := True;
        end;

      with ParamByName('P_ANO') do
        if vpValue.Ano > 0 then
          AsString := vpValue.Ano.ToString
        else
        begin
          DataType := ftString;
          Clear;
          Bound := True;
        end;
      {$ENDREGION}

      ExecSQL;
    end;
  finally
    FreeAndNil(viSQLDataSet);
  end;
end;

end.
