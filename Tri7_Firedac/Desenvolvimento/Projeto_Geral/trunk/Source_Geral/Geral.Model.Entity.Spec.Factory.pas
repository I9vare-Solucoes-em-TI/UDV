unit Geral.Model.Entity.Spec.Factory;

interface

type
  IFactory<T> = interface
    ['{2EA5D340-37B0-4D35-ABC3-A7DEB01C8898}']

    function GetInstance: T;
  end;

implementation

end.
