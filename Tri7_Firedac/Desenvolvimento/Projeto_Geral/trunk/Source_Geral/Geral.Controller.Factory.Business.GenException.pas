unit Geral.Controller.Factory.Business.GenException;

interface

uses
  Geral.Model.Entity.Spec.Factory,
  Geral.Model.Business.Spec.GenException;

type
  TGenExceptionBusinessFactory = class(TInterfacedObject,
    IFactory<IGenExceptionBusiness>)
  public
    function GetInstance: IGenExceptionBusiness;
    class function New: IFactory<IGenExceptionBusiness>;
  end;

implementation

uses
  Geral.Model.Business.Impl.GenException,
  Controles;

{ TGenExceptionBusinessFactory }

function TGenExceptionBusinessFactory.GetInstance: IGenExceptionBusiness;
begin
  Result := TGenExceptionBusiness.New(
    dtmControles.DB);
end;

class function TGenExceptionBusinessFactory.New:
  IFactory<IGenExceptionBusiness>;
begin
  Result := Create;
end;

end.
