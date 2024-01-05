unit Geral.Model.DAO.Spec.Configuracao;

interface

uses
  Geral.Model.Entity.Spec.ConfiguracaoGrupo,
  Geral.Model.Entity.Spec.List,
  Geral.Model.Entity.Spec.Configuracao;

type
  IConfiguracaoDAO = interface
    ['{76FAC836-3E26-4069-9D32-30DED47B0746}']

    function ByCaminhoConfiguracao(
      const vpValue: ICaminhoConfiguracao): IConfiguracao;

    function List(
      const vpConfiguracaoGrupoList: IList<IConfiguracaoGrupo>;
      const vpSecaoList: IList<string>;
      const vpNomeList: IList<string>): IList<IConfiguracao>;
  end;

implementation

end.
