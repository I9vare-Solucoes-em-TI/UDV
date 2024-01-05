unit PdfToTiff;

interface

uses
  Windows, Forms, Messages, SysUtils, Variants, Classes, gtPDFClasses, gtCstPDFDoc,
  gtExPDFDoc, gtExProPDFDoc, gtPDFDoc, iemview, imageenview, imageenio, imageenproc,
  Graphics, Dialogs, hyiedefs, dxBarExtItems;

function ConverterPdfToTiff(vpOrigem, vpDestino: string; vpProgressBar: TdxBarProgressItem) : Integer;
procedure ConverterToTiff(vpOrigem, vpDestino: string; vpProgressBar: TdxBarProgressItem);
procedure ParticionarPDF(vpArquivo: String; vpTamanhoPDF : Integer);

implementation

function ConverterPdfToTiff(vpOrigem, vpDestino: string; vpProgressBar: TdxBarProgressItem) : Integer;
var
  Bmp: TBitmap;
  Output_DPI,
  Desktop_DPI,
  viPaginas,
  i : Integer;
  viArquivoTemp : string;
  gtPDFDocument : TgtPDFDocument;
  ImagemView : TImageEnMView;
begin
  Output_DPI    := 200;   // Required DPI of hi-res image
  Desktop_DPI   := 96;   // Current DPI of screen or in PDF viewer
  viArquivoTemp := 'c:\Temp\PagePdfTemp.bmp';
  DeleteFile(vpDestino);

  gtPDFDocument := TgtPDFDocument.Create(nil);
  ImagemView := TImageEnMView.Create(Nil);

  try
    // Load a PDF document
    gtPDFDocument.LoadFromFile(vpOrigem);
    viPaginas := gtPDFDocument.PageCount;

    vpProgressBar.Position := 0;
    vpProgressBar.Max      := viPaginas;

    Result    := viPaginas;

    for i := 1 to viPaginas do
    begin
      DeleteFile(viArquivoTemp);

      vpProgressBar.Position := i;
      Application.ProcessMessages;

      // Create a bitmap with size equal to that of
      // second page of the document at the required DPI
      Bmp := TBitmap.Create;
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

      Bmp.PixelFormat := pf4bit;
      // Save bitmap to file
      Bmp.SaveToFile(viArquivoTemp);
      // Free image
      Bmp.FreeImage;
      FreeAndNil(Bmp);

      if FileExists(viArquivoTemp) then
      begin
        //Salva JPeg
        ImagemView.DeSelect;
        ImagemView.MIO.LoadFromFile(viArquivoTemp);
      end;
    end;

    ImagemView.Proc.ConvertTo ( 256 );
    ImagemView.MIO.Params[0].TIFF_Compression := ioTIFF_LZW;
    ImagemView.MIO.Params[0].BitsPerSample := 8;
    ImagemView.MIO.Params[0].SamplesPerPixel := 1;
    ImagemView.MIO.Params[0].DpiX := 200;
    ImagemView.MIO.Params[0].DpiY := 200;
    ImagemView.MIO.DuplicateCompressionInfo;
    ImagemView.Invalidate;
    ImagemView.MIO.SaveToFileTIFF(vpDestino, false);
    
    vpProgressBar.Position := 0;
  except on Err:Exception do
    begin
      Messagedlg('Erro ao converter pdf!', mtInformation, [mbOK], 0);
    end;
  end;

  FreeAndNil(gtPDFDocument);
  FreeAndNil(ImagemView);
end;

procedure ConverterToTiff(vpOrigem, vpDestino: string; vpProgressBar: TdxBarProgressItem);
var
  viArquivoTemp : string;
  ImagemView : TImageEnMView;
begin
  ImagemView := TImageEnMView.Create(Nil);
  vpProgressBar.Position := 0;

  try
    // Load imagem
    ImagemView.MIO.LoadFromFile(vpOrigem);
    ImagemView.Proc.ConvertTo (256);
    ImagemView.MIO.Params[0].TIFF_Compression := ioTIFF_LZW;
    ImagemView.MIO.Params[0].BitsPerSample := 8;
    ImagemView.MIO.Params[0].SamplesPerPixel := 1;
    ImagemView.MIO.Params[0].DpiX := 200;
    ImagemView.MIO.Params[0].DpiY := 200;
    ImagemView.MIO.DuplicateCompressionInfo;
    ImagemView.Invalidate;
    ImagemView.MIO.SaveToFileTIFF(vpDestino, false);
  except on Err:Exception do
    begin
      Messagedlg('Erro ao converter para TIF!', mtInformation, [mbOK], 0);
    end;
  end;

  FreeAndNil(ImagemView);
end;

procedure ParticionarPDF(vpArquivo: String; vpTamanhoPDF : Integer);
Const
  PaperWidth: array[0..11] of integer = (2380, 1684, 1190, 842, 595, 421, 297, 501, 612, 612, 1224, 792);
  PaperHeight: array[0..11] of integer = (3368, 2380, 1684, 1190, 842, 595, 421, 709, 792, 1008, 792, 1224);
  PDFCompression: array[0..3] of TIOPDFCompression = (ioPDF_RLE, ioPDF_G3FAX2D, ioPDF_G4FAX, ioPDF_JPEG);

var
  ImageEnViewPDF : TImageEnView;
  i,
  viIdx,
  viSize,
  viPaginas :Integer;
  str : TMemoryStream;
  viArquivo,
  viArquivoTiff : String;
begin
  viArquivoTiff := 'c:\Temp\PdfTemp.tif';

  DeleteFile(viArquivoTiff);
  //viPaginas := ConverterPdfToTiff(vpArquivo, viArquivoTiff, );

  viArquivo := Copy(vpArquivo, 1, Pos('.PDF', AnsiUpperCase(vpArquivo)) - 1) + '_';

  str := TMemoryStream.Create;
  viSize := 0;
  viIdx := 1;

  //Adobe PDF Particionado
  ImageEnViewPDF := TImageEnView.Create(nil);
  ImageEnViewPDF.IO.CreatePDFFile(viArquivo + FormatFloat('000', viIdx) + '.pdf');

  for i := 0 to viPaginas - 1 do
  begin
    str.Clear;
    str.Position := 0;

    ImageEnViewPDF.IO.Params.ImageIndex := i;
    ImageEnViewPDF.IO.LoadFromFile(viArquivoTiff);
    ImageEnViewPDF.IO.Params.PDF_Compression := PDFCompression[3];

    ImageEnViewPDF.IO.SaveToStreamJpeg(str);
    viSize := viSize + str.Size;

    if viSize > vpTamanhoPDF then
    begin
      Inc(viIdx);
      ImageEnViewPDF.IO.ClosePDFFile;
      ImageEnViewPDF.IO.CreatePDFFile(viArquivo + FormatFloat('000', viIdx) + '.pdf');
      viSize := 0;
    end;

    ImageEnViewPDF.IO.SaveToPDF;
  end;

  if viSize > 0 then
    ImageEnViewPDF.IO.ClosePDFFile;

  FreeAndNil(ImageEnViewPDF);
  FreeAndNil(str);
  DeleteFile(viArquivoTiff);
end;

end.
