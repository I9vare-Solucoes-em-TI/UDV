unit QrCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Dialogs, ExtCtrls, StdCtrls, DelphiZXIngQRCode;

  function GerarQrCode(vfValor: string): TBitmap;

implementation

function GerarQrCode(vfValor: string): TBitmap;
var
  qr: TDelphiZXingQRCode;
  r: Integer;
  c: Integer;
begin
  Result := TBitmap.create;

  qr := TDelphiZXingQRCode.create;
  try
    qr.Data := vfValor;
    qr.Encoding := TQRCodeEncoding(0);//Auto
    qr.QuietZone := StrToIntDef('4', 4);//Quiet Zone
    // ajuta o tamanho do Result para o tamanho do qrcode
    Result.SetSize(qr.Rows, qr.Columns);

    // copia o qrcode para o Result
    for r := 0 to qr.Rows - 1 do
      for c := 0 to qr.Columns - 1 do
        if qr.IsBlack[r, c] then
          Result.Canvas.Pixels[c, r] := clBlack
        else
          Result.Canvas.Pixels[c, r] := clWhite;
  finally
    qr.Free;
  end;

end;

end.
