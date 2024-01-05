unit IntervaloDatasImpl;

interface

uses
  IntervaloDatas;

type
  TIntervaloDatas = class(TInterfacedObject, IIntervaloDatas)
  private
    FDataInicial: TDateTime;
    FDataFinal: TDateTime;

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
  public
    constructor Create(
      const vpDataInicial: TDateTime;
      const vpDataFinal: TDateTime); overload;

    constructor Create; overload;

    property DataInicial: TDateTime read GetDataInicial write SetDataInicial;
    property DataFinal: TDateTime read GetDataFinal write SetDataFinal;

    property TemDataInicial: Boolean read GetTemDataInicial;
    property NaoTemDataInicial: Boolean read GetNaoTemDataInicial;
    property TemDataFinal: Boolean read GetTemDataFinal;
    property NaoTemDataFinal: Boolean read GetNaoTemDataFinal;

    class function New(
      const vpDataInicial: TDateTime;
      const vpDataFinal: TDateTime): IIntervaloDatas;

    procedure Validar;
  end;

implementation

uses
  System.DateUtils,
  System.Types,
  IntervaloDatasException,
  BooleanHelper,
  System.Math;

{ TIntervaloDatas }

constructor TIntervaloDatas.Create(
  const vpDataInicial: TDateTime;
  const vpDataFinal: TDateTime);
begin
  inherited Create;
  DataInicial := vpDataInicial;
  DataFinal := vpDataFinal;
end;

constructor TIntervaloDatas.Create;
begin
  Create(
    ZeroValue,
    ZeroValue);
end;

function TIntervaloDatas.GetDataFinal: TDateTime;
begin
  Result := FDataFinal;
end;

function TIntervaloDatas.GetDataInicial: TDateTime;
begin
  Result := FDataInicial;
end;

function TIntervaloDatas.GetNaoTemDataFinal: Boolean;
begin
  Result := TemDataFinal;
  Result.Negate;
end;

function TIntervaloDatas.GetNaoTemDataInicial: Boolean;
begin
  Result := TemDataInicial;
  Result.Negate;
end;

function TIntervaloDatas.GetTemDataFinal: Boolean;
begin
  Result := CompareDateTime(DataFinal, ZeroValue) = GreaterThanValue;
end;

function TIntervaloDatas.GetTemDataInicial: Boolean;
begin
  Result := CompareDateTime(DataInicial, ZeroValue) = GreaterThanValue;
end;

class function TIntervaloDatas.New(
  const vpDataInicial: TDateTime;
  const vpDataFinal: TDateTime): IIntervaloDatas;
begin
  Result := Create(
    vpDataInicial,
    vpDataFinal);
end;

procedure TIntervaloDatas.SetDataFinal(
  const Value: TDateTime);
begin
  FDataFinal := Value;
end;

procedure TIntervaloDatas.SetDataInicial(
  const Value: TDateTime);
begin
  FDataInicial := Value;
end;

procedure TIntervaloDatas.Validar;
begin
  if CompareDateTime(DataFinal, DataInicial) = LessThanValue then
    raise EIntervaloDatasException.Create;
end;

end.
