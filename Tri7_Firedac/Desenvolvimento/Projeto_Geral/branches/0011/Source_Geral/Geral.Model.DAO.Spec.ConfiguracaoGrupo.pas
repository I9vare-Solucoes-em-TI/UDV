unit Geral.Model.DAO.Spec.ConfiguracaoGrupo;

interface

uses
  Geral.Model.Entity.Spec.Sistema,
  Geral.Model.Entity.Spec.ConfiguracaoGrupo,
  Geral.Model.Entity.Spec.List;

type
  IConfiguracaoGrupoDAO = interface
    ['{528892B9-2030-404B-A738-A79F6E62FF4A}']

    function BySistemaAndDescricao(
      const vpSistema: ISistema;
      const vpDescricao: string): IConfiguracaoGrupo;

    function ListBySistemaAndDescricaoList(
      const vpSistema: ISistema;
      const vpDescricaoList: IList<string>): IList<IConfiguracaoGrupo>;
  end;

implementation

end.
