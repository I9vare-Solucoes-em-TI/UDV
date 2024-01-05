unit MunicipioImpl;

interface

uses
  Municipio;

type
  TMunicipio = class(TInterfacedObject, IMunicipio)
  private
    FMunicipioID: Integer;
    FMunicipio: string;
    FCodigoIBGE: string;
    FSigla: string;

    function GetMunicipioID: Integer;
    function GetMunicipio: string;
    function GetCodigoIBGE: string;
    function GetSigla: string;

    procedure SetMunicipioID(
      const Value: Integer);

    procedure SetMunicipio(
      const Value: string);

    procedure SetCodigoIBGE(
      const Value: string);

    procedure SetSigla(
      const Value: string);
  public
    property MunicipioID: Integer read GetMunicipioID write SetMunicipioID;
    property Municipio: string read GetMunicipio write SetMunicipio;
    property CodigoIBGE: string read GetCodigoIBGE write SetCodigoIBGE;
    property Sigla: string read GetSigla write SetSigla;

    function Equals(
      const vpValue: IMunicipio): Boolean; reintroduce;

    function NotEquals(
      const vpValue: IMunicipio): Boolean;
  end;

implementation

uses
  System.Math,
  System.Types,
  BooleanHelper;

{ TMunicipio }

function TMunicipio.Equals(
  const vpValue: IMunicipio): Boolean;
begin
  Result := CompareValue(MunicipioID, vpValue.MunicipioID) = EqualsValue;
end;

function TMunicipio.GetCodigoIBGE: string;
begin
  Result := FCodigoIBGE;
end;

function TMunicipio.GetMunicipio: string;
begin
  Result := FMunicipio;
end;

function TMunicipio.GetMunicipioID: Integer;
begin
  Result := FMunicipioID;
end;

function TMunicipio.GetSigla: string;
begin
  Result := FSigla;
end;

function TMunicipio.NotEquals(
  const vpValue: IMunicipio): Boolean;
begin
  Result := Equals(vpValue);
  Result.Negate;
end;

procedure TMunicipio.SetCodigoIBGE(
  const Value: string);
begin
  FCodigoIBGE := Value;
end;

procedure TMunicipio.SetMunicipio(
  const Value: string);
begin
  FMunicipio := Value;
end;

procedure TMunicipio.SetMunicipioID(
  const Value: Integer);
begin
  FMunicipioID := Value;
end;

procedure TMunicipio.SetSigla(
  const Value: string);
begin
  FSigla := Value;
end;

end.
