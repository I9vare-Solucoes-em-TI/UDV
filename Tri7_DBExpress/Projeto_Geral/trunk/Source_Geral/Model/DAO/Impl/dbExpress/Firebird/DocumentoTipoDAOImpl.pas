unit DocumentoTipoDAOImpl;

interface

uses
  I9Connection,
  DocumentoTipoDAO,
  Data.SqlExpr,
  Data.DB,
  DocumentoTipo,
  DocumentoTipoList;

type
  TDocumentoTipoDAO = class(TInterfacedObject, IDocumentoTipoDAO)
  private
    FConnection: TI9Connection;
  public
    constructor Create(
      const vpConnection: TI9Connection); reintroduce;

    function Get(
      const vpValue: TDataSet): IDocumentoTipo; overload;

    function Get(
      const vpValue: TDataSet;
      const vpPrefix: string): IDocumentoTipo; overload;

    function GetByID(
      const vpValue: Variant): IDocumentoTipo; virtual; abstract;

    function GetList: TDocumentoTipoList; virtual; abstract;

    procedure Inserir(
      const vpValue: IDocumentoTipo); virtual; abstract;

    procedure Alterar(
      const vpValue: IDocumentoTipo); virtual; abstract;

    procedure Excluir(
      const vpValue: IDocumentoTipo); virtual; abstract;
  end;

implementation

uses
  DocumentoTipoImpl,
  System.SysUtils,
  BooleanHelper;

{ TDocumentoTipoDAO }

constructor TDocumentoTipoDAO.Create(
  const vpConnection: TI9Connection);
begin
  inherited Create;
  FConnection := FConnection;
end;

function TDocumentoTipoDAO.Get(
  const vpValue: TDataSet): IDocumentoTipo;
{$REGION 'Variáveis'}
var
  viField: TField;
{$ENDREGION}
begin
  Result := TDocumentoTipo.Create;
  with vpValue, Result do
  begin
    viField := FindField('G_DT_TB_DOCUMENTOTIPO_ID');
    if Assigned(viField) then
      DocumentoTipoID := viField.AsInteger;

    viField := FindField('G_DT_DESCRICAO');
    if Assigned(viField) then
      Descricao := viField.AsString;

    viField := FindField('G_DT_TEXTO');
    if Assigned(viField) then
      Texto := viField.AsString;

    viField := FindField('G_DT_SITUACAO');
    if Assigned(viField) then
      Situacao := Boolean.FromStringAtivoInativo(viField.AsString);

    viField := FindField('G_DT_ORGAO_PADRAO');
    if Assigned(viField) then
      OrgaoPadrao := viField.AsString;

    viField := FindField('G_DT_DESCRICAO_SIMPLIFICADA');
    if Assigned(viField) then
      DescricaoSimplificada := viField.AsString;
  end;
end;

function TDocumentoTipoDAO.Get(
  const vpValue: TDataSet;
  const vpPrefix: string): IDocumentoTipo;
{$REGION 'Variáveis'}
var
  viField: TField;
{$ENDREGION}
begin
  Result := TDocumentoTipo.Create;
  with vpValue, Result do
  begin
    viField := FindField(string.Format(
      'G_DT%s_TB_DOCUMENTOTIPO_ID', [vpPrefix]));
    if Assigned(viField) then
      DocumentoTipoID := viField.AsInteger;

    viField := FindField(string.Format('G_DT%s_DESCRICAO', [vpPrefix]));
    if Assigned(viField) then
      Descricao := viField.AsString;

    viField := FindField(string.Format('G_DT%s_TEXTO', [vpPrefix]));
    if Assigned(viField) then
      Texto := viField.AsString;

    viField := FindField(string.Format('G_DT%s_SITUACAO', [vpPrefix]));
    if Assigned(viField) then
      Situacao := Boolean.FromStringAtivoInativo(viField.AsString);

    viField := FindField(string.Format('G_DT%s_ORGAO_PADRAO', [vpPrefix]));
    if Assigned(viField) then
      OrgaoPadrao := viField.AsString;

    viField := FindField(string.Format(
      'G_DT%s_DESCRICAO_SIMPLIFICADA',[vpPrefix]));
    if Assigned(viField) then
      DescricaoSimplificada := viField.AsString;
  end;
end;

end.
