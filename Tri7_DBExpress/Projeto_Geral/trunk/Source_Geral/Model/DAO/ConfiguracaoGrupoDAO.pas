unit ConfiguracaoGrupoDAO;

interface

uses
  Data.SqlExpr,
  ConfiguracaoGrupo;

type
  TConfiguracaoGrupoDAO = class
  private
    FSQLConnection: TSQLConnection;
  public
    constructor Create(
      const vpSQLConnection: TSQLConnection); reintroduce;

    function Get(
      const vpDescricao: string;
      const vpSistemaID: Integer): TConfiguracaoGrupo;
  end;

implementation

uses
  Data.DB;

{ TConfiguracaoGrupoDAO }

constructor TConfiguracaoGrupoDAO.Create(
  const vpSQLConnection: TSQLConnection);
begin
  inherited Create;
  FSQLConnection := vpSQLConnection;
end;

function TConfiguracaoGrupoDAO.Get(
  const vpDescricao: string;
  const vpSistemaID: Integer): TConfiguracaoGrupo;
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
        'CONFIG_GRUPO_ID ' +
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_CONFIG_GRUPO ' +
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +
        'DESCRICAO = :P_DESCRICAO AND ' +
        'SISTEMA_ID = :P_SISTEMA_ID;';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_DESCRICAO').AsString := vpDescricao;
      ParamByName('P_SISTEMA_ID').AsInteger := vpSistemaID;
      {$ENDREGION}

      Open;

      try
        if IsEmpty then
          Exit;

        First;

        Result := TConfiguracaoGrupo.Create(
          FieldByName('CONFIG_GRUPO_ID').AsInteger,
          vpDescricao,
          vpSistemaID);
      finally
        Close;
      end;
    end;
  finally
    viSQLDataSet.Free;
  end;
end;

end.
