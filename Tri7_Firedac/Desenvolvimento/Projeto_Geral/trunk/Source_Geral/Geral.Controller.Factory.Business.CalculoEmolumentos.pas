unit Geral.Controller.Factory.Business.CalculoEmolumentos;

interface

uses
  Geral.Model.Entity.Spec.Factory,
  Geral.Model.Business.Spec.CalculoEmolumentos;

type
  TConsultaEmolumentoPeriodoFactory = class(TInterfacedObject, IFactory<IConsultaEmolumentoPeriodo>)
  public
    function GetInstance: IConsultaEmolumentoPeriodo;
    class function New: IFactory<IConsultaEmolumentoPeriodo>;
  end;

implementation

uses
  Geral.Model.Business.Impl.CalculoEmolumentos,
  I9Connection,
  Controles;

function GetConnection: TI9Connection;
begin
  Result := dtmControles.DB;
end;

{ TConsultaEmolumentoPeriodoFactory }

function TConsultaEmolumentoPeriodoFactory.GetInstance: IConsultaEmolumentoPeriodo;
begin
  Result := TConsultaEmolumentoPeriodo.New(GetConnection);
end;

class function TConsultaEmolumentoPeriodoFactory.New: IFactory<IConsultaEmolumentoPeriodo>;
begin
  Result := Create;
end;

end.
