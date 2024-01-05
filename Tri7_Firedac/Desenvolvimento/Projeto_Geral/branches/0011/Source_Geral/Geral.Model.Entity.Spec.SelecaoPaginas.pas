unit Geral.Model.Entity.Spec.SelecaoPaginas;

interface

uses
  Geral.Model.Entity.Spec.List;

type
  ISelecaoPaginas = interface
    ['{F06B9142-6FD9-4DBC-B32C-078CE555419B}']

    function Paginas: IList<Integer>;
  end;

implementation

end.
