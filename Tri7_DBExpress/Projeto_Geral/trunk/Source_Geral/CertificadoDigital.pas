unit CertificadoDigital;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FrameAssinaturaDigital,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, Vcl.Menus, SBWinCertStorage, SBX509, SBCustomCertStorage, Vcl.StdCtrls,
  cxDropDownEdit, cxGroupBox, Vcl.ExtCtrls, SBConstants,
  {$ifndef CRYPTOBLACKBOX}
  SBHTTPTSPClient,
  SBHTTPSClient,
  {$endif}
  cxButtons, cxLabel, dxGDIPlusClasses, SBMessages, cxTextEdit, cxMaskEdit;

type
  TfrmCertificadoDigital = class(TForm)
    CertStorage: TElMemoryCertStorage;
    WinCertStorage: TElWinCertStorage;
    ElMessageSigner1: TElMessageSigner;
    pnlFrame: TPanel;
    btnConfirmarItem: TcxButton;
    btnCancelar: TcxButton;
    gbxTabelas: TcxGroupBox;
    cbxCertificados: TcxComboBox;
    Shape1: TShape;
    Panel4: TPanel;
    imgPagar: TImage;
    lblInformacaoCertidao: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarItemClick(Sender: TObject);
  private
    { Private declarations }
    procedure PopularCertList;
    procedure Sign;
  public
    { Public declarations }
    vlTextoParaAssinar: TStringList;
    vlLocalSaida: string;
    vlCancelar: Boolean;

    class procedure MontarCertificadoDigital(
      vpTexto: TStringList;
      vpLocalSaida: string);
  end;

var
  frmCertificadoDigital: TfrmCertificadoDigital;

implementation

uses
  Controles, Rotinas;

{$R *.dfm}

procedure TfrmCertificadoDigital.btnCancelarClick(Sender: TObject);
begin
  vlCancelar := True;
  Close;
end;

procedure TfrmCertificadoDigital.btnConfirmarItemClick(Sender: TObject);
begin
  if cbxCertificados.ItemIndex < 0 then
  begin
    Application.MessageBox('Para Continuar, Selecione um Certificado Digital!',
      'Aviso', MB_OK + MB_ICONEXCLAMATION);
    cbxCertificados.SetFocus;
    Exit;
  end;

  ElMessageSigner1.HashAlgorithm := SB_ALGORITHM_DGST_SHA256;
  ElMessageSigner1.SignatureType := mstPublicKey;
  Sign;
  Close;
end;

procedure TfrmCertificadoDigital.FormActivate(Sender: TObject);
begin
  cbxCertificados.SetFocus;
end;

procedure TfrmCertificadoDigital.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ElMessageSigner1.Destroy;
  CertStorage.Destroy;
end;

class procedure TfrmCertificadoDigital.MontarCertificadoDigital(
  vpTexto: TStringList;
  vpLocalSaida: string);
begin
  frmCertificadoDigital.PopularCertList;
  frmCertificadoDigital.vlTextoParaAssinar := vpTexto;
  frmCertificadoDigital.vlLocalSaida       := vpLocalSaida;
end;

procedure TfrmCertificadoDigital.Sign;
{$REGION 'Variáveis'}
var
  i : Integer;
  j : Integer;
  Sz : Integer;
  viFile : file;
  InBuf, OutBuf : array of byte;
  viCaminhoArquivo: string;
{$ENDREGION}
begin
  try
    for i := 0 to vlTextoParaAssinar.Count -1 do
    begin
      viCaminhoArquivo := vlTextoParaAssinar.Strings[i];
      AssignFile(viFile, viCaminhoArquivo);
      Reset(viFile, 1);
      SetLength(InBuf, FileSize(viFile));
      BlockRead(viFile, InBuf[0], Length(InBuf));
      System.CloseFile(viFile);
      Sz := 0;
      ElMessageSigner1.Sign(@InBuf[0], Length(InBuf), nil, Sz);
      SetLength(OutBuf, Sz);

      j := ElMessageSigner1.Sign(@InBuf[0], Length(InBuf), @OutBuf[0], Sz);
      if j = 0 then
      begin
        SetLength(OutBuf, Sz);
        AssignFile(viFile, vlLocalSaida + RetornaNumerico(viCaminhoArquivo) + '.p7s');
        Rewrite(viFile, 1);
        BlockWrite(viFile, OutBuf[0], Sz);
        System.CloseFile(viFile);
      end
      else
      begin
        Application.MessageBox(Pchar('Ocorreu uma Falha Durante a Assinatura: ' + IntToHex(j, 4)),
          'Alerta', MB_OK + MB_ICONWARNING);
      end;
    end;
  except on E: Exception do
    begin
      Application.MessageBox(Pchar('Falha ao Assinar o Documento: ' +
        sLineBreak + viCaminhoArquivo + sLineBreak + E.Message),
        'Alerta', MB_OK + MB_ICONWARNING);
    end;
  end;
end;

// Carrega uma lista com certificados validos instalados
procedure TfrmCertificadoDigital.PopularCertList;
var
  i: Integer;
  Cert: TElX509Certificate;
begin
  cbxCertificados.Properties.Items.Clear;
  CertStorage.Clear;

  for i := 0 to WinCertStorage.Count - 1 do
  begin
    Cert := WinCertStorage.Certificates[i];
    CertStorage.Add(Cert);

    if Cert.ValidTo >= Date then
    begin
      cbxCertificados.Properties.Items.Add(Cert.SubjectName.CommonName +
        ', ' + Cert.IssuerName.CommonName +
        ', Validade: ' + DateToStr(Cert.ValidTo));
    end;
  end;
end;
end.

