unit XSign_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// $Rev: 52393 $
// File generated on 11/04/2019 11:02:19 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\WINDOWS\SysWow64\XSignPKCS7.dll (1)
// LIBID: {34EA3C16-C1C7-4E9B-8F8A-C27FD4B88845}
// LCID: 0
// Helpfile: 
// HelpString: XSign PKCS#7
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// SYS_KIND: SYS_WIN32
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics, Vcl.OleServer, Winapi.ActiveX;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  XSignMajorVersion = 1;
  XSignMinorVersion = 5;

  LIBID_XSign: TGUID = '{34EA3C16-C1C7-4E9B-8F8A-C27FD4B88845}';

  IID__XSignPKCS: TGUID = '{72302B27-93EB-4F8A-B6B3-DEB0372F4A7B}';
  CLASS_XSignPKCS: TGUID = '{7038ADCD-3B24-4C74-93C8-956C9F102823}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum FORMATO_ASSINATURA
type
  FORMATO_ASSINATURA = TOleEnum;
const
  ARQUIVO_BINARIO_FORMATO_P7S = $00000001;
  ARQUIVO_BASE64_FORMATO_P7S = $00000002;
  ARQUIVO_BINARIO_OUTRO_FORMATO = $00000003;
  ARQUIVO_BASE64_OUTRO_FORMATO = $00000004;
  STRING_BASE64_PKCS = $00000005;

// Constants for enum REPOSITORIO_CERTIFICADO
type
  REPOSITORIO_CERTIFICADO = TOleEnum;
const
  REPOSITORIO_CHAVES_PESSOAIS = $00000001;
  REPOSITORIO_CHAVES_PUBLICAS = $00000002;
  REPOSITORIO_CHAVES_AUTORIDADES_CERTIFICADORAS = $00000003;
  REPOSITORIO_CHAVES_RAIZES = $00000004;

// Constants for enum CERTIFICADOS_DIGITAIS
type
  CERTIFICADOS_DIGITAIS = TOleEnum;
const
  TODOS_CERTIFICADOS_DIGITAIS = $00000001;
  CERTIFICADOS_VALIDOS_ASSINATURA = $00000002;
  CERTIFICADOS_ICP_BRASIL = $00000003;
  CERTIFICADOS_ICP_TODOS_RECEITA_FEDERAL = $00000004;
  CERTIFICADOS_ICP_E_CPF = $00000005;
  CERTIFICADOS_ICP_E_CNPJ = $00000006;
  CERTIFICADOS_AC_XSIGN = $00000007;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  _XSignPKCS = interface;
  _XSignPKCSDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  XSignPKCS = _XSignPKCS;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//

  XSignPKCS___v0 = _XSignPKCS; 
  XSignPKCS___v1 = _XSignPKCS; 
  XSignPKCS___v2 = _XSignPKCS; 
  XSignPKCS___v3 = _XSignPKCS; 
  XSignPKCS___v4 = _XSignPKCS; 

  AssinaturaDigital = record
    NomeAssinatura: WideString;
    EmailAssinatura: WideString;
    DataAssinatura: WideString;
    AssinaturaValida: WordBool;
    DescricaoAssinaturaArquivo: WideString;
    SerialCertificado: WideString;
    DetalhesCertificado: WideString;
    AutoridadeCertificadora: WideString;
    EmailAutoridadeCertificadora: WideString;
    DetalhesAutoridadeCertificadora: WideString;
    ChavePublicaCertificado: WideString;
    ImpressaoDigitalCertificado: WideString;
    VersaoCertificado: WideString;
    DataEmissaoCertificado: WideString;
    DataValidadeCertificado: WideString;
    CertificadoValido: WordBool;
    CertificadoICPBrasil: WordBool;
    CadeiaCertificadoRaiz: WideString;
  end;


// *********************************************************************//
// Interface: _XSignPKCS
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {72302B27-93EB-4F8A-B6B3-DEB0372F4A7B}
// *********************************************************************//
  _XSignPKCS = interface(IDispatch)
    ['{72302B27-93EB-4F8A-B6B3-DEB0372F4A7B}']
    procedure Set_DataAssinatura(const Param1: WideString); safecall;
    function Get_DataAssinatura: WideString; safecall;
    procedure Set_AssinaturaTextoVerificar(const Param1: WideString); safecall;
    function Get_AssinaturaTextoVerificar: WideString; safecall;
    procedure Set_CaminhoArquivoOriginal(const Param1: WideString); safecall;
    function Get_CaminhoArquivoOriginal: WideString; safecall;
    procedure Set_ExtensaoOutroFormato(const Param1: WideString); safecall;
    function Get_ExtensaoOutroFormato: WideString; safecall;
    function Get_CaminhoArquivoAssinado: WideString; safecall;
    procedure Set_SalvarChavesPublicas(Param1: WordBool); safecall;
    function Get_SalvarChavesPublicas: WordBool; safecall;
    procedure Set_NaoAnexarArquivoOriginal(Param1: WordBool); safecall;
    function Get_NaoAnexarArquivoOriginal: WordBool; safecall;
    function Get_AssinaturaDigitalArquivo: WideString; safecall;
    procedure Set_PastaTemp(const Param1: WideString); safecall;
    function Get_PastaTemp: WideString; safecall;
    function Get_DescricaoErro: WideString; safecall;
    function Get_HashArquivo: WideString; safecall;
    function Get_TotalAssinaturas: Integer; safecall;
    function Get_NomeArquivoOriginal: WideString; safecall;
    function Get_Assinaturas(Index: Smallint): AssinaturaDigital; safecall;
    function SelecionarCertificadoDigital(TipoCertificado: CERTIFICADOS_DIGITAIS): WordBool; safecall;
    function AssinaArquivo(const strArquivoOrigem: WideString; const strPastaDestino: WideString; 
                           const strTextoDescricaoAssinatura: WideString; 
                           FormatoAssinatura: FORMATO_ASSINATURA): WordBool; safecall;
    function VerificarAssinaturaArquivo(const strCaminhoArquivo: WideString): WordBool; safecall;
    function VerificarAssinaturaTexto(const TextoAssinatura: WideString): WordBool; safecall;
    function DescriptografarArquivo(const strArquivoCriptografado: WideString): WordBool; safecall;
    function CriptografarArquivo(const strArquivoOrigem: WideString; 
                                 const strPastaDestino: WideString): WordBool; safecall;
    function AssinarCodigoExecutavel(const strCaminhoArquivo: WideString; 
                                     const DescricaoArquivo: WideString; 
                                     const URLArquivo: WideString; bolTestarAssinatura: WordBool): WordBool; safecall;
    function RetornarCadeiaSeparada(const strCadeiaCompleta: WideString; 
                                    var ArrayCadeiaCompleta: PSafeArray): Smallint; safecall;
    function ExibirCertificadoDigital(const strChavePublica: WideString): WordBool; safecall;
    function AbrirAdicionarArquivoCertificado(const strCaminhoArquivo: WideString; 
                                              TipoCertificadoRaiz: REPOSITORIO_CERTIFICADO): WordBool; safecall;
    function AdicionarCertificadoRepositorio(const strChavePublica: WideString; 
                                             TipoRepositorio: REPOSITORIO_CERTIFICADO): WordBool; safecall;
    function ExportarCertificadoDigital(const strCaminhoArquivoCER: WideString; 
                                        TipoRepositorio: REPOSITORIO_CERTIFICADO): WordBool; safecall;
    function SelecionarChavesPublicas(bolCriptografarParaSi: WordBool): WordBool; safecall;
    function ApagarArquivo(const strCaminhoArquivo: WideString): WordBool; safecall;
    function InstalarLCRCertificado(const strChavePublica: WideString): WordBool; safecall;
    function DownloadArquivo(const strURL: WideString; const strArquivoLocal: WideString): WordBool; safecall;
    function SetarLicencaUsuario(const strUsuario: WideString; const strLicenca: WideString): WordBool; safecall;
    function LimparPastaTemporaria: WordBool; safecall;
    function Get_NomeArquivoAssinado: WideString; safecall;
    function Get_CertificadoAutoridadeRaiz: WideString; safecall;
    procedure Set_UsarHashSalvarArquivo(Param1: WordBool); safecall;
    function Get_UsarHashSalvarArquivo: WordBool; safecall;
    function Get_RestricoesCertificadoDigital: WideString; safecall;
    function Get_ListaCertificadosRevogados: WideString; safecall;
    function Get_PoliticaCertificacaoDigital: WideString; safecall;
    function Get_DetalhesPessoaisCertificadoDigital: WideString; safecall;
    function Get_NumeroCNPJCertificadoDigital: WideString; safecall;
    function Get_OutrosDetalhesCertificadoDigital: WideString; safecall;
    function Get_UsoChaveCertificadoDigital: WideString; safecall;
    function Get_NumeroCPFCertificadoDigital: WideString; safecall;
    procedure Set_NaoExibirInstalacaoLCReCER(Param1: WordBool); safecall;
    function Get_NaoExibirInstalacaoLCReCER: WordBool; safecall;
    function Get_ValidadeLicenca: WideString; safecall;
    function RetornaHashArquivo(const strCaminhoArquivo: WideString): WideString; safecall;
    function RetornarDetalhesCertificado(const strChavePublica: WideString): WordBool; safecall;
    function DataHoraAssinaturaUTC(strDataHoraAssinatura: TDateTime): WideString; safecall;
    function RetornarChavePublicaCertificadoRaiz(const strNomeCertificado: WideString; 
                                                 const strImpressaoDigital: WideString): WideString; safecall;
    function InstalarCertificadosRaizes: WordBool; safecall;
    function VerificaCertificadoDigital(const strChavePublica: WideString): Smallint; safecall;
    function StatusCertificadoVerificado(intStatus: Smallint): WideString; safecall;
    function Get_TotalCertificadosListados: Smallint; safecall;
    procedure Set_TextoVerificar(const Param1: WideString); safecall;
    function Get_TextoVerificar: WideString; safecall;
    function Get_AssinaturaDigitalTexto: WideString; safecall;
    function Get_ConteudoTextoOriginal: WideString; safecall;
    function AbrirCertificadoDigital(const CaminhoCertificado: WideString; 
                                     const SenhaCertificado: WideString): WordBool; safecall;
    function SelecionarCertificadoDigitalHash(const strImpressaoDigital: WideString): WordBool; safecall;
    function AssinaTexto(const strTexto: WideString; const strTextoDescricaoAssinatura: WideString): WordBool; safecall;
    function VerificarTipoCodificacaoTexto(const strFile: WideString): WordBool; safecall;
    function ExibirPropriedadeAssinatura(Index: Smallint; const strCampoPropriedade: WideString): OleVariant; safecall;
    function ExibirPropriedadesCertificado(const strCampoPropriedade: WideString): OleVariant; safecall;
    function LerListaPropriedadeCertificado(intIndex: Smallint; const strPropriedade: WideString): WideString; safecall;
    function ListarCertificados(TipoCertificado: CERTIFICADOS_DIGITAIS): WordBool; safecall;
    function Get_DetalhesValidacaoCertificado: WideString; safecall;
    function SelecionarExibirCertificado(const strImpressaoDigital: WideString): WordBool; safecall;
    function CaminhoCorretoArquivo(const short_name: WideString): WideString; safecall;
    property DataAssinatura: WideString read Get_DataAssinatura write Set_DataAssinatura;
    property AssinaturaTextoVerificar: WideString read Get_AssinaturaTextoVerificar write Set_AssinaturaTextoVerificar;
    property CaminhoArquivoOriginal: WideString read Get_CaminhoArquivoOriginal write Set_CaminhoArquivoOriginal;
    property ExtensaoOutroFormato: WideString read Get_ExtensaoOutroFormato write Set_ExtensaoOutroFormato;
    property CaminhoArquivoAssinado: WideString read Get_CaminhoArquivoAssinado;
    property SalvarChavesPublicas: WordBool read Get_SalvarChavesPublicas write Set_SalvarChavesPublicas;
    property NaoAnexarArquivoOriginal: WordBool read Get_NaoAnexarArquivoOriginal write Set_NaoAnexarArquivoOriginal;
    property AssinaturaDigitalArquivo: WideString read Get_AssinaturaDigitalArquivo;
    property PastaTemp: WideString read Get_PastaTemp write Set_PastaTemp;
    property DescricaoErro: WideString read Get_DescricaoErro;
    property HashArquivo: WideString read Get_HashArquivo;
    property TotalAssinaturas: Integer read Get_TotalAssinaturas;
    property NomeArquivoOriginal: WideString read Get_NomeArquivoOriginal;
    property Assinaturas[Index: Smallint]: AssinaturaDigital read Get_Assinaturas;
    property NomeArquivoAssinado: WideString read Get_NomeArquivoAssinado;
    property CertificadoAutoridadeRaiz: WideString read Get_CertificadoAutoridadeRaiz;
    property UsarHashSalvarArquivo: WordBool read Get_UsarHashSalvarArquivo write Set_UsarHashSalvarArquivo;
    property RestricoesCertificadoDigital: WideString read Get_RestricoesCertificadoDigital;
    property ListaCertificadosRevogados: WideString read Get_ListaCertificadosRevogados;
    property PoliticaCertificacaoDigital: WideString read Get_PoliticaCertificacaoDigital;
    property DetalhesPessoaisCertificadoDigital: WideString read Get_DetalhesPessoaisCertificadoDigital;
    property NumeroCNPJCertificadoDigital: WideString read Get_NumeroCNPJCertificadoDigital;
    property OutrosDetalhesCertificadoDigital: WideString read Get_OutrosDetalhesCertificadoDigital;
    property UsoChaveCertificadoDigital: WideString read Get_UsoChaveCertificadoDigital;
    property NumeroCPFCertificadoDigital: WideString read Get_NumeroCPFCertificadoDigital;
    property NaoExibirInstalacaoLCReCER: WordBool read Get_NaoExibirInstalacaoLCReCER write Set_NaoExibirInstalacaoLCReCER;
    property ValidadeLicenca: WideString read Get_ValidadeLicenca;
    property TotalCertificadosListados: Smallint read Get_TotalCertificadosListados;
    property TextoVerificar: WideString read Get_TextoVerificar write Set_TextoVerificar;
    property AssinaturaDigitalTexto: WideString read Get_AssinaturaDigitalTexto;
    property ConteudoTextoOriginal: WideString read Get_ConteudoTextoOriginal;
    property DetalhesValidacaoCertificado: WideString read Get_DetalhesValidacaoCertificado;
  end;

// *********************************************************************//
// DispIntf:  _XSignPKCSDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {72302B27-93EB-4F8A-B6B3-DEB0372F4A7B}
// *********************************************************************//
  _XSignPKCSDisp = dispinterface
    ['{72302B27-93EB-4F8A-B6B3-DEB0372F4A7B}']
    property DataAssinatura: WideString dispid 1745027085;
    property AssinaturaTextoVerificar: WideString dispid 1745027084;
    property CaminhoArquivoOriginal: WideString dispid 1745027083;
    property ExtensaoOutroFormato: WideString dispid 1745027082;
    property CaminhoArquivoAssinado: WideString readonly dispid 1745027081;
    property SalvarChavesPublicas: WordBool dispid 1745027080;
    property NaoAnexarArquivoOriginal: WordBool dispid 1745027079;
    property AssinaturaDigitalArquivo: WideString readonly dispid 1745027078;
    property PastaTemp: WideString dispid 1745027077;
    property DescricaoErro: WideString readonly dispid 1745027076;
    property HashArquivo: WideString readonly dispid 1745027075;
    property TotalAssinaturas: Integer readonly dispid 1745027074;
    property NomeArquivoOriginal: WideString readonly dispid 1745027073;
    property Assinaturas[Index: Smallint]: {NOT_OLEAUTO(AssinaturaDigital)}OleVariant readonly dispid 1745027072;
    function SelecionarCertificadoDigital(TipoCertificado: CERTIFICADOS_DIGITAIS): WordBool; dispid 1610809363;
    function AssinaArquivo(const strArquivoOrigem: WideString; const strPastaDestino: WideString; 
                           const strTextoDescricaoAssinatura: WideString; 
                           FormatoAssinatura: FORMATO_ASSINATURA): WordBool; dispid 1610809366;
    function VerificarAssinaturaArquivo(const strCaminhoArquivo: WideString): WordBool; dispid 1610809373;
    function VerificarAssinaturaTexto(const TextoAssinatura: WideString): WordBool; dispid 1610809374;
    function DescriptografarArquivo(const strArquivoCriptografado: WideString): WordBool; dispid 1610809376;
    function CriptografarArquivo(const strArquivoOrigem: WideString; 
                                 const strPastaDestino: WideString): WordBool; dispid 1610809377;
    function AssinarCodigoExecutavel(const strCaminhoArquivo: WideString; 
                                     const DescricaoArquivo: WideString; 
                                     const URLArquivo: WideString; bolTestarAssinatura: WordBool): WordBool; dispid 1610809378;
    function RetornarCadeiaSeparada(const strCadeiaCompleta: WideString; 
                                    var ArrayCadeiaCompleta: {NOT_OLEAUTO(PSafeArray)}OleVariant): Smallint; dispid 1610809379;
    function ExibirCertificadoDigital(const strChavePublica: WideString): WordBool; dispid 1610809382;
    function AbrirAdicionarArquivoCertificado(const strCaminhoArquivo: WideString; 
                                              TipoCertificadoRaiz: REPOSITORIO_CERTIFICADO): WordBool; dispid 1610809383;
    function AdicionarCertificadoRepositorio(const strChavePublica: WideString; 
                                             TipoRepositorio: REPOSITORIO_CERTIFICADO): WordBool; dispid 1610809384;
    function ExportarCertificadoDigital(const strCaminhoArquivoCER: WideString; 
                                        TipoRepositorio: REPOSITORIO_CERTIFICADO): WordBool; dispid 1610809385;
    function SelecionarChavesPublicas(bolCriptografarParaSi: WordBool): WordBool; dispid 1610809391;
    function ApagarArquivo(const strCaminhoArquivo: WideString): WordBool; dispid 1610809399;
    function InstalarLCRCertificado(const strChavePublica: WideString): WordBool; dispid 1610809400;
    function DownloadArquivo(const strURL: WideString; const strArquivoLocal: WideString): WordBool; dispid 1610809402;
    function SetarLicencaUsuario(const strUsuario: WideString; const strLicenca: WideString): WordBool; dispid 1610809406;
    function LimparPastaTemporaria: WordBool; dispid 1610809412;
    property NomeArquivoAssinado: WideString readonly dispid 1745027153;
    property CertificadoAutoridadeRaiz: WideString readonly dispid 1745027152;
    property UsarHashSalvarArquivo: WordBool dispid 1745027151;
    property RestricoesCertificadoDigital: WideString readonly dispid 1745027150;
    property ListaCertificadosRevogados: WideString readonly dispid 1745027149;
    property PoliticaCertificacaoDigital: WideString readonly dispid 1745027148;
    property DetalhesPessoaisCertificadoDigital: WideString readonly dispid 1745027147;
    property NumeroCNPJCertificadoDigital: WideString readonly dispid 1745027146;
    property OutrosDetalhesCertificadoDigital: WideString readonly dispid 1745027145;
    property UsoChaveCertificadoDigital: WideString readonly dispid 1745027144;
    property NumeroCPFCertificadoDigital: WideString readonly dispid 1745027143;
    property NaoExibirInstalacaoLCReCER: WordBool dispid 1745027142;
    property ValidadeLicenca: WideString readonly dispid 1745027141;
    function RetornaHashArquivo(const strCaminhoArquivo: WideString): WideString; dispid 1610809443;
    function RetornarDetalhesCertificado(const strChavePublica: WideString): WordBool; dispid 1610809448;
    function DataHoraAssinaturaUTC(strDataHoraAssinatura: TDateTime): WideString; dispid 1610809471;
    function RetornarChavePublicaCertificadoRaiz(const strNomeCertificado: WideString; 
                                                 const strImpressaoDigital: WideString): WideString; dispid 1610809520;
    function InstalarCertificadosRaizes: WordBool; dispid 1610809522;
    function VerificaCertificadoDigital(const strChavePublica: WideString): Smallint; dispid 1610809523;
    function StatusCertificadoVerificado(intStatus: Smallint): WideString; dispid 1610809524;
    property TotalCertificadosListados: Smallint readonly dispid 1745027256;
    property TextoVerificar: WideString dispid 1745027255;
    property AssinaturaDigitalTexto: WideString readonly dispid 1745027254;
    property ConteudoTextoOriginal: WideString readonly dispid 1745027253;
    function AbrirCertificadoDigital(const CaminhoCertificado: WideString; 
                                     const SenhaCertificado: WideString): WordBool; dispid 1610809535;
    function SelecionarCertificadoDigitalHash(const strImpressaoDigital: WideString): WordBool; dispid 1610809536;
    function AssinaTexto(const strTexto: WideString; const strTextoDescricaoAssinatura: WideString): WordBool; dispid 1610809539;
    function VerificarTipoCodificacaoTexto(const strFile: WideString): WordBool; dispid 1610809550;
    function ExibirPropriedadeAssinatura(Index: Smallint; const strCampoPropriedade: WideString): OleVariant; dispid 1610809551;
    function ExibirPropriedadesCertificado(const strCampoPropriedade: WideString): OleVariant; dispid 1610809552;
    function LerListaPropriedadeCertificado(intIndex: Smallint; const strPropriedade: WideString): WideString; dispid 1610809562;
    function ListarCertificados(TipoCertificado: CERTIFICADOS_DIGITAIS): WordBool; dispid 1610809563;
    property DetalhesValidacaoCertificado: WideString readonly dispid 1745027292;
    function SelecionarExibirCertificado(const strImpressaoDigital: WideString): WordBool; dispid 1610809602;
    function CaminhoCorretoArquivo(const short_name: WideString): WideString; dispid 1610809621;
  end;

// *********************************************************************//
// The Class CoXSignPKCS provides a Create and CreateRemote method to          
// create instances of the default interface _XSignPKCS exposed by              
// the CoClass XSignPKCS. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoXSignPKCS = class
    class function Create: _XSignPKCS;
    class function CreateRemote(const MachineName: string): _XSignPKCS;
  end;

implementation

uses System.Win.ComObj;

class function CoXSignPKCS.Create: _XSignPKCS;
begin
  Result := CreateComObject(CLASS_XSignPKCS) as _XSignPKCS;
end;

class function CoXSignPKCS.CreateRemote(const MachineName: string): _XSignPKCS;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_XSignPKCS) as _XSignPKCS;
end;

end.
