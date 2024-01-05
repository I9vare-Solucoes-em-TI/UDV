unit CHILKATCRYPT2Lib_TLB;

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

// $Rev: 8291 $
// File generated on 29/10/2014 10:35:28 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Windows\SysWow64\ChilkatCrypt2.dll (1)
// LIBID: {ED798215-27F2-448D-8E51-CA2BD5DDE14B}
// LCID: 0
// Helpfile: 
// HelpString: Chilkat Crypt
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// Errors:
//   Hint: Parameter 'array' of ICkStringArray.Union changed to 'array_'
//   Hint: Parameter 'array' of ICkStringArray.Intersect changed to 'array_'
//   Hint: Parameter 'array' of ICkStringArray.Subtract changed to 'array_'
//   Hint: Parameter 'on' of IChilkatNtlm.SetFlag changed to 'on_'
// ************************************************************************ //
// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, OleCtrls, OleServer, StdVCL, Variants;
  


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  CHILKATCRYPT2LibMajorVersion = 1;
  CHILKATCRYPT2LibMinorVersion = 0;

  LIBID_CHILKATCRYPT2Lib: TGUID = '{ED798215-27F2-448D-8E51-CA2BD5DDE14B}';

  DIID__IChilkatCrypt2Events: TGUID = '{445E7755-E363-46E0-B3A8-011441B199E7}';
  IID_IChilkatCrypt2: TGUID = '{CA46B1CF-64C1-4D8C-B359-26BAA6C04151}';
  CLASS_ChilkatCrypt2: TGUID = '{3352B5B9-82E8-4FFD-9EB1-1A3E60056904}';
  IID_IChilkatCSP: TGUID = '{D12FB216-99DA-4EB3-9CC0-C0F760B174A0}';
  IID_ICkStringArray: TGUID = '{4340DF8E-D7A3-4675-BE74-80077B2B3E81}';
  IID_IChilkatCert: TGUID = '{D56C1AF1-3FDE-471C-9BC2-C52515F260C1}';
  IID_IPublicKey: TGUID = '{06544919-F559-4AE5-9001-F903BD8A84E6}';
  IID_IPrivateKey: TGUID = '{C4C23B78-DB98-444C-B601-DCAC6EBBEC54}';
  IID_IChilkatOmaDrm: TGUID = '{19F2FAA4-E912-4F11-95F9-9205722DFE0F}';
  CLASS_ChilkatOmaDrm: TGUID = '{0B70AB61-5C95-4126-9985-A32531CA8619}';
  IID_IChilkatNtlm: TGUID = '{5902F126-6A2B-4C82-A8FE-CD1E063F4AD1}';
  CLASS_ChilkatNtlm: TGUID = '{9794AD41-68E7-4815-BED1-EC7676DC001F}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  _IChilkatCrypt2Events = dispinterface;
  IChilkatCrypt2 = interface;
  IChilkatCrypt2Disp = dispinterface;
  IChilkatCSP = interface;
  IChilkatCSPDisp = dispinterface;
  ICkStringArray = interface;
  ICkStringArrayDisp = dispinterface;
  IChilkatCert = interface;
  IChilkatCertDisp = dispinterface;
  IPublicKey = interface;
  IPublicKeyDisp = dispinterface;
  IPrivateKey = interface;
  IPrivateKeyDisp = dispinterface;
  IChilkatOmaDrm = interface;
  IChilkatOmaDrmDisp = dispinterface;
  IChilkatNtlm = interface;
  IChilkatNtlmDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  ChilkatCrypt2 = IChilkatCrypt2;
  ChilkatOmaDrm = IChilkatOmaDrm;
  ChilkatNtlm = IChilkatNtlm;


// *********************************************************************//
// DispIntf:  _IChilkatCrypt2Events
// Flags:     (4096) Dispatchable
// GUID:      {445E7755-E363-46E0-B3A8-011441B199E7}
// *********************************************************************//
  _IChilkatCrypt2Events = dispinterface
    ['{445E7755-E363-46E0-B3A8-011441B199E7}']
    procedure PercentDone(pctDone: Integer); dispid 1;
    procedure AbortCheck(out abort: Integer); dispid 2;
  end;

// *********************************************************************//
// Interface: IChilkatCrypt2
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {CA46B1CF-64C1-4D8C-B359-26BAA6C04151}
// *********************************************************************//
  IChilkatCrypt2 = interface(IDispatch)
    ['{CA46B1CF-64C1-4D8C-B359-26BAA6C04151}']
    function UnlockComponent(const b1: WideString): Integer; safecall;
    function IsUnlocked: Integer; safecall;
    function Get_LastErrorText: WideString; safecall;
    function Get_LastErrorXml: WideString; safecall;
    function Get_LastErrorHtml: WideString; safecall;
    function SaveLastError(const b1: WideString): Integer; safecall;
    function Get_Version: WideString; safecall;
    function Get_SecretKey: OleVariant; safecall;
    procedure Set_SecretKey(pVal: OleVariant); safecall;
    function Get_IV: OleVariant; safecall;
    procedure Set_IV(pVal: OleVariant); safecall;
    function Get_KeyLength: Integer; safecall;
    procedure Set_KeyLength(pVal: Integer); safecall;
    function Get_PaddingScheme: Integer; safecall;
    procedure Set_PaddingScheme(pVal: Integer); safecall;
    function Get_CipherMode: WideString; safecall;
    procedure Set_CipherMode(const pVal: WideString); safecall;
    function GenerateSecretKey(const str: WideString): OleVariant; safecall;
    procedure SetCSP(const iCSP: IChilkatCSP); safecall;
    function Get_Charset: WideString; safecall;
    procedure Set_Charset(const pVal: WideString); safecall;
    function Get_HashAlgorithm: WideString; safecall;
    procedure Set_HashAlgorithm(const pVal: WideString); safecall;
    function Get_CryptAlgorithm: WideString; safecall;
    procedure Set_CryptAlgorithm(const pVal: WideString); safecall;
    function HashString(const str: WideString): OleVariant; safecall;
    function HashBytes(data: OleVariant): OleVariant; safecall;
    function Get_EncodingMode: WideString; safecall;
    procedure Set_EncodingMode(const pVal: WideString); safecall;
    function HashStringENC(const str: WideString): WideString; safecall;
    function HashBytesENC(data: OleVariant): WideString; safecall;
    function EncryptBytes(data: OleVariant): OleVariant; safecall;
    function EncryptString(const str: WideString): OleVariant; safecall;
    function EncryptBytesENC(data: OleVariant): WideString; safecall;
    function EncryptStringENC(const str: WideString): WideString; safecall;
    function DecryptBytes(data: OleVariant): OleVariant; safecall;
    function DecryptBytesENC(const str: WideString): OleVariant; safecall;
    function DecryptString(data: OleVariant): WideString; safecall;
    function DecryptStringENC(const str: WideString): WideString; safecall;
    function Get_CompressionAlgorithm: WideString; safecall;
    procedure Set_CompressionAlgorithm(const pVal: WideString); safecall;
    function CompressBytes(data: OleVariant): OleVariant; safecall;
    function CompressString(const str: WideString): OleVariant; safecall;
    function CompressBytesENC(data: OleVariant): WideString; safecall;
    function CompressStringENC(const str: WideString): WideString; safecall;
    function InflateBytes(data: OleVariant): OleVariant; safecall;
    function InflateBytesENC(const str: WideString): OleVariant; safecall;
    function InflateString(data: OleVariant): WideString; safecall;
    function InflateStringENC(const str: WideString): WideString; safecall;
    function SignBytes(data: OleVariant): OleVariant; safecall;
    function SignString(const str: WideString): OleVariant; safecall;
    function SignBytesENC(data: OleVariant): WideString; safecall;
    function SignStringENC(const str: WideString): WideString; safecall;
    function VerifyBytes(data: OleVariant; signature: OleVariant): Integer; safecall;
    function VerifyBytesENC(data: OleVariant; const encodedSig: WideString): Integer; safecall;
    function VerifyString(const str: WideString; signature: OleVariant): Integer; safecall;
    function VerifyStringENC(const str: WideString; const encodedSig: WideString): Integer; safecall;
    procedure SetSigningCert(const iCert: IChilkatCert); safecall;
    procedure SetEncryptCert(const iCert: IChilkatCert); safecall;
    function GetLastCert: IChilkatCert; safecall;
    procedure SetVerifyCert(const iCert: IChilkatCert); safecall;
    function ReadFile(const filename: WideString): OleVariant; safecall;
    function WriteFile(const filename: WideString; binaryData: OleVariant): Integer; safecall;
    function OpaqueSignBytes(data: OleVariant): OleVariant; safecall;
    function OpaqueSignString(const str: WideString): OleVariant; safecall;
    function OpaqueSignBytesENC(data: OleVariant): WideString; safecall;
    function OpaqueSignStringENC(const str: WideString): WideString; safecall;
    function OpaqueVerifyBytes(data: OleVariant): OleVariant; safecall;
    function OpaqueVerifyString(data: OleVariant): WideString; safecall;
    function OpaqueVerifyBytesENC(const str: WideString): OleVariant; safecall;
    function OpaqueVerifyStringENC(const str: WideString): WideString; safecall;
    function CkEncryptFile(const inFilename: WideString; const outFilename: WideString): Integer; safecall;
    function CkDecryptFile(const inFilename: WideString; const outFilename: WideString): Integer; safecall;
    procedure SetSecretKeyViaPassword(const password: WideString); safecall;
    function ByteSwap4321(bData: OleVariant): OleVariant; safecall;
    function Shorten(inData: OleVariant; numBytes: Integer): OleVariant; safecall;
    function Get_ByteSwapOnDecrypt: Integer; safecall;
    procedure Set_ByteSwapOnDecrypt(bVal: Integer); safecall;
    function Encode(byteData: OleVariant; const encoding: WideString): WideString; safecall;
    function Decode(const encodedStr: WideString; const encoding: WideString): OleVariant; safecall;
    procedure SetEncodedKey(const keyStr: WideString; const encoding: WideString); safecall;
    procedure SetEncodedIV(const ivStr: WideString; const encoding: WideString); safecall;
    function GetEncodedKey(const encoding: WideString): WideString; safecall;
    function GetEncodedIV(const encoding: WideString): WideString; safecall;
    procedure RandomizeIV; safecall;
    function BytesToString(inData: OleVariant; const Charset: WideString): WideString; safecall;
    function StringToBytes(const inStr: WideString; const Charset: WideString): OleVariant; safecall;
    function TrimEndingWith(const inStr: WideString; const ending: WideString): WideString; safecall;
    function GenEncodedSecretKey(const password: WideString; const encoding: WideString): WideString; safecall;
    function CreateP7S(const inFilename: WideString; const p7sFilename: WideString): Integer; safecall;
    function VerifyP7S(const inFilename: WideString; const p7sFilename: WideString): Integer; safecall;
    function HashFileENC(const filename: WideString): WideString; safecall;
    function HashFile(const filename: WideString): OleVariant; safecall;
    procedure SetHmacKeyBytes(keyBytes: OleVariant); safecall;
    procedure SetHmacKeyString(const key: WideString); safecall;
    function HmacBytes(inBytes: OleVariant): OleVariant; safecall;
    function HmacString(const inText: WideString): OleVariant; safecall;
    function HmacBytesENC(inBytes: OleVariant): WideString; safecall;
    function HmacStringENC(const inText: WideString): WideString; safecall;
    function CreateDetachedSignature(const inFilename: WideString; const sigFilename: WideString): Integer; safecall;
    function VerifyDetachedSignature(const inFilename: WideString; const sigFilename: WideString): Integer; safecall;
    function Get_HavalRounds: Integer; safecall;
    procedure Set_HavalRounds(numRounds: Integer); safecall;
    function CreateP7M(const inFilename: WideString; const p7mFilename: WideString): Integer; safecall;
    function VerifyP7M(const p7mFilename: WideString; const outFilename: WideString): Integer; safecall;
    function Get_Rc2EffectiveKeyLength: Integer; safecall;
    procedure Set_Rc2EffectiveKeyLength(pVal: Integer); safecall;
    function Get_LastChunk: Integer; safecall;
    procedure Set_LastChunk(bVal: Integer); safecall;
    function Get_FirstChunk: Integer; safecall;
    procedure Set_FirstChunk(bVal: Integer); safecall;
    function Get_BlockSize: Integer; safecall;
    procedure SetHmacKeyEncoded(const key: WideString; const encoding: WideString); safecall;
    function Get_IncludeCertChain: Integer; safecall;
    procedure Set_IncludeCertChain(bVal: Integer); safecall;
    function SetDecryptCert2(const cert: IChilkatCert; const key: IPrivateKey): Integer; safecall;
    function SetDecryptCert(const cert: IChilkatCert): Integer; safecall;
    function EncryptEncoded(const str: WideString): WideString; safecall;
    function DecryptEncoded(const str: WideString): WideString; safecall;
    function ReEncode(const data: WideString; const fromEncoding: WideString; 
                      const toEncoding: WideString): WideString; safecall;
    procedure RandomizeKey; safecall;
    procedure AddEncryptCert(const cert: IChilkatCert); safecall;
    procedure ClearEncryptCerts; safecall;
    function GenRandomBytesENC(numBytes: Integer): WideString; safecall;
    function Pbkdf1(const password: WideString; const Charset: WideString; 
                    const hashAlg: WideString; const salt: WideString; iterationCount: Integer; 
                    outputKeyBitLen: Integer; const encoding: WideString): WideString; safecall;
    function Pbkdf2(const password: WideString; const Charset: WideString; 
                    const hashAlg: WideString; const salt: WideString; iterationCount: Integer; 
                    outputKeyBitLen: Integer; const encoding: WideString): WideString; safecall;
    function Get_PbesPassword: WideString; safecall;
    procedure Set_PbesPassword(const propVal: WideString); safecall;
    function Get_salt: OleVariant; safecall;
    procedure Set_salt(propVal: OleVariant); safecall;
    function Get_iterationCount: Integer; safecall;
    procedure Set_iterationCount(propVal: Integer); safecall;
    procedure SetEncodedSalt(const saltStr: WideString; const encoding: WideString); safecall;
    function GetEncodedSalt(const encoding: WideString): WideString; safecall;
    function Get_PbesAlgorithm: WideString; safecall;
    procedure Set_PbesAlgorithm(const propVal: WideString); safecall;
    function HashBeginBytes(data: OleVariant): Integer; safecall;
    function HashBeginString(const strData: WideString): Integer; safecall;
    function HashMoreString(const strData: WideString): Integer; safecall;
    function HashMoreBytes(data: OleVariant): Integer; safecall;
    function HashFinal: OleVariant; safecall;
    function HashFinalENC: WideString; safecall;
    function MySqlAesEncrypt(const strData: WideString; const strKey: WideString): WideString; safecall;
    function MySqlAesDecrypt(const strEncrypted: WideString; const strKey: WideString): WideString; safecall;
    function EncodeString(const inStr: WideString; const Charset: WideString; 
                          const encoding: WideString): WideString; safecall;
    function DecodeString(const inStr: WideString; const Charset: WideString; 
                          const encoding: WideString): WideString; safecall;
    function Get_UuMode: WideString; safecall;
    procedure Set_UuMode(const propVal: WideString); safecall;
    function Get_UuFilename: WideString; safecall;
    procedure Set_UuFilename(const propVal: WideString); safecall;
    function Get_VerboseLogging: Integer; safecall;
    procedure Set_VerboseLogging(propVal: Integer); safecall;
    function AddPfxSourceData(pfxData: OleVariant; const password: WideString): Integer; safecall;
    function AddPfxSourceFile(const pfxFilePath: WideString; const password: WideString): Integer; safecall;
    function Get_Pkcs7CryptAlg: WideString; safecall;
    procedure Set_Pkcs7CryptAlg(const propVal: WideString); safecall;
    function SetSigningCert2(const cert: IChilkatCert; const key: IPrivateKey): Integer; safecall;
    property LastErrorText: WideString read Get_LastErrorText;
    property LastErrorXml: WideString read Get_LastErrorXml;
    property LastErrorHtml: WideString read Get_LastErrorHtml;
    property Version: WideString read Get_Version;
    property SecretKey: OleVariant read Get_SecretKey write Set_SecretKey;
    property IV: OleVariant read Get_IV write Set_IV;
    property KeyLength: Integer read Get_KeyLength write Set_KeyLength;
    property PaddingScheme: Integer read Get_PaddingScheme write Set_PaddingScheme;
    property CipherMode: WideString read Get_CipherMode write Set_CipherMode;
    property Charset: WideString read Get_Charset write Set_Charset;
    property HashAlgorithm: WideString read Get_HashAlgorithm write Set_HashAlgorithm;
    property CryptAlgorithm: WideString read Get_CryptAlgorithm write Set_CryptAlgorithm;
    property EncodingMode: WideString read Get_EncodingMode write Set_EncodingMode;
    property CompressionAlgorithm: WideString read Get_CompressionAlgorithm write Set_CompressionAlgorithm;
    property ByteSwapOnDecrypt: Integer read Get_ByteSwapOnDecrypt write Set_ByteSwapOnDecrypt;
    property HavalRounds: Integer read Get_HavalRounds write Set_HavalRounds;
    property Rc2EffectiveKeyLength: Integer read Get_Rc2EffectiveKeyLength write Set_Rc2EffectiveKeyLength;
    property LastChunk: Integer read Get_LastChunk write Set_LastChunk;
    property FirstChunk: Integer read Get_FirstChunk write Set_FirstChunk;
    property BlockSize: Integer read Get_BlockSize;
    property IncludeCertChain: Integer read Get_IncludeCertChain write Set_IncludeCertChain;
    property PbesPassword: WideString read Get_PbesPassword write Set_PbesPassword;
    property salt: OleVariant read Get_salt write Set_salt;
    property iterationCount: Integer read Get_iterationCount write Set_iterationCount;
    property PbesAlgorithm: WideString read Get_PbesAlgorithm write Set_PbesAlgorithm;
    property UuMode: WideString read Get_UuMode write Set_UuMode;
    property UuFilename: WideString read Get_UuFilename write Set_UuFilename;
    property VerboseLogging: Integer read Get_VerboseLogging write Set_VerboseLogging;
    property Pkcs7CryptAlg: WideString read Get_Pkcs7CryptAlg write Set_Pkcs7CryptAlg;
  end;

// *********************************************************************//
// DispIntf:  IChilkatCrypt2Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {CA46B1CF-64C1-4D8C-B359-26BAA6C04151}
// *********************************************************************//
  IChilkatCrypt2Disp = dispinterface
    ['{CA46B1CF-64C1-4D8C-B359-26BAA6C04151}']
    function UnlockComponent(const b1: WideString): Integer; dispid 1;
    function IsUnlocked: Integer; dispid 2;
    property LastErrorText: WideString readonly dispid 3;
    property LastErrorXml: WideString readonly dispid 4;
    property LastErrorHtml: WideString readonly dispid 5;
    function SaveLastError(const b1: WideString): Integer; dispid 6;
    property Version: WideString readonly dispid 7;
    property SecretKey: OleVariant dispid 8;
    property IV: OleVariant dispid 9;
    property KeyLength: Integer dispid 10;
    property PaddingScheme: Integer dispid 11;
    property CipherMode: WideString dispid 12;
    function GenerateSecretKey(const str: WideString): OleVariant; dispid 13;
    procedure SetCSP(const iCSP: IChilkatCSP); dispid 14;
    property Charset: WideString dispid 15;
    property HashAlgorithm: WideString dispid 16;
    property CryptAlgorithm: WideString dispid 17;
    function HashString(const str: WideString): OleVariant; dispid 18;
    function HashBytes(data: OleVariant): OleVariant; dispid 19;
    property EncodingMode: WideString dispid 20;
    function HashStringENC(const str: WideString): WideString; dispid 21;
    function HashBytesENC(data: OleVariant): WideString; dispid 22;
    function EncryptBytes(data: OleVariant): OleVariant; dispid 23;
    function EncryptString(const str: WideString): OleVariant; dispid 24;
    function EncryptBytesENC(data: OleVariant): WideString; dispid 25;
    function EncryptStringENC(const str: WideString): WideString; dispid 26;
    function DecryptBytes(data: OleVariant): OleVariant; dispid 27;
    function DecryptBytesENC(const str: WideString): OleVariant; dispid 28;
    function DecryptString(data: OleVariant): WideString; dispid 29;
    function DecryptStringENC(const str: WideString): WideString; dispid 30;
    property CompressionAlgorithm: WideString dispid 31;
    function CompressBytes(data: OleVariant): OleVariant; dispid 32;
    function CompressString(const str: WideString): OleVariant; dispid 33;
    function CompressBytesENC(data: OleVariant): WideString; dispid 34;
    function CompressStringENC(const str: WideString): WideString; dispid 35;
    function InflateBytes(data: OleVariant): OleVariant; dispid 36;
    function InflateBytesENC(const str: WideString): OleVariant; dispid 37;
    function InflateString(data: OleVariant): WideString; dispid 38;
    function InflateStringENC(const str: WideString): WideString; dispid 39;
    function SignBytes(data: OleVariant): OleVariant; dispid 40;
    function SignString(const str: WideString): OleVariant; dispid 41;
    function SignBytesENC(data: OleVariant): WideString; dispid 42;
    function SignStringENC(const str: WideString): WideString; dispid 43;
    function VerifyBytes(data: OleVariant; signature: OleVariant): Integer; dispid 44;
    function VerifyBytesENC(data: OleVariant; const encodedSig: WideString): Integer; dispid 45;
    function VerifyString(const str: WideString; signature: OleVariant): Integer; dispid 46;
    function VerifyStringENC(const str: WideString; const encodedSig: WideString): Integer; dispid 47;
    procedure SetSigningCert(const iCert: IChilkatCert); dispid 48;
    procedure SetEncryptCert(const iCert: IChilkatCert); dispid 49;
    function GetLastCert: IChilkatCert; dispid 50;
    procedure SetVerifyCert(const iCert: IChilkatCert); dispid 51;
    function ReadFile(const filename: WideString): OleVariant; dispid 52;
    function WriteFile(const filename: WideString; binaryData: OleVariant): Integer; dispid 53;
    function OpaqueSignBytes(data: OleVariant): OleVariant; dispid 54;
    function OpaqueSignString(const str: WideString): OleVariant; dispid 55;
    function OpaqueSignBytesENC(data: OleVariant): WideString; dispid 56;
    function OpaqueSignStringENC(const str: WideString): WideString; dispid 57;
    function OpaqueVerifyBytes(data: OleVariant): OleVariant; dispid 58;
    function OpaqueVerifyString(data: OleVariant): WideString; dispid 60;
    function OpaqueVerifyBytesENC(const str: WideString): OleVariant; dispid 59;
    function OpaqueVerifyStringENC(const str: WideString): WideString; dispid 61;
    function CkEncryptFile(const inFilename: WideString; const outFilename: WideString): Integer; dispid 62;
    function CkDecryptFile(const inFilename: WideString; const outFilename: WideString): Integer; dispid 63;
    procedure SetSecretKeyViaPassword(const password: WideString); dispid 64;
    function ByteSwap4321(bData: OleVariant): OleVariant; dispid 65;
    function Shorten(inData: OleVariant; numBytes: Integer): OleVariant; dispid 66;
    property ByteSwapOnDecrypt: Integer dispid 67;
    function Encode(byteData: OleVariant; const encoding: WideString): WideString; dispid 68;
    function Decode(const encodedStr: WideString; const encoding: WideString): OleVariant; dispid 69;
    procedure SetEncodedKey(const keyStr: WideString; const encoding: WideString); dispid 70;
    procedure SetEncodedIV(const ivStr: WideString; const encoding: WideString); dispid 71;
    function GetEncodedKey(const encoding: WideString): WideString; dispid 72;
    function GetEncodedIV(const encoding: WideString): WideString; dispid 73;
    procedure RandomizeIV; dispid 74;
    function BytesToString(inData: OleVariant; const Charset: WideString): WideString; dispid 75;
    function StringToBytes(const inStr: WideString; const Charset: WideString): OleVariant; dispid 76;
    function TrimEndingWith(const inStr: WideString; const ending: WideString): WideString; dispid 77;
    function GenEncodedSecretKey(const password: WideString; const encoding: WideString): WideString; dispid 78;
    function CreateP7S(const inFilename: WideString; const p7sFilename: WideString): Integer; dispid 79;
    function VerifyP7S(const inFilename: WideString; const p7sFilename: WideString): Integer; dispid 80;
    function HashFileENC(const filename: WideString): WideString; dispid 81;
    function HashFile(const filename: WideString): OleVariant; dispid 82;
    procedure SetHmacKeyBytes(keyBytes: OleVariant); dispid 83;
    procedure SetHmacKeyString(const key: WideString); dispid 84;
    function HmacBytes(inBytes: OleVariant): OleVariant; dispid 85;
    function HmacString(const inText: WideString): OleVariant; dispid 86;
    function HmacBytesENC(inBytes: OleVariant): WideString; dispid 87;
    function HmacStringENC(const inText: WideString): WideString; dispid 88;
    function CreateDetachedSignature(const inFilename: WideString; const sigFilename: WideString): Integer; dispid 89;
    function VerifyDetachedSignature(const inFilename: WideString; const sigFilename: WideString): Integer; dispid 90;
    property HavalRounds: Integer dispid 91;
    function CreateP7M(const inFilename: WideString; const p7mFilename: WideString): Integer; dispid 92;
    function VerifyP7M(const p7mFilename: WideString; const outFilename: WideString): Integer; dispid 93;
    property Rc2EffectiveKeyLength: Integer dispid 94;
    property LastChunk: Integer dispid 95;
    property FirstChunk: Integer dispid 96;
    property BlockSize: Integer readonly dispid 97;
    procedure SetHmacKeyEncoded(const key: WideString; const encoding: WideString); dispid 98;
    property IncludeCertChain: Integer dispid 99;
    function SetDecryptCert2(const cert: IChilkatCert; const key: IPrivateKey): Integer; dispid 100;
    function SetDecryptCert(const cert: IChilkatCert): Integer; dispid 101;
    function EncryptEncoded(const str: WideString): WideString; dispid 102;
    function DecryptEncoded(const str: WideString): WideString; dispid 103;
    function ReEncode(const data: WideString; const fromEncoding: WideString; 
                      const toEncoding: WideString): WideString; dispid 104;
    procedure RandomizeKey; dispid 105;
    procedure AddEncryptCert(const cert: IChilkatCert); dispid 106;
    procedure ClearEncryptCerts; dispid 107;
    function GenRandomBytesENC(numBytes: Integer): WideString; dispid 108;
    function Pbkdf1(const password: WideString; const Charset: WideString; 
                    const hashAlg: WideString; const salt: WideString; iterationCount: Integer; 
                    outputKeyBitLen: Integer; const encoding: WideString): WideString; dispid 109;
    function Pbkdf2(const password: WideString; const Charset: WideString; 
                    const hashAlg: WideString; const salt: WideString; iterationCount: Integer; 
                    outputKeyBitLen: Integer; const encoding: WideString): WideString; dispid 110;
    property PbesPassword: WideString dispid 111;
    property salt: OleVariant dispid 112;
    property iterationCount: Integer dispid 113;
    procedure SetEncodedSalt(const saltStr: WideString; const encoding: WideString); dispid 114;
    function GetEncodedSalt(const encoding: WideString): WideString; dispid 115;
    property PbesAlgorithm: WideString dispid 116;
    function HashBeginBytes(data: OleVariant): Integer; dispid 117;
    function HashBeginString(const strData: WideString): Integer; dispid 118;
    function HashMoreString(const strData: WideString): Integer; dispid 119;
    function HashMoreBytes(data: OleVariant): Integer; dispid 120;
    function HashFinal: OleVariant; dispid 121;
    function HashFinalENC: WideString; dispid 122;
    function MySqlAesEncrypt(const strData: WideString; const strKey: WideString): WideString; dispid 123;
    function MySqlAesDecrypt(const strEncrypted: WideString; const strKey: WideString): WideString; dispid 124;
    function EncodeString(const inStr: WideString; const Charset: WideString; 
                          const encoding: WideString): WideString; dispid 125;
    function DecodeString(const inStr: WideString; const Charset: WideString; 
                          const encoding: WideString): WideString; dispid 126;
    property UuMode: WideString dispid 127;
    property UuFilename: WideString dispid 128;
    property VerboseLogging: Integer dispid 129;
    function AddPfxSourceData(pfxData: OleVariant; const password: WideString): Integer; dispid 130;
    function AddPfxSourceFile(const pfxFilePath: WideString; const password: WideString): Integer; dispid 131;
    property Pkcs7CryptAlg: WideString dispid 132;
    function SetSigningCert2(const cert: IChilkatCert; const key: IPrivateKey): Integer; dispid 133;
  end;

// *********************************************************************//
// Interface: IChilkatCSP
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D12FB216-99DA-4EB3-9CC0-C0F760B174A0}
// *********************************************************************//
  IChilkatCSP = interface(IDispatch)
    ['{D12FB216-99DA-4EB3-9CC0-C0F760B174A0}']
    function Get_NumHashAlgorithms: Integer; safecall;
    function Get_NumEncryptAlgorithms: Integer; safecall;
    function Get_ProviderName: WideString; safecall;
    procedure Set_ProviderName(const pVal: WideString); safecall;
    function Get_KeyContainerName: WideString; safecall;
    procedure Set_KeyContainerName(const pVal: WideString); safecall;
    function GetEncryptionAlgorithm(index: Integer): WideString; safecall;
    function GetEncryptionNumBits(index: Integer): Integer; safecall;
    function GetHashAlgorithm(index: Integer): WideString; safecall;
    function GetHashNumBits(index: Integer): Integer; safecall;
    function Get_EncryptAlgorithm: WideString; safecall;
    function Get_HashAlgorithm: WideString; safecall;
    function Get_EncryptNumBits: Integer; safecall;
    function Get_HashNumBits: Integer; safecall;
    function Get_EncryptAlgorithmID: Integer; safecall;
    function Get_HashAlgorithmID: Integer; safecall;
    function HasEncryptAlgorithm(const name: WideString; numBits: Integer): Integer; safecall;
    function SetEncryptAlgorithm(const name: WideString): Integer; safecall;
    function HasHashAlgorithm(const name: WideString; numBits: Integer): Integer; safecall;
    function SetHashAlgorithm(const name: WideString): Integer; safecall;
    function GetKeyContainerNames: ICkStringArray; safecall;
    function Get_ProviderType: Integer; safecall;
    procedure SetProviderMicrosoftBase; safecall;
    procedure SetProviderMicrosoftEnhanced; safecall;
    procedure SetProviderMicrosoftStrong; safecall;
    procedure SetProviderMicrosoftRsaAes; safecall;
    function Get_LastErrorHtml: WideString; safecall;
    function Get_LastErrorXml: WideString; safecall;
    function Get_LastErrorText: WideString; safecall;
    function Serialize: WideString; safecall;
    function Get_MachineKeyset: Integer; safecall;
    procedure Set_MachineKeyset(bVal: Integer); safecall;
    function Get_NumKeyContainers: Integer; safecall;
    function Get_NumKeyExchangeAlgorithms: Integer; safecall;
    function Get_NumSignatureAlgorithms: Integer; safecall;
    function GetKeyContainerName(index: Integer): WideString; safecall;
    function GetKeyExchangeAlgorithm(index: Integer): WideString; safecall;
    function GetKeyExchangeNumBits(index: Integer): Integer; safecall;
    function GetSignatureAlgorithm(index: Integer): WideString; safecall;
    function GetSignatureNumBits(index: Integer): Integer; safecall;
    property NumHashAlgorithms: Integer read Get_NumHashAlgorithms;
    property NumEncryptAlgorithms: Integer read Get_NumEncryptAlgorithms;
    property ProviderName: WideString read Get_ProviderName write Set_ProviderName;
    property KeyContainerName: WideString read Get_KeyContainerName write Set_KeyContainerName;
    property EncryptAlgorithm: WideString read Get_EncryptAlgorithm;
    property HashAlgorithm: WideString read Get_HashAlgorithm;
    property EncryptNumBits: Integer read Get_EncryptNumBits;
    property HashNumBits: Integer read Get_HashNumBits;
    property EncryptAlgorithmID: Integer read Get_EncryptAlgorithmID;
    property HashAlgorithmID: Integer read Get_HashAlgorithmID;
    property ProviderType: Integer read Get_ProviderType;
    property LastErrorHtml: WideString read Get_LastErrorHtml;
    property LastErrorXml: WideString read Get_LastErrorXml;
    property LastErrorText: WideString read Get_LastErrorText;
    property MachineKeyset: Integer read Get_MachineKeyset write Set_MachineKeyset;
    property NumKeyContainers: Integer read Get_NumKeyContainers;
    property NumKeyExchangeAlgorithms: Integer read Get_NumKeyExchangeAlgorithms;
    property NumSignatureAlgorithms: Integer read Get_NumSignatureAlgorithms;
  end;

// *********************************************************************//
// DispIntf:  IChilkatCSPDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D12FB216-99DA-4EB3-9CC0-C0F760B174A0}
// *********************************************************************//
  IChilkatCSPDisp = dispinterface
    ['{D12FB216-99DA-4EB3-9CC0-C0F760B174A0}']
    property NumHashAlgorithms: Integer readonly dispid 2;
    property NumEncryptAlgorithms: Integer readonly dispid 3;
    property ProviderName: WideString dispid 4;
    property KeyContainerName: WideString dispid 5;
    function GetEncryptionAlgorithm(index: Integer): WideString; dispid 6;
    function GetEncryptionNumBits(index: Integer): Integer; dispid 7;
    function GetHashAlgorithm(index: Integer): WideString; dispid 8;
    function GetHashNumBits(index: Integer): Integer; dispid 9;
    property EncryptAlgorithm: WideString readonly dispid 10;
    property HashAlgorithm: WideString readonly dispid 11;
    property EncryptNumBits: Integer readonly dispid 12;
    property HashNumBits: Integer readonly dispid 13;
    property EncryptAlgorithmID: Integer readonly dispid 14;
    property HashAlgorithmID: Integer readonly dispid 15;
    function HasEncryptAlgorithm(const name: WideString; numBits: Integer): Integer; dispid 16;
    function SetEncryptAlgorithm(const name: WideString): Integer; dispid 17;
    function HasHashAlgorithm(const name: WideString; numBits: Integer): Integer; dispid 18;
    function SetHashAlgorithm(const name: WideString): Integer; dispid 19;
    function GetKeyContainerNames: ICkStringArray; dispid 20;
    property ProviderType: Integer readonly dispid 21;
    procedure SetProviderMicrosoftBase; dispid 22;
    procedure SetProviderMicrosoftEnhanced; dispid 23;
    procedure SetProviderMicrosoftStrong; dispid 24;
    procedure SetProviderMicrosoftRsaAes; dispid 25;
    property LastErrorHtml: WideString readonly dispid 26;
    property LastErrorXml: WideString readonly dispid 27;
    property LastErrorText: WideString readonly dispid 28;
    function Serialize: WideString; dispid 29;
    property MachineKeyset: Integer dispid 30;
    property NumKeyContainers: Integer readonly dispid 31;
    property NumKeyExchangeAlgorithms: Integer readonly dispid 32;
    property NumSignatureAlgorithms: Integer readonly dispid 33;
    function GetKeyContainerName(index: Integer): WideString; dispid 34;
    function GetKeyExchangeAlgorithm(index: Integer): WideString; dispid 35;
    function GetKeyExchangeNumBits(index: Integer): Integer; dispid 36;
    function GetSignatureAlgorithm(index: Integer): WideString; dispid 37;
    function GetSignatureNumBits(index: Integer): Integer; dispid 38;
  end;

// *********************************************************************//
// Interface: ICkStringArray
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4340DF8E-D7A3-4675-BE74-80077B2B3E81}
// *********************************************************************//
  ICkStringArray = interface(IDispatch)
    ['{4340DF8E-D7A3-4675-BE74-80077B2B3E81}']
    function Get_Count: Integer; safecall;
    procedure Append(const str: WideString); safecall;
    procedure Clear; safecall;
    function Contains(const str: WideString): Integer; safecall;
    procedure Remove(const str: WideString); safecall;
    function GetString(index: Integer): WideString; safecall;
    function Serialize: WideString; safecall;
    procedure AppendSerialized(const encodedStr: WideString); safecall;
    function Get_Unique: Integer; safecall;
    procedure Set_Unique(bVal: Integer); safecall;
    function Get_Trim: Integer; safecall;
    procedure Set_Trim(bVal: Integer); safecall;
    function Get_Crlf: Integer; safecall;
    procedure Set_Crlf(bVal: Integer); safecall;
    procedure Prepend(const str: WideString); safecall;
    function Find(const str: WideString; beginIndex: Integer): Integer; safecall;
    procedure InsertAt(index: Integer; const str: WideString); safecall;
    procedure RemoveAt(index: Integer); safecall;
    function LastString: WideString; safecall;
    function Pop: WideString; safecall;
    function LoadFromFile(const filename: WideString): Integer; safecall;
    function SaveToFile(const filename: WideString): Integer; safecall;
    procedure Sort(ascending: Integer); safecall;
    procedure Union(const array_: ICkStringArray); safecall;
    procedure Intersect(const array_: ICkStringArray); safecall;
    procedure Subtract(const array_: ICkStringArray); safecall;
    procedure SplitAndAppend(const str: WideString; const boundary: WideString); safecall;
    function SaveNthToFile(index: Integer; const filename: WideString): Integer; safecall;
    procedure LoadFromText(const txt: WideString); safecall;
    function SaveToText: WideString; safecall;
    function FindFirstMatch(const str: WideString; beginIndex: Integer): Integer; safecall;
    property Count: Integer read Get_Count;
    property Unique: Integer read Get_Unique write Set_Unique;
    property Trim: Integer read Get_Trim write Set_Trim;
    property Crlf: Integer read Get_Crlf write Set_Crlf;
  end;

// *********************************************************************//
// DispIntf:  ICkStringArrayDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4340DF8E-D7A3-4675-BE74-80077B2B3E81}
// *********************************************************************//
  ICkStringArrayDisp = dispinterface
    ['{4340DF8E-D7A3-4675-BE74-80077B2B3E81}']
    property Count: Integer readonly dispid 1;
    procedure Append(const str: WideString); dispid 2;
    procedure Clear; dispid 3;
    function Contains(const str: WideString): Integer; dispid 4;
    procedure Remove(const str: WideString); dispid 5;
    function GetString(index: Integer): WideString; dispid 6;
    function Serialize: WideString; dispid 7;
    procedure AppendSerialized(const encodedStr: WideString); dispid 8;
    property Unique: Integer dispid 9;
    property Trim: Integer dispid 10;
    property Crlf: Integer dispid 11;
    procedure Prepend(const str: WideString); dispid 12;
    function Find(const str: WideString; beginIndex: Integer): Integer; dispid 13;
    procedure InsertAt(index: Integer; const str: WideString); dispid 14;
    procedure RemoveAt(index: Integer); dispid 15;
    function LastString: WideString; dispid 16;
    function Pop: WideString; dispid 17;
    function LoadFromFile(const filename: WideString): Integer; dispid 18;
    function SaveToFile(const filename: WideString): Integer; dispid 19;
    procedure Sort(ascending: Integer); dispid 20;
    procedure Union(const array_: ICkStringArray); dispid 21;
    procedure Intersect(const array_: ICkStringArray); dispid 22;
    procedure Subtract(const array_: ICkStringArray); dispid 23;
    procedure SplitAndAppend(const str: WideString; const boundary: WideString); dispid 24;
    function SaveNthToFile(index: Integer; const filename: WideString): Integer; dispid 25;
    procedure LoadFromText(const txt: WideString); dispid 26;
    function SaveToText: WideString; dispid 27;
    function FindFirstMatch(const str: WideString; beginIndex: Integer): Integer; dispid 28;
  end;

// *********************************************************************//
// Interface: IChilkatCert
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D56C1AF1-3FDE-471C-9BC2-C52515F260C1}
// *********************************************************************//
  IChilkatCert = interface(IDispatch)
    ['{D56C1AF1-3FDE-471C-9BC2-C52515F260C1}']
    function Get_Version: WideString; safecall;
    function Get_ForSecureEmail: Integer; safecall;
    function Get_ForServerAuthentication: Integer; safecall;
    function Get_ForClientAuthentication: Integer; safecall;
    function Get_ForCodeSigning: Integer; safecall;
    function Get_ForTimeStamping: Integer; safecall;
    function Get_SerialNumber: WideString; safecall;
    function Get_ValidFrom: TDateTime; safecall;
    function Get_ValidTo: TDateTime; safecall;
    function Get_SubjectCN: WideString; safecall;
    function Get_SubjectOU: WideString; safecall;
    function Get_SubjectO: WideString; safecall;
    function Get_SubjectL: WideString; safecall;
    function Get_SubjectS: WideString; safecall;
    function Get_SubjectC: WideString; safecall;
    function Get_SubjectE: WideString; safecall;
    function Get_IssuerCN: WideString; safecall;
    function Get_IssuerOU: WideString; safecall;
    function Get_IssuerO: WideString; safecall;
    function Get_IssuerL: WideString; safecall;
    function Get_IssuerS: WideString; safecall;
    function Get_IssuerC: WideString; safecall;
    function Get_IssuerE: WideString; safecall;
    function GetEncoded: WideString; safecall;
    function SetFromEncoded(const encodedCert: WideString): Integer; safecall;
    procedure SaveLastError(const filename: WideString); safecall;
    function LoadFromFile(const filename: WideString): Integer; safecall;
    function LoadFromBase64(const encodedCert: WideString): Integer; safecall;
    function LoadFromBinary(binaryBlob: OleVariant): Integer; safecall;
    function Get_SubjectDN: WideString; safecall;
    function Get_IssuerDN: WideString; safecall;
    function Get_LastErrorHtml: WideString; safecall;
    function Get_LastErrorXml: WideString; safecall;
    function Get_LastErrorText: WideString; safecall;
    function IsExpired: Integer; safecall;
    function Get_Rfc822Name: WideString; safecall;
    function Get_Expired: Integer; safecall;
    function Get_SignatureVerified: Integer; safecall;
    function Get_Revoked: Integer; safecall;
    function Get_TrustedRoot: Integer; safecall;
    function HasPrivateKey: Integer; safecall;
    function SaveToFile(const filename: WideString): Integer; safecall;
    function Get_Sha1Thumbprint: WideString; safecall;
    function ExportPublicKey: IPublicKey; safecall;
    function ExportPrivateKey: IPrivateKey; safecall;
    function Get_HasKeyContainer: Integer; safecall;
    function Get_KeyContainerName: WideString; safecall;
    function Get_CspName: WideString; safecall;
    function Get_MachineKeyset: Integer; safecall;
    function Get_Silent: Integer; safecall;
    function LoadByEmailAddress(const emailAddress: WideString): Integer; safecall;
    function LoadByCommonName(const name: WideString): Integer; safecall;
    function PemFileToDerFile(const pemFilename: WideString; const derFilename: WideString): Integer; safecall;
    function LinkPrivateKey(const KeyContainerName: WideString; MachineKeyset: Integer; 
                            forSigning: Integer): Integer; safecall;
    function ExportCertPem: WideString; safecall;
    function ExportCertDer: OleVariant; safecall;
    function ExportCertPemFile(const filename: WideString): Integer; safecall;
    function ExportCertDerFile(const filename: WideString): Integer; safecall;
    function Get_IntendedKeyUsage: Integer; safecall;
    function LoadPfxFile(const pfxFilename: WideString; const password: WideString): Integer; safecall;
    function LoadPfxData(pfxData: OleVariant; const password: WideString): Integer; safecall;
    function ExportToPfxFile(const pfxFilename: WideString; const password: WideString; 
                             includeChain: Integer): Integer; safecall;
    function Get_IsRoot: Integer; safecall;
    function CheckRevoked: Integer; safecall;
    function ExportCertXml: WideString; safecall;
    function Get_VerboseLogging: Integer; safecall;
    procedure Set_VerboseLogging(propVal: Integer); safecall;
    function Get_CertVersion: Integer; safecall;
    function SetPrivateKey(const privKey: IPrivateKey): Integer; safecall;
    function Get_OcspUrl: WideString; safecall;
    function FindIssuer: IChilkatCert; safecall;
    function LoadByIssuerAndSerialNumber(const IssuerCN: WideString; const serialNum: WideString): Integer; safecall;
    function Get_SelfSigned: Integer; safecall;
    function SetPrivateKeyPem(const privKeyPem: WideString): Integer; safecall;
    function GetPrivateKeyPem: WideString; safecall;
    property Version: WideString read Get_Version;
    property ForSecureEmail: Integer read Get_ForSecureEmail;
    property ForServerAuthentication: Integer read Get_ForServerAuthentication;
    property ForClientAuthentication: Integer read Get_ForClientAuthentication;
    property ForCodeSigning: Integer read Get_ForCodeSigning;
    property ForTimeStamping: Integer read Get_ForTimeStamping;
    property SerialNumber: WideString read Get_SerialNumber;
    property ValidFrom: TDateTime read Get_ValidFrom;
    property ValidTo: TDateTime read Get_ValidTo;
    property SubjectCN: WideString read Get_SubjectCN;
    property SubjectOU: WideString read Get_SubjectOU;
    property SubjectO: WideString read Get_SubjectO;
    property SubjectL: WideString read Get_SubjectL;
    property SubjectS: WideString read Get_SubjectS;
    property SubjectC: WideString read Get_SubjectC;
    property SubjectE: WideString read Get_SubjectE;
    property IssuerCN: WideString read Get_IssuerCN;
    property IssuerOU: WideString read Get_IssuerOU;
    property IssuerO: WideString read Get_IssuerO;
    property IssuerL: WideString read Get_IssuerL;
    property IssuerS: WideString read Get_IssuerS;
    property IssuerC: WideString read Get_IssuerC;
    property IssuerE: WideString read Get_IssuerE;
    property SubjectDN: WideString read Get_SubjectDN;
    property IssuerDN: WideString read Get_IssuerDN;
    property LastErrorHtml: WideString read Get_LastErrorHtml;
    property LastErrorXml: WideString read Get_LastErrorXml;
    property LastErrorText: WideString read Get_LastErrorText;
    property Rfc822Name: WideString read Get_Rfc822Name;
    property Expired: Integer read Get_Expired;
    property SignatureVerified: Integer read Get_SignatureVerified;
    property Revoked: Integer read Get_Revoked;
    property TrustedRoot: Integer read Get_TrustedRoot;
    property Sha1Thumbprint: WideString read Get_Sha1Thumbprint;
    property HasKeyContainer: Integer read Get_HasKeyContainer;
    property KeyContainerName: WideString read Get_KeyContainerName;
    property CspName: WideString read Get_CspName;
    property MachineKeyset: Integer read Get_MachineKeyset;
    property Silent: Integer read Get_Silent;
    property IntendedKeyUsage: Integer read Get_IntendedKeyUsage;
    property IsRoot: Integer read Get_IsRoot;
    property VerboseLogging: Integer read Get_VerboseLogging write Set_VerboseLogging;
    property CertVersion: Integer read Get_CertVersion;
    property OcspUrl: WideString read Get_OcspUrl;
    property SelfSigned: Integer read Get_SelfSigned;
  end;

// *********************************************************************//
// DispIntf:  IChilkatCertDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D56C1AF1-3FDE-471C-9BC2-C52515F260C1}
// *********************************************************************//
  IChilkatCertDisp = dispinterface
    ['{D56C1AF1-3FDE-471C-9BC2-C52515F260C1}']
    property Version: WideString readonly dispid 1;
    property ForSecureEmail: Integer readonly dispid 3;
    property ForServerAuthentication: Integer readonly dispid 4;
    property ForClientAuthentication: Integer readonly dispid 5;
    property ForCodeSigning: Integer readonly dispid 6;
    property ForTimeStamping: Integer readonly dispid 7;
    property SerialNumber: WideString readonly dispid 8;
    property ValidFrom: TDateTime readonly dispid 9;
    property ValidTo: TDateTime readonly dispid 10;
    property SubjectCN: WideString readonly dispid 11;
    property SubjectOU: WideString readonly dispid 12;
    property SubjectO: WideString readonly dispid 13;
    property SubjectL: WideString readonly dispid 14;
    property SubjectS: WideString readonly dispid 15;
    property SubjectC: WideString readonly dispid 16;
    property SubjectE: WideString readonly dispid 17;
    property IssuerCN: WideString readonly dispid 18;
    property IssuerOU: WideString readonly dispid 19;
    property IssuerO: WideString readonly dispid 20;
    property IssuerL: WideString readonly dispid 21;
    property IssuerS: WideString readonly dispid 22;
    property IssuerC: WideString readonly dispid 23;
    property IssuerE: WideString readonly dispid 24;
    function GetEncoded: WideString; dispid 26;
    function SetFromEncoded(const encodedCert: WideString): Integer; dispid 27;
    procedure SaveLastError(const filename: WideString); dispid 28;
    function LoadFromFile(const filename: WideString): Integer; dispid 29;
    function LoadFromBase64(const encodedCert: WideString): Integer; dispid 30;
    function LoadFromBinary(binaryBlob: OleVariant): Integer; dispid 31;
    property SubjectDN: WideString readonly dispid 32;
    property IssuerDN: WideString readonly dispid 33;
    property LastErrorHtml: WideString readonly dispid 34;
    property LastErrorXml: WideString readonly dispid 35;
    property LastErrorText: WideString readonly dispid 36;
    function IsExpired: Integer; dispid 38;
    property Rfc822Name: WideString readonly dispid 39;
    property Expired: Integer readonly dispid 40;
    property SignatureVerified: Integer readonly dispid 41;
    property Revoked: Integer readonly dispid 42;
    property TrustedRoot: Integer readonly dispid 43;
    function HasPrivateKey: Integer; dispid 44;
    function SaveToFile(const filename: WideString): Integer; dispid 45;
    property Sha1Thumbprint: WideString readonly dispid 46;
    function ExportPublicKey: IPublicKey; dispid 47;
    function ExportPrivateKey: IPrivateKey; dispid 48;
    property HasKeyContainer: Integer readonly dispid 49;
    property KeyContainerName: WideString readonly dispid 50;
    property CspName: WideString readonly dispid 51;
    property MachineKeyset: Integer readonly dispid 52;
    property Silent: Integer readonly dispid 53;
    function LoadByEmailAddress(const emailAddress: WideString): Integer; dispid 54;
    function LoadByCommonName(const name: WideString): Integer; dispid 55;
    function PemFileToDerFile(const pemFilename: WideString; const derFilename: WideString): Integer; dispid 56;
    function LinkPrivateKey(const KeyContainerName: WideString; MachineKeyset: Integer; 
                            forSigning: Integer): Integer; dispid 57;
    function ExportCertPem: WideString; dispid 58;
    function ExportCertDer: OleVariant; dispid 59;
    function ExportCertPemFile(const filename: WideString): Integer; dispid 60;
    function ExportCertDerFile(const filename: WideString): Integer; dispid 61;
    property IntendedKeyUsage: Integer readonly dispid 62;
    function LoadPfxFile(const pfxFilename: WideString; const password: WideString): Integer; dispid 63;
    function LoadPfxData(pfxData: OleVariant; const password: WideString): Integer; dispid 64;
    function ExportToPfxFile(const pfxFilename: WideString; const password: WideString; 
                             includeChain: Integer): Integer; dispid 65;
    property IsRoot: Integer readonly dispid 66;
    function CheckRevoked: Integer; dispid 67;
    function ExportCertXml: WideString; dispid 68;
    property VerboseLogging: Integer dispid 69;
    property CertVersion: Integer readonly dispid 70;
    function SetPrivateKey(const privKey: IPrivateKey): Integer; dispid 71;
    property OcspUrl: WideString readonly dispid 72;
    function FindIssuer: IChilkatCert; dispid 73;
    function LoadByIssuerAndSerialNumber(const IssuerCN: WideString; const serialNum: WideString): Integer; dispid 74;
    property SelfSigned: Integer readonly dispid 75;
    function SetPrivateKeyPem(const privKeyPem: WideString): Integer; dispid 76;
    function GetPrivateKeyPem: WideString; dispid 77;
  end;

// *********************************************************************//
// Interface: IPublicKey
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {06544919-F559-4AE5-9001-F903BD8A84E6}
// *********************************************************************//
  IPublicKey = interface(IDispatch)
    ['{06544919-F559-4AE5-9001-F903BD8A84E6}']
    function LoadRsaDerFile(const filename: WideString): Integer; safecall;
    function LoadOpenSslDerFile(const filename: WideString): Integer; safecall;
    function LoadOpenSslPemFile(const filename: WideString): Integer; safecall;
    function LoadXmlFile(const filename: WideString): Integer; safecall;
    function SaveRsaDerFile(const filename: WideString): Integer; safecall;
    function SaveOpenSslDerFile(const filename: WideString): Integer; safecall;
    function SaveOpenSslPemFile(const filename: WideString): Integer; safecall;
    function SaveXmlFile(const filename: WideString): Integer; safecall;
    function LoadOpenSslPem(const pemStr: WideString): Integer; safecall;
    function LoadOpenSslDer(derData: OleVariant): Integer; safecall;
    function LoadRsaDer(derData: OleVariant): Integer; safecall;
    function LoadXml(const xml: WideString): Integer; safecall;
    function GetRsaDer: OleVariant; safecall;
    function GetOpenSslDer: OleVariant; safecall;
    function GetOpenSslPem: WideString; safecall;
    function GetXml: WideString; safecall;
    function SaveLastError(const filename: WideString): Integer; safecall;
    function Get_LastErrorText: WideString; safecall;
    function Get_LastErrorHtml: WideString; safecall;
    function Get_LastErrorXml: WideString; safecall;
    function LoadPkcs1Pem(const str: WideString): Integer; safecall;
    property LastErrorText: WideString read Get_LastErrorText;
    property LastErrorHtml: WideString read Get_LastErrorHtml;
    property LastErrorXml: WideString read Get_LastErrorXml;
  end;

// *********************************************************************//
// DispIntf:  IPublicKeyDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {06544919-F559-4AE5-9001-F903BD8A84E6}
// *********************************************************************//
  IPublicKeyDisp = dispinterface
    ['{06544919-F559-4AE5-9001-F903BD8A84E6}']
    function LoadRsaDerFile(const filename: WideString): Integer; dispid 1;
    function LoadOpenSslDerFile(const filename: WideString): Integer; dispid 2;
    function LoadOpenSslPemFile(const filename: WideString): Integer; dispid 3;
    function LoadXmlFile(const filename: WideString): Integer; dispid 4;
    function SaveRsaDerFile(const filename: WideString): Integer; dispid 5;
    function SaveOpenSslDerFile(const filename: WideString): Integer; dispid 6;
    function SaveOpenSslPemFile(const filename: WideString): Integer; dispid 7;
    function SaveXmlFile(const filename: WideString): Integer; dispid 8;
    function LoadOpenSslPem(const pemStr: WideString): Integer; dispid 9;
    function LoadOpenSslDer(derData: OleVariant): Integer; dispid 10;
    function LoadRsaDer(derData: OleVariant): Integer; dispid 11;
    function LoadXml(const xml: WideString): Integer; dispid 12;
    function GetRsaDer: OleVariant; dispid 13;
    function GetOpenSslDer: OleVariant; dispid 14;
    function GetOpenSslPem: WideString; dispid 15;
    function GetXml: WideString; dispid 16;
    function SaveLastError(const filename: WideString): Integer; dispid 17;
    property LastErrorText: WideString readonly dispid 18;
    property LastErrorHtml: WideString readonly dispid 19;
    property LastErrorXml: WideString readonly dispid 20;
    function LoadPkcs1Pem(const str: WideString): Integer; dispid 21;
  end;

// *********************************************************************//
// Interface: IPrivateKey
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C4C23B78-DB98-444C-B601-DCAC6EBBEC54}
// *********************************************************************//
  IPrivateKey = interface(IDispatch)
    ['{C4C23B78-DB98-444C-B601-DCAC6EBBEC54}']
    function LoadRsaDerFile(const filename: WideString): Integer; safecall;
    function LoadPkcs8File(const filename: WideString): Integer; safecall;
    function LoadPemFile(const filename: WideString): Integer; safecall;
    function LoadXmlFile(const filename: WideString): Integer; safecall;
    function LoadPem(const str: WideString): Integer; safecall;
    function LoadRsaDer(derData: OleVariant): Integer; safecall;
    function LoadPkcs8(pkcs8Data: OleVariant): Integer; safecall;
    function LoadXml(const xmlDoc: WideString): Integer; safecall;
    function SaveRsaDerFile(const filename: WideString): Integer; safecall;
    function SavePkcs8File(const filename: WideString): Integer; safecall;
    function SaveRsaPemFile(const filename: WideString): Integer; safecall;
    function SavePkcs8PemFile(const filename: WideString): Integer; safecall;
    function SaveXmlFile(const filename: WideString): Integer; safecall;
    function GetRsaDer: OleVariant; safecall;
    function GetPkcs8: OleVariant; safecall;
    function GetRsaPem: WideString; safecall;
    function GetPkcs8Pem: WideString; safecall;
    function GetXml: WideString; safecall;
    function SaveLastError(const filename: WideString): Integer; safecall;
    function Get_LastErrorXml: WideString; safecall;
    function Get_LastErrorText: WideString; safecall;
    function Get_LastErrorHtml: WideString; safecall;
    function LoadPvkFile(const filename: WideString; const password: WideString): Integer; safecall;
    function LoadPvk(pvkData: OleVariant; const password: WideString): Integer; safecall;
    function LoadEncryptedPem(const pemStr: WideString; const password: WideString): Integer; safecall;
    function LoadEncryptedPemFile(const filename: WideString; const password: WideString): Integer; safecall;
    function LoadPkcs8Encrypted(data: OleVariant; const password: WideString): Integer; safecall;
    function LoadPkcs8EncryptedFile(const filename: WideString; const password: WideString): Integer; safecall;
    function GetPkcs8Encrypted(const password: WideString): OleVariant; safecall;
    function GetPkcs8EncryptedPem(const password: WideString): WideString; safecall;
    function SavePkcs8EncryptedFile(const password: WideString; const filename: WideString): Integer; safecall;
    function SavePkcs8EncryptedPemFile(const password: WideString; const filename: WideString): Integer; safecall;
    property LastErrorXml: WideString read Get_LastErrorXml;
    property LastErrorText: WideString read Get_LastErrorText;
    property LastErrorHtml: WideString read Get_LastErrorHtml;
  end;

// *********************************************************************//
// DispIntf:  IPrivateKeyDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C4C23B78-DB98-444C-B601-DCAC6EBBEC54}
// *********************************************************************//
  IPrivateKeyDisp = dispinterface
    ['{C4C23B78-DB98-444C-B601-DCAC6EBBEC54}']
    function LoadRsaDerFile(const filename: WideString): Integer; dispid 1;
    function LoadPkcs8File(const filename: WideString): Integer; dispid 2;
    function LoadPemFile(const filename: WideString): Integer; dispid 3;
    function LoadXmlFile(const filename: WideString): Integer; dispid 4;
    function LoadPem(const str: WideString): Integer; dispid 5;
    function LoadRsaDer(derData: OleVariant): Integer; dispid 6;
    function LoadPkcs8(pkcs8Data: OleVariant): Integer; dispid 7;
    function LoadXml(const xmlDoc: WideString): Integer; dispid 8;
    function SaveRsaDerFile(const filename: WideString): Integer; dispid 9;
    function SavePkcs8File(const filename: WideString): Integer; dispid 10;
    function SaveRsaPemFile(const filename: WideString): Integer; dispid 11;
    function SavePkcs8PemFile(const filename: WideString): Integer; dispid 12;
    function SaveXmlFile(const filename: WideString): Integer; dispid 13;
    function GetRsaDer: OleVariant; dispid 14;
    function GetPkcs8: OleVariant; dispid 15;
    function GetRsaPem: WideString; dispid 16;
    function GetPkcs8Pem: WideString; dispid 17;
    function GetXml: WideString; dispid 18;
    function SaveLastError(const filename: WideString): Integer; dispid 19;
    property LastErrorXml: WideString readonly dispid 20;
    property LastErrorText: WideString readonly dispid 21;
    property LastErrorHtml: WideString readonly dispid 22;
    function LoadPvkFile(const filename: WideString; const password: WideString): Integer; dispid 23;
    function LoadPvk(pvkData: OleVariant; const password: WideString): Integer; dispid 24;
    function LoadEncryptedPem(const pemStr: WideString; const password: WideString): Integer; dispid 25;
    function LoadEncryptedPemFile(const filename: WideString; const password: WideString): Integer; dispid 26;
    function LoadPkcs8Encrypted(data: OleVariant; const password: WideString): Integer; dispid 27;
    function LoadPkcs8EncryptedFile(const filename: WideString; const password: WideString): Integer; dispid 28;
    function GetPkcs8Encrypted(const password: WideString): OleVariant; dispid 29;
    function GetPkcs8EncryptedPem(const password: WideString): WideString; dispid 30;
    function SavePkcs8EncryptedFile(const password: WideString; const filename: WideString): Integer; dispid 31;
    function SavePkcs8EncryptedPemFile(const password: WideString; const filename: WideString): Integer; dispid 32;
  end;

// *********************************************************************//
// Interface: IChilkatOmaDrm
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {19F2FAA4-E912-4F11-95F9-9205722DFE0F}
// *********************************************************************//
  IChilkatOmaDrm = interface(IDispatch)
    ['{19F2FAA4-E912-4F11-95F9-9205722DFE0F}']
    function UnlockComponent(const unlockCode: WideString): Integer; safecall;
    function LoadDcfFile(const filename: WideString): Integer; safecall;
    function LoadDcfData(data: OleVariant): Integer; safecall;
    function Get_Base64Key: WideString; safecall;
    procedure Set_Base64Key(const pVal: WideString); safecall;
    function Get_DrmContentVersion: Integer; safecall;
    function Get_ContentType: WideString; safecall;
    procedure Set_ContentType(const pVal: WideString); safecall;
    function Get_ContentUri: WideString; safecall;
    procedure Set_ContentUri(const pVal: WideString); safecall;
    function Get_Headers: WideString; safecall;
    procedure Set_Headers(const pVal: WideString); safecall;
    function Get_IV: OleVariant; safecall;
    procedure Set_IV(pVal: OleVariant); safecall;
    function Get_encryptedData: OleVariant; safecall;
    function Get_decryptedData: OleVariant; safecall;
    function SaveDecrypted(const filename: WideString): Integer; safecall;
    function GetHeaderField(const fieldName: WideString): WideString; safecall;
    function Get_LastErrorText: WideString; safecall;
    function Get_LastErrorXml: WideString; safecall;
    function Get_LastErrorHtml: WideString; safecall;
    function SaveLastError(const b1: WideString): Integer; safecall;
    procedure LoadUnencryptedData(data: OleVariant); safecall;
    procedure SetEncodedIV(const encodedIV: WideString; const encoding: WideString); safecall;
    function LoadUnencryptedFile(const filename: WideString): Integer; safecall;
    function CreateDcfFile(const filename: WideString): Integer; safecall;
    property Base64Key: WideString read Get_Base64Key write Set_Base64Key;
    property DrmContentVersion: Integer read Get_DrmContentVersion;
    property ContentType: WideString read Get_ContentType write Set_ContentType;
    property ContentUri: WideString read Get_ContentUri write Set_ContentUri;
    property Headers: WideString read Get_Headers write Set_Headers;
    property IV: OleVariant read Get_IV write Set_IV;
    property encryptedData: OleVariant read Get_encryptedData;
    property decryptedData: OleVariant read Get_decryptedData;
    property LastErrorText: WideString read Get_LastErrorText;
    property LastErrorXml: WideString read Get_LastErrorXml;
    property LastErrorHtml: WideString read Get_LastErrorHtml;
  end;

// *********************************************************************//
// DispIntf:  IChilkatOmaDrmDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {19F2FAA4-E912-4F11-95F9-9205722DFE0F}
// *********************************************************************//
  IChilkatOmaDrmDisp = dispinterface
    ['{19F2FAA4-E912-4F11-95F9-9205722DFE0F}']
    function UnlockComponent(const unlockCode: WideString): Integer; dispid 1;
    function LoadDcfFile(const filename: WideString): Integer; dispid 2;
    function LoadDcfData(data: OleVariant): Integer; dispid 3;
    property Base64Key: WideString dispid 4;
    property DrmContentVersion: Integer readonly dispid 5;
    property ContentType: WideString dispid 6;
    property ContentUri: WideString dispid 7;
    property Headers: WideString dispid 8;
    property IV: OleVariant dispid 9;
    property encryptedData: OleVariant readonly dispid 10;
    property decryptedData: OleVariant readonly dispid 11;
    function SaveDecrypted(const filename: WideString): Integer; dispid 12;
    function GetHeaderField(const fieldName: WideString): WideString; dispid 13;
    property LastErrorText: WideString readonly dispid 14;
    property LastErrorXml: WideString readonly dispid 15;
    property LastErrorHtml: WideString readonly dispid 16;
    function SaveLastError(const b1: WideString): Integer; dispid 17;
    procedure LoadUnencryptedData(data: OleVariant); dispid 18;
    procedure SetEncodedIV(const encodedIV: WideString; const encoding: WideString); dispid 19;
    function LoadUnencryptedFile(const filename: WideString): Integer; dispid 20;
    function CreateDcfFile(const filename: WideString): Integer; dispid 21;
  end;

// *********************************************************************//
// Interface: IChilkatNtlm
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5902F126-6A2B-4C82-A8FE-CD1E063F4AD1}
// *********************************************************************//
  IChilkatNtlm = interface(IDispatch)
    ['{5902F126-6A2B-4C82-A8FE-CD1E063F4AD1}']
    function UnlockComponent(const unlockCode: WideString): Integer; safecall;
    function Get_LastErrorText: WideString; safecall;
    function Get_LastErrorXml: WideString; safecall;
    function Get_LastErrorHtml: WideString; safecall;
    function SaveLastError(const filename: WideString): Integer; safecall;
    function Get_TargetName: WideString; safecall;
    procedure Set_TargetName(const propVal: WideString); safecall;
    function Get_NetBiosComputerName: WideString; safecall;
    procedure Set_NetBiosComputerName(const propVal: WideString); safecall;
    function Get_NetBiosDomainName: WideString; safecall;
    procedure Set_NetBiosDomainName(const propVal: WideString); safecall;
    function Get_DnsDomainName: WideString; safecall;
    procedure Set_DnsDomainName(const propVal: WideString); safecall;
    function Get_DnsComputerName: WideString; safecall;
    procedure Set_DnsComputerName(const propVal: WideString); safecall;
    function Get_UserName: WideString; safecall;
    procedure Set_UserName(const propVal: WideString); safecall;
    function Get_password: WideString; safecall;
    procedure Set_password(const propVal: WideString); safecall;
    function Get_NtlmVersion: Integer; safecall;
    procedure Set_NtlmVersion(propVal: Integer); safecall;
    function Get_OemCodePage: Integer; safecall;
    procedure Set_OemCodePage(propVal: Integer); safecall;
    function Get_Flags: WideString; safecall;
    procedure Set_Flags(const propVal: WideString); safecall;
    function Get_Domain: WideString; safecall;
    procedure Set_Domain(const propVal: WideString); safecall;
    function Get_Workstation: WideString; safecall;
    procedure Set_Workstation(const propVal: WideString); safecall;
    function GenType1: WideString; safecall;
    function GenType2(const type1Msg: WideString): WideString; safecall;
    function GenType3(const type2Msg: WideString): WideString; safecall;
    function ParseType1(const type1Msg: WideString): WideString; safecall;
    function ParseType2(const type2Msg: WideString): WideString; safecall;
    function ParseType3(const type3Msg: WideString): WideString; safecall;
    function Get_EncodingMode: WideString; safecall;
    procedure Set_EncodingMode(const propVal: WideString); safecall;
    function SetFlag(const flagLetter: WideString; on_: Integer): Integer; safecall;
    function Get_ClientChallenge: WideString; safecall;
    procedure Set_ClientChallenge(const propVal: WideString); safecall;
    function Get_ServerChallenge: WideString; safecall;
    procedure Set_ServerChallenge(const propVal: WideString); safecall;
    function LoadType3(const type3Msg: WideString): Integer; safecall;
    property LastErrorText: WideString read Get_LastErrorText;
    property LastErrorXml: WideString read Get_LastErrorXml;
    property LastErrorHtml: WideString read Get_LastErrorHtml;
    property TargetName: WideString read Get_TargetName write Set_TargetName;
    property NetBiosComputerName: WideString read Get_NetBiosComputerName write Set_NetBiosComputerName;
    property NetBiosDomainName: WideString read Get_NetBiosDomainName write Set_NetBiosDomainName;
    property DnsDomainName: WideString read Get_DnsDomainName write Set_DnsDomainName;
    property DnsComputerName: WideString read Get_DnsComputerName write Set_DnsComputerName;
    property UserName: WideString read Get_UserName write Set_UserName;
    property password: WideString read Get_password write Set_password;
    property NtlmVersion: Integer read Get_NtlmVersion write Set_NtlmVersion;
    property OemCodePage: Integer read Get_OemCodePage write Set_OemCodePage;
    property Flags: WideString read Get_Flags write Set_Flags;
    property Domain: WideString read Get_Domain write Set_Domain;
    property Workstation: WideString read Get_Workstation write Set_Workstation;
    property EncodingMode: WideString read Get_EncodingMode write Set_EncodingMode;
    property ClientChallenge: WideString read Get_ClientChallenge write Set_ClientChallenge;
    property ServerChallenge: WideString read Get_ServerChallenge write Set_ServerChallenge;
  end;

// *********************************************************************//
// DispIntf:  IChilkatNtlmDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5902F126-6A2B-4C82-A8FE-CD1E063F4AD1}
// *********************************************************************//
  IChilkatNtlmDisp = dispinterface
    ['{5902F126-6A2B-4C82-A8FE-CD1E063F4AD1}']
    function UnlockComponent(const unlockCode: WideString): Integer; dispid 1;
    property LastErrorText: WideString readonly dispid 2;
    property LastErrorXml: WideString readonly dispid 3;
    property LastErrorHtml: WideString readonly dispid 4;
    function SaveLastError(const filename: WideString): Integer; dispid 5;
    property TargetName: WideString dispid 6;
    property NetBiosComputerName: WideString dispid 7;
    property NetBiosDomainName: WideString dispid 8;
    property DnsDomainName: WideString dispid 9;
    property DnsComputerName: WideString dispid 10;
    property UserName: WideString dispid 11;
    property password: WideString dispid 12;
    property NtlmVersion: Integer dispid 13;
    property OemCodePage: Integer dispid 14;
    property Flags: WideString dispid 15;
    property Domain: WideString dispid 16;
    property Workstation: WideString dispid 17;
    function GenType1: WideString; dispid 18;
    function GenType2(const type1Msg: WideString): WideString; dispid 19;
    function GenType3(const type2Msg: WideString): WideString; dispid 20;
    function ParseType1(const type1Msg: WideString): WideString; dispid 21;
    function ParseType2(const type2Msg: WideString): WideString; dispid 22;
    function ParseType3(const type3Msg: WideString): WideString; dispid 23;
    property EncodingMode: WideString dispid 24;
    function SetFlag(const flagLetter: WideString; on_: Integer): Integer; dispid 25;
    property ClientChallenge: WideString dispid 26;
    property ServerChallenge: WideString dispid 27;
    function LoadType3(const type3Msg: WideString): Integer; dispid 28;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TChilkatCrypt2
// Help String      : ChilkatCrypt2 Class
// Default Interface: IChilkatCrypt2
// Def. Intf. DISP? : No
// Event   Interface: _IChilkatCrypt2Events
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TChilkatCrypt2PercentDone = procedure(ASender: TObject; pctDone: Integer) of object;
  TChilkatCrypt2AbortCheck = procedure(ASender: TObject; out abort: Integer) of object;

  TChilkatCrypt2 = class(TOleControl)
  private
    FOnPercentDone: TChilkatCrypt2PercentDone;
    FOnAbortCheck: TChilkatCrypt2AbortCheck;
    FIntf: IChilkatCrypt2;
    function  GetControlInterface: IChilkatCrypt2;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_SecretKey: OleVariant;
    procedure Set_SecretKey(pVal: OleVariant);
    function Get_IV: OleVariant;
    procedure Set_IV(pVal: OleVariant);
    function Get_salt: OleVariant;
    procedure Set_salt(propVal: OleVariant);
  public
    function UnlockComponent(const b1: WideString): Integer;
    function IsUnlocked: Integer;
    function SaveLastError(const b1: WideString): Integer;
    function GenerateSecretKey(const str: WideString): OleVariant;
    procedure SetCSP(const iCSP: IChilkatCSP);
    function HashString(const str: WideString): OleVariant;
    function HashBytes(data: OleVariant): OleVariant;
    function HashStringENC(const str: WideString): WideString;
    function HashBytesENC(data: OleVariant): WideString;
    function EncryptBytes(data: OleVariant): OleVariant;
    function EncryptString(const str: WideString): OleVariant;
    function EncryptBytesENC(data: OleVariant): WideString;
    function EncryptStringENC(const str: WideString): WideString;
    function DecryptBytes(data: OleVariant): OleVariant;
    function DecryptBytesENC(const str: WideString): OleVariant;
    function DecryptString(data: OleVariant): WideString;
    function DecryptStringENC(const str: WideString): WideString;
    function CompressBytes(data: OleVariant): OleVariant;
    function CompressString(const str: WideString): OleVariant;
    function CompressBytesENC(data: OleVariant): WideString;
    function CompressStringENC(const str: WideString): WideString;
    function InflateBytes(data: OleVariant): OleVariant;
    function InflateBytesENC(const str: WideString): OleVariant;
    function InflateString(data: OleVariant): WideString;
    function InflateStringENC(const str: WideString): WideString;
    function SignBytes(data: OleVariant): OleVariant;
    function SignString(const str: WideString): OleVariant;
    function SignBytesENC(data: OleVariant): WideString;
    function SignStringENC(const str: WideString): WideString;
    function VerifyBytes(data: OleVariant; signature: OleVariant): Integer;
    function VerifyBytesENC(data: OleVariant; const encodedSig: WideString): Integer;
    function VerifyString(const str: WideString; signature: OleVariant): Integer;
    function VerifyStringENC(const str: WideString; const encodedSig: WideString): Integer;
    procedure SetSigningCert(const iCert: IChilkatCert);
    procedure SetEncryptCert(const iCert: IChilkatCert);
    function GetLastCert: IChilkatCert;
    procedure SetVerifyCert(const iCert: IChilkatCert);
    function ReadFile(const filename: WideString): OleVariant;
    function WriteFile(const filename: WideString; binaryData: OleVariant): Integer;
    function OpaqueSignBytes(data: OleVariant): OleVariant;
    function OpaqueSignString(const str: WideString): OleVariant;
    function OpaqueSignBytesENC(data: OleVariant): WideString;
    function OpaqueSignStringENC(const str: WideString): WideString;
    function OpaqueVerifyBytes(data: OleVariant): OleVariant;
    function OpaqueVerifyString(data: OleVariant): WideString;
    function OpaqueVerifyBytesENC(const str: WideString): OleVariant;
    function OpaqueVerifyStringENC(const str: WideString): WideString;
    function CkEncryptFile(const inFilename: WideString; const outFilename: WideString): Integer;
    function CkDecryptFile(const inFilename: WideString; const outFilename: WideString): Integer;
    procedure SetSecretKeyViaPassword(const password: WideString);
    function ByteSwap4321(bData: OleVariant): OleVariant;
    function Shorten(inData: OleVariant; numBytes: Integer): OleVariant;
    function Encode(byteData: OleVariant; const encoding: WideString): WideString;
    function Decode(const encodedStr: WideString; const encoding: WideString): OleVariant;
    procedure SetEncodedKey(const keyStr: WideString; const encoding: WideString);
    procedure SetEncodedIV(const ivStr: WideString; const encoding: WideString);
    function GetEncodedKey(const encoding: WideString): WideString;
    function GetEncodedIV(const encoding: WideString): WideString;
    procedure RandomizeIV;
    function BytesToString(inData: OleVariant; const Charset: WideString): WideString;
    function StringToBytes(const inStr: WideString; const Charset: WideString): OleVariant;
    function TrimEndingWith(const inStr: WideString; const ending: WideString): WideString;
    function GenEncodedSecretKey(const password: WideString; const encoding: WideString): WideString;
    function CreateP7S(const inFilename: WideString; const p7sFilename: WideString): Integer;
    function VerifyP7S(const inFilename: WideString; const p7sFilename: WideString): Integer;
    function HashFileENC(const filename: WideString): WideString;
    function HashFile(const filename: WideString): OleVariant;
    procedure SetHmacKeyBytes(keyBytes: OleVariant);
    procedure SetHmacKeyString(const key: WideString);
    function HmacBytes(inBytes: OleVariant): OleVariant;
    function HmacString(const inText: WideString): OleVariant;
    function HmacBytesENC(inBytes: OleVariant): WideString;
    function HmacStringENC(const inText: WideString): WideString;
    function CreateDetachedSignature(const inFilename: WideString; const sigFilename: WideString): Integer;
    function VerifyDetachedSignature(const inFilename: WideString; const sigFilename: WideString): Integer;
    function CreateP7M(const inFilename: WideString; const p7mFilename: WideString): Integer;
    function VerifyP7M(const p7mFilename: WideString; const outFilename: WideString): Integer;
    procedure SetHmacKeyEncoded(const key: WideString; const encoding: WideString);
    function SetDecryptCert2(const cert: IChilkatCert; const key: IPrivateKey): Integer;
    function SetDecryptCert(const cert: IChilkatCert): Integer;
    function EncryptEncoded(const str: WideString): WideString;
    function DecryptEncoded(const str: WideString): WideString;
    function ReEncode(const data: WideString; const fromEncoding: WideString; 
                      const toEncoding: WideString): WideString;
    procedure RandomizeKey;
    procedure AddEncryptCert(const cert: IChilkatCert);
    procedure ClearEncryptCerts;
    function GenRandomBytesENC(numBytes: Integer): WideString;
    function Pbkdf1(const password: WideString; const Charset: WideString; 
                    const hashAlg: WideString; const salt: WideString; iterationCount: Integer; 
                    outputKeyBitLen: Integer; const encoding: WideString): WideString;
    function Pbkdf2(const password: WideString; const Charset: WideString; 
                    const hashAlg: WideString; const salt: WideString; iterationCount: Integer; 
                    outputKeyBitLen: Integer; const encoding: WideString): WideString;
    procedure SetEncodedSalt(const saltStr: WideString; const encoding: WideString);
    function GetEncodedSalt(const encoding: WideString): WideString;
    function HashBeginBytes(data: OleVariant): Integer;
    function HashBeginString(const strData: WideString): Integer;
    function HashMoreString(const strData: WideString): Integer;
    function HashMoreBytes(data: OleVariant): Integer;
    function HashFinal: OleVariant;
    function HashFinalENC: WideString;
    function MySqlAesEncrypt(const strData: WideString; const strKey: WideString): WideString;
    function MySqlAesDecrypt(const strEncrypted: WideString; const strKey: WideString): WideString;
    function EncodeString(const inStr: WideString; const Charset: WideString; 
                          const encoding: WideString): WideString;
    function DecodeString(const inStr: WideString; const Charset: WideString; 
                          const encoding: WideString): WideString;
    function AddPfxSourceData(pfxData: OleVariant; const password: WideString): Integer;
    function AddPfxSourceFile(const pfxFilePath: WideString; const password: WideString): Integer;
    function SetSigningCert2(const cert: IChilkatCert; const key: IPrivateKey): Integer;
    property  ControlInterface: IChilkatCrypt2 read GetControlInterface;
    property  DefaultInterface: IChilkatCrypt2 read GetControlInterface;
    property LastErrorText: WideString index 3 read GetWideStringProp;
    property LastErrorXml: WideString index 4 read GetWideStringProp;
    property LastErrorHtml: WideString index 5 read GetWideStringProp;
    property Version: WideString index 7 read GetWideStringProp;
    property SecretKey: OleVariant index 8 read GetOleVariantProp write SetOleVariantProp;
    property IV: OleVariant index 9 read GetOleVariantProp write SetOleVariantProp;
    property BlockSize: Integer index 97 read GetIntegerProp;
    property salt: OleVariant index 112 read GetOleVariantProp write SetOleVariantProp;
  published
    property Anchors;
    property KeyLength: Integer index 10 read GetIntegerProp write SetIntegerProp stored False;
    property PaddingScheme: Integer index 11 read GetIntegerProp write SetIntegerProp stored False;
    property CipherMode: WideString index 12 read GetWideStringProp write SetWideStringProp stored False;
    property Charset: WideString index 15 read GetWideStringProp write SetWideStringProp stored False;
    property HashAlgorithm: WideString index 16 read GetWideStringProp write SetWideStringProp stored False;
    property CryptAlgorithm: WideString index 17 read GetWideStringProp write SetWideStringProp stored False;
    property EncodingMode: WideString index 20 read GetWideStringProp write SetWideStringProp stored False;
    property CompressionAlgorithm: WideString index 31 read GetWideStringProp write SetWideStringProp stored False;
    property ByteSwapOnDecrypt: Integer index 67 read GetIntegerProp write SetIntegerProp stored False;
    property HavalRounds: Integer index 91 read GetIntegerProp write SetIntegerProp stored False;
    property Rc2EffectiveKeyLength: Integer index 94 read GetIntegerProp write SetIntegerProp stored False;
    property LastChunk: Integer index 95 read GetIntegerProp write SetIntegerProp stored False;
    property FirstChunk: Integer index 96 read GetIntegerProp write SetIntegerProp stored False;
    property IncludeCertChain: Integer index 99 read GetIntegerProp write SetIntegerProp stored False;
    property PbesPassword: WideString index 111 read GetWideStringProp write SetWideStringProp stored False;
    property iterationCount: Integer index 113 read GetIntegerProp write SetIntegerProp stored False;
    property PbesAlgorithm: WideString index 116 read GetWideStringProp write SetWideStringProp stored False;
    property UuMode: WideString index 127 read GetWideStringProp write SetWideStringProp stored False;
    property UuFilename: WideString index 128 read GetWideStringProp write SetWideStringProp stored False;
    property VerboseLogging: Integer index 129 read GetIntegerProp write SetIntegerProp stored False;
    property Pkcs7CryptAlg: WideString index 132 read GetWideStringProp write SetWideStringProp stored False;
    property OnPercentDone: TChilkatCrypt2PercentDone read FOnPercentDone write FOnPercentDone;
    property OnAbortCheck: TChilkatCrypt2AbortCheck read FOnAbortCheck write FOnAbortCheck;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TChilkatOmaDrm
// Help String      : ChilkatOmaDrm Class
// Default Interface: IChilkatOmaDrm
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TChilkatOmaDrm = class(TOleControl)
  private
    FIntf: IChilkatOmaDrm;
    function  GetControlInterface: IChilkatOmaDrm;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_IV: OleVariant;
    procedure Set_IV(pVal: OleVariant);
    function Get_encryptedData: OleVariant;
    function Get_decryptedData: OleVariant;
  public
    function UnlockComponent(const unlockCode: WideString): Integer;
    function LoadDcfFile(const filename: WideString): Integer;
    function LoadDcfData(data: OleVariant): Integer;
    function SaveDecrypted(const filename: WideString): Integer;
    function GetHeaderField(const fieldName: WideString): WideString;
    function SaveLastError(const b1: WideString): Integer;
    procedure LoadUnencryptedData(data: OleVariant);
    procedure SetEncodedIV(const encodedIV: WideString; const encoding: WideString);
    function LoadUnencryptedFile(const filename: WideString): Integer;
    function CreateDcfFile(const filename: WideString): Integer;
    property  ControlInterface: IChilkatOmaDrm read GetControlInterface;
    property  DefaultInterface: IChilkatOmaDrm read GetControlInterface;
    property DrmContentVersion: Integer index 5 read GetIntegerProp;
    property IV: OleVariant index 9 read GetOleVariantProp write SetOleVariantProp;
    property encryptedData: OleVariant index 10 read GetOleVariantProp;
    property decryptedData: OleVariant index 11 read GetOleVariantProp;
    property LastErrorText: WideString index 14 read GetWideStringProp;
    property LastErrorXml: WideString index 15 read GetWideStringProp;
    property LastErrorHtml: WideString index 16 read GetWideStringProp;
  published
    property Anchors;
    property Base64Key: WideString index 4 read GetWideStringProp write SetWideStringProp stored False;
    property ContentType: WideString index 6 read GetWideStringProp write SetWideStringProp stored False;
    property ContentUri: WideString index 7 read GetWideStringProp write SetWideStringProp stored False;
    property Headers: WideString index 8 read GetWideStringProp write SetWideStringProp stored False;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TChilkatNtlm
// Help String      : ChilkatNtlm Class
// Default Interface: IChilkatNtlm
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TChilkatNtlm = class(TOleControl)
  private
    FIntf: IChilkatNtlm;
    function  GetControlInterface: IChilkatNtlm;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    function UnlockComponent(const unlockCode: WideString): Integer;
    function SaveLastError(const filename: WideString): Integer;
    function GenType1: WideString;
    function GenType2(const type1Msg: WideString): WideString;
    function GenType3(const type2Msg: WideString): WideString;
    function ParseType1(const type1Msg: WideString): WideString;
    function ParseType2(const type2Msg: WideString): WideString;
    function ParseType3(const type3Msg: WideString): WideString;
    function SetFlag(const flagLetter: WideString; on_: Integer): Integer;
    function LoadType3(const type3Msg: WideString): Integer;
    property  ControlInterface: IChilkatNtlm read GetControlInterface;
    property  DefaultInterface: IChilkatNtlm read GetControlInterface;
    property LastErrorText: WideString index 2 read GetWideStringProp;
    property LastErrorXml: WideString index 3 read GetWideStringProp;
    property LastErrorHtml: WideString index 4 read GetWideStringProp;
  published
    property Anchors;
    property TargetName: WideString index 6 read GetWideStringProp write SetWideStringProp stored False;
    property NetBiosComputerName: WideString index 7 read GetWideStringProp write SetWideStringProp stored False;
    property NetBiosDomainName: WideString index 8 read GetWideStringProp write SetWideStringProp stored False;
    property DnsDomainName: WideString index 9 read GetWideStringProp write SetWideStringProp stored False;
    property DnsComputerName: WideString index 10 read GetWideStringProp write SetWideStringProp stored False;
    property UserName: WideString index 11 read GetWideStringProp write SetWideStringProp stored False;
    property password: WideString index 12 read GetWideStringProp write SetWideStringProp stored False;
    property NtlmVersion: Integer index 13 read GetIntegerProp write SetIntegerProp stored False;
    property OemCodePage: Integer index 14 read GetIntegerProp write SetIntegerProp stored False;
    property Flags: WideString index 15 read GetWideStringProp write SetWideStringProp stored False;
    property Domain: WideString index 16 read GetWideStringProp write SetWideStringProp stored False;
    property Workstation: WideString index 17 read GetWideStringProp write SetWideStringProp stored False;
    property EncodingMode: WideString index 24 read GetWideStringProp write SetWideStringProp stored False;
    property ClientChallenge: WideString index 26 read GetWideStringProp write SetWideStringProp stored False;
    property ServerChallenge: WideString index 27 read GetWideStringProp write SetWideStringProp stored False;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

procedure TChilkatCrypt2.InitControlData;
const
  CEventDispIDs: array [0..1] of DWORD = (
    $00000001, $00000002);
  CControlData: TControlData2 = (
    ClassID: '{3352B5B9-82E8-4FFD-9EB1-1A3E60056904}';
    EventIID: '{445E7755-E363-46E0-B3A8-011441B199E7}';
    EventCount: 2;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil (*HR:$80004002*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
  TControlData2(CControlData).FirstEventOfs := Cardinal(@@FOnPercentDone) - Cardinal(Self);
end;

procedure TChilkatCrypt2.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IChilkatCrypt2;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TChilkatCrypt2.GetControlInterface: IChilkatCrypt2;
begin
  CreateControl;
  Result := FIntf;
end;

function TChilkatCrypt2.Get_SecretKey: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.SecretKey;
end;

procedure TChilkatCrypt2.Set_SecretKey(pVal: OleVariant);
begin
  DefaultInterface.Set_SecretKey(pVal);
end;

function TChilkatCrypt2.Get_IV: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.IV;
end;

procedure TChilkatCrypt2.Set_IV(pVal: OleVariant);
begin
  DefaultInterface.Set_IV(pVal);
end;

function TChilkatCrypt2.Get_salt: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.salt;
end;

procedure TChilkatCrypt2.Set_salt(propVal: OleVariant);
begin
  DefaultInterface.Set_salt(propVal);
end;

function TChilkatCrypt2.UnlockComponent(const b1: WideString): Integer;
begin
  Result := DefaultInterface.UnlockComponent(b1);
end;

function TChilkatCrypt2.IsUnlocked: Integer;
begin
  Result := DefaultInterface.IsUnlocked;
end;

function TChilkatCrypt2.SaveLastError(const b1: WideString): Integer;
begin
  Result := DefaultInterface.SaveLastError(b1);
end;

function TChilkatCrypt2.GenerateSecretKey(const str: WideString): OleVariant;
begin
  Result := DefaultInterface.GenerateSecretKey(str);
end;

procedure TChilkatCrypt2.SetCSP(const iCSP: IChilkatCSP);
begin
  DefaultInterface.SetCSP(iCSP);
end;

function TChilkatCrypt2.HashString(const str: WideString): OleVariant;
begin
  Result := DefaultInterface.HashString(str);
end;

function TChilkatCrypt2.HashBytes(data: OleVariant): OleVariant;
begin
  Result := DefaultInterface.HashBytes(data);
end;

function TChilkatCrypt2.HashStringENC(const str: WideString): WideString;
begin
  Result := DefaultInterface.HashStringENC(str);
end;

function TChilkatCrypt2.HashBytesENC(data: OleVariant): WideString;
begin
  Result := DefaultInterface.HashBytesENC(data);
end;

function TChilkatCrypt2.EncryptBytes(data: OleVariant): OleVariant;
begin
  Result := DefaultInterface.EncryptBytes(data);
end;

function TChilkatCrypt2.EncryptString(const str: WideString): OleVariant;
begin
  Result := DefaultInterface.EncryptString(str);
end;

function TChilkatCrypt2.EncryptBytesENC(data: OleVariant): WideString;
begin
  Result := DefaultInterface.EncryptBytesENC(data);
end;

function TChilkatCrypt2.EncryptStringENC(const str: WideString): WideString;
begin
  Result := DefaultInterface.EncryptStringENC(str);
end;

function TChilkatCrypt2.DecryptBytes(data: OleVariant): OleVariant;
begin
  Result := DefaultInterface.DecryptBytes(data);
end;

function TChilkatCrypt2.DecryptBytesENC(const str: WideString): OleVariant;
begin
  Result := DefaultInterface.DecryptBytesENC(str);
end;

function TChilkatCrypt2.DecryptString(data: OleVariant): WideString;
begin
  Result := DefaultInterface.DecryptString(data);
end;

function TChilkatCrypt2.DecryptStringENC(const str: WideString): WideString;
begin
  Result := DefaultInterface.DecryptStringENC(str);
end;

function TChilkatCrypt2.CompressBytes(data: OleVariant): OleVariant;
begin
  Result := DefaultInterface.CompressBytes(data);
end;

function TChilkatCrypt2.CompressString(const str: WideString): OleVariant;
begin
  Result := DefaultInterface.CompressString(str);
end;

function TChilkatCrypt2.CompressBytesENC(data: OleVariant): WideString;
begin
  Result := DefaultInterface.CompressBytesENC(data);
end;

function TChilkatCrypt2.CompressStringENC(const str: WideString): WideString;
begin
  Result := DefaultInterface.CompressStringENC(str);
end;

function TChilkatCrypt2.InflateBytes(data: OleVariant): OleVariant;
begin
  Result := DefaultInterface.InflateBytes(data);
end;

function TChilkatCrypt2.InflateBytesENC(const str: WideString): OleVariant;
begin
  Result := DefaultInterface.InflateBytesENC(str);
end;

function TChilkatCrypt2.InflateString(data: OleVariant): WideString;
begin
  Result := DefaultInterface.InflateString(data);
end;

function TChilkatCrypt2.InflateStringENC(const str: WideString): WideString;
begin
  Result := DefaultInterface.InflateStringENC(str);
end;

function TChilkatCrypt2.SignBytes(data: OleVariant): OleVariant;
begin
  Result := DefaultInterface.SignBytes(data);
end;

function TChilkatCrypt2.SignString(const str: WideString): OleVariant;
begin
  Result := DefaultInterface.SignString(str);
end;

function TChilkatCrypt2.SignBytesENC(data: OleVariant): WideString;
begin
  Result := DefaultInterface.SignBytesENC(data);
end;

function TChilkatCrypt2.SignStringENC(const str: WideString): WideString;
begin
  Result := DefaultInterface.SignStringENC(str);
end;

function TChilkatCrypt2.VerifyBytes(data: OleVariant; signature: OleVariant): Integer;
begin
  Result := DefaultInterface.VerifyBytes(data, signature);
end;

function TChilkatCrypt2.VerifyBytesENC(data: OleVariant; const encodedSig: WideString): Integer;
begin
  Result := DefaultInterface.VerifyBytesENC(data, encodedSig);
end;

function TChilkatCrypt2.VerifyString(const str: WideString; signature: OleVariant): Integer;
begin
  Result := DefaultInterface.VerifyString(str, signature);
end;

function TChilkatCrypt2.VerifyStringENC(const str: WideString; const encodedSig: WideString): Integer;
begin
  Result := DefaultInterface.VerifyStringENC(str, encodedSig);
end;

procedure TChilkatCrypt2.SetSigningCert(const iCert: IChilkatCert);
begin
  DefaultInterface.SetSigningCert(iCert);
end;

procedure TChilkatCrypt2.SetEncryptCert(const iCert: IChilkatCert);
begin
  DefaultInterface.SetEncryptCert(iCert);
end;

function TChilkatCrypt2.GetLastCert: IChilkatCert;
begin
  Result := DefaultInterface.GetLastCert;
end;

procedure TChilkatCrypt2.SetVerifyCert(const iCert: IChilkatCert);
begin
  DefaultInterface.SetVerifyCert(iCert);
end;

function TChilkatCrypt2.ReadFile(const filename: WideString): OleVariant;
begin
  Result := DefaultInterface.ReadFile(filename);
end;

function TChilkatCrypt2.WriteFile(const filename: WideString; binaryData: OleVariant): Integer;
begin
  Result := DefaultInterface.WriteFile(filename, binaryData);
end;

function TChilkatCrypt2.OpaqueSignBytes(data: OleVariant): OleVariant;
begin
  Result := DefaultInterface.OpaqueSignBytes(data);
end;

function TChilkatCrypt2.OpaqueSignString(const str: WideString): OleVariant;
begin
  Result := DefaultInterface.OpaqueSignString(str);
end;

function TChilkatCrypt2.OpaqueSignBytesENC(data: OleVariant): WideString;
begin
  Result := DefaultInterface.OpaqueSignBytesENC(data);
end;

function TChilkatCrypt2.OpaqueSignStringENC(const str: WideString): WideString;
begin
  Result := DefaultInterface.OpaqueSignStringENC(str);
end;

function TChilkatCrypt2.OpaqueVerifyBytes(data: OleVariant): OleVariant;
begin
  Result := DefaultInterface.OpaqueVerifyBytes(data);
end;

function TChilkatCrypt2.OpaqueVerifyString(data: OleVariant): WideString;
begin
  Result := DefaultInterface.OpaqueVerifyString(data);
end;

function TChilkatCrypt2.OpaqueVerifyBytesENC(const str: WideString): OleVariant;
begin
  Result := DefaultInterface.OpaqueVerifyBytesENC(str);
end;

function TChilkatCrypt2.OpaqueVerifyStringENC(const str: WideString): WideString;
begin
  Result := DefaultInterface.OpaqueVerifyStringENC(str);
end;

function TChilkatCrypt2.CkEncryptFile(const inFilename: WideString; const outFilename: WideString): Integer;
begin
  Result := DefaultInterface.CkEncryptFile(inFilename, outFilename);
end;

function TChilkatCrypt2.CkDecryptFile(const inFilename: WideString; const outFilename: WideString): Integer;
begin
  Result := DefaultInterface.CkDecryptFile(inFilename, outFilename);
end;

procedure TChilkatCrypt2.SetSecretKeyViaPassword(const password: WideString);
begin
  DefaultInterface.SetSecretKeyViaPassword(password);
end;

function TChilkatCrypt2.ByteSwap4321(bData: OleVariant): OleVariant;
begin
  Result := DefaultInterface.ByteSwap4321(bData);
end;

function TChilkatCrypt2.Shorten(inData: OleVariant; numBytes: Integer): OleVariant;
begin
  Result := DefaultInterface.Shorten(inData, numBytes);
end;

function TChilkatCrypt2.Encode(byteData: OleVariant; const encoding: WideString): WideString;
begin
  Result := DefaultInterface.Encode(byteData, encoding);
end;

function TChilkatCrypt2.Decode(const encodedStr: WideString; const encoding: WideString): OleVariant;
begin
  Result := DefaultInterface.Decode(encodedStr, encoding);
end;

procedure TChilkatCrypt2.SetEncodedKey(const keyStr: WideString; const encoding: WideString);
begin
  DefaultInterface.SetEncodedKey(keyStr, encoding);
end;

procedure TChilkatCrypt2.SetEncodedIV(const ivStr: WideString; const encoding: WideString);
begin
  DefaultInterface.SetEncodedIV(ivStr, encoding);
end;

function TChilkatCrypt2.GetEncodedKey(const encoding: WideString): WideString;
begin
  Result := DefaultInterface.GetEncodedKey(encoding);
end;

function TChilkatCrypt2.GetEncodedIV(const encoding: WideString): WideString;
begin
  Result := DefaultInterface.GetEncodedIV(encoding);
end;

procedure TChilkatCrypt2.RandomizeIV;
begin
  DefaultInterface.RandomizeIV;
end;

function TChilkatCrypt2.BytesToString(inData: OleVariant; const Charset: WideString): WideString;
begin
  Result := DefaultInterface.BytesToString(inData, Charset);
end;

function TChilkatCrypt2.StringToBytes(const inStr: WideString; const Charset: WideString): OleVariant;
begin
  Result := DefaultInterface.StringToBytes(inStr, Charset);
end;

function TChilkatCrypt2.TrimEndingWith(const inStr: WideString; const ending: WideString): WideString;
begin
  Result := DefaultInterface.TrimEndingWith(inStr, ending);
end;

function TChilkatCrypt2.GenEncodedSecretKey(const password: WideString; const encoding: WideString): WideString;
begin
  Result := DefaultInterface.GenEncodedSecretKey(password, encoding);
end;

function TChilkatCrypt2.CreateP7S(const inFilename: WideString; const p7sFilename: WideString): Integer;
begin
  Result := DefaultInterface.CreateP7S(inFilename, p7sFilename);
end;

function TChilkatCrypt2.VerifyP7S(const inFilename: WideString; const p7sFilename: WideString): Integer;
begin
  Result := DefaultInterface.VerifyP7S(inFilename, p7sFilename);
end;

function TChilkatCrypt2.HashFileENC(const filename: WideString): WideString;
begin
  Result := DefaultInterface.HashFileENC(filename);
end;

function TChilkatCrypt2.HashFile(const filename: WideString): OleVariant;
begin
  Result := DefaultInterface.HashFile(filename);
end;

procedure TChilkatCrypt2.SetHmacKeyBytes(keyBytes: OleVariant);
begin
  DefaultInterface.SetHmacKeyBytes(keyBytes);
end;

procedure TChilkatCrypt2.SetHmacKeyString(const key: WideString);
begin
  DefaultInterface.SetHmacKeyString(key);
end;

function TChilkatCrypt2.HmacBytes(inBytes: OleVariant): OleVariant;
begin
  Result := DefaultInterface.HmacBytes(inBytes);
end;

function TChilkatCrypt2.HmacString(const inText: WideString): OleVariant;
begin
  Result := DefaultInterface.HmacString(inText);
end;

function TChilkatCrypt2.HmacBytesENC(inBytes: OleVariant): WideString;
begin
  Result := DefaultInterface.HmacBytesENC(inBytes);
end;

function TChilkatCrypt2.HmacStringENC(const inText: WideString): WideString;
begin
  Result := DefaultInterface.HmacStringENC(inText);
end;

function TChilkatCrypt2.CreateDetachedSignature(const inFilename: WideString; 
                                                const sigFilename: WideString): Integer;
begin
  Result := DefaultInterface.CreateDetachedSignature(inFilename, sigFilename);
end;

function TChilkatCrypt2.VerifyDetachedSignature(const inFilename: WideString; 
                                                const sigFilename: WideString): Integer;
begin
  Result := DefaultInterface.VerifyDetachedSignature(inFilename, sigFilename);
end;

function TChilkatCrypt2.CreateP7M(const inFilename: WideString; const p7mFilename: WideString): Integer;
begin
  Result := DefaultInterface.CreateP7M(inFilename, p7mFilename);
end;

function TChilkatCrypt2.VerifyP7M(const p7mFilename: WideString; const outFilename: WideString): Integer;
begin
  Result := DefaultInterface.VerifyP7M(p7mFilename, outFilename);
end;

procedure TChilkatCrypt2.SetHmacKeyEncoded(const key: WideString; const encoding: WideString);
begin
  DefaultInterface.SetHmacKeyEncoded(key, encoding);
end;

function TChilkatCrypt2.SetDecryptCert2(const cert: IChilkatCert; const key: IPrivateKey): Integer;
begin
  Result := DefaultInterface.SetDecryptCert2(cert, key);
end;

function TChilkatCrypt2.SetDecryptCert(const cert: IChilkatCert): Integer;
begin
  Result := DefaultInterface.SetDecryptCert(cert);
end;

function TChilkatCrypt2.EncryptEncoded(const str: WideString): WideString;
begin
  Result := DefaultInterface.EncryptEncoded(str);
end;

function TChilkatCrypt2.DecryptEncoded(const str: WideString): WideString;
begin
  Result := DefaultInterface.DecryptEncoded(str);
end;

function TChilkatCrypt2.ReEncode(const data: WideString; const fromEncoding: WideString; 
                                 const toEncoding: WideString): WideString;
begin
  Result := DefaultInterface.ReEncode(data, fromEncoding, toEncoding);
end;

procedure TChilkatCrypt2.RandomizeKey;
begin
  DefaultInterface.RandomizeKey;
end;

procedure TChilkatCrypt2.AddEncryptCert(const cert: IChilkatCert);
begin
  DefaultInterface.AddEncryptCert(cert);
end;

procedure TChilkatCrypt2.ClearEncryptCerts;
begin
  DefaultInterface.ClearEncryptCerts;
end;

function TChilkatCrypt2.GenRandomBytesENC(numBytes: Integer): WideString;
begin
  Result := DefaultInterface.GenRandomBytesENC(numBytes);
end;

function TChilkatCrypt2.Pbkdf1(const password: WideString; const Charset: WideString; 
                               const hashAlg: WideString; const salt: WideString; 
                               iterationCount: Integer; outputKeyBitLen: Integer; 
                               const encoding: WideString): WideString;
begin
  Result := DefaultInterface.Pbkdf1(password, Charset, hashAlg, salt, iterationCount, 
                                    outputKeyBitLen, encoding);
end;

function TChilkatCrypt2.Pbkdf2(const password: WideString; const Charset: WideString; 
                               const hashAlg: WideString; const salt: WideString; 
                               iterationCount: Integer; outputKeyBitLen: Integer; 
                               const encoding: WideString): WideString;
begin
  Result := DefaultInterface.Pbkdf2(password, Charset, hashAlg, salt, iterationCount, 
                                    outputKeyBitLen, encoding);
end;

procedure TChilkatCrypt2.SetEncodedSalt(const saltStr: WideString; const encoding: WideString);
begin
  DefaultInterface.SetEncodedSalt(saltStr, encoding);
end;

function TChilkatCrypt2.GetEncodedSalt(const encoding: WideString): WideString;
begin
  Result := DefaultInterface.GetEncodedSalt(encoding);
end;

function TChilkatCrypt2.HashBeginBytes(data: OleVariant): Integer;
begin
  Result := DefaultInterface.HashBeginBytes(data);
end;

function TChilkatCrypt2.HashBeginString(const strData: WideString): Integer;
begin
  Result := DefaultInterface.HashBeginString(strData);
end;

function TChilkatCrypt2.HashMoreString(const strData: WideString): Integer;
begin
  Result := DefaultInterface.HashMoreString(strData);
end;

function TChilkatCrypt2.HashMoreBytes(data: OleVariant): Integer;
begin
  Result := DefaultInterface.HashMoreBytes(data);
end;

function TChilkatCrypt2.HashFinal: OleVariant;
begin
  Result := DefaultInterface.HashFinal;
end;

function TChilkatCrypt2.HashFinalENC: WideString;
begin
  Result := DefaultInterface.HashFinalENC;
end;

function TChilkatCrypt2.MySqlAesEncrypt(const strData: WideString; const strKey: WideString): WideString;
begin
  Result := DefaultInterface.MySqlAesEncrypt(strData, strKey);
end;

function TChilkatCrypt2.MySqlAesDecrypt(const strEncrypted: WideString; const strKey: WideString): WideString;
begin
  Result := DefaultInterface.MySqlAesDecrypt(strEncrypted, strKey);
end;

function TChilkatCrypt2.EncodeString(const inStr: WideString; const Charset: WideString; 
                                     const encoding: WideString): WideString;
begin
  Result := DefaultInterface.EncodeString(inStr, Charset, encoding);
end;

function TChilkatCrypt2.DecodeString(const inStr: WideString; const Charset: WideString; 
                                     const encoding: WideString): WideString;
begin
  Result := DefaultInterface.DecodeString(inStr, Charset, encoding);
end;

function TChilkatCrypt2.AddPfxSourceData(pfxData: OleVariant; const password: WideString): Integer;
begin
  Result := DefaultInterface.AddPfxSourceData(pfxData, password);
end;

function TChilkatCrypt2.AddPfxSourceFile(const pfxFilePath: WideString; const password: WideString): Integer;
begin
  Result := DefaultInterface.AddPfxSourceFile(pfxFilePath, password);
end;

function TChilkatCrypt2.SetSigningCert2(const cert: IChilkatCert; const key: IPrivateKey): Integer;
begin
  Result := DefaultInterface.SetSigningCert2(cert, key);
end;

procedure TChilkatOmaDrm.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{0B70AB61-5C95-4126-9985-A32531CA8619}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80004002*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TChilkatOmaDrm.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IChilkatOmaDrm;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TChilkatOmaDrm.GetControlInterface: IChilkatOmaDrm;
begin
  CreateControl;
  Result := FIntf;
end;

function TChilkatOmaDrm.Get_IV: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.IV;
end;

procedure TChilkatOmaDrm.Set_IV(pVal: OleVariant);
begin
  DefaultInterface.Set_IV(pVal);
end;

function TChilkatOmaDrm.Get_encryptedData: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.encryptedData;
end;

function TChilkatOmaDrm.Get_decryptedData: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.decryptedData;
end;

function TChilkatOmaDrm.UnlockComponent(const unlockCode: WideString): Integer;
begin
  Result := DefaultInterface.UnlockComponent(unlockCode);
end;

function TChilkatOmaDrm.LoadDcfFile(const filename: WideString): Integer;
begin
  Result := DefaultInterface.LoadDcfFile(filename);
end;

function TChilkatOmaDrm.LoadDcfData(data: OleVariant): Integer;
begin
  Result := DefaultInterface.LoadDcfData(data);
end;

function TChilkatOmaDrm.SaveDecrypted(const filename: WideString): Integer;
begin
  Result := DefaultInterface.SaveDecrypted(filename);
end;

function TChilkatOmaDrm.GetHeaderField(const fieldName: WideString): WideString;
begin
  Result := DefaultInterface.GetHeaderField(fieldName);
end;

function TChilkatOmaDrm.SaveLastError(const b1: WideString): Integer;
begin
  Result := DefaultInterface.SaveLastError(b1);
end;

procedure TChilkatOmaDrm.LoadUnencryptedData(data: OleVariant);
begin
  DefaultInterface.LoadUnencryptedData(data);
end;

procedure TChilkatOmaDrm.SetEncodedIV(const encodedIV: WideString; const encoding: WideString);
begin
  DefaultInterface.SetEncodedIV(encodedIV, encoding);
end;

function TChilkatOmaDrm.LoadUnencryptedFile(const filename: WideString): Integer;
begin
  Result := DefaultInterface.LoadUnencryptedFile(filename);
end;

function TChilkatOmaDrm.CreateDcfFile(const filename: WideString): Integer;
begin
  Result := DefaultInterface.CreateDcfFile(filename);
end;

procedure TChilkatNtlm.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{9794AD41-68E7-4815-BED1-EC7676DC001F}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80004002*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TChilkatNtlm.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IChilkatNtlm;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TChilkatNtlm.GetControlInterface: IChilkatNtlm;
begin
  CreateControl;
  Result := FIntf;
end;

function TChilkatNtlm.UnlockComponent(const unlockCode: WideString): Integer;
begin
  Result := DefaultInterface.UnlockComponent(unlockCode);
end;

function TChilkatNtlm.SaveLastError(const filename: WideString): Integer;
begin
  Result := DefaultInterface.SaveLastError(filename);
end;

function TChilkatNtlm.GenType1: WideString;
begin
  Result := DefaultInterface.GenType1;
end;

function TChilkatNtlm.GenType2(const type1Msg: WideString): WideString;
begin
  Result := DefaultInterface.GenType2(type1Msg);
end;

function TChilkatNtlm.GenType3(const type2Msg: WideString): WideString;
begin
  Result := DefaultInterface.GenType3(type2Msg);
end;

function TChilkatNtlm.ParseType1(const type1Msg: WideString): WideString;
begin
  Result := DefaultInterface.ParseType1(type1Msg);
end;

function TChilkatNtlm.ParseType2(const type2Msg: WideString): WideString;
begin
  Result := DefaultInterface.ParseType2(type2Msg);
end;

function TChilkatNtlm.ParseType3(const type3Msg: WideString): WideString;
begin
  Result := DefaultInterface.ParseType3(type3Msg);
end;

function TChilkatNtlm.SetFlag(const flagLetter: WideString; on_: Integer): Integer;
begin
  Result := DefaultInterface.SetFlag(flagLetter, on_);
end;

function TChilkatNtlm.LoadType3(const type3Msg: WideString): Integer;
begin
  Result := DefaultInterface.LoadType3(type3Msg);
end;

procedure Register;
begin
  RegisterComponents(dtlOcxPage, [TChilkatCrypt2, TChilkatOmaDrm, TChilkatNtlm]);
end;

end.
