unit EmolumentoPeriodoList;

interface

uses
  System.Generics.Collections,
  EmolumentoPeriodo;

type
  TEmolumentoPeriodoList = class(TList<IEmolumentoPeriodo>)
  private
    {$REGION 'Constantes'}
    const
      CL_INDEX_NOT_FOUND: Integer = -1;
    {$ENDREGION}

    function LastIndexOfByDataMaiorIgualDataInicial(
      const vpValue: TDateTime): Integer;

    function IndexOfByDataInicial(
      const vpValue: TDateTime): Integer;
  public
    function GetLastByDataMaiorIgualDataInicial(
      const vpValue: TDateTime): IEmolumentoPeriodo;

    function GetByDataInicial(
      const vpValue: TDateTime): IEmolumentoPeriodo;

    function ContainsByDataInicial(
      const vpValue: TDateTime): Boolean;
  end;

implementation

uses
  System.Math,
  System.Types,
  System.DateUtils;

{ TEmolumentoPeriodoList }

function TEmolumentoPeriodoList.ContainsByDataInicial(
  const vpValue: TDateTime): Boolean;
begin
  Result := Assigned(GetByDataInicial(vpValue));
end;

function TEmolumentoPeriodoList.GetByDataInicial(
  const vpValue: TDateTime): IEmolumentoPeriodo;
{$REGION 'Variáveis'}
var
  I: Integer;
{$ENDREGION}
begin
  Result := nil;

  I := IndexOfByDataInicial(vpValue);
  if CompareValue(I, CL_INDEX_NOT_FOUND) = GreaterThanValue then
    Result := Self[I];
end;

function TEmolumentoPeriodoList.GetLastByDataMaiorIgualDataInicial(
  const vpValue: TDateTime): IEmolumentoPeriodo;
{$REGION 'Variáveis'}
var
  I: Integer;
{$ENDREGION}
begin
  Result := nil;

  I := LastIndexOfByDataMaiorIgualDataInicial(vpValue);
  if CompareValue(I, CL_INDEX_NOT_FOUND) = GreaterThanValue then
    Result := Self[I];
end;

function TEmolumentoPeriodoList.IndexOfByDataInicial(
  const vpValue: TDateTime): Integer;
{$REGION 'Variáveis'}
var
  I: Integer;
  viEmolumentoPeriodo: IEmolumentoPeriodo;
{$ENDREGION}
begin
  Result := CL_INDEX_NOT_FOUND;

  for I := ZeroValue to Pred(Count) do
  begin
    viEmolumentoPeriodo := Self[I];
    if CompareDate(viEmolumentoPeriodo.DataInicial, vpValue) = EqualsValue then
    begin
      Result := I;
      Break;
    end;
  end;
end;

function TEmolumentoPeriodoList.LastIndexOfByDataMaiorIgualDataInicial(
  const vpValue: TDateTime): Integer;
{$REGION 'Variáveis'}
var
  I: Integer;
  viEmolumentoPeriodo: IEmolumentoPeriodo;
{$ENDREGION}
begin
  Result := CL_INDEX_NOT_FOUND;

  for I := ZeroValue to Pred(Count) do
  begin
    viEmolumentoPeriodo := Self[I];

    if CompareValue(vpValue, viEmolumentoPeriodo.DataInicial) in
      [EqualsValue, GreaterThanValue] then
      Result := I;
  end;
end;

end.
