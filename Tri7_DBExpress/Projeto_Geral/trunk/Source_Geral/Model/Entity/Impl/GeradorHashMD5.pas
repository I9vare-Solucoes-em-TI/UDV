unit GeradorHashMD5;

interface

uses
  GeradorHash;

type
  TGeradorHashMD5 = class(TInterfacedObject, IGeradorHash)
  public
    function GerarHash(
      const vpValue: string): string;

    function VerificarHash(
      const vpValue: string;
      const vpHashEsperado: string): Boolean;

    class function New: IGeradorHash; static;
  end;

implementation

uses
  IdHashMessageDigest,
  System.SysUtils;

{ TGeradorHashMD5 }

function TGeradorHashMD5.GerarHash(
  const vpValue: string): string;
{$REGION 'Variáveis'}
var
  viIdHashMessageDigest5: TIdHashMessageDigest5;
{$ENDREGION}
begin
  viIdHashMessageDigest5 := TIdHashMessageDigest5.Create;
  try
    Result := viIdHashMessageDigest5.HashStringAsHex(vpValue);
  finally
    FreeAndNil(viIdHashMessageDigest5);
  end;
end;

class function TGeradorHashMD5.New: IGeradorHash;
begin
  Result := TGeradorHashMD5.Create;
end;

function TGeradorHashMD5.VerificarHash(
  const vpValue: string;
  const vpHashEsperado: string): Boolean;
begin
  Result := SameText(GerarHash(vpValue), vpHashEsperado);
end;

end.
