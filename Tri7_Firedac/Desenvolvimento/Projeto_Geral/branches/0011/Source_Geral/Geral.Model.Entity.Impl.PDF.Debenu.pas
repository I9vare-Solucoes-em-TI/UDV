unit Geral.Model.Entity.Impl.PDF.Debenu;

interface

uses
  Geral.Model.Entity.Spec.PDF,
  DebenuPDFLibrary1612;

type
  TPDF_Library = class(TInterfacedObject, IPDF_Library)
  private
    FPDF_Library: TDebenuPDFLibrary1612;

    constructor Create(
      const vpLicenseKey: string); reintroduce;

    function Internal_PDF_A_Mode(
      const vpValue: TPDF_A_Mode): Integer;
  public
    class function New(
      const vpLicenseKey: string): IPDF_Library;

    procedure LoadFromFile(
      const vpFileName: string);

    procedure SetCustomInformation(
      const vpKey: string;
      const vpValue: string);

    procedure SaveToFile(
      const vpFileName: string);

    procedure SetPDF_A_Mode(
      const vpValue: TPDF_A_Mode);

    procedure SetKeywords(
      const vpValue: string);

    destructor Destroy; override;
  end;

implementation

uses
  System.SysUtils;

{ TPDF_Library }

constructor TPDF_Library.Create(
  const vpLicenseKey: string);
begin
  inherited Create;
  FPDF_Library := TDebenuPDFLibrary1612.Create;

  if FPDF_Library.UnlockKey(
    vpLicenseKey) <> 1 then
    raise Exception.Create(
      'Invalid license key');
end;

destructor TPDF_Library.Destroy;
begin
  FPDF_Library.Free;
  inherited;
end;

function TPDF_Library.Internal_PDF_A_Mode(
  const vpValue: TPDF_A_Mode): Integer;
begin
  if vpValue = TPDF_A_Mode.tpPDF_A_1b then
    Exit(
      2);

  if FPDF_Library.GetDocumentFileName = string.Empty then
    Exit(
      301);

  Result := 302;
end;

procedure TPDF_Library.LoadFromFile(
  const vpFileName: string);
begin
  FPDF_Library.LoadFromFile(
    vpFileName,
    string.Empty);
end;

class function TPDF_Library.New(
  const vpLicenseKey: string): IPDF_Library;
begin
  Result := Create(
    vpLicenseKey);
end;

procedure TPDF_Library.SaveToFile(
  const vpFileName: string);
begin
  FPDF_Library.SaveToFile(
    vpFileName);
end;

procedure TPDF_Library.SetCustomInformation(
  const vpKey: string;
  const vpValue: string);
begin
  FPDF_Library.SetCustomInformation(
    vpKey,
    vpValue);
end;

procedure TPDF_Library.SetKeywords(
  const vpValue: string);
begin
  // 4 = Keywords
  FPDF_Library.SetInformation(
    4,
    vpValue);
end;

procedure TPDF_Library.SetPDF_A_Mode(
  const vpValue: TPDF_A_Mode);
begin
  if (vpValue = TPDF_A_Mode.tpPDF_A_1b) and
    (FPDF_Library.GetDocumentFileName <> string.Empty) then
    raise Exception.Create(
      'PDF/A-1b available in new document only.');

  FPDF_Library.SetPDFAMode(
    Internal_PDF_A_Mode(
      vpValue));
end;

end.
