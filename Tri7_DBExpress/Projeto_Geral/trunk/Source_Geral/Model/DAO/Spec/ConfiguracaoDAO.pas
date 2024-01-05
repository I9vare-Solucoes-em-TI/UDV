unit ConfiguracaoDAO;

interface

uses
  DAO,
  Configuracao,
  ConfiguracaoList,
  ConfiguracaoGrupoList;

type
  IConfiguracaoDAO = interface(IDAO<IConfiguracao, TConfiguracaoList>)
    ['{3BDCA9A5-7350-4147-93F8-379284104C40}']

    function GetList(
      const vpConfiguracaoGrupoList: TConfiguracaoGrupoList):
        TConfiguracaoList; overload;
  end;

implementation

end.
