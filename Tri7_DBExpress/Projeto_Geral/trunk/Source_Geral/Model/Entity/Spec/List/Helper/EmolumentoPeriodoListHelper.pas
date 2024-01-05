unit EmolumentoPeriodoListHelper;

interface

uses
  EmolumentoPeriodoList,
  DateTimeList,
  IntegerList;

type
  TEmolumentoPeriodoListHelper = class helper for TEmolumentoPeriodoList
  private
    function GetEmolumentoPeriodoIDs: TIntegerList;
  public
    function GetDatasIniciais: TDateTimeList;
    function GetMaiorEmolumentoPeriodoID: Integer;
  end;

implementation

uses
  EmolumentoPeriodo,
  System.SysUtils;

{ TEmolumentoPeriodoListHelper }

function TEmolumentoPeriodoListHelper.GetDatasIniciais: TDateTimeList;
{$REGION 'Variáveis'}
var
  viEmolumentoPeriodo: IEmolumentoPeriodo;
{$ENDREGION}
begin
  Result := TDateTimeList.Create;
  Result.Capacity := Count;

  for viEmolumentoPeriodo in Self do
    Result.Add(viEmolumentoPeriodo.DataInicial);
end;

function TEmolumentoPeriodoListHelper.GetEmolumentoPeriodoIDs: TIntegerList;
{$REGION 'Variáveis'}
var
  viEmolumentoPeriodo: IEmolumentoPeriodo;
{$ENDREGION}
begin
  Result := TIntegerList.Create;
  Result.Capacity := Count;

  for viEmolumentoPeriodo in Self do
    Result.Add(viEmolumentoPeriodo.EmolumentoPeriodoID);
end;

function TEmolumentoPeriodoListHelper.GetMaiorEmolumentoPeriodoID: Integer;
{$REGION 'Variáveis'}
var
  viEmolumentoPeriodoIDs: TIntegerList;
{$ENDREGION}
begin
  viEmolumentoPeriodoIDs := GetEmolumentoPeriodoIDs;
  try
    Result := viEmolumentoPeriodoIDs.Max;
  finally
    FreeAndNil(viEmolumentoPeriodoIDs);
  end;
end;

end.
