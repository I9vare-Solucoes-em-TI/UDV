unit Geral.View.Sel.Certificado.Eldos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.Menus, SBWinCertStorage,
  SBX509, SBCustomCertStorage, Vcl.StdCtrls, cxButtons, cxTextEdit,
  cxButtonEdit, cxRadioGroup, cxMaskEdit, cxDropDownEdit, cxGroupBox,
  Vcl.ExtCtrls, SBPDF, SBPDFSecurity, SBUtils, cxCheckBox;

type
  TfrmSelecionarCertificadoEldos = class(TForm)
    pnlFrame: TPanel;
    gbxCertificados: TcxGroupBox;
    Label4: TLabel;
    cbxCertificados: TcxComboBox;
    rbFileCert: TcxRadioButton;
    rbWindowsCert: TcxRadioButton;
    editCert: TcxButtonEdit;
    editCertPassword: TcxTextEdit;
    btnOK: TcxButton;
    btnCancel: TcxButton;
    WinCertStorage: TElWinCertStorage;
    PublicKeyHandler: TElPDFPublicKeySecurityHandler;
    OpenDialogCert: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure editCertPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
  private
    procedure PopularCertList;
    { Private declarations }

    function GetCertificado: TElX509Certificate;
    function ValidarSelecao: Boolean;
    function ValidarCertificado(const vpCertificado: TElX509Certificate): Boolean;
  public
    { Public declarations }
    class function SelecionarCertificadoEldos: TElX509Certificate;
  end;

//var
//  frmSelecionarCertificadoEldos: TfrmSelecionarCertificadoEldos;

implementation

{$R *.dfm}

uses
  Controles;

procedure TfrmSelecionarCertificadoEldos.btnOKClick(Sender: TObject);
begin
  if ValidarSelecao then
    ModalResult := mrOk;
end;

procedure TfrmSelecionarCertificadoEldos.editCertPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if OpenDialogCert.Execute then
    editCert.Text := OpenDialogCert.Filename;
end;

procedure TfrmSelecionarCertificadoEldos.FormCreate(Sender: TObject);
begin
  PopularCertList;
end;

function TfrmSelecionarCertificadoEldos.GetCertificado: TElX509Certificate;
var
  CertF: TFileStream;
  CertFormat: TSBCertFileFormat;
begin
  Result := nil;

  Result := TElX509Certificate.Create(nil);

  if rbFileCert.Checked then
  begin
    // loading certificate
    CertF := TFileStream.Create(editCert.Text, fmOpenRead or
      fmShareDenyWrite);
    try
      CertFormat := Result.DetectCertFileFormat(CertF);
      CertF.Position := 0;
      case CertFormat of
        cfDER:
          Result.LoadFromStream(CertF);
        cfPEM:
          Result.LoadFromStreamPEM(CertF, editCertPassword.Text);
        cfPFX:
          Result.LoadFromStreamPFX(CertF, editCertPassword.Text);
      else
        begin
          MessageDlg('Erro ao carregar o certificado!', mtError,
            [mbOk], 0);
          Exit;
        end;
      end;
    finally
      FreeAndNil(CertF);
    end;
  end
  else
  begin
    WinCertStorage.Certificates[cbxCertificados.ItemIndex].Clone(Result);
  end;
end;

procedure TfrmSelecionarCertificadoEldos.PopularCertList;
var
  i: Integer;
  Cert: TElX509Certificate;
begin
  rbWindowsCert.Enabled := WinCertStorage.Count > 0;
  rbWindowsCert.Checked := rbWindowsCert.Enabled;
  cbxCertificados.Properties.Items.Clear;
  for i := 0 to WinCertStorage.Count - 1 do
  begin
    Cert := WinCertStorage.Certificates[i];
    cbxCertificados.Properties.Items.Add
      ('Subject: ' + Cert.SubjectName.CommonName + ', Issuer: ' +
      Cert.IssuerName.CommonName);
  end;
end;


class function TfrmSelecionarCertificadoEldos.SelecionarCertificadoEldos: TElX509Certificate;
var
  vifrmSelecionarCertificadoEldos: TfrmSelecionarCertificadoEldos;
  viBuffer: Pointer;
begin
  Result := nil;

  vifrmSelecionarCertificadoEldos := TfrmSelecionarCertificadoEldos.Create(nil);
  try
    if vifrmSelecionarCertificadoEldos.ShowModal = mrOk then
    begin
      Result := vifrmSelecionarCertificadoEldos.GetCertificado;
      if not vifrmSelecionarCertificadoEldos.ValidarCertificado(Result) then
      begin
        FreeAndNil(Result);
        Abort;
      end;
    end;

  finally
    FreeAndNil(vifrmSelecionarCertificadoEldos);
  end;
end;

function TfrmSelecionarCertificadoEldos.ValidarSelecao: Boolean;
begin
  Result := True;
  if rbFileCert.Checked then
  begin
    if Trim(editCert.Text) = '' then
    begin
      Application.MessageBox('Arquivo do certificado deve ser informado!',
        'Atenção', mb_ok + MB_ICONWARNING);
      Result := false;
    end;
  end
  else if rbWindowsCert.Checked then
  begin
    if cbxCertificados.ItemIndex < 0 then
    begin
      Application.MessageBox('Certificado armazenado deve ser informado!',
        'Atenção', mb_ok + MB_ICONWARNING);
      Result := false;
    end;
  end;

end;

function TfrmSelecionarCertificadoEldos.ValidarCertificado(const vpCertificado: TElX509Certificate): Boolean;
begin
  Result := True;
   if Date > vpCertificado.ValidTo then
   begin
     Application.MessageBox('Certificado Vencido!', 'Atenção', mb_ok + MB_ICONWARNING);
     Result := False;
   end;
end;

end.
