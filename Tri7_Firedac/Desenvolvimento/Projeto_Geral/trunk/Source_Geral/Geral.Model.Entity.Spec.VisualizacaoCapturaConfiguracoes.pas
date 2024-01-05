unit Geral.Model.Entity.Spec.VisualizacaoCapturaConfiguracoes;

interface

uses
  Geral.Model.Entity.Spec.CapturaConfiguracoes;

type
  IVisualizacaoCapturaConfiguracoes = interface
    ['{4A5BEF87-D72C-4519-944B-F93DB8C2BE40}']

    function CapturaConfiguracoes: ICapturaConfiguracoes;
    function Visualizar: IVisualizacaoCapturaConfiguracoes;
  end;

implementation

end.
