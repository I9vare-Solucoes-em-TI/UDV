unit LoginAlteracao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, cxButtons, cxContainer, cxTextEdit, cxGroupBox,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinCaramel, dxSkinCoffee, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinOffice2007Black, Menus;

type
  TfrmLoginAlteracao = class(TForm)
    Panel2: TPanel;
    cxGroupBox12: TcxGroupBox;
    edtNovaSenha: TcxTextEdit;
    edtNovaSenhaConfirma: TcxTextEdit;
    Label3: TLabel;
    Label4: TLabel;
    btnConfirmar: TcxButton;
    btnCancelar: TcxButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtNovaSenhaConfirmaExit(Sender: TObject);
    procedure edtNovaSenhaConfirmaEnter(Sender: TObject);
    procedure edtNovaSenhaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    vlDiasExpiracaoSenha : Integer;
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
    ShowMessage('Esta tela não pode ser fechada com "ALT + F4"');
  end;
end;

procedure TfrmLoginAlteracao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action    := caFree;
  frmLoginAlteracao := nil;
end;

procedure TfrmLoginAlteracao.btnConfirmarClick(Sender: TObject);
var
  Sql : string;
begin
  if Trim(edtNovaSenha.Text) = '' then
  begin
    Application.MessageBox('Digite a nova senha !', 'Atenção', MB_OK + MB_ICONWARNING);
    edtNovaSenha.SetFocus;
    Abort;
  end;
  if Trim(edtNovaSenhaConfirma.Text) = '' then
  begin
    Application.MessageBox('Digite a confirmação da nova senha !', 'Atenção', MB_OK + MB_ICONWARNING);
    edtNovaSenhaConfirma.SetFocus;
    Abort;
  end;
  if edtNovaSenha.Text <> edtNovaSenhaConfirma.Text then
  begin
    Application.MessageBox('Senhas não conferem, digite novamente !', 'Atenção', MB_OK + MB_ICONWARNING);
    edtNovaSenha.SetFocus;
  end
  else
  begin
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
      Application.MessageBox(Pchar('Senha Invalida!' + #13#10 + 'A senha deve ter no mínimo 4 (quatro) caracteres!'), 'Atenção', MB_OK + MB_ICONERROR);
      edtNovaSenha.SetFocus;
    end
    else
    if Pos(LowerCase(edtNovaSenha.Text), 'abcdeasdfqwerzxcv1234567890321654987teste' + LowerCase(vgUsuarioNome) + LowerCase(vgLogin)) > 0 then
    begin
      Application.MessageBox(Pchar('Senha Invalida!' + #13#10 + 'Não é permitido utilizar senhas obvias!'), 'Atenção', MB_OK + MB_ICONERROR);
      edtNovaSenha.SetFocus;
    end
    else
    if Trim(vgSenhaAtual) = Trim(edtNovaSenha.Text) then
    begin
      Application.MessageBox(Pchar('Senha Invalida!' + #13#10 + 'Nova senha não pode ser igual a senha anterior'), 'Atenção', MB_OK + MB_ICONERROR);
      edtNovaSenha.SetFocus;
    end
    else
    if Pos(edtNovaSenha.Text, vgSenhaAnterior) > 0 then
    begin
      Application.MessageBox(Pchar('Senha Invalida!' + #13#10 + 'Esta senha ou semelhante já foi utilizada anteriormente!'), 'Atenção', MB_OK + MB_ICONERROR);
      edtNovaSenha.SetFocus;
    end;
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
  vlDiasExpiracaoSenha := dtmControles.BuscarConfig('PRINCIPAL','GERAL','DIAS_EXPIRACAO_SENHA','I');
end;

end.
