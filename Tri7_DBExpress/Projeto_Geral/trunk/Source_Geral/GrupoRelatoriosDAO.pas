unit GrupoRelatoriosDAO;

interface

uses
  I9Query,
  I9Connection,
  GrupoRelatorios,
  Data.SqlExpr;

type
  TGrupoRelatoriosDAO = class
  private
    FConnection: TI9Connection;
  public
    constructor Create(
      const vpConnection: TI9Connection); reintroduce;

    function Get(
      const vpDescricao: string;
      const vpSistemaID: Integer): TGrupoRelatorios;
  end;

implementation

uses
  Data.DB;

{ TGrupoRelatoriosDAO }

constructor TGrupoRelatoriosDAO.Create(
  const vpConnection: TI9Connection);
begin
  FConnection := vpConnection;
end;

function TGrupoRelatoriosDAO.Get(
  const vpDescricao: string;
  const vpSistemaID: Integer): TGrupoRelatorios;
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
