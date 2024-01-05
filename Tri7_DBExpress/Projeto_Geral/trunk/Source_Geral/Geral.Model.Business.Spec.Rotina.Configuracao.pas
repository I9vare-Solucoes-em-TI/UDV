unit Geral.Model.Business.Spec.Rotina.Configuracao;

interface

uses
  Geral.Model.Entity.Spec.Rotina,
  Geral.Model.Entity.Spec.List,
  Geral.Model.Entity.Spec.Configuracao;

type
  IRotinaConfiguracaoBusiness = interface
    ['{FE714004-465D-44AF-95C5-9047126D6C44}']

    function ConfiguracaoList(
      const vpValue: IRotina): IList<IConfiguracao>;
  end;

implementation

end.
