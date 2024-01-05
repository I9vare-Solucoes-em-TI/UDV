unit GerenciaBoletoERemessa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, cxControls, dxBarBuiltInMenu, cxContainer,
  cxEdit, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  Data.DB, cxDBData, cxCalendar, cxCurrencyEdit, cxTextEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxPC, cxDropDownEdit, cxMaskEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxLabel, Vcl.StdCtrls, cxButtons,
  Vcl.ExtCtrls, cxCheckBox, cxGroupBox, cxRadioGroup, Vcl.ComCtrls, dxCore,
  cxDateUtils, DbxDevartInterBase, Datasnap.DBClient, SimpleDS, cxImageComboBox,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, ACBrBase, ACBrBoleto, frxClass,
  frxDBSet, cxProgressBar;

type
  TfrmGerenciaBoletoRemessa = class(TForm)
    pgcFiltro: TcxPageControl;
    tbcBoleto: TcxTabSheet;
    sqlPessoa: TSimpleDataSet;
    dtsPessoa: TDataSource;
    ppmCompromisso: TPopupMenu;
    CancelarBoleto: TMenuItem;
    N1: TMenuItem;
    VisualizarImprimiBoleto: TMenuItem;
    tabPrevisoes: TcxTabControl;
    cxPageControl1: TcxPageControl;
    tbcRemessa: TcxTabSheet;
    tbcRetorno: TcxTabSheet;
    cxGroupBox2: TcxGroupBox;
    cxGridCliente: TcxGrid;
    cxGridClienteDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    Panel4: TPanel;
    sqlCompromisso: TSimpleDataSet;
    dtsCompromisso: TDataSource;
    cxGridClienteDBTableView2NOME: TcxGridDBColumn;
    cxGridClienteDBTableView2SELECIONADO: TcxGridDBColumn;
    cxGroupBox4: TcxGroupBox;
    pnSelecionarCompromissos: TPanel;
    tabCompromisso: TcxTabControl;
    cxGridCompromisso: TcxGrid;
    cxGridCompromissoDBTableView1: TcxGridDBTableView;
    cxGridCompromissoDBTableView1NOME: TcxGridDBColumn;
    cxGridCompromissoDBTableView1VALOR_AGENDADO: TcxGridDBColumn;
    cxGridCompromissoDBTableView1ANO_MES_REFERENCIA: TcxGridDBColumn;
    cxGridCompromissoDBTableView1BOLETA_ID: TcxGridDBColumn;
    cxGridCompromissoDBTableView1OPERACAO: TcxGridDBColumn;
    cxGridCompromissoDBTableView1SELECIONADO: TcxGridDBColumn;
    cxGridCompromissoLevel1: TcxGridLevel;
    GerarBoleto: TMenuItem;
    cxGridCompromissoDBTableView1CalcTravado: TcxGridDBColumn;
    cxGridCompromissoDBTableView1CONTA_CONTABIL_ID: TcxGridDBColumn;
    cxGridCompromissoDBTableView1Ref: TcxGridDBColumn;
    dtsPessoaAux: TDataSource;
    cdsPessoaAux: TClientDataSet;
    cdsPessoaAuxPESSOAID: TStringField;
    cdsPessoaAuxNOME: TStringField;
    cdsPessoaAuxSELECIONADO: TStringField;
    sqlCompromissoLIVRO_FINANCEIRO_ID: TFMTBCDField;
    sqlCompromissoDATA_VENCIMENTO: TSQLTimeStampField;
    sqlCompromissoVALOR_AGENDADO: TFMTBCDField;
    sqlCompromissoSITUACAO: TStringField;
    sqlCompromissoCONTABIL_CONTA_ID: TFMTBCDField;
    sqlCompromissoCENTRO_CUSTO_ID: TFMTBCDField;
    sqlCompromissoANO_MES_REFERENCIA: TStringField;
    sqlCompromissoBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlCompromissoESPECIE: TStringField;
    sqlCompromissoBOLETA_ID: TFMTBCDField;
    sqlCompromissoATUALIZADO: TStringField;
    sqlCompromissoVALOR_PAGO: TFMTBCDField;
    sqlCompromissoPROCESSO_CONTRATO_ITEM_ID: TFMTBCDField;
    sqlCompromissoPROCESSO_CONTRATO_ID: TFMTBCDField;
    sqlCompromissoOPERACAO: TStringField;
    sqlCompromissoPESSOA_ID: TFMTBCDField;
    sqlCompromissoVALOR_DOCUMENTO: TFMTBCDField;
    sqlCompromissoHISTORICO: TStringField;
    sqlCompromissoOBSERVACAO: TStringField;
    sqlCompromissoDATA_OPERACAO: TSQLTimeStampField;
    sqlCompromissoLIVRO_AGENDAMENTO_ID: TFMTBCDField;
    sqlCompromissoDESCONTO: TFMTBCDField;
    sqlCompromissoIR: TStringField;
    sqlCompromissoCNJ: TStringField;
    sqlCompromissoDOCUMENTO_NUMERO: TStringField;
    sqlCompromissoCAIXA_ID: TFMTBCDField;
    sqlCompromissoREGISTRO_PARCIAL: TStringField;
    sqlCompromissoSELECIONADO: TStringField;
    sqlCompromissoNOME: TStringField;
    sqlCompromissoVALOR_PAGO_SOMA: TFMTBCDField;
    sqlCompromissocalc_referencia: TStringField;
    sqlCompromissocalc_valor_a_pagar: TCurrencyField;
    sqlPesqCompromisso: TSimpleDataSet;
    dtsPesqCompromisso: TDataSource;
    ppmRemessa: TPopupMenu;
    GerarRemessa1: TMenuItem;
    sqlCompromissogerou_boleto_calc: TStringField;
    cxGroupBox5: TcxGroupBox;
    sqlAgruparReferencia: TSimpleDataSet;
    sqlAgruparReferenciaANO_MES_REFERENCIA: TStringField;
    sqlAgruparReferenciaVALOR: TFMTBCDField;
    OpenDialogRetorno: TOpenDialog;
    cdsRetorno: TClientDataSet;
    dtsRetorno: TDataSource;
    cxGroupBox6: TcxGroupBox;
    btnPesquisarRetorno: TcxButton;
    cxButton5: TcxButton;
    edtRetorno: TcxTextEdit;
    cxLabel7: TcxLabel;
    edtAgenciaRetorno: TcxTextEdit;
    cxLabel6: TcxLabel;
    edtContaRetorno: TcxTextEdit;
    cxLabel8: TcxLabel;
    edtNomeEmpresaRetorno: TcxTextEdit;
    cxLabel9: TcxLabel;
    edtCodBancoRetorno: TcxTextEdit;
    cxLabel11: TcxLabel;
    edtNomeBancoRetorno: TcxTextEdit;
    cxLabel12: TcxLabel;
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
    cxGridRetorno: TcxGrid;
    cxGridRetornoDBTableView1: TcxGridDBTableView;
    cxGridRetornoLevel1: TcxGridLevel;
    cxGridRetornoDBTableView1TIPO_REGISTRO: TcxGridDBColumn;
    cxGridRetornoDBTableView1DOCUMENTO: TcxGridDBColumn;
    cxGridRetornoDBTableView1NOSSO_NUMERO: TcxGridDBColumn;
    cxGridRetornoDBTableView1CARTEIRA: TcxGridDBColumn;
    cxGridRetornoDBTableView1VALOR_TITULO: TcxGridDBColumn;
    cxGridRetornoDBTableView1VALOR_IOF: TcxGridDBColumn;
    cxGridRetornoDBTableView1DESCONTO: TcxGridDBColumn;
    cxGridRetornoDBTableView1JUROS_MORA: TcxGridDBColumn;
    cxGridRetornoDBTableView1LOCALIZOU: TcxGridDBColumn;
    cxGridRetornoDBTableView1DIFERENCA: TcxGridDBColumn;
    ACBrBoleto1: TACBrBoleto;
    cdsRetornoAGENCIA: TStringField;
    cdsRetornoCONTA: TStringField;
    cdsRetornoLOCALIZADO: TBooleanField;
    lblMarcarTodosRetorno: TcxLabel;
    lblDesmarcarTodosRetorno: TcxLabel;
    cdsRetornoSELECIONADO: TStringField;
    cxGridRetornoDBTableView1SELECIONAR: TcxGridDBColumn;
    btnEnviarCaixa: TcxButton;
    cdsRetornoVALOR_DOCUMENTO: TCurrencyField;
    cdsRetornoDOCUMENTO: TStringField;
    cdsRetornoVALOR_PAGO: TCurrencyField;
    cxGridRetornoDBTableView1VALOR_PAGO: TcxGridDBColumn;
    cxLabel13: TcxLabel;
    cbxDadosBanco: TcxComboBox;
    sqlBanco: TSimpleDataSet;
    sqlBancoBANCO_ID: TFMTBCDField;
    sqlBancoBANCO_NUMERO: TStringField;
    sqlBancoBANCO_DIGITO: TStringField;
    sqlBancoBANCO_NOME: TStringField;
    sqlBancoAGENCIA_NOME: TStringField;
    sqlBancoAGENCIA_NUMERO: TStringField;
    sqlBancoCONTA_NUMERO: TStringField;
    sqlBancoCONTA_DIGITO: TStringField;
    sqlBancoAGENCIA_UF: TStringField;
    sqlBancoAGENCIA_DIGITO: TStringField;
    cdsRetornoSITUACAO: TStringField;
    cxGridRetornoDBTableView1SITUACAO: TcxGridDBColumn;
    cxGridCompromissoDBTableView1Column1: TcxGridDBColumn;
    Panel1: TPanel;
    lblMarcar: TcxLabel;
    lblDesmarcar: TcxLabel;
    Panel5: TPanel;
    PanelBotaoFechar: TPanel;
    cxBtnFechar: TcxButton;
    gbxBoletosDados: TcxGroupBox;
    btnEnviarBoletosEmail: TcxButton;
    btnGerarBoleto: TcxButton;
    edtDataVencimento: TcxDateEdit;
    cxLabel1: TcxLabel;
    Panel6: TPanel;
    lblMarcarCompromisso: TcxLabel;
    lblDesmarcarCompromisso: TcxLabel;
    cbxVencimentoTipo: TcxComboBox;
    frxDBDataSetCompromisso: TfrxDBDataset;
    frxDBDatasetAgruparCompromisso: TfrxDBDataset;
    pnlPesquisa: TPanel;
    edtPesqNome: TcxTextEdit;
    rdbBoletoIndividual: TcxRadioButton;
    rdbBoletoReferencia: TcxRadioButton;
    rdbBoletoUnico: TcxRadioButton;
    N2: TMenuItem;
    CancelarTodosBoletosClienteSelecioando1: TMenuItem;
    sqlCompromissoDATA_BOLETA: TSQLTimeStampField;
    sqlCompromissoNOSSO_NUMERO: TFMTBCDField;
    sqlCompromissoBOLETO_DESCRICAO: TStringField;
    sqlAgruparReferenciaLIVRO_FINANCEIRO_ID: TMemoField;
    mniReenviarBoleto: TMenuItem;
    tabHistorico: TcxTabSheet;
    sqlHistoricoEmail: TSimpleDataSet;
    dtsHistoricoEmail: TDataSource;
    Panel2: TPanel;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    cxGridDBTableView1Column3: TcxGridDBColumn;
    cxGridDBTableView1Column4: TcxGridDBColumn;
    cxGridDBTableView1Column5: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxLabel10: TcxLabel;
    edtDataInicial: TcxDateEdit;
    cxLabel3: TcxLabel;
    edtDataFinal: TcxDateEdit;
    btnPesquisar: TcxButton;
    sqlHistoricoEmailEMAIL_ENVIADO_ID: TFMTBCDField;
    sqlHistoricoEmailSTATUS: TStringField;
    sqlHistoricoEmailDATA: TSQLTimeStampField;
    sqlHistoricoEmailUSUARIO_ID: TFMTBCDField;
    sqlHistoricoEmailTIPO: TStringField;
    sqlHistoricoEmailASSUNTO: TStringField;
    sqlHistoricoEmailMENSAGEM: TBlobField;
    sqlHistoricoEmailPARA: TStringField;
    sqlHistoricoEmailIP_MAQUINA: TStringField;
    sqlHistoricoEmailPESSOA_DESCRICAO: TStringField;
    sqlHistoricoEmailPESSOA_ID: TFMTBCDField;
    sqlHistoricoEmailBOLETOS: TStringField;
    cxGridDBTableView1Column6: TcxGridDBColumn;
    cxGridCompromissoDBTableView1Column2: TcxGridDBColumn;
    sqlCompromissoENVIO_EMAIL: TStringField;
    sqlBancoCEDENTE_ID: TFMTBCDField;
    cxGridRemessa: TcxGrid;
    cxGridRemessaDBTableView1: TcxGridDBTableView;
    cxGridRemessaDBTableView1NOME: TcxGridDBColumn;
    cxGridRemessaDBTableView1VALOR_AGENDADO: TcxGridDBColumn;
    cxGridRemessaDBTableView1SITUACAO: TcxGridDBColumn;
    cxGridRemessaDBTableView1NOSSO_NUMERO: TcxGridDBColumn;
    cxGridRemessaDBTableView1BOLETA_ID: TcxGridDBColumn;
    cxGridRemessaLevel1: TcxGridLevel;
    Panel3: TPanel;
    btnPesquisaRemessa: TcxButton;
    btnLimparFiltroRemessa: TcxButton;
    btnGerarRemessa: TcxButton;
    lcxBancoRemessa: TcxLookupComboBox;
    cxLabel14: TcxLabel;
    cxGridRemessaDBTableView1Column1: TcxGridDBColumn;
    cxGridCompromissoDBTableView1Column3: TcxGridDBColumn;
    sqlCompromissoBANCO_ID: TFMTBCDField;
    rdbNome: TcxRadioButton;
    rdbGrupo: TcxRadioButton;
    cdsPessoaAuxGRUPO: TStringField;
    chxArquivoUnico: TcxCheckBox;
    sqlPesqCompromissoNOME: TStringField;
    sqlPesqCompromissoCPFCNPJ: TStringField;
    sqlPesqCompromissoENDERECO_CIDADE_ID: TFMTBCDField;
    sqlPesqCompromissoENDERECO_LOGRADOURO: TStringField;
    sqlPesqCompromissoENDERECO_BAIRRO: TStringField;
    sqlPesqCompromissoENDERECO_CIDADE_UF: TStringField;
    sqlPesqCompromissoENDERECO_CEP: TStringField;
    sqlPesqCompromissoEMAIL1: TStringField;
    sqlPesqCompromissoTELEFONE: TStringField;
    sqlPesqCompromissoSITUACAO: TStringField;
    sqlPesqCompromissoBOLETO_ID: TFMTBCDField;
    sqlPesqCompromissoNOSSO_NUMERO: TFMTBCDField;
    sqlPesqCompromissoDATA_EMISSAO: TSQLTimeStampField;
    sqlPesqCompromissoDATA_VENCIMENTO: TSQLTimeStampField;
    sqlPesqCompromissoBANCO_NOME: TStringField;
    sqlPesqCompromissoCARTEIRA: TStringField;
    sqlPesqCompromissoVALOR_AGENDADO: TFMTBCDField;
    sqlPesqCompromissoPESSOA_ID: TFMTBCDField;
    N3: TMenuItem;
    AlterarDatadeVencimento: TMenuItem;
    cxGridCompromissoDBTableView1Column4: TcxGridDBColumn;
    cxButton1: TcxButton;
    btnCalcularTaxas: TcxButton;
    sqlCompromissoVALOR_DESCONTO: TFMTBCDField;
    sqlCompromissoVALOR_JUROS: TFMTBCDField;
    sqlCompromissoVALOR_MULTA: TFMTBCDField;
    sqlCompromissoVALOR_OUTRA_DEDUCAO: TFMTBCDField;
    sqlCompromissoVALOR_CALCULO: TFMTBCDField;
    sqlCompromissoOBSERVACAO_MONETARIA: TStringField;
    sqlCompromissoCALC_VALOR: TCurrencyField;
    sqlCompromissoCALC_OBSERVACAO: TStringField;
    cxGridCompromissoDBTableView1Observacao: TcxGridDBColumn;
    btnLimparCalculo: TcxButton;
    sqlCompromissoVALOR_OUTRAS_TAXAS: TFMTBCDField;
    procedure cxBtnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lblMarcarClick(Sender: TObject);
    procedure lblDesmarcarClick(Sender: TObject);
    procedure VisualizarImprimiBoletoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure tabPrevisoesChange(Sender: TObject);
    procedure cxGridClienteDBTableView2FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxGridClienteDBTableView2CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure sqlCompromissoAfterScroll(DataSet: TDataSet);
    procedure cxGridCompromissoDBTableView1SELECIONADOCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGridCompromissoDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure sqlCompromissoCalcFields(DataSet: TDataSet);
    procedure btnGerarBoletoClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure cxGridClienteDBTableView2SELECIONADOPropertiesChange(
      Sender: TObject);
    procedure lblMarcarCompromissoClick(Sender: TObject);
    procedure lblDesmarcarCompromissoClick(Sender: TObject);
    procedure cxGridCompromissoDBTableView1SELECIONADOPropertiesChange(
      Sender: TObject);
    procedure GerarBoletoClick(Sender: TObject);
    procedure btnPesquisaRemessaClick(Sender: TObject);
    procedure btnGerarRemessaClick(Sender: TObject);
    procedure btnLimparFiltroRemessaClick(Sender: TObject);
    procedure btnEnviarBoletosEmailClick(Sender: TObject);
    procedure CancelarBoletoClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxGridRetornoDBTableView1LOCALIZOUCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGridRetornoDBTableView1DIFERENCACustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure lblMarcarTodosRetornoClick(Sender: TObject);
    procedure lblDesmarcarTodosRetornoClick(Sender: TObject);
    procedure btnEnviarCaixaClick(Sender: TObject);
    procedure pgcFiltroChange(Sender: TObject);
    procedure edtNossoNumeroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtBoletoIdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPesquisarRetornoClick(Sender: TObject);
    procedure cxGridRetornoDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure chxAgruparDesagruparClick(Sender: TObject);
    procedure cbxVencimentoTipoPropertiesEditValueChanged(Sender: TObject);
    procedure cxGridClienteDBTableView2KeyPress(Sender: TObject; var Key: Char);
    procedure edtPesqNomePropertiesChange(Sender: TObject);
    procedure CancelarTodosBoletosClienteSelecioando1Click(Sender: TObject);
    procedure rdbBoletoIndividualClick(Sender: TObject);
    procedure rdbBoletoReferenciaClick(Sender: TObject);
    procedure rdbBoletoUnicoClick(Sender: TObject);
    procedure mniReenviarBoletoClick(Sender: TObject);
    procedure rdbGrupoClick(Sender: TObject);
    procedure rdbNomeClick(Sender: TObject);
    procedure AlterarDatadeVencimentoClick(Sender: TObject);
    procedure edtPesqNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxButton1Click(Sender: TObject);
    procedure btnCalcularTaxasClick(Sender: TObject);
    procedure btnLimparCalculoClick(Sender: TObject);
  private
    vlAbrindoForm, vlNaoCarregarCompromisso : Boolean;
    vlFiltroCompromisso, vlInfoBoleto : string;
    vlPessoaRecno, vlCompromissoRecno : Integer;
    { Private declarations }
    procedure PreencherCliente;
    procedure PreencherGrupos;
    procedure CarregarCompromissos;
    procedure SelecioneTodosClientes(vpSelecionar: string);
    procedure SelecioneTodosCompromissos(vpSelecionar: string);
    procedure SelecioneTodosCompromissosRetorno(vpSelecionar: string);
    procedure ValidarCamposObrigatorios;
    procedure ValidarDataBoleto;
    procedure CarregarDadosBanco;
    procedure DesabilitaPessoaECompromisso;

    function ExisteClienteSelecionado: Boolean;
    function ExisteCompromissoSelecionado: Boolean;
    procedure PesquisarRegistros(vpTipo : string);
    procedure CancelamentoBoleto(vpTodos : Boolean = False);
  public
    { Public declarations }
  end;

var
  frmGerenciaBoletoRemessa: TfrmGerenciaBoletoRemessa;

implementation

uses
  VisualizarBoleto, Controles, Rotinas, Lookup, Lookup_Contabil,
  LookupFinanceiro, EnviarBoletoPorEmail, CadEnvioEmailFinanceiro, Lookup_Servico, CadastroRapidoLancamento, ValidarPermissaoUsuario,
  Atualizacao, VisualizaRelatorios, CalculoMultaJuros;

{$R *.dfm}

const
  // grid de clientes
  vcClienteSelecionado      = 1;

  // grid de compromissos
  vcBoletoId                = 4;
  vcCompromissoSelecionado  = 12;

  // grid de retorno
  vcLocalizado              = 2;
  vcRetSituacao             = 3;
  vcDiferenca               = 5;

procedure TfrmGerenciaBoletoRemessa.AlterarDatadeVencimentoClick(
  Sender: TObject);
begin
  if Application.MessageBox('Alterar Data de Vencimento do T�tulo Selecionado?','Confirma��o', MB_YESNO + MB_ICONQUESTION) = IDNO then
    Exit;

  vgRenovarTitulo.Renovar := True;
  vgRenovarTitulo.DadosTituloRenovado := TStringList.Create;
  vgRenovarTitulo.DadosTituloRenovado := dtmControles.GetFields(' SELECT BOLETO_ID, NOSSO_NUMERO, DATA_VENCIMENTO, PATH_GERARPDF '+
                                                                ' FROM J_BOLETO '+
                                                                ' WHERE BOLETO_ID = '+sqlCompromissoBOLETA_ID.AsString);
  btnGerarBoletoClick(self);
  FreeAndNil(vgRenovarTitulo.DadosTituloRenovado);
  vgRenovarTitulo.Renovar := False;
end;

procedure TfrmGerenciaBoletoRemessa.btnCalcularTaxasClick(Sender: TObject);
begin
  vgCalculoTaxa.ValorCalcular  := sqlCompromissoVALOR_AGENDADO.AsCurrency;
  vgCalculoTaxa.DataCalculo    := sqlCompromissoDATA_VENCIMENTO.AsCurrency;

  if edtDataVencimento.Text <> '' then
       vgCalculoTaxa.DataVencimento := edtDataVencimento.Date
  else vgCalculoTaxa.DataVencimento := StrToDate(dtmControles.DataHoraBanco(4));

  vgCalculoTaxa.MultaTipo         := dtmControles.BuscarConfig('FINANCEIRO','VALORES','TAXA_MULTA_TIPO','S');
  vgCalculoTaxa.MultaTaxa         := dtmControles.BuscarConfig('FINANCEIRO','VALORES','TAXA_MULTA_PADRAO','D');
  vgCalculoTaxa.JurosTaxa         := dtmControles.BuscarConfig('FINANCEIRO','VALORES','TAXA_JUROS_PADRAO','D');
  vgCalculoTaxa.OutrasTaxas       := 0;
  vgCalculoTaxa.Desconto          := 0;
  vgCalculoTaxa.OutraDeducao      := 0;
  vgCalculoTaxa.LivroFinanceiroId := sqlCompromissoLIVRO_FINANCEIRO_ID.AsString;
  ExibirFormulario(TfrmCalculoMultaJuros, frmCalculoMultaJuros, True);
  try
    if vgCalculoTaxa.Confirmado then
      sqlCompromisso.Refresh;
  except
    if not vlNaoCarregarCompromisso then
      CarregarCompromissos;
  end;
end;

procedure TfrmGerenciaBoletoRemessa.btnEnviarBoletosEmailClick(Sender: TObject);
begin
  DesabilitaPessoaECompromisso;
  ExibirFormulario(TfrmEnviarBoletoPorEmail, frmEnviarBoletoPorEmail, True);
  if not vgSelecaoConfirmada then
    exit;

  vgEmailConfig.Tabela := 'G_EMAIL_CONFIG';
  vgRetornoEmail.enviarEmail := True;
  ExibirFormulario(TfrmCadEnvioEmailFinanceiro, frmCadEnvioEmailFinanceiro, True);

  DesabilitaPessoaECompromisso;
  if vgRetornoEmail.houveErro then begin
    Application.MessageBox('Falha ao n�o existem emails de destino para serem enviado!','Informar', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
end;

procedure TfrmGerenciaBoletoRemessa.btnEnviarCaixaClick(Sender: TObject);
var
  viSql: string;
  viValorPago: Double;
  viContabilGrupoId: Integer;

  function ExisteRetornoSelecionado: Boolean;
  begin
    cdsRetorno.DisableControls;
    cdsRetorno.First;
    while not cdsRetorno.Eof do
    begin
      if cdsRetornoSELECIONADO.AsString = 'S' then
      begin
        Result := True;
        Break;
      end
      else Result := False;
      cdsRetorno.Next;
    end;
    cdsRetorno.First;
    cdsRetorno.EnableControls;
  end;

begin
  viValorPago := 0;

  if cdsRetorno.IsEmpty then begin
    Application.MessageBox('N�o existe compromissos para ser enviado para o caixa!','Aviso', MB_OK + MB_ICONINFORMATION);
    Abort;
  end;

  if not ExisteRetornoSelecionado then begin
    Application.MessageBox('Selecione um compromisso para continuar!','Aviso', MB_OK + MB_ICONINFORMATION);
    Abort;
  end;

  cdsRetorno.DisableControls;
  cdsRetorno.First;
  while not cdsRetorno.Eof do begin

    if cdsRetornoSELECIONADO.AsString = 'N' then begin
      cdsRetorno.Next;
      Continue;
    end;

    // valor negativo n�o pode ser enviado para o caixa!
    if cdsRetornoDIFERENCA.AsCurrency < 0 then begin
      if
        Application.MessageBox(Pchar('Existe valor negativo para o documento N� ' +
          cdsRetornoDOCUMENTO.AsString + ' Deseja Continuar?'),'Confirma��o', MB_YESNO + MB_ICONQUESTION) = IDNO
      then
        Exit;
    end;

    // valor superior ao do valor agendado ser� adicionado como cr�dito para o cliente.
    if cdsRetornoDIFERENCA.AsCurrency > 0 then begin
      if
        Application.MessageBox(Pchar('Diferen�a do valor de pagamento. documento N� ' +
        cdsRetornoDOCUMENTO.AsString + ' e superior ao informado no compromisso. Deseja Continuar?'),'Confirma��o', MB_YESNO + MB_ICONQUESTION) = IDNO
      then
        Exit;
    end;

    // alterar o where para LIVRO_FINANCEIRO_ID
    ExecutaSqlAuxiliar('select * from J_LIVRO_FINANCEIRO where BOLETA_ID = ' +
      Trim(cdsRetornoDOCUMENTO.AsString),0);

    with dtmControles.sqlAuxiliar do
    begin

      if
        (Trim(FieldByName('ANO_MES_REFERENCIA').AsString) = '') or
        (Trim(FieldByName('HISTORICO').AsString) = '') or
        (FieldByName('PESSOA_ID').AsInteger = 0) or
        (FieldByName('CONTABIL_CONTA_ID').AsInteger = 0)
      then begin
        cdsRetorno.Next;
        Continue;
      end;

      if FieldByName('CONTABIL_CONTA_ID').AsInteger > 0 then begin
        viContabilGrupoId := dtmControles.GetInt('SELECT CONTABIL_GRUPO_ID FROM J_CONTABIL_CONTA ' +
          ' WHERE CONTABIL_CONTA_ID = ' + FieldByName('CONTABIL_CONTA_ID').AsString);

        if viContabilGrupoId = 0 then begin
          cdsRetorno.Next;
          Continue;
        end;
      end;

      viValorPago := cdsRetornoVALOR_PAGO.AsCurrency;
      if viValorPago = 0 then begin
        cdsRetorno.Next;
        Continue;
      end;

      dtmControles.StartTransaction;
      try
        vgDadosLivroCaixa.CaixaID          := FieldByName('CAIXA_ID').AsInteger;
        vgDadosLivroCaixa.DataLancamento   := dtmControles.DataHoraBanco(4);
        vgDadosLivroCaixa.DataPagamento    := FormatDateTime('DD.MM.YYYY',FieldByName('DATA_VENCIMENTO').AsDateTime);
        vgDadosLivroCaixa.DataVencimento   := FormatDateTime('DD.MM.YYYY',FieldByName('DATA_VENCIMENTO').AsDateTime);

        vgDadosLivroCaixa.ValorCompromisso := FieldByName('CALC_VALOR').AsCurrency;
        vgDadosLivroCaixa.ValorPago        := viValorPago;
        vgDadosLivroCaixa.Especie          := FieldByName('ESPECIE').AsString;
        vgDadosLivroCaixa.Referencia       := FieldByName('ANO_MES_REFERENCIA').AsString;
        vgDadosLivroCaixa.Operacao         := FieldByName('OPERACAO').AsString;
        vgDadosLivroCaixa.PessoaId         := FieldByName('PESSOA_ID').AsInteger;

        vgDadosLivroCaixa.ContabilContaID  := FieldByName('CONTABIL_CONTA_ID').AsInteger;
        vgDadosLivroCaixa.ContabilGrupoId  := dtmControles.GetInt('SELECT CONTABIL_GRUPO_ID FROM J_CONTABIL_CONTA ' +
                                                                  ' WHERE CONTABIL_CONTA_ID = ' +
                                                                  FieldByName('CONTABIL_CONTA_ID').AsString);

        vgDadosLivroCaixa.CentroCustoId    := FieldByName('CENTRO_CUSTO_ID').AsInteger;
        vgDadosLivroCaixa.BalanceteGrupoId := FieldByName('BALANCETE_GRUPO_ID').AsInteger;
        vgDadosLivroCaixa.Historico        := FieldByName('HISTORICO').AsString;
        vgDadosLivroCaixa.AnoMesRegistro   := FieldByName('ANO_MES_REFERENCIA').AsString;
        vgDadosLivroCaixa.Observacao       := FieldByName('OBSERVACAO').AsString;
        vgDadosLivroCaixa.IR               := FieldByName('IR').AsString;
        vgDadosLivroCaixa.CNJ              := FieldByName('CNJ').AsString;
        vgDadosLivroCaixa.DocumentoNumero  := FieldByName('DOCUMENTO_NUMERO').AsString;

        dtmLookupContabil.RegistrarRecebimentoFinanceiro;

        ExecutaSqlAuxiliar(' update J_LIVRO_FINANCEIRO set SITUACAO = ' +
          QuotedStr('3') + ' where LIVRO_FINANCEIRO_ID = ' +
          IntToStr(vgDadosLivroCaixa.LivroFinanceiroID),1);

        dtmControles.Commit;
      except
        dtmControles.Roolback;
        Application.MessageBox(Pchar('Problemas na Grava��o! Documento n� ' +
          cdsRetornoDOCUMENTO.AsString),'Aviso', MB_OK + MB_ICONINFORMATION);
        Abort;
      end;
    end;

    cdsRetorno.Next;
  end;
  cdsRetorno.First;
  cdsRetorno.EnableControls;
  SelecioneTodosCompromissosRetorno('N');
end;

procedure TfrmGerenciaBoletoRemessa.btnGerarBoletoClick(Sender: TObject);
var
  viBancoId, viRecNo : Integer;
  viRetornoBoleto: TRetornoImprimiuBoleto;
  viDataVencimento : TDate;
  viDescricao : string;

  Function VerificarData:TDate;
  begin
    if (edtDataVencimento.EditValue <> null) then
      Result := edtDataVencimento.Date
    else
      if (StrToDate(FormatDateTime('DD/MM/YYYY',sqlCompromissoDATA_VENCIMENTO.AsDateTime)) < StrToDate(dtmControles.DataHoraBanco(4))) then
           Result :=  StrToDate(dtmControles.DataHoraBanco(4))
      else Result := sqlCompromissoDATA_VENCIMENTO.AsDateTime;
  end;

  {$REGION 'ValidarDados'}
  procedure ValidarDados;
  begin
    if cbxVencimentoTipo.ItemIndex = 1 then
      VerificarPreenchimentoDTA_TX(edtDataVencimento.Text, 'Data de Vencimento', edtDataVencimento);

    if vgRenovarTitulo.Renovar then
      exit;

    if not ExisteClienteSelecionado then
    begin
      vlNaoCarregarCompromisso := False;
      Application.MessageBox('Selecione um cliente para continuar!','Aviso', MB_OK + MB_ICONINFORMATION);
      Abort;
    end;

    if not ExisteCompromissoSelecionado then
    begin
      vlNaoCarregarCompromisso := False;
      Application.MessageBox('Selecione um compromisso para continuar!','Aviso', MB_OK + MB_ICONINFORMATION);
      Abort;
    end;
  end;
  {$ENDREGION}

  {$REGION 'GerarBoletoReferencia'}
  procedure GerarBoletoReferencia;
  begin
    sqlAgruparReferencia.Active := False;
    sqlAgruparReferencia.DataSet.ParamByName('PESSOA_ID').AsString := cdsPessoaAuxPESSOAID.AsString;
    sqlAgruparReferencia.Active := True;

    if sqlAgruparReferencia.IsEmpty then begin
      Application.MessageBox('N�o existem compromissos selecionados!','Aviso', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;

    sqlAgruparReferencia.First;
    sqlCompromisso.DisableControls;

    while not sqlAgruparReferencia.Eof do
    begin
      sqlCompromisso.Filtered := False;
      sqlCompromisso.Filter   := 'ANO_MES_REFERENCIA = '+sqlAgruparReferenciaANO_MES_REFERENCIA.AsString + ' AND '+
                                 'SELECIONADO = ''S''';
      sqlCompromisso.Filtered := True;

      viBancoId        := sqlCompromissoBANCO_ID.AsInteger;
      viDataVencimento := VerificarData;

      Inc(vgBoletoID);
      viRetornoBoleto := dtmLookupFinanceiro.CriarTituloLista(
                                    cdsPessoaAuxPESSOAID.AsString,
                                    cdsPessoaAuxNOME.AsString,
                                    sqlAgruparReferenciaLIVRO_FINANCEIRO_ID.AsString, // Lista dos Itens Selecionados
                                    viDataVencimento,
                                    viBancoId,
                                    sqlAgruparReferenciaVALOR.AsCurrency,
                                    rdbGrupo.Checked);

      if not viRetornoBoleto.ImprimiuBoleto then begin
        Application.MessageBox('Falha ao gerar arquivo!','Aviso', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      sqlAgruparReferencia.Next;
    end;
    sqlCompromisso.Filtered := False;
    sqlCompromisso.EnableControls;
    sqlAgruparReferencia.Active := False;
  end;
  {$ENDREGION}

  {$REGION 'GerarBoletoIndividualUnico'}
  procedure GerarBoletoIndividualUnico(vpUnico : Boolean = False);
  var
    viDados : TStrings;
    i, viQtd, viFastQtd : Integer;
    viBoletoRenovadoId : String;
  begin
    sqlCompromisso.DisableControls;

    viBoletoRenovadoId := '';
    sqlCompromisso.Filtered := False;
    if not vgRenovarTitulo.Renovar then
      sqlCompromisso.Filter := 'SELECIONADO = '+QuotedStr('S')
    else
    begin
      viBoletoRenovadoId    := vgRenovarTitulo.DadosTituloRenovado.Values['BOLETO_ID'];
      sqlCompromisso.Filter := 'BOLETA_ID = '+viBoletoRenovadoId;
    end;
    sqlCompromisso.Filtered := True;

    viQtd := sqlCompromisso.RecordCount;
    sqlCompromisso.Filtered := False;

    sqlCompromisso.First;
    viRecNo   := sqlCompromisso.RecNo;
    viFastQtd := 0;
    for i := 1 to sqlCompromisso.RecordCount do
    begin
      sqlCompromisso.RecNo := i;
      if not vpUnico then
      begin
        if ((sqlCompromissoSELECIONADO.AsString <> 'S') and (not vgRenovarTitulo.Renovar)) OR
           ((sqlCompromissoBOLETA_ID.AsString <> '') AND (vgRenovarTitulo.Renovar) and
           (sqlCompromissoBOLETA_ID.AsString <> viBoletoRenovadoId)) or
           ((sqlCompromissoBOLETA_ID.AsString = '') and (vgRenovarTitulo.Renovar)) then
          Continue;
        sqlCompromisso.Filter   := 'LIVRO_FINANCEIRO_ID = '+sqlCompromissoLIVRO_FINANCEIRO_ID.AsString;
      end
      else sqlCompromisso.Filter := 'SELECIONADO = '+QuotedStr('S');
      sqlCompromisso.Filtered := True;

      if vpUnico then
      begin
        viDados := dtmControles.GetFields(
                             ' SELECT ((SUM(coalesce(LF.VALOR_AGENDADO,0)) + '+
                             ' SUM(coalesce(LF.VALOR_MULTA,0))+'+
                             ' SUM(coalesce(LF.VALOR_JUROS,0))+ '+
                             ' SUM(coalesce(LF.VALOR_OUTRAS_TAXAS,0)))- '+

                             ' (SUM(coalesce(LF.VALOR_DESCONTO,0))+ '+
                             ' SUM(coalesce(LF.VALOR_OUTRA_DEDUCAO,0)))) AS VALOR_AGENDADO,' +

                             ' LIST(CAST(LF.LIVRO_FINANCEIRO_ID AS INTEGER)) AS LIVRO_FINANCEIRO_ID '+
                             ' FROM J_LIVRO_FINANCEIRO LF'+
                             ' WHERE LF.SITUACAO IN (''1'',''2'',''7'',''8'')'+
                             ' AND LF.SELECIONADO = ''S'''+
                             ' AND LF.PESSOA_ID = '+ cdsPessoaAuxPESSOAID.AsString+
                             ' GROUP BY LF.PESSOA_ID');
      end
      else
      begin
        viDados := TStringList.Create;
        viDados.Add('VALOR_AGENDADO='+sqlCompromissoCALC_VALOR.AsString);
        viDados.Add('LIVRO_FINANCEIRO_ID='+sqlCompromissoLIVRO_FINANCEIRO_ID.AsString);
        viDados.Add('BOLETO_ID='+sqlCompromissoBOLETA_ID.AsString);
      end;

      viDataVencimento := VerificarData;

      viBancoId := sqlCompromissoBANCO_ID.AsInteger;
      Inc(vgBoletoID);

      vgRelFast.Acumular := chxArquivoUnico.Checked;
      if vgRelFast.Acumular then
      begin
        Inc(viFastQtd);
        vgRelFast.Inicio    := viFastQtd = 1;
        vgRelFast.Finalizar := viQtd = viFastQtd;
      end;

      viRetornoBoleto := dtmLookupFinanceiro.CriarTituloLista(
                            sqlCompromissoPESSOA_ID.AsString,
                            cdsPessoaAuxNOME.AsString,
                            viDados.Values['LIVRO_FINANCEIRO_ID'],
                            viDataVencimento,
                            viBancoId,
                            StrToCurr(viDados.Values['VALOR_AGENDADO']),
                            rdbGrupo.Checked);

      FreeAndNil(viDados);
      if not viRetornoBoleto.ImprimiuBoleto then
      begin
        Application.MessageBox('Falha ao gerar arquivo!','Aviso', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;

      sqlCompromisso.Filtered := False;

      if vpUnico then
        Break;
    end;
    vgRelFast.Acumular   := False;
    sqlCompromisso.RecNo := viRecNo;
  end;
  {$ENDREGION}

begin
  vlNaoCarregarCompromisso := True;
  vgBoletoID         := 0;
  vlPessoaRecno      := cdsPessoaAux.RecNo;
  vlCompromissoRecno := sqlCompromisso.RecNo;

  if (not vgRenovarTitulo.Renovar) then
  begin
    ValidarDados;
    ValidarCamposObrigatorios;
    ValidarDataBoleto;
  end;

  if not vgRenovarTitulo.Renovar then
    if Application.MessageBox(PChar('Gerar '+vlInfoBoleto+'?'),'Confirma��o', MB_YESNO + MB_ICONQUESTION) = IDNO then
      Exit;

  frmAtualizacao := TfrmAtualizacao.Create(nil);
  frmAtualizacao.Visible := False;

  if not vgRenovarTitulo.Renovar then
       frmAtualizacao.lblTexto.Caption := 'Gerando Boleto(s) - Aguarde'
  else frmAtualizacao.lblTexto.Caption := 'Renovando Boleto - Aguarde';

  frmAtualizacao.Visible := True;
  frmAtualizacao.Show;
  frmAtualizacao.Refresh;

  cdsPessoaAux.DisableControls;

  if (not vgRenovarTitulo.Renovar) then
       cdsPessoaAux.First
  else
  begin
    cdsPessoaAux.RecNo    := vlPessoaRecno;
    sqlCompromisso.RecNo := vlCompromissoRecno;
  end;

  try
    dtmLookupFinanceiro.ACBrBoleto1.ListadeBoletos.Clear;
    while not cdsPessoaAux.Eof do
    begin
      if (cdsPessoaAuxSELECIONADO.AsString = 'N') and not vgRenovarTitulo.Renovar then
      begin
        cdsPessoaAux.Next;
        Continue;
      end;

      if vgRenovarTitulo.Renovar then
        GerarBoletoIndividualUnico
      else
      begin
        CarregarCompromissos;
        if rdbBoletoReferencia.Checked then
          GerarBoletoReferencia
        else
          if rdbBoletoIndividual.Checked then
               GerarBoletoIndividualUnico
          else GerarBoletoIndividualUnico(True);
      end;

      sqlCompromisso.First;
      sqlCompromisso.EnableControls;

      if vgRenovarTitulo.Renovar then
        Break;

      cdsPessoaAux.Next;
    end;

    if not vgRenovarTitulo.Renovar then
      cdsPessoaAux.First;

    vgRenovarTitulo.Renovar := False;
    cdsPessoaAux.EnableControls;
    cdsPessoaAux.RecNo := vlPessoaRecno;
    CarregarCompromissos;
  finally
    sqlCompromisso.Refresh;
    frmAtualizacao.hide;
    frmAtualizacao.free;
    sqlCompromisso.Refresh;
    edtDataVencimento.Clear;
  end;
end;

procedure TfrmGerenciaBoletoRemessa.CancelamentoBoleto(vpTodos: Boolean);
var
  viRemessa, viSql, viBoletos :  string;
begin
  dtmControles.StartTransaction;
  try
    viSql := ' update J_BOLETO set SITUACAO = ' + QuotedStr('3') + ','+
             ' DATA_CANCELADO = ' + QuotedStr(FormatDateTime('DD.MM.YYYY HH:MM:SS', Now)) + ',' +
             ' CONT_REMESSA = NULL ' ;
    if vpTodos then
    begin
      if rdbNome.Checked then
        viBoletos := dtmControles.GetStr(' SELECT list(BOLETO_ID) '+
                                         ' FROM '+
                                         ' (SELECT  DISTINCT(CAST(boleta_id AS INTEGER)) as BOLETO_ID '+
                                         ' FROM J_LIVRO_FINANCEIRO '+
                                         ' WHERE PESSOA_ID = '+cdsPessoaAuxPESSOAID.AsString+
                                         ' AND NOT BOLETA_ID IS NULL '+
                                         ' and SITUACAO <> 3)')
      else
        viBoletos := dtmControles.GetStr(' SELECT list(BOLETO_ID) '+
                                         ' FROM '+
                                         ' (SELECT  DISTINCT(CAST(boleta_id AS INTEGER)) as BOLETO_ID '+
                                         ' FROM J_LIVRO_FINANCEIRO '+
                                         ' WHERE PESSOA_ID = '+cdsPessoaAuxPESSOAID.AsString+
                                         ' AND NOT BOLETA_ID IS NULL '+
                                         ' and SITUACAO <> 3)')
    end
    else viBoletos := sqlCompromissoBOLETA_ID.AsString;

    viSql := viSql + ' where BOLETO_ID IN ('+viBoletos+')';
    ExecutaSqlAuxiliar(viSql, 1);
    ExecutaSqlAuxiliar('update J_LIVRO_FINANCEIRO set BOLETA_ID = NULL where BOLETA_ID IN ('+viBoletos+')',1);
    dtmControles.Commit;
  except
    dtmControles.Roolback;
    ShowMessage('Problema no cancelamento do boleto');
    exit;
  end;
  CarregarCompromissos;
  sqlCompromisso.Refresh;

end;

procedure TfrmGerenciaBoletoRemessa.CancelarBoletoClick(Sender: TObject);
begin
  if Application.MessageBox(PChar('Deseja cancelar boleto de n� ' +
      sqlCompromissoBOLETA_ID.AsString),'Confirma��o', MB_YESNO + MB_ICONQUESTION) = IDNO
  then
    Exit;

  CancelamentoBoleto;
end;

procedure TfrmGerenciaBoletoRemessa.CancelarTodosBoletosClienteSelecioando1Click(
  Sender: TObject);
begin
  if Application.MessageBox(PChar('Deseja cancelar todos os boletos do CLIENTE Selecionado?'),'Confirma��o', MB_YESNO + MB_ICONQUESTION) = IDNO
  then
    Exit;

  CancelamentoBoleto(True);
end;

procedure TfrmGerenciaBoletoRemessa.CarregarCompromissos;

  procedure MostrarAba;
  var
    viAux: Integer;
  begin

    if sqlCompromisso.IsEmpty then
      Exit;

    viAux := 0;
    sqlCompromisso.First;
    tabCompromisso.Tabs.Clear;
    sqlCompromisso.DisableControls;
    while not sqlCompromisso.Eof do
    begin
      if sqlCompromissoBOLETA_ID.AsInteger = 0 then begin
        sqlCompromisso.Next;
        Continue;
      end;

      if viAux <> sqlCompromissoBOLETA_ID.AsInteger then begin
        tabCompromisso.Tabs.Add('B-' + sqlCompromissoBOLETA_ID.AsString);
        viAux := sqlCompromissoBOLETA_ID.AsInteger;
      end;

      sqlCompromisso.Next;
    end;
    sqlCompromisso.EnableControls;
    sqlCompromisso.First;
  end;

begin
  if cdsPessoaAux.IsEmpty then
    Exit;

  PesquisarRegistros('2');
  cxGridCompromissoDBTableView1.OptionsView.GroupFooters := gfInvisible;
  cxGridCompromissoDBTableView1NOME.GroupIndex := 0;

  MostrarAba;
  cxGridCompromissoDBTableView1.DataController.Groups.FullExpand;
end;

procedure TfrmGerenciaBoletoRemessa.CarregarDadosBanco;
var
  viDadosBanco: string;
begin
  sqlBanco.Open;

  sqlBanco.First;
  cbxDadosBanco.Properties.Items.Clear;
  while not sqlBanco.Eof do begin
    viDadosBanco :=
    sqlBancoBANCO_NUMERO.AsString + '-' + sqlBancoBANCO_NOME.AsString +
    ' Ag�ncia: ' + sqlBancoAGENCIA_NUMERO.AsString + '-' + sqlBancoAGENCIA_DIGITO.AsString +
    ' Conta: ' + sqlBancoCONTA_NUMERO.AsString + '-' + sqlBancoCONTA_DIGITO.AsString;

    cbxDadosBanco.Properties.Items.Add(viDadosBanco);
    sqlBanco.Next;
  end;
  cbxDadosBanco.ItemIndex := 0;
end;

procedure TfrmGerenciaBoletoRemessa.cbxVencimentoTipoPropertiesEditValueChanged(
  Sender: TObject);
begin
  edtDataVencimento.Enabled := cbxVencimentoTipo.ItemIndex = 1;
  if not edtDataVencimento.Enabled then
    edtDataVencimento.Clear;
end;

procedure TfrmGerenciaBoletoRemessa.chxAgruparDesagruparClick(Sender: TObject);
begin
{  if chxAgruparDesagrupar.Checked then begin
    cxGridRemessaDBTableView1.OptionsView.GroupFooters := gfVisibleWhenExpanded;
    cxGridRemessaDBTableView1NOME.GroupIndex := -1;
    cxGridRemessaDBTableView1NOME.Visible := True;
  end
  else begin
    cxGridRemessaDBTableView1.OptionsView.GroupFooters := gfInvisible;
    cxGridRemessaDBTableView1NOME.GroupIndex := 0;
    cxGridRemessaDBTableView1NOME.Visible := False;

    cxGridRemessaDBTableView1.DataController.Groups.FullExpand;
  end}
end;

procedure TfrmGerenciaBoletoRemessa.cxBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmGerenciaBoletoRemessa.btnPesquisaRemessaClick(Sender: TObject);
var
  viPesquisa: string;
begin
  VerificarPreenchimentoLCX_TX(lcxBancoRemessa.Text, 'Conta de Remessa', lcxBancoRemessa);

  viPesquisa :=
    ' select ' +
    '  P.NOME, ' +
    '  P.PESSOA_ID, ' +
    '  P.CPFCNPJ, ' +
    '  P.ENDERECO_CIDADE_ID, ' +
    '  P.ENDERECO_LOGRADOURO, ' +
    '  P.ENDERECO_BAIRRO, ' +
    '  P.ENDERECO_CIDADE_UF, ' +
    '  P.ENDERECO_CEP, ' +
    '  P.EMAIL1, ' +
    '  P.TELEFONE, ' +
    '  BO.SITUACAO, ' +
    '  BO.BOLETO_ID, '+
    '  BO.NOSSO_NUMERO, '+
    '  BO.DATA_EMISSAO, ' +
    '  BO.DATA_VENCIMENTO, ' +
    '  B.BANCO_NOME, ' +
    '  BO.CARTEIRA, BO.VALOR AS VALOR_AGENDADO ' +
    ' from  J_BOLETO BO '+
    '  inner join J_PESSOA P  on '+
    '  BO.PESSOA_ID = P.PESSOA_ID '+
    '  inner join J_BANCO B  on '+
    '  BO.BANCO_ID = B.BANCO_ID '+

    ' where BO.SITUACAO <> ' + QuotedStr('2') +
    ' and BO.CONT_REMESSA IS NULL ' +
    ' and BO.BANCO_ID = '+IntToStr(lcxBancoRemessa.EditValue)+
    ' order by BO.NOSSO_NUMERO ';

  sqlPesqCompromisso.Active := False;
  sqlPesqCompromisso.DataSet.CommandText := viPesquisa;
  sqlPesqCompromisso.Active := True;

  if sqlPesqCompromisso.RecordCount = 0 then
  begin
    Application.MessageBox('Nenhuma remessa pendente pra esta conta!','Aviso', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  lcxBancoRemessa.Enabled := False;
  cxGridRemessaDBTableView1.OptionsView.GroupFooters := gfInvisible;
  cxGridRemessaDBTableView1NOME.GroupIndex := 0;

  cxGridRemessaDBTableView1.DataController.Groups.FullExpand;
  btnGerarRemessa.Enabled := not sqlPesqCompromisso.IsEmpty;
end;

procedure TfrmGerenciaBoletoRemessa.btnPesquisarRetornoClick(Sender: TObject);
var
  i: Integer;
  viValorDocumento: Double;
  viDadosBanco: string;

  function RetorneTipoRegistro(vpTipoImpressao: TACBrTipoImpressao): string;
  begin
    if vpTipoImpressao = tipCarne then
      Result := 'C'
    else
      Result := 'N';
  end;
begin
  if OpenDialogRetorno.Execute then
    edtRetorno.Text := OpenDialogRetorno.Filename;

  if Trim(edtRetorno.Text) = '' then begin
    Application.MessageBox('Informe um arquivo v�lido para continuar!','Aviso', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

{  with ACBrBoleto1.Cedente do
  begin
    ExecutaSqlAuxiliar('select RAZAO_SOCIAL, CNPJ_CPF from J_CEDENTE', 0);
    Nome    := dtmControles.sqlAuxiliar.FieldByName('RAZAO_SOCIAL').AsString;
    if Length(Trim(dtmControles.sqlAuxiliar.FieldByName('CNPJ_CPF').AsString)) = 11 then
      CNPJCPF := FormataCPF(Trim(dtmControles.sqlAuxiliar.FieldByName('CNPJ_CPF').AsString))
    else
      CNPJCPF := FormataCNPJ(Trim(dtmControles.sqlAuxiliar.FieldByName('CNPJ_CPF').AsString));

    // Dados da conta - pode variar
    sqlBanco.First;
    while not sqlBanco.Eof do begin
      viDadosBanco :=
      sqlBancoBANCO_NUMERO.AsString + '-' + sqlBancoBANCO_NOME.AsString +
      ' Ag�ncia: ' + sqlBancoAGENCIA_NUMERO.AsString + '-' + sqlBancoAGENCIA_DIGITO.AsString +
      ' Conta: ' + sqlBancoCONTA_NUMERO.AsString + '-' + sqlBancoCONTA_DIGITO.AsString;

      if cbxDadosBanco.Text = viDadosBanco then begin
        Agencia := sqlBancoAGENCIA_NUMERO.AsString;
        AgenciaDigito := sqlBancoAGENCIA_DIGITO.AsString;
        CodigoCedente := '';
        Conta         := sqlBancoCONTA_NUMERO.AsString;
        ContaDigito   := sqlBancoCONTA_DIGITO.AsString;
        Modalidade    := '';
        Convenio      := '';
        Break;
      end;
      sqlBanco.Next;
    end;
  end;

  ACBrBoleto1.NomeArqRetorno := edtRetorno.Text;
  ACBrBoleto1.LerRetorno;

  cdsRetorno.EmptyDataSet;
  for i := 0 to ACBrBoleto1.ListadeBoletos.Count -1 do begin
    viValorDocumento := -1;

    if i = 0 then begin
      with ACBrBoleto1.Cedente do
      begin
        edtAgenciaRetorno.Text     := ACBrBoleto1.Cedente.Agencia + '-' + ACBrBoleto1.Cedente.AgenciaDigito;
        edtContaRetorno.Text       := ACBrBoleto1.Cedente.Conta + '-' + ACBrBoleto1.Cedente.ContaDigito;
        edtNomeEmpresaRetorno.Text := ACBrBoleto1.Cedente.Nome;
        edtCodBancoRetorno.Text    := RetZeros(IntToStr(ACBrBoleto1.Banco.BancoClass.Numero), 3);
        edtNomeBancoRetorno.Text   := ACBrBoleto1.Banco.BancoClass.Nome;
      end;
    end;

    cdsRetorno.Insert;
    cdsRetornoTIPO_REGISTRO.AsString  := RetorneTipoRegistro(ACBrBoleto1.ListadeBoletos.Objects[i].TipoImpressao);
    cdsRetornoSITUACAO.AsString       := '';
    cdsRetornoLOCALIZADO.AsBoolean    := False;
    cdsRetornoDIFERENCA.AsCurrency    := 0;
    cdsRetornoDOCUMENTO.AsString      := ACBrBoleto1.ListadeBoletos.Objects[i].NumeroDocumento;
    cdsRetornoNOSSO_NUMERO.AsString   := ACBrBoleto1.ListadeBoletos.Objects[i].NossoNumero;
    cdsRetornoVALOR_DOCUMENTO.AsCurrency := ACBrBoleto1.ListadeBoletos.Objects[i].ValorDocumento;
    cdsRetornoVALOR_IOF.AsCurrency    := ACBrBoleto1.ListadeBoletos.Objects[i].ValorIOF;
    cdsRetornoDESCONTO.AsCurrency     := ACBrBoleto1.ListadeBoletos.Objects[i].ValorDesconto;
    cdsRetornoJUROS_MORA.AsCurrency   := ACBrBoleto1.ListadeBoletos.Objects[i].ValorMoraJuros;
    cdsRetornoCARTEIRA.AsString       := ACBrBoleto1.ListadeBoletos.Objects[i].Carteira;
    cdsRetornoSELECIONADO.AsString    := 'N';
    cdsRetornoVALOR_PAGO.AsCurrency   := ACBrBoleto1.ListadeBoletos.Objects[i].ValorRecebido;

    if Trim(ACBrBoleto1.ListadeBoletos.Objects[i].NumeroDocumento) <> '' then
    begin
      ExecutaSqlAuxiliar('select VALOR_AGENDADO, SITUACAO from J_LIVRO_FINANCEIRO where ' +
        ' LIVRO_FINANCEIRO_ID = ' + Trim(ACBrBoleto1.ListadeBoletos.Objects[i].NumeroDocumento),0);

      viValorDocumento := dtmControles.sqlAuxiliar.FieldByName('VALOR_AGENDADO').AsCurrency;
      cdsRetornoSITUACAO.AsString := dtmControles.sqlAuxiliar.FieldByName('SITUACAO').AsString;

      cdsRetornoLOCALIZADO.AsBoolean := viValorDocumento > -1;
      if cdsRetornoLOCALIZADO.AsBoolean then begin
        viValorDocumento := cdsRetornoVALOR_PAGO.AsCurrency - viValorDocumento;
        cdsRetornoDIFERENCA.AsCurrency := viValorDocumento;
      end;
    end;
    cdsRetorno.Post;
  end;}
end;

procedure TfrmGerenciaBoletoRemessa.cxButton1Click(Sender: TObject);
begin
  tabPrevisoesChange(self);
  btnCalcularTaxas.Enabled := (not sqlPessoa.IsEmpty);
end;

procedure TfrmGerenciaBoletoRemessa.cxButton2Click(Sender: TObject);
begin
  cdsRetorno.EmptyDataSet;
  edtRetorno.Clear;
  edtAgenciaRetorno.Clear;
  edtContaRetorno.Clear;
  edtNomeEmpresaRetorno.Clear;
  edtCodBancoRetorno.Clear;
  edtNomeBancoRetorno.Clear;
  edtRetorno.SetFocus;
end;

procedure TfrmGerenciaBoletoRemessa.btnLimparCalculoClick(Sender: TObject);
begin
  if Application.MessageBox('Limpar c�lculo de Taxas?', 'Confirma��o', MB_YESNO) = IDNO then
    exit;

  ExecutaSqlAuxiliar(' UPDATE J_LIVRO_FINANCEIRO SET VALOR_DESCONTO = NULL, '+
                     '                          VALOR_JUROS    = NULL, '+
                     '                          VALOR_MULTA    = NULL, '+
                     '                  VALOR_OUTRA_DEDUCAO    = NULL, '+
                     '                  VALOR_OUTRAS_TAXAS     = NULL, '+
                     '                       VALOR_CALCULO     = NULL, '+
                     '                 OBSERVACAO_MONETARIA    = NULL '+
                     ' WHERE LIVRO_FINANCEIRO_ID = '+ sqlCompromissoLIVRO_FINANCEIRO_ID.AsString,1);
  sqlCompromisso.Refresh;
end;

procedure TfrmGerenciaBoletoRemessa.btnLimparFiltroRemessaClick(Sender: TObject);
begin
  sqlPesqCompromisso.Active := False;
  btnGerarRemessa.Enabled   := False;
  lcxBancoRemessa.EditValue := null;
  lcxBancoRemessa.Enabled   := True;
  lcxBancoRemessa.SetFocus;
end;

procedure TfrmGerenciaBoletoRemessa.btnGerarRemessaClick(Sender: TObject);
var
  viTam: Integer;
  viBancoId: Integer;
  viBoleto: TArrayOfBoleto;
  viRetornoRemessa: TRetornoGerouRemessa;

  {$REGION 'ValidarPreencherDados'}
  procedure ValidarPreencherDados;
  begin
    if Trim(sqlPesqCompromissoCPFCNPJ.AsString) = '' then begin
      Application.MessageBox('Por favor, Informar CPF/CNPJ para continuar!','Aviso', MB_OK + MB_ICONINFORMATION);
      Abort;
    end
    else viBoleto[viTam].CNPJCPF      := sqlPesqCompromissoCPFCNPJ.AsString;

    viBoleto[viTam].Cidade            := '';
    if sqlPesqCompromissoENDERECO_CIDADE_ID.AsInteger > 0  then begin
      viBoleto[viTam].Cidade := dtmControles.GetStr('SELECT MUNICIPIO FROM G_MUNICIPIO WHERE MUNICIPIO_ID = ' +
        sqlPesqCompromissoENDERECO_CIDADE_ID.AsString);
    end
    else begin
      Application.MessageBox(Pchar('Cliente '+ sqlPesqCompromissoNome.AsString+' N�O possui cidade CADASTRADA!'),'Aviso', MB_OK + MB_ICONINFORMATION);
      Abort;
    end;

    if Trim(sqlPesqCompromissoENDERECO_LOGRADOURO.AsString) = '' then begin
      Application.MessageBox('Por favor, Informar o logradouro para continuar!','Aviso', MB_OK + MB_ICONINFORMATION);
      Abort;
    end
    else
      viBoleto[viTam].Logradouro      := sqlPesqCompromissoENDERECO_LOGRADOURO.AsString;
    viBoleto[viTam].Numero            := '';
    if Trim(sqlPesqCompromissoENDERECO_BAIRRO.AsString) = '' then begin
      Application.MessageBox('Por favor, Informar o bairro para continuar!','Aviso', MB_OK + MB_ICONINFORMATION);
      Abort;
    end
    else viBoleto[viTam].Bairro       := sqlPesqCompromissoENDERECO_BAIRRO.AsString;

    if Trim(sqlPesqCompromissoENDERECO_CIDADE_UF.AsString) = '' then begin
      Application.MessageBox('Por favor, Informar o UF para continuar!','Aviso', MB_OK + MB_ICONINFORMATION);
      Abort;
    end
    else viBoleto[viTam].UF           := sqlPesqCompromissoENDERECO_CIDADE_UF.AsString;

    if Trim(sqlPesqCompromissoENDERECO_CEP.AsString) = '' then begin
      Application.MessageBox('Por favor, Informar o CEP para continuar!','Aviso', MB_OK + MB_ICONINFORMATION);
      Abort;
    end
    else viBoleto[viTam].CEP          := sqlPesqCompromissoENDERECO_CEP.AsString;
  end;
  {$ENDREGION}

begin
  viBancoId  := lcxBancoRemessa.EditValue;
  vgBoletoID := 0;
  viTam      := 0;
  sqlPesqCompromisso.DisableControls;
  sqlPesqCompromisso.First;
  while not sqlPesqCompromisso.Eof do
  begin
    SetLength(viBoleto, viTam + 1);
    viBoleto[viTam].nomeSacado        := sqlPesqCompromissoNOME.AsString;
    viBoleto[viTam].valorDocumento    := sqlPesqCompromissoVALOR_AGENDADO.AsCurrency;
    viBoleto[viTam].numeroDocumento   := FormatFloat('000,000', sqlPesqCompromissoPESSOA_ID.AsInteger);
    viBoleto[viTam].nossoNumero       := sqlPesqCompromissoNOSSO_NUMERO.AsString;
    viBoleto[viTam].dataDocumento     := sqlPesqCompromissoDATA_EMISSAO.AsDateTime;
    viBoleto[viTam].vencimento        := sqlPesqCompromissoDATA_VENCIMENTO.AsDateTime;
    viBoleto[viTam].especieDoc        := 'DM';
    viBoleto[viTam].Aceite            := 'N';
    viBoleto[viTam].DataProcessamento := Date;
    viBoleto[viTam].Carteira          := sqlPesqCompromissoCARTEIRA.AsString;

    ValidarPreencherDados;

    viBoleto[viTam].Email             := sqlPesqCompromissoEMAIL1.AsString;
    viBoleto[viTam].Fone              := sqlPesqCompromissoTELEFONE.AsString;
    viBoleto[viTam].Parcela           := 1;
    viBoleto[viTam].TotalParcelas     := 1;
    viBoleto[viTam].DataDesconto      := sqlPesqCompromissoDATA_VENCIMENTO.AsDateTime;
    viBoleto[viTam].DataMoraJuros     := 0;
    viBoleto[viTam].ValorDesconto     := 0;
    viBoleto[viTam].ValorMoraJuros    := 0;
    viBoleto[viTam].PercentualMulta   := 0;
    viBoleto[viTam].situacao          := sqlPesqCompromissoSITUACAO.AsString;

    Inc(viTam);
    sqlPesqCompromisso.Next;
  end;
  sqlPesqCompromisso.First;
  sqlPesqCompromisso.EnableControls;

  viRetornoRemessa := dtmLookupFinanceiro.GerarRemessa(viBancoId, viBoleto);
   if not viRetornoRemessa.gerouRemessa then begin
    Application.MessageBox('Falha ao gerar arquivo remessa!', 'Falha', MB_OK + MB_ICONWARNING);
    Exit;
  end;

  sqlPesqCompromisso.DisableControls;
  sqlPesqCompromisso.First;
  while not sqlPesqCompromisso.Eof do begin
    ExecutaSqlAuxiliar('update J_BOLETO set CONT_REMESSA = ' + IntToStr(viRetornoRemessa.remessaId) +
      ' where BOLETO_ID = ' + sqlPesqCompromissoBOLETO_ID.AsString, 1);

    sqlPesqCompromisso.Next;
  end;
  sqlPesqCompromisso.First;
  sqlPesqCompromisso.EnableControls;

  sqlPesqCompromisso.Refresh;
  btnLimparFiltroRemessaClick(Self);
end;

procedure TfrmGerenciaBoletoRemessa.btnPesquisarClick(Sender: TObject);
var
  viSql : String;
begin
   VerificarPreenchimentoDTA_TX(edtDataInicial.Text, 'Data Inicial', edtDataInicial);
   VerificarPreenchimentoDTA_TX(edtDataFinal.Text, 'Data Final', edtDataFinal);

   viSql := ' SELECT * '+
            ' FROM G_EMAIL_ENVIADO '+
            ' WHERE DATA '+ MontarSqlData(edtDataInicial.Date , edtDataFinal.Date);
   sqlHistoricoEmail.Active := False;
   sqlHistoricoEmail.DataSet.CommandText := viSql;
   sqlHistoricoEmail.Active := True;
end;

procedure TfrmGerenciaBoletoRemessa.cxGridClienteDBTableView2CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.RecordViewInfo.GridRecord.Values[vcClienteSelecionado] = 'S' then
    ACanvas.Font.Color := clRed;
end;

procedure TfrmGerenciaBoletoRemessa.cxGridClienteDBTableView2FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  if not vlNaoCarregarCompromisso then
    CarregarCompromissos;
  btnGerarBoleto.Enabled := cdsPessoaAux.RecordCount > 0;
end;

procedure TfrmGerenciaBoletoRemessa.cxGridClienteDBTableView2KeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key in ['a'..'z', 'A'..'Z'] then
  begin
    if not edtPesqNome.Visible then
    begin
      edtPesqNome.Visible := True;
      edtPesqNome.EditValue := Key;
      edtPesqNome.SetFocus;
      edtPesqNome.SelStart := 1;
    end;
  end;
end;

procedure TfrmGerenciaBoletoRemessa.cxGridClienteDBTableView2SELECIONADOPropertiesChange(
  Sender: TObject);
begin
  vlNaoCarregarCompromisso := True;
  cdsPessoaAux.Edit;
  if cxGridClienteDBTableView2SELECIONADO.EditValue = 'N' then
    cdsPessoaAuxSELECIONADO.AsString := 'S'
  else
    cdsPessoaAuxSELECIONADO.AsString := 'N';
  cdsPessoaAux.Post;
  vlNaoCarregarCompromisso := False;
end;

procedure TfrmGerenciaBoletoRemessa.cxGridCompromissoDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.RecordViewInfo.GridRecord.Values[vcCompromissoSelecionado] = 'S' then
    ACanvas.Font.Color := clRed;
end;

procedure TfrmGerenciaBoletoRemessa.cxGridCompromissoDBTableView1SELECIONADOCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if (AViewInfo.RecordViewInfo.GridRecord.Values[vcBoletoId] <> null ) or
     (AViewInfo.RecordViewInfo.GridRecord.Values[1] = null ) then
  begin
    ACanvas.Brush.Color    := clSilver;
    AviewInfo.item.Editing := False;
  end;
end;

procedure TfrmGerenciaBoletoRemessa.cxGridCompromissoDBTableView1SELECIONADOPropertiesChange(Sender: TObject);
begin
  sqlCompromisso.Edit;
  if cxGridCompromissoDBTableView1SELECIONADO.EditValue = 'N' then
    sqlCompromissoSELECIONADO.AsString := 'S'
  else
    sqlCompromissoSELECIONADO.AsString := 'N';

  ExecutaSqlAuxiliar('update J_LIVRO_FINANCEIRO set SELECIONADO = ' + QuotedStr(sqlCompromissoSELECIONADO.AsString) +
  ' where LIVRO_FINANCEIRO_ID = ' + sqlCompromissoLIVRO_FINANCEIRO_ID.AsString , 1);

  sqlCompromisso.Post;
end;

procedure TfrmGerenciaBoletoRemessa.cxGridRetornoDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.RecordViewInfo.GridRecord.Values[vcRetSituacao] = '3' then
  begin
    ACanvas.Brush.Color    := clSilver;
    AviewInfo.item.Editing := False;
  end;
end;

procedure TfrmGerenciaBoletoRemessa.cxGridRetornoDBTableView1DIFERENCACustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.RecordViewInfo.GridRecord.Values[vcDiferenca] < 0 then begin
    ACanvas.Font.Color := clRed;
    ACanvas.Font.Style := [fsBold];
  end
  else if AViewInfo.RecordViewInfo.GridRecord.Values[vcDiferenca] > 0 then begin
    ACanvas.Font.Color := clBlue;
    ACanvas.Font.Style := [fsBold];
  end;
end;

procedure TfrmGerenciaBoletoRemessa.cxGridRetornoDBTableView1LOCALIZOUCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.RecordViewInfo.GridRecord.Values[vcLocalizado] then begin
    ACanvas.Font.Color := clBlue;
    ACanvas.Font.Style := [fsBold];
  end
  else begin
    ACanvas.Font.Color := clRed;
    ACanvas.Font.Style := [fsBold];
  end;
end;

procedure TfrmGerenciaBoletoRemessa.DesabilitaPessoaECompromisso;
begin
  ExecutaSqlAuxiliar('UPDATE J_BOLETO set SELECIONADO = ' + QuotedStr('N')+
                     ' WHERE SELECIONADO = '+QuotedStr('S'), 1);
end;

procedure TfrmGerenciaBoletoRemessa.edtBoletoIdKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
    btnPesquisaRemessaClick(Self);
end;

procedure TfrmGerenciaBoletoRemessa.edtNossoNumeroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
    btnPesquisaRemessaClick(Self);
end;

procedure TfrmGerenciaBoletoRemessa.edtPesqNomeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
    tabPrevisoesChange(self);
end;

procedure TfrmGerenciaBoletoRemessa.edtPesqNomePropertiesChange(
  Sender: TObject);
begin
//  cdsPessoaAux.Locate('NOME', edtPesqNome.Text, [loPartialKey]);

end;

function TfrmGerenciaBoletoRemessa.ExisteClienteSelecionado: Boolean;
begin
  Result := False;

  if cdsPessoaAux.RecordCount = 0 then
    Exit;

  try
    cdsPessoaAux.DisableControls;
    cdsPessoaAux.First;
    while not cdsPessoaAux.Eof do begin
      if cdsPessoaAuxSELECIONADO.AsString = 'S' then begin
        Result := True;
        Exit;
      end;
      cdsPessoaAux.Next;
    end;
  finally
    cdsPessoaAux.RecNo := vlPessoaRecno;
    cdsPessoaAux.EnableControls;
  end;
end;

function TfrmGerenciaBoletoRemessa.ExisteCompromissoSelecionado: Boolean;
var
  viQtd : Integer;
begin
  Result := False;
  if cdsPessoaAux.RecordCount = 0 then
    Exit;

  try
    cdsPessoaAux.DisableControls;
    cdsPessoaAux.First;
    while not cdsPessoaAux.Eof do begin
      if cdsPessoaAuxSELECIONADO.AsString = 'N' then begin
        cdsPessoaAux.Next;
        Continue;
      end;

      if rdbNome.Checked then
        viQtd := dtmControles.GetInt('select count(SELECIONADO) from J_LIVRO_FINANCEIRO ' +
                                      ' where SELECIONADO = ''S'' and PESSOA_ID = ' + cdsPessoaAuxPESSOAID.AsString)
      else
        viQtd := dtmControles.GetInt(' select count(LF.SELECIONADO) from J_LIVRO_FINANCEIRO LF '+
                                     '   LEFT OUTER JOIN J_PESSOA P ON '+
                                     '   LF.PESSOA_ID = P.PESSOA_ID '+
                                     ' where LF.SELECIONADO = ''S'''+
                                     ' and P.IDENTIFICACAO = '+QuotedStr(cdsPessoaAuxNOME.AsString));
      if viQtd = 0 then
        Result := False
      else
      begin
        Result := True;
        Exit;
      end;

      cdsPessoaAux.Next;
    end;
  finally
    cdsPessoaAux.RecNo := vlPessoaRecno;
    cdsPessoaAux.EnableControls;
  end;
end;

procedure TfrmGerenciaBoletoRemessa.FormActivate(Sender: TObject);
begin
  frmGerenciaBoletoRemessa.WindowState := wsMaximized;
  if pgcFiltro.ActivePageIndex = 0 then
    edtPesqNome.SetFocus;
end;

procedure TfrmGerenciaBoletoRemessa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sqlCompromisso.Close;
  sqlPesqCompromisso.Close;
  sqlBanco.Close;
  sqlPessoa.Close;
  sqlAgruparReferencia.Close;

  Action := caFree;
  frmGerenciaBoletoRemessa := nil;
end;

procedure TfrmGerenciaBoletoRemessa.FormCreate(Sender: TObject);
begin
  vlAbrindoForm := True;

  sqlBanco.Connection             := dtmControles.DB;
  sqlPessoa.Connection            := dtmControles.DB;
  sqlCompromisso.Connection       := dtmControles.DB;
  sqlPesqCompromisso.Connection   := dtmControles.DB;
  sqlAgruparReferencia.Connection := dtmControles.DB;
  sqlHistoricoEmail.Connection    := dtmControles.DB;

  vgDataAtualTipo4            := dtmControles.DataHoraBanco(4);
  vgDataAtualTipoDate         := StrToDate(vgDataAtualTipo4);
  rdbBoletoIndividualClick(self);

  SelecioneTodosCompromissos('N');
  DesabilitaPessoaECompromisso;
  pgcFiltro.ActivePageIndex := 0;
  tabPrevisoes.TabIndex     := 2;
  tabPrevisoesChange(Self);
  cbxVencimentoTipoPropertiesEditValueChanged(cbxVencimentoTipo);
  vlAbrindoForm := False;
end;

procedure TfrmGerenciaBoletoRemessa.GerarBoletoClick(Sender: TObject);
begin
  btnGerarBoletoClick(Self);
end;

procedure TfrmGerenciaBoletoRemessa.lblDesmarcarClick(Sender: TObject);
begin
  SelecioneTodosClientes('N');
end;

procedure TfrmGerenciaBoletoRemessa.lblDesmarcarCompromissoClick(Sender: TObject);
begin
  SelecioneTodosCompromissos('N');
end;

procedure TfrmGerenciaBoletoRemessa.lblDesmarcarTodosRetornoClick(
  Sender: TObject);
begin
  SelecioneTodosCompromissosRetorno('N');
end;

procedure TfrmGerenciaBoletoRemessa.lblMarcarClick(Sender: TObject);
begin
  SelecioneTodosClientes('S');
end;

procedure TfrmGerenciaBoletoRemessa.lblMarcarCompromissoClick(Sender: TObject);
begin
  SelecioneTodosCompromissos('S');
end;

procedure TfrmGerenciaBoletoRemessa.lblMarcarTodosRetornoClick(Sender: TObject);
begin
  SelecioneTodosCompromissosRetorno('S');
end;

procedure TfrmGerenciaBoletoRemessa.PesquisarRegistros(vpTipo : string);
var
  viFiltro, viDataIni, viDataFim, viPesquisa, viReferencia: string;

  {$REGION 'MontarSqlPessoaCompromisso'}
  procedure MontarSqlPessoaCompromisso;
  begin
    if vpTipo = '1' then
    begin
      if Trim(edtPesqNome.Text) <> '' then
        viFiltro := ' and P.NOME like ' + QuotedStr(Trim('%'+ edtPesqNome.Text) + '%');

      viPesquisa :=
        ' select ' +
        '  P.PESSOA_ID, ' +
        '  P.NOME, ' +
        '  P.SELECIONADO ' +
        ' from ' +
        '   J_PESSOA P ' +

        '  inner join J_LIVRO_FINANCEIRO LF ' +
        '  on LF.PESSOA_ID = P.PESSOA_ID ' +

        '  where P.UTILIZA_BOLETO = ''S'' ' +
        '  and LF.operacao = '+QuotedStr('R')+
        '  and LF.SITUACAO IN (''1'',''2'',''7'',''8'') ' + viFiltro;

      if Trim(edtPesqNome.Text) <> '' then
        if rdbNome.Checked then
             viPesquisa := viPesquisa + ' AND P.NOME LIKE '+QuotedStr('%'+edtPesqNome.Text+'%')
        else viPesquisa := viPesquisa + ' AND P.IDENTIFICACAO LIKE '+QuotedStr('%'+edtPesqNome.Text+'%');

      viPesquisa := viPesquisa +

        '  group by ' +
        '   P.PESSOA_ID, ' +
        '   P.NOME, ' +
        '   P.SELECIONADO ' +

        ' order by ' +
        '   P.NOME desc ';

      sqlPessoa.Active := False;
      sqlPessoa.DataSet.CommandText := viPesquisa;
      sqlPessoa.Active := True;
    end
    else
    begin
      viPesquisa :=
        ' SELECT ' +
        '  BC.BANCO_ID, '+
        '  LF.*, ' +
        '  P.NOME, ' +
        '  P.BOLETO_DESCRICAO, ' +
        '  B.DATA_VENCIMENTO AS DATA_BOLETA, '+
        '  B.NOSSO_NUMERO, '+
        '  B.ENVIO_EMAIL, '+
        '  coalesce((SELECT SUM(VALOR) FROM J_LIVRO_CAIXA WHERE LIVRO_FINANCEIRO_ID = LF.LIVRO_FINANCEIRO_ID),0) AS VALOR_PAGO_SOMA ' +

        ' FROM ' +
        '  J_LIVRO_FINANCEIRO LF ' +

        ' INNER JOIN J_PESSOA P ' +
        ' ON LF.PESSOA_ID = P.PESSOA_ID ' +
        ' LEFT OUTER JOIN J_BOLETO B '+
        ' ON LF.BOLETA_ID = B.BOLETO_ID '+
        ' INNER JOIN J_CAIXA C '+
        ' ON LF.CAIXA_ID = C.CAIXA_ID '+
        ' INNER JOIN J_BANCO BC '+
        ' ON C.BANCO_ID = BC.BANCO_ID '+

        ' WHERE LF.SITUACAO IN (''1'',''2'',''7'',''8'') ' + viFiltro;
      if rdbNome.Checked then
           viPesquisa := viPesquisa +  '   AND P.PESSOA_ID = '+ cdsPessoaAuxPESSOAID.AsString
      else viPesquisa := viPesquisa +  '   AND P.IDENTIFICACAO = '+ QuotedStr(cdsPessoaAuxNOME.AsString);

      viPesquisa := viPesquisa +
        '   and LF.operacao = '+QuotedStr('R')+
        '   and LF.TIPO_CARGA_ID IS NULL '+

        ' ORDER BY ' +
        '  LF.DATA_VENCIMENTO, ' +
        '  LF.ANO_MES_REFERENCIA, '+
        '  LF.CONTABIL_CONTA_ID ';

      sqlCompromisso.Active := False;
      sqlCompromisso.DataSet.CommandText := viPesquisa;
      sqlCompromisso.Active := True;
    end;
  end;
  {$ENDREGION}

  {$REGION 'MontarSqlGrupoCompromisso'}
  procedure MontarSqlGrupoCompromisso;
  begin
    if Trim(edtPesqNome.Text) <> '' then
      viFiltro := ' and P.IDENTIFICACAO like ' + QuotedStr(Trim('%'+ edtPesqNome.Text) + '%');

    viPesquisa :=
      ' select P.IDENTIFICACAO AS NOME ' +
      ' from ' +
      '   J_PESSOA P ' +

      '  inner join J_LIVRO_FINANCEIRO LF ' +
      '  on LF.PESSOA_ID = P.PESSOA_ID ' +

      '  where P.UTILIZA_BOLETO = ''S'' ' +
      '  and LF.operacao = '+QuotedStr('R')+
      '  and LF.SITUACAO IN (''1'',''2'',''7'',''8'') ' + viFiltro +
      '  and not P.IDENTIFICACAO is null '+

      '  group by P.IDENTIFICACAO ' +

      ' order by ' +
      '   P.IDENTIFICACAO desc ';

    sqlPessoa.Active := False;
    sqlPessoa.DataSet.CommandText := viPesquisa;
    sqlPessoa.Active := True;
  end;
  {$ENDREGION}

begin
  viFiltro  := ''; viDataIni := ''; viDataFim := ''; viReferencia := '';

  try
    Screen.Cursor := crHourGlass;

    // Montar filtro(s) de clientes ............................................
    case tabPrevisoes.TabIndex of
      0: begin // Vencidos/Dia atual
           viDataFim := vgDataAtualTipo4;
           viFiltro := ' and (LF.DATA_VENCIMENTO <= ' +
             QuotedStr(dtmControles.DataParaString(StrToDate(viDataFim))) + ')';
         end;
      1: begin // At� 7 dias
           viDataFim := DateToStr(StrToDate(vgDataAtualTipo4) + 7);
           viFiltro := ' and (LF.DATA_VENCIMENTO <= ' +
             QuotedStr(dtmControles.DataParaString(StrToDate(viDataFim))) + ')';
         end;
      2: begin // M�s atual
           MontarDataInicioFinal(vgDataAtualTipo4, viDataIni, viDataFim, '/');
           viReferencia := QuotedStr(PegarAnoMes(viDataFim));

           viFiltro := ' and LF.ANO_MES_REFERENCIA <= ' + viReferencia;
         end;
      3: begin // Pr�ximo m�s
          viReferencia := QuotedStr(PegarAnoMes(DateToStr(vgDataAtualTipoDate + 30)));
          viFiltro := ' and LF.ANO_MES_REFERENCIA <= ' + viReferencia;
         end;
      4: begin // At� 2 meses
           viReferencia := QuotedStr(PegarAnoMes(DateToStr(vgDataAtualTipoDate + 60)));
           viFiltro := ' and LF.ANO_MES_REFERENCIA <= ' + viReferencia;
         end;
      5: begin // At� 6 meses
           viReferencia := QuotedStr(PegarAnoMes(DateToStr(vgDataAtualTipoDate + 180)));
           viFiltro := ' and LF.ANO_MES_REFERENCIA <= ' + viReferencia;
         end;
      6: begin // At� 12 meses
           viReferencia := QuotedStr(PegarAnoMes(DateToStr(vgDataAtualTipoDate + 380)));
           viFiltro := ' and LF.ANO_MES_REFERENCIA <= ' + viReferencia;
         end;
      7: begin // At� final do ano
          MontarDataInicioFinal(vgDataAtualTipo4, viDataIni, viDataFim, '/', '12');
          viReferencia := QuotedStr(PegarAnoMes(viDataFim));
          viFiltro := ' and LF.ANO_MES_REFERENCIA <= ' + viReferencia;
         end;
    end;

    vlFiltroCompromisso := viFiltro;
    if viFiltro <> '' then
    begin
      if vpTipo[1] in ['1','2'] then
           MontarSqlPessoaCompromisso
      else MontarSqlGrupoCompromisso;
    end;

    if vlAbrindoForm then
      exit;

    if sqlPessoa.RecordCount = 0 then
    begin
      sqlCompromisso.Active := False;
      Application.MessageBox('N�o existe informa��o para o per�odo! ','Aviso', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmGerenciaBoletoRemessa.pgcFiltroChange(Sender: TObject);
var
  viDataIni, viDataFin : string;
begin
  gbxBoletosDados.Enabled := pgcFiltro.ActivePageIndex = 0;

  if pgcFiltro.ActivePage = tbcRemessa then
    btnLimparFiltroRemessaClick(Self)
  else
    if pgcFiltro.ActivePage = tbcRetorno then
    begin
      CarregarDadosBanco;
      cbxDadosBanco.SetFocus;
    end
  else
    if pgcFiltro.ActivePage = tabHistorico then
    begin
      MontarDataInicioFinal(vgDataAtualTipo4, viDataIni, viDataFin, '/');
      edtDataInicial.EditValue := StrToDate(viDataIni);
      edtDataFinal.EditValue   := StrToDate(viDataFin);
      btnPesquisarClick(self);
    end;
end;

procedure TfrmGerenciaBoletoRemessa.PreencherCliente;
begin
  sqlPessoa.First;
  cdsPessoaAux.EmptyDataSet;
  cdsPessoaAux.DisableControls;
  while not sqlPessoa.Eof do
  begin
    cdsPessoaAux.Insert;
    cdsPessoaAux.FieldByName('PESSOAID').AsString    := sqlPessoa.FieldByName('PESSOA_ID').AsString;
    cdsPessoaAux.FieldByName('NOME').AsString        := sqlPessoa.FieldByName('NOME').AsString;
    cdsPessoaAux.FieldByName('SELECIONADO').AsString := 'N';
    cdsPessoaAux.Post;

    sqlPessoa.Next;
  end;
  cdsPessoaAux.EnableControls;
end;

procedure TfrmGerenciaBoletoRemessa.PreencherGrupos;
begin
  sqlPessoa.First;
  cdsPessoaAux.EmptyDataSet;
  cdsPessoaAux.DisableControls;
  while not sqlPessoa.Eof do
  begin
    cdsPessoaAux.Insert;
    cdsPessoaAux.FieldByName('NOME').AsString        := sqlPessoa.FieldByName('NOME').AsString;
    cdsPessoaAux.FieldByName('SELECIONADO').AsString := 'N';
    cdsPessoaAux.Post;

    sqlPessoa.Next;
  end;
  cdsPessoaAux.EnableControls;
end;

procedure TfrmGerenciaBoletoRemessa.rdbBoletoIndividualClick(Sender: TObject);
begin
  vlInfoBoleto := rdbBoletoIndividual.Caption;
  chxArquivoUnico.Enabled := True;
end;

procedure TfrmGerenciaBoletoRemessa.rdbBoletoReferenciaClick(Sender: TObject);
begin
  vlInfoBoleto := rdbBoletoReferencia.Caption;
  chxArquivoUnico.Checked := False;
  chxArquivoUnico.Enabled := False;
end;

procedure TfrmGerenciaBoletoRemessa.rdbBoletoUnicoClick(Sender: TObject);
begin
  vlInfoBoleto := rdbBoletoUnico.Caption;
  chxArquivoUnico.Checked := False;
  chxArquivoUnico.Enabled := False;
end;

procedure TfrmGerenciaBoletoRemessa.rdbGrupoClick(Sender: TObject);
begin
   tabPrevisoesChange(self);
   rdbBoletoReferencia.Enabled := False;
   rdbBoletoUnico.Enabled      := False;
   rdbBoletoIndividual.Checked := True;
end;

procedure TfrmGerenciaBoletoRemessa.rdbNomeClick(Sender: TObject);
begin
  tabPrevisoesChange(self);
  rdbBoletoReferencia.Enabled := True;
  rdbBoletoUnico.Enabled      := True;
end;

procedure TfrmGerenciaBoletoRemessa.mniReenviarBoletoClick(
  Sender: TObject);
begin
  if Application.MessageBox(Pchar('Adicionar na Lista de Envio por email?'),'Confirma��o', MB_YESNO) = IDNO then
    Exit;

  ExecutaSqlAuxiliar(' UPDATE J_BOLETO SET ENVIO_EMAIL = NULL'+
                     ' WHERE BOLETO_ID = '+sqlCompromissoBOLETA_ID.AsString, 1);
  sqlCompromisso.Refresh;
end;

procedure TfrmGerenciaBoletoRemessa.SelecioneTodosCompromissos(vpSelecionar: string);
begin
  vlPessoaRecno := cdsPessoaAux.RecNo;
  if vpSelecionar = 'S' then
  begin
    cdsPessoaAux.DisableControls;
    cdsPessoaAux.First;
    while not cdsPessoaAux.Eof do begin

      if cdsPessoaAuxSELECIONADO.AsString = 'N' then begin
        cdsPessoaAux.Next;
        Continue;
      end;

      ExecutaSqlAuxiliar(' update J_LIVRO_FINANCEIRO LF set SELECIONADO = ' + QuotedStr(vpSelecionar) +
                         ' where LF.BOLETA_ID is null and LF.SITUACAO in (''1'',''2'',''7'',''8'') ' +
                         '   and TIPO_CARGA_ID IS NULL '+
                         '   and LF.PESSOA_ID = ' + cdsPessoaAuxPESSOAID.AsString + vlFiltroCompromisso,1);

      cdsPessoaAux.Next;
    end;
    cdsPessoaAux.RecNo := vlPessoaRecno;
    cdsPessoaAux.EnableControls;
  end
  else
    if vpSelecionar = 'N' then
    begin
      ExecutaSqlAuxiliar(' update J_LIVRO_FINANCEIRO set SELECIONADO = ' + QuotedStr(vpSelecionar) +
                         ' where BOLETA_ID is null and SITUACAO in (''1'',''2'',''7'',''8'')', 1);
    end;
  CarregarCompromissos;
end;

procedure TfrmGerenciaBoletoRemessa.SelecioneTodosCompromissosRetorno(vpSelecionar: string);
begin
  if cdsRetorno.IsEmpty then
    Exit;

  try
    Screen.Cursor := crHourGlass;
    cdsRetorno.DisableControls;
    cdsRetorno.First;
    while not cdsRetorno.Eof do begin

      if cdsRetornoSITUACAO.AsString = '3' then begin
        cdsRetorno.Next;
        Continue;
      end;

      cdsRetorno.Edit;
      cdsRetornoSELECIONADO.AsString := vpSelecionar;
      cdsRetorno.Post;

      cdsRetorno.Next;
    end;
    cdsRetorno.First;
    cdsRetorno.EnableControls;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmGerenciaBoletoRemessa.SelecioneTodosClientes(vpSelecionar: string);
begin
  if cdsPessoaAux.IsEmpty then
    Exit;

  try
    Screen.Cursor := crHourGlass;
    cdsPessoaAux.DisableControls;
    vlPessoaRecno := cdsPessoaAux.RecNo;
    cdsPessoaAux.First;
    while not cdsPessoaAux.Eof do begin
      cdsPessoaAux.Edit;
      cdsPessoaAuxSELECIONADO.AsString := vpSelecionar;
      cdsPessoaAux.Post;

      cdsPessoaAux.Next;
    end;
    cdsPessoaAux.RecNo := vlPessoaRecno;
    cdsPessoaAux.EnableControls;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmGerenciaBoletoRemessa.sqlCompromissoAfterScroll(
  DataSet: TDataSet);
begin
  VisualizarImprimiBoleto.Enabled := not sqlCompromissoBOLETA_ID.IsNull;
  GerarBoleto.Enabled             := sqlCompromissoBOLETA_ID.IsNull;
  CancelarBoleto.Enabled          := not sqlCompromissoBOLETA_ID.IsNull;
  AlterarDatadeVencimento.Enabled := not sqlCompromissoBOLETA_ID.IsNull;
  mniReenviarBoleto.Enabled       := not sqlCompromissoBOLETA_ID.IsNull;

  btnCalcularTaxas.Enabled        := (not sqlCompromisso.IsEmpty) and (sqlCompromissoBOLETA_ID.IsNull);
  btnLimparCalculo.Enabled        := (not sqlCompromisso.IsEmpty) and (sqlCompromissoVALOR_CALCULO.AsCurrency > 0)
                                      and (sqlCompromissoBOLETA_ID.IsNull);
end;

procedure TfrmGerenciaBoletoRemessa.sqlCompromissoCalcFields(DataSet: TDataSet);

  procedure VerificarValor;
  var
    viObservacao : String;

    procedure PreencherObservacao(vpObs : string);
    begin
      viObservacao := viObservacao + vpObs;
    end;
  begin
    if sqlCompromissoVALOR_CALCULO.AsCurrency = 0 then
      sqlCompromissoCALC_VALOR.AsCurrency := sqlCompromissoVALOR_AGENDADO.AsCurrency
    else
    begin
      sqlCompromissoCALC_VALOR.AsCurrency := sqlCompromissoVALOR_CALCULO.AsCurrency;
      viObservacao := 'Valor Compromisso '+ FormatFloat('R$ ,#0.00', sqlCompromissoVALOR_AGENDADO.AsCurrency);

      if sqlCompromissoVALOR_MULTA.AsCurrency > 0 then
        PreencherObservacao(' + Multa '+ FormatFloat(',#0.00', sqlCompromissoVALOR_MULTA.AsCurrency));
      if sqlCompromissoVALOR_JUROS.AsCurrency > 0 then
        PreencherObservacao(' + Juros '+ FormatFloat(',#0.00', sqlCompromissoVALOR_JUROS.AsCurrency));
      if sqlCompromissoVALOR_OUTRAS_TAXAS.AsCurrency > 0 then
        PreencherObservacao(' + Outras Taxas '+ FormatFloat(',#0.00', sqlCompromissoVALOR_OUTRAS_TAXAS.AsCurrency));
      if sqlCompromissoDESCONTO.AsCurrency > 0 then
        PreencherObservacao(' - Desconto '+ FormatFloat(',#0.00', sqlCompromissoDESCONTO.AsCurrency));
      if sqlCompromissoVALOR_OUTRA_DEDUCAO.AsCurrency > 0 then
        PreencherObservacao(' - Outras Dedu��es '+ FormatFloat(',#0.00', sqlCompromissoVALOR_OUTRA_DEDUCAO.AsCurrency));
      if sqlCompromissoOBSERVACAO_MONETARIA.AsString <> '' then
        PreencherObservacao(' ** '+sqlCompromissoOBSERVACAO_MONETARIA.AsString);

      sqlCompromissoCALC_OBSERVACAO.AsString := viObservacao;
    end;
  end;

begin
  sqlCompromissocalc_referencia.AsString := dtmLookupContabil.FormatarAnoMes(sqlCompromissoANO_MES_REFERENCIA.AsString);

  if sqlCompromissoBOLETA_ID.AsString = '' then
    sqlCompromissogerou_boleto_calc.AsString := 'N'
  else
    sqlCompromissogerou_boleto_calc.AsString := 'S';

  VerificarValor;
  if sqlCompromissoSELECIONADO.AsString = 'S' then
    sqlCompromissocalc_valor_a_pagar.AsCurrency := sqlCompromissocalc_valor_a_pagar.AsCurrency + sqlCompromissoCALC_VALOR.AsCurrency;
end;


procedure TfrmGerenciaBoletoRemessa.tabPrevisoesChange(Sender: TObject);
begin
  if rdbNome.Checked then
  begin
    PesquisarRegistros('1');
    PreencherCliente;
  end
  else
  begin
    PesquisarRegistros('3');
    PreencherGrupos;
  end;
end;

procedure TfrmGerenciaBoletoRemessa.ValidarCamposObrigatorios;
var
  viDadosPessoa : TStringList;
  visql : String;
begin
  if cdsPessoaAux.RecordCount = 0 then
    Exit;

  try
    cdsPessoaAux.DisableControls;
    cdsPessoaAux.First;

    viDadosPessoa := TStringList.Create;
    while not cdsPessoaAux.Eof do begin
      if cdsPessoaAuxSELECIONADO.AsString = 'N' then begin
        cdsPessoaAux.Next;
        Continue;
      end;

     visql := ' select FIRST 1 NOME, CPFCNPJ, ENDERECO_LOGRADOURO, ENDERECO_BAIRRO, '+
              '       ENDERECO_CEP, ENDERECO_CIDADE_ID, ENDERECO_CIDADE_UF ';

      if rdbNome.Checked then
            visql := visql + ' from J_PESSOA WHERE PESSOA_ID = '+ cdsPessoaAuxPESSOAID.AsString
      else visql := visql + ' from J_PESSOA WHERE IDENTIFICACAO = '+ QuotedStr(cdsPessoaAuxNOME.AsString);

      viDadosPessoa := dtmControles.GetFields(visql);

      if viDadosPessoa.Values['NOME'] = '' then
        RetornarMsgAbortar('Informar nome para o cliente ' + viDadosPessoa.Values['CPFCNPJ'] + '.');

      if viDadosPessoa.Values['CPFCNPJ'] = '' then
        RetornarMsgAbortar('Informar CPF/CNPJ para o cliente ' + cdsPessoaAuxNOME.AsString + '.');

      if viDadosPessoa.Values['ENDERECO_LOGRADOURO'] = '' then
        RetornarMsgAbortar('Informar logradouro para o cliente ' + cdsPessoaAuxNOME.AsString + '.');

      if viDadosPessoa.Values['ENDERECO_BAIRRO'] = '' then
        RetornarMsgAbortar('Informar bairro para o cliente ' + cdsPessoaAuxNOME.AsString + '.');

      if viDadosPessoa.Values['ENDERECO_CEP'] = '' then
        RetornarMsgAbortar('Informar CEP para o cliente ' + cdsPessoaAuxNOME.AsString + '.');

      if viDadosPessoa.Values['ENDERECO_CIDADE_UF'] = '' then
        RetornarMsgAbortar('Informar UF para o cliente ' + cdsPessoaAuxNOME.AsString + '.');

      if viDadosPessoa.Values['ENDERECO_CIDADE_ID'] = '' then
        RetornarMsgAbortar('Informar cidade para o cliente ' + cdsPessoaAuxNOME.AsString + '.');

      cdsPessoaAux.Next;
    end;
  finally
    vlNaoCarregarCompromisso := False;
    cdsPessoaAux.RecNo := vlPessoaRecno;
    cdsPessoaAux.EnableControls;
  end;
end;

procedure TfrmGerenciaBoletoRemessa.ValidarDataBoleto;

  procedure ValidarData(vpDataBoleto : TDate);
  begin
    if vpDataBoleto < vgDataAtualTipoDate then
    begin
      Application.MessageBox('Data de Gera��o est� inferior a Data Atual!','Informar', MB_OK + MB_ICONINFORMATION);
      Abort;
    end;
  end;

begin
  if cbxVencimentoTipo.ItemIndex = 1 then
    ValidarData(edtDataVencimento.Date)
  else
  begin
    try
      cdsPessoaAux.DisableControls;
      sqlCompromisso.DisableControls;
      cdsPessoaAux.First;

      while not cdsPessoaAux.Eof do
      begin
        if cdsPessoaAuxSELECIONADO.AsString = 'N' then begin
          cdsPessoaAux.Next;
          Continue;
        end;
        CarregarCompromissos;

        sqlCompromisso.First;
        while not sqlCompromisso.Eof do
        begin
          if sqlCompromissoSELECIONADO.AsBoolean then
            ValidarData(sqlCompromissoDATA_VENCIMENTO.AsDateTime);
          sqlCompromisso.Next;
        end;
        cdsPessoaAux.Next;
      end;
    finally
      vlNaoCarregarCompromisso := False;
      cdsPessoaAux.EnableControls;
      sqlCompromisso.EnableControls;
    end;
  end;
end;

procedure TfrmGerenciaBoletoRemessa.VisualizarImprimiBoletoClick(
  Sender: TObject);
var
  viNomeDescricao : String;
begin
  if sqlCompromissoBOLETA_ID.AsInteger = 0  then begin
    Application.MessageBox('Arquivo n�o foi gerado!','Aviso', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  dtmLookupFinanceiro.CarregarDadosDaConta(sqlCompromissoBANCO_ID.AsInteger);

  if rdbNome.Checked then
       viNomeDescricao := sqlCompromissoBOLETO_DESCRICAO.AsString
  else viNomeDescricao := cdsPessoaAuxNOME.AsString;

  if viNomeDescricao = '' then
    viNomeDescricao := sqlCompromissoNOME.AsString;

  vgCaminhoArquivo := vgPastaBoleto+'\'+viNomeDescricao+'\'+viNomeDescricao
                + '_' + RetirarBarra(sqlCompromissoDATA_BOLETA.AsString)
                + '_' + FormatFloat('00000000000', sqlCompromissoNOSSO_NUMERO.AsInteger) + '.PDF';

  if not FileExists(vgCaminhoArquivo) then begin
    Application.MessageBox('Caminho do arquivo n�o encontrado!','Aviso', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  ExibirFormulario(TfrmVisualizaBoleto, frmVisualizaBoleto, True);
end;

end.



  if lcxBancoBoleto.EditValue = null then
    exit;

  dtmLookupFinanceiro.sqlBanco.Active := False;
  dtmLookupFinanceiro.sqlBanco.DataSet.ParamByName('BANCO_ID').AsBCD := lcxBancoBoleto.EditValue;
  dtmLookupFinanceiro.sqlBanco.Active := True;

  vgPastaBoleto :=  Trim(dtmLookupFinanceiro.sqlBancoLOCAL_PADRAO.AsString);





