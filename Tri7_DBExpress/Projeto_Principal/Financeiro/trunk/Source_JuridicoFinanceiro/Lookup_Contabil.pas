unit Lookup_Contabil;

interface

uses
  I9Query,
  SysUtils, Classes, cxDBEditRepository, DB, DBClient, SimpleDS,
  cxEditRepositoryItems, cxEdit, cxDropDownEdit, Forms, Windows, Controls, cxPC,
  cxStyles, cxDBEdit, cxClasses, dxBarExtItems, ImgList, DbxDevartInterBase, cxBarEditItem, dxBaR;

type

  TCompromissoVencido = Record
    ValorAgendado, ValorPago : Currency;
    PeriodoInicial, PeriodoFinal, AnoMesLancamento, SituacaoLocal, BoletoId, ReciboId, Especie,
    Operacao, Historico, Observacao, IR, CNJ, DocumentoNumero, RegistroParcial, ContabilRL : String;
    PeriodoTipo, Dia, TipoPagamento, FinanceiroRemuneracaoID, CaixaID, Parcela, ParcelaInicial : Integer;
    CentroCustoId, BalanceteGrupoId, ProcessoContratoId, ProcessoContratoItemId,
    ContabilContaId, PessoaId, LivroRemuneracaoId, LivroAgendamentoId, OrcamentoId,
    ReservaID, TipoModalidadeId, LivroFinanceiroId : Integer;
    DataVencimento : TDate;
    MostrarMensagem, AtualizarAgendado, NenhumaAlteracao : Boolean;
  end;

  TDadosLivroCaixa = Record
    DataLancamento, DataVencimento, DataPagamento, Referencia, Operacao, Especie, Observacao, Form, Historico,
    AnoMesRegistro, AnoMesReferencia, ClienteID, Contrato, IR, CNJ, DocumentoNumero, RegistroParcial,
    DocTipo, RefPeriodo, IdentificacaoTipo, MensagemBloqueado, DescricaoAgrupada, Situacao, Faturamento,
    ObservacaoMonetaria, ContabilRL, ConciliacaoId : String;
    PessoaId, ResponsavelId, ProcessoID, ContabilContaID, CentroCustoId, BalanceteGrupoId, ContabilGrupoId,
    CaixaID, LivroFinanceiroID, ProcessoContratoiItemId, Tipo, LivroRemuneracaoId,
    LivroCaixaId, LivroAgendamentoId, CaixaTransferenciaId, OrcamentoId, ReservaId,
    TipoModalidadeId, PeriodoId, IdentificacaoId, TipoCargaId, DuplicaCentroCustoId, Ordem : Integer;
    ValorPago, ValorCompromisso, ValorFavorito, ValorProtocolo : Currency;
    ValorDesconto, ValorOutraDeducao, ValorJuros, ValorMulta, ValorFaturado, ValorOutrasTaxas : Currency;
    Confirmado, Novo, Automatico, DuplicarItem, Favorito, Bloqueado, CriarIdentificador : Boolean;
  End;

  TdtmLookupContabil = class(TDataModule)
    cxEditRepository1: TcxEditRepository;
    Combo_EntradaSaida: TcxEditRepositoryImageComboBoxItem;
    Combo_OperacaoContabil: TcxEditRepositoryImageComboBoxItem;
    sqlGrupoContabilTodos: TI9Query;
    dtsGrupoContabilTodos: TDataSource;
    sqlGrupoContabilAtivos: TI9Query;
    dtsGrupoContabiAtivos: TDataSource;
    Lista_GrupoContabilTodos: TcxEditRepositoryLookupComboBoxItem;
    Lista_GrupoContabilAtivos: TcxEditRepositoryLookupComboBoxItem;
    sqlGrupoContabilSaidas: TI9Query;
    dtsGrupoContabilSaidas: TDataSource;
    sqlGrupoContabilEntradas: TI9Query;
    dtsGrupoContabiEntradas: TDataSource;
    Lista_GrupoContabilSaidas: TcxEditRepositoryLookupComboBoxItem;
    Lista_GrupoContabilEntradas: TcxEditRepositoryLookupComboBoxItem;
    sqlBalanceteGrupo: TI9Query;
    dtsBalanceteGrupo: TDataSource;
    Lista_BalanceteGrupoDescricao: TcxEditRepositoryLookupComboBoxItem;
    sqlPlanoContasAtivo: TI9Query;
    dtsPlanoContasAtivo: TDataSource;
    sqlPlanoContasTodos: TI9Query;
    dtsPlanoContasTodos: TDataSource;
    Lista_PlanoContasAtivo: TcxEditRepositoryLookupComboBoxItem;
    Lista_PlanoContasTodos: TcxEditRepositoryLookupComboBoxItem;
    sqlPlanoContasReceitas: TI9Query;
    dtsPlanoContasReceitas: TDataSource;
    Lista_PlanoContasReceitas: TcxEditRepositoryLookupComboBoxItem;
    Combo_Periodo: TcxEditRepositoryImageComboBoxItem;
    Combo_SituacaoPagamento: TcxEditRepositoryImageComboBoxItem;
    Combo_SituacaoCompLocal: TcxEditRepositoryImageComboBoxItem;
    Combo_SituacaoCompGeralImg: TcxEditRepositoryImageComboBoxItem;
    Combo_PeriodoLimitado: TcxEditRepositoryImageComboBoxItem;
    Combo_SituacaoCompGeral: TcxEditRepositoryImageComboBoxItem;
    Lista_BalanceteGrupoSigla: TcxEditRepositoryLookupComboBoxItem;
    sqlCentroCustoTodos: TI9Query;
    dtsCentroCustoTodos: TDataSource;
    sqlCentroCustoAtivo: TI9Query;
    dtsCentroCustoAtivo: TDataSource;
    Lista_CentroCustoTodos: TcxEditRepositoryLookupComboBoxItem;
    Lista_CentroCustoAtivo: TcxEditRepositoryLookupComboBoxItem;
    sqlCompReceitaTodos: TI9Query;
    dtsCompReceitaTodos: TDataSource;
    Lista_CompReceitassTodos: TcxEditRepositoryLookupComboBoxItem;
    Combo_SituacaoBoleto: TcxEditRepositoryImageComboBoxItem;
    sqlPlanoContasDespesasTodos: TI9Query;
    dtsPlanoContasDespesasTodos: TDataSource;
    dtsPlanoContasDespesasAtivo: TDataSource;
    sqlPlanoContasDespesasAtivo: TI9Query;
    Lista_PlanoContasDespTodas: TcxEditRepositoryLookupComboBoxItem;
    Lista_PlanoContasDespAtivos: TcxEditRepositoryLookupComboBoxItem;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    sqlCompSaidaTodos: TI9Query;
    dtsCompSaidaTodos: TDataSource;
    Lista_CompSaidasTodos: TcxEditRepositoryLookupComboBoxItem;
    sqlCabecalho: TI9Query;
    dtsCabecalho: TDataSource;
    sqlGrupoContabilAtivosDESCRICAO: TStringField;
    sqlGrupoContabilAtivosCONTABIL_GRUPO_ID: TBCDField;
    sqlGrupoContabilAtivosBALANCETE_GRUPO_ID: TBCDField;
    sqlGrupoContabilTodosDESCRICAO: TStringField;
    sqlGrupoContabilTodosCONTABIL_GRUPO_ID: TBCDField;
    sqlGrupoContabilTodosBALANCETE_GRUPO_ID: TBCDField;
    sqlGrupoContabilEntradasDESCRICAO: TStringField;
    sqlGrupoContabilEntradasCONTABIL_GRUPO_ID: TBCDField;
    sqlGrupoContabilEntradasBALANCETE_GRUPO_ID: TBCDField;
    sqlBalanceteGrupoDESCRICAO: TStringField;
    sqlBalanceteGrupoBALANCETE_GRUPO_ID: TBCDField;
    sqlBalanceteGrupoSIGLA: TStringField;
    sqlCentroCustoTodosDESCRICAO: TStringField;
    sqlCentroCustoTodosCENTRO_CUSTO_ID: TBCDField;
    sqlCentroCustoTodosBALANCETE_GRUPO_ID: TBCDField;
    sqlPlanoContasReceitasCONTABIL_CONTA_ID: TBCDField;
    sqlPlanoContasReceitasDESCRICAO: TStringField;
    sqlPlanoContasReceitasBALANCETE_GRUPO_ID: TBCDField;
    sqlPlanoContasAtivoCONTABIL_CONTA_ID: TBCDField;
    sqlPlanoContasAtivoDESCRICAO: TStringField;
    sqlCompReceitaTodosDESCRICAO: TStringField;
    sqlCompReceitaTodosCONTABIL_CONTA_ID: TBCDField;
    sqlPlanoContasDespesasTodosDESCRICAO: TStringField;
    sqlPlanoContasDespesasTodosCONTABIL_CONTA_ID: TBCDField;
    sqlPlanoContasDespesasTodosBALANCETE_GRUPO_ID: TBCDField;
    sqlPlanoContasDespesasAtivoDESCRICAO: TStringField;
    sqlPlanoContasDespesasAtivoCONTABIL_CONTA_ID: TBCDField;
    sqlPlanoContasDespesasAtivoBALANCETE_GRUPO_ID: TBCDField;
    sqlPlanoContasTodosCONTABIL_CONTA_ID: TBCDField;
    sqlPlanoContasTodosDESCRICAO: TStringField;
    sqlCabecalhoBALANCETE_GRUPO_ID: TBCDField;
    sqlCabecalhoCABECALHO: TBlobField;
    sqlCabecalhoTEXTO_CABECALHO: TBlobField;
    sqlCompSaidaTodosDESCRICAO: TStringField;
    sqlCompSaidaTodosCONTABIL_CONTA_ID: TBCDField;
    sqlCentroCustoAtivoDESCRICAO: TStringField;
    sqlCentroCustoAtivoCENTRO_CUSTO_ID: TBCDField;
    sqlCentroCustoAtivoBALANCETE_GRUPO_ID: TBCDField;
    sqlGrupoContabilSaidasDESCRICAO: TStringField;
    sqlGrupoContabilSaidasCONTABIL_GRUPO_ID: TBCDField;
    sqlGrupoContabilSaidasBALANCETE_GRUPO_ID: TBCDField;
    ComboEspeciePagamento: TcxEditRepositoryImageComboBoxItem;
    ComboSituacaoPagamento: TcxEditRepositoryImageComboBoxItem;
    ComboDespesaReceitaOutros: TcxEditRepositoryImageComboBoxItem;
    Combo_OperacaoLivroCaixa: TcxEditRepositoryImageComboBoxItem;
    sqlCaixa: TI9Query;
    dtsCaixa: TDataSource;
    sqlCaixaDESCRICAO: TStringField;
    sqlCaixaCAIXA_ID: TBCDField;
    Lista_CaixaTodos: TcxEditRepositoryLookupComboBoxItem;
    imgCaixa: TImageList;
    Combo_CaixaSituacao: TcxEditRepositoryImageComboBoxItem;
    sqlPessoasTodas: TI9Query;
    sqlPessoasTodasNOME: TStringField;
    sqlPessoasTodasPESSOA_ID: TBCDField;
    dtsPessoasTodas: TDataSource;
    Lista_PessoaTodas: TcxEditRepositoryLookupComboBoxItem;
    Combo_HonorarioPeriodo: TcxEditRepositoryImageComboBoxItem;
    Combo_ContratoItemSituacao: TcxEditRepositoryImageComboBoxItem;
    ComboDespesaReceitaSomente: TcxEditRepositoryImageComboBoxItem;
    dtsCaixaAtivos: TDataSource;
    sqlCaixaAtivos: TI9Query;
    StringField1: TStringField;
    FMTBCDField1: TBCDField;
    Lista_CaixaAtivos: TcxEditRepositoryLookupComboBoxItem;
    sqlCaixaTodosAtivos: TI9Query;
    dtsCaixaTodosAtivos: TDataSource;
    sqlCaixaTodosAtivosDESCRICAO: TStringField;
    sqlCaixaTodosAtivosCAIXA_ID: TBCDField;
    Lista_CaixaTodosAtivos: TcxEditRepositoryLookupComboBoxItem;
    Combo_DocumentoTipo: TcxEditRepositoryImageComboBoxItem;
    Combo_ReferenciaTipo: TcxEditRepositoryImageComboBoxItem;
    Combo_ReferenciaPeriodo: TcxEditRepositoryImageComboBoxItem;
    sqlCaixaTodosAtivosRESUMO: TStringField;
    Lista_CaixaResumo: TcxEditRepositoryLookupComboBoxItem;
    sqlCaixaRESUMO: TStringField;
    sqlTipoModalidade: TI9Query;
    sqlTipoModalidadeTIPO_MODALIDADE_ID: TBCDField;
    sqlTipoModalidadeDESCRICAO: TStringField;
    sqlTipoModalidadeTIPO: TStringField;
    sqlTipoModalidadeSITUACAO: TStringField;
    dtsTipoModalidade: TDataSource;
    sqlTipoCarga: TI9Query;
    dtsTipoCarga: TDataSource;
    sqlTipoCargaTIPO_CARGA_ID: TBCDField;
    sqlTipoCargaDESCRICAO: TStringField;
    sqlTipoCargaSITUACAO: TStringField;
    Lista_TipoCarga: TcxEditRepositoryLookupComboBoxItem;
    Lista_TipoModalidade: TcxEditRepositoryLookupComboBoxItem;
    Combo_MesExtenso: TcxEditRepositoryImageComboBoxItem;
    sqlCentroCustoAtivoPERSONALIZADO: TStringField;
    sqlCentroCustoAtivoTIPO_ITEM: TStringField;
    Combo_TipoCentroCusto: TcxEditRepositoryImageComboBoxItem;
    sqlPessoasTodasUTILIZA_BOLETO: TStringField;
    sqlCentroCustoTipo1: TI9Query;
    StringField2: TStringField;
    FMTBCDField2: TBCDField;
    FMTBCDField3: TBCDField;
    dtsCentroCustoTipo1: TDataSource;
    Lista_CentroCustoTipo1: TcxEditRepositoryLookupComboBoxItem;
    ClientPrevisaoCaixa: TClientDataSet;
    dtsPrevisaoCaixa: TDataSource;
    ClientPrevisaoCaixaVALOR: TCurrencyField;
    ClientPrevisaoCaixaMES: TIntegerField;
    ClientPrevisaoCaixaANO: TIntegerField;
    ClientPrevisaoCaixaOPERACAO: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    procedure AtualizarTabelas;
    procedure CarregarPeriodo(vpComBoBox : TcxComboBox; vpDBComBoBox : TcxDBComboBox; vpTipo : Integer; vpAnoMesInicial, vpAnoMesFinal : String);
    Function InclementarAnoMes(vpAnoMes : String):String;
    Function DeclementarAnoMes(vpAnoMes : String; vpQtd : Integer = 1):String;
    Function FormatarAnoMes(vpAnoMes : String; vpTirarBarra : String = ''):String;
    procedure MarcarDesmarcarCompromissos(vpI9Query : TI9Query; vpMarcar : Boolean);
    procedure MarcarDesmarcarCompromissosClient(vpI9Query : TClientDataSet; vpMarcar : Boolean);
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
    procedure FiltrarGrupoContasBalancete(vpSimpleDataSet : TI9Query; vpBalanceteId : Integer;
           vpFiltrar : Boolean);

    procedure GerarBoleto(vpData : String; vpTodos : Boolean; vpPessoa : String = ''; vpGrupo : String = '');
    procedure LerDadadosConfigEmail(vpTabela : String);
    Function PegarVencimentoPadrao(vpDia : String):String;
    Function PegarAnoMes(vpData : String; vpAnterior : Boolean = False):Integer;
    Function ConverterAnoMesBase(vpValor : String):String;
    Function VefificaExistenciaBoleto(vpPessoaId : String):Boolean;
    Procedure VerificarEdicao(vpReferencia, vpOperacao : String);
    procedure CarregarCabecalho(vpBalanceteId : Integer);
    procedure VerificarProgramacaoAjuste(vpCompromissoAgendadoId, vpAnoMes : String);
    procedure CarregarSaldoCaixa(vpClientDataSet : TClientDataSet; vpTodos : Boolean = False;
            vpSomenteLista : Boolean = False; vpSomarContasExclusas : Boolean = False);
    procedure CarregarSaldoDetalhado(vpClientDataSet : TClientDataSet; vpDataInicial, vpDataFinal : String; vpInativos : Boolean);
    Function MesAnoReferencia(vpData : String):String;
    Function CalcularSaldoCaixa(vpCaixaId : String; vpDataFinal : string = ''; vpSomarExcluido : Boolean = False):Currency;
    Function CalcularPrevisaoCaixa(vpCondicao, vpOperacao : String;
               vpSomarOrcamento, vpSomenteOrcamento : Boolean; vpAgrupado : Boolean = False):Currency;
    Function CalcularPrevisaoAgendamento(vpCondicao, vpOperacao : String):Currency;
    function PrepararSqlSoma(vpCaixaID, vpTipo, vpPessoaID  : String; vpSomarExcluido : Boolean;
           vpData : string = ''; vpPrevisao : String = ''; vpData2 : string = ''):Currency;
    procedure RegistrarRecebimentoFinanceiro(vpTransferenciaId : Integer = 0; vpAtualizar : Boolean = False);
    procedure CarregarProgress(var vpProgress : TdxBarProgressItem; vpMax : Integer;
           vpCaption : String; vpValor : Currency; vpMostrarProgress : Boolean = True);
    procedure CarregarSaldoVisualizacao(var vpLabel : TdxBarStatic; vpCaption : String; vpValor : Currency;
            vpModificarIcone : Boolean = False);
    procedure PreencherSaldoLabel(vpCaption : String; vpValor : Currency; vpLabel : TdxBarStatic;
             vpMudarIcone : Boolean = False; vpOpcao : String = '');
    Function PegarDataFinalMes(viAnoMes : String):String;
    procedure GravarHistorico(vpHistorico, vpContabilContaId : string);
    procedure GravarCompromissoPadrao(vpPessoa, vpContabilContaId : string);
    Function VerificarHistoricoPadrao(vpHistorico, vpContabilContaId : string):string;
    procedure CarregarGrupo(vpCombobox : TcxComboBox; vpGrupoContabilid : string);
    procedure VerificaAnoMesFechado(vpData : String);
    procedure InicializarVariaveisLivroCaixa;
    Function CalcularParcela(vpParcelaNum, vpParcelaIni, viQtd : Integer) : string;
 end;

var
  dtmLookupContabil: TdtmLookupContabil;
  vgCedenteAtivo, vgPeriodoAtual, vgBalancetePrincipal : Integer;
  vgCedenteNome, vgReferenciaInicial : String;

  vgCompromissoVencido : TCompromissoVencido;
  vgPeriodoAtualS, vgSincronizarReuni : String;
  vgTabBalancete : array[0..10] of integer;
  vgCentroCustoPrincipal  : array[0..10] of integer;
  vgHabilitarSelecionarGrupo, vlNaoCarregarSaldo, vgPertmissaoAlteracao, vgPermissaoInterno : Boolean;
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
    ExecutaSqlAuxiliar(' SELECT QTD_LIMITADA FROM J_CONTABIL_CONTA '+
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

    if vgCompromissoVencido.ProcessoContratoItemId > 0 then
      viSql := viSql + ' AND PROCESSO_CONTRATO_ITEM_ID = '+ CurrToStr(vgCompromissoVencido.ProcessoContratoItemId);

    if vgCompromissoVencido.LivroRemuneracaoId > 0 then
      viSql := viSql + ' AND LIVRO_REMUNERACAO_ID = '+ IntToStr(vgCompromissoVencido.LivroRemuneracaoId);

    ExecutaSqlAuxiliar(viSql,0);
    Result := dtmControles.sqlAuxiliar.IsEmpty;
  end;

begin
  vgCompromissoVencido.NenhumaAlteracao := True;
  viPeriodoInicial := vgCompromissoVencido.PeriodoInicial;
  if vpVencido then
  begin
    viCount := 0;

    // Se for tipo de pagamento após cliente ter pago
    if vgCompromissoVencido.TipoPagamento = 2 then
    begin
      ExecutaSimpleDSAux(' SELECT LIVRO_FINANCEIRO_ID FROM J_LIVRO_FINANCEIRO '+
                         ' WHERE PROCESSO_CONTRATO_ITEM_ID = '+IntToStr(vgCompromissoVencido.ProcessoContratoItemId)+
                         '   AND LIVRO_REMUNERACAO_ID IS NULL ',0);
    end;

    repeat
      if VerificarCompromissoVencido then
        if ((StrToInt(vgCompromissoVencido.PeriodoInicial)) <= (StrToInt(vgCompromissoVencido.PeriodoFinal))) or vpDeterminado then
        begin
          vgCompromissoVencido.NenhumaAlteracao := False;
          if vgCompromissoVencido.TipoPagamento = 2 then
          begin
            vgCompromissoVencido.FinanceiroRemuneracaoID := dtmControles.SimpleAuxiliar.FieldByName('LIVRO_FINANCEIRO_ID').AsInteger;
            dtmControles.SimpleAuxiliar.next;
          end
          else vgCompromissoVencido.FinanceiroRemuneracaoID := 0;

          if vgCompromissoVencido.PeriodoTipo = 8 then
               vgCompromissoVencido.Parcela := (viCount + vgCompromissoVencido.ParcelaInicial)
          else vgCompromissoVencido.Parcela := 0;

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
    vgCompromissoVencido.FinanceiroRemuneracaoID := 0;
  end;
end;

procedure TdtmLookupContabil.AtualizarTabelas;
begin
  sqlGrupoContabilTodos.Refresh;
  sqlGrupoContabilAtivos.Refresh;
  sqlGrupoContabilSaidas.Refresh;
  sqlGrupoContabilEntradas.Refresh;
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
  sqlTipoModalidade.Refresh;
  sqlTipoCarga.Refresh;
  sqlCentroCustoTipo1.Refresh;
end;

function TdtmLookupContabil.CalcularParcela(vpParcelaNum, vpParcelaIni, viQtd : Integer) : string;
var
  viParcelaInicial : Integer;
begin
  if vpParcelaNum = 0 then
    Result := ''
  else
  begin
    viParcelaInicial := vpParcelaIni;
    if viParcelaInicial = 0 then
      viParcelaInicial := 1;

    Result := IntToStr(vpParcelaNum) + '/'+ IntToStr((viQtd + viParcelaInicial)-1);
  end;
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
             '   AND  LA .SITUACAO IN ('+QuotedStr('1')+')';

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

   // Orçamentos
   viSomaOrcamentos := PrepararSqlPrevisaoSoma('O');

   Result := (viSomaReceitas+viSomaAportes) -
             (viSomaDespesas+viSomaRetiradas+viSomaOrcamentos);
  end
  else Result := PrepararSqlPrevisaoSoma(vpOperacao);
end;

function TdtmLookupContabil.CalcularPrevisaoCaixa(vpCondicao, vpOperacao : String;
               vpSomarOrcamento, vpSomenteOrcamento : Boolean; vpAgrupado : Boolean = False):Currency;
var
  viSomaDespesas, viSomaReceitas, viSomaRetiradas, viSomaAportes, viSomaOrcamentos : Currency;
  viSql : String;

  {$REGION 'PrepararSqlPrevisaoSoma'}
  function PrepararSqlPrevisaoSoma(vpTipo : String; vpAgrupado : Boolean = False):Currency;
  begin
    if (not vpAgrupado) then
    begin
      viSql := ' SELECT (SUM((coalesce(VALOR_AGENDADO,0)) - '+
               '   coalesce((SELECT SUM(VALOR) FROM J_LIVRO_CAIXA '+
               '   WHERE LIVRO_FINANCEIRO_ID = LF.LIVRO_FINANCEIRO_ID),0))) AS VALOR '+
               '   FROM J_LIVRO_FINANCEIRO LF '+
               '   WHERE OPERACAO = '+QuotedStr(vpTipo)+
               '     AND SITUACAO IN ('+QuotedStr('1')+','+QuotedStr('2')+')';
      if vpCondicao <> '' then
        viSql := viSql + ' AND '+ vpCondicao;
      Result := dtmControles.GetFloat(viSql);
    end
    else
      viSql := ' SELECT (SUM((coalesce(VALOR_AGENDADO,0)) - '+
                 '   coalesce((SELECT SUM(VALOR) FROM J_LIVRO_CAIXA '+
                 '   WHERE LIVRO_FINANCEIRO_ID = LF.LIVRO_FINANCEIRO_ID),0))) '+
                 '  AS VALOR, '+
                 '   extract(month from LF.DATA_VENCIMENTO) as mes, '+
                 '   extract(year from LF.DATA_VENCIMENTO) as ano, '+
                 '   lf.operacao '+
                 '   FROM J_LIVRO_FINANCEIRO LF '+
                 '   WHERE SITUACAO IN ('+QuotedStr('1')+','+QuotedStr('2')+') AND '+vpCondicao+
                 '   AND LF.OPERACAO <> ''O'''+
                 ' GROUP BY ANO, MES, OPERACAO ';
  end;
  {$ENDREGION}

  {$REGION 'CALCULAR_ORÇAMENTO'}
  function CalcularOrcamento(vpSomar : Boolean = False):Currency;
  var
    viValor : Currency;
  begin
    viSql := ' SELECT '+
             ' SUM((coalesce(LF.VALOR_AGENDADO,0)) - (coalesce((SELECT SUM(LC.VALOR) '+
             ' FROM J_LIVRO_CAIXA LC '+
             ' WHERE LC.LIVRO_FINANCEIRO_ID = LF.LIVRO_FINANCEIRO_ID),0))- '+

             ' (coalesce((SELECT SUM(LF2.VALOR_AGENDADO) '+
             ' FROM J_LIVRO_FINANCEIRO LF2 '+
             ' WHERE LF2.ORCAMENTO_ID = LF.LIVRO_AGENDAMENTO_ID '+
             ' AND LF2.ANO_MES_REFERENCIA = LF.ANO_MES_REFERENCIA '+
             ' AND SITUACAO IN (1,2)),0)) - '+

             ' (coalesce((SELECT SUM(LC2.VALOR) '+
             ' FROM J_LIVRO_CAIXA LC2 '+
             ' WHERE LC2.ORCAMENTO_ID = LF.LIVRO_AGENDAMENTO_ID '+
             ' AND LC2.ANO_MES_REGISTRO = LF.ANO_MES_REFERENCIA),0))+ '+

             ' (coalesce((SELECT SUM(OS.VALOR) '+
             ' FROM J_ORCAMENTO_RESERVA OS '+
             ' WHERE OS.LIVRO_FINANCEIRO_DESTINO_ID = LF.LIVRO_FINANCEIRO_ID),0))- '+

             ' (coalesce((SELECT SUM(OS.VALOR) '+
             ' FROM J_ORCAMENTO_RESERVA OS '+
             ' WHERE OS.LIVRO_FINANCEIRO_ORIGEM_ID = LF.LIVRO_FINANCEIRO_ID),0))) '+

             ' AS VALOR, '+

             ' extract(month from LF.DATA_VENCIMENTO) as mes, '+
             ' extract(year from LF.DATA_VENCIMENTO) as ano, '+
             ' lf.operacao, LF.LIVRO_FINANCEIRO_ID '+

             ' FROM J_LIVRO_FINANCEIRO LF '+
             '   WHERE SITUACAO IN ('+QuotedStr('1')+','+QuotedStr('2')+') ';

    if vpCondicao <> '' then
      viSql := viSql + ' AND '+ vpCondicao;

    viSql := viSql + '  AND LF.OPERACAO = ''O'''+
                     ' GROUP BY ANO, MES, OPERACAO, LF.LIVRO_FINANCEIRO_ID ';
    ExecutaSqlAuxiliar(viSql, 0);

    if vpSomar then
    begin
      with dtmControles.sqlAuxiliar do
      begin
        First;
        viValor := 0;
        while not eof do
        begin
          if FieldByName('VALOR').AsCurrency > 0 then
            viValor := viValor + FieldByName('VALOR').AsCurrency;
          Next;
        end;
        Result := viValor;
      end;
    end;
  end;
  {$ENDREGION}

  {$REGION 'CarregarClientPrevisao'}
  procedure CarregarClientPrevisao(vpOrcamento : Boolean = False);
  var
    viValor : Currency;
    viMes   : Integer;
  begin
    with dtmControles.sqlAuxiliar do
    begin
      First;
      while not eof do
      begin
        viValor := 0;
        ClientPrevisaoCaixa.Append;
        ClientPrevisaoCaixa.FieldByName('MES').AsInteger     := FieldByName('MES').AsInteger;
        ClientPrevisaoCaixa.FieldByName('ANO').AsInteger     := FieldByName('ANO').AsInteger;
        ClientPrevisaoCaixa.FieldByName('OPERACAO').AsString := FieldByName('OPERACAO').AsString;

        if vpOrcamento then
        begin
          viMes   := FieldByName('MES').AsInteger;
          if FieldByName('VALOR').AsCurrency > 0 then
            viValor := FieldByName('VALOR').AsCurrency;
          repeat
            Next;
            if (viMes = FieldByName('MES').AsInteger) then
            begin
              if FieldByName('VALOR').AsCurrency > 0 then
                viValor := viValor + FieldByName('VALOR').AsCurrency;
            end;
          until (viMes <> FieldByName('MES').AsInteger) or eof;
          ClientPrevisaoCaixa.FieldByName('VALOR').AsCurrency  := viValor;
          ClientPrevisaoCaixa.Post;
        end
        else
        begin
          ClientPrevisaoCaixa.FieldByName('VALOR').AsCurrency  := FieldByName('VALOR').AsCurrency;
          ClientPrevisaoCaixa.Post;
          Next;
        end;
      end;
    end;
    ClientPrevisaoCaixa.First;
  end;
  {$ENDREGION}

begin
  if Copy(trim(vpCondicao),1,3) = 'AND' then
    vpCondicao := Copy(trim(vpCondicao),4,120);

  if vpAgrupado then
  begin
    ClientPrevisaoCaixa.EmptyDataSet;
    PrepararSqlPrevisaoSoma('', true);
    ExecutaSqlAuxiliar(viSql,0);
    CarregarClientPrevisao;

    if vpSomarOrcamento or vpSomenteOrcamento then
    begin
      CalcularOrcamento;
      CarregarClientPrevisao(True);
    end;
  end
  else
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
  end;

    if vpSomarOrcamento or vpSomenteOrcamento then
      if (pos('*O,',vpOperacao) > 0) or (vpOperacao = '') then
        viSomaOrcamentos := CalcularOrcamento(True);

    Result := (viSomaReceitas+viSomaAportes) -
              (viSomaDespesas+viSomaRetiradas+viSomaOrcamentos);
end;

Function TdtmLookupContabil.CalcularSaldoCaixa(vpCaixaId : String; vpDataFinal : string = '';
        vpSomarExcluido : Boolean = False):Currency;
var
  viSomaDespesas, viSomaReceitas, viSomaRetiradas, viSomaAportes,
  viSomaTransferenciasD, viSomaTransferenciasR : Currency;
begin
  viSomaDespesas  := PrepararSqlSoma(vpCaixaId, 'D', '', vpSomarExcluido, vpDataFinal);
  viSomaReceitas  := PrepararSqlSoma(vpCaixaId, 'R', '', vpSomarExcluido, vpDataFinal);

  // Aporte e Retirada
  viSomaAportes   := PrepararSqlSoma(vpCaixaId, 'AR', '', vpSomarExcluido, vpDataFinal);
  viSomaRetiradas := PrepararSqlSoma(vpCaixaId, 'AD', '', vpSomarExcluido, vpDataFinal);

  // Transferencias
  viSomaTransferenciasR  := PrepararSqlSoma(vpCaixaId, 'TR', '', vpSomarExcluido, vpDataFinal);
  viSomaTransferenciasD  := PrepararSqlSoma(vpCaixaId, 'TD', '', vpSomarExcluido, vpDataFinal);

  Result := (viSomaReceitas+viSomaAportes+viSomaTransferenciasR) -
            (viSomaDespesas+viSomaRetiradas+viSomaTransferenciasD);
end;

procedure TdtmLookupContabil.CarregarCabecalho(vpBalanceteId: Integer);
begin
  sqlCabecalho.Active := False;
  sqlCabecalho.ParamByName('BALANCETE_GRUPO_ID').AsBCD := vpBalanceteId;
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
                     ' FROM J_CONTABIL_CONTA '+
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
  { vpTipo = 1 = Período Completo
    vpTipo = 2 = Período Mensal de 2 meses antes do período Atual
    vpTipo = 3 = Período Mensal Atual e Superior
    vpTipo = 4 = Período Mensal Superior ao Atual
    vpTipo = 5 = Período determinado
    vpTipo = 6 = Período 2 meses antes do atual até o Proximo
    vpTipo = 7 = Período atual e Proximo
    vpTipo = 8 = Período até o atual}


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
  vpValor: Currency; vpMostrarProgress : Boolean = True);
begin
  vpProgress.Caption  := vpCaption + FormatFloat(',#0.00', vpValor);
  vpProgress.Max      := 0;
  vpProgress.Position := 0;

  if not vpMostrarProgress then
    exit;

  vpProgress.Max      := vpMax;
  vpProgress.Position := Trunc(vpValor);
end;

procedure TdtmLookupContabil.CarregarSaldoCaixa(vpClientDataSet : TClientDataSet; vpTodos : Boolean = False;
            vpSomenteLista : Boolean = False; vpSomarContasExclusas : Boolean = False);
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
    vpClientDataSet.FieldByName('CAIXA_ID').AsInteger       := dtmControles.sqlAuxiliar.FieldByName('CAIXA_ID').AsInteger;
    vpClientDataSet.FieldByName('DESCRICAO').AsString       := dtmControles.sqlAuxiliar.FieldByName('DESCRICAO').AsString;
    vpClientDataSet.FieldByName('RESUMO').AsString          := dtmControles.sqlAuxiliar.FieldByName('RESUMO').AsString;
    vpClientDataSet.FieldByName('PREVISAO_SALDO').AsString  := dtmControles.sqlAuxiliar.FieldByName('PREVISAO_SALDO').AsString;
    if not vpSomenteLista then
    begin
      vpClientDataSet.FieldByName('PRINCIPAL').AsString := dtmControles.sqlAuxiliar.FieldByName('PRINCIPAL').AsString;
      vpClientDataSet.FieldByName('PESSOA_ID').AsInteger:= dtmControles.sqlAuxiliar.FieldByName('RESPONSAVEL_ID').AsInteger;
      vpClientDataSet.FieldByName('VALOR').AsCurrency   := dtmLookupContabil.CalcularSaldoCaixa(vpClientDataSet.FieldByName('CAIXA_ID').AsString);
    end;
    vpClientDataSet.Post;
    dtmControles.sqlAuxiliar.Next;
  end;

  if vpTodos then
    vpClientDataSet.First;

  vpClientDataSet.EnableControls;
end;

procedure TdtmLookupContabil.CarregarSaldoDetalhado(vpClientDataSet : TClientDataSet;
      vpDataInicial, vpDataFinal : String; vpInativos : Boolean);
var
  viSql : string;

  procedure CalcularSaldoDetalhado;
  var
    viCaixaId : string;
    viValor : Currency;
  begin
    viCaixaId := vpClientDataSet.FieldByName('CAIXA_ID').AsString;
    {Calcular Saldos Detalhados entre intervalo de Datas}
    vpClientDataSet.FieldByName('VALOR').AsCurrency          := Arredondamento(dtmControles.MetodoArredondamento, dtmLookupContabil.CalcularSaldoCaixa(viCaixaId, vpDataFinal),2);
    vpClientDataSet.FieldByName('SALDO_ANTERIOR').AsCurrency := Arredondamento(dtmControles.MetodoArredondamento, dtmLookupContabil.CalcularSaldoCaixa(viCaixaId, DateToStr(StrToDate(vpDataInicial)-1)),2);
    vpClientDataSet.FieldByName('DESPESAS').AsCurrency       := Arredondamento(dtmControles.MetodoArredondamento, PrepararSqlSoma(viCaixaId, 'D', '', True, vpDataFinal,'',vpDataInicial),2);
    vpClientDataSet.FieldByName('RECEITAS').AsCurrency       := Arredondamento(dtmControles.MetodoArredondamento, PrepararSqlSoma(viCaixaId, 'R', '', True, vpDataFinal,'',vpDataInicial),2);

    // Entradas
    viValor := 0;
    viValor := PrepararSqlSoma(viCaixaId, 'AR', '', True, vpDataFinal,'',vpDataInicial);
    vpClientDataSet.FieldByName('ENTRADAS').AsCurrency := Arredondamento(dtmControles.MetodoArredondamento, viValor + PrepararSqlSoma(viCaixaId, 'TR', '', True, vpDataFinal,'',vpDataInicial),2);

    // Saídas
    viValor := 0;
    viValor := PrepararSqlSoma(viCaixaId, 'AD', '', True, vpDataFinal,'',vpDataInicial);
    vpClientDataSet.FieldByName('SAIDAS').AsCurrency := Arredondamento(dtmControles.MetodoArredondamento, viValor + PrepararSqlSoma(viCaixaId, 'TD', '', True, vpDataFinal,'',vpDataInicial),2);
  end;

  function VerificarCaixaInativoMovimentacao:Boolean;
  begin
    Result := True;
    if dtmControles.sqlAuxiliar.FieldByName('SITUACAO').AsString = 'A' then
      exit;

    if (vpClientDataSet.FieldByName('VALOR').AsCurrency = 0) and
       (vpClientDataSet.FieldByName('SALDO_ANTERIOR').AsCurrency = 0) and
       (vpClientDataSet.FieldByName('DESPESAS').AsCurrency = 0) and
       (vpClientDataSet.FieldByName('RECEITAS').AsCurrency = 0) and
       (vpClientDataSet.FieldByName('ENTRADAS').AsCurrency = 0) and
       (vpClientDataSet.FieldByName('SAIDAS').AsCurrency = 0) then
         Result := False;
  end;

begin
  Screen.Cursor := crHourGlass;
  viSql := ' SELECT * FROM J_CAIXA ';

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
    vpClientDataSet.FieldByName('SITUACAO').AsString    := dtmControles.sqlAuxiliar.FieldByName('SITUACAO').AsString;
    CalcularSaldoDetalhado;
    if vpInativos then
      vpClientDataSet.Post
    else
      if VerificarCaixaInativoMovimentacao then
           vpClientDataSet.Post
      else vpClientDataSet.Cancel;
    dtmControles.sqlAuxiliar.Next;
  end;
  vpClientDataSet.First;
  vpClientDataSet.EnableControls;
  Screen.Cursor := crDefault;
end;

procedure TdtmLookupContabil.CarregarSaldoVisualizacao(
  var vpLabel: TdxBarStatic; vpCaption: String; vpValor: Currency;
  vpModificarIcone: Boolean);
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
                     ' FROM J_BALANCETE_GRUPO '+
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
      vgCentroCustoPrincipal[i-1] :=  dtmControles.GetInt(' SELECT CENTRO_CUSTO_ID FROM J_CENTRO_CUSTO '+
                                                     ' WHERE PRINCIPAL = ''S'''+
                                                     ' AND ((BALANCETE_GRUPO_ID = '+ FieldByName('BALANCETE_GRUPO_ID').AsString+')'+
                                                     '  OR (TIPO_GLOBAL = ''S'')) AND (TIPO_CENTRO = ''1'')');
      next;
    end;
    vpTabBalancete.TabIndex := 0;
  end;
end;

function TdtmLookupContabil.ConverterAnoMesBase(vpValor : String):String;
begin
  Result := copy(vpValor,4,4) + copy(vpValor,1,2);
end;

procedure TdtmLookupContabil.DataModuleCreate(Sender: TObject);
begin
  sqlGrupoContabilTodos.Connection       := dtmControles.DB;
  sqlGrupoContabilAtivos.Connection      := dtmControles.DB;
  sqlGrupoContabilSaidas.Connection      := dtmControles.DB;
  sqlGrupoContabilEntradas.Connection    := dtmControles.DB;
  sqlBalanceteGrupo.Connection           := dtmControles.DB;
  sqlPlanoContasAtivo.Connection         := dtmControles.DB;
  sqlPlanoContasTodos.Connection         := dtmControles.DB;
  sqlPlanoContasReceitas.Connection      := dtmControles.DB;
  sqlCentroCustoTodos.Connection         := dtmControles.DB;
  sqlCentroCustoAtivo.Connection         := dtmControles.DB;
  sqlCompReceitaTodos.Connection         := dtmControles.DB;
  sqlPlanoContasDespesasTodos.Connection := dtmControles.DB;
  sqlPlanoContasDespesasAtivo.Connection := dtmControles.DB;
  sqlCompSaidaTodos.Connection           := dtmControles.DB;
  sqlCabecalho.Connection                := dtmControles.DB;
  sqlCaixa.Connection                    := dtmControles.DB;
  sqlPessoasTodas.Connection             := dtmControles.DB;
  sqlCaixaAtivos.Connection              := dtmControles.DB;
  sqlCaixaTodosAtivos.Connection         := dtmControles.DB;
  sqlTipoModalidade.Connection           := dtmControles.DB;
  sqlTipoCarga.Connection                := dtmControles.DB;
  sqlCentroCustoTipo1.Connection         := dtmControles.DB;

  sqlBalanceteGrupo.Open;
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
  sqlTipoModalidade.Open;
  sqlTipoCarga.Open;
  sqlCentroCustoTipo1.Open;
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
  sqlTipoModalidade.Close;
  sqlTipoCarga.Close;
  sqlCentroCustoTipo1.Close;
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

procedure TdtmLookupContabil.FiltrarGrupoContasBalancete(vpSimpleDataSet : TI9Query; vpBalanceteId : Integer;
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
    if Application.MessageBox(PChar('Cadastrar Compromisso como Padrão desta Pessoa?'),'Confirmação', MB_YESNO) = IDNO then
      exit;

    ExecutaSqlAuxiliar(' UPDATE J_PESSOA SET CONTABIL_CONTA_ID = '+vpContabilContaId+
                       ' WHERE PESSOA_ID = '+ vpPessoa, 1);
  end
  else
  begin
    if Application.MessageBox(PChar('Limpar Compromisso Padrão desta Pessoa?'),'Confirmação', MB_YESNO) = IDNO then
      exit;

    ExecutaSqlAuxiliar(' UPDATE J_PESSOA SET CONTABIL_CONTA_ID = null'+
                       ' WHERE PESSOA_ID = '+ vpPessoa, 1);
  end;
end;

procedure TdtmLookupContabil.GravarHistorico(vpHistorico, vpContabilContaId : string);
begin
  if Application.MessageBox(PChar('Cadastrar Histórico como Padrão deste Compromisso?'+#13+#13+
                                 'Histórico '+ vpHistorico),'Confirmação', MB_YESNO) = IDNO then
    exit;

  ExecutaSqlAuxiliar(' UPDATE J_CONTABIL_CONTA SET HISTORICO_PADRAO = '+QuotedStr(vpHistorico)+
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
  vgDadosLivroCaixa.ValorDesconto     := 0;
  vgDadosLivroCaixa.ValorJuros        := 0;
  vgDadosLivroCaixa.ValorMulta        := 0;
  vgDadosLivroCaixa.ValorOutrasTaxas  := 0;
  vgDadosLivroCaixa.ValorFaturado     := 0;
  vgDadosLivroCaixa.ValorOutraDeducao := 0;
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
  vgDadosLivroCaixa.CNJ               := 'N';
  vgDadosLivroCaixa.RegistroParcial   := 'N';
  vgDadosLivroCaixa.DocumentoNumero   := '';
  vgDadosLivroCaixa.RefPeriodo        := '1';
  vgDadosLivroCaixa.OrcamentoId       := 0;
  vgDadosLivroCaixa.ReservaId         := 0;
  vgDadosLivroCaixa.ObservacaoMonetaria  := '';
  vgDadosLivroCaixa.IdentificacaoId      := 0;
  vgDadosLivroCaixa.IdentificacaoTipo    := '';
  vgDadosLivroCaixa.DocTipo              := '';
  vgDadosLivroCaixa.ResponsavelId        := 0;
  vgDadosLivroCaixa.TipoModalidadeId     := 0;
  vgDadosLivroCaixa.Situacao             := '0';
  vgDadosLivroCaixa.Faturamento          := '';
  vgDadosLivroCaixa.Ordem                := 0;
  vgDadosLivroCaixa.CaixaTransferenciaId := 0;
  vgDadosLivroCaixa.ContabilRL           := 'N';
  vgDadosLivroCaixa.ConciliacaoId        := '';
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

procedure TdtmLookupContabil.MarcarDesmarcarCompromissos(vpI9Query: TI9Query;
  vpMarcar: Boolean);
begin
  vpI9Query.DisableControls;
  vpI9Query.First;
  while not vpI9Query.eof do
  begin
    vpI9Query.Edit;
    vpI9Query.FieldByName('Selecionar').AsBoolean := vpMarcar;
    vpI9Query.post;
    vpI9Query.next;
  end;
  vpI9Query.First;
  vpI9Query.EnableControls;
end;

procedure TdtmLookupContabil.MarcarDesmarcarCompromissosClient(
  vpI9Query: TClientDataSet; vpMarcar: Boolean);
begin
  vpI9Query.DisableControls;
  vpI9Query.First;
  while not vpI9Query.eof do
  begin
    vpI9Query.Edit;
    vpI9Query.FieldByName('Selecionar').AsBoolean := vpMarcar;
    vpI9Query.post;
    vpI9Query.next;
  end;
  vpI9Query.First;
  vpI9Query.EnableControls;
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

function TdtmLookupContabil.PegarAnoMes(vpData : String;
       vpAnterior : Boolean = False):Integer;
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
      else vpLabel.ImageIndex := 4;
    end
    else
    begin
      if vpOpcao = '1' then
           vpLabel.ImageIndex := 30
      else vpLabel.ImageIndex := 17;
    end;
  end;

  if (vpValor <> 0) then
       vpLabel.Visible := ivAlways
  else vpLabel.Visible := ivNever;
end;

function TdtmLookupContabil.PrepararSqlSoma(vpCaixaID, vpTipo, vpPessoaID : String; vpSomarExcluido : Boolean;
    vpData : string = '';  vpPrevisao : String = ''; vpData2 : string = ''):Currency;
var
  viSql : String;
begin
  viSql := ' SELECT SUM(LC.VALOR) AS VALOR '+
           ' FROM J_LIVRO_CAIXA LC '+
           '  LEFT OUTER JOIN J_CAIXA C ON '+
           '  LC.CAIXA_ID = C.CAIXA_ID '+
           ' WHERE LC.OPERACAO = '+QuotedStr(vpTipo);

  if vpPrevisao <> '' then
    viSql := viSql + vpPrevisao
  else
  begin
    if vpCaixaID <> '' then
      viSql := viSql + '  AND LC.CAIXA_ID = '+ vpCaixaId
    else
      if not vpSomarExcluido then
        viSql := viSql + ' AND NOT C.PREVISAO_SALDO = '+QuotedStr('N');

    if vpPessoaID <> '' then
      viSql := viSql + '  AND LC.PESSOA_ID = '+QuotedStr(vpPessoaID);

    if vpData <> '' then
      viSql := viSql + ' AND LC.DATA_PAGAMENTO <= '+ QuotedStr(TrocaBarraPPonto(vpData));

    if vpData2 <> '' then
      viSql := viSql + ' AND LC.DATA_PAGAMENTO >= '+ QuotedStr(TrocaBarraPPonto(vpData2));
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
                       '              PROCESSO_CONTRATO_ID, '+
                       '              PROCESSO_CONTRATO_ITEM_ID, '+
                       '              LIVRO_REMUNERACAO_ID, ' +
                       '              LIVRO_AGENDAMENTO_ID, ' +
                       '              ORCAMENTO_ID,'+
                       '              CENTRO_RESERVA_ID,'+
                       '              TIPO_MODALIDADE_ID,'+
                       '              CONTABIL_CONTA_ID, '+
                       '              VALOR_AGENDADO, '+
                       '              ANO_MES_REFERENCIA, '+
                       '              CENTRO_CUSTO_ID, '+
                       '              BALANCETE_GRUPO_ID, '+
                       '              ESPECIE, '+
                       '              OPERACAO, '+
                       '              PESSOA_ID, '+
                       '              PARCELA, '+
                       '              FINANCEIRO_REMUNERACAO_ID, '+
                       '              DATA_VENCIMENTO, '+
                       '              OBSERVACAO, '+
                       '              HISTORICO, '+
                       '              IR, '+
                       '              CNJ, '+
                       '              REGISTRO_PARCIAL, '+
                       '              DOCUMENTO_NUMERO, '+
                       '              CAIXA_ID, '+
                       '              USUARIO_ID, '+
                       '              SITUACAO) '+
                       ' VALUES(      :LIVRO_FINANCEIRO_ID, '+
                       RetNullInteger(vgCompromissoVencido.ProcessoContratoId)+', '+
                       RetNullInteger(vgCompromissoVencido.ProcessoContratoItemId)+', '+
                       RetNullInteger(vgCompromissoVencido.LivroRemuneracaoId)+', '+
                       RetNullInteger(vgCompromissoVencido.LivroAgendamentoId)+', '+
                       RetNullInteger(vgCompromissoVencido.OrcamentoId)+', '+
                       RetNullInteger(vgCompromissoVencido.ReservaId)+', '+
                       RetNullInteger(vgCompromissoVencido.TipoModalidadeId)+', '+
                       '              :CONTABIL_CONTA_ID, '+
                       '              :VALOR_AGENDADO, '+
                       '              :ANO_MES_REFERENCIA, '+
                       '              :CENTRO_CUSTO_ID, '+
                       '              :BALANCETE_GRUPO_ID, '+
                       '              :ESPECIE, '+
                       '              :OPERACAO, '+
                       RetNullInteger(vgCompromissoVencido.PessoaId)+', '+
                       RetNullInteger(vgCompromissoVencido.Parcela)+', '+
                       RetNullInteger(vgCompromissoVencido.FinanceiroRemuneracaoId)+', '+
                       '              :DATA_VENCIMENTO, '+
                       RetNull(vgCompromissoVencido.Observacao)+', '+
                       RetNull(vgCompromissoVencido.Historico)+', '+
                       '              :IR, '+
                       '              :CNJ, '+
                       '              :REGISTRO_PARCIAL, '+
                       '              :DOCUMENTO_NUMERO, '+
                       '              :CAIXA_ID, '+
                       '              :USUARIO_ID, '+
                       '              :SITUACAO)',2);
    with dtmControles.sqlAuxiliar do
    begin
      vgCompromissoVencido.LivroFinanceiroId      := dtmControles.GerarSequencia('J_LIVRO_FINANCEIRO');
      ParamByName('LIVRO_FINANCEIRO_ID').AsBCD    := vgCompromissoVencido.LivroFinanceiroId;
      ParamByName('CONTABIL_CONTA_ID').AsBCD      := vgCompromissoVencido.ContabilContaId;
      ParamByName('VALOR_AGENDADO').AsCurrency    := vgCompromissoVencido.ValorAgendado;
      ParamByName('ANO_MES_REFERENCIA').AsInteger := PegarAnoMes(DateToStr(viDataCompromisso));
      ParamByName('CENTRO_CUSTO_ID').AsBCD        := vgCompromissoVencido.CentroCustoId;
      ParamByName('BALANCETE_GRUPO_ID').AsBCD     := vgCompromissoVencido.BalanceteGrupoId;
      ParamByName('ESPECIE').AsString             := vgCompromissoVencido.Especie;
      ParamByName('OPERACAO').AsString            := vgCompromissoVencido.Operacao;
      ParamByName('DATA_VENCIMENTO').AsDate       := viDataCompromisso;
      ParamByName('IR').AsString                  := vgCompromissoVencido.IR;
      ParamByName('CNJ').AsString                 := vgCompromissoVencido.CNJ;
      ParamByName('REGISTRO_PARCIAL').AsString    := vgCompromissoVencido.RegistroParcial;
      ParamByName('DOCUMENTO_NUMERO').AsString    := vgCompromissoVencido.DocumentoNumero;
      ParamByName('CAIXA_ID').AsInteger           := vgCompromissoVencido.CaixaID;
      ParamByName('SITUACAO').AsString            := vgCompromissoVencido.SituacaoLocal;
      ParamByName('USUARIO_ID').AsString          := vgUsuarioID;
      ExecSQL;
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
                       '              CAIXA_ID, '+
                       '              PESSOA_ID, '+
                       '              CENTRO_CUSTO_ID, '+
                       '              CONTABIL_CONTA_ID, '+
                       '              CONTABIL_GRUPO_ID, '+
                       '              BALANCETE_GRUPO_ID, '+
                       '              PROCESSO_ID, '+
                       '              LIVRO_FINANCEIRO_ID, '+
                       '              CENTRO_RESERVA_ID, '+
                       '              TIPO_MODALIDADE_ID, '+
                       '              TIPO_CARGA_ID, '+
                       '              RESPONSAVEL_ID, '+
                       '              ORCAMENTO_ID, '+
                       '              VALOR, '+
                       '              VALOR_PREVISTO, '+
                       '              VALOR_FATURADO, '+
                       '              VALOR_DESCONTO, '+
                       '              VALOR_OUTRA_DEDUCAO, '+
                       '              VALOR_JUROS, '+
                       '              VALOR_MULTA, '+
                       '              VALOR_OUTRAS_TAXAS, '+
                       '              OBSERVACAO_MONETARIA, '+
                       '              OPERACAO, '+
                       '              ESPECIE, '+
                       '              DATA_PAGAMENTO, '+
                       '              DATA_VENCIMENTO, '+
                       '              DATA_LANCAMENTO, '+
                       '              REFERENCIA, '+
                       '              ANO_MES_REGISTRO, '+
                       '              HISTORICO, '+
                       '              DESCRICAO_AGRUPADOR, '+
                       '              IR, '+
                       '              CNJ, '+
                       '              CONTABIL_RL, '+
                       '              DOCUMENTO_NUMERO, '+
                       '              DOC_TIPO, '+
                       '              IDENTIFICADOR_ID, '+
                       '              IDENTIFICADOR_TIPO, '+
                       '              FATURAMENTO, '+
                       '              ORDEM, '+
                       '              USUARIO_ID,'+
                       '              CONCILIACAO_REGISTRADO_ID,'+
                       '              OBSERVACAO) '+
                       ' VALUES(      :LIVRO_CAIXA_ID, '+
                                       RetNullInteger(vgDadosLivroCaixa.CaixaTransferenciaId)+','+
                       '              :CAIXA_ID, '+
                                       RetNullInteger(vgDadosLivroCaixa.PessoaId)+','+
                       '              :CENTRO_CUSTO_ID, '+
                       '              :CONTABIL_CONTA_ID, '+
                       '              :CONTABIL_GRUPO_ID, '+
                       '              :BALANCETE_GRUPO_ID, '+
                                       RetNullInteger(vgDadosLivroCaixa.ProcessoID)+','+
                                       RetNullInteger(vgDadosLivroCaixa.LivroFinanceiroID)+','+
                                       RetNullInteger(vgDadosLivroCaixa.ReservaId)+','+
                                       RetNullInteger(vgDadosLivroCaixa.TipoModalidadeId)+','+
                                       RetNullInteger(vgDadosLivroCaixa.TipoCargaId)+','+
                                       RetNullInteger(vgDadosLivroCaixa.ResponsavelId)+','+
                                       RetNullInteger(vgDadosLivroCaixa.OrcamentoId)+','+
                       '              :VALOR, '+
                       '              :VALOR_PREVISTO, '+
                       '              :VALOR_FATURADO, '+
                       '              :VALOR_DESCONTO, '+
                       '              :VALOR_OUTRA_DEDUCAO, '+
                       '              :VALOR_JUROS, '+
                       '              :VALOR_MULTA, '+
                       '              :VALOR_OUTRAS_TAXAS, '+
                       '              :OBSERVACAO_MONETARIA, '+
                       '              :OPERACAO, '+
                       '              :ESPECIE, '+
                       '              :DATA_PAGAMENTO, '+
                       '              :DATA_VENCIMENTO, '+
                       '              :DATA_LANCAMENTO, '+
                       '              :REFERENCIA, '+
                       '              :ANO_MES_REGISTRO, '+
                       '              :HISTORICO, '+
                                      RetNull(QuotedStr(vgDadosLivroCaixa.DescricaoAgrupada))+','+
                       '              :IR, '+
                       '              :CNJ, '+
                       '              :CONTABIL_RL, '+
                       '              :DOCUMENTO_NUMERO, '+
                       '              :DOC_TIPO, '+
                                       RetNullInteger(vgDadosLivroCaixa.IdentificacaoId)+','+
                       '              :IDENTIFICADOR_TIPO ,'+
                                      RetNull(QuotedStr(vgDadosLivroCaixa.Faturamento))+','+
                                      RetNullInteger(vgDadosLivroCaixa.Ordem)+','+
                       '              :USUARIO_ID,'+
                                      RetNull(QuotedStr(vgDadosLivroCaixa.ConciliacaoId),'S')+','+
                       '              :OBSERVACAO)',2);
  end;

  procedure CarregarSqlUpdate;
  begin
    // Gravar Livro Caixa
    ExecutaSqlAuxiliar(' UPDATE J_LIVRO_CAIXA SET '+
                       '              CAIXA_ID = :CAIXA_ID, '+
                       '              PESSOA_ID = '+RetNullInteger(vgDadosLivroCaixa.PessoaId)+','+
                       '              CENTRO_CUSTO_ID   = :CENTRO_CUSTO_ID, '+
                       '              CONTABIL_CONTA_ID = :CONTABIL_CONTA_ID, '+
                       '              CONTABIL_GRUPO_ID = :CONTABIL_GRUPO_ID, '+
                       '              BALANCETE_GRUPO_ID= :BALANCETE_GRUPO_ID, '+
                       '              ORCAMENTO_ID      = '+RetNullInteger(vgDadosLivroCaixa.OrcamentoId)+','+
                       '              CENTRO_RESERVA_ID = '+RetNullInteger(vgDadosLivroCaixa.ReservaId)+','+
                       '              TIPO_MODALIDADE_ID= '+RetNullInteger(vgDadosLivroCaixa.TipoModalidadeId)+','+
                       '              RESPONSAVEL_ID    = '+RetNullInteger(vgDadosLivroCaixa.ResponsavelId)+','+
                       '              VALOR             = :VALOR, '+
                       '              VALOR_FATURADO    = :VALOR_FATURADO, '+
                       '              VALOR_DESCONTO    = :VALOR_DESCONTO, '+
                       '              VALOR_OUTRA_DEDUCAO = :VALOR_OUTRA_DEDUCAO, '+
                       '              VALOR_JUROS       = :VALOR_JUROS, '+
                       '              VALOR_MULTA       = :VALOR_MULTA, '+
                       '              VALOR_OUTRAS_TAXAS= :VALOR_OUTRAS_TAXAS, '+
                       '              OBSERVACAO_MONETARIA = :OBSERVACAO_MONETARIA, '+
                       '              ESPECIE           = :ESPECIE, '+
                       '              DATA_PAGAMENTO    = :DATA_PAGAMENTO, '+
                       '              DATA_VENCIMENTO   = :DATA_VENCIMENTO, '+
                       '              REFERENCIA        = :REFERENCIA, '+
                       '              ANO_MES_REGISTRO  = :ANO_MES_REGISTRO, '+
                       '              HISTORICO         = :HISTORICO, '+
                       '              IR                = :IR, '+
                       '              CNJ               = :CNJ, '+
                       '              CONTABIL_RL       = :CONTABIL_RL, '+
                       '              DOCUMENTO_NUMERO  = :DOCUMENTO_NUMERO, '+
                       '              DOC_TIPO          = :DOC_TIPO, '+
                       '              OBSERVACAO        = :OBSERVACAO'+
                       ' WHERE LIVRO_CAIXA_ID = '+ IntToStr(vgDadosLivroCaixa.LivroCaixaId),2);
  end;

  procedure CarregarSalvar;
  begin
    try
      with dtmControles.sqlAuxiliar do
      begin
        if not vpAtualizar then
        begin

          if vpTransferenciaId = 0 then
               vgDadosLivroCaixa.LivroCaixaId := dtmControles.GerarSequencia('J_LIVRO_CAIXA')
          else vgDadosLivroCaixa.LivroCaixaId := vpTransferenciaId;

          ParamByName('LIVRO_CAIXA_ID').AsBCD         := vgDadosLivroCaixa.LivroCaixaId;
          ParamByName('OPERACAO').AsString            := vgDadosLivroCaixa.Operacao;
          ParamByName('DATA_LANCAMENTO').AsString     := vgDadosLivroCaixa.DataLancamento;
          ParamByName('VALOR_PREVISTO').AsCurrency    := vgDadosLivroCaixa.ValorCompromisso;
          ParamByName('IDENTIFICADOR_TIPO').AsString  := vgDadosLivroCaixa.IdentificacaoTipo;
          ParamByName('USUARIO_ID').AsString          := vgUsuarioID;
        end;

        ParamByName('CAIXA_ID').AsBCD               := vgDadosLivroCaixa.CaixaID;
        ParamByName('CENTRO_CUSTO_ID').AsBCD        := vgDadosLivroCaixa.CentroCustoId;
        ParamByName('CONTABIL_CONTA_ID').AsBCD      := vgDadosLivroCaixa.ContabilContaID;
        ParamByName('CONTABIL_GRUPO_ID').AsBCD      := vgDadosLivroCaixa.ContabilGrupoId;
        ParamByName('BALANCETE_GRUPO_ID').AsBCD     := vgDadosLivroCaixa.BalanceteGrupoId;
        ParamByName('VALOR').AsCurrency             := vgDadosLivroCaixa.ValorPago;
        ParamByName('VALOR_FATURADO').AsCurrency    := vgDadosLivroCaixa.ValorFaturado;
        ParamByName('VALOR_OUTRA_DEDUCAO').AsCurrency := vgDadosLivroCaixa.ValorOutraDeducao;
        ParamByName('VALOR_DESCONTO').AsCurrency    := vgDadosLivroCaixa.ValorDesconto;
        ParamByName('VALOR_JUROS').AsCurrency       := vgDadosLivroCaixa.ValorJuros;
        ParamByName('VALOR_MULTA').AsCurrency       := vgDadosLivroCaixa.ValorMulta;
        ParamByName('VALOR_OUTRAS_TAXAS').AsCurrency:= vgDadosLivroCaixa.ValorOutrasTaxas;
        ParamByName('OBSERVACAO_MONETARIA').AsString:= vgDadosLivroCaixa.ObservacaoMonetaria;

        ParamByName('ESPECIE').AsString             := vgDadosLivroCaixa.Especie;
        ParamByName('DATA_PAGAMENTO').AsString      := vgDadosLivroCaixa.DataPagamento;
        ParamByName('DATA_VENCIMENTO').AsString     := TrocaBarraPPonto(vgDadosLivroCaixa.DataVencimento);
        ParamByName('REFERENCIA').AsString          := vgDadosLivroCaixa.Referencia;
        ParamByName('ANO_MES_REGISTRO').AsString    := vgDadosLivroCaixa.AnoMesRegistro;
        ParamByName('HISTORICO').AsString           := vgDadosLivroCaixa.Historico;
        ParamByName('IR').AsString                  := vgDadosLivroCaixa.IR;
        ParamByName('CNJ').AsString                 := vgDadosLivroCaixa.CNJ;
        ParamByName('CONTABIL_RL').AsString         := vgDadosLivroCaixa.ContabilRL;
        ParamByName('DOCUMENTO_NUMERO').AsString    := vgDadosLivroCaixa.DocumentoNumero;
        ParamByName('DOC_TIPO').AsString            := vgDadosLivroCaixa.DocTipo;
        ParamByName('OBSERVACAO').AsString          := vgDadosLivroCaixa.Observacao;
        ExecSQL;
      end;
    except
      on E: exception do
        Application.MessageBox(Pchar(E.Message), 'Aviso', mb_IconExclamation);
    end;
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
    Application.MessageBox('Período Inicial inválido!!!', 'Atenção', MB_OK + MB_ICONWARNING);
    vpAnoMesInicial.SetFocus;
    abort;
  end;

  viPeriodoInicial := copy(vpAnoMesInicial.EditValue,4,4) + copy(vpAnoMesInicial.EditValue,1,2);
  if (vpPeriodo = '3') or (vpAnoMesFinal.text <> '') then
  begin
    viPeriodoFinal := copy(vpAnoMesFinal.EditValue,4,4) + copy(vpAnoMesFinal.EditValue,1,2);

    if viPeriodoInicial > viPeriodoFinal then
    begin
      Application.MessageBox('Período Final não pode ser menor que Período Inicial!!!', 'Atenção', MB_OK + MB_ICONWARNING);
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
  viAnoMesFechado    := dtmControles.GetStr(' SELECT ANO_MES_FECHAMENTO FROM J_CEDENTE '+
                                            ' WHERE CEDENTE_ID = '+IntToStr(vgCedenteAtivo));
  if viAnoMesFechado <> '' then
  begin
    if viAnoMesLancamento <= StrToInt(viAnoMesFechado) then
    begin
      Application.MessageBox(Pchar('Lançamento não permitido nesta data.'+#13+#13+
                                   'Livro Caixa do mês de '+ Mes[StrToInt(copy(IntToStr(viAnoMesLancamento),5,2))] +
                                   ' de '+copy(IntToStr(viAnoMesLancamento),1,4)+' esta fechado!!!'), 'Atenção', MB_OK + MB_ICONWARNING);
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
    Application.MessageBox(Pchar(vpOperacao+' não permitido. Balancete do Mês Fechado!!!'), 'Atenção', MB_OK + MB_ICONWARNING);
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
          Application.MessageBox(Pchar(vpOperacao+' não permitido. Período menor que o período do balancete anterior!!!'), 'Atenção', MB_OK + MB_ICONWARNING);
          abort;
        end;
      end
      else
      begin
        if (StrToInt(vpReferencia)) < (StrToInt(vgReferenciaInicial)) then
        begin
          Application.MessageBox(Pchar(vpOperacao+' não permitido. Período menor que o período inicial do sistema!!!'), 'Atenção', MB_OK + MB_ICONWARNING);
          abort;
        end;
        
      end;
    end;

  if StrToInt(vpReferencia) > vgPeriodoAtual then
  begin
    Application.MessageBox(Pchar(vpOperacao+' não permitido. Período maior que o período atual!!!'), 'Atenção', MB_OK + MB_ICONWARNING);
    abort;
  end;

end;

function TdtmLookupContabil.VerificarHistoricoPadrao(vpHistorico,
  vpContabilContaId: string): string;
var
  viHistorico : String;
begin
  viHistorico := dtmControles.GetStr(' SELECT HISTORICO_PADRAO FROM J_CONTABIL_CONTA '+
                                     ' WHERE CONTABIL_CONTA_ID = '+vpContabilContaId);
  if viHistorico = '' then
       Result := vpHistorico
  else Result := viHistorico;
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

end.

      if (dtmControles.sqlAuxiliar.FieldByName('PREVISAO_SALDO').AsString <> 'N') or vpSomarContasExclusas then
