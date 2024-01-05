unit Geral.Model.Business.Spec.GenControle;

interface

uses
  Geral.Model.Entity.Spec.GenControle;

type
  IGenControleBusiness = interface
    ['{46D492FB-E70A-4358-B986-D77814C6040C}']

    function GerarSequencia(
      const vpNomeGenerator: string): IGenControle;

    function Excluir(
      const vpGenControle: IGenControle): Integer;

    function SetDisponivel(
      const vpGenControle: IGenControle): IGenControle;
  end;

implementation

end.
