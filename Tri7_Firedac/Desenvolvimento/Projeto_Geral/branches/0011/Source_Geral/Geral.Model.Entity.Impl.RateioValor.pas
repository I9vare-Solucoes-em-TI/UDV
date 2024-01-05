unit Geral.Model.Entity.Impl.RateioValor;

interface

uses
  Geral.Model.Entity.Spec.RateioValor,
  Geral.Model.Entity.Spec.List.Number;

type
  TRateioValorMonetario = class(TInterfacedObject, IRateioValor<Currency>)
  private
    FValorOriginal: Currency;
    FQuantidade: Integer;
    FCasasDecimais: Integer;
  public
    constructor Create(
      const vpValorOriginal: Currency;
      const vpQuantidade: Integer;
      const vpCasasDecimais: Integer); reintroduce;

    function ValorOriginal: Currency;
    function Quantidade: Integer;
    function CasasDecimais: Integer;
    function RatearValor: INumberList<Currency>;

    class function New(
      const vpValorOriginal: Currency;
      const vpQuantidade: Integer;
      const vpCasasDecimais: Integer): IRateioValor<Currency>;
  end;

implementation

uses
  Geral.Model.Entity.Impl.List.Number,
  Geral.Model.Entity.Impl.Factory.List,
  Geral.Model.Entity.Impl.Arredondamento;

{ TRateioValorMonetario }

function TRateioValorMonetario.CasasDecimais: Integer;
begin
  Result := FCasasDecimais;
end;

constructor TRateioValorMonetario.Create(
  const vpValorOriginal: Currency;
  const vpQuantidade: Integer;
  const vpCasasDecimais: Integer);
begin
  inherited Create;
  FValorOriginal := vpValorOriginal;
  FQuantidade := vpQuantidade;
  FCasasDecimais := vpCasasDecimais;
end;

class function TRateioValorMonetario.New(
  const vpValorOriginal: Currency;
  const vpQuantidade: Integer;
  const vpCasasDecimais: Integer): IRateioValor<Currency>;
begin
  Result := Create(
    vpValorOriginal,
    vpQuantidade,
    vpCasasDecimais);
end;

function TRateioValorMonetario.Quantidade: Integer;
begin
  Result := FQuantidade;
end;

function TRateioValorMonetario.RatearValor: INumberList<Currency>;
{$REGION 'Variáveis'}
var
  viValorPrimeirosItens: Currency;
  I: Integer;
{$ENDREGION}
begin
  Result := TCurrencyList.New(
    TListFactory<Currency>.New.GetInstance);

  viValorPrimeirosItens := TArredondamentoValorMonetario.New(
    ValorOriginal / Quantidade,
    CasasDecimais).Arredondar;

  for I := 1 to Pred(
    Quantidade) do
    Result.List.Add(
      viValorPrimeirosItens);

  Result.List.Add(
    ValorOriginal - Result.Sum);
end;

function TRateioValorMonetario.ValorOriginal: Currency;
begin
  Result := FValorOriginal;
end;

end.
