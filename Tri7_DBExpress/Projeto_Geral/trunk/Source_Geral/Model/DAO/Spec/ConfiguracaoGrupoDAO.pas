unit ConfiguracaoGrupoDAO;

interface

uses
  DAO,
  ConfiguracaoGrupo,
  ConfiguracaoGrupoList,
  Sistema;

type
  IConfiguracaoGrupoDAO = interface(IDAO<IConfiguracaoGrupo,
    TConfiguracaoGrupoList>)
    ['{31D7DAFB-3EE2-49CE-A61D-959152DB86F6}']

    function GetList(
      const vpValue: ISistema): TConfiguracaoGrupoList;
  end;

implementation

end.
