unit Geral.Model.Workflow;

interface
uses
  Geral.Model.ConexaoDb,
  Geral.Model.Rest.Workflow,
  Geral.Model.Util.Http,
  System.JSON,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  Data.DB;

type
  TUtilWorkflowBusiness = class
  protected
    FConexaoDb: TConexaoDb;
    FProxy: TProxy;
    FLoadProxy: Boolean;
    FCartorioId: Integer;
    FCns: string;
    FBaseUrl: string;
    FUsuario: string;
    FSenha: string;

    function BuscarCartorioId: Integer;
    function BuscarCnsCartorio: string;
    function BuscarBaseUrl: string;
    function BuscarLoginUsuarioPadrao: string;
    function BuscarSenhaUsuarioPadrao: string;

    function GetHttpToken: string;

    function GetToken: string;
    function GetProxy: TProxy;

    function VerificarToken: string;

  public
    constructor Create(
      const vpConexaoDb: TConexaoDb); reintroduce;

    class function FormatarDataHora(const vpData: TDateTime): string;
  end;

  TWorkflowBusiness = class(TUtilWorkflowBusiness)
  private
    function FormatarErro(const vpHttpResponse: THttpResponse): string;

    function BuscarUsuario(const vpUsuarioId: integer): TDataSet;
    function BuscarSistema(const vpSistemaId: Integer): TDataSet;
    function BuscarEtapaGrupo(const vpEtapaGrupoId: Integer): TDataSet;
    function BuscarEtapa(const vpEtapaId: Integer): TDataSet;
    function BuscarUsuarioSistema(const vpUsuarioId: integer): TDataSet;
    function BuscarFeriado(const vpFeriadoId: integer): TDataSet;

    procedure LogarErro(
      const vpTabela: string;
      const vpOperacao: string;
      const vpId: Integer;
      const vpStatusCode: Integer;
      const vpErro: string);

  public
    class function UsaIntegracaoWorkflow(const vpConexaoDb: TConexaoDb): Boolean;
    class function RetornaListaTipoProtocoloRI(const vpConexaoDb: TConexaoDb): string;

    procedure DeletarRegistro(
      const vpTabela: string;
      const vpOperacao: string;
      const vpId: Integer);

    {Geral}

    procedure CadastrarUsuario(const vpUsuarioId: Integer);
    procedure CadastrarSitema(const vpSistemaId: Integer);
    procedure CadastrarEtapaGrupo(const vpEtapaGrupoId: Integer);
    procedure DeletarEtapaGrupo(const vpEtapaGrupoId: Integer);
    procedure CadastrarEtapa(const vpEtapaId: Integer);
    procedure DeletarEtapa(const vpEtapaId: Integer);
    procedure CadastrarUsuarioSistema(const vpUsuarioId: Integer);
    procedure DeletarUsuarioSistema(const vpUsuarioId: Integer; const vpSistemaId: Integer);
    procedure CadastrarFeriado(const vpFeriadoId: Integer);
    procedure DeletarFeriado(const vpFeriadoId: Integer);

    procedure CadastrarUsuarioWorkflow(
      const vpUsuarioId: Integer;
      out vpToken: string;
      out vpValidadeMinutos: Integer);

    function CalcularDataVencidoCliente(
      const vpDataVigencia: TDateTime;
      const vpDiasCorridos: Integer;
      const vpFrequencia: String;
      const vpDuracao: Integer): TDateTime;

    {Registro de Imóvies}

    procedure CadastrarRiProtocolo(
      const vpProtocoloId: Integer;
      const vpProtocoloAndamento: TJSONObject);

     procedure CadastrarRiAndamento(
      const vpProtocoloId: Integer;
      const vpAndamentoId: Integer;
      const vpProtocoloAndamento: TJSONObject);

    procedure DeletarRiAndamento(
      const vpProtocoloId: Integer);

    procedure CadastrarRiTbTipoAndamento(
      const vpTbTipoAndamentoId: Integer;
      const vpTbTipoAndamento: TJSONObject);

    procedure DeletarRiTbTipoAndamento(
      const vpTbTipoAndamentoId: Integer);

    procedure CadastrarRiTbTitulo(
      const vpTbTituloID: Integer;
      const vpTbTitulo: TJSONObject);

    procedure DeletarRiTbTitulo(const vpTbTituloID: Integer);

    {Tabelionato de Notas}

    procedure CadastrarTnAtoTipo(
      const vpTnAtoTipoId: Integer;
      const vpTnAtoTipo: TJSONObject);

    procedure DeletarTnAtoTipo(
      const vpTnAtoTipoId: Integer);

    procedure CadastrarTnAtoTipoAndamento(
      const vpTnAtoTipoAndamentoId: Integer;
      const vpTnAtoTipoAndamento: TJSONObject);

    procedure DeletarTnAtoTipoAndamento(
      const vpTnAtoTipoAndamentoId: Integer);

    procedure CadastrarTnAto(
      const vpAtoId: Integer;
      const vpAtoAndamento: TJSONObject);

    procedure CadastrarTnAtoAndamento(
      const vpAtoId: Integer;
      const vpAtoAndamentoId: Integer;
      const vpAtoAndamento: TJSONObject);

    procedure DeletarTnAtoAndamento(
      const vpAtoAndamentoId: Integer);

    {RTD/PJ}

    procedure CadastrarTdTipoDocumento(
      const vpTdTipoDocumentoId: Integer;
      const vpTdTipoDocumento: TJSONObject);

    procedure DeletarTdTipoDocumento(
      const vpTdTipoDocumentoId: Integer);

    procedure CadastrarTdTipoAndamento(
      const vpTdTipoAndamentoId: Integer;
      const vpTdTipoAndamento: TJSONObject);

    procedure DeletarTdTipoAndamento(
      const vpTdTipoAndamentoId: Integer);

    procedure CadastrarTdDocumento(
      const vpDocumentoId: Integer;
      const vpAndamento: TJSONObject);

    procedure CadastrarTdAndamento(
      const vpDocumentoId: Integer;
      const vpAndamentoId: Integer;
      const vpAndamento: TJSONObject);

    procedure DeletarTdAndamento(
      const vpAndamentoId: Integer);
  end;

implementation

uses
  System.Classes,
  System.NetEncoding,
  Geral.Model.Proxy,
  Geral.Model.Util.Json,
  System.SysUtils,
  System.StrUtils,
  System.DateUtils,
  Geral.Model.Cripto,
  Geral.Model.Sistema,
  System.Math,
  I9Query,
  I9Transaction,
  System.Generics.Collections,
  Geral.Model.Util.Str,
  Geral.Model.Util.Stream;


{ TRestCartoriooBusiness }

function TUtilWorkflowBusiness.BuscarLoginUsuarioPadrao: string;
var
  viValor: string;
  viMensagem: string;
begin
  Result := FUsuario;

  if not FUsuario.IsEmpty then
    Exit;

  viValor := FConexaoDb.BuscarConfigValor(
    CI_COD_SISTEMA_CAIXA,
    'WORKFLOW',
    'PRINCIPAL',
    'LOGIN_USUARIO_PADRAO');

  if viValor.IsEmpty then
  begin
    viMensagem := 'Parâmetro CAIXA/WORKFLOW/PRINCIPAL/LOGIN_USUARIO_PADRAO não configurado.';

    raise Exception.Create(viMensagem);
  end;

  Result := TCriptoBusiness.Descriptografar(viValor);
end;

function TUtilWorkflowBusiness.BuscarBaseUrl: string;
var
  viValor: string;
  viMensagem: string;
begin
  Result := FBaseUrl;

  if not FBaseUrl.IsEmpty then
    Exit;

  viValor := FConexaoDb.BuscarConfigValor(
    CI_COD_SISTEMA_CAIXA,
    'WORKFLOW',
    'PRINCIPAL',
    'BASE_URL_PADRAO');

  if viValor.IsEmpty then
  begin
    viMensagem := 'Parâmetro CAIXA/WORKFLOW/PRINCIPAL/BASE_URL_PADRAO não configurado.';

    raise Exception.Create(viMensagem);
  end;

  Result := TCriptoBusiness.Descriptografar(viValor);

end;

function TUtilWorkflowBusiness.BuscarCartorioId: Integer;
var
  viValor: string;
  viMensagem: string;
begin
  Result := FCartorioId;

  if FCartorioId > 0 then
    Exit;

  viValor := FConexaoDb.BuscarConfigValor(
    CI_COD_SISTEMA_CAIXA,
    'PRINCIPAL',
    'CARTORIO',
    'CODIGO');

  if viValor.IsEmpty then
  begin
    viMensagem := 'Parâmetro CAIXA/PRINCIPAL/CARTORIO/CODIGO não configurado.';

    raise Exception.Create(viMensagem);
  end;

  Result := viValor.ToInteger;

end;

function TUtilWorkflowBusiness.BuscarCnsCartorio: string;
var
  viValor: string;
  viMensagem: string;
begin
  Result := FCns;

  if not FCns.IsEmpty then
    Exit;

  viValor := FConexaoDb.BuscarConfigValor(
    CI_COD_SISTEMA_CAIXA,
    'PRINCIPAL',
    'CARTORIO',
    'CNS');

  if viValor.IsEmpty then
  begin
    viMensagem := 'Parâmetro CAIXA/PRINCIPAL/CARTORIO/CNS não configurado.';

    raise Exception.Create(viMensagem);
  end;

  Result := viValor;
end;

function TUtilWorkflowBusiness.BuscarSenhaUsuarioPadrao: string;
var
  viValor: string;
  viMensagem: string;
begin
  Result := FSenha;

  if not FSenha.IsEmpty then
    Exit;

  viValor := FConexaoDb.BuscarConfigValor(
    CI_COD_SISTEMA_CAIXA,
    'WORKFLOW',
    'PRINCIPAL',
    'SENHA_USUARIO_PADRAO');

  if viValor.IsEmpty then
  begin
    viMensagem := 'Parâmetro CAIXA/WORKFLOW/PRINCIPAL/SENHA_USUARIO_PADRAO não configurado.';

    raise Exception.Create(viMensagem);
  end;

  Result := TCriptoBusiness.Descriptografar(viValor);
end;

function TUtilWorkflowBusiness.GetHttpToken: string;
var
  viRestWorkflow: TRestWorkflow;
  viHttpResponse: THttpResponse;
  viJsonObject: TJSONObject;
  viCns: string;
  viUsuario: string;
  viSenha: string;
  viCartorioId: Integer;
  viBaseUrl: string;
begin
  Result := EmptyStr;

  viRestWorkflow := nil;
  viHttpResponse := nil;
  viJsonObject := nil;

  try
    viCartorioId := BuscarCartorioId;
    viCns := BuscarCnsCartorio;
    viBaseUrl := BuscarBaseUrl;
    viUsuario := BuscarLoginUsuarioPadrao;
    viSenha := BuscarSenhaUsuarioPadrao;

    viRestWorkflow := TRestWorkflow.Create(GetProxy, viBaseUrl, viCartorioId);

    viHttpResponse := viRestWorkflow.AuthLogin(viCns, viUsuario, viSenha);

    if viHttpResponse.HttpCode <> CG_HTTP_CODE_CREATED then
      raise Exception.Create('Erro: Ao tentar logar no sistema');

    viJsonObject := TJSONObject(TJsonUtil.BuscarJsonValue(viHttpResponse.HttpResponse));

    Result := viJsonObject.GetValue<string>('access_token');

  finally
    FreeAndNil(viRestWorkflow);
    FreeAndNil(viHttpResponse);
    FreeAndNil(viJsonObject);
  end;

end;

function TUtilWorkflowBusiness.GetProxy: TProxy;
var
  viProxyBusiness: TProxyBusiness;
begin
  if FLoadProxy then
  begin
    Result := FProxy;
    Exit;
  end;

  viProxyBusiness := nil;
  try
    viProxyBusiness := TProxyBusiness.Create(FConexaoDb);
    Result := viProxyBusiness.BuscarProxy;
    FProxy := Result;
    FLoadProxy := True;
  finally
    FreeAndNil(viProxyBusiness);
  end;

end;

function TUtilWorkflowBusiness.GetToken: string;
begin
  Result := VerificarToken;
end;

function TUtilWorkflowBusiness.VerificarToken: string;
const
  CI_INTERVALO_MINIMO_REQ_TOKEN_MILSEC: Integer = 3000;
  CI_INTERVALO_MAXIMO_REQ_TOKEN_MILSEC: Integer = 5000;

var
  viTransaction: TI9Transaction;
  viQuery: TI9Query;
  viDataValidade: TDateTime;
  viExisteTokenValido: Boolean;
  viTokenCript: string;
  viDataHoraServidor: TDateTime;
  viMensagem: string;
  viAuthToken: string;
  viRandom: Integer;
begin
  viTransaction := nil;
  viQuery := nil;
  Result := EmptyStr;

  try
    viTransaction := TI9Transaction.Create(nil);
    viTransaction.Connection := FConexaoDb.Connection;
    viTransaction.Options.Params.Add('wait');
    viTransaction.StartTransaction;

    try
      viDataHoraServidor := FConexaoDb.BuscarDataHoraBanco;

      viQuery := TI9Query.Create(nil);
      viQuery.Connection := FConexaoDb.Connection;
      viQuery.Transaction := viTransaction;

      viQuery.SQL.Text := {$REGION 'SQL'}
        'SELECT '+
        '    G_TT.API, '+
        '    G_TT.TOKEN, '+
        '    G_TT.DATA_VALIDADE, '+
        '    G_TT.DATA_GERACAO '+
        'FROM '+
        '    G_TRI7_TOKEN G_TT '+
        'WHERE G_TT.API = ''WORKFLOW'' '+
        'ORDER BY '+
        '    G_TT.DATA_VALIDADE FOR UPDATE WITH LOCK ';
      {$ENDREGION}

      viQuery.Open;

      viQuery.First;
      while not viQuery.Eof do
      begin
        viDataValidade := viQuery.FieldByName('DATA_VALIDADE').AsDateTime;

        if viDataValidade > viDataHoraServidor then
          Break;

        viQuery.Delete;
      end;

      viExisteTokenValido := not viQuery.IsEmpty;

      if not viExisteTokenValido then
      begin
        Randomize;
        viRandom := RandomRange(CI_INTERVALO_MINIMO_REQ_TOKEN_MILSEC, CI_INTERVALO_MAXIMO_REQ_TOKEN_MILSEC);
        Sleep(viRandom);

        viAuthToken := GetHttpToken;

        if viAuthToken.Trim.IsEmpty then
        begin
          viMensagem := string.Format(
            'Não foi possível verificar o token Tri7 devido ao motivo abaixo:%s%s',
            [DupeString(sLineBreak, 2),
            'Nenhum Token foi retornado pela aplicação!']);

          raise Exception.Create(viMensagem);
        end;

        viTokenCript := TCriptoBusiness.Criptografar(viAuthToken);
        viDataValidade := IncHour(viDataHoraServidor, 4);

        viQuery.Append;
        viQuery.FieldByName('API').AsString := 'WORKFLOW';
        viQuery.FieldByName('TOKEN').AsString := viTokenCript;
        viQuery.FieldByName('DATA_VALIDADE').AsDateTime := viDataValidade;
        viQuery.FieldByName('DATA_GERACAO').AsDateTime := viDataHoraServidor;
        viQuery.Post;
      end;

      viTokenCript := viQuery.FieldByName('TOKEN').AsString;
      Result := TCriptoBusiness.Descriptografar(viTokenCript);

      viTransaction.Commit;
    except
      viTransaction.Rollback;
      raise;
    end;
  finally
    FreeAndNil(viTransaction);
    FreeAndNil(viQuery);
  end;

end;

constructor TUtilWorkflowBusiness.Create(
  const vpConexaoDb: TConexaoDb);
begin
  FConexaoDb := vpConexaoDb;
  FLoadProxy := False;
  FCartorioId := 0;
  FCns := EmptyStr;
  FBaseUrl := EmptyStr;
  FUsuario := EmptyStr;
  FSenha := EmptyStr;
end;


class function TUtilWorkflowBusiness.FormatarDataHora(
  const vpData: TDateTime): string;
begin
  Result := FormatDateTime('yyyy-mm-dd"T"hh:nn:ss', vpData);
end;

{ TWorkflowBusiness }

function TWorkflowBusiness.BuscarEtapa(const vpEtapaId: Integer): TDataSet;
var
  viSql: string;
  viQuery: TI9Query;
begin
  viSql :=
    'SELECT '+
    '    E.ETAPA_ID, '+
    '    E.ETAPA_GRUPO_ID, '+
    '    E.DESCRICAO, '+
    '    E.SISTEMA_ID, '+
    '    E.ORDEM, '+
    '    E.FREQUENCIA, '+
    '    E.DURACAO, '+
    '    E.SITUACAO, '+
    '    E.IGNORAR_PREVISAO_ENTREGA, '+
    '    E.PRAZO_PROXIMO_VENCIMENTO, '+
    '    E.ESTENDER, '+
    '    E.ESTENDER_FREQUENCIA, '+
    '    E.ESTENDER_DURACAO '+
    'FROM '+
    '    G_ETAPA E '+
    'WHERE '+
    '    E.ETAPA_ID = :P_ETAPA_ID    ';

  viQuery := TI9Query.Create(nil);
  viQuery.Connection := FConexaoDb.Connection;
  Result := viQuery;

  viQuery.SQL.Text := viSql;
  viQuery.ParamByName('P_ETAPA_ID').AsInteger := vpEtapaId;
  viQuery.Open;

end;

function TWorkflowBusiness.BuscarEtapaGrupo(
  const vpEtapaGrupoId: Integer): TDataSet;
var
  viSql: string;
  viQuery: TI9Query;
begin
  viSql :=
    'SELECT '+
    '    EG.ETAPA_GRUPO_ID, '+
    '    EG.DESCRICAO, '+
    '    EG.SISTEMA_ID, '+
    '    EG.SITUACAO, '+
    '    EG.PRAZO_FREQUENCIA, '+
    '    EG.PRAZO_DURACAO '+
    'FROM '+
    '    G_ETAPA_GRUPO EG '+
    'WHERE '+
    '    EG.ETAPA_GRUPO_ID = :P_ETAPA_GRUPO_ID    ';

  viQuery := TI9Query.Create(nil);
  viQuery.Connection := FConexaoDb.Connection;
  Result := viQuery;

  viQuery.SQL.Text := viSql;
  viQuery.ParamByName('P_ETAPA_GRUPO_ID').AsInteger := vpEtapaGrupoId;
  viQuery.Open;

end;

function TWorkflowBusiness.BuscarFeriado(const vpFeriadoId: integer): TDataSet;
var
  viSql: string;
  viQuery: TI9Query;
begin
  viSql := 'SELECT '+
           '   FERIADO_ID, '+
           '   DESCRICAO, '+
           '   SITUACAO, '+
           '   TIPO, '+
           '   DIA, '+
           '   MES, '+
           '   ANO, '+
           '   DIA_FIM, '+
           '   MES_FIM, '+
           '   ANO_FIM '+
           'FROM G_FERIADO '+
           'WHERE '+
           '   FERIADO_ID = :P_FERIADO_ID ';

  viQuery := TI9Query.Create(nil);
  viQuery.Connection := FConexaoDb.Connection;
  Result := viQuery;

  viQuery.SQL.Text := viSql;
  viQuery.ParamByName('P_FERIADO_ID').AsInteger := vpFeriadoId;
  viQuery.Open;

end;

function TWorkflowBusiness.BuscarSistema(const vpSistemaId: Integer): TDataSet;
var
  viSql: string;
  viQuery: TI9Query;
begin
  viSql := 'SELECT '+
           '    S.SISTEMA_ID, '+
           '    S.DESCRICAO, '+
           '    S.PREFIXO, '+
           '    S.WORKFLOW '+
           'FROM '+
           '    G_SISTEMA S '+
           'WHERE '+
           '    S.SISTEMA_ID = :P_SISTEMA_ID ';

  viQuery := TI9Query.Create(nil);
  viQuery.Connection := FConexaoDb.Connection;
  Result := viQuery;

  viQuery.SQL.Text := viSql;
  viQuery.ParamByName('P_SISTEMA_ID').AsInteger := vpSistemaId;
  viQuery.Open;

end;

function TWorkflowBusiness.BuscarUsuario(const vpUsuarioId: integer): TDataSet;
var
  viSql: string;
  viQuery: TI9Query;
begin
  viSql := 'SELECT '+
           '    U.USUARIO_ID, '+
           '    U.NOME_COMPLETO, '+
           '    U.CPF, '+
           '    U.EMAIL, '+
           '    U.SITUACAO, '+
           '    U.LOGIN, '+
           '    U.SENHA, '+
           '    U.FOTO, '+
           '    U.ADMINISTRADOR '+
           'FROM '+
           '    G_USUARIO U '+
           'WHERE '+
           '    U.USUARIO_ID = :P_USUARIO_ID ';

  viQuery := TI9Query.Create(nil);
  viQuery.Connection := FConexaoDb.Connection;
  Result := viQuery;

  viQuery.SQL.Text := viSql;
  viQuery.ParamByName('P_USUARIO_ID').AsInteger := vpUsuarioId;
  viQuery.Open;
end;

function TWorkflowBusiness.BuscarUsuarioSistema(
  const vpUsuarioId: integer): TDataSet;
var
  viSql: string;
  viQuery: TI9Query;
begin
  viSql := 'SELECT '+
           '    US.USUARIO_ID, '+
           '    US.SISTEMA_ID '+
           'FROM '+
           '    G_USUARIO_SISTEMA US '+
           'WHERE '+
           '    US.USUARIO_ID = :P_USUARIO_ID ';

  viQuery := TI9Query.Create(nil);
  viQuery.Connection := FConexaoDb.Connection;
  Result := viQuery;

  viQuery.SQL.Text := viSql;
  viQuery.ParamByName('P_USUARIO_ID').AsInteger := vpUsuarioId;
  viQuery.Open;

end;

procedure TWorkflowBusiness.CadastrarRiAndamento(const vpProtocoloId,
  vpAndamentoId: Integer; const vpProtocoloAndamento: TJSONObject);
var
  viRestWorkflow: TRestWorkflow;
  viHttpResponse: THttpResponse;
  viErro: string;
begin
  viRestWorkflow := nil;
  viHttpResponse := nil;

  try
    if Assigned(vpProtocoloAndamento) and (vpProtocoloAndamento.Count > 0) then
    begin
      viRestWorkflow := TRestWorkflow.Create(GetProxy, BuscarBaseUrl, BuscarCartorioId);

      viHttpResponse := viRestWorkflow.CadastrarRiProtocolo(
        GetToken,
        vpProtocoloId,
        vpProtocoloAndamento);

      if viHttpResponse.HttpCode <> CG_HTTP_CODE_OK then
      begin
        viErro := FormatarErro(viHttpResponse);

        LogarErro(
          'R_ANDAMENTO',
          'I',
          vpAndamentoId,
          viHttpResponse.HttpCode,
          viErro);

        Exit;
      end;
    end;

    DeletarRegistro(
      'R_ANDAMENTO',
      'I',
      vpAndamentoId);

  finally
    FreeAndNil(viRestWorkflow);
    FreeAndNil(viHttpResponse);
  end;

end;

procedure TWorkflowBusiness.CadastrarRiProtocolo(
  const vpProtocoloId: Integer;
  const vpProtocoloAndamento: TJSONObject);
var
  viRestWorkflow: TRestWorkflow;
  viHttpResponse: THttpResponse;
  viErro: string;
begin
  viRestWorkflow := nil;
  viHttpResponse := nil;

  try
    if Assigned(vpProtocoloAndamento) and (vpProtocoloAndamento.Count > 0) then
    begin
      viRestWorkflow := TRestWorkflow.Create(GetProxy, BuscarBaseUrl, BuscarCartorioId);

      viHttpResponse := viRestWorkflow.CadastrarRiProtocolo(
        GetToken,
        vpProtocoloId,
        vpProtocoloAndamento);

      if viHttpResponse.HttpCode <> CG_HTTP_CODE_OK then
      begin
        viErro := FormatarErro(viHttpResponse);

        LogarErro(
          'R_PROTOCOLO',
          'I',
          vpProtocoloId,
          viHttpResponse.HttpCode,
          viErro);

        Exit;
      end;
    end;

    DeletarRegistro(
      'R_PROTOCOLO',
      'I',
      vpProtocoloId);

  finally
    FreeAndNil(viRestWorkflow);
    FreeAndNil(viHttpResponse);
  end;
end;

procedure TWorkflowBusiness.CadastrarEtapa(const vpEtapaId: Integer);
var
  viRestWorkflow: TRestWorkflow;
  viHttpResponse: THttpResponse;
  viEtapa: TDataSet;
  viEtapaId: Integer;
  viGrupoEtapaId: Integer;
  viDescricao: string;
  viSistemaId: Integer;
  viOrdem: Integer;
  viFrequencia: string;
  viDuracao: Integer;
  viSituacao: string;
  viIgnorarPrevisaoEntrega: Boolean;
  viPrazoProximoVencimento: Integer;
  viEstender: Boolean;
  viEstenderFrequencia: string;
  viEstenderDuracao: Integer;
  viErro: string;
begin
  viRestWorkflow := nil;
  viHttpResponse := nil;
  viEtapa := nil;

  try
    viRestWorkflow := TRestWorkflow.Create(GetProxy, BuscarBaseUrl, BuscarCartorioId);

    viEtapa := BuscarEtapa(vpEtapaId);

    if viEtapa.IsEmpty then
      raise Exception.Create('Nenhuma Etapa localizada na base!');

    viEtapaId := viEtapa.FieldByName('ETAPA_ID').AsInteger;
    viGrupoEtapaId := viEtapa.FieldByName('ETAPA_GRUPO_ID').AsInteger;
    viDescricao := viEtapa.FieldByName('DESCRICAO').AsString;
    viSistemaId := viEtapa.FieldByName('SISTEMA_ID').AsInteger;
    viOrdem := viEtapa.FieldByName('ORDEM').AsInteger;
    viFrequencia := viEtapa.FieldByName('FREQUENCIA').AsString;
    viDuracao := viEtapa.FieldByName('DURACAO').AsInteger;
    viSituacao := viEtapa.FieldByName('SITUACAO').AsString;
    viIgnorarPrevisaoEntrega := viEtapa.FieldByName('IGNORAR_PREVISAO_ENTREGA').AsString = 'S';
    viPrazoProximoVencimento := viEtapa.FieldByName('PRAZO_PROXIMO_VENCIMENTO').AsInteger;
    viEstender := viEtapa.FieldByName('ESTENDER').AsString = 'S';
    viEstenderFrequencia := viEtapa.FieldByName('ESTENDER_FREQUENCIA').AsString;
    viEstenderDuracao := viEtapa.FieldByName('ESTENDER_DURACAO').AsInteger;

    viHttpResponse := viRestWorkflow.EtapaCadastro(
      GetToken,
      viEtapaId,
      viGrupoEtapaId,
      viDescricao,
      viSistemaId,
      viOrdem,
      viFrequencia,
      viDuracao,
      viSituacao,
      viIgnorarPrevisaoEntrega,
      viPrazoProximoVencimento,
      viEstender,
      viEstenderFrequencia,
      viEstenderDuracao);

    if viHttpResponse.HttpCode <> CG_HTTP_CODE_OK then
    begin
      viErro := FormatarErro(viHttpResponse);

      LogarErro(
        'G_ETAPA',
        'I',
        vpEtapaId,
        viHttpResponse.HttpCode,
        viErro);

      Exit;
    end;

    DeletarRegistro(
      'G_ETAPA',
      'I',
      vpEtapaId);

  finally
    FreeAndNil(viRestWorkflow);
    FreeAndNil(viHttpResponse);
    FreeAndNil(viEtapa);
  end;

end;

procedure TWorkflowBusiness.CadastrarEtapaGrupo(const vpEtapaGrupoId: Integer);
var
  viRestWorkflow: TRestWorkflow;
  viHttpResponse: THttpResponse;
  viEtapaGrupo: TDataSet;
  viGrupoEtapaId: Integer;
  viDescricao: string;
  viSistemaId: Integer;
  viSituacao: string;
  viErro: string;
  viPrazoFrequencia: string;
  viPrazoDuracao: Integer;
begin
  viRestWorkflow := nil;
  viHttpResponse := nil;
  viEtapaGrupo := nil;

  try
    viRestWorkflow := TRestWorkflow.Create(GetProxy, BuscarBaseUrl, BuscarCartorioId);

    viEtapaGrupo := BuscarEtapaGrupo(vpEtapaGrupoId);

    if viEtapaGrupo.IsEmpty then
      raise Exception.Create('Nenhuma Etapa Grupo localizada na base!');

    viGrupoEtapaId := viEtapaGrupo.FieldByName('ETAPA_GRUPO_ID').AsInteger;
    viDescricao := viEtapaGrupo.FieldByName('DESCRICAO').AsString;
    viSistemaId := viEtapaGrupo.FieldByName('SISTEMA_ID').AsInteger;
    viSituacao := viEtapaGrupo.FieldByName('SITUACAO').AsString;
    viPrazoFrequencia := viEtapaGrupo.FieldByName('PRAZO_FREQUENCIA').AsString;
    viPrazoDuracao := viEtapaGrupo.FieldByName('PRAZO_DURACAO').AsInteger;

    viHttpResponse := viRestWorkflow.EtapaGrupoCadastro(
      GetToken,
      viGrupoEtapaId,
      viDescricao,
      viSistemaId,
      viSituacao,
      viPrazoFrequencia,
      viPrazoDuracao);

    if viHttpResponse.HttpCode <> CG_HTTP_CODE_OK then
    begin
      viErro := FormatarErro(viHttpResponse);

      LogarErro(
        'G_ETAPA_GRUPO',
        'I',
        viGrupoEtapaId,
        viHttpResponse.HttpCode,
        viErro);

      raise Exception.Create(viErro);
    end;

    DeletarRegistro(
      'G_ETAPA_GRUPO',
      'I',
      viGrupoEtapaId);

  finally
    FreeAndNil(viRestWorkflow);
    FreeAndNil(viHttpResponse);
    FreeAndNil(viEtapaGrupo);
  end;

end;

procedure TWorkflowBusiness.CadastrarFeriado(const vpFeriadoId: Integer);
var
  viRestWorkflow: TRestWorkflow;
  viHttpResponse: THttpResponse;
  viFeriado: TDataSet;
  viDescricao: string;
  viSituacao: string;
  viTipo: string;
  viDia: Integer;
  viMes: Integer;
  viAno: Integer;
  viDiaFim: Integer;
  viMesFim: Integer;
  viAnoFim: Integer;
  viErro: string;
begin
  viRestWorkflow := nil;
  viHttpResponse := nil;
  viFeriado := nil;

  try
    viRestWorkflow := TRestWorkflow.Create(GetProxy, BuscarBaseUrl, BuscarCartorioId);

    viFeriado := BuscarFeriado(vpFeriadoId);

    if viFeriado.IsEmpty then
      raise Exception.Create('Nenhum feriado localizado na base!');

    viDescricao := viFeriado.FieldByName('DESCRICAO').AsString;
    viSituacao := viFeriado.FieldByName('SITUACAO').AsString;
    viTipo := viFeriado.FieldByName('TIPO').AsString;
    viDia := viFeriado.FieldByName('DIA').AsInteger;
    viMes := viFeriado.FieldByName('MES').AsInteger;
    viAno := viFeriado.FieldByName('ANO').AsInteger;
    viDiaFim := viFeriado.FieldByName('DIA_FIM').AsInteger;
    viMesFim := viFeriado.FieldByName('MES_FIM').AsInteger;
    viAnoFim := viFeriado.FieldByName('ANO_FIM').AsInteger;

    viHttpResponse := viRestWorkflow.FeriadoCadastro(
      GetToken,
      vpFeriadoId,
      viDescricao,
      viSituacao,
      viTipo,
      viDia,
      viMes,
      viAno,
      viDiaFim,
      viMesFim,
      viAnoFim);

    if viHttpResponse.HttpCode <> CG_HTTP_CODE_OK then
    begin
      viErro := FormatarErro(viHttpResponse);

      LogarErro(
        'G_FERIADO',
        'I',
        vpFeriadoId,
        viHttpResponse.HttpCode,
        viErro);

      Exit;
    end;

    DeletarRegistro(
      'G_FERIADO',
      'I',
      vpFeriadoId);

  finally
    FreeAndNil(viRestWorkflow);
    FreeAndNil(viHttpResponse);
    FreeAndNil(viFeriado);
  end;

end;

procedure TWorkflowBusiness.CadastrarSitema(const vpSistemaId: Integer);
var
  viRestWorkflow: TRestWorkflow;
  viHttpResponse: THttpResponse;
  viSistema: TDataSet;
  viSistemaId: Integer;
  viDescricao: string;
  viPrefixo: string;
  viWorkflow: Boolean;
  viErro: string;
begin
  viRestWorkflow := nil;
  viHttpResponse := nil;
  viSistema := nil;

  try
    viRestWorkflow := TRestWorkflow.Create(GetProxy, BuscarBaseUrl, BuscarCartorioId);

    viSistema := BuscarSistema(vpSistemaId);

    if viSistema.IsEmpty then
      raise Exception.Create('Nenhum Sistema localizado na base!');

    viSistemaId := viSistema.FieldByName('SISTEMA_ID').AsInteger;
    viDescricao := TUtilString.MaiusculoMinusculo(viSistema.FieldByName('DESCRICAO').AsString);
    viPrefixo := viSistema.FieldByName('PREFIXO').AsString;
    viWorkflow := viSistema.FieldByName('WORKFLOW').AsString = 'S';

    viHttpResponse := viRestWorkflow.SistemaCadastro(
      GetToken,
      viSistemaId,
      viDescricao,
      viPrefixo,
      viWorkflow);

    if viHttpResponse.HttpCode <> CG_HTTP_CODE_OK then
    begin
      viErro := FormatarErro(viHttpResponse);

      LogarErro(
        'G_SISTEMA',
        'I',
        vpSistemaId,
        viHttpResponse.HttpCode,
        viErro);

      Exit;
    end;

    DeletarRegistro(
      'G_SISTEMA',
      'I',
      vpSistemaId);

  finally
    FreeAndNil(viRestWorkflow);
    FreeAndNil(viHttpResponse);
    FreeAndNil(viSistema);
  end;

end;

procedure TWorkflowBusiness.CadastrarTdAndamento(const vpDocumentoId,
  vpAndamentoId: Integer; const vpAndamento: TJSONObject);
var
  viRestWorkflow: TRestWorkflow;
  viHttpResponse: THttpResponse;
  viErro: string;
begin
  viRestWorkflow := nil;
  viHttpResponse := nil;

  try
    if Assigned(vpAndamento) and (vpAndamento.Count > 0) then
    begin
      viRestWorkflow := TRestWorkflow.Create(GetProxy, BuscarBaseUrl, BuscarCartorioId);

      viHttpResponse := viRestWorkflow.CadastrarTdDocumento(
        GetToken,
        vpDocumentoId,
        vpAndamento);

      if viHttpResponse.HttpCode <> CG_HTTP_CODE_OK then
      begin
        viErro := FormatarErro(viHttpResponse);

        LogarErro(
          'D_ANDAMENTO',
          'I',
          vpAndamentoId,
          viHttpResponse.HttpCode,
          viErro);

        Exit;
      end;
    end;

    DeletarRegistro(
      'D_ANDAMENTO',
      'I',
      vpAndamentoId);

  finally
    FreeAndNil(viRestWorkflow);
    FreeAndNil(viHttpResponse);
  end;

end;

procedure TWorkflowBusiness.CadastrarTdDocumento(const vpDocumentoId: Integer;
  const vpAndamento: TJSONObject);
var
  viRestWorkflow: TRestWorkflow;
  viHttpResponse: THttpResponse;
  viErro: string;
begin
  viRestWorkflow := nil;
  viHttpResponse := nil;

  try
    if Assigned(vpAndamento) and (vpAndamento.Count > 0) then
    begin
      viRestWorkflow := TRestWorkflow.Create(GetProxy, BuscarBaseUrl, BuscarCartorioId);

      viHttpResponse := viRestWorkflow.CadastrarTdDocumento(
        GetToken,
        vpDocumentoId,
        vpAndamento);

      if viHttpResponse.HttpCode <> CG_HTTP_CODE_OK then
      begin
        viErro := FormatarErro(viHttpResponse);

        LogarErro(
          'D_DOCUMENTO',
          'I',
          vpDocumentoId,
          viHttpResponse.HttpCode,
          viErro);

        Exit;
      end;
    end;

    DeletarRegistro(
      'D_DOCUMENTO',
      'I',
      vpDocumentoId);

  finally
    FreeAndNil(viRestWorkflow);
    FreeAndNil(viHttpResponse);
  end;

end;

procedure TWorkflowBusiness.CadastrarTdTipoAndamento(
  const vpTdTipoAndamentoId: Integer; const vpTdTipoAndamento: TJSONObject);
var
  viRestWorkflow: TRestWorkflow;
  viHttpResponse: THttpResponse;
  viErro: string;
begin
  viRestWorkflow := nil;
  viHttpResponse := nil;

  try
    if Assigned(vpTdTipoAndamento) and (vpTdTipoAndamento.Count > 0) then
    begin
      viRestWorkflow := TRestWorkflow.Create(GetProxy, BuscarBaseUrl, BuscarCartorioId);

      viHttpResponse := viRestWorkflow.CadastrarTdTipoAndamento(
        GetToken,
        vpTdTipoAndamentoId,
        vpTdTipoAndamento);

      if viHttpResponse.HttpCode <> CG_HTTP_CODE_OK then
      begin
        viErro := FormatarErro(viHttpResponse);

        LogarErro(
          'D_TB_TIPO_ANDAMENTO',
          'I',
          vpTdTipoAndamentoId,
          viHttpResponse.HttpCode,
          viErro);

        Exit;
      end;
    end;

    DeletarRegistro(
      'D_TB_TIPO_ANDAMENTO',
      'I',
      vpTdTipoAndamentoId);

  finally
    FreeAndNil(viRestWorkflow);
    FreeAndNil(viHttpResponse);
  end;

end;

procedure TWorkflowBusiness.CadastrarTdTipoDocumento(
  const vpTdTipoDocumentoId: Integer; const vpTdTipoDocumento: TJSONObject);
var
  viRestWorkflow: TRestWorkflow;
  viHttpResponse: THttpResponse;
  viErro: string;
begin
  viRestWorkflow := nil;
  viHttpResponse := nil;

  try
    if Assigned(vpTdTipoDocumento) and (vpTdTipoDocumento.Count > 0) then
    begin
      viRestWorkflow := TRestWorkflow.Create(GetProxy, BuscarBaseUrl, BuscarCartorioId);

      viHttpResponse := viRestWorkflow.CadastrarTdTipoDocumento(
        GetToken,
        vpTdTipoDocumentoId,
        vpTdTipoDocumento);

      if viHttpResponse.HttpCode <> CG_HTTP_CODE_OK then
      begin
        viErro := FormatarErro(viHttpResponse);

        LogarErro(
          'D_TIPO_DOCUMENTO',
          'I',
          vpTdTipoDocumentoId,
          viHttpResponse.HttpCode,
          viErro);

        Exit;
      end;
    end;

    DeletarRegistro(
      'D_TIPO_DOCUMENTO',
      'I',
      vpTdTipoDocumentoId);

  finally
    FreeAndNil(viRestWorkflow);
    FreeAndNil(viHttpResponse);
  end;

end;

procedure TWorkflowBusiness.CadastrarTnAto(
  const vpAtoId: Integer;
  const vpAtoAndamento: TJSONObject);
var
  viRestWorkflow: TRestWorkflow;
  viHttpResponse: THttpResponse;
  viErro: string;
begin
  viRestWorkflow := nil;
  viHttpResponse := nil;

  try
    if Assigned(vpAtoAndamento) and (vpAtoAndamento.Count > 0) then
    begin
      viRestWorkflow := TRestWorkflow.Create(GetProxy, BuscarBaseUrl, BuscarCartorioId);

      viHttpResponse := viRestWorkflow.CadastrarTnAto(
        GetToken,
        vpAtoId,
        vpAtoAndamento);

      if viHttpResponse.HttpCode <> CG_HTTP_CODE_OK then
      begin
        viErro := FormatarErro(viHttpResponse);

        LogarErro(
          'T_ATO',
          'I',
          vpAtoId,
          viHttpResponse.HttpCode,
          viErro);

        Exit;
      end;
    end;

    DeletarRegistro(
      'T_ATO',
      'I',
      vpAtoId);

  finally
    FreeAndNil(viRestWorkflow);
    FreeAndNil(viHttpResponse);
  end;

end;


procedure TWorkflowBusiness.CadastrarTnAtoAndamento(
  const vpAtoId: Integer;
  const vpAtoAndamentoId: Integer;
  const vpAtoAndamento: TJSONObject);
var
  viRestWorkflow: TRestWorkflow;
  viHttpResponse: THttpResponse;
  viErro: string;
begin
  viRestWorkflow := nil;
  viHttpResponse := nil;

  try
    if Assigned(vpAtoAndamento) and (vpAtoAndamento.Count > 0) then
    begin
      viRestWorkflow := TRestWorkflow.Create(GetProxy, BuscarBaseUrl, BuscarCartorioId);

      viHttpResponse := viRestWorkflow.CadastrarTnAto(
        GetToken,
        vpAtoId,
        vpAtoAndamento);

      if viHttpResponse.HttpCode <> CG_HTTP_CODE_OK then
      begin
        viErro := FormatarErro(viHttpResponse);

        LogarErro(
          'T_ATO_ANDAMENTO',
          'I',
          vpAtoAndamentoId,
          viHttpResponse.HttpCode,
          viErro);

        Exit;
      end;
    end;

    DeletarRegistro(
      'T_ATO_ANDAMENTO',
      'I',
      vpAtoAndamentoId);

  finally
    FreeAndNil(viRestWorkflow);
    FreeAndNil(viHttpResponse);
  end;

end;

procedure TWorkflowBusiness.CadastrarTnAtoTipo(const vpTnAtoTipoId: Integer;
  const vpTnAtoTipo: TJSONObject);
var
  viRestWorkflow: TRestWorkflow;
  viHttpResponse: THttpResponse;
  viErro: string;
begin
  viRestWorkflow := nil;
  viHttpResponse := nil;

  try
    if Assigned(vpTnAtoTipo) and (vpTnAtoTipo.Count > 0) then
    begin
      viRestWorkflow := TRestWorkflow.Create(GetProxy, BuscarBaseUrl, BuscarCartorioId);

      viHttpResponse := viRestWorkflow.CadastrarTnAtoTipo(
        GetToken,
        vpTnAtoTipoId,
        vpTnAtoTipo);

      if viHttpResponse.HttpCode <> CG_HTTP_CODE_OK then
      begin
        viErro := FormatarErro(viHttpResponse);

        LogarErro(
          'T_ATO_TIPO',
          'I',
          vpTnAtoTipoId,
          viHttpResponse.HttpCode,
          viErro);

        Exit;
      end;
    end;

    DeletarRegistro(
      'T_ATO_TIPO',
      'I',
      vpTnAtoTipoId);

  finally
    FreeAndNil(viRestWorkflow);
    FreeAndNil(viHttpResponse);
  end;

end;

procedure TWorkflowBusiness.CadastrarTnAtoTipoAndamento(
  const vpTnAtoTipoAndamentoId: Integer;
  const vpTnAtoTipoAndamento: TJSONObject);
var
  viRestWorkflow: TRestWorkflow;
  viHttpResponse: THttpResponse;
  viErro: string;
begin
  viRestWorkflow := nil;
  viHttpResponse := nil;

  try
    if Assigned(vpTnAtoTipoAndamento) and (vpTnAtoTipoAndamento.Count > 0) then
    begin
      viRestWorkflow := TRestWorkflow.Create(GetProxy, BuscarBaseUrl, BuscarCartorioId);

      viHttpResponse := viRestWorkflow.CadastrarTnAtoTipoAndamento(
        GetToken,
        vpTnAtoTipoAndamentoId,
        vpTnAtoTipoAndamento);

      if viHttpResponse.HttpCode <> CG_HTTP_CODE_OK then
      begin
        viErro := FormatarErro(viHttpResponse);

        LogarErro(
          'T_TB_ANDAMENTOSERVICO',
          'I',
          vpTnAtoTipoAndamentoId,
          viHttpResponse.HttpCode,
          viErro);

        Exit;
      end;
    end;

    DeletarRegistro(
      'T_TB_ANDAMENTOSERVICO',
      'I',
      vpTnAtoTipoAndamentoId);

  finally
    FreeAndNil(viRestWorkflow);
    FreeAndNil(viHttpResponse);
  end;

end;

procedure TWorkflowBusiness.CadastrarRiTbTipoAndamento(
  const vpTbTipoAndamentoId: Integer;
  const vpTbTipoAndamento: TJSONObject);
var
  viRestWorkflow: TRestWorkflow;
  viHttpResponse: THttpResponse;
  viErro: string;
begin
  viRestWorkflow := nil;
  viHttpResponse := nil;

  try
    if Assigned(vpTbTipoAndamento) and (vpTbTipoAndamento.Count > 0) then
    begin
      viRestWorkflow := TRestWorkflow.Create(GetProxy, BuscarBaseUrl, BuscarCartorioId);

      viHttpResponse := viRestWorkflow.CadastrarRiTbTipoAndamento(
        GetToken,
        vpTbTipoAndamentoId,
        vpTbTipoAndamento);

      if viHttpResponse.HttpCode <> CG_HTTP_CODE_OK then
      begin
        viErro := FormatarErro(viHttpResponse);

        LogarErro(
          'R_TB_TIPO_ANDAMENTO',
          'I',
          vpTbTipoAndamentoId,
          viHttpResponse.HttpCode,
          viErro);

        Exit;
      end;
    end;

    DeletarRegistro(
      'R_TB_TIPO_ANDAMENTO',
      'I',
      vpTbTipoAndamentoId);

  finally
    FreeAndNil(viRestWorkflow);
    FreeAndNil(viHttpResponse);
  end;
end;

procedure TWorkflowBusiness.CadastrarRiTbTitulo(const vpTbTituloID: Integer;
  const vpTbTitulo: TJSONObject);
var
  viRestWorkflow: TRestWorkflow;
  viHttpResponse: THttpResponse;
  viErro: string;
begin
  viRestWorkflow := nil;
  viHttpResponse := nil;

  try
    if Assigned(vpTbTitulo) and (vpTbTitulo.Count > 0) then
    begin
      viRestWorkflow := TRestWorkflow.Create(GetProxy, BuscarBaseUrl, BuscarCartorioId);

      viHttpResponse := viRestWorkflow.CadastrarRiTbTitulo(
        GetToken,
        vpTbTituloID,
        vpTbTitulo);

      if viHttpResponse.HttpCode <> CG_HTTP_CODE_OK then
      begin
        viErro := FormatarErro(viHttpResponse);

        LogarErro(
          'R_TB_TITULO',
          'I',
          vpTbTituloID,
          viHttpResponse.HttpCode,
          viErro);

        Exit;
      end;
    end;

    DeletarRegistro(
      'R_TB_TITULO',
      'I',
      vpTbTituloID);

  finally
    FreeAndNil(viRestWorkflow);
    FreeAndNil(viHttpResponse);
  end;

end;

procedure TWorkflowBusiness.CadastrarUsuario(
  const vpUsuarioId: Integer);
var
  viRestWorkflow: TRestWorkflow;
  viHttpResponse: THttpResponse;
  viUsuario: TDataSet;
  viNome: string;
  viCpf: string;
  viEmail: string;
  viSituacao: string;
  viLogin: string;
  viSenha: string;
  viFoto: string;
  viAdministrador: Boolean;
  viFotoStream: TStream;
  viErro: string;
begin
  viRestWorkflow := nil;
  viHttpResponse := nil;
  viUsuario := nil;

  try
    viRestWorkflow := TRestWorkflow.Create(GetProxy, BuscarBaseUrl, BuscarCartorioId);

    viUsuario := BuscarUsuario(vpUsuarioId);

    if viUsuario.IsEmpty then
      raise Exception.Create('Usuário não localizado na base!');

    viNome := TUtilString.MaiusculoMinusculo(viUsuario.FieldByName('NOME_COMPLETO').AsString);
    viCpf := TUtilString.RetornaNumerico(viUsuario.FieldByName('CPF').AsString);

    viEmail := viUsuario.FieldByName('EMAIL').AsString;
    if not TUtilString.ValidarEmail(viEmail) then
      viEmail := EmptyStr;

    viSituacao := viUsuario.FieldByName('SITUACAO').AsString;
    viLogin := viUsuario.FieldByName('LOGIN').AsString;
    viSenha := viUsuario.FieldByName('SENHA').AsString;
    viAdministrador := viUsuario.FieldByName('ADMINISTRADOR').AsString = 'S';

    viFoto := EmptyStr;
    if not viUsuario.FieldByName('FOTO').IsNull then
    begin
      viFotoStream := nil;
      try
        viFotoStream := TStreamUtil.ByteArrayToStream(viUsuario.FieldByName('FOTO').AsBytes);
        if Assigned(viFotoStream) then
        begin
          TStreamUtil.ResizeStreamJpeg(viFotoStream, 64, 64);
          viFoto := TNetEncoding.Base64.EncodeBytesToString(TMemoryStream(viFotoStream).Memory, viFotoStream.Size);
        end;
      finally
        FreeAndNil(viFotoStream);
      end;
    end;

    viHttpResponse := viRestWorkflow.UsuarioCadastro(
      GetToken,
      vpUsuarioId,
      viNome,
      viCpf,
      viEmail,
      viSituacao,
      viLogin,
      viSenha,
      viFoto,
      viAdministrador);

    if viHttpResponse.HttpCode <> CG_HTTP_CODE_OK then
    begin
      viErro := FormatarErro(viHttpResponse);

      LogarErro(
        'G_USUARIO',
        'I',
        vpUsuarioId,
        viHttpResponse.HttpCode,
        viErro);

      Exit;
    end;

    DeletarRegistro(
      'G_USUARIO',
      'I',
      vpUsuarioId);


  finally
    FreeAndNil(viRestWorkflow);
    FreeAndNil(viHttpResponse);
    FreeAndNil(viUsuario);
  end;
end;

procedure TWorkflowBusiness.CadastrarUsuarioSistema(const vpUsuarioId: Integer);
var
  viRestWorkflow: TRestWorkflow;
  viHttpResponse: THttpResponse;
  viUsuarioSistema: TDataSet;
  viUsuarioId: Integer;
  viSistemaId: Integer;
begin
  viRestWorkflow := nil;
  viHttpResponse := nil;
  viUsuarioSistema := nil;

  try
    viRestWorkflow := TRestWorkflow.Create(GetProxy, BuscarBaseUrl, BuscarCartorioId);

    viUsuarioSistema := BuscarUsuarioSistema(vpUsuarioId);

    if viUsuarioSistema.IsEmpty then
      Exit;

    viUsuarioSistema.First;
    while not viUsuarioSistema.Eof do
    begin
      viUsuarioId := viUsuarioSistema.FieldByName('USUARIO_ID').AsInteger;
      viSistemaId := viUsuarioSistema.FieldByName('SISTEMA_ID').AsInteger;

      viHttpResponse := viRestWorkflow.UsuarioSistemaCadastro(
        GetToken,
        viUsuarioId,
        viSistemaId);

      if viHttpResponse.HttpCode <> CG_HTTP_CODE_OK then
        raise Exception.Create(FormatarErro(viHttpResponse));

      viUsuarioSistema.Next;
    end;

  finally
    FreeAndNil(viRestWorkflow);
    FreeAndNil(viHttpResponse);
    FreeAndNil(viUsuarioSistema);
  end;

end;

procedure TWorkflowBusiness.CadastrarUsuarioWorkflow(const vpUsuarioId: Integer;
  out vpToken: string; out vpValidadeMinutos: Integer);
var
  viRestWorkflow: TRestWorkflow;
  viHttpResponse: THttpResponse;
  viJsonObject: TJSONObject;
begin
  viRestWorkflow := nil;
  viHttpResponse := nil;
  viJsonObject   := nil;

  try
    viRestWorkflow := TRestWorkflow.Create(GetProxy, BuscarBaseUrl, BuscarCartorioId);

    viHttpResponse := viRestWorkflow.CadastrarUsuarioWorkflow(
      GetToken,
      vpUsuarioId);

    if viHttpResponse.HttpCode <> CG_HTTP_CODE_CREATED then
      raise Exception.Create(FormatarErro(viHttpResponse));

    viJsonObject := TJSONObject(TJsonUtil.BuscarJsonValue(viHttpResponse.HttpResponse));

    vpToken := viJsonObject.GetValue<string>('token');
    vpValidadeMinutos := viJsonObject.GetValue<integer>('validade_minutos');

  finally
    FreeAndNil(viRestWorkflow);
    FreeAndNil(viHttpResponse);
    FreeAndNil(viJsonObject);
  end;

end;

function TWorkflowBusiness.CalcularDataVencidoCliente(
  const vpDataVigencia: TDateTime; const vpDiasCorridos: Integer;
  const vpFrequencia: String; const vpDuracao: Integer): TDateTime;
var
  viRestWorkflow: TRestWorkflow;
  viHttpResponse: THttpResponse;
  viJsonObject: TJSONObject;
  viDataUTC: string;
begin
  viRestWorkflow := nil;
  viHttpResponse := nil;
  viJsonObject   := nil;

  try
    viRestWorkflow := TRestWorkflow.Create(GetProxy, BuscarBaseUrl, BuscarCartorioId);

    viHttpResponse := viRestWorkflow.CalcularDataVencidoCliente(
      GetToken,
      vpDataVigencia,
      vpDiasCorridos,
      vpFrequencia,
      vpDuracao);

    if viHttpResponse.HttpCode <> CG_HTTP_CODE_OK then
      raise Exception.Create(FormatarErro(viHttpResponse));

    viJsonObject := TJSONObject(TJsonUtil.BuscarJsonValue(viHttpResponse.HttpResponse));

    viDataUTC := viJsonObject.GetValue<string>('data_vencido_cliente');

    Result := System.DateUtils.ISO8601ToDate(viDataUTC, False);

  finally
    FreeAndNil(viRestWorkflow);
    FreeAndNil(viHttpResponse);
    FreeAndNil(viJsonObject);
  end;

end;

procedure TWorkflowBusiness.DeletarRiAndamento(const vpProtocoloId: Integer);
var
  viRestWorkflow: TRestWorkflow;
  viHttpResponse: THttpResponse;
  viErro: string;
begin
  viRestWorkflow := nil;
  viHttpResponse := nil;

  try
    viRestWorkflow := TRestWorkflow.Create(GetProxy, BuscarBaseUrl, BuscarCartorioId);

    viHttpResponse := viRestWorkflow.DeletarRiAndamento(
      GetToken,
      vpProtocoloId);

    if viHttpResponse.HttpCode <> CG_HTTP_CODE_NO_CONTENT then
    begin
      viErro := FormatarErro(viHttpResponse);

      LogarErro(
        'R_ANDAMENTO',
        'D',
        vpProtocoloId,
        viHttpResponse.HttpCode,
        viErro);

      Exit;
    end;

    DeletarRegistro(
      'R_ANDAMENTO',
      'D',
      vpProtocoloId);

  finally
    FreeAndNil(viRestWorkflow);
    FreeAndNil(viHttpResponse);
  end;
end;

procedure TWorkflowBusiness.DeletarEtapa(const vpEtapaId: Integer);
var
  viRestWorkflow: TRestWorkflow;
  viHttpResponse: THttpResponse;
  viErro: string;
begin
  viRestWorkflow := nil;
  viHttpResponse := nil;

  try
    viRestWorkflow := TRestWorkflow.Create(GetProxy, BuscarBaseUrl, BuscarCartorioId);

    viHttpResponse := viRestWorkflow.EtapaDelete(
      GetToken,
      vpEtapaId);

    if viHttpResponse.HttpCode <> CG_HTTP_CODE_NO_CONTENT then
    begin
      viErro := FormatarErro(viHttpResponse);

      LogarErro(
        'G_ETAPA',
        'D',
        vpEtapaId,
        viHttpResponse.HttpCode,
        viErro);

      Exit;
    end;

    DeletarRegistro(
      'G_ETAPA',
      'D',
      vpEtapaId);

  finally
    FreeAndNil(viRestWorkflow);
    FreeAndNil(viHttpResponse);
  end;

end;

procedure TWorkflowBusiness.DeletarEtapaGrupo(const vpEtapaGrupoId: Integer);
var
  viRestWorkflow: TRestWorkflow;
  viHttpResponse: THttpResponse;
  viErro: string;
begin
  viRestWorkflow := nil;
  viHttpResponse := nil;

  try
    viRestWorkflow := TRestWorkflow.Create(GetProxy, BuscarBaseUrl, BuscarCartorioId);

    viHttpResponse := viRestWorkflow.EtapaGrupoDelete(
      GetToken,
      vpEtapaGrupoId);

    if viHttpResponse.HttpCode <> CG_HTTP_CODE_NO_CONTENT then
    begin
      viErro := FormatarErro(viHttpResponse);

      LogarErro(
        'G_ETAPA_GRUPO',
        'D',
        vpEtapaGrupoId,
        viHttpResponse.HttpCode,
        viErro);

      raise Exception.Create(viErro);
    end;

    DeletarRegistro(
      'G_ETAPA_GRUPO',
      'D',
      vpEtapaGrupoId);

  finally
    FreeAndNil(viRestWorkflow);
    FreeAndNil(viHttpResponse);
  end;

end;

procedure TWorkflowBusiness.DeletarFeriado(const vpFeriadoId: Integer);
var
  viRestWorkflow: TRestWorkflow;
  viHttpResponse: THttpResponse;
  viErro: string;
begin
  viRestWorkflow := nil;
  viHttpResponse := nil;

  try
    viRestWorkflow := TRestWorkflow.Create(GetProxy, BuscarBaseUrl, BuscarCartorioId);

    viHttpResponse := viRestWorkflow.FeriadoDelete(
      GetToken,
      vpFeriadoId);

    if viHttpResponse.HttpCode <> CG_HTTP_CODE_NO_CONTENT then
    begin
      viErro := FormatarErro(viHttpResponse);

      LogarErro(
        'G_FERIADO',
        'D',
        vpFeriadoId,
        viHttpResponse.HttpCode,
        viErro);

      Exit;
    end;

    DeletarRegistro(
      'G_FERIADO',
      'D',
      vpFeriadoId);

  finally
    FreeAndNil(viRestWorkflow);
    FreeAndNil(viHttpResponse);
  end;

end;

procedure TWorkflowBusiness.DeletarRegistro(
  const vpTabela: string;
  const vpOperacao: string;
  const vpId: Integer);
var
  viQuery: TI9Query;
begin
  viQuery := nil;
  try
    viQuery := TI9Query.Create(nil);
    viQuery.Connection := FConexaoDb.Connection;
    viQuery.SQL.Text := {$REGION 'SQL'}
      'DELETE '+
      'FROM '+
      '    G_WORKFLOW G_W '+
      'WHERE '+
      '    G_W.TABELA = :P_TABELA AND '+
      '    G_W.OPERACAO = :P_OPERACAO AND '+
      '    G_W.ID = :P_ID    ';
    {$ENDREGION}

    viQuery.ParamByName('P_TABELA').AsString := vpTabela;
    viQuery.ParamByName('P_OPERACAO').AsString := vpOperacao;
    viQuery.ParamByName('P_ID').AsInteger := vpId;
    viQuery.ExecSQL;

  finally
    FreeAndNil(viQuery);
  end;
end;

procedure TWorkflowBusiness.DeletarRiTbTipoAndamento(const vpTbTipoAndamentoId: Integer);
var
  viRestWorkflow: TRestWorkflow;
  viHttpResponse: THttpResponse;
  viErro: string;
begin
  viRestWorkflow := nil;
  viHttpResponse := nil;

  try
    viRestWorkflow := TRestWorkflow.Create(GetProxy, BuscarBaseUrl, BuscarCartorioId);

    viHttpResponse := viRestWorkflow.DeletarRiTbTipoAndamento(
      GetToken,
      vpTbTipoAndamentoId);

    if viHttpResponse.HttpCode <> CG_HTTP_CODE_NO_CONTENT then
    begin
      viErro := FormatarErro(viHttpResponse);

      LogarErro(
        'R_TB_TIPO_ANDAMENTO',
        'D',
        vpTbTipoAndamentoId,
        viHttpResponse.HttpCode,
        viErro);

      Exit;
    end;

    DeletarRegistro(
      'R_TB_TIPO_ANDAMENTO',
      'D',
      vpTbTipoAndamentoId);

  finally
    FreeAndNil(viRestWorkflow);
    FreeAndNil(viHttpResponse);
  end;
end;

procedure TWorkflowBusiness.DeletarRiTbTitulo(const vpTbTituloID: Integer);
var
  viRestWorkflow: TRestWorkflow;
  viHttpResponse: THttpResponse;
  viErro: string;
begin
  viRestWorkflow := nil;
  viHttpResponse := nil;

  try
    viRestWorkflow := TRestWorkflow.Create(GetProxy, BuscarBaseUrl, BuscarCartorioId);

    viHttpResponse := viRestWorkflow.DeletarRiTbTitulo(
      GetToken,
      vpTbTituloID);

    if viHttpResponse.HttpCode <> CG_HTTP_CODE_NO_CONTENT then
    begin
      viErro := FormatarErro(viHttpResponse);

      LogarErro(
        'R_TB_TITULO',
        'D',
        vpTbTituloID,
        viHttpResponse.HttpCode,
        viErro);

      Exit;
    end;

    DeletarRegistro(
      'R_TB_TITULO',
      'D',
      vpTbTituloID);

  finally
    FreeAndNil(viRestWorkflow);
    FreeAndNil(viHttpResponse);
  end;

end;

procedure TWorkflowBusiness.DeletarTdAndamento(const vpAndamentoId: Integer);
var
  viRestWorkflow: TRestWorkflow;
  viHttpResponse: THttpResponse;
  viErro: string;
begin
  viRestWorkflow := nil;
  viHttpResponse := nil;

  try
    viRestWorkflow := TRestWorkflow.Create(GetProxy, BuscarBaseUrl, BuscarCartorioId);

    viHttpResponse := viRestWorkflow.DeletarTdAndamento(
      GetToken,
      vpAndamentoId);

    if viHttpResponse.HttpCode <> CG_HTTP_CODE_NO_CONTENT then
    begin
      viErro := FormatarErro(viHttpResponse);

      LogarErro(
        'D_ANDAMENTO',
        'D',
        vpAndamentoId,
        viHttpResponse.HttpCode,
        viErro);

      Exit;
    end;

    DeletarRegistro(
      'D_ANDAMENTO',
      'D',
      vpAndamentoId);

  finally
    FreeAndNil(viRestWorkflow);
    FreeAndNil(viHttpResponse);
  end;

end;

procedure TWorkflowBusiness.DeletarTdTipoAndamento(
  const vpTdTipoAndamentoId: Integer);
var
  viRestWorkflow: TRestWorkflow;
  viHttpResponse: THttpResponse;
  viErro: string;
begin
  viRestWorkflow := nil;
  viHttpResponse := nil;

  try
    viRestWorkflow := TRestWorkflow.Create(GetProxy, BuscarBaseUrl, BuscarCartorioId);

    viHttpResponse := viRestWorkflow.DeletarTdTipoAndamento(
      GetToken,
      vpTdTipoAndamentoId);

    if viHttpResponse.HttpCode <> CG_HTTP_CODE_NO_CONTENT then
    begin
      viErro := FormatarErro(viHttpResponse);

      LogarErro(
        'D_TB_TIPO_ANDAMENTO',
        'D',
        vpTdTipoAndamentoId,
        viHttpResponse.HttpCode,
        viErro);

      Exit;
    end;

    DeletarRegistro(
      'D_TB_TIPO_ANDAMENTO',
      'D',
      vpTdTipoAndamentoId);

  finally
    FreeAndNil(viRestWorkflow);
    FreeAndNil(viHttpResponse);
  end;

end;

procedure TWorkflowBusiness.DeletarTdTipoDocumento(
  const vpTdTipoDocumentoId: Integer);
var
  viRestWorkflow: TRestWorkflow;
  viHttpResponse: THttpResponse;
  viErro: string;
begin
  viRestWorkflow := nil;
  viHttpResponse := nil;

  try
    viRestWorkflow := TRestWorkflow.Create(GetProxy, BuscarBaseUrl, BuscarCartorioId);

    viHttpResponse := viRestWorkflow.DeletarTdTipoDocumento(
      GetToken,
      vpTdTipoDocumentoId);

    if viHttpResponse.HttpCode <> CG_HTTP_CODE_NO_CONTENT then
    begin
      viErro := FormatarErro(viHttpResponse);

      LogarErro(
        'D_TIPO_DOCUMENTO',
        'D',
        vpTdTipoDocumentoId,
        viHttpResponse.HttpCode,
        viErro);

      Exit;
    end;

    DeletarRegistro(
      'D_TIPO_DOCUMENTO',
      'D',
      vpTdTipoDocumentoId);

  finally
    FreeAndNil(viRestWorkflow);
    FreeAndNil(viHttpResponse);
  end;

end;

procedure TWorkflowBusiness.DeletarTnAtoAndamento(
  const vpAtoAndamentoId: Integer);
var
  viRestWorkflow: TRestWorkflow;
  viHttpResponse: THttpResponse;
  viErro: string;
begin
  viRestWorkflow := nil;
  viHttpResponse := nil;

  try
    viRestWorkflow := TRestWorkflow.Create(GetProxy, BuscarBaseUrl, BuscarCartorioId);

    viHttpResponse := viRestWorkflow.DeletarTnAtoAndamento(
      GetToken,
      vpAtoAndamentoId);

    if viHttpResponse.HttpCode <> CG_HTTP_CODE_NO_CONTENT then
    begin
      viErro := FormatarErro(viHttpResponse);

      LogarErro(
        'T_ATO_ANDAMENTO',
        'D',
        vpAtoAndamentoId,
        viHttpResponse.HttpCode,
        viErro);

      Exit;
    end;

    DeletarRegistro(
      'T_ATO_ANDAMENTO',
      'D',
      vpAtoAndamentoId);

  finally
    FreeAndNil(viRestWorkflow);
    FreeAndNil(viHttpResponse);
  end;

end;

procedure TWorkflowBusiness.DeletarTnAtoTipo(const vpTnAtoTipoId: Integer);
var
  viRestWorkflow: TRestWorkflow;
  viHttpResponse: THttpResponse;
  viErro: string;
begin
  viRestWorkflow := nil;
  viHttpResponse := nil;

  try
    viRestWorkflow := TRestWorkflow.Create(GetProxy, BuscarBaseUrl, BuscarCartorioId);

    viHttpResponse := viRestWorkflow.DeletarTnAtoTipo(
      GetToken,
      vpTnAtoTipoId);

    if viHttpResponse.HttpCode <> CG_HTTP_CODE_NO_CONTENT then
    begin
      viErro := FormatarErro(viHttpResponse);

      LogarErro(
        'T_ATO_TIPO',
        'D',
        vpTnAtoTipoId,
        viHttpResponse.HttpCode,
        viErro);

      Exit;
    end;

    DeletarRegistro(
      'T_ATO_TIPO',
      'D',
      vpTnAtoTipoId);

  finally
    FreeAndNil(viRestWorkflow);
    FreeAndNil(viHttpResponse);
  end;

end;

procedure TWorkflowBusiness.DeletarTnAtoTipoAndamento(
  const vpTnAtoTipoAndamentoId: Integer);
var
  viRestWorkflow: TRestWorkflow;
  viHttpResponse: THttpResponse;
  viErro: string;
begin
  viRestWorkflow := nil;
  viHttpResponse := nil;

  try
    viRestWorkflow := TRestWorkflow.Create(GetProxy, BuscarBaseUrl, BuscarCartorioId);

    viHttpResponse := viRestWorkflow.DeletarTnAtoTipoAndamento(
      GetToken,
      vpTnAtoTipoAndamentoId);

    if viHttpResponse.HttpCode <> CG_HTTP_CODE_NO_CONTENT then
    begin
      viErro := FormatarErro(viHttpResponse);

      LogarErro(
        'T_TB_ANDAMENTOSERVICO',
        'D',
        vpTnAtoTipoAndamentoId,
        viHttpResponse.HttpCode,
        viErro);

      Exit;
    end;

    DeletarRegistro(
      'T_TB_ANDAMENTOSERVICO',
      'D',
      vpTnAtoTipoAndamentoId);

  finally
    FreeAndNil(viRestWorkflow);
    FreeAndNil(viHttpResponse);
  end;

end;

procedure TWorkflowBusiness.DeletarUsuarioSistema(const vpUsuarioId,
  vpSistemaId: Integer);
var
  viRestWorkflow: TRestWorkflow;
  viHttpResponse: THttpResponse;
begin
  viRestWorkflow := nil;
  viHttpResponse := nil;

  try
    viRestWorkflow := TRestWorkflow.Create(GetProxy, BuscarBaseUrl, BuscarCartorioId);

    viHttpResponse := viRestWorkflow.UsuarioSistemaDelete(
      GetToken,
      vpUsuarioId,
      vpSistemaId);

    if viHttpResponse.HttpCode <> CG_HTTP_CODE_NO_CONTENT then
      raise Exception.Create(FormatarErro(viHttpResponse));

  finally
    FreeAndNil(viRestWorkflow);
    FreeAndNil(viHttpResponse);
  end;

end;

function TWorkflowBusiness.FormatarErro(const vpHttpResponse: THttpResponse): string;
var
  viErro: string;
  viJsonValue: TJSONValue;
begin
  viJsonValue := nil;
  try
    viJsonValue := TJsonUtil.BuscarJsonValue(vpHttpResponse.HttpResponse);
    viErro := string.Empty;
    if Assigned(viJsonValue) then
      viErro := viJsonValue.ToString;

    Result := vpHttpResponse.HttpStatus +' : ' +  viErro;
  finally
    FreeAndNil(viJsonValue);
  end;
end;

procedure TWorkflowBusiness.LogarErro(
  const vpTabela: string;
  const vpOperacao: string;
  const vpId: Integer;
  const vpStatusCode: Integer;
  const vpErro: string);
var
  viQuery: TI9Query;
begin
  viQuery := nil;
  try
    viQuery := TI9Query.Create(nil);
    viQuery.Connection := FConexaoDb.Connection;
    viQuery.SQL.Text := {$REGION 'SQL'}
      'UPDATE '+
      '    G_WORKFLOW G_W '+
      'SET '+
      '    G_W.STATUS_CODE = :P_STATUS_CODE, '+
      '    G_W.ERRO = :P_ERRO '+
      'WHERE '+
      '    G_W.TABELA = :P_TABELA AND '+
      '    G_W.OPERACAO = :P_OPERACAO AND '+
      '    G_W.ID = :P_ID    ';
    {$ENDREGION}

    viQuery.ParamByName('P_STATUS_CODE').AsInteger := vpStatusCode;
    viQuery.ParamByName('P_ERRO').AsString := vpErro.Substring(0, 1040);
    viQuery.ParamByName('P_TABELA').AsString := vpTabela;
    viQuery.ParamByName('P_OPERACAO').AsString := vpOperacao;
    viQuery.ParamByName('P_ID').AsInteger := vpId;
    viQuery.ExecSQL;

  finally
    FreeAndNil(viQuery);
  end;
end;

class function TWorkflowBusiness.UsaIntegracaoWorkflow(
  const vpConexaoDb: TConexaoDb): Boolean;
begin
  Result := string(
    vpConexaoDb.BuscarConfigValor(
      CI_COD_SISTEMA_CAIXA,
      'WORKFLOW',
      'PRINCIPAL',
      'USA_INTEGRACAO_WORKFLOW'))
    .Equals(
      'S');
end;

class function TWorkflowBusiness.RetornaListaTipoProtocoloRI(
  const vpConexaoDb: TConexaoDb): string;
begin
  Result := vpConexaoDb.BuscarConfigValor(
    CI_COD_SISTEMA_CAIXA,
    'WORKFLOW',
    'PRINCIPAL',
    'LISTA_RI_TIPO_PROTOCOLO');
end;

end.
