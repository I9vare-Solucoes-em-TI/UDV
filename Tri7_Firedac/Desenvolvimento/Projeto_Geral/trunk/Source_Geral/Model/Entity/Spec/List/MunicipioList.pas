unit MunicipioList;

interface

uses
  System.Generics.Collections,
  Municipio;

type
  TMunicipioList = class(TList<IMunicipio>)
  private
    {$REGION 'Constantes'}
    const CL_INDEX_NOT_FOUND: Integer = -1;
    {$ENDREGION}
  public
    function IndexOfByMunicipio(
      const vpValue: IMunicipio): Integer;
  end;

implementation

uses
  System.Math;

{ TMunicipioList }

function TMunicipioList.IndexOfByMunicipio(
  const vpValue: IMunicipio): Integer;
{$REGION 'Variáveis'}
var
  I: Integer;
  viMunicipio: IMunicipio;
{$ENDREGION}
begin
  Result := CL_INDEX_NOT_FOUND;

  for I := ZeroValue to Pred(Count) do
  begin
    viMunicipio := Self[I];

    if viMunicipio.NotEquals(vpValue) then
      Continue;

    Result := I;
    Break;
  end;
end;

end.
