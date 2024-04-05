{* @hash       2b3a4f080d4b5e2a8e9e0d19eed146145d119703095919aaedf5e5e6a83c
 * @version    1.0.0.0
 * @unit       Geral.View.Sel.Certificado.Eldos.pas
 * @author     I9vare
 * @copyright  Copyright (c) 2013 I9vare Gestão e Soluções em TI. (https://www.i9vare.com)
 *}

unit Geral.View.Sel.Certificado.Eldos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.Menus, SBWinCertStorage,
  SBX509, SBTypes, SBCustomCertStorage, Vcl.StdCtrls, cxButtons, cxTextEdit,
  cxButtonEdit, cxRadioGroup, cxMaskEdit, cxDropDownEdit, cxGroupBox,
  Vcl.ExtCtrls, SBPDF, SBPDFSecurity, SBUtils, cxCheckBox, dxSkinsCore,
  dxSkinMcSkin, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, I9MemTable;

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

    function ValidarCertificadoUsuario(const vpCertificado: TElX509Certificate): Boolean;
    function BuildHexString(St: ByteArray): string;
  public
    { Public declarations }
    class function SelecionarCertificadoEldos: TElX509Certificate;
  end;

//var
//  frmSelecionarCertificadoEldos: TfrmSelecionarCertificadoEldos;

implementation

{$R *.dfm}

uses
  Geral.Model.Business.Spec.UsuarioPKI,
  Geral.Controller.Factory.Business.UsuarioPKI,
  MensagemUtils,
  Geral.Model.Sistema,
  Controles;


function TfrmSelecionarCertificadoEldos.BuildHexString(St : ByteArray) : string;
var i : integer;
begin
  Result:='';
  for I := 0 to Length(St) - 1 do
    Result := Result + IntToHex(St[i], 2) + ' ';
end;

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
    TElX509Certificate(cbxCertificados.ItemObject).Clone(Result);
  end;
end;

procedure TfrmSelecionarCertificadoEldos.PopularCertList;
var
  i: Integer;
  Cert: TElX509Certificate;
  viValidarCertificadoUsuario: Boolean;
  viCertificado: string;
begin
  (*
  { TODO : Usado somente no sistema da Tri7 }
  viValidarCertificadoUsuario := dtmControles.ConexaoDb.BuscarConfigValor(
    CI_COD_SISTEMA_CAIXA,
    'PRINCIPAL',
    'GERAL',
    'VALIDAR_CARREGAMENTO_CERTIFICADO_USUARIO'
  ) = 'S';

  if viValidarCertificadoUsuario then
  begin
    rbFileCert.Enabled := False;
    editCert.Enabled := False;
    editCertPassword.Enabled := False;
    rbWindowsCert.Enabled := True;
    rbWindowsCert.Checked := True;
  end
  else
  begin
    rbWindowsCert.Enabled := WinCertStorage.Count > 0;
    rbWindowsCert.Checked := rbWindowsCert.Enabled or viValidarCertificadoUsuario;
  end;

  cbxCertificados.Properties.Items.Clear;
  for i := 0 to WinCertStorage.Count - 1 do
  begin
    Cert := WinCertStorage.Certificates[i];

    if viValidarCertificadoUsuario and (not ValidarCertificadoUsuario(Cert)) then
      Continue;

    viCertificado := 'Subject: ' + Cert.SubjectName.CommonName +
      ', Issuer: ' + Cert.IssuerName.CommonName;

    cbxCertificados.Properties.Items.AddObject(viCertificado, Cert);
  end;
  *)
end;

class function TfrmSelecionarCertificadoEldos.SelecionarCertificadoEldos: TElX509Certificate;
var
  vifrmSelecionarCertificadoEldos: TfrmSelecionarCertificadoEldos;
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

function TfrmSelecionarCertificadoEldos.ValidarCertificadoUsuario(
  const vpCertificado: TElX509Certificate): Boolean;
var
  viSerialNumber: string;
  viUsuarioPKI_Business: IUsuarioPKI_Business;
begin
  viUsuarioPKI_Business := TUsuarioPKI_BusinessFactory.New.GetInstance;
  try
    viSerialNumber := BuildHexString(vpCertificado.SerialNumber).Replace(' ' , '');

    Result := viUsuarioPKI_Business.ValidarCadastroUsuario(
      viSerialNumber,
      vgUsuarioID.ToInteger);
  except
    on e: Exception do
    begin
      TMensagemUtils.ExibirMensagemAtencao(e.Message);
      Exit;
    end;
  end;

end;

end.
