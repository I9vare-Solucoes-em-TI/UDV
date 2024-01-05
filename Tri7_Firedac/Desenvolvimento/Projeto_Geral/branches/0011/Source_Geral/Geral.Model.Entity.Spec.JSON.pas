unit Geral.Model.Entity.Spec.JSON;

interface

uses
  System.JSON,
  Geral.Model.Entity.AnonymousMethods;

type
  IJSONAPI<T: TJSONValue> = interface
    ['{D210DA0F-01E7-470B-862C-C6AF41EE62C6}']

    function JSONValue: T;
    function AutoDestroy: IJSONAPI<T>;
    function ManualDestroy: IJSONAPI<T>;

    function ExecuteAction(
      const vpAction: TAction<T>): IJSONAPI<T>;
  end;

implementation

end.
