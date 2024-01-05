unit Geral.Controller.SeloLivro;

interface

uses
  System.Generics.Collections,
  Geral.Model.Validacao;

type
  TSeloLivroController = class
  public
    class function ValidarSolicitacaoSelo(
      const vpSeloGrupoId: Integer;
      const vpDataBase: TDateTime;
      const vpQuantidadeSolicitada: Integer;
      out vpListaErroValidacao: TObjectList<TErroValidacao>): Boolean;
  end;

implementation

uses
  Geral.Model.SeloLivro;

{ TSeloLivroController }

class function TSeloLivroController.ValidarSolicitacaoSelo(
  const vpSeloGrupoId: Integer;
  const vpDataBase: TDateTime;
  const vpQuantidadeSolicitada: Integer;
  out vpListaErroValidacao: TObjectList<TErroValidacao>): Boolean;
begin
  Result := TSeloLivroBusiness.ValidarSolicitacaoSelo(
    vpSeloGrupoId,
    vpDataBase,
    vpQuantidadeSolicitada,
    vpListaErroValidacao);
end;

end.
