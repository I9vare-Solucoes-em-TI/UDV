unit EnviadorSelosTJSimpleFactory;

interface

uses
  EnviadorSelosTJ;

type
  TEnviadorSelosTJSimpleFactory = class sealed
  private
    class function GetEnviadorSelosTJGO: IEnviadorSelosTJ; static;
  public
    class function Get(
      const vpUF: string): IEnviadorSelosTJ; static;
  end;

implementation

uses
  System.SysUtils,
  ConfiguracaoGrupo,
  Configuracoes,
  ConfiguracaoGrupoDAO,
  Controles,
  ConfiguracaoDAO,
  EnviadorSelosTJGO,
  AmbienteWebService,
  AmbienteWebServiceHelper;

{ TEnviadorSelosTJSimpleFactory }

class function TEnviadorSelosTJSimpleFactory.Get(
  const vpUF: string): IEnviadorSelosTJ;
begin
  Result := nil;

  if vpUF.Equals('GO') then
    Result := GetEnviadorSelosTJGO;
end;

class function TEnviadorSelosTJSimpleFactory.GetEnviadorSelosTJGO:
  IEnviadorSelosTJ;
{$REGION 'Variáveis'}
var
  viConfiguracaoGrupo: TConfiguracaoGrupo;
  viConfiguracoes: TConfiguracoes;
  viProxyHost: string;
  viProxyPort: Integer;
  viProxyUserName: string;
  viProxyPassword: string;
{$ENDREGION}
begin
  with TConfiguracaoGrupoDAO.Create(dtmControles.DB) do
    try
      viConfiguracaoGrupo := Get('SELO', 5);
    finally
      Free;
    end;

  with TConfiguracaoDAO.Create(dtmControles.DB) do
    try
      viConfiguracoes := Get(viConfiguracaoGrupo, 'GOIAS');
    finally
      Free;
    end;

  viProxyHost := string.Empty;
  viProxyPort := 0;
  viProxyUserName := string.Empty;
  viProxyPassword := string.Empty;

  if dtmControles.vlUsarProxy then
  begin
    viProxyHost := dtmControles.vlProxyServer;
    viProxyPort := dtmControles.vlProxyPort.ToInteger;
    viProxyUserName := dtmControles.vlProxyUsername;
    viProxyPassword := dtmControles.vlProxyPassword;
  end;

  try
    Result := TEnviadorSelosTJGO.Create(
      viConfiguracoes.Get(
        viConfiguracaoGrupo, 'GOIAS', 'CODIGO_CARTORIO').Valor,
      viConfiguracoes.Get(
        viConfiguracaoGrupo, 'GOIAS', 'HASH_CARTORIO').Valor,
      viConfiguracoes.Get(
        viConfiguracaoGrupo, 'GOIAS', 'LOGIN').Valor,
      viConfiguracoes.Get(
        viConfiguracaoGrupo, 'GOIAS', 'SENHA').Valor,
      TAmbienteWebService.FromChar(viConfiguracoes.Get(
        viConfiguracaoGrupo, 'GOIAS', 'AMBIENTE_WEB_SERVICE').Valor.Chars[0]),
      viConfiguracoes.Get(
        viConfiguracaoGrupo, 'GOIAS', 'BASE_URL_PRODUCAO').Valor,
      viConfiguracoes.Get(
        viConfiguracaoGrupo, 'GOIAS', 'BASE_URL_HOMOLOGACAO').Valor,
      viConfiguracoes.Get(
        viConfiguracaoGrupo, 'GOIAS', 'RESOURCE').Valor,
      viProxyHost,
      viProxyPort,
      viProxyUserName,
      viProxyPassword);
  finally
    FreeAndNil(viConfiguracaoGrupo);
    FreeAndNil(viConfiguracoes);
  end;
end;

end.
