unit CampoOrdenacaoList;

interface

uses
  System.Generics.Collections,
  CampoOrdenacao;

type
  TCampoOrdenacaoList = class(TList<ICampoOrdenacao>)
  private
    {$REGION 'Constantes'}
    const CL_INDEX_NOT_FOUND: Integer = -1;
    {$ENDREGION}

    function IndexOfByNome(
      const vpValue: string): Integer;
  public
    function GetByNome(
      const vpValue: string): ICampoOrdenacao;

    function ContainsByNome(
      const vpValue: string): Boolean;
  end;

implementation

uses
  System.Math,
  System.Types,
  System.SysUtils;

{ TCampoOrdenacaoList }

function TCampoOrdenacaoList.ContainsByNome(
  const vpValue: string): Boolean;
begin
  Result := Assigned(GetByNome(vpValue));
end;

function TCampoOrdenacaoList.GetByNome(
  const vpValue: string): ICampoOrdenacao;
{$REGION 'Variáveis'}
var
  I: Integer;
{$ENDREGION}
begin
  Result := nil;

  I := IndexOfByNome(vpValue);
  if CompareValue(I, CL_INDEX_NOT_FOUND) = GreaterThanValue then
    Result := Self[I];
end;

function TCampoOrdenacaoList.IndexOfByNome(
  const vpValue: string): Integer;
{$REGION 'Variáveis'}
var
  I: Integer;
  viCampoOrdenacao: ICampoOrdenacao;
{$ENDREGION}
begin
  Result := CL_INDEX_NOT_FOUND;

  for I := ZeroValue to Pred(Count) do
  begin
    viCampoOrdenacao := Self[I];
    if viCampoOrdenacao.Nome.Equals(vpValue) then
    begin
      Result := I;
      Break;
    end;
  end;
end;

end.
