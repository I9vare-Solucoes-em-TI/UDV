unit HttpVersao;

interface

uses
  Windows, WinInet, SysUtils, Classes, StdCtrls, ExtCtrls, Graphics, Dialogs,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, HTTPApp;

  Type

  THttpVersao = class(TObject)
  private
    FIdHTTP: TIdHTTP;

    FNomeCartorio: String;
    FVersao: String;
    FIdCartorio: String;
    FCidade: String;
    FUf: string;
    FIdSistema: String;

    function GravarVersaoHttp : Boolean;
    function GetVersaoAtual : string;
    procedure SetVersaoAtual;
    function ConectadoInternet: Boolean;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Execute;

    property IdSistema: String read FIdSistema write FIdSistema;
    property IdCartorio: String read FIdCartorio write FIdCartorio;
    property NomeCartorio: String read FNomeCartorio write FNomeCartorio;
    property Cidade: String read FCidade write FCidade;
    property Uf: String read FUf write FUf;
    property Versao: String read FVersao write FVersao;

  end;
implementation

uses Rotinas, Controles;

constructor THttpVersao.Create;
begin
  FIdHTTP := TIdHTTP.Create(nil);
  FIdHTTP.Request.ContentType     := 'text/xml; charset=utf-8';
  FIdHTTP.Request.ContentEncoding := 'utf-8';
  FIdHTTP.HTTPOptions             := [hoForceEncodeParams];
  FIdHTTP.Request.Accept          := 'text/html, */*';
  FIdHTTP.Request.UserAgent       := 'Mozilla/3.0 (compatible; IndyLibrary)';
  FIdHTTP.HandleRedirects         := True;

  FIdSistema    := '';
  FIdCartorio   := '';
  FNomeCartorio := '';
  FCidade       := '';
  FVersao       := '';
  FUf           := '';
end;

destructor THttpVersao.Destroy;
begin
  FreeAndNil(FIdHTTP);
  inherited;
end;

procedure THttpVersao.Execute;
begin
  try
    if ConectadoInternet then
      if (GetVersaoAtual <> FVersao) then
        if GravarVersaoHttp then
          SetVersaoAtual;
  except

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
                                             '&versao=' + HTTPEncode(FVersao);
  Result := RetornaNumerico(FIdHTTP.Get(viURL)) = '1';
end;

procedure THttpVersao.SetVersaoAtual;
var
  viSql : string;
begin
  viSql  := 'UPDATE G_SISTEMA SET VERSAO = ' + QuotedStr(FVersao) + ' WHERE SISTEMA_ID = ' + FIdSistema;
  dtmControles.ExecSQL(viSql);
end;

function THttpVersao.ConectadoInternet: Boolean;
var
  dw_ConnectionTypes : DWORD;
begin
  dw_ConnectionTypes:= INTERNET_CONNECTION_LAN + INTERNET_CONNECTION_MODEM + INTERNET_CONNECTION_PROXY;
  Result:=InternetGetConnectedState(@dw_ConnectionTypes,0);
end;

end.
