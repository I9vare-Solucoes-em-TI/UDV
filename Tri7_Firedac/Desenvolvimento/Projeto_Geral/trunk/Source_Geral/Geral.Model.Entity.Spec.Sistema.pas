unit Geral.Model.Entity.Spec.Sistema;

interface

uses
  Geral.Model.Entity.Spec.Situacao;

type
  ISistema = interface
    ['{79EC319F-2623-451F-81FD-468B62AB7116}']

    function ID: Integer;
    function Descricao: string;
    function Situacao: ISituacao;
    function Versao: string;
  end;

implementation

end.
