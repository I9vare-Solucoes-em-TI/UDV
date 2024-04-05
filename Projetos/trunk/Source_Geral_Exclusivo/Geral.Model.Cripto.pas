unit Geral.Model.Cripto;

interface

uses
  ECripto;

type
  TCriptoBusiness = class
  private
    class function BuscarCripto(
      const vpKey: string): TEvCriptografa;
  public
    class function Descriptografar(
      const vpValor: string): string;

    class function DescriptografarAntigo(
      const vpValor: string): string;

    class function Criptografar(
      const vpValor: string): string;

    class function CriptografarAntigo(
      const vpValor: string): string;
  end;

implementation

uses
  System.SysUtils;

{ TCriptoBusiness }

class function TCriptoBusiness.BuscarCripto(
  const vpKey: string): TEvCriptografa;
begin
  Result := nil;
  try
    Result := TEvCriptografa.Create(nil);
    Result.Key := vpKey;
  except
    FreeAndNil(Result);
    raise;
  end;
end;


class function TCriptoBusiness.Criptografar(
  const vpValor: string): string;
const
  CI_KEY: string = '8&@Ay&w9s5c$';

var
  viCripto: TEvCriptografa;
begin
  Result := string.Empty;
  viCripto := nil;

  try
    viCripto := BuscarCripto(CI_KEY);
    Result := viCripto.TextToCriptoHex(vpValor);
  finally
    FreeAndNil(viCripto);
  end;
end;

class function TCriptoBusiness.CriptografarAntigo(
  const vpValor: string): string;
const
  CI_KEY: string = 'Grupo@I9vare@Tri7';

var
  viCripto: TEvCriptografa;
begin
  Result := string.Empty;
  viCripto := nil;

  try
    viCripto := BuscarCripto(CI_KEY);
    Result := viCripto.TextToCriptoHex(vpValor);
  finally
    FreeAndNil(viCripto);
  end;
end;

class function TCriptoBusiness.Descriptografar(
  const vpValor: string): string;
const
  CI_KEY: string = '8&@Ay&w9s5c$';

var
  viCripto: TEvCriptografa;
begin
  Result := string.Empty;
  viCripto := nil;

  try
    viCripto := BuscarCripto(CI_KEY);
    Result := viCripto.CriptoHexToText(vpValor);
  finally
    FreeAndNil(viCripto);
  end;
end;

class function TCriptoBusiness.DescriptografarAntigo(
  const vpValor: string): string;
const
  CI_KEY: string = 'Grupo@I9vare@Tri7';

var
  viCripto: TEvCriptografa;
begin
  Result := string.Empty;
  viCripto := nil;

  try
    viCripto := BuscarCripto(CI_KEY);
    Result := viCripto.CriptoHexToText(vpValor);
  finally
    FreeAndNil(viCripto);
  end;
end;

end.
