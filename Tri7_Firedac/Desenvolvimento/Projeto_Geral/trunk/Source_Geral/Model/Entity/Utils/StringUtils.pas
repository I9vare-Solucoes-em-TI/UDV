unit StringUtils;

interface

type
  TStringUtils = class sealed
  public
    class function RemoverCaracteresRepetidos(
      const vpString: string;
      const vpChar: Char): string; static;

    class function RemoverEspacosRepetidos(
      const vpString: string): string; static;

    class function GetQuebraLinhaDupla: string; static;
  end;

implementation

uses
  System.SysUtils,
  System.Math,
  System.Character,
  BooleanHelper,
  System.Types,
  System.StrUtils;

{ TStringUtils }

class function TStringUtils.GetQuebraLinhaDupla: string;
{$REGION 'Constantes'}
const
  CI_COUNT: Integer = 2;
{$ENDREGION}
begin
  Result := DupeString(sLineBreak, CI_COUNT);
end;

class function TStringUtils.RemoverCaracteresRepetidos(
  const vpString: string;
  const vpChar: Char): string;
{$REGION 'Variáveis'}
var
  I: integer;
  viChar: Char;
  viCharAnterior: Char;
{$ENDREGION}
begin
  Result := string.Empty;

  for I := ZeroValue to Pred(vpString.Length) do
  begin
    viChar := vpString.Chars[I];
    if viChar.IsInArray([vpChar]) then
    begin
      viCharAnterior := vpString.Chars[Pred(I)];
      if viCharAnterior.IsInArray([vpChar]).&Not then
        Result := Result + vpChar;
    end
    else
      Result := Result + viChar;
  end;
end;

class function TStringUtils.RemoverEspacosRepetidos(
  const vpString: string): string;
begin
  Result := RemoverCaracteresRepetidos(vpString, Space);
end;

end.
