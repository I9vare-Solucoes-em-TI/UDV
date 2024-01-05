unit Geral.Controller.Factory.Business.UsuarioPKI;

interface

uses
  Geral.Model.Entity.Spec.Factory,
  Geral.Model.Business.Spec.UsuarioPKI;

type
  TUsuarioPKI_BusinessFactory = class(TInterfacedObject,
    IFactory<IUsuarioPKI_Business>)
  public
    function GetInstance: IUsuarioPKI_Business;
    class function New: IFactory<IUsuarioPKI_Business>;
  end;

implementation

uses
  Geral.Model.Business.Impl.UsuarioPKI,
  Controles;

{ TUsuarioPKI_BusinessFactory }

function TUsuarioPKI_BusinessFactory.GetInstance: IUsuarioPKI_Business;
begin
  Result := TUsuarioPKI_Business.New(
    dtmControles.DB);
end;

class function TUsuarioPKI_BusinessFactory.New: IFactory<IUsuarioPKI_Business>;
begin
  Result := Create;
end;

end.
