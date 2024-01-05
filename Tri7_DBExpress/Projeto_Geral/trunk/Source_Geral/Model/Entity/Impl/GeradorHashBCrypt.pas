unit GeradorHashBCrypt;

interface

uses
  GeradorHash;

type
  TGeradorHashBCrypt = class(TInterfacedObject, IGeradorHash)
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
  Bcrypt;

{ TGeradorHashBCrypt }

function TGeradorHashBCrypt.GerarHash(
  const vpValue: string): string;
begin
  Result := TBCrypt.HashPassword(vpValue);
end;

class function TGeradorHashBCrypt.New: IGeradorHash;
begin
  Result := TGeradorHashBCrypt.Create;
end;

function TGeradorHashBCrypt.VerificarHash(const vpValue,
  vpHashEsperado: string): Boolean;
{$REGION 'Variáveis'}
var
  viPrecisaGerarNovoHash: Boolean;
{$ENDREGION}
begin
  Result := TBCrypt.CheckPassword(vpValue, vpHashEsperado,
    viPrecisaGerarNovoHash);
end;

end.
