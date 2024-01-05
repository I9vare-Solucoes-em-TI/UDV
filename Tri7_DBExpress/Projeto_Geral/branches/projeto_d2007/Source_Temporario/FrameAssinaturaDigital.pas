unit FrameAssinaturaDigital;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxLookAndFeelPainters, cxGraphics, Menus, StdCtrls, cxButtons,
  cxTextEdit, cxButtonEdit, cxRadioGroup, cxMaskEdit, cxDropDownEdit,
  cxControls, cxContainer, cxEdit, cxGroupBox, ExtCtrls, SBWinCertStorage,
  SBPDF, SBPDFSecurity, SBX509, SBCustomCertStorage, SBUtils, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  cxLookAndFeels, dxSkinBlueprint, dxSkinDarkRoom, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinHighContrast, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013White, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSpringTime,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinDevExpressDarkStyle;

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
    OpenDialogCert: TOpenDialog;
    btnCancel: TcxButton;
    btnOK: TcxButton;
    procedure editCertPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    vlAuthorName,
    vlReason,
    vlLocation : String;
    vlOffsetX,
    vlOffsety,
    vlWidth,
    vlHeight,
    vlImgWidth,
    vlImgHeight : Integer;
    vlFontSize : Double;
    vlBackground : Boolean;

    function MultiByteToUTF8(const Str: string): string;
    { Private declarations }
  public
    { Public declarations }
    procedure ParamentrosAssinatura;
    procedure PopularCertList;
    procedure AssinarDoc(vpArquivo: String);
    function ValidarCertificado : Boolean;
  end;

implementation

uses Controles;

{$R *.dfm}

{ TFrame1 }

function TfmeAssinaturaDigital.MultiByteToUTF8(const Str: string): string;
var
  WStr: WideString;
  Size, Sz: integer;
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
  Sz := WideCharToMultiByte(CP_UTF8, 0, @WStr[1], Size, @Result[1], Length(Result),
    nil, nil);
  SetLength(Result, Sz);
end;

//Assina documentos PDF
procedure TfmeAssinaturaDigital.AssinarDoc(vpArquivo: String);
var
  Success : boolean;
  F, CertF : TFileStream;
  Index : integer;
  Sig : TElPDFSignature;
  Cert : TElX509Certificate;
  CertFormat : TSBCertFileFormat;
  ImageF : File;
  buf : ByteArray;
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
          MessageDlg('Documento encrypted, não pode ser assinado! ', mtError, [mbOk], 0);
          Exit;
        end;

        Index := Document.AddSignature;
        Sig := Document.Signatures[Index];
        Sig.Handler := PublicKeyHandler;
        Sig.AuthorName := MultiByteToUTF8(vlAuthorName);
        Sig.SigningTime := LocalTimeToUTCTime(Now);
        Sig.Reason   := MultiByteToUTF8(vlReason);
        Sig.Location := MultiByteToUTF8(vlLocation);

        //configuring signature type
        Sig.SignatureType := stDocument;
        Sig.Invisible := false;//Exibe a assinatura no documento

        sig.WidgetProps.ShowOnAllPages := True;//Exibir assinatura em todas as páginas
        sig.WidgetProps.AutoText := True;
        sig.WidgetProps.AutoSize := False;
        sig.WidgetProps.AutoPos  := False;
        sig.WidgetProps.AutoFontSize := False;

        Sig.WidgetProps.OffsetX := vlOffsetX; //Posição borda esqueda da página
        Sig.WidgetProps.Offsety := vlOffsety; //Pisição borda inferior da página
        sig.WidgetProps.Width   := vlWidth; //Largura da Assinatura
        sig.WidgetProps.Height  := vlHeight; //Altura da Assinatura

        //Exibir imagem de fundo na assinatura
        if vlBackground then
        begin
          //Salva imagem de fundo como um Array de Byte
          AssignFile(ImageF, 'C:\TEMP\LOGO.JP2');
          Reset(ImageF, 1);
          SetLength(Buf, FileSize(ImageF));
          BlockRead(ImageF, Buf[0], Length(Buf));
          CloseFile(ImageF);

          //Seta as propriedades da imagem de fundo
          sig.WidgetProps.AutoStretchBackground :=False;
          sig.WidgetProps.BackgroundStyle   := pbsCustom;
          Sig.WidgetProps.Background.ImageType := pitJPEG2000;
          {**************************Atenção************************************
          Tamanho informado para a imagem tem que ser o tamanho real da mesma,
          caso não seja pode dar problema na impressão do arquivo}
          sig.WidgetProps.Background.Width  := vlImgWidth;//Largura da Imagem de fundo
          sig.WidgetProps.Background.Height := vlImgHeight;//Altura da Imagem de fundo
          sig.WidgetProps.Background.Data   := buf;
        end;
        //Tamanho da fonte dos texto da assinatura (1 a 9) podendo ter decimais
        sig.WidgetProps.TitleFontSize := vlFontSize;
        sig.WidgetProps.TimestampFontSize := vlFontSize;
        sig.WidgetProps.SectionTitleFontSize := vlFontSize;
        sig.WidgetProps.SectionTextFontSize := vlFontSize;

        // retrieving signing certificate
        CertStorage.Clear;
        PublicKeyHandler.SignatureType := pstPKCS7SHA1;

        if rbFileCert.Checked then
        begin
          Cert := TElX509Certificate.Create(nil);
          try
            // loading certificate
            CertF := TFileStream.Create(editCert.Text, fmOpenRead or fmShareDenyWrite);
            try
              CertFormat := Cert.DetectCertFileFormat(CertF);
              CertF.Position := 0;
              case CertFormat of
                cfDER : Cert.LoadFromStream(CertF);
                cfPEM : Cert.LoadFromStreamPEM(CertF, editCertPassword.Text);
                cfPFX : Cert.LoadFromStreamPFX(CertF, editCertPassword.Text);
                else
                begin
                  MessageDlg('Erro ao carregar o certificado!', mtError, [mbOk], 0);
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
        Success := true;
      finally
        // closing the document
        Document.Close(Success);
      end;
    finally
      FreeAndNil(F);
    end;
  except
    on E : Exception do
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

//Carrega os parâmetros de configuração da assinatura
procedure TfmeAssinaturaDigital.ParamentrosAssinatura;
var
  viCaminhoLogo : String;
begin
   //Dados da Assinatura
  vlAuthorName := dtmControles.BuscarConfig('PRINCIPAL', 'ASSINATURA', 'ASSINATURA_AUTHORNAME', 'S');
  vlReason     := dtmControles.BuscarConfig('PRINCIPAL', 'ASSINATURA', 'ASSINATURA_REASON', 'W');
  vlLocation   := dtmControles.BuscarConfig('PRINCIPAL', 'ASSINATURA', 'ASSINATURA_LOCATION', 'S');
  vlFontSize   := dtmControles.BuscarConfig('PRINCIPAL', 'ASSINATURA', 'ASSINATURA_FONTSIZE', 'D');
  //Parâmetros da Imagem de fundo
  vlOffsetX    := dtmControles.BuscarConfig('PRINCIPAL', 'ASSINATURA', 'ASSINATURA_OFFSETX', 'I');
  vlOffsety    := dtmControles.BuscarConfig('PRINCIPAL', 'ASSINATURA', 'ASSINATURA_OFFSETY', 'I');
  vlWidth      := dtmControles.BuscarConfig('PRINCIPAL', 'ASSINATURA', 'ASSINATURA_ASSWIDTH', 'I');
  vlHeight     := dtmControles.BuscarConfig('PRINCIPAL', 'ASSINATURA', 'ASSINATURA_ASSHEIGHT', 'I');
  vlImgWidth   := dtmControles.BuscarConfig('PRINCIPAL', 'ASSINATURA', 'ASSINATURA_IMGWIDTH', 'I');
  vlImgHeight  := dtmControles.BuscarConfig('PRINCIPAL', 'ASSINATURA', 'ASSINATURA_IMGHEIGHT', 'I');
  vlBackground := dtmControles.BuscarConfig('PRINCIPAL', 'ASSINATURA', 'ASSINATURA_BACKGROUND', 'S') = 'S';

  //Imagem de fundo da Assinatura
  viCaminhoLogo  := dtmControles.BuscarConfig('IMAGEM', 'GERAL', 'LOCAL_IMAGEM', 'S');
  viCaminhoLogo := viCaminhoLogo + '\LOGOASS\LOGO.JP2';
  if FileExists(viCaminhoLogo) then
    CopyFile(Pchar(viCaminhoLogo), Pchar('C:\TEMP\LOGO.JP2'), false);
end;

//Carrega uma lista com certificados validos instalados
procedure TfmeAssinaturaDigital.PopularCertList;
var i : integer;
    Cert : TElX509Certificate;
begin
  rbWindowsCert.Enabled := WinCertStorage.Count > 0;
  rbWindowsCert.Checked := rbWindowsCert.Enabled;
  cbxCertificados.Properties.Items.Clear;
  for i := 0 to WinCertStorage.Count - 1 do
  begin
    Cert := WinCertStorage.Certificates[i];
    cbxCertificados.Properties.Items.Add('Subject: ' + Cert.SubjectName.CommonName + ', Issuer: ' + Cert.IssuerName.CommonName);
  end;
end;

function TfmeAssinaturaDigital.ValidarCertificado : Boolean;
begin
  Result := True;
  if rbFileCert.Checked then
  begin
    if Trim(editCert.Text) = '' then
    begin
      Application.MessageBox('Arquivo do certificado deve ser informado!', 'Atenção', mb_ok + MB_ICONWARNING);
      Result := False;
    end;
  end
  else
  if rbWindowsCert.Checked then
  begin
    if cbxCertificados.ItemIndex < 0 then
    begin
      Application.MessageBox('Certificado armazenado deve ser informado!', 'Atenção', mb_ok + MB_ICONWARNING);
      Result := False;
    end;
  end;
end;

initialization
SetLicenseKey('485E29B696E96A099866A1D9E58B6814415B97CFADC170C5C887408E8DB982003'+
              'C884B8328BD6B5E6397B202EE728308D1652BE29D72DE2199DE11D180E668225B'+
              '978F38E5A06E36A87F8CB026827A80177B1C009E7E229C3DDBAD8D263457AD5AD'+
              'C670972D65E2C41CF63FCB35385C4189482EB363BBD12046ABDC502E086924CC8'+
              '2637F98E737696C145F972BBF50A41A395252EF61932CA739BFBB94E482B05BCD'+
              '414D5FBF80537DA69C748B1F3F7B7AC7814428EB6CD82FF1D507E5B97D1D08E57'+
              'A138E3BECE31E6FB7353EE8AC6E6C93AF251BFE7063EF3E466620464D956186EE'+
              'A80718DA24FB0CFF6E4C3B3971219D17CC11EB4EC9A117B03BAFB1FDC');

end.


