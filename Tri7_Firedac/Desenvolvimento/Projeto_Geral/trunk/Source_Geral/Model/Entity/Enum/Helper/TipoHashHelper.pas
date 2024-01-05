unit TipoHashHelper;

interface

uses
  TipoHash;

type
  TTipoHashHelper = record helper for TTipoHash
  private
    function Equals(
      const vpValue: TTipoHash): Boolean;
  public
    function IsSHA1: Boolean;
    function IsBCrypt: Boolean;
    function IsMD5: Boolean;
  end;

implementation

{ TTipoHashHelper }

function TTipoHashHelper.Equals(
  const vpValue: TTipoHash): Boolean;
begin
  Result := Self = vpValue;
end;

function TTipoHashHelper.IsBCrypt: Boolean;
begin
  Result := Equals(TTipoHash.thBCrypt);
end;

function TTipoHashHelper.IsMD5: Boolean;
begin
  Result := Equals(TTipoHash.thMD5);
end;

function TTipoHashHelper.IsSHA1: Boolean;
begin
  Result := Equals(TTipoHash.thSHA1);
end;

end.
