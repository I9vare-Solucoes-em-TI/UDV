unit Geral.Model.Entity.Spec.CapturaConfiguracoes;

interface

uses
  Geral.Model.Entity.Spec.List,
  Geral.Model.Entity.Spec.Configuracao;

type
  ICapturaConfiguracoes = interface
    ['{746E1FF7-E4A0-41C8-9468-AFAC1778F7BA}']

    function ConfiguracoesCapturadas: IList<IConfiguracao>;
  end;

implementation

end.
