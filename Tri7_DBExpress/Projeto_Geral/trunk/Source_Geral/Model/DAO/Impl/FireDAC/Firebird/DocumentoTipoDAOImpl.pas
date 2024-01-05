unit DocumentoTipoDAOImpl;

interface

uses
  DocumentoTipoDAO,
  FireDAC.Comp.Client,
  Data.DB,
  DocumentoTipo,
  DocumentoTipoList;

type
  TDocumentoTipoDAO = class(TInterfacedObject, IDocumentoTipoDAO)
  private
    FFDConnection: TFDConnection;
  public
    constructor Create(
      const vpFDConnection: TFDConnection); reintroduce;

    function Get(
      const vpValue: TDataSet): IDocumentoTipo;

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
  BooleanHelper;

{ TDocumentoTipoDAO }

constructor TDocumentoTipoDAO.Create(
  const vpFDConnection: TFDConnection);
begin
  inherited Create;
  FFDConnection := FFDConnection;
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

end.
