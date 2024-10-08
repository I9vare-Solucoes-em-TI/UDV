unit RotinasImagem;

interface

uses
  Windows, Forms, Messages, SysUtils, Variants, Classes, gtPDFClasses,
  gtCstPDFDoc, gtExProPDFDoc, gtPDFDoc, Graphics, hyieutils, jpeg,
  iemview, ieview, imageenview, imageenio, WPCTRRich, WPCTRMemo,
  System.IOUtils, hyiedefs, imageenproc,  iexBitmaps, iexLayers;

  const
    C_DEFAULT_QUALITY = 50;

  function BmpToJpg(vpBmp: TBitmap; vpQuality: Integer = 100): TJPEGImage;

  function GetPdfToTiff(const vpFile: string): string;

  function GetImageCount(const vpFile: string; const vpFormat: Integer = ioTIFF): Integer;

  procedure GetImageSize(const vpFile: string; out vpWidth, vpHeight: Integer);

  function GetResolutionTiff(const vpFile: string): Integer;

  function GetTiffCompression(const vpFile: string): TIOTIFFCompression;

  function ConvertTextToPDF(vptTexto: TWPRichText; vpArquivoPDF : string): Boolean;

  function ConvertTextToTiff(vptTexto: TWPRichText; vpArquivoTiff : string): Boolean;

  function ConvertTextToJpeg(vptTexto: TWPRichText; vpArquivoJpeg : string; vpPage: Integer = 0;
    vpQuality: Integer = C_DEFAULT_QUALITY): Boolean;

  function ConvertTiffToJpeg(const vpSource, vpDestiny: string; const vpIdx: Integer = 0; const vpQuality: Integer = C_DEFAULT_QUALITY): Boolean;

  function GetTiffToJpeg(const vpSource : string; const vpIdx: Integer = 0; const vpQuality: Integer = C_DEFAULT_QUALITY): TMemoryStream;

  function GetTextToJpeg(const vptTexto: TWPRichText; const vpPage: Integer = 0): TMemoryStream;

  function ConvertTiffToPDF(const vpSource, vpDestiny: string; const vpIdx: Integer = 0): Boolean;

  function SaveTiffFile(const vpSource, vpDestiny: string; const vpImageColor: Boolean = False;
    const vpResample: Boolean = True;
    const vpIdx: Integer = -1): Boolean;

 procedure SetTextoRodapeImage(const vpImageEnView: TImageEnView;
    const vpTexto: string;
    const vpMargemLeft: Integer = 50);

 procedure CreateBorderedImage(const vpImageEnView: TImageEnView;
    const vpLeft: Integer = 50;
    const vpTop: Integer = 50;
    const vpRight: Integer = 50;
    const vpBottom: Integer = 150);

implementation

uses
  System.StrUtils;

function BmpToJpg(vpBmp: TBitmap; vpQuality: Integer = 100): TJPEGImage;
begin
  Result := TJPEGImage.Create;
  Result.CompressionQuality := vpQuality;
  Result.Assign(vpBmp);
end;

function GetPdfToTiff(const vpFile: string): string;
var
  Bmp: TBitmap;
  Jpeg: TJPEGImage;
  viStream: TMemoryStream;
  Output_DPI,
  Desktop_DPI,
  viPaginas,
  i : Integer;
  gtPDFDocument : TgtPDFDocument;
  ImagemView : TImageEnMView;
  viFileDestino: string;
begin
  Result := '';
  Output_DPI    := 150;   // Required DPI of hi-res image
  Desktop_DPI   := 96;   // Current DPI of screen or in PDF viewer

  if not DirectoryExists('C:\Temp') then
    CreateDir('C:\Temp');

  viFileDestino := 'C:\Temp\IT7_' +  TPath.GetRandomFileName + '.tiff';

  gtPDFDocument := TgtPDFDocument.Create(nil);
  ImagemView := TImageEnMView.Create(Nil);

  try
    try
      // Load a PDF document
      gtPDFDocument.LoadFromFile(vpFile);
      viPaginas := gtPDFDocument.PageCount;

      for i := 1 to viPaginas do
      begin
        // Create a bitmap with size equal to that of
        // second page of the document at the required DPI
        Bmp := TBitmap.Create;
        viStream:= TMemoryStream.Create;
        try
          Bmp.PixelFormat := pf24bit;

          Bmp.Width := Round(gtPDFDocument.GetPageSize(i, muPixels).Width *
                                 (Output_DPI/Desktop_DPI));   // Warning
          Bmp.Height := Round(gtPDFDocument.GetPageSize(i, muPixels).Height *
                                  (Output_DPI/Desktop_DPI));  // Warning

          // Render contents of page 2 to bitmap
          gtPDFDocument.RenderToDC(
                            Bmp.Canvas.Handle,  // Handle of the bitmap canvas
                            Bmp.Width,          // Width of page at required DPI
                            Bmp.Height,         // Height of page at required DPI
                                    i,              // Number of the page
                                    Output_DPI,     // Horizontal DPI
                                    Output_DPI,     // Vertical DPI
                                    0,              // Angle of rotation
                                    True,           // Enable anti-aliasing
                                    False);         // Not for printing

          Jpeg := BmpToJpg(Bmp);
          // Save bitmap to file
          Jpeg.SaveToStream(viStream);
          viStream.Position := 0;

          ImagemView.DeSelect;
          ImagemView.MIO.LoadFromStream(viStream, ioJPEG);

        finally
          // Free image
          Bmp.FreeImage;
          FreeAndNil(Bmp);
          FreeAndNil(Jpeg);
          FreeAndNil(viStream);
        end;
      end;

      ImagemView.MIO.Params[0].BitsPerSample := 8;
      ImagemView.MIO.Params[0].SamplesPerPixel := 1;
      ImagemView.MIO.Params[0].Dpi  := 150;
      ImagemView.MIO.Params[0].JPEG_Quality:= C_DEFAULT_QUALITY;
      ImagemView.MIO.Params[0].TIFF_Compression := ioTIFF_LZW;
      ImagemView.MIO.DuplicateCompressionInfo;
      ImagemView.Invalidate;
      ImagemView.MIO.SaveToFileTIFF(viFileDestino, false);

      Result := viFileDestino;

    except on Err:Exception do
      begin
        DeleteFile(viFileDestino);

        raise Exception.CreateFmt(
          'N�o foi poss�vel converter o arquivo devido ao motivo abaixo:%s%s',
          [DupeString(
            sLineBreak,
            2),
          Err.Message]);
      end;
    end;
  finally
    gtPDFDocument.Reset;
    FreeAndNil(gtPDFDocument);
    FreeAndNil(ImagemView);
  end;

end;

function GetImageCount(const vpFile: string; const vpFormat: Integer = ioTIFF): Integer;
var
  Imagem: TImageEnIO;
begin
  Result := 0;

  if FileExists(vpFile) then
  begin
    Imagem := TImageEnIO.Create(nil);
    try
      Imagem.ParamsFromFile(vpFile, vpFormat);
      Result := Imagem.Params.ImageCount;
    finally
      FreeAndNil(Imagem);
    end;
  end;
end;

procedure GetImageSize(const vpFile: string; out vpWidth, vpHeight: Integer);
var
  Imagem: TImageEnIO;
begin
  if FileExists(vpFile) then
  begin
    Imagem := TImageEnIO.Create(nil);
    try
      Imagem.ParamsFromFile(vpFile, FindFileFormat(vpFile));

      vpWidth  := Imagem.Params.Width;
      vpHeight := Imagem.Params.Height;
    finally
      FreeAndNil(Imagem);
    end;
  end;
end;


function GetResolutionTiff(const vpFile: string): integer;
var
  Imagem: TImageEnIO;
begin
  Result := 0;

  if FileExists(vpFile) then
  begin
    Imagem := TImageEnIO.Create(nil);
    try
      Imagem.ParamsFromFile(vpFile, ioTIFF);
      Result := Imagem.Params.Dpi;
    finally
      FreeAndNil(Imagem);
    end;
  end;
end;

function GetTiffCompression(const vpFile: string): TIOTIFFCompression;
var
  Imagem: TImageEnIO;
begin
  Result := ioTIFF_UNKNOWN;

  if FileExists(vpFile) then
  begin
    Imagem := TImageEnIO.Create(nil);
    try
      Imagem.ParamsFromFile(vpFile, ioTIFF);
      Result := Imagem.Params.TIFF_Compression;
    finally
      FreeAndNil(Imagem);
    end;
  end;

end;

function ConvertTextToPDF(vptTexto: TWPRichText; vpArquivoPDF : string): Boolean;
var
  bit: TBitmap;
  i,w, h: Integer;
  ImageEnViewPDF : TImageEnView;
  viStream: TMemoryStream;
begin
  Result := False;

  if FileExists(vpArquivoPDF) then
    TFile.Delete(vpArquivoPDF);

  ImageEnViewPDF := TImageEnView.Create(nil);
  try
    try
      ImageEnViewPDF.io.Params.PDF_PaperSize := IEStrToPaperSize('A4', iepA4);
      ImageEnViewPDF.IO.CreatePDFFile(vpArquivoPDF);

      for i := 0 to vptTexto.PageCount-1 do
      begin
        bit := TBitmap.Create;
        viStream:= TMemoryStream.Create;
        try
          bit.PixelFormat := pf24bit;

          w := MulDiv(vptTexto.Header.PageWidth, 200, 1440);
          bit.Width := w;
          h := MulDiv(vptTexto.Header.PageHeight, 200, 1440);
          bit.Height := h;

          bit.Canvas.Brush.Color := clWhite;
          bit.Canvas.FillRect(Rect(0, 0, bit.Width, bit.Height));
          bit.Canvas.FillRect(Rect(0, 0, w, h));

          vptTexto.PrintPageOnCanvas(bit.Canvas,
          Rect(0, 0, w, h), i, [ppmPaintTransparent, // ppmPrintFrame,
          ppmStretchWidth, ppmStretchHeight, ppmIgnoreSelection, ppmUseEvents, ppmForPDFOutput], 0);

          bit.SaveToStream(viStream);
          viStream.Position := 0;

          ImageEnViewPDF.IO.Params.ImageIndex := 0;
          ImageEnViewPDF.IO.LoadFromStreamBMP(viStream);

          viStream.Clear;

          ImageEnViewPDF.IO.Params.Dpi := 200;
          ImageEnViewPDF.IO.Params.JPEG_Quality := 30;
          ImageEnViewPDF.Update;

          ImageEnViewPDF.IO.Params.PDF_Compression := ioPDF_JPEG;
          ImageEnViewPDF.IO.SaveToPDF;

        finally
          // Free image
          bit.FreeImage;
          FreeAndNil(bit);
          FreeAndNil(viStream);
        end;
      end;

      Result := FileExists(vpArquivoPDF);
    except on Err:Exception do
      begin
        raise Exception.CreateFmt(
          'N�o foi poss�vel converter o texto devido ao motivo abaixo:%s%s',
          [DupeString(
            sLineBreak,
            2),
          Err.Message]);
      end;
    end;
  finally
    ImageEnViewPDF.IO.ClosePDFFile;
    FreeAndNil(ImageEnViewPDF);
  end;

end;

function ConvertTextToTiff(vptTexto: TWPRichText; vpArquivoTiff : string): Boolean;
var
  bit: TBitmap;
  Jpeg: TJPEGImage;
  i,w, h: Integer;
  viArquivo : String;
begin
  Result := False;

  if not DirectoryExists('C:\Temp') then
    CreateDir('C:\Temp');

  viArquivo := 'C:\Temp\IT7_' +  TPath.GetRandomFileName + '.tif';

  if FileExists(vpArquivoTiff) then
    TFile.Delete(vpArquivoTiff);
  try
    try
      for i := 0 to vptTexto.PageCount-1 do
      begin
        DeleteFile(viArquivo);

        bit := TBitmap.Create;
        try
          bit.PixelFormat := pf24bit;

          w := MulDiv(vptTexto.Header.PageWidth, 150, 1440);
          bit.Width := w;
          h := MulDiv(vptTexto.Header.PageHeight, 150, 1440);
          bit.Height := h;

          bit.Canvas.Brush.Color := clWhite;
          bit.Canvas.FillRect(Rect(0, 0, bit.Width, bit.Height));
          bit.Canvas.FillRect(Rect(0, 0, w, h));

          vptTexto.PrintPageOnCanvas(bit.Canvas,
          Rect(0, 0, w, h), i, [ppmPaintTransparent, // ppmPrintFrame,
          ppmStretchWidth, ppmStretchHeight, ppmIgnoreSelection, ppmUseEvents], 0);

          Jpeg := BmpToJpg(bit, C_DEFAULT_QUALITY);
          // Save bitmap to file
          Jpeg.SaveToFile(viArquivo);

        finally
          // Free image
          bit.FreeImage;
          FreeAndNil(bit);
          FreeAndNil(Jpeg);
        end;

        SaveTiffFile(viArquivo, vpArquivoTiff, True);
      end;

      Result := FileExists(vpArquivoTiff);
    except on Err:Exception do
      begin
        raise Exception.CreateFmt(
          'N�o foi poss�vel converter o texto devido ao motivo abaixo:%s%s',
          [DupeString(
            sLineBreak,
            2),
          Err.Message]);
      end;
    end;
  finally
    DeleteFile(viArquivo);
  end;

end;

function ConvertTextToJpeg(vptTexto: TWPRichText; vpArquivoJpeg : string; vpPage: Integer = 0;
  vpQuality: Integer = C_DEFAULT_QUALITY): Boolean;
var bit: TBitmap;
    Jpeg: TJPEGImage;
    w, h: Integer;
begin
  Result := False;

  if FileExists(vpArquivoJpeg) then
    TFile.Delete(vpArquivoJpeg);

  bit := TBitmap.Create;
  bit.PixelFormat := pf24bit;

  try
    try
      w := MulDiv(vptTexto.Header.PageWidth, 150, 1440);
      bit.Width := w;
      h := MulDiv(vptTexto.Header.PageHeight, 150, 1440);
      bit.Height := h;

      bit.Canvas.Brush.Color := clWhite;
      bit.Canvas.FillRect(Rect(0, 0, bit.Width, bit.Height));
      bit.Canvas.FillRect(Rect(0, 0, w, h));

      vptTexto.ReformatAll;
      vptTexto.PrintPageOnCanvas(bit.Canvas,
      Rect(0, 0, w, h), vpPage, [ppmPaintTransparent, // ppmPrintFrame,
      ppmStretchWidth, ppmStretchHeight, ppmIgnoreSelection, ppmUseEvents], 0);

      Jpeg := BmpToJpg(bit, vpQuality);
      // Save bitmap to file
      Jpeg.SaveToFile(vpArquivoJpeg);

      Result := FileExists(vpArquivoJpeg);

    except on Err:Exception do
      begin
        raise Exception.CreateFmt(
          'N�o foi poss�vel converter o texto devido ao motivo abaixo:%s%s',
          [DupeString(
            sLineBreak,
            2),
          Err.Message]);
      end;
    end;
  finally
    bit.FreeImage;
    FreeAndNil(bit);
    FreeAndNil(Jpeg);
  end;
end;

function ConvertTiffToJpeg(const vpSource, vpDestiny: string; const vpIdx: Integer = 0; const vpQuality: Integer = C_DEFAULT_QUALITY): Boolean;
var
  ImageEnView : TImageEnView;
begin
  if FileExists(vpDestiny) then
    TFile.Delete(vpDestiny);

  ImageEnView := TImageEnView.Create(nil);

  try
    ImageEnView.IO.Params.ImageIndex       := vpIdx;
    ImageEnView.IO.LoadFromFileTIFF(vpSource);
    ImageEnView.IO.Params.JPEG_Quality     := vpQuality;
    ImageEnView.IO.SaveToFileJpeg(vpDestiny);

    Result := FileExists(vpDestiny);
  finally
    FreeAndNil(ImageEnView);
  end;
end;

function GetTiffToJpeg(const vpSource: string; const vpIdx: Integer = 0; const vpQuality: Integer = C_DEFAULT_QUALITY): TMemoryStream;
var
  ImageEnView : TImageEnView;
begin
  Result := TMemoryStream.Create;
  ImageEnView := TImageEnView.Create(nil);

  try
    ImageEnView.IO.Params.ImageIndex       := vpIdx;
    ImageEnView.IO.LoadFromFileTIFF(vpSource);

    if ImageEnView.IO.IEBitmap.Width > 1240  then
      ImageEnView.Proc.Resample(1240, -1, rfTriangle);

    ImageEnView.IO.Params.Dpi  := 150;
    ImageEnView.IO.Params.JPEG_Quality     := vpQuality;
    ImageEnView.IO.Params.JPEG_Progressive := True;
    ImageEnView.IO.SaveToStreamJpeg(Result);

  finally
    FreeAndNil(ImageEnView);
  end;
end;

function GetTextToJpeg(const vptTexto: TWPRichText; const vpPage: Integer = 0): TMemoryStream;
var
  ImageEnView : TImageEnView;
  bit: TBitmap;
  w, h: Integer;
begin
  Result := TMemoryStream.Create;

  ImageEnView := TImageEnView.Create(nil);
  bit := TBitmap.Create;
  bit.PixelFormat := pf24bit;
  try
    try
      w := MulDiv(vptTexto.Header.PageWidth, 200, 1440);
      bit.Width := w;
      h := MulDiv(vptTexto.Header.PageHeight, 200, 1440);
      bit.Height := h;

      bit.Canvas.Brush.Color := clWhite;
      bit.Canvas.FillRect(Rect(0, 0, bit.Width, bit.Height));
      bit.Canvas.FillRect(Rect(0, 0, w, h));

      vptTexto.ReformatAll;

      vptTexto.PrintPageOnCanvas(bit.Canvas,
      Rect(0, 0, w, h), vpPage, [ppmPaintTransparent, // ppmPrintFrame,
      ppmStretchWidth, ppmStretchHeight, ppmIgnoreSelection, ppmUseEvents], 0);

      Result.Position := 0;
      bit.SaveToStream(Result);

      Result.Position := 0;
      ImageEnView.IO.Params.ImageIndex := 0;
      ImageEnView.IO.LoadFromStreamBMP(Result);

      Result.Clear;
      Result.Position := 0;

      ImageEnView.IO.Params.Dpi := 200;
      ImageEnView.IO.Params.JPEG_Quality := 100;
      ImageEnView.IO.SaveToStreamJpeg(Result);

//      ImageEnView.IO.SaveToFileJpeg('c:\Temp\TexToJpeg.jpg');

    except on Err:Exception do
      begin
        raise Exception.CreateFmt(
          'N�o foi poss�vel converter o texto devido ao motivo abaixo:%s%s',
          [DupeString(
            sLineBreak,
            2),
          Err.Message]);
      end;
    end;
  finally
    bit.FreeImage;
    FreeAndNil(bit);
    FreeAndNil(ImageEnView);
  end;
end;

function ConvertTiffToPDF(const vpSource, vpDestiny: string; const vpIdx: Integer = 0): Boolean;
var
  ImageEnViewPDF : TImageEnView;
  i,
  viPaginas: Integer;
begin
  Result := False;

  if FileExists(vpDestiny) then
    TFile.Delete(vpDestiny);

  viPaginas := GetImageCount(vpSource);

  ImageEnViewPDF := TImageEnView.Create(nil);

  try
    try
      ImageEnViewPDF.io.Params.PDF_PaperSize := IEStrToPaperSize('A4', iepA4);
      ImageEnViewPDF.IO.CreatePDFFile(vpDestiny);

      for i := vpIdx to viPaginas-1 do
      begin
        //Gerar PDF
        ImageEnViewPDF.IO.Params.ImageIndex := i;
        ImageEnViewPDF.IO.LoadFromFile(vpSource, FindFileFormat(vpSource));

        ImageEnViewPDF.IO.Params.PDF_Compression := ioPDF_JPEG;
        ImageEnViewPDF.IO.SaveToPDF;
      end;

      Result := FileExists(vpDestiny);

    except on Err:Exception do
      begin
        raise Exception.CreateFmt(
          'N�o foi poss�vel converter o arquivo devido ao motivo abaixo:%s%s',
          [DupeString(
            sLineBreak,
            2),
          Err.Message]);
      end;
    end;
  finally
    ImageEnViewPDF.IO.ClosePDFFile;
    FreeAndNil(ImageEnViewPDF);
  end;
end;

function SaveTiffFile(const vpSource, vpDestiny: string; const vpImageColor: Boolean = False;
  const vpResample: Boolean = True;
  const vpIdx: Integer = -1): Boolean;
{$REGION 'Vari�veis'}
var
  i: Integer;
  viCountDestiny,
  viCountSource: Integer;
  viImageViewSource,
  viImageViewDestiny : TImageEnView;
  viDiretorio: string;
{$ENDREGION}

{$REGION 'SetImageFormat'}
  procedure SetImageFormat(const vpImageEnView: TImageEnView);
  begin
    if vpImageColor then
    begin
      vpImageEnView.IO.Params.BitsPerSample   := 8;
      vpImageEnView.IO.Params.SamplesPerPixel := 3;
      vpImageEnView.IO.Params.DpiX  := 150;
      vpImageEnView.IO.Params.DpiY  := 150;
      vpImageEnView.IO.Params.TIFF_Compression := ioTIFF_JPEG;
      vpImageEnView.IO.Params.TIFF_JPEGQuality := 50;
    end
    else
    begin
      vpImageEnView.Proc.ConvertToBWThreshold(160);
      vpImageEnView.IO.Params.TIFF_PhotometInterpret := ioTIFF_BLACKISZERO;
      vpImageEnView.IO.Params.BitsPerSample    := 1;
      vpImageEnView.IO.Params.SamplesPerPixel  := 1;
      vpImageEnView.IO.Params.DpiX  := 150;
      vpImageEnView.IO.Params.DpiY  := 150;
      vpImageEnView.IO.Params.TIFF_Compression := ioTIFF_G4FAX;
    end;
  end;
{$ENDREGION}

{$REGION 'SaveImage'}
  procedure SaveImage(const vpIdx: Integer;
    const vpNovo: Boolean);
  begin
    viImageViewSource.Clear;
    viImageViewSource.IO.Params.ImageIndex := vpIdx;
    viImageViewSource.IO.LoadFromFile(vpSource, FindFileFormat(vpSource));

    viImageViewDestiny.Clear;
    viImageViewDestiny.IEBitmap.Assign(viImageViewSource.IEBitmap);
    viImageViewDestiny.Update;

    if vpResample then
      if viImageViewDestiny.IO.IEBitmap.Width > 1654 then
        viImageViewDestiny.Proc.Resample(1654, -1, rfTriangle);

    SetImageFormat(viImageViewDestiny);

    if vpNovo then
      viImageViewDestiny.IO.SaveToFileTIFF(vpDestiny)
    else
    begin
      viImageViewDestiny.IO.Params.ImageIndex := viCountDestiny + vpIdx;
      viImageViewDestiny.IO.InsertToFileTIFF(vpDestiny);
    end;
  end;
{$ENDREGION}
begin
  //Valida caminho do arquivo de destino
  viDiretorio := ExtractFilePath(vpDestiny);
  if not DirectoryExists(viDiretorio) then
    ForceDirectories(viDiretorio);

  viImageViewSource  := TImageEnView.Create(nil);
  viImageViewDestiny := TImageEnView.Create(nil);

  viCountSource      := GetImageCount(vpSource, FindFileFormat(vpSource));
  viCountDestiny     := GetImageCount(vpDestiny);

  try
    if vpIdx > -1 then
      SaveImage(vpIdx, (viCountDestiny = 0))
    else
      for i := 0 to viCountSource - 1 do
        SaveImage(i, ((viCountDestiny = 0) and (i = 0)));

    Result := FileExists(vpDestiny);
  finally
    FreeAndNil(viImageViewSource);
    FreeAndNil(viImageViewDestiny);
  end;
end;

procedure SetTextoRodapeImage(const vpImageEnView: TImageEnView;
  const vpTexto: string;
  const vpMargemLeft: Integer = 50);
begin
  with vpImageEnView do
  begin
    LayersAdd( vpTexto + #13#10 + #13#10, 12, clBlack, 'Arial', [fsBold] );
    //TIETextLayer( CurrentLayer ).Transparency := 137;
    TIETextLayer( CurrentLayer ).AntiAlias := True;
    TIETextLayer( CurrentLayer ).SizeToText();
    CurrentLayer.Rotate := 0;
    CurrentLayer.PosX   := vpMargemLeft;
    CurrentLayer.PosY   := IELayer_Pos_Bottom;

    LayersMergeAll();
  end;
  vpImageEnView.Update;
end;

procedure CreateBorderedImage(const vpImageEnView: TImageEnView;
  const vpLeft: Integer = 50;
  const vpTop: Integer = 50;
  const vpRight: Integer = 50;
  const vpBottom: Integer = 150);
var
  OrigWidth, origHeight: integer;
begin
  OrigWidth  := vpImageEnView.IEBitmap.Width;
  OrigHeight := vpImageEnView.IEBitmap.Height;

  // set background color
  vpImageEnView.BackGround := clWhite;
  // top
  vpImageEnView.Proc.ImageResize(OrigWidth, OrigHeight + vpTop, iehCenter, ievBottom);
  // bottom
  vpImageEnView.Proc.ImageResize(OrigWidth, OrigHeight + vpTop + vpBottom, iehCenter, ievTop);
  // left
  vpImageEnView.Proc.ImageResize(OrigWidth + vpLeft, OrigHeight + vpTop + vpBottom, iehRight, ievCenter);
  // right
  vpImageEnView.Proc.ImageResize(OrigWidth + vpLeft + vpRight, OrigHeight + vpTop + vpBottom, iehLeft, ievCenter);

  vpImageEnView.Update;
end;

end.
