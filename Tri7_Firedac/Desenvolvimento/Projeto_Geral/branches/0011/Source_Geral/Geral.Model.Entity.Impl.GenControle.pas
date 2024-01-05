unit Geral.Model.Entity.Impl.GenControle;

interface

uses
  Geral.Model.Entity.Spec.GenControle;

type
  TGenControle = class(TInterfacedObject, IGenControle)
  private
    FNomeGenerator: string;
    FSequencia: Integer;
    FStatus: string;
    FDataControle: TDateTime;

    constructor Create(
      const vpNomeGenerator: string;
      const vpSequencia: Integer;
      const vpStatus: string;
      const vpDataControle: TDateTime); reintroduce;
  public
    function NomeGenerator: string;
    function Sequencia: Integer;
    function Status: string;
    function DataControle: TDateTime;

    class function New(
      const vpNomeGenerator: string;
      const vpSequencia: Integer;
      const vpStatus: string;
      const vpDataControle: TDateTime): IGenControle;
  end;

implementation

{ TGenControle }

constructor TGenControle.Create(
  const vpNomeGenerator: string;
  const vpSequencia: Integer;
  const vpStatus: string;
  const vpDataControle: TDateTime);
begin
  inherited Create;
  FNomeGenerator := vpNomeGenerator;
  FSequencia := vpSequencia;
  FStatus := vpStatus;
  FDataControle := vpDataControle;
end;

function TGenControle.DataControle: TDateTime;
begin
  Result := FDataControle;
end;

class function TGenControle.New(
  const vpNomeGenerator: string;
  const vpSequencia: Integer;
  const vpStatus: string;
  const vpDataControle: TDateTime): IGenControle;
begin
  Result := Create(
    vpNomeGenerator,
    vpSequencia,
    vpStatus,
    vpDataControle);
end;

function TGenControle.NomeGenerator: string;
begin
  Result := FNomeGenerator;
end;

function TGenControle.Sequencia: Integer;
begin
  Result := FSequencia;
end;

function TGenControle.Status: string;
begin
  Result := FStatus;
end;

end.
