unit Paginador;

interface

type
  IPaginador<A, B> = interface
    ['{4B31AB23-A081-47B4-9542-A6C3B5E59F9B}']

    function Get(
      const vpValues: A;
      const vpLimit: Integer): B;
  end;

implementation

end.
