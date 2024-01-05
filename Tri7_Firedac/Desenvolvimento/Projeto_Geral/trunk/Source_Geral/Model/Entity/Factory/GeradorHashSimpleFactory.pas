unit GeradorHashSimpleFactory;

interface

uses
  GeradorHash,
  TipoHash;

type
  TGeradorHashSimpleFactory = class sealed
  public
    class function Get(
      const vpTipoHash: TTipoHash): IGeradorHash; static;
  end;

implementation

uses
  TipoHashHelper,
  GeradorHashSHA1;

{ TGeradorHashSimpleFactory }

class function TGeradorHashSimpleFactory.Get(
  const vpTipoHash: TTipoHash): IGeradorHash;
begin
  Result := nil;

  if vpTipoHash.IsSHA1 then
    Result := TGeradorHashSHA1.Create;
end;

end.
