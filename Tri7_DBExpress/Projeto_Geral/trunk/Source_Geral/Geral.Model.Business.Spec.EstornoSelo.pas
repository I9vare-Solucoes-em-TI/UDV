unit Geral.Model.Business.Spec.EstornoSelo;

interface

uses
  Geral.Model.Entity.Spec.Maybe,
  Geral.Model.Entity.Spec.List,
  Geral.Model.Entity.Spec.SeloLivro;

type
  IEstornoSelo = interface
    ['{47D32A95-9F9F-48B4-870C-2A3F2E23DC4E}']

    function Estornar: IMaybe<IList<ISeloLivro>>;
  end;

implementation

end.
