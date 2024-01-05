unit Email;

interface

type
  TEmail = class
  public
     (**
       * EnviaMail - Envia e-mail
       * @author Bruno Santos Martins
       * @version 2019/05/17
       * @param vpEmail Email do remetente
       * @param vpUsuario Conta de email do remetente - No caso do hotmail deve usar o nome do usuario seguido de @hotmail.com
       * @param vpSenha Senha da conta de e-mail do remetente
       * @param vpAutentica Informa se irá autenticar
       * @param vpSmtp Servidor smtp. Ex: smtp.googlemail.com .. smtp.live.com .. smtp.mail.yahoo.com
       * @param vpAuthSSL
       * @param vpNome Nome do destinatário
       * @param vpPortaSmtp Porta de saída do e-mail. Ex: 465 gmail .. 25 hotmail
       * @param vpTexto Corpo do e-mail
       * @param vpDestinatario conta de e-mail do destinatário
       * @param vpAssunto Titúlo do e-mail
       * @param vpAnexo Anexo deste email
       * @return Informa se o e-mail foi enviado
       *)
     class function EnviarEMail(
        const vpEmailRemetente       : String;
        const vpUsuario              : String;
        const vpSenha                : String;
        const vpAutentica            : Boolean;
        const vpSmtp                 : String;
        vpAuthSSL                    : Boolean;
        const vpNome                 : String;
        const vpPortaSmtp            : Integer;
        const vpTexto                : String;
        const vpEmailDestinatario    : String;
        const vpAssunto              : String;
        const vpAnexo                : String;
        const vpExcluirAnexo         : Boolean;
        var vpMensagemResult         : String;
        const vpSolicitarConfirmacao : Boolean = False;
        const vpContentTypeHtml      : Boolean = False
     ): Boolean;

  end;

implementation

uses
  System.SysUtils,
  IdSSLOpenSSL,
  IdMessage,
  IdSMTP,
  IdText,
  IdAttachmentFile,
  IdExplicitTLSClientServerBase;

{ TEmail }

class function TEmail.EnviarEMail(
  const vpEmailRemetente       : String;
  const vpUsuario              : String;
  const vpSenha                : String;
  const vpAutentica            : Boolean;
  const vpSmtp                 : String;
  vpAuthSSL                    : Boolean;
  const vpNome                 : String;
  const vpPortaSmtp            : Integer;
  const vpTexto                : String;
  const vpEmailDestinatario    : String;
  const vpAssunto              : String;
  const vpAnexo                : String;
  const vpExcluirAnexo         : Boolean;
  var vpMensagemResult         : String;
  const vpSolicitarConfirmacao : Boolean = False;
  const vpContentTypeHtml      : Boolean = False
): Boolean;
var
  viAuthSSL  : TIdSSLIOHandlerSocketOpenSSL;
  viMensagem : TIdMessage;
  viCnxSMTP  : TIdSMTP;
begin
  // DLL's Utilizadas para envio de e-mail "libeay32.dll" e a "ssleay32.dll"
  Result := False;
  try
    viMensagem := TIdMessage.Create(nil);
    viCnxSMTP  := TIdSMTP.Create(nil);

    // Nome do Remetente
    viMensagem.From.Name := vpNome;
    viMensagem.From.Address := vpEmailRemetente;

    // E-mail do Remetente = email valido...
    viMensagem.Recipients.EMailAddresses := vpEmailDestinatario;

    // Confirmação de email - Solicita confirmação de leitura para o Destinatário
    if vpSolicitarConfirmacao then
      viMensagem.ReceiptRecipient.Address := vpEmailRemetente;

    // destinatario
    viMensagem.Priority := mpHighest;

    // Assunto do E-mail
    viMensagem.Subject := vpAssunto;

    viCnxSMTP.Host := vpSmtp;

    if Pos('gmail', vpEmailRemetente) > 0 then
      viCnxSMTP.Username := Copy(vpUsuario, 0, Pos('@', vpUsuario) - 1)
    else
      viCnxSMTP.Username := vpUsuario;

    viCnxSMTP.Password := vpSenha;

    if vpAutentica then
      viCnxSMTP.AuthType := satDefault
    else
      viCnxSMTP.AuthType := satNone;

    if Pos('yahoo', vpEmailRemetente) > 0 then
      vpAuthSSL := False;

    if vpAuthSSL then
    begin
      viAuthSSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
      viCnxSMTP.IOHandler := viAuthSSL;

      if (Pos('hotmail', vpEmailRemetente) > 0) or
         (Pos('gmail', vpEmailRemetente) > 0) then
        viCnxSMTP.UseTLS := utUseExplicitTLS
      else
        viCnxSMTP.UseTLS := utUseImplicitTLS;

      viAuthSSL.DefaultPort := vpPortaSmtp;
      viAuthSSL.SSLOptions.Method := sslvSSLv23;
      viAuthSSL.SSLOptions.Mode := sslmClient;
    end;

    viCnxSMTP.Port := vpPortaSmtp;

    if Trim(vpAnexo) <> '' then
    begin
      if FileExists(TFileName(vpAnexo)) then
        TIdAttachmentFile.Create(viMensagem.MessageParts, TFileName(vpAnexo))
      else
      begin
        Result := False;
        vpMensagemResult := 'Arquivo de anexo não foi localizado!';
        Exit;
      end;
    end;

    viMensagem.Body.Clear;

    with TIdText.Create(viMensagem.MessageParts, nil) do
    begin
      // here we include the text as plain text
      Body.Text := vpTexto;
      if vpContentTypeHtml then
      begin
        ContentType := 'text/html';
        CharSet := 'UTF-8';
      end
      else
        ContentType := 'text/plain';
    end;

    viCnxSMTP.UseEhlo := True;
    viCnxSMTP.UseVerp := False;
    viCnxSMTP.ReadTimeout := 10000;
    viCnxSMTP.Connect;
    sleep(1000);

    viCnxSMTP.Authenticate;
    sleep(1000);

    try
      if viCnxSMTP.Connected then
        viCnxSMTP.Send(viMensagem)
      else
      begin
        Result := False;
        vpMensagemResult := 'Mensagem não foi enviada.';
        Exit;
      end;

    except
      viCnxSMTP.Disconnect;
      viCnxSMTP.Host := vpSmtp; // smtp
      viCnxSMTP.AuthType := satNone;
      viCnxSMTP.Connect;

      try
        viCnxSMTP.Send(viMensagem);
      except
        Result := False;
        vpMensagemResult := 'Erro ao enviar o email para ' + vpEmailDestinatario + '. Verifique as configurações da conta!';
        Exit;
      end;

      viCnxSMTP.Disconnect;
    end;

    viCnxSMTP.Disconnect;

    if vpExcluirAnexo then
    begin
      if FileExists(vpAnexo) then
        DeleteFile(PChar(vpAnexo));
    end;

    Result := True;
    vpMensagemResult := 'E-Mail enviado para ' + vpEmailDestinatario;

  finally
    FreeAndNil(viMensagem);
    FreeAndNil(viCnxSMTP);

    if vpAuthSSL then
      FreeAndNil(viAuthSSL);
  end;
end;

end.
