unit Geral.Controller.Factory.Entity.SINTER;

interface

uses
  FireDAC.Stan.Param,
  Geral.Model.Entity.Spec.Factory,
  Geral.Model.Entity.Spec.SINTER;

type
  TSINTER_Factory = class(TInterfacedObject, IFactory<ISINTER>)
  private
    function AmbienteWebService: string;
  public
    function GetInstance: ISINTER;
    class function New: IFactory<ISINTER>;
  end;

implementation

uses
  Geral.Model.Entity.Impl.SINTER,
  Controles,
  ADM.Controller.Factory.Entity.ParametrosProxy;

{ TSINTER_Factory }

function TSINTER_Factory.AmbienteWebService: string;
begin
  Result := dtmControles.BuscarParametroOutroSistema(
    'AMBIENTE_WEB_SERVICE',
    'GERAL',
    'SINTER',
    '5');
end;

function TSINTER_Factory.GetInstance: ISINTER;
begin
  Result := TSINTER.New(
    AmbienteWebService,
    TParametrosProxyFactory.New.GetInstance);
end;

class function TSINTER_Factory.New: IFactory<ISINTER>;
begin
  Result := Create;
end;

end.
