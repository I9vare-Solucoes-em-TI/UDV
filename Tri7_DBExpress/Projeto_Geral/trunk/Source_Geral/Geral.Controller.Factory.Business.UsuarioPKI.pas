unit Geral.Controller.Factory.Business.UsuarioPKI;

interface

uses
  Geral.Model.Entity.Spec.Factory,
  Geral.Model.Business.Spec.UsuarioPKI;

type
  TValidacaoUsuarioPKI_Factory = class(TInterfacedObject,
    IFactory<IUsuarioPKI_Business>)
  public
    function GetInstance: IUsuarioPKI_Business;
    class function New: IFactory<IUsuarioPKI_Business>;
  end;

implementation

uses
  Geral.Model.Business.Impl.UsuarioPKI,
  FDControle,
  I9Connection;

{ TValidacaoUsuarioPKI_Factory }

function TValidacaoUsuarioPKI_Factory.GetInstance: IUsuarioPKI_Business;
begin
  Result := TUsuarioPKI_Business.New(
    TI9Connection(
      dtmFD.FDConnection));
end;

class function TValidacaoUsuarioPKI_Factory.New: IFactory<IUsuarioPKI_Business>;
begin
  Result := Create;
end;

end.
