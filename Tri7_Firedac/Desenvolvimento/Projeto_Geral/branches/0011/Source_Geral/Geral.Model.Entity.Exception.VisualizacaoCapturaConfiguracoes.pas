unit Geral.Model.Entity.Exception.VisualizacaoCapturaConfiguracoes;

interface

uses
  System.SysUtils;

type
  ENenhumaConfiguracaoCapturada = class(Exception)
  public
    constructor Create; reintroduce;
    class function New: ENenhumaConfiguracaoCapturada;
  end;

implementation

{ ENenhumaConfiguracaoCapturada }

constructor ENenhumaConfiguracaoCapturada.Create;
begin
  inherited Create(
    'Nenhuma configuração capturada.');
end;

class function ENenhumaConfiguracaoCapturada.New:
  ENenhumaConfiguracaoCapturada;
begin
  Result := Create;
end;

end.
