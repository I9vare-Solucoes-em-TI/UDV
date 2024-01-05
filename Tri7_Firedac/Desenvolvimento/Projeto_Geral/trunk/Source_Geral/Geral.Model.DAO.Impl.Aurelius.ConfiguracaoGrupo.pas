unit Geral.Model.DAO.Impl.Aurelius.ConfiguracaoGrupo;

interface

uses
  Geral.Model.DAO.Spec.ConfiguracaoGrupo,
  Aurelius.Drivers.Interfaces,
  Geral.Model.Entity.Spec.Sistema,
  Geral.Model.Entity.Spec.ConfiguracaoGrupo,
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
  Aurelius.Engine.ObjectManager,
  Geral.Model.DAO.Impl.Aurelius.Table.ConfiguracaoGrupo,
  Aurelius.Criteria.Linq,
  Geral.Model.DAO.Impl.Aurelius.Factory.ConfiguracaoGrupo,
  Geral.Model.Entity.Impl.Factory.List,
  System.Generics.Collections,
  Geral.Model.Entity.Impl.List.Transform;

{ TConfiguracaoGrupoDAO }

function TConfiguracaoGrupoDAO.BySistemaAndDescricao(
  const vpSistema: ISistema;
  const vpDescricao: string): IConfiguracaoGrupo;
{$REGION 'Variáveis'}
var
  viObjectManager: TObjectManager;
{$ENDREGION}
begin
  viObjectManager := TObjectManager.Create(
    FDBConnection);

  try
    Result := TConfiguracaoGrupoFactory.New(
      viObjectManager
        .CreateCriteria<TTableConfiguracaoGrupo>
        .CreateAlias(
          'TableSistema',
          's')
        .Where(
          (Linq['s.SistemaID'] = vpSistema.ID) and
          (Linq['Descricao'] = vpDescricao))
        .UniqueResult,
      vpSistema)
      .GetInstance;
  finally
    viObjectManager.Free;
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
  viObjectManager: TObjectManager;
  viTableConfiguracaoGrupoList: TList<TTableConfiguracaoGrupo>;
  viTableConfiguracaoGrupo: TTableConfiguracaoGrupo;
{$ENDREGION}
begin
  Result := TListFactory<IConfiguracaoGrupo>.New.GetInstance;

  viObjectManager := TObjectManager.Create(
    FDBConnection);

  try
    viTableConfiguracaoGrupoList := viObjectManager
      .CreateCriteria<TTableConfiguracaoGrupo>
      .CreateAlias(
        'TableSistema',
        's')
      .Where(
        (Linq['s.SistemaID'] = vpSistema.ID) and
        (Linq['Descricao']._In(
          TListTransform<string, Variant>.New(
            vpDescricaoList,
            TListFactory<Variant>.New.GetInstance)
          .Transform(
            function(
              const vpValue: string): Variant
            begin
              Result := vpValue;
            end)
          .ToArray)))
      .List;

    try
      for viTableConfiguracaoGrupo in viTableConfiguracaoGrupoList do
        Result.Add(
          TConfiguracaoGrupoFactory.New(
            viTableConfiguracaoGrupo,
            vpSistema)
          .GetInstance);
    finally
      viTableConfiguracaoGrupoList.Free;
    end;
  finally
    viObjectManager.Free;
  end;
end;

class function TConfiguracaoGrupoDAO.New(
  const vpDBConnection: IDBConnection): IConfiguracaoGrupoDAO;
begin
  Result := Create(
    vpDBConnection);
end;

end.
