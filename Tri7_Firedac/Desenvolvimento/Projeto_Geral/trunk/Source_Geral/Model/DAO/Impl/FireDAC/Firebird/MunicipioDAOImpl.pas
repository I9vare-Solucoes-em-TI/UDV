unit MunicipioDAOImpl;

interface

uses
  I9Connection,
  MunicipioDAO,
  FireDAC.Comp.Client,
  Data.DB,
  Municipio,
  MunicipioList;

type
  TMunicipioDAO = class(TInterfacedObject, IMunicipioDAO)
  private
    FFDConnection: TI9Connection;
  public
    constructor Create(
      const vpFDConnection: TI9Connection); reintroduce;

    function Get(
      const vpValue: TDataSet): IMunicipio;

    function GetByID(
      const vpValue: Variant): IMunicipio; virtual; abstract;

    function GetList: TMunicipioList; virtual; abstract;

    procedure Inserir(
      const vpValue: IMunicipio); virtual; abstract;

    procedure Alterar(
      const vpValue: IMunicipio); virtual; abstract;

    procedure Excluir(
      const vpValue: IMunicipio); virtual; abstract;
  end;

implementation

uses
  MunicipioImpl;

{ TMunicipioDAO }

constructor TMunicipioDAO.Create(
  const vpFDConnection: TI9Connection);
begin
  inherited Create;
  FFDConnection := vpFDConnection;
end;

function TMunicipioDAO.Get(
  const vpValue: TDataSet): IMunicipio;
{$REGION 'Variáveis'}
var
  viField: TField;
{$ENDREGION}
begin
  Result := TMunicipio.Create;
  with vpValue, Result do
  begin
    viField := FindField('G_M_MUNICIPIO_ID');
    if Assigned(viField) then
      MunicipioID := viField.AsInteger;

    viField := FindField('G_M_MUNICIPIO');
    if Assigned(viField) then
      Municipio := viField.AsString;

    viField := FindField('G_M_CODIGO_IBGE');
    if Assigned(viField) then
      CodigoIBGE := viField.AsString;

    viField := FindField('G_M_SIGLA');
    if Assigned(viField) then
      Sigla := viField.AsString;
  end;
end;

end.
