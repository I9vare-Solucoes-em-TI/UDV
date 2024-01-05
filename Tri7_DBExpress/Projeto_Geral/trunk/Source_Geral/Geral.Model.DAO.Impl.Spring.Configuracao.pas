unit Geral.Model.DAO.Impl.Spring.Configuracao;

interface

uses
  Geral.Model.DAO.Spec.Configuracao,
  Geral.Model.Entity.Spec.ConfiguracaoGrupo,
  Geral.Model.Entity.Spec.List,
  Geral.Model.Entity.Spec.Configuracao,
  Spring.Persistence.Core.Interfaces;

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
  Geral.Model.Entity.Impl.Factory.List,
  Spring.Persistence.Core.Session,
  Geral.Model.DAO.Impl.Spring.Table.Configuracao,
  Spring.Persistence.Criteria.Restrictions,
  Geral.Model.DAO.Impl.Spring.Factory.Configuracao,
  System.Math,
  System.Types,
  Geral.Model.Entity.Impl.List.Transform;

{ TConfiguracaoDAO }

function TConfiguracaoDAO.ByCaminhoConfiguracao(
  const vpValue: ICaminhoConfiguracao): IConfiguracao;
{$REGION 'Variáveis'}
var
  viSession: TSession;
{$ENDREGION}
begin
  viSession := TSession.Create(
    FDBConnection);

  try
    Result := TConfiguracaoFactory.New(
      viSession.CreateCriteria<TTableConfiguracao>.Add(
        Restrictions.Eq(
          'CONFIG_GRUPO_ID',
          vpValue.ConfiguracaoGrupo.ID)).Add(
        Restrictions.Eq(
          'SECAO',
          vpValue.Secao)).Add(
        Restrictions.Eq(
          'NOME',
          vpValue.Nome))
        .ToList
        .First,
      vpValue.ConfiguracaoGrupo).GetInstance;
  finally
    viSession.Free;
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
  viResult: IList<IConfiguracao>;
  viSession: TSession;
{$ENDREGION}
begin
  viResult := TListFactory<IConfiguracao>.New.GetInstance;

  viSession := TSession.Create(
    FDBConnection);

  try
    viSession.CreateCriteria<TTableConfiguracao>.Add(
      Restrictions.&In<Integer>(
        'CONFIG_GRUPO_ID',
        TListTransform<IConfiguracaoGrupo, Integer>.New(
          vpConfiguracaoGrupoList,
          TListFactory<Integer>.New.GetInstance)
        .Transform(
          function(const vpValue: IConfiguracaoGrupo): Integer
          begin
            Result := vpValue.ID;
          end).ToArray)).Add(
      Restrictions.&In<string>(
        'SECAO',
        vpSecaoList.ToArray)).Add(
      Restrictions.&In<string>(
        'NOME',
        vpNomeList.ToArray))
      .ToList
      .ForEach(
        procedure(const arg: TTableConfiguracao)
        begin
          viResult.Add(
            TConfiguracaoFactory.New(
              arg,
              vpConfiguracaoGrupoList.Single(
                function(const vpValue: IConfiguracaoGrupo): Boolean
                begin
                  Result := CompareValue(
                    vpValue.ID,
                    arg.ConfigGrupoID) = EqualsValue;
                end)).GetInstance);
        end);
  finally
    viSession.Free;
  end;

  Result := viResult;
end;

class function TConfiguracaoDAO.New(
  const vpDBConnection: IDBConnection): IConfiguracaoDAO;
begin
  Result := Create(
    vpDBConnection);
end;

end.
