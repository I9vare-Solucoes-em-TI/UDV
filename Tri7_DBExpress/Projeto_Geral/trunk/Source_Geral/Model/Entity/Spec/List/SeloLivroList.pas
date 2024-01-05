unit SeloLivroList;

interface

uses
  System.Generics.Collections,
  SeloLivro,
  SeloSituacao;

type
  TSeloLivroList = class(TList<ISeloLivro>)
  private
    {$REGION 'Constantes'}
    const CL_INDEX_NOT_FOUND: Integer = -1;
    {$ENDREGION}

    function GetBySeloSituacao(
      const vpSeloSituacao: ISeloSituacao): TSeloLivroList;

    function GetInutilizados: TSeloLivroList;

    function IndexOfByDescricaoIniciaCom(
      const vpValue: string): Integer;

    function IndexOfByDescricaoIniciaComEApresentanteIniciaCom(
      const vpDescricao: string;
      const vpApresentante: string): Integer;
  public
    property Inutilizados: TSeloLivroList read GetInutilizados;

    function GetByDescricaoIniciaCom(
      const vpValue: string): ISeloLivro;

    function GetByDescricaoIniciaComEApresentanteIniciaCom(
      const vpDescricao: string;
      const vpApresentante: string): ISeloLivro;
  end;

implementation

uses
  SeloSituacaoImpl,
  System.SysUtils,
  BooleanHelper,
  System.Math,
  System.Types;

{ TSelosLivro }

function TSeloLivroList.GetByDescricaoIniciaCom(
  const vpValue: string): ISeloLivro;
{$REGION 'Variáveis'}
var
  I: Integer;
{$ENDREGION}
begin
  Result := nil;

  I := IndexOfByDescricaoIniciaCom(vpValue);
  if CompareValue(I, CL_INDEX_NOT_FOUND) = GreaterThanValue then
    Result := Self[I];
end;

function TSeloLivroList.GetByDescricaoIniciaComEApresentanteIniciaCom(
  const vpDescricao: string;
  const vpApresentante: string): ISeloLivro;
{$REGION 'Variáveis'}
var
  I: Integer;
{$ENDREGION}
begin
  Result := nil;

  I := IndexOfByDescricaoIniciaComEApresentanteIniciaCom(
    vpDescricao, vpApresentante);

  if CompareValue(I, CL_INDEX_NOT_FOUND) = GreaterThanValue then
    Result := Self[I];
end;

function TSeloLivroList.GetBySeloSituacao(
  const vpSeloSituacao: ISeloSituacao): TSeloLivroList;
{$REGION 'Variáveis'}
var
  viSeloLivro: ISeloLivro;
{$ENDREGION}
begin
  Result := TSeloLivroList.Create;

  for viSeloLivro in Self do
    if viSeloLivro.SeloSituacao.Equals(vpSeloSituacao) then
      Result.Add(viSeloLivro);
end;

function TSeloLivroList.GetInutilizados: TSeloLivroList;
{$REGION 'Constantes'}
const
  CI_SELO_INUTILIZADO: Integer = 4;
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viSeloSituacao: ISeloSituacao;
{$ENDREGION}
begin
  viSeloSituacao := TSeloSituacao.Create;
  viSeloSituacao.SeloSituacaoID := CI_SELO_INUTILIZADO;
  Result := GetBySeloSituacao(viSeloSituacao);
end;

function TSeloLivroList.IndexOfByDescricaoIniciaCom(
  const vpValue: string): Integer;
{$REGION 'Variáveis'}
var
  I: Integer;
  viSeloLivro: ISeloLivro;
{$ENDREGION}
begin
  Result := CL_INDEX_NOT_FOUND;

  for I := ZeroValue to Pred(Count) do
  begin
    viSeloLivro := Self[I];
    if viSeloLivro.Descricao.StartsWith(vpValue) then
    begin
      Result := I;
      Break;
    end;
  end;
end;

function TSeloLivroList.IndexOfByDescricaoIniciaComEApresentanteIniciaCom(
  const vpDescricao: string;
  const vpApresentante: string): Integer;
{$REGION 'Variáveis'}
var
  I: Integer;
  viSeloLivro: ISeloLivro;
{$ENDREGION}
begin
  Result := CL_INDEX_NOT_FOUND;

  for I := ZeroValue to Pred(Count) do
  begin
    viSeloLivro := Self[I];

    if viSeloLivro.Descricao.StartsWith(vpDescricao).&And(
      viSeloLivro.Apresentante.StartsWith(vpApresentante)) then
    begin
      Result := I;
      Break;
    end;
  end;
end;

end.
