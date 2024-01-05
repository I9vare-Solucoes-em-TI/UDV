unit Compress;

interface

type
  TCompress = class
  private
    class function CompressStringOld(Source: AnsiString): AnsiString;
    class function DeCompressStringOld(Source: AnsiString): AnsiString;
  public
    class function CompressString(const Str: AnsiString):AnsiString;
    class function DeCompressString(const Str: AnsiString):AnsiString;
  end;

implementation

uses
  System.Classes,
  System.SysUtils,
  ZLibEx,
  Soap.EncdDecd;

{ TCompress }

class function TCompress.CompressString(const Str: AnsiString): AnsiString;
var
  Utf8Stream: TStringStream;
  Compressed: TMemoryStream;
  Base64Stream: TStringStream;
begin
  Utf8Stream := TStringStream.Create(Str, TEncoding.UTF8);
  try
    Compressed := TMemoryStream.Create;
    try
      ZCompressStream(Utf8Stream, Compressed);
      Compressed.Position := 0;
      Base64Stream := TStringStream.Create('', TEncoding.ASCII);
      try
        EncodeStream(Compressed, Base64Stream);
        Result := Base64Stream.DataString;
      finally
        Base64Stream.Free;
      end;
    finally
      Compressed.Free;
    end;
  finally
    Utf8Stream.Free;
  end;
end;

class function TCompress.CompressStringOld(Source: AnsiString): AnsiString;
var
  ms :TMemoryStream;
  CompStream: TZCompressionStream;
begin
  Result := '';
  if (Source <> '') then
  begin
    Source := UTF8Encode(Source);

    ms := tMemoryStream.Create;
    CompStream := TZCompressionStream.Create (ms);
    CompStream.Write (BytesOf(Source), 2*Length(BytesOf(Source)));
    CompStream.Free;
    ms.position := 0;
    SetLength(Result,Ms.size );
    SetString(Result, PAnsiChar(Ms.Memory), Ms.Size div SizeOf(Result[1]) - 1);
    ms.Free;

    CompStream := nil;
    ms := nil;
  end
  else
    Result := Source;
end;

class function TCompress.DeCompressString(const Str: AnsiString): AnsiString;
var
  Utf8Stream: TStringStream;
  Compressed: TMemoryStream;
  Base64Stream: TStringStream;
begin
  try
    if (Str <> '') and (Pos('{\rtf',string(Str)) = 0) and (Pos('<?xml',string(Str)) = 0) and (Str <> #0) then
    begin
      Base64Stream := TStringStream.Create(Str, TEncoding.ASCII);
      try
        Compressed := TMemoryStream.Create;
        try
          DecodeStream(Base64Stream, Compressed);
          Compressed.Position := 0;
          Utf8Stream := TStringStream.Create('', TEncoding.UTF8);
          try
            ZDecompressStream(Compressed, Utf8Stream);
            Result := Utf8Stream.DataString;
          finally
            Utf8Stream.Free;
          end;
        finally
          Compressed.Free;
        end;
      finally
        Base64Stream.Free;
      end;
    end
    else
      Result := DeCompressStringOld(Str);
  except
    Result := DeCompressStringOld(Str);
  end;
end;

class function TCompress.DeCompressStringOld(Source: AnsiString): AnsiString;
var
  ms: tMemoryStream;
  Decomp: TZDecompressionStream;
  C: AnsiChar;
Begin
  Result := '';
  try
    if (Source <> '') and (Pos('{\rtf',string(Source)) = 0) and (Pos('<?xml',string(Source)) = 0) and (Source <> #0) then
    begin
      ms     := tMemoryStream.Create;
      ms.Write ( Source[1],Length(Source));
      ms.position := 0;
      try
        DeComp := TZDecompressionStream.Create (ms);
        while deComp.Read ( c ,1 ) <> 0 DO
        begin
          Result := Result + c;
        end;
      except
        Result := Source;
      end;
      decomp.free;
      ms.free;

      Decomp := nil;
      ms := nil;
    end
    else Result := Source;
  except
    Result := Source;
    decomp.free;
    ms.free;
  end;
end;

end.
