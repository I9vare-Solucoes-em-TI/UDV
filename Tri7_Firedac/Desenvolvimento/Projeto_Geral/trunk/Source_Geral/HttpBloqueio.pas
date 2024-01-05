unit HttpBloqueio;

interface

uses
  Windows, SysUtils, Classes, StdCtrls, ExtCtrls, Graphics, Dialogs,
  IdBaseComponent, IdHTTP, HTTPApp, System.NetEncoding;

  Type

  THttpBloqueio = class(TObject)
  private
    FIdHTTP: TIdHTTP;
    FIdCartorio: String;

    function GetTravaSistemaBanco : string;
    function GetTravaSistemaHttp : string;
    procedure GravarTravaSistema(vpValor: string);
  public
    constructor Create;
    destructor Destroy; override;

    procedure Execute;

    property IdCartorio: String read FIdCartorio write FIdCartorio;

  end;
implementation

{$WARN SYMBOL_DEPRECATED OFF}
{$WARN IMPLICIT_STRING_CAST OFF}
{$WARN IMPLICIT_STRING_CAST_LOSS OFF}

uses Rotinas, Controles;

constructor THttpBloqueio.Create;
begin
  FIdHTTP := TIdHTTP.Create(nil);
  FIdHTTP.Request.ContentType     := 'text/xml; charset=utf-8';
  FIdHTTP.Request.ContentEncoding := 'utf-8';
  FIdHTTP.HTTPOptions             := [hoForceEncodeParams];
  FIdHTTP.Request.Accept          := 'text/html, */*';
  //FIdHTTP.Request.UserAgent       := 'Mozilla/3.0 (compatible; IndyLibrary)';

  FIdHTTP.Request.UserAgent := 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) ' +
    'AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36';

  FIdHTTP.HandleRedirects         := True;
  FIdHTTP.ReadTimeout             := 15000;
  FIdHTTP.ConnectTimeout          := 15000;

  if dtmControles.vlUsarProxy then
  begin
    FIdHTTP.ProxyParams.ProxyServer   := dtmControles.vlProxyServer;
    FIdHTTP.ProxyParams.ProxyPort     := dtmControles.vlProxyPort.ToInteger;
    FIdHTTP.ProxyParams.ProxyUsername := dtmControles.vlProxyUsername;
    FIdHTTP.ProxyParams.ProxyPassword := dtmControles.vlProxyPassword;
    if (FIdHTTP.ProxyParams.ProxyUsername <> '') and (FIdHTTP.ProxyParams.ProxyPassword <> '') then
      FIdHTTP.ProxyParams.BasicAuthentication := True;
  end;

  FIdCartorio   := '';
end;

destructor THttpBloqueio.Destroy;
begin
  FreeAndNil(FIdHTTP);
  inherited;
end;

procedure THttpBloqueio.Execute;
var
  viTravaHttp: string;
  viPos : Integer;
begin
  try
    if FIdCartorio <> '' then
      if ConectadoInternet then
      begin
        viTravaHttp := GetTravaSistemaHttp;
        viPos := Pos('KEY', viTravaHttp);
        if viPos > 0 then
        begin
          if viPos > 1 then
            Delete(viTravaHttp,1, 5)
          else
            Delete(viTravaHttp,1, 4);

          if (viTravaHttp.Length = 68) then
            if (GetTravaSistemaBanco <> viTravaHttp) then
               GravarTravaSistema(viTravaHttp);
        end;
      end;
  except

  end;
end;

function THttpBloqueio.GetTravaSistemaBanco: string;
begin
  Result := dtmControles.BuscarParametroOutroSistema('TRAVA_SISTEMA', 'GERAL', 'PRINCIPAL', '5')
end;

function THttpBloqueio.GetTravaSistemaHttp: string;
var
  viURL : string;
begin
  viURL  := 'http://www.tri7.com.br/trava.php?idcartorio=' + FIdCartorio;
  try
    Result := Trim(FIdHTTP.Get(viURL));
  except
  end;
end;

procedure THttpBloqueio.GravarTravaSistema(vpValor: string);
var
  viSql : string;
begin
  viSql := ' UPDATE G_CONFIG SET VALOR = '+ QuotedStr(vpValor)+
           ' WHERE NOME            = '+ QuotedStr('TRAVA_SISTEMA')+
           '   AND SECAO           = '+ QuotedStr('GERAL')+
           '   AND CONFIG_GRUPO_ID = (SELECT CONFIG_GRUPO_ID FROM G_CONFIG_GRUPO '+
           '                          WHERE DESCRICAO = '+QuotedStr('PRINCIPAL')+
           '                            AND SISTEMA_ID = 5)';
  dtmControles.ExecSQL(viSql);
end;

end.

