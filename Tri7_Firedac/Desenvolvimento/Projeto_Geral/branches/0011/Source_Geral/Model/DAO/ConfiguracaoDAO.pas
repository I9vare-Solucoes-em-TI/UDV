unit ConfiguracaoDAO;

interface

uses
  I9Query,
  I9Connection,
  Data.SqlExpr,
  ConfiguracaoGrupo,
  Configuracoes;

type
  TConfiguracaoDAO = class
  private
    FConnection: TI9Connection;
  public
    constructor Create(
      const vpConnection: TI9Connection); reintroduce;

    function Get(
      const vpConfiguracaoGrupo: TConfiguracaoGrupo;
      const vpSecao: string): TConfiguracoes;
  end;

implementation

uses
  Configuracao;

{ TConfiguracaoDAO }

constructor TConfiguracaoDAO.Create(
  const vpConnection: TI9Connection);
begin
  inherited Create;
  FConnection := vpConnection;
end;

function TConfiguracaoDAO.Get(
  const vpConfiguracaoGrupo: TConfiguracaoGrupo;
  const vpSecao: string): TConfiguracoes;
{$REGION 'Variáveis'}
var
  viSQLDataSet: TI9Query;
{$ENDREGION}
begin
  Result := TConfiguracoes.Create;

  viSQLDataSet := TI9Query.Create(nil);
  viSQLDataSet.Connection := FConnection;

  try
    with viSQLDataSet do
    begin
      {$REGION 'Comando SQL SELECT'}
      SQL.Text :=
        'SELECT ' +

        {$REGION 'Colunas'}
        'CONFIG_ID, ' +
        'NOME, ' +
        'VALOR, ' +
        'DESCRICAO ' +
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_CONFIG ' +
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +
        'CONFIG_GRUPO_ID = :P_CONFIG_GRUPO_ID AND ' +
        'SECAO = :P_SECAO;';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_CONFIG_GRUPO_ID').AsInteger := vpConfiguracaoGrupo.
        ConfiguracaoGrupoID;

      ParamByName('P_SECAO').AsString := vpSecao;
      {$ENDREGION}

      Open;

      try
        First;

        while not Eof do
          try
            Result.Add(TConfiguracao.Create(
              FieldByName('CONFIG_ID').AsInteger,
              vpConfiguracaoGrupo,
              vpSecao,
              FieldByName('NOME').AsString,
              FieldByName('VALOR').AsString,
              FieldByName('DESCRICAO').AsString));
          finally
            Next;
          end;
      finally
        Close;
      end;
    end;
  finally
    viSQLDataSet.Free;
  end;
end;

end.
