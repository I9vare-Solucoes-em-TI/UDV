unit GenExceptionDAO;

interface

uses
  I9Query,
  I9Connection,
  Data.SqlExpr,
  GenException;

type
  TGenExceptionDAO = class
  private
    FConnection: TI9Connection;

    procedure PreencherParametroGenerator(
      const vpI9Query: TI9Query;
      const vpGenerator: string);
  public
    constructor Create(
      const vpConnection: TI9Connection); reintroduce;

    function Get(
      const vpGenerator: string): TGenException;

    procedure Excluir(
      const vpGenException: TGenException);

    procedure Salvar(
      const vpGenException: TGenException);
  end;

implementation

uses
  Data.DB;

{ TGenExceptionDAO }

constructor TGenExceptionDAO.Create(
  const vpConnection: TI9Connection);
begin
  inherited Create;
  FConnection := vpConnection;
end;

procedure TGenExceptionDAO.Excluir(
  const vpGenException: TGenException);
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
      {$REGION 'Comando SQL DELETE'}
      SQL.Text :=
        'DELETE ' +

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_GEN_EXCEPTION ' +
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +
        'GENERATOR = :P_GENERATOR;';
        {$ENDREGION}

      {$ENDREGION}

      PreencherParametroGenerator(viSQLDataSet, vpGenException.Generator);
      ExecSQL;
    end;
  finally
    viSQLDataSet.Free;
  end;
end;

function TGenExceptionDAO.Get(
  const vpGenerator: string): TGenException;
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
        'SEQUENCIA ' +
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_GEN_EXCEPTION ' +
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +
        'GENERATOR = :P_GENERATOR;';
        {$ENDREGION}

      {$ENDREGION}

      PreencherParametroGenerator(viSQLDataSet, vpGenerator);
      Open;

      try
        if IsEmpty then
          Exit;

        First;

        Result := TGenException.Create(
          vpGenerator,
          FieldByName('SEQUENCIA').AsInteger);
      finally
        Close;
      end;
    end;
  finally
    viSQLDataSet.Free;
  end;
end;

procedure TGenExceptionDAO.PreencherParametroGenerator(
  const vpI9Query: TI9Query;
  const vpGenerator: string);
begin
  vpI9Query.ParamByName('P_GENERATOR').AsString := vpGenerator;
end;

procedure TGenExceptionDAO.Salvar(
  const vpGenException: TGenException);
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
      {$REGION 'Comando SQL UPDATE OR INSERT'}
      SQL.Text :=
        'UPDATE OR INSERT ' +

        {$REGION 'Cláusula INTO'}
        'INTO ' +
        'G_GEN_EXCEPTION ' +
        {$ENDREGION}

        {$REGION 'Colunas'}
        '(' +
        'GENERATOR, ' +
        'SEQUENCIA' +
        ') ' +
        {$ENDREGION}

        {$REGION 'Cláusula VALUES e Parâmetros'}
        'VALUES ' +
        '(' +
        ':P_GENERATOR, ' +
        ':P_SEQUENCIA ' +
        ') ' +
        {$ENDREGION}

        {$REGION 'Cláusula MATCHING'}
        'MATCHING ' +
        '(' +
        'GENERATOR' +
        ');';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos parâmetros'}
      PreencherParametroGenerator(viSQLDataSet, vpGenException.Generator);
      ParamByName('P_SEQUENCIA').AsInteger := vpGenException.Sequencia;
      {$ENDREGION}

      ExecSQL;
    end;
  finally
    viSQLDataSet.Free;
  end;
end;

end.
