unit Geral.Model.Entity.Spec.ConfiguracaoGrupo;

interface

uses
  Geral.Model.Entity.Spec.Sistema;

type
  IConfiguracaoGrupo = interface
    ['{4145EB73-0F34-402A-9BFE-96A5D55D68F5}']

    function ID: Integer;
    function Descricao: string;
    function Sistema: ISistema;
  end;

implementation

end.
