unit Profissao;

interface

type
  IProfissao = interface
    ['{54FAEDF6-9DDF-46BD-950A-04E43AE1690A}']

    function GetProfissaoID: Integer;
    function GetDescricao: string;
    function GetSituacao: Boolean;
    function GetCodigoCBO: string;

    function Equals(
      const vpValue: IProfissao): Boolean;

    function NotEquals(
      const vpValue: IProfissao): Boolean;

    procedure SetProfissaoID(
      const Value: Integer);

    procedure SetDescricao(
      const Value: string);

    procedure SetSituacao(
      const Value: Boolean);

    procedure SetCodigoCBO(
      const Value: string);

    property ProfissaoID: Integer read GetProfissaoID write SetProfissaoID;
    property Descricao: string read GetDescricao write SetDescricao;
    property Situacao: Boolean read GetSituacao write SetSituacao;
    property CodigoCBO: string read GetCodigoCBO write SetCodigoCBO;
  end;

implementation

end.
