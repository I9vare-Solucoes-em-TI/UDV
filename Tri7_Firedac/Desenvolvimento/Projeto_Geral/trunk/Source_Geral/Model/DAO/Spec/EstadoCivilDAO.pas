unit EstadoCivilDAO;

interface

uses
  DAO,
  EstadoCivil,
  EstadoCivilList,
  Sistema;

type
  IEstadoCivilDAO = interface(IDAO<IEstadoCivil, TEstadoCivilList>)
    ['{BABAD5B4-972B-4E87-A3A4-13D62A623E2D}']

    function GetListBySistemaESituacao(
      const vpSistema: ISistema;
      const vpSituacao: Boolean): TEstadoCivilList;
  end;

implementation

end.
