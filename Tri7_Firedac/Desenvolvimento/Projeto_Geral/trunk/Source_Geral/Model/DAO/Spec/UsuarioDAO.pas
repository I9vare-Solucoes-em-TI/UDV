unit UsuarioDAO;

interface

uses
  DAO,
  Usuario,
  UsuarioList;

type
  IUsuarioDAO = interface(IDAO<IUsuario, TUsuarioList>)
    ['{30C71258-7DA2-4989-B09B-27BEEA83586A}']
  end;

implementation

end.
