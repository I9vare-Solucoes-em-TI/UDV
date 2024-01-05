unit Geral.Model.Entity.Spec.Maybe;

interface

type
  IMaybe<T> = interface
    ['{92AA0024-E704-4B5B-9B97-B462F8456408}']

    function HasValue: Boolean;
    function Value: T;
  end;

implementation

end.
