unit ConsultorCNPJSimpleFactory;

interface

uses
  ConsultorCNPJ;

type
  TConsultorCNPJSimpleFactory = class sealed
  public
    class function Get: IConsultorCNPJ; static;
  end;

implementation

uses
  ConsultorCNPJReceitaWS,
  Geral.Model.Entity.Impl.Maybe,
  Geral.Model.Entity.Spec.ParametrosProxy;

{ TConsultorCNPJSimpleFactory }

class function TConsultorCNPJSimpleFactory.Get: IConsultorCNPJ;
begin
  Result := TConsultorCNPJReceitaWS.New(
    { Fabricar aqui os parâmetros Proxy }
    TNone<IParametrosProxy>.New);
end;

end.
