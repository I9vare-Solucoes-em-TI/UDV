unit OrdemServicoSolicitar;


{ Tipo Inclusao

  0 = Inclusão de Ordem de Serviço pelos Sistemas
  1 = Inclusão de Item no Caixa com Ordem de Serviço
  2 = Alteração de Item do Caixa
  3 = Inclusão de Item no Caixa Tipo Credito ou Retirada de Valor na OS}

interface

uses
  I9Query,
  I9Connection,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.Menus, dxBarBuiltInMenu, cxPC,
  Vcl.StdCtrls, cxRadioGroup, cxButtons, Vcl.ExtCtrls, cxLabel, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit,
  DbxDevartInterBase, Data.DB, Datasnap.DBClient, SimpleDS, Data.FMTBcd,
  cxDBEdit, cxCurrencyEdit, cxImageComboBox, Data.SqlExpr, Datasnap.Provider,
  cxGroupBox, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBData, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxCalendar, dxBar, dxBarExtItems;

Type

  TCaixaDados = Record
    TipoCaixa : String;
    CaixaId, CaixaItemID : Integer;
    Data : TDate;
    ValorCalculo : Currency;
  End;

  TfrmOrdemServicoSolicitar = class(TForm)
    pnlTop: TPanel;
    lblInformacao: TcxLabel;
    pnlImagem: TPanel;
    imgTitulo: TImage;
    pnlBotoes: TPanel;
    dtsOrdemServico: TDataSource;
    sqlOrdemServico: TI9Query;
    sqlOrdemServicoORDEM_SERVICO_ID: TBCDField;
    sqlOrdemServicoDESCRICAO: TStringField;
    pgcOS: TcxPageControl;
    tbcOS: TcxTabSheet;
    sqlCaixaServicos: TI9Query;
    sqlCaixaServicosCAIXA_SERVICO_ID: TBCDField;
    sqlCaixaServicosDESCRICAO: TStringField;
    sqlCaixaServicosSITUACAO: TStringField;
    sqlCaixaServicosTIPO_TRANSACAO: TStringField;
    sqlCaixaServicosSISTEMA_ID: TBCDField;
    sqlCaixaServicosINTERNO_SISTEMA: TStringField;
    dtsCaixaServicos: TDataSource;
    ClientAncestral: TI9Query;
    dtsClientAncestral: TDataSource;
    ClientAncestralESPECIE_PAGAMENTO: TStringField;
    ClientAncestralCAIXA_ITEM_ID: TBCDField;
    ClientAncestralCAIXA_SERVICO_ID: TBCDField;
    ClientAncestralUSUARIO_SERVICO_ID: TBCDField;
    ClientAncestralUSUARIO_CAIXA_ID: TBCDField;
    ClientAncestralCHAVE_SERVICO: TBCDField;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralDATA_PAGAMENTO: TSQLTimeStampField;
    ClientAncestralSITUACAO: TStringField;
    ClientAncestralTIPO_DOCUMENTO: TStringField;
    ClientAncestralTIPO_TRANSACAO: TStringField;
    ClientAncestralVALOR_SERVICO: TBCDField;
    ClientAncestralVALOR_PAGO: TBCDField;
    ClientAncestralOBSERVACAO: TStringField;
    ClientAncestralCAIXA_CHEQUE_ID: TBCDField;
    ClientAncestralHORA_PAGAMENTO: TStringField;
    ClientAncestralCAIXA_ID: TBCDField;
    ClientAncestralRECIBO_ID: TBCDField;
    ClientAncestralTIPO_SERVICO: TStringField;
    ClientAncestralQTD: TBCDField;
    ClientAncestralAPRESENTANTE: TStringField;
    ClientAncestralMENSALISTA_ID: TBCDField;
    ClientAncestralQUITADO_CAIXA_ID: TBCDField;
    ClientAncestralREGISTRADO: TStringField;
    ClientAncestralEMOLUMENTO: TBCDField;
    ClientAncestralTAXA_JUDICIARIA: TBCDField;
    ClientAncestralFUNDESP: TBCDField;
    ClientAncestralDESCONTO: TBCDField;
    ClientAncestralVALOR_DOCUMENTO: TBCDField;
    ClientAncestralOUTRA_TAXA1: TBCDField;
    ClientAncestralCHAVE_SERVICO_SEC: TBCDField;
    ClientAncestralEMOLUMENTO_ITEM_ID: TBCDField;
    ClientAncestralCAIXA_REGISTROSELO_ID: TBCDField;
    ClientAncestralFUNDO_RI: TBCDField;
    ClientAncestralVALOR_RECIBO: TBCDField;
    ClientAncestralIMPORTADO: TStringField;
    ClientAncestralTAXA2: TBCDField;
    ClientAncestralCODIGO: TStringField;
    ClientAncestralESPECIE_PAGAMENTO2: TStringField;
    ClientAncestralVALOR_PRIMEIRO: TBCDField;
    ClientAncestralVALOR_SEGUNDO: TBCDField;
    ClientAncestralTIPO_CAIXA: TStringField;
    ClientAncestralRECIBO_NOTAS_ID: TBCDField;
    ClientAncestralMENSALISTA_GRUPO_ID: TBCDField;
    ClientAncestralQTD_PAGA: TBCDField;
    ClientAncestralCAIXA_DESTINO_ID: TBCDField;
    ClientAncestralCAIXA_FECHAMENTO_SAIDA_ID: TBCDField;
    ClientAncestralCAIXA_FECHAMENTO_ENTRADA_ID: TBCDField;
    ClientAncestralREG_FINANCEIRO: TStringField;
    ClientAncestralSERVICO_PEDIDO_ID: TBCDField;
    ClientAncestralTIPO_CARTAO_ID: TBCDField;
    ClientAncestralDEPOSITO_PREVIO: TStringField;
    ClientAncestralDEPOSITO_CONVERTIDO: TStringField;
    ClientAncestralRELATORIO: TStringField;
    ClientAncestralORDEM_SERVICO_ID: TBCDField;
    sqlCaixaServicosOS_TIPO: TStringField;
    ClientAncestralOS_TIPO: TStringField;
    sqlCaixaItens: TI9Query;
    dtsCaixaItens: TDataSource;
    sqlCaixaItenscalc_Debitos: TCurrencyField;
    sqlCaixaItenscalc_creditos: TCurrencyField;
    sqlCaixaItenscalc_Numero: TStringField;
    sqlCaixaItensCAIXA_ITEM_ID: TBCDField;
    sqlCaixaItensCAIXA_SERVICO_ID: TBCDField;
    sqlCaixaItensUSUARIO_SERVICO_ID: TBCDField;
    sqlCaixaItensUSUARIO_CAIXA_ID: TBCDField;
    sqlCaixaItensCHAVE_SERVICO: TBCDField;
    sqlCaixaItensDESCRICAO: TStringField;
    sqlCaixaItensDATA_PAGAMENTO: TSQLTimeStampField;
    sqlCaixaItensSITUACAO: TStringField;
    sqlCaixaItensTIPO_TRANSACAO: TStringField;
    sqlCaixaItensVALOR_SERVICO: TBCDField;
    sqlCaixaItensVALOR_PAGO: TBCDField;
    sqlCaixaItensOBSERVACAO: TStringField;
    sqlCaixaItensHORA_PAGAMENTO: TStringField;
    sqlCaixaItensCAIXA_ID: TBCDField;
    sqlCaixaItensRECIBO_ID: TBCDField;
    sqlCaixaItensTIPO_SERVICO: TStringField;
    sqlCaixaItensQTD: TBCDField;
    sqlCaixaItensAPRESENTANTE: TStringField;
    sqlCaixaItensMENSALISTA_ID: TBCDField;
    sqlCaixaItensREGISTRADO: TStringField;
    sqlCaixaItensTIPO_CAIXA: TStringField;
    sqlCaixaItensSISTEMA_ID: TBCDField;
    sqlCaixaItensORDEM_SERVICO_ID: TBCDField;
    sqlCaixaItensCALC_OS: TStringField;
    pnlOrdem: TPanel;
    rdbOrdemNova: TcxRadioButton;
    rdbOrdemAberta: TcxRadioButton;
    pgcOrdemServico: TcxPageControl;
    tabOrdemNova: TcxTabSheet;
    edtIdentificacao: TcxTextEdit;
    cxLabel4: TcxLabel;
    tabOrdemAberta: TcxTabSheet;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    gbxInclusao: TcxGroupBox;
    Label17: TLabel;
    lbDescricao: TLabel;
    Label4: TLabel;
    tbcPesquisa: TcxTabSheet;
    cxGroupBox3: TcxGroupBox;
    cxLabel3: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxGrid1: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBTableView4: TcxGridDBTableView;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBColumn12: TcxGridDBColumn;
    cxGridDBColumn13: TcxGridDBColumn;
    cxGridDBBandedTableView1: TcxGridDBBandedTableView;
    cxGridLevel2: TcxGridLevel;
    pnlAdicionar: TPanel;
    btnAdItem: TcxButton;
    btnCalculoRapido: TcxButton;
    btnAdNovo: TcxButton;
    btnExcluirItem: TcxButton;
    edtPesquisaOS: TcxTextEdit;
    edtPesquisaIdentificacao: TcxTextEdit;
    edtPesquisaDataIni: TcxDateEdit;
    edtPesquisaDataFin: TcxDateEdit;
    Label5: TLabel;
    icxPesquisaSituacao: TcxImageComboBox;
    btnPesquisar: TcxButton;
    btnLimpar: TcxButton;
    ClientAncestralOS_TRANSACAO: TStringField;
    sqlPesquisaOS: TI9Query;
    dtsPesquisaOS: TDataSource;
    sqlPesquisaOSORDEM_SERVICO_ID: TBCDField;
    sqlPesquisaOSDESCRICAO: TStringField;
    sqlPesquisaOSSITUACAO: TStringField;
    sqlPesquisaOSDATA: TSQLTimeStampField;
    sqlPesquisaOSDATA_FECHAMENTO: TSQLTimeStampField;
    sqlPesquisaOSUSUARIO_ID: TBCDField;
    sqlPesquisaOSOBSERVACAO: TStringField;
    cxGridDBTableView3Column1: TcxGridDBColumn;
    sqlPesquisaOSCALC_OS: TStringField;
    pnlFechar: TPanel;
    cxBtnFechar: TcxButton;
    pnlConfirmar: TPanel;
    btnCancelar: TcxButton;
    pnlNovaOS: TPanel;
    btnNovaOrdem: TcxButton;
    btnConfirmar: TcxButton;
    btnCancelarItem: TcxButton;
    Label3: TLabel;
    Label1: TLabel;
    lbxServico: TcxDBLookupComboBox;
    IbxTransacao: TcxDBImageComboBox;
    icxTipoRegistro: TcxDBImageComboBox;
    cxGroupBox1: TcxGroupBox;
    Label7: TLabel;
    Label2: TLabel;
    edtValorPago: TcxDBCurrencyEdit;
    icxOSTipo: TcxDBImageComboBox;
    edtDescricao: TcxDBTextEdit;
    edtObservacao: TcxDBTextEdit;
    sqlCaixaItensOS_TIPO: TStringField;
    sqlServicosSequenciais: TI9Query;
    sqlServicosSequenciaisCAIXA_SERVICO_SEQUENCIAL_ID: TBCDField;
    sqlServicosSequenciaisNATUREZA_TITULO_ID: TBCDField;
    sqlServicosSequenciaisEMOLUMENTO_ID: TBCDField;
    sqlServicosSequenciaisQUANTIDADE: TBCDField;
    sqlServicosSequenciaisCAIXA_SERVICO_ID: TBCDField;
    sqlServicosSequenciaisPADRAO_SELECAO: TStringField;
    dtsServicoSequencial: TDataSource;
    sqlCaixaServicosTIPO_VALOR: TStringField;
    sqlServicosSequenciaisCALC_SELECIONADO: TStringField;
    sqlServicosSequenciaisCALC_VALOR: TCurrencyField;
    sqlServicosSequenciaisCALC_QTD: TCurrencyField;
    sqlG_Emolumento: TI9Query;
    sqlG_EmolumentoEMOLUMENTO_ID: TBCDField;
    sqlG_EmolumentoDESCRICAO: TStringField;
    sqlG_EmolumentoTIPO: TStringField;
    dtsG_Emolumento: TDataSource;
    sqlServicosSequenciaisDESCRICAO: TStringField;
    sqlNaturezaTitulo: TI9Query;
    sqlNaturezaTituloNATUREZA_TITULO_ID: TBCDField;
    sqlNaturezaTituloDESCRICAO: TStringField;
    sqlNaturezaTituloEMOLUMENTO_ID: TBCDField;
    dtsNaturezaTitulo: TDataSource;
    ClientItensSequencia: TClientDataSet;
    dtsItensSequencia: TDataSource;
    ClientItensSequenciaNATUREZA_TITULO_ID: TBCDField;
    ClientItensSequenciaEMOLUMENTO_ID: TBCDField;
    ClientItensSequenciaQUANTIDADE: TBCDField;
    ClientItensSequenciaPADRAO_SELECAO: TStringField;
    ClientItensSequenciaCAIXA_SERVICO_ID: TBCDField;
    ClientItensSequenciaCALC_VALOR: TCurrencyField;
    ClientItensSequenciaCALC_SELECIONADO: TStringField;
    ClientItensSequenciaCALC_QTD: TCurrencyField;
    ClientItensSequenciaDESCRICAO: TStringField;
    sqlCaixaItensSERVICO_RETORNO_ENTRADA: TBCDField;
    sqlCaixaItensSERVICO_RETONO_SAIDA: TBCDField;
    sqlCaixaItensCALC_RETORNO: TStringField;
    sqlCaixaItensSERVICO_CONFIRMADO: TBCDField;
    pgcItensOS: TcxPageControl;
    tbcItensOs: TcxTabSheet;
    pnlMostrarSaldo: TPanel;
    cxGroupBox4: TcxGroupBox;
    edtSaldoOS: TcxCurrencyEdit;
    cxGroupBox5: TcxGroupBox;
    edtSaldoRegistro: TcxCurrencyEdit;
    cxGroupBox6: TcxGroupBox;
    edtSaldoNotas: TcxCurrencyEdit;
    cxGroupBox7: TcxGroupBox;
    Label6: TLabel;
    Label8: TLabel;
    edtSaldoAguardandoC: TcxCurrencyEdit;
    edtSaldoAguardandoD: TcxCurrencyEdit;
    cxGroupBox8: TcxGroupBox;
    edtSaldoOutros: TcxCurrencyEdit;
    grdOS: TcxGrid;
    cxGridDBTableItensOS: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBTableItensOSColumn5: TcxGridDBColumn;
    cxGridDBTableItensOSColumn1: TcxGridDBColumn;
    cxGridDBColumn14: TcxGridDBColumn;
    cxGridDBTableValorItem: TcxGridDBColumn;
    cxGridDBTableDebito: TcxGridDBColumn;
    cxGridDBTableCredito: TcxGridDBColumn;
    cxGridDBTableItensOSColumn6: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBTableItensOSColumn2: TcxGridDBColumn;
    cxGridDBColumn19: TcxGridDBColumn;
    cxGridDBTableObservacao: TcxGridDBColumn;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn24: TcxGridDBColumn;
    cxGridDBColumn25: TcxGridDBColumn;
    cxGridDBColumn26: TcxGridDBColumn;
    grdOSDBBandedTableView1: TcxGridDBBandedTableView;
    cxGridLevel1: TcxGridLevel;
    tbcItensOSSelecionar: TcxTabSheet;
    Panel1: TPanel;
    lblNome: TcxLabel;
    edtValorDocumento: TcxCurrencyEdit;
    btnCalcular: TcxButton;
    cxGroupBox2: TcxGroupBox;
    lcxNaturezaTitulo: TcxLookupComboBox;
    lblNaturezaTitulo: TcxLabel;
    btnAdicionarItem: TcxButton;
    cxGrid2: TcxGrid;
    cxGridDBTableView5: TcxGridDBTableView;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBTableView1Column3: TcxGridDBColumn;
    cxGridDBTableView5Column1: TcxGridDBColumn;
    cxGridDBTableView1Column4: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    btnExcluirOS: TcxButton;
    sqlOrdemServicoSITUACAO: TStringField;
    grdOSLevel1: TcxGridLevel;
    dtsItensVinculados: TDataSource;
    sqlItensVinculados: TI9Query;
    sqlItensVinculadosORDEM_ITEM_SEQUENCIA_ID: TBCDField;
    sqlItensVinculadosCAIXA_ITEM_ID: TBCDField;
    sqlItensVinculadosNATUREZA_TITULO_ID: TBCDField;
    sqlItensVinculadosQUANTIDADE: TBCDField;
    sqlItensVinculadosCAIXA_SERVICO_ID: TBCDField;
    sqlItensVinculadosVALOR: TBCDField;
    sqlItensVinculadosEMOLUMENTO_ID: TBCDField;
    sqlItensVinculadosORDEM_SERVICO_ID: TBCDField;
    grdOSDBTableView1: TcxGridDBTableView;
    grdOSDBTableView1Column1: TcxGridDBColumn;
    grdOSDBTableView1Column2: TcxGridDBColumn;
    grdOSDBTableView1Column3: TcxGridDBColumn;
    tbcServicosRetorno: TcxTabSheet;
    Panel2: TPanel;
    cxGrid3: TcxGrid;
    cxGridDBTableView6: TcxGridDBTableView;
    cxGridDBColumn15: TcxGridDBColumn;
    cxGridDBColumn17: TcxGridDBColumn;
    cxGridDBColumn18: TcxGridDBColumn;
    cxGridDBValor: TcxGridDBColumn;
    cxGridDBColumn27: TcxGridDBColumn;
    cxGridDBColumn29: TcxGridDBColumn;
    cxGridDBColumn30: TcxGridDBColumn;
    cxGridDBTableView7: TcxGridDBTableView;
    cxGridDBColumn31: TcxGridDBColumn;
    cxGridDBColumn32: TcxGridDBColumn;
    cxGridDBColumn33: TcxGridDBColumn;
    cxGridDBBandedTableView2: TcxGridDBBandedTableView;
    cxGridDBTableView8: TcxGridDBTableView;
    cxGridDBColumn34: TcxGridDBColumn;
    cxGridDBColumn35: TcxGridDBColumn;
    cxGridDBColumn36: TcxGridDBColumn;
    cxGridLevel4: TcxGridLevel;
    lcxServicoRetorno: TcxLookupComboBox;
    btnPesquisarRetorno: TcxButton;
    cxLabel8: TcxLabel;
    cxGridDBTableView6Column1: TcxGridDBColumn;
    sqlServicoRetorno: TI9Query;
    dtsServicoRetorno: TDataSource;
    sqlServicoRetornoCAIXA_SERVICO_ID: TBCDField;
    sqlServicoRetornoDESCRICAO: TStringField;
    sqlItensRetorno: TI9Query;
    dtsItensRetorno: TDataSource;
    sqlItensRetornoCAIXA_ITEM_ID: TBCDField;
    sqlItensRetornoCAIXA_SERVICO_ID: TBCDField;
    sqlItensRetornoUSUARIO_SERVICO_ID: TBCDField;
    sqlItensRetornoDESCRICAO: TStringField;
    sqlItensRetornoDATA_PAGAMENTO: TSQLTimeStampField;
    sqlItensRetornoSITUACAO: TStringField;
    sqlItensRetornoVALOR_SERVICO: TBCDField;
    sqlItensRetornoVALOR_PAGO: TBCDField;
    sqlItensRetornoAPRESENTANTE: TStringField;
    sqlItensRetornoORDEM_SERVICO_ID: TBCDField;
    cxGridDBTableView6Column2: TcxGridDBColumn;
    cxGridDBTableView6Column5: TcxGridDBColumn;
    sqlItensRetornoCALC_OS: TStringField;
    sqlItensRetornoCALC_SELECIONADO: TStringField;
    btnRegistrarrRetorno: TcxButton;
    sqlItensRetornoCALC_SITUACAO: TStringField;
    sqlItensRetornoQTD: TBCDField;
    cxGridDBTableView6Column3: TcxGridDBColumn;
    sqlItensRetornoCS_SERVICO_RETORNO_ID: TBCDField;
    sqlItensRetornoCAIXA_SERVICO_RETORNO_ID: TBCDField;
    sqlItensRetornoCAIXA_SERVICO_ENTRADA_ID: TBCDField;
    btnAtualiza: TcxButton;
    dxBarManager1: TdxBarManager;
    dxBarManagerRotulo: TdxBar;
    dxBarProgressDinheiro: TdxBarProgressItem;
    dxBarProgressCheque: TdxBarProgressItem;
    dxBarStatic1: TdxBarStatic;
    dxBarProgressCartao: TdxBarProgressItem;
    gbxValorServico: TcxGroupBox;
    edtValorServico: TcxCurrencyEdit;
    edtOS: TcxTextEdit;
    btnPesquisarOS: TcxButton;
    lcxIdentificacao: TcxLookupComboBox;
    cbxTipoRegistro: TcxGroupBox;
    icxTipoPagamento: TcxImageComboBox;
    sqlCaixaItensValorPagoCalc: TCurrencyField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure rdbOrdemNovaClick(Sender: TObject);
    procedure rdbOrdemAbertaClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarOSClick(Sender: TObject);
    procedure edtOSKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lcxIdentificacaoPropertiesEditValueChanged(Sender: TObject);
    procedure edtOSKeyPress(Sender: TObject; var Key: Char);
    procedure edtOSExit(Sender: TObject);
    procedure lbxServicoPropertiesEditValueChanged(Sender: TObject);
    procedure sqlCaixaItensCalcFields(DataSet: TDataSet);
    procedure btnCalculoRapidoClick(Sender: TObject);
    procedure btnAdItemClick(Sender: TObject);
    procedure pgcOSChange(Sender: TObject);
    procedure btnNovaOrdemClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure sqlPesquisaOSCalcFields(DataSet: TDataSet);
    procedure cxBtnFecharClick(Sender: TObject);
    procedure sqlPesquisaOSAfterScroll(DataSet: TDataSet);
    procedure cxGridDBTableView3DblClick(Sender: TObject);
    procedure edtPesquisaOSKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPesquisaIdentificacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure icxPesquisaSituacaoPropertiesEditValueChanged(Sender: TObject);
    procedure edtPesquisaOSKeyPress(Sender: TObject; var Key: Char);
    procedure btnAdNovoClick(Sender: TObject);
    procedure btnCancelarItemClick(Sender: TObject);
    procedure icxTipoRegistroPropertiesChange(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure sqlCaixaItensAfterScroll(DataSet: TDataSet);
    procedure btnExcluirItemClick(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
    procedure sqlServicosSequenciaisCALC_SELECIONADOChange(Sender: TField);
    procedure btnAdicionarItemClick(Sender: TObject);
    procedure cxGridDBTableItensOSCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure btnExcluirOSClick(Sender: TObject);
    procedure btnPesquisarRetornoClick(Sender: TObject);
    procedure lcxServicoRetornoPropertiesChange(Sender: TObject);
    procedure sqlItensRetornoCalcFields(DataSet: TDataSet);
    procedure sqlItensRetornoCALC_SELECIONADOChange(Sender: TField);
    procedure sqlItensRetornoAfterScroll(DataSet: TDataSet);
    procedure btnRegistrarrRetornoClick(Sender: TObject);
    procedure btnAtualizaClick(Sender: TObject);
    procedure lcxNaturezaTituloPropertiesEditValueChanged(Sender: TObject);
  private
    vlAbrindoForm, vlNaoFechar, vlSaldoAbertura, vlMontandoSequencial, vlNovaOrdem : Boolean;
    vlOsNova : String;

    procedure SelecionarItensCaixa;
    procedure SelecionarCaixaServico(Interno : Boolean);

    procedure IncluirAlterarItemCaixa;
    procedure PreencherDadosInclusao;
    procedure PreencherDadosAlteracao;
    procedure PreencherDadosAberturaCaixa;
    procedure CapturarValoresSequenciais;
    procedure CarregarItensSequencia;
    procedure HabilitarPainelNovaOS(vpHabilitar : Boolean);
    procedure CarregarOrdemServico(vpOrdemServico : String);
    procedure CarregarSaldo;
    procedure CarregarListaOSTipoSimples(vpLista : TcxImageComboBox; vpOpcao : String);
    procedure CarregarListaOSTipoDB(vpLista : TcxDBImageComboBox; vpOpcao : String);
    function VerificarTipoTransacao:String;
  public
    function CalcularValor:Currency;
  end;

var
  frmOrdemServicoSolicitar: TfrmOrdemServicoSolicitar;
  vgCaixaDados : TCaixaDados;

implementation

uses
  Controles, Rotinas, Lookup,
  Geral.Model.Entity.Spec.CalculoEmolumentos,
  Geral.View.Financeiro.CalculoRapido,
  FDControle;

{$R *.dfm}

procedure TfrmOrdemServicoSolicitar.btnAdicionarItemClick(Sender: TObject);
begin
  ClientItensSequencia.Append;
  ClientItensSequenciaNATUREZA_TITULO_ID.AsInteger := lcxNaturezaTitulo.EditValue;
  ClientItensSequenciaEMOLUMENTO_ID.AsInteger      := sqlNaturezaTituloEMOLUMENTO_ID.AsInteger;
  ClientItensSequenciaQUANTIDADE.AsInteger         := 1;
  ClientItensSequenciaPADRAO_SELECAO.AsString      := 'N';
  ClientItensSequenciaCALC_SELECIONADO.AsString    := 'S';
  ClientItensSequenciaCAIXA_SERVICO_ID.AsInteger   := sqlCaixaServicosSISTEMA_ID.AsInteger;
  ClientItensSequenciaDESCRICAO.AsString           := lcxNaturezaTitulo.Text;
  ClientItensSequencia.Post;
  btnCalcularClick(SELF);

  btnAdicionarItem.Enabled    := False;
  lcxNaturezaTitulo.EditValue := NULL;
  lcxNaturezaTitulo.SetFocus;
end;

procedure TfrmOrdemServicoSolicitar.btnAdItemClick(Sender: TObject);
var
  viQtdPalavras : Integer;

  procedure Validar;
  begin
    if gbxInclusao.Visible then
    begin
      ClientAncestralVALOR_SERVICO.AsCurrency := ClientAncestralVALOR_PAGO.AsCurrency;
      VerificarPreenchimentoLCX_DB(lbxServico.Text, 'Serviço',lbxServico);
      VerificarPreenchimentoEDT_DB(edtDescricao.Text, 'Descricao',edtDescricao);
      VerificarPreenchimentoCUR_DB(edtValorPago.EditValue, 'Valor a Registrar',edtValorPago);
      VerificarPreenchimentoICX_DB(icxTipoRegistro.Text, 'Tipo Registro', icxTipoRegistro);
    end;

    if tbcOS.TabVisible then
    begin
      pgcOS.ActivePage := tbcOS;
      if rdbOrdemNova.Checked then
      begin
        VerificarPreenchimentoEDT_TX(edtIdentificacao.Text, 'Apresentante/Descricao',edtIdentificacao);

        viQtdPalavras := Rotinas.RetornatQdtPalavras(edtIdentificacao.text);
        if viQtdPalavras < 2 then
        begin
          Application.MessageBox('Nome Inválido!!!', 'Atenção', MB_Ok + MB_ICONWARNING);
          edtIdentificacao.SetFocus;
          exit;
        end;
        vgOrdemServico.Identificacao := edtIdentificacao.EditValue;
      end
      else
      begin
        if not gbxInclusao.Visible then
        begin
          VerificarPreenchimentoLCX_TX(lcxIdentificacao.Text, 'Identificação da OS', lcxIdentificacao);
          VerificarPreenchimentoICX_TX(icxTipoPagamento.Text, 'Tipo de Pagamento', icxTipoPagamento);
          vgOrdemServico.Ordem := lcxIdentificacao.EditValue;
        end;
      end;
    end;
  end;

  procedure GravarItensOrdemSequencia(vpCaixaItemId : String);
  var
    viSql : String;
  begin
    if not tbcItensOSSelecionar.TabVisible then
      exit;

    ClientItensSequencia.DisableControls;
    ClientItensSequencia.First;
    while not ClientItensSequencia.Eof do
    begin
      if ClientItensSequenciaCALC_SELECIONADO.AsString = 'S' then
      begin
        viSql := 'INSERT INTO C_ORDEM_ITEM_SEQUENCIA (ORDEM_ITEM_SEQUENCIA_ID, CAIXA_ITEM_ID, ORDEM_SERVICO_ID, NATUREZA_TITULO_ID, QUANTIDADE, CAIXA_SERVICO_ID, VALOR, EMOLUMENTO_ID) ' +
               'VALUES ( ' + dtmControles.GerarSequencia('C_ORDEM_ITEM_SEQUENCIA') + ',' +
                             vpCaixaItemId+','+
                             sqlOrdemServicoORDEM_SERVICO_ID.AsString+','+
                             ClientItensSequenciaNATUREZA_TITULO_ID.AsString+','+
                             ClientItensSequenciaQUANTIDADE.AsString+','+
                             ClientItensSequenciaCAIXA_SERVICO_ID.AsString+','+
                             TrocaVirgPPto(ClientItensSequenciaCALC_VALOR.AsString) + ',' +
                             ClientItensSequenciaEMOLUMENTO_ID.AsString+ ')';
        dtmControles.ExecSQL(viSql);
      end;
      ClientItensSequencia.Next
    end;
    ClientItensSequencia.EnableControls;
  end;

begin
  Validar;

  begin
  if gbxInclusao.Visible then
    if vgCaixaDados.CaixaItemID = 0 then
    begin
      ClientAncestralCAIXA_ITEM_ID.AsInteger  := dtmControles.GerarSequencia('C_CAIXA_ITEM');
      ClientAncestralVALOR_SERVICO.AsCurrency := ClientAncestralVALOR_PAGO.AsCurrency;

      if pgcOrdemServico.ActivePageIndex = 0 then
           ClientAncestralAPRESENTANTE.AsString := edtIdentificacao.Text
      else ClientAncestralAPRESENTANTE.AsString := lcxIdentificacao.Text;
    end;

    if tbcOS.TabVisible then
    begin
      GravarOrdemServico;
      ClientAncestralORDEM_SERVICO_ID.AsInteger := vgOrdemServico.Ordem;
    end;
    ClientAncestralOS_TRANSACAO.AsString := VerificarTipoTransacao;
    ClientAncestral.ApplyUpdates(-1);
  end;
  GravarItensOrdemSequencia(ClientAncestralCAIXA_ITEM_ID.AsString);

  sqlCaixaItens.Refresh;
  sqlItensVinculados.Refresh;

  vgCaixaDados.ValorCalculo := 0;
  lbxServico.Clear;
  edtDescricao.Clear;
  edtValorPago.Clear;
  btnCancelarItemClick(self);
  CarregarSaldo;
  ClientAncestral.First;
  btnAdNovo.SetFocus;
end;

procedure TfrmOrdemServicoSolicitar.btnAdNovoClick(Sender: TObject);
begin
  gbxInclusao.Visible     := True;
  btnAdNovo.Enabled       := False;
  btnCancelarItem.Enabled := True;
  btnAdItem.Enabled       := True;
  btnExcluirItem.Enabled  := False;
  cxBtnFechar.Enabled     := False;
  btnNovaOrdem.Enabled    := False;
  btnAtualiza.Enabled     := False;
  vgCaixaDados.TipoCaixa  := '2';

  if vgCaixaDados.ValorCalculo > 0 then
    edtValorDocumento.EditValue := vgCaixaDados.ValorCalculo;

  IncluirAlterarItemCaixa;
  lbxServico.SetFocus;
end;

procedure TfrmOrdemServicoSolicitar.btnAtualizaClick(Sender: TObject);
begin
  if sqlCaixaItens.Active then
    sqlCaixaItens.Refresh;
  CarregarSaldo;
end;

procedure TfrmOrdemServicoSolicitar.btnCalculoRapidoClick(Sender: TObject);
begin
  vgDadosCalculo.SelecaoAutomatica := True;
  ExibirFormulario(tfrmCalculoRapido, frmCalculoRapido, True);
  if vgDadosCalculo.SelecaoConfirmada then
  begin
    ClientAncestralDESCRICAO.AsString    := vgDadosCalculo.Descricao;
    ClientAncestralVALOR_PAGO.AsCurrency := vgDadosCalculo.ValorTotal;
  end;
  vgDadosCalculo.SelecaoAutomatica := False;
  vgDadosCalculo.SelecaoConfirmada := False;
end;

procedure TfrmOrdemServicoSolicitar.btnCancelarClick(Sender: TObject);
begin
  vlNovaOrdem := False;
  if vgOrdemServico.TipoInclusao <> 0 then
  begin
    pnlConfirmar.Visible           := False;
    pnlNovaOS.Visible              := True;
    tbcPesquisa.TabVisible         := True;
    tbcServicosRetorno.TabVisible  := True;
    gbxInclusao.Enabled            := True;
    pnlAdicionar.Enabled           := True;
    dxBarManagerRotulo.Visible     := pgcOS.ActivePage = tbcOS;

    pgcOS.ActivePageIndex  := 0;
    pgcOSChange(self);
  end
  else
  begin
    vlNaoFechar := False;
    vgOrdemServico.Flag := False;
    Close;
  end;
end;

procedure TfrmOrdemServicoSolicitar.btnCancelarItemClick(Sender: TObject);
begin
  gbxInclusao.Visible     := False;
  btnAdNovo.Enabled       := True;
  btnCancelarItem.Enabled := False;
  btnAdItem.Enabled       := False;
  cxBtnFechar.Enabled     := True;
  btnNovaOrdem.Enabled    := True;
  btnAtualiza.Enabled     := True;

  tbcItensOSSelecionar.TabVisible := False;
  tbcItensOs.TabVisible           := True;
  pgcItensOS.ActivePageIndex      := 0;
end;

procedure TfrmOrdemServicoSolicitar.btnConfirmarClick(Sender: TObject);
var
  viQtdPalavras : Integer;

  procedure Validar;
  begin
    if gbxInclusao.Visible then
    begin
      ClientAncestralVALOR_SERVICO.AsCurrency := ClientAncestralVALOR_PAGO.AsCurrency;
      VerificarPreenchimentoLCX_DB(lbxServico.Text, 'Serviço',lbxServico);
      VerificarPreenchimentoEDT_DB(edtDescricao.Text, 'Descricao',edtDescricao);
      VerificarPreenchimentoCUR_DB(edtValorPago.EditValue, 'Valor a Registrar',edtValorPago);
    end;

    if tbcOS.TabVisible then
    begin
      pgcOS.ActivePage := tbcOS;
      if rdbOrdemNova.Checked then
      begin
        VerificarPreenchimentoEDT_TX(edtIdentificacao.Text, 'Apresentante/Descricao',edtIdentificacao);

        viQtdPalavras := Rotinas.RetornatQdtPalavras(edtIdentificacao.text);
        if viQtdPalavras < 2 then
        begin
          Application.MessageBox('Nome Inválido!!!', 'Atenção', MB_Ok + MB_ICONWARNING);
          edtIdentificacao.SetFocus;
          Abort;
        end;
        vgOrdemServico.Identificacao := edtIdentificacao.EditValue;
        vgOrdemServico.OSTipo        := '1';
        vgOrdemServico.TransacaoOS   := vgOrdemServico.TransacaoItem;
      end
      else
      begin
        VerificarPreenchimentoLCX_TX(lcxIdentificacao.Text, 'Identificação da OS', lcxIdentificacao);
        if cbxTipoRegistro.Visible then
        begin
          VerificarPreenchimentoICX_TX(icxTipoPagamento.Text, 'Tipo do Registro', icxTipoPagamento);
          vgOrdemServico.OSTipo := icxTipoPagamento.EditValue;
        end
        else vgOrdemServico.OSTipo := icxTipoPagamento.EditValue;

        vgOrdemServico.Ordem  := lcxIdentificacao.EditValue;
        VerificarTipoTransacao;
      end;
    end;
  end;

begin
  if btnAdItem.Visible then
    Close;

  vlNaoFechar := True;
  Validar;

  if vgOrdemServico.TipoInclusao = 3 then
  begin
    vlNovaOrdem := False;
    GravarOrdemServico;
    vlOsNova := IntToStr(vgOrdemServico.Ordem);
    sqlOrdemServico.Refresh;
    pnlConfirmar.Visible          := False;
    pnlNovaOS.Visible             := True;
    tbcPesquisa.TabVisible        := True;
    tbcServicosRetorno.TabVisible := True;
    gbxInclusao.Enabled           := True;
    pnlAdicionar.Enabled          := True;
    dxBarManagerRotulo.Visible    := pgcOS.ActivePage = tbcOS;
    sqlPesquisaOS.Refresh;
    pgcOSChange(self);
    vlOsNova := '';
    btnAdNovo.SetFocus;
  end
  else
  begin
    vlNaoFechar := False;
    vgOrdemServico.Flag := True;
    Close;
  end;
end;

procedure TfrmOrdemServicoSolicitar.btnExcluirItemClick(Sender: TObject);
begin
  if Application.MessageBox(Pchar('Estornar Item selecionado?'), 'Pergunta',
       mb_IconQuestion + mb_YesNo) = idNo then
    exit;

  ExecutaSqlAuxiliar(' UPDATE C_CAIXA_ITEM SET SITUACAO = '+QuotedStr('5')+','+
                     '         CAIXA_SERVICO_RETORNO_ID = NULL '+
                     ' WHERE CAIXA_ITEM_ID = '+sqlCaixaItensCAIXA_ITEM_ID.AsString,1);

  ExecutaSqlAuxiliar(' UPDATE C_CAIXA_ITEM SET CAIXA_SERVICO_ENTRADA_ID = NULL '+
                     ' WHERE CAIXA_SERVICO_ENTRADA_ID = '+sqlCaixaItensCAIXA_ITEM_ID.AsString,1);

  sqlCaixaItens.Refresh;
  CarregarSaldo;

//  ExecutaSqlAuxiliar(' DELETE FROM C_ORDEM_ITEM_SEQUENCIA '+
//                     ' WHERE CAIXA_ITEM_ID = '+sqlCaixaItensCAIXA_ITEM_ID.AsString,1);

//  ExecutaSqlAuxiliar(' DELETE FROM C_CAIXA_ITEM '+
//                     ' WHERE CAIXA_ITEM_ID = '+sqlCaixaItensCAIXA_ITEM_ID.AsString,1);
end;

procedure TfrmOrdemServicoSolicitar.btnExcluirOSClick(Sender: TObject);
var
  viQtdConfirmados : Integer;
  viSql : String;
begin
  if Application.MessageBox(Pchar('Excluir OS Selecionada?'), 'Pergunta',
       mb_IconQuestion + mb_YesNo) = idNo then
    exit;

  // Verifica se na OS tem itens ja confirmados.
  viSql := ' SELECT COUNT(CAIXA_ITEM_ID) '+
           ' FROM C_CAIXA_ITEM '+
           ' WHERE ORDEM_SERVICO_ID = '+ sqlPesquisaOSORDEM_SERVICO_ID.AsString +
           '   AND SITUACAO <> ''3''';
  viQtdConfirmados := dtmControles.GetInt(viSql);
  if viQtdConfirmados > 0 then
  begin
    Application.MessageBox('OS não pode ser Excluída!!!', 'Atenção', MB_Ok + MB_ICONWARNING);
    exit;
  end;

//  ExecutaSqlAuxiliar(' DELETE FROM C_CAIXA_ITEM WHERE ORDEM_SERVICO_ID = '+sqlPesquisaOSORDEM_SERVICO_ID.AsString,1);
//  ExecutaSqlAuxiliar(' DELETE FROM C_ORDEM_ITEM_SEQUENCIA WHERE ORDEM_SERVICO_ID = '+sqlPesquisaOSORDEM_SERVICO_ID.AsString,1);
  ExecutaSqlAuxiliar(' UPDATE C_ORDEM_SERVICO SET SITUACAO = ''C'' WHERE ORDEM_SERVICO_ID = '+sqlPesquisaOSORDEM_SERVICO_ID.AsString,1);

  sqlPesquisaOS.Refresh;
end;

procedure TfrmOrdemServicoSolicitar.btnLimparClick(Sender: TObject);
begin
  edtPesquisaOS.Clear;
  edtPesquisaIdentificacao.Clear;
  edtPesquisaDataIni.Clear;
  edtPesquisaDataFin.Clear;
  icxPesquisaSituacao.EditValue := null;
  btnPesquisarClick(self);
end;

procedure TfrmOrdemServicoSolicitar.btnNovaOrdemClick(Sender: TObject);
begin
  vlNovaOrdem := True;
  HabilitarPainelNovaOS(True);
  rdbOrdemNovaClick(self);
end;

procedure TfrmOrdemServicoSolicitar.btnPesquisarClick(Sender: TObject);
var
  viSql, viCondicao, viData : String;

  procedure CarregarCondicao;
  begin
    viCondicao := '';

    if edtPesquisaOS.Text <> '' then
      viCondicao := '  AND ORDEM_SERVICO_ID = '+edtPesquisaOS.EditValue;

    if edtPesquisaIdentificacao.Text <> '' then
      viCondicao := viCondicao + ' AND DESCRICAO LIKE '+QuotedStr('%'+edtPesquisaIdentificacao.Text+'%');

    if (edtPesquisaDataIni.EditValue <> null) and (edtPesquisaDataFin.EditValue <> null) then
      viCondicao := viCondicao + ' AND DATA '+ Controles.MontarSqlData(StrToDate(edtPesquisaDataIni.Text),StrToDate(edtPesquisaDataFin.Text));

    if icxPesquisaSituacao.Text <> '' then
      viCondicao := viCondicao + '  AND SITUACAO = '+QuotedStr(icxPesquisaSituacao.EditValue);

  end;

begin
  viSql := ' SELECT * FROM C_ORDEM_SERVICO '+
           ' WHERE NOT ORDEM_SERVICO_ID IS NULL ';

  CarregarCondicao;
  if viCondicao = '' then
  begin
    viData := dtmControles.DataHoraBanco(4);
    viCondicao := ' AND (DATA '+ Controles.MontarSqlData(StrToDate(viData),StrToDate(viData)) +
                  ' AND SITUACAO = '+QuotedStr('A')+')';
  end;

  viSql := viSql + viCondicao +
           ' ORDER BY ORDEM_SERVICO_ID ';

  sqlPesquisaOS.Active := False;
  sqlPesquisaOS.SQL.Text := viSql;
  sqlPesquisaOS.Active := True;
end;

procedure TfrmOrdemServicoSolicitar.btnPesquisarOSClick(Sender: TObject);
begin
//  if not sqlOrdemServico.Locate('ORDEM_SERVICO_ID', StrToInt(edtOS.Text), [loCaseInsensitive]) then

  if vlNovaOrdem then
    exit;

  if (edtOS.EditValue = null) then
    edtOS.EditValue := '0';

  CarregarOrdemServico(edtOS.Text);
  if sqlOrdemServico.IsEmpty then
  begin
    Application.MessageBox('Odem de Serviço não encontrada!', 'Informação', mb_Ok + MB_ICONINFORMATION);
    lcxIdentificacao.EditValue := null;
    edtOS.SetFocus;
    edtOS.SelectAll;
    exit;
  end
  else
  begin
    lcxIdentificacao.EditValue := StrToInt(edtOS.Text);
    edtOS.Enabled              := vgOrdemServico.TipoInclusao <> 3;
    lcxIdentificacao.Enabled   := vgOrdemServico.TipoInclusao <> 3;
    vgOrdemServico.Ordem       := edtOS.EditValue;
    SelecionarItensCaixa;
    cxGridDBTableItensOS.DataController.Groups.FullExpand;
//    if tbcItemCaixa.TabVisible then
//      tbcOS.Caption := 'OS N. '+MascaraOS(vgOrdemServico.Ordem);
  end;
end;

procedure TfrmOrdemServicoSolicitar.btnPesquisarRetornoClick(Sender: TObject);
begin
  sqlItensRetorno.Active := False;
  sqlItensRetorno.ParamByName('CAIXA_SERVICO_ID').AsInteger := lcxServicoRetorno.EditValue;
  sqlItensRetorno.Active := True;

  dtmLookup.MarcarDesmarcarItensSimpleDataSet('N', sqlItensRetorno);
end;

procedure TfrmOrdemServicoSolicitar.btnRegistrarrRetornoClick(Sender: TObject);
var
  viChave, vlRecibo : string;

  {$REGION 'IncluirServicoRetorno'}
  procedure IncluirServicoRetorno;
  var
    viDescricao, viQtd, viSql : String;

    function GerarRecibo:String;
    var
      viSql : String;
    begin
      Result := dtmControles.GerarSequencia('C_RECIBO');
      viSql  := 'INSERT INTO C_RECIBO (RECIBO_ID, VALOR_RECIBO, APRESENTANTE, DATA, SITUACAO, USUARIO_ID, RECEBIDO, TROCO) ' +
             'VALUES (' + Result + ',' +
                        TrocaVirgPPto(sqlItensRetornoVALOR_PAGO.AsString) + ', '+
                        QuotedStr(sqlItensRetornoDESCRICAO.AsString)+', '+
                        QuotedStr(dtmControles.DataHoraBanco(1))+ ', '+
                        QuotedStr('D')+', '+
                        vgUsuarioID + ', '+
                        TrocaVirgPPto(sqlItensRetornoVALOR_PAGO.AsString) + ', '+
                        TrocaVirgPPto('0')+')';
      dtmControles.ExecSQL(viSql);
    end;
  begin
    viChave     := dtmControles.GerarSequencia('C_CAIXA_ITEM');
    viDescricao := 'Pagamento do '+lcxServicoRetorno.Text;
    viQtd       := sqlItensRetornoQTD.AsString;
    vlRecibo    := GerarRecibo;

    viSql :=
      'INSERT INTO C_CAIXA_ITEM (' +
      '  CAIXA_ITEM_ID, ' +
      '  CAIXA_SERVICO_ID, ' +
      '  USUARIO_SERVICO_ID, ' +
      '  DESCRICAO, ' +
      '  DATA_PAGAMENTO, ' +
      '  HORA_PAGAMENTO, ' +
      '  SITUACAO, ' +
      '  CAIXA_ID, ' +
      '  TIPO_TRANSACAO, ' +
      '  VALOR_SERVICO,' +
      '  APRESENTANTE,' +
      '  QTD,' +
      '  REGISTRADO,' +
      '  VALOR_PAGO,'+
      '  OS_TIPO,'+
      '  OS_TRANSACAO,'+
      '  RECIBO_ID,'+
      '  CAIXA_SERVICO_RETORNO_ID,'+
      '  ORDEM_SERVICO_ID) ' +
      'VALUES (' +
         viChave + ', ' +
         sqlItensRetornoCS_SERVICO_RETORNO_ID.AsString + ', ' +
         RetNull(vgUsuarioID) + ', ' +
         QuotedStr(viDescricao) + ', ' +
         QuotedStr(dtmControles.DataHoraBanco(1)) + ', ' +
         QuotedStr(dtmControles.DataHoraBanco(2)) + ', ' +
         QuotedStr('4') + ', ' +
         RetNull('') + ', ' +
         QuotedStr('D') + ', ' +
         QuotedStr(TrocaVirgPPto(sqlItensRetornoVALOR_PAGO.AsString)) + ', ' +
         QuotedStr(sqlItensRetornoAPRESENTANTE.AsString) + ', ' +
         sqlItensRetornoQTD.AsString + ', ' +
         QuotedStr('3') + ', ' +
         QuotedStr(TrocaVirgPPto(sqlItensRetornoVALOR_PAGO.AsString)) + ', '+
         QuotedStr('3') + ', ' +
         QuotedStr('D') + ', ' +
         vlRecibo  + ', ' +
         sqlItensRetornoCAIXA_ITEM_ID.AsString+', '+
         sqlItensRetornoORDEM_SERVICO_ID.AsString + ')';
    dtmControles.ExecSQL(viSql);
  end;
  {$ENDREGION}


  {$REGION 'IncluirServicoRetorno'}
  procedure AtualizarRegistroRetorno;
  begin
    ExecutaSqlAuxiliar(' UPDATE C_CAIXA_ITEM SET CAIXA_SERVICO_ENTRADA_ID = '+viChave+
                       ' WHERE CAIXA_ITEM_ID = '+ sqlItensRetornoCAIXA_ITEM_ID.AsString,1);
  end;
  {$ENDREGION}

  {$REGION 'RegistrarPagamentoOS'}
  procedure RegistrarPagamentoOS;
  begin
    ExecutaSqlAuxiliar(' INSERT INTO C_CAIXA_REGISTRO( ' +
            '              CAIXA_REGISTRO_ID, '+
            '              ORDEM_SERVICO_ID, ' +
            '              ESPECIE, ' +
            '              TIPO_CARTAO_ID, ' +
            '              TAXA_CARTAO, ' +
            '              VALOR_ESPECIE, ' +
            '              TAXA_VALOR, ' +
            '              VALOR_SOMA, ' +
            '              PARCELA_QTD, ' +
            '              PARCELA_VALOR, ' +
            '              TIPO, ' +
            '              SITUACAO, ' +
            '              OPERACAO, ' +
            '              DATA, ' +
            '              RECIBO_ID, ' +
            '              CAIXA_ID) '+
            ' VALUES(      :CAIXA_REGISTRO_ID, ' +
            '              :ORDEM_SERVICO_ID, ' +
            '              :ESPECIE, ' +
            RetNullInteger(0) +','+
            '              :TAXA_CARTAO, ' +
            '              :VALOR_ESPECIE, ' +
            '              :TAXA_VALOR, ' +
            '              :VALOR_SOMA, ' +
            '              :PARCELA_QTD, ' +
            '              :PARCELA_VALOR, ' +
            '              :TIPO, ' +
            '              :SITUACAO, ' +
            '              :OPERACAO, ' +
            QuotedStr(dtmControles.DataHoraBanco(1))+',' +
            '              :RECIBO_ID, ' +
            '              :CAIXA_ID)', 2);
    with dtmControles.sqlAuxiliar do
    begin
      ParamByName('CAIXA_REGISTRO_ID').AsBCD     := dtmControles.GerarSequencia('C_CAIXA_REGISTRO');
      ParamByName('ORDEM_SERVICO_ID').AsInteger  := sqlItensRetornoORDEM_SERVICO_ID.AsInteger;
      ParamByName('ESPECIE').AsString            := 'D';
      ParamByName('TAXA_CARTAO').AsCurrency      := 0;
      ParamByName('VALOR_ESPECIE').AsCurrency    := sqlItensRetornoVALOR_PAGO.AsCurrency;
      ParamByName('TAXA_VALOR').AsCurrency       := 0;
      ParamByName('VALOR_SOMA').AsCurrency       := sqlItensRetornoVALOR_PAGO.AsCurrency;
      ParamByName('PARCELA_QTD').AsBCD           := 1;
      ParamByName('PARCELA_VALOR').AsCurrency    := sqlItensRetornoVALOR_PAGO.AsCurrency;
      ParamByName('CAIXA_ID').AsInteger          := StrToInt(viChave);
      ParamByName('RECIBO_ID').AsInteger         := StrToInt(vlRecibo);
      ParamByName('TIPO').AsInteger              := 0;
      ParamByName('SITUACAO').AsString           := 'F';
      ParamByName('OPERACAO').AsString           := 'D';
      ExecSQL;
    end;
  {$ENDREGION}
end;

begin
  sqlItensRetorno.Filtered := False;
  sqlItensRetorno.Filter   := 'CALC_SELECIONADO = ''S''';
  sqlItensRetorno.Filtered := True;

  sqlItensRetorno.First;
  sqlItensRetorno.DisableControls;
  while not sqlItensRetorno.Eof do
  begin
    IncluirServicoRetorno;
    RegistrarPagamentoOS;
    AtualizarRegistroRetorno;
    sqlItensRetorno.Next;
  end;
  sqlItensRetorno.Filtered := False;
  sqlItensRetorno.First;
  sqlItensRetorno.EnableControls;
  sqlItensRetorno.Refresh;
end;

function TfrmOrdemServicoSolicitar.CalcularValor: Currency;
{$REGION 'Variáveis'}
var
  viValorEmolumento: Currency;
  viValorTaxaJudiciaria: Currency;
  viValorFundos: Currency;
  viValorISSQN: Currency;
  viValorTotal: Currency;
  vlPeriodo_Padrao : Integer;
{$ENDREGION}
begin
{  if sqlCaixaServicosSISTEMA_ID.AsInteger = 1 then
  begin
    viValorEmolumento     := ZeroValue;
    viValorTaxaJudiciaria := ZeroValue;
    viValorFundos         := ZeroValue;
    viValorISSQN          := ZeroValue;
    viValorTotal          := ZeroValue;
    FFundosCalculados.DataSet.EmptyDataSet;

    CalculoEmolumentos
    .Calcular
    .ForEach(
      procedure(
        const vpCalculoEmolumentos: TDataSet)
      begin
        viValorEmolumento := viValorEmolumento + vpCalculoEmolumentos.FieldByName(
          'VALOR_EMOLUMENTO').AsCurrency;

        viValorTaxaJudiciaria :=  viValorTaxaJudiciaria +
          vpCalculoEmolumentos.FieldByName(
            'VALOR_TAXA_JUDICIARIA').AsCurrency;

        viValorFundos := viValorFundos + vpCalculoEmolumentos.FieldByName(
          'VALOR_FUNDOS').AsCurrency;

        viValorISSQN := viValorISSQN + vpCalculoEmolumentos.FieldByName(
          'VALOR_ISSQN').AsCurrency;

        viValorTotal := viValorTotal + vpCalculoEmolumentos.FieldByName(
          'VALOR_TOTAL').AsCurrency;

        FFundosCalculados.Edit
        .ExecuteAction(
          procedure(
            const vpFundosCalculados: TFDMemTable)
          {$REGION 'Variáveis'}
 {         var
            viField: TField;
          {$ENDREGION}
{          begin
            for viField in vpFundosCalculados.Fields do
              viField.AsCurrency := viField.AsCurrency +
                vpCalculoEmolumentos.FieldByName(
                  viField.FieldName).AsCurrency;
          end)
        .Post;
      end);

    edtValorEmolumento.EditValue := viValorEmolumento;
    edtValortaxaJud.EditValue := viValorTaxaJudiciaria;
    edtValorFundos.EditValue := viValorFundos;
    edtValorOutraTaxa1.EditValue := viValorISSQN;
    edtValorTotalItem.EditValue := viValorTotal;
    btnAdItem.SetFocus;
    Exit;
  end;

  vgValoresCobranca.TipoCobranca    := 2;
  vgValoresCobranca.ItemComplementar:= null;
  vgValoresCobranca.ItemManual      := 'N';
  vgValoresCobranca.ItemPadrao      := 'N';
  vgValoresCobranca.Desconto        := 0;

  vlPeriodo_Padrao                  := EmolumentoPeriodoID;
  vgValoresCobranca.CobrarFundos    := vlCalculaFundos;
  vgValoresCobranca.CobrarOutraTaxa := UsarOutraTaxa;

  vgValoresCobranca.vlValorDocumentoUnico := False;
  if edtQtdImovel.EditValue > 1 then
  begin
    vgValoresCobranca.QtdIMovel             := edtQtdImovel.EditValue;
    vgValoresCobranca.vlValorDocumentoUnico := True;
  end
  else vgValoresCobranca.QtdIMovel := 1;

  Geral.Controller.Impl.CalculoEmolumentos
  .CalculoEmolumentosEscritura(edtValorDocumento.Value,
    vlPeriodo_Padrao,lcxTabelaCalculo.EditValue,
    vgValoresCobranca.QtdIMovel,False,'N',0,0,0);

  edtValortaxaJud.EditValue    := vgValoresCobranca.TaxaJud;
  edtValorOutraTaxa1.EditValue := vgValoresCobranca.OutraTaxa;
  edtValorFundos.EditValue     := vgValoresCobranca.Fundos + vgValoresCobranca.Taxa2;

  if vgUF.Equals('PA') then
  begin
    edtValorEmolumento.EditValue := vgValoresCobranca.Emolumento - vgValoresCobranca.Fundos;
    edtValorTotalItem.EditValue  := (vgValoresCobranca.ValorTotal - vgValoresCobranca.Fundos) + edtValorOutros.Value;
  end
  else
  begin
    edtValorEmolumento.EditValue := vgValoresCobranca.Emolumento;
    edtValorTotalItem.EditValue  := vgValoresCobranca.ValorTotal + edtValorOutros.Value;
  end;

  btnAdItem.SetFocus;}
end;

procedure TfrmOrdemServicoSolicitar.CapturarValoresSequenciais;
var
  viPosicao : Integer;
begin
  viPosicao := ClientItensSequencia.RecNo;
  ClientItensSequencia.DisableControls;
  vgDadosCalculo.Descricao := '';
  vgDadosCalculo.ValorTotal     := 0;
  ClientItensSequencia.First;
  while not ClientItensSequencia.eof do
  begin
    if ClientItensSequenciaCALC_SELECIONADO.AsString = 'S' then
    begin
      if vgDadosCalculo.Descricao = '' then
           vgDadosCalculo.Descricao := ClientItensSequenciaDESCRICAO.AsString
      else vgDadosCalculo.Descricao := vgDadosCalculo.Descricao + ', '+ ClientItensSequenciaDESCRICAO.AsString;

      vgDadosCalculo.ValorTotal := vgDadosCalculo.ValorTotal + ClientItensSequenciaCALC_VALOR.AsCurrency;
    end;
    ClientItensSequencia.Next;
  end;
  ClientItensSequencia.RecNo := viPosicao;
  ClientItensSequencia.EnableControls;
  ClientAncestralVALOR_PAGO.AsCurrency := vgDadosCalculo.ValorTotal;
  ClientAncestralDESCRICAO.AsString    := vgDadosCalculo.Descricao;
end;

procedure TfrmOrdemServicoSolicitar.CarregarItensSequencia;
begin
  sqlServicosSequenciais.Active := False;
  sqlServicosSequenciais.ParamByName('CAIXA_SERVICO_ID').AsInteger := sqlCaixaServicosCAIXA_SERVICO_ID.AsInteger;
  sqlServicosSequenciais.Active := True;

  ClientItensSequencia.EmptyDataSet;
  sqlServicosSequenciais.First;
  while not sqlServicosSequenciais.Eof do
  begin
    ClientItensSequencia.Append;
    ClientItensSequenciaNATUREZA_TITULO_ID.AsInteger := sqlServicosSequenciaisNATUREZA_TITULO_ID.AsInteger;
    ClientItensSequenciaEMOLUMENTO_ID.AsInteger      := sqlServicosSequenciaisEMOLUMENTO_ID.AsInteger;
    ClientItensSequenciaQUANTIDADE.AsInteger         := sqlServicosSequenciaisQUANTIDADE.AsInteger;
    ClientItensSequenciaPADRAO_SELECAO.AsString      := sqlServicosSequenciaisPADRAO_SELECAO.AsString;
    ClientItensSequenciaCALC_SELECIONADO.AsString    := sqlServicosSequenciaisPADRAO_SELECAO.AsString;
    ClientItensSequenciaCAIXA_SERVICO_ID.AsInteger   := sqlServicosSequenciaisCAIXA_SERVICO_ID.AsInteger;
    ClientItensSequenciaDESCRICAO.AsString           := sqlServicosSequenciaisDESCRICAO.AsString;
    ClientItensSequencia.Post;
    sqlServicosSequenciais.Next;
  end;
end;

procedure TfrmOrdemServicoSolicitar.CarregarListaOSTipoDB(
  vpLista: TcxDBImageComboBox; vpOpcao: String);
begin
  vpLista.Properties.Items.Clear;

  if vpOpcao = '1' then // Somente Compensação Direta
  begin
    dtmLookup.CarregarIcxComboBoxDB('1', 'Compensação Direta', vpLista);
    if ClientAncestral.State in [dsEdit, dsInsert] then
      ClientAncestralOS_TIPO.AsString := '1';
  end
  else
    if vpOpcao = '2' then // Compensação Direta e Dedução
    begin
      dtmLookup.CarregarIcxComboBoxDB('1', 'Compensação Direta', vpLista);
      dtmLookup.CarregarIcxComboBoxDB('2', 'OS Valor de Crédito', vpLista);
      if ClientAncestral.State in [dsEdit, dsInsert] then
        ClientAncestralOS_TIPO.AsString := '2';
    end
  else
    if vpOpcao = '3' then
    begin
      dtmLookup.CarregarIcxComboBoxDB('3', 'OS Retirada/Dedução', vpLista);
      if ClientAncestral.State in [dsEdit, dsInsert] then
        ClientAncestralOS_TIPO.AsString := '3';
    end;

end;

procedure TfrmOrdemServicoSolicitar.CarregarListaOSTipoSimples(vpLista : TcxImageComboBox;
          vpOpcao : String);
begin
  vpLista.Properties.Items.Clear;

  if vpOpcao = '1' then // Somente Compensação Direta
    dtmLookup.CarregarIcxComboBox('1', 'Compensação Direta', vpLista)
  else
    if vpOpcao = '2' then // Compensação Direta e Dedução
    begin
      dtmLookup.CarregarIcxComboBox('1', 'Compensação Direta', vpLista);
      dtmLookup.CarregarIcxComboBox('2', 'OS Valor de Crédito', vpLista);
    end
  else
    if vpOpcao = '3' then
      dtmLookup.CarregarIcxComboBox('3', 'OS Retirada/Dedução', vpLista);

  vpLista.ItemIndex := 0;
end;

procedure TfrmOrdemServicoSolicitar.CarregarOrdemServico(
  vpOrdemServico: String);
var
  viOrdemServicoId : Integer;
begin
  if vpOrdemServico = '' then
       viOrdemServicoId := 0
  else viOrdemServicoId := StrToInt(vpOrdemServico);

  sqlOrdemServico.Active := False;
//  sqlOrdemServico.ParamByName('ORDEM_SERVICO_ID').AsInteger := viOrdemServicoId;
  sqlOrdemServico.Active := True;
  vgOrdemServico.Ordem := sqlOrdemServicoORDEM_SERVICO_ID.AsInteger;

  sqlItensVinculados.Active := False;
  sqlItensVinculados.ParamByName('ORDEM_SERVICO_ID').AsInteger := viOrdemServicoId;
  sqlItensVinculados.Active := True;
end;

procedure TfrmOrdemServicoSolicitar.CarregarSaldo;
begin
  CalcularSaldoOS(edtOS.Text, True, True);
  edtSaldoOS.EditValue            := vgOrdemSaldo.SaldoOSDisponivel;
  edtSaldoRegistro.EditValue      := vgOrdemSaldo.SaldoOSRI;
  edtSaldoNotas.EditValue         := vgOrdemSaldo.SaldoOSNotas;
  edtSaldoOutros.EditValue        := vgOrdemSaldo.SaldoOSGeral;
  edtSaldoOutros.EditValue        := vgOrdemSaldo.SaldoOSGeral;
  edtSaldoAguardandoC.EditValue   := vgOrdemSaldo.SaldoOSAguardandoC;
  edtSaldoAguardandoD.EditValue   := vgOrdemSaldo.SaldoOSAguardandoD;
  cxGridDBTableItensOS.DataController.Groups.FullExpand;

end;

procedure TfrmOrdemServicoSolicitar.cxBtnFecharClick(Sender: TObject);
begin
  vlNaoFechar := False;
  Close;
end;

procedure TfrmOrdemServicoSolicitar.btnCalcularClick(Sender: TObject);
begin
  vgDadosCalculo.SistemaId := sqlCaixaServicosSISTEMA_ID.AsInteger - 1;
  if edtValorDocumento.Text = '' then
    edtValorDocumento.EditValue := 0;

  ClientItensSequencia.First;
  ClientItensSequencia.DisableControls;
  vgDadosCalculo.CalculoAutomatico := True;
  vgDadosCalculo.ValorDocumento    := edtValorDocumento.EditValue;
  frmCalculoRapido := TfrmCalculoRapido.Create(nil);
  vlMontandoSequencial := True;
  while not ClientItensSequencia.Eof do
  begin
    vgDadosCalculo.TipoNaturezaId := ClientItensSequenciaNATUREZA_TITULO_ID.AsInteger;
    vgDadosCalculo.Qtd            := ClientItensSequenciaQUANTIDADE.AsInteger;
    vgDadosCalculo.Tabela         := ClientItensSequenciaEMOLUMENTO_ID.AsInteger;
    frmCalculoRapido.CalculoAutomaticoRapido;
    ClientItensSequencia.Edit;
    ClientItensSequenciaCALC_VALOR.AsCurrency := frmCalculoRapido.edtValorTotalItem.EditValue;
    ClientItensSequencia.Next;
  end;

  FreeAndNil(frmCalculoRapido);
  vlMontandoSequencial := False;
  CapturarValoresSequenciais;
  ClientItensSequencia.EnableControls;
end;

procedure TfrmOrdemServicoSolicitar.cxGridDBTableItensOSCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if (AViewInfo.RecordViewInfo.GridRecord.Values[9]) = '3' then
    ACanvas.Brush.Color := $00DADADA
  else
    if (AViewInfo.RecordViewInfo.GridRecord.Values[9]) = '5' then
      ACanvas.Font.Color := clOlive
  else
    if (AViewInfo.RecordViewInfo.GridRecord.Values[10]) = '1' then
      ACanvas.Font.Color := clBlack
  else
    if (AViewInfo.RecordViewInfo.GridRecord.Values[6]) > 0 then
      ACanvas.Font.Color := clRed
  else
    if (AViewInfo.RecordViewInfo.GridRecord.Values[7]) > 0 then
         ACanvas.Font.Color := clBlue
    else ACanvas.Brush.Color := $00DADADA;
end;

procedure TfrmOrdemServicoSolicitar.cxGridDBTableView3DblClick(Sender: TObject);
begin
  pgcOS.ActivePage := tbcOS;
end;

procedure TfrmOrdemServicoSolicitar.edtOSExit(Sender: TObject);
begin
  if edtOS.Text <> '' then
    btnPesquisarOSClick(self);
end;

procedure TfrmOrdemServicoSolicitar.edtOSKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    btnPesquisarOSClick(self);
end;

procedure TfrmOrdemServicoSolicitar.edtOSKeyPress(Sender: TObject;
  var Key: Char);
begin
  DigitaInteiro(Key);
end;

procedure TfrmOrdemServicoSolicitar.edtPesquisaIdentificacaoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
  begin
    btnPesquisar.SetFocus;
    btnPesquisarClick(self);
  end;
end;

procedure TfrmOrdemServicoSolicitar.edtPesquisaOSKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
  begin
    btnPesquisar.SetFocus;
    btnPesquisarClick(self);
  end;
end;

procedure TfrmOrdemServicoSolicitar.edtPesquisaOSKeyPress(Sender: TObject;
  var Key: Char);
begin
  DigitaInteiro(key);
end;

procedure TfrmOrdemServicoSolicitar.FormActivate(Sender: TObject);
begin
  inherited;

  tbcPesquisa.TabVisible         := (vgOrdemServico.TipoInclusao <> 0) and (vgOrdemServico.Ordem = 0);
  tbcServicosRetorno.TabVisible  := tbcPesquisa.TabVisible;
  cbxTipoRegistro.Visible        := vgOrdemServico.TipoInclusao = 0;
  if vgOrdemServico.TipoInclusao = 0 then
  begin
    frmOrdemServicoSolicitar.Height := 245;
    edtValorServico.EditValue       := vgOrdemServico.OSValor;
  end;
  tbcOS.TabVisible           := (vgCaixaDados.TipoCaixa = '2') or (vgOrdemServico.TipoInclusao = 0) or (vgOrdemServico.Ordem > 0);
  pnlAdicionar.Visible       := (vgOrdemServico.TipoInclusao <> 0) and (vgCaixaDados.TipoCaixa <> '2');
  dxBarManagerRotulo.Visible := (vgOrdemServico.TipoInclusao > 0) and (pgcOS.ActivePage = tbcOS);
  gbxValorServico.Visible    := vgOrdemServico.TipoInclusao = 0;

  if tbcPesquisa.TabVisible then
  begin
    pgcOS.ActivePage := tbcPesquisa;
    btnPesquisarClick(self);
    edtPesquisaOS.SetFocus;
  end
  else pgcOS.ActivePage := tbcOS;

  if vgOrdemServico.TipoInclusao <> 0 then
    IncluirAlterarItemCaixa;

  if (tbcOS.TabVisible and (pgcOS.ActivePage = tbcOS)) then
  begin
    if vgOrdemServico.Ordem = 0 then
    begin
      if vgOrdemServico.TipoInclusao = 0 then
      begin
        pnlNovaOS.Visible    := False;
        pnlConfirmar.Visible := True;
        cxBtnFechar.Enabled  := False;
      end;

      rdbOrdemNova.Checked := True;
      rdbOrdemNovaClick(self);
      edtIdentificacao.EditValue := vgOrdemServico.Identificacao;
    end
    else
    begin
      rdbOrdemAberta.Checked := True;
      rdbOrdemAbertaClick(self);
      edtOS.EditValue          := vgOrdemServico.Ordem;
      pgcOrdemServico.Enabled  := False;
      rdbOrdemNova.Enabled     := False;
      pnlNovaOS.Visible        := False;
      btnPesquisarOSClick(self);
    end;
  end
  else edtPesquisaOS.SetFocus;
  CarregarSaldo;
  sqlOrdemServico.Active := True;
end;

procedure TfrmOrdemServicoSolicitar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if vlNaoFechar then
    abort;

  sqlOrdemServico.Active := False;

  Action := caFree;
  frmOrdemServicoSolicitar := nil;
end;

procedure TfrmOrdemServicoSolicitar.FormCreate(Sender: TObject);
begin
  sqlOrdemServico.Connection        := dtmControles.DB;
  sqlCaixaServicos.Connection       := dtmControles.DB;
  ClientAncestral.Connection        := dtmControles.DB;
  sqlCaixaItens.Connection          := dtmControles.DB;
  sqlPesquisaOS.Connection          := dtmControles.DB;
  sqlServicosSequenciais.Connection := dtmControles.DB;
  sqlG_Emolumento.Connection        := dtmControles.DB;
  sqlNaturezaTitulo.Connection      := dtmControles.DB;
  sqlItensVinculados.Connection     := dtmControles.DB;
  sqlServicoRetorno.Connection      := dtmControles.DB;
  sqlItensRetorno.Connection        := dtmControles.DB;

  sqlServicoRetorno.Active        := True;
  sqlG_Emolumento.Active          := True;
  tbcItensOSSelecionar.TabVisible := False;
  pnlConfirmar.Visible            := False;
  vlAbrindoForm          := True;
  tbcPesquisa.TabVisible := False;
end;

procedure TfrmOrdemServicoSolicitar.HabilitarPainelNovaOS(vpHabilitar: Boolean);
begin
  tbcPesquisa.TabVisible        := not vpHabilitar;
  tbcServicosRetorno.TabVisible := not vpHabilitar;
  tbcOS.TabVisible              := vpHabilitar;
  pgcOS.ActivePage              := tbcOS;
  rdbOrdemNova.Checked          := vpHabilitar;
  rdbOrdemAberta.Enabled        := not vpHabilitar;
  rdbOrdemNova.Enabled          := vpHabilitar;
  pnlAdicionar.Visible          := vpHabilitar;
  pnlAdicionar.Enabled          := vpHabilitar;
  pnlNovaOS.Visible             := not vpHabilitar;
  pnlConfirmar.Visible          := vpHabilitar;
  dxBarManagerRotulo.Visible    := not vpHabilitar and (pgcOS.ActivePage = tbcOS);
  cxBtnFechar.Enabled           := not vpHabilitar;
  gbxInclusao.Enabled           := not vpHabilitar;
end;

procedure TfrmOrdemServicoSolicitar.icxPesquisaSituacaoPropertiesEditValueChanged(
  Sender: TObject);
begin
  if icxPesquisaSituacao.Text <> '' then
    btnPesquisarClick(self);
end;

procedure TfrmOrdemServicoSolicitar.icxTipoRegistroPropertiesChange(
  Sender: TObject);
begin
  icxTipoPagamento.EditValue := icxTipoRegistro.EditValue;
end;

procedure TfrmOrdemServicoSolicitar.IncluirAlterarItemCaixa;
begin
  vlAbrindoForm := False;
  SelecionarCaixaServico(True);

  if not gbxInclusao.Visible then
    exit;

  ClientAncestral.Active := False;
  ClientAncestral.ParamByName('CAIXA_ITEM_ID').AsInteger := vgCaixaDados.CaixaItemID;
  ClientAncestral.Active := True;

  if vgOrdemServico.TipoInclusao in [1,3] then
  begin
    ClientAncestral.Insert;
    ClientAncestralSITUACAO.AsString           := '3';
    ClientAncestralQTD.AsInteger               := 1;
    ClientAncestralUSUARIO_CAIXA_ID.AsString   := vgUsuarioID;
    ClientAncestralUSUARIO_SERVICO_ID.AsString := vgUsuarioID;
    ClientAncestralDATA_PAGAMENTO.AsDateTime   := vgCaixaDados.Data;
    ClientAncestralHORA_PAGAMENTO.AsString     := dtmControles.DataHoraBanco(2);
    ClientAncestralTIPO_TRANSACAO.AsString     := 'C';//Credito
    ClientAncestralVALOR_PAGO.AsCurrency       := 0;
    ClientAncestralOS_TIPO.AsString            := '3';

  end;

  if vgCaixaDados.TipoCaixa = '1' then // Abertura de Caixa
    PreencherDadosAberturaCaixa
  else
    if vgCaixaDados.TipoCaixa = '2' then // Inclusão Diversas
      PreencherDadosInclusao
  else
    if vgCaixaDados.TipoCaixa = '3' then // Alteração
      PreencherDadosAlteracao;
end;

procedure TfrmOrdemServicoSolicitar.lbxServicoPropertiesEditValueChanged(
  Sender: TObject);
begin
  if vlAbrindoForm then
    exit;

  vlMontandoSequencial := True;
  if ClientAncestral.State in [dsEdit, dsInsert] then
  begin
    ClientAncestralVALOR_PAGO.AsCurrency   := 0;
    ClientAncestralDESCRICAO.AsString      := '';
    ClientAncestralTIPO_TRANSACAO.AsString := sqlCaixaServicosTIPO_TRANSACAO.AsString;
    ClientAncestralOS_TIPO.AsString        := sqlCaixaServicosOS_TIPO.AsString;

    tbcItensOSSelecionar.TabVisible := sqlCaixaServicosTIPO_VALOR.AsString = '1';
    edtValorPago.Enabled            := sqlCaixaServicosTIPO_VALOR.AsString <> '1';
    tbcItensOs.TabVisible           := sqlCaixaServicosTIPO_VALOR.AsString <> '1';
    btnCalculoRapido.Enabled        := sqlCaixaServicosTIPO_VALOR.AsString <> '1';

    if tbcItensOs.TabVisible then
      pgcItensOS.ActivePage := tbcItensOs
    else
    begin
      pgcItensOS.ActivePage := tbcItensOSSelecionar;

      sqlNaturezaTitulo.Active := False;
      sqlNaturezaTitulo.ParamByName('SISTEMA_ID').AsInteger := sqlCaixaServicosSISTEMA_ID.AsInteger;
      sqlNaturezaTitulo.Active := True;

      CarregarItensSequencia;
      btnCalcularClick(self);
    end;
  end;
  if icxTipoRegistro.EditValue = null then
    exit;

  CarregarListaOSTipoSimples(icxTipoPagamento, icxTipoRegistro.EditValue);
  CarregarListaOSTipoDB(icxTipoRegistro, icxTipoRegistro.EditValue);
  vlMontandoSequencial := False;
end;

procedure TfrmOrdemServicoSolicitar.lcxIdentificacaoPropertiesEditValueChanged(
  Sender: TObject);
begin
  icxTipoPagamento.Enabled := btnConfirmar.Enabled and lcxIdentificacao.Enabled;
  edtOS.EditValue := sqlOrdemServicoORDEM_SERVICO_ID.AsInteger;
  if lcxIdentificacao.Text <> '' then
       frmOrdemServicoSolicitar.Height := 750
  else frmOrdemServicoSolicitar.Height := 245;
  SelecionarItensCaixa;
end;

procedure TfrmOrdemServicoSolicitar.lcxNaturezaTituloPropertiesEditValueChanged(
  Sender: TObject);
begin
  btnAdicionarItem.Enabled := lcxNaturezaTitulo.EditValue <> null;
end;

procedure TfrmOrdemServicoSolicitar.lcxServicoRetornoPropertiesChange(
  Sender: TObject);
begin
  btnPesquisarRetorno.Enabled := lcxServicoRetorno.EditValue <> NULL;
  if btnPesquisarRetorno.Enabled then
    btnPesquisarRetornoClick(self);
end;

procedure TfrmOrdemServicoSolicitar.pgcOSChange(Sender: TObject);
begin
  if vlAbrindoForm then
    exit;

  dxBarManagerRotulo.Visible := pgcOS.ActivePage = tbcOS;
  if pgcOS.ActivePage = tbcOS then
  begin
    tbcOS.TabVisible           := True;
    pgcItensOS.ActivePageIndex := 0 ;
    rdbOrdemNova.Enabled       := False;
    rdbOrdemAberta.Checked     := True;

    rdbOrdemAbertaClick(self);
    if vlOsNova = '' then
         edtOS.EditValue := sqlPesquisaOSORDEM_SERVICO_ID.AsString
    else edtOS.EditValue := vlOsNova;

    btnPesquisarOSClick(self);
    frmOrdemServicoSolicitar.Height := 750;
    cxBtnFechar.Enabled             := True;
    gbxInclusao.Enabled             := True;
    pnlAdicionar.Enabled            := sqlOrdemServicoSITUACAO.AsString = 'A';
    pnlAdicionar.Visible            := (vgOrdemServico.TipoInclusao <> 0) and (sqlOrdemServicoSITUACAO.AsString = 'A');
    CarregarSaldo;
  end
  else
    if pgcOS.ActivePage = tbcPesquisa then
    begin
      frmOrdemServicoSolicitar.Height := 750;
      cxBtnFechar.Enabled             := True;
    end
  else
    if pgcOS.ActivePage = tbcServicosRetorno then
      lcxServicoRetorno.SetFocus;

end;

procedure TfrmOrdemServicoSolicitar.PreencherDadosAberturaCaixa;
begin
  vlSaldoAbertura       := dtmControles.BuscarParametroOutroSistema('VALOR_ABERTURA_FECHAMENTO', 'GERAL','PRINCIPAL','5') = 'S';
  lblInformacao.Caption := 'ABERTURA DO CAIXA';
  lbxServico.Enabled    := False;

  ClientAncestralCAIXA_SERVICO_ID.AsInteger := 1;
  ClientAncestralREGISTRADO.AsInteger       := 3;
  ClientAncestralDESCRICAO.AsString         := 'ABERTURA DE CAIXA';
  ClientAncestralTIPO_SERVICO.AsString      := '14';
  ClientAncestralSITUACAO.AsString          := '1';
  lbxServicoPropertiesEditValueChanged(lbxServico);

  if vlSaldoAbertura then
  begin
    ClientAncestralVALOR_SERVICO.AsCurrency  := dtmControles.GetFloat(' SELECT FIRST(1) SALDO_FINAL '+
                                                                      ' FROM C_CAIXA_ANDAMENTO '+
                                                                      ' WHERE ANDAMENTO_CAIXA = '+ QuotedStr('4')+
                                                                      ' ORDER BY CAIXA_ANDAMENTO_ID DESC');
    edtDescricao.SetFocus;
  end
  else
  begin
    ClientAncestralVALOR_SERVICO.AsCurrency   := dtmControles.BuscarParametroOutroSistema('VALOR_PADRAO_ABERTURA', 'GERAL','PRINCIPAL','5');
    edtValorPago.SetFocus;
  end;
end;

procedure TfrmOrdemServicoSolicitar.PreencherDadosAlteracao;
begin
  lblInformacao.Caption := 'Ordem de Serviço - Alteração Dados do Item Selecionado';
  lbxServico.Enabled   := not (ClientAncestralSITUACAO.AsInteger in [1,2]);
  edtValorPago.Enabled := not (ClientAncestralSITUACAO.AsInteger in [1,2]);
  lbxServicoPropertiesEditValueChanged(lbxServico);
  lbxServico.SetFocus;
end;

procedure TfrmOrdemServicoSolicitar.PreencherDadosInclusao;
begin
  lblInformacao.Caption               := 'Ordem de Serviço - Inclusão de Item no Caixa';
  ClientAncestral.edit;
  ClientAncestralREGISTRADO.AsInteger := 1;
  ClientAncestralSITUACAO.AsString    := '3'; //Aguardando
  ClientAncestralCAIXA_ID.AsInteger   := vgCaixaDados.CaixaId;
  lbxServico.SetFocus;
end;

procedure TfrmOrdemServicoSolicitar.rdbOrdemAbertaClick(Sender: TObject);
begin
  if pgcOS.ActivePage = tbcPesquisa then
    exit;

  tabOrdemNova.TabVisible    := False;
  tabOrdemAberta.TabVisible  := True;
  pgcOrdemServico.ActivePage := tabOrdemAberta;
  if (pgcOS.ActivePage = tbcOS) and (edtOS.Enabled) then
    edtOS.SetFocus;
end;

procedure TfrmOrdemServicoSolicitar.rdbOrdemNovaClick(Sender: TObject);
begin
  pgcOS.ActivePage           := tbcOS;
  sqlCaixaItens.Active       := False;
  tabOrdemNova.TabVisible    := True;
  tabOrdemAberta.TabVisible  := False;
  pgcOrdemServico.ActivePage := tabOrdemNova;
  vgOrdemServico.Ordem       := 0;
  edtIdentificacao.Clear;

  if vgOrdemServico.TipoInclusao <> 0 then
    frmOrdemServicoSolicitar.Height := 245;

  if pgcOS.ActivePage = tbcOS then
    edtIdentificacao.SetFocus;
end;

procedure TfrmOrdemServicoSolicitar.SelecionarCaixaServico(Interno: Boolean);
var
  Sql, Aux : String;
begin
  sqlCaixaServicos.Close;
  vgSistemas := dtmControles.BuscarParametroOutroSistema('SISTEMA_CAIXA', 'GERAL','NOVO_CAIXA','5');
  Aux := dtmLookup.SelecionarSistema(vgSistemas, 'SISTEMA_ID');

  Sql := 'SELECT * ' +
         'FROM C_CAIXA_SERVICO ' +
         'WHERE (SISTEMA_ID = 9 OR ' + Aux;

  if Interno then
    Sql := Sql + ' AND INTERNO_SISTEMA = ''N''';

  if vgOrdemServico.TipoInclusao = 3 then
    Sql := Sql + ' AND NOT (OS_TIPO IS NULL OR OS_TIPO = '+QuotedStr('1')+')';

  sql := Sql + ' ORDER BY CAIXA_SERVICO_ID';
  sqlCaixaServicos.SQL.Text := Sql;
  sqlCaixaServicos.Open;
end;

procedure TfrmOrdemServicoSolicitar.SelecionarItensCaixa;
var
  viSql : String;
begin
  sqlCaixaItens.Active := False;

  if edtOS.Text <> '' then
  begin
    viSql := '  SELECT CI.CAIXA_ITEM_ID, CI.CAIXA_SERVICO_ID, CI.USUARIO_SERVICO_ID, CI.USUARIO_CAIXA_ID, '+
             '  CI.CHAVE_SERVICO, CI.DESCRICAO, CI.DATA_PAGAMENTO, CI.SITUACAO, CI.TIPO_TRANSACAO, '+
             '  CI.VALOR_SERVICO, CI.VALOR_PAGO, CI.OBSERVACAO, CI.HORA_PAGAMENTO, '+
             '  CI.CAIXA_ID, CI.RECIBO_ID, TIPO_SERVICO, CI.QTD, CI.APRESENTANTE, CI.MENSALISTA_ID, '+
             '  CI.REGISTRADO, CI.TIPO_CAIXA, CI.ORDEM_SERVICO_ID, CI.OS_TIPO, '+
             '  CS.CAIXA_SERVICO_RETORNO_ID AS SERVICO_RETORNO_ENTRADA, '+
             '  CI.CAIXA_SERVICO_RETORNO_ID AS SERVICO_RETONO_SAIDA, '+
             '  CI.CAIXA_SERVICO_ENTRADA_ID AS SERVICO_CONFIRMADO, '+
             '  CS.SISTEMA_ID '+
             '  FROM C_CAIXA_ITEM CI '+
             '  LEFT OUTER JOIN C_CAIXA_SERVICO CS ON '+
             '  CI.CAIXA_SERVICO_ID = CS.CAIXA_SERVICO_ID '+
             ' WHERE ORDEM_SERVICO_ID = '+ IntToStr(edtOS.EditValue)+
             ' AND CI.REGISTRADO <> ''6'' AND ' +
             ' NOT EXISTS ' +
             '(' +
             'SELECT 1 FROM C_CAIXA_ITEM C_CI2 WHERE C_CI2.SITUACAO = ''7'' AND ' +
             'C_CI2.REGISTRADO = ''6'' AND ' +
             'C_CI2.QUITADO_CAIXA_ID = CI.CAIXA_ITEM_ID' +
             ')' +
             '   ORDER BY CI.CAIXA_ITEM_ID ';

    sqlCaixaItens.SQL.Text := viSql;
    sqlCaixaItens.Active := True;
  end;

  tbcItensOS.TabVisible := sqlCaixaItens.Active and not sqlCaixaItens.IsEmpty;
  pgcItensOS.ActivePage := tbcItensOs;
  CarregarSaldo;
end;

procedure TfrmOrdemServicoSolicitar.sqlCaixaItensAfterScroll(DataSet: TDataSet);
begin
  btnExcluirItem.Enabled := (sqlCaixaItensSITUACAO.AsString = '3') and (sqlCaixaItensCHAVE_SERVICO.IsNull);
end;

procedure TfrmOrdemServicoSolicitar.sqlCaixaItensCalcFields(DataSet: TDataSet);
var
  viPedidoID: Integer;
  viPedidoID_Anterior: Integer;
  viProtocoloID_Anterior: Integer;
  viValorCredito: Currency;
  viValorDebito: Currency;
  viSaldo: Currency;
begin
  sqlCaixaItensValorPagoCalc.AsCurrency := sqlCaixaItensVALOR_PAGO.AsCurrency;

  // 5 = Reprotocolo
  if sqlCaixaItensTIPO_SERVICO.AsString.Equals(
    '5') then
  begin
    viPedidoID := dtmFD.FDConnection.ExecSQLScalar(
      'SELECT PEDIDO_ID FROM R_PROTOCOLO WHERE PROTOCOLO_ID = :P_PROTOCOLO_ID',
      [sqlCaixaItensCHAVE_SERVICO.AsInteger]);

    viPedidoID_Anterior := dtmFD.FDConnection.ExecSQLScalar(
      'SELECT PEDIDO_ID FROM R_PEDIDO WHERE NOVO_PEDIDO_ID = :P_NOVO_PEDIDO_ID',
      [viPedidoID]);

    viProtocoloID_Anterior := dtmFD.FDConnection.ExecSQLScalar(
      'SELECT PROTOCOLO_ID FROM R_PROTOCOLO WHERE PEDIDO_ID = :P_PEDIDO_ID',
      [viPedidoID_Anterior]);

    viValorCredito := dtmFD.FDConnection.ExecSQLScalar(
      'SELECT COALESCE(SUM(VALOR_PAGO), 0) FROM C_CAIXA_ITEM WHERE ' +
      'TIPO_SERVICO = ''1'' AND CHAVE_SERVICO = :P_CHAVE_SERVICO AND ' +
      'TIPO_TRANSACAO = ''C'' AND ' +
      'SITUACAO = ''7'' AND REGISTRADO = ''6''',
      [viProtocoloID_Anterior]);

    viValorDebito := dtmFD.FDConnection.ExecSQLScalar(
      'SELECT COALESCE(SUM(VALOR_PAGO), 0) FROM C_CAIXA_ITEM WHERE ' +
      'TIPO_SERVICO = ''1'' AND CHAVE_SERVICO = :P_CHAVE_SERVICO AND ' +
      'TIPO_TRANSACAO = ''D'' AND ' +
      'SITUACAO = ''7'' AND REGISTRADO = ''6''',
      [viProtocoloID_Anterior]);

    viSaldo := viValorCredito - viValorDebito;

    sqlCaixaItensValorPagoCalc.AsCurrency := sqlCaixaItensValorPagoCalc.AsCurrency +
      viSaldo;
  end;

  sqlCaixaItenscalc_creditos.AsCurrency := 0;
  sqlCaixaItenscalc_Debitos.AsCurrency  := 0;
  if (sqlCaixaItensSITUACAO.AsInteger = 4) and (sqlCaixaItensOS_TIPO.AsInteger <> 1) then
  begin
    if (sqlCaixaItensTIPO_TRANSACAO.AsString = 'C') and (sqlCaixaItensOS_TIPO.AsInteger = 2) then
         sqlCaixaItenscalc_creditos.AsCurrency := sqlCaixaItensValorPagoCalc.AsCurrency
    else sqlCaixaItenscalc_Debitos.AsCurrency  := sqlCaixaItensValorPagoCalc.AsCurrency;
  end;

  // SITUAÇÃO DE SERVIÇO DE RETORNO
  if sqlCaixaItensSERVICO_CONFIRMADO.AsInteger > 0 then
    sqlCaixaItensCALC_RETORNO.AsString := '3'
  else
    if sqlCaixaItensSERVICO_RETONO_SAIDA.AsInteger > 0 then
         sqlCaixaItensCALC_RETORNO.AsString := '3'
  else
    if sqlCaixaItensSERVICO_RETORNO_ENTRADA.AsInteger > 0 then
      sqlCaixaItensCALC_RETORNO.AsString := '1';

end;

procedure TfrmOrdemServicoSolicitar.sqlItensRetornoAfterScroll(
  DataSet: TDataSet);
begin
  btnRegistrarrRetorno.Enabled := not sqlItensRetorno.IsEmpty;
end;

procedure TfrmOrdemServicoSolicitar.sqlItensRetornoCalcFields(
  DataSet: TDataSet);
begin
  sqlItensRetornoCALC_OS.AsString := MascaraOS(sqlItensRetornoORDEM_SERVICO_ID.AsInteger);

  if (sqlItensRetornoCAIXA_SERVICO_RETORNO_ID.IsNull) AND
     (sqlItensRetornoCAIXA_SERVICO_ENTRADA_ID.IsNull) then
    sqlItensRetornoCALC_SITUACAO.AsString := '1'
  else
    if (sqlItensRetornoCAIXA_SERVICO_RETORNO_ID.AsInteger > 0) AND
       (sqlItensRetornoCAIXA_SERVICO_ENTRADA_ID.IsNull) then
       sqlItensRetornoCALC_SITUACAO.AsString := '2'
  else sqlItensRetornoCALC_SITUACAO.AsString := '3';
end;

procedure TfrmOrdemServicoSolicitar.sqlItensRetornoCALC_SELECIONADOChange(
  Sender: TField);
begin
  if sqlItensRetorno.State in [dsEdit, dsInsert] then
   sqlItensRetorno.Post;
end;

procedure TfrmOrdemServicoSolicitar.sqlPesquisaOSAfterScroll(DataSet: TDataSet);
begin
  tbcOS.TabVisible    := not sqlOrdemServico.IsEmpty;
  btnExcluirOS.Enabled:= not sqlOrdemServico.IsEmpty;
end;

procedure TfrmOrdemServicoSolicitar.sqlPesquisaOSCalcFields(DataSet: TDataSet);
begin
  sqlPesquisaOSCALC_OS.AsString := MascaraOS(sqlPesquisaOSORDEM_SERVICO_ID.AsInteger);
end;

procedure TfrmOrdemServicoSolicitar.sqlServicosSequenciaisCALC_SELECIONADOChange(
  Sender: TField);
begin
  if sqlServicosSequenciais.State in [dsEdit, dsInsert] then
  begin
    sqlServicosSequenciais.Post;
    if vlMontandoSequencial then
      exit;
    CapturarValoresSequenciais;
  end;
end;

function TfrmOrdemServicoSolicitar.VerificarTipoTransacao:String;
begin
  if vgOrdemServico.TipoInclusao = 0 then
  begin
    if icxTipoPagamento.EditValue = '3' then
         vgOrdemServico.TransacaoOS := 'D'
    else vgOrdemServico.TransacaoOS := 'C';
  end
  else
    case StrToInt(icxTipoRegistro.EditValue) of
      1 : vgOrdemServico.TransacaoOS := IbxTransacao.EditValue;
      2 : vgOrdemServico.TransacaoOS := 'C';
      3 : vgOrdemServico.TransacaoOS := 'D';
    end;
  Result := vgOrdemServico.TransacaoOS;
end;

end.
