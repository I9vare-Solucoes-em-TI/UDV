unit EnviadorSelosTJBusiness;

interface

uses
  RegraEnvioSeloList,
  SeloLivroList,
  SeloSituacaoDAO,
  SeloLivroDAO,
  ADM.Model.Entity.Spec.ValidacaoSelosTJ,
  GeradorSelosTJ,
  ADM.Model.Entity.Spec.EnvioSelosTJ,
  SequenciaDAO,
  FormatadorMascaraSelo,
  I9Connection,
  LogEnvioSelo,
  SeloGrupo,
  SeloGrupoImpl,
  Spring.Collections,
  Geral.Model.Entity.Spec.Maybe,
  ADM.Model.Business.Spec.SelosTJ_GO,
  Data.DB,
  Geral.Model.Entity.AnonymousMethods,
  System.Classes;

type
  TDataHoraServidor = TFunction<TDateTime>;

  TEnviadorSelosTJBusiness = class
  private
    const
      CL_QTDE_MINUTOS_DIA = 1440;
  private
    FSeloSituacaoDAO: ISeloSituacaoDAO;
    FSeloLivroDAO: ISeloLivroDAO;
    FValidacaoSelosTJ: IValidacaoSelosTJ;
    FGeradorSelosTJ: IGeradorSelosTJ;
    FEnvioSelosTJ: IEnvioSelosTJ;
    FSequenciaDAO: ISequenciaDAO;
    //FGeradorLogEnvioSelo: IGeradorLogEnvioSelo;
    FFormatadorMascaraSelo: IFormatadorMascaraSelo;
    FSelosTJ_GO_Business: IMaybe<ISelosTJ_GO_Business>;
    FDataHoraServidor: TDataHoraServidor;

    constructor Create(
      const vpSelosTJ_GO_Business: IMaybe<ISelosTJ_GO_Business>;
      const vpDataHoraServidor: TDataHoraServidor); reintroduce;

    function GetSeloSituacaoDAO: ISeloSituacaoDAO;
    function GetSeloLivroDAO: ISeloLivroDAO;
    function GetValidacaoSelosTJ: IValidacaoSelosTJ;
    function GetGeradorSelosTJ: IGeradorSelosTJ;
    function GetEnvioSelosTJ: IEnvioSelosTJ;
    function GetSequenciaDAO: ISequenciaDAO;
    //function GetGeradorLogEnvioSelo: IGeradorLogEnvioSelo;
    function GetFormatadorMascaraSelo: IFormatadorMascaraSelo;

    function GetList(
      const vpValue: TRegraEnvioSeloList): TSeloLivroList;

    function GetListEmail(
      const vpMinutosListarSelos: Integer
    ): TSeloLivroList;

    function CriarAtosRetornoTJ_GO(
      const vpSelos: TSeloLivroList): TDataSet;

    procedure SetSeloSituacaoDAO(
      const Value: ISeloSituacaoDAO);

    procedure SetSeloLivroDAO(
      const Value: ISeloLivroDAO);

    procedure SetValidacaoSelosTJ(
      const Value: IValidacaoSelosTJ);

    procedure SetGeradorSelosTJ(
      const Value: IGeradorSelosTJ);

    procedure SetEnvioSelosTJ(
      const Value: IEnvioSelosTJ);

    procedure SetSequenciaDAO(
      const Value: ISequenciaDAO);

    //procedure SetGeradorLogEnvioSelo(
    //  const Value: IGeradorLogEnvioSelo);

    procedure SetFormatadorMascaraSelo(
      const Value: IFormatadorMascaraSelo);
  public
    property SeloSituacaoDAO: ISeloSituacaoDAO read GetSeloSituacaoDAO
      write SetSeloSituacaoDAO;

    property SeloLivroDAO: ISeloLivroDAO read GetSeloLivroDAO
      write SetSeloLivroDAO;

    property ValidacaoSelosTJ: IValidacaoSelosTJ read GetValidacaoSelosTJ
      write SetValidacaoSelosTJ;

    property GeradorSelosTJ: IGeradorSelosTJ read GetGeradorSelosTJ
      write SetGeradorSelosTJ;

    property EnvioSelosTJ: IEnvioSelosTJ read GetEnvioSelosTJ
      write SetEnvioSelosTJ;

    property SequenciaDAO: ISequenciaDAO read GetSequenciaDAO
      write SetSequenciaDAO;

    //property GeradorLogEnvioSelo: IGeradorLogEnvioSelo read GetGeradorLogEnvioSelo
    //  write SetGeradorLogEnvioSelo;

    property FormatadorMascaraSelo: IFormatadorMascaraSelo
      read GetFormatadorMascaraSelo write SetFormatadorMascaraSelo;

    class function New(
      const vpSelosTJ_GO_Business: IMaybe<ISelosTJ_GO_Business>;
      const vpDataHoraServidor: TDataHoraServidor): TEnviadorSelosTJBusiness;

    procedure EnviarSelos(
      const vpSistema: string;
      const vpValue: TRegraEnvioSeloList);

    procedure EnviarEmails(const vpSistema: string);
  end;

implementation

uses
  CampoOrdenacao,
  CampoOrdenacaoImpl,
  CampoOrdenacaoList,
  Compress,
  Conexao,
  ConfigEmail,
  Email,
  Geral.Model.Entity.Impl.Factory.List,
  Geral.Model.Entity.Spec.List,
  GerenciarLogEnvioSelo,
  I9MemTable,
  IntervaloDatas,
  IntervaloDatasImpl,
  RegraEnvioSelo,
  SeloLivro,
  SeloLivroComparer,
  SeloSituacao,
  SeloSituacaoBusiness,
  Sequencia,
  SequenciaBusiness,
  System.DateUtils,
  System.Generics.Collections,
  System.Generics.Defaults,
  System.Math,
  System.SysUtils,
  System.Types;

{ TEnviadorSelosTJBusiness }

constructor TEnviadorSelosTJBusiness.Create(
  const vpSelosTJ_GO_Business: IMaybe<ISelosTJ_GO_Business>;
  const vpDataHoraServidor: TDataHoraServidor);
begin
  inherited Create;
  FSelosTJ_GO_Business := vpSelosTJ_GO_Business;
  FDataHoraServidor := vpDataHoraServidor;
end;

function TEnviadorSelosTJBusiness.CriarAtosRetornoTJ_GO(
  const vpSelos: TSeloLivroList): TDataSet;
{$REGION 'Variáveis'}
var
  viField: TField;
  viSeloLivro: ISeloLivro;
  viCodigoAto: string;
{$ENDREGION}
begin
  Result := TI9MemTable.Create(
    nil);

  {$REGION 'Criar campos'}
  viField := TIntegerField.Create(
    Result);

  viField.FieldName := 'SELO_LIVRO_ID';
  viField.DataSet := Result;

  viField := TStringField.Create(
    Result);

  viField.FieldName := 'NOTA_FISCAL';
  viField.DataSet := Result;
  viField.Size := 30;

  viField := TIntegerField.Create(
    Result);

  viField.FieldName := 'TIPO_ATO';
  viField.DataSet := Result;

  viField := TStringField.Create(
    Result);

  viField.FieldName := 'NUMERO_AGRUPADOR';
  viField.DataSet := Result;
  viField.Size := 30;

  viField := TStringField.Create(
    Result);

  viField.FieldName := 'CODIGO_ATO';
  viField.DataSet := Result;
  viField.Size := 30;

  viField := TStringField.Create(
    Result);

  viField.FieldName := 'APRESENTANTE';
  viField.DataSet := Result;
  viField.Size := 120;

  viField := TStringField.Create(
    Result);

  viField.FieldName := 'USUARIO';
  viField.DataSet := Result;
  viField.Size := 120;

  viField := TDateTimeField.Create(
    Result);

  viField.FieldName := 'DATA_SELO';
  viField.DataSet := Result;

  viField := TStringField.Create(
    Result);

  viField.FieldName := 'IP_MAQUINA';
  viField.DataSet := Result;
  viField.Size := 30;

  viField := TCurrencyField.Create(
    Result);

  viField.FieldName := 'VALOR_TOTAL';
  viField.DataSet := Result;

  viField := TCurrencyField.Create(
    Result);

  viField.FieldName := 'VALOR_EMOLUMENTO';
  viField.DataSet := Result;

  viField := TCurrencyField.Create(
    Result);

  viField.FieldName := 'VALOR_TAXA_JUDICIARIA';
  viField.DataSet := Result;

  viField := TCurrencyField.Create(
    Result);

  viField.FieldName := 'VALOR_FUNDOS';
  viField.DataSet := Result;

  viField := TIntegerField.Create(
    Result);

  viField.FieldName := 'CODIGO_GRATUITO';
  viField.DataSet := Result;

  viField := TIntegerField.Create(
    Result);

  viField.FieldName := 'PROTOCOLO';
  viField.DataSet := Result;

  viField := TIntegerField.Create(
    Result);

  viField.FieldName := 'SISTEMA_ID';
  viField.DataSet := Result;
  {$ENDREGION}

  Result.Open;

  for viSeloLivro in vpSelos do
  begin
    Result.Append;

    Result.FieldByName(
      'SELO_LIVRO_ID').AsInteger := viSeloLivro.SeloLivroID;

    Result.FieldByName(
      'NOTA_FISCAL').AsString := viSeloLivro.SeloLote.NotaFiscal;

    Result.FieldByName(
      'TIPO_ATO').AsInteger := viSeloLivro.SeloLote.SeloGrupo.Numero;

    Result.FieldByName(
      'NUMERO_AGRUPADOR').AsString := viSeloLivro.NumeroAgrupador;

    viCodigoAto := FormatadorMascaraSelo.FormatarMascaraSelo(
      viSeloLivro);

    Result.FieldByName(
      'CODIGO_ATO').AsString := viCodigoAto;

    Result.FieldByName(
      'APRESENTANTE').AsString := viSeloLivro.Apresentante;

    Result.FieldByName(
      'USUARIO').AsString := viSeloLivro.Usuario.NomeCompleto;

    Result.FieldByName(
      'DATA_SELO').AsDateTime := viSeloLivro.Data;

    Result.FieldByName(
      'IP_MAQUINA').AsString := viSeloLivro.IP_Maquina;

    Result.FieldByName(
      'VALOR_TOTAL').AsCurrency := viSeloLivro.ValorTotal;

    Result.FieldByName(
      'VALOR_EMOLUMENTO').AsCurrency := viSeloLivro.ValorEmolumento;

    Result.FieldByName(
      'VALOR_TAXA_JUDICIARIA').AsCurrency := viSeloLivro.ValorTaxaJudiciaria;

    Result.FieldByName(
      'VALOR_FUNDOS').AsCurrency := viSeloLivro.ValorFundos;

    Result.FieldByName(
      'CODIGO_GRATUITO').AsInteger := viSeloLivro.CodigoGratuito;

    Result.FieldByName(
      'PROTOCOLO').AsInteger := viSeloLivro.Protocolo;

    Result.FieldByName(
      'SISTEMA_ID').AsInteger :=
      viSeloLivro.SeloLote.SeloGrupo.Sistema.SistemaID;

    Result.Post;
  end;

  Result.First;
end;

procedure TEnviadorSelosTJBusiness.EnviarEmails(const vpSistema: string);
var
  viArquivoListaSelos: TStringList;
  viConfigEmail: TConfigEmail;
  viDestinatario: string;
  viListaSelos: string;
  viLocalArquivo: string;
  viMensagemEmail: string;
  viMinutosLista: Integer;
  viSeloLivro: ISeloLivro;
  viSeloLivroList: TSeloLivroList;
  viTextoEmail: string;
  viCodigoAto: string;
  viList: TStrings;
begin
  viConfigEmail := dtmConexao.LerDadosConfigEmail(0);
  try
    if viConfigEmail = nil then
    begin
      TGerenciarLogEnvioSelo.GravarLogEnvioEmail(vpSistema, 'Configuração do e-mail não informada');
      Exit;
    end;

    try
      try
        viMinutosLista := dtmConexao.BuscarParametroOutroSistema(
          'MINUTOS_LISTAR_SELOS',
          'SELOS_NAO_VALIDADOS',
          'NOTIFICACAO',
          '5');
      except
        viMinutosLista := CL_QTDE_MINUTOS_DIA;
      end;

      // 1º Passo - Obter os selos utilizados que ainda não foram exportados para enviar e-mail de alerta
      viSeloLivroList := GetListEmail(viMinutosLista);
      viList := TStringList.Create;
      try
        if CompareValue(viSeloLivroList.Count, ZeroValue) = EqualsValue then
          Exit;

        viListaSelos := '';
        {
          2º Passo - Validar os selos obtidos antes do envio.
          Os selos não validados são os que serão enviados.
        }
        for viSeloLivro in viSeloLivroList do
        begin
          if viSeloLivro.Validado then
            Continue;

          viCodigoAto := FormatadorMascaraSelo.FormatarMascaraSelo(viSeloLivro);
          viList.Add(viCodigoAto);
        end;

        viListaSelos := string.Join(', ', viList.ToStringArray);

      finally
        FreeAndNil(viSeloLivroList);
        FreeAndNil(viList);
      end;

      if Trim(viListaSelos) = '' then
      begin
        TGerenciarLogEnvioSelo.GravarLogEnvioEmail(vpSistema, 'Todos os selos foram enviados!');
        Exit;
      end;

      viDestinatario := dtmConexao.BuscarParametroOutroSistema(
        'EMAIL_DESTINATARIO',
        'SELOS_NAO_VALIDADOS',
        'NOTIFICACAO',
        '5');

      if Trim(viDestinatario) = '' then
      begin
        TGerenciarLogEnvioSelo.GravarLogEnvioEmail(vpSistema, 'Destinatário do e-mail não foi informado');
        Exit;
      end;

      viArquivoListaSelos := TStringList.Create;
      try
        try
          viLocalArquivo := ExtractFilePath(ParamStr(0)) + 'selos_' + FormatDateTime('ddmmyyyy_hhmmss', dtmConexao.DataHoraBanco) + '.txt';

          viArquivoListaSelos.Text := viListaSelos;
          viArquivoListaSelos.SaveToFile(viLocalArquivo);

          viTextoEmail := TCompress.DeCompressString(viConfigEmail.getTextoEmail);

          if not TEmail.EnviarEMail(
            viConfigEmail.getEmailEnvio, { vpEmailRemetente       : String  }
            viConfigEmail.getUserName,   { vpUsuario              : String  }
            viConfigEmail.getPassWord,   { vpSenha                : String  }
            viConfigEmail.getAutenticar, { vpAutentica            : Boolea  }
            viConfigEmail.getHostSmtp,   { vpSmtp                 : String  }
            False,                       { vpAuth_SSL             : Boolean }
            viConfigEmail.getUserName,   { vpNome                 : String  }
            viConfigEmail.getPorta,      { vpPorta_smtp           : Integer }
            viTextoEmail,                { vpTexto                : String  }
            viDestinatario,              { vpEmailDestinatario    : String  }
            'Selos não enviados',        { vpAssunto              : String  }
            viLocalArquivo,              { vpAnexo                : String  }
            False,                       { vpexcluirAnexo         : Boolean }
            viMensagemEmail,             { vpmensagemResult       : String  }
            False                        { vpsolicitarConfirmacao : Boolean }
            ) then
          begin
            TGerenciarLogEnvioSelo.GravarLogEnvioEmail(vpSistema, viMensagemEmail);
            Exit;
          end;

        except
          on e: Exception do
          begin
            TGerenciarLogEnvioSelo.GravarLogEnvioEmail(vpSistema, e.Message);
            raise;
          end;
        end;

      finally
        FreeAndNil(viArquivoListaSelos);

        DeleteFile(viLocalArquivo);
      end;

    except
      on e: Exception do
      begin
        TGerenciarLogEnvioSelo.GravarLogEnvioEmail(vpSistema, e.Message);
        raise;
      end;
    end;

  finally
    FreeAndNil(viConfigEmail);
  end;
end;

procedure TEnviadorSelosTJBusiness.EnviarSelos(
  const vpSistema: string;
  const vpValue: TRegraEnvioSeloList);
{$REGION 'Constantes'}
const
  CI_TABELA_SEQUENCIA: string = 'SELO_CODIGO_EXPORTACAO';
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viSeloLivroList: TSeloLivroList;
  viSeloLivroListVerificado: TSeloLivroList;
  viSeloLivro: ISeloLivro;
  viDataExportacao: TDateTime;
  viCodigoExportacao: Integer;
  viSequenciaBusiness: TSequenciaBusiness;
  viSequencia: ISequencia;
  viGerenciarLogEnvioSelo: TGerenciarLogEnvioSelo;
  viDataEnvio: TDateTime;
  viLogEnvioSelo: TLogEnvioSelo;
  viLogEnvioSeloList: TObjectList<TLogEnvioSelo>;
  viCodigoAto: string;
  viAtosRetornoTJ_GO: TDataSet;
{$ENDREGION}
begin
  viDataEnvio := FDataHoraServidor;

  viLogEnvioSeloList := TObjectList<TLogEnvioSelo>.Create(True);
  viSeloLivroListVerificado := TSeloLivroList.Create;
  try
    try
      // 1º Passo - Obter os selos utilizados que ainda não foram exportados
      viSeloLivroList := GetList(vpValue);
      try
        if CompareValue(viSeloLivroList.Count, ZeroValue) = EqualsValue then
          Exit;

        {
          2º Passo - Validar os selos obtidos antes do envio.
          Os selos não validados são os que serão enviados.
        }
        for viSeloLivro in viSeloLivroList do
        begin
          if viSeloLivro.Validado then
            Continue;

          if FSelosTJ_GO_Business.HasValue then
          begin
            viCodigoAto := FormatadorMascaraSelo.FormatarMascaraSelo(
              viSeloLivro);

            viSeloLivro.Validado := FSelosTJ_GO_Business.Value.Validar(
              viCodigoAto);
          end
          else
            viSeloLivro.Validado := ValidacaoSelosTJ.Validar(viSeloLivro);

          if viSeloLivro.Validado then
          begin
            SeloLivroDAO.AlterarValidado(viSeloLivro);
            Continue;
          end;

          viSeloLivroListVerificado.Add(viSeloLivro);
        end;

        if CompareValue(viSeloLivroListVerificado.Count, ZeroValue) = EqualsValue then
          Exit;

        // 3º Passo - Atribuir dados de exportação
        viDataExportacao := FDataHoraServidor;
        viCodigoExportacao := ZeroValue;

        viSequenciaBusiness := TSequenciaBusiness.Create;
        try
          viSequenciaBusiness.SequenciaDAO := SequenciaDAO;

          viSequencia := viSequenciaBusiness.GerarSequencia(CI_TABELA_SEQUENCIA);

          if Assigned(viSequencia) then
            viCodigoExportacao := viSequencia.Sequencia;
        finally
          FreeAndNil(viSequenciaBusiness);
        end;

        for viSeloLivro in viSeloLivroListVerificado do
        begin
          viSeloLivro.DataExportacao := viDataExportacao;
          viSeloLivro.CodigoExportacao := viCodigoExportacao;
        end;

        SeloLivroDAO.AlterarExportacao(viSeloLivroListVerificado, viDataExportacao, viCodigoExportacao);

        // 4º Passo - Gerar e enviar selos
        if FSelosTJ_GO_Business.HasValue then
        begin
          viAtosRetornoTJ_GO := CriarAtosRetornoTJ_GO(
            viSeloLivroListVerificado);

          try
            // A = Automático
            FSelosTJ_GO_Business.Value.RetornarAtos(
              viAtosRetornoTJ_GO,
              'A',
              0);
          finally
            viAtosRetornoTJ_GO.Close;
            viAtosRetornoTJ_GO.Free;
          end;
        end
        else
        begin
          GeradorSelosTJ.SeloLivroList := viSeloLivroListVerificado;
          EnvioSelosTJ.EnviarSelos(GeradorSelosTJ.Gerar);
        end;

        // 5º Passo - Validar os selos enviados e alimentar a lista de objetos do log
        for viSeloLivro in viSeloLivroListVerificado do
        begin
          if FSelosTJ_GO_Business.HasValue then
          begin
            viCodigoAto := FormatadorMascaraSelo.FormatarMascaraSelo(
              viSeloLivro);

            viSeloLivro.Validado := FSelosTJ_GO_Business.Value.Validar(
              viCodigoAto);
          end
          else
            viSeloLivro.Validado := ValidacaoSelosTJ.Validar(viSeloLivro);

          viLogEnvioSelo := TLogEnvioSelo.Create;
          viLogEnvioSelo.SetSeloLivroId(viSeloLivro.SeloLivroID);
          viLogEnvioSelo.SetDataEnvio(viDataEnvio);

          if  viSeloLivro.Validado then
          begin
            SeloLivroDAO.AlterarValidado(viSeloLivro);

            viLogEnvioSelo.SetSituacao('V');
            viLogEnvioSelo.SetObservacao('Selo enviado!');
          end
          else
          begin
            viLogEnvioSelo.SetSituacao('I');
            viLogEnvioSelo.SetObservacao('Selo não enviado!');
          end;

          viLogEnvioSeloList.Add(viLogEnvioSelo);
        end;

      finally
        FreeAndNil(viSeloLivroList);
      end;

    except
      on E: Exception do
      begin
        for viSeloLivro in viSeloLivroListVerificado do
        begin
          viLogEnvioSelo := TLogEnvioSelo.Create;
          viLogEnvioSelo.SetSeloLivroId(viSeloLivro.SeloLivroID);
          viLogEnvioSelo.SetDataEnvio(viDataEnvio);
          viLogEnvioSelo.SetSituacao('I');
          viLogEnvioSelo.SetObservacao('Selo não enviado!' + sLineBreak + e.Message);

          viLogEnvioSeloList.Add(viLogEnvioSelo);
        end;

        raise;
      end;
    end;
  finally
    // 6º Passo - Gravar log de envio para os registros da lista
    for viLogEnvioSelo in viLogEnvioSeloList do
    begin
      viGerenciarLogEnvioSelo := TGerenciarLogEnvioSelo.Create;
      try
        viGerenciarLogEnvioSelo.GravarLogEnvioSelo(
          vpSistema,
          viLogEnvioSelo.getSeloLivroId,
          viLogEnvioSelo.getDataEnvio,
          viLogEnvioSelo.getSituacao,
          viLogEnvioSelo.getObservacao
        );

      finally
        FreeAndNil(viGerenciarLogEnvioSelo);
      end;
    end;

    FreeAndNil(viLogEnvioSeloList);
    FreeAndNil(viSeloLivroListVerificado);
  end;
end;

function TEnviadorSelosTJBusiness.GetEnvioSelosTJ: IEnvioSelosTJ;
begin
  Result := FEnvioSelosTJ;
end;

function TEnviadorSelosTJBusiness.GetFormatadorMascaraSelo:
  IFormatadorMascaraSelo;
begin
  Result := FFormatadorMascaraSelo;
end;

//function TEnviadorSelosTJBusiness.GetGeradorLogEnvioSelo: IGeradorLogEnvioSelo;
//begin
//  Result := FGeradorLogEnvioSelo;
//end;

function TEnviadorSelosTJBusiness.GetGeradorSelosTJ: IGeradorSelosTJ;
begin
  Result := FGeradorSelosTJ;
end;

function TEnviadorSelosTJBusiness.GetList(
  const vpValue: TRegraEnvioSeloList): TSeloLivroList;
{$REGION 'Constantes'}
const
  CI_DATA_EXPORTACAO_IS_NULL: Boolean = True;
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viRegraEnvioSelo: IRegraEnvioSelo;
  viSeloSituacaoBusiness: TSeloSituacaoBusiness;
  viSeloSituacao: ISeloSituacao;
  viCampoOrdenacaoList: TCampoOrdenacaoList;
  viCampoOrdenacao: ICampoOrdenacao;
  viSeloLivroList: TSeloLivroList;
  viComparer: IComparer<ISeloLivro>;
  viData: TDateTime;
  viDataFinal: TDateTime;
  viSeloLivro: ISeloLivro;
  viIntervalo: Integer;
  viRegraEnvioDict: TDictionary<Integer, IList<ISeloGrupo>>;
  viPair: TPair<Integer, IList<ISeloGrupo>>;
  i: Integer;
{$ENDREGION}
begin
  Result := TSeloLivroList.Create;

  viSeloSituacaoBusiness := TSeloSituacaoBusiness.Create;
  viSeloSituacaoBusiness.SeloSituacaoDAO := SeloSituacaoDAO;

  try
    viSeloSituacao := viSeloSituacaoBusiness.SeloSituacaoUtilizado;
  finally
    FreeAndNil(viSeloSituacaoBusiness);
  end;

  viRegraEnvioDict := TDictionary<Integer, IList<ISeloGrupo>>.Create;
  try
    for viRegraEnvioSelo in vpValue do
    begin
      viIntervalo := viRegraEnvioSelo.Intervalo;

      if not viRegraEnvioDict.ContainsKey(viIntervalo) then
        viRegraEnvioDict.Add(viIntervalo, TListFactory<ISeloGrupo>.New.GetInstance);

      viRegraEnvioDict[viIntervalo].Add(viRegraEnvioSelo.SeloGrupo);
    end;

    viData := dtmConexao.DataHoraBanco;

    for viPair in viRegraEnvioDict do
    begin
      viDataFinal := IncMinute(viData, -viPair.Key);

      viSeloLivroList := SeloLivroDAO.GetList(
        viSeloSituacao,
        viPair.Value,
        viDataFinal,
        CI_DATA_EXPORTACAO_IS_NULL,
        nil);

      try
        Result.AddRange(
          viSeloLivroList);
      finally
        FreeAndNil(
          viSeloLivroList);
      end;
    end;
  finally
    viRegraEnvioDict.Free;
  end;

 viCampoOrdenacaoList := TCampoOrdenacaoList.Create;
  try
    viCampoOrdenacao := TCampoOrdenacao.Create(
      TSeloLivroComparer.CG_NUMERO_AGRUPADOR);

    viCampoOrdenacaoList.Add(viCampoOrdenacao);

    viComparer := TSeloLivroComparer.Create(viCampoOrdenacaoList);
    Result.Sort(viComparer);

    {$REGION 'Colocar selos agrupadores primeiro'}
    for i := ZeroValue to Pred(Result.Count) do
    begin
      viSeloLivro := Result[I];

      if viSeloLivro.NumeroAgrupador.Equals(
        FormatadorMascaraSelo.FormatarMascaraSelo(viSeloLivro)) then
      begin
        Result.Delete(I);
        Result.Insert(ZeroValue, viSeloLivro);
      end;
    end;
    {$ENDREGION}
  finally
    FreeAndNil(viCampoOrdenacaoList);
  end;
end;

function TEnviadorSelosTJBusiness.GetListEmail(
  const vpMinutosListarSelos: Integer
): TSeloLivroList;
{$REGION 'Constantes'}
const
  CI_DATA_EXPORTACAO_IS_NULL: Boolean = True;
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viRegraEnvioSelo: IRegraEnvioSelo;
  viSeloSituacaoBusiness: TSeloSituacaoBusiness;
  viSeloSituacao: ISeloSituacao;
  viCampoOrdenacaoList: TCampoOrdenacaoList;
  viCampoOrdenacao: ICampoOrdenacao;
  viSeloLivroList: TSeloLivroList;
  viComparer: IComparer<ISeloLivro>;
  viData: TDateTime;
  viDataFinal: TDateTime;
  viSeloLivro: ISeloLivro;
  viIntervalo: Integer;
  viRegraEnvioDict: TDictionary<Integer, IList<ISeloGrupo>>;
  viPair: TPair<Integer, IList<ISeloGrupo>>;
  viFracaoDia: Double;
  i: Integer;
{$ENDREGION}
begin
  Result := TSeloLivroList.Create;

  viSeloSituacaoBusiness := TSeloSituacaoBusiness.Create;
  viSeloSituacaoBusiness.SeloSituacaoDAO := SeloSituacaoDAO;

  try
    viSeloSituacao := viSeloSituacaoBusiness.SeloSituacaoUtilizado;
  finally
    FreeAndNil(viSeloSituacaoBusiness);
  end;

  viDataFinal := dtmConexao.DataHoraBanco;

  viFracaoDia := vpMinutosListarSelos / CL_QTDE_MINUTOS_DIA;

  viSeloLivroList := SeloLivroDAO.GetList(
    viSeloSituacao,
    viDataFinal - viFracaoDia,
    nil,
    False);

  try
    Result.AddRange(viSeloLivroList);
  finally
    FreeAndNil(viSeloLivroList);
  end;

  viCampoOrdenacaoList := TCampoOrdenacaoList.Create;
  try
    viCampoOrdenacao := TCampoOrdenacao.Create(
      TSeloLivroComparer.CG_NUMERO_AGRUPADOR);

    viCampoOrdenacaoList.Add(viCampoOrdenacao);

    viComparer := TSeloLivroComparer.Create(viCampoOrdenacaoList);
    Result.Sort(viComparer);

    {$REGION 'Colocar selos agrupadores primeiro'}
    for i := ZeroValue to Pred(Result.Count) do
    begin
      viSeloLivro := Result[I];

      if viSeloLivro.NumeroAgrupador.Equals(
        FormatadorMascaraSelo.FormatarMascaraSelo(viSeloLivro)) then
      begin
        Result.Delete(I);
        Result.Insert(ZeroValue, viSeloLivro);
      end;
    end;
    {$ENDREGION}
  finally
    FreeAndNil(viCampoOrdenacaoList);
  end;
end;

function TEnviadorSelosTJBusiness.GetSeloLivroDAO: ISeloLivroDAO;
begin
  Result := FSeloLivroDAO;
end;

function TEnviadorSelosTJBusiness.GetSeloSituacaoDAO: ISeloSituacaoDAO;
begin
  Result := FSeloSituacaoDAO;
end;

function TEnviadorSelosTJBusiness.GetSequenciaDAO: ISequenciaDAO;
begin
  Result := FSequenciaDAO;
end;

function TEnviadorSelosTJBusiness.GetValidacaoSelosTJ: IValidacaoSelosTJ;
begin
  Result := FValidacaoSelosTJ;
end;

class function TEnviadorSelosTJBusiness.New(
  const vpSelosTJ_GO_Business: IMaybe<ISelosTJ_GO_Business>;
  const vpDataHoraServidor: TDataHoraServidor): TEnviadorSelosTJBusiness;
begin
  Result := Create(
    vpSelosTJ_GO_Business,
    vpDataHoraServidor);
end;

procedure TEnviadorSelosTJBusiness.SetEnvioSelosTJ(
  const Value: IEnvioSelosTJ);
begin
  FEnvioSelosTJ := Value;
end;

procedure TEnviadorSelosTJBusiness.SetFormatadorMascaraSelo(
  const Value: IFormatadorMascaraSelo);
begin
  FFormatadorMascaraSelo := Value;
end;

//procedure TEnviadorSelosTJBusiness.SetGeradorLogEnvioSelo(
//  const Value: IGeradorLogEnvioSelo);
//begin
//  FGeradorLogEnvioSelo := Value;
//end;

procedure TEnviadorSelosTJBusiness.SetGeradorSelosTJ(
  const Value: IGeradorSelosTJ);
begin
  FGeradorSelosTJ := Value;
end;

procedure TEnviadorSelosTJBusiness.SetSeloLivroDAO(
  const Value: ISeloLivroDAO);
begin
  FSeloLivroDAO := Value;
end;

procedure TEnviadorSelosTJBusiness.SetSeloSituacaoDAO(
  const Value: ISeloSituacaoDAO);
begin
  FSeloSituacaoDAO := Value;
end;

procedure TEnviadorSelosTJBusiness.SetSequenciaDAO(
  const Value: ISequenciaDAO);
begin
  FSequenciaDAO := Value;
end;

procedure TEnviadorSelosTJBusiness.SetValidacaoSelosTJ(
  const Value: IValidacaoSelosTJ);
begin
  FValidacaoSelosTJ := Value;
end;

end.
