unit Geral.Model.EmailGravar;

interface

uses
  Controles,
  Data.DB,
  FireDAC.Stan.Param,
  Geral.Model.Dao,
  Geral.Model.ConexaoDb,
  System.Classes;

type
  TEmailGravar = class
  strict private
    FEmailId: Integer;
    FDataEnvio: TDateTime;
    FUsuarioId: Integer;
    FAssunto: string;
    FPara: string;
    FIpMaquina: string;
    FSistemaId: Integer;
    FObservacao: string;
    FStatus: string;
  public
    property EmailId: Integer read FEmailId write FEmailId;
    property DataEnvio: TDateTime read FDataEnvio write FDataEnvio;
    property UsuarioId: Integer read FUsuarioId write FUsuarioId;
    property Assunto: string read FAssunto write FAssunto;
    property Para: string read FPara write FPara;
    property IpMaquina: string read FIpMaquina write FIpMaquina;
    property SistemaId: Integer read FSistemaId write FSistemaId;
    property Observacao: string read FObservacao write FObservacao;
    property Status: string read FStatus write FStatus;
  end;

  TEmailGravarUtil = class
  public
    class function Preencher(
      const vpEmailId: Integer;
      const vpDataEnvio: TDateTime;
      const vpUsuarioId: Integer;
      const vpAssunto: string;
      const vpPara: string;
      const vpIpMaquina: string;
      const vpSistemaId: Integer;
      const vpObservacao: string;
      const vpStatus: string): TEmailGravar;
  end;

  TEmailGravarDao = class(TDao<TEmailGravar>)
  protected
    function CreateObject(
      const vpDataSet: TDataSet): TEmailGravar; override;

    function GetTableName: string; override;
    function GetColumns: TArray<string>; override;

    procedure FillParams(
      const vpParams: TFDParams;
      const vpIndex: Integer;
      const vpValue: TEmailGravar); override;
  end;

  TEmailGravarBusiness = class
  private
    FConexaoDb: TConexaoDb;
  public
    constructor Create(
      const vpConexaoDb: TConexaoDb); reintroduce;

    class function Buscar(
      const vpEmailId: Integer): TEmailGravar;

    class function Cadastrar(
      const vpEmail: TEmailGravar): Integer;

    class function Excluir(
      const vpEmailId: Integer): Integer; overload;

    class function ValidarCadastro(
      const vpEmail: TEmailGravar;
      out vpListaErroValidacao: TStrings): Boolean;

    class function ValidarExclusao(
      const vpEmailId: Integer;
      out vpListaErroValidacao: TStrings): Boolean;

    function Pesquisar(
      const vpDataIni: TDateTime;
      const vpDataFim: TDateTime;
      const vpSistemaId: Integer;
      const vpPara: string;
      const vpStatus: string): TDataSet;
  end;

implementation

uses
  Geral.Model.Exception,
  MensagemUtils,
  I9Query,
  System.DateUtils,
  System.SysUtils;

{ TEmailDao }

function TEmailGravarDao.CreateObject(
  const vpDataSet: TDataSet): TEmailGravar;
begin
  Result := TEmailGravarUtil.Preencher(
    vpDataSet.FieldByName('EMAIL_ID').AsInteger,
    vpDataSet.FieldByName('DATA_ENVIO').AsDateTime,
    vpDataSet.FieldByName('USUARIO_ID').AsInteger,
    vpDataSet.FieldByName('ASSUNTO').Asstring,
    vpDataSet.FieldByName('PARA').Asstring,
    vpDataSet.FieldByName('IP_MAQUINA').Asstring,
    vpDataSet.FieldByName('SISTEMA_ID').AsInteger,
    vpDataSet.FieldByName('OBSERVACAO').Asstring,
    vpDataSet.FieldByName('STATUS').Asstring);
end;

procedure TEmailGravarDao.FillParams(
  const vpParams: TFDParams;
  const vpIndex: Integer;
  const vpValue: TEmailGravar);
begin
  inherited;
  PreencherParametro(vpParams, 'EMAIL_ID', vpValue.EmailId, vpIndex);
  PreencherParametro(vpParams, 'DATA_ENVIO', vpValue.DataEnvio, vpIndex);
  PreencherParametro(vpParams, 'USUARIO_ID', vpValue.UsuarioId, vpIndex);
  PreencherParametro(vpParams, 'ASSUNTO', vpValue.Assunto, vpIndex);
  PreencherParametro(vpParams, 'PARA', vpValue.Para, vpIndex);
  PreencherParametro(vpParams, 'IP_MAQUINA', vpValue.IpMaquina, vpIndex);
  PreencherParametro(vpParams, 'SISTEMA_ID', vpValue.SistemaId, vpIndex);
  PreencherParametro(vpParams, 'OBSERVACAO', vpValue.Observacao, vpIndex);
  PreencherParametro(vpParams, 'STATUS', vpValue.Status, vpIndex);
end;

function TEmailGravarDao.GetColumns: TArray<string>;
begin
  Result := [
    'EMAIL_ID',
    'DATA_ENVIO',
    'USUARIO_ID',
    'ASSUNTO',
    'PARA',
    'IP_MAQUINA',
    'SISTEMA_ID',
    'OBSERVACAO',
    'STATUS'
  ];
end;

function TEmailGravarDao.GetTableName: string;
begin
  Result := 'G_EMAIL';
end;

{ TEmailBusiness }

class function TEmailGravarBusiness.Buscar(
  const vpEmailId: Integer): TEmailGravar;
var
  viEmailDao: TEmailGravarDao;
begin
{  Result := nil;
  viEmailDao := nil;
  try
    viEmailDao := TEmailGravarDao.Create(dtmControles.DB);
    Result := viEmailDao.GetById(vpEmailId);
  finally
    FreeAndNil(viEmailDao);
  end;}
end;

class function TEmailGravarBusiness.Cadastrar(
  const vpEmail: TEmailGravar): Integer;
const
  CI_ACAO = 'cadastrar ';
var
  viEmailDao: TEmailGravarDao;
  viInTransaction: Boolean;
  viCadastroValido: Boolean;
  viListaErroValidacao: TStrings;
begin
{  Result := 0;

  viListaErroValidacao := nil;
  viEmailDao := nil;
  try
     viCadastroValido := ValidarCadastro(
       vpEmail,
       viListaErroValidacao);

     if not viCadastroValido then
       TException.RaiseExceptionModelo(CI_ACAO, viListaErroValidacao.Text);

    viEmailDao := TEmailGravarDao.Create(dtmControles.DB);

    viInTransaction := dtmControles.DB.InTransaction;
    if not viInTransaction then
      dtmControles.DB.StartTransaction;
    try
      if vpEmail.EmailId = 0 then
        vpEmail.EmailId := dtmControles.GerarSequencia('G_EMAIL');

      viEmailDao.Post(vpEmail);

      Result := vpEmail.EmailId;

      if not viInTransaction then
        dtmControles.DB.Commit;

    except
      on e: Exception do
      begin
        if not viInTransaction then
          dtmControles.DB.Rollback;

        TException.RaiseExceptionModelo(CI_ACAO, e.Message);
      end;
    end;

  finally
    FreeAndNil(viEmailDao);
    FreeAndNil(viListaErroValidacao);
  end; }
end;

constructor TEmailGravarBusiness.Create(const vpConexaoDb: TConexaoDb);
begin
  inherited Create;
  FConexaoDb := vpConexaoDb;
end;

class function TEmailGravarBusiness.Excluir(
  const vpEmailId: Integer): Integer;
const
  CI_ACAO = 'excluir ';
var
  viEmailDao: TEmailGravarDao;
  viExclusaoValida: Boolean;
  viListaErroValidacao: TStrings;
begin
{  Result := 0;

  viListaErroValidacao := nil;
  viEmailDao := nil;
  try
    viExclusaoValida := ValidarExclusao(
      vpEmailId,
      viListaErroValidacao);

    if not viExclusaoValida then
      TException.RaiseExceptionModelo(CI_ACAO, viListaErroValidacao.Text);

    try
      viEmailDao := TEmailGravarDao.Create(dtmControles.DB);
      Result := viEmailDao.Delete(vpEmailId);
    except
      on e: Exception do
        TException.RaiseExceptionModelo(CI_ACAO, e.Message);
    end;

  finally
    FreeAndNil(viEmailDao);
    FreeAndNil(viListaErroValidacao);
  end; }
end;

function TEmailGravarBusiness.Pesquisar(const vpDataIni,
  vpDataFim: TDateTime; const vpSistemaId: Integer;
  const vpPara: string;
  const vpStatus: string): TDataSet;
var
  viQuery: TI9Query;
  viPesquisaCondicao: string;
begin
  Result := nil;
  viPesquisaCondicao := '';

  if (vpDataIni <= 0) or (vpDataFim <= 0) then
  begin
    TMensagemUtils.ExibirMensagemAtencao('Os campos de data s�o obrigat�rios!' + #13#10 +
                                         'Para efetuar a pesquisa, ' + #13#10 +
                                         'ambos precisam estar preenchidos!');
    Exit;
  end;

  if vpSistemaId > 0 then
    viPesquisaCondicao := viPesquisaCondicao + ' AND S.SISTEMA_ID = ' + vpSistemaId.ToString;

  if not vpPara.Trim.IsEmpty then
    viPesquisaCondicao := viPesquisaCondicao + ' AND E.PARA = ' + QuotedStr(vpPara);

  if vpStatus <> 'T' then
    viPesquisaCondicao := viPesquisaCondicao + ' AND E.STATUS = ' + QuotedStr(vpStatus);

  try
    viQuery := TI9Query.Create(nil);
    Result := viQuery;
    viQuery.Connection := FConexaoDb.Connection;

    viQuery.SQL.Text := {$REGION 'SQL'}
      'SELECT '+
      '    E.EMAIL_ID, '+
      '    E.DATA_ENVIO, '+
      '    U.NOME_COMPLETO AS USUARIO, '+
      '    E.ASSUNTO, '+
      '    E.PARA, '+
      '    E.IP_MAQUINA, '+
      '    S.DESCRICAO AS SISTEMA, '+
      '    E.OBSERVACAO, '+
      '    E.STATUS '+
      'FROM '+
      '    G_EMAIL E '+
      'LEFT JOIN '+
      '    G_USUARIO U ON U.USUARIO_ID = E.USUARIO_ID '+
      'LEFT JOIN '+
      '    G_SISTEMA S ON S.SISTEMA_ID = E.SISTEMA_ID '+
      'WHERE E.DATA_ENVIO BETWEEN :P_DATA_INICIAL AND :P_DATA_FINAL '+
      viPesquisaCondicao +
      'ORDER BY '+
      '    E.DATA_ENVIO ';
    {$ENDREGION}

    viQuery.ParamByName('P_DATA_INICIAL').AsDateTime := StartOfTheDay(vpDataIni);
    viQuery.ParamByName('P_DATA_FINAL').AsDateTime := EndOfTheDay(vpDataFim);

    Result.Open;
  except
    FreeAndNil(Result);
    raise;
  end;

end;

class function TEmailGravarBusiness.ValidarCadastro(
  const vpEmail: TEmailGravar;
  out vpListaErroValidacao: TStrings): Boolean;
begin
  Result := True;

  (*
  vpListaErroValidacao := TStringList.Create;

  // Valida��o

  if vpListaErroValidacao.Count > 0 then
    Exit;

  Result := True;
  *)
end;

class function TEmailGravarBusiness.ValidarExclusao(
  const vpEmailId: Integer;
  out vpListaErroValidacao: TStrings): Boolean;
begin
  Result := True;

  (*
  vpListaErroValidacao := TStringList.Create;

  // Valida��o

  if vpListaErroValidacao.Count > 0 then
    Exit;

  Result := True;
  *)
end;

{ TEmailUtil }

class function TEmailGravarUtil.Preencher(
  const vpEmailId: Integer;
  const vpDataEnvio: TDateTime;
  const vpUsuarioId: Integer;
  const vpAssunto: string;
  const vpPara: string;
  const vpIpMaquina: string;
  const vpSistemaId: Integer;
  const vpObservacao: string;
  const vpStatus: string): TEmailGravar;
begin
  Result := TEmailGravar.Create;
  Result.EmailId := vpEmailId;
  Result.DataEnvio := vpDataEnvio;
  Result.UsuarioId := vpUsuarioId;
  Result.Assunto := vpAssunto;
  Result.Para := vpPara;
  Result.IpMaquina := vpIpMaquina;
  Result.SistemaId := vpSistemaId;
  Result.Observacao := vpObservacao;
  Result.Status := vpStatus;
end;
 
{ TEmail }
 
end.
