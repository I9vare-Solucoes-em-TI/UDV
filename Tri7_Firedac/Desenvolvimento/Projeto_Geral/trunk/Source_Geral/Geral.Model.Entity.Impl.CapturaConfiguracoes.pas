unit Geral.Model.Entity.Impl.CapturaConfiguracoes;

interface

uses
  Geral.Model.Entity.Spec.CapturaConfiguracoes,
  Geral.Model.Entity.Spec.List,
  Geral.Model.Entity.Spec.Configuracao;

type
  TCapturaConfiguracoes = class(TInterfacedObject, ICapturaConfiguracoes)
  private
    FConfiguracoesCapturadas: IList<IConfiguracao>;
  public
    constructor Create(
      const vpConfiguracoesCapturadas: IList<IConfiguracao>); reintroduce;

    function ConfiguracoesCapturadas: IList<IConfiguracao>;

    class function New(
      const vpConfiguracoesCapturadas: IList<IConfiguracao>):
      ICapturaConfiguracoes;
  end;

implementation

{ TCapturaConfiguracoes }

function TCapturaConfiguracoes.ConfiguracoesCapturadas: IList<IConfiguracao>;
begin
  Result := FConfiguracoesCapturadas;
end;

constructor TCapturaConfiguracoes.Create(
  const vpConfiguracoesCapturadas: IList<IConfiguracao>);
begin
  inherited Create;
  FConfiguracoesCapturadas := vpConfiguracoesCapturadas;
end;

class function TCapturaConfiguracoes.New(
  const vpConfiguracoesCapturadas: IList<IConfiguracao>): ICapturaConfiguracoes;
begin
  Result := Create(
    vpConfiguracoesCapturadas);
end;

end.
