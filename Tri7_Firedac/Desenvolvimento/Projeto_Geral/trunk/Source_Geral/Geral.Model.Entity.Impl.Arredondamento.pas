unit Geral.Model.Entity.Impl.Arredondamento;

interface

uses
  Geral.Model.Entity.Spec.Arredondamento;

type
  TArredondamentoValorMonetario = class(TInterfacedObject,
    IArredondamento<Currency>)
  private
    FValorOriginal: Currency;
    FCasasDecimais: Integer;
  public
    constructor Create(
      const vpValorOriginal: Currency;
      const vpCasasDecimais: Integer); reintroduce;

    function ValorOriginal: Currency;
    function CasasDecimais: Integer;
    function Arredondar: Currency;

    class function New(
      const vpValorOriginal: Currency;
      const vpCasasDecimais: Integer): IArredondamento<Currency>;
  end;

implementation

{ TArredondamentoValorMonetario }

function TArredondamentoValorMonetario.CasasDecimais: Integer;
begin
  Result := FCasasDecimais;
end;

constructor TArredondamentoValorMonetario.Create(
  const vpValorOriginal: Currency;
  const vpCasasDecimais: Integer);
begin
  inherited Create;
  FValorOriginal := vpValorOriginal;
  FCasasDecimais := vpCasasDecimais;
end;

class function TArredondamentoValorMonetario.New(
  const vpValorOriginal: Currency;
  const vpCasasDecimais: Integer): IArredondamento<Currency>;
begin
  Result := Create(
    vpValorOriginal,
    vpCasasDecimais);
end;

function TArredondamentoValorMonetario.Arredondar: Currency;
{$REGION 'Variáveis'}
var
  viResult64: Int64 absolute Result;
  viDecimals: Integer;
{$ENDREGION}
begin
  Result := FValorOriginal;
  viDecimals := viResult64 mod 100;

  Dec(
    viResult64,
    viDecimals);

  case viDecimals of
    -99..-50: Dec(
      viResult64,
      100);

    50..99: Inc(
      viResult64,
      100);
  end;
end;

function TArredondamentoValorMonetario.ValorOriginal: Currency;
begin
  Result := FValorOriginal;
end;

end.
