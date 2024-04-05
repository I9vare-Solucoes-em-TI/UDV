{* @hash       2b3a4f080d4b5e2a8e9e0d19eed146145d119703095919aaedf5e5e6a83c
 * @version    1.0.0.0
 * @unit       Geral.Controller.Factory.Business.UsuarioPKI.pas
 * @author     I9vare
 * @copyright  Copyright (c) 2013 I9vare Gestão e Soluções em TI. (https://www.i9vare.com)
 *}

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
