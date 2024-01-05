unit CurrencyList;

interface

uses
  System.Generics.Collections;

type
  TCurrencyList = class(TList<Currency>)
  private
    function GetSum: Currency;
    function GetMax: Currency;
  public
    property Sum: Currency read GetSum;
    property Max: Currency read GetMax;

    class function New(
      const vpValue: Currency;
      const vpCount: Integer): TCurrencyList; static;
  end;

implementation

uses
  System.Math,
  System.Types;

{ TCurrencyList }

function TCurrencyList.GetMax: Currency;
{$REGION 'Variáveis'}
var
  viValue: Currency;
{$ENDREGION}
begin
  Result := ZeroValue;

  if CompareValue(
    Count,
    ZeroValue) = EqualsValue then
    Exit;

  Result := First;

  for viValue in Self do
    if viValue > Result then
      Result := viValue;
end;

function TCurrencyList.GetSum: Currency;
{$REGION 'Variáveis'}
var
  viValue: Currency;
{$ENDREGION}
begin
  Result := ZeroValue;

  for viValue in Self do
    Result := Result + viValue;
end;

class function TCurrencyList.New(
  const vpValue: Currency;
  const vpCount: Integer): TCurrencyList;
{$REGION 'Variáveis'}
var
  I: Integer;
{$ENDREGION}
begin
  Result := TCurrencyList.Create;
  Result.Capacity := vpCount;

  for I := ZeroValue to Pred(vpCount) do
    Result.Add(vpValue);
end;

end.
