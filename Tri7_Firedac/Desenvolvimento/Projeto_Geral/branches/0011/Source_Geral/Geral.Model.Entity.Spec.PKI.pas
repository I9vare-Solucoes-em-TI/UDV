unit Geral.Model.Entity.Spec.PKI;

interface

uses
  Geral.Model.Entity.Spec.Blob,
  Geral.Model.Entity.Spec.Maybe,
  Xml.XMLIntf;

type
  IKey = interface
    ['{CCFDEB71-7F49-48AF-8516-A5EAA89CB0DC}']

    function Encoded: IBlob;
  end;

  IPublicKey = interface(IKey)
    ['{B35CEE6B-3EE6-4CBF-851C-44D0FB0DDC3D}']
  end;

  ICertificate = interface
    ['{F8366547-F589-44DD-999A-0FC41B7BC4EA}']

    function PublicKey: IPublicKey;
  end;

  IX500Principal = interface
    ['{598DD161-0EF6-4842-A07E-0C4D97284C61}']

    function CommonName: string;
  end;

  IX509Certificate = interface(ICertificate)
    ['{409E3355-DADA-4659-AD52-B9E5A5E9FB90}']

    function Issuer: IX500Principal;
    function SerialNumber: string;
  end;

  ISelecaoCertificadoDigital = interface
    ['{4856AA2D-7ADA-4F50-876A-24E3C12CBB7B}']

    function Selecionar: IMaybe<IX509Certificate>;
  end;

  IAssinaturaArquivo = interface
    ['{A80C2D2F-2526-46AA-8F65-C443FCE83156}']

    function Assinar(
      const vpCaminhoArquivo: string;
      const vpX509Certificate: IX509Certificate): string;

  end;

  IAssinaturaTexto = interface
    ['{8B69B673-6856-4E96-A713-DAAE1A9C57E7}']

    function Assinar(
      const vpTexto: string;
      const vpX509Certificate: IX509Certificate): string;
  end;

  IAssinaturaPADES = interface
    ['{A76ED9D2-CE1C-4AF6-8934-BA16B13EB8D9}']

    function Assinar(
      const vpCaminhoArquivo: string;
      const vpX509Certificate: IX509Certificate;
      const vpAssinaturaVisivel: Boolean;
      const vpBackground: Boolean;
      const vpShowOnAllPages: Boolean;
      const vpPassword: string): Boolean;
  end;

  IAssinaturaXmlDSig = interface
    ['{57D60298-6058-470A-8A1D-14532173E789}']

    function Assinar(
      const vpXml: IXMLDocument;
      const vpCertificado: IX509Certificate;
      const vpTag: IXMLNode): IXMLDocument;
  end;

  IValidarAssinatura = interface
     ['{42E48130-6126-48D5-98C9-66D659D16CAE}']

    function ValidarAssinatura(
      const vpCaminhoArquivo: string): Boolean;
  end;

implementation

end.
