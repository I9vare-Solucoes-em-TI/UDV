unit DateTimeList;

interface

uses
  System.Generics.Collections;

type
  TDateTimeList = class(TList<TDateTime>)
  private
    function GetCountByYear(
      const vpValue: Word): Integer; overload;

    function GetMax: TDateTime;
  public
    function GetCountByYear(
      const vpValue: TDateTime): Integer; overload;

    property Max: TDateTime read GetMax;
  end;

implementation

uses
  System.DateUtils;

{ TDateTimeList }

function TDateTimeList.GetCountByYear(
  const vpValue: Word): Integer;
{$REGION 'Variáveis'}
var
  viDateTime: TDateTime;
{$ENDREGION}
begin
  Result := 0;

  for viDateTime in Self do
    if YearOf(viDateTime) = vpValue then
      Inc(Result);
end;

function TDateTimeList.GetCountByYear(
  const vpValue: TDateTime): Integer;
begin
  Result := GetCountByYear(YearOf(vpValue));
end;

function TDateTimeList.GetMax: TDateTime;
{$REGION 'Variáveis'}
var
  viDateTime: TDateTime;
{$ENDREGION}
begin
  Result := 0;

  for viDateTime in Self do
    if viDateTime > Result then
      Result := viDateTime;
end;

end.
