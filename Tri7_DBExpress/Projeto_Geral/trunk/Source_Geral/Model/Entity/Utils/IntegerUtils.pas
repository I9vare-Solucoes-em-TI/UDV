unit IntegerUtils;

interface

type
  TIntegerUtils = class sealed
  private
    {$REGION 'Constantes'}
    const
      CL_INDEX_NOT_FOUND: Integer = -1;
    {$ENDREGION}
  public
    class function IndexOf(
      const vpValue: Integer;
      const vpValues: TArray<Integer>): Integer; static;

    class function Match(
      const vpValue: Integer;
      const vpValues: TArray<Integer>): Boolean; static;
  end;

implementation

uses
  System.Math,
  System.Types,
  BooleanHelper;

{ TIntegerUtils }

class function TIntegerUtils.IndexOf(const vpValue: Integer;
  const vpValues: TArray<Integer>): Integer;
{$REGION 'Variáveis'}
var
  I: Integer;
{$ENDREGION}
begin
  Result := CL_INDEX_NOT_FOUND;

  for I := Low(vpValues) to High(vpValues) do
  begin
    if (CompareValue(vpValue, vpValues[I]) = EqualsValue).&Not then
      Continue;

    Result := I;
    Break;
  end;
end;

class function TIntegerUtils.Match(
  const vpValue: Integer;
  const vpValues: TArray<Integer>): Boolean;
begin
  Result := CompareValue(IndexOf(vpValue, vpValues),
    CL_INDEX_NOT_FOUND) = GreaterThanValue;
end;

end.
