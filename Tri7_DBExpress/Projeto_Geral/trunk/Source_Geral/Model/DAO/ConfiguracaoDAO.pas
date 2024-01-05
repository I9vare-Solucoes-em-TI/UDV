unit ConfiguracaoDAO;

interface

uses
  Data.SqlExpr,
  ConfiguracaoGrupo,
  Configuracoes;

type
  TConfiguracaoDAO = class
  private
    FSQLConnection: TSQLConnection;
  public
    constructor Create(
      const vpSQLConnection: TSQLConnection); reintroduce;

    function Get(
      const vpConfiguracaoGrupo: TConfiguracaoGrupo;
      const vpSecao: string): TConfiguracoes;
  end;

implementation

uses
  Configuracao;

{ TConfiguracaoDAO }

constructor TConfiguracaoDAO.Create(
  const vpSQLConnection: TSQLConnection);
begin
  inherited Create;
  FSQLConnection := vpSQLConnection;
end;

function TConfiguracaoDAO.Get(
  const vpConfiguracaoGrupo: TConfiguracaoGrupo;
  const vpSecao: string): TConfiguracoes;
{$REGION 'Vari�veis'}
var
  viSQLDataSet: TSQLDataSet;
{$ENDREGION}
begin
  Result := TConfiguracoes.Create;

  viSQLDataSet := TSQLDataSet.Create(nil);
  viSQLDataSet.SQLConnection := FSQLConnection;

  try
    with viSQLDataSet do
    begin
      {$REGION 'Comando SQL SELECT'}
      CommandText :=
        'SELECT ' +

        {$REGION 'Colunas'}
        'CONFIG_ID, ' +
        'NOME, ' +
        'VALOR, ' +
        'DESCRICAO ' +
        {$ENDREGION}

        {$REGION 'Cl�usula FROM'}
        'FROM ' +
        'G_CONFIG ' +
        {$ENDREGION}

        {$REGION 'Cl�usula WHERE e Par�metros'}
        'WHERE ' +
        'CONFIG_GRUPO_ID = :P_CONFIG_GRUPO_ID AND ' +
        'SECAO = :P_SECAO;';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos par�metros'}
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
