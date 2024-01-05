unit SexoListSimpleFactory;

interface

uses
  SexoList;

type
  TSexoListSimpleFactory = class sealed
  public
    class function Get: TSexoList; static;
  end;

implementation

uses
  Sexo;

{ TSexoListSimpleFactory }

class function TSexoListSimpleFactory.Get: TSexoList;
{$REGION 'Variáveis'}
var
  viSexo: TSexo;
{$ENDREGION}
begin
  Result := TSexoList.Create;
  for viSexo := Low(TSexo) to High(TSexo) do
    Result.Add(viSexo);
end;

end.
