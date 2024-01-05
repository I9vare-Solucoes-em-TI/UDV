unit GenExceptionDAO;

interface

uses
  Data.SqlExpr,
  GenException;

type
  TGenExceptionDAO = class
  private
    FSQLConnection: TSQLConnection;

    procedure PreencherParametroGenerator(
      const vpSQLDataSet: TSQLDataSet;
      const vpGenerator: string);
  public
    constructor Create(
      const vpSQLConnection: TSQLConnection); reintroduce;

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
  const vpSQLConnection: TSQLConnection);
begin
  inherited Create;
  FSQLConnection := vpSQLConnection;
end;

procedure TGenExceptionDAO.Excluir(
  const vpGenException: TGenException);
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
      {$REGION 'Comando SQL DELETE'}
      CommandText :=
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
  const vpSQLDataSet: TSQLDataSet;
  const vpGenerator: string);
begin
  vpSQLDataSet.ParamByName('P_GENERATOR').AsString := vpGenerator;
end;

procedure TGenExceptionDAO.Salvar(
  const vpGenException: TGenException);
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
      {$REGION 'Comando SQL UPDATE OR INSERT'}
      CommandText :=
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
