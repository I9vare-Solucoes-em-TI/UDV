object dtmSINTER: TdtmSINTER
  OldCreateOrder = False
  Height = 150
  Width = 215
  object ElHTTPSClient: TElHTTPSClient
    ClientCertStorage = ElMemoryCertStorage
    SocketTimeout = 60000
    Versions = [sbTLS1, sbTLS11, sbTLS12]
    LocalPort = 0
    IncomingSpeedLimit = 0
    OutgoingSpeedLimit = 0
    UseSSLSessionResumption = False
    SocksAuthentication = saNoAuthentication
    WebTunnelPort = 3128
    SocketBinding.Port = 0
    SocketBinding.ReuseAddress = False
    SocketBinding.PortRangeFrom = 0
    SocketBinding.PortRangeTo = 0
    RenegotiationAttackPreventionMode = rapmAuto
    SSLEnabled = False
    RequestParameters.ContentLength = -1
    RequestParameters.ContentRangeStart = -1
    RequestParameters.ContentRangeEnd = -1
    RequestParameters.ContentRangeFullSize = -1
    RequestParameters.UserAgent = 'SecureBlackbox'
    PreferKeepAlive = False
    ForceKeepAliveIfConnectionHeaderIsAbsent = False
    HTTPVersion = hvHTTP10
    UseNTLMAuth = False
    UseDigestAuth = False
    ForceNTLMAuth = False
    Use100Continue = False
    HTTPProxyPort = 3128
    HTTPProxyAuthentication = wtaNoAuthentication
    UseHTTPProxy = False
    OnCertificateValidate = ElHTTPSClientCertificateValidate
    Left = 33
    Top = 8
  end
  object ElCertificateLookup: TElCertificateLookup
    Criteria = [lcIssuer, lcSerialNumber]
    Options = [loMatchAll]
    PublicKeyAlgorithm = 0
    SignatureAlgorithm = 0
    PublicKeySizeMin = 0
    PublicKeySizeMax = 0
    KeyUsage = []
    PublicKeyHashAlgorithm = 28929
    CertificateHashAlgorithm = 0
    DateLookupOptions = []
    KeySizeLookupOption = ksloSmaller
    KeyUsageLookupOptions = []
    Left = 132
    Top = 8
  end
  object ElWinCertStorage: TElWinCertStorage
    Options = [csoStrictChainBuilding]
    ReadOnly = False
    Left = 33
    Top = 56
  end
  object ElMemoryCertStorage: TElMemoryCertStorage
    Options = [csoStrictChainBuilding]
    Left = 132
    Top = 56
  end
end
