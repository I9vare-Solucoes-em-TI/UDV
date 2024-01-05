unit Geral.Model.Permissao;

interface

type
  TTipoOperacao = (toIncluir, toAlterar, toExcluir, toPesquisar, toImprimir, toEspecial);

  TPermissaoUtil = class
  public
    class function BuscarValorTipoOperacao(
      const vpTipoOperacao: TTipoOperacao): Integer;
  end;

implementation

{ TPermissaoUtil }

class function TPermissaoUtil.BuscarValorTipoOperacao(
  const vpTipoOperacao: TTipoOperacao): Integer;
begin
  case vpTipoOperacao of
    TTipoOperacao.toIncluir: Result := 1;
    TTipoOperacao.toAlterar: Result := 2;
    TTipoOperacao.toExcluir: Result := 3;
    TTipoOperacao.toPesquisar: Result := 4;
    TTipoOperacao.toImprimir: Result := 5;
  else
    Result := 6;
  end;
end;

end.
