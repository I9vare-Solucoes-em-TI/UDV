unit Geral.Model.Entity.Spec.List.Number;

interface

uses
  Geral.Model.Entity.Spec.List;

type
  INumberList<T> = interface
    ['{AA590E9C-7983-450A-BE93-FEB5DBECF304}']

    function List: IList<T>;
    function Sum: T;
    function Max: T;
  end;

implementation

end.
