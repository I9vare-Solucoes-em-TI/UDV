unit Geral.Model.Entity.Spec.RateioValor;

interface

uses
  Geral.Model.Entity.Spec.List.Number;

type
  IRateioValor<T> = interface
    ['{CEBD4767-E1F2-4417-8D88-EBB533DEAB8C}']

    function ValorOriginal: T;
    function Quantidade: Integer;
    function CasasDecimais: Integer;
    function RatearValor: INumberList<T>;
  end;

implementation

end.
