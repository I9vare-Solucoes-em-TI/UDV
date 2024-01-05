unit ConfiguracaoRelatorioDAO;

interface

uses
  I9Query,
  I9Connection,
  Data.SqlExpr,
  GrupoRelatorios,
  ConfiguracoesRelatorio,
  ConfigRelatorios;

type
  TConfiguracaoRelatorioDAO = class
  private
    FConnection: TI9Connection;
  public
    constructor Create(
      const vpConnection: TI9Connection); reintroduce;

    function Get(
      const vpGrupoRelatorios: TGrupoRelatorios;
      const vpSituacao: Boolean): TConfiguracoesRelatorio; overload;

    function Get(
      const vpConfiguracaoRelatorioID: Integer): TConfiguracaoRelatorio;
      overload;
  end;

implementation

uses
  System.StrUtils,
  Data.DB,
  System.SysUtils;

{ TConfiguracaoRelatorioDAO }

constructor TConfiguracaoRelatorioDAO.Create(
  const vpConnection: TI9Connection);
begin
  FConnection := vpConnection;
end;

function TConfiguracaoRelatorioDAO.Get(
  const vpGrupoRelatorios: TGrupoRelatorios;
  const vpSituacao: Boolean): TConfiguracoesRelatorio;
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
        'CONFIG_RELATORIO_ID, ' +
        'DESCRICAO ' +
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_CONFIG_RELATORIO ' +
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +
        'GRUPO_RELATORIO_ID = :P_GRUPO_RELATORIO_ID AND ' +
        'SITUACAO = :P_SITUACAO;';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_GRUPO_RELATORIO_ID').AsInteger := vpGrupoRelatorios.
        GrupoRelatorioID;

      ParamByName('P_SITUACAO').AsString := IfThen(vpSituacao, 'A', 'I');
      {$ENDREGION}

      Open;

      try
        if IsEmpty then
          Exit;

        First;
        Result := TConfiguracoesRelatorio.Create;

        while not Eof do
          try
            Result.Add(TConfiguracaoRelatorio.Create(
              FieldByName('CONFIG_RELATORIO_ID').AsInteger,
              FieldByName('DESCRICAO').AsString,
              vpGrupoRelatorios,
              vpSituacao));
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

function TConfiguracaoRelatorioDAO.Get(
  const vpConfiguracaoRelatorioID: Integer): TConfiguracaoRelatorio;
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
        'SITUACAO ' +
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_CONFIG_RELATORIO ' +
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +
        'CONFIG_RELATORIO_ID = :P_CONFIG_RELATORIO_ID;';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_CONFIG_RELATORIO_ID').AsInteger :=
        vpConfiguracaoRelatorioID;
      {$ENDREGION}

      Open;

      try
        if IsEmpty then
          Exit;

        First;

        Result := TConfiguracaoRelatorio.Create(vpConfiguracaoRelatorioID,
          FieldByName('DESCRICAO').AsString,
          FieldByName('SITUACAO').AsString.Equals('A'));
      finally
        Close;
      end;
    end;
  finally
    viSQLDataSet.Free;
  end;
end;

end.
