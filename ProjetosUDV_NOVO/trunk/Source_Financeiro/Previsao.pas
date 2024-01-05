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
  dxSkinOffice2013LightGray, cxImage, cxButtonEdit, cxSpinEdit, cxRadioGroup,
  FrameCalculadora; //ACBrBoleto, ACBrBoletoFCFR, ACBrBase;

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
    dtsFinanceiroCompromisso: TDataSource;
    sqlFinanceiroCompromissocalc_Observacao: TStringField;
    sqlFinanceiroCompromissoCALC_GRUPO: TStringField;
    pgcPagamentoRepasse: TcxPageControl;
    sqlFinanceiroCompromissoNOME: TStringField;
    tbcPagamentos: TcxTabControl;
    gdrCompromissoAgendado: TcxGrid;
    cxGridDBTablePrevisao: TcxGridDBTableView;
    cxGridDBTableCompromissoDataPrevista: TcxGridDBColumn;
    cxGridDBTableCompromissoClienteGeral: TcxGridDBColumn;
    cxGridDBTableCompromissoCompromisso: TcxGridDBColumn;
    cxGridDBTableCompromissoEspecie: TcxGridDBColumn;
    cxGridDBTableCompromissoBoleto: TcxGridDBColumn;
    cxGridDBTableCompromissoReferencia: TcxGridDBColumn;
    cxGridDBTableViewObservacao: TcxGridDBColumn;
    cxGridDBTableGrupo: TcxGridDBColumn;
    cxGridLevel7: TcxGridLevel;
    sqlFinanceiroCompromissocalc_TipoFinanceiro: TStringField;
    ClientReserva: TClientDataSet;
    dtsCaixa: TDataSource;
    pnlTitulo: TPanel;
    Panel3: TPanel;
    Panel6: TPanel;
    sbnImprimirPrevisao: TSpeedButton;
    lblPrevisao: TcxLabel;
    Panel9: TPanel;
    cxLabel6: TcxLabel;
    lcbConta: TcxLookupComboBox;
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
    pnlPesquisaPErsonalizada: TPanel;
    lcxFiltroTarefa: TcxBarEditItem;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    Panel1: TPanel;
    pnlPeriodoPersonalizado: TPanel;
    cxLabel10: TcxLabel;
    edtDataInicial: TcxDateEdit;
    cxLabel3: TcxLabel;
    edtDataFinal: TcxDateEdit;
    Panel7: TPanel;
    btnPesquisar: TcxButton;
    cxLabel1: TcxLabel;
    sqlFinanceiroCompromissoHISTORICO: TStringField;
    cxGridDBTablePrevisaoHistorico: TcxGridDBColumn;
    btnLimpar: TcxButton;
    sqlFinanceiroCompromissoOBSERVACAO: TStringField;
    sqlFinanceiroCompromissoLIVRO_AGENDAMENTO_ID: TFMTBCDField;
    dxBarButton4: TdxBarButton;
    pgcModulos: TcxPageControl;
    cxSplitterTexto: TcxSplitter;
    dxBarGrid0: TdxBarButton;
    dxBarGrid1: TdxBarButton;
    dxBarGrid2: TdxBarButton;
    dxBarGrid3: TdxBarButton;
    cxGridDBTablePrevisaoOperacao: TcxGridDBColumn;
    SchedulerDBStorage: TcxSchedulerDBStorage;
    Panel2: TPanel;
    cxBtnFechar: TcxButton;
    sqlFinanceiroCompromissocalc_Entrada: TCurrencyField;
    cxGridDBTableCompromissoSaida: TcxGridDBColumn;
    cxGridDBTableCompromissoEntrada: TcxGridDBColumn;
    sqlFinanceiroCompromissocalc_saida: TCurrencyField;
    sqlFinanceiroCompromissoIR: TStringField;
    sqlFinanceiroCompromissoCAIXA_ID: TFMTBCDField;
    cxGridDBTableCompromissoCaixa: TcxGridDBColumn;
    sqlFinanceiroCompromissoDOCUMENTO_NUMERO: TStringField;
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
    sqlFinanceiroCompromissoREGISTRO_PARCIAL: TStringField;
    sqlFinanceiroCompromissoVALOR_PAGO_SOMA: TFMTBCDField;
    btnLimparCaixa: TcxButton;
    ClientListaCaixa: TClientDataSet;
    dtsListaCaixa: TDataSource;
    ClientListaCaixaCAIXA_ID: TIntegerField;
    ClientListaCaixaDESCRICAO: TStringField;
    ClientListaCaixaRESUMO: TStringField;
    PopupAjuste: TPopupMenu;
    SaltarLanamento1: TMenuItem;
    N1: TMenuItem;
    AlterarvalorPrevisto1: TMenuItem;
    GerarBoleto: TMenuItem;
    edtPalavraPesquisa: TcxTextEdit;
    icxTipoCredito: TcxImageComboBox;
    N2: TMenuItem;
    ExportarExcel1: TMenuItem;
    mniBoleto: TMenuItem;
    VisualizarImprimirBoleto: TMenuItem;
    sqlFinanceiroCompromissoUTILIZA_BOLETO: TStringField;
    dxSaldoAtual: TdxBarStatic;
    dxPrevisaoSaldo: TdxBarStatic;
    sqlFinanceiroCompromissoORCAMENTO_ID: TFMTBCDField;
    sqlFinanceiroCompromissoVALOR_ORCAMENTO_COMPROMETIDO: TFMTBCDField;
    sqlFinanceiroCompromissoVALOR_ORCAMENTO_PAGO: TFMTBCDField;
    sqlFinanceiroCompromissocalc_caixa: TIntegerField;
    sqlFinanceiroCompromissocalc_compromisso: TIntegerField;
    sqlFinanceiroCompromissocalc_historico: TStringField;
    sqlFinanceiroCompromissocalc_nome: TStringField;
    sqlFinanceiroCompromissocalc_orcamento: TBooleanField;
    cxGridDBTablePrevisaoColumn1: TcxGridDBColumn;
    N3: TMenuItem;
    mniTransferirOrcamento: TMenuItem;
    sqlFinanceiroCompromissoVALOR_RESERVA_ENTRADA: TFMTBCDField;
    sqlFinanceiroCompromissoVALOR_RESERVA_SAIDA: TFMTBCDField;
    FinalizarOramento1: TMenuItem;
    sqlFinanceiroCompromissoCALC_SALDO: TCurrencyField;
    cxGridDBTablePrevisaoColumn2: TcxGridDBColumn;
    sqlFinanceiroCompromissoPERIODO: TStringField;
    sqlFinanceiroCompromissoPARCELA: TFMTBCDField;
    sqlFinanceiroCompromissoQTD: TFMTBCDField;
    sqlFinanceiroCompromissoPARCELA_INICIAL: TFMTBCDField;
    sqlFinanceiroCompromissoCALC_PARCELA: TStringField;
    cxGridDBTablePrevisaoColumn3: TcxGridDBColumn;
    sqlFinanceiroCompromissoDOC_TIPO: TStringField;
    sqlFinanceiroCompromissoRESERVA_ID: TFMTBCDField;
    sqlFinanceiroCompromissoREFERENCIA_PERIODO: TStringField;
    tabFavoritos: TcxTabSheet;
    Panel4: TPanel;
    btnRealizarLancamento: TcxButton;
    btnExcluirFavorito: TcxButton;
    grdBasica: TcxGrid;
    grdBasicaDBTableView1: TcxGridDBTableView;
    grdBasicaDBTablePessoa: TcxGridDBColumn;
    grdBasicaDBTableContabilConta: TcxGridDBColumn;
    grdBasicaDBTableHistorico: TcxGridDBColumn;
    grdBasicaDBTableView1Column1: TcxGridDBColumn;
    grdBasicaLevel1: TcxGridLevel;
    sqlLancamentoFavorito: TSimpleDataSet;
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
    sqlLancamentoFavoritoCONTABIL_GRUPO_ID: TFMTBCDField;
    sqlLancamentoFavoritoDOCUMENTO_NUMERO: TStringField;
    sqlLancamentoFavoritoAUTOMATICO: TStringField;
    sqlLancamentoFavoritoCODIGO_FINALIZACAO: TFMTBCDField;
    sqlLancamentoFavoritoORCAMENTO_HISTORICO_ID: TFMTBCDField;
    sqlLancamentoFavoritoORCAMENTO_ID: TFMTBCDField;
    sqlLancamentoFavoritoINDICE_IMAGEM: TFMTBCDField;
    sqlLancamentoFavoritoDOC_TIPO: TStringField;
    sqlLancamentoFavoritoDATA_LANCAMENTO: TSQLTimeStampField;
    sqlLancamentoFavoritoFAVORITO_SITUACAO: TStringField;
    sqlLancamentoFavoritoFAVORITO_VALOR: TFMTBCDField;
    dtsLancamentoFavorito: TDataSource;
    sqlLancamentoFavoritoASSOCIADO_ID: TFMTBCDField;
    sqlLancamentoFavoritoCOMPROMISSO_VENCIDO_ID: TFMTBCDField;
    sqlLancamentoFavoritoRESERVA_ID: TFMTBCDField;
    sqlLancamentoFavoritoFAVORECIDO_ASSOCIADO: TStringField;
    sqlFinanceiroCompromissoTIPO_DESPESA_ID: TFMTBCDField;
    sqlLancamentoFavoritoTIPO_DESPESA_ID: TFMTBCDField;
    dxBarManagerResponsavel: TdxBar;
    dxBarStatic2: TdxBarStatic;
    dxBarPresidente: TdxBarStatic;
    dxBarStatic5: TdxBarStatic;
    dxBarOrgan: TdxBarStatic;
    tabReserva: TcxTabSheet;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    cxGridDBTableView1Column3: TcxGridDBColumn;
    ClientCaixa: TClientDataSet;
    dtsReserva: TDataSource;
    ClientReservaRESERVA_DESCRICAO: TStringField;
    ClientReservaVALOR_RESERVA: TCurrencyField;
    ClientReservaBALANCETE_GRUPO_ID: TIntegerField;
    ClientCaixaCAIXA_ID: TIntegerField;
    ClientCaixaPRINCIPAL: TStringField;
    ClientCaixaVALOR: TCurrencyField;
    ClientCaixaPESSOA_ID: TIntegerField;
    ClientCaixaDESCRICAO: TStringField;
    ClientCaixaSITUACAO: TStringField;
    ClientCaixaRESUMO: TStringField;
    cxGridDBTableView1Column4: TcxGridDBColumn;
    ClientReservaVALOR_ENTRADA: TCurrencyField;
    ClientReservaVALOR_SAIDA: TCurrencyField;
    ClientReservaRESERVA_ID: TIntegerField;
    dxBarCombo3: TdxBarCombo;
    dxBarSubItem3: TdxBarSubItem;
    CustomdxBarCombo1: TCustomdxBarCombo;
    dxBarButton5: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarButton6: TdxBarButton;
    dxBarFechamento: TdxBarButton;
    dxBarSubItem4: TdxBarSubItem;
    dxBarInfoFechamento: TdxBarStatic;
    cxBarEditItem4: TcxBarEditItem;
    dxBarReabrir: TdxBarButton;
    gbxSomaItensSelecionados: TcxGroupBox;
    btnAdValor: TSpeedButton;
    btnDeduzirValor: TSpeedButton;
    edtValorSomaSelecionados: TcxCurrencyEdit;
    ClientReservaSALDO_ANTERIOR: TCurrencyField;
    ClientReservaRESULTADO_MES: TCurrencyField;
    ClientSaldoReservaPrevisao: TClientDataSet;
    ClientSaldoReservaPrevisaoRESERVA_DESCRICAO: TStringField;
    ClientSaldoReservaPrevisaoVALOR_RESERVA: TCurrencyField;
    ClientSaldoReservaPrevisaoBALANCETE_GRUPO_ID: TIntegerField;
    ClientSaldoReservaPrevisaoVALOR_ENTRADA: TCurrencyField;
    ClientSaldoReservaPrevisaoVALOR_SAIDA: TCurrencyField;
    ClientSaldoReservaPrevisaoRESERVA_ID: TIntegerField;
    ClientSaldoReservaPrevisaoSALDO_ANTERIOR: TCurrencyField;
    ClientSaldoReservaPrevisaoRESULTADO_MES: TCurrencyField;
    sqlLancamentoFavoritoDESCRICAO_AGRUPADOR: TStringField;
    sqlLancamentoFavoritoORDEM: TFMTBCDField;
    ClientSaldoReserva: TClientDataSet;
    ClientSaldoReservaRESERVA_DESCRICAO: TStringField;
    ClientSaldoReservaVALOR_RESERVA: TCurrencyField;
    ClientSaldoReservaBALANCETE_GRUPO_ID: TIntegerField;
    ClientSaldoReservaVALOR_ENTRADA: TCurrencyField;
    ClientSaldoReservaVALOR_SAIDA: TCurrencyField;
    ClientSaldoReservaRESERVA_ID: TIntegerField;
    ClientSaldoReservaSALDO_ANTERIOR: TCurrencyField;
    ClientSaldoReservaRESULTADO_MES: TCurrencyField;
    tabCalculadora: TcxTabSheet;
    fmeCalculadora1: TfmeCalculadora;
    procedure FormCreate(Sender: TObject);
    procedure tabExibirChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgcPrevisaoChange(Sender: TObject);
    procedure sqlFinanceiroCompromissoCalcFields(DataSet: TDataSet);
    procedure tbcPrevisaoChange(Sender: TObject);
    procedure cxGridDBTablePrevisaoDblClick(Sender: TObject);
    procedure sqlFinanceiroRemuneracaoCalcFields(DataSet: TDataSet);
    procedure tbcPagamentosChange(Sender: TObject);
    procedure ClientReservaCalcFields(DataSet: TDataSet);
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
    procedure SaltarLanamento1Click(Sender: TObject);
    procedure AlterarvalorPrevisto1Click(Sender: TObject);
    procedure GerarBoletoClick(Sender: TObject);
    procedure ExportarExcel1Click(Sender: TObject);
    procedure VisualizarImprimirBoletoClick(Sender: TObject);
    procedure mniTransferirOrcamentoClick(Sender: TObject);
    procedure sqlFinanceiroCompromissoAfterScroll(DataSet: TDataSet);
    procedure FinalizarOramento1Click(Sender: TObject);
    procedure btnRealizarLancamentoClick(Sender: TObject);
    procedure btnExcluirFavoritoClick(Sender: TObject);
    procedure sqlLancamentoFavoritoAfterScroll(DataSet: TDataSet);
    procedure grdBasicaDBTableView1DblClick(Sender: TObject);
    procedure dxBarFechamentoClick(Sender: TObject);
    procedure dxBarReabrirClick(Sender: TObject);
    procedure btnAdValorClick(Sender: TObject);
    procedure btnDeduzirValorClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure pgcModulosChange(Sender: TObject);
  private
    vlDataTipo4, vlData3Dias, vlDataTipo3 : TDate;
    vlControle : Boolean;
    vlOperacaoPesquisada : String;
    FSaldoAnterior: real;

    // Definir Layout
    procedure AtivarGravarLayout(vpTipo : String);
    procedure AtivarVisualizacaoCaixa(vpTipo : String);
    procedure AtivarPesquisaPadrao(vpTipo : String; vpPesquisar : Boolean = False);
    procedure CarregarPrevisaoSaldoAtual(vpOperacao : String);
    procedure AberturaFechamentoCaixa(vpOpcao : Integer);

  public
    vgAbrindoForm, vgAtualizarTarefa : Boolean;
  end;

var
  frmPrevisao: TfrmPrevisao;
  vgTipoForm : String;
  vlPessoaId : Integer;

implementation

uses
  Controles, Cadastro, Lookup, Rotinas,
  Lookup_Contabil, CadastroRapidoContas, CadastroRapidoLancamento,
  Lookup_Servico, LookupFinanceiro,
  CadastroRapidoOrcTransf, VisualizaBoleto, ValidarPermissaoUsuario;

{$R *.dfm}

procedure TfrmPrevisao.AberturaFechamentoCaixa(vpOpcao : Integer);
var
  viAnoMesFechamento, viAnoMesProximo : String;
begin
  viAnoMesFechamento := dtmControles.GetStr(' SELECT ANO_MES_FECHAMENTO FROM T_CEDENTE '+
                                            ' WHERE CEDENTE_ID = '+IntToStr(vgCedenteAtivo));

  case vpOpcao of
    1 : begin
          if viAnoMesFechamento = '' then
          begin
            viAnoMesFechamento := dtmControles.GetStr(' SELECT MIN(ANO_MES_REGISTRO) FROM J_LIVRO_CAIXA '+
                                                      ' WHERE SITUACAO IS NULL ');

            dxBarInfoFechamento.Caption := 'Nenhum Livro Caixa Fechado';
          end
          else dxBarInfoFechamento.Caption := 'Livro Caixa Fechado at� '+Mes[StrToInt(copy(viAnoMesFechamento,5,2))] +' de '+copy(viAnoMesFechamento,1,4);
        end;
  end;
end;

procedure TfrmPrevisao.AlterarvalorPrevisto1Click(Sender: TObject);
var
  viValorPrevisto, viMensagem : String;
  viFlag : Boolean;
  viValorAnterior : Currency;
begin
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
end;

procedure TfrmPrevisao.AtivarVisualizacaoCaixa(vpTipo: String);
begin
  if PadronizacaoLayout(vpTipo, 'LAYOUT', 'ListaCaixa', '0') = '0' then
       icxVisualizacao.ItemIndex := 0
  else icxVisualizacao.ItemIndex := 1;
  lvLivro.Visible       := icxVisualizacao.ItemIndex = 0;
  cxgCaixaLevel.Visible := icxVisualizacao.ItemIndex = 1;
end;

procedure TfrmPrevisao.btnAdValorClick(Sender: TObject);
begin
  edtValorSomaSelecionados.EditValue := dtmLookupFinanceiro.AdicionarDeduzirValorSelecionados(edtValorSomaSelecionados.EditValue,'A');
end;

procedure TfrmPrevisao.btnDeduzirValorClick(Sender: TObject);
begin
  edtValorSomaSelecionados.EditValue := dtmLookupFinanceiro.AdicionarDeduzirValorSelecionados(edtValorSomaSelecionados.EditValue,'D');
end;

procedure TfrmPrevisao.btnExcluirFavoritoClick(Sender: TObject);
begin
  if Application.MessageBox('Retirar Item dos Lan�amentos Favoritos?', 'Confirma��o', MB_YESNO) = IDNO then
    exit;

  ExecutaSqlAuxiliar(' UPDATE J_LIVRO_CAIXA SET FAVORITO_SITUACAO = '+QuotedStr('N')+
                     ' WHERE LIVRO_CAIXA_ID = '+sqlLancamentoFavoritoLIVRO_CAIXA_ID.AsString,1);
  sqlLancamentoFavorito.Refresh;
end;

procedure TfrmPrevisao.btnLimparCaixaClick(Sender: TObject);
begin
  lcbConta.ItemIndex := 0;
end;

procedure TfrmPrevisao.btnLimparClick(Sender: TObject);
begin
  edtPalavraPesquisa.Clear;
  btnPesquisarClick(Self);

end;

procedure TfrmPrevisao.btnPesquisarClick(Sender: TObject);
begin
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
    viConta    := IntToStr(lcbConta.EditValue);
  viSaldo := dtmLookupContabil.CalcularSaldoCaixa('', viConta,'');
  dtmLookupContabil.PreencherSaldoLabel(' Saldo Atual R$ ',viSaldo, dxSaldoAtual,True, '1');
  FSaldoAnterior := viSaldo;

  // Valores Previstos
  viValorPrevisao := dtmLookupContabil.CalcularPrevisaoCaixa(vgCondicaoPrecisaoCaixa,vpOperacao);
  viValorPrevisao := viSaldo + viValorPrevisao;
  dtmLookupContabil.PreencherSaldoLabel(' Previs�o de Saldo  '+ tbcPrevisao.Tabs[tbcPrevisao.TabIndex].Caption+' R$ ',viValorPrevisao, dxPrevisaoSaldo, True ,'2');
end;

procedure TfrmPrevisao.ClientReservaCalcFields(DataSet: TDataSet);
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

procedure TfrmPrevisao.cxBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrevisao.cxGridDBTablePrevisaoDblClick(Sender: TObject);
begin
  if tbcPagamentos.TabIndex = 1 then
  begin
    vgDadosCadastro.SomentePesquisa := True;
    dtmLookupServico.CarregarDadosLancamento(2, 0, sqlFinanceiroCompromisso);
    ExibirFormulario(TfrmCadastroRapidoLancamento, frmCadastroRapidoLancamento, True);
    if not vgDadosLivroCaixa.Confirmado then
      exit;
    sqlFinanceiroCompromisso.Refresh;
    dtmLookupContabil.CarregarSaldoCaixa(ClientCaixa);
  end;
end;

procedure TfrmPrevisao.cxGridDBTablePrevisaoSelectionChanged(
  Sender: TcxCustomGridTableView);
var
  viQtd : Integer;
begin
  viQtd := cxGridDBTablePrevisao.DataController.GetSelectedCount;
  if viQtd = 1 then
  begin
    gbxSomaItensSelecionados.Visible := False;
    exit;
  end;
  gbxSomaItensSelecionados.Visible := True;
  dtmLookupFinanceiro.SomarSelecionados(cxGridDBTablePrevisao, edtValorSomaSelecionados,
                                        cxGridDBTableCompromissoEntrada, cxGridDBTableCompromissoSaida,
                                        cxGridDBTablePrevisaoOperacao, False,1);
end;

procedure TfrmPrevisao.dxBarFechamentoClick(Sender: TObject);
begin
  AberturaFechamentoCaixa(2);
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

procedure TfrmPrevisao.dxBarReabrirClick(Sender: TObject);
begin
  AberturaFechamentoCaixa(3);
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
  ExportGridToExcel('C:\TEMP\RELTEMP.XLS', gdrCompromissoAgendado);
  AbrirPlanilha();
  sqlFinanceiroCompromisso.Refresh;
end;

procedure TfrmPrevisao.FinalizarOramento1Click(Sender: TObject);
begin
  if Application.MessageBox(Pchar('Finalizar Or�amento. Confirma?'+#13+
                                  'O Saldo Dispon�vel do Or�amento � de '+FormatFloat('R$ ,#0.00', sqlFinanceiroCompromissocalc_saida.AsCurrency)),'Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
    exit;

  ExecutaSqlAuxiliar(' UPDATE J_LIVRO_FINANCEIRO SET SITUACAO = '+QuotedStr('4')+
                     ' WHERE LIVRO_FINANCEIRO_ID = '+sqlFinanceiroCompromissoLIVRO_FINANCEIRO_ID.AsString,1);
  sqlFinanceiroCompromisso.Refresh;
end;

procedure TfrmPrevisao.FormActivate(Sender: TObject);

  procedure PreencherIdentificadores(vpIdentificador : String; vpCampo : TdxBarStatic);
  begin
    dxBarManagerResponsavel.Visible := dtmControles.BuscarConfig('PRINCIPAL', 'MENU', 'MOSTRAR_BARRA_RESPONSAVEL', 'S') = 'S';
    if not dxBarManagerResponsavel.Visible then
      exit;

    vpCampo.Caption := dtmControles.GetStr(' SELECT A.NOME FROM J_TIPO_DESPESA TD '+
                                           '    LEFT OUTER JOIN T_PESSOA A ON '+
                                           '    TD.PESSOA_ID = A.PESSOA_ID '+
                                           ' WHERE TD.TIPO_DESPESA_ID = '+vpIdentificador);
    if vpCampo.Caption = '' then
      vpCampo.Caption := 'N�o Informado'
  end;
begin
  if not vgAbrindoForm then
    sqlFinanceiroCompromisso.Refresh;

  if vgDadosCadastro.AtualizarSaldo then
  begin
    dtmLookupContabil.CarregarSaldoCaixa(ClientCaixa, False);
    dtmLookupContabil.CarregarSaldoReservas(ClientReserva, ClientSaldoReserva, dtmLookupContabil.ConverterAnoMesBase(vgPeriodoAtualS));
    cxGridDBTableView1.DataController.Groups.FullExpand;

    CarregarPrevisaoSaldoAtual(vlOperacaoPesquisada);
    vgDadosCadastro.AtualizarSaldo := False;
  end;

  PreencherIdentificadores('3',dxBarPresidente);
  PreencherIdentificadores('2',dxBarOrgan);
  edtPalavraPesquisa.SetFocus;
end;

procedure TfrmPrevisao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action      := caFree;
  frmPrevisao := nil;
end;

procedure TfrmPrevisao.FormCreate(Sender: TObject);
begin
  vgBoletoID := 0;
  sqlFinanceiroCompromisso.Connection := dtmControles.DB;
  sqlLancamentoFavorito.Connection    := dtmControles.DB;
  sqlLancamentoFavorito.Open;

  vgAbrindoForm      := True;
  vgAtualizarTarefa  := False;

  dxBarCombo2.ItemIndex := 2;
  vlDataTipo4 := StrToDate(dtmControles.DataHoraBanco(4));
  vlData3Dias := (dtmControles.DataHoraBanco(3)+3);
  vlDataTipo3 := dtmControles.DataHoraBanco(3);

  tabExibir.TabIndex               := 0;
  cxBarEditItemPesquisar.EditValue := 1;
  tbcPagamentos.TabIndex  := 1;
  vgDataAtualTipo4        := dtmControles.DataHoraBanco(4);
  vgDataAtualTipoDate     := StrToDate(vgDataAtualTipo4);

  AtivarGravarLayout('');
  AtivarVisualizacaoCaixa('');
  AtivarPesquisaPadrao('', True);

  pgcPagamentoRepasse.ActivePageIndex := 0 ;
  pgcPrevisao.HideTabs := True;

  tabExibir.Tabs[1].Visible := dtmControles.CodPermissao('CAD_SALDO_DETALHADO')[6] <> '0';

  dxBarData.Caption := Rotinas.MaiusculoMinusculo(FormatDateTime('dddd, dd', dtmControles.DataHoraBanco(3)) + ' de ' +
                                       FormatDateTime('MMMM', dtmControles.DataHoraBanco(3)) + ' de ' +
                                       FormatDateTime('yyyy', dtmControles.DataHoraBanco(3)));
  AberturaFechamentoCaixa(1);
end;

procedure TfrmPrevisao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  r : Char;
begin
  if (key = 107) and (gbxSomaItensSelecionados.Visible) then
    btnAdValorClick(self);

  if (key = 109) and (gbxSomaItensSelecionados.Visible) then
    btnDeduzirValorClick(self);
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
  viRetornoBoleto := dtmLookupFinanceiro.CriarTitulo(
    sqlFinanceiroCompromissoLIVRO_FINANCEIRO_ID.AsInteger,viBancoId);
  if not viRetornoBoleto.ImprimiuBoleto then begin
    Application.MessageBox('Falha ao gerar arquivo','Aviso', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  try
    sqlFinanceiroCompromisso.Edit;
    sqlFinanceiroCompromissoBOLETA_ID.AsInteger := viRetornoBoleto.boletoId;
    sqlFinanceiroCompromisso.ApplyUpdates(0);

    ExecutaSqlAuxiliar('update J_LIVRO_FINANCEIRO set BOLETA_ID = ' +
      IntToStr(viRetornoBoleto.boletoId) + ' where LIVRO_FINANCEIRO_ID = ' +
      sqlFinanceiroCompromissoLIVRO_FINANCEIRO_ID.AsString, 1);

    Application.MessageBox('Boleto gerado com sucesso!','Aviso', MB_OK + MB_ICONINFORMATION);
  except on E: Exception do
    Application.MessageBox(Pchar('Falha ao atualizar! ' + E.Message),'Aviso', MB_OK + MB_ICONINFORMATION);
  end;
end;

procedure TfrmPrevisao.grdBasicaDBTableView1DblClick(Sender: TObject);
begin
  btnRealizarLancamentoClick(Self);
end;

procedure TfrmPrevisao.icxVisualizacaoPropertiesChange(Sender: TObject);
begin
  AtivarVisualizacaoCaixa(IntToStr(icxVisualizacao.ItemIndex));
end;

procedure TfrmPrevisao.pgcModulosChange(Sender: TObject);
begin
  if pgcModulos.ActivePageIndex = 3 then
  begin
    if fmeCalculadora1.ClientValores.IsEmpty then
      fmeCalculadora1.CarregarDadosSalvo;

    fmeCalculadora1.rdbRegistrarQtdClick(Self);
  end;
end;

procedure TfrmPrevisao.pgcPrevisaoChange(Sender: TObject);
begin
{  pgcPrevisao.ActivePageIndex := 0;

  tabExibir.Tabs[1].Visible := (pgcPrevisao.ActivePage = tabPrevisaoFinanceira);
  if (pgcPrevisao.ActivePage <> tabPrevisaoFinanceira) then
    tabExibir.TabIndex := 0;}

  LockWindowUpdate(Handle);

  tabExibir.Properties.HideTabs := not (pgcPrevisao.ActivePage = tabPrevisaoFinanceira);
  if pgcPrevisao.ActivePage = tabPrevisaoFinanceira then
  begin
    tabExibir.TabIndex := 0;
    tabExibirChange(Self);
    sqlFinanceiroCompromisso.Active := False;
    sqlFinanceiroCompromisso.Active := True;
    tbcPrevisaoChange(Self);
    dtmLookupContabil.CarregarSaldoCaixa(ClientCaixa);
    dtmLookupContabil.CarregarSaldoCaixa(ClientListaCaixa, True, True);
    edtPalavraPesquisa.SetFocus;
  end;

  LockWindowUpdate(0);
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

procedure TfrmPrevisao.SaltarLanamento1Click(Sender: TObject);
begin
  if Application.MessageBox(Pchar(' Saltar Lan�amento Agendado?'+#13+#13+
                                  ' O Salto Cancela o Lan�amento Selecionado!!!'), 'Confirma��o', MB_YESNO) = IDNO then
    exit;

  vgDadosLivroCaixa.LivroFinanceiroID   := sqlFinanceiroCompromissoLIVRO_FINANCEIRO_ID.AsInteger;
  vgDadosLivroCaixa.PeriodoId           := sqlFinanceiroCompromissoPERIODO.AsInteger;
  vgDadosLivroCaixa.LivroAgendamentoId  := sqlFinanceiroCompromissoLIVRO_AGENDAMENTO_ID.AsInteger;
  vgDadosLivroCaixa.DataVencimento      := sqlFinanceiroCompromissoDATA_VENCIMENTO.AsString;

  dtmLookupFinanceiro.BaixarEstornar('R', '4', vgDadosLivroCaixa.LivroFinanceiroID, vgDadosLivroCaixa.LIvroAgendamentoId, 0, 0);
  dtmLookupServico.VerificarAtualizacaoAgendamento;

  sqlFinanceiroCompromisso.Refresh;
end;

procedure TfrmPrevisao.SchedulerDblClick(Sender: TObject);
begin
  vlControle := True;
end;

procedure TfrmPrevisao.sqlFinanceiroCompromissoAfterScroll(DataSet: TDataSet);
begin
  mniBoleto.Enabled              := sqlFinanceiroCompromissoOPERACAO.AsString = 'R';
  mniTransferirOrcamento.Enabled := sqlFinanceiroCompromissoOPERACAO.AsString = 'O';
end;

procedure TfrmPrevisao.sqlFinanceiroCompromissoCalcFields(DataSet: TDataSet);
var
  viNumeroDias, viGrupo : Integer;
  viMesConta, viMesAtual, viObservacao : String;

  procedure VerificarVencimento;
  begin
    if sqlFinanceiroCompromissoOPERACAO.AsString = 'O' then
    begin
      viGrupo := 3; {OR�AMENTOS}
      viObservacao := '  OR�AMENTO '+ sqlFinanceiroCompromissoHISTORICO.AsString;

      if (sqlFinanceiroCompromissoVALOR_ORCAMENTO_PAGO.AsCurrency > 0) or
         (sqlFinanceiroCompromissoVALOR_ORCAMENTO_COMPROMETIDO.AsCurrency > 0) then
      begin
        viObservacao := viObservacao +
                        '  * Valores >> Or�amento '+FormatFloat('R$ ,#0.00', (sqlFinanceiroCompromissoVALOR_AGENDADO.AsCurrency+
                                                                              sqlFinanceiroCompromissoVALOR_RESERVA_ENTRADA.AsCurrency-
                                                                              sqlFinanceiroCompromissoVALOR_RESERVA_SAIDA.AsCurrency))+
                        '  >> Realizado '+FormatFloat('R$ ,#0.00', sqlFinanceiroCompromissoVALOR_ORCAMENTO_PAGO.AsCurrency)+
                        '  >> Comprometido '+FormatFloat('R$ ,#0.00', sqlFinanceiroCompromissoVALOR_ORCAMENTO_COMPROMETIDO.AsCurrency)+
                        '  = Disponivel '+FormatFloat('R$ ,#0.00', (sqlFinanceiroCompromissoVALOR_AGENDADO.AsCurrency -
                                  (sqlFinanceiroCompromissoVALOR_ORCAMENTO_PAGO.AsCurrency+sqlFinanceiroCompromissoVALOR_ORCAMENTO_COMPROMETIDO.AsCurrency)));
      end;
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
    end;
  end;

  procedure DefinirValorCreditoDebitoOrcamento;
  begin
    if pos('D', sqlFinanceiroCompromissoOPERACAO.AsString) > 0 then
      sqlFinanceiroCompromissocalc_saida.AsCurrency   := sqlFinanceiroCompromissoCALC_VALOR_RECEBER.AsCurrency
    else
      if pos('R', sqlFinanceiroCompromissoOPERACAO.AsString) > 0 then
         sqlFinanceiroCompromissocalc_Entrada.AsCurrency := sqlFinanceiroCompromissoCALC_VALOR_RECEBER.AsCurrency
    else sqlFinanceiroCompromissocalc_saida.AsCurrency   := sqlFinanceiroCompromissoVALOR_AGENDADO.AsCurrency -
                                                            (sqlFinanceiroCompromissoVALOR_ORCAMENTO_COMPROMETIDO.AsCurrency+
                                                             sqlFinanceiroCompromissoVALOR_ORCAMENTO_PAGO.AsCurrency+
                                                             sqlFinanceiroCompromissoVALOR_RESERVA_ENTRADA.AsCurrency-
                                                             sqlFinanceiroCompromissoVALOR_RESERVA_SAIDA.AsCurrency);
  end;

  procedure CarregarCamposCalculado;
  begin
    if sqlFinanceiroCompromissoOPERACAO.AsString = 'O' then
    begin
      sqlFinanceiroCompromissocalc_nome.AsString       := '';
      sqlFinanceiroCompromissocalc_caixa.AsString      := '0';
      sqlFinanceiroCompromissocalc_compromisso.AsString:= '0';
      sqlFinanceiroCompromissocalc_historico.AsString  := dtmLookupContabil.FormatarAnoMes(sqlFinanceiroCompromissoANO_MES_REFERENCIA.AsString);
    end
    else
    begin
      sqlFinanceiroCompromissocalc_nome.AsString        := sqlFinanceiroCompromissoNOME.AsString;
      sqlFinanceiroCompromissocalc_caixa.AsInteger      := sqlFinanceiroCompromissoCAIXA_ID.AsInteger;
      sqlFinanceiroCompromissocalc_compromisso.AsInteger:= sqlFinanceiroCompromissoCONTABIL_CONTA_ID.AsInteger;
      sqlFinanceiroCompromissocalc_historico.AsString   := sqlFinanceiroCompromissoHISTORICO.AsString;
    end;

    sqlFinanceiroCompromissocalc_orcamento.AsBoolean := sqlFinanceiroCompromissoORCAMENTO_ID.AsInteger > 0;
  end;

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

  procedure verificarParcela;
  var
    viParcelaInicial : Integer;
  begin
    if sqlFinanceiroCompromissoPARCELA.AsInteger = 0 then
      exit;

    viParcelaInicial := sqlFinanceiroCompromissoPARCELA_INICIAL.AsInteger;
    if viParcelaInicial = 0 then
      viParcelaInicial := 1;

    sqlFinanceiroCompromissoCALC_PARCELA.AsString := sqlFinanceiroCompromissoPARCELA.AsString + '/'+
                                                     IntToStr((sqlFinanceiroCompromissoQTD.AsInteger + viParcelaInicial)-1);


  end;

begin
  sqlFinanceiroCompromissocalc_Referencia.AsString      := dtmLookupContabil.FormatarAnoMes(sqlFinanceiroCompromissoANO_MES_REFERENCIA.AsString);
  sqlFinanceiroCompromissoCALC_VALOR_RECEBER.AsCurrency := sqlFinanceiroCompromissoVALOR_AGENDADO.AsCurrency - sqlFinanceiroCompromissoVALOR_PAGO_SOMA.AsCurrency;
  DefinirValorCreditoDebitoOrcamento;

  if sqlFinanceiroCompromissoVALOR_PAGO_SOMA.AsCurrency > 0 then
    sqlFinanceiroCompromissocalc_Observacao.AsString := 'Valor do Compromisso Agendado R$ '+FormatFloat(',#0.00', sqlFinanceiroCompromissoVALOR_AGENDADO.AsCurrency)+
                                                        ' *** Valor ja Realizado R$ '+FormatFloat(',#0.00', sqlFinanceiroCompromissoVALOR_PAGO_SOMA.AsCurrency);
  VerificarVencimento;
  CarregarCamposCalculado;

  sqlFinanceiroCompromissocalc_Grupo.AsInteger := viGrupo;
  VisualizarImprimirBoleto.Enabled := sqlFinanceiroCompromissoBOLETA_ID.AsInteger > 0;
  verificarParcela;
  CalcularSaldo;
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
  tabReserva.TabVisible   := tabExibir.TabIndex = 3;
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
    3 : begin
          dtmLookupContabil.CarregarSaldoReservas(ClientReserva, ClientSaldoReservaPrevisao, dtmLookupContabil.ConverterAnoMesBase(vgPeriodoAtualS));
          pgcModulos.ActivePageIndex := tabExibir.TabIndex - 1;
          cxGridDBTableView1.DataController.Groups.FullExpand;
        end;
  end;
  LockWindowUpdate(0);
end;

procedure TfrmPrevisao.tbcPagamentosChange(Sender: TObject);
begin
  if vgAbrindoForm then
    exit;

  cxGridDBTablePrevisaoHistorico.Visible := tbcPagamentos.TabIndex = 1;

  case tbcPagamentos.TabIndex of
    0 : begin
          vgDadosCadastro.SomentePesquisa := True;
          dtmLookupServico.CarregarDadosLancamento(1, 0, nil);
          ExibirFormulario(TfrmCadastroRapidoLancamento, frmCadastroRapidoLancamento, True);
          tbcPagamentos.TabIndex := 1;
        end;
    1 : begin
          if vgDadosLivroCaixa.Confirmado then
            dtmLookupContabil.CarregarSaldoCaixa(ClientCaixa);
          cxGridDBTableCompromissoClienteGeral.Caption := 'Favorecido';
        end;
  end;
  tbcPrevisaoChange(self);
end;

procedure TfrmPrevisao.tbcPrevisaoChange(Sender: TObject);
var
  viDataIni, viDataFin, viReferencia, viCondicao, viTipoFinanceiro : String;
  viTipo : Integer;
begin
  Screen.Cursor := crHourGlass;
  viCondicao := '<=';

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
          if (edtDataInicial.EditValue = null) or (edtDataFinal.EditValue = null) then
          begin
            edtDataInicial.Date := vlDataTipo4;
            edtDataFinal.Date   := vlDataTipo4;
            edtDataFinal.SetFocus;
          end;
          viDataIni := datetostr(edtDataInicial.Date);
          viDataFin := datetostr(edtDataFinal.Date);
        end;
  end;

  sqlFinanceiroCompromisso.Filtered := False;

  if (tbcPrevisao.TabIndex in [2..7]) then
       sqlFinanceiroCompromisso.Filter := '(ANO_MES_REFERENCIA '+viCondicao+viReferencia+')'
  else
    if (tbcPrevisao.TabIndex in [0..1]) then
         sqlFinanceiroCompromisso.Filter := '(DATA_VENCIMENTO <= ' + QuotedStr(viDataFin)+')'
    else sqlFinanceiroCompromisso.Filter := '(DATA_VENCIMENTO >= '+QuotedStr(viDataIni) + ') AND (DATA_VENCIMENTO <= ' + QuotedStr(viDataFin)+')';

  if lcbConta.ItemIndex > 0 then
    sqlFinanceiroCompromisso.Filter := sqlFinanceiroCompromisso.Filter +
                                       ' AND (CAIXA_ID ='+IntToStr(lcbConta.EditValue)+')';

  // Armazena Condi��o para Previs�o do Saldo
  vgCondicaoPrecisaoCaixa := 'AND '+ sqlFinanceiroCompromisso.Filter;
  vgCondicaoPrecisaoCaixa := TrocaBarraPPonto(vgCondicaoPrecisaoCaixa);


  // Pesquisa por Palavra
  if trim(edtPalavraPesquisa.Text) <> '' then
    sqlFinanceiroCompromisso.Filter := sqlFinanceiroCompromisso.Filter +
                                       ' AND ((NOME LIKE '+QuotedStr('%'+edtPalavraPesquisa.Text+'%')+')'+
                                       ' OR (HISTORICO LIKE '+QuotedStr('%'+edtPalavraPesquisa.Text+'%')+'))';

  viCondicao := ''; vlOperacaoPesquisada := '';
  viTipo := icxTipoCredito.EditValue;
  case viTipo of
    1 : begin
          viCondicao := ' AND (OPERACAO = '+ QuotedStr('R')+')';
          vlOperacaoPesquisada := '*R,';
        end;
    2 : begin
          viCondicao := ' AND (OPERACAO = '+ QuotedStr('D')+')';
          vlOperacaoPesquisada := '*D,';
        end;
    3 : begin
          viCondicao := ' AND ((OPERACAO = '+ QuotedStr('AD')+') OR (OPERACAO = '+ QuotedStr('AR')+') OR'+
                        '      (OPERACAO = '+ QuotedStr('TD')+') OR (OPERACAO = '+ QuotedStr('TR')+'))';
          vlOperacaoPesquisada := '*AD,*AR,*TD,*TR,';
        end;
    4 : begin
          viCondicao := ' AND (OPERACAO = '+ QuotedStr('O')+')';
          vlOperacaoPesquisada := '*O,'
        end;
    5 : begin
          viCondicao := ' AND (OPERACAO <> '+ QuotedStr('O')+')';
          vlOperacaoPesquisada := '*R,*D,*AD,*AR,*TD,*TR,';
        end;
  end;

  sqlFinanceiroCompromisso.Filter := sqlFinanceiroCompromisso.Filter + viTipoFinanceiro + viCondicao;

  sqlFinanceiroCompromisso.Filtered := True;
  cxGridDBTablePrevisao.DataController.Groups.FullExpand;
  Screen.Cursor := crDefault;
  AtivarPesquisaPadrao(IntToStr(tbcPrevisao.TabIndex));

  CarregarPrevisaoSaldoAtual(vlOperacaoPesquisada);
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


