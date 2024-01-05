unit GrupoRelatoriosDAO;

interface

uses
  GrupoRelatorios,
  Data.SqlExpr;

type
  TGrupoRelatoriosDAO = class
  private
    FSQLConnection: TSQLConnection;
  public
    constructor Create(
      const vpSQLConnection: TSQLConnection); reintroduce;

    function Get(
      const vpDescricao: string;
      const vpSistemaID: Integer): TGrupoRelatorios;
  end;

implementation

uses
  Data.DB;

{ TGrupoRelatoriosDAO }

constructor TGrupoRelatoriosDAO.Create(
  const vpSQLConnection: TSQLConnection);
begin
  FSQLConnection := vpSQLConnection;
end;

function TGrupoRelatoriosDAO.Get(
  const vpDescricao: string;
  const vpSistemaID: Integer): TGrupoRelatorios;
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
        'GRUPO_RELATORIO_ID ' +
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_GRUPO_RELATORIO ' +
        {$ENDREGION}

        {$REGION 'Cláusula WHERE'}
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

        Result := TGrupoRelatorios.Create(
          FieldByName('GRUPO_RELATORIO_ID').AsInteger,
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
