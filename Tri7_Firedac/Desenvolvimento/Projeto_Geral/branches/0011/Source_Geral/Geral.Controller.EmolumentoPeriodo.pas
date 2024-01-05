unit Geral.Controller.EmolumentoPeriodo;

interface

uses
  System.Generics.Collections,
  Geral.Model.EmolumentoPeriodo;

type
  TEmolumentoPeriodoController = class
  public
    function ListarAtivos: TObjectList<TEmolumentoPeriodo>;

    function Buscar(
      const vpEmolumentoPeriodoID: Integer): TEmolumentoPeriodo;
  end;

implementation

{ TEmolumentoPeriodoController }

function TEmolumentoPeriodoController.Buscar(
  const vpEmolumentoPeriodoID: Integer): TEmolumentoPeriodo;
var
  viEmolumentoPeriodoBusiness: TEmolumentoPeriodoBusiness;
begin
  viEmolumentoPeriodoBusiness := nil;
  try
    viEmolumentoPeriodoBusiness := TEmolumentoPeriodoBusiness.Create;

    Result := viEmolumentoPeriodoBusiness.Buscar(
      vpEmolumentoPeriodoID);
  finally
    viEmolumentoPeriodoBusiness.Free;
  end;
end;

function TEmolumentoPeriodoController.ListarAtivos: TObjectList<TEmolumentoPeriodo>;
var
  viEmolumentoPeriodoBusiness: TEmolumentoPeriodoBusiness;
begin
  viEmolumentoPeriodoBusiness := nil;
  try
    viEmolumentoPeriodoBusiness := TEmolumentoPeriodoBusiness.Create;
    Result := viEmolumentoPeriodoBusiness.ListarAtivos;
  finally
    viEmolumentoPeriodoBusiness.Free;
  end;
end;

end.
