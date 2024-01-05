unit RegimeComunhao;

interface

uses
  RegimeBens;

type
  IRegimeComunhao = interface
    ['{EB172BD3-5021-460C-BCA7-CA4D7F8140A0}']

    function GetRegimeComunhaoID: Integer;
    function GetDescricao: string;
    function GetTexto: string;
    function GetSituacao: Boolean;
    function GetRegimeBens: IRegimeBens;

    function Equals(
      const vpValue: IRegimeComunhao): Boolean;

    function NotEquals(
      const vpValue: IRegimeComunhao): Boolean;

    procedure SetRegimeComunhaoID(
      const Value: Integer);

    procedure SetDescricao(
      const Value: string);

    procedure SetTexto(
      const Value: string);

    procedure SetSituacao(
      const Value: Boolean);

    procedure SetRegimeBens(
      const Value: IRegimeBens);

    property RegimeComunhaoID: Integer read GetRegimeComunhaoID
      write SetRegimeComunhaoID;

    property Descricao: string read GetDescricao write SetDescricao;
    property Texto: string read GetTexto write SetTexto;
    property Situacao: Boolean read GetSituacao write SetSituacao;
    property RegimeBens: IRegimeBens read GetRegimeBens write SetRegimeBens;
  end;

implementation

end.
