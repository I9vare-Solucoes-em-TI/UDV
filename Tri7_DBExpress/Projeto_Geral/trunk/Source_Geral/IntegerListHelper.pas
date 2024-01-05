unit IntegerListHelper;

interface

uses
  IntegerList,
  System.Classes;

type
  TIntegerListHelper = class helper for TIntegerList
  private
    function ToStringArray: TArray<string>;
  public
    function ToStrings: TStrings;
    function ToString: string; overload;

    function ToString(
      const vpSeparator: string): string; overload;
  end;

implementation

uses
  System.SysUtils;

{ TIntegerListHelper }

function TIntegerListHelper.ToString: string;
{$REGION 'Constantes'}
const
  CI_SEPARATOR: string = ', ';
{$ENDREGION}
begin
  Result := ToString(CI_SEPARATOR);
end;

function TIntegerListHelper.ToString(
  const vpSeparator: string): string;
{$REGION 'Variáveis'}
var
  viStringArray: TArray<string>;
{$ENDREGION}
begin
  viStringArray := ToStringArray;
  try
    Result := string.Join(vpSeparator, viStringArray);
  finally
    Finalize(viStringArray);
  end;
end;

function TIntegerListHelper.ToStringArray: TArray<string>;
{$REGION 'Variáveis'}
var
  viStrings: TStrings;
{$ENDREGION}
begin
  viStrings := ToStrings;
  try
    Result := viStrings.ToStringArray;
  finally
    FreeAndNil(viStrings);
  end;
end;

function TIntegerListHelper.ToStrings: TStrings;
{$REGION 'Variáveis'}
var
  I: Integer;
{$ENDREGION}
begin
  Result := TStringList.Create;
  Result.Capacity := Count;

  for I in Self do
    Result.Add(I.ToString);
end;

end.
