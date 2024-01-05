unit Geral.Model.Entity.Impl.Factory.AmbienteWebService;

interface

uses
  Geral.Model.Entity.Spec.Factory,
  Geral.Model.Entity.Spec.AmbienteWebService;

type
  TAmbienteWebServiceFactory = class(TInterfacedObject,
    IFactory<IAmbienteWebService>)
  private
    FValue: string;
  public
    constructor Create(
      const vpValue: string); reintroduce;

    function GetInstance: IAmbienteWebService;

    class function New(
      const vpValue: string): IFactory<IAmbienteWebService>;
  end;

implementation

uses
  Geral.Model.Entity.Impl.AmbienteWebService,
  System.SysUtils;

{ TAmbienteWebServiceFactory }

constructor TAmbienteWebServiceFactory.Create(
  const vpValue: string);
begin
  inherited Create;
  FValue := vpValue;
end;

function TAmbienteWebServiceFactory.GetInstance: IAmbienteWebService;
begin
  if FValue.Equals(
    'P') then
    Exit(
      TProducao.New);

  Result := THomologacao.New;
end;

class function TAmbienteWebServiceFactory.New(
  const vpValue: string): IFactory<IAmbienteWebService>;
begin
  Result := Create(
    vpValue);
end;

end.
