unit Geral.Controller.Factory.DAO.Sistema;

interface

uses
  Geral.Model.Entity.Spec.Factory,
  Geral.Model.DAO.Spec.Sistema;

type
  TSistemaDAOFactory = class(TInterfacedObject, IFactory<ISistemaDAO>)
  public
    function GetInstance: ISistemaDAO;
    class function New: IFactory<ISistemaDAO>;
  end;

implementation

uses
  Geral.Model.DAO.Impl.Spring.Sistema,
  Geral.Controller.Factory.DAO.Connection.Spring;

{ TSistemaDAOFactory }

function TSistemaDAOFactory.GetInstance: ISistemaDAO;
begin
  Result := TSistemaDAO.New(
    TDAOConnectionSpringFactory.New.GetInstance);
end;

class function TSistemaDAOFactory.New: IFactory<ISistemaDAO>;
begin
  Result := Create;
end;

end.
