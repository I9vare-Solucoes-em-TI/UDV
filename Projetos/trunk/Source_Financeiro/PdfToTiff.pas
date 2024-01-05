unit PdfToTiff;

interface

uses
  Windows, Forms, Messages, SysUtils, Variants, Classes, gtPDFClasses,
  gtCstPDFDoc, gtExPDFDoc, gtExProPDFDoc, gtPDFDoc, Graphics, jpeg;

function ConverterPdfToTiff(vpOrigem: string): string;

implementation

uses
  System.StrUtils;

function ConverterPdfToTiff(vpOrigem: string): string;
var
  gtPDFDocument: TgtPDFDocument;
  viPaginas: Integer;
  viPropriedades: TgtImageProperties;
  const viFileDestino = 'C:\Temp\PDFConverted_1.tiff';
begin
  Result := '';

  if not DirectoryExists('C:\Temp') then
    ForceDirectories('C:\Temp');

  DeleteFile(viFileDestino);

  gtPDFDocument := TgtPDFDocument.Create(nil);

  viPropriedades := TgtImageProperties.Create;
  viPropriedades.BMPMonochrome   := False;
  viPropriedades.BMPpixelformat  := pf8bit;
  viPropriedades.JPEGCompressionQuality := 80;
  viPropriedades.JPEGScale := TJPEGScale.jsFullSize;
  viPropriedades.JPEGpixelformat := TJPEGPixelFormat.jf8Bit;
  viPropriedades.xDPI      := 150;
  viPropriedades.yDPI      := 150;

  try
    try
      // Load a PDF document
      gtPDFDocument.LoadFromFile(vpOrigem);
      viPaginas := gtPDFDocument.PageCount;

      gtPDFDocument.SaveAsImage(
        '1-' + viPaginas.ToString,
        TgtImageType.itMultiPageTIFF,
        'C:\Temp',
        'PDFConverted',
        viPropriedades);

       Result := viFileDestino;
    except
      on Err: Exception do
        raise Exception.CreateFmt(
          'Não foi possível converter o PDF devido ao motivo abaixo:%s%s',
          [DupeString(
            sLineBreak,
            2),
          Err.Message]);
    end;
  finally
    gtPDFDocument.Reset;
    FreeAndNil(gtPDFDocument);
    viPropriedades.Free;
  end;
end;

end.
