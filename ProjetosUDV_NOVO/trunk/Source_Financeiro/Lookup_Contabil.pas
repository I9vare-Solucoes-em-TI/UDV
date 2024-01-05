unit Lookup_Contabil;

interface

uses
  SysUtils, Classes, cxDBEditRepository, DB, DBClient, SimpleDS,
  cxEditRepositoryItems, cxEdit, cxDropDownEdit, Forms, Windows, Controls, cxPC,
  cxStyles, cxDBEdit, cxClasses, dxBarExtItems, ImgList, DbxDevartInterBase, cxBarEditItem, dxBar,
  MensagemUtils;

type

  TCompromissoVencido = Record
    ValorAgendado, ValorPago, Valor : Currency;
    PeriodoInicial, PeriodoFinal, AnoMesLancamento, SituacaoLocal, BoletoId, ReciboId, Especie,
    Operacao, Historico, Observacao, IR, DocumentoNumero, RegistroParcial,
    Obrigatorio, LancamentoCompromissoId, SituacaoGeral,
    PeriodoTodosFinal, PeriodoTodosInicial, DataRealizacao, Descricao : String;
    PeriodoTipo, Dia, TipoPagamento, CaixaID, OrcamentoId : Integer;
    CentroCustoId, BalanceteGrupoId,
    ContabilContaId, PessoaId, LivroAgendamentoId, ReservaId : Integer;
    DataVencimento : TDate;
    MostrarMensagem, AtualizarAgendado, NenhumaAlteracao : Boolean;
  end;

  TDadosLivroCaixa = Record
    DataLancamento, DataVencimento, DataPagamento, DataPagBoleto, Referencia, Operacao, Especie, Observacao, Form, Historico,
    AnoMesRegistro, AnoMesReferencia, ClienteID, Contrato, IR, DocumentoNumero, RegistroParcial,
    IdentificacaoTipo, DocTipo, RefPeriodo, AssociadoFavorecido, DescricaoAgrupador, RelatorioInterno : String;
    PessoaId, ProcessoID, ContabilContaID, CentroCustoId, BalanceteGrupoId, ContabilGrupoId,
    CaixaID, LivroFinanceiroID, Tipo,
    LivroCaixaId, LivroAgendamentoId, CaixaTransferenciaId, ProvisaoTransferenciaId, CompromissoVencidoId,
    OrcamentoId, PeriodoId, ReservaId, AssociadoId, IdentificacaoId, TipoDespesaID, ResponsavelId, Ordem : Integer;
    ValorPago, ValorCompromisso : Currency;
    Confirmado, Novo, Automatico, DuplicarItem, Favorito, Bloqueado : Boolean;
  End;

  TdtmLookupContabil = class(TDataModule)
    cxEditRepository1: TcxEditRepository;
    Combo_EntradaSaida: TcxEditRepositoryImageComboBoxItem;
    Combo_OperacaoContabil: TcxEditRepositoryImageComboBoxItem;
    sqlGrupoContabilTodos: TSimpleDataSet;
    dtsGrupoContabilTodos: TDataSource;
    sqlGrupoContabilAtivos: TSimpleDataSet;
    dtsGrupoContabiAtivos: TDataSource;
    Lista_GrupoContabilTodos: TcxEditRepositoryLookupComboBoxItem;
    Lista_GrupoContabilAtivos: TcxEditRepositoryLookupComboBoxItem;
    sqlGrupoContabilSaidas: TSimpleDataSet;
    dtsGrupoContabilSaidas: TDataSource;
    sqlGrupoContabilEntradas: TSimpleDataSet;
    dtsGrupoContabiEntradas: TDataSource;
    Lista_GrupoContabilSaidas: TcxEditRepositoryLookupComboBoxItem;
    Lista_GrupoContabilEntradas: TcxEditRepositoryLookupComboBoxItem;
    sqlBalanceteGrupo: TSimpleDataSet;
    dtsBalanceteGrupo: TDataSource;
    Lista_BalanceteGrupoDescricao: TcxEditRepositoryLookupComboBoxItem;
    sqlPlanoContasAtivo: TSimpleDataSet;
    dtsPlanoContasAtivo: TDataSource;
    sqlPlanoContasTodos: TSimpleDataSet;
    dtsPlanoContasTodos: TDataSource;
    Lista_PlanoContasAtivo: TcxEditRepositoryLookupComboBoxItem;
    Lista_PlanoContasTodos: TcxEditRepositoryLookupComboBoxItem;
    sqlPlanoContasReceitas: TSimpleDataSet;
    dtsPlanoContasReceitas: TDataSource;
    Lista_PlanoContasReceitas: TcxEditRepositoryLookupComboBoxItem;
    Combo_Periodo: TcxEditRepositoryImageComboBoxItem;
    Combo_SituacaoPagamento: TcxEditRepositoryImageComboBoxItem;
    Combo_SituacaoCompLocal: TcxEditRepositoryImageComboBoxItem;
    Combo_SituacaoCompGeralImg: TcxEditRepositoryImageComboBoxItem;
    Combo_PeriodoLimitado: TcxEditRepositoryImageComboBoxItem;
    Combo_SituacaoCompGeral: TcxEditRepositoryImageComboBoxItem;
    Lista_BalanceteGrupoSigla: TcxEditRepositoryLookupComboBoxItem;
    sqlCentroCustoTodos: TSimpleDataSet;
    dtsCentroCustoTodos: TDataSource;
    sqlCentroCustoAtivo: TSimpleDataSet;
    dtsCentroCustoAtivo: TDataSource;
    Lista_CentroCustoTodos: TcxEditRepositoryLookupComboBoxItem;
    Lista_CentroCustoAtivo: TcxEditRepositoryLookupComboBoxItem;
    sqlCompReceitaTodos: TSimpleDataSet;
    dtsCompReceitaTodos: TDataSource;
    Lista_CompReceitassTodos: TcxEditRepositoryLookupComboBoxItem;
    Combo_SituacaoBoleto: TcxEditRepositoryImageComboBoxItem;
    sqlPlanoContasDespesasTodos: TSimpleDataSet;
    dtsPlanoContasDespesasTodos: TDataSource;
    dtsPlanoContasDespesasAtivo: TDataSource;
    sqlPlanoContasDespesasAtivo: TSimpleDataSet;
    Lista_PlanoContasDespTodas: TcxEditRepositoryLookupComboBoxItem;
    Lista_PlanoContasDespAtivos: TcxEditRepositoryLookupComboBoxItem;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    sqlCompSaidaTodos: TSimpleDataSet;
    dtsCompSaidaTodos: TDataSource;
    Lista_CompSaidasTodos: TcxEditRepositoryLookupComboBoxItem;
    sqlCabecalho: TSimpleDataSet;
    dtsCabecalho: TDataSource;
    sqlGrupoContabilAtivosDESCRICAO: TStringField;
    sqlGrupoContabilAtivosCONTABIL_GRUPO_ID: TFMTBCDField;
    sqlGrupoContabilAtivosBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlGrupoContabilTodosDESCRICAO: TStringField;
    sqlGrupoContabilTodosCONTABIL_GRUPO_ID: TFMTBCDField;
    sqlGrupoContabilTodosBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlGrupoContabilEntradasDESCRICAO: TStringField;
    sqlGrupoContabilEntradasCONTABIL_GRUPO_ID: TFMTBCDField;
    sqlGrupoContabilEntradasBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlBalanceteGrupoDESCRICAO: TStringField;
    sqlBalanceteGrupoBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlBalanceteGrupoSIGLA: TStringField;
    sqlCentroCustoTodosDESCRICAO: TStringField;
    sqlCentroCustoTodosCENTRO_CUSTO_ID: TFMTBCDField;
    sqlCentroCustoTodosBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlPlanoContasReceitasCONTABIL_CONTA_ID: TFMTBCDField;
    sqlPlanoContasReceitasDESCRICAO: TStringField;
    sqlPlanoContasReceitasBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlPlanoContasAtivoCONTABIL_CONTA_ID: TFMTBCDField;
    sqlPlanoContasAtivoDESCRICAO: TStringField;
    sqlCompReceitaTodosDESCRICAO: TStringField;
    sqlCompReceitaTodosCONTABIL_CONTA_ID: TFMTBCDField;
    sqlPlanoContasDespesasTodosDESCRICAO: TStringField;
    sqlPlanoContasDespesasTodosCONTABIL_CONTA_ID: TFMTBCDField;
    sqlPlanoContasDespesasTodosBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlPlanoContasDespesasAtivoDESCRICAO: TStringField;
    sqlPlanoContasDespesasAtivoCONTABIL_CONTA_ID: TFMTBCDField;
    sqlPlanoContasDespesasAtivoBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlPlanoContasTodosCONTABIL_CONTA_ID: TFMTBCDField;
    sqlPlanoContasTodosDESCRICAO: TStringField;
    sqlCabecalhoBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlCabecalhoCABECALHO: TBlobField;
    sqlCabecalhoTEXTO_CABECALHO: TBlobField;
    sqlCompSaidaTodosDESCRICAO: TStringField;
    sqlCompSaidaTodosCONTABIL_CONTA_ID: TFMTBCDField;
    sqlCentroCustoAtivoDESCRICAO: TStringField;
    sqlCentroCustoAtivoCENTRO_CUSTO_ID: TFMTBCDField;
    sqlCentroCustoAtivoBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlGrupoContabilSaidasDESCRICAO: TStringField;
    sqlGrupoContabilSaidasCONTABIL_GRUPO_ID: TFMTBCDField;
    sqlGrupoContabilSaidasBALANCETE_GRUPO_ID: TFMTBCDField;
    ComboEspeciePagamento: TcxEditRepositoryImageComboBoxItem;
    ComboSituacaoPagamento: TcxEditRepositoryImageComboBoxItem;
    ComboDespesaReceitaOutros: TcxEditRepositoryImageComboBoxItem;
    Combo_OperacaoLivroCaixa: TcxEditRepositoryImageComboBoxItem;
    sqlCaixa: TSimpleDataSet;
    dtsCaixa: TDataSource;
    sqlCaixaDESCRICAO: TStringField;
    sqlCaixaCAIXA_ID: TFMTBCDField;
    Lista_CaixaTodos: TcxEditRepositoryLookupComboBoxItem;
    imgCaixa: TImageList;
    Combo_CaixaSituacao: TcxEditRepositoryImageComboBoxItem;
    sqlPessoasTodas: TSimpleDataSet;
    sqlPessoasTodasNOME: TStringField;
    sqlPessoasTodasPESSOA_ID: TFMTBCDField;
    dtsPessoasTodas: TDataSource;
    Lista_PessoaTodas: TcxEditRepositoryLookupComboBoxItem;
    Combo_HonorarioPeriodo: TcxEditRepositoryImageComboBoxItem;
    Combo_ContratoItemSituacao: TcxEditRepositoryImageComboBoxItem;
    ComboDespesaReceitaSomente: TcxEditRepositoryImageComboBoxItem;
    dtsCaixaAtivos: TDataSource;
    sqlCaixaAtivos: TSimpleDataSet;
    StringField1: TStringField;
    FMTBCDField1: TFMTBCDField;
    Lista_CaixaAtivos: TcxEditRepositoryLookupComboBoxItem;
    sqlCaixaTodosAtivos: TSimpleDataSet;
    dtsCaixaTodosAtivos: TDataSource;
    sqlCaixaTodosAtivosDESCRICAO: TStringField;
    sqlCaixaTodosAtivosCAIXA_ID: TFMTBCDField;
    Lista_CaixaTodosAtivos: TcxEditRepositoryLookupComboBoxItem;
    sqlReservasAtivas: TSimpleDataSet;
    dtsReservasAtivas: TDataSource;
    sqlReservasAtivasDESCRICAO: TStringField;
    sqlReservasAtivasRESERVA_ID: TFMTBCDField;
    Lista_ReservasAtivas: TcxEditRepositoryLookupComboBoxItem;
    Combo_DocumentoTipo: TcxEditRepositoryImageComboBoxItem;
    Combo_ReferenciaPeriodo: TcxEditRepositoryImageComboBoxItem;
    Combo_ReferenciaTipo: TcxEditRepositoryImageComboBoxItem;
    sqlCaixaTodosAtivosRESUMO: TStringField;
    Lista_CaixaResumo: TcxEditRepositoryLookupComboBoxItem;
    sqlCaixaRESUMO: TStringField;
    sqlTipoDespesaTodos: TSimpleDataSet;
    dtsTipoDespesaTodos: TDataSource;
    sqlTipoDespesaTodosDESCRICAO: TStringField;
    sqlTipoDespesaTodosTIPO_DESPESA_ID: TFMTBCDField;
    sqlTipoDespesaAtivos: TSimpleDataSet;
    StringField2: TStringField;
    FMTBCDField2: TFMTBCDField;
    dtsTipoDespesaAtivos: TDataSource;
    Lista_TipoDespesaTodos: TcxEditRepositoryLookupComboBoxItem;
    Lista_TipoDespesaAtivos: TcxEditRepositoryLookupComboBoxItem;
    Combo_DocTipoLista: TcxEditRepositoryImageComboBoxItem;
    sqlBalanceteAtivos: TSimpleDataSet;
    dtsBalanceteAtivos: TDataSource;
    sqlBalanceteAtivosDESCRICAO: TStringField;
    sqlBalanceteAtivosBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlBalanceteAtivosSIGLA: TStringField;
    sqlBalanceteAtivosPRINCIPAL: TStringField;
    sqlCompromissoReserva: TSimpleDataSet;
    Combo_FaturaTipo: TcxEditRepositoryImageComboBoxItem;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    vlOrdemLivroCaixa : Integer;
  public
    procedure AtualizarTabelas;
    procedure CarregarPeriodo(vpComBoBox : TcxComboBox; vpDBComBoBox : TcxDBComboBox; vpTipo : Integer; vpAnoMesInicial, vpAnoMesFinal : String);
    Function InclementarAnoMes(vpAnoMes : String):String;
    Function DeclementarAnoMes(vpAnoMes : String; vpQtd : Integer = 1):String;
    Function FormatarAnoMes(vpAnoMes : String; vpTirarBarra : String = ''):String;
    procedure MarcarDesmarcarCompromissos(vpSqlDataSet : TSimpleDataSet; vpMarcar : Boolean);
    procedure MarcarDesmarcarCompromissosClient(vpSqlDataSet : TClientDataSet; vpMarcar : Boolean);
    Function CalcularPeriodoFinalAnoMes(vpAnoMes : String; vpQtd : Integer; vpAdicionarBarra : Boolean = False):String;

    // Compromissos
    Procedure AdicionarCompromisso(vpVencido, vpAgendado,
          vpDeterminado : Boolean; vpOperacao : String);
    Procedure ValidarIntervalodeAnoMes(vpAnoMesInicial, vpAnoMesFinal: TcxComboBox; vpPeriodo : String);
    procedure RegistrarCompromissoVencido(vpCount : Integer; vpQtdGravar, vpCompromissoId : String;
              vpQtdAdicional, vpValorDiferenca : Currency; vpAtualizar: Boolean);

    // Balancete
    procedure CarregarTabBalancete(vpTabBalancete : TcxTabControl);
    Function SetarBalanceteItem(vpBalanceteId : Integer):Integer;
    procedure FiltrarGrupoContasBalancete(vpSimpleDataSet : TSimpleDataSet; vpBalanceteId : Integer;
           vpFiltrar : Boolean);

    procedure GerarBoleto(vpData : String; vpTodos : Boolean; vpPessoa : String = ''; vpGrupo : String = '');
    procedure LerDadadosConfigEmail(vpTabela : String);
    Function PegarVencimentoPadrao(vpDia : String):String;
    Function PegarAnoMes(vpData : String; vpAnterior : Boolean = False):Integer;
    Function ConverterAnoMesBase(vpValor : String; vpIgnorarBarra : Boolean = False):String;
    Function VefificaExistenciaBoleto(vpPessoaId : String):Boolean;
    Procedure VerificarEdicao(vpReferencia, vpOperacao : String);
    procedure CarregarCabecalho(vpBalanceteId : Integer);
    procedure VerificarProgramacaoAjuste(vpCompromissoAgendadoId, vpAnoMes : String);
    procedure CarregarSaldoCaixa(vpClientDataSet : TClientDataSet; vpTodos : Boolean = False;
            vpSomenteLista : Boolean = False);
    procedure CarregarSaldoDetalhado(vpClientDataSet : TClientDataSet; vpDataInicial, vpDataFinal : String;
             vpBalancete : Boolean;  vpInativos : Boolean);
    Function MesAnoReferencia(vpData : String):String;
    Function CalcularSaldoCaixa(vpTipoCaixa, vpCaixaId, vpBalanceteId : String; vpDataFinal : string = ''; vpCentroCusto : Integer = 0):Currency;
    Function CalcularPrevisaoCaixa(vpCondicao, vpOperacao : String):Currency;
    Function CalcularPrevisaoAgendamento(vpCondicao, vpOperacao : String):Currency;
    function PrepararSqlSoma(vpTipoCaixa, vpCaixaID, vpBalanceteId, vpTipo, vpPessoaID  : String; vpData : string = '';
          vpPrevisao : String = ''; vpData2 : string = ''; vpCentroCusto : Integer = 0):Currency;
    procedure RegistrarRecebimentoFinanceiro(vpTransferenciaId : Integer = 0; vpAtualizar : Boolean = False);
    procedure VerificarProvimentoMes(vpLancamentoCompId, vpAnoMes : string);
    procedure CarregarProgress(var vpProgress : TdxBarProgressItem; vpMax : Integer; vpCaption : String; vpValor : Currency);
    procedure CarregarSaldoVisualizacao(var vpLabel : TdxBarStatic; vpCaption : String; vpValor : Currency;
            vpModificarIcone : Boolean = False);
    Function PegarDataFinalMes(viAnoMes : String):String;
    procedure GravarHistorico(vpHistorico, vpContabilContaId : string);
    procedure GravarCompromissoPadrao(vpPessoa, vpContabilContaId : string);
    Function VerificarHistoricoPadrao(vpHistorico, vpContabilContaId : string):string;
    procedure CarregarGrupo(vpCombobox : TcxComboBox; vpGrupoContabilid : string);
    procedure PreencherSaldoLabel(vpCaption : String; vpValor : Currency; vpLabel : TdxBarStatic;
             vpMudarIcone : Boolean = False; vpOpcao : String = '');
    procedure CarregarRegistrarLivroCaixa(vpNossoNumero, vpTipoPag, vpEspecie, vpObservacao, vpDescricaoAgrupador : String;
            vpCaixaId : Integer; vpValorJuros : Currency; vpCompromissoJurosId, vpReservaId : Integer; vpDataRegBoleto : String = '');
    procedure CarregarSaldoReservas(vpClientDataSet, vpClientDataSetSaldo : TClientDataSet;
           vpAnoMes : String; vpSomenteMesPesquisa : Boolean = False);
    procedure VerificaAnoMesFechado(vpData : String);
    procedure InicializarVariaveisLivroCaixa;
    procedure LimparClientDataSet(vpClientDataSet : TClientDataSet);
    function LocalizarBoleto(vpPessoaId, vpGrupoId, vpBoletoId : string):String;
 end;

var
  dtmLookupContabil: TdtmLookupContabil;
  vgCedenteAtivo, vgPeriodoAtual, vgBalancetePrincipal : Integer;
  vgCedenteNome, vgReferenciaInicial : String;

  vgCompromissoVencido : TCompromissoVencido;
  vgPeriodoAtualS, vgSincronizarReuni : String;
  vgTabBalancete : array[0..10] of integer;
  vgCentroCustoPrincipal  : array[0..10] of integer;
  vgHabilitarSelecionarGrupo, vlNaoCarregarSaldo, vgFecharAutomatico, vgPermiteAlteracao : Boolean;
  vgPessoaSelecionadaId, vgGrupoSelecionadoId, vgCentroCustoPrincipalId, vgCaixaPrincipalID : Integer;
  vgDadosLivroCaixa : TDadosLivroCaixa;

  vgDataAtualTipo4, vgCondicaoPrecisaoCaixa : String;
  vgDataAtualTipoDate : TDate;

implementation
uses Controles, CadastroBasicoGeral, Rotinas, Lookup_Servico, LookupFinanceiro;

{$R *.dfm}

procedure TdtmLookupContabil.AdicionarCompromisso(vpVencido, vpAgendado,
     vpDeterminado : Boolean; vpOperacao : String);
var
  viFlag, viAtualizar, viQtdLimitada : Boolean;
  viValorDiferenca, viQtdAdicional, viValorPago, viValorAnterior, viValorAtual : Currency;
  viDiferenca, viCompromisoId, viAnoMesFinal, viQtdGravar, viProximoPeriodo, viPeriodoInicial : String;
  viAgendadoExecutar, viCount : Integer;

  Procedure VerificarQtdLimitada;
  begin
    ExecutaSqlAuxiliar(' SELECT QTD_LIMITADA FROM T_CONTABIL_CONTA '+
                       ' WHERE CONTABIL_CONTA_ID = '+ CurrToStr(vgCompromissoVencido.ContabilContaId),0);
    viQtdLimitada := dtmControles.sqlAuxiliar.FieldByName('QTD_LIMITADA').AsString = 'S';
  end;

  function VerificarCompromissoVencido:Boolean;
  var
    viSql : String;
  begin
    viValorDiferenca := 0;
    viValorPago      := 0;
    viDiferenca      :='N';
    viAtualizar      := False;
    viQtdAdicional   := 0;

    VerificarQtdLimitada;

    // Verifica se existe o compromisso em compromissos pendentes.
    viSql := ' SELECT LIVRO_FINANCEIRO_ID, VALOR_AGENDADO, BOLETA_ID '+
             ' FROM J_LIVRO_FINANCEIRO '+
             ' WHERE CONTABIL_CONTA_ID = '+ CurrToStr(vgCompromissoVencido.ContabilContaId)+
             '   AND ANO_MES_REFERENCIA = '+QuotedStr(vgCompromissoVencido.PeriodoInicial)+
             '   AND SITUACAO IN (1,3,4)';

    if vgCompromissoVencido.LivroAgendamentoId > 0 then
      viSql := viSql + ' AND LIVRO_AGENDAMENTO_ID = '+IntToStr(vgCompromissoVencido.LivroAgendamentoId);

    ExecutaSqlAuxiliar(viSql,0);
    if not dtmControles.sqlAuxiliar.IsEmpty then
    begin
       viCompromisoId  := dtmControles.sqlAuxiliar.FieldByName('LIVRO_FINANCEIRO_ID').AsString;

       // Verifica se existe Boleto Vinculado
       if (not dtmControles.sqlAuxiliar.FieldByName('BOLETA_ID').IsNull) and viQtdLimitada then
       begin
         ExecutaSqlAuxiliar(' UPDATE J_LIVRO_FINANCEIRO SET ' +
                            '        ATUALIZADO = '+QuotedStr('T')+
                            ' WHERE LIVRO_FINANCEIRO_ID = ' + viCompromisoId,1);
         Result := False;
         exit;
       end;

       viValorAtual    := dtmControles.sqlAuxiliar.FieldByName('VALOR_AGENDADO').AsCurrency;
       viValorAnterior := viValorAtual;

       viQtdAdicional := viQtdAdicional + dtmControles.GetInt(' SELECT COUNT(LIVRO_FINANCEIRO_ID) FROM J_LIVRO_FINANCEIRO '+
                                                              ' WHERE LIVRO_FINANCEIRO_ID = '+CurrToStr(vgCompromissoVencido.ContabilContaId)+
                                                              '   AND ANO_MES_REFERENCIA = '+QuotedStr(vgCompromissoVencido.PeriodoInicial)+
                                                              '   AND SITUACAO = '+QuotedStr('1'));
      if (viQtdAdicional = 0) or (viQtdLimitada) then
      begin
        if viValorPago = 0 then
        begin
          if vgCompromissoVencido.ValorAgendado <> viValorAtual then
          begin
            viValorDiferenca := vgCompromissoVencido.ValorAgendado;
            viAtualizar := true;
            Result      := True;
          end
          else Result := False;
        end
        else
        begin
          viAtualizar := true;
          if viValorDiferenca = 0 then
            viValorDiferenca := vgCompromissoVencido.ValorAgendado;
          Result := True
        end;
      end
      else Result := True;
    end
    else Result := True;
  end;

begin
  vgCompromissoVencido.NenhumaAlteracao := True;
  viPeriodoInicial := vgCompromissoVencido.PeriodoInicial;
  if vpVencido then
  begin
    viCount := 0;

    repeat
      if VerificarCompromissoVencido then
        if ((StrToInt(vgCompromissoVencido.PeriodoInicial)) <= (StrToInt(vgCompromissoVencido.PeriodoFinal))) or vpDeterminado then
        begin
          vgCompromissoVencido.NenhumaAlteracao := False;
          RegistrarCompromissoVencido(viCount, viQtdGravar, viCompromisoId, viQtdAdicional, viValorDiferenca, viAtualizar);
        end;

      if (vgCompromissoVencido.PeriodoInicial = vgCompromissoVencido.PeriodoFinal) or
         ((vgCompromissoVencido.PeriodoTipo = 2) and (viCount = 60)) or  // Semanal
         ((vgCompromissoVencido.PeriodoTipo = 3) and (viCount = 24)) or  // Quinzenal
         ((vgCompromissoVencido.PeriodoTipo = 4) and (viCount = 6)) or   // Bimestral
         ((vgCompromissoVencido.PeriodoTipo = 6) and (viCount = 4)) or   // Trimestral
         ((vgCompromissoVencido.PeriodoTipo = 5) and (viCount = 2)) then // Anual
        viFlag := True
      else
      begin
        vgCompromissoVencido.PeriodoInicial := dtmLookupContabil.InclementarAnoMes(vgCompromissoVencido.PeriodoInicial);
        viFlag := ((StrToInt(vgCompromissoVencido.PeriodoInicial)) > vgPeriodoAtual) and not vpDeterminado;
      end;
      inc(viCount);
    until (viFlag);
    dtmControles.SimpleAuxiliar.Active := False;
  end;
end;

procedure TdtmLookupContabil.AtualizarTabelas;
begin
  sqlGrupoContabilTodos.Refresh;
  sqlGrupoContabilAtivos.Refresh;
  sqlGrupoContabilSaidas.Refresh;
  sqlGrupoContabilEntradas.Refresh;
  sqlBalanceteAtivos.Refresh;
  sqlBalanceteGrupo.Refresh;
  sqlPlanoContasAtivo.Refresh;
  sqlPlanoContasTodos.Refresh;
  sqlPlanoContasReceitas.Refresh;
  sqlCentroCustoTodos.Refresh;
  sqlCentroCustoAtivo.Refresh;
  sqlCompReceitaTodos.Refresh;
  sqlPlanoContasDespesasAtivo.Refresh;
  sqlPlanoContasDespesasTodos.Refresh;
  sqlCompSaidaTodos.Refresh;
  sqlCaixa.Refresh;
  sqlPessoasTodas.Refresh;
  sqlCaixaAtivos.Refresh;
  sqlCaixaTodosAtivos.Refresh;
  sqlReservasAtivas.Refresh;
  sqlTipoDespesaTodos.Refresh;
  sqlTipoDespesaAtivos.Refresh;
end;

function TdtmLookupContabil.CalcularPeriodoFinalAnoMes(vpAnoMes : String; vpQtd : Integer;
               vpAdicionarBarra : Boolean = False):String;
var
  viMes, viAno, viCont, viAnoAdicional, viMesRestante : Integer;
begin
  viMes  := StrToInt(Copy(vpAnoMes,1,2));
  viAno  := StrToInt(Copy(vpAnoMes,4,4));

  viAnoAdicional := 0;
  viMesRestante  := viMes + (vpQtd-1);
  repeat
    viMesRestante := viMesRestante - 12;
    if viMesRestante > 0 then
      inc(viAnoAdicional)
   until viMesRestante <= 0;

   viAno := viAno + viAnoAdicional;
   if (viMesRestante = 0) and (viAnoAdicional > 0) then
     viMes := 0
   else
     if (viMesRestante < 0 ) and (viAnoAdicional = 0) then
          viMes := viMes + (vpQtd-1)
     else viMes := (viMesRestante * -1);

   if vpAdicionarBarra then
        Result := IntToStr(viMes)+'/'+ IntToStr(viAno)
   else Result := IntToStr(viAno)+IntToStr(viMes);
end;

function TdtmLookupContabil.CalcularPrevisaoAgendamento(vpCondicao,
  vpOperacao: String): Currency;
var
  viSomaDespesas, viSomaReceitas, viSomaRetiradas, viSomaAportes, viSomaOrcamentos : Currency;

  function PrepararSqlPrevisaoSoma(vpTipo : String):Currency;
  var
    viSql : String;
  begin
    viSql := ' SELECT SUM(coalesce( LA .VALOR_PARCELA,0)) '+
             ' FROM J_LIVRO_AGENDAMENTO  LA '+
             '   LEFT OUTER JOIN J_PESSOA P ON' +
             '   LA.PESSOA_ID = P.PESSOA_ID '+
             ' WHERE  LA.OPERACAO = '+QuotedStr(vpTipo)+
             '   AND  LA .SITUACAO IN ('+QuotedStr('1')+','+QuotedStr('2')+')';

    if vpCondicao <> '' then
      viSql := viSql + vpCondicao;

    Result := dtmControles.GetFloat(viSql);
  end;

begin
  if vpOperacao = '' then
  begin
    viSomaDespesas  := PrepararSqlPrevisaoSoma('D');
    viSomaReceitas  := PrepararSqlPrevisaoSoma('R');

    // Aporte e Retirada
    viSomaAportes   := PrepararSqlPrevisaoSoma('AR');
    viSomaRetiradas := PrepararSqlPrevisaoSoma('AD');

   // Or�amentos
   viSomaOrcamentos := PrepararSqlPrevisaoSoma('O');

   Result := (viSomaReceitas+viSomaAportes) -
             (viSomaDespesas+viSomaRetiradas+viSomaOrcamentos);
  end
  else Result := PrepararSqlPrevisaoSoma(vpOperacao);
end;

function TdtmLookupContabil.CalcularPrevisaoCaixa(vpCondicao, vpOperacao : String):Currency;
var
  viSomaDespesas, viSomaReceitas, viSomaRetiradas, viSomaAportes, viSomaOrcamentos : Currency;

  function PrepararSqlPrevisaoSoma(vpTipo : String):Currency;
  var
    viSql : String;
  begin
    if vpTipo <> 'O' then
      viSql := ' SELECT SUM((coalesce(VALOR_AGENDADO,0)) - '+
               '   coalesce((SELECT SUM(VALOR) FROM J_LIVRO_CAIXA '+
               '   WHERE LIVRO_FINANCEIRO_ID = LF.LIVRO_FINANCEIRO_ID),0)) AS VALOR '
    else
     viSql := 'SELECT SUM((coalesce(VALOR_AGENDADO,0)) - '+
              '(coalesce((SELECT SUM(VALOR) FROM J_LIVRO_CAIXA '+
              'WHERE LIVRO_FINANCEIRO_ID = LF.LIVRO_FINANCEIRO_ID),0)) - '+

              '(coalesce((SELECT SUM(LF2.VALOR_AGENDADO) FROM J_LIVRO_FINANCEIRO LF2 '+
              'WHERE LF2.ORCAMENTO_ID = LF.LIVRO_AGENDAMENTO_ID '+
              'AND LF2.ANO_MES_REFERENCIA = LF.ANO_MES_REFERENCIA '+
              'AND SITUACAO IN (1,2)),0)) - '+

              '(coalesce((SELECT SUM(LC2.VALOR) FROM J_LIVRO_CAIXA LC2 '+
              'WHERE LC2.ORCAMENTO_ID = LF.LIVRO_AGENDAMENTO_ID '+
              'AND LC2.ANO_MES_REGISTRO = LF.ANO_MES_REFERENCIA),0)) + '+

              '(coalesce((SELECT SUM(OS.VALOR) FROM J_ORCAMENTO_RESERVA OS '+
              'WHERE OS.LIVRO_FINANCEIRO_DESTINO_ID = LF.LIVRO_FINANCEIRO_ID),0))- '+

              '(coalesce((SELECT SUM(OS.VALOR) FROM J_ORCAMENTO_RESERVA OS '+
              'WHERE OS.LIVRO_FINANCEIRO_ORIGEM_ID = LF.LIVRO_FINANCEIRO_ID),0))) AS VALOR ';

      viSql := viSql +
             '   FROM J_LIVRO_FINANCEIRO LF '+
             '   WHERE OPERACAO = '+QuotedStr(vpTipo)+
             '     AND SITUACAO IN ('+QuotedStr('1')+','+QuotedStr('2')+')';

    if vpCondicao <> '' then
      viSql := viSql + vpCondicao;

    Result := dtmControles.GetFloat(viSql);
  end;

begin
  viSomaDespesas := 0; viSomaReceitas := 0; viSomaAportes := 0; viSomaRetiradas := 0; viSomaOrcamentos := 0;

  if (pos('*D,',vpOperacao) > 0) or (vpOperacao = '') then
    viSomaDespesas  := PrepararSqlPrevisaoSoma('D');

  if (pos('*R,',vpOperacao) > 0) or (vpOperacao = '') then
    viSomaReceitas  := PrepararSqlPrevisaoSoma('R');

  // Aporte e Retirada
  if (pos('*AR,',vpOperacao) > 0) or (vpOperacao = '') then
    viSomaAportes   := PrepararSqlPrevisaoSoma('AR');
  if (pos('*AD,',vpOperacao) > 0) or (vpOperacao = '') then
    viSomaRetiradas := PrepararSqlPrevisaoSoma('AD');

  // Or�amentos
  if (pos('*O,',vpOperacao) > 0) or (vpOperacao = '') then
    viSomaOrcamentos := PrepararSqlPrevisaoSoma('O');

  Result := (viSomaReceitas+viSomaAportes) -
            (viSomaDespesas+viSomaRetiradas+viSomaOrcamentos);
end;


Function TdtmLookupContabil.CalcularSaldoCaixa(vpTipoCaixa, vpCaixaId, vpBalanceteId : String;
          vpDataFinal : string = ''; vpCentroCusto : Integer = 0):Currency;
var
  viSomaDespesas, viSomaReceitas, viSomaRetiradas, viSomaAportes,
  viSomaTransferenciasD, viSomaTransferenciasR : Currency;
begin
  viSomaDespesas  := Arredondamento(maArimeticoSimetrico, PrepararSqlSoma(vpTipoCaixa, vpCaixaId, vpBalanceteId, 'D', '', vpDataFinal, '', '', vpCentroCusto),2);
  viSomaReceitas  := Arredondamento(maArimeticoSimetrico, PrepararSqlSoma(vpTipoCaixa, vpCaixaId, vpBalanceteId, 'R', '', vpDataFinal, '', '', vpCentroCusto),2);

  // Aporte e Retirada
  viSomaAportes   := Arredondamento(maArimeticoSimetrico, PrepararSqlSoma(vpTipoCaixa, vpCaixaId, vpBalanceteId, 'AR', '', vpDataFinal, '', '', vpCentroCusto), 2);
  viSomaRetiradas := Arredondamento(maArimeticoSimetrico, PrepararSqlSoma(vpTipoCaixa, vpCaixaId, vpBalanceteId, 'AD', '', vpDataFinal, '', '', vpCentroCusto),2);

  // Transferencias
  viSomaTransferenciasR  := Arredondamento(maArimeticoSimetrico, PrepararSqlSoma(vpTipoCaixa, vpCaixaId, vpBalanceteId, 'TR', '', vpDataFinal, '', '', vpCentroCusto),2);
  viSomaTransferenciasD  := Arredondamento(maArimeticoSimetrico, PrepararSqlSoma(vpTipoCaixa, vpCaixaId, vpBalanceteId, 'TD', '', vpDataFinal, '', '', vpCentroCusto),2);

  Result := Arredondamento(maArimeticoSimetrico, (viSomaReceitas+viSomaAportes+viSomaTransferenciasR) -
            (viSomaDespesas+viSomaRetiradas+viSomaTransferenciasD),2);
end;

procedure TdtmLookupContabil.CarregarCabecalho(vpBalanceteId: Integer);
begin
  sqlCabecalho.Active := False;
  sqlCabecalho.DataSet.ParamByName('BALANCETE_GRUPO_ID').AsBCD := vpBalanceteId;
  sqlCabecalho.DataSet.ParamByName('CEDENTE_ID').AsBCD         := vgCedenteAtivo;
  sqlCabecalho.Active := True;

  sqlCabecalho.Edit;
  sqlCabecalhoTEXTO_CABECALHO.AsString := DeCompressString(sqlCabecalhoCABECALHO.AsString);
  sqlCabecalho.Post;
end;

procedure TdtmLookupContabil.CarregarGrupo(vpCombobox: TcxComboBox;
  vpGrupoContabilid: string);
begin
  vpCombobox.Properties.Items.Clear;

  Screen.Cursor := crHourGlass;
  ExecutaSqlAuxiliar(' SELECT DISTINCT(GRUPO) '+
                     ' FROM T_CONTABIL_CONTA '+
                     ' WHERE CONTABIL_GRUPO_ID = '+ vpGrupoContabilid +
                     ' ORDER BY GRUPO ',0);
  While not dtmControles.sqlAuxiliar.Eof do
  begin
    vpCombobox.Properties.Items.Add(dtmControles.sqlAuxiliar.FieldByName('GRUPO').AsString);
    dtmControles.sqlAuxiliar.Next;
  end;
  vpCombobox.Clear;
  Screen.Cursor := crDefault;
end;

procedure TdtmLookupContabil.CarregarPeriodo(vpComBoBox : TcxComboBox; vpDBComBoBox : TcxDBComboBox; vpTipo : Integer;
                 vpAnoMesInicial, vpAnoMesFinal : String);
var
  viMes, viAno, viCont : Integer;
  viData : String;
  viPeriodoPrevisto : Integer;
  viFlag : Boolean;

  procedure AdicionarPeriodo;
  begin
    viData := FormatFloat('00', viMes);
    viData := viData + '/'+ IntToStr(viAno);

    if vpDBComBoBox = nil then
         vpComBoBox.Properties.Items.Add(viData)
    else vpDBComBoBox.Properties.Items.Add(viData);
    inc(viMes);
  end;

begin
  { vpTipo = 1 = Per�odo Completo
    vpTipo = 2 = Per�odo Mensal de 2 meses antes do per�odo Atual
    vpTipo = 3 = Per�odo Mensal Atual e Superior
    vpTipo = 4 = Per�odo Mensal Superior ao Atual
    vpTipo = 5 = Per�odo determinado
    vpTipo = 6 = Per�odo 2 meses antes do atual at� o Proximo
    vpTipo = 7 = Per�odo atual e Proximo
    vpTipo = 8 = Per�odo at� o atual}


  if vpDBComBoBox = nil then
       vpComBoBox.Properties.Items.Clear
  else vpDBComBoBox.Properties.Items.Clear;

  viAno  := StrToInt(Copy(dtmControles.DataHoraBanco(4),7,4));
  viMes  := StrToInt(Copy(dtmControles.DataHoraBanco(4),4,2));

  case viMes of
    1 :  begin
          dec(viAno);
          viMes := 11;
        end;
    2 : begin
          dec(ViAno);
          viMes := 12;
        end;
    else
      viMes := 1;
  end;

  case vpTipo of
    1, 8 : dec(viAno);
    4 : begin
          vgPeriodoAtual := StrToInt(dtmLookupContabil.InclementarAnoMes(IntToStr(vgPeriodoAtual)));
          viAno  := StrToInt(Copy(dtmControles.DataHoraBanco(4),7,4));
          viMes  := StrToInt(Copy(dtmControles.DataHoraBanco(4),4,2));
        end;
    5 : begin
          if (StrToInt(vpAnoMesInicial)) <= vgPeriodoAtual then
               vgPeriodoAtual := StrToInt(dtmLookupContabil.InclementarAnoMes(IntToStr(vgPeriodoAtual)))
          else vgPeriodoAtual := StrToInt(vpAnoMesInicial);
          viAno  := StrToInt(Copy(IntToStr(vgPeriodoAtual),1,4));
          viMes  := StrToInt(Copy(IntToStr(vgPeriodoAtual),5,2));
        end;
  end;

  viCont := 1;
  viFlag := False;
  repeat
    repeat
      viPeriodoPrevisto := StrToInt(IntToStr(viAno)+ FormatFloat('00', viMes));

        case vpTipo of
        1,8 : AdicionarPeriodo;
        2,6 : if (viPeriodoPrevisto+2) < vgPeriodoAtual then
                 inc(viMes)
            else AdicionarPeriodo;
        3,4,5,7 : if (viPeriodoPrevisto) < vgPeriodoAtual then
                       inc(viMes)
                else AdicionarPeriodo;
      end;
      if vpTipo in [5,6,7] then
        viFlag := viPeriodoPrevisto >= StrToInt(vpAnoMesFinal)
      else
        if vpTipo = 8 then
          viFlag := viPeriodoPrevisto = StrToInt(vpAnoMesFinal)

    until (viMes = 13) or viFlag;
    inc(viAno);
    inc(viCont);
    viMes := 1;
  until (viCont = 4) or viFlag;
  vgPeriodoAtual := StrToInt((copy(dtmControles.DataHoraBanco(4),7,4)) + (copy(dtmControles.DataHoraBanco(4),4,2)));
end;

procedure TdtmLookupContabil.CarregarProgress(
  var vpProgress: TdxBarProgressItem; vpMax: Integer; vpCaption: String;
  vpValor: Currency);
begin
  vpProgress.Max      := vpMax;
  vpProgress.Caption  := vpCaption + FormatFloat(',#0.00', vpValor);
  vpProgress.Position := Trunc(vpValor);
end;

procedure TdtmLookupContabil.CarregarRegistrarLivroCaixa(vpNossoNumero, vpTipoPag, vpEspecie, vpObservacao, vpDescricaoAgrupador : String;
            vpCaixaId : Integer; vpValorJuros : Currency; vpCompromissoJurosId, vpReservaId : Integer; vpDataRegBoleto : String = '');
var
  viOrdem : String;
begin
  try
    ExecutaSimpleDSAux(' SELECT * FROM T_COMPROMISSO_VENCIDO '+
                       ' WHERE '+vpTipoPag+'= '+vpNossoNumero,0);
    with dtmControles.SimpleAuxiliar do
    begin
      if vpCompromissoJurosId = 0 then
        vlOrdemLivroCaixa := dtmControles.GerarSequencia('J_LIVRO_CAIXA_ORDEM');
      First;
      while not Eof do
      begin
        vgDadosLivroCaixa.CaixaID            := vpCaixaId;
        if vpDataRegBoleto = '' then
             vgDadosLivroCaixa.DataPagamento := FormatDateTime('DD.MM.YYYY', FieldByName('DATA_REALIZACAO').AsDateTime)
        else vgDadosLivroCaixa.DataPagamento := FormatDateTime('DD.MM.YYYY', StrToDate(vpDataRegBoleto));

        vgDadosLivroCaixa.DataPagBoleto      := FormatDateTime('DD.MM.YYYY', FieldByName('DATA_REALIZACAO').AsDateTime);
        vgDadosLivroCaixa.DataVencimento     := FormatDateTime('DD.MM.YYYY', FieldByName('DATA_REALIZACAO').AsDateTime);
        vgDadosLivroCaixa.DataLancamento     := FormatDateTime('DD.MM.YYYY', FieldByName('DATA_REALIZACAO').AsDateTime);
        vgDadosLivroCaixa.DescricaoAgrupador := vpDescricaoAgrupador;
        vgDadosLivroCaixa.Ordem              := vlOrdemLivroCaixa;

        if vpValorJuros > 0  then
        begin
          vgDadosLivroCaixa.ValorCompromisso  := 0;
          vgDadosLivroCaixa.ValorPago         := vpValorJuros;
        end
        else
        begin
          vgDadosLivroCaixa.ValorPago         := FieldByName('VALOR_ATUAL').AsCurrency;
          vgDadosLivroCaixa.ValorCompromisso  := FieldByName('VALOR_ATUAL').AsCurrency;
        end;

        vgDadosLivroCaixa.Especie           := vpEspecie;
        vgDadosLivroCaixa.Referencia        := FieldByName('ANO_MES_REFERENCIA').AsString;
        vgDadosLivroCaixa.IdentificacaoId   := StrToInt(vpNossoNumero);
        vgDadosLivroCaixa.IdentificacaoTipo := '';

        if FieldByName('BOLETA_ID').AsInteger > 0 then
             vgDadosLivroCaixa.DocTipo := 'EB'
        else vgDadosLivroCaixa.DocTipo := 'ER';

        if FieldByName('TIPO_OPERACAO').AsString ='D' then
        begin
          vgDadosLivroCaixa.Operacao        := 'D';
          vgDadosLivroCaixa.DocumentoNumero := FieldByName('SAIDA_DOCUMENTO').AsString;
        end
        else
        begin
          vgDadosLivroCaixa.Operacao        := 'R';
          vgDadosLivroCaixa.DocumentoNumero := FieldByName(vpTipoPag).AsString;
        end;

        vgDadosLivroCaixa.PessoaId          := 0;
        vgDadosLivroCaixa.AssociadoId       := FieldByName('PESSOA_ID').AsInteger;
        vgDadosLivroCaixa.TipoDespesaID     := 0;
        vgDadosLivroCaixa.OrcamentoId       := 0;
        vgDadosLivroCaixa.ResponsavelId     := 0;

        if vpCompromissoJurosId = 0 then
        begin
          vgDadosLivroCaixa.ContabilContaID := FieldByName('CONTABIL_CONTA_ID').AsInteger;
          vgDadosLivroCaixa.ContabilGrupoId := dtmControles.GetInt(' SELECT CONTABIL_GRUPO_ID FROM T_CONTABIL_CONTA WHERE CONTABIL_CONTA_ID = '+FieldByName('CONTABIL_CONTA_ID').AsString);
          vgDadosLivroCaixa.CentroCustoId   := FieldByName('CENTRO_CUSTO_ID').AsInteger;
          vgDadosLivroCaixa.BalanceteGrupoId:= FieldByName('BALANCETE_GRUPO_ID').AsInteger;

          if FieldByName('LANCAMENTO_COMPROMISSO_ID').IsNull then
               vgDadosLivroCaixa.ReservaId       := FieldByName('RESERVA_ID').AsInteger
          else vgDadosLivroCaixa.ReservaId       := 0;

          vgDadosLivroCaixa.Historico       := FieldByName('DESCRICAO').AsString;

          if vpObservacao = '' then
               vgDadosLivroCaixa.Observacao := FieldByName('OBSERVACAO').AsString
          else vgDadosLivroCaixa.Observacao := vpObservacao;
          vpObservacao := '';

          vgDadosLivroCaixa.CompromissoVencidoId := FieldByName('COMPROMISSO_VENCIDO_ID').AsInteger;
        end
        else
        begin
          vgDadosLivroCaixa.ContabilContaID      := vpCompromissoJurosId;
          vgDadosLivroCaixa.ContabilGrupoId      := dtmControles.GetInt(' SELECT CONTABIL_GRUPO_ID FROM T_CONTABIL_CONTA WHERE CONTABIL_CONTA_ID = '+ IntToStr(vpCompromissoJurosId));
          vgDadosLivroCaixa.CentroCustoId        := vgCentroCustoPrincipalId;
          vgDadosLivroCaixa.BalanceteGrupoId     := vgBalancetePrincipal;
          vgDadosLivroCaixa.ReservaId            := vpReservaId;
          vgDadosLivroCaixa.Historico            := 'Juros/IOF';
          vgDadosLivroCaixa.Observacao           := '';
          vgDadosLivroCaixa.CompromissoVencidoId := 0;
        end;

        vgDadosLivroCaixa.AssociadoFavorecido  := 'S';
        vgDadosLivroCaixa.AnoMesRegistro       := IntToStr(dtmLookupContabil.PegarAnoMes(vgDadosLivroCaixa.DataPagamento));
        vgDadosLivroCaixa.IR                   := 'N';
        dtmLookupContabil.RegistrarRecebimentoFinanceiro;


        if vpCompromissoJurosId > 0 then
          Break;

        dtmLookupContabil.VerificarProvimentoMes(dtmControles.SimpleAuxiliar.FieldByName('LANCAMENTO_COMPROMISSO_ID').AsString,
                                                 vgDadosLivroCaixa.AnoMesRegistro);
        Next;
      end;
      vgDadosLivroCaixa.DescricaoAgrupador := '';
    end;
  except
    on E : Exception do
    begin
      TMensagemUtils.ExibirMensagemAtencao(
        'Erro: ' + E.Message);
    end;
  end;
end;

procedure TdtmLookupContabil.CarregarSaldoCaixa(vpClientDataSet : TClientDataSet; vpTodos : Boolean = False;
            vpSomenteLista : Boolean = False);
begin
  if vlNaoCarregarSaldo then
    exit;

  ExecutaSqlAuxiliar(' SELECT * FROM J_CAIXA WHERE SITUACAO = '+ QuotedStr('A')+
                     ' ORDER BY DESCRICAO',0);
  vpClientDataSet.EmptyDataSet;
  vpClientDataSet.DisableControls;
  if vpTodos then
  begin
    vpClientDataSet.Append;
    vpClientDataSet.FieldByName('CAIXA_ID').AsInteger    := 0;
    vpClientDataSet.FieldByName('DESCRICAO').AsString    := '<<Todos>>';
    if not vpSomenteLista then
    begin
      vpClientDataSet.FieldByName('PRINCIPAL').AsString  := 'N';
      vpClientDataSet.FieldByName('PESSOA_ID').AsInteger := 0;
      vpClientDataSet.FieldByName('VALOR').AsCurrency    := 0;
    end;
    vpClientDataSet.Post;
  end;

  While not dtmControles.sqlAuxiliar.Eof do
  begin
    vpClientDataSet.Append;
    vpClientDataSet.FieldByName('CAIXA_ID').AsInteger   := dtmControles.sqlAuxiliar.FieldByName('CAIXA_ID').AsInteger;
    vpClientDataSet.FieldByName('DESCRICAO').AsString   := dtmControles.sqlAuxiliar.FieldByName('DESCRICAO').AsString;
    vpClientDataSet.FieldByName('RESUMO').AsString      := dtmControles.sqlAuxiliar.FieldByName('RESUMO').AsString;

    if not vpSomenteLista then
    begin
      vpClientDataSet.FieldByName('PRINCIPAL').AsString := dtmControles.sqlAuxiliar.FieldByName('PRINCIPAL').AsString;
      vpClientDataSet.FieldByName('VALOR').AsCurrency   := dtmLookupContabil.CalcularSaldoCaixa('', vpClientDataSet.FieldByName('CAIXA_ID').AsString,'');
      vpClientDataSet.FieldByName('PESSOA_ID').AsInteger:= dtmControles.sqlAuxiliar.FieldByName('RESPONSAVEL_ID').AsInteger;
    end;
    vpClientDataSet.Post;
    dtmControles.sqlAuxiliar.Next;
  end;
  dtmControles.sqlAuxiliar.Close;

  if vpTodos then
    vpClientDataSet.First;

  vpClientDataSet.EnableControls;
end;

procedure TdtmLookupContabil.CarregarSaldoDetalhado(vpClientDataSet : TClientDataSet;
      vpDataInicial, vpDataFinal : String; vpBalancete : Boolean; vpInativos : Boolean);
var
  viSql : string;
  viFlag : Boolean;

  procedure CalcularSaldoDetalhado;
  var
    viCaixaId, viBalanceteId : string;
    viValor : Currency;
  begin
    viCaixaId     := '';
    viBalanceteId := '';

    if vpBalancete then
         viBalanceteId := vpClientDataSet.FieldByName('BALANCETE_GRUPO_ID').AsString
    else viCaixaId := vpClientDataSet.FieldByName('CAIXA_ID').AsString;

    {Calcular Saldos Detalhados entre intervalo de Datas}
    vpClientDataSet.FieldByName('VALOR').AsCurrency          := Arredondamento(maArimeticoSimetrico, dtmLookupContabil.CalcularSaldoCaixa('', viCaixaId, viBalanceteId, vpDataFinal),2);
    vpClientDataSet.FieldByName('SALDO_ANTERIOR').AsCurrency := Arredondamento(maArimeticoSimetrico, dtmLookupContabil.CalcularSaldoCaixa('', viCaixaId, viBalanceteId, DateToStr(StrToDate(vpDataInicial)-1)),2);
    vpClientDataSet.FieldByName('DESPESAS').AsCurrency       := Arredondamento(maArimeticoSimetrico, PrepararSqlSoma('', viCaixaId, viBalanceteId, 'D', '', vpDataFinal,'',vpDataInicial),2);
    vpClientDataSet.FieldByName('RECEITAS').AsCurrency       := Arredondamento(maArimeticoSimetrico, PrepararSqlSoma('', viCaixaId, viBalanceteId, 'R', '', vpDataFinal,'',vpDataInicial),2);

    // Entradas
    viValor := 0;
    viValor := PrepararSqlSoma('', viCaixaId, viBalanceteId, 'AR', '', vpDataFinal,'',vpDataInicial);
    vpClientDataSet.FieldByName('ENTRADAS').AsCurrency := Arredondamento(maArimeticoSimetrico, viValor + PrepararSqlSoma('', viCaixaId, viBalanceteId, 'TR', '', vpDataFinal,'',vpDataInicial),2);

    // Sa�das
    viValor := 0;
    viValor := Arredondamento(maArimeticoSimetrico, PrepararSqlSoma('', viCaixaId, viBalanceteId, 'AD', '', vpDataFinal,'',vpDataInicial),2);
    vpClientDataSet.FieldByName('SAIDAS').AsCurrency := Arredondamento(maArimeticoSimetrico, viValor + PrepararSqlSoma('', viCaixaId, viBalanceteId, 'TD', '', vpDataFinal,'',vpDataInicial),2);
  end;

  procedure CalculoDistribuicaoCaixas;
  begin
    viSql := ' SELECT * FROM J_CAIXA ';
    if not vpInativos then
      viSql := viSql + ' WHERE SITUACAO = '+ QuotedStr('A');

    viSql := viSql + ' ORDER BY DESCRICAO ';
    ExecutaSqlAuxiliar(viSql,0);
    vpClientDataSet.EmptyDataSet;

    vpClientDataSet.DisableControls;
    While not dtmControles.sqlAuxiliar.Eof do
    begin
      vpClientDataSet.Append;
      vpClientDataSet.FieldByName('CAIXA_ID').AsInteger   := dtmControles.sqlAuxiliar.FieldByName('CAIXA_ID').AsInteger;
      vpClientDataSet.FieldByName('PRINCIPAL').AsString   := dtmControles.sqlAuxiliar.FieldByName('PRINCIPAL').AsString;
      vpClientDataSet.FieldByName('PESSOA_ID').AsInteger  := dtmControles.sqlAuxiliar.FieldByName('RESPONSAVEL_ID').AsInteger;
      vpClientDataSet.FieldByName('DESCRICAO').AsString   := dtmControles.sqlAuxiliar.FieldByName('DESCRICAO').AsString;
      vpClientDataSet.FieldByName('GRUPO').AsString       := dtmControles.sqlAuxiliar.FieldByName('GRUPO').AsString;
      CalcularSaldoDetalhado;
      vpClientDataSet.Post;
      dtmControles.sqlAuxiliar.Next;
    end;
  end;

  procedure CalculoDistribuicaoBalancete;
  begin
    vpClientDataSet.EmptyDataSet;
    vpClientDataSet.DisableControls;
    sqlBalanceteAtivos.First;
    While not sqlBalanceteAtivos.Eof do
    begin
      vpClientDataSet.Append;
      vpClientDataSet.FieldByName('BALANCETE_GRUPO_ID').AsInteger := sqlBalanceteAtivosBALANCETE_GRUPO_ID.AsInteger;
      vpClientDataSet.FieldByName('PRINCIPAL').AsString           := sqlBalanceteAtivosPRINCIPAL.AsString;
      vpClientDataSet.FieldByName('DESCRICAO').AsString           := sqlBalanceteAtivosDESCRICAO.AsString;
      CalcularSaldoDetalhado;
      vpClientDataSet.Post;
      sqlBalanceteAtivos.Next;
    end;
  end;

begin
  if not vpBalancete then
       CalculoDistribuicaoCaixas
  else CalculoDistribuicaoBalancete;

  Screen.Cursor := crHourGlass;
  vpClientDataSet.First;
  vpClientDataSet.EnableControls;
  Screen.Cursor := crDefault;
end;

procedure TdtmLookupContabil.CarregarSaldoReservas(vpClientDataSet, vpClientDataSetSaldo : TClientDataSet;
           vpAnoMes : String; vpSomenteMesPesquisa : Boolean = False);
var
  viEntradas, viSaidas, viSaldoAnterior, viValorReserva : Currency;
  viAnoMes : String;
  viSomenteMesPesquisa : Boolean;

  procedure BuscarSaldoReserva(vpOperacao : String; vpClientReserva : TClientDataSet);
  var
    viSql : String;

    Procedure SalvarSaldoResultado;
    begin

      with dtmControles.SimpleAuxiliar do
      begin
        if vpClientDataSet.IsEmpty then
          exit;

        if vpClientDataSetSaldo.Locate('RESERVA_ID', FieldByName('RESERVA_ID').AsInteger, [loCaseInsensitive]) then
        begin
          if not (vpClientReserva.State in [dsEdit, dsInsert]) then
            vpClientReserva.Edit;
          vpClientReserva.FieldByName('SALDO_ANTERIOR').AsCurrency  := vpClientDataSetSaldo.FieldByName('VALOR_RESERVA').AsCurrency;
          vpClientReserva.FieldByName('RESULTADO_MES').AsCurrency   := vpClientReserva.FieldByName('VALOR_RESERVA').AsCurrency;
          vpClientReserva.FieldByName('VALOR_RESERVA').AsCurrency   := vpClientReserva.FieldByName('VALOR_RESERVA').AsCurrency +
                                                                      vpClientReserva.FieldByName('SALDO_ANTERIOR').AsCurrency;
        end;

      end;
    end;

  begin
    viSql := ' SELECT R.DESCRICAO AS RESERVA, CI.BALANCETE_GRUPO_ID, '+
             '     BG.DESCRICAO AS BALANCETE_GRUPO, R.RESERVA_ID, '+
             '     SUM(CASE '+
             '       WHEN CI.RESERVA_ID > 0 THEN CI.VALOR '+
             '       WHEN CI.RESERVA_ID IS NULL THEN ((CI.VALOR*CR.PERCENTUAL)/100) '+
             '    END) AS VALOR_RESERVA '+
             ' FROM J_LIVRO_CAIXA CI '+
             '   LEFT OUTER JOIN T_COMPROMISSO_VENCIDO CV ON '+
             '   CI.COMPROMISSO_VENCIDO_ID = CV.COMPROMISSO_VENCIDO_ID '+
             '   LEFT OUTER JOIN T_COMPROMISSO_RESERVA CR ON '+
             '   CR.CONTABIL_CONTA_ID = CI.CONTABIL_CONTA_ID AND '+
             '   REFERENCIA_ANOMES = CI.ANO_MES_REGISTRO AND '+
             '   CR.LANCAMENTO_COMPROMISSO_ID = CV.LANCAMENTO_COMPROMISSO_ID '+
             '   LEFT OUTER JOIN T_RESERVA R ON '+
             '   R.RESERVA_ID = CI.RESERVA_ID OR '+
             '   R.RESERVA_ID = CR.RESERVA_ID '+
             '   LEFT OUTER JOIN T_BALANCETE_GRUPO BG ON '+
             '   CI.BALANCETE_GRUPO_ID = BG.BALANCETE_GRUPO_ID '+
             ' WHERE ((CI.OPERACAO = '+QuotedStr(vpOperacao)+') OR (CI.OPERACAO = '+QuotedStr('A'+vpOperacao)+') OR (CI.OPERACAO = '+QuotedStr('P'+vpOperacao)+'))'+
             '   AND CI.CALCULAR_PROVISAO IS NULL';

    if viSomenteMesPesquisa then
         viSql := viSql + '   AND ANO_MES_REGISTRO = '+ QuotedStr(viAnoMes)
    else viSql := viSql + '   AND ANO_MES_REGISTRO <= '+ QuotedStr(viAnoMes);

    viSql := viSql + ' GROUP BY CI.BALANCETE_GRUPO_ID, BG.DESCRICAO, R.ORDEM, R.DESCRICAO, RESERVA_ID ';
    ExecutaSimpleDSAux(viSql,0);

    with dtmControles.SimpleAuxiliar do
    begin
      First;
      While not eof do
      begin
        viValorReserva := Arredondamento(maArimeticoSimetrico, FieldByName('VALOR_RESERVA').AsCurrency,2);
        if vpClientReserva.Locate('RESERVA_ID', FieldByName('RESERVA_ID').AsInteger, [loCaseInsensitive]) then
        begin
          vpClientReserva.Edit;
          if vpOperacao = 'R' then
            vpClientReserva.FieldByName('VALOR_ENTRADA').AsCurrency  := viValorReserva
          else
            if vpOperacao = 'D' then
              vpClientReserva.FieldByName('VALOR_SAIDA').AsCurrency  := viValorReserva
          else
          begin
            if vpOperacao = 'PD' then
            begin
              vpClientReserva.FieldByName('TRANSFERENCIA_SAIDA').AsCurrency := viValorReserva;
              vpClientReserva.FieldByName('VALOR_SAIDA').AsCurrency := vpClientReserva.FieldByName('VALOR_SAIDA').AsCurrency - viValorReserva;
            end
            else
            begin
              vpClientReserva.FieldByName('TRANSFERENCIA_ENTRADA').AsCurrency  := viValorReserva;
              vpClientReserva.FieldByName('VALOR_ENTRADA').AsCurrency          := vpClientReserva.FieldByName('VALOR_ENTRADA').AsCurrency - viValorReserva;
            end;
            vpClientReserva.Post;
            Next;
            Continue;
          end;

          if vpClientReserva.FieldByName('VALOR_ENTRADA').AsCurrency = 0 then
            vpClientReserva.FieldByName('VALOR_RESERVA').AsCurrency       := Arredondamento(maArimeticoSimetrico, viValorReserva * -1,2)
          else
            vpClientReserva.FieldByName('VALOR_RESERVA').AsCurrency       := vpClientReserva.FieldByName('VALOR_ENTRADA').AsCurrency - viValorReserva;
        end
        else
        begin
          vpClientReserva.Append;
          vpClientReserva.FieldByName('BALANCETE_GRUPO_ID').AsString := vpClientDataSetSaldo.FieldByName('BALANCETE_GRUPO_ID').AsString;
          vpClientReserva.FieldByName('VALOR_ENTRADA').AsCurrency    := 0;
          vpClientReserva.FieldByName('VALOR_SAIDA').AsCurrency      := 0;
          vpClientReserva.FieldByName('RESULTADO_MES').AsCurrency    := 0;
          vpClientReserva.FieldByName('SALDO_ANTERIOR').AsCurrency   := 0;
          vpClientReserva.FieldByName('VALOR_RESERVA').AsCurrency    := 0;
//          vpClientReserva.FieldByName('TRANSFERENCIA_SAIDA').AsCurrency   := 0;
//          vpClientReserva.FieldByName('TRANSFERENCIA_ENTRADA').AsCurrency := 0;

          vpClientReserva.FieldByName('RESERVA_ID').AsInteger        := FieldByName('RESERVA_ID').AsInteger;
          vpClientReserva.FieldByName('RESERVA_DESCRICAO').AsString  := FieldByName('RESERVA').AsString;
          vpClientReserva.FieldByName('BALANCETE_GRUPO_ID').AsString := FieldByName('BALANCETE_GRUPO_ID').AsString;
          if vpOperacao = 'R' then
            vpClientReserva.FieldByName('VALOR_ENTRADA').AsCurrency  := viValorReserva
          else
            if vpOperacao = 'D' then
              vpClientReserva.FieldByName('VALOR_SAIDA').AsCurrency    := viValorReserva
          else
          begin
            if vpOperacao = 'PD' then
            begin
              vpClientReserva.FieldByName('TRANSFERENCIA_SAIDA').AsCurrency := viValorReserva;
              vpClientReserva.FieldByName('VALOR_SAIDA').AsCurrency := vpClientReserva.FieldByName('VALOR_SAIDA').AsCurrency - viValorReserva;
            end
            else
            begin
              vpClientReserva.FieldByName('TRANSFERENCIA_ENTRADA').AsCurrency  := viValorReserva;
              vpClientReserva.FieldByName('VALOR_ENTRADA').AsCurrency          := vpClientReserva.FieldByName('VALOR_ENTRADA').AsCurrency - viValorReserva;
            end;
            vpClientReserva.Post;
            Next;
            Continue;
          end;

          if vpClientReserva.FieldByName('VALOR_ENTRADA').AsCurrency = 0 then
               vpClientReserva.FieldByName('VALOR_RESERVA').AsCurrency  := Arredondamento(maArimeticoSimetrico, FieldByName('VALOR_RESERVA').AsCurrency * -1,2)
          else vpClientReserva.FieldByName('VALOR_RESERVA').AsCurrency  := Arredondamento(maArimeticoSimetrico, FieldByName('VALOR_RESERVA').AsCurrency,2);
        end;
        SalvarSaldoResultado;
        vpClientReserva.Post;
        Next;
      end;
      Close;
    end;
  end;

  procedure CalcularSaldoReserva(vpAnoMesCalculo : String; vpClientReservaCalculo : TClientDataSet);
  begin
    viAnoMes := vpAnoMesCalculo;
    BuscarSaldoReserva('R', vpClientReservaCalculo);
    BuscarSaldoReserva('D', vpClientReservaCalculo);
//    BuscarSaldoReserva('PD', vpClientReservaCalculo);
//    BuscarSaldoReserva('PR', vpClientReservaCalculo);
  end;

  procedure PreencherItensReservaNaoExistente;
  begin
    vpClientDataSetSaldo.First;
    while not vpClientDataSetSaldo.Eof do
    begin
      if not vpClientDataSet.Locate('RESERVA_ID', vpClientDataSetSaldo.FieldByName('RESERVA_ID').AsInteger, [loCaseInsensitive]) then
      begin
        vpClientDataSet.Append;
        vpClientDataSet.FieldByName('RESERVA_ID').AsInteger        := vpClientDataSetSaldo.FieldByName('RESERVA_ID').AsInteger;
        vpClientDataSet.FieldByName('RESERVA_DESCRICAO').AsString  := vpClientDataSetSaldo.FieldByName('RESERVA_DESCRICAO').AsString;
        vpClientDataSet.FieldByName('BALANCETE_GRUPO_ID').AsString := vpClientDataSetSaldo.FieldByName('BALANCETE_GRUPO_ID').AsString;
        vpClientDataSet.FieldByName('VALOR_ENTRADA').AsCurrency    := 0;
        vpClientDataSet.FieldByName('VALOR_SAIDA').AsCurrency      := 0;
        vpClientDataSet.FieldByName('VALOR_SAIDA').AsCurrency      := 0;
        vpClientDataSet.FieldByName('RESULTADO_MES').AsCurrency    := 0;
        vpClientDataSet.FieldByName('SALDO_ANTERIOR').AsCurrency   := vpClientDataSetSaldo.FieldByName('VALOR_RESERVA').AsCurrency;
        vpClientDataSet.FieldByName('VALOR_RESERVA').AsCurrency    := vpClientDataSetSaldo.FieldByName('VALOR_RESERVA').AsCurrency;
        vpClientDataSet.Post;
      end
      else
      begin
        if (vpClientDataSet.FieldByName('VALOR_SAIDA').IsNull) or
           (vpClientDataSet.FieldByName('VALOR_ENTRADA').IsNull) or
           (vpClientDataSet.FieldByName('SALDO_ANTERIOR').IsNull) then
           begin
             vpClientDataSet.Edit;
             if vpClientDataSet.FieldByName('VALOR_SAIDA').IsNull then
               vpClientDataSet.FieldByName('VALOR_SAIDA').AsCurrency := 0;

             if vpClientDataSet.FieldByName('VALOR_ENTRADA').IsNull then
               vpClientDataSet.FieldByName('VALOR_ENTRADA').AsCurrency := 0;

             if vpClientDataSet.FieldByName('SALDO_ANTERIOR').IsNull then
               vpClientDataSet.FieldByName('SALDO_ANTERIOR').AsCurrency := 0;
             vpClientDataSet.Post;
           end;
      end;

      vpClientDataSetSaldo.Next;
    end;
  end;

begin
  viSaldoAnterior := 0;

  LimparClientDataSet(vpClientDataSet);
  LimparClientDataSet(vpClientDataSetSaldo);

  viSomenteMesPesquisa := vpSomenteMesPesquisa;
  if viSomenteMesPesquisa then
  begin
    // Calculo SaldoAnterior
    viSomenteMesPesquisa := False;
    CalcularSaldoReserva(DeclementarAnoMes(vpAnoMes), vpClientDataSetSaldo);

    viSomenteMesPesquisa := True;
    // Calculo Dados MesAtual
    CalcularSaldoReserva(vpAnoMes, vpClientDataSet);
    PreencherItensReservaNaoExistente;
  end
  else CalcularSaldoReserva(vpAnoMes, vpClientDataSet);
end;

procedure TdtmLookupContabil.CarregarSaldoVisualizacao(
  var vpLabel: TdxBarStatic; vpCaption: String; vpValor: Currency;
      vpModificarIcone : Boolean = False);
begin
  vpLabel.Caption  := vpCaption + FormatFloat(',#0.00', vpValor)+ '   ';
  if vpModificarIcone then
  begin
    if vpValor >= 0 then
         vpLabel.ImageIndex := 58
    else vpLabel.ImageIndex := 56;
  end;
end;

procedure TdtmLookupContabil.CarregarTabBalancete(vpTabBalancete: TcxTabControl);
var
  i : Integer;
begin
  ExecutaSimpleDSAux(' SELECT DESCRICAO, BALANCETE_GRUPO_ID '+
                     ' FROM T_BALANCETE_GRUPO '+
                     ' WHERE SITUACAO = '+QuotedStr('A')+
                     ' ORDER BY PRINCIPAL DESC, BALANCETE_GRUPO_ID',0);
  with dtmControles.SimpleAuxiliar do
  begin
    First;
    vpTabBalancete.Tabs.Clear;
    for i := 1 to dtmControles.SimpleAuxiliar.RecordCount do
    begin
      vpTabBalancete.Tabs.Add(FieldByName('DESCRICAO').AsString);
      vgTabBalancete[i-1]         := FieldByName('BALANCETE_GRUPO_ID').AsInteger;
      vgCentroCustoPrincipal[i-1] :=  dtmControles.GetInt(' SELECT CENTRO_CUSTO_ID FROM T_CENTRO_CUSTO '+
                                                     ' WHERE PRINCIPAL = ''S'''+
                                                     ' AND BALANCETE_GRUPO_ID = '+ FieldByName('BALANCETE_GRUPO_ID').AsString);
      next;
    end;
    vpTabBalancete.TabIndex := 0;
  end;
end;

function TdtmLookupContabil.ConverterAnoMesBase(vpValor : String; vpIgnorarBarra : Boolean = False):String;
begin
  if vpIgnorarBarra then
       Result := copy(vpValor,3,4) + copy(vpValor,1,2)
  else Result := copy(vpValor,4,4) + copy(vpValor,1,2);
end;

procedure TdtmLookupContabil.DataModuleCreate(Sender: TObject);
begin
  sqlGrupoContabilTodos.Connection    := dtmControles.DB;
  sqlGrupoContabilAtivos.Connection   := dtmControles.DB;
  sqlGrupoContabilSaidas.Connection   := dtmControles.DB;
  sqlGrupoContabilEntradas.Connection := dtmControles.DB;
  sqlBalanceteGrupo.Connection        := dtmControles.DB;
  sqlBalanceteAtivos.Connection       := dtmControles.DB;
  sqlPlanoContasAtivo.Connection      := dtmControles.DB;
  sqlPlanoContasTodos.Connection      := dtmControles.DB;
  sqlPlanoContasReceitas.Connection   := dtmControles.DB;
  sqlCentroCustoTodos.Connection      := dtmControles.DB;
  sqlCentroCustoAtivo.Connection      := dtmControles.DB;
  sqlCompReceitaTodos.Connection      := dtmControles.DB;
  sqlPlanoContasDespesasTodos.Connection := dtmControles.DB;
  sqlPlanoContasDespesasAtivo.Connection := dtmControles.DB;
  sqlCompSaidaTodos.Connection           := dtmControles.DB;
  sqlCabecalho.Connection                := dtmControles.DB;
  sqlCaixa.Connection                    := dtmControles.DB;
  sqlPessoasTodas.Connection             := dtmControles.DB;
  sqlCaixaAtivos.Connection              := dtmControles.DB;
  sqlCaixaTodosAtivos.Connection         := dtmControles.DB;
  sqlReservasAtivas.Connection           := dtmControles.DB;
  sqlTipoDespesaTodos.Connection         := dtmControles.DB;
  sqlTipoDespesaAtivos.Connection        := dtmControles.DB;
  sqlCompromissoReserva.Connection       := dtmControles.DB;

  sqlBalanceteGrupo.Open;
  sqlBalanceteAtivos.Open;
  sqlReservasAtivas.Open;
  sqlCaixaAtivos.Open;
  sqlCaixaTodosAtivos.Open;
  sqlGrupoContabilAtivos.Open;
  sqlGrupoContabilEntradas.Open;
  sqlGrupoContabilSaidas.Open;
  sqlGrupoContabilTodos.Open;
  sqlCentroCustoTodos.Open;
  sqlCentroCustoAtivo.Open;
  sqlPlanoContasAtivo.Open;
  sqlPlanoContasTodos.Open;
  sqlPlanoContasReceitas.Open;
  sqlCompReceitaTodos.Open;
  sqlPlanoContasDespesasTodos.Open;
  sqlPlanoContasDespesasAtivo.Open;
  sqlCompSaidaTodos.Open;
  sqlCaixa.Open;
  sqlPessoasTodas.Open;
  sqlTipoDespesaTodos.Open;
  sqlTipoDespesaAtivos.Open;
end;

procedure TdtmLookupContabil.DataModuleDestroy(Sender: TObject);
begin
  sqlGrupoContabilTodos.Close;
  sqlGrupoContabilAtivos.Close;
  sqlGrupoContabilEntradas.Close;
  sqlGrupoContabilSaidas.Close;
  sqlBalanceteGrupo.Close;
  sqlPlanoContasAtivo.Close;
  sqlPlanoContasTodos.Close;
  sqlPlanoContasReceitas.Close;
  sqlCentroCustoAtivo.Close;
  sqlCentroCustoTodos.Close;
  sqlCompReceitaTodos.Close;
  sqlPlanoContasDespesasTodos.Close;
  sqlPlanoContasDespesasAtivo.Close;
  sqlCompSaidaTodos.Close;
  sqlBalanceteGrupo.Close;
  sqlCaixa.Close;
  sqlPessoasTodas.Close;
  sqlCaixaAtivos.Close;
  sqlCaixaTodosAtivos.Close;
  sqlReservasAtivas.Close;
  sqlBalanceteAtivos.Close;
end;

function TdtmLookupContabil.DeclementarAnoMes(vpAnoMes : String; vpQtd : Integer = 1):String;
var
  viAno, viMes, i : Integer;
begin
  viAno := StrToInt(copy(vpAnoMes,1,4));
  viMes := StrToInt(copy(vpAnoMes,5,2));

  for I := 1 to vpQtd do
  begin
    if viMes = 01 then
    begin
      viMes := 12;
      dec(viAno);
    end
    else dec(viMes);
  end;

  Result := (IntToStr(viAno)+ FormatFloat('00', viMes));
end;

procedure TdtmLookupContabil.FiltrarGrupoContasBalancete(vpSimpleDataSet : TSimpleDataSet; vpBalanceteId : Integer;
           vpFiltrar : Boolean);
begin
  vpSimpleDataSet.Filtered := False;
  vpSimpleDataSet.Filter   := 'BALANCETE_GRUPO_ID = '+ IntToStr(vpBalanceteId);
  vpSimpleDataSet.Filtered := True;
end;

function TdtmLookupContabil.FormatarAnoMes(vpAnoMes : String; vpTirarBarra : String = ''):String;
var
  viAno, viMes : String;
begin
  if vpTirarBarra = 'S' then
    result := copy(vpAnoMes,4,4) + copy(vpAnoMes,1,2)
  else
  begin
    viAno  := copy(vpAnoMes,1,4);
    viMes  := copy(vpAnoMes,5,2);
    Result := viMes+'/'+viAno;
  end;
end;

procedure TdtmLookupContabil.GerarBoleto(vpData: String; vpTodos: Boolean; vpPessoa,
  vpGrupo: String);
begin


end;

procedure TdtmLookupContabil.GravarCompromissoPadrao(vpPessoa,
  vpContabilContaId: string);
begin
  if vpContabilContaId <> '' then
  begin
    if Application.MessageBox(PChar('Cadastrar Compromisso como Padr�o desta Pessoa?'),'Confirma��o', MB_YESNO) = IDNO then
      exit;

    ExecutaSqlAuxiliar(' UPDATE J_PESSOA SET CONTABIL_CONTA_ID = '+vpContabilContaId+
                       ' WHERE PESSOA_ID = '+ vpPessoa, 1);
  end
  else
  begin
    if Application.MessageBox(PChar('Limpar Compromisso Padr�o desta Pessoa?'),'Confirma��o', MB_YESNO) = IDNO then
      exit;

    ExecutaSqlAuxiliar(' UPDATE J_PESSOA SET CONTABIL_CONTA_ID = null'+
                       ' WHERE PESSOA_ID = '+ vpPessoa, 1);
  end;
end;

procedure TdtmLookupContabil.GravarHistorico(vpHistorico, vpContabilContaId : string);
begin
  if Application.MessageBox(PChar('Cadastrar Hist�rico como Padr�o deste Compromisso?'+#13+#13+
                                 'Hist�rico '+ vpHistorico),'Confirma��o', MB_YESNO) = IDNO then
    exit;

  ExecutaSqlAuxiliar(' UPDATE T_CONTABIL_CONTA SET HISTORICO_PADRAO = '+QuotedStr(vpHistorico)+
                     ' WHERE CONTABIL_CONTA_ID = '+ vpContabilContaId, 1);
end;

Function TdtmLookupContabil.InclementarAnoMes(vpAnoMes : String):String;
var
  viAno, viMes : Integer;
begin
  viAno := StrToInt(copy(vpAnoMes,1,4));
  viMes := StrToInt(copy(vpAnoMes,5,2));

  if viMes = 12 then
  begin
    viMes := 01;
    Inc(viAno);
  end
  else inc(viMes);

  Result := (IntToStr(viAno)+ FormatFloat('00', viMes));
end;

procedure TdtmLookupContabil.InicializarVariaveisLivroCaixa;
begin
  vgDadosLivroCaixa.ValorCompromisso  := 0;
  vgDadosLivroCaixa.ValorPago         := 0;
  vgDadosLivroCaixa.ContabilContaID   := 0;
  vgDadosLivroCaixa.Operacao          := '';
  vgDadosLivroCaixa.PessoaId          := 0;
  vgDadosLivroCaixa.Observacao        := '';
  vgDadosLivroCaixa.Historico         := '';
  vgDadosLivroCaixa.LivroCaixaId      := 0;
  vgDadosLivroCaixa.LivroAgendamentoId:= 0;
  vgDadosLivroCaixa.CentroCustoId     := 0;
  vgDadosLivroCaixa.BalanceteGrupoId  := 0;
  vgDadosLivroCaixa.LivroFinanceiroID := 0;
  vgDadosLivroCaixa.ProcessoID        := 0;
  vgDadosLivroCaixa.IR                := 'N';
  vgDadosLivroCaixa.RegistroParcial   := 'N';
  vgDadosLivroCaixa.DocumentoNumero   := '';
  vgDadosLivroCaixa.RefPeriodo        := '1';
  vgDadosLivroCaixa.OrcamentoId       := 0;
  vgDadosLivroCaixa.ReservaId         := 0;
  vgDadosLivroCaixa.IdentificacaoId      := 0;
  vgDadosLivroCaixa.IdentificacaoTipo    := '';
  vgDadosLivroCaixa.DocTipo              := '';
  vgDadosLivroCaixa.ResponsavelId        := 0;
  vgDadosLivroCaixa.TipoDespesaID        := 0;
  vgDadosLivroCaixa.Ordem                := 0;
  vgDadosLivroCaixa.CaixaTransferenciaId := 0;
  vgDadosLivroCaixa.ProvisaoTransferenciaId := 0;
//vgDadosLivroCaixa.Situacao             := '0';
//vgDadosLivroCaixa.Faturamento          := '';
//vgDadosLivroCaixa.ObservacaoMonetaria  := '';
//vgDadosLivroCaixa.ValorDesconto     := 0;
//vgDadosLivroCaixa.ValorJuros        := 0;
//vgDadosLivroCaixa.ValorMulta        := 0;
//vgDadosLivroCaixa.ValorFaturado     := 0;
//vgDadosLivroCaixa.ValorOutraDeducao := 0;
end;

procedure TdtmLookupContabil.LerDadadosConfigEmail(vpTabela: String);
begin
  ExecutaSqlAuxiliar('SELECT * FROM '+vpTabela,0);
  with dtmControles.sqlAuxiliar do
  begin
    vgEmailConfig.HostSmtp          := FieldByName('HOST_SMTP').AsString;
    vgEmailConfig.HostPop3          := FieldByName('HOST_POP3').AsString;
    vgEmailConfig.Porta             := FieldByName('PORTA').AsString;    
    vgEmailConfig.UserName          := FieldByName('USER_NAME').AsString;
    vgEmailConfig.PassWord          := FieldByName('PASSWORD').AsString;
    vgEmailConfig.AssuntoPadrao     := FieldByName('ASSUNTO_PADRAO').AsString;
    vgEmailConfig.Autenticar        := FieldByName('AUTENTICAR_SERVIDOR').AsString = 'S';
    vgEmailConfig.EspacoAssinatura  := FieldByName('ESPACO_TEXTO_RODAPE').AsInteger;
    if FieldByName('USAR_EMAIL_USUARIO').AsString = 'S' then
         vgEmailConfig.EmailEnvio := dtmControles.GetStr(' SELECT EMAIL FROM G_USUARIO WHERE USUARIO_ID = '+vgUsuarioID)
    else vgEmailConfig.EmailEnvio := FieldByName('EMAIL_PADRAO').AsString;

    vgEmailConfig.TextoEmail          := TStringList.Create;
    vgEmailConfig.TextoRodape         := TStringList.Create;
    vgEmailConfig.TextoEmail.Text     := FieldByName('TEXTO_EMAIL').AsString;
    vgEmailConfig.TextoRodape.Text    := FieldByName('TEXTO_RODAPE').AsString;
    vgEmailConfig.AdAssinaturaUsuario := FieldByName('ADICIONAR_ASSINATURA_USUARIO').AsString = 'S';
  end;
end;

procedure TdtmLookupContabil.LimparClientDataSet(
  vpClientDataSet: TClientDataSet);
begin
  vpClientDataSet.First;
  repeat
    if not vpClientDataSet.Eof then
      vpClientDataSet.Delete;
  until vpClientDataSet.Eof;
end;

function TdtmLookupContabil.LocalizarBoleto(vpPessoaId, vpGrupoId, vpBoletoId : string):String;
var
  viLista : TStringList;
  viDiretorio, viCaminho, viSql : String;
begin
  viDiretorio := GetCurrentDir +'\Boletos';
  viDiretorio := viDiretorio+'\'+FormatFloat('000', vgCedenteAtivo) + '\'+ IntToStr(vgPeriodoAtual);

  viSql := ' SELECT P.NOME AS NOME_PESSOA, '+
           '       G.DESCRICAO AS NOME_GRUPO, '+
           '       G.BOLETO_EMAIL '+
           ' FROM T_PESSOA P '+
           '  LEFT OUTER JOIN T_PESSOA_GRUPO G ON '+
           '  P.PESSOA_GRUPO_ID = G.PESSOA_GRUPO_ID ';

  if vpPessoaId <> '' then
       viSql := viSql + ' WHERE P.PESSOA_ID = '+ vpPessoaId
  else viSql := viSql + ' WHERE G.PESSOA_GRUPO_ID = '+ vpGrupoId;

  viLista := dtmControles.GetFields(viSql);

  if vpGrupoId <> '' then
  begin
    if viLista.Values['BOLETO_EMAIL'] = 'S' then
         viCaminho := viDiretorio+'\EMAIL\'+viLista.Values['NOME_GRUPO']+'_'+vpBoletoId+'.PDF'
    else viCaminho := viDiretorio+'\'+viLista.Values['NOME_GRUPO']+'_'+vpBoletoId+'.PDF';
  end
  else viCaminho := viDiretorio+'\'+viLista.Values['NOME_PESSOA']+'_'+vpBoletoId+'.PDF';
  Result := viCaminho;
  FreeAndNil(viLista);
end;

procedure TdtmLookupContabil.MarcarDesmarcarCompromissos(vpSqlDataSet: TSimpleDataSet;
  vpMarcar: Boolean);
begin
  vpSqlDataSet.DisableControls;
  vpSqlDataSet.First;
  while not vpSqlDataSet.eof do
  begin
    vpSqlDataSet.Edit;
    vpSqlDataSet.FieldByName('Selecionar').AsBoolean := vpMarcar;
    vpSqlDataSet.post;
    vpSqlDataSet.next;
  end;
  vpSqlDataSet.First;
  vpSqlDataSet.EnableControls;
end;

procedure TdtmLookupContabil.MarcarDesmarcarCompromissosClient(
  vpSqlDataSet: TClientDataSet; vpMarcar: Boolean);
begin
  vpSqlDataSet.DisableControls;
  vpSqlDataSet.First;
  while not vpSqlDataSet.eof do
  begin
    vpSqlDataSet.Edit;
    vpSqlDataSet.FieldByName('Selecionar').AsBoolean := vpMarcar;
    vpSqlDataSet.post;
    vpSqlDataSet.next;
  end;
  vpSqlDataSet.First;
  vpSqlDataSet.EnableControls;
end;

function TdtmLookupContabil.MesAnoReferencia(vpData: String): String;
var
  viAno : String;
  viMes : Integer;
begin
  viMes  := StrToInt(copy(vpData,4,2));
  viAno  := copy(vpData,7,4);
  Result := AnsiUpperCase(Rotinas.Mes[viMes]+'/'+viAno);
end;

function TdtmLookupContabil.PegarDataFinalMes(viAnoMes: String): String;
var
  viMes, viDia, viAno : String;
begin
  viMes  := Copy(viAnoMes,5,2);
  viAno  := Copy(viAnoMes,1,4);
  viDia  := ValidaMes(viMes+viAno);
  Result := viDia+'/'+viMes+'/'+Copy(viAnoMes,1,4);
end;

function TdtmLookupContabil.PegarAnoMes(vpData : String; vpAnterior : Boolean = False):Integer;
var
  viAno, viMes : Integer;
begin
  viAno := StrToInt(copy(vpData,7,4));
  viMes := StrToInt(copy(vpData,4,2));

  if vpAnterior then
  begin
    if (viMes = 1) then
    begin
      Dec(viAno);
      viMes := 12;
    end
    else Dec(viMes);
  end;
  result := StrToInt(FormatFloat('00', viAno) + FormatFloat('00', viMes));
end;

function TdtmLookupContabil.PegarVencimentoPadrao(vpDia: String): String;
var
  viAno, viMes : string;
begin
  viAno  := copy(IntToStr(vgPeriodoAtual),1,4);
  viMes  := copy(IntToStr(vgPeriodoAtual),5,2);
  Result := vpDia+'/'+viMes+'/'+viAno;
end;

procedure TdtmLookupContabil.PreencherSaldoLabel(vpCaption : String; vpValor : Currency; vpLabel : TdxBarStatic;
             vpMudarIcone : Boolean = False; vpOpcao : String = '');
begin
  vpLabel.Caption  := vpCaption + FormatFloat(',#0.00', vpValor);
  if vpMudarIcone then
  begin
    if vpValor > 0 then
    begin
      if vpOpcao = '1' then
           vpLabel.ImageIndex := 3
      else vpLabel.ImageIndex := 30;
    end
    else
    begin
      if vpOpcao = '1' then
           vpLabel.ImageIndex := 4
      else vpLabel.ImageIndex := 17;
    end;
  end;

  if (vpValor <> 0) then
       vpLabel.Visible := ivAlways
  else vpLabel.Visible := ivNever;
end;

function TdtmLookupContabil.PrepararSqlSoma(vpTipoCaixa, vpCaixaID, vpBalanceteId, vpTipo, vpPessoaID  : String; vpData : string = '';
          vpPrevisao : String = ''; vpData2 : string = ''; vpCentroCusto : Integer = 0):Currency;
var
  viSql : String;
begin
  viSql := ' SELECT SUM(VALOR) AS VALOR FROM J_LIVRO_CAIXA LC '+
           '   LEFT OUTER JOIN J_CAIXA C ON '+
           '   LC.CAIXA_ID = C.CAIXA_ID '+
           ' WHERE LC.OPERACAO = '+QuotedStr(vpTipo);

  if vpPrevisao <> '' then
    viSql := viSql + vpPrevisao
  else
  begin
    if (vpTipoCaixa <> '-1') and (vpTipoCaixa <> '') and (vpTipoCaixa <> '0') and (vpTipoCaixa <> 'null') then
      viSql := viSql + '  AND C.TIPO_CAIXA = '+ QuotedStr(vpTipoCaixa);

    if vpCaixaID <> '' then
      viSql := viSql + '  AND LC.CAIXA_ID = '+ vpCaixaId;

    if vpBalanceteId <> '' then
      viSql := viSql + '  AND LC.BALANCETE_GRUPO_ID IN ('+ vpBalanceteId+')';

    if vpPessoaID <> '' then
      viSql := viSql + '  AND LC.PESSOA_ID = '+QuotedStr(vpPessoaID);

    if vpData <> '' then
      viSql := viSql + ' AND LC.DATA_PAGAMENTO <= '+ QuotedStr(TrocaBarraPPonto(vpData));

    if vpData2 <> '' then
      viSql := viSql + ' AND LC.DATA_PAGAMENTO >= '+ QuotedStr(TrocaBarraPPonto(vpData2));

    if vpCentroCusto > 0 then
      viSql := viSql + '  AND LC.CENTRO_CUSTO_ID = '+ vpCentroCusto.ToString;
  end;

  Result := dtmControles.GetFloat(viSql);
end;

procedure TdtmLookupContabil.RegistrarCompromissoVencido(vpCount : Integer; vpQtdGravar, vpCompromissoId : String;
              vpQtdAdicional, vpValorDiferenca : Currency; vpAtualizar: Boolean);
var
  viAnoMesRealizado, viDataRealizacao, viPessoaNome : String;
  viDataCompromisso : TDate;
begin
  if vpQtdAdicional > 0 then
       vpQtdGravar := CurrToStr(vpQtdAdicional+1)
  else vpQtdGravar := '';

  if not vpAtualizar then
  begin
    if vpCount = 0 then
         viDataCompromisso := vgCompromissoVencido.DataVencimento
    else viDataCompromisso  := Rotinas.CalcularDataVencimento(vgCompromissoVencido.DataVencimento, vgCompromissoVencido.PeriodoTipo, vpCount);

    ExecutaSqlAuxiliar(' INSERT INTO J_LIVRO_FINANCEIRO( '+
                       '              LIVRO_FINANCEIRO_ID, '+
                       '              LIVRO_AGENDAMENTO_ID, ' +
                       '              CONTABIL_CONTA_ID, '+
                       '              ORCAMENTO_ID,'+
                       '              RESERVA_ID,'+
                       '              VALOR_AGENDADO, '+
                       '              ANO_MES_REFERENCIA, '+
                       '              CENTRO_CUSTO_ID, '+
                       '              BALANCETE_GRUPO_ID, '+
                       '              ESPECIE, '+
                       '              OPERACAO, '+
                       '              PESSOA_ID, '+
                       '              DATA_VENCIMENTO, '+
                       '              OBSERVACAO, '+
                       '              HISTORICO, '+
                       '              IR, '+
                       '              REGISTRO_PARCIAL, '+
                       '              DOCUMENTO_NUMERO, '+
                       '              CAIXA_ID, '+
                       '              SITUACAO) '+
                       ' VALUES(      :LIVRO_FINANCEIRO_ID, '+
                       RetNullInteger(vgCompromissoVencido.LivroAgendamentoId)+', '+
                       '              :CONTABIL_CONTA_ID, '+
                       RetNullInteger(vgCompromissoVencido.OrcamentoId)+', '+
                       RetNullInteger(vgCompromissoVencido.ReservaId)+', '+
                       '              :VALOR_AGENDADO, '+
                       '              :ANO_MES_REFERENCIA, '+
                       '              :CENTRO_CUSTO_ID, '+
                       '              :BALANCETE_GRUPO_ID, '+
                       '              :ESPECIE, '+
                       '              :OPERACAO, '+
                       RetNullInteger(vgCompromissoVencido.PessoaId)+', '+
                       '              :DATA_VENCIMENTO, '+
                       RetNull(vgCompromissoVencido.Observacao)+', '+
                       RetNull(vgCompromissoVencido.Historico)+', '+
                       '              :IR, '+
                       '              :REGISTRO_PARCIAL, '+
                       '              :DOCUMENTO_NUMERO, '+
                       '              :CAIXA_ID, '+
                       '              :SITUACAO)',2);
    with dtmControles.sqlAuxiliar do
    begin
      ParamByName('LIVRO_FINANCEIRO_ID').AsBCD    := dtmControles.GerarSequencia('J_LIVRO_FINNACEIRO');
      ParamByName('CONTABIL_CONTA_ID').AsBCD      := vgCompromissoVencido.ContabilContaId;
      ParamByName('VALOR_AGENDADO').AsCurrency    := vgCompromissoVencido.ValorAgendado;
      ParamByName('ANO_MES_REFERENCIA').AsInteger := PegarAnoMes(DateToStr(viDataCompromisso));
      ParamByName('CENTRO_CUSTO_ID').AsBCD        := vgCompromissoVencido.CentroCustoId;
      ParamByName('BALANCETE_GRUPO_ID').AsBCD     := vgCompromissoVencido.BalanceteGrupoId;
      ParamByName('ESPECIE').AsString             := vgCompromissoVencido.Especie;
      ParamByName('OPERACAO').AsString            := vgCompromissoVencido.Operacao;
      ParamByName('DATA_VENCIMENTO').AsDate       := viDataCompromisso;
      ParamByName('IR').AsString                  := vgCompromissoVencido.IR;
      ParamByName('REGISTRO_PARCIAL').AsString    := vgCompromissoVencido.RegistroParcial;
      ParamByName('DOCUMENTO_NUMERO').AsString    := vgCompromissoVencido.DocumentoNumero;
      ParamByName('CAIXA_ID').AsInteger           := vgCompromissoVencido.CaixaID;
      ParamByName('SITUACAO').AsString            := vgCompromissoVencido.SituacaoLocal;
      ExecSQL(FALSE);
    end;
  end
  else
    ExecutaSqlAuxiliar(' UPDATE J_LIVRO_FINANCEIRO SET ' +
                       '        VALOR_AGENDADO = '+ QuotedStr(TrocaVirgPPto(CurrToStr(vpValorDiferenca))) +', '+
                       '        ATUALIZADO = '+QuotedStr('S')+
                       ' WHERE LIVRO_FINANCEIRO_ID = ' + vpCompromissoId,1);
end;

procedure TdtmLookupContabil.RegistrarRecebimentoFinanceiro(vpTransferenciaId : Integer = 0;
        vpAtualizar : Boolean = False);

  procedure CarregarSQlInsert;
  begin
    // Gravar Livro Caixa
    ExecutaSqlAuxiliar(' INSERT INTO J_LIVRO_CAIXA( '+
                       '              LIVRO_CAIXA_ID, '+
                       '              CAIXA_TRANSFERENCIA_ID, '+
                       '              PROVISAO_TRANSFERENCIA_ID, '+
                       '              CAIXA_ID, '+
                       '              ORCAMENTO_ID, '+
                       '              PESSOA_ID, '+
                       '              ASSOCIADO_ID, '+
                       '              IDENTIFICACAO_ID, '+
                       '              IDENTIFICACAO_TIPO, '+
                       '              FAVORECIDO_ASSOCIADO,'+
                       '              TIPO_DESPESA_ID, '+
                       '              RESPONSAVEL_ID, '+
                       '              CENTRO_CUSTO_ID, '+
                       '              CONTABIL_CONTA_ID, '+
                       '              CONTABIL_GRUPO_ID, '+
                       '              BALANCETE_GRUPO_ID, '+
                       '              LIVRO_FINANCEIRO_ID, '+
                       '              RESERVA_ID, '+
                       '              COMPROMISSO_VENCIDO_ID, '+
                       '              VALOR, '+
                       '              VALOR_PREVISTO, '+
                       '              OPERACAO, '+
                       '              ESPECIE, '+
                       '              DATA_PAGAMENTO, '+
                       '              DATA_VENCIMENTO, '+
                       '              DATA_LANCAMENTO, '+
                       '              DATA_PAG_BOLETO, '+
                       '              REFERENCIA, '+
                       '              ANO_MES_REGISTRO, '+
                       '              HISTORICO, '+
                       '              DESCRICAO_AGRUPADOR, '+
                       '              ORDEM, '+
                       '              RELATORIO_INTERNO, '+
                       '              IR, '+
                       '              DOCUMENTO_NUMERO, '+
                       '              DOC_TIPO, '+
                       '              OBSERVACAO) '+
                       ' VALUES(      :LIVRO_CAIXA_ID, '+
                                       RetNullInteger(vgDadosLivroCaixa.CaixaTransferenciaId)+','+
                                       RetNullInteger(vgDadosLivroCaixa.ProvisaoTransferenciaId)+','+
                       '              :CAIXA_ID, '+
                                       RetNullInteger(vgDadosLivroCaixa.OrcamentoId)+','+
                                       RetNullInteger(vgDadosLivroCaixa.PessoaId)+','+
                                       RetNullInteger(vgDadosLivroCaixa.AssociadoId)+','+
                                       RetNullInteger(vgDadosLivroCaixa.IdentificacaoId)+','+
                                       RetNull(QuotedStr(vgDadosLivroCaixa.IdentificacaoTipo))+','+
                                       RetNull(QuotedStr(vgDadosLivroCaixa.AssociadoFavorecido))+','+
                                       RetNullInteger(vgDadosLivroCaixa.TipoDespesaID)+','+
                                       RetNullInteger(vgDadosLivroCaixa.ResponsavelId)+','+
                                       RetNullInteger(vgDadosLivroCaixa.CentroCustoId)+','+
                                       RetNullInteger(vgDadosLivroCaixa.ContabilContaID)+','+
                                       RetNullInteger(vgDadosLivroCaixa.ContabilGrupoId)+','+
                                       RetNullInteger(vgDadosLivroCaixa.BalanceteGrupoId)+','+
                                       RetNullInteger(vgDadosLivroCaixa.LivroFinanceiroID)+','+
                                       RetNullInteger(vgDadosLivroCaixa.ReservaId)+','+
                                       RetNullInteger(vgDadosLivroCaixa.CompromissoVencidoId)+','+
                       '              :VALOR, '+
                       '              :VALOR_PREVISTO, '+
                       '              :OPERACAO, '+
                       '              :ESPECIE, '+
                       '              :DATA_PAGAMENTO, '+
                       '              :DATA_VENCIMENTO, '+
                       '              :DATA_LANCAMENTO, '+
                       '              :DATA_PAG_BOLETO, '+
                       '              :REFERENCIA, '+
                       '              :ANO_MES_REGISTRO, '+
                       '              :HISTORICO, '+
                                       RetNull(QuotedStr(vgDadosLivroCaixa.DescricaoAgrupador))+','+
                                       RetNullInteger(vgDadosLivroCaixa.Ordem)+','+
                       '              :RELATORIO_INTERNO, '+
                       '              :IR, '+
                       '              :DOCUMENTO_NUMERO, '+
                       '              :DOC_TIPO, '+
                       '              :OBSERVACAO)',2);
  end;

  procedure CarregarSqlUpdate;
  begin
    // Gravar Livro Caixa
    ExecutaSqlAuxiliar(' UPDATE J_LIVRO_CAIXA SET '+
                       '              CAIXA_ID = :CAIXA_ID, '+
                       '              PESSOA_ID = '+RetNullInteger(vgDadosLivroCaixa.PessoaId)+','+
                       '              ASSOCIADO_ID = '+RetNullInteger(vgDadosLivroCaixa.AssociadoId)+','+
                       '              FAVORECIDO_ASSOCIADO = '+RetNull(QuotedStr(vgDadosLivroCaixa.AssociadoFavorecido))+','+
                       '              CENTRO_CUSTO_ID   = '+RetNullInteger(vgDadosLivroCaixa.CentroCustoId)+','+
                       '              CONTABIL_CONTA_ID = '+RetNullInteger(vgDadosLivroCaixa.ContabilContaID)+','+
                       '              CONTABIL_GRUPO_ID = '+RetNullInteger(vgDadosLivroCaixa.ContabilGrupoId)+','+
                       '              BALANCETE_GRUPO_ID= '+RetNullInteger(vgDadosLivroCaixa.BalanceteGrupoId)+','+
                       '              ORCAMENTO_ID      = '+RetNullInteger(vgDadosLivroCaixa.OrcamentoId)+','+
                       '              RESERVA_ID        = '+RetNullInteger(vgDadosLivroCaixa.ReservaId)+','+
                       '              TIPO_DESPESA_ID   = '+RetNullInteger(vgDadosLivroCaixa.TipoDespesaID)+','+
                       '              RESPONSAVEL_ID    = '+RetNullInteger(vgDadosLivroCaixa.ResponsavelId)+','+
                       '              VALOR             = :VALOR, '+
                       '              ESPECIE           = :ESPECIE, '+
                       '              DATA_PAGAMENTO    = :DATA_PAGAMENTO, '+
                       '              DATA_VENCIMENTO   = :DATA_VENCIMENTO, '+
                       '              REFERENCIA        = :REFERENCIA, '+
                       '              ANO_MES_REGISTRO  = :ANO_MES_REGISTRO, '+
                       '              HISTORICO         = :HISTORICO, '+
                       '              IR                = :IR, '+
                       '              DOCUMENTO_NUMERO  = :DOCUMENTO_NUMERO, '+
                       '              DOC_TIPO          = :DOC_TIPO, '+
                       '              RELATORIO_INTERNO = :RELATORIO_INTERNO, '+
                       '              OBSERVACAO        = :OBSERVACAO'+
                       ' WHERE LIVRO_CAIXA_ID = '+ IntToStr(vgDadosLivroCaixa.LivroCaixaId),2);
  end;

  procedure CarregarSalvar;
  begin
    with dtmControles.sqlAuxiliar do
    begin
      if not vpAtualizar then
      begin
        if vpTransferenciaId = 0 then
             ParamByName('LIVRO_CAIXA_ID').AsBCD    := dtmControles.GerarSequencia('J_LIVRO_CAIXA')
        else ParamByName('LIVRO_CAIXA_ID').AsBCD    := vpTransferenciaId;
        ParamByName('OPERACAO').AsString            := vgDadosLivroCaixa.Operacao;
        ParamByName('DATA_LANCAMENTO').AsString     := vgDadosLivroCaixa.DataLancamento;
        ParamByName('VALOR_PREVISTO').AsCurrency    := vgDadosLivroCaixa.ValorCompromisso;
        if vgDadosLivroCaixa.DataPagBoleto = '' then
             ParamByName('DATA_PAG_BOLETO').AsString  := vgDadosLivroCaixa.DataPagamento
        else ParamByName('DATA_PAG_BOLETO').AsString  := TrocaBarraPPonto(vgDadosLivroCaixa.DataPagBoleto);
      end;

      ParamByName('CAIXA_ID').AsBCD               := vgDadosLivroCaixa.CaixaID;
      ParamByName('VALOR').AsCurrency             := vgDadosLivroCaixa.ValorPago;
      ParamByName('ESPECIE').AsString             := vgDadosLivroCaixa.Especie;
      ParamByName('DATA_PAGAMENTO').AsString      := vgDadosLivroCaixa.DataPagamento;
      ParamByName('DATA_VENCIMENTO').AsString     := vgDadosLivroCaixa.DataVencimento;
      ParamByName('REFERENCIA').AsString          := vgDadosLivroCaixa.Referencia;
      ParamByName('ANO_MES_REGISTRO').AsString    := vgDadosLivroCaixa.AnoMesRegistro;
      ParamByName('HISTORICO').AsString           := Copy(vgDadosLivroCaixa.Historico,1,90);
      ParamByName('IR').AsString                  := vgDadosLivroCaixa.IR;
      ParamByName('DOCUMENTO_NUMERO').AsString    := vgDadosLivroCaixa.DocumentoNumero;
      ParamByName('DOC_TIPO').AsString            := vgDadosLivroCaixa.DocTipo;
      ParamByName('RELATORIO_INTERNO').AsString   := vgDadosLivroCaixa.RelatorioInterno;
      ParamByName('OBSERVACAO').AsString          := vgDadosLivroCaixa.Observacao;
      ExecSQL(FALSE);
    end;
    vgDadosLivroCaixa.AssociadoFavorecido := '';
  end;

begin
  if vpAtualizar then
       CarregarSqlUpdate
  else CarregarSQlInsert;

  CarregarSalvar;
  dtmControles.sqlAuxiliar.Active := False;
end;

function TdtmLookupContabil.SetarBalanceteItem(vpBalanceteId: Integer): Integer;
var
  i : Integer;
begin
  for i := 0 to 10 do
  begin
    if vgTabBalancete[i] = vpBalanceteId then
      Result := i
    else
      if vgTabBalancete[i] = -1 then
        Result := 0;
  end;
end;

procedure TdtmLookupContabil.ValidarIntervalodeAnoMes(vpAnoMesInicial, vpAnoMesFinal: TcxComboBox; vpPeriodo : String);
var
  viPeriodoInicial, viPeriodoFinal : String;
begin
  if (vpAnoMesInicial.Text = '') then
  begin
    Application.MessageBox('Per�odo Inicial inv�lido!!!', 'Aten��o', MB_OK + MB_ICONWARNING);
    vpAnoMesInicial.SetFocus;
    abort;
  end;

  viPeriodoInicial := copy(vpAnoMesInicial.EditValue,4,4) + copy(vpAnoMesInicial.EditValue,1,2);
  if (vpPeriodo = '3') or (vpAnoMesFinal.text <> '') then
  begin
    viPeriodoFinal := copy(vpAnoMesFinal.EditValue,4,4) + copy(vpAnoMesFinal.EditValue,1,2);

    if viPeriodoInicial > viPeriodoFinal then
    begin
      Application.MessageBox('Per�odo Final n�o pode ser menor que Per�odo Inicial!!!', 'Aten��o', MB_OK + MB_ICONWARNING);
      vpAnoMesFinal.SetFocus;
      abort;
    end;
  end;
end;

function TdtmLookupContabil.VefificaExistenciaBoleto(vpPessoaId : String):Boolean;
begin
  ExecutaSqlAuxiliar(' SELECT BOLETA_ID FROM T_COMPROMISSO_VENCIDO '+
                     ' WHERE NOT BOLETA_ID IS NULL '+
                     '   AND SITUACAO = ''1'''+
                     '   AND PESSOA_ID = '+ vpPessoaId+
                     '   AND CEDENTE_ID = '+ IntToStr(vgCedenteAtivo),0);
  result := not dtmControles.sqlAuxiliar.IsEmpty;
end;

procedure TdtmLookupContabil.VerificaAnoMesFechado(vpData: String);
var
  viAnoMesLancamento : Integer;
  viAnoMesFechado : String;
begin
  viAnoMesLancamento := dtmLookupContabil.PegarAnoMes(vpData);
  viAnoMesFechado    := dtmControles.GetStr(' SELECT ANO_MES_FECHAMENTO FROM T_CEDENTE '+
                                            ' WHERE CEDENTE_ID = '+IntToStr(vgCedenteAtivo));
  if viAnoMesFechado <> '' then
  begin
    if viAnoMesLancamento <= StrToInt(viAnoMesFechado) then
    begin
      Application.MessageBox(Pchar('Lan�amento n�o permitido nesta data.'+#13+#13+
                                   'Livro Caixa do m�s de '+ Mes[StrToInt(copy(IntToStr(viAnoMesLancamento),5,2))] +
                                   ' de '+copy(IntToStr(viAnoMesLancamento),1,4)+' esta fechado!!!'), 'Aten��o', MB_OK + MB_ICONWARNING);
      abort;
    end;
  end;
end;

procedure TdtmLookupContabil.VerificarEdicao(vpReferencia, vpOperacao : String);
var
  viResultado : string;
begin
  if vgReferenciaInicial = '' then
  begin
    ExecutaSqlAuxiliar(' UPDATE G_CONFIG SET VALOR = '+ QuotedStr(vpReferencia)+
                       ' WHERE NOME = '+ QuotedStr('REFERENCIA_BALANCETE_INICIAL'),1);
    vgReferenciaInicial := vpReferencia;
  end;

  viResultado := dtmControles.GetStr(' SELECT SITUACAO FROM T_BALANCETE WHERE REFERENCIA = '+QuotedStr(vpReferencia)+
                                     ' AND CEDENTE_ID = '+ IntToStr(vgCedenteAtivo));
  if viResultado = '2' then
  begin
    Application.MessageBox(Pchar(vpOperacao+' n�o permitido. Balancete do M�s Fechado!!!'), 'Aten��o', MB_OK + MB_ICONWARNING);
    abort;
  end
  else
    if viResultado = '' then
    begin
      viResultado := dtmControles.GetStr(' SELECT MAX(REFERENCIA) AS REFERENCIA FROM T_BALANCETE WHERE SITUACAO = ''2'''+
                                         ' AND CEDENTE_ID = '+ IntToStr(vgCedenteAtivo));
      if viResultado <> '' then
      begin
        if (StrToInt(vpReferencia)) < (StrToInt(viResultado)) then
        begin
          Application.MessageBox(Pchar(vpOperacao+' n�o permitido. Per�odo menor que o per�odo do balancete anterior!!!'), 'Aten��o', MB_OK + MB_ICONWARNING);
          abort;
        end;
      end
      else
      begin
        if (StrToInt(vpReferencia)) < (StrToInt(vgReferenciaInicial)) then
        begin
          Application.MessageBox(Pchar(vpOperacao+' n�o permitido. Per�odo menor que o per�odo inicial do sistema!!!'), 'Aten��o', MB_OK + MB_ICONWARNING);
          abort;
        end;
        
      end;
    end;

  if StrToInt(vpReferencia) > vgPeriodoAtual then
  begin
    Application.MessageBox(Pchar(vpOperacao+' n�o permitido. Per�odo maior que o per�odo atual!!!'), 'Aten��o', MB_OK + MB_ICONWARNING);
    abort;
  end;

end;

function TdtmLookupContabil.VerificarHistoricoPadrao(vpHistorico,
  vpContabilContaId: string): string;
var
  viLista : TStringList;
begin
  viLista := dtmControles.GetFields(' SELECT HISTORICO_PADRAO, GENERICO FROM T_CONTABIL_CONTA '+
                                     ' WHERE CONTABIL_CONTA_ID = '+vpContabilContaId);
  if viLista.Values['GENERICO'] = 'S' then
    Result := ''
  else
    if viLista.Values['HISTORICO_PADRAO'] = '' then
         Result := vpHistorico
    else Result := viLista.Values['HISTORICO_PADRAO'];
  viLista.Free;
end;

procedure TdtmLookupContabil.VerificarProgramacaoAjuste(vpCompromissoAgendadoId,
  vpAnoMes: String);
var
    viProgramacaoAjusteId : String;
begin
  ExecutaSqlAuxiliar(' SELECT PROGRAMACAO_AJUSTE_ID, COMPROMISSO_REAJUSTAR, COMPROMISSO_SITUACAO '+
                     ' FROM T_PROGRAMACAO_AJUSTE '+
                     ' WHERE COMPROMISSO_AGENDADO_ID = '+vpCompromissoAgendadoId+
                     '   AND ANO_MES = '+QuotedStr(vpAnoMes)+
                     '   AND SITUACAO = '+QuotedStr('A'),0);
  if not dtmControles.sqlAuxiliar.IsEmpty then
  begin
    dtmControles.SimpleAuxiliar.Edit;
    if dtmControles.sqlAuxiliar.FieldByName('COMPROMISSO_REAJUSTAR').AsString = 'S' then
    begin
      dtmControles.SimpleAuxiliar.FieldByName('VALOR_ANTERIOR').AsCurrency := dtmControles.SimpleAuxiliar.FieldByName('VALOR_ATUAL').AsCurrency;
      dtmControles.SimpleAuxiliar.FieldByName('VALOR_ATUAL').AsCurrency    := dtmControles.GetFloat(' SELECT VALOR_ATUAL FROM T_LANCAMENTO_COMPROMISSO '+
                                                       ' WHERE LANCAMENTO_COMPROMISSO_ID = '+dtmControles.SimpleAuxiliar.FieldByName('LANCAMENTO_COMPROMISSO_ID').AsString);
      dtmControles.SimpleAuxiliar.FieldByName('SITUACAO_LOCAL').AsString := '1';
    end
    else dtmControles.SimpleAuxiliar.FieldByName('SITUACAO_LOCAL').AsString := dtmControles.sqlAuxiliar.FieldByName('COMPROMISSO_SITUACAO').AsString;
    dtmControles.SimpleAuxiliar.ApplyUpdates(-1);

    viProgramacaoAjusteId := dtmControles.sqlAuxiliar.FieldByName('PROGRAMACAO_AJUSTE_ID').AsString;
    ExecutaSqlAuxiliar(' UPDATE T_PROGRAMACAO_AJUSTE SET SITUACAO = '+ QuotedStr('R')+
                       ' WHERE PROGRAMACAO_AJUSTE_ID = '+ viProgramacaoAjusteId,1);
  end;
end;

procedure TdtmLookupContabil.VerificarProvimentoMes(vpLancamentoCompId,
  vpAnoMes: string);
var
  viSql : string;
  viId : Integer;
begin
  if vpLancamentoCompId = '' then
    Exit;

  viId := dtmControles.GetInt(' SELECT COMPROMISSO_RESERVA_ID FROM T_COMPROMISSO_RESERVA '+
                              ' WHERE LANCAMENTO_COMPROMISSO_ID = '+vpLancamentoCompId+
                              '   AND REFERENCIA_ANOMES = '+QuotedStr(vpAnoMes));
  if viId = 0 then
  begin
    sqlCompromissoReserva.Active := False;
    sqlCompromissoReserva.DataSet.ParamByName('LANCAMENTO_COMPROMISSO_ID').AsInteger := StrToInt(vpLancamentoCompId);
    sqlCompromissoReserva.Active := True;

    while not sqlCompromissoReserva.eof do
    begin
      if sqlCompromissoReserva.FieldByName('LANCAMENTO_COMPROMISSO_ID').AsInteger = 0 then
      begin
        sqlCompromissoReserva.Next;
        Continue;
      end;

      ExecutaSqlAuxiliar(' INSERT INTO T_COMPROMISSO_RESERVA( '+
                           '              COMPROMISSO_RESERVA_ID, '+
                           '              LANCAMENTO_COMPROMISSO_ID, '+
                           '              CONTABIL_CONTA_ID, '+
                           '              RESERVA_ID, '+
                           '              PERCENTUAL, '+
                           '              REFERENCIA_ANOMES) '+
                           ' VALUES(      :COMPROMISSO_RESERVA_ID, '+
                           '              :LANCAMENTO_COMPROMISSO_ID, '+
                           '              :CONTABIL_CONTA_ID, '+
                           '              :RESERVA_ID, '+
                           '              :PERCENTUAL, '+
                           '              :REFERENCIA_ANOMES)',2);
      with dtmControles.sqlAuxiliar do
      begin
        ParamByName('COMPROMISSO_RESERVA_ID').AsCurrency   := dtmControles.GerarSequencia('T_COMPROMISSO_RESERVA');
        ParamByName('LANCAMENTO_COMPROMISSO_ID').AsInteger := sqlCompromissoReserva.FieldByName('LANCAMENTO_COMPROMISSO_ID').AsInteger;
        ParamByName('CONTABIL_CONTA_ID').AsInteger         := sqlCompromissoReserva.FieldByName('CONTABIL_CONTA_ID').AsInteger;
        ParamByName('RESERVA_ID').AsInteger                := sqlCompromissoReserva.FieldByName('RESERVA_ID').AsInteger;
        ParamByName('PERCENTUAL').AsCurrency               := sqlCompromissoReserva.FieldByName('PERCENTUAL').AsCurrency;
        ParamByName('REFERENCIA_ANOMES').AsString          := vpAnoMes;
        ExecSQL(FALSE);
      end;
      sqlCompromissoReserva.Next
    end;
    sqlCompromissoReserva.Active := False;
  end;
end;

end.