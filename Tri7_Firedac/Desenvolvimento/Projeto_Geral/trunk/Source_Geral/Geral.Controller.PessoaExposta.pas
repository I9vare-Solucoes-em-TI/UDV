unit Geral.Controller.PessoaExposta;

interface

type
  TPessoaExpostaController = class
  public
    class function PessoaExposta(
      const vpCPF: string;
      const vpDataBase: TDateTime): Boolean;
  end;

implementation

uses
  Geral.Model.PessoaExposta;

{ TPessoaExpostaController }

class function TPessoaExpostaController.PessoaExposta(
  const vpCPF: string;
  const vpDataBase: TDateTime): Boolean;
begin
  Result := TPessoaExpostaBusiness.PessoaExposta(
    vpCPF,
    vpDataBase);
end;

end.
