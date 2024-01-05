unit Geral.Model.Business.Spec.CalculoEmolumentos;

interface

type
  IConsultaEmolumentoPeriodo = interface
    ['{DD38DDE8-0982-490F-A2EC-CDEA9A245B4D}']

    function Consultar(
      const vpDataBase: TDateTime): Integer;
  end;

implementation

end.
