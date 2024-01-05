unit SeloGrupoDAO;

interface

uses
  Data.SqlExpr,
  SeloGrupo;

type
  TSeloGrupoDAO = class
  private
    FSQLConnection: TSQLConnection;
  public
    constructor Create(
      const vpSQLConnection: TSQLConnection); reintroduce;

    function Get(
      const vpSeloGrupoID: Integer): ISeloGrupo;
  end;

implementation

uses
  Data.DB,
  SeloGrupoImpl,
  System.SysUtils,
  BooleanHelper,
  SistemaDAO;

{ TSeloGrupoDAO }

constructor TSeloGrupoDAO.Create(
  const vpSQLConnection: TSQLConnection);
begin
  inherited Create;
  FSQLConnection := vpSQLConnection;
end;

function TSeloGrupoDAO.Get(
  const vpSeloGrupoID: Integer): ISeloGrupo;
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
        'DESCRICAO, ' +
        'NUMERO, ' +
        'SITUACAO, ' +
        'CONTROLE_AUTOMATICO, ' +
        'SISTEMA_ID, ' +
        'TIPO_CARTORIO, ' +
        'DESCRICAO_COMPLETA, ' +
        'ESTOQUE_MINIMO, ' +
        'NOME_GRUPO, ' +
        'ID_GRUPO_SELO, ' +
        'PAGINA_ACRESCE, ' +
        'SELO_USUARIO ' +
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_SELO_GRUPO ' +
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +
        'SELO_GRUPO_ID = :P_SELO_GRUPO_ID;';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_SELO_GRUPO_ID').AsInteger := vpSeloGrupoID;
      {$ENDREGION}

      Open;

      try
        if IsEmpty then
          Exit;

        First;
        Result := TSeloGrupo.Create;

        with Result do
        begin
          SeloGrupoID := vpSeloGrupoID;
          Descricao := FieldByName('DESCRICAO').AsString;
          Numero := FieldByName('NUMERO').AsInteger;

          Situacao := Boolean.FromStringAtivoInativo(
            FieldByName('SITUACAO').AsString);

          ControleAutomatico := Boolean.FromStringSimNao(
            FieldByName('CONTROLE_AUTOMATICO').AsString);

          if FieldByName('SISTEMA_ID').IsNull.&Not then
            with TSistemaDAO.Create(FSQLConnection) do
              try
                Sistema := Get(FieldByName('SISTEMA_ID').AsInteger);
              finally
                Free;
              end;

          TipoCartorio := FieldByName('TIPO_CARTORIO').AsString;
          DescricaoCompleta := FieldByName('DESCRICAO_COMPLETA').AsString;
          EstoqueMinimo := FieldByName('ESTOQUE_MINIMO').AsInteger;
          NomeGrupo := FieldByName('NOME_GRUPO').AsString;
          IDGrupoSelo := FieldByName('ID_GRUPO_SELO').AsInteger;

          PaginaAcresce := Boolean.FromStringSimNao(
            FieldByName('PAGINA_ACRESCE').AsString);

          SeloUsuario := Boolean.FromStringSimNao(
            FieldByName('SELO_USUARIO').AsString);
        end;
      finally
        Close;
      end;
    end;
  finally
    FreeAndNil(viSQLDataSet);
  end;
end;

end.
