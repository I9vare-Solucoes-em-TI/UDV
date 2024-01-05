unit Geral.Controller.Config;

interface

uses
  Geral.Model.Config;

type
  TConfigController = class
  public
    class function Buscar(
      const vpGrupo: String;
      const vpSecao: String;
      const vpNome: String;
      const vpSistemaId: Integer): TConfig;

    class function BuscarValor(
      const vpGrupo: string;
      const vpSecao: string;
      const vpNome: string;
      const vpSistemaId: Integer): string;

    class procedure Salvar(
      const vpConfig: TConfig);
  end;

implementation

{ TConfigController }

class function TConfigController.Buscar(
  const vpGrupo: String;
  const vpSecao: String;
  const vpNome: String;
  const vpSistemaId: Integer): TConfig;
begin
  Result := TConfigBusiness.Buscar(
    vpGrupo,
    vpSecao,
    vpNome,
    vpSistemaId);
end;

class function TConfigController.BuscarValor(
  const vpGrupo: string;
  const vpSecao: string;
  const vpNome: string;
  const vpSistemaId: Integer): string;
begin
  Result := TConfigBusiness.BuscarValor(
    vpSistemaId,
    vpGrupo,
    vpSecao,
    vpNome);
end;

class procedure TConfigController.Salvar(
  const vpConfig: TConfig);
begin
  TConfigBusiness.Salvar(vpConfig);
end;

end.
