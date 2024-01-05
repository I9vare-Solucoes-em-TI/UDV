unit ConfiguracaoGrupoList;

interface

uses
  System.Generics.Collections,
  ConfiguracaoGrupo;

type
  TConfiguracaoGrupoList = class(TList<IConfiguracaoGrupo>)
  private
    {$REGION 'Constantes'}
    const CL_INDEX_NOT_FOUND: Integer = -1;
    {$ENDREGION}

    function IndexOfByConfiguracaoGrupoID(
      const vpValue: Integer): Integer;

    function IndexOfByDescricao(
      const vpValue: string): Integer;
  public
    function GetByConfiguracaoGrupoID(
      const vpValue: Integer): IConfiguracaoGrupo;

    function GetByDescricao(
      const vpValue: string): IConfiguracaoGrupo;
  end;

implementation

uses
  System.SysUtils,
  System.Math,
  System.Types;

{ TConfiguracaoGrupoList }

function TConfiguracaoGrupoList.GetByConfiguracaoGrupoID(
  const vpValue: Integer): IConfiguracaoGrupo;
{$REGION 'Variáveis'}
var
  I: Integer;
{$ENDREGION}
begin
  Result := nil;

  I := IndexOfByConfiguracaoGrupoID(vpValue);
  if CompareValue(I, CL_INDEX_NOT_FOUND) = GreaterThanValue then
    Result := Self[I];
end;

function TConfiguracaoGrupoList.GetByDescricao(
  const vpValue: string): IConfiguracaoGrupo;
{$REGION 'Variáveis'}
var
  I: Integer;
{$ENDREGION}
begin
  Result := nil;

  I := IndexOfByDescricao(vpValue);
  if CompareValue(I, CL_INDEX_NOT_FOUND) = GreaterThanValue then
    Result := Self[I];
end;

function TConfiguracaoGrupoList.IndexOfByConfiguracaoGrupoID(
  const vpValue: Integer): Integer;
{$REGION 'Variáveis'}
var
  I: Integer;
  viConfiguracaoGrupo: IConfiguracaoGrupo;
{$ENDREGION}
begin
  Result := CL_INDEX_NOT_FOUND;

  for I := ZeroValue to Pred(Count) do
  begin
    viConfiguracaoGrupo := Self[I];
    if CompareValue(viConfiguracaoGrupo.ConfiguracaoGrupoID,
      vpValue) = EqualsValue then
    begin
      Result := I;
      Break;
    end;
  end;
end;

function TConfiguracaoGrupoList.IndexOfByDescricao(
  const vpValue: string): Integer;
{$REGION 'Variáveis'}
var
  I: Integer;
  viConfiguracaoGrupo: IConfiguracaoGrupo;
{$ENDREGION}
begin
  Result := CL_INDEX_NOT_FOUND;

  for I := ZeroValue to Pred(Count) do
  begin
    viConfiguracaoGrupo := Self[I];
    if viConfiguracaoGrupo.Descricao.Equals(vpValue) then
    begin
      Result := I;
      Break;
    end;
  end;
end;

end.
