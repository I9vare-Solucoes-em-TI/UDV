unit GenException;

interface

type
  TGenException = class
  private
    FGenerator: string;
    FSequencia: Integer;

    procedure SetGenerator(
      const Value: string);

    procedure SetSequencia(
      const Value: Integer);
  public
    constructor Create(
      const vpGenerator: string;
      const vpSequencia: Integer); reintroduce;

    property Generator: string read FGenerator write SetGenerator;
    property Sequencia: Integer read FSequencia write SetSequencia;
  end;

implementation

{ TGenException }

constructor TGenException.Create(
  const vpGenerator: string;
  const vpSequencia: Integer);
begin
  inherited Create;

  Generator := vpGenerator;
  Sequencia := vpSequencia;
end;

procedure TGenException.SetGenerator(
  const Value: string);
begin
  FGenerator := Value;
end;

procedure TGenException.SetSequencia(
  const Value: Integer);
begin
  FSequencia := Value;
end;

end.
