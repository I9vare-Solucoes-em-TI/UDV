unit Geral.Model.DAO.Impl.Spring.ConfiguracaoGrupo;

interface

uses
  Geral.Model.DAO.Spec.ConfiguracaoGrupo,
  Geral.Model.Entity.Spec.Sistema,
  Geral.Model.Entity.Spec.ConfiguracaoGrupo,
  Spring.Persistence.Core.Interfaces,
  Geral.Model.Entity.Spec.List;

type
  TConfiguracaoGrupoDAO = class(TInterfacedObject, IConfiguracaoGrupoDAO)
  private
    FDBConnection: IDBConnection;
  public
    constructor Create(
      const vpDBConnection: IDBConnection); reintroduce;

    function BySistemaAndDescricao(
      const vpSistema: ISistema;
      const vpDescricao: string): IConfiguracaoGrupo;

    function ListBySistemaAndDescricaoList(
      const vpSistema: ISistema;
      const vpDescricaoList: IList<string>): IList<IConfiguracaoGrupo>;

    class function New(
      const vpDBConnection: IDBConnection): IConfiguracaoGrupoDAO;
  end;

implementation

uses
  Spring.Persistence.Core.Session,
  Geral.Model.DAO.Impl.Spring.Table.ConfiguracaoGrupo,
  Spring.Persistence.Criteria.Restrictions,
  Geral.Model.DAO.Impl.Spring.Factory.ConfiguracaoGrupo,
  Geral.Model.Entity.Impl.Factory.List;

{ TConfiguracaoGrupoDAO }

function TConfiguracaoGrupoDAO.BySistemaAndDescricao(
  const vpSistema: ISistema;
  const vpDescricao: string): IConfiguracaoGrupo;
{$REGION 'Variáveis'}
var
  viSession: TSession;
{$ENDREGION}
begin
  viSession := TSession.Create(
    FDBConnection);

  try
    Result := TConfiguracaoGrupoFactory.New(
      viSession
        .CreateCriteria<TTableConfiguracaoGrupo>.Add(
          Restrictions.Eq(
            'SISTEMA_ID',
            vpSistema.ID))
        .Add(
          Restrictions.Eq(
            'DESCRICAO',
            vpDescricao))
        .ToList
        .Single,
      vpSistema).GetInstance;
  finally
    viSession.Free;
  end;
end;

constructor TConfiguracaoGrupoDAO.Create(
  const vpDBConnection: IDBConnection);
begin
  inherited Create;
  FDBConnection := vpDBConnection;
end;

function TConfiguracaoGrupoDAO.ListBySistemaAndDescricaoList(
  const vpSistema: ISistema;
  const vpDescricaoList: IList<string>): IList<IConfiguracaoGrupo>;
{$REGION 'Variáveis'}
var
  viSession: TSession;
  viResult: IList<IConfiguracaoGrupo>;
{$ENDREGION}
begin
  viResult := TListFactory<IConfiguracaoGrupo>.New.GetInstance;

  viSession := TSession.Create(
    FDBConnection);

  try
    viSession.CreateCriteria<TTableConfiguracaoGrupo>.Add(
      Restrictions.Eq(
        'SISTEMA_ID',
        vpSistema.ID)).Add(
      Restrictions.&In<string>(
        'DESCRICAO',
        vpDescricaoList.ToArray))
      .ToList
      .ForEach(
        procedure(const arg: TTableConfiguracaoGrupo)
        begin
          viResult.Add(
            TConfiguracaoGrupoFactory.New(
              arg,
              vpSistema).GetInstance);
        end);
  finally
    viSession.Free;
  end;

  Result := viResult;
end;

class function TConfiguracaoGrupoDAO.New(
  const vpDBConnection: IDBConnection): IConfiguracaoGrupoDAO;
begin
  Result := Create(
    vpDBConnection);
end;

end.
