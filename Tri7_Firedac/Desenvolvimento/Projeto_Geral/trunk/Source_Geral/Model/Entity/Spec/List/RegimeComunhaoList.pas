unit RegimeComunhaoList;

interface

uses
  System.Generics.Collections,
  RegimeComunhao;

type
  TRegimeComunhaoList = class(TList<IRegimeComunhao>)
  private
    {$REGION 'Constantes'}
    const CL_INDEX_NOT_FOUND: Integer = -1;
    {$ENDREGION}
  public
    function IndexOfByRegimeComunhao(
      const vpValue: IRegimeComunhao): Integer;
  end;

implementation

uses
  System.Math;

{ TRegimeComunhaoList }

function TRegimeComunhaoList.IndexOfByRegimeComunhao(
  const vpValue: IRegimeComunhao): Integer;
{$REGION 'Variáveis'}
var
  I: Integer;
  viRegimeComunhao: IRegimeComunhao;
{$ENDREGION}
begin
  Result := CL_INDEX_NOT_FOUND;

  for I := ZeroValue to Pred(Count) do
  begin
    viRegimeComunhao := Self[I];

    if viRegimeComunhao.NotEquals(vpValue) then
      Continue;

    Result := I;
    Break;
  end;
end;

end.
