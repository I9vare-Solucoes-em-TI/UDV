unit EmolumentoPeriodo;

interface

type
  IEmolumentoPeriodo = interface
    ['{0532AE75-E9C1-4AA0-8927-FDF7D58AA485}']

    function GetEmolumentoPeriodoID: Integer;
    function GetDescricao: string;
    function GetSituacao: Boolean;
    function GetDataInicial: TDateTime;
    function GetAno: Word;

    function Equals(
      const vpValue: IEmolumentoPeriodo): Boolean;

    function NotEquals(
      const vpValue: IEmolumentoPeriodo): Boolean;

    procedure SetEmolumentoPeriodoID(
      const Value: Integer);

    procedure SetDescricao(
      const Value: string);

    procedure SetSituacao(
      const Value: Boolean);

    procedure SetDataInicial(
      const Value: TDateTime);

    procedure SetAno(
      const Value: Word);

    property EmolumentoPeriodoID: Integer read GetEmolumentoPeriodoID
      write SetEmolumentoPeriodoID;

    property Descricao: string read GetDescricao write SetDescricao;
    property Situacao: Boolean read GetSituacao write SetSituacao;
    property DataInicial: TDateTime read GetDataInicial write SetDataInicial;
    property Ano: Word read GetAno write SetAno;
  end;

implementation

end.
