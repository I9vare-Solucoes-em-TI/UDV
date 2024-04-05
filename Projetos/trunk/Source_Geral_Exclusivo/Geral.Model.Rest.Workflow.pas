unit Geral.Model.Rest.Workflow;

interface

uses
  Geral.Model.Util.Http,
  System.Classes,
  Geral.Model.Proxy,
  IdHTTP,
  System.JSON,
  Geral.Model.ConexaoDb,
  Geral.Model.Tri7;

type
  [
    Enumerado('GET', 'GET'),
    Enumerado('POST', 'POST'),
    Enumerado('PUT', 'PUT'),
    Enumerado('PATCH', 'PATCH'),
    Enumerado('DELETE', 'DELETE')
  ]
  TEnVerbo = (
    enGET,
    enPOST,
    enPUT,
    enPATCH,
    enDELETE
  );

  TRestWorkflow = class
  private
    FProxy: TProxy;
    FBaseUrl: string;
    FCartorioId: Integer;

    procedure ConfigurarProxy(
      const vpHttpClient: TIdHTTP);

    function BuscarHttpClient: TIdHTTP;

    function BuscarHttpResponse(
      const vpHttpClient: TIdHTTP;
      const vpOutputStream: TStream): THttpResponse;

    function Request(const vpUrl: string;
      const vpToken: string;
      const vpVerbo: TEnVerbo;
      const vpBody: TJSONObject): THttpResponse;

    function Get(
      const vpUrl: string;
      const vpToken: string;
      const vpBody: TJSONObject): THttpResponse;

    function Post(
      const vpUrl: string;
      const vpToken: string;
      const vpBody: TJSONObject): THttpResponse;

    function Put(
      const vpUrl: string;
      const vpToken: string;
      const vpBody: TJSONObject): THttpResponse;

    function Patch(
      const vpUrl: string;
      const vpToken: string;
      const vpBody: TJSONObject): THttpResponse;

    function Delete(
      const vpUrl: string;
      const vpToken: string): THttpResponse;

  protected
    property Proxy: TProxy read FProxy;

  public
    constructor Create(
      const vpProxy: TProxy;
      const vpBaseUrl: string;
      const vpCartorioId: Integer); reintroduce;

    {Geral}

    function AuthLogin(
      const vpCns: string;
      const vpLogin: string;
      const vpSenha: string): THttpResponse;

    function CadastrarUsuarioWorkflow(
      const vpToken: string;
      const vpUsuarioId: Integer): THttpResponse;

    function CalcularDataVencidoCliente(
      const vpToken: string;
      const vpDataVigencia: TDateTime;
      const vpDiasCorridos: Integer;
      const vpFrequencia : String;
      const vpDuracao : Integer): THttpResponse;

    function UsuarioCadastro(
      const vpToken: string;
      const vpUsuarioId: Integer;
      const vpNome: string;
      const vpCpf: string;
      const vpEmail: string;
      const vpSituacao: string;
      const vpLogin: string;
      const vpSenha: string;
      const vpFoto: string;
      const vpAdministrador: Boolean): THttpResponse;

    function SistemaCadastro(
      const vpToken: string;
      const vpSistemaId: Integer;
      const vpDescricao: string;
      const vpPrefixo: string;
      const vpWorkflow: Boolean): THttpResponse;

    function EtapaGrupoCadastro(
      const vpToken: string;
      const vpGrupoEtapaId: Integer;
      const vpDescricao: string;
      const vpSistemaId: Integer;
      const vpSituacao: string;
      const vpPrazoFrequencia: string;
      const vpPrazoDuracao: Integer): THttpResponse;

    function EtapaGrupoDelete(
      const vpToken: string;
      const vpGrupoEtapaId: Integer): THttpResponse;

    function EtapaCadastro(
      const vpToken: string;
      const vpEtapaId: Integer;
      const vpGrupoEtapaId: Integer;
      const vpDescricao: string;
      const vpSistemaId: Integer;
      const vpOrdem: Integer;
      const vpFrequencia: string;
      const vpDuracao: Integer;
      const vpSituacao: string;
      const vpIgnorarPrevisaoEntrega: Boolean;
      const vpPrazoProximoVencimento: Integer;
      const vpEstender: Boolean;
      const vpEstenderFrequencia: string;
      const vpEstenderDuracao: Integer): THttpResponse;

    function EtapaDelete(
      const vpToken: string;
      const vpEtapaId: Integer): THttpResponse;

    function UsuarioSistemaCadastro(
      const vpToken: string;
      const vpUsuarioId: Integer;
      const vpSistemaId: Integer): THttpResponse;

    function UsuarioSistemaDelete(
      const vpToken: string;
      const vpUsuarioId: Integer;
      const vpSistemaId: Integer): THttpResponse;

    function FeriadoCadastro(
      const vpToken: string;
      const vpFeriadoId: Integer;
      const vpDescricao: string;
      const vpSituacao: string;
      const vpTipo: string;
      const vpDia: Integer;
      const vpMes: Integer;
      const vpAno: Integer;
      const vpDiaFim: Integer;
      const vpMesFim: Integer;
      const vpAnoFim: Integer): THttpResponse;

    function FeriadoDelete(
      const vpToken: string;
      const vpFeriadoId: Integer): THttpResponse;

    {Registro de Imóvies}

    function CadastrarRiProtocolo(
      const vpToken: string;
      const vpProtocoloId: Integer;
      const vpProtocoloAndamento: TJSONObject): THttpResponse;

    function DeletarRiAndamento(
      const vpToken: string;
      const vpAndamentoId: Integer): THttpResponse;

    function CadastrarRiTbTitulo(
      const vpToken: string;
      const vpTbTituloId: Integer;
      const vpTbTitulo: TJSONObject): THttpResponse;

    function DeletarRiTbTitulo(
      const vpToken: string;
      const vpTbTituloId: Integer): THttpResponse;

    function CadastrarRiTbTipoAndamento(
      const vpToken: string;
      const vpTbTipoAndamentoId: Integer;
      const vpTbTipoAndamento: TJSONObject): THttpResponse;

    function DeletarRiTbTipoAndamento(
      const vpToken: string;
      const vpTbTipoAndamentoId: Integer): THttpResponse;

    {Tabelionato de Notas}

    function CadastrarTnAtoTipo(
      const vpToken: string;
      const vpTnAtoTipoId: Integer;
      const vpTnAtoTipo: TJSONObject): THttpResponse;

    function DeletarTnAtoTipo(
      const vpToken: string;
      const vpTnAtoTipoId: Integer): THttpResponse;

    function CadastrarTnAtoTipoAndamento(
      const vpToken: string;
      const vpTnAtoTipoAndamentoId: Integer;
      const vpTnAtoTipoAndamento: TJSONObject): THttpResponse;

    function DeletarTnAtoTipoAndamento(
      const vpToken: string;
      const vpTnAtoTipoAndamentoId: Integer): THttpResponse;

    function CadastrarTnAto(
      const vpToken: string;
      const vpAtoId: Integer;
      const vpAtoAndamento: TJSONObject): THttpResponse;

    function DeletarTnAtoAndamento(
      const vpToken: string;
      const vpAtoAndamentoId: Integer): THttpResponse;

    {RTD/PJ}

    function CadastrarTdTipoDocumento(
      const vpToken: string;
      const vpTdTipoDocumentoId: Integer;
      const vpTdTipoDocumento: TJSONObject): THttpResponse;

    function DeletarTdTipoDocumento(
      const vpToken: string;
      const vpTdTipoDocumentoId: Integer): THttpResponse;

    function CadastrarTdTipoAndamento(
      const vpToken: string;
      const vpTdTipoAndamentoId: Integer;
      const vpTdTipoAndamento: TJSONObject): THttpResponse;

    function DeletarTdTipoAndamento(
      const vpToken: string;
      const vpTdTipoAndamentoId: Integer): THttpResponse;

    function CadastrarTdDocumento(
      const vpToken: string;
      const vpDocumentoId: Integer;
      const vpAndamento: TJSONObject): THttpResponse;

    function DeletarTdAndamento(
      const vpToken: string;
      const vpAndamentoId: Integer): THttpResponse;

  end;

implementation
uses
  System.NetEncoding,
  System.SysUtils,
  IdSSLOpenSSL,
  Geral.Model.Util.Json,
  Geral.Model.Cripto,
  System.StrUtils;

{ TRestHelpSystem }

function TRestWorkflow.BuscarHttpResponse(
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

function TRestWorkflow.BuscarHttpClient: TIdHTTP;
var
  viIdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL;
begin
  Result := nil;
  try
    Result := TIdHTTP.Create(nil);
    Result.ConnectTimeout := 300000;
    Result.ReadTimeout := 300000;

    viIdSSLIOHandlerSocketOpenSSL := TIdSSLIOHandlerSocketOpenSSL.Create(Result);
    viIdSSLIOHandlerSocketOpenSSL.SSLOptions.Method := TIdSSLVersion.sslvSSLv23;
    Result.IOHandler := viIdSSLIOHandlerSocketOpenSSL;

    ConfigurarProxy(Result);
  except
    FreeAndNil(Result);
    raise;
  end;
end;

function TRestWorkflow.CadastrarRiProtocolo(
  const vpToken: string;
  const vpProtocoloId: Integer;
  const vpProtocoloAndamento: TJSONObject): THttpResponse;
var
  viUrl: string;
begin
  viUrl := string.Format('%s/ri-protocolo/%d', [FBaseUrl, vpProtocoloId]);

  Result := Put(
    viUrl,
    vpToken,
    vpProtocoloAndamento);
end;

function TRestWorkflow.CadastrarRiTbTipoAndamento(
  const vpToken: string;
  const vpTbTipoAndamentoId: Integer;
  const vpTbTipoAndamento: TJSONObject): THttpResponse;
var
  viUrl: string;
begin
  viUrl := string.Format('%s/ri-tipo-andamento/%d', [FBaseUrl, vpTbTipoAndamentoId]);

  Result := Put(
    viUrl,
    vpToken,
    vpTbTipoAndamento);
end;

function TRestWorkflow.CadastrarRiTbTitulo(const vpToken: string;
  const vpTbTituloId: Integer;
  const vpTbTitulo: TJSONObject): THttpResponse;
var
  viUrl: string;
begin
  viUrl := string.Format('%s/ri-titulo/%d', [FBaseUrl, vpTbTituloId]);

  Result := Put(
    viUrl,
    vpToken,
    vpTbTitulo);
end;

function TRestWorkflow.CadastrarTdDocumento(const vpToken: string;
  const vpDocumentoId: Integer; const vpAndamento: TJSONObject): THttpResponse;
var
  viUrl: string;
begin
  viUrl := string.Format('%s/td-documento/%d', [FBaseUrl, vpDocumentoId]);

  Result := Put(
    viUrl,
    vpToken,
    vpAndamento);

end;

function TRestWorkflow.CadastrarTdTipoAndamento(const vpToken: string;
  const vpTdTipoAndamentoId: Integer;
  const vpTdTipoAndamento: TJSONObject): THttpResponse;
var
  viUrl: string;
begin
  viUrl := string.Format('%s/td-tipo-andamento/%d', [FBaseUrl, vpTdTipoAndamentoId]);

  Result := Put(
    viUrl,
    vpToken,
    vpTdTipoAndamento);

end;

function TRestWorkflow.CadastrarTdTipoDocumento(const vpToken: string;
  const vpTdTipoDocumentoId: Integer;
  const vpTdTipoDocumento: TJSONObject): THttpResponse;
var
  viUrl: string;
begin
  viUrl := string.Format('%s/td-tipo-documento/%d', [FBaseUrl, vpTdTipoDocumentoId]);

  Result := Put(
    viUrl,
    vpToken,
    vpTdTipoDocumento);

end;

function TRestWorkflow.CadastrarTnAto(const vpToken: string;
  const vpAtoId: Integer; const vpAtoAndamento: TJSONObject): THttpResponse;
var
  viUrl: string;
begin
  viUrl := string.Format('%s/tn-ato/%d', [FBaseUrl, vpAtoId]);

  Result := Put(
    viUrl,
    vpToken,
    vpAtoAndamento);

end;

function TRestWorkflow.CadastrarTnAtoTipo(const vpToken: string;
  const vpTnAtoTipoId: Integer; const vpTnAtoTipo: TJSONObject): THttpResponse;
var
  viUrl: string;
begin
  viUrl := string.Format('%s/tn-ato-tipo/%d', [FBaseUrl, vpTnAtoTipoId]);

  Result := Put(
    viUrl,
    vpToken,
    vpTnAtoTipo);
end;

function TRestWorkflow.CadastrarTnAtoTipoAndamento(const vpToken: string;
  const vpTnAtoTipoAndamentoId: Integer;
  const vpTnAtoTipoAndamento: TJSONObject): THttpResponse;
var
  viUrl: string;
begin
  viUrl := string.Format('%s/tn-ato-tipo-andamento/%d', [FBaseUrl, vpTnAtoTipoAndamentoId]);

  Result := Put(
    viUrl,
    vpToken,
    vpTnAtoTipoAndamento);
end;

function TRestWorkflow.CadastrarUsuarioWorkflow(const vpToken: string;
  const vpUsuarioId: Integer): THttpResponse;
var
  viUrl: string;
  viBodyRequest: TJSONObject;
begin
  viBodyRequest := nil;

  try
    viUrl := string.Format('%s/usuario-workflow', [FBaseUrl]);

    viBodyRequest := TJSONObject.Create;
    viBodyRequest.AddPair('usuario_id', TJSONNumber.Create(vpUsuarioId));

    Result := Post(
      viUrl,
      vpToken,
      viBodyRequest);
  finally
    FreeAndNil(viBodyRequest);
  end;

end;

function TRestWorkflow.CalcularDataVencidoCliente(const vpToken: string;
  const vpDataVigencia: TDateTime; const vpDiasCorridos: Integer;
  const vpFrequencia: String; const vpDuracao: Integer): THttpResponse;
var
  viUrl: string;
  viOriginalData: string;
  viEncodedData: string;
begin
  Result := nil;
  try
    viOriginalData := FormatDateTime('yyyy-mm-dd"T"hh:nn:ss', vpDataVigencia);
    viEncodedData := TNetEncoding.URL.Encode(viOriginalData);

    viUrl := string.Format('%s/calculo-vencimento/data-vencido-cliente?'+
    'data_vigencia=%s&dias_corridos=%d&frequencia=%s&duracao=%d',
    [FBaseUrl, (viEncodedData), vpDiasCorridos, vpFrequencia, vpDuracao]);

    Result := Get(
      viUrl,
      vpToken,
      nil);
  except
    FreeAndNil(Result);
    raise;
  end;

end;

function TRestWorkflow.AuthLogin(const vpCns: string;
  const vpLogin: string;
  const vpSenha: string): THttpResponse;
var
  viUrl: string;
  viBodyRequest: TJSONObject;
begin
  viBodyRequest := nil;

  try
    viUrl := string.Format('%s/auth/login', [FBaseUrl]);

    viBodyRequest := TJSONObject.Create;
    viBodyRequest.AddPair('cns', vpCns);
    viBodyRequest.AddPair('login', vpLogin);
    viBodyRequest.AddPair('senha', vpSenha);

    Result := Post(
      viUrl,
      '',
      viBodyRequest);
  finally
    FreeAndNil(viBodyRequest);
  end;

end;

procedure TRestWorkflow.ConfigurarProxy(const vpHttpClient: TIdHTTP);
var
  viBasicAuthentication: Boolean;
begin
  if not Assigned(FProxy) then
    Exit;

  vpHttpClient.ProxyParams.ProxyServer := FProxy.Server;
  vpHttpClient.ProxyParams.ProxyPort := FProxy.Port;

  viBasicAuthentication := not FProxy.Username.IsEmpty and
    not FProxy.Password.IsEmpty;

  if not viBasicAuthentication then
    Exit;

  vpHttpClient.ProxyParams.ProxyUsername := FProxy.Username;
  vpHttpClient.ProxyParams.ProxyPassword := FProxy.Password;
end;

constructor TRestWorkflow.Create(
  const vpProxy: TProxy;
  const vpBaseUrl: string;
  const vpCartorioId: Integer);
begin
  inherited Create;
  FProxy := vpProxy;
  FCartorioId := vpCartorioId;
  FBaseUrl := vpBaseUrl;
end;

function TRestWorkflow.DeletarRiAndamento(
  const vpToken: string;
  const vpAndamentoId: Integer): THttpResponse;
var
  viUrl: string;
begin
  viUrl := string.Format('%s/ri-andamento/%d', [FBaseUrl, vpAndamentoId]);

  Result := Delete(
    viUrl,
    vpToken);
end;

function TRestWorkflow.DeletarRiTbTipoAndamento(
  const vpToken: string;
  const vpTbTipoAndamentoId: Integer): THttpResponse;
var
  viUrl: string;
begin
  viUrl := string.Format('%s/tb-tipo-andamento/%d', [FBaseUrl, vpTbTipoAndamentoId]);

  Result := Delete(
    viUrl,
    vpToken);
end;

function TRestWorkflow.DeletarRiTbTitulo(const vpToken: string;
  const vpTbTituloId: Integer): THttpResponse;
var
  viUrl: string;
begin
  viUrl := string.Format('%s/ri-titulo/%d', [FBaseUrl, vpTbTituloId]);

  Result := Delete(
    viUrl,
    vpToken);

end;

function TRestWorkflow.DeletarTdAndamento(const vpToken: string;
  const vpAndamentoId: Integer): THttpResponse;
var
  viUrl: string;
begin
  viUrl := string.Format('%s/td-andamento/%d', [FBaseUrl, vpAndamentoId]);

  Result := Delete(
    viUrl,
    vpToken);

end;

function TRestWorkflow.DeletarTdTipoAndamento(const vpToken: string;
  const vpTdTipoAndamentoId: Integer): THttpResponse;
var
  viUrl: string;
begin
  viUrl := string.Format('%s/td-tipo-andamento/%d', [FBaseUrl, vpTdTipoAndamentoId]);

  Result := Delete(
    viUrl,
    vpToken);

end;

function TRestWorkflow.DeletarTdTipoDocumento(const vpToken: string;
  const vpTdTipoDocumentoId: Integer): THttpResponse;
var
  viUrl: string;
begin
  viUrl := string.Format('%s/td-tipo-documento/%d', [FBaseUrl, vpTdTipoDocumentoId]);

  Result := Delete(
    viUrl,
    vpToken);

end;

function TRestWorkflow.DeletarTnAtoAndamento(const vpToken: string;
  const vpAtoAndamentoId: Integer): THttpResponse;
var
  viUrl: string;
begin
  viUrl := string.Format('%s/tn-ato-andamento/%d', [FBaseUrl, vpAtoAndamentoId]);

  Result := Delete(
    viUrl,
    vpToken);
end;

function TRestWorkflow.DeletarTnAtoTipo(const vpToken: string;
  const vpTnAtoTipoId: Integer): THttpResponse;
var
  viUrl: string;
begin
  viUrl := string.Format('%s/tn-ato-tipo/%d', [FBaseUrl, vpTnAtoTipoId]);

  Result := Delete(
    viUrl,
    vpToken);
end;

function TRestWorkflow.DeletarTnAtoTipoAndamento(const vpToken: string;
  const vpTnAtoTipoAndamentoId: Integer): THttpResponse;
var
  viUrl: string;
begin
  viUrl := string.Format('%s/tn-ato-tipo-andamento/%d', [FBaseUrl, vpTnAtoTipoAndamentoId]);

  Result := Delete(
    viUrl,
    vpToken);
end;

function TRestWorkflow.Delete(const vpUrl, vpToken: string): THttpResponse;
begin
  Result := Request(
    vpUrl,
    vpToken,
    TEnVerbo.enDELETE,
    nil);
end;

function TRestWorkflow.EtapaCadastro(const vpToken: string;
  const vpEtapaId: Integer;
  const vpGrupoEtapaId: Integer;
  const vpDescricao: string;
  const vpSistemaId: Integer;
  const vpOrdem: Integer;
  const vpFrequencia: string;
  const vpDuracao: Integer;
  const vpSituacao: string;
  const vpIgnorarPrevisaoEntrega: Boolean;
  const vpPrazoProximoVencimento: Integer;
  const vpEstender: Boolean;
  const vpEstenderFrequencia: string;
  const vpEstenderDuracao: Integer): THttpResponse;
var
  viUrl: string;
  viBodyRequest: TJSONObject;
begin
  viBodyRequest := nil;

  try
    viUrl := string.Format('%s/etapa/%d', [FBaseUrl, vpEtapaId]);

    viBodyRequest := TJSONObject.Create;
    viBodyRequest.AddPair('etapa_grupo_id', TJSONNumber.Create(vpGrupoEtapaId));
    viBodyRequest.AddPair('descricao', TJSONString.Create(vpDescricao));
    viBodyRequest.AddPair('sistema_id', TJSONNumber.Create(vpSistemaId));
    viBodyRequest.AddPair('ordem', TJSONNumber.Create(vpOrdem));
    viBodyRequest.AddPair('frequencia', TJSONString.Create(vpFrequencia));
    viBodyRequest.AddPair('duracao', TJSONNumber.Create(vpDuracao));
    viBodyRequest.AddPair('situacao', TJSONString.Create(vpSituacao));
    viBodyRequest.AddPair('prazo_proximo_vencimento', TJSONNumber.Create(vpPrazoProximoVencimento));

    if vpIgnorarPrevisaoEntrega then
      viBodyRequest.AddPair('ignorar_previsao_entrega', TJSONTrue.Create)
    else
      viBodyRequest.AddPair('ignorar_previsao_entrega', TJSONFalse.Create);

    if vpEstender then
      viBodyRequest.AddPair('estender', TJSONTrue.Create)
    else
      viBodyRequest.AddPair('estender', TJSONFalse.Create);

    viBodyRequest.AddPair('estender_frequencia', TJSONString.Create(vpEstenderFrequencia));
    viBodyRequest.AddPair('estender_duracao', TJSONNumber.Create(vpEstenderDuracao));

    Result := Put(
      viUrl,
      vpToken,
      viBodyRequest);
  finally
    FreeAndNil(viBodyRequest);
  end;

end;

function TRestWorkflow.EtapaDelete(const vpToken: string;
  const vpEtapaId: Integer): THttpResponse;
var
  viUrl: string;
begin
  viUrl := string.Format('%s/etapa/%d', [FBaseUrl, vpEtapaId]);

  Result := Delete(
    viUrl,
    vpToken);
end;

function TRestWorkflow.EtapaGrupoCadastro(
  const vpToken: string;
  const vpGrupoEtapaId: Integer;
  const vpDescricao: string;
  const vpSistemaId: Integer;
  const vpSituacao: string;
  const vpPrazoFrequencia: string;
  const vpPrazoDuracao: Integer): THttpResponse;
var
  viUrl: string;
  viBodyRequest: TJSONObject;
begin
  viBodyRequest := nil;

  try
    viUrl := string.Format('%s/etapa-grupo/%d', [FBaseUrl, vpGrupoEtapaId]);

    viBodyRequest := TJSONObject.Create;
    viBodyRequest.AddPair('descricao', TJSONString.Create(vpDescricao));
    viBodyRequest.AddPair('sistema_id', TJSONNumber.Create(vpSistemaId));
    viBodyRequest.AddPair('situacao', TJSONString.Create(vpSituacao));
    viBodyRequest.AddPair('frequencia', TJSONString.Create(vpPrazoFrequencia));
    viBodyRequest.AddPair('duracao', TJSONNumber.Create(vpPrazoDuracao));

    Result := Put(
      viUrl,
      vpToken,
      viBodyRequest);
  finally
    FreeAndNil(viBodyRequest);
  end;

end;

function TRestWorkflow.EtapaGrupoDelete(const vpToken: string;
  const vpGrupoEtapaId: Integer): THttpResponse;
var
  viUrl: string;
begin
  viUrl := string.Format('%s/etapa-grupo/%d', [FBaseUrl, vpGrupoEtapaId]);

  Result := Delete(
    viUrl,
    vpToken);

end;

function TRestWorkflow.FeriadoCadastro(const vpToken: string;
  const vpFeriadoId: Integer; const vpDescricao, vpSituacao, vpTipo: string;
  const vpDia, vpMes, vpAno, vpDiaFim, vpMesFim,
  vpAnoFim: Integer): THttpResponse;
var
  viUrl: string;
  viBodyRequest: TJSONObject;
begin
  viBodyRequest := nil;

  try
    viUrl := string.Format('%s/feriado/%d', [FBaseUrl, vpFeriadoId]);

    viBodyRequest := TJSONObject.Create;
    viBodyRequest.AddPair('descricao', TJSONString.Create(vpDescricao));
    viBodyRequest.AddPair('situacao', TJSONString.Create(vpSituacao));
    viBodyRequest.AddPair('tipo', TJSONString.Create(vpTipo));
    viBodyRequest.AddPair('dia', TJSONNumber.Create(vpDia));
    viBodyRequest.AddPair('mes', TJSONNumber.Create(vpMes));
    viBodyRequest.AddPair('ano', TJSONNumber.Create(vpAno));
    viBodyRequest.AddPair('dia_fim', TJSONNumber.Create(vpDiaFim));
    viBodyRequest.AddPair('mes_fim', TJSONNumber.Create(vpMesFim));
    viBodyRequest.AddPair('ano_fim', TJSONNumber.Create(vpAnoFim));

    Result := Put(
      viUrl,
      vpToken,
      viBodyRequest);
  finally
    FreeAndNil(viBodyRequest);
  end;

end;

function TRestWorkflow.FeriadoDelete(const vpToken: string;
  const vpFeriadoId: Integer): THttpResponse;
var
  viUrl: string;
begin
  viUrl := string.Format('%s/feriado/%d', [FBaseUrl, vpFeriadoId]);

  Result := Delete(
    viUrl,
    vpToken);

end;

function TRestWorkflow.Get(const vpUrl: string;
  const vpToken: string;
  const vpBody: TJSONObject): THttpResponse;
begin
  Result := Request(
    vpUrl,
    vpToken,
    TEnVerbo.enGET,
    vpBody);
end;

function TRestWorkflow.Patch(const vpUrl: string;
  const vpToken: string;
  const vpBody: TJSONObject): THttpResponse;
begin
  Result := Request(
    vpUrl,
    vpToken,
    TEnVerbo.enPATCH,
    vpBody);
end;

function TRestWorkflow.Post(const vpUrl: string;
  const vpToken: string;
  const vpBody: TJSONObject): THttpResponse;
begin
  Result := Request(
    vpUrl,
    vpToken,
    TEnVerbo.enPOST,
    vpBody);
end;

function TRestWorkflow.Put(const vpUrl, vpToken: string;
  const vpBody: TJSONObject): THttpResponse;
begin
  Result := Request(
    vpUrl,
    vpToken,
    TEnVerbo.enPUT,
    vpBody);
end;

function TRestWorkflow.Request(const vpUrl, vpToken: string;
  const vpVerbo: TEnVerbo; const vpBody: TJSONObject): THttpResponse;
var
  viHttpClient: TIdHTTP;
  viOutputStream: TStream;
  viBody: TStream;
  viVerboValor: string;
  viErro: string;
begin
  Result := nil;
  viHttpClient := nil;
  viOutputStream := nil;
  viBody := nil;

  if vpUrl.Trim.IsEmpty then
    raise Exception.Create('URL não informada!');

  if (not Assigned(vpBody)) and (vpVerbo in [enPOST, enPATCH]) then
    raise Exception.Create('Corpo da requisição obrigatório para os metodos de POST e PATCH!');

  try
    try
      viOutputStream := TMemoryStream.Create;

      viHttpClient := BuscarHttpClient;
      viHttpClient.Request.ContentType  := 'application/json';

      if not vpToken.Trim.IsEmpty then
      begin
        viHttpClient.Request.CustomHeaders.FoldLines := False;
        viHttpClient.Request.CustomHeaders.Add('Authorization:Bearer ' + vpToken);
        viHttpClient.Request.CustomHeaders.Add('x-cartorio-id:' + FCartorioId.ToString);
      end;

      if Assigned(vpBody) then
        viBody := TStringStream.Create(vpBody.ToJSON, TEncoding.UTF8);

      viVerboValor := TTri7Util.BuscarEnumValor<TEnVerbo>(vpVerbo);

      viErro := EmptyStr;

      try
        case vpVerbo of
          enGET: viHttpClient.Get(vpUrl, viOutputStream);
          enPOST: viHttpClient.Post(vpUrl, viBody, viOutputStream);
          enPUT: viHttpClient.Put(vpUrl, viBody, viOutputStream);
          enPATCH: viHttpClient.Patch(vpUrl, viBody, viOutputStream);
          enDELETE: viHttpClient.Delete(vpUrl, viOutputStream);
        end;
      except
        on E: EIdHTTPProtocolException do
        begin
          FreeAndNil(viOutputStream);
          viOutputStream := TStringStream.Create(E.ErrorMessage, TEncoding.UTF8);
        end;

        on E: Exception do
        begin
          FreeAndNil(viOutputStream);
          viOutputStream := TStringStream.Create(E.Message);
        end;
      end;


      Result := BuscarHttpResponse(viHttpClient, viOutputStream);

    except
      FreeAndNil(viOutputStream);
      raise;
    end;
  finally
    FreeAndNil(viHttpClient);
    FreeAndNil(viBody);
  end;

end;

function TRestWorkflow.SistemaCadastro(const vpToken: string;
  const vpSistemaId: Integer; const vpDescricao,
  vpPrefixo: string;
  const vpWorkflow: Boolean): THttpResponse;
var
  viUrl: string;
  viBodyRequest: TJSONObject;
begin
  viBodyRequest := nil;

  try
    viUrl := string.Format('%s/sistema/%d', [FBaseUrl, vpSistemaId]);

    viBodyRequest := TJSONObject.Create;
    viBodyRequest.AddPair('descricao', TJSONString.Create(vpDescricao));
    viBodyRequest.AddPair('prefixo', TJSONString.Create(vpPrefixo));
    if vpWorkflow then
      viBodyRequest.AddPair('workflow', TJSONTrue.Create)
    else
      viBodyRequest.AddPair('workflow', TJSONFalse.Create);

    Result := Put(
      viUrl,
      vpToken,
      viBodyRequest);
  finally
    FreeAndNil(viBodyRequest);
  end;

end;

function TRestWorkflow.UsuarioCadastro(
  const vpToken: string;
  const vpUsuarioId: Integer;
  const vpNome, vpCpf, vpEmail, vpSituacao, vpLogin, vpSenha, vpFoto: string;
  const vpAdministrador: Boolean): THttpResponse;
var
  viUrl: string;
  viBodyRequest: TJSONObject;
begin
  viBodyRequest := nil;

  try
    viUrl := string.Format('%s/usuario/%d', [FBaseUrl, vpUsuarioId]);

    viBodyRequest := TJSONObject.Create;
    viBodyRequest.AddPair('nome', TJSONString.Create(vpNome));
    viBodyRequest.AddPair('cpf', TJSONString.Create(vpCpf));
    viBodyRequest.AddPair('email', TJSONString.Create(vpEmail));
    viBodyRequest.AddPair('situacao', TJSONString.Create(vpSituacao));
    viBodyRequest.AddPair('login', TJSONString.Create(vpLogin));
    viBodyRequest.AddPair('senha', TJSONString.Create(vpSenha));
    viBodyRequest.AddPair('foto', TJSONString.Create(vpFoto));
    if vpAdministrador then
      viBodyRequest.AddPair('administrador', TJSONTrue.Create)
    else
      viBodyRequest.AddPair('administrador', TJSONFalse.Create);

    Result := Put(
      viUrl,
      vpToken,
      viBodyRequest);
  finally
    FreeAndNil(viBodyRequest);
  end;

end;

function TRestWorkflow.UsuarioSistemaCadastro(const vpToken: string;
  const vpUsuarioId, vpSistemaId: Integer): THttpResponse;
var
  viUrl: string;
  viBodyRequest: TJSONObject;
begin
  viBodyRequest := nil;

  try
    viUrl := string.Format('%s/usuario-sistema/%d/%d', [FBaseUrl, vpUsuarioId, vpSistemaId]);

    Result := Put(
      viUrl,
      vpToken,
      viBodyRequest);
  finally
    FreeAndNil(viBodyRequest);
  end;

end;

function TRestWorkflow.UsuarioSistemaDelete(const vpToken: string;
  const vpUsuarioId, vpSistemaId: Integer): THttpResponse;
var
  viUrl: string;
begin
  viUrl := string.Format('%s/usuario-sistema/%d/%d', [FBaseUrl, vpUsuarioId, vpSistemaId]);

  Result := Delete(
    viUrl,
    vpToken);

end;

end.
