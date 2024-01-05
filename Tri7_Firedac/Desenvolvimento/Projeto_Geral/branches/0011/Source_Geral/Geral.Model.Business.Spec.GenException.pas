unit Geral.Model.Business.Spec.GenException;

interface

uses
  Geral.Model.Entity.Spec.Maybe,
  Geral.Model.Entity.Spec.GenException;

type
  IGenExceptionBusiness = interface
    ['{C64974C7-DA54-4A4B-AC9A-3B604B3432E2}']

    function ByNomeGenerator(
      const vpNomeGenerator: string): IMaybe<IGenException>;

    function Salvar(
      const vpGenException: IGenException): Integer;

    function Excluir(
      const vpGenException: IGenException): Integer;
  end;

implementation

end.
