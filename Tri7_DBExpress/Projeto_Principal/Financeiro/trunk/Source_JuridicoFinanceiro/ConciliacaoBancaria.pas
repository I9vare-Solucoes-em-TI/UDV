    unit ConciliacaoBancaria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.Menus, dxBarBuiltInMenu, cxPC,
  cxGroupBox, cxTextEdit, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxLabel,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, Datasnap.DBClient,
  YMOFXReader, cxCurrencyEdit, cxImageComboBox, cxSplitter, cxCalendar,
  DbxDevartInterBase, SimpleDS, FrameImagem, dxGDIPlusClasses, cxImage,
  cxRadioGroup, Vcl.Imaging.GIFImg, cxDBEdit, cxProgressBar, cxCheckBox,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxGridExportLink;

type

  TVetMeses = array[1..12,1..2] of string;

  TfrmConciliacaoBancaria = class(TForm)
    Panel2: TPanel;
    lblInformaca: TcxLabel;
    Panel4: TPanel;
    imgTitulo: TImage;
    Panel6: TPanel;
    btnCancelar: TcxButton;
    btnConfirmar: TcxButton;
    ClientArquivo: TClientDataSet;
    dtsClientArquivo: TDataSource;
    OFXLeitura: TYMOFXReader;
    dtsVinculoEncontrado: TDataSource;
    sqlVinculoEncontrado: TSimpleDataSet;
    ClientArquivoDATA: TStringField;
    ClientArquivoDESCRICAO: TStringField;
    ClientArquivoVALOR: TCurrencyField;
    ClientArquivoOPERACAO: TStringField;
    ClientArquivoID: TStringField;
    ClientArquivoDOCUMENTO: TStringField;
    ClientArquivoSITUACAO: TStringField;
    ClientArquivoOBSERVACAO: TStringField;
    ClientArquivoLIVRO_CAIXA_ID: TIntegerField;
    ClientArquivoLIVRO_FINANCEIRO_ID: TIntegerField;
    ClientArquivoLANCAMENTO: TStringField;
    ClientArquivoLIBERADO: TStringField;
    ClientArquivoREGISTRADO: TBooleanField;
    ClientArquivoALTERADO: TBooleanField;
    sqlVinculoEncontradoID: TFMTBCDField;
    sqlVinculoEncontradoDATA: TSQLTimeStampField;
    sqlVinculoEncontradoBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlVinculoEncontradoCONTABIL_CONTA_ID: TFMTBCDField;
    sqlVinculoEncontradoHISTORICO: TStringField;
    sqlVinculoEncontradoDOCUMENTO_NUMERO: TStringField;
    sqlVinculoEncontradoCAIXA_ID: TFMTBCDField;
    sqlVinculoEncontradoOPERACAO: TStringField;
    sqlVinculoEncontradoPESSOA_ID: TFMTBCDField;
    sqlVinculoEncontradoVALOR: TFMTBCDField;
    sqlVinculoEncontradoCALC_OBSERVACAO: TStringField;
    ClientArquivoMODELO: TStringField;
    ClientArquivoREALIZAR_PLANEJAMENTO: TStringField;
    sqlVinculoEncontradoCONCILIACAO_IDENTIFICADOR: TStringField;
    sqlContasBancarias: TSimpleDataSet;
    StringField1: TStringField;
    FMTBCDField1: TFMTBCDField;
    dtsContasBancarias: TDataSource;
    sqlLivroCaixa: TSimpleDataSet;
    sqlLivroCaixaCALC_PESSOA: TStringField;
    sqlLivroCaixaCALC_OBSERVACAO: TStringField;
    sqlLivroCaixaDATA_PAGAMENTO: TSQLTimeStampField;
    sqlLivroCaixaLIVRO_CAIXA_ID: TFMTBCDField;
    sqlLivroCaixaCAIXA_ID: TFMTBCDField;
    sqlLivroCaixaVALOR: TFMTBCDField;
    sqlLivroCaixaOPERACAO: TStringField;
    sqlLivroCaixaPESSOA_ID: TFMTBCDField;
    sqlLivroCaixaREFERENCIA: TStringField;
    sqlLivroCaixaOBSERVACAO: TStringField;
    sqlLivroCaixaCONTABIL_CONTA_ID: TFMTBCDField;
    sqlLivroCaixaCENTRO_CUSTO_ID: TFMTBCDField;
    sqlLivroCaixacalc_ValorDespesa: TCurrencyField;
    sqlLivroCaixacalc_ValorReceita: TCurrencyField;
    sqlLivroCaixacalc_vinculo: TBooleanField;
    sqlLivroCaixacalc_ImagemVinculada: TStringField;
    sqlLivroCaixacalc_Agrupado: TBooleanField;
    sqlLivroCaixaESPECIE: TStringField;
    sqlLivroCaixaDOCUMENTO_DESCRICAO: TStringField;
    sqlLivroCaixaBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlLivroCaixaLIVRO_FINANCEIRO_ID: TFMTBCDField;
    sqlLivroCaixaPROCESSO_ID: TFMTBCDField;
    sqlLivroCaixaHISTORICO: TStringField;
    sqlLivroCaixaANO_MES_REGISTRO: TStringField;
    sqlLivroCaixaDATA_VENCIMENTO: TSQLTimeStampField;
    sqlLivroCaixaPROCESSO_CONTRATO_ITEM_ID: TFMTBCDField;
    sqlLivroCaixaLIVRO_AGENDAMENTO_ID: TFMTBCDField;
    sqlLivroCaixaLIVRO_REMUNERACAO_ID: TFMTBCDField;
    sqlLivroCaixaCONTABIL_CONTA_DESCRICAO: TStringField;
    sqlLivroCaixaGRUPO_SECUDARIO: TStringField;
    sqlLivroCaixaGRUPO_PRINCIPAL: TStringField;
    sqlLivroCaixacalc_ValorMovimento: TCurrencyField;
    sqlLivroCaixaCAIXA_TRANSFERENCIA_ID: TFMTBCDField;
    sqlLivroCaixaIR: TStringField;
    sqlLivroCaixaCNJ: TStringField;
    sqlLivroCaixaDOCUMENTO_NUMERO: TStringField;
    sqlLivroCaixacalc_captador: TStringField;
    sqlLivroCaixaINTERNO: TStringField;
    sqlLivroCaixaAUTOMATICO: TStringField;
    sqlLivroCaixaORCAMENTO_ID: TFMTBCDField;
    sqlLivroCaixaINDICE_IMAGEM: TFMTBCDField;
    sqlLivroCaixaIDENTIFICADOR_ID: TFMTBCDField;
    sqlLivroCaixacalc_identificador: TStringField;
    sqlLivroCaixaDATA_LANCAMENTO: TSQLTimeStampField;
    sqlLivroCaixaDOC_TIPO: TStringField;
    sqlLivroCaixaFAVORITO_SITUACAO: TStringField;
    sqlLivroCaixaTIPO_MODALIDADE_ID: TFMTBCDField;
    sqlLivroCaixaNOME: TStringField;
    sqlLivroCaixaRESPONSAVEL: TStringField;
    sqlLivroCaixaIDENTIFICADOR_TIPO: TStringField;
    sqlLivroCaixaRESPONSAVEL_ID: TFMTBCDField;
    sqlLivroCaixaCONFERIDO: TStringField;
    sqlLivroCaixaCENTRO_RESERVA_ID: TFMTBCDField;
    sqlLivroCaixaFATURAMENTO: TStringField;
    sqlLivroCaixaORDEM: TFMTBCDField;
    dtsLivroCaixa: TDataSource;
    sqlLivroCaixaCONTABIL_GRUPO_ID: TFMTBCDField;
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
    sqlFinanceiroCompromissoNOSSO_NUMERO: TFMTBCDField;
    sqlFinanceiroCompromissoIDENTIFICACAO: TStringField;
    sqlFinanceiroCompromissoTIPO: TStringField;
    sqlFinanceiroCompromissoTIPO_MODALIDADE_ID: TFMTBCDField;
    sqlFinanceiroCompromissoTIPO_CARGA_ID: TFMTBCDField;
    sqlFinanceiroCompromissoSITUACAO_COMISSAO: TStringField;
    sqlFinanceiroCompromissoCALC_CENTROCUSTO: TIntegerField;
    sqlFinanceiroCompromissoCONFERIDO: TStringField;
    sqlFinanceiroCompromissoCENTRO_RESERVA_ID: TFMTBCDField;
    dtsFinanceiroCompromisso: TDataSource;
    sqlVinculoEncontradoUSUARIO_ID: TFMTBCDField;
    ClientArquivoCALC_SELECIONADO: TBooleanField;
    ClientArquivoCONCILIACAO_VINCULO_ID: TStringField;
    pgcConciliacao: TcxPageControl;
    tbcConciliacaoPesquisar: TcxTabSheet;
    tbcConciliacaoDados: TcxTabSheet;
    Panel1: TPanel;
    rdbVinculo: TcxDBRadioGroup;
    progressBar: TcxProgressBar;
    cxGroupBox1: TcxGroupBox;
    grdBasica: TcxGrid;
    grdBasicaDBTableView1: TcxGridDBTableView;
    grdBasicaDBTableVinculoId: TcxGridDBColumn;
    grdBasicaDBTableView1Column1: TcxGridDBColumn;
    grdBasicaDBTableView1Column2: TcxGridDBColumn;
    grdBasicaDBTableView1Column3: TcxGridDBColumn;
    grdBasicaDBTableView1Column4: TcxGridDBColumn;
    grdBasicaDBTableView1Column5: TcxGridDBColumn;
    grdBasicaDBTableView1Column7: TcxGridDBColumn;
    grdBasicaDBTableObs: TcxGridDBColumn;
    grdBasicaDBTableView1Column9: TcxGridDBColumn;
    grdBasicaDBTableView1Column6: TcxGridDBColumn;
    grdBasicaDBTableView1Modelo: TcxGridDBColumn;
    grdBasicaDBTableViewUnir: TcxGridDBColumn;
    grdBasicaLevel1: TcxGridLevel;
    tabVinculo: TcxTabControl;
    cxGrid1: TcxGrid;
    cxGridPesquisa: TcxGridDBTableView;
    cxGridBasicaDBCodigo: TcxGridDBColumn;
    cxGridBasicaDBDataPag: TcxGridDBColumn;
    cxGridBasicaDBTipoCaixa: TcxGridDBColumn;
    cxGridPesquisadbOperacao: TcxGridDBColumn;
    cxGridPesquisaValor: TcxGridDBColumn;
    cxGridPesquisaColumn1: TcxGridDBColumn;
    cxGridBasicaDBPlanoConta: TcxGridDBColumn;
    cxGridPesquisaHistorico: TcxGridDBColumn;
    cxGridPesquisaDocNumero: TcxGridDBColumn;
    cxGridBasicaDBFavorecido: TcxGridDBColumn;
    cxGridPesquisaColumn2: TcxGridDBColumn;
    cxGridPesquisaColumn3: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    pnlOpcoes: TPanel;
    lblLancamentoPlanejado: TcxLabel;
    lblBuscarItemRegistrado: TcxLabel;
    lblBuscarItemAgendado: TcxLabel;
    cxGroupBox6: TcxGroupBox;
    cxLabel29: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    btnAtualizar: TcxButton;
    btnTransferenciaManual: TcxButton;
    btnLancamentoManual: TcxButton;
    btnLancamentoProgramado: TcxButton;
    sqlPesquisaConciliacao: TSimpleDataSet;
    dtsPesquisaConcliacao: TDataSource;
    sqlPesquisaConciliacaoCONCILIACAO_ID: TFMTBCDField;
    sqlPesquisaConciliacaoARQUIVO: TStringField;
    sqlPesquisaConciliacaoDATA_CARREGAMENTO: TSQLTimeStampField;
    sqlPesquisaConciliacaoDATA_CONCILIACAO: TSQLTimeStampField;
    sqlPesquisaConciliacaoSITUACAO: TStringField;
    sqlPesquisaConciliacaoCAIXA_ID: TFMTBCDField;
    btnConcliacaoIncluir: TcxButton;
    sqlDadosConciliacao: TSimpleDataSet;
    dtsDadosConciliacao: TDataSource;
    sqlDadosConciliacaoCONCILIACAO_REGISTRADO_ID: TStringField;
    sqlDadosConciliacaoDATA_CONCILIACAO: TSQLTimeStampField;
    sqlDadosConciliacaoDATA_PAGAMENTO: TSQLTimeStampField;
    sqlDadosConciliacaoDESCRICAO: TStringField;
    sqlDadosConciliacaoVALOR: TFMTBCDField;
    sqlDadosConciliacaoLANCAMENTO_ID: TFMTBCDField;
    sqlDadosConciliacaoOBSERVACAO: TStringField;
    sqlDadosConciliacaoSITUACAO: TStringField;
    sqlDadosConciliacaoLIBERADO: TStringField;
    sqlDadosConciliacaoVINCULO: TStringField;
    sqlDadosConciliacaoLANCAMENTO: TStringField;
    sqlDadosConciliacaoCONCILIACAO_VINCULO_ID: TStringField;
    sqlDadosConciliacaoCONCILIACAO_ID: TFMTBCDField;
    sqlDadosConciliacaoOPERACAO: TStringField;
    sqlDadosConciliacaoID_REGISTRO: TStringField;
    sqlDadosConciliacaoDOCUMENTO: TStringField;
    btnConcluir: TcxButton;
    pnlInformacaoConciliacao: TPanel;
    ClientArquivoREGISTRO: TStringField;
    sqlLivroCaixaVALOR_DESCONTO: TFMTBCDField;
    sqlLivroCaixaVALOR_JUROS: TFMTBCDField;
    sqlLivroCaixaVALOR_MULTA: TFMTBCDField;
    sqlLivroCaixaOBSERVACAO_MONETARIA: TStringField;
    sqlLivroCaixaVALOR_OUTRA_DEDUCAO: TFMTBCDField;
    sqlLivroCaixaVALOR_FATURADO: TFMTBCDField;
    grdBasicaDBTableView1Documento: TcxGridDBColumn;
    ClientArquivoVINCULO: TStringField;
    tbcPeriodo: TcxTabControl;
    cxGridConciliacao: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    cxGridDBTableView1Column3: TcxGridDBColumn;
    cxGridDBTableView1Column4: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    sqlPesquisaConciliacaoCALC_SELECIONADO: TBooleanField;
    cxGridDBTableView1Column5: TcxGridDBColumn;
    edtPesqDataIni: TcxDateEdit;
    edtPesqDataFin: TcxDateEdit;
    lcxPesqConta: TcxLookupComboBox;
    icxPesqSituacao: TcxImageComboBox;
    btnPesquisarConciliacao: TcxButton;
    btnLimpar: TcxButton;
    btnConcliacaoExluir: TcxButton;
    cxLabel3: TcxLabel;
    pnlMarcar: TPanel;
    lblMarcarTodos: TcxLabel;
    lblDesmarcarTodos: TcxLabel;
    sqlLivroCaixaCONTABIL_RL: TStringField;
    sqlFinanceiroCompromissoCONTABIL_RL: TStringField;
    sqlFinanceiroCompromissoVALOR_DESCONTO: TFMTBCDField;
    sqlFinanceiroCompromissoVALOR_JUROS: TFMTBCDField;
    sqlFinanceiroCompromissoVALOR_MULTA: TFMTBCDField;
    sqlFinanceiroCompromissoVALOR_OUTRA_DEDUCAO: TFMTBCDField;
    sqlFinanceiroCompromissoVALOR_CALCULO: TFMTBCDField;
    sqlFinanceiroCompromissoOBSERVACAO_MONETARIA: TStringField;
    sqlFinanceiroCompromissoVALOR_OUTRAS_TAXAS: TFMTBCDField;
    sqlLivroCaixaVALOR_OUTRAS_TAXAS: TFMTBCDField;
    cxTabSheet1: TcxTabSheet;
    cxGrid2: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    dtsModelosProgramados: TDataSource;
    sqlModelosProgramados: TSimpleDataSet;
    Panel3: TPanel;
    lblExcluirModelo: TcxLabel;
    cxGridDBTableView2Column1: TcxGridDBColumn;
    sqlModelosProgramadosID: TFMTBCDField;
    sqlModelosProgramadosDATA: TSQLTimeStampField;
    sqlModelosProgramadosBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlModelosProgramadosCONTABIL_CONTA_ID: TFMTBCDField;
    sqlModelosProgramadosHISTORICO: TStringField;
    sqlModelosProgramadosDOCUMENTO_NUMERO: TStringField;
    sqlModelosProgramadosCAIXA_ID: TFMTBCDField;
    sqlModelosProgramadosOPERACAO: TStringField;
    sqlModelosProgramadosPESSOA_ID: TFMTBCDField;
    sqlModelosProgramadosVALOR: TFMTBCDField;
    sqlModelosProgramadosCALC_OBSERVACAO: TStringField;
    sqlModelosProgramadosCONCILIACAO_IDENTIFICADOR: TStringField;
    sqlModelosProgramadosUSUARIO_ID: TFMTBCDField;
    lblDesfazerConciliacao: TcxLabel;
    btnReabrir: TcxButton;
    lblConciliarSemRegistro: TcxLabel;
    popExportar: TPopupMenu;
    ExportarExcel1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure grdBasicaDBTableView1DblClick(Sender: TObject);
    procedure grdBasicaDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure rdbVinculoPropertiesChange(Sender: TObject);
    procedure grdBasicaDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure lcbContaPropertiesEditValueChanged(Sender: TObject);
    procedure btnLancamentoManualClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure ClientArquivoAfterEdit(DataSet: TDataSet);
    procedure btnLancamentoProgramadoClick(Sender: TObject);
    procedure lblLancamentoPlanejadoClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnTransferenciaManualClick(Sender: TObject);
    procedure grdBasicaDBTableView1Column10PropertiesChange(Sender: TObject);
    procedure grdBasicaDBTableViewUnirCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ClientArquivoAfterScroll(DataSet: TDataSet);
    procedure lblBuscarItemRegistradoClick(Sender: TObject);
    procedure sqlPesquisaConciliacaoAfterScroll(DataSet: TDataSet);
    procedure btnConcliacaoIncluirClick(Sender: TObject);
    procedure btnPesquisarConciliacaoClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure sqlVinculoEncontradoCalcFields(DataSet: TDataSet);
    procedure pgcConciliacaoChange(Sender: TObject);
    procedure btnConcluirClick(Sender: TObject);
    procedure cxGridDBTableView1DblClick(Sender: TObject);
    procedure tbcPeriodoChange(Sender: TObject);
    procedure edtPesqDataIniExit(Sender: TObject);
    procedure btnConcliacaoExluirClick(Sender: TObject);
    procedure rdbVinculoClick(Sender: TObject);
    procedure lblMarcarTodosClick(Sender: TObject);
    procedure lblDesmarcarTodosClick(Sender: TObject);
    procedure lblExcluirModeloClick(Sender: TObject);
    procedure sqlModelosProgramadosAfterScroll(DataSet: TDataSet);
    procedure lblDesfazerConciliacaoClick(Sender: TObject);
    procedure lblBuscarItemAgendadoClick(Sender: TObject);
    procedure lcxPesqContaPropertiesEditValueChanged(Sender: TObject);
    procedure btnReabrirClick(Sender: TObject);
    procedure lblConciliarSemRegistroClick(Sender: TObject);
    procedure ExportarExcel1Click(Sender: TObject);
  private
    vlSql : String;
    vlVetMeses   : TVetMeses;
    vlVetPeriodo : array[1..12] of string;
    vlCriandoForm : Boolean;
    procedure VerificarConciliacaoRealizada(vpID : string; vpAbrirEdicao : Boolean = False);
    procedure RegistrarItem(vpTransferencia : Boolean = False);
    procedure RegistrarConciliacao(vpSituacao, vpLancamento, vpLiberado : string; vpAutomatico : Boolean = False);
    procedure BuscarVinculoRegistro;
    procedure CarregarsqlVinculoEncontrado(vpCondicao, vpOperacao : String);
    procedure CarregarSqlLivroFinanceiro(vpCondicao, vpOperacao : String);
    procedure VerificarSituacaoVinculo(vpSituacao : Integer);
    procedure HabilitarCampos;
    procedure AtualizarSituacaoItem(vpSituacao, vpLiberado, vpVinculo, vpLancamento : Variant;
           vpAbrirEdicao : Boolean = False);
    procedure SalvarDados(vpAutomatico : Boolean = False);
    procedure AtualizarLivroCaixa(vpLivroCaixaId : Integer; vpModelo, vpIdentificador : String);
    procedure BuscarModeloPlanejado(vpIdentificador : string; vpId : string = ''; vpColocarEdicao : Boolean = False);
    procedure IdentificarModelosGrid;

    procedure VincularItemLancamentoCaixa(vpLivroCaixaId, vpIdConciliacao : String);
    procedure VincularItemLancamentoAgendado;
    procedure VincularItemConciliadosUnidos;
    procedure AtualizaSituacaoRegistroItem(vpIdConciliacao : string; vpIdUnir : string = '');
    procedure MontarPeriodos;
  public
    procedure CarregarArquivo(vpBuscarArquivo: Boolean; vpLimpar : Boolean = True; vpHabilitar : Boolean = True);
  end;

var
  frmConciliacaoBancaria: TfrmConciliacaoBancaria;

implementation

uses
  Controles, Lookup, Cadastro, CadastroRapidoLancamento, Lookup_Servico,
  Rotinas, Lookup_Contabil, LookupFinanceiro, VinculoConciliacaoBancaria,
  VisualizaRelatorios, ConciliacaoCarregarArquivo, ValidarPermissaoUsuario,
  ConciliacaoDataConciliacao;

{$R *.dfm}

procedure TfrmConciliacaoBancaria.AtualizarLivroCaixa(vpLivroCaixaId : Integer; vpModelo, vpIdentificador : String);
begin
  ExecutaSqlAuxiliar(' UPDATE J_LIVRO_CAIXA SET CONCILIACAO_REGISTRADO_ID = '+QuotedStr(ClientArquivoID.AsString)+','+
                     '                          CONCILIACAO_MODELO = :MODELO, '+
                     '                          CONCILIACAO_IDENTIFICADOR = :IDENTIFICADOR '+
                     ' WHERE LIVRO_CAIXA_ID = '+ IntToStr(vpLivroCaixaId),2);
  with dtmControles.sqlAuxiliar do
  begin
    ParamByName('MODELO').AsString := vpModelo;
    if ClientArquivoMODELO.AsString = 'S' then
         ParamByName('IDENTIFICADOR').AsString := vpIdentificador
    else ParamByName('IDENTIFICADOR').AsString := '';
    ExecSQL(FALSE);
  end;
end;

procedure TfrmConciliacaoBancaria.AtualizarSituacaoItem(vpSituacao, vpLiberado,
         vpVinculo, vpLancamento : Variant; vpAbrirEdicao : Boolean = False);
begin
  if vpAbrirEdicao then
    ClientArquivo.Edit;

  ClientArquivoLIBERADO.AsVariant    := vpLiberado;
  ClientArquivoSITUACAO.AsString     := vpSituacao;
  ClientArquivoVinculo.AsVariant     := vpVinculo;
  ClientArquivoLANCAMENTO.AsVariant  := vpLancamento;

  if vpAbrirEdicao then
    ClientArquivo.Post;
end;

procedure TfrmConciliacaoBancaria.AtualizaSituacaoRegistroItem(vpIdConciliacao : string; vpIdUnir : string = '');
var
  viSql : String;
begin
  viSql := ' UPDATE J_CONCILIACAO_REGISTRADO SET SITUACAO = '+ QuotedStr('1')+','+
           '                                     LANCAMENTO = '+ QuotedStr('1')+','+
           '                                     LIBERADO = '+ QuotedStr('R');
  if vpIdUnir <> '' then
    viSql := viSql + ' ,CONCILIACAO_VINCULO_ID = '+QuotedStr(vpIdUnir);

  viSql := viSql + ' WHERE CONCILIACAO_REGISTRADO_ID = '+QuotedStr(vpIdConciliacao);
  ExecutaSqlAuxiliar(viSql,1);
end;

procedure TfrmConciliacaoBancaria.btnAtualizarClick(Sender: TObject);
begin
  pgcConciliacaoChange(SELF);
end;

procedure TfrmConciliacaoBancaria.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConciliacaoBancaria.btnConcliacaoExluirClick(Sender: TObject);
var
  viExcluir : Boolean;
begin
  viExcluir := dtmControles.GetInt(' select count(conciliacao_registrado_id) '+
                                   ' from J_CONCILIACAO_REGISTRADO '+
                                   ' where situacao = ''1'''+
                                   '   and conciliacao_id = '+sqlPesquisaConciliacaoCONCILIACAO_ID.AsString) > 0;

  if viExcluir then
  begin
    Application.MessageBox('Exitem Itens ja Conciliado neste registro!!!','Aviso', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  if Application.MessageBox('Confirma Exclusão do Registro Selecionado?', 'Confirmação', MB_YESNO) = IDYES then
  begin
    ExecutaSqlAuxiliar(' DELETE FROM J_CONCILIACAO_REGISTRADO WHERE CONCILIACAO_ID = '+sqlPesquisaConciliacaoCONCILIACAO_ID.AsString,1);
    ExecutaSqlAuxiliar(' DELETE FROM J_CONCILIACAO WHERE CONCILIACAO_ID = '+sqlPesquisaConciliacaoCONCILIACAO_ID.AsString,1);
    sqlPesquisaConciliacao.Refresh;
  end;
end;

procedure TfrmConciliacaoBancaria.btnConcliacaoIncluirClick(Sender: TObject);
begin
  vgDadosCadastro.SomentePesquisa := True;
  ExibirFormulario(TfrmConciliacaoArquivoCarregar, frmConciliacaoArquivoCarregar, True);
  MontarPeriodos;
  tbcPeriodoChange(self);
end;

procedure TfrmConciliacaoBancaria.btnConcluirClick(Sender: TObject);
var
  viFlago : Boolean;
begin
  ClientArquivo.DisableControls;
  ClientArquivo.First;
  ClientArquivo.Filtered := False;
  ClientArquivo.Filter   := 'SITUACAO <> '+QuotedStr('1');
  ClientArquivo.Filtered := True;

  if ClientArquivo.RecordCount > 0 then
    Application.MessageBox('Exitem Itens Pendentes de Conciliação!!!','Aviso', MB_OK + MB_ICONINFORMATION)
  else
  begin
    if Application.MessageBox('Concluir Conciliação. Confirma?', 'Confirmação', MB_YESNO) = IDYES then
    begin
      ExecutaSqlAuxiliar(' UPDATE J_CONCILIACAO SET SITUACAO = '+QuotedStr('2')+
                       ' WHERE CONCILIACAO_ID = '+sqlPesquisaConciliacaoCONCILIACAO_ID.AsString,1);

      sqlPesquisaConciliacao.Refresh;
      pgcConciliacaoChange(self);
    end;
  end;
  ClientArquivo.Filtered := False;
  ClientArquivo.EnableControls;
end;

procedure TfrmConciliacaoBancaria.btnConfirmarClick(Sender: TObject);
begin
  SalvarDados;
end;

procedure TfrmConciliacaoBancaria.btnLancamentoManualClick(Sender: TObject);
begin
  RegistrarItem;
end;

procedure TfrmConciliacaoBancaria.btnLancamentoProgramadoClick(Sender: TObject);

  {$REGION 'LancamentoAutomaticoLivroCaixa}
  procedure LancamentoAutomaticoLivroCaixa(vpAgendado : Boolean = False);
  begin
    if vpAgendado then
    begin
      vgDadosLivroCaixa.DuplicarItem  := False;

      sqlFinanceiroCompromisso.Active := False;
      sqlFinanceiroCompromisso.DataSet.ParamByName('LIVRO_FINANCEIRO_ID').AsInteger := ClientArquivoLIVRO_FINANCEIRO_ID.AsInteger;
      sqlFinanceiroCompromisso.Active := True;

      dtmLookupServico.CarregarDadosLancamento(2, 0, sqlFinanceiroCompromisso);
      vgDadosLivroCaixa.ContabilContaID  := sqlFinanceiroCompromissoCONTABIL_CONTA_ID.AsInteger;
      vgDadosLivroCaixa.ContabilGrupoId  := dtmControles.GetInt(' SELECT CONTABIL_GRUPO_ID FROM J_CONTABIL_CONTA WHERE CONTABIL_CONTA_ID = '+ sqlFinanceiroCompromissoCONTABIL_CONTA_ID.AsString);
    end
    else
    begin
      vgDadosLivroCaixa.DuplicarItem  := True;
      sqlLivroCaixa.Active := False;
      sqlLivroCaixa.DataSet.ParamByName('LIVRO_CAIXA_ID').AsInteger := ClientArquivoLIVRO_CAIXA_ID.AsInteger;
      sqlLivroCaixa.Active := True;
      dtmLookupServico.CarregarDadosLancamento(2, ClientArquivoLIVRO_CAIXA_ID.AsInteger, sqlLivroCaixa);
      vgDadosLivroCaixa.ContabilContaID  := sqlLivroCaixaCONTABIL_CONTA_ID.AsInteger;
      vgDadosLivroCaixa.ContabilGrupoId  := sqlLivroCaixaCONTABIL_GRUPO_ID.AsInteger;
      vgDadosLivroCaixa.DataVencimento   := FormatDateTime('DD.MM.YYYY',ClientArquivoDATA.AsDateTime);
      vgDadosLivroCaixa.AnoMesReferencia := IntToStr(dtmLookupContabil.PegarAnoMes(ClientArquivoDATA.AsString));
      vgDadosLivroCaixa.DuplicarItem     := False;
    end;

    vgDadosLivroCaixa.ValorFaturado    := ClientArquivoVALOR.AsCurrency;
    vgDadosLivroCaixa.ValorCompromisso := ClientArquivoVALOR.AsCurrency;
    vgDadosLivroCaixa.ValorPago        := ClientArquivoVALOR.AsCurrency;
    vgDadosLivroCaixa.CaixaID          := sqlPesquisaConciliacaoCAIXA_ID.AsInteger;

    vgDadosLivroCaixa.DataPagamento    := FormatDateTime('DD.MM.YYYY',ClientArquivoDATA.AsDateTime);

    vgDadosLivroCaixa.Referencia       := IntToStr(dtmLookupContabil.PegarAnoMes(vgDadosLivroCaixa.DataPagamento));
    vgDadosLivroCaixa.DataLancamento   := FormatDateTime('DD.MM.YYYY',dtmControles.DataHoraBanco(3));
    vgDadosLivroCaixa.AnoMesRegistro   := IntToStr(dtmLookupContabil.PegarAnoMes(vgDadosLivroCaixa.DataPagamento));
    vgDadosLivroCaixa.Observacao       := ClientArquivoOBSERVACAO.AsString;
    vgDadosLivroCaixa.Ordem            := dtmControles.GerarSequencia('J_LIVRO_CAIXA_ORDEM');
    vgDadosLivroCaixa.DocumentoNumero  := ClientArquivoDOCUMENTO.AsString;
    dtmLookupContabil.RegistrarRecebimentoFinanceiro;


    RegistrarConciliacao('1', '1','R', True);
    if vpAgendado then
    begin
      dtmLookupFinanceiro.BaixarEstornar('R', '3', vgDadosLivroCaixa.LivroFinanceiroID, vgDadosLivroCaixa.LIvroAgendamentoId, 0, 0);
      dtmLookupServico.VerificarAtualizacaoAgendamento;
      if vgDadosLivroCaixa.Faturamento = 'S' then
        ExecutaSqlAuxiliar(' UPDATE J_LIVRO_FINANCEIRO SET SITUACAO = '+ QuotedStr('3')+
                           ' WHERE FECHAMENTO_ID = '+IntToStr(vgDadosLivroCaixa.LivroFinanceiroID),1);
    end;

    AtualizarLivroCaixa(vgDadosLivroCaixa.LivroCaixaId, ClientArquivoMODELO.AsString, ClientArquivoDESCRICAO.AsString);
    VerificarConciliacaoRealizada(ClientArquivoID.AsString, True);
  end;
  {$ENDREGION}

begin
  if Application.MessageBox('Executar Lançamentos Programados na Lista?', 'Confirmação', MB_YESNO) = IDNO then
    exit;

  SalvarDados(True);
  ClientArquivo.DisableControls;
  ClientArquivo.First;
  IniciarIncrementarProgressBar(progressBar, ClientArquivo.RecordCount);
  Screen.Cursor := crHourGlass;

  dtmControles.StartTransaction;
  try
    while not ClientArquivo.Eof do
    begin
      case ClientArquivoLANCAMENTO.AsInteger of
        2 : VincularItemLancamentoCaixa(ClientArquivoLIVRO_CAIXA_ID.AsString, ClientArquivoID.AsString);
        3 : LancamentoAutomaticoLivroCaixa;
        4 : LancamentoAutomaticoLivroCaixa(True);
      end;

      ClientArquivo.Next;
      IniciarIncrementarProgressBar(progressBar, 1, True);
    end;
    dtmControles.Commit;
  except
    on E: exception do
    begin
      Application.MessageBox(Pchar(E.Message), 'Aviso', mb_IconExclamation);
      dtmControles.Roolback;
    end;
  end;

  ClientArquivo.First;
  ClientArquivo.EnableControls;
  Screen.Cursor := crDefault;
  pgcConciliacaoChange(Self);
  Application.MessageBox('Execução realizada com sucesso!!!','Aviso', MB_OK + MB_ICONINFORMATION);
  progressBar.Visible := False;
end;

procedure TfrmConciliacaoBancaria.btnLimparClick(Sender: TObject);
begin
  edtPesqDataIni.Clear;
  edtPesqDataFin.Clear;
  lcxPesqConta.EditValue := NULL;
  icxPesqSituacao.ItemIndex := -1;
end;

procedure TfrmConciliacaoBancaria.btnPesquisarConciliacaoClick(Sender: TObject);
var
  viSql, viCondicao : string;
  viDataInicial, viDataFinal : String;

  procedure MontarCondicao;
  begin
    viCondicao := '';
    tbcPeriodo.HideTabs := edtPesqDataIni.EditValue <> null;
    if edtPesqDataIni.EditValue <> null then
      viCondicao := ' AND DATA_CONCILIACAO '+ MontarSqlData(edtPesqDataIni.Date , edtPesqDataFin.Date)
    else
      if (tbcPeriodo.Tabs.Count > 0) then
      begin
        viDataInicial := '01'+'/'+ Copy(vlVetPeriodo[tbcPeriodo.TabIndex+1],5,2) +'/'+
                         Copy(vlVetPeriodo[tbcPeriodo.TabIndex+1],1,4);
        viDataFinal   := dtmLookupContabil.PegarDataFinalMes(vlVetPeriodo[tbcPeriodo.TabIndex+1]);
        viCondicao    := ' AND DATA_CONCILIACAO '+MontarSqlData(StrToDate(viDataInicial), StrToDate(viDataFinal));
      end;

    if lcxPesqConta.EditValue <> null then
      viCondicao := viCondicao + ' AND CAIXA_ID = '+ IntToStr(lcxPesqConta.EditValue);

    if icxPesqSituacao.Text <> '' then
      viCondicao := viCondicao + ' AND SITUACAO = '+ IntToStr(icxPesqSituacao.EditValue);

    if viCondicao = '' then
    begin
     icxPesqSituacao.ItemIndex := 0;
     viCondicao := viCondicao + ' AND SITUACAO = '+ QuotedStr(icxPesqSituacao.EditValue);
    end;
  end;
begin

  viSql := ' SELECT * FROM J_CONCILIACAO WHERE NOT CONCILIACAO_ID IS NULL';

  MontarCondicao;
  sqlPesquisaConciliacao.Active := False;
  sqlPesquisaConciliacao.DataSet.CommandText := viSql + viCondicao;
  sqlPesquisaConciliacao.Active := True;

  dtmLookup.MarcarDesmarcarItensSimpleDataSet('N', sqlPesquisaConciliacao);
end;

procedure TfrmConciliacaoBancaria.btnReabrirClick(Sender: TObject);
begin
  if Application.MessageBox('Reabrir Conciliação. Confirma?', 'Confirmação', MB_YESNO) = IDYES then
  begin
    ExecutaSqlAuxiliar(' UPDATE J_CONCILIACAO SET SITUACAO = '+QuotedStr('1')+
                     ' WHERE CONCILIACAO_ID = '+sqlPesquisaConciliacaoCONCILIACAO_ID.AsString,1);

    sqlPesquisaConciliacao.Refresh;
    pgcConciliacaoChange(self);
  end;
end;

procedure TfrmConciliacaoBancaria.BuscarModeloPlanejado(vpIdentificador : string; vpId :
        string = ''; vpColocarEdicao : Boolean = False);
var
  viLivroCaixaId : Integer;
begin
  if vpId = '' then
    viLivroCaixaId := dtmControles.GetInt(' SELECT LIVRO_CAIXA_ID '+
                                          ' FROM J_LIVRO_CAIXA '+
                                          ' WHERE CONCILIACAO_MODELO = '+QuotedStr('S')+
                                          '   AND CONCILIACAO_IDENTIFICADOR = '+ QuotedStr(vpIdentificador)+
                                          '   AND CAIXA_ID = '+sqlPesquisaConciliacaoCAIXA_ID.AsString)
  else
    viLivroCaixaId := dtmControles.GetInt(' SELECT LIVRO_CAIXA_ID '+
                                          ' FROM J_LIVRO_CAIXA '+
                                          ' WHERE CONCILIACAO_REGISTRADO_ID = '+QuotedStr(vpId)+
                                          '   AND CAIXA_ID = '+sqlPesquisaConciliacaoCAIXA_ID.AsString+
                                          '   AND ((CONCILIACAO_IDENTIFICADOR <> '+ QuotedStr('')+')'+
                                          '   AND (NOT CONCILIACAO_IDENTIFICADOR IS NULL))');
  if viLivroCaixaId > 0 then
  begin
    if vpColocarEdicao then
      ClientArquivo.Edit;

    if vpId = '' then
    begin
      ClientArquivoLIVRO_CAIXA_ID.AsInteger := viLivroCaixaId;
      ClientArquivoMODELO.AsString          := 'A';
      AtualizarSituacaoItem('4','S', 1,'3');
//      ClientArquivoREGISTRADO.AsBoolean := FALSE;
    end
    else ClientArquivoMODELO.AsString := 'S';

    if vpColocarEdicao then
      ClientArquivo.Post;
  end;
end;

procedure TfrmConciliacaoBancaria.BuscarVinculoRegistro;

  procedure CarregarVinculo(vpCampo, vpId : string; vpTab : Integer; vpOperacao : String);
  begin
    case vpTab of
      0,2,3 : CarregarsqlVinculoEncontrado(vpCampo,'');
      1     : CarregarSqlLivroFinanceiro(vpCampo, vpOperacao)
    end;

    sqlVinculoEncontrado.DataSet.CommandText := vlSql;
    if vpId <> '' then
    begin
      sqlVinculoEncontrado.DataSet.ParamByName('ID').AsString := vpId;
      sqlVinculoEncontrado.Active    := True;
    end;
    tabVinculo.Tabs[vpTab].Visible := True;

    cxGridBasicaDBDataPag.Visible   := vpTab <> 2;
    cxGridBasicaDBTipoCaixa.Visible := vpTab <> 2;
    cxGridPesquisaValor.Visible     := vpTab <> 2;
    cxGridPesquisaDocNumero.Visible := vpTab <> 2;
  end;

begin
  if ClientArquivoSITUACAO.AsVariant = null then
    exit;

  tabVinculo.Tabs[0].Visible := False;
  tabVinculo.Tabs[1].Visible := False;
  tabVinculo.Tabs[2].Visible := False;
  tabVinculo.Tabs[3].Visible := False;

  sqlVinculoEncontrado.Active := False;
  case ClientArquivoSITUACAO.AsInteger of
    1 : begin
          if (ClientArquivoCONCILIACAO_VINCULO_ID.AsString = '') then
            CarregarVinculo('CONCILIACAO_REGISTRADO_ID',ClientArquivoID.AsString,0, ClientArquivoOPERACAO.AsString)
          else
            if ClientArquivoCONCILIACAO_VINCULO_ID.AsString = ClientArquivoID.AsString then
                 CarregarVinculo('CONCILIACAO_REGISTRADO_ID',ClientArquivoID.AsString,0, ClientArquivoOPERACAO.AsString)
            else CarregarVinculo('CONCILIACAO_REGISTRADO_ID', ClientArquivoCONCILIACAO_VINCULO_ID.AsString,3, ClientArquivoOPERACAO.AsString)
        end;
    2 : CarregarVinculo('LIVRO_CAIXA_ID',ClientArquivoLIVRO_CAIXA_ID.AsString,0, ClientArquivoOPERACAO.AsString);
    3 : CarregarVinculo('LIVRO_FINANCEIRO_ID',ClientArquivoLIVRO_FINANCEIRO_ID.AsString,1, ClientArquivoOPERACAO.AsString);
    4 : begin
          if ClientArquivoLIVRO_CAIXA_ID.AsInteger > 0 then
            CarregarVinculo('LIVRO_CAIXA_ID',ClientArquivoLIVRO_CAIXA_ID.AsString,2, ClientArquivoOPERACAO.AsString);
        end;
  end;
end;

procedure TfrmConciliacaoBancaria.CarregarArquivo(vpBuscarArquivo: Boolean; vpLimpar : Boolean = True;
       vpHabilitar : Boolean = True);
var
  i : Integer;
begin
  try
    Screen.Cursor := crHourGlass;
    ClientArquivo.ReadOnly := False;

    if vpLimpar then
      ClientArquivo.EmptyDataSet;

    ClientArquivo.DisableControls;
    sqlVinculoEncontrado.DisableControls;
    progressBar.Visible := True;
    progressBar.Position := 0;
    progressBar.Properties.Max := sqlDadosConciliacao.RecordCount;

    vgAgendaConc.LancamentoId := dtmControles.GerarSequencia('J_CONCILIACAO_LANCAMENTO');
    for i := 1 to sqlDadosConciliacao.RecordCount do
    begin
      sqlDadosConciliacao.RecNo := i;
      Application.ProcessMessages;
      ClientArquivo.Append;
      ClientArquivoDATA.AsString      := sqlDadosConciliacaoDATA_PAGAMENTO.AsString;
      ClientArquivoDESCRICAO.AsString := sqlDadosConciliacaoDESCRICAO.AsString;
      ClientArquivoVALOR.AsCurrency   := sqlDadosConciliacaoVALOR.AsCurrency;

      if ClientArquivoVALOR.AsCurrency < 0 then
        ClientArquivoVALOR.AsCurrency := ClientArquivoVALOR.AsCurrency * -1;

      ClientArquivoOPERACAO.AsString    := sqlDadosConciliacaoOPERACAO.AsString;
      ClientArquivoID.AsString          := sqlPesquisaConciliacaoCONCILIACAO_ID.AsString+'-'+sqlDadosConciliacaoID_REGISTRO.AsString;
//      ClientArquivoID.AsString          := sqlDadosConciliacaoCONCILIACAO_REGISTRADO_ID.AsString;
      ClientArquivoREGISTRO.AsString    := sqlDadosConciliacaoID_REGISTRO.AsString;
      ClientArquivoDOCUMENTO.AsString   := sqlDadosConciliacaoDOCUMENTO.AsString;
      ClientArquivoLIBERADO.AsString    := 'N';
      ClientArquivoLANCAMENTO.AsString  := '5';
      ClientArquivoVinculo.AsString     := '1';
      ClientArquivoREGISTRADO.AsBoolean:= TRUE;
      ClientArquivoALTERADO.AsBoolean   := FALSE;
      ClientArquivoCALC_SELECIONADO.AsBoolean   := FALSE;
      VerificarConciliacaoRealizada(ClientArquivoID.AsString);
      ClientArquivo.Post;
      progressBar.Position := progressBar.Position + 1;
    end;
  except
    on E: exception do
      Application.MessageBox(Pchar(E.Message), 'Aviso', mb_IconExclamation);
  end;
  Screen.Cursor := crDefault;
  sqlVinculoEncontrado.EnableControls;
  ClientArquivo.First;

  if vpHabilitar then
    ClientArquivo.EnableControls;

  btnConfirmar.Enabled := ClientArquivo.RecordCount > 0;
  progressBar.Visible := False;
  Screen.Cursor := crDefault;
end;

procedure TfrmConciliacaoBancaria.CarregarsqlVinculoEncontrado(vpCondicao, vpOperacao : String);
begin
  vlSql := ' SELECT LC.LIVRO_CAIXA_ID AS ID, '+
           '        LC.DATA_PAGAMENTO AS DATA, '+
           '        LC.BALANCETE_GRUPO_ID, '+
           '        LC.CONTABIL_CONTA_ID, '+
           '        LC.HISTORICO, '+
           '        LC.DOCUMENTO_NUMERO, '+
           '        LC.CAIXA_ID, '+
           '        LC.OPERACAO, '+
           '        LC.PESSOA_ID, '+
           '        LC.USUARIO_ID, '+
           '        LC.VALOR, '+
           '        LC.CONCILIACAO_IDENTIFICADOR '+
           ' FROM J_LIVRO_CAIXA LC '+
           ' WHERE '+vpCondicao+' = :ID'+
           '   AND CAIXA_ID = '+sqlPesquisaConciliacaoCAIXA_ID.AsString;
  if vpOperacao = 'S'  then
    vlSql := vlSql + ' AND (OPERACAO = :OPERACAO1 OR OPERACAO = :OPERACAO2)';
end;

procedure TfrmConciliacaoBancaria.CarregarSqlLivroFinanceiro(vpCondicao, vpOperacao : String);
begin
  vlSql := ' SELECT LF.LIVRO_FINANCEIRO_ID AS ID, '+
           '        LF.DATA_VENCIMENTO AS DATA, '+
           '        LF.BALANCETE_GRUPO_ID, '+
           '        LF.CONTABIL_CONTA_ID, '+
           '        LF.HISTORICO, '+
           '        LF.DOCUMENTO_NUMERO, '+
           '        LF.CAIXA_ID, '+
           '        LF.OPERACAO, '+
           '        LF.PESSOA_ID, '+
           '        LF.USUARIO_ID, '+
           '        LF.VALOR_AGENDADO AS VALOR, '+
           '        LA.CONCILIACAO_IDENTIFICADOR '+
           ' FROM J_LIVRO_FINANCEIRO LF '+
           '  LEFT OUTER JOIN J_LIVRO_AGENDAMENTO LA ON '+
           '  LF.LIVRO_AGENDAMENTO_ID = LA.LIVRO_AGENDAMENTO_ID '+
           ' WHERE '+vpCondicao+' = :ID '+
           '   AND LF.SITUACAO = '+ QuotedStr('1')+
           '   AND LF.TIPO_CARGA_ID IS NULL '+
           '   AND LF.OPERACAO = '+ QuotedStr(vpOperacao);
end;

procedure TfrmConciliacaoBancaria.ClientArquivoAfterEdit(DataSet: TDataSet);
begin
  ClientArquivoALTERADO.AsBoolean := True;
end;

procedure TfrmConciliacaoBancaria.ClientArquivoAfterScroll(DataSet: TDataSet);
begin
  grdBasicaDBTableViewUnir.Properties.ReadOnly := ((ClientArquivoSITUACAO.AsString <> '0') and (ClientArquivoLANCAMENTO.AsString <> '5'));
  grdBasicaDBTableObs.Options.Editing := not ((ClientArquivoSITUACAO.AsString = '1') and (ClientArquivoLIBERADO.AsString = 'I'));
end;

procedure TfrmConciliacaoBancaria.cxGridDBTableView1DblClick(Sender: TObject);
begin
  if sqlPesquisaConciliacao.RecordCount > 0 then
    pgcConciliacao.ActivePageIndex := 1;
end;

procedure TfrmConciliacaoBancaria.edtPesqDataIniExit(Sender: TObject);
begin
  if edtPesqDataFin.EditValue = null then
    edtPesqDataFin.EditValue := edtPesqDataIni.EditValue;

end;

procedure TfrmConciliacaoBancaria.ExportarExcel1Click(Sender: TObject);
begin
  if not DirectoryExists('C:\TEMP\') then
    MkDir('C:\TEMP\');

  ExportGridToExcel('C:\TEMP\REL_CONCILIACAO.XLS', grdBasica);
  AbrirPlanilha('REL_CONCILIACAO.XLS');
end;

procedure TfrmConciliacaoBancaria.btnTransferenciaManualClick(Sender: TObject);
begin
  RegistrarItem(True);
end;

procedure TfrmConciliacaoBancaria.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sqlModelosProgramados.Active := False;

  Action      := caFree;
  frmConciliacaoBancaria := nil;
end;

procedure TfrmConciliacaoBancaria.FormCreate(Sender: TObject);
begin
  vlCriandoForm := True;
  MontarPeriodos;
  sqlVinculoEncontrado.Connection     := dtmControles.DB;
  sqlContasBancarias.Connection       := dtmControles.DB;
  sqlLivroCaixa.Connection            := dtmControles.DB;
  sqlFinanceiroCompromisso.Connection := dtmControles.DB;
  sqlModelosProgramados.Connection    := dtmControles.DB;
  pgcConciliacao.ActivePageIndex      := 0;
  tbcConciliacaoDados.TabVisible      := False;
  sqlContasBancarias.Active           := True;
  sqlModelosProgramados.Active        := True;
  btnPesquisarConciliacaoClick(self);
  vlCriandoForm := False;
end;

procedure TfrmConciliacaoBancaria.grdBasicaDBTableViewUnirCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if (AViewInfo.RecordViewInfo.GridRecord.Values[6] <> '0') then
    ACanvas.Brush.Color := clSilver;
end;

procedure TfrmConciliacaoBancaria.grdBasicaDBTableView1Column10PropertiesChange(
  Sender: TObject);
begin
  ClientArquivo.Post;
end;

procedure TfrmConciliacaoBancaria.grdBasicaDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if (AViewInfo.RecordViewInfo.GridRecord.Values[7]) = '1' then
    ACanvas.Font.Color  := clGrayText;

  if (AViewInfo.RecordViewInfo.GridRecord.Values[0]) <> '' then
    ACanvas.Brush.Color  := clSilver;
end;

procedure TfrmConciliacaoBancaria.grdBasicaDBTableView1DblClick(
  Sender: TObject);
begin
  if (not btnLancamentoManual.Enabled) then
    exit;

  RegistrarItem;
end;

procedure TfrmConciliacaoBancaria.grdBasicaDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  HabilitarCampos;
end;

procedure TfrmConciliacaoBancaria.HabilitarCampos;
begin
  if ClientArquivoSITUACAO.AsString = '' then
    exit;

  rdbVinculo.Visible     := ClientArquivoSITUACAO.AsInteger in [0,2,3,4,5];
  VerificarSituacaoVinculo(ClientArquivoSITUACAO.AsInteger);
  BuscarVinculoRegistro;
  ClientArquivo.ReadOnly          := False;
  btnLancamentoManual.Enabled     := (ClientArquivoLANCAMENTO.AsInteger = 5) and (ClientArquivoLIBERADO.AsString = 'N');
  btnTransferenciaManual.Enabled  := (ClientArquivoLANCAMENTO.AsInteger = 5) and (ClientArquivoLIBERADO.AsString = 'N');
  lblBuscarItemRegistrado.Enabled := ((ClientArquivoLANCAMENTO.AsInteger = 5) and (ClientArquivoVINCULO.AsString = '1')) or
                                     ((ClientArquivoVINCULO.AsString = '0') and (ClientArquivoLIBERADO.AsString <> 'I'));
  lblBuscarItemAgendado.Enabled   := (ClientArquivoLANCAMENTO.AsInteger = 5) and (ClientArquivoVINCULO.AsString = '1') and  (ClientArquivoVINCULO.AsString = '0');;
  lblDesfazerConciliacao.Enabled  := (ClientArquivoSITUACAO.AsString = '1');

  lblLancamentoPlanejado.Enabled  := (ClientArquivoLANCAMENTO.AsInteger > 0) and (ClientArquivoMODELO.AsString <> 'A');
  if ClientArquivoMODELO.AsString = '' then
       lblLancamentoPlanejado.Caption := '  Colocar Item Lançamento Planejado  (Modelo)'
  else lblLancamentoPlanejado.Caption := '  Retirar Item Lançamento Planejado  (Modelo)';

  if rdbVinculo.Visible then
  begin
    if rdbVinculo.ItemIndex = -1 then
         rdbVinculo.Style.Color := clMoneyGreen
    else rdbVinculo.Style.Color := clWindow;
  end;

end;

procedure TfrmConciliacaoBancaria.IdentificarModelosGrid;
var
  viPosicao : Integer;
begin
  ClientArquivo.ReadOnly := False;
  ClientArquivo.DisableControls;
  viPosicao := ClientArquivo.RecNo;
  ClientArquivo.First;
  while not ClientArquivo.Eof do
  begin
    if ClientArquivoSITUACAO.AsInteger = 1 then
      BuscarModeloPlanejado(ClientArquivoDESCRICAO.AsString, ClientArquivoID.AsString, True)
    else
      if ClientArquivoSITUACAO.AsInteger in [0,2,4,5] then
        BuscarModeloPlanejado(ClientArquivoDESCRICAO.AsString, '', True);
    ClientArquivo.Next;
  end;
  ClientArquivo.RecNo := viPosicao;
  ClientArquivo.EnableControls;
end;

procedure TfrmConciliacaoBancaria.lblBuscarItemAgendadoClick(Sender: TObject);
var
  viPosicaoID : String;
begin
  vgDadosCadastro.SomentePesquisa := True;
  vgLivroCaixa := False;
  ExibirFormulario(TfrmVinculoConciliacaoBancaria, frmVinculoConciliacaoBancaria, True);

  if vgConciliacaoId = '' then
    exit;

  viPosicaoID  := ClientArquivoID.AsString;
  VincularItemLancamentoAgendado;
  btnAtualizarClick(self);
  ClientArquivo.Filtered := False;

  ClientArquivo.Locate('ID', viPosicaoID, [loCaseInsensitive]);
  ClientArquivo.EnableControls;
  Screen.Cursor := crDefault;
  Application.MessageBox('Execução realizada com sucesso!!!','Aviso', MB_OK + MB_ICONINFORMATION);

  progressBar.Visible := False;
end;

procedure TfrmConciliacaoBancaria.lblBuscarItemRegistradoClick(Sender: TObject);
var
  viQtd : Integer;
  viConciliado : Boolean;
  viPosicaoID : String;
begin
  vgDadosCadastro.SomentePesquisa := True;
  vgLivroCaixa := True;
  ExibirFormulario(TfrmVinculoConciliacaoBancaria, frmVinculoConciliacaoBancaria, True);

  if vgConciliacaoId = '' then
    exit;

  if ClientArquivo.Filtered then
  begin
    ClientArquivo.First;
    viQtd := ClientArquivo.RecordCount;
  end
  else viQtd := 1;

  viPosicaoID  := ClientArquivoID.AsString;
  viConciliado := False;
  repeat
    // Registra o Item de Conciliacao e/ou 1º Item de Conciliação nos Item(s) do caixa selecionado(s).
    if not viConciliado then
      VincularItemLancamentoCaixa(vgConciliacaoId, ClientArquivoID.AsString)
    else
    begin
      // Seta Demais Itens Como Registrado Vinculados ao 1º Item de Conciliacao
       VincularItemConciliadosUnidos;
       viQtd := 1;
    end;

    Dec(viQtd);
    viConciliado := True;
  until viQtd = 0;

  btnAtualizarClick(self);

  ClientArquivo.Filtered := False;
  ClientArquivo.Locate('ID', viPosicaoID, [loCaseInsensitive]);
  ClientArquivo.EnableControls;
  Screen.Cursor := crDefault;
  Application.MessageBox('Execução realizada com sucesso!!!','Aviso', MB_OK + MB_ICONINFORMATION);

  progressBar.Visible := False;
end;

procedure TfrmConciliacaoBancaria.lblConciliarSemRegistroClick(Sender: TObject);
begin
  ClientArquivo.Filtered := False;
  ClientArquivo.Filter   := '((LIBERADO = '+QuotedStr('I')+') OR (CALC_SELECIONADO = TRUE))';
  ClientArquivo.Filtered := True;

  if ClientArquivo.IsEmpty then
  begin
    Application.MessageBox('Nenhum Item Selecionado pra Conciliação sem Registro Financeiro!!!', 'Atenção', mb_Ok + MB_ICONEXCLAMATION);
    ClientArquivo.Filtered := False;
    exit;
  end;

  if Application.MessageBox('Setar itens(s) Selecionados como Conciliados?', 'Confirmação', MB_YESNO) = IDNO then
  begin
    ClientArquivo.Filtered := False;
    exit;
  end;

  ClientArquivo.First;
  while not ClientArquivo.eof do
  begin
    ExecutaSqlAuxiliar(' UPDATE J_CONCILIACAO_REGISTRADO SET SITUACAO = ''1'', LIBERADO = ''I'','+
                       '                                 OBSERVACAO = '+QuotedStr('Conciliado sem Registro Financeiro')+
                       ' WHERE CONCILIACAO_REGISTRADO_ID = '+QuotedStr(ClientArquivoID.AsString),1);
    ClientArquivo.Next;
  end;
  ClientArquivo.Filtered := False;
  btnAtualizarClick(self);
end;

procedure TfrmConciliacaoBancaria.lblDesfazerConciliacaoClick(Sender: TObject);
var
  viSql : String;
  viPos : Integer;
begin
  if Application.MessageBox('Desfazer Conciliação do Item Selecionado?', 'Confirmação', MB_YESNO) = IDNO then
    exit;

  if LiberarPermissaoUsuario('ESP_DESFAZER_CONCILIACAO')[6] = '0' then
    exit;

  ExecutaSqlAuxiliar(' UPDATE J_LIVRO_CAIXA SET DATA_PAGAMENTO = DATA_ANTERIOR, '+
                     '                        ANO_MES_REGISTRO = ANO_MES_ANTERIOR '+
                     ' WHERE CONCILIACAO_REGISTRADO_ID = '+QuotedStr(ClientArquivoID.AsString)+
                     '   AND NOT DATA_ANTERIOR IS NULL', 1);

  ExecutaSqlAuxiliar(' UPDATE J_LIVRO_CAIXA SET CONCILIACAO_REGISTRADO_ID = NULL '+
                     ' WHERE CONCILIACAO_REGISTRADO_ID = '+QuotedStr(ClientArquivoID.AsString), 1);

  viSql := ' UPDATE J_CONCILIACAO_REGISTRADO SET SITUACAO = '+ QuotedStr('0')+','+
           '                                   LANCAMENTO = '+ QuotedStr('5')+','+
           '                                     LIBERADO = '+ QuotedStr('N')+','+
           '                       CONCILIACAO_VINCULO_ID = NULL';

  viSql := viSql + ' WHERE CONCILIACAO_REGISTRADO_ID = '+QuotedStr(ClientArquivoID.AsString)+
                   '    OR CONCILIACAO_VINCULO_ID = '+QuotedStr(ClientArquivoID.AsString);
  ExecutaSqlAuxiliar(viSql,1);

  viPos := ClientArquivo.RecNo;
  btnAtualizarClick(self);
  ClientArquivo.RecNo := viPos;
  Application.MessageBox('Conciliação do Item Desfeita!!!', 'Atenção', mb_Ok + MB_ICONEXCLAMATION);
end;

procedure TfrmConciliacaoBancaria.lblDesmarcarTodosClick(Sender: TObject);
begin
  dtmLookup.MarcarDesmarcarItensSimpleDataSet('N', sqlPesquisaConciliacao);
end;

procedure TfrmConciliacaoBancaria.lblExcluirModeloClick(Sender: TObject);
begin
  if Application.MessageBox('Excluir Modelo Selecionado?', 'Confirmação', MB_YESNO) = IDNO then
    exit;

  AtualizarLivroCaixa(sqlModelosProgramadosid.AsInteger, '', '');
  sqlModelosProgramados.Refresh;
  lblExcluirModelo.Enabled := not sqlModelosProgramados.IsEmpty;
end;

procedure TfrmConciliacaoBancaria.lblLancamentoPlanejadoClick(Sender: TObject);
var
  viValor  : String;
begin
  if (ClientArquivoSITUACAO.AsInteger in [0,1,2,3,4]) then
  begin
    if Application.MessageBox(PChar(lblLancamentoPlanejado.Caption+#13+#13+
                              'Identificador = '+ClientArquivoDESCRICAO.AsString), 'Confirmação', MB_YESNO) = IDNO then
      exit;

    if ClientArquivoMODELO.AsString = 'S' then
         viValor := ''
    else viValor := 'S';

    ClientArquivo.ReadOnly := False;
    ClientArquivo.Edit;
    ClientArquivoMODELO.AsVariant := viValor;
    ClientArquivo.Post;

    if ClientArquivoSITUACAO.AsInteger in [1,2] then
    begin
      if ClientArquivoLIVRO_CAIXA_ID.AsInteger > 0 then
           AtualizarLivroCaixa(ClientArquivoLIVRO_CAIXA_ID.AsInteger, ClientArquivoMODELO.AsString, ClientArquivoDESCRICAO.AsString)
      else AtualizarLivroCaixa(sqlVinculoEncontradoID.AsInteger, ClientArquivoMODELO.AsString, ClientArquivoDESCRICAO.AsString);

      ClientArquivo.ReadOnly := False;
      VerificarConciliacaoRealizada(ClientArquivoID.AsString, True);
      IdentificarModelosGrid;
    end;

    HabilitarCampos;
  end;
end;

procedure TfrmConciliacaoBancaria.lblMarcarTodosClick(Sender: TObject);
begin
  dtmLookup.MarcarDesmarcarItensSimpleDataSet('S', sqlPesquisaConciliacao);
end;

procedure TfrmConciliacaoBancaria.lcbContaPropertiesEditValueChanged(
  Sender: TObject);
begin
//  btnPesquisarRetorno.Enabled := True;
end;

procedure TfrmConciliacaoBancaria.lcxPesqContaPropertiesEditValueChanged(
  Sender: TObject);
begin
  btnPesquisarConciliacaoClick(Self);
end;

procedure TfrmConciliacaoBancaria.MontarPeriodos;
var
  viData1, viData2, viMes, viMesMenor, viOrdenacao : String;
  i : Integer;
  viPrimeiraData : TDate;
begin

  MontarDataInicioFinal(vgDataAtualTipo4, viData1, viData2, '/');

  ExecutaSqlAuxiliar(' SELECT FIRST 1 DATA_CONCILIACAO '+
                     ' FROM J_CONCILIACAO '+
                     ' ORDER BY DATA_CONCILIACAO ',0);

  if dtmControles.sqlAuxiliar.IsEmpty then
       viPrimeiraData := StrToDate(viData1)
  else viPrimeiraData := dtmControles.sqlAuxiliar.FieldByName('DATA_CONCILIACAO').AsDateTime;

  tbcPeriodo.Tabs.Clear;
  for i := 1 to 12 do
  begin
    vlVetMeses[i,1] := viData1;
    vlVetMeses[i,2] := viData2;
    vlVetPeriodo[i] := copy(viData1 ,7,4)+copy(viData2 ,4,2);

    tbcPeriodo.Tabs.Add(dtmLookupContabil.MesAnoReferencia(viData1));
    viData1 := DateToStr(StrToDate(viData1)-28);
    MontarDataInicioFinal(viData1, viData1, viData2, '/');

    viMes      := copy(viData1,7,4)+copy(viData1,4,2);
    viMesMenor := copy(DatetoStr(viPrimeiraData) ,7,4)+copy(DatetoStr(viPrimeiraData) ,4,2);
    if viMes < viMesMenor then
    begin
      tbcPeriodo.TabIndex := 0;
      Break;
    end;
  end;
  tbcPeriodo.TabIndex := 0;
end;

procedure TfrmConciliacaoBancaria.pgcConciliacaoChange(Sender: TObject);
var
  viPos, viQtd : Integer;

  procedure VerificarCarregamento;
  begin
    viPos := sqlPesquisaConciliacao.RecNo;
    sqlPesquisaConciliacao.DisableControls;
    sqlPesquisaConciliacao.Filtered := False;
    sqlPesquisaConciliacao.Filter   := 'CALC_SELECIONADO = TRUE';
    sqlPesquisaConciliacao.Filtered := True;

    if (sqlPesquisaConciliacao.IsEmpty) or (sqlPesquisaConciliacao.RecordCount = 1) then
    begin
      sqlPesquisaConciliacao.Filtered := False;
      sqlPesquisaConciliacao.RecNo    := viPos;
      viQtd := 1;
    end
    else
    begin
      viQtd := sqlPesquisaConciliacao.RecordCount;
    end;
  end;

begin
  if pgcConciliacao.ActivePageIndex = 1 then
  begin
    VerificarCarregamento;

    pnlInformacaoConciliacao.Caption := '';
    if not sqlPesquisaConciliacao.Filtered then
    begin
      pnlInformacaoConciliacao.Caption := ' Conta '+dtmControles.GetStr(' SELECT DESCRICAO FROM J_CAIXA WHERE CAIXA_ID = '+ sqlPesquisaConciliacaoCAIXA_ID.AsString)+
                                          '   -   Data: '+ sqlPesquisaConciliacaoDATA_CONCILIACAO.AsString;

      if sqlPesquisaConciliacaoSITUACAO.AsString = '1' then
           pnlInformacaoConciliacao.Caption := '  CONCILIAÇÃO ABERTA - '+pnlInformacaoConciliacao.Caption
      else pnlInformacaoConciliacao.Caption := '  CONCILIAÇÃO CONCLUÍDA - '+pnlInformacaoConciliacao.Caption;
    end;

    LockWindowUpdate(Handle);
    repeat
      sqlDadosConciliacao.Active := False;
      sqlDadosConciliacao.DataSet.ParamByName('CONCILIACAO_ID').AsInteger := sqlPesquisaConciliacaoCONCILIACAO_ID.AsInteger;
      sqlDadosConciliacao.Active := True;

      if sqlPesquisaConciliacao.Filtered then
      begin
        if pnlInformacaoConciliacao.Caption = '' then
        begin
          CarregarArquivo(False, True);
          pnlInformacaoConciliacao.Caption := dtmControles.GetStr(' SELECT RESUMO FROM J_CAIXA WHERE CAIXA_ID = '+ sqlPesquisaConciliacaoCAIXA_ID.AsString)+
                                              ' - Data: '+ sqlPesquisaConciliacaoDATA_CONCILIACAO.AsString;
        end
        else
        begin
          CarregarArquivo(False, False);
          pnlInformacaoConciliacao.Caption := pnlInformacaoConciliacao.Caption +
                                              ' *** '+ dtmControles.GetStr(' SELECT RESUMO FROM J_CAIXA WHERE CAIXA_ID = '+ sqlPesquisaConciliacaoCAIXA_ID.AsString)+
                                              ' - Data: '+ sqlPesquisaConciliacaoDATA_CONCILIACAO.AsString;
        end;

        sqlPesquisaConciliacao.Next;
      end
      else CarregarArquivo(False);

      Dec(viQtd);
    until viQtd = 0;
    LockWindowUpdate(0);
    btnLancamentoProgramado.Enabled := sqlPesquisaConciliacaoSITUACAO.AsString = '1';
    rdbVinculo.Enabled              := (sqlPesquisaConciliacaoSITUACAO.AsString = '1');
    btnConcluir.Enabled             := (sqlPesquisaConciliacaoSITUACAO.AsString = '1') and (not sqlPesquisaConciliacao.Filtered);
    btnConcliacaoIncluir.Enabled    := False;
    pnlOpcoes.Visible               := sqlPesquisaConciliacaoSITUACAO.AsString = '1';
  end
  else btnConcliacaoIncluir.Enabled := True;

  if sqlPesquisaConciliacao.Filtered then
  begin
    sqlPesquisaConciliacao.Filtered := False;
    sqlPesquisaConciliacao.RecNo    := viPos;
  end;
  sqlPesquisaConciliacao.EnableControls;
end;

procedure TfrmConciliacaoBancaria.rdbVinculoClick(Sender: TObject);
begin
  grdBasica.SetFocus;
end;

procedure TfrmConciliacaoBancaria.rdbVinculoPropertiesChange(Sender: TObject);
begin
  if ClientArquivo.State in [dsEdit] then
  begin
    if ClientArquivoSITUACAO.AsInteger in [2,3,4] then
    begin
      if rdbVinculo.ItemIndex = 0 then
      begin
        case ClientArquivoSITUACAO.AsInteger of
          2 : AtualizarSituacaoItem(ClientArquivoSITUACAO.AsString,'S', 1,'2');
          3 : AtualizarSituacaoItem(ClientArquivoSITUACAO.AsString,'S', 1,'4');
          4 : begin
                AtualizarSituacaoItem(ClientArquivoSITUACAO.AsString,'S', 1,'3');
//                ClientArquivoREGISTRADO.AsBoolean := False;
              end;
        end
      end
      else AtualizarSituacaoItem(ClientArquivoSITUACAO.AsString,'N', 0,'5');
    end
    else
    begin
      if rdbVinculo.ItemIndex = 0 then
           AtualizarSituacaoItem('0','N', 1,'5')
      else AtualizarSituacaoItem('5','I', 0,'0')
    end;
    ClientArquivoALTERADO.AsBoolean := True;
  end;
  HabilitarCampos;
  ClientArquivoAfterScroll(ClientArquivo);
end;

procedure TfrmConciliacaoBancaria.RegistrarConciliacao(vpSituacao, vpLancamento, vpLiberado : string;
         vpAutomatico : Boolean = False);
var
  viSql : String;

  procedure RegistrarAtualizacao;
  begin
    viSql :=  ' UPDATE J_CONCILIACAO_REGISTRADO SET ' +
              '              SITUACAO = :SITUACAO, ' +
              '              LIBERADO = :LIBERADO, ' +
              '              VINCULO  = :VINCULO, ' +
              '              LANCAMENTO = :LANCAMENTO, ' +
              '              OBSERVACAO = :OBSERVACAO '+
              ' WHERE CONCILIACAO_REGISTRADO_ID = :CONCILIACAO_REGISTRADO_ID';
  end;

  procedure RegistrarNovoItem;
  begin
    viSql :=  ' INSERT INTO J_CONCILIACAO_REGISTRADO( ' +
              '              CONCILIACAO_REGISTRADO_ID, '+
              '              DATA_CONCILIACAO, ' +
              '              LANCAMENTO_ID, ' +
              '              DATA_PAGAMENTO, ' +
              '              DESCRICAO, ' +
              '              SITUACAO, ' +
              '              LIBERADO, ' +
              '              VINCULO, ' +
              '              LANCAMENTO, ' +
              '              OBSERVACAO, ' +
              '              VALOR) '+
              ' VALUES(      :CONCILIACAO_REGISTRADO_ID, ' +
              '              :DATA_CONCILIACAO, ' +
              '              :LANCAMENTO_ID, ' +
              '              :DATA_PAGAMENTO, ' +
              '              :DESCRICAO, ' +
              '              :SITUACAO, ' +
              '              :LIBERADO, ' +
              '              :VINCULO, ' +
              '              :LANCAMENTO, '+
              '              :OBSERVACAO, ' +
              '              :VALOR)';
  end;

  procedure CarregarValoresGravar(vpNovo : Boolean);
  begin
    ExecutaSqlAuxiliar(viSql,2);
    with dtmControles.sqlAuxiliar do
    begin
      if vpNovo then
      begin
        ParamByName('DATA_CONCILIACAO').AsString          := dtmControles.DataHoraBanco(5);
        ParamByName('LANCAMENTO_ID').AsInteger            := vgAgendaConc.LancamentoId;
        ParamByName('DATA_PAGAMENTO').AsString            := FormatDateTime('DD.MM.YYYY HH:MM:SS', ClientArquivoDATA.AsDateTime);
        ParamByName('DESCRICAO').AsString                 := ClientArquivoDESCRICAO.AsString;
        ParamByName('VALOR').AsCurrency                   := ClientArquivoVALOR.AsCurrency;
      end;

      ParamByName('CONCILIACAO_REGISTRADO_ID').AsString := ClientArquivoID.AsString;
      ParamByName('SITUACAO').AsString                  := vpSituacao;
      ParamByName('LIBERADO').AsString                  := vpLiberado;
      ParamByName('LANCAMENTO').AsString                := vpLancamento;
      ParamByName('VINCULO').AsString                   := ClientArquivoVinculo.AsString;
      ParamByName('OBSERVACAO').AsString                := ClientArquivoOBSERVACAO.AsString;
      ExecSQL(False);
    end;
  end;

begin
  if ClientArquivoREGISTRADO.AsBoolean then
  begin
    if ClientArquivoALTERADO.AsBoolean or vpAutomatico then
    begin
      RegistrarAtualizacao;
      CarregarValoresGravar(False);
    end;
  end
  else
  begin
    RegistrarNovoItem;
    CarregarValoresGravar(True);
  end;
end;

procedure TfrmConciliacaoBancaria.RegistrarItem(vpTransferencia : Boolean = False);

  procedure Validar;
  begin
    case ClientArquivoSITUACAO.AsInteger of
      1 : begin
            Application.MessageBox('Este item ja foi lançado!!!', 'Atenção', mb_Ok + MB_ICONEXCLAMATION);
            Abort;
          end;
    end;
  end;

begin
  Validar;
  vgAgendaConc.Conciliacao    := True;
  vgAgendaConc.Operacao       := ClientArquivoOPERACAO.AsString;
  vgAgendaConc.Historico      := ClientArquivoDESCRICAO.AsString;
  vgAgendaConc.CaixaId        := sqlPesquisaConciliacaoCAIXA_ID.AsInteger;
  vgAgendaConc.Valor          := ClientArquivoVALOR.AsCurrency;
  vgAgendaConc.Data           := ClientArquivoDATA.AsDateTime;
  vgAgendaConc.Identificador  := ClientArquivoID.AsString;

  vgDadosCadastro.SomentePesquisa := True;

  if vpTransferencia then
  begin
    vgDadosLivroCaixa.Novo := True;
    CadTransferencia(True);
  end
  else
  begin
    dtmLookupServico.CarregarDadosLancamento(1, 0, nil);
    ExibirFormulario(TfrmCadastroRapidoLancamento, frmCadastroRapidoLancamento, True);
  end;

  if not vgDadosLivroCaixa.Confirmado then
    exit;

  RegistrarConciliacao('1', '1','R', True);
  AtualizarLivroCaixa(vgDadosLivroCaixa.LivroCaixaId, ClientArquivoMODELO.AsString, ClientArquivoDESCRICAO.AsString);
  VerificarConciliacaoRealizada(vgAgendaConc.Identificador, True);
  if ClientArquivoMODELO.AsString = 'S' then
    IdentificarModelosGrid;
end;

procedure TfrmConciliacaoBancaria.SalvarDados(vpAutomatico: Boolean);
var
  viPosicao : Integer;
begin
  ClientArquivo.DisableControls;
  viPosicao := ClientArquivo.RecNo;
  ClientArquivo.First;

  IniciarIncrementarProgressBar(progressBar, ClientArquivo.RecordCount);
  Screen.Cursor := crHourGlass;
  dtmControles.StartTransaction;
  try
    while not ClientArquivo.Eof do
    begin
      RegistrarConciliacao(ClientArquivoSITUACAO.AsString, ClientArquivoLANCAMENTO.AsString, ClientArquivoLIBERADO.AsString);
      ClientArquivo.Next;
      IniciarIncrementarProgressBar(progressBar, 1, True);
    end;
    dtmControles.Commit;
  except
    dtmControles.Roolback;
    Application.MessageBox('Falha ao Salvar Dados!!!','Aviso', MB_OK + MB_ICONINFORMATION);
  end;
  ClientArquivo.RecNo := viPosicao;
  ClientArquivo.EnableControls;
  Screen.Cursor := crDefault;

  if not vpAutomatico then
    Application.MessageBox('Dados da Conciliação Salvo!!!','Aviso', MB_OK + MB_ICONINFORMATION);
  progressBar.Visible := False;
end;

procedure TfrmConciliacaoBancaria.sqlModelosProgramadosAfterScroll(
  DataSet: TDataSet);
begin
  lblExcluirModelo.Enabled := not sqlModelosProgramados.IsEmpty;
end;

procedure TfrmConciliacaoBancaria.sqlPesquisaConciliacaoAfterScroll(
  DataSet: TDataSet);
begin
  if sqlPesquisaConciliacao.Filtered then
    exit;

  btnConcliacaoExluir.Enabled    := (not sqlPesquisaConciliacao.IsEmpty) and (sqlPesquisaConciliacaoSITUACAO.AsString = '1');
  tbcConciliacaoDados.TabVisible := not sqlPesquisaConciliacao.IsEmpty;
  lblMarcarTodos.Enabled   := not sqlPesquisaConciliacao.IsEmpty;
  lblDesmarcarTodos.Enabled:= not sqlPesquisaConciliacao.IsEmpty;
end;

procedure TfrmConciliacaoBancaria.sqlVinculoEncontradoCalcFields(
  DataSet: TDataSet);
begin
if ClientArquivoLIVRO_FINANCEIRO_ID.AsInteger > 0 then
    sqlVinculoEncontradoCALC_OBSERVACAO.AsString := 'Item Agendado à ser Lançado!!!'
  else
    if Pos('T', sqlVinculoEncontradoOPERACAO.AsString) > 0 then
      sqlVinculoEncontradoCALC_OBSERVACAO.AsString := 'VINCULO DE TRANSFERENCIA BANCÁRIA'
end;

procedure TfrmConciliacaoBancaria.tbcPeriodoChange(Sender: TObject);
begin
  if vlCriandoForm then
    exit;

  btnPesquisarConciliacaoClick(Self);
end;

procedure TfrmConciliacaoBancaria.VerificarConciliacaoRealizada(vpID : string; vpAbrirEdicao : Boolean = False);
var
  viLista : TStringList;

  procedure VerificarItemLivroCaixa;
  begin
    CarregarsqlVinculoEncontrado('VALOR', 'S');
    vlSql := vlSql +
            ' AND DATA_PAGAMENTO = :DATA_PAGAMENTO';
    sqlVinculoEncontrado.Active := False;
    sqlVinculoEncontrado.DataSet.CommandText := vlSql;
    sqlVinculoEncontrado.DataSet.ParamByName('ID').AsCurrency         := ClientArquivoVALOR.AsCurrency;
    sqlVinculoEncontrado.DataSet.ParamByName('DATA_PAGAMENTO').AsDate := ClientArquivoDATA.AsDateTime;
    sqlVinculoEncontrado.DataSet.ParamByName('OPERACAO1').AsString    := ClientArquivoOPERACAO.AsString;
    sqlVinculoEncontrado.DataSet.ParamByName('OPERACAO2').AsString    := 'T'+ClientArquivoOPERACAO.AsString;
    sqlVinculoEncontrado.Active := True;

    if sqlVinculoEncontrado.IsEmpty then
      exit
    else
    begin
      if sqlVinculoEncontrado.RecordCount = 1 then
      begin
        ClientArquivoLIVRO_CAIXA_ID.AsInteger := sqlVinculoEncontradoID.AsInteger;
        if sqlVinculoEncontradoCONCILIACAO_IDENTIFICADOR.AsString <> '' then
          ClientArquivoMODELO.AsString := 'S';
        if (viLista.Values['SITUACAO'] = '') or (viLista.Values['SITUACAO'] = '0') or (viLista.Values['SITUACAO'] = '5') then
        begin
          if sqlVinculoEncontradoCONCILIACAO_IDENTIFICADOR.IsNull then
               AtualizarSituacaoItem('2','A',null, ClientArquivoLANCAMENTO.AsVariant)
          else ClientArquivoLIVRO_CAIXA_ID.AsVariant := null;
        end;
      end;
    end;
  end;

  procedure VerificarItemLivroFinanceiro;
  begin
    CarregarSqlLivroFinanceiro('LF.VALOR_AGENDADO', ClientArquivoOPERACAO.AsString);
    vlSql := vlSql + ' AND LF.ANO_MES_REFERENCIA = :ANO_MES_REFERENCIA';
    sqlVinculoEncontrado.Active := False;
    sqlVinculoEncontrado.DataSet.CommandText := vlSql;
    sqlVinculoEncontrado.DataSet.ParamByName('ID').AsCurrency               := ClientArquivoVALOR.AsCurrency;
    sqlVinculoEncontrado.DataSet.ParamByName('ANO_MES_REFERENCIA').AsString := PegarAnoMes(ClientArquivoDATA.AsString);
    sqlVinculoEncontrado.Active := True;

    if sqlVinculoEncontrado.IsEmpty then
      exit
    else
    begin
      if sqlVinculoEncontrado.RecordCount = 1 then
      begin
        ClientArquivoLIVRO_FINANCEIRO_ID.AsInteger := sqlVinculoEncontradoID.AsInteger;
        if sqlVinculoEncontradoCONCILIACAO_IDENTIFICADOR.AsString <> '' then
          ClientArquivoMODELO.AsString := 'S';
        if (viLista.Values['SITUACAO'] = '') or (viLista.Values['SITUACAO'] = '1') then
          AtualizarSituacaoItem('3','A',null, ClientArquivoLANCAMENTO.AsVariant);
      end;
    end;
  end;

  function VerificarVinculoRegistrado:Boolean;
  begin
    Result := dtmControles.GetInt(' SELECT LIVRO_CAIXA_ID FROM J_LIVRO_CAIXA WHERE CONCILIACAO_REGISTRADO_ID = '+QuotedStr(vpID)) > 0;
    if Result then
      Exit;

    Result := dtmControles.GetStr(' SELECT CONCILIACAO_REGISTRADO_ID FROM J_CONCILIACAO_REGISTRADO '+
                                  ' WHERE CONCILIACAO_REGISTRADO_ID = '+QuotedStr(ClientArquivoID.AsString)) <> '';
    if Result then
      exit;

    ClientArquivoSITUACAO.AsString := '0';
  end;

begin
  if vpAbrirEdicao then
    ClientArquivo.Edit;

  // Verificar se ja foi salvo e/ou registrado.
  viLista := dtmControles.GetFields(' SELECT SITUACAO, LIBERADO, VINCULO, LANCAMENTO, OBSERVACAO, '+
                                    '        CONCILIACAO_VINCULO_ID FROM J_CONCILIACAO_REGISTRADO WHERE CONCILIACAO_REGISTRADO_ID = '+QuotedStr(vpID));
  if viLista.Values['SITUACAO'] = '' then
    ClientArquivoSITUACAO.AsString := '0'
  else
  begin
    ClientArquivoREGISTRADO.AsBoolean := TRUE;
    ClientArquivoOBSERVACAO.AsString             := viLista.Values['OBSERVACAO'];
    ClientArquivoCONCILIACAO_VINCULO_ID.AsString := viLista.Values['CONCILIACAO_VINCULO_ID'];

    if (viLista.Values['SITUACAO'] = '1') then
    begin
      if VerificarVinculoRegistrado then
        AtualizarSituacaoItem(viLista.Values['SITUACAO'], viLista.Values['LIBERADO'], viLista.Values['VINCULO'], viLista.Values['LANCAMENTO']);
    end
    else AtualizarSituacaoItem(viLista.Values['SITUACAO'], viLista.Values['LIBERADO'], viLista.Values['VINCULO'], viLista.Values['LANCAMENTO']);
  end;

  // Verificar no Livro Caixa
{  if ClientArquivoSITUACAO.AsInteger in [0,2,4,5] then
  begin
    BuscarModeloPlanejado(ClientArquivoDESCRICAO.AsString);
    if ClientArquivoSITUACAO.AsInteger <> 4 then
    begin
      VerificarItemLivroCaixa;
      if (ClientArquivoLIVRO_CAIXA_ID.IsNull) and (ClientArquivoSITUACAO.AsInteger in [0,5]) then
      begin
        VerificarItemLivroFinanceiro;
        if ClientArquivoLIVRO_CAIXA_ID.IsNull and ClientArquivoLIVRO_FINANCEIRO_ID.IsNull then
          AtualizarSituacaoItem('0', 'N', '1', '5');
      end;
    end;
  end
  else
    if ClientArquivoSITUACAO.AsInteger = 3 then
    begin
      VerificarItemLivroFinanceiro;
      if ClientArquivoLIVRO_CAIXA_ID.IsNull and ClientArquivoLIVRO_FINANCEIRO_ID.IsNull then
        AtualizarSituacaoItem('0', 'N', '1', '5');
    end
  else BuscarModeloPlanejado(ClientArquivoDESCRICAO.AsString, ClientArquivoID.AsString);}

  // Verificar no Livro Caixa
  if ClientArquivoSITUACAO.AsInteger in [0,2,4,5] then
  begin
    VerificarItemLivroCaixa;
    if (ClientArquivoLIVRO_CAIXA_ID.IsNull) and (ClientArquivoSITUACAO.AsInteger in [0,5]) then
    begin
      VerificarItemLivroFinanceiro;
      if ClientArquivoLIVRO_CAIXA_ID.IsNull and ClientArquivoLIVRO_FINANCEIRO_ID.IsNull then
      begin
        BuscarModeloPlanejado(ClientArquivoDESCRICAO.AsString);
        if ClientArquivoSITUACAO.AsInteger <> 4 then
          AtualizarSituacaoItem('0', 'N', '1', '5');
      end;
    end;
  end
  else
    if ClientArquivoSITUACAO.AsInteger = 3 then
    begin
      VerificarItemLivroFinanceiro;
      if ClientArquivoLIVRO_CAIXA_ID.IsNull and ClientArquivoLIVRO_FINANCEIRO_ID.IsNull then
        AtualizarSituacaoItem('0', 'N', '1', '5');
    end
  else BuscarModeloPlanejado(ClientArquivoDESCRICAO.AsString, ClientArquivoID.AsString);

  if vpAbrirEdicao then
    ClientArquivo.Post;

  FreeAndNil(viLista);
end;

procedure TfrmConciliacaoBancaria.VerificarSituacaoVinculo(vpSituacao : Integer);
begin
  case vpSituacao of
   2,3 : begin
           rdbVinculo.Caption := 'Vinculo Encontrado - Situação?';
           rdbVinculo.Properties.Items[0].Caption := 'Verdadeiro';
           rdbVinculo.Properties.Items[1].Caption := 'False';
         end;
   4   : begin
           rdbVinculo.Caption := 'Modelo Encontrado - Aceitar?';
           rdbVinculo.Properties.Items[0].Caption := 'Sim';
           rdbVinculo.Properties.Items[1].Caption := 'Não';
         end;
   else
    begin
      rdbVinculo.Caption := 'Realizar Lançamento?';
      rdbVinculo.Properties.Items[0].Caption := 'Sim';
      rdbVinculo.Properties.Items[1].Caption := 'Não';
    end;
  end;
end;

procedure TfrmConciliacaoBancaria.VincularItemConciliadosUnidos;
var
  viConciliacaoUnidoId : String;
begin
  ClientArquivo.First;
  viConciliacaoUnidoId := ClientArquivoID.AsString;
  While not ClientArquivo.Eof do
  begin
    AtualizaSituacaoRegistroItem(ClientArquivoID.AsString, viConciliacaoUnidoId);
    ClientArquivo.Next;
  end;
end;

procedure TfrmConciliacaoBancaria.VincularItemLancamentoAgendado;
var
  viIdAgendamento : TStringList;
begin
  ExecutaSimpleDSAux(' SELECT LF.*, LF.VALOR_AGENDADO AS VALOR_PAGO_SOMA, LA.PERIODO, LA.REFERENCIA_PERIODO, '+
                     '        LA.DOC_TIPO, B.NOSSO_NUMERO '+
                     ' FROM J_LIVRO_FINANCEIRO LF '+
                     '   LEFT OUTER JOIN J_LIVRO_AGENDAMENTO LA ON '+
                     '   LF.LIVRO_AGENDAMENTO_ID = LA.LIVRO_AGENDAMENTO_ID '+
                     '   LEFT OUTER JOIN J_BOLETO B ON '+
                     '   LF.BOLETA_ID = B.BOLETO_ID '+
                     ' WHERE LF.LIVRO_FINANCEIRO_ID IN ('+vgConciliacaoId+')',0);

  viIdAgendamento := TStringList.Create;
  while not dtmControles.SimpleAuxiliar.Eof do
  begin
    with dtmControles.SimpleAuxiliar do
    begin
      vgDadosLivroCaixa.LivroAgendamentoId := FieldByName('LIVRO_AGENDAMENTO_ID').AsInteger;
      vgDadosLivroCaixa.LivroFinanceiroID  := FieldByName('LIVRO_FINANCEIRO_ID').AsInteger;

      dtmLookupServico.sqlLivroAgendamento.Active := False;
      dtmLookupServico.sqlLivroAgendamento.DataSet.ParamByName('LIVRO_AGENDAMENTO_ID').AsBCD := vgDadosLivroCaixa.LivroAgendamentoId;
      dtmLookupServico.sqlLivroAgendamento.Active := True;
    end;

    with dtmControles.SimpleAuxiliar do
    begin
      dtmLookupServico.CarregarDadosLancamento(2, 0, dtmControles.SimpleAuxiliar);
      vgDadosLivroCaixa.ContabilContaID  := FieldByName('CONTABIL_CONTA_ID').AsInteger;
      vgDadosLivroCaixa.ContabilGrupoId  := dtmControles.GetInt(' SELECT CONTABIL_GRUPO_ID FROM J_CONTABIL_CONTA WHERE CONTABIL_CONTA_ID = '+ IntToStr(vgDadosLivroCaixa.ContabilContaID));
      vgDadosLivroCaixa.DataVencimento   := FormatDateTime('DD.MM.YYYY',ClientArquivoDATA.AsDateTime);
      vgDadosLivroCaixa.AnoMesReferencia := IntToStr(dtmLookupContabil.PegarAnoMes(ClientArquivoDATA.AsString));
      vgDadosLivroCaixa.DuplicarItem     := False;
    end;

    vgDadosLivroCaixa.ValorFaturado    := ClientArquivoVALOR.AsCurrency;
    vgDadosLivroCaixa.ValorCompromisso := ClientArquivoVALOR.AsCurrency;
    vgDadosLivroCaixa.ValorPago        := ClientArquivoVALOR.AsCurrency;
    vgDadosLivroCaixa.CaixaID          := sqlPesquisaConciliacaoCAIXA_ID.AsInteger;

    vgDadosLivroCaixa.DataPagamento    := FormatDateTime('DD.MM.YYYY',ClientArquivoDATA.AsDateTime);
    vgDadosLivroCaixa.Referencia       := IntToStr(dtmLookupContabil.PegarAnoMes(vgDadosLivroCaixa.DataPagamento));
    vgDadosLivroCaixa.DataLancamento   := FormatDateTime('DD.MM.YYYY',dtmControles.DataHoraBanco(3));
    vgDadosLivroCaixa.AnoMesRegistro   := IntToStr(dtmLookupContabil.PegarAnoMes(vgDadosLivroCaixa.DataPagamento));
    vgDadosLivroCaixa.Observacao       := ClientArquivoOBSERVACAO.AsString;
    vgDadosLivroCaixa.Ordem            := dtmControles.GerarSequencia('J_LIVRO_CAIXA_ORDEM');
    vgDadosLivroCaixa.DocumentoNumero  := ClientArquivoDOCUMENTO.AsString;
    dtmLookupContabil.RegistrarRecebimentoFinanceiro;

    dtmLookupFinanceiro.BaixarEstornar('R', '3', vgDadosLivroCaixa.LivroFinanceiroID, vgDadosLivroCaixa.LivroAgendamentoId, 0, 0);
    dtmLookupServico.VerificarAtualizacaoAgendamento;

    ExecutaSqlAuxiliar(' UPDATE J_LIVRO_FINANCEIRO SET SITUACAO = '+ QuotedStr('3')+
                       ' WHERE FECHAMENTO_ID = '+IntToStr(vgDadosLivroCaixa.LivroFinanceiroID),1);
  end;

  RegistrarConciliacao('1', '1','R', True);
  AtualizarLivroCaixa(vgDadosLivroCaixa.LivroCaixaId, ClientArquivoMODELO.AsString, ClientArquivoDESCRICAO.AsString);
  VerificarConciliacaoRealizada(ClientArquivoID.AsString, True);
end;

procedure TfrmConciliacaoBancaria.VincularItemLancamentoCaixa(vpLivroCaixaId,
  vpIdConciliacao: String);
var
  viCondicaoAlteraData : String;
begin
  viCondicaoAlteraData := '';
  if vgConciliacaoDataAlterar then
    viCondicaoAlteraData := ', DATA_PAGAMENTO = :DATA_PAGAMENTO, ANO_MES_REGISTRO = :ANO_MES_REGISTRO ';

  ExecutaSqlAuxiliar(' UPDATE J_LIVRO_CAIXA SET CONCILIACAO_REGISTRADO_ID = '+QuotedStr(vpIdConciliacao)+','+
                     '                          DATA_COMPENSACAO = :DATA_COMPENSACAO, '+
                     '                          ANO_MES_ANTERIOR = ANO_MES_REGISTRO, '+
                     '                          DATA_ANTERIOR = DATA_PAGAMENTO '+ viCondicaoAlteraData+
                     ' WHERE LIVRO_CAIXA_ID IN ('+(vpLivroCaixaId)+')', 2);
  with dtmControles.sqlAuxiliar do
  begin
    ParamByName('DATA_COMPENSACAO').AsString   := FormatDateTime('DD.MM.YYYY', ClientArquivoDATA.AsDateTime);
    if vgConciliacaoDataAlterar then
    begin
      ParamByName('DATA_PAGAMENTO').AsString   := FormatDateTime('DD.MM.YYYY', ClientArquivoDATA.AsDateTime);
      ParamByName('ANO_MES_REGISTRO').AsString := PegarAnoMes(ClientArquivoDATA.AsString);
    end;
    ExecSQL(FALSE);
  end;

  AtualizaSituacaoRegistroItem(ClientArquivoID.AsString);
  AtualizarSituacaoItem('1','R','S','1', True);
end;

end.

