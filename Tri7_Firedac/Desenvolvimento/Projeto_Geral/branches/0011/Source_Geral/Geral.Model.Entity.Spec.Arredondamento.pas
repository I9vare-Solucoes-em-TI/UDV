unit Geral.Model.Entity.Spec.Arredondamento;

interface

type
  IArredondamento<T> = interface
    ['{EDF5EC89-64B0-4143-B5DB-BE8A0F159375}']

    function ValorOriginal: T;
    function CasasDecimais: Integer;
    function Arredondar: T;
  end;

implementation

end.
