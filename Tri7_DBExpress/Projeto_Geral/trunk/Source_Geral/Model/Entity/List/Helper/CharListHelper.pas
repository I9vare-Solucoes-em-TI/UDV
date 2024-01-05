unit CharListHelper;

interface

uses
  CharList,
  System.Classes;

type
  TCharListHelper = class helper for TCharList
  private
    function ToStrings(
      const vpQuoted: Boolean): TStrings;

    function ToStringArray(
      const vpQuoted: Boolean): TArray<string>;
  public
    function ToString(
      const vpSeparator: string;
      const vpQuoted: Boolean): string;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils;

{ TCharListHelper }

function TCharListHelper.ToString(
  const vpSeparator: string;
  const vpQuoted: Boolean): string;
{$REGION 'Variáveis'}
var
  viStringArray: TArray<string>;
{$ENDREGION}
begin
  viStringArray := ToStringArray(vpQuoted);
  try
    Result := string.Join(vpSeparator, viStringArray);
  finally
    Finalize(viStringArray);
  end;
end;

function TCharListHelper.ToStringArray(
  const vpQuoted: Boolean): TArray<string>;
{$REGION 'Variáveis'}
var
  viStrings: TStrings;
{$ENDREGION}
begin
  viStrings := ToStrings(vpQuoted);
  try
    Result := viStrings.ToStringArray;
  finally
    FreeAndNil(viStrings);
  end;
end;

function TCharListHelper.ToStrings(
  const vpQuoted: Boolean): TStrings;
{$REGION 'Variáveis'}
var
  viValue: Char;
{$ENDREGION}
begin
  Result := TStringList.Create;
  Result.Capacity := Count;

  for viValue in Self do
    Result.Add(IfThen(vpQuoted, string(viValue).QuotedString, viValue));
end;

end.
