unit MunicipioDAO;

interface

uses
  DAO,
  Municipio,
  MunicipioList;

type
  IMunicipioDAO = interface(IDAO<IMunicipio, TMunicipioList>)
    ['{F36E5721-2D62-49E7-BDEF-D5C6D8485787}']
  end;

implementation

end.
