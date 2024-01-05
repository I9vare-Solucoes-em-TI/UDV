unit ProfissaoDAO;

interface

uses
  DAO,
  Profissao,
  ProfissaoList;

type
  IProfissaoDAO = interface(IDAO<IProfissao, TProfissaoList>)
    ['{FFBF27D9-F1D9-4D53-82C3-FD47E1558257}']

    function GetListBySituacao(
      const vpValue: Boolean): TProfissaoList;
  end;

implementation

end.
