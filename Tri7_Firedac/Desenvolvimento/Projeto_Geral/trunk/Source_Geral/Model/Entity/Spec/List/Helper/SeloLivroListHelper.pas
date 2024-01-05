unit SeloLivroListHelper;

interface

uses
  SeloLivroList,
  IntegerList;

type
  TSeloLivroListHelper = class helper for TSeloLivroList
  private
    function GetList(
      const vpCamposID: TIntegerList): TSeloLivroList; overload;
  public
    function GetList(
      const vpCampoID: Integer): TSeloLivroList; overload;

    function Contains(
      const vpCampoID: Integer): Boolean; overload;

    function Contains(
      const vpCamposID: TIntegerList): Boolean; overload;

    function GetIDs: TIntegerList;
  end;

implementation

uses
  SeloLivro,
  System.SysUtils;

{ TSelosLivroHelper }

function TSeloLivroListHelper.Contains(
  const vpCampoID: Integer): Boolean;
{$REGION 'Variáveis'}
var
  viSeloLivroList: TSeloLivroList;
{$ENDREGION}
begin
  viSeloLivroList := GetList(vpCampoID);
  try
    Result := viSeloLivroList.Count > 0;
  finally
    FreeAndNil(viSeloLivroList);
  end;
end;

function TSeloLivroListHelper.Contains(
  const vpCamposID: TIntegerList): Boolean;
{$REGION 'Variáveis'}
var
  viSeloLivroList: TSeloLivroList;
{$ENDREGION}
begin
  viSeloLivroList := GetList(vpCamposID);
  try
    Result := viSeloLivroList.Count > 0;
  finally
    FreeAndNil(viSeloLivroList);
  end;
end;

function TSeloLivroListHelper.GetList(
  const vpCamposID: TIntegerList): TSeloLivroList;
{$REGION 'Variáveis'}
var
  viSeloLivro: ISeloLivro;
{$ENDREGION}
begin
  Result := TSeloLivroList.Create;

  for viSeloLivro in Self do
    if vpCamposID.Contains(viSeloLivro.CampoID) then
      Result.Add(viSeloLivro);
end;

function TSeloLivroListHelper.GetList(
  const vpCampoID: Integer): TSeloLivroList;
{$REGION 'Variáveis'}
var
  viSeloLivro: ISeloLivro;
{$ENDREGION}
begin
  Result := TSeloLivroList.Create;

  for viSeloLivro in Self do
    if viSeloLivro.CampoID = vpCampoID then
      Result.Add(viSeloLivro);
end;

function TSeloLivroListHelper.GetIDs: TIntegerList;
{$REGION 'Variáveis'}
var
  viSeloLivro: ISeloLivro;
{$ENDREGION}
begin
  Result := TIntegerList.Create;
  Result.Capacity := Capacity;

  for viSeloLivro in Self do
    Result.Add(viSeloLivro.SeloLivroID);
end;

end.
