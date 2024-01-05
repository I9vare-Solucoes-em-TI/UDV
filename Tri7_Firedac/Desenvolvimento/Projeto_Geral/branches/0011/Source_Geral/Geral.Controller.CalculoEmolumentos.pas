unit Geral.Controller.CalculoEmolumentos;

interface

type
  TCalculoOutraTaxa1Controller = class
  public
    class function Calcular(
      const vpEmolumentoId: Integer;
      const vpEmolumentoItemId: Integer;
      const vpValorEmolumentoUnitario: Currency;
      const vpValorFundosDeducaoUnitario: Currency;
      const vpValorTaxaJudiciariaUnitario: Currency;
      const vpQuantidade: Integer;
      const vpSistemaId: Integer;
      const vpUf: string): Currency;
  end;

implementation

uses
  Geral.Model.CalculoEmolumentos;

{ TCalculoOutraTaxa1Controller }

class function TCalculoOutraTaxa1Controller.Calcular(
  const vpEmolumentoId: Integer;
  const vpEmolumentoItemId: Integer;
  const vpValorEmolumentoUnitario: Currency;
  const vpValorFundosDeducaoUnitario: Currency;
  const vpValorTaxaJudiciariaUnitario: Currency;
  const vpQuantidade: Integer;
  const vpSistemaId: Integer;
  const vpUf: string): Currency;
begin
  Result := TCalculoOutraTaxa1Business.Calcular(
    vpEmolumentoId,
    vpEmolumentoItemId,
    vpValorEmolumentoUnitario,
    vpValorFundosDeducaoUnitario,
    vpValorTaxaJudiciariaUnitario,
    vpQuantidade,
    vpSistemaId,
    vpUf);
end;

end.
