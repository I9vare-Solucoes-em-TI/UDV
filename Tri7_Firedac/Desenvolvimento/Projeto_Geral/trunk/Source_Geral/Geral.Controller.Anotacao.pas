unit Geral.Controller.Anotacao;

interface

uses
  Geral.Model.Anotacao,
  Data.DB;

type
  TAnotacaoController = class
  private
  public
    class function Excluir(
      const vpAnotacaoId: Integer): Integer;
  end;

implementation

{ TAnotacaoController }

class function TAnotacaoController.Excluir(
  const vpAnotacaoId: Integer): Integer;
begin
  Result := TAnotacaoBusiness.Excluir(vpAnotacaoId);
end;

end.
