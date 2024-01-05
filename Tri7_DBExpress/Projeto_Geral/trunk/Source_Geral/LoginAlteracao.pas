unit LoginAlteracao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, cxButtons, cxContainer, cxTextEdit, cxGroupBox,
  cxControls, cxEdit,
  Menus, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxLabel;

type
  TfrmLoginAlteracao = class(TForm)
    Panel2: TPanel;
    cxGroupBox12: TcxGroupBox;
    edtNovaSenha: TcxTextEdit;
    edtNovaSenhaConfirma: TcxTextEdit;
    lblSenhaNova1: TLabel;
    lblSenhaNova2: TLabel;
    btnConfirmar: TcxButton;
    lblSenhaAtual: TLabel;
    edtSenhaAtual: TcxTextEdit;
    btnValidarSenha: TcxButton;
    Bevel1: TBevel;
    Panel1: TPanel;
    Bevel4: TBevel;
    lblInformaca: TcxLabel;
    Panel4: TPanel;
    imgTitulo: TImage;
    Panel7: TPanel;
    cxButton1: TcxButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtNovaSenhaConfirmaExit(Sender: TObject);
    procedure edtNovaSenhaConfirmaEnter(Sender: TObject);
    procedure edtNovaSenhaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnValidarSenhaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtNovaSenhaConfirmaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSenhaAtualKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNovaSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    vlDiasExpiracaoSenha  : Integer;
    vlNivelSegurancaSenha : String;
    function GetControleSenhaAnterior : String;
  public
    { Public declarations }
    vgTrocarSenha, vgLogoff : Boolean;
  end;

var
  frmLoginAlteracao: TfrmLoginAlteracao;
  vgControleLogin : Boolean;

implementation

uses Controles;

{$R *.DFM}

procedure TfrmLoginAlteracao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssAlt]) and (Key = VK_F4) then
  begin
    Key := VK_Clear;
    ShowMessage('Esta tela n�o pode ser fechada com "ALT + F4"');
  end;
end;

procedure TfrmLoginAlteracao.FormActivate(Sender: TObject);
begin
  if vgControleLogin then
    btnValidarSenhaClick(self)
  else
    edtSenhaAtual.SetFocus;
end;

procedure TfrmLoginAlteracao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action    := caFree;
  frmLoginAlteracao := nil;
end;

procedure TfrmLoginAlteracao.btnConfirmarClick(Sender: TObject);
var
  Sql : string;

  procedure VerificarSegurancaSenha;
  var
    viNivel1, viNivel2, viNivel3 : Boolean;
    i : Integer;
  begin
    if vlNivelSegurancaSenha[1] in ['2', '3'] then
    begin
      viNivel1 := False; viNivel2 := False; viNivel3 := False;
      for i := 1 to Length(edtNovaSenha.Text) do
      begin
        if edtNovaSenha.Text[i] in ['A'..'Z'] then
          viNivel1 := True
        else
          if edtNovaSenha.Text[i] in ['0'..'9'] then
            viNivel2 := True;

        if (vlNivelSegurancaSenha = '3') and (edtNovaSenha.Text[i] in ['a'..'z']) then
          viNivel3 := True;
      end;

      if (vlNivelSegurancaSenha = '2') and ((not viNivel1) or (not viNivel2)) then
      begin
        Application.MessageBox('A Senha deve conter Letras e N�meros!', 'Aten��o', MB_OK + MB_ICONWARNING);
        edtNovaSenha.SetFocus;
        Abort;
      end;

      if (vlNivelSegurancaSenha = '3') and ((not viNivel1) or (not viNivel2) or (not viNivel3)) then
      begin
        Application.MessageBox('A Senha deve conter letras min�sculo, mai�sculo e n�meros!', 'Aten��o', MB_OK + MB_ICONWARNING);
        edtNovaSenha.SetFocus;
        Abort;
      end;
    end;
  end;

begin
  if Trim(edtNovaSenha.Text) = '' then
  begin
    Application.MessageBox('Digite a nova senha !', 'Aten��o', MB_OK + MB_ICONWARNING);
    edtNovaSenha.SetFocus;
    Abort;
  end;
  if Trim(edtNovaSenhaConfirma.Text) = '' then
  begin
    Application.MessageBox('Digite a confirma��o da nova senha !', 'Aten��o', MB_OK + MB_ICONWARNING);
    edtNovaSenhaConfirma.SetFocus;
    Abort;
  end;
  if edtNovaSenha.Text <> edtNovaSenhaConfirma.Text then
  begin
    Application.MessageBox('Senhas n�o conferem, digite novamente !', 'Aten��o', MB_OK + MB_ICONWARNING);
    edtNovaSenha.SetFocus;
  end
  else
  begin
    VerificarSegurancaSenha;

    Sql := ' UPDATE G_USUARIO SET SENHA = ' + QuotedStr(dtmControles.Cripto.TextToCriptoHex(edtNovaSenha.Text)) +
           ' ,TROCARSENHA = ' + QuotedStr('N') +
           ' ,SENHA_ANTERIOR = ' + QuotedStr(GetControleSenhaAnterior) +
           ' ,DATA_EXPIRACAO = ' + QuotedStr(FormatDateTime('YYYY/MM/DD',(dtmControles.DataHoraBanco(3) + vlDiasExpiracaoSenha))) +
           ' WHERE USUARIO_ID = ' + vgUsuarioID;
    dtmControles.ExecSQL(Sql);
    vgSenhaAtual  := edtNovaSenha.Text;
    Close;
  end;
end;

procedure TfrmLoginAlteracao.btnValidarSenhaClick(Sender: TObject);
var
  viSql, viSenha : String;
begin

  if not vgControleLogin then
  begin
    viSql   := ' SELECT SENHA FROM G_USUARIO '+
               ' WHERE LOGIN = '+QuotedStr(vgLogin)+
               '  AND SITUACAO = '+QuotedStr('A');

    viSenha := dtmControles.GetStr(viSql);
    viSenha := dtmControles.Cripto.CriptoHexToText(viSenha);
    if viSenha <> edtSenhaAtual.EditValue then
    begin
      Application.MessageBox(Pchar('Senha Atual Inv�lida!'), 'Aviso', MB_OK + MB_ICONEXCLAMATION);
      edtSenhaAtual.SetFocus;
      exit;
    end;
  end;

  edtSenhaAtual.Enabled   := False;
  btnValidarSenha.Enabled := False;
  lblSenhaAtual.Enabled   := False;

  lblSenhaNova1.Enabled         := True;
  lblSenhaNova2.Enabled         := True;
  edtNovaSenha.Enabled          := True;
  edtNovaSenhaConfirma.Enabled  := True;
  btnConfirmar.Enabled          := True;
  edtNovaSenha.SetFocus;
end;

procedure TfrmLoginAlteracao.btnCancelarClick(Sender: TObject);
begin
  if vgControleLogin then
    Application.Terminate
  else Close;
end;

procedure TfrmLoginAlteracao.edtNovaSenhaConfirmaExit(Sender: TObject);
begin
  btnConfirmar.Default := False;
end;

procedure TfrmLoginAlteracao.edtNovaSenhaConfirmaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
  begin
    btnConfirmar.SetFocus;
    btnConfirmarClick(self);
  end;
end;

procedure TfrmLoginAlteracao.edtNovaSenhaConfirmaEnter(Sender: TObject);
begin
  btnConfirmar.Default := True;
end;

procedure TfrmLoginAlteracao.edtNovaSenhaExit(Sender: TObject);
begin
  if (Trim(edtNovaSenha.Text) <> '') then
  begin
    if (Length(edtNovaSenha.Text) < 4) then
    begin
      Application.MessageBox(Pchar('Senha Invalida!' + #13#10 + 'A senha deve ter no m�nimo 4 (quatro) caracteres!'), 'Aten��o', MB_OK + MB_ICONERROR);
      edtNovaSenha.SetFocus;
    end
    else
    if Pos(LowerCase(edtNovaSenha.Text), 'abcdeasdfqwerzxcv1234567890321654987teste' + LowerCase(vgUsuarioNome) + LowerCase(vgLogin)) > 0 then
    begin
      Application.MessageBox(Pchar('Senha Invalida!' + #13#10 + 'N�o � permitido utilizar senhas obvias!'), 'Aten��o', MB_OK + MB_ICONERROR);
      edtNovaSenha.SetFocus;
    end
    else
    if Trim(vgSenhaAtual) = Trim(edtNovaSenha.Text) then
    begin
      Application.MessageBox(Pchar('Senha Invalida!' + #13#10 + 'Nova senha n�o pode ser igual a senha anterior'), 'Aten��o', MB_OK + MB_ICONERROR);
      edtNovaSenha.SetFocus;
    end
    else
    if Pos(edtNovaSenha.Text, vgSenhaAnterior) > 0 then
    begin
      Application.MessageBox(Pchar('Senha Invalida!' + #13#10 + 'Esta senha ou semelhante j� foi utilizada anteriormente!'), 'Aten��o', MB_OK + MB_ICONERROR);
      edtNovaSenha.SetFocus;
    end;
  end;
end;

procedure TfrmLoginAlteracao.edtNovaSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    edtNovaSenhaConfirma.SetFocus;
end;

procedure TfrmLoginAlteracao.edtSenhaAtualKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
  begin
    btnValidarSenha.SetFocus;
    btnValidarSenhaClick(self);
  end;
end;

function TfrmLoginAlteracao.GetControleSenhaAnterior : String;
var viTamanhoSenhaAnterior : Integer;
    viSenhas : String;
begin
  viSenhas := vgSenhaAnterior + vgSenhaAtual;
  Result := dtmControles.Cripto.TextToCriptoHex(viSenhas);
  viTamanhoSenhaAnterior := Length(Result);
  if viTamanhoSenhaAnterior > 120 then
  begin
    Delete(viSenhas, 1, Length(vgSenhaAtual));
    Result := dtmControles.Cripto.TextToCriptoHex(viSenhas);
  end;
end;

procedure TfrmLoginAlteracao.FormCreate(Sender: TObject);
begin
  vlDiasExpiracaoSenha  := dtmControles.BuscarConfig('PRINCIPAL','GERAL','DIAS_EXPIRACAO_SENHA','I');
  vlNivelSegurancaSenha := dtmControles.BuscarParametroOutroSistema('NIVEL_SENHA', 'SENHA','PRINCIPAL','5');

  if vlNivelSegurancaSenha = '3' then
  begin
    edtSenhaAtual.Properties.CharCase        := ecNormal;
    edtNovaSenha.Properties.CharCase         := ecNormal;
    edtNovaSenhaConfirma.Properties.CharCase := ecNormal;
  end;

end;

end.
