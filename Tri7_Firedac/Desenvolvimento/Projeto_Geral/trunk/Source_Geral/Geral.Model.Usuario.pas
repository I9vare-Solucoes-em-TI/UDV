unit Geral.Model.Usuario;

interface

uses
  Geral.Model.DAO,
  Data.DB,
  FireDAC.Stan.Param,
  System.Classes,
  System.Generics.Collections;

type
  TUsuario = class
  private
    FUsuarioId: Integer;
    FTrocarsenha: string;
    FLogin: string;
    FSenha: string;
    FSituacao: string;
    FNomeCompleto: string;
    FFuncao: string;
    FAssina: string;
    FSigla: string;
    FUltimoLogin: string;
    FUltimoLoginRegs: TDateTime;
    FDataExpiracao: TDateTime;
    FSenhaAnterior: string;
    FAndamentoPadrao: Integer;
    FLembretePergunta: string;
    FLembreteResposta: string;
    FAndamentoPadrao2: Integer;
    FReceberMensagemArrolamento: string;
    FEmail: string;
    FAssinaCertidao: string;
    FReceberEmailPenhora: string;
    FFoto: TStream;
    FNaoReceberChatTodos: string;
    FPodeAlterarCaixa: string;
    FComissao: Currency;
    FPessoaId: Integer;
    FPessoasVinculadas: string;
    FAnalistaDocDiverso: string;
    FUsuarioTab: Integer;
    FAlertaSeloMinimo: string;
    FRodapeEmail: TStream;
    FControleHorario: string;
    FHoraInicio: string;
    FHoraFim: string;
    FDiasUteis: string;
    FCpf: string;
    FAssinaRegistro: string;
    FSomenteBiometria: string;
    FSomenteCertificado: string;
  public
    property UsuarioId: Integer read FUsuarioId write FUsuarioId;
    property Trocarsenha: string read FTrocarsenha write FTrocarsenha;
    property Login: string read FLogin write FLogin;
    property Senha: string read FSenha write FSenha;
    property Situacao: string read FSituacao write FSituacao;
    property NomeCompleto: string read FNomeCompleto write FNomeCompleto;
    property Funcao: string read FFuncao write FFuncao;
    property Assina: string read FAssina write FAssina;
    property Sigla: string read FSigla write FSigla;
    property UltimoLogin: string read FUltimoLogin write FUltimoLogin;
    property UltimoLoginRegs: TDateTime read FUltimoLoginRegs write FUltimoLoginRegs;
    property DataExpiracao: TDateTime read FDataExpiracao write FDataExpiracao;
    property SenhaAnterior: string read FSenhaAnterior write FSenhaAnterior;
    property AndamentoPadrao: Integer read FAndamentoPadrao write FAndamentoPadrao;
    property LembretePergunta: string read FLembretePergunta write FLembretePergunta;
    property LembreteResposta: string read FLembreteResposta write FLembreteResposta;
    property AndamentoPadrao2: Integer read FAndamentoPadrao2 write FAndamentoPadrao2;
    property ReceberMensagemArrolamento: string read FReceberMensagemArrolamento write FReceberMensagemArrolamento;
    property Email: string read FEmail write FEmail;
    property AssinaCertidao: string read FAssinaCertidao write FAssinaCertidao;
    property ReceberEmailPenhora: string read FReceberEmailPenhora write FReceberEmailPenhora;
    property Foto: TStream read FFoto write FFoto;
    property NaoReceberChatTodos: string read FNaoReceberChatTodos write FNaoReceberChatTodos;
    property PodeAlterarCaixa: string read FPodeAlterarCaixa write FPodeAlterarCaixa;
    property Comissao: Currency read FComissao write FComissao;
    property PessoaId: Integer read FPessoaId write FPessoaId;
    property PessoasVinculadas: string read FPessoasVinculadas write FPessoasVinculadas;
    property AnalistaDocDiverso: string read FAnalistaDocDiverso write FAnalistaDocDiverso;
    property UsuarioTab: Integer read FUsuarioTab write FUsuarioTab;
    property AlertaSeloMinimo: string read FAlertaSeloMinimo write FAlertaSeloMinimo;
    property RodapeEmail: TStream read FRodapeEmail write FRodapeEmail;
    property ControleHorario: string read FControleHorario write FControleHorario;
    property HoraInicio: string read FHoraInicio write FHoraInicio;
    property HoraFim: string read FHoraFim write FHoraFim;
    property DiasUteis: string read FDiasUteis write FDiasUteis;
    property Cpf: string read FCpf write FCpf;
    property AssinaRegistro: string read FAssinaRegistro write FAssinaRegistro;
    property SomenteBiometria: string read FSomenteBiometria write FSomenteBiometria;
    property SomenteCertificado: string read FSomenteCertificado write FSomenteCertificado;

    destructor Destroy; override;
  end;

  TUsuarioDAO = class(TDAO<TUsuario>)
  protected
    function CreateObject(
      const vpDataSet: TDataSet): TUsuario; override;

    function GetTableName: string; override;
    function GetColumns: TArray<string>; override;

    procedure FillParams(
      const vpParams: TFDParams;
      const vpIndex: Integer;
      const vpValue: TUsuario); override;
  public
    function BuscarNomeCompleto(
      const vpUsuarioID: Integer): string;
  end;

  TUsuarioBusiness = class
  public
    class function Buscar(
      const vpUsuarioId: Integer): TUsuario;

    class function Listar: TObjectList<TUsuario>;

    class function BuscarNomeCompleto(
      const vpUsuarioID: Integer): string;

    class function BuscarCpfCnpj(
      const vpUsuarioId: Integer): string;
  end;

implementation

uses
  Controles,
  I9Query,
  System.SysUtils;

{ TUsuarioBusiness }

class function TUsuarioBusiness.Buscar(
  const vpUsuarioId: Integer): TUsuario;
var
  viUsuarioDAO: TUsuarioDAO;
begin
  viUsuarioDAO := nil;
  try
    viUsuarioDAO := TUsuarioDAO.Create(dtmControles.DB);

    Result := viUsuarioDAO.GetByID(vpUsuarioId);
  finally
    viUsuarioDAO.Free;
  end;
end;

class function TUsuarioBusiness.BuscarCpfCnpj(
  const vpUsuarioId: Integer): string;
{$REGION 'Variáveis'}
var
  viQuery: TI9Query;
{$ENDREGION}
begin
  viQuery := TI9Query.Create(
    nil);

  try
    viQuery.Connection := dtmControles.DB;

    viQuery.SQL.Text := {$REGION 'Comando SQL SELECT'}
      'SELECT ' +
      '   G_U.CPF ' +
      'FROM G_USUARIO G_U ' +
      'WHERE ' +
      'G_U.USUARIO_ID = :P_USUARIO_ID';

    viQuery.ParamByName(
      'P_USUARIO_ID').AsInteger := vpUsuarioID;
    {$ENDREGION}

    viQuery.Open;
    try
      Result := viQuery.FieldByName(
        'CPF').AsString;
    finally
      viQuery.Close;
    end;
  finally
    viQuery.Free;
  end;

end;

class function TUsuarioBusiness.BuscarNomeCompleto(
  const vpUsuarioID: Integer): string;
var
  viUsuarioDAO: TUsuarioDAO;
begin
  Result := string.Empty;
  viUsuarioDAO := nil;

  try
    viUsuarioDAO := TUsuarioDAO.Create(
      dtmControles.DB);

    Result := viUsuarioDAO.BuscarNomeCompleto(
      vpUsuarioID);
  finally
    FreeAndNil(viUsuarioDAO);
  end;
end;

class function TUsuarioBusiness.Listar: TObjectList<TUsuario>;
var
  viUsuarioDAO: TUsuarioDAO;
begin
  viUsuarioDAO := nil;
  try
    viUsuarioDAO := TUsuarioDAO.Create(dtmControles.DB);

    Result := viUsuarioDAO.GetList(
      0,
      0,
      '',
      [],
      'USUARIO_ID');
  finally
    viUsuarioDAO.Free;
  end;
end;

{ TUsuarioDAO }

function TUsuarioDAO.BuscarNomeCompleto(
  const vpUsuarioID: Integer): string;
var
  viUsuario: TDataSet;
begin
  Result := string.Empty;
  viUsuario := nil;

  try
    viUsuario := GetByID_AsDataSet(
      ['NOME_COMPLETO'],
      vpUsuarioID);

    if viUsuario.IsEmpty then
      Exit;

    Result := viUsuario.FieldByName(
      'NOME_COMPLETO').AsString;
  finally
    if Assigned(viUsuario) then
      viUsuario.Close;

    FreeAndNil(viUsuario);
  end;
end;

function TUsuarioDAO.CreateObject(
  const vpDataSet: TDataSet): TUsuario;
begin
  Result := TUsuario.Create;
  Result.UsuarioId := vpDataSet.FieldByName('USUARIO_ID').AsInteger;
  Result.Trocarsenha := vpDataSet.FieldByName('TROCARSENHA').AsString;
  Result.Login := vpDataSet.FieldByName('LOGIN').AsString;
  Result.Senha := vpDataSet.FieldByName('SENHA').AsString;
  Result.Situacao := vpDataSet.FieldByName('SITUACAO').AsString;
  Result.NomeCompleto := vpDataSet.FieldByName('NOME_COMPLETO').AsString;
  Result.Funcao := vpDataSet.FieldByName('FUNCAO').AsString;
  Result.Assina := vpDataSet.FieldByName('ASSINA').AsString;
  Result.Sigla := vpDataSet.FieldByName('SIGLA').AsString;
  Result.UltimoLogin := vpDataSet.FieldByName('ULTIMO_LOGIN').AsString;
  Result.UltimoLoginRegs := vpDataSet.FieldByName('ULTIMO_LOGIN_REGS').AsDateTime;
  Result.DataExpiracao := vpDataSet.FieldByName('DATA_EXPIRACAO').AsDateTime;
  Result.SenhaAnterior := vpDataSet.FieldByName('SENHA_ANTERIOR').AsString;
  Result.AndamentoPadrao := vpDataSet.FieldByName('ANDAMENTO_PADRAO').AsInteger;
  Result.LembretePergunta := vpDataSet.FieldByName('LEMBRETE_PERGUNTA').AsString;
  Result.LembreteResposta := vpDataSet.FieldByName('LEMBRETE_RESPOSTA').AsString;
  Result.AndamentoPadrao2 := vpDataSet.FieldByName('ANDAMENTO_PADRAO2').AsInteger;
  Result.ReceberMensagemArrolamento := vpDataSet.FieldByName('RECEBER_MENSAGEM_ARROLAMENTO').AsString;
  Result.Email := vpDataSet.FieldByName('EMAIL').AsString;
  Result.AssinaCertidao := vpDataSet.FieldByName('ASSINA_CERTIDAO').AsString;
  Result.ReceberEmailPenhora := vpDataSet.FieldByName('RECEBER_EMAIL_PENHORA').AsString;
  Result.Foto := vpDataSet.CreateBlobStream(vpDataSet.FieldByName('FOTO'), TBlobStreamMode.bmRead);
  Result.NaoReceberChatTodos := vpDataSet.FieldByName('NAO_RECEBER_CHAT_TODOS').AsString;
  Result.PodeAlterarCaixa := vpDataSet.FieldByName('PODE_ALTERAR_CAIXA').AsString;
  Result.Comissao := vpDataSet.FieldByName('COMISSAO').AsCurrency;
  Result.PessoaId := vpDataSet.FieldByName('PESSOA_ID').AsInteger;
  Result.PessoasVinculadas := vpDataSet.FieldByName('PESSOAS_VINCULADAS').AsString;
  Result.AnalistaDocDiverso := vpDataSet.FieldByName('ANALISTA_DOC_DIVERSO').AsString;
  Result.UsuarioTab := vpDataSet.FieldByName('USUARIO_TAB').AsInteger;
  Result.AlertaSeloMinimo := vpDataSet.FieldByName('ALERTA_SELO_MINIMO').AsString;
  Result.RodapeEmail := vpDataSet.CreateBlobStream(vpDataSet.FieldByName('RODAPE_EMAIL'), TBlobStreamMode.bmRead);
  Result.ControleHorario := vpDataSet.FieldByName('CONTROLE_HORARIO').AsString;
  Result.HoraInicio := vpDataSet.FieldByName('HORA_INICIO').AsString;
  Result.HoraFim := vpDataSet.FieldByName('HORA_FIM').AsString;
  Result.DiasUteis := vpDataSet.FieldByName('DIAS_UTEIS').AsString;
  Result.Cpf := vpDataSet.FieldByName('CPF').AsString;
  Result.AssinaRegistro := vpDataSet.FieldByName('ASSINA_REGISTRO').AsString;
  Result.SomenteBiometria := vpDataSet.FieldByName('SOMENTE_BIOMETRIA').AsString;
  Result.SomenteCertificado := vpDataSet.FieldByName('SOMENTE_CERTIFICADO').AsString;
end;

procedure TUsuarioDAO.FillParams(
  const vpParams: TFDParams;
  const vpIndex: Integer;
  const vpValue: TUsuario);
begin
  inherited;
  vpParams.ParamByName('USUARIO_ID').AsIntegers[vpIndex]                  := vpValue.UsuarioId;
  vpParams.ParamByName('TROCARSENHA').AsStrings[vpIndex]                  := vpValue.Trocarsenha;
  vpParams.ParamByName('LOGIN').AsStrings[vpIndex]                        := vpValue.Login;
  vpParams.ParamByName('SENHA').AsStrings[vpIndex]                        := vpValue.Senha;
  vpParams.ParamByName('SITUACAO').AsStrings[vpIndex]                     := vpValue.Situacao;
  vpParams.ParamByName('NOME_COMPLETO').AsStrings[vpIndex]                := vpValue.NomeCompleto;
  vpParams.ParamByName('FUNCAO').AsStrings[vpIndex]                       := vpValue.Funcao;
  vpParams.ParamByName('ASSINA').AsStrings[vpIndex]                       := vpValue.Assina;
  vpParams.ParamByName('SIGLA').AsStrings[vpIndex]                        := vpValue.Sigla;
  vpParams.ParamByName('ULTIMO_LOGIN').AsStrings[vpIndex]                 := vpValue.UltimoLogin;
  vpParams.ParamByName('ULTIMO_LOGIN_REGS').AsDateTimes[vpIndex]          := vpValue.UltimoLoginRegs;
  vpParams.ParamByName('DATA_EXPIRACAO').AsDateTimes[vpIndex]             := vpValue.DataExpiracao;
  vpParams.ParamByName('SENHA_ANTERIOR').AsStrings[vpIndex]               := vpValue.SenhaAnterior;
  vpParams.ParamByName('ANDAMENTO_PADRAO').AsIntegers[vpIndex]            := vpValue.AndamentoPadrao;
  vpParams.ParamByName('LEMBRETE_PERGUNTA').AsStrings[vpIndex]            := vpValue.LembretePergunta;
  vpParams.ParamByName('LEMBRETE_RESPOSTA').AsStrings[vpIndex]            := vpValue.LembreteResposta;
  vpParams.ParamByName('ANDAMENTO_PADRAO2').AsIntegers[vpIndex]           := vpValue.AndamentoPadrao2;
  vpParams.ParamByName('RECEBER_MENSAGEM_ARROLAMENTO').AsStrings[vpIndex] := vpValue.ReceberMensagemArrolamento;
  vpParams.ParamByName('EMAIL').AsStrings[vpIndex]                        := vpValue.Email;
  vpParams.ParamByName('ASSINA_CERTIDAO').AsStrings[vpIndex]              := vpValue.AssinaCertidao;
  vpParams.ParamByName('RECEBER_EMAIL_PENHORA').AsStrings[vpIndex]        := vpValue.ReceberEmailPenhora;
  vpParams.ParamByName('FOTO').AsStreams[vpIndex]                         := vpValue.Foto;
  vpParams.ParamByName('NAO_RECEBER_CHAT_TODOS').AsStrings[vpIndex]       := vpValue.NaoReceberChatTodos;
  vpParams.ParamByName('PODE_ALTERAR_CAIXA').AsStrings[vpIndex]           := vpValue.PodeAlterarCaixa;
  vpParams.ParamByName('COMISSAO').AsCurrencys[vpIndex]                   := vpValue.Comissao;
  vpParams.ParamByName('PESSOA_ID').AsIntegers[vpIndex]                   := vpValue.PessoaId;
  vpParams.ParamByName('PESSOAS_VINCULADAS').AsStrings[vpIndex]           := vpValue.PessoasVinculadas;
  vpParams.ParamByName('ANALISTA_DOC_DIVERSO').AsStrings[vpIndex]         := vpValue.AnalistaDocDiverso;
  vpParams.ParamByName('USUARIO_TAB').AsIntegers[vpIndex]                 := vpValue.UsuarioTab;
  vpParams.ParamByName('ALERTA_SELO_MINIMO').AsStrings[vpIndex]           := vpValue.AlertaSeloMinimo;
  vpParams.ParamByName('RODAPE_EMAIL').AsStreams[vpIndex]                 := vpValue.RodapeEmail;
  vpParams.ParamByName('CONTROLE_HORARIO').AsStrings[vpIndex]             := vpValue.ControleHorario;
  vpParams.ParamByName('HORA_INICIO').AsStrings[vpIndex]                  := vpValue.HoraInicio;
  vpParams.ParamByName('HORA_FIM').AsStrings[vpIndex]                     := vpValue.HoraFim;
  vpParams.ParamByName('DIAS_UTEIS').AsStrings[vpIndex]                   := vpValue.DiasUteis;
  vpParams.ParamByName('CPF').AsStrings[vpIndex]                          := vpValue.Cpf;
  vpParams.ParamByName('ASSINA_REGISTRO').AsStrings[vpIndex]              := vpValue.AssinaRegistro;
  vpParams.ParamByName('SOMENTE_BIOMETRIA').AsStrings[vpIndex]            := vpValue.SomenteBiometria;
  vpParams.ParamByName('SOMENTE_CERTIFICADO').AsStrings[vpIndex]          := vpValue.SomenteCertificado;
end;

function TUsuarioDAO.GetColumns: TArray<string>;
begin
  Result := [];
end;

function TUsuarioDAO.GetTableName: string;
begin
  Result := 'G_USUARIO';
end;

{ TUsuario }

destructor TUsuario.Destroy;
begin
  FreeAndNil(FFoto);
  FreeAndNil(FRodapeEmail);
  inherited;
end;

end.
