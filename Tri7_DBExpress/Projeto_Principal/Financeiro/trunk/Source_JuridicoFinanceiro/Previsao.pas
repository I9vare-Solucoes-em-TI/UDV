unit Previsao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinscxPCPainter, Menus, cxLookAndFeelPainters, cxGraphics, cxStyles,
  cxSchedulerStorage, cxSchedulerCustomControls, cxSchedulerDateNavigator,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxTextEdit, cxCurrencyEdit, cxCalendar, cxSplitter, cxGridChartView,
  cxGridDBChartView, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxDateNavigator, cxGroupBox, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  Buttons, cxLabel, cxMaskEdit, cxDropDownEdit, StdCtrls, cxButtons,
  cxContainer, ExtCtrls, cxPC, cxBarEditItem, dxBar, dxBarExtItems, ImgList,
  DBClient, SimpleDS, cxBlobEdit, cxRichEdit, cxTimeEdit, dxSkinsCore,
  dxSkinMcSkin, dxSkinOffice2007Silver, cxImageComboBox, dxSkinsdxBarPainter,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxTL,
  cxInplaceContainer, cxDBTL, cxTLData, DateUtils, cxGridCardView,
  cxGridDBCardView, cxGridBandedTableView, dxSkinBlueprint, dxSkinDarkRoom,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinHighContrast, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSpringTime, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  cxPCdxBarPopupMenu, cxLookAndFeels, cxNavigator, cxTLdxBarBuiltInMenu,
  ComCtrls, dxCore, cxDateUtils, cxGridCustomLayoutView, IniFiles, cxScheduler,
  cxSchedulerCustomResourceView, cxSchedulerDayView, cxSchedulerHolidays,
  cxSchedulerTimeGridView, cxSchedulerUtils, cxSchedulerWeekView,
  cxSchedulerYearView, cxSchedulerGanttView, dxSkinscxSchedulerPainter,
  cxSchedulerDBStorage, dxmdaset, cxCheckBox, jpeg, dxSkinDevExpressDarkStyle,
  cxSchedulerTreeListBrowser, dxBarBuiltInMenu, DbxDevartInterBase, cxGridExportLink,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, cxImage, interfaceDll, InterfaceDataSnap, frxClass,
  frxDBSet, cxMemo;

type
  TfrmPrevisao = class(TForm)
    dxBarManager1: TdxBarManager;
    dxBarManager1BarFinanceiro: TdxBar;
    dxBarProgressPrevisaoSaldo: TdxBarProgressItem;
    dxBarProgressSaldoAtual: TdxBarProgressItem;
    dxBarlblPrevisaoSaldo: TdxBarStatic;
    dxBarSubItem2: TdxBarSubItem;
    dxBarColunaSaldo: TdxBarButton;
    dxBarTarefasPendentes: TdxBarStatic;
    dxBarlblSaldoAtual: TdxBarStatic;
    dxBarServicosAtivos: TdxBarStatic;
    dxBarServicosAContratar: TdxBarStatic;
    dxBarTarefasAVencer: TdxBarStatic;
    dxBarData: TdxBarStatic;
    dxBarEditNumero: TdxBarEdit;
    cxBarEditItemPesquisar: TcxBarEditItem;
    dxBarButtonPesquisar: TdxBarButton;
    tabExibir: TcxTabControl;
    pgcPrevisao: TcxPageControl;
    tabPrevisaoFinanceira: TcxTabSheet;
    Panel5: TPanel;
    Panel8: TPanel;
    pnlPrevisao: TPanel;
    Panel12: TPanel;
    tbcPrevisao: TcxTabControl;
    imageExibir: TImageList;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    dxBarCombo1: TdxBarCombo;
    dxBarCombo2: TdxBarCombo;
    dtsFinanceiroCompromisso: TDataSource;
    pgcPagamentoRepasse: TcxPageControl;
    ClientCaixa: TClientDataSet;
    dtsCaixa: TDataSource;
    pnlTitulo: TPanel;
    Panel3: TPanel;
    Panel6: TPanel;
    sbnImprimirPrevisao: TSpeedButton;
    lblPrevisao: TcxLabel;
    Panel9: TPanel;
    cxLabel6: TcxLabel;
    lcbConta: TcxLookupComboBox;
    ClientCaixaCAIXA_ID: TIntegerField;
    ClientCaixaPRINCIPAL: TStringField;
    ClientCaixaVALOR: TCurrencyField;
    ClientCaixaPESSOA_ID: TIntegerField;
    ClientCaixaDESCRICAO: TStringField;
    ClientCaixaSITUACAO: TStringField;
    cxStyleRepository3: TcxStyleRepository;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyleDestaque: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    cxStyle48: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    GridCardViewStyleSheetDevExpress: TcxGridCardViewStyleSheet;
    GridTableViewStyleSheetLigth: TcxGridTableViewStyleSheet;
    cxGridBandedTableViewStyleSheet1: TcxGridBandedTableViewStyleSheet;
    cxTreeListStyleSheet1: TcxTreeListStyleSheet;
    lcxFiltroTarefa: TcxBarEditItem;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    pgcModulos: TcxPageControl;
    cxSplitterTexto: TcxSplitter;
    dxBarGrid0: TdxBarButton;
    dxBarGrid1: TdxBarButton;
    dxBarGrid2: TdxBarButton;
    dxBarGrid3: TdxBarButton;
    SchedulerDBStorage: TcxSchedulerDBStorage;
    Panel2: TPanel;
    cxBtnFechar: TcxButton;
    tabSaldo: TcxTabSheet;
    Panel10: TPanel;
    icxVisualizacao: TcxComboBox;
    cxgCaixa: TcxGrid;
    cvCaixa: TcxGridDBCardView;
    cvCaixaRow1: TcxGridDBCardViewRow;
    cvCaixaRow2: TcxGridDBCardViewRow;
    cvCaixaRow3: TcxGridDBCardViewRow;
    lvLivro: TcxGridLevel;
    cxgCaixaLevel: TcxGridLevel;
    cxgCaixaDBTableView1: TcxGridDBTableView;
    cxgCaixaDBTableView1Column1: TcxGridDBColumn;
    cxgCaixaDBTableView1Column2: TcxGridDBColumn;
    cxgCaixaDBTableView1Column3: TcxGridDBColumn;
    btnLimparCaixa: TcxButton;
    ClientListaCaixa: TClientDataSet;
    dtsListaCaixa: TDataSource;
    ClientListaCaixaCAIXA_ID: TIntegerField;
    ClientListaCaixaDESCRICAO: TStringField;
    gbxSomaItensSelecionados: TcxGroupBox;
    edtValorSomaSelecionados: TcxCurrencyEdit;
    ClientCaixaRESUMO: TStringField;
    ClientListaCaixaRESUMO: TStringField;
    PopupAjuste: TPopupMenu;
    mniSaltarLancamento: TMenuItem;
    N1: TMenuItem;
    mniAlterarvalorPrevisto: TMenuItem;
    GerarBoleto: TMenuItem;
    ExportarExcel1: TMenuItem;
    mniBoleto: TMenuItem;
    VisualizarImprimirBoleto: TMenuItem;
    dxSaldoAtual: TdxBarStatic;
    dxPrevisaoSaldo: TdxBarStatic;
    N3: TMenuItem;
    mniTransferirOrcamento: TMenuItem;
    mniFinalizarOramento: TMenuItem;
    tabFavoritos: TcxTabSheet;
    grdBasica: TcxGrid;
    grdBasicaDBTableView1: TcxGridDBTableView;
    grdBasicaDBTableContabilConta: TcxGridDBColumn;
    grdBasicaDBTableHistorico: TcxGridDBColumn;
    grdBasicaLevel1: TcxGridLevel;
    dtsLancamentoFavorito: TDataSource;
    sqlLancamentoFavorito: TSimpleDataSet;
    grdBasicaDBTablePessoa: TcxGridDBColumn;
    grdBasicaDBTableView1Column1: TcxGridDBColumn;
    sqlFinanceiroCompromisso: TSimpleDataSet;
    sqlFinanceiroCompromissoLIVRO_FINANCEIRO_ID: TFMTBCDField;
    sqlFinanceiroCompromissoDATA_VENCIMENTO: TSQLTimeStampField;
    sqlFinanceiroCompromissoVALOR_AGENDADO: TFMTBCDField;
    sqlFinanceiroCompromissoSITUACAO: TStringField;
    sqlFinanceiroCompromissocalc_Referencia: TStringField;
    sqlFinanceiroCompromissoCONTABIL_CONTA_ID: TFMTBCDField;
    sqlFinanceiroCompromissoCENTRO_CUSTO_ID: TFMTBCDField;
    sqlFinanceiroCompromissoANO_MES_REFERENCIA: TStringField;
    sqlFinanceiroCompromissoBALANCETE_GRUPO_ID: TFMTBCDField;
    tt: TStringField;
    sqlFinanceiroCompromissoBOLETA_ID: TFMTBCDField;
    sqlFinanceiroCompromissoATUALIZADO: TStringField;
    sqlFinanceiroCompromissoOPERACAO: TStringField;
    sqlFinanceiroCompromissoPESSOA_ID: TFMTBCDField;
    sqlFinanceiroCompromissocalc_Selecionado: TBooleanField;
    sqlFinanceiroCompromissoVALOR_DOCUMENTO: TFMTBCDField;
    sqlFinanceiroCompromissoCALC_VALOR_RECEBER: TCurrencyField;
    sqlFinanceiroCompromissocalc_Observacao: TStringField;
    sqlFinanceiroCompromissoCALC_GRUPO: TStringField;
    sqlFinanceiroCompromissoNOME: TStringField;
    sqlFinanceiroCompromissocalc_TipoFinanceiro: TStringField;
    sqlFinanceiroCompromissoHISTORICO: TStringField;
    sqlFinanceiroCompromissoOBSERVACAO: TStringField;
    sqlFinanceiroCompromissoLIVRO_AGENDAMENTO_ID: TFMTBCDField;
    sqlFinanceiroCompromissoPROCESSO_CONTRATO_ITEM_ID: TFMTBCDField;
    sqlFinanceiroCompromissocalc_Entrada: TCurrencyField;
    sqlFinanceiroCompromissocalc_saida: TCurrencyField;
    sqlFinanceiroCompromissoIR: TStringField;
    sqlFinanceiroCompromissoCNJ: TStringField;
    sqlFinanceiroCompromissoCAIXA_ID: TFMTBCDField;
    sqlFinanceiroCompromissoDOCUMENTO_NUMERO: TStringField;
    sqlFinanceiroCompromissoREGISTRO_PARCIAL: TStringField;
    sqlFinanceiroCompromissoVALOR_PAGO_SOMA: TFMTBCDField;
    sqlFinanceiroCompromissoUTILIZA_BOLETO: TStringField;
    sqlFinanceiroCompromissoORCAMENTO_ID: TFMTBCDField;
    sqlFinanceiroCompromissoVALOR_ORCAMENTO_COMPROMETIDO: TFMTBCDField;
    sqlFinanceiroCompromissoVALOR_ORCAMENTO_PAGO: TFMTBCDField;
    sqlFinanceiroCompromissocalc_caixa: TIntegerField;
    sqlFinanceiroCompromissocalc_compromisso: TIntegerField;
    sqlFinanceiroCompromissocalc_historico: TStringField;
    sqlFinanceiroCompromissocalc_nome: TStringField;
    sqlFinanceiroCompromissocalc_orcamento: TBooleanField;
    sqlFinanceiroCompromissoVALOR_RESERVA_ENTRADA: TFMTBCDField;
    sqlFinanceiroCompromissoVALOR_RESERVA_SAIDA: TFMTBCDField;
    sqlFinanceiroCompromissoCALC_SALDO: TCurrencyField;
    sqlFinanceiroCompromissoPERIODO: TStringField;
    sqlFinanceiroCompromissoPARCELA: TFMTBCDField;
    sqlFinanceiroCompromissoQTD: TFMTBCDField;
    sqlFinanceiroCompromissoPARCELA_INICIAL: TFMTBCDField;
    sqlFinanceiroCompromissoCALC_PARCELA: TStringField;
    sqlFinanceiroCompromissoDOC_TIPO: TStringField;
    sqlFinanceiroCompromissoREFERENCIA_PERIODO: TStringField;
    sqlLancamentoFavoritoLIVRO_CAIXA_ID: TFMTBCDField;
    sqlLancamentoFavoritoCAIXA_ID: TFMTBCDField;
    sqlLancamentoFavoritoVALOR: TFMTBCDField;
    sqlLancamentoFavoritoOPERACAO: TStringField;
    sqlLancamentoFavoritoPESSOA_ID: TFMTBCDField;
    sqlLancamentoFavoritoDATA_PAGAMENTO: TSQLTimeStampField;
    sqlLancamentoFavoritoREFERENCIA: TStringField;
    sqlLancamentoFavoritoOBSERVACAO: TStringField;
    sqlLancamentoFavoritoCONTABIL_CONTA_ID: TFMTBCDField;
    sqlLancamentoFavoritoCENTRO_CUSTO_ID: TFMTBCDField;
    sqlLancamentoFavoritoESPECIE: TStringField;
    sqlLancamentoFavoritoDOCUMENTO_DESCRICAO: TStringField;
    sqlLancamentoFavoritoBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlLancamentoFavoritoLIVRO_FINANCEIRO_ID: TFMTBCDField;
    sqlLancamentoFavoritoHISTORICO: TStringField;
    sqlLancamentoFavoritoANO_MES_REGISTRO: TStringField;
    sqlLancamentoFavoritoDATA_VENCIMENTO: TSQLTimeStampField;
    sqlLancamentoFavoritoSITUACAO: TStringField;
    sqlLancamentoFavoritoCAIXA_TRANSFERENCIA_ID: TFMTBCDField;
    sqlLancamentoFavoritoIR: TStringField;
    sqlLancamentoFavoritoCNJ: TStringField;
    sqlLancamentoFavoritoCONTABIL_GRUPO_ID: TFMTBCDField;
    sqlLancamentoFavoritoDOCUMENTO_NUMERO: TStringField;
    sqlLancamentoFavoritoAUTOMATICO: TStringField;
    sqlLancamentoFavoritoCODIGO_FINALIZACAO: TFMTBCDField;
    sqlLancamentoFavoritoORCAMENTO_ID: TFMTBCDField;
    sqlLancamentoFavoritoDOC_TIPO: TStringField;
    sqlLancamentoFavoritoDATA_LANCAMENTO: TSQLTimeStampField;
    sqlLancamentoFavoritoFAVORITO_SITUACAO: TStringField;
    sqlLancamentoFavoritoFAVORITO_VALOR: TFMTBCDField;
    Panel4: TPanel;
    btnRealizarLancamento: TcxButton;
    btnExcluirFavorito: TcxButton;
    sqlFinanceiroCompromissoNOSSO_NUMERO: TFMTBCDField;
    sqlFinanceiroCompromissoIDENTIFICACAO: TStringField;
    sqlFinanceiroCompromissoTIPO: TStringField;
    sqlFinanceiroCompromissoTIPO_MODALIDADE_ID: TFMTBCDField;
    N4: TMenuItem;
    mniRegistrarTodosSelecionados: TMenuItem;
    sqlFinanceiroCompromissoTIPO_CARGA_ID: TFMTBCDField;
    sqlFinanceiroCompromissoSITUACAO_COMISSAO: TStringField;
    pgcFinanceiroPrevisao: TcxPageControl;
    tabPequisaPersonalizada: TcxTabSheet;
    tabPequisaPrevisao: TcxTabSheet;
    pnlPesquisaPErsonalizada: TPanel;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    edtPalavraPesquisa: TcxTextEdit;
    icxTipoCredito: TcxImageComboBox;
    Panel7: TPanel;
    btnPesquisar: TcxButton;
    btnLimpar: TcxButton;
    pnlPeriodoPersonalizado: TPanel;
    cxLabel10: TcxLabel;
    edtDataInicial: TcxDateEdit;
    cxLabel3: TcxLabel;
    edtDataFinal: TcxDateEdit;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    cxGridDBTableView1Column3: TcxGridDBColumn;
    cxGridDBTableView1Column4: TcxGridDBColumn;
    cxGridDBTableView1Column5: TcxGridDBColumn;
    cxGridDBTableView1Column6: TcxGridDBColumn;
    cxGridDBTableView1Column7: TcxGridDBColumn;
    sqlFinanceiroAgrupada: TSimpleDataSet;
    dtsFinanceiroAgrupada: TDataSource;
    sqlFinanceiroAgrupadaVALOR: TFMTBCDField;
    sqlFinanceiroAgrupadaNOME: TStringField;
    sqlFinanceiroAgrupadaIDENTIFICACAO: TStringField;
    sqlFinanceiroAgrupadaTIPO_CARGA_ID: TFMTBCDField;
    sqlFinanceiroAgrupadaCENTRO_CUSTO_ID: TFMTBCDField;
     sqlFinanceiroAgrupadaOPERACAO: TStringField;
    sqlFinanceiroAgrupadaBALANCETE_GRUPO_ID: TFMTBCDField;
    ClientPrevisaoResumida: TClientDataSet;
    dtsPrevisaoResumida: TDataSource;
    ClientPrevisaoResumidaVALOR_D: TCurrencyField;
    ClientPrevisaoResumidaVALOR_R: TCurrencyField;
    ClientPrevisaoResumidaVALOR_PAGO: TCurrencyField;
    ClientPrevisaoResumidaVALOR_RECEBIDO: TCurrencyField;
    ClientPrevisaoResumidaDIFERENCA_MES: TCurrencyField;
    ClientPrevisaoResumidaPORCENTO_DESPESAS: TCurrencyField;
    ClientPrevisaoResumidaSALDO_PREVISTO: TCurrencyField;
    ClientPrevisaoResumidaANO: TIntegerField;
    ClientPrevisaoResumidaANOMES: TStringField;
    ClientPrevisaoResumidaMES: TIntegerField;
    ClientPrevisaoResumidaPERIODO: TStringField;
    ClientPrevisaoResumidaVALOR_O: TCurrencyField;
    ClientPrevisaoResumidaVALOR_AD: TCurrencyField;
    ClientPrevisaoResumidaVALOR_AR: TCurrencyField;
    ClientPrevisaoResumidaVALOR_RETIRADA: TCurrencyField;
    ClientPrevisaoResumidaVALOR_APORTE: TCurrencyField;
    ClientPrevisaoResumidaPORCENTO_RETIRADA: TCurrencyField;
    cxTabSheet1: TcxTabSheet;
    cxDBTreeList1: TcxDBTreeList;
    cxDBTreeList1cxDBTreeListColumn14: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn12: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn13: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn3: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn4: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn5: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn6: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn7: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn8: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn9: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn10: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn11: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn15: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn16: TcxDBTreeListColumn;
    Panel11: TPanel;
    chxMostar12: TcxCheckBox;
    popAlterarIdentificacao: TPopupMenu;
    MenuItem1: TMenuItem;
    sqlFinanceiroAgrupadaPESSOA_ID: TFMTBCDField;
    cxGridDBTableView1Column8: TcxGridDBColumn;
    sqlFinanceiroAgrupadaCALC_ENTRADAS: TCurrencyField;
    sqlFinanceiroAgrupadaCALC_SAIDAS: TCurrencyField;
    sqlFinanceiroCompromissoCALC_CENTROCUSTO: TIntegerField;
    sqlFinanceiroCompromissoCONFERIDO: TStringField;
    mniRegistrarTodosConferidos: TMenuItem;
    sqlLancamentoFavoritoTIPO_MODALIDADE_ID: TFMTBCDField;
    sqlLancamentoFavoritoTIPO_CARGA_ID: TFMTBCDField;
    sqlFinanceiroCompromissoCENTRO_RESERVA_ID: TFMTBCDField;
    sqlLancamentoFavoritoCENTRO_RESERVA_ID: TFMTBCDField;
    PopCaucaia: TPopupMenu;
    mniRealizarFechamento: TMenuItem;
    mniDevolverItem: TMenuItem;
    mniCancelarFaturamento: TMenuItem;
    N2: TMenuItem;
    mniItensVinculado: TMenuItem;
    frxDBDatasetPrevisao: TfrxDBDataset;
    sqlLancamentoFavoritoORDEM: TFMTBCDField;
    sqlLancamentoFavoritoFATURAMENTO: TStringField;
    mniAlterarDataVencimento: TMenuItem;
    N5: TMenuItem;
    sqlFinanceiroCompromissoATIVADO: TStringField;
    tbcPagamentos: TcxTabControl;
    pgcDadosPrevisao: TcxPageControl;
    tbcDadosDetalhado: TcxTabSheet;
    tbcDadosResumido: TcxTabSheet;
    pnlPesquisaExtra: TPanel;
    cxLabel2: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel11: TcxLabel;
    gdrCompromissoAgendado: TcxGrid;
    cxGridDBTablePrevisao: TcxGridDBTableView;
    cxGridDBTableCompromissoDataPrevista: TcxGridDBColumn;
    cxGridDBTablePrevisaoProtocolo: TcxGridDBColumn;
    cxGridDBTableViewSitComissao: TcxGridDBColumn;
    cxGridDBTableCompromissoCaixa: TcxGridDBColumn;
    cxGridDBTableViewCentroCusto: TcxGridDBColumn;
    cxGridDBTableViewModalidade: TcxGridDBColumn;
    cxGridDBTableCompromissoClienteGeral: TcxGridDBColumn;
    cxGridDBTablePrevisaoIdentificacao: TcxGridDBColumn;
    cxGridDBTablePrevisaoOrcamento: TcxGridDBColumn;
    cxGridDBTableCompromissoCompromisso: TcxGridDBColumn;
    cxGridDBTablePrevisaoHistorico: TcxGridDBColumn;
    cxGridDBTablePrevisaoOperacao: TcxGridDBColumn;
    cxGridDBTableCompromissoEntrada: TcxGridDBColumn;
    cxGridDBTableCompromissoSaida: TcxGridDBColumn;
    cxGridDBTablePrevisaoParcela: TcxGridDBColumn;
    cxGridDBTableCompromissoEspecie: TcxGridDBColumn;
    cxGridDBTableCompromissoReferencia: TcxGridDBColumn;
    cxGridDBTableGrupo: TcxGridDBColumn;
    cxGridDBTableCompromissoBoleto: TcxGridDBColumn;
    cxGridDBTableViewObservacao: TcxGridDBColumn;
    cxGridDBTableViewSaldo: TcxGridDBColumn;
    cxGridDBTablePrevisaoConferido: TcxGridDBColumn;
    cxGridDBTableViewSelecionar: TcxGridDBColumn;
    cxGridLevel7: TcxGridLevel;
    gdrCompromissoResumido: TcxGrid;
    cxGridDBTablePrevResumida: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBCaixaLancamento: TcxGridDBColumn;
    cxGridDBCliente: TcxGridDBColumn;
    cxGridDBHistorico: TcxGridDBColumn;
    cxGridDBColumn16: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    cxGridDBTablePrevValorRegistrar: TcxGridDBColumn;
    sqlFinanceiroCompromissocalc_ValorRegistrar: TCurrencyField;
    cxGridDBTablePrevResumidaColumn2: TcxGridDBColumn;
    N6: TMenuItem;
    mniIraoAgendamento: TMenuItem;
    gbxListaProtocolo: TcxGroupBox;
    memListaProtocolo: TcxMemo;
    cxLabel12: TcxLabel;
    lcxCentroCusto: TcxLookupComboBox;
    lcxTipoCarga: TcxLookupComboBox;
    lcxCompromisso: TcxLookupComboBox;
    lcxModalidade: TcxLookupComboBox;
    lcxFavorecido: TcxLookupComboBox;
    lcxGrupo: TcxLookupComboBox;
    sqlFinanceiroAgrupadaCALC_ORCAMENTOS: TCurrencyField;
    cxGridDBTableView1Column9: TcxGridDBColumn;
    sqlLancamentoFavoritoVALOR_DESCONTO: TFMTBCDField;
    sqlLancamentoFavoritoVALOR_JUROS: TFMTBCDField;
    sqlLancamentoFavoritoVALOR_MULTA: TFMTBCDField;
    sqlLancamentoFavoritoOBSERVACAO_MONETARIA: TStringField;
    sqlLancamentoFavoritoVALOR_OUTRA_DEDUCAO: TFMTBCDField;
    sqlLancamentoFavoritoVALOR_FATURADO: TFMTBCDField;
    dxBarSaldoExcluido: TdxBarCombo;
    chxSomarExcluido: TcxBarEditItem;
    ClientCaixaPREVISAO_SALDO: TStringField;
    ClientListaCaixaPREVISAO_SALDO: TStringField;
    sqlFinanceiroCompromissoCONTABIL_RL: TStringField;
    N7: TMenuItem;
    mniModificarFavorecido: TMenuItem;
    sqlFinanceiroCompromissoDATA_HISTORICO: TStringField;
    mniAlterardatadeVencimento: TMenuItem;
    sqlFinanceiroCompromissocalc_Situacao: TStringField;
    sqlFinanceiroCompromissoLIVRO_CAIXA_FATURADO_ID: TFMTBCDField;
    cxGridDBTablePrevisaosSituacao: TcxGridDBColumn;
    sqlFinanceiroCompromissoFECHAMENTO_ID: TFMTBCDField;
    N8: TMenuItem;
    mniVerItemdeFaturamento: TMenuItem;
    sqlFinanceiroCompromissoVALOR_BOLETO: TFMTBCDField;
    sqlFinanceiroCompromissoVALOR_DESCONTO: TFMTBCDField;
    sqlFinanceiroCompromissoVALOR_JUROS: TFMTBCDField;
    sqlFinanceiroCompromissoVALOR_MULTA: TFMTBCDField;
    sqlFinanceiroCompromissoVALOR_OUTRA_DEDUCAO: TFMTBCDField;
    sqlFinanceiroCompromissoVALOR_CALCULO: TFMTBCDField;
    sqlFinanceiroCompromissoOBSERVACAO_MONETARIA: TStringField;
    sqlFinanceiroCompromissoVALOR_OUTRAS_TAXAS: TFMTBCDField;
    sqlLancamentoFavoritoVALOR_OUTRAS_TAXAS: TFMTBCDField;
    sqlLancamentoFavoritoCONTABIL_RL: TStringField;
    sqlLancamentoFavoritoCONTABIL_HISTORICO: TStringField;
    sqlLancamentoFavoritoCONTABIL_PESSOA_NOME: TStringField;
    sqlFinanceiroCompromissoDATA_REGISTRO: TSQLTimeStampField;
    sqlFinanceiroCompromissoDATA_FINAL: TSQLTimeStampField;
    procedure FormCreate(Sender: TObject);
    procedure tabExibirChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgcPrevisaoChange(Sender: TObject);
    procedure sqlFinanceiroCompromissoCalcFields(DataSet: TDataSet);
    procedure tbcPrevisaoChange(Sender: TObject);
    procedure cxGridDBTablePrevisaoDblClick(Sender: TObject);
    procedure sqlFinanceiroRemuneracaoCalcFields(DataSet: TDataSet);
    procedure tbcPagamentosChange(Sender: TObject);
    procedure ClientCaixaCalcFields(DataSet: TDataSet);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure edtPalavraPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxBarGrid0Click(Sender: TObject);
    procedure dxBarGrid1Click(Sender: TObject);
    procedure dxBarGrid2Click(Sender: TObject);
    procedure dxBarGrid3Click(Sender: TObject);
    procedure SchedulerDblClick(Sender: TObject);
    procedure cxBtnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure icxVisualizacaoPropertiesChange(Sender: TObject);
    procedure btnLimparCaixaClick(Sender: TObject);
    procedure cxGridDBTablePrevisaoSelectionChanged(
      Sender: TcxCustomGridTableView);
    procedure mniSaltarLancamentoClick(Sender: TObject);
    procedure mniAlterarvalorPrevistoClick(Sender: TObject);
    procedure GerarBoletoClick(Sender: TObject);
    procedure ExportarExcel1Click(Sender: TObject);
    procedure VisualizarImprimirBoletoClick(Sender: TObject);
    procedure mniTransferirOrcamentoClick(Sender: TObject);
    procedure sqlFinanceiroCompromissoAfterScroll(DataSet: TDataSet);
    procedure mniFinalizarOramentoClick(Sender: TObject);
    procedure sqlLancamentoFavoritoAfterScroll(DataSet: TDataSet);
    procedure btnExcluirFavoritoClick(Sender: TObject);
    procedure btnRealizarLancamentoClick(Sender: TObject);
    procedure grdBasicaDBTableView1DblClick(Sender: TObject);
    procedure tbcPagamentosChanging(Sender: TObject; var AllowChange: Boolean);
    procedure cxGridDBTablePrevisaoColumn1PropertiesChange(Sender: TObject);
    procedure mniRegistrarTodosSelecionadosClick(Sender: TObject);
    procedure sqlFinanceiroCompromissoAfterPost(DataSet: TDataSet);
    procedure sqlFinanceiroCompromissoBeforeEdit(DataSet: TDataSet);
    procedure cxLabel9Click(Sender: TObject);
    procedure cxLabel11Click(Sender: TObject);
    procedure cxDBTreeList1CustomDrawDataCell(Sender: TcxCustomTreeList;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
      var ADone: Boolean);
    procedure pgcFinanceiroPrevisaoChange(Sender: TObject);
    procedure chxMostar12Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure sqlFinanceiroAgrupadaCalcFields(DataSet: TDataSet);
    procedure cxGridDBTablePrevisaoCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure mniRegistrarTodosConferidosClick(Sender: TObject);
    procedure sqlFinanceiroCompromissoBeforePost(DataSet: TDataSet);
    procedure cxGridDBTablePrevisaoConferidoPropertiesCloseUp(Sender: TObject);
    procedure mniRealizarFechamentoClick(Sender: TObject);
    procedure mniDevolverItemClick(Sender: TObject);
    procedure mniCancelarFaturamentoClick(Sender: TObject);
    procedure mniItensVinculadoClick(Sender: TObject);
    procedure sbnImprimirPrevisaoClick(Sender: TObject);
    procedure mniAlterarDataVencimentoClick(Sender: TObject);
    procedure pgcDadosPrevisaoChange(Sender: TObject);
    procedure mniIraoAgendamentoClick(Sender: TObject);
    procedure chxSomarExcluidoChange(Sender: TObject);
    procedure mniModificarFavorecidoClick(Sender: TObject);
    procedure mniVerItemdeFaturamentoClick(Sender: TObject);
  private
    vlDataTipo4, vlData3Dias, vlDataTipo3 : TDate;
    vlControle, vlPesquisaAuto, vlUsarModuloXimenes, vlNaoPesquisar, vlPermitirModificarContaUsuario : Boolean;
    vlOperacaoPesquisada, vlCondicaoData, vlSituacao, vlPesquisaGridPadrao : String;
    FSaldoAnterior: real;
    FFinanceiro : IInterfaceDataSnap;

    // Definir Layout
    procedure AtivarGravarLayout(vpTipo : String);
    procedure AtivarVisualizacaoCaixa(vpTipo : String);
    procedure AtivarPesquisaPadrao(vpTipo : String; vpPesquisar : Boolean = False);
    procedure CarregarPrevisaoSaldoAtual(vpOperacao : String);
    procedure RegistrarItemCliente(vpConferido, vpFechamento : Boolean; vpRegistroUnico : Boolean = False);
    procedure HabilitarCampos;
    Procedure MontarPrevisarResumida(vpOperacao : String; vpRealizados : Boolean = False);
    procedure ParametrosRelatorio;
    procedure MarcarDesmarcarItensSimpleDataSetFaturamento(vpMarcar: String;
      vpSimpleDataset: TSimpleDataSet);
    Function VerificarItensAbetroFaturamento:Boolean;
  public
    vgAbrindoForm, vgAtualizarTarefa : Boolean;
    procedure RegistraPagamentoFaturamento;
  end;

var
  frmPrevisao: TfrmPrevisao;
  vgTipoForm : String;
  vlPessoaId : Integer;

implementation

uses
  Controles, Cadastro, Lookup, Rotinas,
  Lookup_Contabil, CadastroRapidoContas, CadastroRapidoLancamento,
  Lookup_Servico, LookupFinanceiro, Desktop, VisualizarBoleto,
  CadastroRapidoOrcTransf, Pessoa, ItensVinculados, VisualizaRelatorios,
  Agendamento, ModificarFavorecidoCaucaia, ItensAgendamento, Principal;

{$R *.dfm}

procedure TfrmPrevisao.mniAlterarDataVencimentoClick(Sender: TObject);
var
  viDataVencimento, viMensagem : String;
  viFlag : Boolean;
begin
  if not sqlFinanceiroCompromissoBOLETA_ID.IsNull then
  begin
    Application.MessageBox('Altera��o n�o permitida. Existe boleto vinculado!!!','Aviso', MB_OK + MB_ICONINFORMATION);
    exit;
  end;

  vgPermissaoRotina := ValidarPermissao('ESP_PERMISSAO_DATA');

  viDataVencimento := sqlFinanceiroCompromissoDATA_VENCIMENTO.AsString;
  repeat
    viFlag := True;
    if InputQueryAux('Alterar Data de Vencimento do Registro Selecionado', 'Data', viDataVencimento, 'D') then
    begin
      if viDataVencimento = '' then
      viFlag := False;
    end
    else Abort;
  until viFlag;

  if Application.MessageBox(Pchar('Confirma a altera��o da Data do Registro Selecionado, com vencimento em '+
                                    sqlFinanceiroCompromissoDATA_VENCIMENTO.AsString+'?'+viMensagem),'Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
    exit;

  ExecutaSqlAuxiliar(' UPDATE J_LIVRO_FINANCEIRO SET DATA_VENCIMENTO = :DATA_VENCIMENTO,'+
                     '                              ANO_MES_REFERENCIA = '+QuotedStr(PegarAnoMes(viDataVencimento))+','+
                     '                              DATA_HISTORICO = :DATA_HISTORICO '+
                     ' WHERE LIVRO_FINANCEIRO_ID = '+sqlFinanceiroCompromissoLIVRO_FINANCEIRO_ID.AsString,1);
  with dtmControles.sqlAuxiliar do
  begin
    ParamByName('DATA_VENCIMENTO').AsString := TrocaBarraPPonto(viDataVencimento);
    ParamByName('DATA_HISTORICO').AsString  := sqlFinanceiroCompromissoDATA_HISTORICO.AsString + '*' +sqlFinanceiroCompromissoDATA_VENCIMENTO.AsString;

    ExecSQL(FALSE);
  end;
  sqlFinanceiroCompromisso.Refresh;
end;

procedure TfrmPrevisao.mniAlterarvalorPrevistoClick(Sender: TObject);
var
  viValorPrevisto, viMensagem : String;
  viFlag : Boolean;
  viValorAnterior : Currency;
begin
  if not sqlFinanceiroCompromissoBOLETA_ID.IsNull then
  begin
    Application.MessageBox('Altera��o n�o permitida. Existe boleto vinculado!!!','Aviso', MB_OK + MB_ICONINFORMATION);
    exit;
  end;

  vgPermissaoRotina := ValidarPermissao('ESP_ALTERAR_VALOR');

  viValorPrevisto := FormatFloat(',#0.00', sqlFinanceiroCompromissoVALOR_AGENDADO.AsCurrency);
  repeat
    viFlag := True;
    if InputQueryAux('Alterar Valor do Registro Selecionado', 'Valor', viValorPrevisto, '$') then
    begin
      try
        viValorPrevisto := CurrToStr(StrToCurr(RetirarPonto(viValorPrevisto)));
        if (StrToCurr(viValorPrevisto) < 0) then
        begin
          viFlag := False;
          ShowMessage('Valor Inv�lido!!!');
        end;
      except
        viFlag := False;
        ShowMessage('Valor Inv�lido!!!');
      end;
    end
    else Abort;
  until viFlag;

  if (StrToCurr(viValorPrevisto)) = sqlFinanceiroCompromissoVALOR_AGENDADO.AsCurrency  then
    exit;

  if Application.MessageBox(Pchar('Confirma a altera��o do Valor do Registro Selecionado, com vencimento em '+
                                    sqlFinanceiroCompromissoDATA_VENCIMENTO.AsString+'?'+viMensagem),'Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
    exit;

  viValorAnterior := sqlFinanceiroCompromissoVALOR_DOCUMENTO.AsCurrency;
  if viValorAnterior = 0 then
    viValorAnterior := sqlFinanceiroCompromissoVALOR_AGENDADO.AsCurrency;

  ExecutaSqlAuxiliar(' UPDATE J_LIVRO_FINANCEIRO SET VALOR_DOCUMENTO = :VALOR_DOCUMENTO,'+
                     '                               VALOR_AGENDADO = :VALOR_AGENDADO'+
                     ' WHERE LIVRO_FINANCEIRO_ID = '+sqlFinanceiroCompromissoLIVRO_FINANCEIRO_ID.AsString,1);
  with dtmControles.sqlAuxiliar do
  begin
    ParamByName('VALOR_DOCUMENTO').AsCurrency := viValorAnterior;
    ParamByName('VALOR_AGENDADO').AsCurrency  := StrToCurr(viValorPrevisto);
    ExecSQL(FALSE);
  end;

  sqlFinanceiroCompromisso.Refresh;
end;

procedure TfrmPrevisao.mniCancelarFaturamentoClick(Sender: TObject);
begin
  if sqlFinanceiroCompromissoSITUACAO.AsString = '8' then
  begin
    Application.MessageBox('Cancelamento n�o permitido. Existem itens j� pago neste Faturamento!!!','Aviso', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  if Application.MessageBox(Pchar(' Cancelar Faturamento?'+#13+#13+
                                  ' Todos os itens vinculado ao Faturamento ser�o disponibilizados em "Financeiro Ximenes"!!!'), 'Confirma��o', MB_YESNO) = IDNO then
    exit;

  try
    ExecutaSqlAuxiliar(' UPDATE J_LIVRO_FINANCEIRO SET SITUACAO = '+ QuotedStr('1')+
                       ' WHERE FECHAMENTO_ID = '+sqlFinanceiroCompromissoLIVRO_FINANCEIRO_ID.AsString, 1);

    ExecutaSqlAuxiliar(' UPDATE J_LIVRO_FINANCEIRO SET SITUACAO = '+ QuotedStr('9')+
                       ' WHERE LIVRO_FINANCEIRO_ID = '+sqlFinanceiroCompromissoLIVRO_FINANCEIRO_ID.AsString, 1);

    sqlFinanceiroCompromisso.Refresh;
  except

  end;
end;

procedure TfrmPrevisao.AtivarGravarLayout(vpTipo : String);
var
  viGridLayout : Integer;
  vpTipoGrid : TcxGridLines;
begin
  viGridLayout :=  StrToInt(PadronizacaoLayout(vpTipo, 'LAYOUT', 'Grid', '2'));
  case viGridLayout of
     0 : vpTipoGrid := glBoth;
     1 : vpTipoGrid := glNone;
     2 : vpTipoGrid := glVertical;
     3 : vpTipoGrid := glHorizontal;
    else vpTipoGrid := glVertical;
  end;
  cxGridDBTablePrevisao.OptionsView.GridLines := vpTipoGrid;
end;


procedure TfrmPrevisao.AtivarPesquisaPadrao(vpTipo : String; vpPesquisar : Boolean = False);
var
  viPesquisa : Integer;
begin
  viPesquisa := 0 ;
  if (vpTipo = '') or (StrToInt(vpTipo) <= 2) then
    viPesquisa :=  StrToInt(PadronizacaoLayout(vpTipo, 'LAYOUT', 'PesquisaPrevisao', '2'));

  if vpPesquisar then
    tbcPrevisao.TabIndex := viPesquisa;

  vlPesquisaGridPadrao :=  PadronizacaoLayout('', 'LAYOUT', 'PesquisaGridPadrao', '0');
  pgcDadosPrevisao.ActivePageIndex := StrToInt(vlPesquisaGridPadrao);
end;

procedure TfrmPrevisao.AtivarVisualizacaoCaixa(vpTipo: String);
begin
  if PadronizacaoLayout(vpTipo, 'LAYOUT', 'ListaCaixa', '0') = '0' then
       icxVisualizacao.ItemIndex := 0
  else icxVisualizacao.ItemIndex := 1;
  lvLivro.Visible       := icxVisualizacao.ItemIndex = 0;
  cxgCaixaLevel.Visible := icxVisualizacao.ItemIndex = 1;
end;

procedure TfrmPrevisao.btnExcluirFavoritoClick(Sender: TObject);
begin
  if Application.MessageBox('Retirar Item dos Lan�amentos Favoritos?', 'Confirma��o', MB_YESNO) = IDNO then
    exit;

  ExecutaSqlAuxiliar(' UPDATE J_LIVRO_CAIXA SET FAVORITO_SITUACAO = '+QuotedStr('N')+
                     ' WHERE LIVRO_CAIXA_ID = '+sqlLancamentoFavoritoLIVRO_CAIXA_ID.AsString,1);
  sqlLancamentoFavorito.Refresh;
  frmPrincipal.CriarMenuFavoritos;
end;

procedure TfrmPrevisao.btnLimparCaixaClick(Sender: TObject);
begin
  lcbConta.ItemIndex := 0;
end;

procedure TfrmPrevisao.btnLimparClick(Sender: TObject);
begin
  edtPalavraPesquisa.Clear;
  lcxCentroCusto.Clear;
  lcxTipoCarga.Clear;
  lcxModalidade.Clear;
  lcxFavorecido.Clear;
  lcxGrupo.Clear;
  lcxCompromisso.Clear;
  memListaProtocolo.Clear;

  vlPesquisaAuto := True;
  if tbcPagamentos.TabIndex <> 3 then
    btnPesquisarClick(Self)
end;

procedure TfrmPrevisao.btnPesquisarClick(Sender: TObject);
begin
  if not vlNaoPesquisar then
    tbcPrevisaoChange(self);
end;


procedure TfrmPrevisao.btnRealizarLancamentoClick(Sender: TObject);
begin
  vgDadosCadastro.SomentePesquisa := True;
  vgDadosLivroCaixa.DuplicarItem  := True;
  vgDadosLivroCaixa.Favorito      := True;
  dtmLookupServico.CarregarDadosLancamento(2, sqlLancamentoFavoritoLIVRO_CAIXA_ID.AsInteger, sqlLancamentoFavorito);
  ExibirFormulario(TfrmCadastroRapidoLancamento, frmCadastroRapidoLancamento, True);
  if vgDadosLivroCaixa.Confirmado then
  begin
    sqlLancamentoFavorito.Refresh;

    ExecutaSqlAuxiliar(' UPDATE J_LIVRO_CAIXA SET FAVORITO_VALOR = :VALOR '+
                       ' WHERE LIVRO_CAIXA_ID = '+sqlLancamentoFavoritoLIVRO_CAIXA_ID.AsString,2);
    with dtmControles.sqlAuxiliar do
    begin
      ParamByName('VALOR').AsCurrency := vgDadosLivroCaixa.ValorPago;
      ExecSQL(FALSE);
      sqlLancamentoFavorito.Refresh;
    end;
  end;
  vgDadosLivroCaixa.DuplicarItem := False;
  vgDadosLivroCaixa.Favorito     := False;
end;

procedure TfrmPrevisao.CarregarPrevisaoSaldoAtual(vpOperacao : String);
var
  viValorPrevisao, viSaldo : Currency;
  viConta : String;
begin
  // Saldo Atual
  viConta := '';
  if lcbConta.EditValue > 0 then
    viConta  := IntToStr(lcbConta.EditValue);
  viSaldo := dtmLookupContabil.CalcularSaldoCaixa(viConta, '', chxSomarExcluido.EditValue = True);
  dtmLookupContabil.PreencherSaldoLabel(' Saldo Atual R$ ',viSaldo, dxSaldoAtual,True, '1');
  FSaldoAnterior := viSaldo;

  // Valores Previstos
  viValorPrevisao := dtmLookupContabil.CalcularPrevisaoCaixa(vgCondicaoPrecisaoCaixa,vpOperacao, True, False);
  viValorPrevisao := viSaldo + viValorPrevisao;
  dtmLookupContabil.PreencherSaldoLabel(' Previs�o de Saldo  '+ tbcPrevisao.Tabs[tbcPrevisao.TabIndex].Caption+' R$ ',viValorPrevisao, dxPrevisaoSaldo, True ,'2');
end;

procedure TfrmPrevisao.chxMostar12Click(Sender: TObject);
begin
  pgcFinanceiroPrevisaoChange(Self);
end;

procedure TfrmPrevisao.chxSomarExcluidoChange(Sender: TObject);
begin
  tbcPrevisaoChange(Self);
end;

procedure TfrmPrevisao.ClientCaixaCalcFields(DataSet: TDataSet);
begin
  if ClientCaixaPREVISAO_SALDO.AsString = 'N' then
    ClientCaixaSITUACAO.AsString := '4'
  else
  begin
    if ClientCaixaPRINCIPAL.AsString = 'S' then
      ClientCaixaSITUACAO.AsString := '0'
    else
      if ClientCaixaVALOR.AsCurrency > 0 then
           ClientCaixaSITUACAO.AsString := '1'
    else
      if ClientCaixaVALOR.AsCurrency < 0 then
           ClientCaixaSITUACAO.AsString := '2'
      else ClientCaixaSITUACAO.AsString := '3';
  end;
end;

procedure TfrmPrevisao.cxBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrevisao.cxDBTreeList1CustomDrawDataCell(
  Sender: TcxCustomTreeList; ACanvas: TcxCanvas;
  AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
begin
  case StrToInt(AViewInfo.TreeList.Items[AViewInfo.Node.Index].Values[0]) of
    0 : ACanvas.Font.Color := clGreen;
    1 : ACanvas.Font.Color := clRed;
    2 : ACanvas.Font.Color := clNavy;
  end;
end;

procedure TfrmPrevisao.cxGridDBTablePrevisaoColumn1PropertiesChange(
  Sender: TObject);
begin
  sqlFinanceiroCompromisso.Post;
end;

procedure TfrmPrevisao.cxGridDBTablePrevisaoConferidoPropertiesCloseUp(
  Sender: TObject);
begin
  if (sqlFinanceiroCompromisso.State in [dsEdit]) then       
    sqlFinanceiroCompromisso.Post;
end;

procedure TfrmPrevisao.cxGridDBTablePrevisaoCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if (AViewInfo.RecordViewInfo.GridRecord.Values[22]) = 'S' then
    ACanvas.Font.Color  := clBlue;

  if (AViewInfo.RecordViewInfo.GridRecord.Values[0]) = '6' then
    ACanvas.Font.Color  := clSilver;
end;

procedure TfrmPrevisao.cxGridDBTablePrevisaoDblClick(Sender: TObject);
  procedure RegistrarFaturamento;
  begin
    vgDadosCadastro.SomentePesquisa := True;
    vgItensVinculados.visualizar := False;
    vgItensVinculados.Id := sqlFinanceiroCompromissoLIVRO_FINANCEIRO_ID.AsString;
    vgItensVinculados.Campo  := 'FECHAMENTO_ID';
    vgItensVinculados.Titulo := 'Itens do Faturamento - '+sqlFinanceiroCompromissoHISTORICO.AsString;
    vgItensVinculados.AnoMesReferencia := '';

    if VerificarItensAbetroFaturamento then
      RegistraPagamentoFaturamento
    else
    begin
      ExibirFormulario(TfrmItensVinculados, frmItensVinculados, True);
      if vgConfirmarItensProtocolo then
        dtmLookupServico.RegistrarBoleto(sqlFinanceiroCompromissoBOLETA_ID.AsInteger);
    end;
  end;

begin
  if not vlPermitirModificarContaUsuario then
  begin
    Application.MessageBox('Sem Permiss�o pra Registrar!!!','Aviso', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  case tbcPagamentos.TabIndex of
    1 : begin
          if (sqlFinanceiroCompromissoSITUACAO.AsInteger in [7,8]) then
               RegistrarFaturamento
          else RegistraPagamentoFaturamento;
         end;
    2 : begin
          RegistrarItemCliente(False, False);
          if not vgDadosLivroCaixa.Confirmado then
            exit;

          sqlFinanceiroCompromisso.Refresh;
          dtmLookupContabil.CarregarSaldoCaixa(ClientCaixa);
        end;
    3 : RegistrarFaturamento;
  end;
end;

procedure TfrmPrevisao.cxGridDBTablePrevisaoSelectionChanged(
  Sender: TcxCustomGridTableView);
var
  viQtd, vpLevel : Integer;
begin
  viQtd := cxGridDBTablePrevisao.DataController.GetSelectedCount;
  if viQtd = 1 then
  begin
    gbxSomaItensSelecionados.Visible := False;
    exit;
  end;
  gbxSomaItensSelecionados.Visible := True;

  if (cxGridDBTablePrevisaoProtocolo.GroupIndex >= 0) and (tbcPagamentos.TabIndex > 1) then
       vpLevel := 2
  else vpLevel := 1;

  dtmLookupFinanceiro.SomarSelecionados(cxGridDBTablePrevisao, edtValorSomaSelecionados, cxGridDBTableCompromissoEntrada, cxGridDBTableCompromissoSaida, cxGridDBTablePrevisaoOperacao, False, vpLevel);
end;

procedure TfrmPrevisao.cxLabel11Click(Sender: TObject);
begin
  dtmLookup.MarcarDesmarcarItensSimpleDataSet('N', sqlFinanceiroCompromisso);
end;

procedure TfrmPrevisao.cxLabel9Click(Sender: TObject);
begin
  MarcarDesmarcarItensSimpleDataSetFaturamento('S', sqlFinanceiroCompromisso);
end;

procedure TfrmPrevisao.dxBarGrid0Click(Sender: TObject);
begin
  AtivarGravarLayout('0');
end;

procedure TfrmPrevisao.dxBarGrid1Click(Sender: TObject);
begin
  AtivarGravarLayout('1');
end;

procedure TfrmPrevisao.dxBarGrid2Click(Sender: TObject);
begin
  AtivarGravarLayout('2');
end;

procedure TfrmPrevisao.dxBarGrid3Click(Sender: TObject);
begin
  AtivarGravarLayout('3');
end;

procedure TfrmPrevisao.edtPalavraPesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    btnPesquisarClick(Self);
end;

procedure TfrmPrevisao.ExportarExcel1Click(Sender: TObject);
begin
  if not DirectoryExists('C:\TEMP\') then
    MkDir('C:\TEMP\');

  sqlFinanceiroCompromisso.Refresh;
  if pgcDadosPrevisao.ActivePageIndex = 0 then
       ExportGridToExcel('C:\TEMP\RELTEMP.XLS', gdrCompromissoAgendado)
  else ExportGridToExcel('C:\TEMP\RELTEMP.XLS', gdrCompromissoResumido);
  AbrirPlanilha();
  sqlFinanceiroCompromisso.Refresh;
end;

procedure TfrmPrevisao.mniFinalizarOramentoClick(Sender: TObject);
begin
  if Application.MessageBox(Pchar('Finalizar Or�amento. Confirma?'+#13+
                                  'O Saldo Dispon�vel do Or�amento � de '+FormatFloat('R$ ,#0.00', sqlFinanceiroCompromissocalc_saida.AsCurrency)),'Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
    exit;

  vgDadosLivroCaixa.LivroFinanceiroID   := sqlFinanceiroCompromissoLIVRO_FINANCEIRO_ID.AsInteger;

  vgDadosLivroCaixa.PeriodoId          := 0;
  vgDadosLivroCaixa.LivroAgendamentoId := 0;
  if tbcPagamentos.TabIndex < 2 then
  begin
    vgDadosLivroCaixa.PeriodoId          := sqlFinanceiroCompromissoPERIODO.AsInteger;
    vgDadosLivroCaixa.LivroAgendamentoId := sqlFinanceiroCompromissoLIVRO_AGENDAMENTO_ID.AsInteger;
  end;
  vgDadosLivroCaixa.DataVencimento := sqlFinanceiroCompromissoDATA_VENCIMENTO.AsString;

  ExecutaSqlAuxiliar(' UPDATE J_LIVRO_FINANCEIRO SET SITUACAO = '+QuotedStr('4')+
                     ' WHERE LIVRO_FINANCEIRO_ID = '+sqlFinanceiroCompromissoLIVRO_FINANCEIRO_ID.AsString,1);

  if tbcPagamentos.TabIndex < 2 then
    dtmLookupServico.VerificarAtualizacaoAgendamento;

  sqlFinanceiroCompromisso.Refresh;
end;

procedure TfrmPrevisao.FormActivate(Sender: TObject);
begin
  if not vgAbrindoForm then
    if sqlFinanceiroCompromisso.Active then
      sqlFinanceiroCompromisso.Refresh;

  if vgDadosCadastro.AtualizarSaldo then
  begin
    dtmLookupContabil.CarregarSaldoCaixa(ClientCaixa, False);
    CarregarPrevisaoSaldoAtual(vlOperacaoPesquisada);
    vgDadosCadastro.AtualizarSaldo := False;
  end;

  if (pgcFinanceiroPrevisao.ActivePageIndex = 0) and (tbcPagamentos.TabIndex = 0) then
    edtPalavraPesquisa.SetFocus;
  sqlLancamentoFavorito.Refresh;
end;

procedure TfrmPrevisao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action      := caFree;
  frmPrevisao := nil;
end;

procedure TfrmPrevisao.FormCreate(Sender: TObject);
var
  viIpServidorXimenes : String;
begin
  vgBoletoID := 0;
  sqlFinanceiroCompromisso.Connection := dtmControles.DB;
  sqlLancamentoFavorito.Connection    := dtmControles.DB;
  sqlFinanceiroAgrupada.Connection    := dtmControles.DB;
  sqlLancamentoFavorito.Open;
  memListaProtocolo.Clear;

  vgAbrindoForm      := True;
  vgAtualizarTarefa  := False;

  dxBarCombo2.ItemIndex := 2;
  pgcFinanceiroPrevisao.ActivePageIndex := 0;
  vlDataTipo4 := StrToDate(dtmControles.DataHoraBanco(4));
  vlData3Dias := (dtmControles.DataHoraBanco(3)+3);
  vlDataTipo3 := dtmControles.DataHoraBanco(3);

  vlUsarModuloXimenes               := dtmControles.BuscarConfig('FINANCEIRO', 'XIMENES', 'USAR_MODULO_XIMENES', 'S') = 'S';
  vlPermitirModificarContaUsuario   := dtmControles.CodPermissao('ESP_MODIFICAR_CONTA_USUARIO')[6] = '1';
  tbcPagamentos.TabIndex            := 1;
  tbcPagamentos.Tabs[2].Visible     := vlUsarModuloXimenes;
  cxGridDBTableView1Column6.Visible := vlUsarModuloXimenes;

  tabExibir.TabIndex            := 0;
  cxBarEditItemPesquisar.EditValue := 1;
  vgDataAtualTipo4              := dtmControles.DataHoraBanco(4);
  vgDataAtualTipoDate           := StrToDate(vgDataAtualTipo4);

  AtivarGravarLayout('');
  AtivarVisualizacaoCaixa('');
  AtivarPesquisaPadrao('', True);

  pgcPagamentoRepasse.ActivePageIndex := 0 ;
  pgcPrevisao.HideTabs := True;

  tabExibir.Tabs[1].Visible := dtmControles.CodPermissao('CAD_SALDO_DETALHADO')[4] <> '0';

  dxBarData.Caption := Rotinas.MaiusculoMinusculo(FormatDateTime('dddd, dd', dtmControles.DataHoraBanco(3)) + ' de ' +
                                       FormatDateTime('MMMM', dtmControles.DataHoraBanco(3)) + ' de ' +
                                       FormatDateTime('yyyy', dtmControles.DataHoraBanco(3)));

  if vlUsarModuloXimenes then
  begin
    viIpServidorXimenes := dtmControles.BuscarConfig('FINANCEIRO', 'XIMENES', 'IP_SERVIDOR', 'S');
    FFinanceiro := GetDataSnapDll(ExtractFilePath(Application.ExeName), viIpServidorXimenes);
  end;

  tbcPagamentos.Tabs[2].Visible := vlPermitirModificarContaUsuario and vlUsarModuloXimenes;
  tbcPagamentos.Tabs[3].Visible := vlPermitirModificarContaUsuario and vlUsarModuloXimenes;
//  tbcPagamentosChange(SELF);
end;

procedure TfrmPrevisao.FormShow(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    LockWindowUpdate(Handle);
    dxBarEditNumero.Text := '';
    dxBarEditNumero.Setfocus;

    // Permissoes
    tabPrevisaoFinanceira.TabVisible   := dtmControles.CodPermissao('CAD_PREVISAO_FINANCEIRA') <> '000000';

    case vgTipoForm[1] of
      '3' : Begin
              Caption := 'Controle Financeiro - Previs�o';
              pgcPrevisao.ActivePageIndex := 0;
            end;
    end;

    vlNaoCarregarSaldo := True;

    pgcPrevisaoChange(self);

    LockWindowUpdate(0);
    vgAbrindoForm := False;
    Screen.Cursor := crDefault;

    vlNaoCarregarSaldo := False;
    dtmLookupContabil.CarregarSaldoCaixa(ClientCaixa, False);
    dtmLookupContabil.CarregarSaldoCaixa(ClientListaCaixa, True, True);
    lcbConta.EditValue := 0;
    cxGridDBTablePrevisao.DataController.Controller.FocusedRecordIndex := 0;
  except
    LockWindowUpdate(0);
  end;
  Screen.Cursor := crDefault;
end;

procedure TfrmPrevisao.GerarBoletoClick(Sender: TObject);
var
  viBancoId: Integer;
  viRetornoBoleto: TRetornoImprimiuBoleto;
  viValor : Currency;
begin
  if sqlFinanceiroCompromissoUTILIZA_BOLETO.AsString = 'N' then begin
    Application.MessageBox('Cliente n�o utiliza gera��o de boleto!','Aviso', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  if sqlFinanceiroCompromissoBOLETA_ID.AsInteger > 0 then begin
    Application.MessageBox('Boleta j� foi gerada!','Aviso', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  if Application.MessageBox('Deseja gerar boleto?','Confirma��o', MB_YESNO + MB_ICONQUESTION) = IDNO then
    Exit;

  viBancoId := dtmControles.GetInt('select BANCO_ID from J_CAIXA where CAIXA_ID = ' +
    sqlFinanceiroCompromissoCAIXA_ID.AsString);

  if viBancoId = 0 then begin
    Application.MessageBox('Informe a conta banc�ria do caixa financeiro! ','Falha', MB_OK + MB_ICONWARNING);
    Exit;
  end;

  Inc(vgBoletoID);
  viRetornoBoleto := dtmLookupFinanceiro.CriarTituloLista(
                            sqlFinanceiroCompromissoPESSOA_ID.AsString,
                            sqlFinanceiroCompromissoNOME.AsString,
                            sqlFinanceiroCompromissoLIVRO_FINANCEIRO_ID.AsString,
                            sqlFinanceiroCompromissoDATA_VENCIMENTO.AsDateTime,
                            viBancoId,
                            sqlFinanceiroCompromissocalc_Entrada.AsCurrency,
                            False);

  if not viRetornoBoleto.ImprimiuBoleto then
  begin
    Application.MessageBox('Falha ao gerar arquivo!','Aviso', MB_OK + MB_ICONINFORMATION);
    Exit;
  end
  else sqlFinanceiroCompromisso.Refresh;

  Application.MessageBox('Boleto gerado com sucesso!','Aviso', MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmPrevisao.grdBasicaDBTableView1DblClick(Sender: TObject);
begin
  btnRealizarLancamentoClick(Self);
end;

procedure TfrmPrevisao.HabilitarCampos;
begin
  pnlPesquisaExtra.Visible                    := (tbcPagamentos.TabIndex = 2);
  cxGridDBTablePrevisaoProtocolo.Visible      := tbcPagamentos.TabIndex > 1;
  cxGridDBTablePrevisaoConferido.Visible      := tbcPagamentos.TabIndex = 1;
  cxGridDBTablePrevisaoParcela.Visible        := tbcPagamentos.TabIndex = 1;
  cxGridDBTablePrevisaoOrcamento.Visible      := tbcPagamentos.TabIndex = 1;
  cxGridDBTablePrevisaoIdentificacao.Visible  := (tbcPagamentos.TabIndex > 1);
  cxGridDBTableViewModalidade.Visible         := (tbcPagamentos.TabIndex > 1);
  cxGridDBTableViewSitComissao.Visible        := (tbcPagamentos.TabIndex > 1) and ((lcxTipoCarga.EditValue = 2) or (lcxTipoCarga.Text = ''));
end;

procedure TfrmPrevisao.icxVisualizacaoPropertiesChange(Sender: TObject);
begin
  AtivarVisualizacaoCaixa(IntToStr(icxVisualizacao.ItemIndex));
end;

procedure TfrmPrevisao.mniIraoAgendamentoClick(Sender: TObject);
begin
  vgAgendamentoLocalizarId       := sqlFinanceiroCompromissoLIVRO_AGENDAMENTO_ID.AsInteger;
  vgAgendamentoLocalizarOperacao := sqlFinanceiroCompromissoOPERACAO.AsString;
  CadAgendamento;
end;

procedure TfrmPrevisao.MarcarDesmarcarItensSimpleDataSetFaturamento(
  vpMarcar: String; vpSimpleDataset: TSimpleDataSet);
var
  viPosicao: Integer;
begin
  Screen.Cursor := crHourGlass;
  viPosicao := vpSimpleDataset.RecNo;
  vpSimpleDataset.DisableControls;
  vpSimpleDataset.First;
  while not vpSimpleDataset.Eof do
  begin
    if vpSimpleDataset.FieldByName('SITUACAO').AsInteger <> 6 then
    begin
      vpSimpleDataset.FieldByName('CALC_SELECIONADO').ReadOnly := False;
      vpSimpleDataset.Edit;
      vpSimpleDataset.FieldByName('CALC_SELECIONADO').AsBoolean := vpMarcar = 'S';
    end;
    vpSimpleDataset.Next;
  end;
  vpSimpleDataset.First;
  vpSimpleDataset.EnableControls;
  vpSimpleDataset.RecNo := viPosicao;
  Screen.Cursor := crDefault;
end;

procedure TfrmPrevisao.MenuItem1Click(Sender: TObject);
begin
  if sqlFinanceiroAgrupada.IsEmpty then
    Exit;

  vgNovoCadastro := False;
  vgPessoa.Nome  := '';
  vgPessoa.PessoaId := sqlFinanceiroAgrupadaPESSOA_ID.AsInteger;
  CadPessoa(True);

  sqlFinanceiroAgrupada.Refresh;
end;

procedure TfrmPrevisao.pgcDadosPrevisaoChange(Sender: TObject);
begin
  vlPesquisaGridPadrao := IntToStr(pgcDadosPrevisao.ActivePageIndex);
  PadronizacaoLayout(vlPesquisaGridPadrao, 'LAYOUT', 'PesquisaGridPadrao', '0');
end;

procedure TfrmPrevisao.pgcFinanceiroPrevisaoChange(Sender: TObject);
begin
  if pgcFinanceiroPrevisao.ActivePageIndex = 2 then
  begin
    MontarPrevisarResumida('');
    if chxMostar12.Checked then
      MontarPrevisarResumida('', True);
  end;
end;

procedure TfrmPrevisao.pgcPrevisaoChange(Sender: TObject);
begin

  LockWindowUpdate(Handle);

  tabExibir.Properties.HideTabs := not (pgcPrevisao.ActivePage = tabPrevisaoFinanceira);
  if pgcPrevisao.ActivePage = tabPrevisaoFinanceira then
  begin
    tabExibir.TabIndex := 0;
    tabExibirChange(Self);

    if not vgAbrindoForm then
      tbcPrevisaoChange(Self);

    dtmLookupContabil.CarregarSaldoCaixa(ClientCaixa);
    dtmLookupContabil.CarregarSaldoCaixa(ClientListaCaixa, True, True);
    edtPalavraPesquisa.SetFocus;
  end;

  LockWindowUpdate(0);
end;

procedure TfrmPrevisao.mniDevolverItemClick(Sender: TObject);
begin
  mniSaltarLancamentoClick(Self);
end;

procedure TfrmPrevisao.mniRealizarFechamentoClick(Sender: TObject);
begin
  RegistrarItemCliente(False, True, False);
  if not vgDadosLivroCaixa.Confirmado then
    exit;

  sqlFinanceiroCompromisso.Refresh;
  dtmLookupContabil.CarregarSaldoCaixa(ClientCaixa);
end;

procedure TfrmPrevisao.RegistraPagamentoFaturamento;
var
  viBoletoId : Integer;
begin
  if sqlFinanceiroCompromissoATIVADO.AsString = '0' then
  begin
    Application.MessageBox(Pchar('Lan�amento aguardando ativa��o.'+#13+#13+
                                 'Ative-o em Agendamentos!!!'),'Aviso', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  vgItensVinculados.visualizar       := False;
  vgDadosCadastro.SomentePesquisa    := True;
  vgDadosLivroCaixa.DuplicarItem     := False;
  dtmLookupServico.CarregarDadosLancamento(2, 0, sqlFinanceiroCompromisso);

  if vlUsarModuloXimenes then
    vgDadosLivroCaixa.RegistroParcial  := 'S';

  viBoletoId := sqlFinanceiroCompromissoBOLETA_ID.AsInteger;
  ExibirFormulario(TfrmCadastroRapidoLancamento, frmCadastroRapidoLancamento, True);
  if not vgDadosLivroCaixa.Confirmado then
    exit;
  dtmLookupServico.RegistrarBoleto(viBoletoId);
  sqlFinanceiroCompromisso.Refresh;
  dtmLookupContabil.CarregarSaldoCaixa(ClientCaixa);
end;

procedure TfrmPrevisao.RegistrarItemCliente(vpConferido, vpFechamento : Boolean; vpRegistroUnico : Boolean = False);
begin
  vgDadosLivroCaixa.ClienteID := sqlFinanceiroCompromissoPESSOA_ID.AsString;
  vgDadosLivroCaixa.Contrato  := sqlFinanceiroCompromissoDOCUMENTO_NUMERO.AsString;
  dtmLookupServico.ConfirmarRecebimentoPagamento(sqlFinanceiroCompromisso, vpConferido, vpFechamento, vpRegistroUnico);
  tbcPrevisaoChange(self);
end;

procedure TfrmPrevisao.sbnImprimirPrevisaoClick(Sender: TObject);
var
  viRelatorioId : String;
begin
  viRelatorioId := dtmControles.BuscarConfig('FINANCEIRO', 'RELATORIO', 'FINANCEIRO_PREVISAO','S');
  if viRelatorioId = '' then
  begin
    Application.MessageBox(Pchar('Relat�rio de Previs�o n�o configurado!!!'), 'Aten��o', MB_OK + MB_ICONWARNING);
    exit;
  end;

  ExibirRelatorio(dtmControles.frxRelatorio, viRelatorioId, ParametrosRelatorio, True);
end;

procedure TfrmPrevisao.mniRegistrarTodosConferidosClick(Sender: TObject);
begin
  RegistrarItemCliente(True, False);
  if not vgDadosLivroCaixa.Confirmado then
    exit;

  sqlFinanceiroCompromisso.Refresh;
  dtmLookupContabil.CarregarSaldoCaixa(ClientCaixa);
end;

procedure TfrmPrevisao.mniRegistrarTodosSelecionadosClick(Sender: TObject);
begin
  RegistrarItemCliente(False, False);
  if not vgDadosLivroCaixa.Confirmado then
    exit;

  sqlFinanceiroCompromisso.Refresh;
  dtmLookupContabil.CarregarSaldoCaixa(ClientCaixa);
end;

procedure TfrmPrevisao.mniTransferirOrcamentoClick(Sender: TObject);
begin
  vgDadosCadastro.SomentePesquisa := False;
  dtmLookup.CadastrarFormRapido('J_ORCAMENTO_RESERVA','ORCAMENTO_RESERVA_ID', 0,0,0);
  ExibirFormulario(TfrmCadastroRapidoOrcTransf, frmCadastroRapidoOrcTransf, True);
  if not vgDadosCadastro.Confirmado then
    exit;

  sqlFinanceiroCompromisso.Refresh;
  CarregarPrevisaoSaldoAtual(vlOperacaoPesquisada);
end;

procedure TfrmPrevisao.mniModificarFavorecidoClick(Sender: TObject);
begin
  if not sqlFinanceiroCompromissoBOLETA_ID.IsNull then
  begin
    Application.MessageBox('Altera��o n�o permitida. Existe boleto vinculado!!!','Aviso', MB_OK + MB_ICONINFORMATION);
    exit;
  end;

  vgDadosCadastro.SomentePesquisa := True;
  vgDadosLivroCaixa.Novo          := True;
  vgModificarFavorecidoAtual      := sqlFinanceiroCompromissoPESSOA_ID.AsInteger;
  vgModificarFavorecidoNovo       := 0;
  ExibirFormulario(TfrmModificarFavorecidoCaucaia, frmModificarFavorecidoCaucaia, True);

  if vgModificarFavorecidoNovo > 0 then
  begin
    Screen.Cursor := crHourGlass;
    sqlFinanceiroCompromisso.DisableControls;
    while not sqlFinanceiroCompromisso.Eof do
    begin
      if sqlFinanceiroCompromissocalc_Selecionado.AsBoolean then
        ExecutaSqlAuxiliar(' UPDATE J_LIVRO_FINANCEIRO SET PESSOA_ID = '+IntToStr(vgModificarFavorecidoNovo)+
                           ' WHERE LIVRO_FINANCEIRO_ID = '+sqlFinanceiroCompromissoLIVRO_FINANCEIRO_ID.AsString, 1);
      sqlFinanceiroCompromisso.Next;
    end;
    sqlFinanceiroCompromisso.Refresh;
    sqlFinanceiroCompromisso.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrevisao.MontarPrevisarResumida(vpOperacao : String; vpRealizados : Boolean = False);
var
  viDataIni, viDataFin : String;
  viAnoMes, viAnoMesAtual : String;
  viSaldoAtual, viSaldoReceitas, viSaldoDespesas, viSaldoRetiradas, viSaldoAporte : Currency;

  {$REGION 'CALCULAR ESTATISTICA'}
  procedure CalcularEstatistica;
  begin
    if (viAnoMes < viAnoMesAtual) and (not vpRealizados) then
      exit;

    viSaldoReceitas := (ClientPrevisaoResumidaVALOR_R.AsCurrency + ClientPrevisaoResumidaVALOR_RECEBIDO.AsCurrency);
    viSaldoDespesas := (ClientPrevisaoResumidaVALOR_D.AsCurrency + ClientPrevisaoResumidaVALOR_PAGO.AsCurrency) +
                       ClientPrevisaoResumidaVALOR_O.AsCurrency;
    viSaldoRetiradas := (ClientPrevisaoResumidaVALOR_AD.AsCurrency + ClientPrevisaoResumidaVALOR_RETIRADA.AsCurrency);
    viSaldoAporte    := (ClientPrevisaoResumidaVALOR_AR.AsCurrency + ClientPrevisaoResumidaVALOR_APORTE.AsCurrency);
    ClientPrevisaoResumidaDIFERENCA_MES.AsCurrency     := (viSaldoReceitas + viSaldoAporte) - (viSaldoDespesas + viSaldoRetiradas);

    if (viSaldoDespesas > 0) or ((viSaldoReceitas+viSaldoAporte) > 0) then
      ClientPrevisaoResumidaPORCENTO_DESPESAS.AsCurrency := (viSaldoDespesas*100)/(viSaldoReceitas+viSaldoAporte);

    if (viSaldoRetiradas > 0) or ((viSaldoAporte+viSaldoReceitas) > 0) then
      ClientPrevisaoResumidaPORCENTO_RETIRADA.AsCurrency := (viSaldoRetiradas*100)/(viSaldoReceitas+viSaldoAporte);
  end;
  {$ENDREGION}

  {$REGION 'CalcularValoresRealizados'}
  procedure CalcularValoresRealizados;
  begin
    viDataIni := '01/'+ Copy(viAnoMes,5,2) +'/'+ Copy(viAnoMes,1,4);
    viDataFin := dtmLookupContabil.PegarDataFinalMes(viAnoMes);
    ClientPrevisaoResumidaVALOR_PAGO.AsCurrency     := Arredondamento(dtmControles.MetodoArredondamento, dtmLookupContabil.PrepararSqlSoma('', 'D', '', chxSomarExcluido.EditValue = True, viDataFin,'',viDataIni),2);
    ClientPrevisaoResumidaVALOR_RECEBIDO.AsCurrency := Arredondamento(dtmControles.MetodoArredondamento, dtmLookupContabil.PrepararSqlSoma('', 'R', '', chxSomarExcluido.EditValue = True, viDataFin,'',viDataIni),2);
    ClientPrevisaoResumidaVALOR_APORTE.AsCurrency   := Arredondamento(dtmControles.MetodoArredondamento, dtmLookupContabil.PrepararSqlSoma('', 'AR', '', chxSomarExcluido.EditValue = True, viDataFin,'',viDataIni),2);
    ClientPrevisaoResumidaVALOR_RETIRADA.AsCurrency := Arredondamento(dtmControles.MetodoArredondamento, dtmLookupContabil.PrepararSqlSoma('', 'AD', '', chxSomarExcluido.EditValue = True, viDataFin,'',viDataIni),2);
  end;
  {$ENDREGION}

  {$REGION 'InserirNovaPrevisao'}
  procedure InserirNovaPrevisao(vpAno, vpMes : Integer);
  begin
    with dtmControles.sqlAuxiliar do
    begin
      if vpRealizados then
           ClientPrevisaoResumida.Append
      else ClientPrevisaoResumida.Insert;
      ClientPrevisaoResumidaANOMES.AsString   := viAnoMes;
      ClientPrevisaoResumidaANO.AsInteger     := vpAno;
      ClientPrevisaoResumidaMES.AsInteger     := vpMes;
    end;
  end;
  {$ENDREGION}

  {$REGION 'InserirSomenteRealizados'}
  procedure InserirSomenteRealizados;
  var
    viDataFinal, viAnoMesInsercao : String;
  begin
    viAnoMesInsercao := dtmLookupContabil.DeclementarAnoMes(viAnoMesAtual,12);
    viAnoMes         := viAnoMesAtual;
    repeat
      viAnoMes := dtmLookupContabil.DeclementarAnoMes(viAnoMes,1);
      viDataFinal := dtmLookupContabil.PegarDataFinalMes(viAnoMes);
      InserirNovaPrevisao(StrToInt(copy(viAnoMes,1,4)),StrToInt(copy(viAnoMes,5,2)));
      CalcularValoresRealizados;
      ClientPrevisaoResumidaSALDO_PREVISTO.AsCurrency := Arredondamento(dtmControles.MetodoArredondamento, dtmLookupContabil.CalcularSaldoCaixa('', viDataFinal, chxSomarExcluido.EditValue = True),2);
      ClientPrevisaoResumidaPERIODO.AsString          := '0';
      CalcularEstatistica;
      ClientPrevisaoResumida.Post;
    until viAnoMes = viAnoMesInsercao;
  end;
  {$ENDREGION}

begin
  Screen.Cursor := crHourGlass;
  viAnoMesAtual := PegarAnoMes(DateToStr(vgDataAtualTipoDate));
  if vpRealizados then
    InserirSomenteRealizados
  else
  begin
    ClientPrevisaoResumida.EmptyDataSet;
    dtmLookupContabil.CalcularPrevisaoCaixa(vlCondicaoData,'', True, False, True);
    with dtmLookupContabil.ClientPrevisaoCaixa do
    begin
      viSaldoAtual := dtmLookupContabil.CalcularSaldoCaixa('','', chxSomarExcluido.EditValue = True);
      cxDBTreeList1.Bands[5].Caption.Text := FormatFloat(',#0.00', viSaldoAtual);
      while not eof do
      begin
        viAnoMes := RetornaNumericoValor(FieldByName('ANO').AsString, True) + FormatFloat('00', FieldByName('MES').AsCurrency);
        if not ClientPrevisaoResumida.Locate('ANOMES', viAnoMes, [loCaseInsensitive]) then
        begin
          InserirNovaPrevisao(FieldByName('ANO').AsInteger, FieldByName('MES').AsInteger);
          if viAnoMes < viAnoMesAtual then
            ClientPrevisaoResumidaPERIODO.AsString := '1'
          else
          begin
            if viAnoMes = viAnoMesAtual then
                 ClientPrevisaoResumidaPERIODO.AsString := '2'
            else ClientPrevisaoResumidaPERIODO.AsString := '3';

            if viAnoMes = viAnoMesAtual then
              CalcularValoresRealizados;
            ClientPrevisaoResumidaSALDO_PREVISTO.AsCurrency := viSaldoAtual + dtmLookupContabil.CalcularPrevisaoCaixa(' (LF.ANO_MES_REFERENCIA <='+QuotedStr(viAnoMes)+')','', True, False);
          end;
        end
        else ClientPrevisaoResumida.Edit;
        ClientPrevisaoResumida.FieldByName('VALOR_'+ FieldByName('OPERACAO').AsString).AsCurrency := FieldByName('VALOR').AsCurrency;

        CalcularEstatistica;
        ClientPrevisaoResumida.Post;
        Next;
      end;
    end;
  end;
  Screen.Cursor := crDefault;
end;

procedure TfrmPrevisao.ParametrosRelatorio;
begin
  dtmControles.frxRelatorio.Variables.Variables['vgPeriodo']    := QuotedStr(tbcPrevisao.Tabs[tbcPrevisao.TabIndex].Caption);
  if dtmControles.frxRelatorio.Variables.Variables['vgPeriodo'] = '''Personalizado''' then
    dtmControles.frxRelatorio.Variables.Variables['vgPeriodo'] := QuotedStr(edtDataInicial.Text+ ' a '+ edtDataFinal.Text);

  dtmControles.frxRelatorio.Variables.Variables['vgConta']      := QuotedStr(lcbConta.Text);
  dtmControles.frxRelatorio.Variables.Variables['TipoOperacao'] := QuotedStr(icxTipoCredito.Text);
end;

procedure TfrmPrevisao.mniSaltarLancamentoClick(Sender: TObject);
var
  viIpServidorXimenes, viMsg : String;
  viSalto, viQtd, viPosicao : Integer;

  procedure CancelarDadosComissao;
  begin
    ExecutaSqlAuxiliar(' UPDATE J_LIVRO_FINANCEIRO SET SITUACAO = '+QuotedStr('4')+
                       ' WHERE LIVRO_FINANCEIRO_COMISSAO_ID = '+ IntToStr(vgDadosLivroCaixa.LivroFinanceiroID),1);
  end;

  procedure CancelarDadosXimenes;
  begin
    viIpServidorXimenes := dtmControles.BuscarConfig('FINANCEIRO', 'XIMENES', 'IP_SERVIDOR', 'S');
    if viIpServidorXimenes <> '' then
    begin
      if FFinanceiro <> nil then
      begin
        case sqlFinanceiroCompromissoCENTRO_CUSTO_ID.AsInteger of
          1 : FFinanceiro.ProtestoLiberarFinanceiroID(sqlFinanceiroCompromissoOPERACAO.AsString, vgDadosLivroCaixa.LivroFinanceiroID);
          3 : FFinanceiro.IntimacaoLiberarFinanceiroID(sqlFinanceiroCompromissoOPERACAO.AsString, vgDadosLivroCaixa.LivroFinanceiroID);
        end;
      end;
    end;
  end;

begin
  if not vlPermitirModificarContaUsuario then
  begin
    Application.MessageBox('Sem Permiss�o pra Registrar!!!','Aviso', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  if tbcPagamentos.TabIndex = 1 then
       viMsg := ' Saltar Lan�amento Agendado?'+#13+#13+' O salto cancela o(s) lan�amento(s) selecionado(s)!!!'
  else viMsg := ' Devolver Item(s) ao Sistema de Origem?';

  if Application.MessageBox(Pchar(viMsg), 'Confirma��o', MB_YESNO) = IDNO then
    exit;

  try
    sqlFinanceiroCompromisso.DisableControls;
    sqlFinanceiroCompromisso.First;
    viSalto   := 0;
    viQtd     := sqlFinanceiroCompromisso.RecordCount;
    viPosicao := sqlFinanceiroCompromisso.RecNo;
    while not sqlFinanceiroCompromisso.Eof do
    begin
      if sqlFinanceiroCompromissocalc_Selecionado.AsBoolean then
      begin
        Inc(viSalto);
        vgDadosLivroCaixa.LivroFinanceiroID   := sqlFinanceiroCompromissoLIVRO_FINANCEIRO_ID.AsInteger;

        vgDadosLivroCaixa.PeriodoId          := 0;
        vgDadosLivroCaixa.LivroAgendamentoId := 0;
        if tbcPagamentos.TabIndex < 2 then
        begin
          vgDadosLivroCaixa.PeriodoId          := sqlFinanceiroCompromissoPERIODO.AsInteger;
          vgDadosLivroCaixa.LivroAgendamentoId := sqlFinanceiroCompromissoLIVRO_AGENDAMENTO_ID.AsInteger;
        end;
        vgDadosLivroCaixa.DataVencimento := sqlFinanceiroCompromissoDATA_VENCIMENTO.AsString;

        dtmLookupFinanceiro.BaixarEstornar('R', '4', vgDadosLivroCaixa.LivroFinanceiroID, vgDadosLivroCaixa.LIvroAgendamentoId, 0, 0);

        if tbcPagamentos.TabIndex < 2 then
          dtmLookupServico.VerificarAtualizacaoAgendamento;

        if vlUsarModuloXimenes then
        begin
          CancelarDadosComissao;
          CancelarDadosXimenes;
        end;
      end;
      sqlFinanceiroCompromisso.Next;
    end;

    if viSalto = 0 then
    begin
      sqlFinanceiroCompromisso.RecNo := viPosicao;
      Application.MessageBox('Nenhum Item Selecionado!!!','Aviso', MB_OK + MB_ICONINFORMATION);
    end
    else
    begin
      btnPesquisarClick(self);
      if (viSalto = 1) and (sqlFinanceiroCompromisso.RecordCount > 1) then
           sqlFinanceiroCompromisso.RecNo := viPosicao
      else sqlFinanceiroCompromisso.First;
    end;
    sqlFinanceiroCompromisso.EnableControls;
  except
    sqlFinanceiroCompromisso.EnableControls;
  end;
end;

procedure TfrmPrevisao.SchedulerDblClick(Sender: TObject);
begin
  vlControle := True;
end;

procedure TfrmPrevisao.sqlFinanceiroAgrupadaCalcFields(DataSet: TDataSet);
begin
  if Pos('D',sqlFinanceiroAgrupadaOPERACAO.AsString) > 0 then
    sqlFinanceiroAgrupadaCALC_SAIDAS.AsCurrency   := sqlFinanceiroAgrupadaVALOR.AsCurrency
  else
    if Pos('R',sqlFinanceiroAgrupadaOPERACAO.AsString) > 0 then
         sqlFinanceiroAgrupadaCALC_ENTRADAS.AsCurrency   := sqlFinanceiroAgrupadaVALOR.AsCurrency
    else sqlFinanceiroAgrupadaCALC_ORCAMENTOS.AsCurrency := sqlFinanceiroAgrupadaVALOR.AsCurrency;
end;

procedure TfrmPrevisao.sqlFinanceiroCompromissoAfterPost(DataSet: TDataSet);
begin
  sqlFinanceiroCompromisso.AfterScroll  := sqlFinanceiroCompromissoAfterScroll;
  sqlFinanceiroCompromissoAfterScroll(sqlFinanceiroCompromisso);
end;

procedure TfrmPrevisao.sqlFinanceiroCompromissoAfterScroll(DataSet: TDataSet);
var
  viSitacao : Integer;
begin
  if not sqlFinanceiroCompromisso.IsEmpty then
       viSitacao := sqlFinanceiroCompromissoSITUACAO.AsInteger
  else viSitacao := 0;

  mniBoleto.Enabled                     := (not sqlFinanceiroCompromisso.IsEmpty) and (sqlFinanceiroCompromissoOPERACAO.AsString = 'R');
  mniAlterarvalorPrevisto.Enabled       := (not sqlFinanceiroCompromisso.IsEmpty) and (tbcPagamentos.TabIndex <> 2);//and (tbcPagamentos.TabIndex = 1) and (viSitacao in [1,2]);
  mniAlterarDataVencimento.Enabled      := (not sqlFinanceiroCompromisso.IsEmpty) and (viSitacao in [1,2,7,8]);
  mniSaltarLancamento.Visible           := (not sqlFinanceiroCompromisso.IsEmpty) and (tbcPagamentos.TabIndex = 1) and (viSitacao in [1,2]);
  mniIraoAgendamento.Visible            := (not sqlFinanceiroCompromisso.IsEmpty) and (tbcPagamentos.TabIndex = 1) and (viSitacao in [1,2]);
  mniRegistrarTodosSelecionados.Enabled := (not sqlFinanceiroCompromisso.IsEmpty) and (tbcPagamentos.TabIndex = 1) and (viSitacao in [1,2]);
  mniRegistrarTodosConferidos.Enabled   := (not sqlFinanceiroCompromisso.IsEmpty) and (tbcPagamentos.TabIndex = 1) and (viSitacao in [1,2]);
  mniCancelarFaturamento.Enabled        := (not sqlFinanceiroCompromisso.IsEmpty);
  mniItensVinculado.Enabled             := ((not sqlFinanceiroCompromisso.IsEmpty) and (viSitacao in [7,8])) or
                                           ((not sqlFinanceiroCompromisso.IsEmpty) and
                                           (tbcPagamentos.TabIndex = 1) and (sqlFinanceiroCompromissoOPERACAO.AsString = 'O')) or
                                           (sqlFinanceiroCompromissoLIVRO_AGENDAMENTO_ID.AsInteger > 0);

  mniRealizarFechamento.Enabled         := (not sqlFinanceiroCompromisso.IsEmpty) and (viSitacao <> 6);
  mniDevolverItem.Enabled               := mniRealizarFechamento.Enabled;
  mniModificarFavorecido.Enabled        := mniRealizarFechamento.Enabled;
  mniAlterardatadeVencimento.Enabled    := mniRealizarFechamento.Enabled;
  mniVerItemdeFaturamento.Enabled       := (not sqlFinanceiroCompromisso.IsEmpty) and (viSitacao = 6);

  mniFinalizarOramento.Visible          := (tbcPagamentos.TabIndex = 1) and vlPermitirModificarContaUsuario and (sqlFinanceiroCompromissoOPERACAO.AsString = 'O');
  mniTransferirOrcamento.Visible        := (tbcPagamentos.TabIndex = 1) and vlPermitirModificarContaUsuario and (sqlFinanceiroCompromissoOPERACAO.AsString = 'O');
  mniRegistrarTodosSelecionados.Visible := (tbcPagamentos.TabIndex = 1) and vlPermitirModificarContaUsuario and (viSitacao in [1,2]);
  mniRegistrarTodosConferidos.Visible   := (tbcPagamentos.TabIndex = 1) and vlPermitirModificarContaUsuario and (viSitacao in [1,2]);
  mniAlterarvalorPrevisto.Visible       := (tbcPagamentos.TabIndex <> 2); //and (viSitacao in [1,2]);
  mniAlterarDataVencimento.Visible      := (viSitacao in [1,2,7,8]);
  mniCancelarFaturamento.Visible        := (viSitacao in [7,8]);

  cxGridDBTableViewSelecionar.Properties.ReadOnly := sqlFinanceiroCompromissoSITUACAO.AsString = '6';
end;

procedure TfrmPrevisao.sqlFinanceiroCompromissoBeforeEdit(DataSet: TDataSet);
begin
  sqlFinanceiroCompromisso.AfterScroll  :=  nil;
end;

procedure TfrmPrevisao.sqlFinanceiroCompromissoBeforePost(DataSet: TDataSet);
begin
  if sqlFinanceiroCompromissoCONFERIDO.AsVariant <> sqlFinanceiroCompromissoCONFERIDO.oldValue then
  begin
    ExecutaSqlAuxiliar(' UPDATE J_LIVRO_FINANCEIRO SET CONFERIDO = '+ QuotedStr(sqlFinanceiroCompromissoCONFERIDO.AsString)+
                       ' WHERE LIVRO_FINANCEIRO_ID = '+ sqlFinanceiroCompromissoLIVRO_FINANCEIRO_ID.AsString,1);
    if (sqlFinanceiroCompromisso.State in [dsEdit]) then       
      sqlFinanceiroCompromisso.CancelUpdates;
    sqlFinanceiroCompromisso.Refresh;    
    Abort;   
  end;
end;

procedure TfrmPrevisao.sqlFinanceiroCompromissoCalcFields(DataSet: TDataSet);
var
  viNumeroDias, viGrupo : Integer;
  viMesConta, viMesAtual, viObservacao : String;

  {$REGION 'VerificarVencimento e Or�amento'}
  procedure VerificarVencimento;
  begin
    if sqlFinanceiroCompromissoATIVADO.AsString = '0' then
    begin
      sqlFinanceiroCompromissocalc_Observacao.AsString := 'AGUARDANDO ATIVA��O DO AGENDAMENTO!!!';
      Exit;
    end;

    if sqlFinanceiroCompromissoOPERACAO.AsString = 'O' then
    begin
      viGrupo := 3; {OR�AMENTOS}
      viObservacao := '  OR�AMENTO '+ sqlFinanceiroCompromissoHISTORICO.AsString +
                      ' * Valor Or�ado '+FormatFloat('R$ ,#0.00', (sqlFinanceiroCompromissoVALOR_AGENDADO.AsCurrency+
                                                     sqlFinanceiroCompromissoVALOR_RESERVA_ENTRADA.AsCurrency-
                                                     sqlFinanceiroCompromissoVALOR_RESERVA_SAIDA.AsCurrency));

      if (sqlFinanceiroCompromissoVALOR_ORCAMENTO_PAGO.AsCurrency > 0) or
         (sqlFinanceiroCompromissoVALOR_ORCAMENTO_COMPROMETIDO.AsCurrency > 0) then
      begin
         viObservacao := viObservacao +
                        '  >> Realizado '+FormatFloat('R$ ,#0.00', sqlFinanceiroCompromissoVALOR_ORCAMENTO_PAGO.AsCurrency)+
                        '  + Comprometido '+FormatFloat('R$ ,#0.00', sqlFinanceiroCompromissoVALOR_ORCAMENTO_COMPROMETIDO.AsCurrency)+
                        '  = Utilizado '+FormatFloat('R$ ,#0.00', (sqlFinanceiroCompromissoVALOR_ORCAMENTO_PAGO.AsCurrency+sqlFinanceiroCompromissoVALOR_ORCAMENTO_COMPROMETIDO.AsCurrency));
      end;
      sqlFinanceiroCompromissocalc_Observacao.AsString := viObservacao;
    end
    else
    begin
      viGrupo := 2; {Proximos Vencimentos e/ou Orcamentos (Caso 2 meses em diante)}
      {*** Verifica Vencimento }
      if sqlFinanceiroCompromissoDATA_VENCIMENTO.AsDateTime = vgDataAtualTipoDate then
        sqlFinanceiroCompromissocalc_Observacao.AsString := 'Vencimento Hoje...'+ sqlFinanceiroCompromissocalc_Observacao.AsString
      else
        if sqlFinanceiroCompromissoDATA_VENCIMENTO.AsDateTime < vgDataAtualTipoDate then
        begin
          viMesConta := copy(sqlFinanceiroCompromissoDATA_VENCIMENTO.AsString,4,2);
          viMesAtual := copy(vgDataAtualTipo4,4,2);
          if viMesConta <> viMesAtual then
               viGrupo := 0 {Vencidos meses anteriores}
          else viGrupo := 1; {Vencidos}
          viNumeroDias := trunc(vgDataAtualTipoDate - sqlFinanceiroCompromissoDATA_VENCIMENTO.AsDateTime);
          sqlFinanceiroCompromissocalc_Observacao.AsString := 'Vencido h� '+ IntToStr(viNumeroDias)+' dia(s)...'+ sqlFinanceiroCompromissocalc_Observacao.AsString;
        end;

      if sqlFinanceiroCompromissoOBSERVACAO.AsString <> '' then
      begin
        if sqlFinanceiroCompromissocalc_Observacao.AsString = '' then
             sqlFinanceiroCompromissocalc_Observacao.AsString := 'Obs.: '+ sqlFinanceiroCompromissoOBSERVACAO.AsString
        else sqlFinanceiroCompromissocalc_Observacao.AsString := sqlFinanceiroCompromissocalc_Observacao.AsString +
                                                                 ' - Obs.: '+ sqlFinanceiroCompromissoOBSERVACAO.AsString;
      end;

{     if sqlFinanceiroCompromissoDATA_HISTORICO.AsString <> '' then
        sqlFinanceiroCompromissocalc_Observacao.AsString := sqlFinanceiroCompromissocalc_Observacao.AsString + ' *** '+
                                                            'Hist�rico de Altera��o de Vencimento = '+ sqlFinanceiroCompromissoDATA_HISTORICO.AsString;}
    end;
  end;
  {$ENDREGION}

  {$REGION 'DefinirValorCreditoDebitoOrcamento'}
  procedure DefinirValorCreditoDebitoOrcamento;
  begin
    if pos('D', sqlFinanceiroCompromissoOPERACAO.AsString) > 0 then
      sqlFinanceiroCompromissocalc_saida.AsCurrency   := sqlFinanceiroCompromissoCALC_VALOR_RECEBER.AsCurrency
    else
      if pos('R', sqlFinanceiroCompromissoOPERACAO.AsString) > 0 then
         sqlFinanceiroCompromissocalc_Entrada.AsCurrency := sqlFinanceiroCompromissoCALC_VALOR_RECEBER.AsCurrency
    else
    begin
      sqlFinanceiroCompromissocalc_saida.AsCurrency   := sqlFinanceiroCompromissoVALOR_AGENDADO.AsCurrency -
                                                          (sqlFinanceiroCompromissoVALOR_ORCAMENTO_COMPROMETIDO.AsCurrency+
                                                           sqlFinanceiroCompromissoVALOR_ORCAMENTO_PAGO.AsCurrency+
                                                           sqlFinanceiroCompromissoVALOR_RESERVA_ENTRADA.AsCurrency-
                                                           sqlFinanceiroCompromissoVALOR_RESERVA_SAIDA.AsCurrency);
      if sqlFinanceiroCompromissocalc_saida.AsCurrency < 0 then
        sqlFinanceiroCompromissocalc_saida.AsCurrency := 0;
    end;

    if sqlFinanceiroCompromissocalc_saida.AsCurrency > 0 then
         sqlFinanceiroCompromissocalc_ValorRegistrar.AsCurrency := sqlFinanceiroCompromissocalc_saida.AsCurrency
    else sqlFinanceiroCompromissocalc_ValorRegistrar.AsCurrency := sqlFinanceiroCompromissocalc_Entrada.AsCurrency;
  end;
  {$ENDREGION}

  {$REGION 'CarregarCamposCalculado'}
  procedure CarregarCamposCalculado;
  begin
    if sqlFinanceiroCompromissoOPERACAO.AsString = 'O' then
    begin
      sqlFinanceiroCompromissocalc_nome.AsString        := '';
      sqlFinanceiroCompromissocalc_caixa.AsString       := '0';
      sqlFinanceiroCompromissocalc_compromisso.AsString := '0';
      sqlFinanceiroCompromissocalc_historico.AsString   := dtmLookupContabil.FormatarAnoMes(sqlFinanceiroCompromissoANO_MES_REFERENCIA.AsString);
      sqlFinanceiroCompromissoCALC_CENTROCUSTO.AsInteger:= 0;
    end
    else
    begin
      sqlFinanceiroCompromissocalc_nome.AsString        := sqlFinanceiroCompromissoNOME.AsString;
      sqlFinanceiroCompromissocalc_caixa.AsInteger      := sqlFinanceiroCompromissoCAIXA_ID.AsInteger;
      sqlFinanceiroCompromissocalc_compromisso.AsInteger:= sqlFinanceiroCompromissoCONTABIL_CONTA_ID.AsInteger;
      sqlFinanceiroCompromissocalc_historico.AsString   := sqlFinanceiroCompromissoHISTORICO.AsString;
      sqlFinanceiroCompromissoCALC_CENTROCUSTO.AsInteger:= sqlFinanceiroCompromissoCENTRO_CUSTO_ID.AsInteger;
    end;
    {$ENDREGION}

    sqlFinanceiroCompromissocalc_orcamento.AsBoolean := sqlFinanceiroCompromissoORCAMENTO_ID.AsInteger > 0;
  end;

  {$REGION 'CalcularSaldo'}
  Procedure CalcularSaldo;
  begin
    if DataSet.State = dsInternalCalc then
    begin
      if sqlFinanceiroCompromissocalc_saida.AsCurrency > 0 then
           sqlFinanceiroCompromissoCALC_SALDO.AsFloat := FSaldoAnterior - sqlFinanceiroCompromissocalc_saida.AsCurrency
      else sqlFinanceiroCompromissoCALC_SALDO.AsFloat := FSaldoAnterior + sqlFinanceiroCompromissocalc_Entrada.AsCurrency;

      FSaldoAnterior:=sqlFinanceiroCompromissoCALC_SALDO.AsFloat;
    end;
  end;
  {$ENDREGION}

begin
  sqlFinanceiroCompromissocalc_Referencia.AsString      := dtmLookupContabil.FormatarAnoMes(sqlFinanceiroCompromissoANO_MES_REFERENCIA.AsString);

  if sqlFinanceiroCompromissoVALOR_CALCULO.AsCurrency > 0 then
       sqlFinanceiroCompromissoCALC_VALOR_RECEBER.AsCurrency := sqlFinanceiroCompromissoVALOR_CALCULO.AsCurrency
  else sqlFinanceiroCompromissoCALC_VALOR_RECEBER.AsCurrency := sqlFinanceiroCompromissoVALOR_AGENDADO.AsCurrency;
  sqlFinanceiroCompromissoCALC_VALOR_RECEBER.AsCurrency := sqlFinanceiroCompromissoCALC_VALOR_RECEBER.AsCurrency - sqlFinanceiroCompromissoVALOR_PAGO_SOMA.AsCurrency;
  DefinirValorCreditoDebitoOrcamento;

  if sqlFinanceiroCompromissoVALOR_PAGO_SOMA.AsCurrency > 0 then
    sqlFinanceiroCompromissocalc_Observacao.AsString := 'Valor do Compromisso Agendado R$ '+FormatFloat(',#0.00', sqlFinanceiroCompromissoVALOR_AGENDADO.AsCurrency)+
                                                        ' *** Valor ja Realizado R$ '+FormatFloat(',#0.00', sqlFinanceiroCompromissoVALOR_PAGO_SOMA.AsCurrency);
  VerificarVencimento;
  CarregarCamposCalculado;

  sqlFinanceiroCompromissocalc_Grupo.AsInteger := viGrupo;
  VisualizarImprimirBoleto.Enabled := sqlFinanceiroCompromissoBOLETA_ID.AsInteger > 0;


  sqlFinanceiroCompromissoCALC_PARCELA.AsString := dtmLookupContabil.CalcularParcela(sqlFinanceiroCompromissoPARCELA.AsInteger,
                                                                                     sqlFinanceiroCompromissoPARCELA_INICIAL.AsInteger,
                                                                                     sqlFinanceiroCompromissoQTD.AsInteger);
  CalcularSaldo;

  if sqlFinanceiroCompromissoSITUACAO.AsString <> '6' then
    sqlFinanceiroCompromissocalc_Situacao.AsString := sqlFinanceiroCompromissoSITUACAO.AsString
  else
  begin
     sqlFinanceiroCompromissocalc_Observacao.AsString := 'Faturado no Item Financeiro '+sqlFinanceiroCompromissoFECHAMENTO_ID.AsString;
    if sqlFinanceiroCompromissoLIVRO_CAIXA_FATURADO_ID.AsInteger = 0 then
         sqlFinanceiroCompromissocalc_Situacao.AsString := sqlFinanceiroCompromissoSITUACAO.AsString
    else sqlFinanceiroCompromissocalc_Situacao.AsString := '9';
  end;

  if (sqlFinanceiroCompromissoVALOR_BOLETO.AsCurrency > 0) then
  begin
    if (sqlFinanceiroCompromissoVALOR_BOLETO.AsCurrency <> sqlFinanceiroCompromissoVALOR_CALCULO.AsCurrency) then
    begin
      if sqlFinanceiroCompromissocalc_Observacao.AsString = '' then
           sqlFinanceiroCompromissocalc_Observacao.AsString := ' Valor do Boleto = '+FormatFloat('R$ ,#0.00', sqlFinanceiroCompromissoVALOR_BOLETO.AsCurrency)
      else sqlFinanceiroCompromissocalc_Observacao.AsString := sqlFinanceiroCompromissocalc_Observacao.AsString +
                                                             '  ** Valor do Boleto = '+FormatFloat('R$ ,#0.00', sqlFinanceiroCompromissoVALOR_BOLETO.AsCurrency);
    end
    else
      if (sqlFinanceiroCompromissoVALOR_AGENDADO.AsCurrency <> sqlFinanceiroCompromissoVALOR_CALCULO.AsCurrency) then
      begin
        if sqlFinanceiroCompromissocalc_Observacao.AsString = '' then
             sqlFinanceiroCompromissocalc_Observacao.AsString := ' Valor do Compromisso = '+FormatFloat('R$ ,#0.00', sqlFinanceiroCompromissoVALOR_AGENDADO.AsCurrency)
        else sqlFinanceiroCompromissocalc_Observacao.AsString := sqlFinanceiroCompromissocalc_Observacao.AsString +
                                                                 '  ** Valor do Compromisso = '+FormatFloat('R$ ,#0.00', sqlFinanceiroCompromissoVALOR_AGENDADO.AsCurrency);
       end;

  end;
end;

procedure TfrmPrevisao.sqlFinanceiroRemuneracaoCalcFields(DataSet: TDataSet);
var
  viNumeroDias, viGrupo : Integer;
  viMesConta, viMesAtual : String;

  procedure VerificarVencimento;
  begin
    viGrupo := 2; {Proximos Vencimentos e/ou Orcamentos (Caso 2 meses em diante)}
    {*** Verifica Vencimento }
    if sqlFinanceiroCompromissoDATA_VENCIMENTO.AsDateTime = vgDataAtualTipoDate then
      sqlFinanceiroCompromissocalc_Observacao.AsString := 'Vencimento Hoje...'+ sqlFinanceiroCompromissocalc_Observacao.AsString
    else
      if sqlFinanceiroCompromissoDATA_VENCIMENTO.AsDateTime < vgDataAtualTipoDate then
      begin
        viMesConta := copy(sqlFinanceiroCompromissoDATA_VENCIMENTO.AsString,4,2);
        viMesAtual := copy(vgDataAtualTipo4,4,2);
        if viMesConta <> viMesAtual then
             viGrupo := 0 {Vencidos meses anteriores}
        else viGrupo := 1; {Vencidos}
        viNumeroDias := trunc(vgDataAtualTipoDate - sqlFinanceiroCompromissoDATA_VENCIMENTO.AsDateTime);
        sqlFinanceiroCompromissocalc_Observacao.AsString := 'Vencido h� '+ IntToStr(viNumeroDias)+' dia(s)...'+ sqlFinanceiroCompromissocalc_Observacao.AsString;
      end;
  end;

begin
  sqlFinanceiroCompromissocalc_Referencia.AsString      := dtmLookupContabil.FormatarAnoMes(sqlFinanceiroCompromissoANO_MES_REFERENCIA.AsString);
  sqlFinanceiroCompromissoCALC_VALOR_RECEBER.AsCurrency := sqlFinanceiroCompromissoVALOR_AGENDADO.AsCurrency - sqlFinanceiroCompromissoVALOR_PAGO_SOMA.AsCurrency;

  if sqlFinanceiroCompromissoVALOR_PAGO_SOMA.AsCurrency > 0 then
    sqlFinanceiroCompromissocalc_Observacao.AsString := 'Valor do Compromisso Agendado R$ '+FormatFloat(',#0.00', sqlFinanceiroCompromissoVALOR_AGENDADO.AsCurrency)+
                                                        ' *** Valor ja Realizado R$ '+FormatFloat(',#0.00', sqlFinanceiroCompromissoVALOR_PAGO_SOMA.AsCurrency);
  VerificarVencimento;
  sqlFinanceiroCompromissocalc_Grupo.AsInteger  := viGrupo;

end;

procedure TfrmPrevisao.sqlLancamentoFavoritoAfterScroll(DataSet: TDataSet);
begin
  btnExcluirFavorito.Enabled    := not sqlLancamentoFavorito.IsEmpty;
  btnRealizarLancamento.Enabled := not sqlLancamentoFavorito.IsEmpty;
end;

procedure TfrmPrevisao.tabExibirChange(Sender: TObject);
begin
  LockWindowUpdate(Handle);
  tabSaldo.TabVisible     := tabExibir.TabIndex = 1;
  tabFavoritos.TabVisible := tabExibir.TabIndex = 2;
  pgcModulos.Visible      := tabExibir.TabIndex > 0;

  case tabExibir.TabIndex of
    1 : begin
          pgcModulos.ActivePageIndex := tabExibir.TabIndex - 1;

          if vgDadosCadastro.Confirmado then
          begin
            vgAbrindoForm      := True;
            vlNaoCarregarSaldo := False;
            dtmLookupContabil.CarregarSaldoCaixa(ClientCaixa, False);
            vgAbrindoForm      := False;
            vgDadosCadastro.Confirmado := False;
          end;
        end;
    2 : begin
          pgcModulos.ActivePageIndex := tabExibir.TabIndex - 1;
        end;
  end;
  LockWindowUpdate(0);
end;

procedure TfrmPrevisao.tbcPagamentosChange(Sender: TObject);
begin
  HabilitarCampos;
  gbxListaProtocolo.Visible := tbcPagamentos.TabIndex = 2;

  if vgAbrindoForm then
    exit;

  icxTipoCredito.Enabled := True;
  vlSituacao := '1,2,6,7,8';

  pgcDadosPrevisao.HideTabs := tbcPagamentos.TabIndex <> 1;
  pgcDadosPrevisao.ActivePageIndex := StrToInt(vlPesquisaGridPadrao);

  case tbcPagamentos.TabIndex of
    0 : begin
          vgDadosCadastro.SomentePesquisa := True;
          dtmLookupServico.CarregarDadosLancamento(1, 0, nil);
          ExibirFormulario(TfrmCadastroRapidoLancamento, frmCadastroRapidoLancamento, True);
          tbcPagamentos.TabIndex := 1;
        end;
    1,3 : begin
          btnLimparClick(self);
          cxGridDBTablePrevisao.PopupMenu := PopupAjuste;
          if vgDadosLivroCaixa.Confirmado then
            dtmLookupContabil.CarregarSaldoCaixa(ClientCaixa);
          cxGridDBTableCompromissoClienteGeral.Caption := 'Favorecido';
          if tbcPagamentos.TabIndex = 3 then
            vlSituacao := '7,8';
        end;
    2 : begin
          pgcDadosPrevisao.ActivePageIndex := 0;
          memListaProtocolo.Clear;
          cxGridDBTablePrevisao.PopupMenu := PopCaucaia;
          if vgDadosLivroCaixa.Confirmado then
            dtmLookupContabil.CarregarSaldoCaixa(ClientCaixa);
          cxGridDBTableCompromissoClienteGeral.Caption := 'Favorecido';
        end;
  end;

  vlPesquisaAuto := True;
  tbcPrevisaoChange(self);
end;

procedure TfrmPrevisao.tbcPagamentosChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if vgAbrindoForm then
    exit;


  vlNaoPesquisar := True;
  if tbcPagamentos.TabIndex = 2 then
    icxTipoCredito.EditValue := 0;
  vlNaoPesquisar := False;
end;

procedure TfrmPrevisao.tbcPrevisaoChange(Sender: TObject);
var
  viDataIni, viDataFin, viReferencia, viCondicao, viTipoFinanceiro, viSql,
  viCondicaoPesquisa, vlCondicaoAdicional, viValor: String;
  viTipo : Integer;

  {$REGION 'MONTAR PESQUISA PREVISAO'}
  procedure MontarSqlPrevisao;
  begin
    if vlSituacao = '' then
      vlSituacao := '1,2,6,7,8';
    viSql := ' SELECT LF.*, P.NOME, P.IDENTIFICACAO, P.TIPO,  P.UTILIZA_BOLETO, B.NOSSO_NUMERO, B.VALOR AS VALOR_BOLETO, '+
             '       LA.PERIODO, LA.QTD, LA.PARCELA_INICIAL, LA.DOC_TIPO, LA.REFERENCIA_PERIODO, LA.SITUACAO AS ATIVADO, LA.DATA_FINAL, LA.DATA_REGISTRO, '+
             '   coalesce((SELECT SUM(LC1.VALOR) FROM J_LIVRO_CAIXA LC1 '+
             '   WHERE LC1.LIVRO_FINANCEIRO_ID = LF.LIVRO_FINANCEIRO_ID),0) '+
             '   AS VALOR_PAGO_SOMA, '+

             '   coalesce((SELECT SUM(LF2.VALOR_AGENDADO) FROM J_LIVRO_FINANCEIRO LF2 '+
             '   WHERE LF2.ORCAMENTO_ID = LF.LIVRO_AGENDAMENTO_ID '+
             '     AND LF2.ANO_MES_REFERENCIA = LF.ANO_MES_REFERENCIA '+
             '     AND SITUACAO IN (1,2)),0) '+
             '   AS VALOR_ORCAMENTO_COMPROMETIDO, '+

             '   coalesce((SELECT SUM(LC2.VALOR) FROM J_LIVRO_CAIXA LC2 '+
             '   WHERE LC2.ORCAMENTO_ID = LF.LIVRO_AGENDAMENTO_ID '+
             '     AND LC2.ANO_MES_REGISTRO = LF.ANO_MES_REFERENCIA),0) '+
             '   AS VALOR_ORCAMENTO_PAGO, '+

             '   coalesce((SELECT SUM(OS.VALOR) FROM J_ORCAMENTO_RESERVA OS '+
             '   WHERE OS.LIVRO_FINANCEIRO_DESTINO_ID = LF.LIVRO_FINANCEIRO_ID),0) '+
             '   AS VALOR_RESERVA_ENTRADA, '+

             '   coalesce((SELECT SUM(OS.VALOR) FROM J_ORCAMENTO_RESERVA OS '+
             '   WHERE OS.LIVRO_FINANCEIRO_ORIGEM_ID = LF.LIVRO_FINANCEIRO_ID),0) '+
             '   AS VALOR_RESERVA_SAIDA, '+

             '     CASE WHEN LF.LIVRO_FINANCEIRO_COMISSAO_ID > 0 '+
             '       THEN (SELECT LF3.SITUACAO FROM J_LIVRO_FINANCEIRO LF3 '+
             '                    WHERE LF3.LIVRO_FINANCEIRO_ID = LF.LIVRO_FINANCEIRO_COMISSAO_ID) '+
             '     END AS SITUACAO_COMISSAO '+

             '   FROM J_LIVRO_FINANCEIRO LF '+
             '   LEFT OUTER JOIN J_PESSOA P ON '+
             '   LF.PESSOA_ID = P.PESSOA_ID '+
             '   LEFT OUTER JOIN J_LIVRO_AGENDAMENTO LA ON '+
             '   LF.LIVRO_AGENDAMENTO_ID = LA.LIVRO_AGENDAMENTO_ID '+
             '   LEFT OUTER JOIN J_BOLETO B ON '+
             '   LF.BOLETA_ID = B.BOLETO_ID '+
             '  WHERE LF.SITUACAO IN ('+vlSituacao+') '+viCondicaoPesquisa+ vlCondicaoAdicional +
             '  ORDER BY LF.DATA_VENCIMENTO, LF.PROCESSO_CONTRATO_ITEM_ID, LF.DATA_VENCIMENTO, LF.ANO_MES_REFERENCIA ';

    if tbcPagamentos.TabIndex = 2 then
    begin
      if (vlCondicaoAdicional = '') and (Trim(edtPalavraPesquisa.Text) = '') then
      begin
        if (not vlPesquisaAuto) and (pgcPrevisao.ActivePageIndex = 0) then
          Application.MessageBox('Nenhum Filtro de Pesquisa Selecionado!','Aviso', MB_OK + MB_ICONINFORMATION);
        vlPesquisaAuto := False;
        Exit;
      end;
      vlPesquisaAuto := False;

      if (lcxTipoCarga.EditValue = '2') or (lcxTipoCarga.EditValue = '3') then
           cxGridDBTablePrevisaoProtocolo.GroupIndex := -1
      else cxGridDBTablePrevisaoProtocolo.GroupIndex := 1;
    end
    else cxGridDBTablePrevisaoProtocolo.GroupIndex := -1;

    sqlFinanceiroCompromisso.DisableControls;
    sqlFinanceiroCompromisso.AfterScroll  := nil;
    sqlFinanceiroCompromisso.OnCalcFields := nil;

    sqlFinanceiroCompromisso.Active := False;
    sqlFinanceiroCompromisso.DataSet.CommandText := viSql;
    sqlFinanceiroCompromisso.Active := True;

    sqlFinanceiroCompromisso.AfterScroll  := sqlFinanceiroCompromissoAfterScroll;
    sqlFinanceiroCompromisso.OnCalcFields := sqlFinanceiroCompromissoCalcFields;

    sqlFinanceiroCompromissoAfterScroll(sqlFinanceiroCompromisso);
    sqlFinanceiroCompromisso.EnableControls;
  end;

  {$ENDREGION}

  {$REGION 'MONTAR CONDICAO'}
  Procedure MontarCondicoes;
  var
    viListaProt : String;
    i : Integer;
    viListaProtocolo: TStrings;
    viProtocolo: string;
    viCondicao: string;
    viCondicoes: TStrings;
  begin
    viCondicaoPesquisa := '';
    vlCondicaoData     := '';

    sqlFinanceiroCompromisso.Filtered := False;
    viTipoFinanceiro := ' (LF.PROCESSO_CONTRATO_ITEM_ID IS NULL)';

    case tbcPrevisao.TabIndex of
      0..1 : vlCondicaoData := ' (LF.DATA_VENCIMENTO <= ' +QuotedStr(TrocaBarraPPonto(viDataFin))+')';
      2..7 : vlCondicaoData := ' (LF.ANO_MES_REFERENCIA '+viCondicao+viReferencia+')';
      8    : vlCondicaoData := ' (LF.DATA_VENCIMENTO >= '+QuotedStr(TrocaBarraPPonto(viDataIni)) + ') AND (LF.DATA_VENCIMENTO <= ' + QuotedStr(TrocaBarraPPonto(viDataFin))+')';
      9    : vlCondicaoData := ' (NOT LF.BOLETA_ID IS NULL)';
    end;

    viCondicaoPesquisa    := vlCondicaoData;
    if lcbConta.ItemIndex > 0 then
      viCondicaoPesquisa := vlCondicaoData + ' AND (LF.CAIXA_ID ='+IntToStr(lcbConta.EditValue)+')';

    // Armazena Condi��o para Previs�o do Saldo
    vgCondicaoPrecisaoCaixa := 'AND '+ viCondicaoPesquisa;
    vgCondicaoPrecisaoCaixa := TrocaBarraPPonto(vgCondicaoPrecisaoCaixa);

    // Pesquisa por Palavra
    if trim(edtPalavraPesquisa.Text) <> '' then
    begin
      viCondicaoPesquisa := viCondicaoPesquisa +
                                         ' AND ((P.NOME LIKE '+QuotedStr('%'+edtPalavraPesquisa.Text+'%')+')'+
                                         '  OR (LF.HISTORICO LIKE '+QuotedStr('%'+edtPalavraPesquisa.Text+'%')+')'+
                                         '  OR (P.IDENTIFICACAO LIKE '+QuotedStr('%'+edtPalavraPesquisa.Text+'%')+')'+
                                         '  OR (B.NOSSO_NUMERO = '+TrocaVirgPPto(RetornaNumericoValor(edtPalavraPesquisa.Text))+')'+
                                         '  OR (LF.DOCUMENTO_NUMERO = '+QuotedStr(edtPalavraPesquisa.Text)+')';
      viValor := TrocaVirgPPto(RetornaNumericoValor(edtPalavraPesquisa.Text));
      if viValor <> '' then
           viCondicaoPesquisa := viCondicaoPesquisa + ' OR (LF.VALOR_AGENDADO = '+ viValor +')'+
                                                      ' OR (LF.VALOR_CALCULO = '+ viValor +')'+
                                                      ' OR (B.VALOR = '+ viValor +'))'
      else viCondicaoPesquisa := viCondicaoPesquisa + ')';
    end;

    viListaProtocolo := TStringList.Create;
    viCondicoes := TStringList.Create;
    try
      if memListaProtocolo.Lines.Count > 0 then
      begin
        for i := 1 to memListaProtocolo.Lines.Count do
        begin
          viProtocolo := memListaProtocolo.Lines[i - 1].Trim;
          if viProtocolo.IsEmpty then
            Continue;

          viListaProtocolo.Add(
            viProtocolo);

          if I mod 1000 = 0  then
          begin
            viCondicao := string.Format(
              '(LF.DOCUMENTO_NUMERO IN (%s)) ',
              [string.Join(
                ', ',
                viListaProtocolo.ToStringArray)]);

            viCondicoes.Add(
              viCondicao);

            viListaProtocolo.Clear;
          end;
        end;

        if viListaProtocolo.Count > 0 then
        begin
          viCondicao := string.Format(
            '(LF.DOCUMENTO_NUMERO IN (%s)) ',
            [string.Join(
              ', ',
              viListaProtocolo.ToStringArray)]);

          viCondicoes.Add(
            viCondicao);
        end;

        viCondicaoPesquisa := viCondicaoPesquisa + string.Format(
          ' AND (%s) ',
          [string.Join(
            ' OR ',
            viCondicoes.ToStringArray)]);
      end;
    finally
      viListaProtocolo.Free;
      viCondicoes.Free;
    end;

    case tbcPagamentos.TabIndex of
      1 : viCondicaoPesquisa := viCondicaoPesquisa +' AND LF.TIPO_CARGA_ID IS NULL';
      2 : begin
            if lcxTipoCarga.Text = '' then
                 viCondicaoPesquisa := viCondicaoPesquisa + ' AND NOT LF.TIPO_CARGA_ID IS NULL'
            else viCondicaoPesquisa := viCondicaoPesquisa + ' AND LF.TIPO_CARGA_ID = '+IntToStr(lcxTipoCarga.EditValue);

          end;
      3 :
    end;

    vlCondicaoAdicional := '';
    if lcxCentroCusto.Text <> '' then
      vlCondicaoAdicional := vlCondicaoAdicional + ' AND LF.CENTRO_CUSTO_ID = '+IntToStr(lcxCentroCusto.EditValue);

    if lcxCompromisso.Text <> '' then
      vlCondicaoAdicional := vlCondicaoAdicional + ' AND LF.CONTABIL_CONTA_ID = '+IntToStr(lcxCompromisso.EditValue);

    if lcxModalidade.Text <> '' then
      vlCondicaoAdicional := vlCondicaoAdicional + ' AND LF.TIPO_MODALIDADE_ID = '+IntToStr(lcxModalidade.EditValue);

    if lcxTipoCarga.Text <> '' then
      vlCondicaoAdicional := vlCondicaoAdicional + ' AND LF.TIPO_CARGA_ID = '+IntToStr(lcxTipoCarga.EditValue);

    if lcxFavorecido.Text <> '' then
      vlCondicaoAdicional := vlCondicaoAdicional + ' AND LF.PESSOA_ID = '+IntToStr(lcxFavorecido.EditValue);

    if lcxGrupo.Text <> '' then
      vlCondicaoAdicional := vlCondicaoAdicional + ' AND P.IDENTIFICACAO = '+QuotedStr(lcxGrupo.Text);

    cxGridDBTablePrevisaoProtocolo.Visible := tbcPagamentos.TabIndex = 2;

    viCondicao := ''; vlOperacaoPesquisada := '';
    viTipo := icxTipoCredito.EditValue;
    case viTipo of
      1 : begin
            viCondicao := ' AND (LF.OPERACAO = '+ QuotedStr('R')+')';
            vlOperacaoPesquisada := '*R,';
          end;
      2 : begin
            viCondicao := ' AND (LF.OPERACAO = '+ QuotedStr('D')+')';
            vlOperacaoPesquisada := '*D,';
          end;
      3 : begin
            viCondicao := ' AND ((LF.OPERACAO = '+ QuotedStr('AD')+') OR (LF.OPERACAO = '+ QuotedStr('AR')+') OR'+
                          '      (LF.OPERACAO = '+ QuotedStr('TD')+') OR (LF.OPERACAO = '+ QuotedStr('TR')+'))';
            vlOperacaoPesquisada := '*AD,*AR,*TD,*TR,';
          end;
      4 : begin
            viCondicao := ' AND (LF.OPERACAO = '+ QuotedStr('O')+')';
            vlOperacaoPesquisada := '*O,'
          end;
      5 : begin
            viCondicao := ' AND (LF.OPERACAO <> '+ QuotedStr('O')+')';
            vlOperacaoPesquisada := '*R,*D,*AD,*AR,*TD,*TR,';
          end;
    end;

    viCondicaoPesquisa := ' AND '+ viCondicaoPesquisa + ' AND '+ viTipoFinanceiro + viCondicao;

    if not vlPermitirModificarContaUsuario then
      viCondicaoPesquisa := viCondicaoPesquisa + ' AND LA.USUARIO_ID = '+vgUsuarioID;
  end;
  {$ENDREGION}

  {$REGION 'MONTAR PREVISAO AGRUPADA'}
  procedure MontarPrevisaoAgrupada;
  begin
    viSql := ' SELECT SUM(LF.VALOR_AGENDADO) AS VALOR, '+
             '        P.NOME, P.IDENTIFICACAO, LF.TIPO_CARGA_ID, LF.PESSOA_ID, '+
             '        LF.CENTRO_CUSTO_ID, LF.OPERACAO, LF.BALANCETE_GRUPO_ID '+
             ' FROM J_LIVRO_FINANCEIRO LF '+
             ' LEFT OUTER JOIN J_PESSOA P ON '+
             ' LF.PESSOA_ID = P.PESSOA_ID '+
             ' LEFT OUTER JOIN J_LIVRO_AGENDAMENTO LA ON '+
             ' LF.LIVRO_AGENDAMENTO_ID = LA.LIVRO_AGENDAMENTO_ID '+
             ' WHERE LF.SITUACAO = 1 AND '+vlCondicaoData +
             ' GROUP BY LF.BALANCETE_GRUPO_ID, LF.CENTRO_CUSTO_ID, P.NOME, P.IDENTIFICACAO, LF.TIPO_CARGA_ID, LF.OPERACAO, LF.PESSOA_ID ';
    sqlFinanceiroAgrupada.Active := False;
    sqlFinanceiroAgrupada.DataSet.CommandText := viSql;
    sqlFinanceiroAgrupada.Active := True;
  end;
  {$ENDREGION}

  {$REGION 'VerificarBoletoRegistrado'}
  procedure VerificarBoletoRegistrado;
  var
    viLista : TStringList;
    viNumero : String;
  begin
    if sqlFinanceiroCompromisso.IsEmpty then
    begin
      viNumero := RetornaNumerico(edtPalavraPesquisa.Text);
      if viNumero <> '' then
      begin
        viLista  := dtmControles.GetFields(' SELECT FIRST 1 LC.DATA_PAGAMENTO, B.VALOR '+
                                           '  FROM J_BOLETO B '+
                                           '    LEFT OUTER JOIN J_lIVRO_FINANCEIRO LF ON '+
                                           '    B.BOLETO_ID = LF.BOLETA_ID '+
                                           '    LEFT OUTER JOIN J_LIVRO_CAIXA LC ON '+
                                           '    LC.LIVRO_FINANCEIRO_ID = LF.LIVRO_FINANCEIRO_ID '+
                                           '  WHERE LF.SITUACAO = '+QuotedStr('3')+
                                           '    AND B.NOSSO_NUMERO = '+viNumero);
        if viLista.Values['DATA_PAGAMENTO'] <> '' then
        begin
          Application.MessageBox(Pchar('Boleto j� registrado!!!'+#13+#13+
                                       'Valor = '+FormatFloat('R$ ,#0.00',StrToFloat(viLista.Values['VALOR']))+#13+
                                       'Data  = '+viLista.Values['DATA_PAGAMENTO']),'Aviso', MB_OK + MB_ICONINFORMATION);
          exit;
        end;
      end;
    end;
  end;
  {$ENDREGION}

begin
  sqlFinanceiroCompromisso.Active := False;
  Screen.Cursor := crHourGlass;
  viCondicao := '<=';

  HabilitarCampos;

  pnlPeriodoPersonalizado.Visible := tbcPrevisao.TabIndex = 8;
  case tbcPrevisao.TabIndex of
    0 : begin
          viDataIni := vgDataAtualTipo4;
          viDataFin := vgDataAtualTipo4;
        end;
    1 : begin
          viDataIni := vgDataAtualTipo4;
          viDataFin := datetostr(StrToDate(vgDataAtualTipo4)+6);
        end;
    2 : begin
          MontarDataInicioFinal(vgDataAtualTipo4, viDataIni, viDataFin, '/');
          viReferencia := QuotedStr(PegarAnoMes(viDataFin));
        end;
    3 : begin
          viReferencia := QuotedStr(PegarAnoMes(DateToStr(vgDataAtualTipoDate+30)));
          viCondicao   := '=';
        end;
    4 : viReferencia := QuotedStr(PegarAnoMes(DateToStr(vgDataAtualTipoDate+60)));
    5 : viReferencia := QuotedStr(PegarAnoMes(DateToStr(vgDataAtualTipoDate+180)));
    6 : viReferencia := QuotedStr(PegarAnoMes(DateToStr(vgDataAtualTipoDate+333)));
    7 : begin
          MontarDataInicioFinal(vgDataAtualTipo4, viDataIni, viDataFin, '/', '12');
          viReferencia := QuotedStr(PegarAnoMes(viDataFin));
        end;
    8 : begin
          if pgcFinanceiroPrevisao.ActivePageIndex > 0 then
            pgcFinanceiroPrevisao.ActivePageIndex := 0;

          if (edtDataInicial.EditValue = null) or (edtDataFinal.EditValue = null) then
          begin
            edtDataInicial.Date := vlDataTipo4;
            edtDataFinal.Date   := vlDataTipo4;
            edtDataFinal.SetFocus;
          end;
          viDataIni := datetostr(edtDataInicial.Date);
          viDataFin := datetostr(edtDataFinal.Date);
        end;
    9 : viReferencia := '';
  end;

  MontarCondicoes;
  MontarSqlPrevisao;
  MontarPrevisaoAgrupada;
  pgcFinanceiroPrevisaoChange(self);
  VerificarBoletoRegistrado;

  cxGridDBTablePrevisao.DataController.Groups.FullExpand;
  cxGridDBTablePrevResumida.DataController.Groups.FullExpand;
  Screen.Cursor := crDefault;
  AtivarPesquisaPadrao(IntToStr(tbcPrevisao.TabIndex));

  cxGridDBTablePrevisao.DataController.Groups.FullExpand;

  CarregarPrevisaoSaldoAtual(vlOperacaoPesquisada);
end;

procedure TfrmPrevisao.mniItensVinculadoClick(Sender: TObject);
begin
  vgDadosCadastro.SomentePesquisa := True;

  if (sqlFinanceiroCompromissoSITUACAO.AsInteger in [7,8]) then
  begin
    vgItensVinculados.visualizar := True;
    vgItensVinculados.Id := sqlFinanceiroCompromissoLIVRO_FINANCEIRO_ID.AsString;
    vgItensVinculados.Campo  := 'FECHAMENTO_ID';
    vgItensVinculados.Titulo := 'Itens do Faturamento - '+sqlFinanceiroCompromissoHISTORICO.AsString;
    vgItensVinculados.AnoMesReferencia := '';
  end
  else
    if sqlFinanceiroCompromissoOPERACAO.AsString = 'O' then
    begin
      vgItensVinculados.Id               := sqlFinanceiroCompromissoLIVRO_AGENDAMENTO_ID.AsString;
      vgItensVinculados.Campo            := 'ORCAMENTO_ID';
      vgItensVinculados.Titulo           := 'Itens do Or�amento - '+sqlFinanceiroCompromissoHISTORICO.AsString;
      vgItensVinculados.AnoMesReferencia := sqlFinanceiroCompromissoANO_MES_REFERENCIA.AsString;
    end
    else
    begin
      vgItemAgendamentoId := sqlFinanceiroCompromissoLIVRO_AGENDAMENTO_ID.AsInteger;
      vgItemFinanceiroId  := sqlFinanceiroCompromissoLIVRO_FINANCEIRO_ID.AsInteger;
      ExibirFormulario(TfrmItensAgendamento, frmItensAgendamento, True);
      exit;
    end;
  ExibirFormulario(TfrmItensVinculados, frmItensVinculados, True);
end;

procedure TfrmPrevisao.mniVerItemdeFaturamentoClick(Sender: TObject);
var
  viId : Integer;
begin
  viId := sqlFinanceiroCompromissoFECHAMENTO_ID.AsInteger;
  tbcPagamentos.TabIndex := 3;
  sqlFinanceiroCompromisso.Locate('LIVRO_FINANCEIRO_ID', viId, [loCaseInsensitive]);
  gdrCompromissoAgendado.SetFocus;
end;

function TfrmPrevisao.VerificarItensAbetroFaturamento: Boolean;
var
  viSql : String;
begin
  viSql := ' SELECT LF.DATA_VENCIMENTO AS DATA, '+
           '       LF.LIVRO_FINANCEIRO_ID, '+
           '       LF.LIVRO_CAIXA_FATURADO_ID, '+
           '       LF.DOCUMENTO_NUMERO, '+
           '       LF.TIPO_MODALIDADE_ID, '+
           '       LF.PESSOA_ID, '+
           '       LF.CONTABIL_CONTA_ID, '+
           '       LF.HISTORICO, '+
           '       LF.VALOR_AGENDADO AS VALOR, '+
           '       LF.OPERACAO, '+
           '       LF.PARCELA, '+
           '       P.NOME, '+
           '       CC.DESCRICAO AS COMPROMISSO '+
           ' FROM J_LIVRO_FINANCEIRO LF '+
           '   LEFT OUTER JOIN J_PESSOA P ON '+
           '   LF.PESSOA_ID = P.PESSOA_ID '+
           '   LEFT OUTER JOIN J_CONTABIL_CONTA CC ON '+
           '   LF.CONTABIL_CONTA_ID = CC.CONTABIL_CONTA_ID '+
           ' WHERE '+vgItensVinculados.campo + ' = ' + vgItensVinculados.Id + '  AND LF.LIVRO_CAIXA_FATURADO_ID IS NULL ';

  if vgItensVinculados.AnoMesReferencia <> '' then
    viSql := viSql + ' AND ANO_MES_REFERENCIA = '+ QuotedStr(vgItensVinculados.AnoMesReferencia);

  ExecutaSqlAuxiliar(viSql,0);
  VerificarItensAbetroFaturamento := dtmControles.sqlAuxiliar.IsEmpty;
  dtmControles.sqlAuxiliar.Active := False;
end;

procedure TfrmPrevisao.VisualizarImprimirBoletoClick(Sender: TObject);
begin
  if sqlFinanceiroCompromissoBOLETA_ID.AsInteger = 0 then begin
    Application.MessageBox('Arquivo n�o foi gerado!','Informa��o', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  vgCaminhoArquivo := dtmControles.GetStr('select PATH_GERARPDF from J_BOLETO where BOLETO_ID = ' +
    sqlFinanceiroCompromissoBOLETA_ID.AsString);

  if not FileExists(vgCaminhoArquivo) then begin
    Application.MessageBox('Caminho do arquivo n�o encontrado!','Informa��o', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  ExibirFormulario(TfrmVisualizaBoleto, frmVisualizaBoleto, True);
end;

end.


