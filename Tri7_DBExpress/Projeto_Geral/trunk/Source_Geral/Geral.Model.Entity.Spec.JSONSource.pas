unit Geral.Model.Entity.Spec.JSONSource;

interface

uses
  System.JSON;

type
  IJSONSource<T: TJSONValue> = interface
    ['{7774F039-9014-4805-8B5D-1D748A7F7663}']

    function Data: T;
  end;

implementation

end.
