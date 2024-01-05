unit Geral.Model.Entity.Impl.SINTER;

interface

uses
  System.SysUtils,
  System.Classes,
  Geral.Model.Entity.Spec.SINTER,
  Geral.Model.Entity.Spec.PKI,
  Geral.Model.Entity.Spec.Maybe,
  Geral.Model.Entity.Spec.ParametrosProxy,
  SBSimpleSSL,
  SBHTTPSClient,
  SBX509,
  SBCustomCertStorage,
  SBWinCertStorage;

type
  TdtmSINTER = class(TDataModule)
    ElHTTPSClient: TElHTTPSClient;
    ElCertificateLookup: TElCertificateLookup;
    ElWinCertStorage: TElWinCertStorage;
    ElMemoryCertStorage: TElMemoryCertStorage;
    procedure ElHTTPSClientCertificateValidate(Sender: TObject;
      X509Certificate: TElX509Certificate; var Validate: Boolean);
  private
    { Private declarations }
    FParametrosProxy: IMaybe<IParametrosProxy>;

    constructor Create(
      AOwner: TComponent;
      const vpParametrosProxy: IMaybe<IParametrosProxy>); reintroduce;
  public
    { Public declarations }
    class function New(
      AOwner: TComponent;
      const vpParametrosProxy: IMaybe<IParametrosProxy>): TdtmSINTER;
  end;

  TSINTER = class(TInterfacedObject, ISINTER)
  private
    FAmbienteWebService: string;
    FParametrosProxy: IMaybe<IParametrosProxy>;

    constructor Create(
      const vpAmbienteWebService: string;
      const vpParametrosProxy: IMaybe<IParametrosProxy>); reintroduce;

    function BaseURL: string;

    function URL_EnvioLote(
      const vpSistemaID: Integer): string;
  public
    function EnviarLote(
      const vpSistemaID: Integer;
      const vpCaminhoArquivo: string;
      const vpX509Certificate: IX509Certificate): ISINTER_Result;

    class function New(
      const vpAmbienteWebService: string;
      const vpParametrosProxy: IMaybe<IParametrosProxy>): ISINTER;
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses
  SBSocket,
  System.StrUtils,
  SBHTTPSCommon,
  System.IOUtils,
  SBConstants,
  SBStrUtils;

{$R *.dfm}

type
  TSINTER_Result = class(TInterfacedObject, ISINTER_Result)
  private
    FHTTP_Code: Integer;
    FHTTP_Status: string;
    FHTTP_Response: TStream;

    constructor Create(
      const vpHTTP_Code: Integer;
      const vpHTTP_Status: string;
      const vpHTTP_Response: TStream); reintroduce;
  public
    function HTTP_Code: Integer;
    function HTTP_Status: string;
    function HTTP_Response: TStream;

    class function New(
      const vpHTTP_Code: Integer;
      const vpHTTP_Status: string;
      const vpHTTP_Response: TStream): ISINTER_Result;

    destructor Destroy; override;
  end;

{ TSINTER }

function TSINTER.BaseURL: string;
begin
  Result := string.Format(
    'https://%ssinterws.receita.economia.gov.br/',
    [IfThen(
      FAmbienteWebService = 'H',
      'hom-')]);
end;

constructor TSINTER.Create(
  const vpAmbienteWebService: string;
  const vpParametrosProxy: IMaybe<IParametrosProxy>);
begin
  inherited Create;
  FAmbienteWebService := vpAmbienteWebService;
  FParametrosProxy := vpParametrosProxy;
end;

function TSINTER.EnviarLote(
  const vpSistemaID: Integer;
  const vpCaminhoArquivo: string;
  const vpX509Certificate: IX509Certificate): ISINTER_Result;
{$REGION 'Variáveis'}
var
  viDtmSINTER: TdtmSINTER;
  viHTTP_Response: TStream;
  viHTTP_Code: Integer;
  viHTTP_MultipartList: TElHTTPMultipartList;
  viArquivo: TStream;
  viIndex: Integer;
  viX509Certificate: TElX509Certificate;
  viHTTP_Status: string;
  viURL_EnvioLote: string;
{$ENDREGION}
begin
  viDtmSINTER := TdtmSINTER.New(
    nil,
    FParametrosProxy);

  viHTTP_Response := TMemoryStream.Create;
  viHTTP_MultipartList := TElHTTPMultipartList.Create;

  viArquivo := TFileStream.Create(
    vpCaminhoArquivo,
    fmOpenRead);

  try
    viDtmSINTER.ElCertificateLookup.IssuerRDN.Add(
      SB_CERT_OID_COMMON_NAME,
      SBStrUtils.StrToUTF8(
        vpX509Certificate.Issuer.CommonName));

    viDtmSINTER.ElCertificateLookup.SerialNumber := SBStrUtils.StrToUTF8(
      vpX509Certificate.SerialNumber);

    viIndex := viDtmSINTER.ElWinCertStorage.FindFirst(
      viDtmSINTER.ElCertificateLookup);

    if viIndex = -1 then
      raise Exception.CreateFmt(
        'Não foi possível localizar um certificado ' +
        'com os seguintes critérios:%s' +
        'Emissor: %s.%s' +
        'Número Série: %s.',
        [sLineBreak,
        vpX509Certificate.Issuer.CommonName,
        sLineBreak,
        vpX509Certificate.SerialNumber]);

    viX509Certificate := viDtmSINTER.ElWinCertStorage.Certificates[viIndex];

    viDtmSINTER.ElMemoryCertStorage.Add(
      viX509Certificate);

    viHTTP_Response.Position := 0;
    viDtmSINTER.ElHTTPSClient.OutputStream := viHTTP_Response;

    viDtmSINTER.ElHTTPSClient.RequestParameters.ContentType :=
      'multipart/form-data';

    viArquivo.Position := 0;

    viHTTP_MultipartList.AddFormFile(
      'lote',
      TPath.GetFileName(
        vpCaminhoArquivo),
      'application/zip',
      viArquivo,
      False);

    viURL_EnvioLote := URL_EnvioLote(
      vpSistemaID);

    viHTTP_Code := viDtmSINTER.ElHTTPSClient.PostMultipart(
      viURL_EnvioLote,
      TSBHTTPMultipartMode.hmpFormData,
      viHTTP_MultipartList);

    viHTTP_Status := viDtmSINTER.ElHTTPSClient.ServerReasonPhrase;

    Result := TSINTER_Result.New(
      viHTTP_Code,
      viHTTP_Status,
      viHTTP_Response);
  finally
    viDtmSINTER.Free;
    viHTTP_MultipartList.Free;
    viArquivo.Free;
  end;
end;

class function TSINTER.New(
  const vpAmbienteWebService: string;
  const vpParametrosProxy: IMaybe<IParametrosProxy>): ISINTER;
begin
  Result := Create(
    vpAmbienteWebService,
    vpParametrosProxy);
end;

function TSINTER.URL_EnvioLote(
  const vpSistemaID: Integer): string;
begin
  Result := string.Format(
    '%s%s/ws/receive',
    [BaseURL,
    IfThen(
      vpSistemaID = 1,
      'ri',
      IfThen(
        vpSistemaID = 2,
        'notas',
        'rtd'))]);
end;

{ TdtmSINTER }

constructor TdtmSINTER.Create(
  AOwner: TComponent;
  const vpParametrosProxy: IMaybe<IParametrosProxy>);
begin
  inherited Create(
    AOwner);

  FParametrosProxy := vpParametrosProxy;

  if FParametrosProxy.HasValue then
  begin
    ElHTTPSClient.UseHTTPProxy := True;
    ElHTTPSClient.HTTPProxyHost := FParametrosProxy.Value.Server;
    ElHTTPSClient.HTTPProxyPort := FParametrosProxy.Value.Port;
    ElHTTPSClient.HTTPProxyUsername := FParametrosProxy.Value.Username;
    ElHTTPSClient.HTTPProxyPassword := FParametrosProxy.Value.Password;

    if not ElHTTPSClient.HTTPProxyUsername.IsEmpty and
      not ElHTTPSClient.HTTPProxyPassword.IsEmpty then
      ElHTTPSClient.HTTPProxyAuthentication :=
        TElWebTunnelAuthentication.wtaBasic;
  end;
end;

procedure TdtmSINTER.ElHTTPSClientCertificateValidate(Sender: TObject;
  X509Certificate: TElX509Certificate; var Validate: Boolean);
begin
  Validate := True;
end;

class function TdtmSINTER.New(AOwner: TComponent;
  const vpParametrosProxy: IMaybe<IParametrosProxy>): TdtmSINTER;
begin
  Result := Create(
    AOwner,
    vpParametrosProxy);
end;

{ TSINTER_Result }

constructor TSINTER_Result.Create(
  const vpHTTP_Code: Integer;
  const vpHTTP_Status: string;
  const vpHTTP_Response: TStream);
begin
  inherited Create;
  FHTTP_Code := vpHTTP_Code;
  FHTTP_Status := vpHTTP_Status;
  FHTTP_Response := vpHTTP_Response;
end;

destructor TSINTER_Result.Destroy;
begin
  FHTTP_Response.Free;
  inherited;
end;

function TSINTER_Result.HTTP_Code: Integer;
begin
  Result := FHTTP_Code;
end;

function TSINTER_Result.HTTP_Status: string;
begin
  Result := FHTTP_Status;
end;

function TSINTER_Result.HTTP_Response: TStream;
begin
  Result := FHTTP_Response;
end;

class function TSINTER_Result.New(
  const vpHTTP_Code: Integer;
  const vpHTTP_Status: string;
  const vpHTTP_Response: TStream): ISINTER_Result;
begin
  Result := Create(
    vpHTTP_Code,
    vpHTTP_Status,
    vpHTTP_Response);
end;

end.
