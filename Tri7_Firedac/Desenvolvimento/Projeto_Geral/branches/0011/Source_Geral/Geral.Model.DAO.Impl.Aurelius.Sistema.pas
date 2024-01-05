unit Geral.Model.DAO.Impl.Aurelius.Sistema;

interface

uses
  Geral.Model.DAO.Spec.Sistema,
  Aurelius.Drivers.Interfaces,
  Geral.Model.Entity.Spec.Sistema;

type
  TSistemaDAO = class(TInterfacedObject, ISistemaDAO)
  private
    FDBConnection: IDBConnection;
  public
    constructor Create(
      const vpDBConnection: IDBConnection); reintroduce;

    function ByID(
      const vpValue: Integer): ISistema;

    class function New(
      const vpDBConnection: IDBConnection): ISistemaDAO;
  end;

implementation

uses
  Aurelius.Engine.ObjectManager,
  Geral.Model.DAO.Impl.Aurelius.Table.Sistema,
  Geral.Model.DAO.Impl.Aurelius.Factory.Sistema;

{ TSistemaDAO }

function TSistemaDAO.ByID(
  const vpValue: Integer): ISistema;
{$REGION 'Variáveis'}
var
  viObjectManager: TObjectManager;
{$ENDREGION}
begin
  viObjectManager := TObjectManager.Create(
    FDBConnection);

  try
    Result := TSistemaFactory.New(
      viObjectManager.Find<TTableSistema>(
        vpValue)).GetInstance;
  finally
    viObjectManager.Free;
  end;
end;

constructor TSistemaDAO.Create(
  const vpDBConnection: IDBConnection);
begin
  inherited Create;
  FDBConnection := vpDBConnection;
end;

class function TSistemaDAO.New(
  const vpDBConnection: IDBConnection): ISistemaDAO;
begin
  Result := Create(
    vpDBConnection);
end;

end.
