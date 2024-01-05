unit Geral.Model.Entity.Impl.IntervaloDatas;

interface

uses
  Geral.Model.Entity.Spec.IntervaloDatas;

type
  TIntervaloDatas = class(TInterfacedObject, IIntervaloDatas)
  private
    FDataInicial: TDateTime;
    FDataFinal: TDateTime;
  public
    constructor Create(
      const vpDataInicial: TDateTime;
      const vpDataFinal: TDateTime); reintroduce;

    function DataInicial: TDateTime;
    function DataFinal: TDateTime;

    class function New(
      const vpDataInicial: TDateTime;
      const vpDataFinal: TDateTime): IIntervaloDatas;
  end;

implementation

{ TIntervaloDatas }

constructor TIntervaloDatas.Create(
  const vpDataInicial: TDateTime;
  const vpDataFinal: TDateTime);
begin
  inherited Create;
  FDataInicial := vpDataInicial;
  FDataFinal := vpDataFinal;
end;

function TIntervaloDatas.DataFinal: TDateTime;
begin
  Result := FDataFinal;
end;

function TIntervaloDatas.DataInicial: TDateTime;
begin
  Result := FDataInicial;
end;

class function TIntervaloDatas.New(
  const vpDataInicial: TDateTime;
  const vpDataFinal: TDateTime): IIntervaloDatas;
begin
  Result := Create(
    vpDataInicial,
    vpDataFinal);
end;

end.
