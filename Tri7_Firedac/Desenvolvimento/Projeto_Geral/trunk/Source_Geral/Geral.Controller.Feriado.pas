unit Geral.Controller.Feriado;

interface

uses
  Geral.Model.Feriado;

type
  TFeriadoController = class
  public
    class function VerificarFeriado(
      const vpData: TDateTime): Boolean;
  end;

implementation

{ TFeriadoController }

class function TFeriadoController.VerificarFeriado(
  const vpData: TDateTime): Boolean;
begin
  Result := TFeriadoBusiness.VerificarFeriado(
    vpData);
end;

end.
