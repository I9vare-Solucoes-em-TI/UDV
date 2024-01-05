unit Geral.Model.Util.Data;

interface

type
  TIntervaloData = class
  private
    FDataInicial: TDateTime;
    FDataFinal: TDateTime;
  public
    property DataInicial: TDateTime read FDataInicial write FDataInicial;
    property DataFinal: TDateTime read FDataFinal write FDataFinal;
  end;

  TUtilData = class
  public
    class function VerificarDiaUtil(
      const vpData: TDateTime): Boolean;

    class function RetornarProximoDiaUtil(
      const vpData: TDateTime): TDateTime;

    class function BuscarDiasEntreDatas(
      const vpDataIni, vpDataFim: TDateTime): Integer;
  end;

implementation

uses
  Geral.Controller.Feriado,
  System.DateUtils,
  System.SysUtils;

{ TUtilData }

class function TUtilData.BuscarDiasEntreDatas(const vpDataIni,
  vpDataFim: TDateTime): Integer;
var
  viDataIni,
  viDataFim: TDateTime;
begin
  viDataIni := StartOfTheDay(vpDataIni);
  viDataFim := StartOfTheDay(vpDataFim);

  Result    := DaysBetween(viDataIni, viDataFim);
end;

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
