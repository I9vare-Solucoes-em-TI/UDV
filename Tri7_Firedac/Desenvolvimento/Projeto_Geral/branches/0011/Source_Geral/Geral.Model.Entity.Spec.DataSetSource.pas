unit Geral.Model.Entity.Spec.DataSetSource;

interface

uses
  Data.DB;

type
  IDataSetSource<T: TDataSet> = interface
    ['{3AC61533-0F26-4823-A841-D8F95506F321}']

    function Data: T;
  end;

implementation

end.
