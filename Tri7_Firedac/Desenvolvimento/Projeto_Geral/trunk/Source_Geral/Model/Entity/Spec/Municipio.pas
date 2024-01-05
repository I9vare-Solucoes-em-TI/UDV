unit Municipio;

interface

type
  IMunicipio = interface
    ['{252C559F-857F-4084-A116-B053CF27C311}']

    function GetMunicipioID: Integer;
    function GetMunicipio: string;
    function GetCodigoIBGE: string;
    function GetSigla: string;

    function Equals(
      const vpValue: IMunicipio): Boolean;

    function NotEquals(
      const vpValue: IMunicipio): Boolean;

    procedure SetMunicipioID(
      const Value: Integer);

    procedure SetMunicipio(
      const Value: string);

    procedure SetCodigoIBGE(
      const Value: string);

    procedure SetSigla(
      const Value: string);

    property MunicipioID: Integer read GetMunicipioID write SetMunicipioID;
    property Municipio: string read GetMunicipio write SetMunicipio;
    property CodigoIBGE: string read GetCodigoIBGE write SetCodigoIBGE;
    property Sigla: string read GetSigla write SetSigla;
  end;

implementation

end.
