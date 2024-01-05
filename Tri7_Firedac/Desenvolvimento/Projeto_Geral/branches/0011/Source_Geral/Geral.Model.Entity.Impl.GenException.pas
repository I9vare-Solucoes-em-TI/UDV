unit Geral.Model.Entity.Impl.GenException;

interface

uses
  Geral.Model.Entity.Spec.GenException;

type
  TGenException = class(TInterfacedObject, IGenException)
  private
    FNomeGenerator: string;
    FSequencia: Integer;

    constructor Create(
      const vpNomeGenerator: string;
      const vpSequencia: Integer); reintroduce;
  public
    function NomeGenerator: string;
    function Sequencia: Integer;

    class function New(
      const vpNomeGenerator: string;
      const vpSequencia: Integer): IGenException;
  end;

implementation

{ TGenException }

constructor TGenException.Create(
  const vpNomeGenerator: string;
  const vpSequencia: Integer);
begin
  inherited Create;
  FNomeGenerator := vpNomeGenerator;
  FSequencia := vpSequencia;
end;

class function TGenException.New(
  const vpNomeGenerator: string;
  const vpSequencia: Integer): IGenException;
begin
  Result := Create(
    vpNomeGenerator,
    vpSequencia);
end;

function TGenException.NomeGenerator: string;
begin
  Result := FNomeGenerator;
end;

function TGenException.Sequencia: Integer;
begin
  Result := FSequencia;
end;

end.
