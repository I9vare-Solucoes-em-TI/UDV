unit Geral.Controller.Impl.VisualizacaoCapturaConfiguracoes;

interface

uses
  Geral.Model.Entity.Spec.VisualizacaoCapturaConfiguracoes,
  Geral.Model.Entity.Spec.CapturaConfiguracoes;

type
  TVisualizacaoCapturaConfiguracoes = class(TInterfacedObject,
    IVisualizacaoCapturaConfiguracoes)
  private
    FCapturaConfiguracoes: ICapturaConfiguracoes;
  public
    constructor Create(
      const vpCapturaConfiguracoes: ICapturaConfiguracoes); reintroduce;

    function CapturaConfiguracoes: ICapturaConfiguracoes;
    function Visualizar: IVisualizacaoCapturaConfiguracoes;

    class function New(
      const vpCapturaConfiguracoes: ICapturaConfiguracoes):
      IVisualizacaoCapturaConfiguracoes;
  end;

implementation

uses
  Geral.Model.Entity.Exception.VisualizacaoCapturaConfiguracoes,
  Config;

{ TVisualizacaoCapturaConfiguracoes }

function TVisualizacaoCapturaConfiguracoes.CapturaConfiguracoes:
  ICapturaConfiguracoes;
begin
  Result := FCapturaConfiguracoes;
end;

constructor TVisualizacaoCapturaConfiguracoes.Create(
  const vpCapturaConfiguracoes: ICapturaConfiguracoes);
begin
  inherited Create;
  FCapturaConfiguracoes := vpCapturaConfiguracoes;
end;

class function TVisualizacaoCapturaConfiguracoes.New(
  const vpCapturaConfiguracoes: ICapturaConfiguracoes):
  IVisualizacaoCapturaConfiguracoes;
begin
  Result := Create(
    vpCapturaConfiguracoes);
end;

function TVisualizacaoCapturaConfiguracoes.Visualizar:
  IVisualizacaoCapturaConfiguracoes;
begin
  if CapturaConfiguracoes.ConfiguracoesCapturadas.IsEmpty then
    raise ENenhumaConfiguracaoCapturada.New;

  TfrmConfig.Abrir(
    CapturaConfiguracoes.ConfiguracoesCapturadas);
end;

end.

