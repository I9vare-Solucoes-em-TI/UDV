unit DAO;

interface

type
  IDAO<T, L> = interface
    ['{A5CCD544-7C5E-4CC7-ACF0-03C40B0E7C45}']

    function GetByID(
      const vpValue: Variant): T;

    function GetList: L;

    procedure Inserir(
      const vpValue: T);

    procedure Alterar(
      const vpValue: T);

    procedure Excluir(
      const vpValue: T);
  end;

implementation

end.
