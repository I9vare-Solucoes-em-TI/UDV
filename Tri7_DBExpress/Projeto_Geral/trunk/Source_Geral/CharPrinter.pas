// TCharPrinter : Classe base para implementação de impressoras.
// não inclui personalização para nenhuma impressora específica, envia dados sem formatação.

unit CharPrinter;

Interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Printers, WinSpool;

type
  { Stream para enviar caracteres à impressora atual }
  TPrinterStream = class(TStream)
  private
    fPrinter: TPrinter;
    fHandle: THandle;
    fTitle: String;
    procedure CreateHandle;
    procedure FreeHandle;
  public
    constructor Create(aPrinter: TPrinter; aTitle: String);
    destructor Destroy; override;
    function Write(const Buffer; Count: Longint): Longint; override;
    property Handle: THandle read fHandle;
  end;

  TCharPrinter = class(TObject)
  private
    { Private declarations }
    fStream: TStream;
  protected
    { Protected declarations }
  public
    { Public declarations }
  published
    { Published declarations }
    constructor Create; virtual;
    destructor Destroy; override;
    procedure OpenDoc(aTitle: String); virtual;
    procedure SendData(aData: String);
    procedure CloseDoc; virtual;
    property PrintStream: TStream read fStream;

  end;

  // Definições para TAdvancedPrinter //

  TprtLang = (lngEPFX, lngESCP2, lngHPPCL);
  TprtFontSize = (pfs5cpi, pfs10cpi, pfs12cpi, pfs17cpi, pfs20cpi);
  TprtTextStyle = (psBold, psItalic, psUnderline);
  TprtTextStyles = set of TprtTextStyle;

  TAdvancedPrinter = class(TCharPrinter)
  private
    fLang: TprtLang;
    fFontSize: TprtFontSize;
    fTextStyle: TprtTextStyles;
    viTamanho: Integer;

    function GetLang: TprtLang;
    procedure SetFontSize(size: TprtFontSize);
    function GetFontSize: TprtFontSize;
    procedure SetTextStyle(styles: TprtTextStyles);
    function GetTextStyle: TprtTextStyles;
    procedure UpdateStyle;
    procedure Initialize;
    function Convert(s: string): string;
  public
    procedure CR;
    procedure LF; overload;
    procedure LF(Lines: Integer); overload;
    procedure CRLF;
    procedure FF;
    procedure Write(txt: string);
    procedure WriteLeft(txt, fill: string; size: Integer;
      vpAdGride: Boolean = False);
    procedure WriteRight(txt, fill: string; size: Integer;
      vpAdGride: Boolean = False);
    procedure WriteCenter(txt, fill: string; size: Integer;
      vpAdGride: Boolean = False);
    procedure WriteRepeat(txt: string; quant: Integer; vpPosicao: Integer;
      vpAdGride: Boolean = False);
    procedure SetLang(lang: TprtLang);
  published
    constructor Create; override;
    procedure OpenDoc(aTitle: String); override;
    property Language: TprtLang read GetLang write SetLang;
    property FontSize: TprtFontSize read GetFontSize write SetFontSize;
    property TextStyle: TprtTextStyles read GetTextStyle write SetTextStyle;
  end;

procedure Register;

implementation

procedure Register;
begin
  { RegisterComponents('AeF', [TCharPrinter]); }
end;

{ =================== }
{ = TPrinterStream = }
{ =================== }

constructor TPrinterStream.Create(aPrinter: TPrinter; aTitle: String);
begin
  inherited Create;
  fPrinter := aPrinter;
  fTitle := aTitle;
  CreateHandle;
end;

destructor TPrinterStream.Destroy;
begin
  FreeHandle;
  inherited;
end;

procedure TPrinterStream.FreeHandle;
begin
  if fHandle <> 0 then
  begin
    EndPagePrinter(fHandle);
    EndDocPrinter(fHandle);
    ClosePrinter(Handle);
    fHandle := 0;
  end;
end;

procedure TPrinterStream.CreateHandle;
type
  DOC_INFO_1 = packed record
    pDocName: PWideChar;
    pOutputFile: PWideChar;
    pDataType: PWideChar;
  end;
var
  aDevice, aDriver, aPort: array [0 .. 255] of Char;
  aMode: THandle;
  DocInfo: DOC_INFO_1;
begin
  DocInfo.pDocName := nil;
  DocInfo.pOutputFile := nil;
  DocInfo.pDataType := 'RAW';

  FreeHandle;
  if fHandle = 0 then
  begin
    fPrinter.GetPrinter(aDevice, aDriver, aPort, aMode);
    if OpenPrinter(aDevice, fHandle, nil) then
    begin
      DocInfo.pDocName := PChar(fTitle);
      if StartDocPrinter(fHandle, 1, @DocInfo) = 0 then
      begin
        ClosePrinter(fHandle);
        fHandle := 0;
      end
      else if not StartPagePrinter(fHandle) then
      begin
        EndDocPrinter(fHandle);
        ClosePrinter(fHandle);
        fHandle := 0;
      end;
    end
    else
      ShowMessage('Impressora Desligada ou não localizada!!!');
  end;

end;

function TPrinterStream.Write(const Buffer; Count: Longint): Longint;
var
  Bytes: Cardinal;
begin
  WritePrinter(Handle, @Buffer, Count, Bytes);
  Result := Bytes;
end;

{ ================= }
{ = TCharPrinter = }
{ ================= }

constructor TCharPrinter.Create;
begin
  inherited Create;
  fStream := nil;
end;

destructor TCharPrinter.Destroy;
begin
  if fStream <> nil then
    fStream.Free;
  inherited;
end;

procedure TCharPrinter.OpenDoc(aTitle: String);
begin
  if fStream = nil then
    fStream := TPrinterStream.Create(Printer, aTitle);
end;

procedure TCharPrinter.CloseDoc;
begin
  if fStream <> nil then
  begin
    fStream.Free;
    fStream := nil;
  end;
end;

{procedure TCharPrinter.SendData(aData: String);
var
  Data: array [0 .. 255] of Char;
  cnt: Integer;
begin
  for cnt := 0 to length(aData) - 1 do
    Data[cnt] := aData[cnt + 1];

  fStream.Write(Data, length(aData));
end;}

procedure   TCharPrinter.SendData (aData : String);
var
 Data : AnsiString;
begin
 Data := AnsiString(aData);
 fStream.Write(PAnsiChar(Data)^, Length(Data));
end;

{ ===================== }
{ = TAdvancedPrinter = }
{ ===================== }

procedure TAdvancedPrinter.SetLang(lang: TprtLang);
begin
  fLang := lang;
end;

function TAdvancedPrinter.GetLang: TprtLang;
begin
  Result := fLang;
end;

procedure TAdvancedPrinter.SetFontSize(size: TprtFontSize);
begin
  fFontSize := size;
  UpdateStyle;
end;

function TAdvancedPrinter.GetFontSize: TprtFontSize;
begin
  Result := fFontSize;
  UpdateStyle;
end;

procedure TAdvancedPrinter.SetTextStyle(styles: TprtTextStyles);
begin
  fTextStyle := styles;
  UpdateStyle;
end;

function TAdvancedPrinter.GetTextStyle: TprtTextStyles;
begin
  Result := fTextStyle;
  UpdateStyle;
end;

procedure TAdvancedPrinter.UpdateStyle;
var
  cmd: string;
  i: byte;
begin
  cmd := '';
  case fLang of
    lngESCP2, lngEPFX:
      begin
        i := 0;
        Case fFontSize of
          pfs5cpi:
            i := 32;
          pfs10cpi:
            i := 0;
          pfs12cpi:
            i := 1;
          pfs17cpi:
            i := 4;
          pfs20cpi:
            i := 5;
        end;
        if psBold in fTextStyle then
          i := i + 8;
        if psItalic in fTextStyle then
          i := i + 64;
        if psUnderline in fTextStyle then
          i := i + 128;
        cmd := #27'!' + chr(i);
      end;
    lngHPPCL:
      begin
        Case fFontSize of
          pfs5cpi:
            cmd := #27'(s5H';
          pfs10cpi:
            cmd := #27'(s10H';
          pfs12cpi:
            cmd := #27'(s12H';
          pfs17cpi:
            cmd := #27'(s17H';
          pfs20cpi:
            cmd := #27'(s20H';
        end;
        if psBold in fTextStyle then
          cmd := cmd + #27'(s3B'
        else
          cmd := cmd + #27'(s0B';
        if psItalic in fTextStyle then
          cmd := cmd + #27'(s1S'
        else
          cmd := cmd + #27'(s0S';
        if psUnderline in fTextStyle then
          cmd := cmd + #27'&d0D'
        else
          cmd := cmd + #27'&d@';
      end;
  end;
  SendData(cmd);
end;

procedure TAdvancedPrinter.Initialize;
begin
  case fLang of
    lngEPFX:
      SendData(#27'@'#27'2'#27'P'#18);
    lngESCP2:
      SendData(#27'@'#27'O'#27'2'#27'C0'#11#27'!'#0);
    lngHPPCL:
      SendData(#27'E'#27'&l2A'#27'&l0O'#27'&l6D'#27'(s4099T'#27'(s0P'#27'&k0S'#27'(s0S');
  end;
end;

function TAdvancedPrinter.Convert(s: string): string;
const
  accent: string = 'ãàáäâèéëêìíïîõòóöôùúüûçÃÀÁÄÂÈÉËÊÌÍÏÎÕÒÓÖÔÙÚÜÛÇ';
  noaccent: string = 'aaaaaeeeeiiiiooooouuuucAAAAAEEEEIIIIOOOOOUUUUC';
var
  i: Integer;
begin
  for i := 1 to length(accent) do
    While Pos(accent[i], s) > 0 do
      s[Pos(accent[i], s)] := noaccent[i];
  Result := s;
end;

constructor TAdvancedPrinter.Create;
begin
  inherited Create;
  fLang := lngESCP2;
  fFontSize := pfs10cpi;
  fTextStyle := [];
end;

procedure TAdvancedPrinter.OpenDoc(aTitle: String);
begin
  inherited OpenDoc(aTitle);
  Initialize;
end;

procedure TAdvancedPrinter.CR;
begin
  SendData(#13);
end;

procedure TAdvancedPrinter.LF;
begin
  SendData(#10);
end;

procedure TAdvancedPrinter.LF(Lines: Integer);
begin
  while Lines > 0 do
  begin
    SendData(#10);
    dec(Lines);
  end;
end;

procedure TAdvancedPrinter.CRLF;
begin
  SendData(#13#10);
end;

procedure TAdvancedPrinter.FF;
begin
  SendData(#12);
end;

procedure TAdvancedPrinter.Write(txt: string);
begin
  txt := Convert(txt);
  SendData(txt);
end;

procedure TAdvancedPrinter.WriteLeft(txt, fill: string; size: Integer;
  vpAdGride: Boolean = False);
begin
  txt := Convert(txt);

  viTamanho := size;
  if vpAdGride then
    viTamanho := size - 2;

  while length(txt) < viTamanho do
    txt := txt + fill;

  if vpAdGride then
    txt := #186 + txt + #186;

  SendData(Copy(txt, 1, size));
end;

procedure TAdvancedPrinter.WriteRight(txt, fill: string; size: Integer;
  vpAdGride: Boolean = False);
begin
  txt := Convert(txt);

  viTamanho := size;
  if vpAdGride then
    viTamanho := size - 2;

  while length(txt) < viTamanho do
    txt := fill + txt;

  if vpAdGride then
    txt := #186 + txt + #186;

  SendData(Copy(txt, length(txt) - size + 1, size));
end;

procedure TAdvancedPrinter.WriteCenter(txt, fill: string; size: Integer;
  vpAdGride: Boolean = False);
begin
  txt := Convert(txt);

  viTamanho := size;
  if vpAdGride then
    viTamanho := size - 2;

  while length(txt) < viTamanho do
    txt := fill + txt + fill;

  if length(txt) > viTamanho then
    Delete(txt, 1, 1);

  if vpAdGride then
    txt := #186 + txt + #186;

  SendData(Copy(txt, (length(txt) - size) div 2 + 1, size));
end;

procedure TAdvancedPrinter.WriteRepeat(txt: string; quant: Integer;
  vpPosicao: Integer; vpAdGride: Boolean = False);
var
  s: string;
begin
  s := '';

  viTamanho := quant;
  if vpAdGride then
    viTamanho := quant - 2;

  txt := Convert(txt);
  while viTamanho > 0 do
  begin
    s := s + txt;
    dec(viTamanho);
  end;

  if vpAdGride then
  begin
    case vpPosicao of
      1:
        s := #183 + s + #189;
      2:
        s := #186 + s + #186;
      3:
        s := #189 + s + #183;
    end;
  end
  else
    s := ' ' + s + ' ';

  if (vpAdGride) and (vpPosicao in [1, 3]) then
    Write(#27'{'#1); // Ativa impressão invertida

  SendData(s);
  Write(#27'{'#0); // Desativa impressão invertida
end;

end.
