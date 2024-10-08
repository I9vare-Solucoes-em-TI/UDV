unit GerenciadorRecebimento;

interface

uses
  I9Query,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, Menus, cxLookAndFeelPainters,
  cxGroupBox, ActnList, XPStyleActnCtrls, ActnMan, StdCtrls, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxContainer, cxEdit,
  cxLabel, ToolWin, ActnCtrls, ActnMenus, cxPC, cxControls, ExtCtrls,
  cxGraphics, cxProgressBar, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxRadioGroup, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxCheckBox, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxImageComboBox,
  cxCurrencyEdit, Buttons, DBClient, SimpleDS, frxClass, CodigoBarras, FuncAux,
  frxExportPDF, frxDBSet, OleCtrls,
  dxSkinBlueprint, dxSkinDarkRoom, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinHighContrast, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013White, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSpringTime,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxPCdxBarPopupMenu,
  cxLookAndFeels, ComCtrls, dxCore, cxDateUtils, cxNavigator,
  dxSkinDevExpressDarkStyle, dxBarBuiltInMenu, System.Actions, ACBrBoleto,
  DbxDevartInterBase, cxDBEdit, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type

  TDadosSocio = Record
    FamiliaImprimir :  Boolean;
    PessoaGrupoId, PessoaId, GrupoNome: String;
    NumeroBoleto : string;
  end;

  TfrmGerenciadorRecebimento = class(TForm)
    Panel1: TPanel;
    pgcGerenciador: TcxPageControl;
    tabGeracao: TcxTabSheet;
    tabRecebimento: TcxTabSheet;
    tabRealizado: TcxTabSheet;
    Panel2: TPanel;
    PanelBotoes: TPanel;
    ActionManager1: TActionManager;
    actGerarBoleto: TAction;
    actImprimir: TAction;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    rdbSomente: TcxRadioButton;
    rdbAte: TcxRadioButton;
    cbxMes: TcxComboBox;
    cxGroupBox3: TcxGroupBox;
    cxProgress: TcxProgressBar;
    pnlImpressao: TPanel;
    Panel3: TPanel;
    Panel8: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    cxLabel1: TcxLabel;
    lcxGrupoAssociado: TcxLookupComboBox;
    cxGroupBox5: TcxGroupBox;
    lblMarcar: TcxLabel;
    lblDesmarcar: TcxLabel;
    sbnLimparFiltro: TSpeedButton;
    sqlAssociadosAtivos: TI9Query;
    dtsAssociadosAtivos: TDataSource;
    cxGridAssociados: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBNome: TcxGridDBColumn;
    cxGridDBGrupo: TcxGridDBColumn;
    cxGridDBSecionado: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    popMarcarGrupo: TPopupMenu;
    popMarcarDesmarcarGrupo: TMenuItem;
    sqlCompromissos: TI9Query;
    sqlCompromissoscalc_referencia: TStringField;
    dtsCompromissos: TDataSource;
    sqlCompromissosCOMPROMISSO_VENCIDO_ID: TBCDField;
    sqlCompromissosPESSOA_ID: TBCDField;
    sqlCompromissosCONTABIL_CONTA_ID: TBCDField;
    sqlCompromissosANO_MES_REFERENCIA: TStringField;
    sqlCompromissosSITUACAO: TStringField;
    sqlCompromissosLANCAMENTO_COMPROMISSO_ID: TBCDField;
    sqlCompromissosBOLETA_ID: TBCDField;
    sqlCompromissosRECIBO_NUMERO: TBCDField;
    sqlCompromissosDIFERENCA: TStringField;
    sqlCompromissosQTD_ADICIONAL: TBCDField;
    sqlCompromissosATUALIZADO: TStringField;
    sqlCompromissosVALOR_ATUAL: TBCDField;
    sqlCompromissosVALOR_ANTERIOR: TBCDField;
    sqlCompromissosDATA_REALIZACAO: TSQLTimeStampField;
    sqlCompromissosOBRIGATORIO: TStringField;
    sqlCompromissosCENTRO_CUSTO_ID: TBCDField;
    sqlCompromissosCEDENTE_ID: TBCDField;
    sqlCompromissosBALANCETE_GRUPO_ID: TBCDField;
    sqlCompromissosSELECIONADO: TStringField;
    sqlCompromissoscalc_travado: TStringField;
    sqlCompromissoscalc_ValorPagar: TCurrencyField;
    frxDBDatasetCompromisso: TfrxDBDataset;
    frxDBDatasetSocio: TfrxDBDataset;
    sqlAssociadoBoleto: TI9Query;
    sqlCompromissoBoleto: TI9Query;
    dtsCompromissoBoleto: TDataSource;
    dtsAssociadoBoleto: TDataSource;
    sqlCompromissoBoletocalc_referencia: TStringField;
    sqlCompromissoBoletoANO_MES_REFERENCIA: TStringField;
    sqlCompromissoBoletoVALOR_ATUAL: TBCDField;
    sqlCompromissoBoletoQTD_ADICIONAL: TBCDField;
    sqlCompromissoBoletoDIFERENCA: TStringField;
    sqlCompromissoBoletoCOMPROMISSO_VENCIDO_ID: TBCDField;
    sqlCompromissoBoletoDESCRICAO: TStringField;
    PanelBotaoFechar: TPanel;
    CAD_ENVIAR_EMAIL: TAction;
    popCompromissos: TPopupMenu;
    popBoletaCancelar: TMenuItem;
    N1: TMenuItem;
    popBoletaVisualizar: TMenuItem;
    sqlRegistrarCompromissos: TI9Query;
    dtsRegistrarCompromissos: TDataSource;
    sqlRegistrarCompromissoscalc_referencia: TStringField;
    sqlRegistrarCompromissosANO_MES_REFERENCIA: TStringField;
    sqlRegistrarCompromissosVALOR_ATUAL: TBCDField;
    sqlRegistrarCompromissosBOLETA_ID: TBCDField;
    sqlRegistrarCompromissosQTD_ADICIONAL: TBCDField;
    sqlRegistrarCompromissosDIFERENCA: TStringField;
    sqlRegistrarCompromissosCOMPROMISSO_VENCIDO_ID: TBCDField;
    sqlRegistrarCompromissosPESSOA_ID: TBCDField;
    sqlRegistrarCompromissosSITUACAO: TStringField;
    sqlRegistrarCompromissosCONTABIL_CONTA_ID: TBCDField;
    sqlRegistrarCompromissosBALANCETE_GRUPO_ID: TBCDField;
    sqlBoletosRegistrados: TI9Query;
    sqlBoletosRegistradosBOLETA_ID: TBCDField;
    sqlBoletosRegistradosVALOR: TBCDField;
    sqlBoletosRegistradosPESSOA_ID: TBCDField;
    sqlBoletosRegistradosPESSOA_GRUPO_ID: TBCDField;
    sqlBoletosRegistradosDATA_EMISSAO: TSQLTimeStampField;
    sqlBoletosRegistradosNOME: TStringField;
    sqlBoletosRegistradosDESCRICAO: TStringField;
    sqlBoletosRegistradosDATA_PAGAMENTO: TSQLTimeStampField;
    sqlBoletosRegistradoscalc_nome: TStringField;
    dtsBoletosRegistrados: TDataSource;
    sqlBoletosRegistradosANO_MES_BOLETO: TStringField;
    sqlBoletosRegistradoscalc_DataSituacao: TSQLTimeStampField;
    sqlBoletosRegistradosSITUACAO: TStringField;
    sqlBoletosRegistradosDATA_CANCELADO: TSQLTimeStampField;
    sqlBoletosRegistradoscalc_referencia: TStringField;
    pgcRegistro: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxGroupBox6: TcxGroupBox;
    cxLabel3: TcxLabel;
    lblDataRecebimento: TcxLabel;
    chxValorBoleta: TcxCheckBox;
    lblValorBoleto: TcxLabel;
    edtValorBoleto: TcxCurrencyEdit;
    cxLabel6: TcxLabel;
    cxGroupBox7: TcxGroupBox;
    lblReferenciaMulta: TcxLabel;
    cbxReferenciaMulta: TcxComboBox;
    popBoletos: TPopupMenu;
    popEstornarRegistro: TMenuItem;
    tabBoleto: TcxTabControl;
    cxGroupBox4: TcxGroupBox;
    grdCompromissoVencido: TcxGrid;
    cxGridDBTableCompromissos: TcxGridDBTableView;
    cxGridDBCompromisso: TcxGridDBColumn;
    cxGridDBTableView1Column4: TcxGridDBColumn;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    cxGridDBTableAtualizado: TcxGridDBColumn;
    cxGridDBValor: TcxGridDBColumn;
    cxGridDBTableDiferenca: TcxGridDBColumn;
    cxGridDBTableQtdAdicional: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridDBTableView1Column3: TcxGridDBColumn;
    cxGridDBCompromissoPessoa: TcxGridDBColumn;
    cxGridDBTableCompromissosValorPagar: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    frxReportNAoAss: TfrxReport;
    sqlCompromissoBoletoPESSOA_NOME: TStringField;
    sqlCompromissoRealizado: TI9Query;
    sqlCompromissoRealizadoANO_MES_REFERENCIA: TStringField;
    dtsCompromissoRealizado: TDataSource;
    cxGridRealizado: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBColumn13: TcxGridDBColumn;
    cxGridDBColumn14: TcxGridDBColumn;
    cxGridDBColumn15: TcxGridDBColumn;
    cxGridDBColumn16: TcxGridDBColumn;
    cxGridDBColumn17: TcxGridDBColumn;
    cxGridDBColumn18: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    Panel9: TPanel;
    cxLabel4: TcxLabel;
    sqlCompromissoRealizadocalc_referencia: TStringField;
    sqlCompromissoRealizadoSITUACAO: TStringField;
    sqlCompromissoRealizadoLANCAMENTO_COMPROMISSO_ID: TBCDField;
    sqlCompromissoRealizadoBOLETA_ID: TBCDField;
    sqlCompromissoRealizadoRECIBO_NUMERO: TBCDField;
    sqlCompromissoRealizadoDIFERENCA: TStringField;
    sqlCompromissoRealizadoVALOR_ORIGEM: TBCDField;
    sqlCompromissoRealizadoQTD_ADICIONAL: TBCDField;
    sqlCompromissoRealizadoATUALIZADO: TStringField;
    sqlCompromissoRealizadoDATA_REALIZACAO: TSQLTimeStampField;
    sqlCompromissoRealizadoBALANCETE_GRUPO_ID: TBCDField;
    sqlCompromissoRealizadoCOMPROMISSO_VENCIDO_ID: TBCDField;
    sqlCompromissoRealizadoPESSOA_ID: TBCDField;
    sqlCompromissoRealizadoCONTABIL_CONTA_ID: TBCDField;
    sqlCompromissoRealizadoVALOR_ATUAL: TBCDField;
    sqlCompromissoRealizadocalc_TipoDocumento: TStringField;
    sqlCompromissoRealizadocalc_NumeroDocumento: TStringField;
    cxGridDBTableView2Column1: TcxGridDBColumn;
    cxLabel7: TcxLabel;
    sqlCompromissoRealizadoPESSOA_NOME: TStringField;
    Panel11: TPanel;
    btnReimprimirRecibo: TcxButton;
    btnEstornarRecibo: TcxButton;
    popRecuperarBoleto: TMenuItem;
    N2: TMenuItem;
    sqlCompromissoRealizadocalc_NaoAssociado: TBooleanField;
    cxGridDBTableView2Column2: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    sqlCompromissoRealizadoQUITADO_GRUPO_ID: TBCDField;
    sqlBoletosRegistradosBOLETA_COMPROMISSOS_ID: TStringField;
    sqlCompromissoRealizadoANO_MES_REALIZADO: TStringField;
    frxDBDatasetcABECALHO: TfrxDBDataset;
    rdbRegistroSocio: TcxRadioButton;
    rdbRegistroAvulso: TcxRadioButton;
    sqlAjusteProgramado: TI9Query;
    dtsAjusteProgramado: TDataSource;
    frxDBDatasetAjuste: TfrxDBDataset;
    sqlAjusteProgramadoDESCRICAO: TStringField;
    sqlAjusteProgramadoNOME: TStringField;
    sqlAjusteProgramadoVALOR_ATUAL: TBCDField;
    edtPesquisar: TcxTextEdit;
    chxSelecaoMultipla: TcxCheckBox;
    popExportacao: TPopupMenu;
    ExportalExcel1: TMenuItem;
    frxReport1: TfrxReport;
    Panel10: TPanel;
    lblInformacaoLancamento: TcxLabel;
    Timer1: TTimer;
    cxBtnFechar: TcxButton;
    edtDataRealizadoIni: TcxDateEdit;
    edtDataRealizadoFim: TcxDateEdit;
    btnPesquisarRealizados: TcxButton;
    btnRecebimentoRecibo: TcxButton;
    rdbMarcar: TcxRadioButton;
    rdbDesmarcar: TcxRadioButton;
    lcxCompromissos: TcxLookupComboBox;
    chxTodos: TcxCheckBox;
    btnMarcar: TcxButton;
    btnCancelarTodos: TcxButton;
    edtNossoNumero: TcxTextEdit;
    btnPesquisarBoleto: TcxButton;
    edtMesReferencia: TcxTextEdit;
    edtDataRecebimento: TcxDateEdit;
    btnRegistrarBoleto: TcxButton;
    btnCancelarRegistro: TcxButton;
    tabRetorno: TcxTabSheet;
    edtRetorno: TcxTextEdit;
    cxLabel2: TcxLabel;
    btnPesquisarRetorno: TcxButton;
    btnConfirmarRetorno: TcxButton;
    btnCancelarRetorno: TcxButton;
    pgcRegistroBoleto: TcxPageControl;
    tabRegistroManual: TcxTabSheet;
    tabRegistroAutomatico: TcxTabSheet;
    gbxBoletoCompromissos: TcxGroupBox;
    cxGrid1: TcxGrid;
    cxGridDBRegistroBoleto: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn12: TcxGridDBColumn;
    cxGridLevel4: TcxGridLevel;
    cdsRetorno: TClientDataSet;
    cdsRetornoTIPO_REGISTRO: TStringField;
    cdsRetornoNOSSO_NUMERO: TStringField;
    cdsRetornoCARTEIRA: TStringField;
    cdsRetornoCOD_OCORRENCIA: TStringField;
    cdsRetornoVENCIMENTO: TStringField;
    cdsRetornoVALOR_IOF: TCurrencyField;
    cdsRetornoVALOR_ABATIMENTO: TCurrencyField;
    cdsRetornoDESCONTO: TCurrencyField;
    cdsRetornoVALOR_PRINCIPAL: TCurrencyField;
    cdsRetornoJUROS_MORA: TCurrencyField;
    cdsRetornoMENSAGEM: TStringField;
    cdsRetornoDIFERENCA: TCurrencyField;
    cdsRetornoAGENCIA: TStringField;
    cdsRetornoCONTA: TStringField;
    cdsRetornoLOCALIZADO: TBooleanField;
    cdsRetornoVALOR_DOCUMENTO: TCurrencyField;
    cdsRetornoDOCUMENTO: TStringField;
    cdsRetornoVALOR_PAGO: TCurrencyField;
    cdsRetornoSITUACAO: TStringField;
    dtsRetorno: TDataSource;
    OpenDialogRetorno: TOpenDialog;
    lblDadosBanco: TcxLabel;
    cxProgressRetorno: TcxProgressBar;
    cdsRetornoNOME: TStringField;
    cdsRetornoDATA_PAGAMENTO: TDateField;
    cdsRetornoRETORNO: TBooleanField;
    tabConfimacaoBoletos: TcxTabControl;
    lblInformacao: TcxLabel;
    cdsRetornoSELECIONADO: TBooleanField;
    pgcBoletosRegistrados: TcxPageControl;
    tabBoletosRegistrados: TcxTabSheet;
    cxTabSheet4: TcxTabSheet;
    gbxBoletoRegistrado: TcxGroupBox;
    cxGridBoletosPagos: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBTableView3Column1: TcxGridDBColumn;
    cxGridDBTableView3Column6: TcxGridDBColumn;
    cxGridDBTableView3Column4: TcxGridDBColumn;
    cxGridDBTableView3Column5: TcxGridDBColumn;
    cxGridDBTableView3Column2: TcxGridDBColumn;
    cxGridDBTableView3Column3: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    Panel7: TPanel;
    btnPesquisarBoletosRegistrados: TSpeedButton;
    btnImprimir: TSpeedButton;
    lblPesqRefInicial: TcxLabel;
    lblPesqRefFinal: TcxLabel;
    lblPesqRefSituacao: TcxLabel;
    lblPesqBoleto: TcxLabel;
    edtBoletoNumPesquisa: TcxTextEdit;
    cbxBoletoRegMesIni: TcxComboBox;
    cbxBoletoRegMesFim: TcxComboBox;
    icxSituacaoBoleto: TcxImageComboBox;
    rdbPesquisaBoleto: TRadioButton;
    rdbPesquisaReferencia: TRadioButton;
    cxGrid2: TcxGrid;
    cxGridDBTableView4: TcxGridDBTableView;
    cxGridLevel6: TcxGridLevel;
    cxGridDBTableView4Column1: TcxGridDBColumn;
    cxGridDBTableView4Column2: TcxGridDBColumn;
    cxGridDBTableView4Column3: TcxGridDBColumn;
    cxGridDBTableView4Column4: TcxGridDBColumn;
    cxGridDBTableView4Column5: TcxGridDBColumn;
    cxGridDBTableView4Column6: TcxGridDBColumn;
    cxGridDBTableView4Column7: TcxGridDBColumn;
    sqlRetornoRemessa: TI9Query;
    dtsRetornoRemessa: TDataSource;
    sqlRetornoRemessaBOLETA_REMESSA_RETORNO_ID: TBCDField;
    sqlRetornoRemessaDATA: TSQLTimeStampField;
    sqlRetornoRemessaTIPO: TStringField;
    sqlRetornoRemessaQTD_REG_CONFIRMADO: TBCDField;
    sqlRetornoRemessaQTD_REG_REMESSA: TBCDField;
    sqlRetornoRemessaQTD_REG_PAGO: TBCDField;
    sqlRetornoRemessaNOME_ARQUIVO: TStringField;
    Panel12: TPanel;
    Shape1: TShape;
    cxLabel5: TcxLabel;
    btnGerarBoleto: TcxButton;
    edtDataVencimento: TcxDateEdit;
    edtValorTaxa: TcxCurrencyEdit;
    chxCobrarBoleto: TCheckBox;
    lcxCalculoMedia: TcxLabel;
    Panel13: TPanel;
    btnEnviarBoletosEmail: TcxButton;
    btnGerarRemessa: TcxButton;
    cdsRetornoTAXA_BOLETO: TCurrencyField;
    btnEditarCompromissos: TcxButton;
    sqlRetornoRemessaQTD_REG_BAIXADO: TBCDField;
    cxGridDBTableView4Column8: TcxGridDBColumn;
    sqlCompromissosAntigos: TI9Query;
    dtsCompromissosAntigos: TDataSource;
    sqlCompromissosAntigosRECIBO: TBCDField;
    sqlRegistrarCompromissosPESSOA_GRUPO_ID: TBCDField;
    sqlRegistrarCompromissosGRUPO: TStringField;
    rdbReciboSelecionado: TcxRadioButton;
    rdbReciboTodos: TcxRadioButton;
    tbcRecibos: TcxTabSheet;
    Panel6: TPanel;
    Panel14: TPanel;
    cxGridRecibos: TcxGrid;
    cxGridDBTableView5: TcxGridDBTableView;
    cxGridDBAssociadoRecibo: TcxGridDBColumn;
    cxGridDBColumn23: TcxGridDBColumn;
    cxGridDBValorRecibo: TcxGridDBColumn;
    cxGridDBColumn30: TcxGridDBColumn;
    cxGridLevel7: TcxGridLevel;
    cxGridDBTableView5Column1: TcxGridDBColumn;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    sqlReciboAgrupado: TI9Query;
    dtsReciboAgrupado: TDataSource;
    sqlReciboAgrupadoVALOR_RECIBO: TBCDField;
    sqlReciboAgrupadoDATA: TDateField;
    sqlReciboAgrupadoRECIBO_NUMERO: TBCDField;
    sqlReciboAgrupadoEMAIL_ENCAMINHAR: TStringField;
    sqlReciboAgrupadoQUITADO_GRUPO_ID: TBCDField;
    sqlReciboAgrupadoNOME_RECIBO: TStringField;
    sqlReciboAgrupadoCALC_APRESENTANTE: TStringField;
    sqlReciboAgrupadoCALC_EMAIL: TStringField;
    btnEnviarRecibo: TcxButton;
    icxMesInicial: TcxImageComboBox;
    icxMesFinal: TcxImageComboBox;
    icxAno: TcxImageComboBox;
    btnPesquisarRecibos: TcxButton;
    N3: TMenuItem;
    mniRefazerLivroCaixa: TMenuItem;
    PopupRecibos: TPopupMenu;
    MenuItem1: TMenuItem;
    cdsRetornoDATA_CREDITO: TDateField;
    cxGridRetorno: TcxGrid;
    cxGridRetornoDBTableView1: TcxGridDBTableView;
    cxGridRetornoDBTableView1TIPO_REGISTRO: TcxGridDBColumn;
    cxGridRetornoDBTableView1SELECIONAR: TcxGridDBColumn;
    cxGridRetornoDBTableView1DATA_PAGAMENTO: TcxGridDBColumn;
    cxGridRetornoDBTableView1DATA_COMPENSACAO: TcxGridDBColumn;
    cxGridRetornoDBTableView1NOME: TcxGridDBColumn;
    cxGridRetornoDBTableView1LOCALIZOU: TcxGridDBColumn;
    cxGridRetornoDBTableView1SITUACAO: TcxGridDBColumn;
    cxGridRetornoDBTableView1VALOR_TITULO: TcxGridDBColumn;
    cxGridRetornoDBTableView1VALOR_PAGO: TcxGridDBColumn;
    cxGridRetornoDBTableView1DIFERENCA: TcxGridDBColumn;
    cxGridRetornoDBTableView1VALOR_IOF: TcxGridDBColumn;
    cxGridRetornoDBTableView1DESCONTO: TcxGridDBColumn;
    cxGridRetornoDBTableView1JUROS_MORA: TcxGridDBColumn;
    cxGridRetornoDBTableView1NOSSO_NUMERO: TcxGridDBColumn;
    cxGridRetornoLevel1: TcxGridLevel;
    cxGridDBTableView1Column5: TcxGridDBColumn;
    cxGridDBTableView1Column6: TcxGridDBColumn;
    SaveDialog1: TSaveDialog;
    cxProgressRecibo: TcxProgressBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxGridDBTableView1CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure lblMarcarClick(Sender: TObject);
    procedure lblDesmarcarClick(Sender: TObject);
    procedure cxGridDBSecionadoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure sqlAssociadosAtivosAfterPost(DataSet: TDataSet);
    procedure lcxGrupoAssociadoPropertiesEditValueChanged(Sender: TObject);
    procedure sbnLimparFiltroClick(Sender: TObject);
    procedure popMarcarDesmarcarGrupoClick(Sender: TObject);
    procedure cxGridDBTableView1DblClick(Sender: TObject);
    procedure sqlCompromissosCalcFields(DataSet: TDataSet);
    procedure cxGridDBTableCompromissosCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure cxGridDBTableView1Column3PropertiesChange(Sender: TObject);
    procedure sqlCompromissosAfterPost(DataSet: TDataSet);
    procedure cxGridDBSecionadoPropertiesChange(Sender: TObject);
    procedure btnEditarCompromissosClick(Sender: TObject);
    procedure sqlCompromissosAfterScroll(DataSet: TDataSet);
    procedure chxTodosClick(Sender: TObject);
    procedure btnMarcarClick(Sender: TObject);
    procedure actGerarBoletoExecute(Sender: TObject);
    procedure cxGridDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure sqlAssociadosAtivosBeforeEdit(DataSet: TDataSet);
    procedure sqlAssociadoBoletoAfterScroll(DataSet: TDataSet);
    procedure sqlCompromissoBoletoCalcFields(DataSet: TDataSet);
    procedure cxBtnFecharClick(Sender: TObject);
    procedure CAD_ENVIAR_EMAILExecute(Sender: TObject);
    procedure cxGridDBTableView1Column3CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure popBoletaCancelarClick(Sender: TObject);
    procedure popBoletaVisualizarClick(Sender: TObject);
    procedure pgcGerenciadorChange(Sender: TObject);
    procedure chxValorBoletaClick(Sender: TObject);
    procedure btnPesquisarBoletoClick(Sender: TObject);
    procedure edtNossoNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure edtNossoNumeroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCancelarRegistroClick(Sender: TObject);
    procedure edtNossoNumeroEnter(Sender: TObject);
    procedure sqlRegistrarCompromissosCalcFields(DataSet: TDataSet);
    procedure btnRegistrarBoletoClick(Sender: TObject);
    procedure edtDataRecebimentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sqlBoletosRegistradosCalcFields(DataSet: TDataSet);
    procedure btnPesquisarBoletosRegistradosClick(Sender: TObject);
    procedure pgcRegistroChange(Sender: TObject);
    procedure btnCancelarTodosClick(Sender: TObject);
    procedure popEstornarRegistroClick(Sender: TObject);
    procedure sqlBoletosRegistradosAfterScroll(DataSet: TDataSet);
    procedure tabBoletoChange(Sender: TObject);
    procedure btnRecebimentoReciboClick(Sender: TObject);
    procedure tabBoletoDblClick(Sender: TObject);
    procedure sqlCompromissoRealizadoCalcFields(DataSet: TDataSet);
    procedure btnPesquisarRealizadosClick(Sender: TObject);
    procedure sqlCompromissoRealizadoAfterScroll(DataSet: TDataSet);
    procedure btnEstornarReciboClick(Sender: TObject);
    procedure btnReimprimirReciboClick(Sender: TObject);
    procedure popRecuperarBoletoClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure rdbRegistroSocioClick(Sender: TObject);
    procedure rdbRegistroAvulsoClick(Sender: TObject);
    procedure icxSituacaoBoletoPropertiesChange(Sender: TObject);
    procedure cbxBoletoRegMesIniPropertiesChange(Sender: TObject);
    procedure cbxBoletoRegMesFimPropertiesChange(Sender: TObject);
    procedure edtBoletoNumPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure rdbPesquisaBoletoClick(Sender: TObject);
    procedure rdbPesquisaReferenciaClick(Sender: TObject);
    procedure edtBoletoNumPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGridDBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure edtPesquisarExit(Sender: TObject);
    procedure edtPesquisarPropertiesChange(Sender: TObject);
    procedure edtPesquisarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chxSelecaoMultiplaClick(Sender: TObject);
    procedure edtDataRealizadoFimKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ExportalExcel1Click(Sender: TObject);
    procedure btnGerarRemessaClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnPesquisarRetornoClick(Sender: TObject);
    procedure tabConfimacaoBoletosChange(Sender: TObject);
    procedure btnCancelarRetornoClick(Sender: TObject);
    procedure btnConfirmarRetornoClick(Sender: TObject);
    procedure cxGridRetornoDBTableView1SELECIONARPropertiesChange(
      Sender: TObject);
    procedure cdsRetornoBeforeEdit(DataSet: TDataSet);
    procedure Panel8Click(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure btnPesquisarRecibosClick(Sender: TObject);
    procedure sqlReciboAgrupadoCalcFields(DataSet: TDataSet);
    procedure btnEnviarReciboClick(Sender: TObject);
    procedure sqlReciboAgrupadoAfterPost(DataSet: TDataSet);
    procedure mniRefazerLivroCaixaClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
  private
    vgCodigoBarra : TCodigoBarras;
    vgDadosSocio : TDadosSocio;
    vlNaoFiltrarCompromisso,  vgInserirMulta, vgCarregandoRecibos : Boolean;
    vlPrazoPagamento, vlPrazoDias, vlBoletoVisualizar, vlcompromissos : String;
    vlBoletoAssociado, vlCaixaBoletoId : Integer;
    vlDataVencimentoPadrao, vlRelatorioBoleto, vlRelatorioId, vlRelatorioInterno : string;
    vlBoletoVencimento : TDateTime;
    vlBoletoGerado : Array[1..5] of String;

    // Controle de Parametros de Relatorio de Boleto
    vlGrupoAssociado, vlGrupoCPF : String;

    procedure PesquisarAssociadoGrupo(vpGrupo : String);
    procedure MarcarDesmarcarAssociado(vpMarcar : String; vpGrupo : String = '');
    procedure MarcarDesmarcarCompromissos(vpMarcar : String; vpCompromisso : String = '';
           vpMesReferencia : string = '');
    procedure CarregarMesReferencia(vpComboBox : TcxComboBox);
    procedure CarregarReferenciaMulta;

    // Boleto
    procedure GerarBoleto(vpData : String);
    procedure CarregarDadosBoletaACBR(vpSocio, vpNossoNumero, vpDataVencimento : String; vpGrupo : Boolean = False);
    procedure CarregarDadosBanco(vpTipoRegistro : Integer);
    Function  MontarNossoNumero(vpNossoNumero, vpConvenio : String): String;
    Function GetDigitoNossoNum(vpNossoNumero : String):string;
    function GetModulo11BB(str:string; base:integer): char;
    procedure VerificarDiretorios;

    procedure HabilitarBotoesRegistrar(vpHabilitado : Boolean);
    procedure ValoresRegistroDefault;
    procedure RegistrarEntrada(vpBoleto : Integer; vpDate : TDate;
           vpRetornoId : Integer = 0);
    procedure PesquisarBoletosRegCancelados(vpI9Query : TI9Query;
         vpMesInicial, vpMesFinal, vpTipo, vpNumero : String);
    procedure CarregarCompromissosVencidos(vpIndex : Integer = 0);

    procedure InserirTaxaBoleto(vpValor : Currency; vpReferencia, vpBoleto : String);
    procedure CapturarCompromissos;
    procedure CarregarDadosSocio(vpPessoaId : String; vpGrupo : Boolean = False);
    procedure HabilitarCamposRetorno(VpHabilitado : Boolean);
    procedure LimparCampos;
    function FiltrarRegistroRetorno(vpFiltro: String; vpTab: Integer;
        vpMensagem : String):Integer;
    procedure RegistrarArquivoRetorno(vpTipo, vpNomeArquivo : String;
               vpQtdPago, vpQtdRemessa, vpQtdRegistrado, vpQtdBaixa, vpId : Integer);
    function CalcularValorMediaBoleto:Currency;
    procedure AtualziaTaxaBoleto;
    procedure LancarCompromissoAnteriores;
  protected
//    procedure ActionChange(Sender: TObject; CheckDefaults: Boolean); override;

  public
    vlFiltrarCompromissoBoleto, vgCompromissoRealizado : Boolean;
    procedure FiltrarAssociadoBoleto(vpAssociadoID, vpPessoaGrupo : string; vpRecibo : Boolean = False);
    procedure FiltrarCompromissoBoleto(vpPessoaId, vpGrupoId, vpReciboId : string);
    procedure ParametrosRelatorioRecibo;
  end;

var
  frmGerenciadorRecebimento: TfrmGerenciadorRecebimento;
  vgSocioAfastado : Integer;

implementation

uses Controles, Rotinas, Lookup, PessoaUDV, Cadastro, VisualizaRelatorios,
  SelecionarAssociado, SelecionarBoletoEnviar, CadEnvioEmail, VisualizaBoleto,
  ValidarPermissaoUsuario, NaoAssociado, ConfirmacaoRecibo, TituloRelatorio,
  LookupBoleto, Lookup_Contabil, LookupFinanceiro, CadastroRapidoLancamento,
  Lookup_Servico, CodigoPIX, csDXFunctions;

{$R *.dfm}

procedure TfrmGerenciadorRecebimento.actGerarBoletoExecute(Sender: TObject);
var
  viSql : String;
  viQtd, viNumBoleto : Integer;

  procedure GravarBoleta(vpCompromissos, vpPessoaId, vpPessoaGrupoId : String);
  begin
    ExecutaSqlAuxiliar(' INSERT INTO T_BOLETA( '+
                       '              BOLETA_ID, '+
                       '              DATA_EMISSAO, '+
                       '              DATA_VENCIMENTO, '+
                       '              SITUACAO, '+
                       '              VALOR, '+
                       '              ENVIO_EMAIL, '+
                       '              CAMINHO_ARQUIVO, '+
                       '              CODIGO_PIX, '+
                       '              ANO_MES_BOLETO, '+
                       '              PESSOA_GRUPO_ID, '+
                       '              PESSOA_ID, '+
                       '              CEDENTE_ID, '+
                       '              ORDEM, '+
                       '              REMESSA_SITUACAO, '+
                       '              FATURA_TIPO, '+
                       '              BOLETA_COMPROMISSOS_ID) '+
                       ' VALUES(      :BOLETA_ID, '+
                       '              :DATA_EMISSAO, '+
                       '              :DATA_VENCIMENTO, '+
                       '              :SITUACAO, '+
                       '              :VALOR, '+
                       '              :ENVIO_EMAIL, '+
                       '              :CAMINHO_ARQUIVO, '+
                       '              :CODIGO_PIX, '+
                       '              :ANO_MES_BOLETO, '+
                       RetNull(vpPessoaGrupoId) +', '+
                       RetNull(vpPessoaId) +', '+
                       '              :CEDENTE_ID, '+
                       '              :ORDEM, '+
                       '              :REMESSA_SITUACAO, '+
                       '              :FATURA_TIPO, '+
                       '              :BOLETA_COMPROMISSOS_ID)',2);
    with dtmControles.sqlAuxiliar do
    begin
      ParamByName('BOLETA_ID').AsString              := vgBoletoDados.ContaNossoNumero;
      ParamByName('DATA_EMISSAO').AsString           := dtmControles.DataHoraBanco(5);
      ParamByName('DATA_VENCIMENTO').AsString        := FormatDateTime('DD.MM.YYYY HH:MM:SS', edtDataVencimento.Date);
      ParamByName('SITUACAO').AsString               := '1';
      ParamByName('CAMINHO_ARQUIVO').AsString        := vgBoletoDados.CaminhoArquivo;
      ParamByName('CODIGO_PIX').AsString             := vgBoletoDados.PixTexto;
      ParamByName('ENVIO_EMAIL').AsString            := vgBoletoDados.EnvioEmail;
      ParamByName('VALOR').AsCurrency                := vgBoletoDados.ContaValorBoleto;
      ParamByName('ANO_MES_BOLETO').AsInteger        := StrToInt((copy(DatetoStr(edtDataVencimento.Date),7,4)) + (copy(DatetoStr(edtDataVencimento.Date),4,2)));
      ParamByName('CEDENTE_ID').AsInteger            := vgCedenteAtivo;
      ParamByName('ORDEM').AsInteger                 := dtmControles.GerarSequencia('BOLETO_ORDEM'+IntToStr(vgCedenteAtivo));
      ParamByName('REMESSA_SITUACAO').AsString       := '1';
      ParamByName('FATURA_TIPO').AsString            := vgBoletoDados.FaturaTipo;
      ParamByName('BOLETA_COMPROMISSOS_ID').AsString := vpCompromissos;
      ExecSQL;
    end;
    vgBoletoDados.PixTexto := '';
  end;

  procedure GravandoArquivoExportando;
  begin
    try
      if vgBoletoDados.ExclusivoSys2FamiliaImprimir then
      begin
        vgBoletoDados.EnvioEmail := dtmControles.GetStr(' SELECT BOLETO_EMAIL FROM T_PESSOA_GRUPO WHERE PESSOA_GRUPO_ID = '+vgDadosSocio.PessoaGrupoId);
        if vgBoletoDados.EnvioEmail = 'S' then
             vgBoletoDados.CaminhoArquivo := vgBoletoDados.DiretorioPadrao+'\EMAIL\'+vgDadosSocio.GrupoNome+'_'+vgBoletoDados.ContaNossoNumero+'.PDF'
        else vgBoletoDados.CaminhoArquivo := vgBoletoDados.DiretorioPadrao+'\'+vgDadosSocio.GrupoNome+'_'+vgBoletoDados.ContaNossoNumero+'.PDF';
      end
      else
      begin
        vgBoletoDados.EnvioEmail := dtmControles.GetStr(' SELECT BOLETO_EMAIL FROM T_PESSOA WHERE PESSOA_ID = '+vgDadosSocio.PessoaGrupoId);
        if vgBoletoDados.EnvioEmail = 'S' then
              vgBoletoDados.CaminhoArquivo := vgBoletoDados.DiretorioPadrao+'\EMAIL\'+vgDadosSocio.GrupoNome+'_'+vgBoletoDados.ContaNossoNumero+'.PDF'
        else vgBoletoDados.CaminhoArquivo := vgBoletoDados.DiretorioPadrao+'\'+vgDadosSocio.GrupoNome+'_'+vgBoletoDados.ContaNossoNumero+'.PDF';
      end;

      dtmLookupBoleto.frxPDFExport1.FileName := vgBoletoDados.CaminhoArquivo;
    except
      ShowMessage(vgDadosSocio.GrupoNome);
    end;

    vlFiltrarCompromissoBoleto := True;
    frmGerenciadorRecebimento.frxReport1.PrintOptions.ShowDialog := False;
    if vlRelatorioInterno = 'N' then
      ExibirRelatorio(frxReport1, vlRelatorioId, dtmLookupBoleto.ParametrosRelatorio)
    else
    begin
      dtmLookupBoleto.ParametrosRelatorio;
      frxReport1.PrepareReport(True);
    end;
    vlFiltrarCompromissoBoleto := False;

    frxReport1.Export(dtmLookupBoleto.frxPDFExport1);
  end;

  procedure FinalizandoBoleto;
  begin
    // Gravando Boleto
    sqlAssociadoBoleto.First;
    vlCompromissos := '';
    While not sqlAssociadoBoleto.Eof do
    begin
      FiltrarCompromissoBoleto(sqlAssociadoBoleto.FieldByName('PESSOA_ID').AsString,'','');
      CapturarCompromissos;
      sqlAssociadoBoleto.Edit;
      sqlAssociadoBoleto.FieldByName('SELECIONADO').AsString := 'N';
      sqlAssociadoBoleto.post;
      IniciarIncrementarProgressBar(cxProgress, 1, True);
      sqlAssociadoBoleto.Next;
    end;

    if vlCompromissos = '' then
         exit
    else ExecutaSqlAuxiliar(' UPDATE T_COMPROMISSO_VENCIDO SET SELECIONADO = '+QuotedStr('N')+', '+
                            '                                  BOLETA_ID =' + vgBoletoDados.ContaNossoNumero+
                            ' WHERE COMPROMISSO_VENCIDO_ID IN ('+vlCompromissos+')',1);

    if vgBoletoDados.ExclusivoSys2FamiliaImprimir then
         GravarBoleta(vlCompromissos, '', vgDadosSocio.PessoaGrupoId)
    else GravarBoleta(vlCompromissos, vgDadosSocio.PessoaGrupoId, '');
    // ******
  end;

  procedure VerificarAjusteProgramado(vpPessoaId, vpGrupoId : String);
  var
    viSql : String;
  begin
    viSql := ' SELECT CT.DESCRICAO, P.NOME, LC.VALOR_ATUAL '+
             '  FROM T_PROGRAMACAO_AJUSTE PA LEFT OUTER JOIN T_COMPROMISSO_AGENDADO CA ON '+
             '   PA.COMPROMISSO_AGENDADO_ID = CA.COMPROMISSO_AGENDADO_ID '+
             '   LEFT OUTER JOIN T_CONTABIL_CONTA CT ON '+
             '   CA.CONTABIL_CONTA_ID = CT.CONTABIL_CONTA_ID '+
             '   LEFT OUTER JOIN T_PESSOA P ON ' +
             '   PA.PESSOA_ID = P.PESSOA_ID '+
             '   LEFT OUTER JOIN T_LANCAMENTO_COMPROMISSO LC ON '+
             '   CA.LANCAMENTO_COMPROMISSO_ID = LC.LANCAMENTO_COMPROMISSO_ID '+
             ' WHERE PA.SITUACAO = '+ QuotedStr('A')+
             '   AND ANO_MES = '+QuotedStr(dtmLookup.InclementarAnoMes(IntToStr(vgPeriodoAtual)));
    if vpPessoaId <> '' then
         viSql := viSql + ' AND PA.PESSOA_ID = '+ vpPessoaId
    else viSql := viSql + ' AND P.PESSOA_GRUPO_ID = '+ vpGrupoId;

    sqlAjusteProgramado.Active := False;
    sqlAjusteProgramado.SQL.Text := viSql;
    sqlAjusteProgramado.Active := True;
  end;

  procedure ArmazenarValoresPix;
  begin
    vgPIX.Identificacao                  := viNumBoleto.ToString;
    vgPIX.Valor                          := vgBoletoDados.ContaValorBoleto;
    vgPIX.Texto                          := GerarCodigoPIX;
    vgBoletoDados.PixTexto               := vgPIX.Texto;
  end;

  procedure VerificaDadosPix;
  var
    viChavePix : String;
  begin
    sqlAssociadoBoleto.Filtered := False;
    sqlAssociadoBoleto.Filter   := 'FATURA_TIPO = ''P''';
    sqlAssociadoBoleto.Filtered := True;

    if not sqlAssociadoBoleto.IsEmpty then
    begin
       viChavePix := vgPIX.ChavePix;
       repeat
         if not (InputQuery('Chave PIX', 'Informe a Chave PIX', viChavePix)) then
           Abort;
       until (viChavePix <> '');

       ExecutaSqlAuxiliar('UPDATE T_CEDENTE SET PIX_CHAVE = '+QuotedStr(viChavePix),1);
       vgPIX.ChavePix := viChavePix;

//      if (trim(vgPIX.CedenteNome) = '') or (trim(vgPIX.ChavePix) = '') then
{      if (trim(vgPIX.ChavePix) = '') then
      begin
        sqlAssociadoBoleto.Filtered := False;
        Application.MessageBox('Favor configurar as informa��es do PIX em CADASTRO DE CEDENTE!!!','Aviso', MB_OK + MB_ICONINFORMATION);
        abort;
      end;}
    end;
  end;

begin
  VerificarPreenchimentoDTA_TX(edtDataVencimento.Text, ' Data de Vencimento',edtDataVencimento);

  if Application.MessageBox('Confirma Gera��o da(s) Fatura(s) do(s) Irm�o(s) Selecionado(s)?',
      'Confirma��o', MB_YESNO) = IDNO then
      exit;

  // *** Imprimir Primeiro os Grupos ***
  if lcxGrupoAssociado.EditValue = null then
       FiltrarAssociadoBoleto('','')
  else FiltrarAssociadoBoleto('', IntToStr(lcxGrupoAssociado.EditValue));

  VerificaDadosPix;

  dtmLookup.CarregarCabecalho(vgBalancetePrincipal);
  pnlImpressao.Visible := true;
  pnlImpressao.Caption := 'Boleto(s) Grupo de Associados...';

  sqlAssociadoBoleto.Filtered := False;
  sqlAssociadoBoleto.Filter   := '(NOT PESSOA_GRUPO_ID IS NULL)';
  sqlAssociadoBoleto.Filtered := True;


  IniciarIncrementarProgressBar(cxProgress, sqlAssociadoBoleto.RecordCount);
  Screen.Cursor := crSQLWait;
  sqlAssociadoBoleto.First;

  viSql := ' SELECT CD.CONFIG_RELATORIO_ID, CR.RELATORIO, CR.INTERNO '+
           ' FROM T_CEDENTE CD LEFT OUTER JOIN G_CONFIG_RELATORIO CR ON '+
           '   CD.CONFIG_RELATORIO_ID = CR.CONFIG_RELATORIO_ID '+
           ' WHERE CD.CEDENTE_ID = '+ IntToStr(vgCedenteAtivo);
  ExecutaSqlAuxiliar(viSql , 0);
  vlRelatorioBoleto := dtmControles.sqlAuxiliar.FieldByName('RELATORIO').AsString;
  vlRelatorioId     := dtmControles.sqlAuxiliar.FieldByName('CONFIG_RELATORIO_ID').AsString;
  vlRelatorioInterno:= dtmControles.sqlAuxiliar.FieldByName('INTERNO').AsString;

  if vlRelatorioInterno = 'S' then
    CarregaRelatorio(vlRelatorioId, vlRelatorioBoleto, frxReport1);

  vgCodigoBarra      := TCodigoBarras.Create;
  viQtd              := 0;
  viNumBoleto        := 0;
  vlBoletoVisualizar := '';
  vlBoletoAssociado  := 0;

  While not sqlAssociadoBoleto.Eof do
  begin
    dtmLookupBoleto.ACBrBoleto1.ListadeBoletos.Clear;
    FiltrarCompromissoBoleto(sqlAssociadoBoleto.FieldByName('PESSOA_ID').AsString,'','');

    vgBoletoDados.ExclusivoSys2FamiliaImprimir  := True;
    vgBoletoDados.ContaNossoNumero              := dtmControles.GerarSequencia('T_BOLETA'+IntToStr(vgCedenteAtivo));

    vgDadosSocio.PessoaId       := sqlAssociadoBoleto.FieldByName('PESSOA_ID').AsString;
    vgDadosSocio.PessoaGrupoId  := sqlAssociadoBoleto.FieldByName('PESSOA_GRUPO_ID').AsString;
    vgDadosSocio.GrupoNome      := dtmControles.GetStr('SELECT DESCRICAO FROM T_PESSOA_GRUPO WHERE PESSOA_GRUPO_ID = '+vgDadosSocio.PessoaGrupoId);
    vgBoletoDados.FaturaTipo    := sqlAssociadoBoleto.FieldByName('FATURA_TIPO').AsString;

    sqlAssociadoBoleto.Filtered := False;
    sqlAssociadoBoleto.Filter   := 'PESSOA_GRUPO_ID = '+vgDadosSocio.PessoaGrupoId;
    sqlAssociadoBoleto.Filtered := True;

    vlGrupoAssociado := sqlAssociadoBoleto.FieldByName('NOME').AsString;
    vlGrupoCPF       := sqlAssociadoBoleto.FieldByName('CPF').AsString;

    CarregarDadosBoletaACBR(sqlAssociadoBoleto.FieldByName('PESSOA_GRUPO_ID').AsString, vgBoletoDados.ContaNossoNumero, edtDataVencimento.Text, True);

    // Verifica Programa��o de Ajuste de Compromisso
    VerificarAjusteProgramado('', vgDadosSocio.PessoaGrupoId);

    dtmLookupBoleto.CriarTitulo;

    if vgBoletoDados.ContaValorDoc > 0 then
    begin
      Inc(viQtd);
      viNumBoleto := StrToInt(vgBoletoDados.ContaNossoNumero);

      ArmazenarValoresPix;
      GravandoArquivoExportando;
    end;

    FinalizandoBoleto;
    dtmLookupBoleto.ACBrBoleto1.ListadeBoletos.Clear;
    try
      vgTitulo.ACBrBoleto.ListadeBoletos.Clear;
    except
    end;

    sqlAssociadoBoleto.Filtered := False;
    sqlAssociadoBoleto.Filter   := '(NOT PESSOA_GRUPO_ID IS NULL) AND (SELECIONADO = ''S'')';
    sqlAssociadoBoleto.Filtered := True;
  end;

  if lcxGrupoAssociado.EditValue = null then
  begin
    // *** Imprimir os Associados
    sqlAssociadoBoleto.Filtered := False;
    sqlAssociadoBoleto.Filter   := 'SELECIONADO = ''S''';
    sqlAssociadoBoleto.Filtered := True;

    pnlImpressao.Visible := true;
    pnlImpressao.Caption := 'Boleto(s) do(s) associado(s)...';

    IniciarIncrementarProgressBar(cxProgress, sqlAssociadoBoleto.RecordCount);
  end; // End Temporario.

  vgBoletoDados.ExclusivoSys2FamiliaImprimir := False;
  vgBoletoDados.ContaValorBoleto    := 0;

  sqlAssociadoBoleto.First;
  dtmLookupBoleto.ConfiguraComponenteAcBr;

  While not sqlAssociadoBoleto.Eof do
  begin
    dtmLookupBoleto.ACBrBoleto1.ListadeBoletos.Clear;

    FiltrarCompromissoBoleto(sqlAssociadoBoleto.FieldByName('PESSOA_ID').AsString,'','');

    vgDadosSocio.GrupoNome         := sqlAssociadoBoleto.FieldByName('NOME').AsString;
    vgDadosSocio.PessoaGrupoId     := sqlAssociadoBoleto.FieldByName('PESSOA_ID').AsString;
    vgBoletoDados.FaturaTipo       := sqlAssociadoBoleto.FieldByName('FATURA_TIPO').AsString;
    vgBoletoDados.ContaValorBoleto := dtmControles.GetFloat(' SELECT SUM(CV.VALOR_ATUAL) '+
                                                       ' FROM T_COMPROMISSO_VENCIDO CV LEFT OUTER JOIN T_PESSOA P '+
                                                       '   ON CV.PESSOA_ID = P.PESSOA_ID ' +
                                                       ' WHERE CV.SELECIONADO = ''S'''+
                                                       '   AND CV.SITUACAO = ''1'''+
                                                       '   AND P.PESSOA_ID = '+sqlAssociadoBoleto.FieldByName('PESSOA_ID').AsString);
    sqlAssociadoBoleto.Filtered := False;
    sqlAssociadoBoleto.Filter   := 'PESSOA_ID = '+vgDadosSocio.PessoaGrupoId;
    sqlAssociadoBoleto.Filtered := True;

    if vgBoletoDados.ContaValorBoleto > 0 then
    begin
      Inc(viQtd);
      vgBoletoDados.ContaNossoNumero := dtmControles.GerarSequencia('T_BOLETA'+IntToStr(vgCedenteAtivo));
      viNumBoleto       := StrToInt(vgBoletoDados.ContaNossoNumero);
      vlBoletoAssociado := StrToInt(vgDadosSocio.PessoaGrupoId);

      CarregarDadosBoletaACBR(sqlAssociadoBoleto.FieldByName('PESSOA_ID').AsString, vgBoletoDados.ContaNossoNumero, edtDataVencimento.Text);

      // Verifica Programa��o de Ajuste de Compromisso
      VerificarAjusteProgramado(vgDadosSocio.PessoaGrupoId, '');

      dtmLookupBoleto.CriarTitulo;
//      dtmLookupBoleto.ParametrosRelatorio;

      ArmazenarValoresPix;
      GravandoArquivoExportando;
    end;
    FinalizandoBoleto;
    dtmLookupBoleto.ACBrBoleto1.ListadeBoletos.Clear;
    try
      vgTitulo.ACBrBoleto.ListadeBoletos.Clear;
    except
    end;

    sqlAssociadoBoleto.Filtered := False;
    sqlAssociadoBoleto.Filter   := 'SELECIONADO = ''S''';
    sqlAssociadoBoleto.Filtered := True;
  end;

  sqlAssociadoBoleto.Filtered := False;
  sqlAssociadosAtivos.Refresh;
  CarregarCompromissosVencidos;
  Screen.Cursor := crDefault;

  pnlImpressao.Visible := False;
  vgCodigoBarra.Destroy;
  btnGerarRemessa.Enabled := dtmLookupBoleto.VerificarGerarRemessa;

  if viQtd > 0 then
  begin
    if viQtd = 1 then
    begin
      if lcxGrupoAssociado.editValue <> null then
        sqlCompromissos.Refresh;

      if Application.MessageBox('Visualizar Fatura?',
        'Confirma��o', MB_YESNO) = IDNO then
        exit;
      vlBoletoVisualizar := vgBoletoDados.ContaNossoNumero;
      if lcxGrupoAssociado.EditValue = null then
        sqlAssociadosAtivos.Locate('PESSOA_ID', vlBoletoAssociado, [loCaseInsensitive]);
      popBoletaVisualizarClick(self);
    end
    else
    begin
      vgBoletoDados.ContaNossoNumero := '';
      ShowMessage('FATURA(S) GERADA(S) = '+ IntToStr(viQtd));
    end;
    vgBoletoDados.ValorMedioBoleto := CalcularValorMediaBoleto;

  end
  else ShowMessage('NENHUMA FATURA GERADA!!!');
end;

procedure TfrmGerenciadorRecebimento.btnEditarCompromissosClick(
  Sender: TObject);
begin
  vgPessoaSelecionadaId := sqlCompromissosPESSOA_ID.AsInteger;
  if (vgPessoaSelecionadaId = 0) and (lcxGrupoAssociado.EditValue = null) then
    vgPessoaSelecionadaId := sqlAssociadosAtivos.FieldByName('PESSOA_ID').AsInteger;

  if lcxGrupoAssociado.EditValue <> null then
       vgGrupoSelecionadoId := sqlAssociadosAtivos.FieldByName('PESSOA_GRUPO_ID').AsInteger
  else vgGrupoSelecionadoId := 0;
  CadPesquisaPessoa;
end;

procedure TfrmGerenciadorRecebimento.btnEnviarReciboClick(Sender: TObject);
begin
  sqlReciboAgrupado.DisableControls;
  sqlReciboAgrupado.First;
  vgBoleto.Selecao := '';
  while not sqlReciboAgrupado.eof do
  begin
    if sqlReciboAgrupadoCALC_EMAIL.AsString = 'A' then
    begin
      if vgBoleto.Selecao = '' then
           vgBoleto.Selecao := sqlReciboAgrupadoRECIBO_NUMERO.AsString
      else vgBoleto.Selecao := vgBoleto.Selecao + ', '+ sqlReciboAgrupadoRECIBO_NUMERO.AsString;
    end;
    sqlReciboAgrupado.Next;
  end;
  sqlReciboAgrupado.First;
  sqlReciboAgrupado.EnableControls;

  if vgBoleto.Selecao = '' then
  begin
    Application.MessageBox('Nenhum recibo aguardando pra ser encaminhado!!!','Aviso', MB_OK + MB_ICONINFORMATION);
    exit;
  end;

  vgEmailConfig.Tabela := 'T_EMAIL_CONFIG';
  vgEnviarEmail := True;
  vgEmailBoleto := False;
  vgEmailTipo   := 'R';
  ExibirFormulario(TfrmCadEnvioEmail, frmCadEnvioEmail, True);

  if vgEmailEncaminhado then
    btnPesquisarRecibosClick(self);

end;

procedure TfrmGerenciadorRecebimento.btnEstornarReciboClick(Sender: TObject);
var
  viComplemento : String;
begin
  dtmLookup.VerificarEdicao(sqlCompromissoRealizadoANO_MES_REALIZADO.AsString, 'Estorno');

  if sqlCompromissoRealizadoPESSOA_ID.IsNull then
       viComplemento := #13+#13+' >> Os Itens deste recibo ser�o exclu�dos!!!'
  else viComplemento := '';

  if Application.MessageBox(Pchar('Estornar Registro Selecionado?'+viComplemento),
      'Confirma��o', MB_YESNO) = IDNO then
    exit;

  if (LiberarPermissaoUsuario('ESP_CANCELAR_BOLETOS')[6] = '0') then
    exit;

   if sqlCompromissoRealizadoPESSOA_ID.IsNull then
     ExecutaSqlAuxiliar(' DELETE FROM T_COMPROMISSO_VENCIDO '+
                        ' WHERE RECIBO_NUMERO = '+ sqlCompromissoRealizadoRECIBO_NUMERO.AsString+
                        '   AND TIPO_OPERACAO = ''C'''+
                        '   AND CEDENTE_ID = '+ IntToStr(vgCedenteAtivo),1)
   else
   begin
     // Estorna Compromissos
     ExecutaSqlAuxiliar(' UPDATE T_COMPROMISSO_VENCIDO SET DATA_REALIZACAO = NULL,' +
                        '                            DESCRICAO   = NULL, '+
                        '                          RECIBO_NUMERO = NULL, '+
                        '                    ANO_MES_REALIZADO   = NULL, '+
                        '                           SITUACAO = ''1'''+
                        ' WHERE CEDENTE_ID = '+IntToStr(vgCedenteAtivo)+
                        '   AND RECIBO_NUMERO = '+ sqlCompromissoRealizadoRECIBO_NUMERO.AsString,1);

     // Exclui a Multa gerada
     ExecutaSqlAuxiliar(' DELETE FROM T_COMPROMISSO_VENCIDO ' +
                        ' WHERE RECIBO_MULTA_ID = '+sqlCompromissoRealizadoRECIBO_NUMERO.AsString+
                        '   AND CEDENTE_ID = '+IntToStr(vgCedenteAtivo),1);

   end;

   // Exclui do Caixa
   ExecutaSqlAuxiliar(' DELETE FROM J_LIVRO_CAIXA '+
                      ' WHERE DOCUMENTO_NUMERO = '+ QuotedStr(sqlCompromissoRealizadoRECIBO_NUMERO.AsString)+
                      '   AND DOC_TIPO = ''ER''',1);

   btnEstornarRecibo.Enabled := sqlCompromissoRealizado.RecordCount > 0;
   sqlCompromissoRealizado.Refresh;
   CarregarCompromissosVencidos;
end;

procedure TfrmGerenciadorRecebimento.btnGerarRemessaClick(Sender: TObject);
var
  viTam, viPessoaId: Integer;
  viBoleto: TArrayOfBoleto;
  viRetornoRemessa: TRetornoGerouRemessa;

begin
  CarregarDadosBanco(1);

  with dtmLookupBoleto do
  begin
    sqlRemessa.Refresh;
    if sqlRemessa.IsEmpty then
    begin
      Application.MessageBox('N�o existe informa��es para gerar arquivo de remessa! ','Aviso', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;

    viTam := 0;
    sqlRemessa.First;
    while not sqlRemessa.Eof do
    begin

      if sqlRemessaPESSOA_ID.AsInteger > 0 then
      begin
        viPessoaId := sqlRemessaPESSOA_ID.AsInteger;
        CarregarDadosSocio(IntToStr(viPessoaId));
      end
      else
      begin
        viPessoaId := sqlRemessaPESSOA_GRUPO_ID.AsInteger;
        CarregarDadosSocio(IntToStr(viPessoaId), True);
      end;

      SetLength(viBoleto, viTam + 1);
      viBoleto[viTam].nomeSacado := RemoveAcentoECedilha(vgBoletoDados.SacadoNome);
      viBoleto[viTam].CNPJCPF    := vgBoletoDados.SacadoCNPJCPF;

      viBoleto[viTam].Logradouro := vgBoletoDados.SacadoLogradouro;
      viBoleto[viTam].Numero     := vgBoletoDados.SacadoNumero;
      viBoleto[viTam].Cidade     := vgBoletoDados.SacadoCidade;
      viBoleto[viTam].Bairro     := vgBoletoDados.SacadoBairro;
      viBoleto[viTam].UF         := vgBoletoDados.SacadoUF;
      viBoleto[viTam].CEP        := vgBoletoDados.SacadoCEP;;

      viBoleto[viTam].valorDocumento    := sqlRemessaVALOR.AsFloat;
      viBoleto[viTam].numeroDocumento   := IntToStr(viPessoaId);
      viBoleto[viTam].nossoNumero       := sqlRemessaBOLETA_ID.AsString;
      viBoleto[viTam].dataDocumento     := sqlRemessaDATA_EMISSAO.AsDateTime;
      viBoleto[viTam].vencimento        := sqlRemessaDATA_VENCIMENTO.AsDateTime;
      viBoleto[viTam].especieDoc        := 'DM';
      viBoleto[viTam].Aceite            := 'N';
      viBoleto[viTam].DataProcessamento := Date;
      viBoleto[viTam].Carteira          := vgBoletoDados.ContaCarteira;

      viBoleto[viTam].Parcela           := 1;
      viBoleto[viTam].TotalParcelas     := 1;
      viBoleto[viTam].DataDesconto      := sqlRemessaDATA_VENCIMENTO.AsDateTime;
      viBoleto[viTam].DataMoraJuros     := 0;
      viBoleto[viTam].ValorDesconto     := 0;
      viBoleto[viTam].dataDesconto      := sqlRemessaDATA_VENCIMENTO.AsDateTime;
      viBoleto[viTam].ValorMoraJuros    := 0;
      viBoleto[viTam].PercentualMulta   := 0;
      viBoleto[viTam].situacao          := sqlRemessaREMESSA_SITUACAO.AsString;
      Inc(viTam);
      sqlRemessa.Next;
    end;
  end;

  viRetornoRemessa := dtmLookupFinanceiro.GerarRemessa(0,0, viBoleto);
  if not viRetornoRemessa.gerouRemessa then
  begin
    Application.MessageBox('Falha ao gerar arquivo remessa!', 'Falha', MB_OK + MB_ICONWARNING);
    Exit;
  end;

  RegistrarArquivoRetorno('1', dtmLookupBoleto.ACBrBoleto1.NomeArqRemessa,0, dtmLookupBoleto.sqlRemessa.RecordCount,0,0,viRetornoRemessa.remessaId);
  ExecutaSqlAuxiliar('update T_BOLETA set REMESSA_ID = ' + IntToStr(viRetornoRemessa.remessaId) +','+
                     '                    REMESSA_SITUACAO = NULL '+
                     'where NOT REMESSA_SITUACAO IS NULL', 1);

  dtmLookupBoleto.sqlRemessa.Refresh;
  btnGerarRemessa.Enabled := dtmLookupBoleto.VerificarGerarRemessa;
  Application.MessageBox(Pchar('Remessa gerada com sucesso!!!'+#13+#13+
                               'Arquivo em: '+dtmLookupBoleto.ACBrBoleto1.DirArqRemessa+
                                dtmLookupBoleto.ACBrBoleto1.NomeArqRemessa),'Informa��o', MB_ICONINFORMATION + MB_OK);

end;

procedure TfrmGerenciadorRecebimento.btnImprimirClick(Sender: TObject);
begin
  vgRelatorioTitulo := 'Boletos '+ icxSituacaoBoleto.Text;
  ExibirFormulario(TfrmTituloRelatorio, frmTituloRelatorio, True);

  if vgRelatorioImprimir then
  begin
    dtmLookup.dxComponentPrinter.CurrentLink.Component := cxGridBoletosPagos;
    dtmLookup.dxComponentPrinter.Preview;
  end;
end;

procedure TfrmGerenciadorRecebimento.btnMarcarClick(Sender: TObject);
var
  viCompromisso : string;
begin
  if lcxCompromissos.EditValue <> null then
       viCompromisso := IntToStr(lcxCompromissos.EditValue)
  else viCompromisso := '';

  if rdbMarcar.Checked then
       MarcarDesmarcarCompromissos('S', viCompromisso, cbxMes.EditValue)
  else MarcarDesmarcarCompromissos('N', viCompromisso, cbxMes.EditValue);
  sqlCompromissos.Cancel;
  sqlCompromissos.Refresh;
end;

procedure TfrmGerenciadorRecebimento.btnPesquisarBoletoClick(Sender: TObject);
begin
  VerificarPreenchimentoEDT_TX(edtNossoNumero.Text, 'Nosso N�mero',edtNossoNumero);

  ExecutaSimpleDSAux(' SELECT BOLETA_ID, DATA_PAGAMENTO, SITUACAO, ' +
                      '        VALOR, ANO_MES_BOLETO, DATA_VENCIMENTO, DATA_CANCELADO ' +
                      ' FROM T_BOLETA ' +
                      ' WHERE BOLETA_ID = '+ IntToStr(edtNossoNumero.EditingValue),0);
  if dtmControles.SimpleAuxiliar.IsEmpty then
  begin
    Application.MessageBox('N�mero da Fatura n�o encontrado!!!','Informa��o', MB_ICONINFORMATION + MB_OK);
    edtNossoNumero.SetFocus;
    exit;
  end
  else
  begin
    with dtmControles.SimpleAuxiliar do
    begin
      if FieldByName('SITUACAO').AsString = '3' then
      begin
        Application.MessageBox(Pchar(' Fatura Cancelada!!!'+#13+#13+
                                     ' >> A Fatura foi canceladA em '+ FieldByName('DATA_CANCELADO').AsString+'.'),
                                      'Informa��o', MB_ICONINFORMATION + MB_OK);
        edtNossoNumero.SetFocus;
        edtNossoNumero.SelectAll;
        exit;
      end;

      if FieldByName('SITUACAO').AsString = '2' then
      begin
        Application.MessageBox(Pchar(' Fatura j� RegistradA!!!'+#13+#13+
                                     ' >> A Fatura foi registrada em '+ FieldByName('DATA_PAGAMENTO').AsString+'.'),
                                      'Informa��o', MB_ICONINFORMATION + MB_OK);
        edtNossoNumero.SetFocus;
        edtNossoNumero.SelectAll;
        exit;
      end;

      edtMesReferencia.EditValue    := dtmLookup.FormatarAnoMes( FieldByName('ANO_MES_BOLETO').AsString);
      HabilitarBotoesRegistrar(False);
      edtDataRecebimento.SetFocus;

      sqlRegistrarCompromissos.Active := False;
      sqlRegistrarCompromissos.ParamByName('BOLETA_ID').AsBCD := FieldByName('BOLETA_ID').AsCurrency;
      sqlRegistrarCompromissos.Active := True;

      vlBoletoVencimento := dtmControles.SimpleAuxiliar.FieldByName('DATA_VENCIMENTO').AsDateTime;
    end;
  end;

  cxGridDBRegistroBoleto.DataController.Groups.FullExpand;
end;

procedure TfrmGerenciadorRecebimento.btnRecebimentoReciboClick(Sender: TObject);
var
  viFlag : Boolean;
  viSql, viPessoaMulta : string;
begin
  sqlCompromissos.DisableControls;
  sqlCompromissos.first;
  viFlag := False;

  while not sqlCompromissos.eof do
  begin
    if sqlCompromissosSELECIONADO.AsString = 'S' then
    begin
      viFlag := True;
      break;
    end;
    sqlCompromissos.next;
  end;
  sqlCompromissos.EnableControls;

  if not viFlag then
  begin
    Application.MessageBox('Nenhum Compromisso Selecionado!!!','Informa��o', MB_ICONINFORMATION + MB_OK);
    exit;
  end;

  dtmLookup.CarregarCabecalho(vgBalancetePrincipal);
  vgDadosConfirmacao.Saida := False;
  ExibirFormulario(TfrmConfirmacaoRecibo, frmConfirmacaoRecibo, True);
  if not vgDadosConfirmacao.Confirmado then
    exit;

  if lcxGrupoAssociado.EditValue <> null then
       FiltrarAssociadoBoleto('', IntToStr(lcxGrupoAssociado.EditValue),True)
  else FiltrarAssociadoBoleto(sqlAssociadosAtivos.FieldByName('PESSOA_ID').AsString, '', True);

  vgReciboNaoAssociadoId     := 0;
  frxReportNAoAss.PrintOptions.ShowDialog := True;
  frxReportNAoAss.PrintOptions.Copies     := vgDadosConfirmacao.Qtd;
  vgBoletoDados.ContaNossoNumero          := dtmControles.GerarSequencia('RECIBO_NUMERO'+IntToStr(vgCedenteAtivo));
  vlFiltrarCompromissoBoleto              := True;
  ExibirRelatorio(frxReportNAoAss , '2', ParametrosRelatorioRecibo, True, frxReportNAoAss.PrintOptions.Printer);
  vlFiltrarCompromissoBoleto := False;

  if lcxGrupoAssociado.EditValue <> null then
       FiltrarCompromissoBoleto('',IntToStr(lcxGrupoAssociado.EditValue),'')
  else FiltrarCompromissoBoleto(sqlAssociadosAtivos.FieldByName('PESSOA_ID').AsString,'','');

  vlCompromissos := '';
  CapturarCompromissos;
  if vlCompromissos = '' then
    exit;

  ExecutaSqlAuxiliar(' UPDATE T_COMPROMISSO_VENCIDO SET SELECIONADO = '+QuotedStr('N')+', '+
                     '                                RECIBO_NUMERO =' + vgBoletoDados.ContaNossoNumero+
                     ' WHERE COMPROMISSO_VENCIDO_ID IN ('+vlCompromissos+')',1);

  viSql := ' SELECT COMPROMISSO_VENCIDO_ID, SITUACAO, DATA_REALIZACAO, DESCRICAO, PESSOA_NOME, '+
           '        PESSOA_ID, CONTABIL_CONTA_ID, ANO_MES_REALIZADO, QUITADO_GRUPO_ID '+
           ' FROM T_COMPROMISSO_VENCIDO '+
           ' WHERE RECIBO_NUMERO = '+ vgBoletoDados.ContaNossoNumero;

  ExecutaSimpleDSAux(viSql, 0);
  With dtmControles.SimpleAuxiliar do
  begin
    First;
    while not eof do
    begin
      edit;
      FieldByName('SITUACAO').AsString          := '2';
      FieldByName('DATA_REALIZACAO').AsDateTime := vgDadosConfirmacao.Data;
      FieldByName('PESSOA_NOME').AsString       := dtmControles.GetStr(' SELECT NOME FROM T_PESSOA WHERE PESSOA_ID = ' +FieldByName('PESSOA_ID').AsString);
      FieldByName('ANO_MES_REALIZADO').AsInteger:= dtmLookup.PegarAnoMes(DateToStr(vgDadosConfirmacao.Data));

      if lcxGrupoAssociado.EditValue <> null then
        FieldByName('QUITADO_GRUPO_ID').AsCurrency := lcxGrupoAssociado.EditValue;

      FieldByName('ANO_MES_REALIZADO').AsInteger:= dtmLookup.PegarAnoMes(DateToStr(vgDadosConfirmacao.Data));
      FieldByName('DESCRICAO').AsString         := FieldByName('PESSOA_NOME').AsString+ ' - ' +
                                                   dtmControles.GetStr(' SELECT DESCRICAO FROM T_CONTABIL_CONTA WHERE CONTABIL_CONTA_ID = ' +FieldByName('CONTABIL_CONTA_ID').AsString);
      post;
      next;
    end;
  end;
  dtmLookupContabil.CarregarRegistrarLivroCaixa(vgBoletoDados.ContaNossoNumero, 'RECIBO_NUMERO', vgDadosConfirmacao.Especie,
                                                vgDadosConfirmacao.Observacao, lcxGrupoAssociado.Text, vgDadosConfirmacao.CaixaId,0,0,0);
  if vgDadosConfirmacao.ReciboEmail then
    ExecutaSqlAuxiliar(' UPDATE T_COMPROMISSO_VENCIDO SET EMAIL_ENCAMINHAR = '+QuotedStr('A')+
                       ' WHERE RECIBO_NUMERO = '+ vgBoletoDados.ContaNossoNumero,1);
  CarregarCompromissosVencidos;
end;

procedure TfrmGerenciadorRecebimento.btnRegistrarBoletoClick(Sender: TObject);
  procedure ValidarDados;
  begin
    if vlCaixaBoletoId = 0 then
    begin
      Application.MessageBox(Pchar('Caixa de Lan�amento da Fatura n�o Configurado.'+#13+#13+
                                   'Configure o Caixa em "Cadastro de Cedente/Dados Banc�rios")'),'Informa��o', MB_ICONINFORMATION + MB_OK);
      exit;
    end;

    VerificarPreenchimentoDTA_TX(edtDataRecebimento.Text, 'Data da Entrada' , edtDataRecebimento);

    if (chxValorBoleta.Checked) and (edtValorBoleto.EditValue <=0) then
    begin
      Application.MessageBox('Valor da Fatura inv�lido !!!','Informa��o', MB_ICONINFORMATION + MB_OK);
      edtValorBoleto.SetFocus;
      exit;
    end;
    dtmLookup.VerificarEdicao(IntToStr(dtmLookup.PegarAnoMes(DateToStr(edtDataRecebimento.EditingValue))), 'Recebimento');
    dtmLookupContabil.VerificaAnoMesFechado(DateToStr(edtDataRecebimento.Date));
  end;

begin
  ValidarDados;

  if Application.MessageBox('Confirma Registro de Entrada da Fatura?',
      'Confirma��o', MB_YESNO) = IDNO then
  begin
    edtDataRecebimento.SetFocus;
    exit;
  end;

  RegistrarEntrada(sqlRegistrarCompromissosBOLETA_ID.AsInteger, edtDataRecebimento.Date);
  dtmLookupContabil.CarregarRegistrarLivroCaixa(sqlRegistrarCompromissosBOLETA_ID.AsString, 'BOLETA_ID', 'B', '',
                                                sqlRegistrarCompromissosGRUPO.AsString, vlCaixaBoletoId,0,0,0);

  sqlRegistrarCompromissos.Active := False;
  HabilitarBotoesRegistrar(True);
  sqlCompromissos.Refresh;

  icxSituacaoBoleto.EditValue := '2';
  btnPesquisarBoletosRegistradosClick(self);
  pgcBoletosRegistrados.ActivePageIndex := 0;

  edtNossoNumero.Clear;
  edtNossoNumero.SetFocus;
end;

procedure TfrmGerenciadorRecebimento.CAD_ENVIAR_EMAILExecute(Sender: TObject);
begin
  vgBoleto.EnviarEmail := 'S';
  vgEmailTipo := 'B';
  ExibirFormulario(TfrmSelecionarBoletoEnviar, frmSelecionarBoletoEnviar, true);
  if vgBoleto.Flag then
  begin
    if vgBoleto.Selecao = '' then
    begin
      Application.MessageBox('Nenhuma Fatura selecionado. Envio cancelado!!!','Informa��o', MB_ICONINFORMATION + MB_OK);
      exit;
    end;
  end
  else exit;

  vgEmailConfig.Tabela := 'T_EMAIL_CONFIG';
  vgEnviarEmail := True;
  vgEmailBoleto := True;
  ExibirFormulario(TfrmCadEnvioEmail, frmCadEnvioEmail, True);
end;

function TfrmGerenciadorRecebimento.CalcularValorMediaBoleto: Currency;
var
  viQtdBoleto : Integer;
begin
  if vgBoletoDados.CalcularMediaBoleto = 'S' then
  begin
    viQtdBoleto := dtmControles.GetInt(' SELECT COUNT(BOLETA_ID) FROM T_BOLETA '+
                                       ' WHERE ANO_MES_BOLETO = '+IntToStr(vgPeriodoAtual));

    Result := (vgBoletoDados.ValorTaxa/viQtdBoleto);
  end
  else Result := 0;
end;

procedure TfrmGerenciadorRecebimento.CapturarCompromissos;
begin
  sqlCompromissoBoleto.First;
  while not sqlCompromissoBoleto.Eof do
  begin
    if vlCompromissos = '' then
         vlCompromissos := sqlCompromissoBoleto.FieldByName('COMPROMISSO_VENCIDO_ID').AsString
    else vlCompromissos := vlCompromissos +','+ sqlCompromissoBoleto.FieldByName('COMPROMISSO_VENCIDO_ID').AsString;
    sqlCompromissoBoleto.Next;
  end;
end;

procedure TfrmGerenciadorRecebimento.CarregarCompromissosVencidos(vpIndex : Integer = 0);
var
  viSql, viComplemento, viComplemento2 : String;

  procedure MostrarAba;
  var i : Integer;
  begin
    ExecutaSqlAuxiliar(' SELECT DISTINCT(BOLETA_ID) '+ viComplemento+
                       '  AND NOT BOLETA_ID IS NULL',0);
    if not dtmControles.sqlAuxiliar.IsEmpty then
    begin
      i := 0;
      while not dtmControles.sqlAuxiliar.eof do
      begin
        if sqlAssociadosAtivos.FieldByName('PESSOA_GRUPO_ID').AsInteger = 0 then
             tabBoleto.Tabs.Add('B-' + dtmControles.sqlAuxiliar.FieldByName('BOLETA_ID').AsString)
        else tabBoleto.Tabs.Add('B-' + dtmControles.sqlAuxiliar.FieldByName('BOLETA_ID').AsString+ ' *Vinc. ao Grupo');
        try
          vlBoletoGerado[i] := dtmControles.sqlAuxiliar.FieldByName('BOLETA_ID').AsString;
        Except
        end;
        dtmControles.sqlAuxiliar.next;
        inc(i);
      end;
    end;
  end;

begin
  popMarcarDesmarcarGrupo.Enabled := not sqlAssociadosAtivos.FieldByName('PESSOA_GRUPO_ID').IsNull;

  if (vlNaoFiltrarCompromisso) then
    exit;

  if vpIndex = 0 then
    tabBoleto.Tabs.Clear;

  sqlCompromissos.Filtered := False;
  if lcxGrupoAssociado.EditValue = null then
  begin
    if sqlAssociadosAtivos.FieldByName('PESSOA_ID').AsString = '' then
    begin
      sqlCompromissos.Active := False;
      exit;
    end;

    viSql := ' SELECT * ';
    viComplemento := ' FROM T_COMPROMISSO_VENCIDO '+
                     ' WHERE SITUACAO = '+QuotedStr('1')+
                     '    AND TIPO_OPERACAO = '+QuotedStr('C')+
                     ' AND PESSOA_ID = '+sqlAssociadosAtivos.FieldByName('PESSOA_ID').AsString;
    viComplemento2 :=' ORDER BY ANO_MES_REFERENCIA, COMPROMISSO_VENCIDO_ID ';
    cxGridDBTableCompromissos.OptionsView.GroupFooters := gfInvisible;
    cxGridDBCompromissoPessoa.GroupIndex := 0
  end
  else
  begin
    if sqlAssociadosAtivos.FieldByName('PESSOA_GRUPO_ID').AsString = '' then
    begin
      sqlCompromissos.Active := False;
      exit;
    end;

    viSql := ' SELECT CV.* ';
    viComplemento := ' FROM T_COMPROMISSO_VENCIDO CV LEFT OUTER JOIN T_PESSOA P '+
                     '   ON CV.PESSOA_ID = P.PESSOA_ID '+
                     ' WHERE CV.SITUACAO = '+QuotedStr('1')+
                     '    AND CV.TIPO_OPERACAO = '+QuotedStr('C')+
                     ' AND P.PESSOA_GRUPO_ID = '+sqlAssociadosAtivos.FieldByName('PESSOA_GRUPO_ID').AsString;
    viComplemento2:= ' ORDER BY P.NOME, CV.ANO_MES_REFERENCIA, CV.COMPROMISSO_VENCIDO_ID ';
    cxGridDBTableCompromissos.OptionsView.GroupFooters := gfVisibleWhenExpanded;
    cxGridDBCompromissoPessoa.GroupIndex := 0;
  end;

  if vpIndex = 1 then
    viComplemento := viComplemento + ' AND NOT BOLETA_ID IS NULL '
  else
   if vpIndex > 1 then
     viComplemento := viComplemento + ' AND BOLETA_ID = ' +Copy(tabBoleto.Tabs.Tabs[tabBoleto.TabIndex].Caption,3,6);

  // Compromissos Realizados
  sqlCompromissos.Active := False;
  sqlCompromissos.SQL.Text := viSql + viComplemento + viComplemento2;
  sqlCompromissos.Active := True;

  if vpIndex = 0 then
    MostrarAba;
  cxGridDBTableCompromissos.DataController.Groups.FullExpand;
end;

procedure TfrmGerenciadorRecebimento.CarregarDadosBanco(vpTipoRegistro : Integer);
begin
  ExecutaSqlAuxiliar( 'SELECT * FROM T_CEDENTE WHERE CEDENTE_ID = '+IntToStr(vgCedenteAtivo),0);
  with dtmControles.sqlAuxiliar do
  begin
    vgPIX.ChavePix                       := FieldByName('PIX_CHAVE').AsString;
    vgPIX.Cidade                         := AnsiUpperCase(RemoveAcentos(FieldByName('END_CIDADE').AsString));
//    vgPIX.CedenteNome                    := AnsiUpperCase(RemoveAcentos(FieldByName('PIX_CEDENTE').AsString));

    vgBoletoDados.ValorTaxa              := FieldByName('DB_TAXA').AsCurrency;
    vgBoletoDados.ValorMulta             := FieldByName('DB_MULTA').AsCurrency;

    vgBoletoDados.CedenteModalidade      := FieldByName('DB_MODALIDADE').AsString;
    vgBoletoDados.CedenteAgenciaNumero   := FieldByName('DB_AGENCIA').AsString;
    vgBoletoDados.CedenteAgenciaDigito   := FieldByName('DB_DIGITOAGENCIA').AsString;
    vgBoletoDados.CedenteContaNumero     := FieldByName('DB_CONTA').AsString;
    vgBoletoDados.CedenteContaDigito     := FieldByName('DB_DIGITOCONTA').AsString;
    vgBoletoDados.CedenteCodigo          := FieldByName('DB_CODIGOCEDENTE').AsString + FieldByName('DB_DIGITOCODIGO_CEDENTE').AsString;
    vgBoletoDados.CedenteUF              := FieldByName('END_UF').AsString;
    vgBoletoDados.CedenteBairro          := FieldByName('END_BAIRRO').AsString;
    vgBoletoDados.CedenteCidade          := FieldByName('END_CIDADE').AsString;
    vgBoletoDados.CedenteCEP             := FieldByName('END_CEP').AsString;
    vgBoletoDados.CedenteLog             := FieldByName('END_LOG').AsString;
    vgBoletoDados.CedenteEmail           := FieldByName('END_EMAIL').AsString;
    vgBoletoDados.CedenteTelefone        := FieldByName('TELEFONE').AsString;
    vgBoletoDados.CedenteCPF             := FieldByName('CNPJ_CPF').AsString;
    vgBoletoDados.CedenteNome            := FieldByName('DESCRICAO').AsString;
    vgBoletoDados.EnderecoAssociado      := FieldByName('ENDERECO_NUCLEO_ASSOCIADO').AsString;

    vgBoletoDados.BancoNome              := FieldByName('DB_NOMEBANCO').AsString;
    vgBoletoDados.BancoNumero            := StrToInt(copy(FieldByName('DB_CODIGOBANCO').AsString,1,3));
    vgBoletoDados.BancoDigito            := StrToInt(copy(FieldByName('DB_CODIGOBANCO').AsString,5,1));

    vgBoletoDados.ContaCarteira            := FieldByName('DB_CARTEIRA').AsString;
    vgBoletoDados.ContaConvenio            := FieldByName('DB_CONVENIO').AsString;
    vgBoletoDados.CobrarMulta              := FieldByName('COBRAR_MULTA').AsString ;
    vgBoletoDados.CobrarBoleto             := FieldByName('COBRAR_BOLETO').AsString;
    vgBoletoDados.CalcularMediaBoleto      := FieldByName('DB_LANCAR_TAXAMEDIA_ASSOCIADO').AsString;
    vgBoletoDados.ReservaJurosId           := FieldByName('DB_RESERVA_JUROS_ID').AsInteger;
    vgBoletoDados.CobrarCompromissoMultaId := FieldByName('CONTABIL_CONTA_MULTA_ID').AsInteger;
    vgBoletoDados.CobrarCompromissoTaxaId  := FieldByName('CONTABIL_CONTA_TAXA_ID').AsInteger;
    vgBoletoDados.CompromissoJurosId       := FieldByName('CONTABIL_CONTA_JUROS_ID').AsInteger;
    vgBoletoDados.LayoutModelo             := FieldByName('LAYOUT_REMESSA').AsString;
    if vgBoletoDados.LayoutModelo = '' then
      vgBoletoDados.LayoutModelo := '1';

    if vgBoletoDados.LayoutModelo = '1' then
         dtmLookupBoleto.ACBrBoleto1.LayoutRemessa := c400
    else dtmLookupBoleto.ACBrBoleto1.LayoutRemessa := c240;

    vgBoletoDados.RegistroResumo := '';
    vgBoletoDados.RegistroTipo   := vpTipoRegistro;

    vgBoletoDados.ValorMedioBoleto := CalcularValorMediaBoleto;

    case vgBoletoDados.BancoNumero of
      001 : dtmLookupBoleto.ACBrBoleto1.Banco.TipoCobranca := cobBancoDoBrasil;
      341 : dtmLookupBoleto.ACBrBoleto1.Banco.TipoCobranca := cobItau;
      756 : dtmLookupBoleto.ACBrBoleto1.Banco.TipoCobranca := cobBancoob;
      237 : dtmLookupBoleto.ACBrBoleto1.Banco.TipoCobranca := cobBradesco;
    end;

  end;
end;

procedure TfrmGerenciadorRecebimento.CarregarDadosBoletaACBR(vpSocio, vpNossoNumero, vpDataVencimento : String;
      vpGrupo : Boolean = False);
var
  viSql, viDataInicio, viDataFim : string;

  procedure CarregarDividaRestante;
  var
    viValorDivida : Currency;
  begin
   // Soma o total de divida pendente
    viSql := ' SELECT SUM(CV.VALOR_ATUAL) '+
             ' FROM T_COMPROMISSO_VENCIDO CV LEFT OUTER JOIN T_PESSOA P '+
             '   ON CV.PESSOA_ID = P.PESSOA_ID ' +
             ' WHERE CV.SITUACAO = ''1''';
    if vgBoletoDados.ExclusivoSys2FamiliaImprimir then
         viSql := viSql + '   AND P.PESSOA_GRUPO_ID = '+vgDadosSocio.PessoaGrupoId
    else viSql := viSql + '   AND CV.PESSOA_ID = '+sqlAssociadoBoleto.FieldByName('PESSOA_ID').AsString;

    viValorDivida := dtmControles.GetFloat(viSql);
    vgBoletoDados.RegistroResumo := QuotedStr('>> Resumo:  *Valor do d�bito na Tesouraria = '+FormatFloat(',#0.00', viValorDivida)+
                                              '       *Valor deste boleto = '+FormatFloat(',#0.00', vgBoletoDados.ContaValorDoc)+
                                              '       *Valor do restante do d�bito = '+FormatFloat(',#0.00', viValorDivida-(vgBoletoDados.ContaValorDoc)));
  end;

begin
  if vgBoletoDados.ExclusivoSys2FamiliaImprimir then
    vgBoletoDados.ContaValorDoc := dtmControles.GetFloat(' SELECT SUM(CV.VALOR_ATUAL) '+
                                                       ' FROM T_COMPROMISSO_VENCIDO CV LEFT OUTER JOIN T_PESSOA P '+
                                                       '   ON CV.PESSOA_ID = P.PESSOA_ID ' +
                                                       ' WHERE CV.SELECIONADO = ''S'''+
                                                       '   AND CV.SITUACAO = ''1'''+
                                                       '   AND P.PESSOA_GRUPO_ID = '+vpSocio)
  else
    vgBoletoDados.ContaValorDoc := dtmControles.GetFloat(' SELECT SUM(CV.VALOR_ATUAL) '+
                                                       ' FROM T_COMPROMISSO_VENCIDO CV LEFT OUTER JOIN T_PESSOA P '+
                                                       '   ON CV.PESSOA_ID = P.PESSOA_ID ' +
                                                       ' WHERE CV.SELECIONADO = ''S'''+
                                                       '   AND CV.SITUACAO = ''1'''+
                                                       '   AND P.PESSOA_ID = '+vpSocio);

  vgBoletoDados.ContaNumeroDoc     := FormatFloat('00000', StrToInt(vpSocio));
  vgBoletoDados.ContaVencimento    := StrToDate(vpDataVencimento);
  vgBoletoDados.ContaDataOperacao  := Now;

  if chxCobrarBoleto.Checked and (vgBoletoDados.FaturaTipo = 'B') then
  begin
    if vgBoletoDados.CalcularMediaBoleto = 'S' then
         vgBoletoDados.ContaValorBoleto := vgBoletoDados.ContaValorDoc + vgBoletoDados.ValorMedioBoleto
    else vgBoletoDados.ContaValorBoleto := vgBoletoDados.ContaValorDoc + vgBoletoDados.ValorTaxa;
  end
  else vgBoletoDados.ContaValorBoleto := vgBoletoDados.ContaValorDoc;

  CarregarDadosSocio(vgDadosSocio.PessoaGrupoId, vpGrupo);

  // Exclusivo Tesouraria
  CarregarDividaRestante;

  MontarDataInicioFinal(edtDataVencimento.Text, viDataInicio, viDataFim,'/');
  if vlPrazoPagamento = '1' then
       vgBoletoDados.ExclusivoSys2PrazoPagamento := QuotedStr(DateToStr(StrToDate(viDataFim)-2))
  else vgBoletoDados.ExclusivoSys2PrazoPagamento := QuotedStr(vlPrazoDias+'/'+copy(DateToStr(StrToDate(viDataFim)),4,10));
end;

procedure TfrmGerenciadorRecebimento.CarregarDadosSocio(vpPessoaId : String;
   vpGrupo : Boolean = False);
var
  viDadosSocio : TStringList;
  viSql : String;
begin
  viSql := ' SELECT FIRST 1 NOME, CPF, ENDERECO, BAIRRO, CEP, CIDADE, UF FROM T_PESSOA ';
  if vpGrupo then
       viSql := viSql + ' WHERE PESSOA_GRUPO_ID = '+vpPessoaId
  else viSql := viSql + ' WHERE PESSOA_ID = '+vpPessoaId;

  viSql := viSql + ' ORDER BY PRINCIPAL DESC, GRAU DESC ';

  viDadosSocio := dtmControles.GetFields(viSql);

  vgBoletoDados.SacadoNome        := viDadosSocio.Values['NOME'];
  vgBoletoDados.SacadoCNPJCPF     := viDadosSocio.Values['CPF'];

  if vgBoletoDados.EnderecoAssociado <> 'S' then
  begin
    vgBoletoDados.SacadoLogradouro  := viDadosSocio.Values['ENDERECO'];
    vgBoletoDados.SacadoNumero      := '';
    vgBoletoDados.SacadoBairro      := viDadosSocio.Values['BAIRRO'];
    vgBoletoDados.SacadoCEP         := viDadosSocio.Values['CEP'];
    vgBoletoDados.SacadoCidade      := viDadosSocio.Values['CIDADE'];
    vgBoletoDados.SacadoUF          := viDadosSocio.Values['UF'];
  end
  else
  begin
    vgBoletoDados.SacadoLogradouro  := vgBoletoDados.CedenteLog;
    vgBoletoDados.SacadoNumero      := '';
    vgBoletoDados.SacadoBairro      := vgBoletoDados.CedenteBairro;
    vgBoletoDados.SacadoCEP         := vgBoletoDados.CedenteCEP;
    vgBoletoDados.SacadoCidade      := vgBoletoDados.CedenteCidade;
    vgBoletoDados.SacadoUF          := vgBoletoDados.CedenteUF;
  end;
end;

procedure TfrmGerenciadorRecebimento.CarregarMesReferencia(vpComboBox : TcxComboBox);
begin
  ExecutaSqlAuxiliar(' SELECT DISTINCT(ANO_MES_REFERENCIA) AS ANO_MES_REFERENCIA '+
                     ' FROM T_COMPROMISSO_VENCIDO '+
                     ' WHERE CEDENTE_ID = '+ IntToStr(vgCedenteAtivo),0);
  with dtmControles.sqlAuxiliar do
  begin
    First;
    vpComboBox.Properties.Items.Clear;
    while not Eof do
    begin
      vpComboBox.Properties.Items.Add(dtmLookup.FormatarAnoMes(FieldByName('ANO_MES_REFERENCIA').AsString));
      Next;
    end;
  end;
  vpComboBox.EditValue := dtmLookup.FormatarAnoMes(IntToStr(vgPeriodoAtual));
end;

procedure TfrmGerenciadorRecebimento.CarregarReferenciaMulta;
begin
  ExecutaSqlAuxiliar(' SELECT DISTINCT(ANO_MES_BOLETO) AS ANO_MES_BOLETO '+
                     ' FROM T_BOLETA '+
                     ' WHERE CEDENTE_ID = '+ IntToStr(vgCedenteAtivo)+
                     '   AND SITUACAO = '+ QuotedStr('1'),0);
  with dtmControles.sqlAuxiliar do
  begin
    First;
    cbxReferenciaMulta.Properties.Items.Clear;
    while not Eof do
    begin
      cbxReferenciaMulta.Properties.Items.Add(dtmLookup.FormatarAnoMes(FieldByName('ANO_MES_BOLETO').AsString));
      Next;
    end;
  end;
  cbxReferenciaMulta.ItemIndex := 0;
end;

procedure TfrmGerenciadorRecebimento.cbxBoletoRegMesFimPropertiesChange(
  Sender: TObject);
begin
  btnPesquisarBoletosRegistradosClick(self);
end;

procedure TfrmGerenciadorRecebimento.cbxBoletoRegMesIniPropertiesChange(
  Sender: TObject);
begin
  btnPesquisarBoletosRegistradosClick(self);
end;

procedure TfrmGerenciadorRecebimento.cdsRetornoBeforeEdit(DataSet: TDataSet);
begin
  if cdsRetornoSITUACAO.AsString <> '5' then
    Abort;
end;

procedure TfrmGerenciadorRecebimento.chxSelecaoMultiplaClick(Sender: TObject);
begin
  cxGridDBTableView2.OptionsSelection.MultiSelect := chxSelecaoMultipla.Checked;
end;

procedure TfrmGerenciadorRecebimento.chxTodosClick(Sender: TObject);
begin
  lcxCompromissos.Enabled := not chxTodos.Checked;
  lcxCompromissos.EditValue := Null;
end;

procedure TfrmGerenciadorRecebimento.chxValorBoletaClick(Sender: TObject);
begin
  edtValorBoleto.Enabled  := chxValorBoleta.Checked;
end;

procedure TfrmGerenciadorRecebimento.cxBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmGerenciadorRecebimento.btnReimprimirReciboClick(Sender: TObject);
var
  viSql, vlRelatorioRecibo, vlRelatorioId, viNomeRecibo  : string;
  viFlag, viLimpar : Boolean;
  viReciboAnterior : Integer;
begin

  if rdbReciboTodos.Checked then
  begin
    if Application.MessageBox('Confirma impress�o de todos os recibos do per�odo pesquisado?',
        'Confirma��o', MB_YESNO) = IDNO then
        exit
    else
    begin
      cxGridRealizado.Enabled := False;
      sqlCompromissoRealizado.DisableControls;
      pgcGerenciador.Enabled := False;

{      viNomeRecibo := '';
      repeat
        if not InputQuery('Nome Recibo', 'Digite o Nome do Recibo', viNomeRecibo) then
          Exit;
      until (viNomeRecibo <> '');}

      if not SaveDialog1.Execute then
        exit;

      dtmLookupBoleto.frxPDFExport1.FileName := SaveDialog1.FileName;
//      dtmLookupBoleto.frxPDFExport1.FileName := vgBoletoDados.DiretorioRecibo + viNomeRecibo+'.pdf';
      cxProgressRecibo.Visible := True;
      cxProgressRecibo.Refresh;
      Screen.Cursor := crSQLWait;
    end;
    viFlag   := False;
    viLimpar := True;
    viReciboAnterior := 0;
    sqlCompromissoRealizado.First;
  end
  else viFlag := True;

  if rdbReciboTodos.Checked then
       IniciarIncrementarProgressBar(cxProgressRecibo, sqlCompromissoRealizado.RecordCount)
  else IniciarIncrementarProgressBar(cxProgressRecibo, 1);

  while not sqlCompromissoRealizado.Eof do
  begin
    if rdbReciboTodos.Checked then
    begin
      if (sqlCompromissoRealizadoRECIBO_NUMERO.AsInteger = 0) or
         (viReciboAnterior = sqlCompromissoRealizadoRECIBO_NUMERO.AsInteger) then
      begin
        IniciarIncrementarProgressBar(cxProgressRecibo, 1, True);
        sqlCompromissoRealizado.Next;
        Continue
      end;
    end;

    vgCompromissoRealizado := True;
    if sqlCompromissoRealizadoPESSOA_ID.AsInteger > 0 then
    begin
      if sqlCompromissoRealizadoQUITADO_GRUPO_ID.AsInteger > 0 then
           FiltrarAssociadoBoleto('', sqlCompromissoRealizadoQUITADO_GRUPO_ID.AsString,True)
      else FiltrarAssociadoBoleto(sqlCompromissoRealizado.FieldByName('PESSOA_ID').AsString, '', True);
    end
    else vgReciboNaoAssociadoId := sqlCompromissoRealizadoRECIBO_NUMERO.AsInteger;

    FiltrarCompromissoBoleto('','',sqlCompromissoRealizadoRECIBO_NUMERO.AsString);
    vgDadosConfirmacao.data    := sqlCompromissoRealizadoDATA_REALIZACAO.AsDateTime;
    vlFiltrarCompromissoBoleto := True;

    if rdbReciboTodos.Checked then
    begin
      dtmLookup.CarregarCabecalho(vgBalancetePrincipal);
      if sqlCompromissoRealizadoPESSOA_ID.AsInteger > 0 then
           vlRelatorioId := '2'
      else vlRelatorioId := '3';

      viSql := ' SELECT RELATORIO '+
               ' FROM G_CONFIG_RELATORIO '+
               ' WHERE CONFIG_RELATORIO_ID = '+vlRelatorioId;

      ExecutaSqlAuxiliar(viSql , 0);
      vlRelatorioRecibo := dtmControles.sqlAuxiliar.FieldByName('RELATORIO').AsString;
      CarregaRelatorio(vlRelatorioId, vlRelatorioRecibo, frxReportNAoAss);

      ParametrosRelatorioRecibo;
      frxReportNAoAss.PrepareReport(viLimpar);
      viLimpar := False;

      frxReportNAoAss.Export(dtmLookupBoleto.frxPDFExport1);
      viReciboAnterior := sqlCompromissoRealizadoRECIBO_NUMERO.AsInteger;
    end
    else
    begin
      frxReportNAoAss.PrintOptions.Copies := 1;
      frxReportNAoAss.PrintOptions.ShowDialog := True;

      dtmLookup.CarregarCabecalho(vgBalancetePrincipal);
      if sqlCompromissoRealizadoPESSOA_ID.AsInteger > 0 then
           ExibirRelatorio(frxReportNAoAss, '2', ParametrosRelatorioRecibo, True, frxReportNAoAss.PrintOptions.Printer)
      else ExibirRelatorio(frxReportNAoAss, '3', ParametrosRelatorioRecibo, True, frxReportNAoAss.PrintOptions.Printer);
    end;

    IniciarIncrementarProgressBar(cxProgressRecibo, 1, True);
    if rdbReciboSelecionado.Checked then
    begin
      vlFiltrarCompromissoBoleto := False;
      vgCompromissoRealizado     := False;
      vgReciboNaoAssociadoId     := 0;
      Break;
    end;
  end;

  cxGridRealizado.Enabled  := True;
  sqlCompromissoRealizado.EnableControls;
  pgcGerenciador.Enabled   := True;
  cxProgressRecibo.Visible := False;
  Screen.Cursor := crDefault;

  ShowMessage('Impress�o de Recibos Conclu�do!!!');

  vlFiltrarCompromissoBoleto := False;
  vgCompromissoRealizado     := False;
  vgReciboNaoAssociadoId     := 0;
end;

procedure TfrmGerenciadorRecebimento.btnPesquisarBoletosRegistradosClick(Sender: TObject);
begin
  if (cbxBoletoRegMesIni.EditValue = null) or (cbxBoletoRegMesFim.EditValue = null) or
     (icxSituacaoBoleto.EditValue = null) then
    exit;

  PesquisarBoletosRegCancelados(sqlBoletosRegistrados,
                                dtmLookup.FormatarAnoMes(cbxBoletoRegMesIni.EditValue, 'S'),
                                dtmLookup.FormatarAnoMes(cbxBoletoRegMesFim.EditValue, 'S'),
                                icxSituacaoBoleto.EditValue, edtBoletoNumPesquisa.Text);
  if (pgcGerenciador.ActivePageIndex = 1) and (pgcBoletosRegistrados.ActivePageIndex = 0) then
    cxGridBoletosPagos.SetFocus;

  edtBoletoNumPesquisa.Clear;
end;

procedure TfrmGerenciadorRecebimento.AtualziaTaxaBoleto;
begin
end;

procedure TfrmGerenciadorRecebimento.btnCancelarRegistroClick(Sender: TObject);
begin
  sqlRegistrarCompromissos.Active := False;
  HabilitarBotoesRegistrar(True);
  edtNossoNumero.SetFocus;
end;

procedure TfrmGerenciadorRecebimento.btnCancelarRetornoClick(Sender: TObject);
begin
  if Application.MessageBox('Cancelar Registro do Retorno?',
      'Confirma��o', MB_YESNO) = IDNO then
    exit;

  LimparCampos;
end;

procedure TfrmGerenciadorRecebimento.btnCancelarTodosClick(Sender: TObject);
begin

  if Application.MessageBox(Pchar('Confirma Cancelamento de Todos as Faturas em Aberto at� '+ cbxReferenciaMulta.Text+' (MES/ANO)?'),
      'Confirma��o', MB_YESNO) = IDNO then
    exit;

  if (LiberarPermissaoUsuario('ESP_CANCELAR_BOLETOS')[6] = '0') then
    exit;

  // Cancela os Boletos
  ExecutaSqlAuxiliar(' UPDATE T_BOLETA SET DATA_CANCELADO = :DATA,'+
                     '                            ORDEM   = :ORDEM, '+
                     '                 REMESSA_SITUACAO   = :REMESSA, '+
                     '                           SITUACAO = :SITUACAO '+
                     ' WHERE CEDENTE_ID = '+IntToStr(vgCedenteAtivo)+
                     '   AND ANO_MES_BOLETO = '+ QuotedStr(dtmLookup.FormatarAnoMes(cbxReferenciaMulta.EditValue,'S'))+
                     '   AND SITUACAO = '+QuotedStr('1'),2);

  With dtmControles.sqlAuxiliar do
  begin
    ParamByName('ORDEM').AsInteger   := dtmControles.GerarSequencia('BOLETO_ORDEM'+IntToStr(vgCedenteAtivo));
    ParamByName('DATA').AsString     := dtmControles.DataHoraBanco(5);
    ParamByName('SITUACAO').AsString := '3';
    ParamByName('REMESSA').AsString  := '3';
    ExecSQL;
  end;

  // Retira o Id dos Boletos Cancelados dos compromissos
  ExecutaSqlAuxiliar(' UPDATE T_COMPROMISSO_VENCIDO SET BOLETA_ID = NULL'+
                     ' WHERE CEDENTE_ID = '+IntToStr(vgCedenteAtivo)+
                     '   AND SITUACAO = ''1'''+
                     '   AND BOLETA_ID IN (SELECT BOLETA_ID FROM T_BOLETA '+
                     '                   WHERE ANO_MES_BOLETO <= '+QuotedStr(dtmLookup.FormatarAnoMes(cbxReferenciaMulta.EditValue,'S'))+')',1);

  sqlCompromissos.Refresh;
  icxSituacaoBoleto.EditValue := '3';
  btnPesquisarBoletosRegistradosClick(self);
  btnGerarRemessa.Enabled := dtmLookupBoleto.VerificarGerarRemessa;
  Application.MessageBox('Boletos Cancelados!!!','Informa��o', MB_ICONINFORMATION + MB_OK);
end;

procedure TfrmGerenciadorRecebimento.btnConfirmarRetornoClick(Sender: TObject);
var
  viQtdRegPago, viQtdRegistrado, viQtdRegRemessa, viQtdBaixa, viRetornoId : Integer;

  procedure CancelarBoletosBaixados;
  begin
    FiltrarRegistroRetorno('(RETORNO = FALSE) AND (SITUACAO = '+ QuotedStr('4')+')',0,'');
    IniciarIncrementarProgressBar(cxProgressRetorno, cdsRetorno.RecordCount);

    cdsRetorno.First;
    while not cdsRetorno.eof do
    begin
      dtmLookupFinanceiro.CancelarBoleto(IntToStr(StrToInt(cdsRetornoNOSSO_NUMERO.AsString)), False);
      IniciarIncrementarProgressBar(cxProgressRetorno, 1, True);
      cdsRetorno.Next;
    end;
  end;

  procedure RegistrarPagos;
  var
    viGrupo : String;
    viTipoDataRegistro, vpDataCredito : String;
  begin
    viTipoDataRegistro := dtmControles.GetStr(' SELECT DATA_REGISTRO_BOLETO FROM T_CEDENTE WHERE CEDENTE_ID = '+vgCedenteAtivo.ToString);
    viQtdRegistrado    := FiltrarRegistroRetorno('(RETORNO = TRUE) AND (SELECIONADO = TRUE)',0,'');
    RegistrarArquivoRetorno('2', ExtractFileName(OpenDialogRetorno.FileName),viQtdRegPago, viQtdRegRemessa, viQtdRegistrado, viQtdBaixa, viRetornoId);

    IniciarIncrementarProgressBar(cxProgressRetorno, cdsRetorno.RecordCount);

    cdsRetorno.First;
    while not cdsRetorno.eof do
    begin
      viGrupo := '';
      if Pos('GRUPO', cdsRetornoNOME.AsString) > 0 then
        viGrupo := cdsRetornoNOME.AsString;

      vpDataCredito := '';
      if (viTipoDataRegistro = '2') then
        vpDataCredito := cdsRetornoDATA_CREDITO.AsString;

      RegistrarEntrada(cdsRetornoNOSSO_NUMERO.AsInteger, cdsRetornoDATA_PAGAMENTO.AsDateTime, viRetornoId);
      dtmLookupContabil.CarregarRegistrarLivroCaixa(IntToStr(cdsRetornoNOSSO_NUMERO.AsInteger), 'BOLETA_ID', 'B', '', viGrupo, vlCaixaBoletoId,0,0,0, vpDataCredito);

      if cdsRetornoJUROS_MORA.AsCurrency > 0 then
        dtmLookupContabil.CarregarRegistrarLivroCaixa(IntToStr(cdsRetornoNOSSO_NUMERO.AsInteger), 'BOLETA_ID', 'B', '', viGrupo, vlCaixaBoletoId,
                                 (cdsRetornoVALOR_IOF.AsCurrency+cdsRetornoJUROS_MORA.AsCurrency), vgBoletoDados.CompromissoJurosId, vgBoletoDados.ReservaJurosId, vpDataCredito);

      IniciarIncrementarProgressBar(cxProgressRetorno, 1, True);
      cdsRetorno.Next;
    end;

    if viQtdBaixa > 0 then
      CancelarBoletosBaixados;
  end;

begin
  if Application.MessageBox('Confirma Registro dos Boletos Selecionados do Arquivo de Retorno?',
      'Confirma��o', MB_YESNO) = IDNO then
    exit;

  cdsRetorno.DisableControls;
  viQtdRegRemessa := FiltrarRegistroRetorno('(RETORNO = FALSE) AND (SITUACAO <> '+ QuotedStr('4')+')',0,'');
  viQtdBaixa      := FiltrarRegistroRetorno('(RETORNO = FALSE) AND (SITUACAO = '+ QuotedStr('4')+')',0,'');
  viQtdRegPago    := FiltrarRegistroRetorno('RETORNO = TRUE',0,'');
  Screen.Cursor   := crHourGlass;

  try
    dtmControles.StartTransaction;
    viRetornoId := dtmControles.GerarSequencia('T_BOLETA_REMESSA_RETORNO');

    if viQtdRegPago = 0 then
    begin
      RegistrarArquivoRetorno('2', ExtractFileName(OpenDialogRetorno.FileName),0, viQtdRegRemessa, 0, viQtdBaixa, viRetornoId);
      if viQtdBaixa > 0 then
        CancelarBoletosBaixados;
    end
    else RegistrarPagos;
    dtmControles.Commit;
    MoveFile(Pchar(OpenDialogRetorno.FileName),Pchar(vgBoletoDados.DiretorioRetorno+'\'+ExtractFileName(OpenDialogRetorno.FileName)));
  except
    on E: Exception do
    begin
      Screen.Cursor := crDefault;
      cdsRetorno.EnableControls;
      dtmControles.Roolback;
      Application.MessageBox(Pchar(E.Message + 'Problema ao registrar os dados!!!'),'Informa��o', MB_ICONINFORMATION + MB_OK);
      exit;
    end;
  end;

  Screen.Cursor := crDefault;
  cdsRetorno.EnableControls;
  LimparCampos;

  CarregarCompromissosVencidos;
  btnGerarRemessa.Enabled := dtmLookupBoleto.VerificarGerarRemessa;
  sqlCompromissos.Refresh;
  sqlRetornoRemessa.Refresh;
  Application.MessageBox('Dados do Arquivo de Retorno Confirmados!!!','Informa��o', MB_ICONINFORMATION + MB_OK);
end;

procedure TfrmGerenciadorRecebimento.cxGridDBSecionadoCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if (AViewInfo.RecordViewInfo.GridRecord.Values[1] <> null) then
    ACanvas.Brush.Color    := clSilver;
end;

procedure TfrmGerenciadorRecebimento.cxGridDBSecionadoPropertiesChange(
  Sender: TObject);
begin
  if sqlAssociadosAtivos.FieldByName('PESSOA_GRUPO_ID').IsNull then
    sqlAssociadosAtivos.Post
  else
  begin
    sqlAssociadosAtivos.Cancel;
    popMarcarDesmarcarGrupoClick(self);
    vlNaoFiltrarCompromisso := False;
  end;
end;

procedure TfrmGerenciadorRecebimento.cxGridDBTableView1Column3CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if (AViewInfo.RecordViewInfo.GridRecord.Values[8] <> null) then
  begin
    ACanvas.Brush.Color    := clSilver;
    AviewInfo.item.Editing := False;
  end;

end;

procedure TfrmGerenciadorRecebimento.cxGridDBTableView1Column3PropertiesChange(
  Sender: TObject);
begin
  if sqlCompromissosBOLETA_ID.AsInteger > 0 then
    abort;
  sqlCompromissos.Post;
end;

procedure TfrmGerenciadorRecebimento.cxGridDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.RecordViewInfo.GridRecord.Values[2] = 'S' then
    ACanvas.Font.Color := clRed;

end;

procedure TfrmGerenciadorRecebimento.cxGridDBTableView1DblClick(
  Sender: TObject);
begin
  if lcxGrupoAssociado.EditValue <> null then
    exit;

  vgNovoCadastro := False;
  vgSelecionado  := True;
  vgPessoa.PessoaId := sqlAssociadosAtivos.FieldByName('PESSOA_ID').AsInteger;
  CadPessoaUDV(True);
  sqlAssociadosAtivos.Refresh;
end;

procedure TfrmGerenciadorRecebimento.cxGridDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  CarregarCompromissosVencidos;
end;

procedure TfrmGerenciadorRecebimento.cxGridDBTableView1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key in ['a'..'z', 'A'..'Z'] then
  begin
    if not edtPesquisar.Visible then
    begin
      edtPesquisar.Visible   := True;
      edtPesquisar.EditValue := Key;
      edtPesquisar.SetFocus;
      edtPesquisar.SelStart  := 1;
    end;
  end;
end;

procedure TfrmGerenciadorRecebimento.cxGridRetornoDBTableView1SELECIONARPropertiesChange(
  Sender: TObject);
begin
  cdsRetorno.Post;
end;

procedure TfrmGerenciadorRecebimento.edtBoletoNumPesquisaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
    btnPesquisarBoletosRegistradosClick(self);
end;

procedure TfrmGerenciadorRecebimento.edtBoletoNumPesquisaKeyPress(
  Sender: TObject; var Key: Char);
begin
  DigitaInteiro(Key);
end;

procedure TfrmGerenciadorRecebimento.edtDataRealizadoFimKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
  begin
    btnPesquisarRealizados.SetFocus;
    btnPesquisarRealizadosClick(self);
  end;
end;

procedure TfrmGerenciadorRecebimento.edtDataRecebimentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
    btnRegistrarBoletoClick(self);
end;

procedure TfrmGerenciadorRecebimento.edtNossoNumeroEnter(Sender: TObject);
begin
  HabilitarBotoesRegistrar(True);
  edtNossoNumero.Clear;
end;

procedure TfrmGerenciadorRecebimento.edtNossoNumeroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
    btnPesquisarBoletoClick(self);

end;

procedure TfrmGerenciadorRecebimento.edtNossoNumeroKeyPress(Sender: TObject;
  var Key: Char);
begin
  DigitaInteiro(Key);
end;

procedure TfrmGerenciadorRecebimento.edtPesquisarExit(Sender: TObject);
begin
  edtPesquisar.Visible := False;
  edtPesquisar.Clear;
end;

procedure TfrmGerenciadorRecebimento.edtPesquisarKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
    cxGridAssociados.SetFocus;
end;

procedure TfrmGerenciadorRecebimento.edtPesquisarPropertiesChange(
  Sender: TObject);
begin
  sqlAssociadosAtivos.Locate('NOME', edtPesquisar.Text, [loPartialKey]);
end;

procedure TfrmGerenciadorRecebimento.ExportalExcel1Click(Sender: TObject);
begin
  dtmLookup.ExportarExcel(cxGridRealizado);
end;

procedure TfrmGerenciadorRecebimento.popRecuperarBoletoClick(
  Sender: TObject);
var
  viValorBoleto : Currency;
  viSql : String;
  viLista : TStringList;

  procedure VerificarAlteracaoCompromisso;
  begin
    ExecutaSqlAuxiliar(' SELECT SUM(VALOR_ATUAL) AS VALOR '+
                       ' FROM T_COMPROMISSO_VENCIDO '+
                       ' WHERE COMPROMISSO_VENCIDO_ID IN ('+sqlBoletosRegistradosBOLETA_COMPROMISSOS_ID.AsString+')'+
                       '   AND SITUACAO = ''1'''+
                       '   AND BOLETA_ID IS NULL',0);
    if (dtmControles.sqlAuxiliar.FieldByName('VALOR').AsCurrency + viValorBoleto) <> (sqlBoletosRegistradosVALOR.AsCurrency) then
    begin
      Application.MessageBox('Os compromissos desta Fatura ja foram alterados. Recupera��o cancelada!!!','Informa��o', MB_ICONINFORMATION + MB_OK);
      abort;
    end;
  end;

  procedure VerificarPossivelRecuperacao;
  begin
{    viLista := dtmControles.GetFields(' SELECT T_BOLETA FROM REMESSA_SITUACAO, REMESSA_ID '+
                                      ' WHERE BOLETA_ID = '+sqlBoletosRegistradosBOLETA_ID.AsString);
    if viLista.Values['REMESSA_SITUACAO'] = ''  then
    begin

    end;}
  end;

begin

// Application.MessageBox('Rotina em Fase de Teste!!!','Informa��o', MB_ICONINFORMATION + MB_OK);

  if vgBoletoDados.CobrarBoleto = 'S' then
       viValorBoleto := vgBoletoDados.ValorTaxa
  else viValorBoleto := 0;

  VerificarAlteracaoCompromisso;
//  VerificarPossivelRecuperacao;

  if Application.MessageBox(Pchar('Confirma recupera��o da fatura '+ sqlBoletosRegistradosBOLETA_ID.AsString+'?'),
                                  'Confirma��o', MB_YESNO) = IDNO then
    exit;

  ExecutaSqlAuxiliar(' UPDATE T_COMPROMISSO_VENCIDO SET SELECIONADO = '+QuotedStr('N')+', '+
                     '                                  BOLETA_ID =' + sqlBoletosRegistradosBOLETA_ID.AsString+
                     ' WHERE COMPROMISSO_VENCIDO_ID IN ('+sqlBoletosRegistradosBOLETA_COMPROMISSOS_ID.AsString+')',1);

  ExecutaSqlAuxiliar(' UPDATE T_BOLETA SET DATA_CANCELADO = NULL, '+
                     '                     SITUACAO = ''1'''+
                     ' WHERE BOLETA_ID = '+  sqlBoletosRegistradosBOLETA_ID.AsString,1);

  sqlBoletosRegistrados.Refresh;
  sqlCompromissos.Refresh;
end;

procedure TfrmGerenciadorRecebimento.rdbPesquisaBoletoClick(Sender: TObject);
begin
  lblPesqRefInicial.Enabled  := False;
  lblPesqRefFinal.Enabled    := False;
  lblPesqRefSituacao.Enabled := False;
  cbxBoletoRegMesIni.Enabled := False;
  cbxBoletoRegMesFim.Enabled := False;
  icxSituacaoBoleto.Enabled  := False;

  lblPesqBoleto.Enabled        := True;
  edtBoletoNumPesquisa.Enabled := True;
  edtBoletoNumPesquisa.SetFocus;
end;

procedure TfrmGerenciadorRecebimento.rdbPesquisaReferenciaClick(
  Sender: TObject);
begin
  lblPesqRefInicial.Enabled  := True;
  lblPesqRefFinal.Enabled    := True;
  lblPesqRefSituacao.Enabled := True;
  cbxBoletoRegMesIni.Enabled := True;
  cbxBoletoRegMesFim.Enabled := True;
  icxSituacaoBoleto.Enabled  := True;

  lblPesqBoleto.Enabled        := False;
  edtBoletoNumPesquisa.Enabled := False;
  edtBoletoNumPesquisa.Clear;
end;

procedure TfrmGerenciadorRecebimento.rdbRegistroAvulsoClick(Sender: TObject);
begin
  PesquisarAssociadoGrupo('');
end;

procedure TfrmGerenciadorRecebimento.rdbRegistroSocioClick(Sender: TObject);
begin
  PesquisarAssociadoGrupo('');
end;

procedure TfrmGerenciadorRecebimento.pgcGerenciadorChange(Sender: TObject);
var
  viAnoMes : String;
begin
  if pgcGerenciador.ActivePage = tabRecebimento then
  begin
    pgcRegistroBoleto.ActivePageIndex := 0;
    btnPesquisarBoletosRegistradosClick(self);
    if edtRetorno.Text = '' then
    begin
      pgcRegistro.ActivePageIndex := 0;
      ValoresRegistroDefault;
      edtNossoNumero.SetFocus;
    end;
    sqlRetornoRemessa.Refresh;
  end
  else
    if pgcGerenciador.ActivePage = tabRealizado then
    begin
      btnPesquisarRealizadosClick(self);
      cxGridRealizado.SetFocus;
    end
  else
  begin
    if pgcGerenciador.ActivePage = tbcRecibos then
    begin
      if icxMesInicial.Text = '' then
      begin
        dtmLookup.CarregarAno(icxAno);
        icxMesInicial.EditValue := StrToInt(copy(IntToStr(vgPeriodoAtual),5,2));
        icxMesFinal.EditValue   := icxMesInicial.EditValue;
        icxAno.EditValue        := copy(IntToStr(vgPeriodoAtual),1,4);
        btnPesquisarRecibosClick(self);
      end;
    end;
  end;
end;

procedure TfrmGerenciadorRecebimento.pgcRegistroChange(Sender: TObject);
begin
  case pgcRegistro.ActivePageIndex of
    0 : begin
          pgcRegistro.LookAndFeel.SkinName := 'Office2007Green';
          pgcRegistroBoleto.ActivePageIndex := 0;
        end;
    1 : begin
          pgcRegistroBoleto.ActivePageIndex := 1;
        end;
    2 : begin
          pgcRegistro.LookAndFeel.SkinName := 'Office2007Pink';
          CarregarReferenciaMulta;
          btnCancelarTodos.Enabled   := cbxReferenciaMulta.Text <> '';
          cbxReferenciaMulta.Enabled := cbxReferenciaMulta.Text <> '';
          pgcRegistroBoleto.ActivePageIndex := 0;
        end;
  end;

  tabRegistroManual.TabVisible     := pgcRegistro.ActivePageIndex <> 1;
  tabRegistroAutomatico.TabVisible := pgcRegistro.ActivePageIndex = 1;
end;

procedure TfrmGerenciadorRecebimento.cxGridDBTableCompromissosCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.RecordViewInfo.GridRecord.Values[9] = 'S' then
    ACanvas.Font.Color := clRed;

end;

procedure TfrmGerenciadorRecebimento.FiltrarAssociadoBoleto(vpAssociadoID, vpPessoaGrupo : string;
       vpRecibo : Boolean = False);
var
  viSql : String;
begin
  viSql := ' SELECT NOME, PESSOA_ID, PESSOA_GRUPO_ID, SELECIONADO, CPF, FATURA_TIPO '+
           ' FROM T_PESSOA '+
           ' WHERE CEDENTE_ID = '+ IntToStr(vgCedenteAtivo);

  if (vpPessoaGrupo = '') and (sqlAssociadosAtivos.FieldByName('SITUACAO').AsInteger in [2,3]) then
    viSql := viSql + ' AND PESSOA_ID = '+ sqlAssociadosAtivos.FieldByName('PESSOA_ID').AsString;

  if not vpRecibo then
    viSql := viSql + '   AND SELECIONADO = ''S''';

  if vpPessoaGrupo <> '' then
    viSql := viSql + ' AND PESSOA_GRUPO_ID = '+ vpPessoaGrupo
  else
    if vpRecibo then
      viSql := viSql + ' AND PESSOA_ID = '+ vpAssociadoID;

  viSql := viSql + ' ORDER BY NOME ';
  sqlAssociadoBoleto.Active := False;
  sqlAssociadoBoleto.SQL.Text := viSql;
  sqlAssociadoBoleto.Active := True;
end;

procedure TfrmGerenciadorRecebimento.FiltrarCompromissoBoleto(
          vpPessoaId, vpGrupoId, vpReciboId : string);
var
  viSql, viCondicaoPrincipal, viCondicaoAdicional : String;
begin
  viSql := ' SELECT CV.ANO_MES_REFERENCIA, CV.VALOR_ATUAL, CV.PESSOA_NOME, '+
           '        CV.QTD_ADICIONAL, CV.DIFERENCA, CV.COMPROMISSO_VENCIDO_ID, '+
           '        CC.DESCRICAO '+
           ' FROM T_COMPROMISSO_VENCIDO CV LEFT OUTER JOIN T_CONTABIL_CONTA CC '+
           '    ON CV.CONTABIL_CONTA_ID = CC.CONTABIL_CONTA_ID ';

  viCondicaoAdicional := ' AND CV.SITUACAO = ''1''';

  if vpPessoaId <> '' then
  begin
    if not vgCompromissoRealizado then
       viCondicaoPrincipal := ' WHERE CV.PESSOA_ID = '+vpPessoaId+
                              '   AND CV.SELECIONADO = ''S'''
    else
    begin
       viCondicaoPrincipal := ' WHERE CV.PESSOA_ID = '+vpPessoaId;
       if vgDadosConfirmacao.NumeroRecibo = '' then
            viCondicaoPrincipal := viCondicaoPrincipal + ' AND RECIBO_NUMERO = '+sqlCompromissoRealizadoRECIBO_NUMERO.AsString
       else viCondicaoPrincipal := viCondicaoPrincipal + ' AND RECIBO_NUMERO = '+vgDadosConfirmacao.NumeroRecibo;
       viCondicaoAdicional := '';
    end;
  end
  else
    if vpGrupoId <> '' then
      viCondicaoPrincipal := ' LEFT OUTER JOIN T_PESSOA P '+
                             '    ON CV.PESSOA_ID = P.PESSOA_ID '+
                             ' WHERE P.PESSOA_GRUPO_ID = '+ vpGrupoId+
                             '   AND CV.SELECIONADO = ''S'''
  else
  begin
    viCondicaoPrincipal := ' WHERE CV.RECIBO_NUMERO = '+ vpReciboId+
                           '   AND CV.CEDENTE_ID = '+IntToStr(vgCedenteAtivo);
    viCondicaoAdicional := '';
  end;

  viCondicaoPrincipal := viCondicaoPrincipal + ' AND CV.TIPO_OPERACAO = ''C'''+
                                               ' ORDER BY ANO_MES_REFERENCIA ';

  sqlCompromissoBoleto.Active := False;
  sqlCompromissoBoleto.SQL.Text := viSql + viCondicaoAdicional + viCondicaoPrincipal;
  sqlCompromissoBoleto.Active := True;
end;

function TfrmGerenciadorRecebimento.FiltrarRegistroRetorno(vpFiltro: String; vpTab : Integer;
        vpMensagem : String):Integer;
begin
  cdsRetorno.Filtered := False;
  cdsRetorno.Filter   := vpFiltro;
  cdsRetorno.Filtered := True;
  Result := cdsRetorno.RecordCount;

  if vpMensagem <> '' then
  begin
    tabConfimacaoBoletos.Tabs[vpTab].Caption := vpMensagem+'('+IntToStr(cdsRetorno.RecordCount)+')';

    if (cdsRetorno.RecordCount > 0) then
         tabConfimacaoBoletos.Tabs[vpTab].Highlighted := True
    else tabConfimacaoBoletos.Tabs[vpTab].Highlighted := False;
  end;
end;

procedure TfrmGerenciadorRecebimento.FormActivate(Sender: TObject);
begin
  if vgSocioAfastado > 0 then
    PesquisarAssociadoGrupo('');

  if (vgPessoaSelecionadaId > 0) and (vgGrupoSelecionadoId = 0) then
  begin
    if lcxGrupoAssociado.EditValue <> null then
      sbnLimparFiltroClick(Self);

    sqlAssociadosAtivos.Locate('PESSOA_ID',vgPessoaSelecionadaId, [loCaseInsensitive]);
    if sqlAssociadosAtivos.FieldByName('PESSOA_GRUPO_ID').IsNull then
    begin
      MarcarDesmarcarAssociado('N');
      sqlAssociadosAtivos.Refresh;
      sqlAssociadosAtivos.Edit;
      sqlAssociadosAtivos.FieldByName('SELECIONADO').AsString := 'S';
      sqlAssociadosAtivos.post;
    end;
  end;
  vgGrupoSelecionadoId := 0;

  btnRecebimentoRecibo.Enabled  := not sqlAssociadosAtivos.IsEmpty;
  btnEditarCompromissos.Enabled := not sqlAssociadosAtivos.IsEmpty;

  dtmControles.StandardColorMap1.Color             := $00E7C2A5;
  dtmControles.StandardColorMap1.SelectedColor     := $00E7C2A5;
  dtmControles.StandardColorMap1.SelectedFontColor := clNavy;
  sqlAssociadosAtivos.Refresh;
  CarregarCompromissosVencidos;

  if pgcGerenciador.ActivePageIndex = 0 then
    cxGridAssociados.SetFocus;

  if vgAtualizarRegistrosAvulsos then
  begin
    if rdbRegistroAvulso.Checked then
      rdbRegistroAvulsoClick(self)
    else
    begin
      rdbRegistroAvulso.Checked := True;
      rdbRegistroAvulsoClick(self)
    end;
  end;
  btnGerarRemessa.Enabled := dtmLookupBoleto.VerificarGerarRemessa;
end;

procedure TfrmGerenciadorRecebimento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sqlAssociadosAtivos.Active     := False;
  sqlCompromissos.Active         := False;
  sqlCompromissoBoleto.Active    := False;
  sqlAssociadoBoleto.Active      := False;
  sqlRegistrarCompromissos.Active:= False;
  sqlBoletosRegistrados.Active   := False;
  sqlCompromissoRealizado.Active := False;
  sqlAjusteProgramado.Active     := False;

  Action := caFree;
  frmGerenciadorRecebimento := nil;
end;

procedure TfrmGerenciadorRecebimento.FormCreate(Sender: TObject);
begin
  sqlAssociadosAtivos.Connection      := dtmControles.DB;
  sqlCompromissos.Connection          := dtmControles.DB;
  sqlCompromissoBoleto.Connection     := dtmControles.DB;
  sqlAssociadoBoleto.Connection       := dtmControles.DB;
  sqlRegistrarCompromissos.Connection := dtmControles.DB;
  sqlBoletosRegistrados.Connection    := dtmControles.DB;
  sqlCompromissoRealizado.Connection  := dtmControles.DB;
  sqlAjusteProgramado.Connection      := dtmControles.DB;
  sqlRetornoRemessa.Connection        := dtmControles.DB;
  sqlCompromissosAntigos.Connection   := dtmControles.DB;
  sqlReciboAgrupado.Connection        := dtmControles.DB;
  sqlRetornoRemessa.Active := True;

  pgcGerenciador.ActivePageIndex := 0;
  pgcRegistroBoleto.HideTabs     := True;
  MarcarDesmarcarAssociado('N');
  MarcarDesmarcarCompromissos('N');
  PesquisarAssociadoGrupo('');
  CarregarMesReferencia(cbxMes);
  CarregarDadosBanco(1);

  chxCobrarBoleto.Enabled  := vgBoletoDados.CobrarBoleto = 'S';
  chxCobrarBoleto.Checked  := vgBoletoDados.CobrarBoleto = 'S';
  edtValorBoleto.EditValue := vgBoletoDados.ValorTaxa;
  edtValorTaxa.EditValue   := vgBoletoDados.ValorTaxa;
  lcxCalculoMedia.Visible  := vgBoletoDados.CalcularMediaBoleto = 'S';

  if vgBoletoDados.CobrarBoleto = 'S' then
    chxCobrarBoleto.Checked := True;

  VerificarDiretorios;

  ExecutaSqlAuxiliar(' SELECT PRAZO_PAGAMENTO, PRAZO_DIA, DIA_VENCIMENTO_PADRAO, CAIXA_ID'+
                     ' FROM T_CEDENTE '+
                     ' WHERE CEDENTE_ID = '+ IntToStr(vgCedenteAtivo),0);
  vlPrazoPagamento  := dtmControles.sqlAuxiliar.FieldByName('PRAZO_PAGAMENTO').AsString;
  vlPrazoDias       := dtmControles.sqlAuxiliar.FieldByName('PRAZO_DIA').AsString;
  vlCaixaBoletoId   := dtmControles.sqlAuxiliar.FieldByName('CAIXA_ID').AsInteger;

  icxSituacaoBoleto.editValue := '2';


  CarregarMesReferencia(cbxBoletoRegMesIni);
  CarregarMesReferencia(cbxBoletoRegMesFim);
  btnPesquisarBoletosRegistradosClick(Self);

  edtDataRealizadoIni.EditValue := dtmControles.DataHoraBanco(3);
  edtDataRealizadoFim.EditValue := dtmControles.DataHoraBanco(3);
end;

procedure TfrmGerenciadorRecebimento.FormDeactivate(Sender: TObject);
begin
  vgDadosCadastro.AtualizarSaldo := True;
end;

procedure TfrmGerenciadorRecebimento.GerarBoleto(vpData: String);
begin

end;

function TfrmGerenciadorRecebimento.GetDigitoNossoNum(
  vpNossoNumero: String): string;
var
  x: string;
begin
  x := vpNossoNumero;
  Result:=GetModulo11BB(x,9);
end;

function TfrmGerenciadorRecebimento.GetModulo11BB(str: string;
  base: integer): char;
var
  digito : string; resto:integer;
begin
  digito := FuncAux.Modulo11(str, base, resto);
  if resto = 10 then
    Result := 'X'
  else
    Result := digito[1];
end;

procedure TfrmGerenciadorRecebimento.HabilitarBotoesRegistrar(
  vpHabilitado: Boolean);
begin
  lblDataRecebimento.Enabled    := not vpHabilitado;
  edtDataRecebimento.Enabled    := not vpHabilitado;
  btnRegistrarBoleto.Enabled    := not vpHabilitado;
  btnCancelarRegistro.Enabled   := not vpHabilitado;
  btnPesquisarBoleto.Enabled    := vpHabilitado;
  edtNossoNumero.Enabled        := vpHabilitado;
  tabGeracao.Enabled            := vpHabilitado;
  tabRealizado.Enabled          := vpHabilitado;
  gbxBoletoCompromissos.Visible := not vpHabilitado;
end;

procedure TfrmGerenciadorRecebimento.HabilitarCamposRetorno(
  VpHabilitado: Boolean);
begin
  btnConfirmarRetorno.Enabled := VpHabilitado;
  btnCancelarRetorno.Enabled  := VpHabilitado;
end;

procedure TfrmGerenciadorRecebimento.icxSituacaoBoletoPropertiesChange(
  Sender: TObject);
begin
  mniRefazerLivroCaixa.Enabled := icxSituacaoBoleto.EditValue = '2';
  btnPesquisarBoletosRegistradosClick(self);
end;

procedure TfrmGerenciadorRecebimento.btnPesquisarRealizadosClick(Sender: TObject);
var
  viSql : string;
begin
  VerificarPreenchimentoDTA_TX(edtDataRealizadoIni.Text, 'Data Inicial', edtDataRealizadoIni);
  VerificarPreenchimentoDTA_TX(edtDataRealizadoFim.Text, 'Data Final', edtDataRealizadoFim);
  viSql := ' SELECT * '+
           ' FROM T_COMPROMISSO_VENCIDO '+
           ' WHERE SITUACAO = ''2'''+
           '   AND TIPO_OPERACAO = ''C'''+
           '   AND DATA_REALIZACAO '+ MontarSqlData(edtDataRealizadoIni.EditValue, edtDataRealizadoFim.EditValue)+
           '   AND NOT PESSOA_NOME IS NULL '+
           ' ORDER BY DATA_REALIZACAO, RECIBO_NUMERO, ANO_MES_REFERENCIA, CONTABIL_CONTA_ID ';
  sqlCompromissoRealizado.Active := False;
  sqlCompromissoRealizado.SQL.Text := viSql;
  sqlCompromissoRealizado.Active := True;

  rdbReciboSelecionado.Checked := True;
end;

procedure TfrmGerenciadorRecebimento.btnPesquisarRecibosClick(Sender: TObject);
var
  viAnoMesInicial, viAnoMesFinal : String;
begin
  VerificarPreenchimentoICX_TX(icxMesInicial.Text, 'M�s Inicial',icxMesInicial);
  VerificarPreenchimentoICX_TX(icxMesFinal.Text, 'M�s Final',icxMesFinal);
  VerificarPreenchimentoICX_TX(icxAno.Text, 'Ano',icxAno);

  viAnoMesInicial := icxAno.Text + FormatFloat('00', icxMesInicial.EditValue);
  viAnoMesFinal   := icxAno.Text + FormatFloat('00', icxMesInicial.EditValue);

  vgCarregandoRecibos := True;
  sqlReciboAgrupado.Active := False;
  sqlReciboAgrupado.ParamByName('ANO_MES_INICIAL').AsString := viAnoMesInicial;
  sqlReciboAgrupado.ParamByName('ANO_MES_FINAL').AsString := viAnoMesFinal;
  sqlReciboAgrupado.Active := True;

  sqlReciboAgrupado.DisableControls;
  sqlReciboAgrupado.First;
  While not sqlReciboAgrupado.Eof do
  begin
    sqlReciboAgrupado.Edit;
    if sqlReciboAgrupadoEMAIL_ENCAMINHAR.IsNull then
         sqlReciboAgrupadoCALC_EMAIL.AsString := 'N'
    else sqlReciboAgrupadoCALC_EMAIL.AsString := sqlReciboAgrupadoEMAIL_ENCAMINHAR.AsString;
    sqlReciboAgrupado.Post;
    sqlReciboAgrupado.Next;
  end;
  sqlReciboAgrupado.First;
  sqlReciboAgrupado.EnableControls;
  vgCarregandoRecibos := False;
end;

procedure TfrmGerenciadorRecebimento.btnPesquisarRetornoClick(Sender: TObject);
var
  viValorDocumento: Double;
  viDadosBanco: string;

  function BuscarPessoaGrupo(vpId : String):string;
  var
    viPessoa : TStringList;
  begin
    viPessoa :=  dtmControles.GetFields(' SELECT PESSOA_GRUPO_ID, PESSOA_ID FROM T_BOLETA '+
                                        ' WHERE BOLETA_ID = '+vpId);

    if viPessoa.Values['PESSOA_GRUPO_ID'] = '' then
         Result := dtmControles.GetStr(' SELECT NOME FROM T_PESSOA WHERE PESSOA_ID = '+viPessoa.Values['PESSOA_ID'])
    else Result := 'GRUPO '+ dtmControles.GetStr(' SELECT DESCRICAO FROM T_PESSOA_GRUPO WHERE PESSOA_GRUPO_ID = '+viPessoa.Values['PESSOA_GRUPO_ID']);
  end;

  procedure CarregarRetorno;
  var
    viAssociado : TStringList;
    i: Integer;
  begin
    with dtmLookupBoleto do
    begin
      ACBrBoleto1.NomeArqRetorno := edtRetorno.Text;
      ACBrBoleto1.LerRetorno;

//      dtmLookupContabil.VerificaAnoMesFechado(DateToStr(ACBrBoleto1.ListadeBoletos.Objects[0].DataCredito));

      IniciarIncrementarProgressBar(cxProgressRetorno, ACBrBoleto1.ListadeBoletos.Count);
      cxProgressRetorno.Visible := True;

      cdsRetorno.DisableControls;
      for i := 0 to ACBrBoleto1.ListadeBoletos.Count -1 do
      begin
        viValorDocumento := -1;

        cdsRetorno.Append;
        cdsRetornoTIPO_REGISTRO.AsString     := 'N';
        cdsRetornoSITUACAO.AsString          := '';
        cdsRetornoLOCALIZADO.AsBoolean       := False;
        cdsRetornoDIFERENCA.AsCurrency       := 0;
        cdsRetornoDOCUMENTO.AsString         := ACBrBoleto1.ListadeBoletos.Objects[i].NumeroDocumento;
        cdsRetornoNOSSO_NUMERO.AsString      := ACBrBoleto1.ListadeBoletos.Objects[i].NossoNumero;
        cdsRetornoNOME.AsString              := BuscarPessoaGrupo(IntToStr(StrToInt(cdsRetornoNOSSO_NUMERO.AsString)));
        cdsRetornoVALOR_DOCUMENTO.AsCurrency := ACBrBoleto1.ListadeBoletos.Objects[i].ValorDocumento;
        cdsRetornoVALOR_IOF.AsCurrency       := ACBrBoleto1.ListadeBoletos.Objects[i].ValorIOF;
        cdsRetornoDESCONTO.AsCurrency        := ACBrBoleto1.ListadeBoletos.Objects[i].ValorDesconto;
        cdsRetornoJUROS_MORA.AsCurrency      := ACBrBoleto1.ListadeBoletos.Objects[i].ValorMoraJuros;
        cdsRetornoDATA_PAGAMENTO.AsDateTime  := ACBrBoleto1.ListadeBoletos.Objects[i].DataOcorrencia;
        cdsRetornoDATA_CREDITO.AsDateTime    := ACBrBoleto1.ListadeBoletos.Objects[i].DataCredito;
        cdsRetornoCARTEIRA.AsString          := ACBrBoleto1.ListadeBoletos.Objects[i].Carteira;
        if ACBrBoleto1.ListadeBoletos.Objects[i].ValorRecebido > 0 then
             cdsRetornoVALOR_PAGO.AsCurrency  := ACBrBoleto1.ListadeBoletos.Objects[i].ValorRecebido + ACBrBoleto1.ListadeBoletos.Objects[i].ValorDespesaCobranca
        else cdsRetornoVALOR_PAGO.AsCurrency  := 0;

        if cdsRetornoVALOR_PAGO.AsCurrency = 0 then
             cdsRetornoRETORNO.AsBoolean := False
        else cdsRetornoRETORNO.AsBoolean := True;

        if cdsRetornoNOSSO_NUMERO.AsString <> '' then
        begin
          viAssociado := dtmControles.GetFields(' SELECT VALOR, SITUACAO '+
                                                ' FROM T_BOLETA '+
                                                ' WHERE BOLETA_ID = '+Trim(cdsRetornoNOSSO_NUMERO.AsString));

          viValorDocumento                 := StrToFloat(TrocaPtoPVirg(viAssociado.Values['VALOR']));
          cdsRetornoSITUACAO.AsString      := viAssociado.Values['SITUACAO'];
          viAssociado.Free;

          if cdsRetornoRETORNO.AsBoolean then
          begin
            if cdsRetornoSITUACAO.AsString = '1' then
              cdsRetornoSITUACAO.AsString := '5';
          end
          else
          begin
            if cdsRetornoSITUACAO.AsString = '1' then
              if pos('BAIXA', AnsiUpperCase(ACBrBoleto1.ListadeBoletos.Objects[i].OcorrenciaOriginal.Descricao)) > 0 then
                cdsRetornoSITUACAO.AsString := '4'
          end;

          cdsRetornoLOCALIZADO.AsBoolean := viValorDocumento > -1;
          if cdsRetornoLOCALIZADO.AsBoolean then
          begin
            viValorDocumento := cdsRetornoVALOR_PAGO.AsCurrency - viValorDocumento;
            cdsRetornoDIFERENCA.AsCurrency   := viValorDocumento;
            cdsRetornoSELECIONADO.AsBoolean  := cdsRetornoRETORNO.AsBoolean and (cdsRetornoSITUACAO.AsString = '5');
          end
          else cdsRetornoSELECIONADO.AsBoolean  := False;
        end;
        IniciarIncrementarProgressBar(cxProgressRetorno, 1, True);
        cdsRetorno.Post;
      end;
    end;

    FiltrarRegistroRetorno('RETORNO  = TRUE', 0, 'Boletos Pagos');
    FiltrarRegistroRetorno('(RETORNO = FALSE) AND (SITUACAO <> '+ QuotedStr('4')+')',1, 'Confirmados Remessa');
    FiltrarRegistroRetorno('(RETORNO = FALSE) AND (SITUACAO = '+ QuotedStr('4')+')',2, 'Baixas Decurso de Prazo/Outros');

    tabConfimacaoBoletos.TabIndex := 0;
    tabConfimacaoBoletosChange(self);
    cdsRetorno.EnableControls;
  end;

  procedure VerificarArquivoRegistrado;
  begin
    // Verifica se o Arquivo ja foi Registrado
    ExecutaSqlAuxiliar(' SELECT DATA FROM T_BOLETA_REMESSA_RETORNO '+
                       ' WHERE UPPER(NOME_ARQUIVO) = '+ QuotedStr(AnsiUpperCase(ExtractFileName(OpenDialogRetorno.FileName))),0);
    if not dtmControles.sqlAuxiliar.IsEmpty then
    begin
      Application.MessageBox(Pchar('Este arquivo ja foi registrado em '+
                                   dtmControles.sqlAuxiliar.FieldByName('DATA').AsString), 'Aten��o', MB_OK + MB_ICONWARNING);
      Screen.Cursor := crDefault;
      abort;
    end;
  end;

begin
  if OpenDialogRetorno.Execute then
    edtRetorno.Text := OpenDialogRetorno.Filename;

  if Trim(edtRetorno.Text) = '' then begin
    Application.MessageBox('Informe um arquivo v�lido para continuar!','Aviso', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  VerificarArquivoRegistrado;

  HabilitarCamposRetorno(False);
  Screen.Cursor := crHourGlass;
  with dtmLookupBoleto.ACBrBoleto1.Cedente do
  begin
    CNPJCPF      := FormataCNPJ(vgBoletoDados.CedenteCPF);
    viDadosBanco := IntToStr(vgBoletoDados.BancoNumero) +'-'+ vgBoletoDados.BancoNome+
                    ' Ag�ncia: ' + vgBoletoDados.CedenteAgenciaNumero +'-'+ vgBoletoDados.CedenteAgenciaDigito +
                    ' Conta: ' + vgBoletoDados.CedenteContaNumero +'-'+ vgBoletoDados.CedenteContaDigito;
    lblDadosBanco.Visible := True;
    lblDadosBanco.Caption := viDadosBanco;

    Agencia       := vgBoletoDados.CedenteAgenciaNumero;
    AgenciaDigito := vgBoletoDados.CedenteAgenciaDigito;
    CodigoCedente := vgBoletoDados.CedenteCodigo;
    Conta         := vgBoletoDados.CedenteContaNumero;
    ContaDigito   := vgBoletoDados.CedenteContaDigito;
    Modalidade    := vgBoletoDados.CedenteModalidade;
    Convenio      := vgBoletoDados.ContaConvenio;
  end;

  lblDadosBanco.Visible := True;

  cdsRetorno.EmptyDataSet;
  CarregarRetorno;

  HabilitarCamposRetorno(True);
  lblInformacao.Visible := True;
  Screen.Cursor := crDefault;
end;

procedure TfrmGerenciadorRecebimento.InserirTaxaBoleto(vpValor : Currency; vpReferencia,
       vpBoleto : String);
begin
  ExecutaSqlAuxiliar(' INSERT INTO T_COMPROMISSO_VENCIDO( '+
                     '              COMPROMISSO_VENCIDO_ID, '+
                     '              CONTABIL_CONTA_ID, '+
                     '              VALOR_ATUAL, '+
                     '              VALOR_ORIGEM, '+
                     '              VALOR_ANTERIOR, '+
                     '              ANO_MES_REFERENCIA, '+
                     '              TIPO_OPERACAO, '+
                     '              OBRIGATORIO, '+
                     '              ATUALIZADO, '+
                     '              CENTRO_CUSTO_ID, '+
                     '              CEDENTE_ID, '+
                     '              BALANCETE_GRUPO_ID, '+
                     '              BOLETA_TAXA_ID, '+
                     '              DESCRICAO, '+
                     '              DATA_REALIZACAO, '+
                     '              SITUACAO) '+
                     ' VALUES(      :COMPROMISSO_VENCIDO_ID, '+
                     '              :CONTABIL_CONTA_ID, '+
                     '              :VALOR_ATUAL, '+
                     '              :VALOR_ORIGEM, '+
                     '              :VALOR_ANTERIOR, '+
                     '              :ANO_MES_REFERENCIA, '+
                     '              :TIPO_OPERACAO, '+
                     '              :OBRIGATORIO, '+
                     '              :ATUALIZADO, '+
                     '              :CENTRO_CUSTO_ID, '+
                     '              :CEDENTE_ID, '+
                     '              :BALANCETE_GRUPO_ID, '+
                     '              :BOLETA_TAXA_ID, '+
                     '              :DESCRICAO, '+
                     '              :DATA_REALIZACAO, '+
                     '              :SITUACAO)',2);
  with dtmControles.sqlAuxiliar do
  begin
    ParamByName('COMPROMISSO_VENCIDO_ID').AsBCD := dtmControles.GerarSequencia('T_COMPROMISSO_VENCIDO');
{    ParamByName('CONTABIL_CONTA_ID').AsBCD      := vgDadosBanco.CompromissoTaxaId;}
    ParamByName('ANO_MES_REFERENCIA').AsString  := dtmLookup.FormatarAnoMes(vpReferencia,'S');
    ParamByName('DESCRICAO').AsString           := 'Taxa de Boleto Banc�rio do Boleto n. '+vpBoleto;
    ParamByName('SITUACAO').AsString            := '2';
    ParamByName('TIPO_OPERACAO').AsString       := 'C';
    ParamByName('OBRIGATORIO').AsString         := 'N';
    ParamByName('VALOR_ORIGEM').AsCurrency      := vpValor;
    ParamByName('VALOR_ANTERIOR').AsCurrency    := 0;
    ParamByName('ATUALIZADO').AsString          := 'A';
    ParamByName('CENTRO_CUSTO_ID').AsBCD        := dtmControles.GetInt(' SELECT CENTRO_CUSTO_ID FROM T_CENTRO_CUSTO '+
                                                     ' WHERE PRINCIPAL = ''S'''+
                                                     ' AND CEDENTE_ID = '+ IntToStr(vgCedenteAtivo)+
                                                     ' AND BALANCETE_GRUPO_ID = '+ InttoStr(vgBalancetePrincipal));
    ParamByName('CEDENTE_ID').AsBCD             := vgCedenteAtivo;
    ParamByName('BALANCETE_GRUPO_ID').AsBCD     := vgBalancetePrincipal;
    ParamByName('VALOR_ATUAL').AsCurrency       := vpValor;
    ParamByName('DATA_REALIZACAO').AsString     := dtmControles.DataHoraBanco(5);
    ParamByName('BOLETA_TAXA_ID').AsString      := vpBoleto;
    ExecSQL;
  end;
end;

procedure TfrmGerenciadorRecebimento.LancarCompromissoAnteriores;
begin
   Screen.Cursor := crHourGlass;
   sqlCompromissosAntigos.Active := False;
   sqlCompromissosAntigos.SQL.Text := ' SELECT DISTINCT(BOLETA_ID) AS RECIBO '+
                                      ' FROM T_COMPROMISSO_VENCIDO '+
                                      ' WHERE ANO_MES_REALIZADO between 201701 and 201704 '+
                                      '   AND NOT BOLETA_ID IS NULL ';
   sqlCompromissosAntigos.Active := True;

   with sqlCompromissosAntigos do
   begin
     while not Eof do
     begin
       dtmLookupContabil.CarregarRegistrarLivroCaixa(FieldByName('RECIBO').AsString, 'BOLETA_ID', 'B','','', 2,0,0,0);
       Next;
     end;
   end;

   Screen.Cursor := crHourGlass;
   sqlCompromissosAntigos.Active := False;
   sqlCompromissosAntigos.SQL.Text := ' SELECT DISTINCT(RECIBO_NUMERO) AS RECIBO '+
                                      ' FROM T_COMPROMISSO_VENCIDO '+
                                      ' WHERE ANO_MES_REALIZADO between 201701 and 201704 '+
                                      '   AND NOT RECIBO_NUMERO IS NULL ';
   sqlCompromissosAntigos.Active := True;

   with sqlCompromissosAntigos do
   begin
     while not Eof do
     begin
       dtmLookupContabil.CarregarRegistrarLivroCaixa(FieldByName('RECIBO').AsString, 'RECIBO_NUMERO', 'D', '', '', 1,0,0,0);
       Next;
     end;
   end;
  Screen.Cursor := crDefault;
end;

procedure TfrmGerenciadorRecebimento.lblDesmarcarClick(Sender: TObject);
begin
  MarcarDesmarcarAssociado('N');
  sqlAssociadosAtivos.Refresh;
end;

procedure TfrmGerenciadorRecebimento.lblMarcarClick(Sender: TObject);
begin
  MarcarDesmarcarAssociado('S');
  sqlAssociadosAtivos.Refresh;
end;

procedure TfrmGerenciadorRecebimento.lcxGrupoAssociadoPropertiesEditValueChanged(
  Sender: TObject);
begin
  if lcxGrupoAssociado.EditValue <> null then
  begin
    vlNaoFiltrarCompromisso := True;
    PesquisarAssociadoGrupo(IntToStr(lcxGrupoAssociado.EditValue));
    vlNaoFiltrarCompromisso := False;
    cxGridAssociados.SetFocus;
    CarregarCompromissosVencidos;    
  end;
end;

procedure TfrmGerenciadorRecebimento.LimparCampos;
begin
  HabilitarCamposRetorno(False);
  cdsRetorno.EmptyDataSet;
  tabConfimacaoBoletos.Tabs[0].Caption := 'Boletos Pagos';
  tabConfimacaoBoletos.Tabs[1].Caption := 'Confirmados Remessa/Outros';
  tabConfimacaoBoletos.Tabs[2].Caption := 'Baixa Decurso Prazo/Outros';
  cxProgressRetorno.Visible := False;
  lblInformacao.Visible     := False;
  lblDadosBanco.Visible     := False;

  edtRetorno.Clear;
end;

procedure TfrmGerenciadorRecebimento.MarcarDesmarcarAssociado(vpMarcar : String; vpGrupo : String = '');
var
  viSql : String;
begin
  Screen.Cursor := crHourGlass;
  viSql := ' UPDATE T_PESSOA SET SELECIONADO = '+ QuotedStr(vpMarcar)+
           ' WHERE SITUACAO IN (''1'', ''3'')'+
           '   AND CEDENTE_ID = '+ IntToStr(vgCedenteAtivo);
  if vpGrupo <> '' then
    viSql := viSql + ' AND PESSOA_GRUPO_ID = '+ vpGrupo;
  ExecutaSqlAuxiliar(viSql, 1);
  Screen.Cursor := crDefault;
end;

procedure TfrmGerenciadorRecebimento.MarcarDesmarcarCompromissos(vpMarcar : String; vpCompromisso : String = '';
           vpMesReferencia : string = '');
var
  viSql : String;
begin
  Screen.Cursor := crHourGlass;
  viSql := ' UPDATE T_COMPROMISSO_VENCIDO SET SELECIONADO = '+ QuotedStr(vpMarcar)+
           ' WHERE SITUACAO IN (''1'')'+
           '   AND CEDENTE_ID = '+ IntToStr(vgCedenteAtivo);


  if vpCompromisso <> '' then
    viSql := viSql + ' AND CONTABIL_CONTA_ID = '+ vpCompromisso;

  if vpMesReferencia <> '' then
  begin
    if rdbAte.Checked then
         viSql := viSql + ' AND ANO_MES_REFERENCIA <= '+ QuotedStr(copy(vpMesReferencia,4,4) + copy(vpMesReferencia,1,2))+
                          ' AND BOLETA_ID IS NULL '
    else viSql := viSql + ' AND ANO_MES_REFERENCIA = '+ QuotedStr(copy(vpMesReferencia,4,4) + copy(vpMesReferencia,1,2))+
                          ' AND BOLETA_ID IS NULL ';
  end;

  ExecutaSqlAuxiliar(viSql, 1);
  Screen.Cursor := crDefault;
end;

procedure TfrmGerenciadorRecebimento.MenuItem1Click(Sender: TObject);
var
  viGrupo : String;
begin
  {if Application.MessageBox('Refazer Lan�amentos no Livro Caixa. Confirma??',
      'Confirma��o', MB_YESNO) = IDNO then
      exit;

   sqlReciboAgrupado.First;
   while not sqlReciboAgrupado.Eof do
   begin
     if sqlReciboAgrupadoQUITADO_GRUPO_ID.IsNull then
          viGrupo := ''
     else viGrupo := dtmControles.GetStr(' SELECT DESCRICAO FROM T_PESSOA_GRUPO WHERE PESSOA_GRUPO_ID = '+ sqlReciboAgrupadoQUITADO_GRUPO_ID.AsString);

     ExecutaSqlAuxiliar(' DELETE FROM J_LIVRO_CAIXA '+
                        ' WHERE DOC_TIPO = '+QuotedStr('EB')+
                        '  AND IDENTIFICACAO_ID = '+sqlReciboAgrupadoRECIBO_NUMERO.AsString,1);

     dtmLookupContabil.CarregarRegistrarLivroCaixa(sqlReciboAgrupadoRECIBO_NUMERO.AsString, 'RECIBO_NUMERO', 'B', '',
                                                   viGrupo, vlCaixaBoletoId,0,0,0);

     sqlBoletosRegistrados.Next;
   end;
   ShowMessage('OPERA��O CONCLUIDA!!!');}
end;

function TfrmGerenciadorRecebimento.MontarNossoNumero(vpNossoNumero,
  vpConvenio: String): String;
begin
  if (Length(vpConvenio) = 6) then // Quando o conv�nio tem 6 d�gitos o N.N. n�o possui d�gito verificador
    Result := Padl(vpConvenio, 6, '0') + Padl(vpNossoNumero, 11, '0')
  else
    Result := Padl(vpConvenio, 6, '0') + Padl(vpNossoNumero, 5, '0');
end;


procedure TfrmGerenciadorRecebimento.popBoletaCancelarClick(Sender: TObject);
begin
  if not dtmLookupFinanceiro.CancelarBoleto(sqlCompromissosBOLETA_ID.AsString) then
    exit;

  CarregarCompromissosVencidos;
  btnGerarRemessa.Enabled := dtmLookupBoleto.VerificarGerarRemessa;
  sqlCompromissos.Refresh;
end;

procedure TfrmGerenciadorRecebimento.popBoletaVisualizarClick(Sender: TObject);

  procedure Visualizar(vpAbortar : Boolean = False);
  begin
    if FileExists(vgCaminhoArquivo) then
    begin
      Screen.Cursor := crHourGlass;
      ExibirFormulario(TfrmVisualizaBoleto, frmVisualizaBoleto, True)
    end
    else
      if vpAbortar then
      begin
        Application.MessageBox('Arquivo da Fatura n�o encontrado!!!','Informa��o', MB_ICONINFORMATION + MB_OK);
        abort;
      end;
  end;
begin
  if vlBoletoVisualizar = '' then
    vlBoletoVisualizar := sqlCompromissosBOLETA_ID.AsString;

  vgCaminhoArquivo := dtmControles.GetStr(' SELECT CAMINHO_ARQUIVO FROM T_BOLETA '+
                                          ' WHERE BOLETA_ID = '+ vlBoletoVisualizar);
  if FileExists(vgCaminhoArquivo) then
    Visualizar
  else
  begin
    vgCaminhoArquivo := dtmLookupContabil.LocalizarBoleto(sqlCompromissosPESSOA_ID.AsString, sqlAssociadosAtivos.FieldByName('PESSOA_GRUPO_ID').AsString, vlBoletoVisualizar);
    Visualizar(True);
  end;
  vlBoletoVisualizar := '';
end;

procedure TfrmGerenciadorRecebimento.popEstornarRegistroClick(Sender: TObject);
begin
  if sqlBoletosRegistradosSITUACAO.AsInteger <> 2 then
  begin
    Application.MessageBox('Estorno n�o permitido!!!','Informa��o', MB_ICONINFORMATION + MB_OK);
    exit;
  end;

  dtmLookup.VerificarEdicao(IntToStr(dtmLookup.PegarAnoMes(sqlBoletosRegistradosDATA_PAGAMENTO.AsString)), 'Estorno');

  if Application.MessageBox('Estornar Registro da Fatura?',
      'Confirma��o', MB_YESNO) = IDNO then
    exit;

  if (LiberarPermissaoUsuario('ESP_CANCELAR_BOLETOS')[6] = '0') then
    exit;

  // Estorna Boleto
  ExecutaSqlAuxiliar(' UPDATE T_BOLETA SET DATA_PAGAMENTO = NULL,' +
                     '                            ORDEM   = :ORDEM, '+
                     '                           SITUACAO = :SITUACAO '+
                     ' WHERE CEDENTE_ID = '+IntToStr(vgCedenteAtivo)+
                     '   AND BOLETA_ID = '+ sqlBoletosRegistradosBOLETA_ID.AsString,2);

  With dtmControles.sqlAuxiliar do
  begin
    ParamByName('ORDEM').AsInteger   := dtmControles.GerarSequencia('BOLETO_ORDEM'+IntToStr(vgCedenteAtivo));
    ParamByName('SITUACAO').AsString := '1';
    ExecSQL;
  end;

  // Estorna Compromissos
  ExecutaSqlAuxiliar(' UPDATE T_COMPROMISSO_VENCIDO SET DATA_REALIZACAO = NULL,' +
                     '                            DESCRICAO   = NULL, '+
                     '                    ANO_MES_REALIZADO   = NULL, '+
                     '                           SITUACAO = ''1'''+
                     ' WHERE CEDENTE_ID = '+IntToStr(vgCedenteAtivo)+
                     '   AND BOLETA_ID = '+ sqlBoletosRegistradosBOLETA_ID.AsString,1);

  // Exclui a Multa gerada
  ExecutaSqlAuxiliar(' DELETE FROM T_COMPROMISSO_VENCIDO ' +
                     ' WHERE BOLETA_MULTA_ID = '+sqlBoletosRegistradosBOLETA_ID.AsString+
                     '   AND CEDENTE_ID = '+IntToStr(vgCedenteAtivo),1);

  // Exclui a Taxa de boleto gerada
  ExecutaSqlAuxiliar(' DELETE FROM T_COMPROMISSO_VENCIDO ' +
                     ' WHERE BOLETA_TAXA_ID = '+sqlBoletosRegistradosBOLETA_ID.AsString+
                     '   AND CEDENTE_ID = '+IntToStr(vgCedenteAtivo),1);

   // Exclui do Caixa
   ExecutaSqlAuxiliar(' DELETE FROM J_LIVRO_CAIXA '+
                      ' WHERE DOCUMENTO_NUMERO = '+ QuotedStr(sqlBoletosRegistradosBOLETA_ID.AsString)+
                      '   AND DOC_TIPO = ''EB''',1);

  sqlCompromissos.Refresh;
  icxSituacaoBoleto.EditValue := '1';
  btnPesquisarBoletosRegistradosClick(self);
  sqlBoletosRegistrados.First;
  Application.MessageBox('Registro da fatura estornado!!!','Informa��o', MB_ICONINFORMATION + MB_OK);
end;

procedure TfrmGerenciadorRecebimento.popMarcarDesmarcarGrupoClick(
  Sender: TObject);
begin
  if sqlAssociadosAtivos.FieldByName('SELECIONADO').AsString = 'S' then
       MarcarDesmarcarAssociado('N', sqlAssociadosAtivos.FieldByName('PESSOA_GRUPO_ID').AsString)
  else MarcarDesmarcarAssociado('S', sqlAssociadosAtivos.FieldByName('PESSOA_GRUPO_ID').AsString);
  sqlAssociadosAtivos.Refresh;
end;

procedure TfrmGerenciadorRecebimento.mniRefazerLivroCaixaClick(Sender: TObject);
var
  viGrupo : String;
begin
  if Application.MessageBox('Refazer Lan�amentos no Livro Caixa. Confirma??',
      'Confirma��o', MB_YESNO) = IDNO then
      exit;

   sqlBoletosRegistrados.First;
   while not sqlBoletosRegistrados.Eof do
   begin
     if sqlBoletosRegistradosPESSOA_GRUPO_ID.IsNull then
          viGrupo := ''
     else viGrupo := dtmControles.GetStr(' SELECT DESCRICAO FROM T_PESSOA_GRUPO WHERE PESSOA_GRUPO_ID = '+ sqlBoletosRegistradosPESSOA_GRUPO_ID.AsString);

     ExecutaSqlAuxiliar(' DELETE FROM J_LIVRO_CAIXA '+
                        ' WHERE DOC_TIPO = '+QuotedStr('EB')+
                        '  AND IDENTIFICACAO_ID = '+sqlBoletosRegistradosBOLETA_ID.AsString,1);

     dtmLookupContabil.CarregarRegistrarLivroCaixa(sqlBoletosRegistradosBOLETA_ID.AsString, 'BOLETA_ID', 'B', '',
                                                   viGrupo, vlCaixaBoletoId,0,0,0);
     sqlBoletosRegistrados.Next;
   end;
   ShowMessage('OPERA��O CONCLUIDA!!!');
end;

procedure TfrmGerenciadorRecebimento.RegistrarArquivoRetorno(vpTipo, vpNomeArquivo : String;
               vpQtdPago, vpQtdRemessa, vpQtdRegistrado, vpQtdBaixa, vpId : Integer);
begin
  ExecutaSqlAuxiliar(' INSERT INTO T_BOLETA_REMESSA_RETORNO( '+
                     '              BOLETA_REMESSA_RETORNO_ID, '+
                     '              DATA, '+
                     '              NOME_ARQUIVO, '+
                     '              TIPO, '+
                     '              QTD_REG_PAGO, '+
                     '              QTD_REG_REMESSA, '+
                     '              QTD_REG_BAIXADO, '+
                     '              QTD_REG_CONFIRMADO) '+
                     ' VALUES(      :BOLETA_REMESSA_RETORNO_ID, '+
                     '              :DATA, '+
                     '              :NOME_ARQUIVO, '+
                     '              :TIPO, '+
                     '              :QTD_REG_PAGO, '+
                     '              :QTD_REG_REMESSA, '+
                     '              :QTD_REG_BAIXADO, '+
                     '              :QTD_REG_CONFIRMADO)',2);
  with dtmControles.sqlAuxiliar do
  begin
    ParamByName('BOLETA_REMESSA_RETORNO_ID').AsBCD := vpId;
    ParamByName('DATA').AsString                   := dtmControles.DataHoraBanco(5);
    ParamByName('NOME_ARQUIVO').AsString           := vpNomeArquivo;
    ParamByName('TIPO').AsString                   := vpTipo;
    ParamByName('QTD_REG_PAGO').AsInteger          := vpQtdPago;
    ParamByName('QTD_REG_REMESSA').AsInteger       := vpQtdRemessa;
    ParamByName('QTD_REG_CONFIRMADO').AsInteger    := vpQtdRegistrado;
    ParamByName('QTD_REG_BAIXADO').AsInteger       := vpQtdBaixa;
    ExecSQL;
  end;
end;

procedure TfrmGerenciadorRecebimento.RegistrarEntrada(vpBoleto : Integer; vpDate : TDate;
           vpRetornoId : Integer = 0);
var
  viSql, viPessoaMulta : String;
begin
  if vpBoleto > 0 then
  begin

    viSql := ' SELECT COMPROMISSO_VENCIDO_ID, SITUACAO, DATA_REALIZACAO, '+
             '        DESCRICAO, PESSOA_NOME, CAIXA_ID, '+
             '        PESSOA_ID, CONTABIL_CONTA_ID, ANO_MES_REALIZADO '+
             ' FROM T_COMPROMISSO_VENCIDO '+
             ' WHERE BOLETA_ID = '+ IntToStr(vpBoleto);

    ExecutaSimpleDSAux(viSql, 0);
    With dtmControles.SimpleAuxiliar do
    begin
      First;
      viPessoaMulta := '';
      while not eof do
      begin
        edit;
        FieldByName('SITUACAO').AsString           := '2';
        FieldByName('DATA_REALIZACAO').AsDateTime  := vpDate;
        FieldByName('PESSOA_NOME').AsString        := dtmControles.GetStr(' SELECT NOME FROM T_PESSOA WHERE PESSOA_ID = ' +FieldByName('PESSOA_ID').AsString);
        FieldByName('CAIXA_ID').AsInteger          := vlCaixaBoletoId;
        FieldByName('ANO_MES_REALIZADO').AsInteger := dtmLookup.PegarAnoMes(DateToStr(vpDate));
        FieldByName('DESCRICAO').AsString          := FieldByName('PESSOA_NOME').AsString + ' - ' +
                                                     dtmControles.GetStr(' SELECT DESCRICAO FROM T_CONTABIL_CONTA WHERE CONTABIL_CONTA_ID = ' +FieldByName('CONTABIL_CONTA_ID').AsString);
        post;
        next;
      end;
    end;

    ExecutaSqlAuxiliar(' UPDATE T_BOLETA SET DATA_PAGAMENTO   = :DATA,'+
                       '                            ORDEM     = :ORDEM, '+
                       '                           SITUACAO   = :SITUACAO, '+
                       '                           RETORNO_ID = '+RetNullInteger(vpRetornoId)+
                       ' WHERE BOLETA_ID = '+ IntToStr(vpBoleto),2);

    With dtmControles.sqlAuxiliar do
    begin
      ParamByName('ORDEM').AsInteger   := dtmControles.GerarSequencia('BOLETO_ORDEM'+IntToStr(vgCedenteAtivo));
      ParamByName('DATA').AsString     := FormatDateTime('DD.MM.YYYY HH:MM:SS', vpDate);
      ParamByName('SITUACAO').AsString := '2';
      ExecSQL;
    end;
  end;

end;

procedure TfrmGerenciadorRecebimento.Panel8Click(Sender: TObject);
begin
//  LancarCompromissoAnteriores;
end;

procedure TfrmGerenciadorRecebimento.ParametrosRelatorioRecibo;
var
  vpSql, vpComplemento : string;
  vpValorDivida, ValorAPagar : Currency;
begin
  frxReportNAoAss.Variables.Variables['DataDocumento']        := QuotedStr(FormatDateTime('dd ''de'' mmmm ''de'' yyyy', vgDadosConfirmacao.data));

  if vgReciboNaoAssociadoId = 0 then
  begin
    if not vgCompromissoRealizado then
    begin
      if (lcxGrupoAssociado.EditValue <> null) or (sqlAssociadoBoleto.FieldByName('CPF').AsString = '') then
           frxReportNAoAss.Variables.Variables['SacadoCPFCGC']     := QuotedStr('')
      else
        if length(sqlAssociadoBoleto.FieldByName('CPF').AsString) > 11 then
           frxReportNAoAss.Variables.Variables['SacadoCPFCGC'] := QuotedStr(' - '+  FormataCNPJ(sqlAssociadoBoleto.FieldByName('CPF').AsString))
      else frxReportNAoAss.Variables.Variables['SacadoCPFCGC'] := QuotedStr(' - '+  FormataCPF(sqlAssociadoBoleto.FieldByName('CPF').AsString));

      if lcxGrupoAssociado.EditValue <> null then
      begin
        frxReportNAoAss.Variables.Variables['FAMILIAR']   := QuotedStr('S');
        frxReportNAoAss.Variables.Variables['SacadoNome'] := QuotedStr('Grupo Associado '+ lcxGrupoAssociado.Text);
      end
      else
      begin
        frxReportNAoAss.Variables.Variables['FAMILIAR']   := QuotedStr('N');
        frxReportNAoAss.Variables.Variables['SacadoNome'] := QuotedStr(sqlAssociadoBoleto.FieldByName('NOME').AsString);
      end;
      frxReportNAoAss.Variables.Variables['RECIBO_NUMERO'] := vgBoletoDados.ContaNossoNumero;
    end
    else
    begin
      // Reimpressao do Recibo
      if (sqlCompromissoRealizadoQUITADO_GRUPO_ID.AsInteger > 0) or (sqlAssociadoBoleto.FieldByName('CPF').AsString = '') then
           frxReportNAoAss.Variables.Variables['SacadoCPFCGC']     := QuotedStr('')
      else
        if length(sqlAssociadoBoleto.FieldByName('CPF').AsString) > 11 then
           frxReportNAoAss.Variables.Variables['SacadoCPFCGC'] := QuotedStr(' - '+  FormataCNPJ(sqlAssociadoBoleto.FieldByName('CPF').AsString))
      else frxReportNAoAss.Variables.Variables['SacadoCPFCGC'] := QuotedStr(' - '+  FormataCPF(sqlAssociadoBoleto.FieldByName('CPF').AsString));

      if (sqlCompromissoRealizadoQUITADO_GRUPO_ID.AsInteger > 0) then
      begin
        frxReportNAoAss.Variables.Variables['FAMILIAR']   := QuotedStr('S');
        frxReportNAoAss.Variables.Variables['SacadoNome'] := QuotedStr('Grupo Associado '+
                              dtmControles.GetStr(' SELECT DESCRICAO FROM T_PESSOA_GRUPO WHERE PESSOA_GRUPO_ID = '+ sqlCompromissoRealizadoQUITADO_GRUPO_ID.AsString));
      end
      else
      begin
        frxReportNAoAss.Variables.Variables['FAMILIAR']   := QuotedStr('N');
        frxReportNAoAss.Variables.Variables['SacadoNome'] := QuotedStr(sqlAssociadoBoleto.FieldByName('NOME').AsString);
      end;
      frxReportNAoAss.Variables.Variables['RECIBO_NUMERO'] := QuotedStr(sqlCompromissoRealizadoRECIBO_NUMERO.AsString);
    end;

    // Soma o total de divida pendente
    vpComplemento := '';
    vpSql := ' SELECT SUM(CV.VALOR_ATUAL) '+
             ' FROM T_COMPROMISSO_VENCIDO CV LEFT OUTER JOIN T_PESSOA P '+
             '   ON CV.PESSOA_ID = P.PESSOA_ID ' +
             ' WHERE CV.CEDENTE_ID = '+ IntToStr(vgCedenteAtivo);
    if not vgCompromissoRealizado then
    begin
      vpSql := vpSql + '   AND CV.SITUACAO = ''1''';
      if lcxGrupoAssociado.EditValue <> null then
           vpSql := vpSql + '   AND P.PESSOA_GRUPO_ID = '+IntToStr(lcxGrupoAssociado.EditingValue)
      else vpSql := vpSql + '   AND CV.PESSOA_ID = '+sqlAssociadoBoleto.FieldByName('PESSOA_ID').AsString;
    end
    else
    begin
      vpComplemento := '  AND (CV.SITUACAO = ''1'' OR RECIBO_NUMERO = '+sqlCompromissoRealizadoRECIBO_NUMERO.AsString+ ')';
      if sqlCompromissoRealizadoQUITADO_GRUPO_ID.AsInteger > 0 then
           vpComplemento := vpComplemento + '   AND P.PESSOA_GRUPO_ID = '+ sqlCompromissoRealizadoQUITADO_GRUPO_ID.AsString
      else vpComplemento := vpComplemento + '   AND CV.PESSOA_ID = '+ sqlCompromissoRealizadoPESSOA_ID.AsString;
    end;

    vpValorDivida := dtmControles.GetFloat(vpSql+vpComplemento);
    // ****

    if not vgCompromissoRealizado then
         vpSql := vpSql + ' AND CV.SELECIONADO = ''S'''
    else vpSql := vpSql + ' AND RECIBO_NUMERO = '+sqlCompromissoRealizadoRECIBO_NUMERO.AsString;

    ValorAPagar := dtmControles.GetFloat(vpSql);

    if vgReciboNaoAssociadoId = 0 then
      frxReportNAoAss.Variables.Variables['Resumo'] := QuotedStr('>> Resumo:  *Valor do d�bito na Tesouraria = '+FormatFloat(',#0.00', vpValorDivida)+
                                                  '       *Valor deste recibo = '+FormatFloat(',#0.00', ValorAPagar)+
                                                  '       *Valor do restante do d�bito = '+FormatFloat(',#0.00', vpValorDivida-(ValorAPagar)));
  end
  else frxReportNAoAss.Variables.Variables['SacadoNome'] := sqlCompromissoBoletoPESSOA_NOME.AsString;
end;

procedure TfrmGerenciadorRecebimento.PesquisarAssociadoGrupo(vpGrupo: String);
var
  viSql, viSituacao : String;
begin
  if vpGrupo = '' then
       viSql := ' SELECT NOME, PESSOA_ID, PESSOA_GRUPO_ID, SELECIONADO, CPF, SITUACAO, FATURA_TIPO  '
  else viSql := ' SELECT PESSOA_GRUPO_ID, FATURA_TIPO, SELECIONADO ';

  viSql := viSql + ' FROM T_PESSOA '+
                   ' WHERE CEDENTE_ID = '+ IntToStr(vgCedenteAtivo);

  if vgSocioAfastado = 0 then
  begin
    if rdbRegistroSocio.Checked then
         viSql := viSql +' AND SITUACAO IN (''1'', ''3'')'
    else viSql := viSql +' AND SITUACAO = ''0''';
  end
  else
  begin
    viSql := viSql +' AND SITUACAO IN (''2'', ''4'', ''5'')'+
                    ' AND PESSOA_ID = ' +IntToStr(vgSocioAfastado);
    rdbRegistroSocio.enabled  := False;
    rdbRegistroAvulso.enabled := False;
  end;

  vgSocioAfastado := 0;
                         
  if vpGrupo <> '' then
    viSql := viSql + ' AND PESSOA_GRUPO_ID = '+ vpGrupo+
                     ' GROUP BY PESSOA_GRUPO_ID, FATURA_TIPO, SELECIONADO '
  else viSql := viSql + ' ORDER BY NOME ';

  cxGridDBNome.Visible      := vpGrupo = '';
  lblMarcar.Visible         := vpGrupo = '';
  lblDesmarcar.Visible      := vpGrupo = '';
//  cxGridDBSecionado.Options.Editing  := vpGrupo = '';
//  cxGridDBSecionado.Options.Focusing := vpGrupo = '';

  sqlAssociadosAtivos.AfterScroll := nil;
  sqlAssociadosAtivos.Active := False;
  sqlAssociadosAtivos.SQL.Text := viSql;
  sqlAssociadosAtivos.Active := True;
end;

procedure TfrmGerenciadorRecebimento.PesquisarBoletosRegCancelados(vpI9Query : TI9Query;
            vpMesInicial, vpMesFinal, vpTipo, vpNumero : String);
var
  visql : String;
begin
  viSql := ' SELECT B.BOLETA_ID, B.VALOR, B.PESSOA_ID, B.PESSOA_GRUPO_ID, B.DATA_EMISSAO, B.BOLETA_COMPROMISSOS_ID, '+
           '          P.NOME, G.DESCRICAO, B.DATA_PAGAMENTO, B.ANO_MES_BOLETO, B.SITUACAO, B.DATA_CANCELADO '+
           '   FROM T_BOLETA B '+
           '     LEFT OUTER JOIN T_PESSOA P '+
           '     ON B.PESSOA_ID = P.PESSOA_ID '+
           '     LEFT OUTER JOIN T_PESSOA_GRUPO G '+
           '     ON B.PESSOA_GRUPO_ID = G.PESSOA_GRUPO_ID '+
           '   WHERE B.CEDENTE_ID = '+ IntToStr(vgCedenteAtivo);

  if vpNumero <> '' then
    viSql := viSql + '  AND B.BOLETA_ID = '+ vpNumero
  else
  begin
    viSql := viSql + '  AND B.ANO_MES_BOLETO BETWEEN '+vpMesInicial+ ' AND '+ vpMesFinal;

    if vpTipo <> '' then
      viSql := viSql + ' AND B.SITUACAO = '+ QuotedStr(vpTipo);
  end;

  viSql := viSql + ' ORDER BY B.ORDEM, P.NOME ';

  vpI9Query.Active := False;
  vpI9Query.SQL.Text := visql;
  vpI9Query.Active := True;
  vpI9Query.First;
end;

procedure TfrmGerenciadorRecebimento.sbnLimparFiltroClick(Sender: TObject);
begin
  vlNaoFiltrarCompromisso := True;
  lcxGrupoAssociado.EditValue := null;
  PesquisarAssociadoGrupo('');
  vlNaoFiltrarCompromisso := False;
  cxGridAssociados.SetFocus;
  CarregarCompromissosVencidos;  
end;

procedure TfrmGerenciadorRecebimento.sqlAssociadoBoletoAfterScroll(
  DataSet: TDataSet);
begin
  if vlFiltrarCompromissoBoleto then
    FiltrarCompromissoBoleto(sqlAssociadoBoleto.FieldByName('PESSOA_ID').AsString,'','');
end;

procedure TfrmGerenciadorRecebimento.sqlAssociadosAtivosAfterPost(
  DataSet: TDataSet);
begin
  vlNaoFiltrarCompromisso := False;
end;

procedure TfrmGerenciadorRecebimento.sqlAssociadosAtivosBeforeEdit(
  DataSet: TDataSet);
begin
  vlNaoFiltrarCompromisso := True;
end;

procedure TfrmGerenciadorRecebimento.sqlBoletosRegistradosAfterScroll(
  DataSet: TDataSet);
begin
  popEstornarRegistro.Enabled := (not sqlBoletosRegistrados.IsEmpty) and (sqlBoletosRegistradosSituacao.AsInteger = 2);
  popRecuperarBoleto.Enabled  := (not sqlBoletosRegistrados.IsEmpty) and (sqlBoletosRegistradosSituacao.AsInteger = 3);
end;

procedure TfrmGerenciadorRecebimento.sqlBoletosRegistradosCalcFields(
  DataSet: TDataSet);
begin
  sqlBoletosRegistradoscalc_referencia.AsString := dtmLookup.FormatarAnoMes(sqlBoletosRegistrados.FieldByName('ANO_MES_BOLETO').AsString);
  if sqlBoletosRegistradosPESSOA_ID.IsNull then
       sqlBoletosRegistradoscalc_Nome.AsString := sqlBoletosRegistradosDESCRICAO.AsString
  else sqlBoletosRegistradoscalc_Nome.AsString := sqlBoletosRegistradosNOME.AsString;

  case sqlBoletosRegistradosSITUACAO.AsInteger of
    1 : sqlBoletosRegistradoscalc_DataSituacao.AsSQLTimeStamp := sqlBoletosRegistradosDATA_EMISSAO.AsSQLTimeStamp;
    2 : sqlBoletosRegistradoscalc_DataSituacao.AsSQLTimeStamp := sqlBoletosRegistradosDATA_PAGAMENTO.AsSQLTimeStamp;
    3 : sqlBoletosRegistradoscalc_DataSituacao.AsSQLTimeStamp := sqlBoletosRegistradosDATA_CANCELADO.AsSQLTimeStamp;
  end;
end;

procedure TfrmGerenciadorRecebimento.sqlCompromissoBoletoCalcFields(
  DataSet: TDataSet);
begin
  sqlCompromissoBoletocalc_referencia.AsString := dtmLookup.FormatarAnoMes(sqlCompromissoBoleto.FieldByName('ANO_MES_REFERENCIA').AsString);
end;

procedure TfrmGerenciadorRecebimento.sqlCompromissoRealizadoAfterScroll(
  DataSet: TDataSet);
begin
  btnEstornarRecibo.Enabled   := (not sqlCompromissoRealizado.IsEmpty) and
                                (sqlCompromissoRealizadoRECIBO_NUMERO.AsInteger > 0);
  btnReimprimirRecibo.Enabled := (not sqlCompromissoRealizado.IsEmpty) and
                                (sqlCompromissoRealizadoRECIBO_NUMERO.AsInteger > 0);

  rdbReciboSelecionado.Enabled := btnReimprimirRecibo.Enabled;
  rdbReciboTodos.Enabled       := btnReimprimirRecibo.Enabled;
end;

procedure TfrmGerenciadorRecebimento.sqlCompromissoRealizadoCalcFields(
  DataSet: TDataSet);
begin
  sqlCompromissoRealizadocalc_referencia.AsString := dtmLookup.FormatarAnoMes(sqlCompromissoRealizadoANO_MES_REFERENCIA.AsString);
  if sqlCompromissoRealizadoBOLETA_ID.AsInteger > 0 then
  begin
    sqlCompromissoRealizadocalc_TipoDocumento.AsString   := '1';
    sqlCompromissoRealizadocalc_NumeroDocumento.AsString := sqlCompromissoRealizadoBOLETA_ID.AsString;
  end
  else
  begin
    if sqlCompromissoRealizadoRECIBO_NUMERO.AsInteger > 0 then
    begin
      sqlCompromissoRealizadocalc_TipoDocumento.AsString   := '2';
      sqlCompromissoRealizadocalc_NumeroDocumento.AsString := sqlCompromissoRealizadoRECIBO_NUMERO.AsString;
    end;
  end;
  sqlCompromissoRealizadocalc_NaoAssociado.AsBoolean := not sqlCompromissoRealizadoPESSOA_ID.IsNull;
end;

procedure TfrmGerenciadorRecebimento.sqlCompromissosAfterPost(
  DataSet: TDataSet);
begin
  ExecutaSqlAuxiliar(' UPDATE T_COMPROMISSO_VENCIDO SET SELECIONADO = '+QuotedStr(sqlCompromissosSELECIONADO.AsString)+
                     ' WHERE COMPROMISSO_VENCIDO_ID = '+ sqlCompromissosCOMPROMISSO_VENCIDO_ID.AsString+
                     ' AND CEDENTE_ID = ' +IntToStr(vgCedenteAtivo),1);
end;

procedure TfrmGerenciadorRecebimento.sqlCompromissosAfterScroll(
  DataSet: TDataSet);
begin
  btnRecebimentoRecibo.Enabled := not sqlCompromissos.IsEmpty;
  popBoletaCancelar.Enabled    := not sqlCompromissosBOLETA_ID.IsNull;
  popBoletaVisualizar.Enabled  := not sqlCompromissosBOLETA_ID.IsNull;
end;

procedure TfrmGerenciadorRecebimento.sqlCompromissosCalcFields(
  DataSet: TDataSet);
begin
  sqlCompromissoscalc_referencia.AsString := dtmLookup.FormatarAnoMes(sqlCompromissosANO_MES_REFERENCIA.AsString);
  if sqlCompromissosBOLETA_ID.IsNull then
       sqlCompromissoscalc_Travado.AsString := 'N'
  else sqlCompromissoscalc_Travado.AsString := 'S';

  if sqlCompromissosSELECIONADO.AsString = 'S' then
       sqlCompromissoscalc_ValorPagar.AsCurrency :=  sqlCompromissosVALOR_ATUAL.AsCurrency
  else sqlCompromissoscalc_ValorPagar.AsCurrency :=  0;
end;

procedure TfrmGerenciadorRecebimento.sqlReciboAgrupadoAfterPost(
  DataSet: TDataSet);
begin
  if vgCarregandoRecibos then
    exit;
  ExecutaSqlAuxiliar(' UPDATE T_COMPROMISSO_VENCIDO SET EMAIL_ENCAMINHAR = '+QuotedStr(sqlReciboAgrupadoCALC_EMAIL.AsString)+
                     ' WHERE RECIBO_NUMERO = '+sqlReciboAgrupadoRECIBO_NUMERO.AsString,1);
end;

procedure TfrmGerenciadorRecebimento.sqlReciboAgrupadoCalcFields(
  DataSet: TDataSet);
begin
  if sqlReciboAgrupadoQUITADO_GRUPO_ID.AsInteger > 0 then
    sqlReciboAgrupadoCALC_APRESENTANTE.AsString := dtmControles.GetStr(' SELECT DESCRICAO '+
                                                                       ' FROM T_PESSOA_GRUPO '+
                                                                       ' WHERE PESSOA_GRUPO_ID = '+sqlReciboAgrupadoQUITADO_GRUPO_ID.AsString)
  else sqlReciboAgrupadoCALC_APRESENTANTE.AsString := sqlReciboAgrupadoNOME_RECIBO.AsString;
end;

procedure TfrmGerenciadorRecebimento.sqlRegistrarCompromissosCalcFields(
  DataSet: TDataSet);
begin
  sqlRegistrarCompromissoscalc_referencia.AsString := dtmLookup.FormatarAnoMes(sqlRegistrarCompromissos.FieldByName('ANO_MES_REFERENCIA').AsString);
end;

procedure TfrmGerenciadorRecebimento.tabBoletoChange(Sender: TObject);
begin
//  CarregarCompromissosVencidos(tabBoleto.TabIndex);
end;

procedure TfrmGerenciadorRecebimento.tabBoletoDblClick(Sender: TObject);
begin
  pgcGerenciador.ActivePageIndex := 1;
  edtNossoNumero.EditValue := vlBoletoGerado[tabBoleto.TabIndex];
end;

procedure TfrmGerenciadorRecebimento.tabConfimacaoBoletosChange(Sender: TObject);
begin
  cxGridRetornoDBTableView1SELECIONAR.Visible := tabConfimacaoBoletos.TabIndex = 0;
  cxGridRetornoDBTableView1VALOR_PAGO.Visible := tabConfimacaoBoletos.TabIndex = 0;
  cxGridRetornoDBTableView1DIFERENCA.Visible  := tabConfimacaoBoletos.TabIndex = 0;
  cxGridRetornoDBTableView1VALOR_IOF.Visible  := tabConfimacaoBoletos.TabIndex = 0;
  cxGridRetornoDBTableView1DESCONTO.Visible   := tabConfimacaoBoletos.TabIndex = 0;
  cxGridRetornoDBTableView1JUROS_MORA.Visible := tabConfimacaoBoletos.TabIndex = 0;

  case tabConfimacaoBoletos.TabIndex of
    0 : begin
          cxGridRetornoDBTableView1DATA_PAGAMENTO.Caption := 'Data Pagamento';
          FiltrarRegistroRetorno('RETORNO  = TRUE',0,'');
        end;
    1  :begin
          cxGridRetornoDBTableView1DATA_PAGAMENTO.Caption := 'Data Opera��o';
          FiltrarRegistroRetorno('(RETORNO = FALSE) AND (SITUACAO <> '+ QuotedStr('4')+')',0,'');
        end;
    2 : begin
          cxGridRetornoDBTableView1DATA_PAGAMENTO.Caption := 'Data Baixa';
          FiltrarRegistroRetorno('(RETORNO = FALSE) AND (SITUACAO = '+ QuotedStr('4')+')',0,'');
        end;
  end;
end;

procedure TfrmGerenciadorRecebimento.Timer1Timer(Sender: TObject);
begin
  if not btnGerarRemessa.Enabled then
    exit;

  if btnGerarRemessa.Font.Color = clRed then
       btnGerarRemessa.Font.Color := clBlack
  else btnGerarRemessa.Font.Color := clRed;

end;

procedure TfrmGerenciadorRecebimento.ValoresRegistroDefault;
begin
  chxValorBoleta.Checked    := vgBoletoDados.CobrarBoleto = 'S';
  chxValorBoleta.Enabled    := vgBoletoDados.CobrarBoleto = 'S';
  edtValorBoleto.Enabled    := vgBoletoDados.CobrarBoleto = 'S';
  lblValorBoleto.Enabled    := vgBoletoDados.CobrarBoleto = 'S';
  edtValorBoleto.EditValue  := vgBoletoDados.ValorTaxa;

  lblReferenciaMulta.Enabled      := vgBoletoDados.CobrarMulta = 'S';
  cbxReferenciaMulta.Enabled      := vgBoletoDados.CobrarMulta = 'S';
end;

procedure TfrmGerenciadorRecebimento.VerificarDiretorios;
var
  viDiretorio : String;

  procedure CriarDiretorio(vpDiretorio : String);
  begin
    if DirectoryExists(vpDiretorio) = False then
       MkDir(vpDiretorio);
  end;
begin
  // Diretoria Padr�o do Boleto
  vgBoletoDados.DiretorioPadrao := GetCurrentDir +'\Boletos';
  CriarDiretorio(vgBoletoDados.DiretorioPadrao);

  // Diretoria Padr�o de Remessa
  vgBoletoDados.DiretorioRemessa := GetCurrentDir +'\Remessa\';
  CriarDiretorio(vgBoletoDados.DiretorioRemessa);

  // Diretoria Padr�o de Remessa
  vgBoletoDados.DiretorioRecibo := GetCurrentDir +'\Recibos\';
  CriarDiretorio(vgBoletoDados.DiretorioRecibo);

  // Diretoria Padr�o de Remessa
  vgBoletoDados.DiretorioRetorno := GetCurrentDir +'\Retorno';
  CriarDiretorio(vgBoletoDados.DiretorioRetorno);
  vgBoletoDados.DiretorioRetorno := GetCurrentDir +'\Retorno\Registrados';
  CriarDiretorio(vgBoletoDados.DiretorioRetorno);

  // Diretorio do Cedente
  CriarDiretorio(vgBoletoDados.DiretorioPadrao+'\'+FormatFloat('000', vgCedenteAtivo));

  // Diretorio do Mes
  viDiretorio := vgBoletoDados.DiretorioPadrao+'\'+FormatFloat('000', vgCedenteAtivo) + '\'+ IntToStr(vgPeriodoAtual);
  CriarDiretorio(viDiretorio);

  // Diretorio do Email
  CriarDiretorio(viDiretorio + '\EMAIL');
  CriarDiretorio(viDiretorio + '\IMPRESSOS');

  vgBoletoDados.DiretorioPadrao := viDiretorio;
end;

end.
