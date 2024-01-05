unit EmolumentoListHelper;

interface

uses
  EmolumentoList,
  IntegerList;

type
  TEmolumentoListHelper = class helper for TEmolumentoList
  private
    function GetEmolumentoIDs: TIntegerList;
  public
    function GetMaiorEmolumentoID: Integer;
  end;

implementation

uses
  Emolumento,
  System.SysUtils;

{ TEmolumentoListHelper }

function TEmolumentoListHelper.GetEmolumentoIDs: TIntegerList;
{$REGION 'Variáveis'}
var
  viEmolumento: IEmolumento;
{$ENDREGION}
begin
  Result := TIntegerList.Create;
  Result.Capacity := Count;

  for viEmolumento in Self do
    Result.Add(viEmolumento.EmolumentoID);
end;

function TEmolumentoListHelper.GetMaiorEmolumentoID: Integer;
{$REGION 'Variáveis'}
var
  viEmolumentoIDs: TIntegerList;
{$ENDREGION}
begin
  viEmolumentoIDs := GetEmolumentoIDs;
  try
    Result := viEmolumentoIDs.Max;
  finally
    FreeAndNil(viEmolumentoIDs);
  end;
end;

end.
