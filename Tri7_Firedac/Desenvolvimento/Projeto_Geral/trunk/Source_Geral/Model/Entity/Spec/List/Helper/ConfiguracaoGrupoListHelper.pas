unit ConfiguracaoGrupoListHelper;

interface

uses
  ConfiguracaoGrupoList,
  IntegerList;

type
  TConfiguracaoGrupoListHelper = class helper for TConfiguracaoGrupoList
  public
    function GetListConfiguracaoGrupoID: TIntegerList;
  end;

implementation

uses
  ConfiguracaoGrupo;

{ TConfiguracaoGrupoListHelper }

function TConfiguracaoGrupoListHelper.GetListConfiguracaoGrupoID: TIntegerList;
{$REGION 'Variáveis'}
var
  viConfiguracaoGrupo: IConfiguracaoGrupo;
{$ENDREGION}
begin
  Result := TIntegerList.Create;
  Result.Capacity := Count;

  for viConfiguracaoGrupo in Self do
    Result.Add(viConfiguracaoGrupo.ConfiguracaoGrupoID);
end;

end.
