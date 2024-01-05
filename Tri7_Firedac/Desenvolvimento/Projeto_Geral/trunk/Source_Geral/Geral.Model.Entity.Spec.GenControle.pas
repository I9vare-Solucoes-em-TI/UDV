unit Geral.Model.Entity.Spec.GenControle;

interface

type
  IGenControle = interface
    ['{CB7A5772-6177-4BC8-8B2E-D76462979984}']

    function NomeGenerator: string;
    function Sequencia: Integer;
    function Status: string;
    function DataControle: TDateTime;
  end;

implementation

end.
