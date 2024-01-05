unit IntegerList;

interface

uses
  System.Generics.Collections;

type
  TIntegerList = class(TList<Integer>)
  private
    function GetMax: Integer;
    function GetSum: Integer;
  public
    property Max: Integer read GetMax;
    property Sum: Integer read GetSum;
  end;

implementation

uses
  System.Math,
  System.Types;

{ TIntegerList }

function TIntegerList.GetMax: Integer;
{$REGION 'Variáveis'}
var
  I: Integer;
{$ENDREGION}
begin
  Result := ZeroValue;

  for I in Self do
    if CompareValue(I, Result) = GreaterThanValue then
      Result := I;
end;

function TIntegerList.GetSum: Integer;
{$REGION 'Variáveis'}
var
  I: Integer;
{$ENDREGION}
begin
  Result := ZeroValue;

  for I in Self do
    Result := Result + I;
end;

end.
