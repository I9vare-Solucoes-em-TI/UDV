unit Geral.Controller.Config;

interface

uses
  System.Generics.Collections,
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
      const vpGrupo: String;
      const vpSecao: String;
      const vpNome: String;
      const vpSistemaId: Integer): String;

    class procedure Salvar(
      const vpConfig: TConfig);
  end;

implementation

uses
  System.SysUtils;

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
  const vpGrupo: String;
  const vpSecao: String;
  const vpNome: String;
  const vpSistemaId: Integer): String;
var
  viConfig: TConfig;
begin
  Result := '';

  viConfig := nil;
  try
    viConfig := TConfigBusiness.Buscar(
      vpGrupo,
      vpSecao,
      vpNome,
      5);

    if not Assigned(viConfig) then
      Exit;

    Result := viConfig.Valor;

  finally
    FreeAndNil(viConfig);
  end;
end;

class procedure TConfigController.Salvar(const vpConfig: TConfig);
begin
  TConfigBusiness.Salvar(vpConfig);
end;

end.
