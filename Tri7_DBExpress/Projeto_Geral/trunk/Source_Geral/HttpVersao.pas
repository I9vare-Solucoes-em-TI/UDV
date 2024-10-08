unit HttpVersao;

interface

uses
  Windows, SysUtils, Classes, StdCtrls, ExtCtrls, Graphics, Dialogs,
  IdBaseComponent, IdHTTP, HTTPApp, System.NetEncoding;

  Type

  THttpVersao = class(TObject)
  private
    FIdHTTP: TIdHTTP;

    FNomeCartorio: string ;
    FVersao: string;
    FIdCartorio: string;
    FCidade: string;
    FUf: string;
    FIdSistema: string;
    FChave: string;
    FIp: string;

    function GravarVersaoHttp : Boolean;
    function GetVersaoAtual : string;
    procedure SetVersaoAtual;
  public
    constructor Create;
    destructor Destroy; override;

    function Execute: Boolean;

    property IdSistema: String read FIdSistema write FIdSistema;
    property IdCartorio: String read FIdCartorio write FIdCartorio;
    property NomeCartorio: String read FNomeCartorio write FNomeCartorio;
    property Cidade: String read FCidade write FCidade;
    property Uf: String read FUf write FUf;
    property Versao: String read FVersao write FVersao;
    property Chave: String read FChave write FChave;
    property Ip: String read FIp write FIp;

  end;
implementation

{$WARN SYMBOL_DEPRECATED OFF}
{$WARN IMPLICIT_STRING_CAST OFF}
{$WARN IMPLICIT_STRING_CAST_LOSS OFF}

uses Rotinas, Controles;

constructor THttpVersao.Create;
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

  FIdSistema    := '';
  FIdCartorio   := '';
  FNomeCartorio := '';
  FCidade       := '';
  FVersao       := '';
  FUf           := '';
  FIp           := '';
  FChave        := '';
end;

destructor THttpVersao.Destroy;
begin
  FreeAndNil(FIdHTTP);
  inherited;
end;

function THttpVersao.Execute: Boolean;
var
  viVersaoSys,
  viVersaoDB: Integer;
begin
  Result := True;
  try
    if ConectadoInternet then
    begin
      viVersaoSys := StrToInt(RetornaNumerico(FVersao));
      viVersaoDB  := StrToInt(RetornaNumerico(GetVersaoAtual));

      if (viVersaoSys > viVersaoDB) then
      begin
        if GravarVersaoHttp then
          SetVersaoAtual;
      end
      else
      if (viVersaoSys < viVersaoDB) then
      begin
        ShowMessage('Sistema desatualizado nesta m�quina, favor entrar em contato com o suporte!');
        Result := False;
      end;
    end;
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

function THttpVersao.GetVersaoAtual: string;
var
  viSql : string;
begin
  viSql  := 'SELECT VERSAO FROM G_SISTEMA WHERE SISTEMA_ID = ' + FIdSistema;
  Result := dtmControles.GetStr(viSql);
end;

function THttpVersao.GravarVersaoHttp :Boolean;
var
  viURL : string;
begin
  viURL  := 'http://www.tri7.com.br/versao.php?idsistema=' + FIdSistema +
                                             '&idcartorio=' + FIdCartorio +
                                             '&cartorio=' + HTTPEncode(RemoveAcentos(AnsiUpperCase(FNomeCartorio))) +
                                             '&cidade=' + HTTPEncode(RemoveAcentos(AnsiUpperCase(FCidade))) +
                                             '&uf=' + HTTPEncode(RemoveAcentos(AnsiUpperCase(FUf))) +
                                             '&chave=' + HTTPEncode(vgKey) +
                                             '&ip=' + HTTPEncode(RetornaIP) +
                                             '&versao=' + HTTPEncode(FVersao);
  Result := copy(RetornaNumerico(FIdHTTP.Get(viURL)), 1, 1) = '1';
end;

procedure THttpVersao.SetVersaoAtual;
var
  viSql : string;
begin
  viSql  := 'UPDATE G_SISTEMA SET VERSAO = ' + QuotedStr(FVersao) + ' WHERE SISTEMA_ID = ' + FIdSistema;
  dtmControles.ExecSQL(viSql);

  dtmControles.ExecSQL('UPDATE G_USUARIO_SISTEMA SET ' +
    'EXIBIR_ALERTA_VERSAO = ''S'' WHERE SISTEMA_ID = ' + vgId.ToString);
end;

end.
