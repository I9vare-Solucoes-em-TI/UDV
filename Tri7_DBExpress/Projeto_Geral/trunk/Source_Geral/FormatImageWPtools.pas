unit FormatImageWPtools;

interface

uses
  Windows,
  Forms,
  Messages,
  SysUtils,
  Variants,
  Classes,
  iemview,
  imageenview,
  imageenio,
  imageenproc,
  Graphics,
  Dialogs,
  hyiedefs;

procedure ImageConverteTo(vpOrigem, vpDestino: string);

implementation

procedure ImageConverteTo(vpOrigem, vpDestino: string);
var
  viArquivoTemp: string;
  ImagemView: TImageEnView;
begin
  ImagemView := TImageEnView.Create(Nil);
  try
    try
      // Load imagem
      ImagemView.IO.LoadFromFile(vpOrigem);
      ImagemView.Proc.ConvertTo(256);
      ImagemView.IO.Params.JPEG_Quality := 80;
      ImagemView.IO.Params.BitsPerSample := 8;
      ImagemView.IO.Params.SamplesPerPixel := 1;
      ImagemView.IO.Params.DpiX := 96;
      ImagemView.IO.Params.DpiY := 96;

      if ImagemView.IO.Params.Width > 640 then
        ImagemView.Proc.Resample(
          640,
          480);

      //ImagemView.IO.DuplicateCompressionInfo;
      ImagemView.Invalidate;
      ImagemView.IO.SaveToFileJpeg(vpDestino);
    except
      on Err: Exception do
      begin
        Messagedlg('Erro ao converter a imagem!', mtInformation, [mbOK], 0);
      end;
    end;
  finally
    ImagemView.Free;
  end;
end;

end.
