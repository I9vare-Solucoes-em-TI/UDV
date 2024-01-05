unit FrameAssinaturaDigital;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, cxButtons,
  cxTextEdit, cxButtonEdit, cxRadioGroup, cxMaskEdit, cxDropDownEdit,
  cxControls, cxContainer, cxEdit, cxGroupBox, ExtCtrls, SBWinCertStorage,
  SBPDF, SBPDFSecurity, SBX509, SBCustomCertStorage, SBUtils, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, UITypes, dxSkinCoffee, dxSkiniMaginary;

type
  TfmeAssinaturaDigital = class(TFrame)
    pnlFrame: TPanel;
    Document: TElPDFDocument;
    CertStorage: TElMemoryCertStorage;
    PublicKeyHandler: TElPDFPublicKeySecurityHandler;
    WinCertStorage: TElWinCertStorage;
    Label6: TLabel;
    gbxCertificados: TcxGroupBox;
    Label4: TLabel;
    cbxCertificados: TcxComboBox;
    rbFileCert: TcxRadioButton;
    rbWindowsCert: TcxRadioButton;
    editCert: TcxButtonEdit;
    editCertPassword: TcxTextEdit;
    btnOK: TcxButton;
    OpenDialogCert: TOpenDialog;
    btnCancel: TcxButton;
    procedure editCertPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure pnlFrameClick(Sender: TObject);
  private
    vlAuthorName, vlReason, vlLocation: String;
    vlOffsetX, vlOffsety, vlWidth, vlHeight, vlImgWidth, vlImgHeight: Integer;
    vlFontSize: Double;
    vlBackground: Boolean;

    function MultiByteToUTF8(const Str: string): string;
    { Private declarations }
  public
    { Public declarations }
    procedure ParamentrosAssinatura;
    procedure PopularCertList;
    procedure AssinarDoc(vpArquivo: String);
    function ValidarCertificado: Boolean;
  end;

implementation

uses Controles;

{$R *.dfm}
{ TFrame1 }

function TfmeAssinaturaDigital.MultiByteToUTF8(const Str: string): string;
var
  WStr: WideString;
  Size, Sz: Integer;
begin
  Result := '';
  Size := Length(Str);
  if Size <= 0 then
    Exit;

  SetLength(WStr, Size);
  Sz := MultiByteToWideChar(CP_ACP, 0, @Str[1], Size, @WStr[1], Size);
  SetLength(WStr, Sz);
  Size := Length(WStr);
  if Size <= 0 then
    Exit;

  Sz := WideCharToMultiByte(CP_UTF8, 0, @WStr[1], Size, nil, 0, nil, nil);
  SetLength(Result, Sz);
  Sz := WideCharToMultiByte(CP_UTF8, 0, @WStr[1], Size, @Result[1],
    Length(Result), nil, nil);
  SetLength(Result, Sz);
end;

// Assina documentos PDF
procedure TfmeAssinaturaDigital.AssinarDoc(vpArquivo: String);
var
  Success: Boolean;
  F, CertF: TFileStream;
  Index: Integer;
  Sig: TElPDFSignature;
  Cert: TElX509Certificate;
  CertFormat: TSBCertFileFormat;
  ImageF: File;
  buf: Array of Byte;
begin
  // opening the temporary file
  Success := false;
  F := TFileStream.Create(vpArquivo, fmOpenReadWrite or fmShareDenyWrite);
  try
    try
      // opening the document
      Document.Open(F);
      try
        // checking if the document is already encrypted
        if Document.Encrypted then
        begin
          MessageDlg('Documento encrypted, n�o pode ser assinado! ', mtError,
            [mbOk], 0);
          Exit;
        end;

        Index := Document.AddSignature;
        Sig := Document.Signatures[Index];
        Sig.Handler := PublicKeyHandler;
        Sig.AuthorName := MultiByteToUTF8(vlAuthorName);
        Sig.SigningTime := LocalTimeToUTCTime(Now);
        Sig.Reason := MultiByteToUTF8(vlReason);
        Sig.Location := MultiByteToUTF8(vlLocation);

        // configuring signature type
        Sig.SignatureType := stDocument;
        Sig.Invisible := false; // Exibe a assinatura no documento

        Sig.WidgetProps.ShowOnAllPages := True;
        // Exibir assinatura em todas as p�ginas
        Sig.WidgetProps.AutoText := True;
        Sig.WidgetProps.AutoSize := false;
        Sig.WidgetProps.AutoPos := false;
        Sig.WidgetProps.AutoFontSize := false;

        Sig.WidgetProps.OffsetX := vlOffsetX; // Posi��o borda esqueda da p�gina
        Sig.WidgetProps.Offsety := vlOffsety;
        // Pisi��o borda inferior da p�gina
        Sig.WidgetProps.Width := vlWidth; // Largura da Assinatura
        Sig.WidgetProps.Height := vlHeight; // Altura da Assinatura

        // Exibir imagem de fundo na assinatura
        if vlBackground then
        begin
          // Salva imagem de fundo como um Array de Byte
          AssignFile(ImageF, 'C:\TEMP\LOGO.JP2');
          Reset(ImageF, 1);
          SetLength(buf, FileSize(ImageF));
          BlockRead(ImageF, buf[0], Length(buf));
          CloseFile(ImageF);

          // Seta as propriedades da imagem de fundo
          Sig.WidgetProps.AutoStretchBackground := false;
          Sig.WidgetProps.BackgroundStyle := pbsCustom;
          Sig.WidgetProps.Background.ImageType := pitJPEG2000;
          { **************************Aten��o************************************
            Tamanho informado para a imagem tem que ser o tamanho real da mesma,
            caso n�o seja pode dar problema na impress�o do arquivo }
          Sig.WidgetProps.Background.Width := vlImgWidth;
          // Largura da Imagem de fundo
          Sig.WidgetProps.Background.Height := vlImgHeight;
          // Altura da Imagem de fundo
          Sig.WidgetProps.Background.Data := @buf;
        end;
        // Tamanho da fonte dos texto da assinatura (1 a 9) podendo ter decimais
        Sig.WidgetProps.TitleFontSize := vlFontSize;
        Sig.WidgetProps.TimestampFontSize := vlFontSize;
        Sig.WidgetProps.SectionTitleFontSize := vlFontSize;
        Sig.WidgetProps.SectionTextFontSize := vlFontSize;

        // retrieving signing certificate
        CertStorage.Clear;
        PublicKeyHandler.SignatureType := pstPKCS7SHA1;

        if rbFileCert.Checked then
        begin
          Cert := TElX509Certificate.Create(nil);
          try
            // loading certificate
            CertF := TFileStream.Create(editCert.Text, fmOpenRead or
              fmShareDenyWrite);
            try
              CertFormat := Cert.DetectCertFileFormat(CertF);
              CertF.Position := 0;
              case CertFormat of
                cfDER:
                  Cert.LoadFromStream(CertF);
                cfPEM:
                  Cert.LoadFromStreamPEM(CertF, editCertPassword.Text);
                cfPFX:
                  Cert.LoadFromStreamPFX(CertF, editCertPassword.Text);
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
            CertStorage.Add(Cert);
          finally
            Cert.Free;
          end;
        end
        else
        begin
          Cert := WinCertStorage.Certificates[cbxCertificados.ItemIndex];
          CertStorage.Add(Cert);
          PublicKeyHandler.SignatureType := pstPKCS7SHA1;
        end;

        PublicKeyHandler.CertStorage := CertStorage;
        PublicKeyHandler.CustomName := 'Adobe.PPKMS';

        // allowing to save the document
        Success := True;
      finally
        // closing the document
        Document.Close(Success);
      end;
    finally
      FreeAndNil(F);
    end;
  except
    on E: Exception do
    begin
      MessageDlg('Erro: ' + E.Message, mtError, [mbOk], 0);
    end;
  end;
end;

procedure TfmeAssinaturaDigital.editCertPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  if OpenDialogCert.Execute then
    editCert.Text := OpenDialogCert.Filename;
end;

// Carrega os par�metros de configura��o da assinatura
procedure TfmeAssinaturaDigital.ParamentrosAssinatura;
var
  viCaminhoLogo: String;
begin
  // Dados da Assinatura
  vlAuthorName := dtmControles.BuscarConfig('PRINCIPAL', 'ASSINATURA',
    'ASSINATURA_AUTHORNAME', 'S');
  vlReason := dtmControles.BuscarConfig('PRINCIPAL', 'ASSINATURA',
    'ASSINATURA_REASON', 'W');
  vlLocation := dtmControles.BuscarConfig('PRINCIPAL', 'ASSINATURA',
    'ASSINATURA_LOCATION', 'S');
  vlFontSize := dtmControles.BuscarConfig('PRINCIPAL', 'ASSINATURA',
    'ASSINATURA_FONTSIZE', 'D');
  // Par�metros da Imagem de fundo
  vlOffsetX := dtmControles.BuscarConfig('PRINCIPAL', 'ASSINATURA',
    'ASSINATURA_OFFSETX', 'I');
  vlOffsety := dtmControles.BuscarConfig('PRINCIPAL', 'ASSINATURA',
    'ASSINATURA_OFFSETY', 'I');
  vlWidth := dtmControles.BuscarConfig('PRINCIPAL', 'ASSINATURA',
    'ASSINATURA_ASSWIDTH', 'I');
  vlHeight := dtmControles.BuscarConfig('PRINCIPAL', 'ASSINATURA',
    'ASSINATURA_ASSHEIGHT', 'I');
  vlImgWidth := dtmControles.BuscarConfig('PRINCIPAL', 'ASSINATURA',
    'ASSINATURA_IMGWIDTH', 'I');
  vlImgHeight := dtmControles.BuscarConfig('PRINCIPAL', 'ASSINATURA',
    'ASSINATURA_IMGHEIGHT', 'I');
  vlBackground := dtmControles.BuscarConfig('PRINCIPAL', 'ASSINATURA',
    'ASSINATURA_BACKGROUND', 'S') = 'S';

  // Imagem de fundo da Assinatura
  viCaminhoLogo := dtmControles.BuscarConfig('IMAGEM', 'GERAL',
    'LOCAL_IMAGEM', 'S');
  viCaminhoLogo := viCaminhoLogo + '\LOGOASS\LOGO.JP2';
  if FileExists(viCaminhoLogo) then
    CopyFile(Pchar(viCaminhoLogo), Pchar('C:\TEMP\LOGO.JP2'), false);
end;

procedure TfmeAssinaturaDigital.pnlFrameClick(Sender: TObject);
begin

end;

// Carrega uma lista com certificados validos instalados
procedure TfmeAssinaturaDigital.PopularCertList;
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

function TfmeAssinaturaDigital.ValidarCertificado: Boolean;
begin
  Result := True;
  if rbFileCert.Checked then
  begin
    if Trim(editCert.Text) = '' then
    begin
      Application.MessageBox('Arquivo do certificado deve ser informado!',
        'Aten��o', mb_ok + MB_ICONWARNING);
      Result := false;
    end;
  end
  else if rbWindowsCert.Checked then
  begin
    if cbxCertificados.ItemIndex < 0 then
    begin
      Application.MessageBox('Certificado armazenado deve ser informado!',
        'Aten��o', mb_ok + MB_ICONWARNING);
      Result := false;
    end;
  end;
end;

initialization

SetLicenseKey('4BE765151657183BBC2BDA6321818EAEB925F57E04754452780965BF429BBE89' +
'A828686E8F5C355981F108E9DDA65CD3EE60D7A9E8641DAC77A434945EA56F0E' +
'98528504938F170BE5A798F44B3DD067174C9B662C20AC73B7AC7D9DFD412096' +
'63FB642F9DF6189771AFEBF1EB1076B5430DE6D0204A8012580087E1B31CF64C' +
'84D946A8927B444F22C897A8E2425EAF68C73F63F4A189BA57B6FC305454FD7B' +
'F9688A4FB16ABD7E892B0A88B3B7BAD0BD6714EA029739AFAFBF0829291B4905' +
'C42DC4A0F220319988BCF5378DD01D1BC76B680B6B55C00BF037762064AA120D' +
'E070AE7A54E760A6D0089A9EF31530BF8FFD8B15708B34DFF24A197C31295064');

end.
