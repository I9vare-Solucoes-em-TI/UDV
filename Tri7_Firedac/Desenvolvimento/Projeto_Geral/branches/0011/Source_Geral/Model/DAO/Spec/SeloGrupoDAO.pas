unit SeloGrupoDAO;

interface

uses
  DAO,
  SeloGrupo,
  SeloGrupoList;

type
  ISeloGrupoDAO = interface(IDAO<ISeloGrupo, TSeloGrupoList>)
    ['{AB0F2414-B95D-4D19-847D-912DD6220354}']
  end;

implementation

end.
