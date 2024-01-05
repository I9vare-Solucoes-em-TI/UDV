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
  hyiedefs,
  UITypes;

procedure ImageConverteTo(vpOrigem, vpDestino: string; vpTamanho : Integer);

implementation

procedure ImageConverteTo(vpOrigem, vpDestino: string; vpTamanho : Integer);
var
  ImagemView: TImageEnView;
  viAltura : Integer;
begin
  ImagemView := TImageEnView.Create(Nil);
  try
    try
      // Load imagem
      ImagemView.IO.LoadFromFile(vpOrigem);
      ImagemView.IO.Params.JPEG_Quality := 90;

      ImagemView.IO.Params.DpiX := 100;
      ImagemView.IO.Params.DpiY := 100;

      if (vpTamanho > 0) then
      begin
        viAltura := Trunc((ImagemView.IO.Params.Height * (1 + (vpTamanho/100))) - ImagemView.IO.Params.Height);

        ImagemView.Proc.Resample(
          -1,//Auto Ajuste
          viAltura,
          rfLanczos3,
          True);
      end;

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
