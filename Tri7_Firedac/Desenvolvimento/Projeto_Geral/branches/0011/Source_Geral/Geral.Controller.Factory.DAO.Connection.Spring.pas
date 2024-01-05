unit Geral.Controller.Factory.DAO.Connection.Spring;

interface

uses
  Geral.Model.Entity.Spec.Factory,
  Spring.Persistence.Core.Interfaces;

type
  TDAOConnectionSpringFactory = class(TInterfacedObject,
    IFactory<IDBConnection>)
  public
    function GetInstance: IDBConnection;
    class function New: IFactory<IDBConnection>;
  end;

implementation

uses
  Spring.Persistence.Core.ConnectionFactory,
  Controles,
  Spring.Persistence.Adapters.FireDAC;

{ TDAOConnectionSpringFactory }

function TDAOConnectionSpringFactory.GetInstance: IDBConnection;
begin
  Result := TConnectionFactory.GetInstance(
    dtFiredac,
    dtmControles.DB);
end;

class function TDAOConnectionSpringFactory.New: IFactory<IDBConnection>;
begin
  Result := Create;
end;

end.
