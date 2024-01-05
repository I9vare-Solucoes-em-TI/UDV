unit Geral.Controller.Factory.Business.GenControle;

interface

uses
  Geral.Model.Entity.Spec.Factory,
  Geral.Model.Business.Spec.GenControle,
  I9Connection;

type
  TGenControleBusinessFactory = class(TInterfacedObject,
    IFactory<IGenControleBusiness>)
  private
    function Connection: TI9Connection;
    function DataHoraServidor: TDateTime;
  public
    function GetInstance: IGenControleBusiness;
    class function New: IFactory<IGenControleBusiness>;
  end;

implementation

uses
  Geral.Model.Business.Impl.GenControle,
  Controles;

{ TGenControleBusinessFactory }

function TGenControleBusinessFactory.Connection: TI9Connection;
begin
  Result := dtmControles.DB;
end;

function TGenControleBusinessFactory.DataHoraServidor: TDateTime;
begin
  Result := dtmControles.DataHoraBanco(
    3,
    False);
end;

function TGenControleBusinessFactory.GetInstance: IGenControleBusiness;
begin
  Result := TGenControleBusiness.New(
    Connection,
    DataHoraServidor);
end;

class function TGenControleBusinessFactory.New: IFactory<IGenControleBusiness>;
begin
  Result := Create;
end;

end.
