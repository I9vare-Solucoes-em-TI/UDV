unit Ftp_Email;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, IdMessage, IdFTP, IdAntiFreezeBase,
  IdAntiFreeze, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdMessageClient, IdSMTP, cxLookAndFeelPainters, cxButtons, cxRadioGroup,
  IdPOP3;

type
  TfrmFtp_Email = class(TForm)
    Panel1: TPanel;
    Smtp: TIdSMTP;
    IdAntiFreeze1: TIdAntiFreeze;
    Ftp: TIdFTP;
    IdMessage: TIdMessage;
    lstFTP: TListBox;
    btnBaixar: TcxButton;
    rbtUm: TcxRadioButton;
    rbtTodos: TcxRadioButton;
    procedure FormShow(Sender: TObject);
    procedure btnBaixarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFtp_Email: TfrmFtp_Email;
  TipoFtp, PastaFtp: string; //E=Envio, R=Retorno
  vgStatusSistema, vgUsarProxy, vgNomeHost, vgPortaProxy, vgUsuarioProxy, vgSenhaProxy : String;

procedure EnviarArquivo(vNomeArquivo, vTipoArquivo: string; vConvenio: string = ''); //E=Envio R=Retorno
procedure BaixarArquivo(vNomeBaixar, vTipoArquivo: string);
procedure EnviarEmail(const vEmailOrigem, vAssunto, vMensagem: String; var vEmailDestino: string; vEmailCC: string = '');
procedure AtualizarLista;

implementation

{$R *.dfm}

procedure EnviarEmail(const vEmailOrigem, vAssunto, vMensagem: String; var vEmailDestino: string; vEmailCC: string = '');
begin
  Screen.Cursor := crSQLWait;
  // Cria o objeto mensagem
  if (vEmailDestino <> '')  then
  begin
    // Define os parâmetros da mensagem
    frmFtp_Email.IdMessage.ContentType := 'text/HTML';
    frmFtp_Email.IdMessage.Recipients.EMailAddresses := vEmailDestino;
    frmFtp_Email.IdMessage.CCList.EMailAddresses := vEmailCC;
    frmFtp_Email.IdMessage.From.Text := vEmailOrigem;
    frmFtp_Email.IdMessage.Subject   := vAssunto;
    frmFtp_Email.IdMessage.Body.Text := vMensagem;

    with frmFtp_Email.Smtp do
    begin
      // Define os parâmetros de autenticação se o seu provedor requer.
      Host     := 'mail.serenity.inf.br';
      UserName := 'caucaia@serenity.inf.br';
      PassWord := 'spdc';
      // Faz a conexão com o servidor e envia a mensagem
      try
        Connect;
        Send(frmFtp_Email.IdMessage);
        ShowMessage('Mensagem Enviada com sucesso');
      finally
        Disconnect;
      end;
    end;
  end;
  Screen.Cursor := crDefault;
end;

procedure BaixarArquivo(vNomeBaixar, vTipoArquivo: string);
var
  vArquivoBaixar: string;
  i: integer;
begin
  Screen.Cursor := crSQLWait;
  try
    if vNomeBaixar = 'Todos' then
    begin
      for i := 2 to frmFtp_Email.lstFTP.Count - 1 do
      begin
        if vTipoArquivo = 'R' then
          vArquivoBaixar := '/Convenio/Retorno/'+FormatFloat('0000',StrToInt(PastaFtp))+'/'+frmFtp_Email.lstFTP.Items.Strings[i]
        else
          vArquivoBaixar := '/Convenio/Envio/'+frmFtp_Email.lstFTP.Items.Strings[i];
        frmFtp_Email.Ftp.Get(vArquivoBaixar,'C:\TEMP\'+frmFtp_Email.lstFTP.Items.Strings[i], False);
        frmFtp_Email.Ftp.Delete(vArquivoBaixar);
      end;
    end
    else
    begin
      if vTipoArquivo = 'R' then
        vArquivoBaixar := '/Convenio/Retorno/'+FormatFloat('0000',StrToInt(PastaFtp))+'/'+vNomeBaixar
      else
        vArquivoBaixar := '/Convenio/Envio/'+vNomeBaixar;
      frmFtp_Email.Ftp.Get(vArquivoBaixar,'C:\TEMP\'+vNomeBaixar , False);
      frmFtp_Email.Ftp.Delete(vArquivoBaixar);
    end;
    AtualizarLista;
    ShowMessage('Arquivo(s) Baixado com Sucesso!');
  except
    ShowMessage('Falha ao baixar Arquivo!');
    Screen.Cursor := crDefault;
  end;
  Screen.Cursor := crDefault;
end;

procedure EnviarArquivo(vNomeArquivo, vTipoArquivo: string; vConvenio: string = ''); //E=Envio R=Retorno
begin
  Screen.Cursor := crSQLWait;
  try
    frmFtp_Email.Ftp.Disconnect;

    if vgUsarProxy = 'S' then
    begin
      frmFtp_Email.Ftp.ProxySettings.Host     := vgNomeHost;
      frmFtp_Email.Ftp.ProxySettings.Password := vgSenhaProxy;
      frmFtp_Email.Ftp.ProxySettings.Port     := StrToInt(vgPortaProxy);
      frmFtp_Email.Ftp.ProxySettings.UserName := vgUsuarioProxy;
    end;

    frmFtp_Email.Ftp.Connect;
    if vTipoArquivo = 'R' then
      frmFtp_Email.Ftp.Put(vNomeArquivo, '/Convenio/Retorno/'+ FormatFloat('0000',StrToInt(vConvenio)) +'/'+Copy(vNomeArquivo,9,Length(vNomeArquivo)-8), False)
    else
      frmFtp_Email.Ftp.Put(vNomeArquivo, '/Convenio/Envio/'+ Copy(vNomeArquivo,9,Length(vNomeArquivo)-8), False);
    ShowMessage('Arquivo Enviado com Sucesso!');
  except
    ShowMessage('Falha no Envio do Arquivo!');
    Screen.Cursor := crDefault;
    Abort;
  end;
  Screen.Cursor := crDefault;
end;

procedure TfrmFtp_Email.FormShow(Sender: TObject);
begin
  AtualizarLista;
end;

procedure AtualizarLista;
begin
  try
  frmFtp_Email.Ftp.Disconnect;
  frmFtp_Email.Ftp.Connect;
  if TipoFtp = 'R' then
    frmFtp_Email.Ftp.List(frmFtp_Email.lstFtp.Items,'/Convenio/Retorno/'+FormatFloat('0000',StrToInt(PastaFtp))+'/', False)
  else
    frmFtp_Email.Ftp.List(frmFtp_Email.lstFtp.Items,'/Convenio/Envio/', False);
  Except
    Application.MessageBox(PChar('Não foi possivel efetuar a conexão!' + #13#10 +
                          'Verifique a sua conexão com a internet e tente novamente.'), 'Atenção', MB_OK + MB_ICONWARNING);
  end;
end;
procedure TfrmFtp_Email.btnBaixarClick(Sender: TObject);
begin
  try
    if rbtUm.Checked then
      BaixarArquivo(lstFTP.Items.Strings[lstFTP.ItemIndex],TipoFtp)
    else
      BaixarArquivo('Todos',TipoFtp);
  Except
     ShowMessage('Falha ao tentar baixar o(s) arquivo(s)!');
  end;

end;

end.
