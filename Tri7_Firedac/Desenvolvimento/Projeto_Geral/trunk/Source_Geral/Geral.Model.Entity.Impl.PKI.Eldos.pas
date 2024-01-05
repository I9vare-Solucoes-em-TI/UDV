unit Geral.Model.Entity.Impl.PKI.Eldos;

interface

uses
  Geral.Model.Entity.Spec.PKI,
  Geral.Model.Entity.Spec.Blob,
  Geral.Model.Entity.Spec.Maybe,
  Xml.XMLIntf,
  SBPDF,
  SBPDFSecurity,
  SBX509,
  SBCustomCertStorage,
  SBUtils,
  SBTypes,
  SBXMLCore,
  SBConstants,
  SBXMLDefs;

type
  TSelecaoCertificadoDigital = class(TInterfacedObject,
    ISelecaoCertificadoDigital)
  public
    function Selecionar: IMaybe<IX509Certificate>;

    class function New: ISelecaoCertificadoDigital;
  end;

  TValidarAssinatura = class(TInterfacedObject,
    IValidarAssinatura)
  public
    function ValidarAssinatura(const vpCaminhoArquivo: string): Boolean;

    class function New: IValidarAssinatura;
  end;

  TAssinaturaArquivoPADES = class(TInterfacedObject, IAssinaturaPADES)
  private
    FLogoAssFile: string;
    FLogoAssExiste: Boolean;
    FLogoAssWidth: Integer;
    FLogoAssHeight: Integer;

    procedure SetEncryptionHandler(const Document: TElPDFDocument;
      const CurrHandler : TElPDFPasswordSecurityHandler;
      const Password: string);

    constructor Create; reintroduce;
  public
      function Assinar(
      const vpCaminhoArquivo: string;
      const vpX509Certificate: IX509Certificate;
      const vpAssinaturaVisivel: Boolean;
      const vpBackground: Boolean;
      const vpShowOnAllPages: Boolean;
      const vpPassword: string): Boolean;

    class function New: IAssinaturaPADES;
  end;

  TElAssinaturaXmlDSig = class(TInterfacedObject, IAssinaturaXmlDSig)
  private
    procedure FormatElement(
      Sender: TObject;
      Element: TElXMLDOMElement;
      Level: Integer;
      const Path: XMLString;
      var StartTagWhitespace: XMLString;
      var EndTagWhitespace: XMLString);

    procedure FormatText(
      Sender: TObject;
      var Text: XMLString;
      TextType: TElXMLTextType;
      Level: Integer;
      const Path: XMLString);
  public
    function Assinar(
      const vpXml: IXMLDocument;
      const vpCertificado: IX509Certificate;
      const vpTag: IXMLNode): IXMLDocument;

    class function New: IAssinaturaXmlDSig;
  end;

implementation

uses
  Controles,
  RotinasImagem,
  Geral.Model.Entity.Impl.Blob,
  System.SysUtils,
  System.Classes,
  Geral.Model.Entity.Impl.Maybe,
  Geral.View.Sel.Certificado.Eldos,
  SBXMLSec,
  SBXMLTransform,
  SBXMLSig,
  Xml.XMLDoc;

type
  IProviderEldosPKCS = interface
    ['{BF36DD72-D741-4B0C-A158-8F68A058E853}']

    function Provider: TElX509Certificate;
  end;

  TPublicKey = class(TInterfacedObject, IPublicKey)
  private
    FEldosPKCS: TElX509Certificate;
    FEncoded: IBlob;

    constructor Create(
      const vpEdlsoPKCS: TElX509Certificate); reintroduce;

    function ChavePublicaAsArrayByte: TArray<Byte>;
  public
    function Encoded: IBlob;

    class function New(
      const vpEdlsoPKCS: TElX509Certificate): IPublicKey;
  end;

  TIssuer = class(TInterfacedObject, IX500Principal)
  private
    FEldosPKCS: TElX509Certificate;
    FCommonName: string;

    constructor Create(
      const vpEdlsoPKCS: TElX509Certificate); reintroduce;
  public
    function CommonName: string;//Nome do Emissor

    class function New(
      const vpEdlsoPKCS: TElX509Certificate): IX500Principal;
  end;

  TX509Certificate = class(TInterfacedObject, IX509Certificate,
    IProviderEldosPKCS)
  private
    FEldosPKCS: TElX509Certificate;
    FPublicKey: IPublicKey;
    FIssuer: IX500Principal;
    FSerialNumber: string;

    constructor Create(
      const vpEldosPKCS: TElX509Certificate); reintroduce;
  public
    function PublicKey: IPublicKey;
    function Issuer: IX500Principal;
    function SerialNumber: string;
    function Provider: TElX509Certificate;

    class function New(
      const vpEldosPKCS: TElX509Certificate): IX509Certificate;

    destructor Destroy; override;
  end;

{ TPublicKey }

function TPublicKey.ChavePublicaAsArrayByte: TArray<Byte>;
var
  viBuffer: ByteArray;
begin
  FEldosPKCS.GetPublicKeyBlob(viBuffer);

  if Assigned(viBuffer) then
    Result := TEncoding.Default.GetBytes(
     SBUtils.StringOfBytes(viBuffer));
end;

constructor TPublicKey.Create(
  const vpEdlsoPKCS: TElX509Certificate);
begin
  inherited Create;
  FEldosPKCS := vpEdlsoPKCS;

  FEncoded := TBlob.New(
    ChavePublicaAsArrayByte);
end;

function TPublicKey.Encoded: IBlob;
begin
  Result := FEncoded;
end;

class function TPublicKey.New(
  const vpEdlsoPKCS: TElX509Certificate): IPublicKey;
begin
  Result := Create(
    vpEdlsoPKCS);
end;

{ TX509Certificate }

constructor TX509Certificate.Create(
  const vpEldosPKCS: TElX509Certificate);
begin
  inherited Create;
  FEldosPKCS := vpEldosPKCS;

  FPublicKey := TPublicKey.New(
    vpEldosPKCS);

  FIssuer := TIssuer.New(
    vpEldosPKCS);

  FSerialNumber := SBUtils.StringOfBytes(FEldosPKCS.SerialNumber);
end;

destructor TX509Certificate.Destroy;
begin
  FreeAndNil(FEldosPKCS);
  inherited;
end;

function TX509Certificate.Issuer: IX500Principal;
begin
  Result := FIssuer;
end;

class function TX509Certificate.New(
  const vpEldosPKCS: TElX509Certificate): IX509Certificate;
begin
  Result := Create(
    vpEldosPKCS);
end;

function TX509Certificate.Provider: TElX509Certificate;
begin
  Result := FEldosPKCS;
end;

function TX509Certificate.PublicKey: IPublicKey;
begin
  Result := FPublicKey;
end;

function TX509Certificate.SerialNumber: string;
begin
  Result := FSerialNumber;
end;

{ TIssuer }

function TIssuer.CommonName: string;
begin
  Result := FCommonName;
end;

constructor TIssuer.Create(
  const vpEdlsoPKCS: TElX509Certificate);
begin
  inherited Create;
  FEldosPKCS := vpEdlsoPKCS;

  FCommonName := vpEdlsoPKCS.IssuerName.CommonName;
end;

class function TIssuer.New(
  const vpEdlsoPKCS: TElX509Certificate): IX500Principal;
begin
  Result := Create(
    vpEdlsoPKCS);
end;

{ TSelecaoCertificadoDigital }

class function TSelecaoCertificadoDigital.New: ISelecaoCertificadoDigital;
begin
  Result := Create;
end;

function TSelecaoCertificadoDigital.Selecionar: IMaybe<IX509Certificate>;
var
  viCertificado: TElX509Certificate;
begin
  viCertificado := TfrmSelecionarCertificadoEldos.SelecionarCertificadoEldos;

  if not Assigned(viCertificado) then
    Exit(
      TNone<IX509Certificate>.New);

  Result := TSome<IX509Certificate>.New(
    TX509Certificate.New(
      viCertificado));
end;

{ TAssinaturaArquivoPADES }

function TAssinaturaArquivoPADES.Assinar(
  const vpCaminhoArquivo: string;
  const vpX509Certificate: IX509Certificate;
  const vpAssinaturaVisivel: Boolean;
  const vpBackground: Boolean;
  const vpShowOnAllPages: Boolean;
  const vpPassword: string): Boolean;

  {$REGION 'AddTextoAssinatura'}
  procedure AddTextoAssinatura(const vpCustomText : TElPDFSignatureWidgetTextList; vpTexto: string);
  var
    viLista: TArray<string>;
    i,
    viPosIni: Integer;
    viTexto: string;

  begin
    vpCustomText.Add(FormatDateTime('DD/MM/YYYY HH:MM', DateTimeNow),1, 40, 7);
    vpCustomText.Add('Documento Certificado Digitalmente' ,1, 30, 7);

    viTexto := EmptyStr;
    viPosIni := 20;
    viLista:= vpTexto.Split([' ']);
    try
      for i := Low(viLista) to High(viLista) do
      begin
        viTexto := viTexto + viLista[i] + ' ';

        if i <> High(viLista) then
        begin
          if Length(viTexto + viLista[i + 1]) >= 35 then
          begin
            vpCustomText.Add(viTexto ,1, viPosIni, 6);
            viTexto := EmptyStr;
            Inc(viPosIni, -10);
          end;
        end
        else
          vpCustomText.Add(viTexto ,1, viPosIni, 6);
      end;
    finally
      Finalize(viLista);
    end;
  end;
  {$ENDREGION}

var
  viProviderEldosPKCS: IProviderEldosPKCS;
  viEldosPKCS: TElX509Certificate;

  F: TFileStream;
  Index: Integer;
  Sig: TElPDFSignature;
  Document: TElPDFDocument;
  PublicKeyHandler: TElPDFPublicKeySecurityHandler;
  PasswordHandler: TElPDFPasswordSecurityHandler;
  CertStorage: TElMemoryCertStorage;
  ImageF: File;
  buf: ByteArray;
  SimpleFont: TElPDFSimpleFont;
  Encrypt: Boolean;
begin
  Result := false;
  Document := Nil;
  PublicKeyHandler := Nil;
  CertStorage := Nil;
  F := Nil;
  Encrypt := not vpPassword.Trim.IsEmpty;

  if not Supports(
    vpX509Certificate,
    IProviderEldosPKCS,
    viProviderEldosPKCS) then
    raise Exception.Create(
      'Certificado não compatível com o produto Eldos.');

  viEldosPKCS := viProviderEldosPKCS.Provider;

  try
    try
      Document:= TElPDFDocument.Create(nil);
      PublicKeyHandler:= TElPDFPublicKeySecurityHandler.Create(nil);
      PasswordHandler:= TElPDFPasswordSecurityHandler.Create(nil);
      CertStorage:= TElMemoryCertStorage.Create(nil);

      // opening the temporary file
      F := TFileStream.Create(vpCaminhoArquivo, fmOpenReadWrite or fmShareDenyWrite);
      // opening the document
      Document.Open(F);
      try
        // checking if the document is already encrypted
        if Document.Encrypted then
        begin
          raise Exception.Create(
            'Documento encrypted, não pode ser assinado!');
          Exit;
        end;

        Index := Document.AddSignature;
        Sig := Document.Signatures[Index];
        Sig.Handler     := PublicKeyHandler;
        Sig.AuthorName  := viEldosPKCS.SubjectName.CommonName;
        Sig.SigningTime := UTCNow;

        Sig.SignatureType := stMDP;
        Sig.Invisible     := not vpAssinaturaVisivel; // Exibe a assinatura no documento

        // Adding Type 1 font
        SimpleFont := TElPDFSimpleFont.Create;
        SimpleFont.BaseFont := 'Helvetica';
        Sig.WidgetProps.AddFont(SimpleFont);

        Sig.WidgetProps.ShowOnAllPages := vpShowOnAllPages;
        // Exibir assinatura em todas as páginas
        Sig.WidgetProps.AutoText       := False;
        Sig.WidgetProps.AutoSize       := false;
        Sig.WidgetProps.AutoPos        := false;
        Sig.WidgetProps.AutoFontSize   := false;

        Sig.WidgetProps.OffsetX        := 450; //Posição borda esqueda da página
        Sig.WidgetProps.Offsety        := 5; //Pisição borda inferior da página
        sig.WidgetProps.Width          := 130; //Largura da Assinatura
        sig.WidgetProps.Height         := 50; //Altura da Assinatura

        Sig.WidgetProps.HideDefaultText := True;

        AddTextoAssinatura(Sig.WidgetProps.CustomText, viEldosPKCS.SubjectName.CommonName);

        if vpBackground and FLogoAssExiste then
        begin
          //Salva imagem de fundo como um Array de Byte
          AssignFile(ImageF, FLogoAssFile );
          try
            Reset(ImageF, 1);
            SetLength(Buf, FileSize(ImageF));
            BlockRead(ImageF, Buf[0], Length(Buf));
          finally
            CloseFile(ImageF);
          end;

          //Seta as propriedades da imagem de fundo
          sig.WidgetProps.AutoStretchBackground := True;
          sig.WidgetProps.BackgroundStyle       := pbsCustom;
          Sig.WidgetProps.Background.ImageType  := pitJPEG;
          sig.WidgetProps.Background.Width      := FLogoAssWidth;//Largura da Imagem de fundo
          sig.WidgetProps.Background.Height     := FLogoAssHeight;//Altura da Imagem de fundo
          sig.WidgetProps.Background.Data       := buf;
        end
        else
          sig.WidgetProps.BackgroundStyle := pbsNoBackground;

        // retrieving signing certificate
        CertStorage.Clear;
        CertStorage.Add(viEldosPKCS);

        PublicKeyHandler.SignatureType := pstPKCS7SHA1;
        PublicKeyHandler.CertStorage   := CertStorage;
        PublicKeyHandler.CustomName    := 'Adobe.PPKMS';


        if Encrypt then
        begin
          SetEncryptionHandler(Document, PasswordHandler, vpPassword);
          Document.SignAndEncrypt
        end;

        // allowing to save the document
        Result := True;
      finally
        // closing the document
        Document.Close(Result);
      end;
    finally
      FreeAndNil(Document);
      FreeAndNil(PublicKeyHandler);
      FreeAndNil(PasswordHandler);
      FreeAndNil(CertStorage);
      FreeAndNil(F);
    end;
  except
    on E: Exception do
    begin
      raise Exception.Create(
            'Erro: ' + E.Message);
    end;
  end;
end;

constructor TAssinaturaArquivoPADES.Create;
begin
  inherited Create;
  FLogoAssFile          := IncludeTrailingPathDelimiter(vgDiretorioCorrente) + 'LOGO_ASS.JPEG';
  FLogoAssExiste        := FileExists(FLogoAssFile);
  FLogoAssWidth         := 0;//150;
  FLogoAssHeight        := 0;//65;

  if FLogoAssExiste then
    RotinasImagem.GetImageSize(FLogoAssFile, FLogoAssWidth, FLogoAssHeight);
end;

class function TAssinaturaArquivoPADES.New: IAssinaturaPADES;
begin
  Result := Create;
end;


procedure TAssinaturaArquivoPADES.SetEncryptionHandler(
  const Document: TElPDFDocument;
  const CurrHandler : TElPDFPasswordSecurityHandler;
  const Password: string);
var
  Alg : integer;
  KeySize : integer;
begin
  Document.EncryptionHandler := CurrHandler;
  CurrHandler.EncryptMetadata := True;
  Alg := SB_ALGORITHM_CNT_RC4;
  KeySize := 128;

  CurrHandler.StreamEncryptionAlgorithm := Alg;
  CurrHandler.StringEncryptionAlgorithm := Alg;
  CurrHandler.StreamEncryptionKeyBits := KeySize;
  CurrHandler.StringEncryptionKeyBits := KeySize;
  CurrHandler.UserPassword := Password;
  CurrHandler.OwnerPassword := Password;
  CurrHandler.Permissions.EnableAll;
end;

{ TElAssinaturaXmlDSig }

function TElAssinaturaXmlDSig.Assinar(
  const vpXml: IXMLDocument;
  const vpCertificado: IX509Certificate;
  const vpTag: IXMLNode): IXMLDocument;
var
  viXmlDomDocument: TElXMLDOMDocument;
  viXmlReferenceList: TElXMLReferenceList;
  viXmlReference: TElXMLReference;
  viNodeName: string;
  viXmlDomNode: TElXMLDOMNode;
  viAttribute: TElXMLDOMNode;
  viUri: string;
  viXmlEnvelopedSignatureTransform: TElXMLTransform;
  viXmlC14NTransform: TElXMLTransform;
  viXmlSigner: TElXMLSigner;
  viProviderEldosPKCS: IProviderEldosPKCS;
  viCertificado: TElX509Certificate;
  viXmlKeyInfoX509Data: TElXMLKeyInfoX509Data;
  I: Integer;
  viInputStream: TStream;
  viOutuptStream: TStream;
begin
  Result := nil;
  viXmlDomDocument := nil;
  viXmlReferenceList := nil;
  viXmlSigner := nil;
  viXmlKeyInfoX509Data := nil;
  viInputStream := nil;
  viOutuptStream := nil;

  try
    viInputStream := TMemoryStream.Create;
    vpXml.SaveToStream(viInputStream);

    viXmlDomDocument := TElXMLDOMDocument.Create;
    viInputStream.Position := 0;

    viXmlDomDocument.LoadFromStream(
      viInputStream,
      vpXml.Encoding,
      False);

    viXmlReference := TElXMLReference.Create;
    viXmlReference.DigestMethod := TElXMLDigestMethod.xdmSHA1;

    viNodeName := vpTag.NodeName;

    viXmlDomNode := viXmlDomDocument.FindNode(
      viNodeName,
      True);

    if not Assigned(viXmlDomNode) then
      raise Exception.CreateFmt(
        'Não foi possível encontrar a tag %s.',
        [viNodeName]);

    viXmlReference.URINode := viXmlDomNode;
    viUri := string.Empty;

    for I := 0 to viXmlDomNode.Attributes.Count - 1 do
    begin
      viAttribute := viXmlDomNode.Attributes[I];
      if not SameText(viAttribute.NodeName, 'Id') then
        Continue;

      viUri := '#' + viAttribute.NodeValue;
      Break;
    end;

    if viUri.IsEmpty then
      raise Exception.CreateFmt(
        'Não foi possível encontrar o atributo Id da tag %s.',
        [viNodeName]);

    viXmlReference.URI := viUri;

    viXmlEnvelopedSignatureTransform := TElXMLEnvelopedSignatureTransform.Create;
    viXmlReference.TransformChain.Add(viXmlEnvelopedSignatureTransform);

    viXmlC14NTransform := TElXMLC14NTransform.Create;
    viXmlReference.TransformChain.Add(viXmlC14NTransform);

    viXmlReferenceList := TElXMLReferenceList.Create;
    viXmlReferenceList.Add(viXmlReference);

    viXmlSigner := TElXMLSigner.Create(nil);
    viXmlSigner.SignatureType := TElXMLSignatureType.xstEnveloped;
    viXmlSigner.CanonicalizationMethod := TElXMLCanonicalizationMethod.xcmCanon;
    viXmlSigner.SignatureMethodType := TElXMLSigMethodType.xmtSig;
    viXmlSigner.SignatureMethod := TElXMLSignatureMethod.xsmRSA_SHA1;
    viXmlSigner.References := viXmlReferenceList;
    viXmlSigner.KeyName := string.Empty;
    viXmlSigner.IncludeKey := True;
    viXmlSigner.OnFormatElement := FormatElement;
    viXmlSigner.OnFormatText := FormatText;

    if not Supports(
      vpCertificado,
      IProviderEldosPKCS,
      viProviderEldosPKCS) then
      raise Exception.Create(
        'Certificado não compatível com o produto Eldos.');

    viCertificado := viProviderEldosPKCS.Provider;
    viXmlKeyInfoX509Data := TElXMLKeyInfoX509Data.Create(False);
    viXmlKeyInfoX509Data.Certificate := viCertificado;
    viXmlKeyInfoX509Data.IncludeKeyValue := False;
    viXmlKeyInfoX509Data.IncludeDataParams := [TElXMLKeyInfoX509DataParam.xkidX509Certificate];
    viXmlSigner.KeyData := viXmlKeyInfoX509Data;

    viXmlSigner.UpdateReferencesDigest;
    viXmlSigner.GenerateSignature;
    viXmlSigner.Signature.SignaturePrefix := string.Empty;
    viXmlSigner.Save(viXmlDomNode);

    viOutuptStream := TMemoryStream.Create;

    viXmlDomDocument.SaveToStream(
      viOutuptStream,
      TElXMLCanonicalizationMethod.xcmNone,
      viXmlDomDocument.OriginalEncoding);

    Result := NewXMLDocument;
    viOutuptStream.Position := 0;
    Result.LoadFromStream(viOutuptStream);
  finally
    FreeAndNil(viXmlDomDocument);

    if not Assigned(viXmlReferenceList) then
      FreeAndNil(viXmlReference);

    FreeAndNil(viXmlReferenceList);
    FreeAndNil(viXmlSigner);
    FreeAndNil(viXmlKeyInfoX509Data);
    FreeAndNil(viInputStream);
    FreeAndNil(viOutuptStream);
  end;
end;

procedure TElAssinaturaXmlDSig.FormatElement(
  Sender: TObject;
  Element: TElXMLDOMElement;
  Level: Integer;
  const Path: XMLString;
  var StartTagWhitespace: XMLString;
  var EndTagWhitespace: XMLString);
var
  Node: TElXMLDOMNode;
  s: XMLString;
  i: Integer;
  HasElements: Boolean;
begin
  StartTagWhitespace := #10;
  s := '';
  for i := 0 to Level - 2 do
    s := s + #9;

  StartTagWhitespace := StartTagWhitespace + s;
  if Assigned(Element.FirstChild) then
  begin
    HasElements := False;
    Node := Element.FirstChild;
    while Assigned(Node) do
    begin
      if Node.NodeType = ntElement then
      begin
        HasElements := True;
        Break;
      end;

      Node := Node.NextSibling;
    end;

    if HasElements then
      EndTagWhitespace := #10 + s;
  end;
end;

procedure TElAssinaturaXmlDSig.FormatText(
  Sender: TObject;
  var Text: XMLString;
  TextType: TElXMLTextType;
  Level: Integer;
  const Path: XMLString);
var
  s: XMLString;
  i: Integer;
begin
  if (TextType = ttBase64) and (Length(Text) > 64) then
  begin
    s := #10;
    while Length(Text) > 0 do
    begin
      s := s + Copy(Text, 1, 64) + #10;
      Delete(Text, 1, 64);
    end;

    for i := 0 to Level - 3 do
      s := s + #9;

    Text := s;
  end;
end;

class function TElAssinaturaXmlDSig.New: IAssinaturaXmlDSig;
begin
  Result := Create;
end;

{ TValidarAssinatura }

class function TValidarAssinatura.New: IValidarAssinatura;
begin
  Result := Create;
end;

function TValidarAssinatura.ValidarAssinatura(
  const vpCaminhoArquivo: string): Boolean;
var
  F: TFileStream;
  Document: TElPDFDocument;
  Sig: TElPDFSignature;
  I : integer;
  begin
  Result := False;
  Document := nil;
  F := nil;

  try
    try
      Document:= TElPDFDocument.Create(nil);
      // opening the temporary file
      F := TFileStream.Create(vpCaminhoArquivo, fmOpenReadWrite or fmShareDenyWrite);
      // opening the document
      Document.Open(F);
      try
        // checking if the document is already Signed
        if not Document.Signed then
        begin
          raise Exception.Create(
            'Documento não assinado!');
          Exit;
        end;

        for I := 0 to Document.SignatureCount - 1 do
        begin
          Sig := Document.Signatures[I];

          if not Sig.Validate(True) then
          begin
            raise Exception.Create(
              'Documento com assinatura(s) invalida(s)!');
            Exit;
          end;
        end;

        Result := True;
      finally
        // closing the document
        Document.Close(False);
      end;
    finally
      FreeAndNil(Document);
      FreeAndNil(F);
    end;
  except
    on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

initialization

SBUtils.SetLicenseKey(
  '4BE765151657183BBC2BDA6321818EAEB925F57E04754452780965BF429BBE89' +
  'A828686E8F5C355981F108E9DDA65CD3EE60D7A9E8641DAC77A434945EA56F0E' +
  '98528504938F170BE5A798F44B3DD067174C9B662C20AC73B7AC7D9DFD412096' +
  '63FB642F9DF6189771AFEBF1EB1076B5430DE6D0204A8012580087E1B31CF64C' +
  '84D946A8927B444F22C897A8E2425EAF68C73F63F4A189BA57B6FC305454FD7B' +
  'F9688A4FB16ABD7E892B0A88B3B7BAD0BD6714EA029739AFAFBF0829291B4905' +
  'C42DC4A0F220319988BCF5378DD01D1BC76B680B6B55C00BF037762064AA120D' +
  'E070AE7A54E760A6D0089A9EF31530BF8FFD8B15708B34DFF24A197C31295064');

end.
