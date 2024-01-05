unit Geral.Model.Util.Data;

interface

type
  TUtilData = class
  public
    class function VerificarDiaUtil(
      const vpData: TDateTime): Boolean;

    class function RetornarProximoDiaUtil(
      const vpData: TDateTime): TDateTime;
  end;

implementation

uses
  Geral.Controller.Feriado,
  System.SysUtils;

{ TUtilData }

class function TUtilData.RetornarProximoDiaUtil(
  const vpData: TDateTime): TDateTime;
begin
  Result := vpData;

  while not TUtilData.VerificarDiaUtil(Result) do
    Result := Result + 1;
end;

class function TUtilData.VerificarDiaUtil(
  const vpData: TDateTime): Boolean;
begin
  Result :=
    (not TFeriadoController.VerificarFeriado(vpData)) and
    (DayOfWeek(vpData) in [2..6]);  // Segunda a Sexta
end;

end.
