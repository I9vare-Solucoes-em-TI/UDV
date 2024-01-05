unit Configuracoes;

interface

uses
  System.Generics.Collections,
  Configuracao,
  ConfiguracaoGrupo;

type
  TConfiguracoes = class(TObjectList<TConfiguracao>)
  private
    function IndexOf(
      const vpConfiguracaoGrupo: TConfiguracaoGrupo;
      const vpSecao: string;
      const vpNome: string): Integer; overload;
  public
    function Get(
      const vpConfiguracaoGrupo: TConfiguracaoGrupo;
      const vpSecao: string;
      const vpNome: string): TConfiguracao;
  end;

implementation

uses
  System.SysUtils;

{ TConfiguracoes }

function TConfiguracoes.Get(
  const vpConfiguracaoGrupo: TConfiguracaoGrupo;
  const vpSecao: string;
  const vpNome: string): TConfiguracao;
{$REGION 'Variáveis'}
var
  I: Integer;
{$ENDREGION}
begin
  Result := nil;

  I := IndexOf(vpConfiguracaoGrupo, vpSecao, vpNome);
  if I > -1 then
    Result := Self[I];
end;

function TConfiguracoes.IndexOf(
  const vpConfiguracaoGrupo: TConfiguracaoGrupo;
  const vpSecao: string;
  const vpNome: string): Integer;
{$REGION 'Variáveis'}
var
  I: Integer;
  viConfiguracao: TConfiguracao;
{$ENDREGION}
begin
  Result := -1;

  for I := 0 to Pred(Count) do
  begin
    viConfiguracao := Self[I];
    if viConfiguracao.ConfiguracaoGrupo.Equals(vpConfiguracaoGrupo) and
      viConfiguracao.Secao.Equals(vpSecao) and
      viConfiguracao.Nome.Equals(vpNome) then
    begin
      Result := I;
      Break;
    end;
  end;
end;

end.
