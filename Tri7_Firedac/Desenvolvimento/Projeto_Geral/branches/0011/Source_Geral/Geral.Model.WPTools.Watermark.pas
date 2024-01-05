unit Geral.Model.WPTools.Watermark;

interface

uses
  Vcl.Graphics,
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Jpeg,
  WPRTEPlatform,
  WPRTEPaint,
  WPRTEDefsConsts,
  WPCTRRich;

type
  TPaintWatermark = reference to procedure (Sender: TObject;
    RTFEngine: TWPRTFEnginePaint; toCanvas: TCanvas; PageRect: TRect;
    PaintPageNr, RTFPageNr: Integer; WaterMarkRef: TObject; XRes,
    YRes: Integer; CurrentZoom: Single; PaintMode: TWPPaintModes);

  TWPToolsWatermark = class
  private
    FBackground: TJPEGImage;
    FFonteSize: integer;
    FFonteCollor: TColor;
    FTextoPadrao: string;
    FTextoMagemLef: Double;
    FTextoMagemButton: Double;
    FShowText: Boolean;
    FPaintWatermarkOrigem: TPaintWatermark;

    function GetFonteSize: integer;
    function GetFonteCollor: TColor;
    function GetShowText: Boolean;
    function GetTextoPadrao: string;
    function GetTextoMagemLef: Double;
    function GetTextoMagemButton: Double;

    procedure PrintBackground(toCanvas : TCanvas; PageRect : TRect; Mult : Double);

  public
    constructor Create(const vpJpegBackground: string; const vpPaintWatermarkOrigem: TPaintWatermark);

    destructor Destroy; override;

    procedure WPRichTextPaintWatermark(Sender: TObject;
      RTFEngine: TWPRTFEnginePaint; toCanvas: TCanvas; PageRect: TRect;
      PaintPageNr, RTFPageNr: Integer; WaterMarkRef: TObject; XRes,
      YRes: Integer; CurrentZoom: Single; PaintMode: TWPPaintModes);

  end;

implementation

uses
  Controles;

procedure TWPToolsWatermark.WPRichTextPaintWatermark(Sender: TObject;
  RTFEngine: TWPRTFEnginePaint; toCanvas: TCanvas; PageRect: TRect;
  PaintPageNr, RTFPageNr: Integer; WaterMarkRef: TObject; XRes,
  YRes: Integer; CurrentZoom: Single; PaintMode: TWPPaintModes);

  {$REGION 'Funcções'}
  function XP(cm: Double): Integer;
  begin
     Result := MulDiv(WPCentimeterToTwips(cm), Xres, 1440);
  end;

  function YP(cm: Double): Integer;
  begin
    Result := MulDiv(WPCentimeterToTwips(cm), Yres, 1440);
  end;
  {$ENDREGION}

var
  viTexto: string;
begin
  PrintBackground(toCanvas,PageRect, (XRes / Screen.PixelsPerInch));

  if FShowText then
  begin
    toCanvas.Brush.Style := bsClear;
    toCanvas.Font.Name   := 'Arial';
    toCanvas.Font.Style  := [fsBold];
    toCanvas.Font.Color  := FFonteCollor;
    toCanvas.Font.Size   := FFonteSize;

    if not FTextoPadrao.Trim.IsEmpty then
      toCanvas.TextOut(PageRect.Left + XP(FTextoMagemLef), (PageRect.Bottom - YP(FTextoMagemButton) - toCanvas.TextHeight(FTextoPadrao) div 2), FTextoPadrao);

    viTexto := 'Data: '+ DateToStr(Date);
    toCanvas.TextOut(PageRect.Left + XP(FTextoMagemLef), (PageRect.Bottom - YP(FTextoMagemButton-0.4) - toCanvas.TextHeight(viTexto) div 2), viTexto);
    viTexto := 'Página: ' + RTFPageNr.ToString + ' de ' + TWPRichText(Sender).PageCount.ToString;
    toCanvas.TextOut(PageRect.Left + XP(FTextoMagemLef), (PageRect.Bottom - YP(FTextoMagemButton-0.8) - toCanvas.TextHeight(viTexto) div 2), viTexto);
  end;

  //Evento externo
  if Assigned(FPaintWatermarkOrigem) then
    FPaintWatermarkOrigem(Sender,
      RTFEngine,
      toCanvas,
      PageRect,
      PaintPageNr,
      RTFPageNr,
      WaterMarkRef,
      XRes,
      YRes,
      CurrentZoom,
      PaintMode);
end;

constructor TWPToolsWatermark.Create(const vpJpegBackground: string;
   const vpPaintWatermarkOrigem: TPaintWatermark);
begin
  FFonteSize       := GetFonteSize;
  FFonteCollor     := GetFonteCollor;
  FShowText        := GetShowText;
  FTextoPadrao     := GetTextoPadrao;
  FTextoMagemLef   := GetTextoMagemLef;
  FTextoMagemButton:= GetTextoMagemButton;

  FPaintWatermarkOrigem := vpPaintWatermarkOrigem;

  FBackground := TJPEGImage.Create;
  FBackground.LoadFromFile(vpJpegBackground);
end;

destructor TWPToolsWatermark.Destroy;
begin
  FreeAndNil(FBackground);
  inherited;
end;

function TWPToolsWatermark.GetTextoMagemButton: Double;
begin
  Result := dtmControles.BuscarParametroOutroSistema(
              'WATERMARK_MARGEM_BUTTON_TEXTO',
              'PDF',
              'PRINCIPAL',
              '5');
end;

function TWPToolsWatermark.GetTextoMagemLef: Double;
begin
  Result := dtmControles.BuscarParametroOutroSistema(
              'WATERMARK_MARGEM_LEFT_TEXTO',
              'PDF',
              'PRINCIPAL',
              '5');
end;

function TWPToolsWatermark.GetTextoPadrao: string;
begin
  Result := dtmControles.BuscarParametroOutroSistema(
              'WATERMARK_FRASE_PADRAO_TEXTO',
              'PDF',
              'PRINCIPAL',
              '5');
end;

function TWPToolsWatermark.GetFonteCollor: TColor;
var
  viCor: string;
begin
  viCor := dtmControles.BuscarParametroOutroSistema(
            'WATERMARK_TEXTO_COR_FONTE',
            'PDF',
            'PRINCIPAL',
            '5');
  if viCor.Trim.IsEmpty then
    Result := clBlack
  else
    Result := StringToColor(viCor);
end;

function TWPToolsWatermark.GetFonteSize: integer;
begin
  Result := dtmControles.BuscarParametroOutroSistema(
              'WATERMARK_TEXTO_TAMANHO_FONTE',
              'PDF',
              'PRINCIPAL',
              '5');
end;

function TWPToolsWatermark.GetShowText: Boolean;
begin
  Result := dtmControles.BuscarParametroOutroSistema(
              'WATERMARK_TEXTO_VISIVEL',
              'PDF',
              'PRINCIPAL',
              '5') = 'S';
end;

procedure TWPToolsWatermark.PrintBackground(toCanvas : TCanvas; PageRect : TRect; Mult : Double);
var
  x,
  y : Integer;
begin
  x := PageRect.Left;

  if Abs(Mult-1)<0.01 then
    while x<PageRect.Right do
    begin
      y := PageRect.Top;
      while y<PageRect.Bottom do
      begin
        toCanvas.Draw(x,y,FBackground);
        inc(y, FBackground.Height);
      end;
      inc(x, FBackground.Width);
    end
  else
    while x<PageRect.Right do
    begin
      y := PageRect.Top;
      while y<PageRect.Bottom do
      begin
       toCanvas.StretchDraw(Rect(x,y, Round(x + FBackground.Width * mult), Round(y + FBackground.Height * mult)),FBackground);
       inc(y, Round(FBackground.Height*mult));
      end;
      inc(x, Round(FBackground.Width*mult));
    end;
end;

end.
