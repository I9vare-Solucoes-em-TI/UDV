unit IntervaloDatas;

interface

type
  IIntervaloDatas = interface
    ['{B34B8F69-E7D1-4477-89B3-BCF445A832F6}']

    function GetDataInicial: TDateTime;
    function GetDataFinal: TDateTime;

    function GetTemDataInicial: Boolean;
    function GetNaoTemDataInicial: Boolean;
    function GetTemDataFinal: Boolean;
    function GetNaoTemDataFinal: Boolean;

    procedure SetDataInicial(
      const Value: TDateTime);

    procedure SetDataFinal(
      const Value: TDateTime);

    procedure Validar;

    property DataInicial: TDateTime read GetDataInicial write SetDataInicial;
    property DataFinal: TDateTime read GetDataFinal write SetDataFinal;

    property TemDataInicial: Boolean read GetTemDataInicial;
    property NaoTemDataInicial: Boolean read GetNaoTemDataInicial;
    property TemDataFinal: Boolean read GetTemDataFinal;
    property NaoTemDataFinal: Boolean read GetNaoTemDataFinal;
  end;

implementation

end.
