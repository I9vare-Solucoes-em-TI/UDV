unit Geral.Model.DAO.Impl.Aurelius.Configuracao;

interface

uses
  Geral.Model.DAO.Spec.Configuracao,
  Geral.Model.Entity.Spec.ConfiguracaoGrupo,
  Geral.Model.Entity.Spec.List,
  Geral.Model.Entity.Spec.Configuracao,
  Aurelius.Drivers.Interfaces;

type
  TConfiguracaoDAO = class(TInterfacedObject, IConfiguracaoDAO)
  private
    FDBConnection: IDBConnection;
  public
    constructor Create(
      const vpDBConnection: IDBConnection); reintroduce;

    function ByCaminhoConfiguracao(
      const vpValue: ICaminhoConfiguracao): IConfiguracao;

    function List(
      const vpConfiguracaoGrupoList: IList<IConfiguracaoGrupo>;
      const vpSecaoList: IList<string>;
      const vpNomeList: IList<string>): IList<IConfiguracao>;

    class function New(
      const vpDBConnection: IDBConnection): IConfiguracaoDAO;
  end;

implementation

uses
  Aurelius.Engine.ObjectManager,
  Geral.Model.DAO.Impl.Aurelius.Table.Configuracao,
  Aurelius.Criteria.Linq,
  Geral.Model.DAO.Impl.Aurelius.Factory.Configuracao,
  Geral.Model.Entity.Impl.Factory.List,
  System.Generics.Collections,
  Geral.Model.Entity.Impl.List.Transform,
  System.Math,
  System.Types;

{ TConfiguracaoDAO }

function TConfiguracaoDAO.ByCaminhoConfiguracao(
  const vpValue: ICaminhoConfiguracao): IConfiguracao;
{$REGION 'Variáveis'}
var
  viObjectManager: TObjectManager;
  viTableConfiguracaoList: TList<TTableConfiguracao>;
{$ENDREGION}
begin
  viObjectManager := TObjectManager.Create(
    FDBConnection);

  try
    viTableConfiguracaoList := viObjectManager
      .CreateCriteria<TTableConfiguracao>
      .CreateAlias(
        'TableConfiguracaoGrupo',
        'cg')
      .Where(
        (Linq['cg.ConfigGrupoID'] = vpValue.ConfiguracaoGrupo.ID) and
        (Linq['Secao'] = vpValue.Secao) and
        (Linq['Nome'] = vpValue.Nome))
      .List;

    try
      Result := TConfiguracaoFactory.New(
        viTableConfiguracaoList.First,
        vpValue.ConfiguracaoGrupo)
        .GetInstance;
    finally
      viTableConfiguracaoList.Free;
    end;
  finally
    viObjectManager.Free;
  end;
end;

constructor TConfiguracaoDAO.Create(
  const vpDBConnection: IDBConnection);
begin
  inherited Create;
  FDBConnection := vpDBConnection;
end;

function TConfiguracaoDAO.List(
  const vpConfiguracaoGrupoList: IList<IConfiguracaoGrupo>;
  const vpSecaoList: IList<string>;
  const vpNomeList: IList<string>): IList<IConfiguracao>;
{$REGION 'Variáveis'}
var
  viObjectManager: TObjectManager;
  viTableConfiguracaoList: TList<TTableConfiguracao>;
  viTableConfiguracao: TTableConfiguracao;
{$ENDREGION}
begin
  Result := TListFactory<IConfiguracao>.New.GetInstance;

  viObjectManager := TObjectManager.Create(
    FDBConnection);

  try
    viTableConfiguracaoList := viObjectManager
      .CreateCriteria<TTableConfiguracao>
      .CreateAlias(
        'TableConfiguracaoGrupo',
        'cg')
      .Where(
        (Linq['cg.ConfigGrupoID']._In(
          TListTransform<IConfiguracaoGrupo, Variant>
            .New(
              vpConfiguracaoGrupoList,
              TListFactory<Variant>.New.GetInstance)
            .Transform(
              function(
                const vpValue: IConfiguracaoGrupo): Variant
              begin
                Result := vpValue.ID;
              end)
            .ToArray)) and
        (Linq['Secao']._In(
          TListTransform<string, Variant>
            .New(
              vpSecaoList,
              TListFactory<Variant>.New.GetInstance)
            .Transform(
              function(
                const vpValue: string): Variant
              begin
                Result := vpValue;
              end)
            .ToArray)) and
        (Linq['Nome']._In(
          TListTransform<string, Variant>
            .New(
              vpNomeList,
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
      for viTableConfiguracao in viTableConfiguracaoList do
        Result.Add(
          TConfiguracaoFactory.New(
            viTableConfiguracao,
            vpConfiguracaoGrupoList.Single(
              function(
                const vpValue: IConfiguracaoGrupo): Boolean
              begin
                Result := CompareValue(
                  vpValue.ID,
                  viTableConfiguracao
                    .TableConfiguracaoGrupo.ConfigGrupoID) = EqualsValue;
              end))
          .GetInstance);
    finally
      viTableConfiguracaoList.Free;
    end;
  finally
    viObjectManager.Free;
  end;
end;

class function TConfiguracaoDAO.New(
  const vpDBConnection: IDBConnection): IConfiguracaoDAO;
begin
  Result := Create(
    vpDBConnection);
end;

end.
