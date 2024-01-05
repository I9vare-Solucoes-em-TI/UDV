unit Geral.Model.DAO.Impl.Spring.Sistema;

interface

uses
  Geral.Model.DAO.Spec.Sistema,
  Spring.Persistence.Core.Interfaces,
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
  Spring.Persistence.Core.Session,
  Geral.Model.DAO.Impl.Spring.Table.Sistema,
  Geral.Model.DAO.Impl.Spring.Factory.Sistema;

{ TSistemaDAO }

function TSistemaDAO.ByID(
  const vpValue: Integer): ISistema;
{$REGION 'Variáveis'}
var
  viSession: TSession;
  viTableSistema: TTableSistema;
{$ENDREGION}
begin
  viSession := TSession.Create(
    FDBConnection);

  try
    viTableSistema := viSession.FindOne<TTableSistema>(
      vpValue);

    try
      Result := TSistemaFactory.New(
        viTableSistema).GetInstance;
    finally
      viTableSistema.Free;
    end;
  finally
    viSession.Free;
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
