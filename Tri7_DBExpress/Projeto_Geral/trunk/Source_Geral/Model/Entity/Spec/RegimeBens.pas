unit RegimeBens;

interface

type
  IRegimeBens = interface
    ['{A68AA23B-B63F-448D-85D6-27ED6EB3CD37}']

    function GetRegimeBensID: Integer;
    function GetDescricao: string;
    function GetSituacao: Boolean;

    function Equals(
      const vpValue: IRegimeBens): Boolean;

    function NotEquals(
      const vpValue: IRegimeBens): Boolean;

    procedure SetRegimeBensID(
      const Value: Integer);

    procedure SetDescricao(
      const Value: string);

    procedure SetSituacao(
      const Value: Boolean);

    property RegimeBensID: Integer read GetRegimeBensID write SetRegimeBensID;
    property Descricao: string read GetDescricao write SetDescricao;
    property Situacao: Boolean read GetSituacao write SetSituacao;
  end;

implementation

end.
