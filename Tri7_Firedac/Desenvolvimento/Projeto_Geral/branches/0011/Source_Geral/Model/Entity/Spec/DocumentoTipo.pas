unit DocumentoTipo;

interface

type
  IDocumentoTipo = interface
    ['{F93C134D-E512-4878-B85B-D9B0AC061A3F}']

    function GetDocumentoTipoID: Integer;
    function GetDescricao: string;
    function GetTexto: string;
    function GetSituacao: Boolean;
    function GetOrgaoPadrao: string;
    function GetDescricaoSimplificada: string;

    function Equals(
      const vpValue: IDocumentoTipo): Boolean;

    function NotEquals(
      const vpValue: IDocumentoTipo): Boolean;

    procedure SetDocumentoTipoID(
      const Value: Integer);

    procedure SetDescricao(
      const Value: string);

    procedure SetTexto(
      const Value: string);

    procedure SetSituacao(
      const Value: Boolean);

    procedure SetOrgaoPadrao(
      const Value: string);

    procedure SetDescricaoSimplificada(
      const Value: string);

    property DocumentoTipoID: Integer read GetDocumentoTipoID
      write SetDocumentoTipoID;

    property Descricao: string read GetDescricao write SetDescricao;
    property Texto: string read GetTexto write SetTexto;
    property Situacao: Boolean read GetSituacao write SetSituacao;
    property OrgaoPadrao: string read GetOrgaoPadrao write SetOrgaoPadrao;

    property DescricaoSimplificada: string read GetDescricaoSimplificada
      write SetDescricaoSimplificada;
  end;

implementation

end.
