unit Geral.Model.Entity.Impl.PKI.XSignPKCS;

interface

uses
  Geral.Model.Entity.Spec.PKI,
  Geral.Model.Entity.Spec.Blob,
  Geral.Model.Entity.Spec.Maybe;

type
  TSelecaoCertificadoDigital = class(TInterfacedObject,
    ISelecaoCertificadoDigital)
  private
    FUsuario: string;
    FLicenca: string;

    constructor Create(
      const vpUsuario: string;
      const vpLicenca: string); reintroduce;
  public
    function Selecionar: IMaybe<IX509Certificate>;

    class function New(
      const vpUsuario: string;
      const vpLicenca: string): ISelecaoCertificadoDigital;
  end;

  TAssinaturaArquivoCADES = class(TInterfacedObject, IAssinaturaArquivo)
  public
    function Assinar(
      const vpCaminhoArquivo: string;
      const vpX509Certificate: IX509Certificate): string;

    class function New: IAssinaturaArquivo;
  end;

  TAssinaturaTexto = class(TInterfacedObject, IAssinaturaTexto)
  public
    function Assinar(
      const vpTexto: string;
      const vpX509Certificate: IX509Certificate): string;

    class function New: IAssinaturaTexto;
  end;

implementation

uses
  Geral.Model.Entity.Impl.Blob,
  System.SysUtils,
  Geral.Model.Entity.Impl.Maybe,
  XSign_TLB;

type
  IProviderXSignPKCS = interface
    ['{B291CDC8-DFED-45D7-B53B-77ABC7340AE3}']

    function Provider: _XSignPKCS;
  end;

  TPublicKey = class(TInterfacedObject, IPublicKey)
  private
    FXSignPKCS: _XSignPKCS;
    FEncoded: IBlob;

    function ChavePublicaAsString: string;
    function ChavePublicaAsArrayByte: TArray<Byte>;

    constructor Create(
      const vpXSignPKCS: _XSignPKCS); reintroduce;
  public
    function Encoded: IBlob;

    class function New(
      const vpXSignPKCS: _XSignPKCS): IPublicKey;
  end;

  TIssuer = class(TInterfacedObject, IX500Principal)
  private
    FXSignPKCS: _XSignPKCS;
    FCommonName: string;

    constructor Create(
      const vpXSignPKCS: _XSignPKCS); reintroduce;
  public
    function CommonName: string;

    class function New(
      const vpXSignPKCS: _XSignPKCS): IX500Principal;
  end;

  TX509Certificate = class(TInterfacedObject, IX509Certificate,
    IProviderXSignPKCS)
  private
    FXSignPKCS: _XSignPKCS;
    FPublicKey: IPublicKey;
    FIssuer: IX500Principal;
    FSerialNumber: string;

    constructor Create(
      const vpXSignPKCS: _XSignPKCS); reintroduce;
  public
    function PublicKey: IPublicKey;
    function Issuer: IX500Principal;
    function SerialNumber: string;
    function Provider: _XSignPKCS;

    class function New(
      const vpXSignPKCS: _XSignPKCS): IX509Certificate;
  end;

{ TPublicKey }

function TPublicKey.ChavePublicaAsArrayByte: TArray<Byte>;
begin
  Result := TEncoding.Default.GetBytes(
    ChavePublicaAsString);
end;

function TPublicKey.ChavePublicaAsString: string;
begin
  Result := FXSignPKCS.ExibirPropriedadesCertificado(
    'ChavePublicaCertificado');
end;

constructor TPublicKey.Create(
  const vpXSignPKCS: _XSignPKCS);
begin
  inherited Create;
  FXSignPKCS := vpXSignPKCS;

  FEncoded := TBlob.New(
    ChavePublicaAsArrayByte);
end;

function TPublicKey.Encoded: IBlob;
begin
  Result := FEncoded;
end;

class function TPublicKey.New(
  const vpXSignPKCS: _XSignPKCS): IPublicKey;
begin
  Result := Create(
    vpXSignPKCS);
end;

{ TX509Certificate }

constructor TX509Certificate.Create(
  const vpXSignPKCS: _XSignPKCS);
begin
  inherited Create;
  FXSignPKCS := vpXSignPKCS;

  FPublicKey := TPublicKey.New(
    FXSignPKCS);

  FIssuer := TIssuer.New(
    FXSignPKCS);

  FSerialNumber := FXSignPKCS.ExibirPropriedadesCertificado(
    'SerialCertificado');
end;

function TX509Certificate.Issuer: IX500Principal;
begin
  Result := FIssuer;
end;

class function TX509Certificate.New(
  const vpXSignPKCS: _XSignPKCS): IX509Certificate;
begin
  Result := Create(
    vpXSignPKCS);
end;

function TX509Certificate.Provider: _XSignPKCS;
begin
  Result := FXSignPKCS;
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
  const vpXSignPKCS: _XSignPKCS);
begin
  inherited Create;
  FXSignPKCS := vpXSignPKCS;

  FCommonName := FXSignPKCS.ExibirPropriedadesCertificado(
    'AutoridadeCertificadora');
end;

class function TIssuer.New(
  const vpXSignPKCS: _XSignPKCS): IX500Principal;
begin
  Result := Create(
    vpXSignPKCS);
end;

{ TSelecaoCertificadoDigital }

constructor TSelecaoCertificadoDigital.Create(
  const vpUsuario: string;
  const vpLicenca: string);
begin
  inherited Create;
  FUsuario := vpUsuario;
  FLicenca := vpLicenca;
end;

class function TSelecaoCertificadoDigital.New(
  const vpUsuario: string;
  const vpLicenca: string): ISelecaoCertificadoDigital;
begin
  Result := Create(
    vpUsuario,
    vpLicenca);
end;

function TSelecaoCertificadoDigital.Selecionar: IMaybe<IX509Certificate>;
{$REGION 'Variáveis'}
var
  viXSignPKCS: _XSignPKCS;
{$ENDREGION}
begin
  viXSignPKCS := XSign_TLB.CoXSignPKCS.Create;
  viXSignPKCS.SalvarChavesPublicas := True;
  viXSignPKCS.NaoAnexarArquivoOriginal := False;
  viXSignPKCS.NaoExibirInstalacaoLCReCER := True;
  viXSignPKCS.UsarHashSalvarArquivo := False;

  viXSignPKCS.SetarLicencaUsuario(
    FUsuario,
    FLicenca);

  if not viXSignPKCS.SelecionarCertificadoDigital(
    CERTIFICADOS_VALIDOS_ASSINATURA) then
    Exit(
      TNone<IX509Certificate>.New);

  Result := TSome<IX509Certificate>.New(
    TX509Certificate.New(
      viXSignPKCS));
end;

{ TAssinaturaArquivoCADES }

function TAssinaturaArquivoCADES.Assinar(
  const vpCaminhoArquivo: string;
  const vpX509Certificate: IX509Certificate): string;
{$REGION 'Variáveis'}
var
  viProviderXSignPKCS: IProviderXSignPKCS;
  viXSignPKCS: _XSignPKCS;
{$ENDREGION}
begin
  if not Supports(
    vpX509Certificate,
    IProviderXSignPKCS,
    viProviderXSignPKCS) then
    raise Exception.Create(
      'Certificado não compatível com o produto XSignPKCS.');

  viXSignPKCS := viProviderXSignPKCS.Provider;

  if not viXSignPKCS.AssinaArquivo(
    vpCaminhoArquivo,
    string.Empty,
    'Assinatura Digital PKCS#7.',
    ARQUIVO_BINARIO_FORMATO_P7S) then
    raise Exception.Create(
      string.Format(
        'Não foi possível assinar o arquivo devido ao motivo abaixo:%s%s.',
        [sLineBreak,
        viXSignPKCS.DescricaoErro]));

  Result := viXSignPKCS.CaminhoArquivoAssinado;
end;

class function TAssinaturaArquivoCADES.New: IAssinaturaArquivo;
begin
  Result := Create;
end;

{ TAssinaturaTexto }

function TAssinaturaTexto.Assinar(
  const vpTexto: string;
  const vpX509Certificate: IX509Certificate): string;
{$REGION 'Variáveis'}
var
  viProviderXSignPKCS: IProviderXSignPKCS;
  viXSignPKCS: _XSignPKCS;
{$ENDREGION}
begin
  if not Supports(
    vpX509Certificate,
    IProviderXSignPKCS,
    viProviderXSignPKCS) then
    raise Exception.Create(
      'Certificado não compatível com o produto XSignPKCS.');

  viXSignPKCS := viProviderXSignPKCS.Provider;

  if not viXSignPKCS.AssinaTexto(
    vpTexto,
    'Assinatura Digital PKCS#7.') then
    raise Exception.Create(
      string.Format(
        'Não foi possível assinar o texto devido ao motivo abaixo:%s%s.',
        [sLineBreak,
        viXSignPKCS.DescricaoErro]));

  Result := viXSignPKCS.AssinaturaDigitalTexto;
end;

class function TAssinaturaTexto.New: IAssinaturaTexto;
begin
  Result := Create;
end;

end.
