unit GeradorHashSHA1;

interface

uses
  GeradorHash;

type
  TGeradorHashSHA1 = class(TInterfacedObject, IGeradorHash)
  public
    function GerarHash(
      const vpValue: string): string;

    function VerificarHash(
      const vpValue: string;
      const vpHashEsperado: string): Boolean;
  end;

implementation

uses
  CHILKATCRYPT2Lib_TLB,
  System.SysUtils,
  System.Math,
  System.Types,
  BooleanHelper;

{ TGeradorHashSHA1 }

function TGeradorHashSHA1.GerarHash(
  const vpValue: string): string;
{$REGION 'Constantes'}
const
  CI_UNLOCK_SUCESS: Integer = 1;
  CI_UNLOCK_CODE: string = 'Crypt12345678_1060099AVHNG';
  CI_UNLOCK_FAIL_MESSAGE: string = 'Hash component failed';
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viChilkatCrypt2: TChilkatCrypt2;
{$ENDREGION}
begin
  Result := string.Empty;
  viChilkatCrypt2 := TChilkatCrypt2.Create(nil);

  try
    if (CompareValue(viChilkatCrypt2.UnlockComponent(CI_UNLOCK_CODE),
      CI_UNLOCK_SUCESS) = EqualsValue).&Not then
      raise Exception.Create(CI_UNLOCK_FAIL_MESSAGE);

    viChilkatCrypt2.EncodingMode := 'hex';
    viChilkatCrypt2.Charset := 'utf-8';
    viChilkatCrypt2.HashAlgorithm := 'sha-1';
    Result := viChilkatCrypt2.HashStringENC(vpValue);
  finally
    FreeAndNil(viChilkatCrypt2);
  end;
end;

function TGeradorHashSHA1.VerificarHash(
  const vpValue: string;
  const vpHashEsperado: string): Boolean;
begin
  Result := GerarHash(vpValue).Equals(vpHashEsperado);
end;

end.
