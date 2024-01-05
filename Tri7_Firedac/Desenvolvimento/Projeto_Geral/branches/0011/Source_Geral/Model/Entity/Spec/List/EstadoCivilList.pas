unit EstadoCivilList;

interface

uses
  System.Generics.Collections,
  EstadoCivil;

type
  TEstadoCivilList = class(TList<IEstadoCivil>)
  private
    {$REGION 'Constantes'}
    const CL_INDEX_NOT_FOUND: Integer = -1;
    {$ENDREGION}
  public
    function IndexOfByEstadoCivil(
      const vpValue: IEstadoCivil): Integer;
  end;

implementation

uses
  System.Math;

{ TEstadoCivilList }

function TEstadoCivilList.IndexOfByEstadoCivil(
  const vpValue: IEstadoCivil): Integer;
{$REGION 'Variáveis'}
var
  I: Integer;
  viEstadoCivil: IEstadoCivil;
{$ENDREGION}
begin
  Result := CL_INDEX_NOT_FOUND;

  for I := ZeroValue to Pred(Count) do
  begin
    viEstadoCivil := Self[I];

    if viEstadoCivil.NotEquals(vpValue) then
      Continue;

    Result := I;
    Break;
  end;
end;

end.
