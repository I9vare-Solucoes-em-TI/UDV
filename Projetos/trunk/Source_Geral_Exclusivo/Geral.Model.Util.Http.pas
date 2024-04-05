{* @hash       2b3a4f080d4b5e2a8e9e0d19eed146145d119703095919aaedf5e5e6a83c
 * @version    1.0.0.0
 * @unit       Geral.Model.Util.Http.pas
 * @author     I9vare
 * @copyright  Copyright (c) 2013 I9vare Gestão e Soluções em TI. (https://www.i9vare.com)
 *}

unit Geral.Model.Util.Http;

interface

uses
  System.Classes,
  IdHTTP;

const
  CG_HTTP_CODE_OK: Integer = 200;
  CG_HTTP_CODE_CREATED: Integer = 201;
  CG_HTTP_CODE_ACCEPTED: Integer = 202;
  CG_HTTP_CODE_NO_CONTENT: Integer = 204;
  CG_HTTP_CODE_BAD_REQUEST: Integer = 400;
  CG_HTTP_CODE_NOT_FOUND: Integer = 404;

type
  THttpResponse = class
  private
    FHttpCode: Integer;
    FHttpStatus: string;
    FHttpResponse: TStream;
  public
    property HttpCode: Integer read FHttpCode write FHttpCode;
    property HttpStatus: string read FHttpStatus write FHttpStatus;
    property HttpResponse: TStream read FHttpResponse write FHttpResponse;

    destructor Destroy; override;
  end;

  THttpResponseUtil = class
  public
    class function BuscarHttpResponse(
      const vpHttpClient: TIdHTTP;
      const vpOutputStream: TStream): THttpResponse;

  end;

  TProxy = class
  private
    FServer: string;
    FPort: Integer;
    FUsername: string;
    FPassword: string;
  public
    property Server: string read FServer write FServer;
    property Port: Integer read FPort write FPort;
    property Username: string read FUsername write FUsername;
    property Password: string read FPassword write FPassword;
  end;

  TProxyUtil = class
  public
    class procedure ConfigurarProxy(
      const vpHttpClient: TIdHTTP;
      const vpProxy: TProxy);
  end;

implementation

uses
  System.DateUtils,
  System.SysUtils;

{ THttpResponse }

destructor THttpResponse.Destroy;
begin
  FreeAndNil(FHttpResponse);
  inherited;
end;

{ THttpResponseUtil }

class function THttpResponseUtil.BuscarHttpResponse(
  const vpHttpClient: TIdHTTP;
  const vpOutputStream: TStream): THttpResponse;
begin
  Result := nil;
  try
    Result := THttpResponse.Create;
    Result.HttpCode := vpHttpClient.ResponseCode;
    Result.HttpStatus := vpHttpClient.ResponseText;
    Result.HttpResponse := vpOutputStream;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

{ TProxyUtil }

class procedure TProxyUtil.ConfigurarProxy(
  const vpHttpClient: TIdHTTP;
  const vpProxy: TProxy);
var
  viBasicAuthentication: Boolean;
begin
  if not Assigned(vpProxy) then
    Exit;

  vpHttpClient.ProxyParams.ProxyServer := vpProxy.Server;
  vpHttpClient.ProxyParams.ProxyPort := vpProxy.Port;

  viBasicAuthentication := not vpProxy.Username.IsEmpty and
    not vpProxy.Password.IsEmpty;

  if not viBasicAuthentication then
    Exit;

  vpHttpClient.ProxyParams.ProxyUsername := vpProxy.Username;
  vpHttpClient.ProxyParams.ProxyPassword := vpProxy.Password;
end;

end.
