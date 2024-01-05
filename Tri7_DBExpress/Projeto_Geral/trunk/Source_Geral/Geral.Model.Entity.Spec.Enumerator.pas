unit Geral.Model.Entity.Spec.Enumerator;

interface

type
  IEnumerator<T> = interface
    ['{F5A160E4-885F-4869-9650-E0D325FC4B7A}']

    function GetCurrent: T;
    function MoveNext: Boolean;

    property Current: T read GetCurrent;
  end;

implementation

end.
