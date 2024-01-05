unit Geral.Controller.TarefaGrupo;

interface

uses
  Geral.Model.TarefaGrupo,
  System.Classes,
  System.Generics.Collections;

type
  TTarefaGrupoController = class
  public
    class function Consultar(
      const vpSistemaId: Integer): TList<TTarefaGrupo>;
  end;

implementation

{ TTarefaGrupoController }

class function TTarefaGrupoController.Consultar(
  const vpSistemaId: Integer): TList<TTarefaGrupo>;
begin
  Result := TTarefaGrupoBusiness.Consultar(
    vpSistemaId);
end;

end.
