unit Lookup;

interface

uses
  SysUtils, Classes, cxDBEditRepository, DB, DBClient, SimpleDS,
  cxEditRepositoryItems, cxEdit, cxDropDownEdit, Forms, Windows, Controls, cxPC,
  cxStyles, cxClasses, cxImageComboBox, cxGridExportLink, cxGrid, dxPSGlbl,
  dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxSkinsCore, dxSkinBlack, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinMcSkin, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxSkinsdxBarPainter, dxSkinsdxRibbonPainter,
  dxPSCore, dxPScxCommon, System.Variants, Vcl.Dialogs, DbxDevartInterBase;

type
  TExecuteProc = procedure of object;

  TDadosCadastro = Record
    Descricao, Tabela, CampoId, PastaCarregada, RenumeracaoIdChaves: String;
    ChaveIdPrincipal, ChaveIdSecundaria, ChaveIdTerciaria: Integer;
    Confirmado, SomentePesquisa, Consultoria, SalvarNovo, AtualizarSaldo: Boolean;
  end;

  TImagem = Record
    SubPasta, Pasta, LocalImagem: string;
  end;

  TdtmLookup = class(TDataModule)
    cxEditRepository1: TcxEditRepository;
    cxEditRepository1CurrencyItem1: TcxEditRepositoryCurrencyItem;
    cxEditRepository1DateItem1: TcxEditRepositoryDateItem;
    Combo_Sexo: TcxEditRepositoryImageComboBoxItem;
    Combo_SimNao: TcxEditRepositoryImageComboBoxItem;
    Combo_TipoQualificacao: TcxEditRepositoryImageComboBoxItem;
    sqlG_TB_TxModeloGrupo: TSimpleDataSet;
    sqlG_TB_TxModeloGrupoTB_TXMODELOGRUPO_ID: TFMTBCDField;
    sqlG_TB_TxModeloGrupoDESCRICAO: TStringField;
    dtsG_TB_TxModeloGrupo: TDataSource;
    ListaG_TB_TBTxModeloGrupo: TcxEditRepositoryLookupComboBoxItem;
    Combo_AtivoInativo: TcxEditRepositoryImageComboBoxItem;
    Combo_UF: TcxEditRepositoryComboBoxItem;
    Formata_Fone: TcxEditRepositoryMaskItem;
    Formata_CPF: TcxEditRepositoryMaskItem;
    Formata_CNPJ: TcxEditRepositoryMaskItem;
    Formata_DataSEMhora: TcxEditRepositoryDateItem;
    sqlG_Usuario: TSimpleDataSet;
    dtsG_Usuario: TDataSource;
    sqlG_UsuarioUSUARIO_ID: TFMTBCDField;
    sqlG_UsuarioTROCARSENHA: TStringField;
    sqlG_UsuarioLOGIN: TStringField;
    sqlG_UsuarioSENHA: TStringField;
    sqlG_UsuarioSITUACAO: TStringField;
    sqlG_UsuarioNOME_COMPLETO: TStringField;
    sqlG_UsuarioFUNCAO: TStringField;
    sqlG_UsuarioASSINA: TStringField;
    listaG_Usuario: TcxEditRepositoryLookupComboBoxItem;
    sqlUsuarioSistema: TSimpleDataSet;
    dtsUsuarioSistema: TDataSource;
    sqlUsuarioSistemaUSUARIO_ID: TFMTBCDField;
    sqlUsuarioSistemaLOGIN: TStringField;
    Lista_UsuarioSistema: TcxEditRepositoryLookupComboBoxItem;
    Combo_Sistema: TcxEditRepositoryImageComboBoxItem;
    sqlUsuarioAssinante: TSimpleDataSet;
    FMTBCDField1: TFMTBCDField;
    dtsUsuarioAssinante: TDataSource;
    sqlUsuarioAssinanteNOME_COMPLETO: TStringField;
    Lista_UsuarioAssinante: TcxEditRepositoryLookupComboBoxItem;
    Combo_EntradaSaida: TcxEditRepositoryImageComboBoxItem;
    Combo_TiposValoresMarcacoes: TcxEditRepositoryImageComboBoxItem;
    sqlUsuarioAssinanteFUNCAO: TStringField;
    Combo_Permissao: TcxEditRepositoryCheckBoxItem;
    Check_SimNao: TcxEditRepositoryCheckBoxItem;
    Combo_Correcao: TcxEditRepositoryImageComboBoxItem;
    sqlCedenteTodos: TSimpleDataSet;
    dtsCedenteTodos: TDataSource;
    sqlCedenteTodosDESCRICAO: TStringField;
    sqlCedenteTodosCEDENTE_ID: TFMTBCDField;
    sqlCedenteAtivos: TSimpleDataSet;
    dtsCedenteAtivos: TDataSource;
    Lista_CedenteTodos: TcxEditRepositoryLookupComboBoxItem;
    Lista_CedenteAtivos: TcxEditRepositoryLookupComboBoxItem;
    Combo_OperacaoContabil: TcxEditRepositoryImageComboBoxItem;
    sqlCedenteAtivosDESCRICAO: TStringField;
    sqlCedenteAtivosCEDENTE_ID: TFMTBCDField;
    sqlGrupoContabilTodos: TSimpleDataSet;
    dtsGrupoContabilTodos: TDataSource;
    sqlGrupoContabilTodosDESCRICAO: TStringField;
    sqlGrupoContabilTodosCONTABIL_GRUPO_ID: TFMTBCDField;
    sqlGrupoContabilAtivos: TSimpleDataSet;
    dtsGrupoContabiAtivos: TDataSource;
    sqlGrupoContabilAtivosDESCRICAO: TStringField;
    sqlGrupoContabilAtivosCONTABIL_GRUPO_ID: TFMTBCDField;
    Lista_GrupoContabilTodos: TcxEditRepositoryLookupComboBoxItem;
    Lista_GrupoContabilAtivos: TcxEditRepositoryLookupComboBoxItem;
    sqlGrupoContabilSaidas: TSimpleDataSet;
    dtsGrupoContabilSaidas: TDataSource;
    sqlGrupoContabilEntradas: TSimpleDataSet;
    dtsGrupoContabiEntradas: TDataSource;
    sqlGrupoContabilSaidasDESCRICAO: TStringField;
    sqlGrupoContabilSaidasCONTABIL_GRUPO_ID: TFMTBCDField;
    sqlGrupoContabilEntradasDESCRICAO: TStringField;
    sqlGrupoContabilEntradasCONTABIL_GRUPO_ID: TFMTBCDField;
    Lista_GrupoContabilSaidas: TcxEditRepositoryLookupComboBoxItem;
    Lista_GrupoContabilEntradas: TcxEditRepositoryLookupComboBoxItem;
    Combo_Grau: TcxEditRepositoryImageComboBoxItem;
    Combo_Situacao: TcxEditRepositoryImageComboBoxItem;
    Lista_GrupoAssociadoTodos: TcxEditRepositoryLookupComboBoxItem;
    sqlBalanceteGrupo: TSimpleDataSet;
    dtsBalanceteGrupo: TDataSource;
    sqlBalanceteGrupoDESCRICAO: TStringField;
    sqlBalanceteGrupoBALANCETE_GRUPO_ID: TFMTBCDField;
    Lista_BalanceteGrupoDescricao: TcxEditRepositoryLookupComboBoxItem;
    sqlPlanoContasAtivo: TSimpleDataSet;
    dtsPlanoContasAtivo: TDataSource;
    sqlPlanoContasAtivoCONTABIL_CONTA_ID: TFMTBCDField;
    sqlPlanoContasAtivoDESCRICAO: TStringField;
    sqlPlanoContasTodos: TSimpleDataSet;
    FMTBCDField2: TFMTBCDField;
    StringField1: TStringField;
    dtsPlanoContasTodos: TDataSource;
    Lista_PlanoContasAtivo: TcxEditRepositoryLookupComboBoxItem;
    Lista_PlanoContasTodos: TcxEditRepositoryLookupComboBoxItem;
    sqlPlanoContasReceitas: TSimpleDataSet;
    dtsPlanoContasReceitas: TDataSource;
    sqlPlanoContasReceitasCONTABIL_CONTA_ID: TFMTBCDField;
    sqlPlanoContasReceitasDESCRICAO: TStringField;
    Lista_PlanoContasReceitas: TcxEditRepositoryLookupComboBoxItem;
    Combo_Periodo: TcxEditRepositoryImageComboBoxItem;
    Combo_SituacaoPagamento: TcxEditRepositoryImageComboBoxItem;
    Combo_SimNaoDiferenca: TcxEditRepositoryImageComboBoxItem;
    Combo_SituacaoCompLocal: TcxEditRepositoryImageComboBoxItem;
    Combo_SituacaoCompGeralImg: TcxEditRepositoryImageComboBoxItem;
    sqlPlanoContasReceitasFIXO: TStringField;
    Combo_SimNaoImagem: TcxEditRepositoryImageComboBoxItem;
    Combo_PeriodoLimitado: TcxEditRepositoryImageComboBoxItem;
    sqlCompromissoMensal: TSimpleDataSet;
    dtsCompromissoMensal: TDataSource;
    sqlCompromissoMensalDESCRICAO: TStringField;
    sqlCompromissoMensalCONTABIL_CONTA_ID: TFMTBCDField;
    Lista_ContasAgendadasMensal: TcxEditRepositoryLookupComboBoxItem;
    sqlPlanoContasReceitasBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlCompromissoMensalBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlPessoas: TSimpleDataSet;
    dtsPessoas: TDataSource;
    sqlPessoasNOME: TStringField;
    sqlPessoasPESSOA_ID: TFMTBCDField;
    Lista_Pessoas: TcxEditRepositoryLookupComboBoxItem;
    Combo_Obrigatorio: TcxEditRepositoryImageComboBoxItem;
    Combo_SituacaoCompGeral: TcxEditRepositoryImageComboBoxItem;
    sqlAssociadosAtivos: TSimpleDataSet;
    StringField2: TStringField;
    FMTBCDField3: TFMTBCDField;
    dtsAssociadosAtivos: TDataSource;
    Lista_AssociadosAtivos: TcxEditRepositoryLookupComboBoxItem;
    sqlBalanceteGrupoSIGLA: TStringField;
    Lista_BalanceteGrupoSigla: TcxEditRepositoryLookupComboBoxItem;
    sqlGrupoContabilTodosBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlGrupoContabilSaidasBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlGrupoContabilEntradasBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlGrupoContabilAtivosBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlCentroCustoTodos: TSimpleDataSet;
    dtsCentroCustoTodos: TDataSource;
    sqlCentroCustoTodosDESCRICAO: TStringField;
    sqlCentroCustoTodosCENTRO_CUSTO_ID: TFMTBCDField;
    sqlCentroCustoTodosBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlCentroCustoAtivo: TSimpleDataSet;
    StringField3: TStringField;
    FMTBCDField4: TFMTBCDField;
    FMTBCDField5: TFMTBCDField;
    dtsCentroCustoAtivo: TDataSource;
    Lista_CentroCustoTodos: TcxEditRepositoryLookupComboBoxItem;
    Lista_CentroCustoAtivo: TcxEditRepositoryLookupComboBoxItem;
    sqlCompromissoMensalVALOR_ATUAL: TFMTBCDField;
    sqlCompromissoMensalANO_MES_FINAL: TStringField;
    sqlCompromissoMensalPERIODO: TStringField;
    sqlCompromissoMensalANO_MES_INICIAL: TStringField;
    dtsGrupoTodos: TDataSource;
    sqlGrupoTodos: TSimpleDataSet;
    sqlGrupoTodosDESCRICAO: TStringField;
    sqlGrupoTodosPESSOA_GRUPO_ID: TFMTBCDField;
    sqlGrupoAtivo: TSimpleDataSet;
    StringField4: TStringField;
    FMTBCDField6: TFMTBCDField;
    dtsGrupoAtivo: TDataSource;
    Lista_GrupoAssociadoAtivo: TcxEditRepositoryLookupComboBoxItem;
    sqlPessoasBOLETO_EMAIL: TStringField;
    sqlCompReceitaTodos: TSimpleDataSet;
    dtsCompReceitaTodos: TDataSource;
    sqlCompReceitaTodosDESCRICAO: TStringField;
    sqlCompReceitaTodosCONTABIL_CONTA_ID: TFMTBCDField;
    Lista_CompReceitassTodos: TcxEditRepositoryLookupComboBoxItem;
    Combo_SituacaoBoleto: TcxEditRepositoryImageComboBoxItem;
    sqlPlanoContasDespesasTodos: TSimpleDataSet;
    dtsPlanoContasDespesasTodos: TDataSource;
    dtsPlanoContasDespesasAtivo: TDataSource;
    sqlPlanoContasDespesasAtivo: TSimpleDataSet;
    Lista_PlanoContasDespTodas: TcxEditRepositoryLookupComboBoxItem;
    Lista_PlanoContasDespAtivos: TcxEditRepositoryLookupComboBoxItem;
    sqlPlanoContasDespesasAtivoDESCRICAO: TStringField;
    sqlPlanoContasDespesasAtivoCONTABIL_CONTA_ID: TFMTBCDField;
    sqlPlanoContasDespesasAtivoFIXO: TStringField;
    sqlPlanoContasDespesasAtivoBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlPlanoContasDespesasTodosDESCRICAO: TStringField;
    sqlPlanoContasDespesasTodosCONTABIL_CONTA_ID: TFMTBCDField;
    sqlPlanoContasDespesasTodosFIXO: TStringField;
    sqlPlanoContasDespesasTodosBALANCETE_GRUPO_ID: TFMTBCDField;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    sqlCompSaidaTodos: TSimpleDataSet;
    StringField5: TStringField;
    FMTBCDField7: TFMTBCDField;
    dtsCompSaidaTodos: TDataSource;
    Lista_CompSaidasTodos: TcxEditRepositoryLookupComboBoxItem;
    Combo_Meses: TcxEditRepositoryImageComboBoxItem;
    sqlCabecalho: TSimpleDataSet;
    dtsCabecalho: TDataSource;
    sqlCabecalhoBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlCabecalhoCABECALHO: TBlobField;
    sqlCabecalhoTEXTO_CABECALHO: TBlobField;
    Combo_Detalhado: TcxEditRepositoryImageComboBoxItem;
    dxComponentPrinter: TdxComponentPrinter;
    dxComponentPrinterLink: TdxGridReportLink;
    sqlConfiguracaoSalva: TSimpleDataSet;
    sqlConfiguracaoSalvaCONFIGURACAO_SALVA_ID: TFMTBCDField;
    sqlConfiguracaoSalvaLOCAL: TStringField;
    sqlConfiguracaoSalvaDESCRICAO: TStringField;
    sqlConfiguracaoSalvaVALOR: TStringField;
    sqlConfiguracaoSalvaSISTEMA_ID: TFMTBCDField;
    sqlConfiguracaoDados: TSimpleDataSet;
    sqlConfiguracaoDadosCONFIGURACAO_SALVA_ID: TFMTBCDField;
    sqlConfiguracaoDadosLOCAL: TStringField;
    sqlConfiguracaoDadosDESCRICAO: TStringField;
    sqlConfiguracaoDadosVALOR: TStringField;
    sqlConfiguracaoDadosSISTEMA_ID: TFMTBCDField;
    dtsConfiguracaoSalva: TDataSource;
    dtsConfiguracaoDados: TDataSource;
    sqlReservasAtivas: TSimpleDataSet;
    sqlReservasAtivasDESCRICAO: TStringField;
    sqlReservasAtivasRESERVA_ID: TFMTBCDField;
    dtsReservasAtivas: TDataSource;
    Lista_ReservasAtivas: TcxEditRepositoryLookupComboBoxItem;
    sqlReservasAtivasBALANCETE_GRUPO_ID: TFMTBCDField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    procedure AtualizarParametro(vpNome, vpSecao, vpGrupo, vpSistema : String; vpValor : String);
    procedure AtualizarTabelas;
    procedure CarregarPeriodo(vpComBoBox : TcxComboBox; vpTipo : Integer; vpAnoMesInicial, vpAnoMesFinal : String);
    Function InclementarAnoMes(vpAnoMes : String):String;
    Function DeclementarAnoMes(vpAnoMes : String; vpQtd : Integer = 1):String;
    Function FormatarAnoMes(vpAnoMes : String; vpTirarBarra : String = ''):String;
    procedure MarcarDesmarcarCompromissos(vpSqlDataSet : TSimpleDataSet; vpMarcar : Boolean);
    procedure CarregarIcxComboBox(vpValue, vpDescricao : string; vpIcxComboBox : TcxImageComboBox; vpImageIndex : Integer = -1);

    // Compromissos
    Procedure AdicionarCompromisso(vpVencido, vpAgendado,
          vpDeterminado : Boolean; vpOperacao : String);
    Procedure ValidarIntervalodeAnoMes(vpAnoMesInicial, vpAnoMesFinal: TcxComboBox; vpPeriodo : String);

    // Balancete
    procedure CarregarTabBalancete(vpTabBalancete : TcxTabControl);
    procedure FiltrarGrupoContasBalancete(vpSimpleDataSet : TSimpleDataSet; vpBalanceteId : Integer;
           vpFiltrar : Boolean);

    procedure GerarBoleto(vpData : String; vpTodos : Boolean; vpPessoa : String = ''; vpGrupo : String = '');
    procedure LerDadadosConfigEmail(vpTabela : String);
    Function PegarVencimentoPadrao(vpDia : String):String;
    Function PegarAnoMes(vpData : String):Integer;
    Function VefificaExistenciaBoleto(vpPessoaId : String):Boolean;
    Procedure VerificarEdicao(vpReferencia, vpOperacao : String);
    procedure CarregarCabecalho(vpBalanceteId : Integer);
    procedure VerificarProgramacaoAjuste(vpCompromissoAgendadoId, vpAnoMes : String);
    procedure ExportarExcel(vpGrid : TcxGrid);
    procedure MarcarDesmarcarItensSimpleDataSet(vpMarcar: String;
      vpSimpleDataset: TSimpleDataSet);
    procedure CadastrarRegBasicoGeralClient(vpSqlDataset: TClientDataSet; vpTabela, vpCampoId, vpValor: String);
    Function CadastrarRegBasicoGeral(vpSqlDataset: TSimpleDataSet; vpClientDataset: TClientDataSet; vpValorId: Variant;
      vpTabela, vpCampoId, vpValor: String; vpAtualizarValor, vpAtualizarCampo, vpUpper: Boolean): Integer;
    procedure CadastrarFormRapido(vpTabela, vpCampoId : String; vpIdLigacao, vpIdLigacao2 : Integer; vpId : Integer = 0);

    // Configura��es Salvas
    procedure CarregarConfiguracaoSalva(vpLocal : String);
    procedure GravarConfiguracaoSalva(vpLocal, vpDescricao, vpValor, vpOrdem : Variant);
    procedure BuscarConficuracaoSalva(vpLocal, vpDescricao : String);

    // Imagem
    function VerificarPastaImagem(vpPastaImagem : string; vpNumero : Integer; vpVerificarExistencia : Boolean = False):Boolean;

    procedure UpdateSimplesTabela(vpTabela, vpCampoAtualiza, vpCondicaoExtra, vpValor, vpId : String);
  end;

var
  dtmLookup: TdtmLookup;
  ExecAtualizar: TExecuteProc;
  vgDadosCadastro: TDadosCadastro;
  vgDadosImagem : TImagem;

implementation
uses Controles, CadastroBasicoGeral, Rotinas, Lookup_Servico, Lookup_Contabil;

{$R *.dfm}

procedure TdtmLookup.AdicionarCompromisso(vpVencido, vpAgendado,
     vpDeterminado : Boolean; vpOperacao : String);
var
  viFlag, viAtualizar, viQtdLimitada : Boolean;
  viValorDiferenca, viQtdAdicional, viValorPago, viValorAnterior, viValorAtual : Currency;
  viDiferenca, viCompromisoId, viAnoMesFinal, viQtdGravar, viProximoPeriodo, viPeriodoInicial : String;
  viAgendadoExecutar : Integer;

  procedure ExcluirDiferencaExistente;
  begin
    ExecutaSqlAuxiliar(' DELETE FROM T_COMPROMISSO_VENCIDO '+
                       ' WHERE CONTABIL_CONTA_ID = '+ CurrToStr(vgCompromissoVencido.ContabilContaId)+
                       '   AND PESSOA_ID = '+ CurrToStr(vgCompromissoVencido.PessoaId)+
                       '   AND ANO_MES_REFERENCIA = '+QuotedStr(vgCompromissoVencido.PeriodoInicial)+
                       '   AND SITUACAO = '+QuotedStr('1')+
                       '   AND DIFERENCA = '+QuotedStr('S')+
                       '   AND CEDENTE_ID = '+ IntToStr(vgCedenteAtivo),1);
  end;

  Procedure VerificarQtdLimitada;
  begin
    ExecutaSqlAuxiliar(' SELECT QTD_LIMITADA FROM T_CONTABIL_CONTA '+
                       ' WHERE CONTABIL_CONTA_ID = '+ CurrToStr(vgCompromissoVencido.ContabilContaId),0);
    viQtdLimitada := dtmControles.sqlAuxiliar.FieldByName('QTD_LIMITADA').AsString = 'S';
  end;

  function VerificarCompromissoVencido:Boolean;
  begin
    viValorDiferenca := 0;
    viValorPago      := 0;
    viDiferenca      :='N';
    viAtualizar      := False;
    viQtdAdicional   := 0;

    VerificarQtdLimitada;
    // Verifica valores Pagos desse compromisso no mes_ano_referencia
    ExecutaSqlAuxiliar(' SELECT SUM(VALOR_ATUAL) AS VALOR, COUNT(COMPROMISSO_VENCIDO_ID) AS QTD '+
                       ' FROM T_COMPROMISSO_VENCIDO '+
                       ' WHERE CONTABIL_CONTA_ID = '+ CurrToStr(vgCompromissoVencido.ContabilContaId)+
                       '   AND PESSOA_ID = '+ CurrToStr(vgCompromissoVencido.PessoaId)+
                       '   AND ANO_MES_REFERENCIA = '+QuotedStr(vgCompromissoVencido.PeriodoInicial)+
                       '   AND SITUACAO = '+QuotedStr('2')+
                       ' GROUP BY ANO_MES_REFERENCIA',0);
    if (not dtmControles.sqlAuxiliar.IsEmpty) and (dtmControles.sqlAuxiliar.FieldByName('QTD').AsCurrency > 0) then
    begin
      viValorPago    := dtmControles.sqlAuxiliar.FieldByName('VALOR').AsCurrency;
      viQtdAdicional := dtmControles.sqlAuxiliar.FieldByName('QTD').AsInteger;

      if viQtdLimitada then
      begin
        if (viValorPago >= vgCompromissoVencido.Valor) then
        begin
          ExcluirDiferencaExistente;
          Result := False;
          exit;
        end
        else
        begin
           viValorDiferenca := vgCompromissoVencido.Valor - viValorPago;
           viDiferenca := 'S';
        end;
      end;
    end;

    // Verifica se existe o compromisso em compromissos pendentes.
    ExecutaSqlAuxiliar(' SELECT COMPROMISSO_VENCIDO_ID, VALOR_ATUAL, BOLETA_ID '+
                       ' FROM T_COMPROMISSO_VENCIDO '+
                       ' WHERE CONTABIL_CONTA_ID = '+ CurrToStr(vgCompromissoVencido.ContabilContaId)+
                       '   AND PESSOA_ID = '+ CurrToStr(vgCompromissoVencido.PessoaId)+
                       '   AND ANO_MES_REFERENCIA = '+QuotedStr(vgCompromissoVencido.PeriodoInicial)+
                       '   AND SITUACAO = '+QuotedStr('1'),0);
    if not dtmControles.sqlAuxiliar.IsEmpty then
    begin
       viCompromisoId  := dtmControles.sqlAuxiliar.FieldByName('COMPROMISSO_VENCIDO_ID').AsString;

       // verifica se existe Boleto Vinculado
       if (not dtmControles.sqlAuxiliar.FieldByName('BOLETA_ID').IsNull) and viQtdLimitada then
       begin
         ExecutaSqlAuxiliar(' UPDATE T_COMPROMISSO_VENCIDO SET ' +
                            '        ATUALIZADO = '+QuotedStr('T')+
                            ' WHERE COMPROMISSO_VENCIDO_ID = ' + viCompromisoId,1);
         Result := False;
         exit;
       end;

       viValorAtual    := dtmControles.sqlAuxiliar.FieldByName('VALOR_ATUAL').AsCurrency;
       viValorAnterior := viValorAtual;

       viQtdAdicional := viQtdAdicional + dtmControles.GetInt(' SELECT COUNT(COMPROMISSO_VENCIDO_ID) FROM T_COMPROMISSO_VENCIDO '+
                                                              ' WHERE CONTABIL_CONTA_ID = '+CurrToStr(vgCompromissoVencido.ContabilContaId)+
                                                              '   AND PESSOA_ID = '+ CurrToStr(vgCompromissoVencido.PessoaId)+
                                                              '   AND ANO_MES_REFERENCIA = '+QuotedStr(vgCompromissoVencido.PeriodoInicial)+
                                                              '   AND SITUACAO = '+QuotedStr('1'));
      if (viQtdAdicional = 0) or (viQtdLimitada) then
      begin
        if viValorPago = 0 then
        begin
          if vgCompromissoVencido.Valor <> viValorAtual then
          begin
            viValorDiferenca := vgCompromissoVencido.Valor;
            viAtualizar := true;
            Result      := True;
          end
          else Result := False;
        end
        else
        begin
          viAtualizar := true;
          if viValorDiferenca = 0 then
            viValorDiferenca := vgCompromissoVencido.Valor;
          Result := True
        end;
      end
      else Result := True;
    end
    else Result := True;
  end;

  procedure RegistrarCompromissoVencido;
  var
    viAnoMesRealizado, viDataRealizacao, viPessoaNome : String;
  begin
     viQtdAdicional > 0 then
         viQtdGravar := CurrToStr(viQtdAdicional+1)
    else viQtdGravar := '';

    if not viAtualizar then
    begin
      if vgCompromissoVencido.SituacaoLocal = '1' then
      begin
        viAnoMesRealizado := '';
        viDataRealizacao  := '';
        viPessoaNome      := '';
      end
      else
      begin
        if vgCompromissoVencido.DataRealizacao = '' then
        begin
          viAnoMesRealizado := IntToStr(vgPeriodoAtual);
          viDataRealizacao  := QuotedStr(TrocaBarraPPonto(dtmControles.DataHoraBanco(4)));
        end
        else
        begin
          viAnoMesRealizado := vgCompromissoVencido.PeriodoFinal;
          viDataRealizacao  := QuotedStr(vgCompromissoVencido.DataRealizacao);
        end;
        viPessoaNome := QuotedStr(dtmControles.GetStr(' SELECT NOME FROM T_PESSOA WHERE PESSOA_ID = '+ CurrToStr(vgCompromissoVencido.PessoaId)));
      end;

      ExecutaSqlAuxiliar(' INSERT INTO T_COMPROMISSO_VENCIDO( '+
                         '              COMPROMISSO_VENCIDO_ID, '+
                         '              PESSOA_ID, '+
                         '              CONTABIL_CONTA_ID, '+
                         '              VALOR_ATUAL, '+
                         '              VALOR_ORIGEM, '+
                         '              VALOR_ANTERIOR, '+
                         '              ANO_MES_REFERENCIA, '+
                         '              DIFERENCA, '+
                         '              TIPO_OPERACAO, '+
                         '              OBRIGATORIO, '+
                         '              QTD_ADICIONAL, '+
                         '              ATUALIZADO, '+
                         '              CENTRO_CUSTO_ID, '+
                         '              CEDENTE_ID, '+
                         '              BALANCETE_GRUPO_ID, '+
                         '              LANCAMENTO_COMPROMISSO_ID, '+
                         '              RESERVA_ID, '+
                         '              CAIXA_ID, '+
                         '              BOLETA_MULTA_ID, '+
                         '              RECIBO_MULTA_ID, '+
                         '              ANO_MES_REALIZADO, '+
                         '              DATA_REALIZACAO, '+
                         '              PESSOA_NOME, '+
                         '              DESCRICAO, '+
                         '              SITUACAO) '+
                         ' VALUES(      :COMPROMISSO_VENCIDO_ID, '+
                         '              :PESSOA_ID, '+
                         '              :CONTABIL_CONTA_ID, '+
                         '              :VALOR_ATUAL, '+
                         '              :VALOR_ORIGEM, '+
                         '              :VALOR_ANTERIOR, '+
                         '              :ANO_MES_REFERENCIA, '+
                         '              :DIFERENCA, '+
                         '              :TIPO_OPERACAO, '+
                         '              :OBRIGATORIO, '+
                         RetNull(viQtdGravar)+', '+
                         '              :ATUALIZADO, '+
                         '              :CENTRO_CUSTO_ID, '+
                         '              :CEDENTE_ID, '+
                         '              :BALANCETE_GRUPO_ID, '+
                         RetNull(vgCompromissoVencido.LancamentoCompromissoId)+', '+
                         RetNullInteger(vgCompromissoVencido.ReservaId)+', '+
                         RetNullInteger(vgCompromissoVencido.CaixaID)+', '+
                         RetNull(vgCompromissoVencido.BoletoId)+', '+
                         RetNull(vgCompromissoVencido.ReciboId)+', '+
                         RetNull(viAnoMesRealizado)+', '+
                         RetNull(viDataRealizacao)+', '+
                         RetNull(viPessoaNome)+', '+
                         '              :DESCRICAO, '+
                         '              :SITUACAO)',2);
      with dtmControles.sqlAuxiliar do
      begin
        ParamByName('COMPROMISSO_VENCIDO_ID').AsBCD := dtmControles.GerarSequencia('T_COMPROMISSO_VENCIDO');
        ParamByName('PESSOA_ID').AsBCD              := vgCompromissoVencido.PessoaId;
        ParamByName('CONTABIL_CONTA_ID').AsBCD      := vgCompromissoVencido.ContabilContaId;
        ParamByName('ANO_MES_REFERENCIA').AsString  := vgCompromissoVencido.PeriodoInicial;

        if vgCompromissoVencido.SituacaoLocal = '1' then
          ParamByName('SITUACAO').AsString := '1'
        else
        begin
          if vgCompromissoVencido.DataRealizacao = '' then
               ParamByName('SITUACAO').AsString := '3'
          else ParamByName('SITUACAO').AsString := vgCompromissoVencido.SituacaoLocal;
        end;

        ParamByName('DIFERENCA').AsString           := viDiferenca;
        ParamByName('TIPO_OPERACAO').AsString       := vpOperacao;
        ParamByName('OBRIGATORIO').AsString         := vgCompromissoVencido.Obrigatorio;
        ParamByName('VALOR_ORIGEM').AsCurrency      := vgCompromissoVencido.Valor;
        ParamByName('VALOR_ANTERIOR').AsCurrency    := 0;
        ParamByName('ATUALIZADO').AsString          := 'A';
        ParamByName('CENTRO_CUSTO_ID').AsBCD        := vgCompromissoVencido.CentroCustoId;
        ParamByName('CEDENTE_ID').AsBCD             := vgCedenteAtivo;
        ParamByName('BALANCETE_GRUPO_ID').AsBCD     := vgCompromissoVencido.BalanceteGrupoId;
        ParamByName('DESCRICAO').AsString           := vgCompromissoVencido.Descricao;

        if viValorDiferenca > 0 then
             ParamByName('VALOR_ATUAL').AsCurrency := viValorDiferenca
        else ParamByName('VALOR_ATUAL').AsCurrency := vgCompromissoVencido.Valor;
        ExecSQL(FALSE);
      end;
    end
    else
      ExecutaSqlAuxiliar(' UPDATE T_COMPROMISSO_VENCIDO SET ' +
                         '        VALOR_ATUAL = '+ QuotedStr(TrocaVirgPPto(CurrToStr(viValorDiferenca))) +', '+
                         '        VALOR_ANTERIOR = '+ QuotedStr(TrocaVirgPPto(CurrToStr(viValorAnterior))) +', '+
                         '        ATUALIZADO = '+QuotedStr('S')+
                         ' WHERE COMPROMISSO_VENCIDO_ID = ' + viCompromisoId,1);
  end;

  Function VerificarCompromissoAgendado : Boolean;
  begin
    ExecutaSqlAuxiliar(' SELECT CONTABIL_CONTA_ID, COMPROMISSO_AGENDADO_ID, VALOR_ATUAL, VALOR_ANTERIOR, SITUACAO_GERAL, SITUACAO_LOCAL '+
                       ' FROM T_COMPROMISSO_AGENDADO '+
                       ' WHERE CONTABIL_CONTA_ID = '+ CurrToStr(vgCompromissoVencido.ContabilContaId)+
                       '   AND PESSOA_ID = '+ CurrToStr(vgCompromissoVencido.PessoaId),0);
    if not dtmControles.sqlAuxiliar.IsEmpty then
    begin
      if (dtmControles.sqlAuxiliar.FieldByName('SITUACAO_LOCAL').AsString = '2') and vgCompromissoVencido.MostrarMensagem then
      begin
        if vgCompromissoVencido.MostrarMensagem then
          Application.MessageBox(Pchar('Este compromisso j� se encontra agendado com a Situa��o de Inativo!!!'+#13+#13+
                                       '>> Ative o mesmo para realizar qualquer altera��o.'), 'Aten��o', MB_OK + MB_ICONWARNING);
        Result := False;
        exit;
      end;

      viCompromisoId := dtmControles.sqlAuxiliar.FieldByName('COMPROMISSO_AGENDADO_ID').AsString;
      if (dtmControles.sqlAuxiliar.FieldByName('SITUACAO_GERAL').AsString <> '2') then
      begin
        if vgCompromissoVencido.MostrarMensagem then
          Application.MessageBox('J� existe este compromisso agendado!!!', 'Aten��o', MB_OK + MB_ICONWARNING);
        Result := False;
        exit;
      end
      else
      begin
        if vgCompromissoVencido.MostrarMensagem then
          Application.MessageBox('Compromisso Inativo. Verifique no Gerenciador de Compromissos!!!', 'Aten��o', MB_OK + MB_ICONWARNING);
        Result := False;
      end;
    end
    else
    begin
      viAgendadoExecutar := 1;
      Result := True;
    end;
  end;

  procedure RegistrarCompromissoAgendado(vpAtualiza : Boolean = False);
  begin
    if vgCompromissoVencido.PeriodoTipo in [1,4,5] then
         viAnoMesFinal := ''
    else viAnoMesFinal := vgCompromissoVencido.PeriodoFinal;

    if not vpAtualiza then
    begin
      ExecutaSqlAuxiliar(' INSERT INTO T_COMPROMISSO_AGENDADO( '+
                         '              COMPROMISSO_AGENDADO_ID, '+
                         '              PESSOA_ID, '+
                         '              CONTABIL_CONTA_ID, '+
                         '              ANO_MES_INICIAL, '+
                         '              ANO_MES_FINAL, '+
                         '              VALOR_ATUAL, '+
                         '              VALOR_ANTERIOR, '+
                         '              VALOR_ORIGEM, '+
                         '              LANCAMENTO_COMPROMISSO_ID, '+
                         '              PERIODO, '+
                         '              ANO_MES_LANCAMENTO, '+
                         '              OBRIGATORIO, '+
                         '              CENTRO_CUSTO_ID, '+
                         '              CEDENTE_ID, '+
                         '              BALANCETE_GRUPO_ID, '+
                         '              RESERVA_ID, '+
                         '              SITUACAO_GERAL, '+
                         '              SITUACAO_LOCAL) '+
                         ' VALUES(      :COMPROMISSO_AGENDADO_ID, '+
                         '              :PESSOA_ID, '+
                         '              :CONTABIL_CONTA_ID, '+
                         '              :ANO_MES_INICIAL, '+
                         RetNull(viAnoMesFinal)+', '+
                         '              :VALOR_ATUAL, '+
                         '              :VALOR_ANTERIOR, '+
                         '              :VALOR_ORIGEM, '+
                         RetNull(vgCompromissoVencido.LancamentoCompromissoId)+', '+
                         '              :PERIODO, '+
                         RetNull(vgCompromissoVencido.AnoMesLancamento)+', '+
                         '              :OBRIGATORIO, '+
                         '              :CENTRO_CUSTO_ID, '+
                         '              :CEDENTE_ID, '+
                         '              :BALANCETE_GRUPO_ID, '+
                         RetNullInteger(vgCompromissoVencido.ReservaId)+', '+
                         RetNull(vgCompromissoVencido.SituacaoGeral)+', '+
                         '              :SITUACAO_LOCAL)',2);
      with dtmControles.sqlAuxiliar do
      begin
        ParamByName('COMPROMISSO_AGENDADO_ID').AsBCD := dtmControles.GerarSequencia('T_COMPROMISSO_AGENDADO');
        ParamByName('PESSOA_ID').AsBCD               := vgCompromissoVencido.PessoaId;
        ParamByName('CONTABIL_CONTA_ID').AsBCD       := vgCompromissoVencido.ContabilContaId;
        ParamByName('ANO_MES_INICIAL').AsString      := vgCompromissoVencido.PeriodoInicial;
        ParamByName('VALOR_ATUAL').AsCurrency        := vgCompromissoVencido.Valor;
        ParamByName('VALOR_ORIGEM').AsCurrency       := vgCompromissoVencido.Valor;
        ParamByName('OBRIGATORIO').AsString          := vgCompromissoVencido.Obrigatorio;
        ParamByName('CENTRO_CUSTO_ID').AsBCD         := vgCompromissoVencido.CentroCustoId;
        ParamByName('CEDENTE_ID').AsBCD              := vgCedenteAtivo;
        ParamByName('BALANCETE_GRUPO_ID').AsBCD      := vgCompromissoVencido.BalanceteGrupoId;
        ParamByName('VALOR_ANTERIOR').AsCurrency     := 0;
        ParamByName('PERIODO').AsInteger             := vgCompromissoVencido.PeriodoTipo;
        ParamByName('SITUACAO_LOCAL').AsString       := '1';
        ExecSQL(FALSE);
      end;
    end
    else
    begin
      ExecutaSqlAuxiliar(' UPDATE T_COMPROMISSO_AGENDADO SET ' +
                         '        VALOR_ATUAL = '+ QuotedStr(TrocaVirgPPto(CurrToStr(vgCompromissoVencido.Valor))) +','+
                         '        VALOR_ANTERIOR = '+QuotedStr(TrocaVirgPPto(CurrToStr(viValorAnterior))) +
                         ' WHERE COMPROMISSO_AGENDADO_ID = ' + viCompromisoId,1);
    end;
  end;

begin
  if vpAgendado then
    if not VerificarCompromissoAgendado then
      exit;

  vgCompromissoVencido.NenhumaAlteracao := True;
  viPeriodoInicial := vgCompromissoVencido.PeriodoInicial;
  if vpVencido then
  begin
    repeat
      if VerificarCompromissoVencido then
        if ((StrToInt(vgCompromissoVencido.PeriodoInicial)) <= vgPeriodoAtual) or vpDeterminado then
        begin
          vgCompromissoVencido.NenhumaAlteracao := False;
          RegistrarCompromissoVencido;
        end;

      if (vgCompromissoVencido.PeriodoInicial = vgCompromissoVencido.PeriodoFinal) then
        viFlag := True
      else
      begin
        vgCompromissoVencido.PeriodoInicial := dtmLookup.InclementarAnoMes(vgCompromissoVencido.PeriodoInicial);
        viFlag := ((StrToInt(vgCompromissoVencido.PeriodoInicial)) > vgPeriodoAtual) and not vpDeterminado;
      end;
    until (viFlag);
  end;

  if vpAgendado then
  begin
    vgCompromissoVencido.PeriodoInicial := viPeriodoInicial;
    viProximoPeriodo := dtmLookup.InclementarAnoMes(IntToStr(vgPeriodoAtual));
    if ((StrToInt(vgCompromissoVencido.PeriodoFinal)) >= StrToInt(viProximoPeriodo))
       or (vgCompromissoVencido.PeriodoTipo in [1,4,5]) then
    begin
      if VerificarCompromissoAgendado then
      begin
        vgCompromissoVencido.NenhumaAlteracao := False;
        if viAgendadoExecutar  = 1 then
             RegistrarCompromissoAgendado
        else RegistrarCompromissoAgendado(True);
      end;
    end;
  end;

end;

procedure TdtmLookup.AtualizarParametro(vpNome, vpSecao, vpGrupo, vpSistema,
  vpValor: String);
var
  viValor : String;

  function VerificarParametroMaquina:Boolean;
  begin
    Result := dtmControles.GetStr(' SELECT NOME FROM G_CONFIG '+
                                  ' WHERE NOME = '+ QuotedStr(vpNome)+
                                  '   AND UPPER(TERMINAL) = '+ QuotedStr(Rotinas.NomeEstacao)) <> '';
  end;

begin
  if VerificarParametroMaquina then
    ExecutaSqlAuxiliar(' UPDATE G_CONFIG SET VALOR = '+ QuotedStr(vpValor)+
                       ' WHERE NOME     = '+ QuotedStr(vpNome)+
                       '   AND TERMINAL = '+ QuotedStr(Rotinas.NomeEstacao)+
                       '   AND SECAO    = '+ QuotedStr(vpSecao)+
                       '   AND CONFIG_GRUPO_ID = (SELECT CONFIG_GRUPO_ID FROM G_CONFIG_GRUPO '+
                       '                          WHERE DESCRICAO = '+QuotedStr(vpGrupo)+
                       '                            AND SISTEMA_ID = '+ vpSistema+')',1)
  else
    ExecutaSqlAuxiliar(' UPDATE G_CONFIG SET VALOR = '+ QuotedStr(vpValor)+
                       ' WHERE NOME = '+ QuotedStr(vpNome)+
                       '  AND (TERMINAL IS NULL OR TERMINAL = '+QuotedStr('')+')'+
                       '   AND SECAO    = '+ QuotedStr(vpSecao)+
                       '   AND CONFIG_GRUPO_ID = (SELECT CONFIG_GRUPO_ID FROM G_CONFIG_GRUPO '+
                       '                          WHERE DESCRICAO = '+QuotedStr(vpGrupo)+
                       '                            AND SISTEMA_ID = '+ vpSistema+')',1);
  dtmControles.sqlConfig.Refresh;

end;

procedure TdtmLookup.AtualizarTabelas;
begin
  sqlG_TB_TxModeloGrupo.Refresh;
  sqlG_Usuario.Refresh;
  sqlUsuarioSistema.Refresh;
  sqlUsuarioAssinante.Refresh;
  sqlCedenteTodos.Refresh;
  sqlCedenteAtivos.Refresh;
  sqlGrupoContabilTodos.Refresh;
  sqlGrupoContabilAtivos.Refresh;
  sqlGrupoContabilSaidas.Refresh;
  sqlGrupoContabilEntradas.Refresh;
  sqlGrupoAtivo.Refresh;
  sqlGrupoTodos.Refresh;
  sqlBalanceteGrupo.Refresh;
  sqlPlanoContasAtivo.Refresh;
  sqlPlanoContasTodos.Refresh;
  sqlPlanoContasReceitas.Refresh;
  sqlCompromissoMensal.Refresh;
  sqlPessoas.Refresh;
  sqlAssociadosAtivos.Refresh;
  sqlCentroCustoTodos.Refresh;
  sqlCentroCustoAtivo.Refresh;
  sqlCompReceitaTodos.Refresh;
  sqlPlanoContasDespesasAtivo.Refresh;
  sqlPlanoContasDespesasTodos.Refresh;
  sqlCompSaidaTodos.Refresh;
end;

procedure TdtmLookup.BuscarConficuracaoSalva(vpLocal, vpDescricao: String);
begin
  sqlConfiguracaoDados.Active := False;
  sqlConfiguracaoDados.DataSet.ParamByName('SISTEMA_ID').AsBCD   := vgId;
  sqlConfiguracaoDados.DataSet.ParamByName('LOCAL').AsString     := vpLocal;
  sqlConfiguracaoDados.DataSet.ParamByName('DESCRICAO').AsString := vpDescricao;
  sqlConfiguracaoDados.Active := True;
end;

procedure TdtmLookup.CadastrarFormRapido(vpTabela, vpCampoId: String;
  vpIdLigacao, vpIdLigacao2, vpId: Integer);
begin
  vgDadosCadastro.ChaveIdPrincipal  := vpId;
  vgDadosCadastro.ChaveIdSecundaria := vpIdLigacao;
  vgDadosCadastro.ChaveIdTerciaria  := vpIdLigacao2;

  vgDadosCadastro.CampoId := vpCampoId;
  vgDadosCadastro.Tabela  := vpTabela;
end;

function TdtmLookup.CadastrarRegBasicoGeral(vpSqlDataset: TSimpleDataSet;
  vpClientDataset: TClientDataSet; vpValorId: Variant; vpTabela, vpCampoId,
  vpValor: String; vpAtualizarValor, vpAtualizarCampo,
  vpUpper: Boolean): Integer;
var
  viID: Integer;
  viMensagem: String;

  // Verifica se o Tipo ja esta cadastrado
  function VerificarTipo(vpTipo: String): Boolean;
  var
    viTipo: Integer;
  begin
    vpTipo := AnsiUpperCase(vpTipo);
    viTipo := dtmControles.GetInt(' SELECT ' + vpCampoId + ' FROM ' + vpTabela +
      ' WHERE UPPER(DESCRICAO) = ' + QuotedStr(vpTipo) + ' AND NOT ' + vpCampoId
      + ' = ' + IntToStr(vpValorId));
    Result := viTipo > 0;
  end;

begin

  Result := 0;

  if vpValorId = null then
    vpValorId := 0;

  if length(vpValor) <= 2 then
    vpValor := '';

  if ((vpValor = '') or (vpValorId > 0)) and
    not((vpValorId > 0) and vpAtualizarValor) then
    exit;

  if dtmControles.CodPermissao('CAD_CADASTRO_RAPIDO') = '000000' then
    exit;

  if vpAtualizarValor then
    viMensagem := 'Alterar'
  else
    viMensagem := 'Cadastrar';

  repeat
    if not InputQuery(Pchar(viMensagem + ' Tipo'), 'Tipo:', vpValor) then
      exit;

    if vpValor = '' then
      Application.MessageBox('Tipo Inv�lido!!!', 'Aten��o',
        MB_OK + MB_ICONWARNING);

    if VerificarTipo(vpValor) then
    begin
      Application.MessageBox('Tipo ja Cadastrado!!!', 'Aten��o',
        MB_OK + MB_ICONWARNING);
      vpValor := '';
    end;
  until (vpValor <> '');

  if vpUpper then
    vpValor := AnsiUpperCase(vpValor);

  if ((vpValorId = 0) and (vpValor <> '')) and (not vpAtualizarValor) then
  begin
    viID := dtmControles.GerarSequencia(vpTabela);
    ExecutaSqlAuxiliar(' INSERT INTO ' + vpTabela + '(' + vpCampoId + ', ' +
      '              DESCRICAO, SITUACAO) ' + ' VALUES( ' + IntToStr(viID) + ','
      + QuotedStr(vpValor) + ',' + QuotedStr('A') + ')', 1);
  end
  else
  begin
    viID := vpValorId;
    if vpAtualizarValor then
      ExecutaSqlAuxiliar(' UPDATE ' + vpTabela + ' SET DESCRICAO = ' +
        QuotedStr(vpValor) + ' WHERE ' + vpCampoId + ' = ' +
        IntToStr(vpValorId), 1);
  end;

  ExecAtualizar;
  if vpAtualizarCampo then
    if vpSqlDataset <> nil then
      vpSqlDataset.FieldByName(vpCampoId).AsInteger := viID
    else
      vpClientDataset.FieldByName(vpCampoId).AsInteger := viID;

  Result := viID;

end;

procedure TdtmLookup.CadastrarRegBasicoGeralClient(vpSqlDataset: TClientDataSet;
  vpTabela, vpCampoId, vpValor: String);
var
  viID: Integer;
begin
  if length(vpValor) <= 1 then
    vpValor := '';

  if (vpValor = '') and (vpSqlDataset.FieldByName(vpCampoId).AsInteger = 0) then
    exit;

  if (vpSqlDataset.FieldByName(vpCampoId).AsInteger = 0) and (vpValor <> '')
  then
  begin
    viID := dtmControles.GerarSequencia(vpTabela);
    ExecutaSqlAuxiliar(' INSERT INTO ' + vpTabela + '(' + vpCampoId + ', ' +
      '              DESCRICAO, SITUACAO) ' + ' VALUES( ' + IntToStr(viID) + ','
      + QuotedStr(vpValor) + ',' + QuotedStr('A') + ')', 1);
    ExecAtualizar;
    vpSqlDataset.FieldByName(vpCampoId).AsInteger := viID;
  end;
end;

procedure TdtmLookup.CarregarCabecalho(vpBalanceteId: Integer);
begin
  sqlCabecalho.Active := False;
  sqlCabecalho.DataSet.ParamByName('BALANCETE_GRUPO_ID').AsBCD := vpBalanceteId;
  sqlCabecalho.DataSet.ParamByName('CEDENTE_ID').AsBCD         := vgCedenteAtivo;
  sqlCabecalho.Active := True;

  sqlCabecalho.Edit;
  sqlCabecalhoTEXTO_CABECALHO.AsString := DeCompressString(sqlCabecalhoCABECALHO.AsString);
  sqlCabecalho.Post;
end;

procedure TdtmLookup.CarregarConfiguracaoSalva(vpLocal: String);
begin
  sqlConfiguracaoSalva.Active := False;
  sqlConfiguracaoSalva.DataSet.ParamByName('SISTEMA_ID').AsBCD := vgId;
  sqlConfiguracaoSalva.DataSet.ParamByName('LOCAL').AsString   := vpLocal;
  sqlConfiguracaoSalva.Active := True;
end;

procedure TdtmLookup.CarregarIcxComboBox(vpValue, vpDescricao: string;
  vpIcxComboBox: TcxImageComboBox; vpImageIndex: Integer);
var
  viIndice : Integer;
begin
  viIndice := vpIcxComboBox.Properties.Items.Count;
  vpIcxComboBox.Properties.Items.Insert(viIndice);
  vpIcxComboBox.Properties.Items[viIndice].Description  := vpDescricao;
  vpIcxComboBox.Properties.Items[viIndice].Value        := vpValue;
  vpIcxComboBox.Properties.Items[viIndice].ImageIndex   := vpImageIndex;
end;

procedure TdtmLookup.CarregarPeriodo(vpComBoBox : TcxComboBox; vpTipo : Integer;
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
    vpComBoBox.Properties.Items.Add(viData);
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


  vpComBoBox.Properties.Items.Clear;
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
          vgPeriodoAtual := StrToInt(dtmLookup.InclementarAnoMes(IntToStr(vgPeriodoAtual)));
          viAno  := StrToInt(Copy(dtmControles.DataHoraBanco(4),7,4));
          viMes  := StrToInt(Copy(dtmControles.DataHoraBanco(4),4,2));
        end;
    5 : begin
          if (StrToInt(vpAnoMesInicial)) <= vgPeriodoAtual then
               vgPeriodoAtual := StrToInt(dtmLookup.InclementarAnoMes(IntToStr(vgPeriodoAtual)))
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

procedure TdtmLookup.CarregarTabBalancete(vpTabBalancete: TcxTabControl);
var
  i : Integer;
begin
  ExecutaSqlAuxiliar(' SELECT DESCRICAO, BALANCETE_GRUPO_ID '+
                     ' FROM T_BALANCETE_GRUPO '+
                     ' WHERE SITUACAO = '+QuotedStr('A')+
                     '   AND CEDENTE_ID = '+ IntToStr(vgCedenteAtivo)+
                     ' ORDER BY PRINCIPAL DESC',0);
  with dtmControles.sqlAuxiliar do
  begin
    First;
    vpTabBalancete.Tabs.Clear;
    for i := 1 to dtmControles.sqlAuxiliar.RecordCount do
    begin
      vpTabBalancete.Tabs.Add(FieldByName('DESCRICAO').AsString);
      vgTabBalancete[i-1]         := FieldByName('BALANCETE_GRUPO_ID').AsInteger;
      vgCentroCustoPrincipal[i-1] :=  dtmControles.GetInt(' SELECT CENTRO_CUSTO_ID FROM T_CENTRO_CUSTO '+
                                                     ' WHERE PRINCIPAL = ''S'''+
                                                     ' AND CEDENTE_ID = '+ IntToStr(vgCedenteAtivo)+
                                                     ' AND BALANCETE_GRUPO_ID = '+ FieldByName('BALANCETE_GRUPO_ID').AsString);
      next;
    end;
    vpTabBalancete.TabIndex := 0;
  end;
end;

procedure TdtmLookup.DataModuleCreate(Sender: TObject);
begin
  sqlG_TB_TxModeloGrupo.Connection    := dtmControles.DB;
  sqlG_Usuario.Connection             := dtmControles.DB;
  sqlUsuarioSistema.Connection        := dtmControles.DB;
  sqlUsuarioAssinante.Connection      := dtmControles.DB;
  sqlCedenteTodos.Connection          := dtmControles.DB;
  sqlCedenteAtivos.Connection         := dtmControles.DB;
  sqlGrupoContabilTodos.Connection    := dtmControles.DB;
  sqlGrupoContabilAtivos.Connection   := dtmControles.DB;
  sqlGrupoContabilSaidas.Connection   := dtmControles.DB;
  sqlGrupoContabilEntradas.Connection := dtmControles.DB;
  sqlGrupoTodos.Connection            := dtmControles.DB;
  sqlGrupoAtivo.Connection            := dtmControles.DB;
  sqlBalanceteGrupo.Connection        := dtmControles.DB;
  sqlPlanoContasAtivo.Connection      := dtmControles.DB;
  sqlPlanoContasTodos.Connection      := dtmControles.DB;
  sqlPlanoContasReceitas.Connection   := dtmControles.DB;
  sqlCompromissoMensal.Connection     := dtmControles.DB;
  sqlPessoas.Connection               := dtmControles.DB;
  sqlAssociadosAtivos.Connection      := dtmControles.DB;
  sqlCentroCustoTodos.Connection      := dtmControles.DB;
  sqlCentroCustoAtivo.Connection      := dtmControles.DB;
  sqlCompReceitaTodos.Connection      := dtmControles.DB;
  sqlPlanoContasDespesasTodos.Connection := dtmControles.DB;
  sqlPlanoContasDespesasAtivo.Connection := dtmControles.DB;
  sqlCompSaidaTodos.Connection           := dtmControles.DB;
  sqlCabecalho.Connection                := dtmControles.DB;
  sqlConfiguracaoSalva.Connection        := dtmControles.DB;
  sqlConfiguracaoDados.Connection        := dtmControles.DB;
  sqlReservasAtivas.Connection           := dtmControles.DB;

  sqlG_TB_TxModeloGrupo.Open;
  sqlG_Usuario.Open;
  sqlCedenteTodos.Open;
  sqlCedenteAtivos.Open;

  sqlUsuarioSistema.Close;
  sqlUsuarioSistema.DataSet.Params.ParamByName('SISTEMA_ID').AsBCD := vgId;
  sqlUsuarioSistema.Open;

  sqlUsuarioAssinante.Close;
  sqlUsuarioAssinante.DataSet.Params.ParamByName('SISTEMA_ID').AsBCD := vgId;
  sqlUsuarioAssinante.Open;

  sqlAssociadosAtivos.Close;
  sqlAssociadosAtivos.DataSet.ParamByName('CEDENTE_ID').AsBCD := vgCedenteAtivo;
  sqlAssociadosAtivos.Open;

  sqlGrupoAtivo.Close;
  sqlGrupoAtivo.DataSet.ParamByName('CEDENTE_ID').AsBCD := vgCedenteAtivo;
  sqlGrupoAtivo.Open;

  sqlGrupoTodos.Close;
  sqlGrupoTodos.DataSet.ParamByName('CEDENTE_ID').AsBCD := vgCedenteAtivo;
  sqlGrupoTodos.Open;

  sqlBalanceteGrupo.Close;
  sqlBalanceteGrupo.DataSet.ParamByName('CEDENTE_ID').AsBCD := vgCedenteAtivo;
  sqlBalanceteGrupo.Open;

  sqlGrupoContabilTodos.Close;
  sqlGrupoContabilTodos.DataSet.ParamByName('CEDENTE_ID').AsBCD := vgCedenteAtivo;
  sqlGrupoContabilTodos.Open;

  sqlGrupoContabilAtivos.Close;
  sqlGrupoContabilAtivos.DataSet.ParamByName('CEDENTE_ID').AsBCD := vgCedenteAtivo;
  sqlGrupoContabilAtivos.Open;

  sqlGrupoContabilEntradas.Close;
  sqlGrupoContabilEntradas.DataSet.ParamByName('CEDENTE_ID').AsBCD := vgCedenteAtivo;
  sqlGrupoContabilEntradas.Open;

  sqlGrupoContabilSaidas.Close;
  sqlGrupoContabilSaidas.DataSet.ParamByName('CEDENTE_ID').AsBCD := vgCedenteAtivo;
  sqlGrupoContabilSaidas.Open;

  sqlCentroCustoTodos.Close;
  sqlCentroCustoTodos.DataSet.ParamByName('CEDENTE_ID').AsBCD := vgCedenteAtivo;
  sqlCentroCustoTodos.Open;

  sqlCentroCustoAtivo.Close;
  sqlCentroCustoAtivo.DataSet.ParamByName('CEDENTE_ID').AsBCD := vgCedenteAtivo;
  sqlCentroCustoAtivo.Open;

  sqlPlanoContasAtivo.Close;
  sqlPlanoContasAtivo.DataSet.ParamByName('CEDENTE_ID').AsBCD := vgCedenteAtivo;
  sqlPlanoContasAtivo.Open;

  sqlPlanoContasTodos.Close;
  sqlPlanoContasTodos.DataSet.ParamByName('CEDENTE_ID').AsBCD := vgCedenteAtivo;
  sqlPlanoContasTodos.Open;

  sqlPlanoContasReceitas.Close;
  sqlPlanoContasReceitas.DataSet.ParamByName('CEDENTE_ID').AsBCD := vgCedenteAtivo;
  sqlPlanoContasReceitas.Open;

  sqlCompromissoMensal.Close;
  sqlCompromissoMensal.DataSet.ParamByName('CEDENTE_ID').AsBCD := vgCedenteAtivo;
  sqlCompromissoMensal.Open;

  sqlPessoas.Close;
  sqlPessoas.DataSet.ParamByName('CEDENTE_ID').AsBCD := vgCedenteAtivo;
  sqlPessoas.Open;

  sqlCompReceitaTodos.Close;
  sqlCompReceitaTodos.DataSet.ParamByName('CEDENTE_ID').AsBCD := vgCedenteAtivo;
  sqlCompReceitaTodos.Open;

  sqlPlanoContasDespesasTodos.Close;
  sqlPlanoContasDespesasTodos.DataSet.ParamByName('CEDENTE_ID').AsBCD := vgCedenteAtivo;
  sqlPlanoContasDespesasTodos.Open;

  sqlPlanoContasDespesasAtivo.Close;
  sqlPlanoContasDespesasAtivo.DataSet.ParamByName('CEDENTE_ID').AsBCD := vgCedenteAtivo;
  sqlPlanoContasDespesasAtivo.Open;

  sqlCompSaidaTodos.Close;
  sqlCompSaidaTodos.DataSet.ParamByName('CEDENTE_ID').AsBCD := vgCedenteAtivo;
  sqlCompSaidaTodos.Open;

  sqlReservasAtivas.Close;
  sqlReservasAtivas.DataSet.Params.ParamByName('CEDENTE_ID').AsBCD := vgCedenteAtivo;
  sqlReservasAtivas.Open;
end;

procedure TdtmLookup.DataModuleDestroy(Sender: TObject);
begin
  sqlG_TB_TxModeloGrupo.Close;
  sqlG_Usuario.Close;
  sqlCedenteTodos.Close;
  sqlCedenteAtivos.Close;
  sqlGrupoContabilTodos.Close;
  sqlGrupoContabilAtivos.Close;
  sqlGrupoContabilEntradas.Close;
  sqlGrupoContabilSaidas.Close;
  sqlGrupoTodos.Close;
  sqlGrupoAtivo.Close;
  sqlBalanceteGrupo.Close;
  sqlPlanoContasAtivo.Close;
  sqlPlanoContasTodos.Close;
  sqlPlanoContasReceitas.Close;
  sqlCompromissoMensal.Close;
  sqlPessoas.Close;
  sqlAssociadosAtivos.Close;
  sqlCentroCustoAtivo.Close;
  sqlCentroCustoTodos.Close;
  sqlCompReceitaTodos.Close;
  sqlPlanoContasDespesasTodos.Close;
  sqlPlanoContasDespesasAtivo.Close;
  sqlCompSaidaTodos.Close;
  sqlBalanceteGrupo.Close;
end;

function TdtmLookup.DeclementarAnoMes(vpAnoMes : String; vpQtd : Integer = 1):String;
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

procedure TdtmLookup.ExportarExcel(vpGrid : TcxGrid);
begin
  ExportGridToExcel('C:\TEMP\RELTEMP.XLS', vpGrid);
  AbrirPlanilha();
end;

procedure TdtmLookup.FiltrarGrupoContasBalancete(vpSimpleDataSet : TSimpleDataSet; vpBalanceteId : Integer;
           vpFiltrar : Boolean);
begin
  vpSimpleDataSet.Filtered := False;
  vpSimpleDataSet.Filter   := 'BALANCETE_GRUPO_ID = '+ IntToStr(vpBalanceteId);
  vpSimpleDataSet.Filtered := True;
end;

function TdtmLookup.FormatarAnoMes(vpAnoMes : String; vpTirarBarra : String = ''):String;
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

procedure TdtmLookup.GerarBoleto(vpData: String; vpTodos: Boolean; vpPessoa,
  vpGrupo: String);
begin


end;

procedure TdtmLookup.GravarConfiguracaoSalva(vpLocal, vpDescricao, vpValor,
  vpOrdem: Variant);
var
  viRelatorio : Integer;
begin
  if vpOrdem = '0' then
  begin
    viRelatorio := dtmControles.GetInt(' SELECT CONFIGURACAO_SALVA_ID FROM G_CONFIGURACAO_SALVA '+
                                       ' WHERE LOCAL ='+QuotedStr(vpLocal)+
                                       '   AND DESCRICAO = '+QuotedStr(vpDescricao)+
                                       '   AND ORDEM = '+QuotedStr('0')+
                                       '   AND SISTEMA_ID = '+IntToStr(vgId));
    if viRelatorio > 0  then
    begin
      Application.MessageBox('Ja existe uma Configura��o com este Nome!!!', 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      Abort;
    end;
  end;

  ExecutaSqlAuxiliar(' INSERT INTO G_CONFIGURACAO_SALVA( '+
                     '              CONFIGURACAO_SALVA_ID, '+
                     '              SISTEMA_ID, '+
                     '              DESCRICAO, '+
                     '              LOCAL, ' +
                     '              ORDEM, ' +
                     '              VALOR) '+
                     ' VALUES(      :CONFIGURACAO_SALVA_ID, '+
                     '              :SISTEMA_ID, '+
                     '              :DESCRICAO, '+
                     '              :LOCAL, '+
                     '              :ORDEM, '+
                     '              :VALOR)',2);
  with dtmControles.sqlAuxiliar do
  begin
    ParamByName('CONFIGURACAO_SALVA_ID').AsBCD  := dtmControles.GerarSequencia('G_CONFIGURACAO_SALVA');
    ParamByName('SISTEMA_ID').AsBCD             := vgId;
    ParamByName('DESCRICAO').AsString           := vpDescricao;
    ParamByName('LOCAL').AsString               := vpLocal;
    ParamByName('ORDEM').AsString               := vpOrdem;
    if vpValor <> NULL then
         ParamByName('VALOR').AsString          := VarToStr(vpValor)
    else ParamByName('VALOR').AsString          := '';
    ExecSQL(FALSE);
  end;
  sqlConfiguracaoSalva.Refresh;
end;

Function TdtmLookup.InclementarAnoMes(vpAnoMes : String):String;
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

procedure TdtmLookup.LerDadadosConfigEmail(vpTabela: String);
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

procedure TdtmLookup.MarcarDesmarcarCompromissos(vpSqlDataSet: TSimpleDataSet;
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

procedure TdtmLookup.MarcarDesmarcarItensSimpleDataSet(vpMarcar: String;
  vpSimpleDataset: TSimpleDataSet);
var
  viPosicao: Integer;
begin
  Screen.Cursor := crHourGlass;
  viPosicao := vpSimpleDataset.RecNo;
  vpSimpleDataset.DisableControls;
  vpSimpleDataset.First;
  while not vpSimpleDataset.Eof do
  begin
    vpSimpleDataset.FieldByName('CALC_SELECIONADO').ReadOnly := False;
    vpSimpleDataset.Edit;
    vpSimpleDataset.FieldByName('CALC_SELECIONADO').AsBoolean := vpMarcar = 'S';
    vpSimpleDataset.Next;
  end;
  vpSimpleDataset.First;
  vpSimpleDataset.EnableControls;
  vpSimpleDataset.RecNo := viPosicao;
  Screen.Cursor := crDefault;
end;

function TdtmLookup.PegarAnoMes(vpData: String): Integer;
begin
  result := StrToInt((copy(vpData,7,4)) + (copy(vpData,4,2)));
end;

function TdtmLookup.PegarVencimentoPadrao(vpDia: String): String;
var
  viAno, viMes : string;
begin
  viAno  := copy(IntToStr(vgPeriodoAtual),1,4);
  viMes  := copy(IntToStr(vgPeriodoAtual),5,2);
  Result := vpDia+'/'+viMes+'/'+viAno;
end;

procedure TdtmLookup.UpdateSimplesTabela(vpTabela, vpCampoAtualiza,
  vpCondicaoExtra, vpValor, vpId: String);
begin
  ExecutaSqlAuxiliar(' UPDATE '+ vpTabela + ' SET '+ vpCampoAtualiza + ' = '+ vpValor+
                     ' WHERE '+ copy(vpTabela,3,30)+'_ID ='+ vpId + vpCondicaoExtra,1)
end;

procedure TdtmLookup.ValidarIntervalodeAnoMes(vpAnoMesInicial, vpAnoMesFinal: TcxComboBox; vpPeriodo : String);
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

function TdtmLookup.VefificaExistenciaBoleto(vpPessoaId : String):Boolean;
begin
  ExecutaSqlAuxiliar(' SELECT BOLETA_ID FROM T_COMPROMISSO_VENCIDO '+
                     ' WHERE NOT BOLETA_ID IS NULL '+
                     '   AND SITUACAO = ''1'''+
                     '   AND PESSOA_ID = '+ vpPessoaId+
                     '   AND CEDENTE_ID = '+ IntToStr(vgCedenteAtivo),0);
  result := not dtmControles.sqlAuxiliar.IsEmpty;
end;

procedure TdtmLookup.VerificarEdicao(vpReferencia, vpOperacao : String);
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

function TdtmLookup.VerificarPastaImagem(vpPastaImagem: string;
  vpNumero: Integer; vpVerificarExistencia: Boolean): Boolean;
begin
  vgDadosImagem.LocalImagem := dtmControles.BuscarConfig('IMAGEM', 'GERAL', 'LOCAL_IMAGEM', 'S');

  vgDadosImagem.Pasta := Trim(vgDadosImagem.LocalImagem +'\'+vpPastaImagem);
  if ((vgDadosImagem.Pasta = '') or (not DirectoryExists(vgDadosImagem.Pasta))) and (not vpVerificarExistencia) then
  begin
    Application.MessageBox(PChar('Local de Imagens de '+ vpPastaImagem+' n�o encontrado!!!'), 'Erro', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    Screen.Cursor := crDefault;
    Result := False;
    exit;
  end;

  vgDadosImagem.SubPasta := Copy(FormatFloat('000000',vpNumero),1,3);
  if Copy(vgDadosImagem.Pasta,Length(vgDadosImagem.Pasta),1) <> '\' then
    vgDadosImagem.Pasta := vgDadosImagem.Pasta + '\';
  vgDadosImagem.Pasta := vgDadosImagem.Pasta + vgDadosImagem.SubPasta + '\';

  if vpVerificarExistencia then
    exit;

  if not DirectoryExists(vgDadosImagem.Pasta) then
    MkDir(vgDadosImagem.Pasta);
  Result := True;
end;

procedure TdtmLookup.VerificarProgramacaoAjuste(vpCompromissoAgendadoId,
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