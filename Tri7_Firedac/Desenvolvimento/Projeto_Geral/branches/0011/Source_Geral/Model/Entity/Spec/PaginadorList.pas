unit PaginadorList;

interface

uses
  System.Generics.Collections,
  Paginador;

type
  IPaginadorList<T; A: TList<T>; B: TList<A>> = interface(IPaginador<A, B>)
    ['{1733FF36-8B9F-463B-8AF8-BBEDE3F4D6DF}']
  end;

implementation

end.
