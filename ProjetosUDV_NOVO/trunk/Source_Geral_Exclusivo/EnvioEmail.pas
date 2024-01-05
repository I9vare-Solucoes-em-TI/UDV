unit EnvioEmail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, Vcl.Menus, cxContainer, cxEdit, cxCheckBox,
  cxTextEdit, cxLabel, Vcl.OleCtrls, SHDocVw, Vcl.StdCtrls, cxButtons,
  Vcl.ExtCtrls, cxListBox, MSHTML, frxClass, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, I9MemTable,
  Geral.Model.Email.Destinatario, System.Generics.Collections;

type
  TfrmEnvioEmail = class(TForm)
    pnlEnvioEmail: TPanel;
    Panel2: TPanel;
    lbxAnexos: TcxListBox;
    Panel3: TPanel;
    Bevel1: TBevel;
    Image1: TImage;
    btnAnexar: TcxButton;
    bltLimpar: TcxButton;
    wbrEmail: TWebBrowser;
    Panel1: TPanel;
    cxLabel2: TcxLabel;
    edtAssunto: TcxTextEdit;
    OpenDialogAnexo: TOpenDialog;
    btnCancelar: TcxButton;
    PopupMenu1: TPopupMenu;
    ExcluirArquivo1: TMenuItem;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1enviar: TcxGridDBColumn;
    cxGridDBTableView1nome: TcxGridDBColumn;
    cxGridDBTableView1email: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    tblDestinatario: TI9MemTable;
    tblDestinatarioenviar: TBooleanField;
    tblDestinatarionome: TStringField;
    tblDestinatarioemail: TStringField;
    dtsDestinatario: TDataSource;
    procedure wbrEmailDocumentComplete(ASender: TObject; const pDisp: IDispatch;
      const URL: OleVariant);
    procedure ExcluirArquivo1Click(Sender: TObject);
    procedure btnAnexarClick(Sender: TObject);
    procedure Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bltLimparClick(Sender: TObject);
  private
    { Private declarations }
    procedure WB_SaveAs_HTML(WB: TWebBrowser; const FileName: string);

    procedure CarregarDestinatario(const vpEmailList: TObjectList<TEmailDestinatario>);

    function GetFileCorpoEmail: string;
    procedure SaveFileCorpoEmail(const vpBody: string);

    const
      C_BODY_EMAIL = 'c:\Temp\Body.html';
  public
    { Public declarations }
    class function EnvioEmail(
      const vpEmailList: TObjectList<TEmailDestinatario>;
      const vpAssunto: string;
      const vpBodyHtml: string;
      const vpAnexo: TList<string>): Boolean;
  end;

//var
//  frmEnvioEmail: TfrmEnvioEmail;

implementation

uses
  Geral.Model.Entity.Spec.List,
  Geral.Model.Entity.Impl.Factory.List,
  Geral.Model.Email,
  Atualizacao,
  Controles,
  Rotinas;

{$R *.dfm}

function GetIEHandle(WebBrowser: TWebbrowser; ClassName: string): HWND;
var
  hwndChild, hwndTmp: HWND;
  oleCtrl: TOleControl;
  szClass: array [0..255] of char;
begin
  oleCtrl :=WebBrowser;
  hwndTmp := oleCtrl.Handle;
  while (true) do
  begin
    hwndChild := GetWindow(hwndTmp, GW_CHILD);
    GetClassName(hwndChild, szClass, SizeOf(szClass));
  if (string(szClass)=ClassName) then
  begin
    Result :=hwndChild;
    Exit;
  end;
    hwndTmp := hwndChild;
  end;
  Result := 0;
end;

procedure TfrmEnvioEmail.bltLimparClick(Sender: TObject);
begin
  lbxAnexos.Clear;
end;

procedure TfrmEnvioEmail.btnAnexarClick(Sender: TObject);
begin
  if OpenDialogAnexo.Execute then
    lbxAnexos.Items.Add(OpenDialogAnexo.FileName);
end;

procedure TfrmEnvioEmail.CarregarDestinatario(
  const vpEmailList: TObjectList<TEmailDestinatario>);
var
  viEmail: TEmailDestinatario;
begin
  tblDestinatario.Close;
  tblDestinatario.Open;

  if vpEmailList = nil then
    Exit;

  if vpEmailList.Count = 0 then
    Exit;

  for viEmail in vpEmailList do
  begin
    tblDestinatario.Append;
    tblDestinatarioenviar.AsBoolean := False;
    tblDestinatarionome.AsString    := viEmail.Nome;
    tblDestinatarioemail.AsString   := viEmail.Email;
    tblDestinatario.Post;
  end;
end;

procedure TfrmEnvioEmail.Click(Sender: TObject);
var
  viEmail: TEmailEnvio;
  viAnexo: IList<string>;
  i: Integer;
  viBodyFile: string;
  viFrmAtualizacao: TfrmAtualizacao;
begin
  viEmail := nil;
  viFrmAtualizacao := nil;
  tblDestinatario.Filtered := False;
  tblDestinatario.DisableControls;

  try
    tblDestinatario.Filter := 'enviar=True';
    tblDestinatario.Filtered := True;

    if tblDestinatario.IsEmpty then
    begin
      Application.MessageBox('Nenhum destinatário selecionado!', 'Atenção', MB_OK + MB_ICONWARNING);
      Exit;
    end;

    viFrmAtualizacao := TfrmAtualizacao.Create(nil);
    viFrmAtualizacao.lblTexto.Caption := 'Enviado e-mail(s) aguarde...';
    viFrmAtualizacao.Show;
    Application.ProcessMessages;

    viAnexo := TListFactory<string>.New.GetInstance;
    for i := 0 to lbxAnexos.Count - 1 do
      viAnexo.Add(lbxAnexos.Items.Strings[i]);

    viBodyFile := GetFileCorpoEmail;

    viEmail := TEmailEnvio.Create;
    tblDestinatario.First;
    while not tblDestinatario.Eof do
    begin
      //Enviar E-mail
      viEmail.EnviarEmail(tblDestinatarioemail.AsString,
        edtAssunto.Text,
        viBodyFile,
        viAnexo);

      tblDestinatario.Next;
    end;

    ModalResult := mrOk;
  finally
    tblDestinatario.Filtered := False;
    tblDestinatario.EnableControls;

    FreeAndNil(viEmail);
    FreeAndNil(viFrmAtualizacao);
  end;

end;

class function TfrmEnvioEmail.EnvioEmail(
  const vpEmailList: TObjectList<TEmailDestinatario>;
  const vpAssunto: string;
  const vpBodyHtml: string;
  const vpAnexo: TList<string>): Boolean;
var
  viFrmEnvioEmail: TfrmEnvioEmail;
  viAnexo: string;
begin
  Result := False;
  viFrmEnvioEmail := Self.Create(Application);
  try
    viFrmEnvioEmail.SaveFileCorpoEmail(vpBodyHtml);

    viFrmEnvioEmail.CarregarDestinatario(vpEmailList);
    viFrmEnvioEmail.edtAssunto.Text := vpAssunto;
    viFrmEnvioEmail.wbrEmail.Navigate(C_BODY_EMAIL);

    for viAnexo in vpAnexo do
      viFrmEnvioEmail.lbxAnexos.Items.Add(viAnexo);

    if viFrmEnvioEmail.ShowModal = mrOk then
      Result := True;

  finally
    viFrmEnvioEmail.Release;
  end;

end;

procedure TfrmEnvioEmail.ExcluirArquivo1Click(Sender: TObject);
begin
  if lbxAnexos.ItemIndex = -1 then
  begin
    ShowMessage('Nenhum anexo selecionado!');
    Exit;
  end;

  if Application.MessageBox('Deseja excluir este anexo?', 'Atenção', MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    DeleteFile(lbxAnexos.Items.Strings[lbxAnexos.ItemIndex]);
    lbxAnexos.DeleteSelected;
  end;
end;

procedure TfrmEnvioEmail.FormCreate(Sender: TObject);
begin
  if not DirectoryExists('c:\Temp') then
    ForceDirectories('c:\Temp');
end;

function TfrmEnvioEmail.GetFileCorpoEmail: string;
var
  viBody: TStringList;
begin
  viBody := TStringList.Create;
  try
    WB_SaveAs_HTML(wbrEmail,C_BODY_EMAIL);

    viBody.LoadFromFile(C_BODY_EMAIL);

    Result := C_BODY_EMAIL;
  finally
    FreeAndNil(viBody);
  end;
end;

procedure TfrmEnvioEmail.SaveFileCorpoEmail(const vpBody: string);
var
  viBody: TStringList;
begin
  viBody := TStringList.Create;
  try
    viBody.Text := vpBody;
    viBody.SaveToFile(C_BODY_EMAIL);

  finally
    FreeAndNil(viBody);
  end;
end;

procedure TfrmEnvioEmail.wbrEmailDocumentComplete(ASender: TObject;
  const pDisp: IDispatch; const URL: OleVariant);
begin
  ((ASender as TWebBrowser).Document as IHTMLDocument2).designMode := 'on';
end;

procedure TfrmEnvioEmail.WB_SaveAs_HTML(WB: TWebBrowser; const FileName: string);
var
  myHTML: string;
  strm: TStringStream;
begin
  try
    myHTML := WB.OleObject.Document.documentElement.innerHTML;
    strm := TStringStream.Create(myHTML);
    strm.SaveToFile(FileName);
  finally
    FreeAndNil(strm);
  end;
end;

end.
