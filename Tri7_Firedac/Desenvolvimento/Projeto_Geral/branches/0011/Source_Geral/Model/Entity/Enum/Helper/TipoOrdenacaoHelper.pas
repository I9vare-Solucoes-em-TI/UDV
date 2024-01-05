unit TipoOrdenacaoHelper;

interface

uses
  TipoOrdenacao;

type
  TTipoOrdenacaoHelper = record helper for TTipoOrdenacao
  public
    function Equals(
      const vpValue: TTipoOrdenacao): Boolean;

    function IsAscendente: Boolean;
    function IsDescendente: Boolean;
  end;

implementation

{ TTipoOrdenacaoHelper }

function TTipoOrdenacaoHelper.Equals(
  const vpValue: TTipoOrdenacao): Boolean;
begin
  Result := Self = vpValue;
end;

function TTipoOrdenacaoHelper.IsAscendente: Boolean;
begin
  Result := Equals(toAscendente);
end;

function TTipoOrdenacaoHelper.IsDescendente: Boolean;
begin
  Result := Equals(toDescendente);
end;

end.
