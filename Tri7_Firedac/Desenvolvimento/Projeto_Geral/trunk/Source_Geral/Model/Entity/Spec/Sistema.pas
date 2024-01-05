unit Sistema;

interface

type
  ISistema = interface
    ['{CA569792-723F-47E3-B4D5-A9BEB9EF8AC8}']

    function GetSistemaID: Integer;
    function GetDescricao: string;
    function GetSituacao: Boolean;
    function GetVersao: string;

    function Equals(
      const vpValue: ISistema): Boolean;

    function NotEquals(
      const vpValue: ISistema): Boolean;

    procedure SetSistemaID(
      const vpValue: Integer);

    procedure SetDescricao(
      const vpValue: string);

    procedure SetSituacao(
      const vpValue: Boolean);

    procedure SetVersao(
      const vpValue: string);

    property SistemaID: Integer read GetSistemaID write SetSistemaID;
    property Descricao: string read GetDescricao write SetDescricao;
    property Situacao: Boolean read GetSituacao write SetSituacao;
    property Versao: string read GetVersao write SetVersao;
  end;

implementation

end.
