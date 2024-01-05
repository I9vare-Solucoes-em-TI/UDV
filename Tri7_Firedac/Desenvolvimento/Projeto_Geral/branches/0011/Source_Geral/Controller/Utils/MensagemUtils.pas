unit MensagemUtils;

interface

type
  TMensagemUtils = class sealed
  private
    class function ExibirMensagem(
      const vpTexto: string;
      const vpTitulo: string;
      const vpFlags: Integer = 0): Integer; static;
  public
    class function ExibirMensagemPergunta(
      const vpTexto: string;
      const vpBotaoSimPadrao: Boolean = True): Boolean; static;

    class procedure ExibirMensagemAtencao(
      const vpTexto: string); static;

    class procedure ExibirMensagemErro(
      const vpTexto: string); static;

    class procedure ExibirMensagemInformacao(
      const vpTexto: string); static;
  end;

implementation

uses
  Winapi.Windows,
  Vcl.Forms,
  System.Math,
  BooleanHelper;

const
  CL_TITULO_MENSAGEM_PERGUNTA: string = 'Pergunta';
  CL_TITULO_MENSAGEM_ATENCAO: string = 'Atenção';
  CL_TITULO_MENSAGEM_ERRO: string = 'Erro';
  CL_TITULO_MENSAGEM_INFORMACAO: string = 'Informação';

  CL_ICONE_MENSAGEM_PERGUNTA: Integer = MB_ICONQUESTION;
  CL_ICONE_MENSAGEM_ATENCAO: Integer = MB_ICONWARNING;
  CL_ICONE_MENSAGEM_ERRO: Integer = MB_ICONERROR;
  CL_ICONE_MENSAGEM_INFORMACAO: Integer = MB_ICONINFORMATION;

  CL_SEGUNDO_BOTAO_PADRAO: Integer = MB_DEFBUTTON2;

  CL_BOTAO_SIM_NAO: Integer = MB_YESNO;
  CL_BOTAO_SIM_SELECIONADO: Integer = ID_YES;

{ TMensagemUtils }

class function TMensagemUtils.ExibirMensagem(
  const vpTexto: string;
  const vpTitulo: string;
  const vpFlags: Integer = 0): Integer;
begin
  Result := Application.MessageBox(PWideChar(vpTexto),
    PWideChar(vpTitulo), vpFlags);
end;

class procedure TMensagemUtils.ExibirMensagemAtencao(
  const vpTexto: string);
begin
  ExibirMensagem(vpTexto, CL_TITULO_MENSAGEM_ATENCAO,
    CL_ICONE_MENSAGEM_ATENCAO);
end;

class procedure TMensagemUtils.ExibirMensagemErro(
  const vpTexto: string);
begin
  ExibirMensagem(vpTexto, CL_TITULO_MENSAGEM_ERRO, CL_ICONE_MENSAGEM_ERRO);
end;

class procedure TMensagemUtils.ExibirMensagemInformacao(
  const vpTexto: string);
begin
  ExibirMensagem(vpTexto, CL_TITULO_MENSAGEM_INFORMACAO,
    CL_ICONE_MENSAGEM_INFORMACAO);
end;

class function TMensagemUtils.ExibirMensagemPergunta(
  const vpTexto: string;
  const vpBotaoSimPadrao: Boolean = True): Boolean;
begin
  Result := ExibirMensagem(vpTexto, CL_TITULO_MENSAGEM_PERGUNTA,
    CL_ICONE_MENSAGEM_PERGUNTA + CL_BOTAO_SIM_NAO +
    IfThen(vpBotaoSimPadrao.&Not,
      CL_SEGUNDO_BOTAO_PADRAO)) = CL_BOTAO_SIM_SELECIONADO;
end;

end.
