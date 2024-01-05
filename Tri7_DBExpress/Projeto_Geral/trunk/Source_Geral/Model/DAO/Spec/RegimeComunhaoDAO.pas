unit RegimeComunhaoDAO;

interface

uses
  DAO,
  RegimeComunhao,
  RegimeComunhaoList;

type
  IRegimeComunhaoDAO = interface(IDAO<IRegimeComunhao, TRegimeComunhaoList>)
    ['{F8DB7E93-7CBF-46E8-BC4D-E389D5107739}']

    function GetListBySituacao(
      const vpValue: Boolean): TRegimeComunhaoList;
  end;

implementation

end.
