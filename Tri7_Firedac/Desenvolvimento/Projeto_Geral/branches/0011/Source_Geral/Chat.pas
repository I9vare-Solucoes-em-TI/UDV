unit Chat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls,
  cxSplitter, StdCtrls, ExtCtrls, Menus, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxButtons, DB, DBClient, cxMemo, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters;

type
  TfrmChat = class(TForm)
    pnl7: TPanel;
    lbl9: TLabel;
    spl1: TcxSplitter;
    pnl5: TPanel;
    lstPara: TListBox;
    lstParaCodigo: TListBox;
    pnl2: TPanel;
    btnConfirmar: TcxButton;
    btnLimparHistorico: TcxButton;
    pnl6: TPanel;
    lbl13: TLabel;
    chbTodos: TCheckBox;
    lcxUsuarioChat: TcxLookupComboBox;
    btnAdcionarPara: TcxButton;
    btnExcluirUsuarioChat: TcxButton;
    spl2: TcxSplitter;
    pnl4: TPanel;
    lbl2: TLabel;
    edtNovaMensagem: TcxMemo;
    edtChat: TcxMemo;
    procedure btnAdcionarParaClick(Sender: TObject);
    procedure btnExcluirUsuarioChatClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparHistoricoClick(Sender: TObject);
    procedure chbTodosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChat: TfrmChat;

implementation

uses Controles, Lookup, dmChat;

{$R *.dfm}

procedure TfrmChat.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmChat.btnAdcionarParaClick(Sender: TObject);
begin
  if lcxUsuarioChat.EditValue <> Null then
  begin
    if Pos(FormatFloat('00000000',lcxUsuarioChat.EditValue),lstParaCodigo.Items.Text) = 0 then
    begin
      lstPara.Items.Add(lcxUsuarioChat.EditText);
      lstParaCodigo.Items.Add(FormatFloat('00000000',lcxUsuarioChat.EditValue));
    end;
  end;
end;

procedure TfrmChat.btnConfirmarClick(Sender: TObject);
begin
  if Trim(edtNovaMensagem.Text) = '' then
  begin
    Application.MessageBox('Texto da Mensagem n�o pode ser vazia.', 'Aten��o!', MB_ICONEXCLAMATION + MB_OK);
    Exit;
  end;

  dtmChat.EnviarMensagem;

  edtNovaMensagem.Clear;
  edtNovaMensagem.SetFocus;
end;

procedure TfrmChat.btnExcluirUsuarioChatClick(Sender: TObject);
var
  vIndice: integer;
begin
  if lstPara.Items.Count > 0 then
  begin
    vIndice := lstPara.ItemIndex;
    lstPara.Items.Delete(vIndice);
    lstParaCodigo.Items.Delete(vIndice);
  end;
end;

procedure TfrmChat.btnLimparHistoricoClick(Sender: TObject);
begin
  if chbTodos.Checked = True then
  begin
    lcxUsuarioChat.Enabled := True;
    chbTodos.Checked := False;
  end;
  edtNovaMensagem.Clear;
  edtNovaMensagem.SetFocus;
  lcxUsuarioChat.Clear;
  edtChat.Clear;
  lstPara.Clear;
  lstParaCodigo.Clear;
end;

procedure TfrmChat.chbTodosClick(Sender: TObject);
begin
  if chbTodos.Checked = True then
  begin
    lcxUsuarioChat.Enabled := False;
    lcxUsuarioChat.Clear;
    lstPara.Clear;
    lstParaCodigo.Clear;
  end
  else
    lcxUsuarioChat.Enabled := True;
end;

procedure TfrmChat.FormActivate(Sender: TObject);
begin
  edtNovaMensagem.Clear; 
  edtNovaMensagem.SetFocus;
end;

procedure TfrmChat.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmChat := nil;
end;

procedure TfrmChat.FormCreate(Sender: TObject);
begin
  edtChat.Clear;
end;

procedure TfrmChat.FormShow(Sender: TObject);
begin
  lcxUsuarioChat.RepositoryItem := dtmLookup.Lista_UsuarioSistema;
end;

end.
