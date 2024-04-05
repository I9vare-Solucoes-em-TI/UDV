{* @hash       2b3a4f080d4b5e2a8e9e0d19eed146145d119703095919aaedf5e5e6a83c
 * @version    1.0.0.0
 * @unit       Geral.Model.Entity.Impl.Blob.pas
 * @author     I9vare
 * @copyright  Copyright (c) 2013 I9vare Gestão e Soluções em TI. (https://www.i9vare.com)
 *}

unit Geral.Model.Entity.Impl.Blob;

interface

uses
  Geral.Model.Entity.Spec.Blob,
  System.SysUtils;

type
  TBlob = class(TInterfacedObject, IBlob)
  private
    FValue: TArray<Byte>;
  public
    constructor Create(
      const vpValue: TArray<Byte>); reintroduce;

    function Value: TArray<Byte>;
    function AsBytes: TBytes;
    function AsString: string; overload;

    function AsString(
      const vpEncoding: TEncoding): string; overload;

    class function New(
      const vpValue: TArray<Byte>): IBlob;
  end;

implementation

{ TBlob }

function TBlob.AsBytes: TBytes;
begin
  Result := TBytes(
    FValue);
end;

function TBlob.AsString: string;
begin
  Result := AsString(
    TEncoding.Default);
end;

function TBlob.AsString(
  const vpEncoding: TEncoding): string;
begin
  Result := vpEncoding.GetString(
    AsBytes);
end;

constructor TBlob.Create(
  const vpValue: TArray<Byte>);
begin
  inherited Create;
  FValue := vpValue;
end;

class function TBlob.New(
  const vpValue: TArray<Byte>): IBlob;
begin
  Result := Create(
    vpValue);
end;

function TBlob.Value: TArray<Byte>;
begin
  Result := FValue;
end;

end.
