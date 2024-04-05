unit Geral.Model.Util.Stream;

interface

uses
  System.Classes;

type
  TStreamUtil = class
  public
    class function BuscarBytes(
      const vpStream: TStream): TArray<Byte>;

    class function ByteArrayToStream(
      const vpByteArray: array of Byte): TStream;

    class procedure ResizeStreamJpeg(
      const vpStream: TStream;
      const vpWidth: integer;
      const vpHeight: integer);
  end;

implementation
uses
  imageenview,
  hyiedefs,
  System.SysUtils;

{ TStreamUtil }

class function TStreamUtil.BuscarBytes(
  const vpStream: TStream): TArray<Byte>;
var
  viPosition: Integer;
begin
  viPosition := vpStream.Position;
  try
    vpStream.Position := 0;

    SetLength(
      Result,
      vpStream.Size);

    vpStream.Read(
      Result[0],
      vpStream.Size);
  finally
    vpStream.Position := viPosition;
  end;
end;

class function TStreamUtil.ByteArrayToStream(
  const vpByteArray: array of Byte): TStream;
begin
  if Length(vpByteArray) > 0 then
  begin
    Result := TMemoryStream.Create;
    Result.Position := 0;
    Result.Write(vpByteArray[0], Length(vpByteArray));
  end;
end;

class procedure TStreamUtil.ResizeStreamJpeg(
  const vpStream: TStream;
  const vpWidth: integer;
  const vpHeight: integer);
var
  ImageEnView : TImageEnView;
begin
  if not Assigned(vpStream) then
    Exit;

  ImageEnView := TImageEnView.Create(nil);
  try
    vpStream.Position := 0;
    ImageEnView.IO.Params.ImageIndex := 0;
    ImageEnView.IO.LoadFromStreamJpeg(vpStream);

    ImageEnView.Proc.Resample(vpWidth, vpHeight, rfTriangle);

    vpStream.Position := 0;
    ImageEnView.IO.SaveToStreamJpeg(vpStream);
  finally
    FreeAndNil(ImageEnView);
  end;
end;

end.
