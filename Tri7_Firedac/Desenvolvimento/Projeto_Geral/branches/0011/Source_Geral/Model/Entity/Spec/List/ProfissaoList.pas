unit ProfissaoList;

interface

uses
  System.Generics.Collections,
  Profissao;

type
  TProfissaoList = class(TList<IProfissao>)
  private
    {$REGION 'Constantes'}
    const CL_INDEX_NOT_FOUND: Integer = -1;
    {$ENDREGION}
  public
    function IndexOfByProfissao(
      const vpValue: IProfissao): Integer;
  end;

implementation

uses
  System.Math;

{ TProfissaoList }

function TProfissaoList.IndexOfByProfissao(
  const vpValue: IProfissao): Integer;
{$REGION 'Variáveis'}
var
  I: Integer;
  viProfissao: IProfissao;
{$ENDREGION}
begin
  Result := CL_INDEX_NOT_FOUND;

  for I := ZeroValue to Pred(Count) do
  begin
    viProfissao := Self[I];

    if viProfissao.NotEquals(vpValue) then
      Continue;

    Result := I;
    Break;
  end;
end;

end.
