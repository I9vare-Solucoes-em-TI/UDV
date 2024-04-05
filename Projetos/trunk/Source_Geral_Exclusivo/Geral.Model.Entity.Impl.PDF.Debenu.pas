{* @hash       2b3a4f080d4b5e2a8e9e0d19eed146145d119703095919aaedf5e5e6a83c
 * @version    1.0.0.0
 * @unit       Geral.Model.Entity.Impl.PDF.Debenu.pas
 * @author     I9vare
 * @copyright  Copyright (c) 2013 I9vare Gestão e Soluções em TI. (https://www.i9vare.com)
 *}

unit Geral.Model.Entity.Impl.PDF.Debenu;

interface

uses
  Geral.Model.Entity.Spec.PDF, RotinasImagem, DebenuPDFLibrary1612;

type
  TPDF_Library = class(TInterfacedObject, IPDF_Library)
  private
    FPDF_Library: TDebenuPDFLibrary1612;

    constructor Create(const vpLicenseKey: string); reintroduce;

    function Internal_PDF_A_Mode(const vpValue: TPDF_A_Mode): Integer;

  public
    class function New(const vpLicenseKey: string): IPDF_Library;

    procedure LoadFromFile(const vpFileName: string);

    procedure SetCustomInformation(const vpKey: string; const vpValue: string);

    procedure SaveToFile(const vpFileName: string);

    procedure SaveToFileTiff(const vpFileName: string);

    procedure SaveToFileJpeg(const vpFileName: string; const vpPagina: integer);

    function MergeFiles(const vpFileIn1, vpFileIn2, vpFileOut: string): Boolean;

    procedure SetPDF_A_Mode(const vpValue: TPDF_A_Mode);

    procedure SetAuthor(const vpValue: string);

    procedure SetTitle(const vpValue: string);

    procedure SetSubject(const vpValue: string);

    procedure SetKeywords(const vpValue: string);

    procedure SetCreator(const vpValue: string);

    procedure SetProducer(const vpValue: string);

    destructor Destroy; override;
  end;

implementation

uses
  System.SysUtils;

{ TPDF_Library }

constructor TPDF_Library.Create(const vpLicenseKey: string);
begin
  inherited Create;
  FPDF_Library := TDebenuPDFLibrary1612.Create;

  if FPDF_Library.UnlockKey(vpLicenseKey) <> 1 then
    raise Exception.Create('Invalid license key');
end;

destructor TPDF_Library.Destroy;
begin
  FPDF_Library.Free;
  inherited;
end;

function TPDF_Library.Internal_PDF_A_Mode(const vpValue: TPDF_A_Mode): Integer;
begin
  if vpValue = TPDF_A_Mode.tpPDF_A_1b then
    Exit(2);

  if FPDF_Library.GetDocumentFileName = string.Empty then
    Exit(301);

  Result := 302;
end;

procedure TPDF_Library.LoadFromFile(const vpFileName: string);
begin
  FPDF_Library.LoadFromFile(vpFileName, string.Empty);
end;

function TPDF_Library.MergeFiles(const vpFileIn1, vpFileIn2, vpFileOut: string): Boolean;
begin
  Result := FPDF_Library.MergeFiles(vpFileIn1, vpFileIn2, vpFileOut) = 1;
end;

class function TPDF_Library.New(const vpLicenseKey: string): IPDF_Library;
begin
  Result := Create(vpLicenseKey);
end;

procedure TPDF_Library.SaveToFile(const vpFileName: string);
begin
  FPDF_Library.SaveToFile(vpFileName);
end;

procedure TPDF_Library.SaveToFileTiff(const vpFileName: string);
var
  i: Integer;
//  Options
//  0 = BMP output
//  1 = JPEG output
//  2 = WMF output
//  3 = EMF output
//  4 = EPS output
//  5 = PNG output
//  6 = GIF output
//  7 = TIFF (LZW) output
//  8 = EMF+ output
//  9 = HTML5 output
//  10 = TIFF (G4) output
const
  C_DPI = 150;
  C_OPTIONS = 1;
  C_TEMP_FILE = 'C:\Temp\pagpdfimg.jpeg';
begin
  if not DirectoryExists('C:\Temp') then
    ForceDirectories('C:\Temp');
  try
    FPDF_Library.SetJPEGQuality(100);

    for i := 1 to FPDF_Library.PageCount do
    begin
      DeleteFile(C_TEMP_FILE);
      FPDF_Library.RenderPageToFile(C_DPI, i, C_OPTIONS, C_TEMP_FILE);
      RotinasImagem.SaveTiffFile(C_TEMP_FILE, vpFileName, True);
    end;
  finally
    DeleteFile(C_TEMP_FILE);
  end;
end;

procedure TPDF_Library.SaveToFileJpeg(const vpFileName: string; const vpPagina: integer);
var
  i: Integer;
//  Options
//  0 = BMP output
//  1 = JPEG output
//  2 = WMF output
//  3 = EMF output
//  4 = EPS output
//  5 = PNG output
//  6 = GIF output
//  7 = TIFF (LZW) output
//  8 = EMF+ output
//  9 = HTML5 output
//  10 = TIFF (G4) output
const
  C_DPI = 150;
  C_OPTIONS = 1;
begin
  DeleteFile(vpFileName);

  if vpPagina <= FPDF_Library.PageCount then
  begin
    FPDF_Library.SetJPEGQuality(100);
    FPDF_Library.RenderPageToFile(C_DPI, vpPagina, C_OPTIONS, vpFileName);
  end;
end;

procedure TPDF_Library.SetCustomInformation(const vpKey: string; const vpValue: string);
begin
  FPDF_Library.SetCustomInformation(vpKey, vpValue);
end;

procedure TPDF_Library.SetAuthor(const vpValue: string);
begin
  // 1 = Author
  FPDF_Library.SetInformation(1, vpValue);
end;

procedure TPDF_Library.SetTitle(const vpValue: string);
begin
  // 2 = Title
  FPDF_Library.SetInformation(2, vpValue);
end;

procedure TPDF_Library.SetSubject(const vpValue: string);
begin
  // 3 = Subject
  FPDF_Library.SetInformation(3, vpValue);
end;

procedure TPDF_Library.SetKeywords(const vpValue: string);
begin
  // 4 = Keywords
  FPDF_Library.SetInformation(4, vpValue);
end;

procedure TPDF_Library.SetCreator(const vpValue: string);
begin
  // 5 = Creator
  FPDF_Library.SetInformation(5, vpValue);
end;

procedure TPDF_Library.SetProducer(const vpValue: string);
begin
  // 6 = Producer
  FPDF_Library.SetInformation(6, vpValue);
end;

procedure TPDF_Library.SetPDF_A_Mode(const vpValue: TPDF_A_Mode);
begin
  if (vpValue = TPDF_A_Mode.tpPDF_A_1b) and (FPDF_Library.GetDocumentFileName <> string.Empty) then
    raise Exception.Create('PDF/A-1b available in new document only.');

  FPDF_Library.SetPDFAMode(Internal_PDF_A_Mode(vpValue));
end;

end.

