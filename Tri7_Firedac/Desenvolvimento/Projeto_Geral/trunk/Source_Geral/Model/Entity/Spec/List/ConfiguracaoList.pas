unit ConfiguracaoList;

interface

uses
  System.Generics.Collections,
  Configuracao,
  ConfiguracaoGrupo;

type
  TConfiguracaoList = class(TList<IConfiguracao>)
  private
    {$REGION 'Constantes'}
    const CL_INDEX_NOT_FOUND: Integer = -1;
    {$ENDREGION}

    function IndexOfByConfiguracaoGrupoESecaoENome(
      const vpConfiguracaoGrupo: IConfiguracaoGrupo;
      const vpSecao: string;
      const vpNome: string): Integer;

    function IndexOfByConfiguracaoGrupoDescricaoESecaoENome(
      const vpConfiguracaoGrupoDescricao: string;
      const vpSecao: string;
      const vpNome: string): Integer;

    function IndexOfByNome(
      const vpValue: string): Integer;
  public
    function GetByConfiguracaoGrupoESecaoENome(
      const vpConfiguracaoGrupo: IConfiguracaoGrupo;
      const vpSecao: string;
      const vpNome: string): IConfiguracao;

    function GetByConfiguracaoGrupoDescricaoESecaoENome(
      const vpConfiguracaoGrupoDescricao: string;
      const vpSecao: string;
      const vpNome: string): IConfiguracao;

    function GetByNome(
      const vpValue: string): IConfiguracao;

    function GetListByConfiguracaoGrupoDescricao(
      const vpValue: string): TConfiguracaoList;

    function GetListBySecao(
      const vpValue: string): TConfiguracaoList;

    function GetListByConfiguracaoGrupoDescricaoESecao(
      const vpConfiguracaoGrupoDescricao: string;
      const vpSecao: string): TConfiguracaoList;
  end;

implementation

uses
  System.SysUtils,
  BooleanHelper,
  System.Math,
  System.Types;

{ TConfiguracaoList }

function TConfiguracaoList.GetByConfiguracaoGrupoESecaoENome(
  const vpConfiguracaoGrupo: IConfiguracaoGrupo;
  const vpSecao: string;
  const vpNome: string): IConfiguracao;
{$REGION 'Variáveis'}
var
  I: Integer;
{$ENDREGION}
begin
  Result := nil;

  I := IndexOfByConfiguracaoGrupoESecaoENome(vpConfiguracaoGrupo,
    vpSecao, vpNome);

  if CompareValue(I, CL_INDEX_NOT_FOUND) = GreaterThanValue then
    Result := Self[I];
end;

function TConfiguracaoList.GetByNome(
  const vpValue: string): IConfiguracao;
{$REGION 'Variáveis'}
var
  I: Integer;
{$ENDREGION}
begin
  I := IndexOfByNome(vpValue);
  if CompareValue(I, CL_INDEX_NOT_FOUND) = GreaterThanValue then
    Exit(Self[I]);

  Result := nil;
end;

function TConfiguracaoList.GetListBySecao(
  const vpValue: string): TConfiguracaoList;
{$REGION 'Variáveis'}
var
  viConfiguracao: IConfiguracao;
{$ENDREGION}
begin
  Result := TConfiguracaoList.Create;
  for viConfiguracao in Self do
  begin
    if viConfiguracao.Secao.Equals(vpValue).&Not then
      Continue;

    Result.Add(viConfiguracao);
  end;
end;

function TConfiguracaoList.GetListByConfiguracaoGrupoDescricao(
  const vpValue: string): TConfiguracaoList;
{$REGION 'Variáveis'}
var
  viConfiguracao: IConfiguracao;
{$ENDREGION}
begin
  Result := TConfiguracaoList.Create;
  for viConfiguracao in Self do
  begin
    if viConfiguracao.ConfiguracaoGrupo.Descricao.Equals(vpValue).&Not then
      Continue;

    Result.Add(viConfiguracao);
  end;
end;

function TConfiguracaoList.GetListByConfiguracaoGrupoDescricaoESecao(
  const vpConfiguracaoGrupoDescricao: string;
  const vpSecao: string): TConfiguracaoList;
{$REGION 'Variáveis'}
var
  viConfiguracaoListGrupo: TConfiguracaoList;
  viConfiguracaoListSecao: TConfiguracaoList;
{$ENDREGION}
begin
  Result := TConfiguracaoList.Create;

  viConfiguracaoListGrupo := GetListByConfiguracaoGrupoDescricao(
    vpConfiguracaoGrupoDescricao);

  try
    if CompareValue(viConfiguracaoListGrupo.Count, ZeroValue) = EqualsValue then
      Exit;

    viConfiguracaoListSecao := viConfiguracaoListGrupo.GetListBySecao(
      vpSecao);

    try
      Result.AddRange(viConfiguracaoListSecao);
    finally
      FreeAndNil(viConfiguracaoListSecao);
    end;
  finally
    FreeAndNil(viConfiguracaoListGrupo);
  end;
end;

function TConfiguracaoList.GetByConfiguracaoGrupoDescricaoESecaoENome(
  const vpConfiguracaoGrupoDescricao: string;
  const vpSecao: string;
  const vpNome: string): IConfiguracao;
{$REGION 'Variáveis'}
var
  I: Integer;
{$ENDREGION}
begin
  Result := nil;

  I := IndexOfByConfiguracaoGrupoDescricaoESecaoENome(
    vpConfiguracaoGrupoDescricao, vpSecao, vpNome);

  if CompareValue(I, CL_INDEX_NOT_FOUND) = GreaterThanValue then
    Result := Self[I];
end;

function TConfiguracaoList.IndexOfByConfiguracaoGrupoDescricaoESecaoENome(
  const vpConfiguracaoGrupoDescricao: string;
  const vpSecao: string;
  const vpNome: string): Integer;
{$REGION 'Variáveis'}
var
  I: Integer;
  viConfiguracao: IConfiguracao;
{$ENDREGION}
begin
  Result := CL_INDEX_NOT_FOUND;

  for I := ZeroValue to Pred(Count) do
  begin
    viConfiguracao := Self[I];
    if viConfiguracao.ConfiguracaoGrupo.Descricao.Equals(
      vpConfiguracaoGrupoDescricao).&And(
      viConfiguracao.Secao.Equals(vpSecao)).&And(
      viConfiguracao.Nome.Equals(vpNome)) then
    begin
      Result := I;
      Break;
    end;
  end;
end;

function TConfiguracaoList.IndexOfByConfiguracaoGrupoESecaoENome(
  const vpConfiguracaoGrupo: IConfiguracaoGrupo;
  const vpSecao: string;
  const vpNome: string): Integer;
{$REGION 'Variáveis'}
var
  I: Integer;
  viConfiguracao: IConfiguracao;
{$ENDREGION}
begin
  Result := CL_INDEX_NOT_FOUND;

  for I := ZeroValue to Pred(Count) do
  begin
    viConfiguracao := Self[I];
    if viConfiguracao.ConfiguracaoGrupo.Equals(vpConfiguracaoGrupo).&And(
      viConfiguracao.Secao.Equals(vpSecao)).&And(
      viConfiguracao.Nome.Equals(vpNome)) then
    begin
      Result := I;
      Break;
    end;
  end;
end;

function TConfiguracaoList.IndexOfByNome(
  const vpValue: string): Integer;
{$REGION 'Variáveis'}
var
  I: Integer;
{$ENDREGION}
begin
  for I := ZeroValue to Pred(Count) do
    if Self[I].Nome.Equals(vpValue) then
      Exit(I);

  Result := CL_INDEX_NOT_FOUND;
end;

end.
