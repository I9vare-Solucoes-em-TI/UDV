unit SeloGrupoDAOImpl;

interface

uses
  SeloGrupoDAO,
  Data.SqlExpr,
  Data.DB,
  SeloGrupo,
  SeloGrupoList;

type
  TSeloGrupoDAO = class(TInterfacedObject, ISeloGrupoDAO)
  private
    FSQLConnection: TSQLConnection;
  public
    constructor Create(
      const vpSQLConnection: TSQLConnection); reintroduce;

    function Get(
      const vpValue: TDataSet): ISeloGrupo; overload;

    function Get(
      const vpValue: TDataSet;
      const vpPrefix: string): ISeloGrupo; overload;

    function GetByID(
      const vpValue: Variant): ISeloGrupo; virtual; abstract;

    function GetList: TSeloGrupoList; virtual; abstract;

    class function GetColunas: string; static;

    procedure Inserir(
      const vpValue: ISeloGrupo); virtual; abstract;

    procedure Alterar(
      const vpValue: ISeloGrupo); virtual; abstract;

    procedure Excluir(
      const vpValue: ISeloGrupo); virtual; abstract;
  end;

implementation

uses
  SeloGrupoImpl,
  System.SysUtils,
  BooleanHelper,
  SistemaDAOImpl;

{ TSeloGrupoDAO }

constructor TSeloGrupoDAO.Create(
  const vpSQLConnection: TSQLConnection);
begin
  inherited Create;
  FSQLConnection := vpSQLConnection;
end;

function TSeloGrupoDAO.Get(
  const vpValue: TDataSet): ISeloGrupo;
{$REGION 'Variáveis'}
var
  viField: TField;
  viSistemaDAO: TSistemaDAO;
{$ENDREGION}
begin
  Result := TSeloGrupo.Create;
  with vpValue, Result do
  begin
    viField := FindField('G_SG_SELO_GRUPO_ID');
    if Assigned(viField) then
      SeloGrupoID := viField.AsInteger;

    viField := FindField('G_SG_DESCRICAO');
    if Assigned(viField) then
      Descricao := viField.AsString;

    viField := FindField('G_SG_NUMERO');
    if Assigned(viField) then
      Numero := viField.AsInteger;

    viField := FindField('G_SG_SITUACAO');
    if Assigned(viField) then
      Situacao := Boolean.FromStringAtivoInativo(viField.AsString);

    viField := FindField('G_SG_CONTROLE_AUTOMATICO');
    if Assigned(viField) then
      ControleAutomatico := Boolean.FromStringSimNao(viField.AsString);

    viField := FindField('G_SG_TIPO_CARTORIO');
    if Assigned(viField) then
      TipoCartorio := viField.AsString;

    viField := FindField('G_SG_DESCRICAO_COMPLETA');
    if Assigned(viField) then
      DescricaoCompleta := viField.AsString;

    viField := FindField('G_SG_ESTOQUE_MINIMO');
    if Assigned(viField) then
      EstoqueMinimo := viField.AsInteger;

    viField := FindField('G_SG_NOME_GRUPO');
    if Assigned(viField) then
      NomeGrupo := viField.AsString;

    viField := FindField('G_SG_ID_GRUPO_SELO');
    if Assigned(viField) then
      IDGrupoSelo := viField.AsInteger;

    viField := FindField('G_SG_PAGINA_ACRESCE');
    if Assigned(viField) then
      PaginaAcresce := Boolean.FromStringSimNao(viField.AsString);

    viField := FindField('G_S_SISTEMA_ID');
    if Assigned(viField) and
      viField.IsNull.&Not then
    begin
      viSistemaDAO := TSistemaDAO.Create(FSQLConnection);
      try
        Sistema := viSistemaDAO.Get(vpValue);
      finally
        FreeAndNil(viSistemaDAO);
      end;
    end;

    viField := FindField('G_SG_SELO_USUARIO');
    if Assigned(viField) then
      SeloUsuario := Boolean.FromStringSimNao(viField.AsString);
  end;
end;

function TSeloGrupoDAO.Get(
  const vpValue: TDataSet;
  const vpPrefix: string): ISeloGrupo;
{$REGION 'Variáveis'}
var
  viField: TField;
  viSistemaDAO: TSistemaDAO;
{$ENDREGION}
begin
  Result := TSeloGrupo.Create;
  with vpValue, Result do
  begin
    viField := FindField(string.Format('G_SG%s_SELO_GRUPO_ID', [vpPrefix]));
    if Assigned(viField) then
      SeloGrupoID := viField.AsInteger;

    viField := FindField(string.Format('G_SG%s_DESCRICAO', [vpPrefix]));
    if Assigned(viField) then
      Descricao := viField.AsString;

    viField := FindField(string.Format('G_SG%s_NUMERO', [vpPrefix]));
    if Assigned(viField) then
      Numero := viField.AsInteger;

    viField := FindField(string.Format('G_SG%s_SITUACAO', [vpPrefix]));
    if Assigned(viField) then
      Situacao := Boolean.FromStringAtivoInativo(viField.AsString);

    viField := FindField(string.Format(
      'G_SG%s_CONTROLE_AUTOMATICO', [vpPrefix]));

    if Assigned(viField) then
      ControleAutomatico := Boolean.FromStringSimNao(viField.AsString);

    viField := FindField(string.Format('G_SG%s_TIPO_CARTORIO', [vpPrefix]));
    if Assigned(viField) then
      TipoCartorio := viField.AsString;

    viField := FindField(string.Format(
      'G_SG%s_DESCRICAO_COMPLETA', [vpPrefix]));

    if Assigned(viField) then
      DescricaoCompleta := viField.AsString;

    viField := FindField(string.Format('G_SG%s_ESTOQUE_MINIMO', [vpPrefix]));
    if Assigned(viField) then
      EstoqueMinimo := viField.AsInteger;

    viField := FindField(string.Format('G_SG%s_NOME_GRUPO', [vpPrefix]));
    if Assigned(viField) then
      NomeGrupo := viField.AsString;

    viField := FindField(string.Format('G_SG%s_ID_GRUPO_SELO', [vpPrefix]));
    if Assigned(viField) then
      IDGrupoSelo := viField.AsInteger;

    viField := FindField(string.Format('G_SG%s_PAGINA_ACRESCE', [vpPrefix]));
    if Assigned(viField) then
      PaginaAcresce := Boolean.FromStringSimNao(viField.AsString);

    viField := FindField(string.Format('G_S%s_SISTEMA_ID', [vpPrefix]));
    if Assigned(viField) and
      viField.IsNull.&Not then
    begin
      viSistemaDAO := TSistemaDAO.Create(FSQLConnection);
      try
        Sistema := viSistemaDAO.Get(vpValue, vpPrefix);
      finally
        FreeAndNil(viSistemaDAO);
      end;
    end;

    viField := FindField(string.Format('G_SG%s_SELO_USUARIO', [vpPrefix]));
    if Assigned(viField) then
      SeloUsuario := Boolean.FromStringSimNao(viField.AsString);
  end;
end;

class function TSeloGrupoDAO.GetColunas: string;
begin
  Result := {$REGION 'Colunas'}
    'G_SG.SELO_GRUPO_ID G_SG_SELO_GRUPO_ID, ' +
    'G_SG.DESCRICAO G_SG_DESCRICAO, ' +
    'G_SG.NUMERO G_SG_NUMERO, ' +
    'G_SG.SITUACAO G_SG_SITUACAO, ' +
    'G_SG.CONTROLE_AUTOMATICO G_SG_CONTROLE_AUTOMATICO, ' +
    'G_SG.TIPO_CARTORIO G_SG_TIPO_CARTORIO, ' +
    'G_SG.DESCRICAO_COMPLETA G_SG_DESCRICAO_COMPLETA, ' +
    'G_SG.ESTOQUE_MINIMO G_SG_ESTOQUE_MINIMO, ' +
    'G_SG.NOME_GRUPO G_SG_NOME_GRUPO, ' +
    'G_SG.ID_GRUPO_SELO G_SG_ID_GRUPO_SELO, ' +
    'G_SG.PAGINA_ACRESCE G_SG_PAGINA_ACRESCE, ' +
    TSistemaDAO.GetColunas + ', ' +
    'G_SG.SELO_USUARIO G_SG_SELO_USUARIO';
  {$ENDREGION}
end;

end.
