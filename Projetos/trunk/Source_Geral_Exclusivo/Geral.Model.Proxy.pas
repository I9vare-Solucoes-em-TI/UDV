unit Geral.Model.Proxy;

interface

uses
  Geral.Model.ConexaoDb,
  Geral.Model.Util.Http;

type
  TProxyBusiness = class
  private
    FConexaoDb: TConexaoDb;

    function BuscarProxyUsar: Boolean;
    function BuscarProxyServer: string;
    function BuscarProxyPort: Integer;
    function BuscarProxyUsername: string;
    function BuscarProxyPassword: string;
  public
    constructor Create(
      const vpConexaoDb: TConexaoDb); reintroduce;

    function BuscarProxy: TProxy;
  end;

implementation

uses
  System.SysUtils;

{ TProxyBusiness }

function TProxyBusiness.BuscarProxy: TProxy;
var
  viProxyUsar: Boolean;
begin
  Result := nil;
  try
    viProxyUsar := BuscarProxyUsar;
    if not viProxyUsar then
      Exit;

    Result := TProxy.Create;
    Result.Server := BuscarProxyServer;
    Result.Port := BuscarProxyPort;
    Result.Username := BuscarProxyUsername;
    Result.Password := BuscarProxyPassword;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

function TProxyBusiness.BuscarProxyPassword: string;
begin
  Result := FConexaoDb.BuscarConfigValor(
    5,
    'PRINCIPAL',
    'PROXY',
    'PROXY_PASSWORD');
end;

function TProxyBusiness.BuscarProxyPort: Integer;
var
  viValor: string;
  viMensagem: string;
  viCaminho: string;
begin
  viValor := FConexaoDb.BuscarConfigValor(
    5,
    'PRINCIPAL',
    'PROXY',
    'PROXY_PORT');

  if viValor.IsEmpty then
  begin
    viCaminho := 'CX/PRINCIPAL/PROXY/PROXY_PORT';

    viMensagem := string.Format(
      'Parâmetro %s não configurado.',
      [viCaminho]);

    raise Exception.Create(viMensagem);
  end;

  Result := viValor.ToInteger;
end;

function TProxyBusiness.BuscarProxyServer: string;
var
  viValor: string;
  viMensagem: string;
  viCaminho: string;
begin
  viValor := FConexaoDb.BuscarConfigValor(
    5,
    'PRINCIPAL',
    'PROXY',
    'PROXY_SERVER');

  if viValor.IsEmpty then
  begin
    viCaminho := 'CX/PRINCIPAL/PROXY/PROXY_SERVER';

    viMensagem := string.Format(
      'Parâmetro %s não configurado.',
      [viCaminho]);

    raise Exception.Create(viMensagem);
  end;

  Result := viValor;
end;

function TProxyBusiness.BuscarProxyUsar: Boolean;
var
  viValor: string;
  viMensagem: string;
  viCaminho: string;
begin
  viValor := FConexaoDb.BuscarConfigValor(
    5,
    'PRINCIPAL',
    'PROXY',
    'PROXY_USAR');

  if viValor.IsEmpty then
  begin
    viCaminho := 'CX/PRINCIPAL/PROXY/PROXY_USAR';

    viMensagem := string.Format(
      'Parâmetro %s não configurado.',
      [viCaminho]);

    raise Exception.Create(viMensagem);
  end;

  Result := viValor = 'S';
end;

function TProxyBusiness.BuscarProxyUsername: string;
begin
  Result := FConexaoDb.BuscarConfigValor(
    5,
    'PRINCIPAL',
    'PROXY',
    'PROXY_USERNAME');
end;

constructor TProxyBusiness.Create(
  const vpConexaoDb: TConexaoDb);
begin
  inherited Create;
  FConexaoDb := vpConexaoDb;
end;

end.
