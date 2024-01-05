unit Geral.Model.Entity.Spec.SeloLivro;

interface

type
  ISeloLivro = interface
    ['{82CE5736-73D4-4E6B-8D95-F525A271AF5F}']

    function ID: Integer;
    function Numero: Integer;
    function Sigla: string;
    function Validado: Boolean;
  end;

implementation

end.
