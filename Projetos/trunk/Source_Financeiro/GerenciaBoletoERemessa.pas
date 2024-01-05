unit GerenciaBoletoERemessa;

interface

uses
  I9Query,
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
  frxDBSet, ACBrBoletoConversao;

type
  TfrmGerenciaBoletoRemessa = class(TForm)
    pgcFiltro: TcxPageControl;
    tbcBoleto: TcxTabSheet;
    sqlPessoa: TI9Query;
    dtsPessoa: TDataSource;
    ppmCompromisso: TPopupMenu;
    CancelarBoleto: TMenuItem;
    N1: TMenuItem;
    VisualizarImprimiBoleto: TMenuItem;
    tabPrevisoes: TcxTabControl;
    cxPageControl1: TcxPageControl;
    pnlPesquisaPersonalizada: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    cxLabel2: TcxLabel;
    edtPesqNome: TcxTextEdit;
    Panel7: TPanel;
    btnPesquisar: TcxButton;
    btnLimpar: TcxButton;
    pnlPeriodoPersonalizado: TPanel;
    cxLabel10: TcxLabel;
    edtDataInicial: TcxDateEdit;
    cxLabel3: TcxLabel;
    edtDataFinal: TcxDateEdit;
    tbcRemessa: TcxTabSheet;
    tbcRetorno: TcxTabSheet;
    cxGroupBox2: TcxGroupBox;
    cxGridCliente: TcxGrid;
    cxGridClienteDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    Panel4: TPanel;
    sqlCompromisso: TI9Query;
    dtsCompromisso: TDataSource;
    sqlPessoaPESSOA_ID: TBCDField;
    sqlPessoaNOME: TStringField;
    sqlPessoaSELECIONADO: TStringField;
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
    cxGridCompromissoDBTableView1ATUALIZADO: TcxGridDBColumn;
    cxGridCompromissoDBTableView1OPERACAO: TcxGridDBColumn;
    cxGridCompromissoDBTableView1SELECIONADO: TcxGridDBColumn;
    cxGridCompromissoLevel1: TcxGridLevel;
    GerarBoleto: TMenuItem;
    cxGridCompromissoDBTableView1CalcTravado: TcxGridDBColumn;
    cxGridCompromissoDBTableView1CONTA_CONTABIL_ID: TcxGridDBColumn;
    cxGridCompromissoDBTableView1Ref: TcxGridDBColumn;
    sqlPessoaANO_MES_REFERENCIA: TStringField;
    sqlPessoaDATA_VENCIMENTO: TSQLTimeStampField;
    dtsPessoaAux: TDataSource;
    cdsPessoaAux: TClientDataSet;
    cdsPessoaAuxPESSOAID: TStringField;
    cdsPessoaAuxNOME: TStringField;
    cdsPessoaAuxSELECIONADO: TStringField;
    sqlCompromissoLIVRO_FINANCEIRO_ID: TBCDField;
    sqlCompromissoDATA_VENCIMENTO: TSQLTimeStampField;
    sqlCompromissoVALOR_AGENDADO: TBCDField;
    sqlCompromissoSITUACAO: TStringField;
    sqlCompromissoCONTABIL_CONTA_ID: TBCDField;
    sqlCompromissoCENTRO_CUSTO_ID: TBCDField;
    sqlCompromissoANO_MES_REFERENCIA: TStringField;
    sqlCompromissoBALANCETE_GRUPO_ID: TBCDField;
    sqlCompromissoESPECIE: TStringField;
    sqlCompromissoBOLETA_ID: TBCDField;
    sqlCompromissoATUALIZADO: TStringField;
    sqlCompromissoVALOR_PAGO: TBCDField;
    sqlCompromissoPROCESSO_CONTRATO_ITEM_ID: TBCDField;
    sqlCompromissoPROCESSO_CONTRATO_ID: TBCDField;
    sqlCompromissoOPERACAO: TStringField;
    sqlCompromissoPESSOA_ID: TBCDField;
    sqlCompromissoVALOR_DOCUMENTO: TBCDField;
    sqlCompromissoLIVRO_REMUNERACAO_ID: TBCDField;
    sqlCompromissoFINANCEIRO_REMUNERACAO_ID: TBCDField;
    sqlCompromissoHISTORICO: TStringField;
    sqlCompromissoOBSERVACAO: TStringField;
    sqlCompromissoDATA_OPERACAO: TSQLTimeStampField;
    sqlCompromissoLIVRO_AGENDAMENTO_ID: TBCDField;
    sqlCompromissoDESCONTO: TBCDField;
    sqlCompromissoIR: TStringField;
    sqlCompromissoCNJ: TStringField;
    sqlCompromissoDOCUMENTO_NUMERO: TStringField;
    sqlCompromissoCAIXA_ID: TBCDField;
    sqlCompromissoREGISTRO_PARCIAL: TStringField;
    sqlCompromissoSELECIONADO: TStringField;
    sqlCompromissoNOME: TStringField;
    sqlCompromissoVALOR_PAGO_SOMA: TBCDField;
    sqlCompromissocalc_referencia: TStringField;
    sqlCompromissocalc_valor_a_pagar: TCurrencyField;
    tabRemessa: TcxTabControl;
    gbRegistro: TcxGroupBox;
    cxLabel4: TcxLabel;
    btnPesquisaRemessa: TcxButton;
    btnLimparFiltroRemessa: TcxButton;
    edtNossoNumero: TcxTextEdit;
    sqlPesqCompromisso: TI9Query;
    dtsPesqCompromisso: TDataSource;
    sqlPesqCompromissoNOME: TStringField;
    sqlPesqCompromissoANO_MES_REFERENCIA: TStringField;
    sqlPesqCompromissoVALOR_AGENDADO: TBCDField;
    sqlPesqCompromissoBOLETA_ID: TBCDField;
    sqlPesqCompromissoNOSSO_NUMERO: TBCDField;
    cxGridRemessaDBTableView1: TcxGridDBTableView;
    cxGridRemessaLevel1: TcxGridLevel;
    cxGridRemessa: TcxGrid;
    cxGridRemessaDBTableView1NOME: TcxGridDBColumn;
    cxGridRemessaDBTableView1ANO_MES_REFERENCIA: TcxGridDBColumn;
    cxGridRemessaDBTableView1VALOR_AGENDADO: TcxGridDBColumn;
    cxGridRemessaDBTableView1SITUACAO: TcxGridDBColumn;
    cxGridRemessaDBTableView1BOLETA_ID: TcxGridDBColumn;
    cxGridRemessaDBTableView1NOSSO_NUMERO: TcxGridDBColumn;
    sqlPesqCompromissoCONTABIL_CONTA_ID: TBCDField;
    sqlPesqCompromissocalc_referencia: TStringField;
    ppmRemessa: TPopupMenu;
    GerarRemessa1: TMenuItem;
    btnGerarRemessa: TcxButton;
    cxLabel5: TcxLabel;
    edtBoletoId: TcxTextEdit;
    sqlPesqCompromissoDATA_EMISSAO: TSQLTimeStampField;
    cxGridRemessaDBTableView1CONTABIL_CONTA_ID: TcxGridDBColumn;
    sqlPesqCompromissoCAIXA_ID: TBCDField;
    sqlPesqCompromissoDATA_VENCIMENTO: TSQLTimeStampField;
    sqlPesqCompromissoCARTEIRA: TStringField;
    sqlPesqCompromissoCPFCNPJ: TStringField;
    sqlPesqCompromissoENDERECO_CIDADE_ID: TBCDField;
    sqlPesqCompromissoENDERECO_LOGRADOURO: TStringField;
    sqlPesqCompromissoENDERECO_BAIRRO: TStringField;
    sqlPesqCompromissoENDERECO_CIDADE_UF: TStringField;
    sqlPesqCompromissoENDERECO_CEP: TStringField;
    sqlPesqCompromissoEMAIL1: TStringField;
    sqlPesqCompromissoTELEFONE: TStringField;
    sqlCompromissogerou_boleto_calc: TStringField;
    cxGroupBox5: TcxGroupBox;
    sqlAgruparReferencia: TI9Query;
    sqlAgruparReferenciaANO_MES_REFERENCIA: TStringField;
    sqlAgruparReferenciaVALOR: TBCDField;
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
    sqlPesqCompromissoLIVRO_FINANCEIRO_ID: TBCDField;
    cdsRetornoLOCALIZADO: TBooleanField;
    lblMarcarTodosRetorno: TcxLabel;
    lblDesmarcarTodosRetorno: TcxLabel;
    cdsRetornoSELECIONADO: TStringField;
    cxGridRetornoDBTableView1SELECIONAR: TcxGridDBColumn;
    btnEnviarCaixa: TcxButton;
    gbCancelamento: TcxGroupBox;
    btnCancelarTodosBoletos: TcxButton;
    cdsRetornoVALOR_DOCUMENTO: TCurrencyField;
    cdsRetornoDOCUMENTO: TStringField;
    cdsRetornoVALOR_PAGO: TCurrencyField;
    cxGridRetornoDBTableView1VALOR_PAGO: TcxGridDBColumn;
    cxLabel13: TcxLabel;
    cbxDadosBanco: TcxComboBox;
    sqlBanco: TI9Query;
    sqlBancoBANCO_ID: TBCDField;
    sqlBancoBANCO_NUMERO: TStringField;
    sqlBancoBANCO_DIGITO: TStringField;
    sqlBancoBANCO_NOME: TStringField;
    sqlBancoAGENCIA_NOME: TStringField;
    sqlBancoAGENCIA_NUMERO: TStringField;
    sqlBancoCONTA_NUMERO: TStringField;
    sqlBancoCONTA_DIGITO: TStringField;
    sqlBancoAGENCIA_UF: TStringField;
    sqlBancoAGENCIA_DIGITO: TStringField;
    sqlPesqCompromissoSITUACAO: TStringField;
    cdsRetornoSITUACAO: TStringField;
    cxGridRetornoDBTableView1SITUACAO: TcxGridDBColumn;
    chxAgruparDesagrupar: TcxCheckBox;
    cxGridCompromissoDBTableView1Column1: TcxGridDBColumn;
    Panel1: TPanel;
    lblMarcar: TcxLabel;
    lblDesmarcar: TcxLabel;
    Panel5: TPanel;
    PanelBotaoFechar: TPanel;
    cxBtnFechar: TcxButton;
    cxGroupBox1: TcxGroupBox;
    chkAgruparPorReferencia: TcxCheckBox;
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
    procedure cxBtnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lblMarcarClick(Sender: TObject);
    procedure lblDesmarcarClick(Sender: TObject);
    procedure VisualizarImprimiBoletoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure btnLimparPesqClick(Sender: TObject);
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
    procedure sqlPesqCompromissoCalcFields(DataSet: TDataSet);
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
    procedure tabRemessaChange(Sender: TObject);
    procedure pgcFiltroChange(Sender: TObject);
    procedure btnCancelarTodosBoletosClick(Sender: TObject);
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
    procedure edtPesqNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPesqNomeExit(Sender: TObject);
    procedure edtPesqNomePropertiesChange(Sender: TObject);
  private
    vlAbrindoForm : Boolean;
    { Private declarations }
    procedure PreencherCliente;
    procedure CarregarCompromissos;
    procedure SelecioneTodosClientes(vpSelecionar: string);
    procedure SelecioneTodosCompromissos(vpSelecionar: string);
    procedure SelecioneTodosCompromissosRetorno(vpSelecionar: string);
    procedure ValidarCamposObrigatorios;
    procedure CarregarDadosBanco;
    procedure DesabilitaPessoaECompromisso;

    function ExisteClienteSelecionado: Boolean;
    function ExisteCompromissoSelecionado: Boolean;
  public
    { Public declarations }
  end;

var
  frmGerenciaBoletoRemessa: TfrmGerenciaBoletoRemessa;

implementation

uses
  Controles, Rotinas, Lookup, Lookup_Contabil,
  LookupFinanceiro, EnviarBoletoPorEmail, CadEnvioEmail, Lookup_Servico, CadastroRapidoLancamento, ValidarPermissaoUsuario,
  VisualizaBoleto;

{$R *.dfm}

const
  // grid de clientes
  vcClienteSelecionado      = 1;

  // grid de compromissos
  vcBoletoId                = 8;
  vcCompromissoSelecionado  = 10;

  // grid de retorno
  vcRetSelecionar           = 1;
  vcLocalizado              = 2;
  vcRetSituacao             = 3;
  vcDiferenca               = 5;


procedure TfrmGerenciaBoletoRemessa.btnCancelarTodosBoletosClick(
  Sender: TObject);
begin
  if (LiberarPermissaoUsuario('ESP_CANCELAR_BOLETOS')[6] = '0') then
    Exit;

  if Application.MessageBox(Pchar('Deseja cancelar todos os boletos em aberto?'),'Confirma��o', MB_YESNO) = IDNO then
    Exit;

  // Cancela todos os boletos em aberto
  ExecutaSqlAuxiliar(
    ' update J_BOLETO set ' +
    '  SITUACAO = ' + QuotedStr('3') + ',' +
    '  DATA_CANCELADO = ' + QuotedStr(FormatDateTime('DD.MM.YYYY HH:MM:SS', Now)) + ',' +
    '  CONT_REMESSA = NULL ' +
    ' where SITUACAO = ' + QuotedStr('1'),1);

  ExecutaSqlAuxiliar('update J_LIVRO_FINANCEIRO set BOLETA_ID = NULL where BOLETA_ID is not null ' +
    ' and SITUACAO = ' + QuotedStr('1'),1);

  Application.MessageBox('Boleto(s) cancelado com sucesso!','Informa��o', MB_OK + MB_ICONINFORMATION);
  CarregarCompromissos;
  sqlCompromisso.Refresh;
end;

procedure TfrmGerenciaBoletoRemessa.btnEnviarBoletosEmailClick(Sender: TObject);
begin
  DesabilitaPessoaECompromisso;
  ExibirFormulario(TfrmEnviarBoletoPorEmail, frmEnviarBoletoPorEmail, True);

  vgEmailConfig.Tabela := 'G_EMAIL_CONFIG';
  vgRetornoEmail.enviarEmail := True;
  ExibirFormulario(TfrmCadEnvioEmail, frmCadEnvioEmail, True);

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

      try
        dtmControles.StartTransaction;
        vgDadosLivroCaixa.CaixaID          := FieldByName('CAIXA_ID').AsInteger;
        vgDadosLivroCaixa.DataLancamento   := dtmControles.DataHoraBanco(4);
        vgDadosLivroCaixa.DataPagamento    := FormatDateTime('DD.MM.YYYY',FieldByName('DATA_VENCIMENTO').AsDateTime);
        vgDadosLivroCaixa.DataVencimento   := FormatDateTime('DD.MM.YYYY',FieldByName('DATA_VENCIMENTO').AsDateTime);

        vgDadosLivroCaixa.DataVencimento   := FormatDateTime('DD.MM.YYYY',FieldByName('DATA_VENCIMENTO').AsDateTime);
        vgDadosLivroCaixa.ValorCompromisso := FieldByName('VALOR_AGENDADO').AsCurrency;
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
  viBancoId: Integer;
  viRetornoBoleto: TRetornoImprimiuBoleto;
  viDataVencimento : TDate;
  viRecNo : Integer;

  procedure ValidarDados;
  begin
    if cbxVencimentoTipo.ItemIndex = 1 then
      VerificarPreenchimentoDTA_TX(edtDataVencimento.Text, 'Data de Vencimento', edtDataVencimento);

    if not ExisteClienteSelecionado then begin
      Application.MessageBox('Selecione um cliente para continuar!','Aviso', MB_OK + MB_ICONINFORMATION);
      Abort;
    end;

    if not ExisteCompromissoSelecionado then begin
      Application.MessageBox('Selecione um compromisso para continuar!','Aviso', MB_OK + MB_ICONINFORMATION);
      Abort;
    end;
  end;

begin
  ValidarDados;
  ValidarCamposObrigatorios;
  if Application.MessageBox('Deseja gerar boleto?','Confirma��o', MB_YESNO + MB_ICONQUESTION) = IDNO then
    Exit;

  viBancoId := dtmControles.GetInt('select BANCO_ID from J_CAIXA where CAIXA_ID = ' +
    sqlCompromissoCAIXA_ID.AsString);
  if viBancoId = 0 then begin
    Application.MessageBox('Informe a conta banc�ria do caixa financeiro!','Aviso', MB_OK + MB_ICONWARNING);
    Exit;
  end;

  cdsPessoaAux.DisableControls;
  cdsPessoaAux.First;
  while not cdsPessoaAux.Eof do
  begin

    if cdsPessoaAuxSELECIONADO.AsString = 'N' then begin
      cdsPessoaAux.Next;
      Continue;
    end;

    CarregarCompromissos;

    if chkAgruparPorReferencia.Checked then
    begin
      sqlAgruparReferencia.Active := False;
      sqlAgruparReferencia.ParamByName('PESSOA_ID').AsString := cdsPessoaAuxPESSOAID.AsString;
      sqlAgruparReferencia.Active := True;

      if sqlAgruparReferencia.IsEmpty then begin
        Application.MessageBox('N�o existem compromissos selecionados!','Aviso', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;

      sqlAgruparReferencia.First;
      while not sqlAgruparReferencia.Eof do
      begin
        Inc(vgBoletoID);
        viRetornoBoleto := dtmLookupFinanceiro.CriarTituloLista(
          cdsPessoaAuxPESSOAID.AsInteger,    // pessoa
          '',                                // livros
          viDataVencimento,            // vencimento
          viBancoId,                         // banco
          chkAgruparPorReferencia.Checked,   // por referencia
          sqlAgruparReferenciaVALOR.AsCurrency, // valor documento
          sqlAgruparReferenciaANO_MES_REFERENCIA.AsString // ano mes referencia
        );

        if not viRetornoBoleto.ImprimiuBoleto then begin
          Application.MessageBox('Falha ao gerar arquivo!','Aviso', MB_OK + MB_ICONINFORMATION);
          Exit;
        end;

        sqlAgruparReferencia.Next;
      end;
      sqlAgruparReferencia.Active := False;
    end
    else
    begin
      // Gera um boleto para cada compromisso.
      sqlCompromisso.DisableControls;
      sqlCompromisso.First;
      while not sqlCompromisso.Eof do
      begin
        if sqlCompromissoSELECIONADO.AsString = 'N' then begin
          sqlCompromisso.Next;
          Continue;
        end;

        if cbxVencimentoTipo.ItemIndex = 0 then
             viDataVencimento := sqlCompromissoDATA_VENCIMENTO.AsDateTime
        else viDataVencimento := edtDataVencimento.Date;

        viRecNo := sqlCompromisso.RecNo;
        sqlCompromisso.Filter   := 'LIVRO_FINANCEIRO_ID = '+sqlCompromissoLIVRO_FINANCEIRO_ID.AsString;
        sqlCompromisso.Filtered := False;
        sqlCompromisso.Filtered := True;

        Inc(vgBoletoID);
        viRetornoBoleto := dtmLookupFinanceiro.CriarTituloLista(
          cdsPessoaAuxPESSOAID.AsInteger,
          sqlCompromissoLIVRO_FINANCEIRO_ID.AsString,
          viDataVencimento,
          viBancoId,
          chkAgruparPorReferencia.Checked,
          0,
          ''
        );

        if not viRetornoBoleto.ImprimiuBoleto then
        begin
          Application.MessageBox('Falha ao gerar arquivo!','Aviso', MB_OK + MB_ICONINFORMATION);
          Exit;
        end;

        sqlCompromisso.Filtered := False;
        sqlCompromisso.RecNo    := viRecNo;
        sqlCompromisso.Next;
      end;
    end;
    sqlCompromisso.First;
    sqlCompromisso.EnableControls;

    cdsPessoaAux.Next;
  end;
  cdsPessoaAux.First;
  cdsPessoaAux.EnableControls;
  CarregarCompromissos;
  sqlCompromisso.Refresh;
  edtDataVencimento.Clear;
end;

procedure TfrmGerenciaBoletoRemessa.CancelarBoletoClick(Sender: TObject);
var
  viRemessa: string;
begin
  if
    Application.MessageBox(PChar('Deseja cancelar boleto de n� ' +
      sqlCompromissoBOLETA_ID.AsString),'Confirma��o', MB_YESNO + MB_ICONQUESTION) = IDNO
  then
    Exit;

  ExecutaSqlAuxiliar(
    'update J_BOLETO set SITUACAO = ' + QuotedStr('3') + ',' +
    ' DATA_CANCELADO = ' + QuotedStr(FormatDateTime('DD.MM.YYYY HH:MM:SS', Now)) + ',' +
    ' CONT_REMESSA = NULL ' +
    ' where BOLETO_ID = ' + sqlCompromissoBOLETA_ID.AsString,1);

  ExecutaSqlAuxiliar('update J_LIVRO_FINANCEIRO set BOLETA_ID = NULL where BOLETA_ID = ' +
    sqlCompromissoBOLETA_ID.AsString,1);

  if (dtmControles.GetStr('select SITUACAO from J_BOLETO where BOLETO_ID = ' +
    sqlCompromissoBOLETA_ID.AsString)) = '3'
  then
    Application.MessageBox('Boleto cancelado com sucesso!','Confirma��o', MB_Ok + MB_ICONINFORMATION);

  CarregarCompromissos;
  sqlCompromisso.Refresh;
end;

procedure TfrmGerenciaBoletoRemessa.CarregarCompromissos;
var
  viFiltro: string;
  viDataIni: string;
  viDataFim: string;
  viPesquisa: string;
  viReferencia: string;

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
  viFiltro  := '';
  viDataIni := '';
  viDataFim := '';
  viReferencia := '';

  if cdsPessoaAuxPESSOAID.AsString = '' then
    Exit;

  try
    Screen.Cursor := crHourGlass;

    // Montar filtro(s) de compromissos ........................................
    viFiltro := ' and P.PESSOA_ID = ' + cdsPessoaAuxPESSOAID.AsString;
    case tabPrevisoes.TabIndex of
      1: begin // Vencidos/Dia atual
           viDataFim := vgDataAtualTipo4;
           viFiltro := viFiltro + ' and (LF.DATA_VENCIMENTO <= ' +
             QuotedStr(dtmControles.DataParaString(StrToDate(viDataFim))) + ')';
         end;
      2: begin // At� 7 dias
           viDataFim := DateToStr(StrToDate(vgDataAtualTipo4) + 7);
           viFiltro := viFiltro + ' and (LF.DATA_VENCIMENTO <= ' +
             QuotedStr(dtmControles.DataParaString(StrToDate(viDataFim))) + ')';
         end;
      3: begin // M�s atual
           MontarDataInicioFinal(vgDataAtualTipo4, viDataIni, viDataFim, '/');
           viReferencia := QuotedStr(PegarAnoMes(viDataFim));

           viFiltro := viFiltro + ' and LF.ANO_MES_REFERENCIA <= ' + viReferencia;
         end;
      4: begin // Pr�ximo m�s
          viReferencia := QuotedStr(PegarAnoMes(DateToStr(vgDataAtualTipoDate + 30)));
          viFiltro := viFiltro + ' and LF.ANO_MES_REFERENCIA <= ' + viReferencia;
         end;
      5: begin // At� 2 meses
           viReferencia := QuotedStr(PegarAnoMes(DateToStr(vgDataAtualTipoDate + 60)));
           viFiltro := viFiltro + ' and LF.ANO_MES_REFERENCIA <= ' + viReferencia;
         end;
      6: begin // At� 6 meses
           viReferencia := QuotedStr(PegarAnoMes(DateToStr(vgDataAtualTipoDate + 180)));
           viFiltro := viFiltro + ' and LF.ANO_MES_REFERENCIA <= ' + viReferencia;
         end;
      7: begin // At� 12 meses
           viReferencia := QuotedStr(PegarAnoMes(DateToStr(vgDataAtualTipoDate + 333)));
           viFiltro := viFiltro + ' and LF.ANO_MES_REFERENCIA <= ' + viReferencia;
         end;
      8: begin // At� final do ano
          MontarDataInicioFinal(vgDataAtualTipo4, viDataIni, viDataFim, '/', '12');
          viReferencia := QuotedStr(PegarAnoMes(viDataFim));
          viFiltro := viFiltro + ' and LF.ANO_MES_REFERENCIA <= ' + viReferencia;
         end;
      9: begin // Personalizado
           viDataIni := DateToStr(edtDataInicial.Date);
           viDataFim := DateToStr(edtDataFinal.Date);

           viFiltro := viFiltro + ' and LF.DATA_VENCIMENTO between ' +
             QuotedStr(dtmControles.DataParaString(StrToDate(viDataIni))) + ' and ' +
             QuotedStr(dtmControles.DataParaString(StrToDate(viDataFim)));
         end;
    end;

    viPesquisa :=
      ' SELECT ' +
      '  LF.*, ' +
      '  P.NOME, ' +
      '  coalesce((SELECT SUM(VALOR) FROM J_LIVRO_CAIXA WHERE LIVRO_FINANCEIRO_ID = LF.LIVRO_FINANCEIRO_ID),0) AS VALOR_PAGO_SOMA ' +

      ' FROM ' +
      '  J_LIVRO_FINANCEIRO LF ' +

      ' INNER JOIN J_PESSOA P ' +
      ' ON LF.PESSOA_ID = P.PESSOA_ID ' +

      ' WHERE LF.SITUACAO IN (''1'',''2'') ' + viFiltro +

      ' ORDER BY ' +
      '  LF.DATA_VENCIMENTO, ' +
      '  LF.ANO_MES_REFERENCIA, '+
      '  LF.CONTABIL_CONTA_ID ';

    sqlCompromisso.Active := False;
    sqlCompromisso.SQL.Text := viPesquisa;
    sqlCompromisso.Active := True;

    if sqlCompromisso.RecordCount = 0 then begin
      Application.MessageBox('N�o existe informa��o para o per�odo! ','Aviso', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
  finally
    Screen.Cursor := crDefault;
  end;

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
  if chxAgruparDesagrupar.Checked then begin
    cxGridRemessaDBTableView1.OptionsView.GroupFooters := gfVisibleWhenExpanded;
    cxGridRemessaDBTableView1NOME.GroupIndex := -1;
    cxGridRemessaDBTableView1NOME.Visible := True;
  end
  else begin
    cxGridRemessaDBTableView1.OptionsView.GroupFooters := gfInvisible;
    cxGridRemessaDBTableView1NOME.GroupIndex := 0;
    cxGridRemessaDBTableView1NOME.Visible := False;

    cxGridRemessaDBTableView1.DataController.Groups.FullExpand;
  end
end;

procedure TfrmGerenciaBoletoRemessa.cxBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmGerenciaBoletoRemessa.btnPesquisaRemessaClick(Sender: TObject);
var
  viFiltro: string;
  viPesquisa: string;
  viDataEntrada: string;
begin
  viFiltro := '';
  viDataEntrada := '';

  if Trim(edtNossoNumero.Text) <> '' then
    viFiltro := viFiltro + ' and BO.NOSSO_NUMERO = ' + QuotedStr(Trim(edtNossoNumero.Text));

  if Trim(edtBoletoId.Text) <> '' then
    viFiltro := viFiltro + ' and BO.BOLETO_ID = ' + Trim(edtBoletoId.Text);

  viPesquisa :=
    ' select ' +
    '  P.NOME, ' +
    '  P.CPFCNPJ, ' +
    '  P.ENDERECO_CIDADE_ID, ' +
    '  P.ENDERECO_LOGRADOURO, ' +
    '  P.ENDERECO_BAIRRO, ' +
    '  P.ENDERECO_CIDADE_UF, ' +
    '  P.ENDERECO_CEP, ' +
    '  P.EMAIL1, ' +
    '  P.TELEFONE, ' +
    '  LF.LIVRO_FINANCEIRO_ID, ' +
    '  LF.CAIXA_ID, ' +
    '  LF.CONTABIL_CONTA_ID, ' +
    '  LF.ANO_MES_REFERENCIA, ' +
    '  LF.VALOR_AGENDADO, ' +
    '  BO.SITUACAO, ' +
    '  LF.BOLETA_ID, ' +
    '  BO.NOSSO_NUMERO, ' +
    '  BO.DATA_EMISSAO, ' +
    '  BO.DATA_VENCIMENTO, ' +
    '  BO.CARTEIRA ' +
    ' from ' +
    '  J_LIVRO_FINANCEIRO LF ' +

    ' inner join J_PESSOA P ' +
    ' on LF.PESSOA_ID = P.PESSOA_ID ' +

    ' inner join J_BOLETO BO ' +
    ' on LF.BOLETA_ID = BO.BOLETO_ID ' +

    ' where LF.BOLETA_ID is not null ' +
    ' and LF.SITUACAO <> ' + QuotedStr('2') +
    ' and BO.CONT_REMESSA is null ' + viFiltro +

    ' order by LF.CONTABIL_CONTA_ID';

  sqlPesqCompromisso.Active := False;
  sqlPesqCompromisso.SQL.Text := viPesquisa;
  sqlPesqCompromisso.Active := True;

  if sqlPesqCompromisso.RecordCount = 0 then begin
    Application.MessageBox('N�o Existe Informa��es para est� pesquisa!','Aviso', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

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

  with ACBrBoleto1.Cedente do
  begin
    ExecutaSqlAuxiliar('select DESCRICAO, CNPJ_CPF from J_CEDENTE', 0);
    Nome    := dtmControles.sqlAuxiliar.FieldByName('DESCRICAO').AsString;
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
  end;
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

procedure TfrmGerenciaBoletoRemessa.btnLimparFiltroRemessaClick(Sender: TObject);
begin
  edtNossoNumero.Clear;
  edtBoletoId.Clear;
  sqlPesqCompromisso.Active := False;
  btnGerarRemessa.Enabled := False;
  edtNossoNumero.SetFocus;
end;

procedure TfrmGerenciaBoletoRemessa.btnGerarRemessaClick(Sender: TObject);
var
  viTam: Integer;
  viBancoId: Integer;
  viBoleto: TArrayOfBoleto;
  viRetornoRemessa: TRetornoGerouRemessa;
begin
  if sqlPesqCompromisso.IsEmpty then begin
    Application.MessageBox('N�o existe informa��es para gerar arquivo de remessa! ','Aviso', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  viBancoId := dtmControles.GetInt('select BANCO_ID from J_CAIXA where CAIXA_ID = ' + sqlPesqCompromissoCAIXA_ID.AsString);
  if viBancoId = 0 then begin
    Application.MessageBox('Informe a conta banc�ria do caixa financeiro! ','Falha', MB_OK + MB_ICONWARNING);
    Exit;
  end;

  viTam := 0;
  sqlPesqCompromisso.DisableControls;
  sqlPesqCompromisso.First;
  while not sqlPesqCompromisso.Eof do begin
    SetLength(viBoleto, viTam + 1);
    viBoleto[viTam].nomeSacado        := sqlPesqCompromissoNOME.AsString;
    viBoleto[viTam].valorDocumento    := sqlPesqCompromissoVALOR_AGENDADO.AsCurrency;
    viBoleto[viTam].numeroDocumento   := sqlPesqCompromissoLIVRO_FINANCEIRO_ID.AsString;
    viBoleto[viTam].nossoNumero       := sqlPesqCompromissoNOSSO_NUMERO.AsString;
    viBoleto[viTam].dataDocumento     := sqlPesqCompromissoDATA_EMISSAO.AsDateTime;
    viBoleto[viTam].vencimento        := sqlPesqCompromissoDATA_VENCIMENTO.AsDateTime;
    viBoleto[viTam].especieDoc        := 'DM';
    viBoleto[viTam].Aceite            := 'N';
    viBoleto[viTam].DataProcessamento := Date;
    viBoleto[viTam].Carteira          := sqlPesqCompromissoCARTEIRA.AsString;

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
      Application.MessageBox('Por favor, Informar a cidade para continuar!','Aviso', MB_OK + MB_ICONINFORMATION);
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

  viRetornoRemessa := dtmLookupFinanceiro.GerarRemessa(viBancoId, 0, viBoleto);
   if not viRetornoRemessa.gerouRemessa then begin
    Application.MessageBox('Falha ao gerar arquivo remessa!', 'Falha', MB_OK + MB_ICONWARNING);
    Exit;
  end;

  sqlPesqCompromisso.DisableControls;
  sqlPesqCompromisso.First;
  while not sqlPesqCompromisso.Eof do begin
    ExecutaSqlAuxiliar('update J_BOLETO set CONT_REMESSA = ' + IntToStr(viRetornoRemessa.remessaId) +
      ' where BOLETO_ID = ' + sqlPesqCompromissoBOLETA_ID.AsString, 1);

    sqlPesqCompromisso.Next;
  end;
  sqlPesqCompromisso.First;
  sqlPesqCompromisso.EnableControls;

  sqlPesqCompromisso.Refresh;
  btnLimparFiltroRemessaClick(Self);
end;

procedure TfrmGerenciaBoletoRemessa.btnLimparPesqClick(Sender: TObject);
begin
  edtPesqNome.Clear;
  edtDataInicial.Clear;
  edtDataFinal.Clear;
  edtPesqNome.SetFocus;
end;

procedure TfrmGerenciaBoletoRemessa.btnPesquisarClick(Sender: TObject);
begin
  tabPrevisoesChange(Self);
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
  CarregarCompromissos;
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
  cdsPessoaAux.Edit;
  if cxGridClienteDBTableView2SELECIONADO.EditValue = 'N' then
    cdsPessoaAuxSELECIONADO.AsString := 'S'
  else
    cdsPessoaAuxSELECIONADO.AsString := 'N';
  cdsPessoaAux.Post;
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
  if (AViewInfo.RecordViewInfo.GridRecord.Values[vcBoletoId] <> null) then
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
  ExecutaSqlAuxiliar('update J_PESSOA set SELECIONADO = ' + QuotedStr('N'), 1);
  ExecutaSqlAuxiliar('update J_LIVRO_FINANCEIRO set SELECIONADO = ' + QuotedStr('N'), 1);
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

procedure TfrmGerenciaBoletoRemessa.edtPesqNomeExit(Sender: TObject);
begin
  edtPesqNome.Visible := False;
  edtPesqNome.Clear;
end;

procedure TfrmGerenciaBoletoRemessa.edtPesqNomeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
    cxGridCliente.SetFocus;
end;

procedure TfrmGerenciaBoletoRemessa.edtPesqNomePropertiesChange(
  Sender: TObject);
begin
  cdsPessoaAux.Locate('NOME', edtPesqNome.Text, [loPartialKey]);
end;

procedure TfrmGerenciaBoletoRemessa.tabRemessaChange(Sender: TObject);
begin
  gbCancelamento.Visible := tabRemessa.TabIndex = 1;
  gbRegistro.Visible := tabRemessa.TabIndex = 0;
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
    cdsPessoaAux.First;
    cdsPessoaAux.EnableControls;
  end;
end;

function TfrmGerenciaBoletoRemessa.ExisteCompromissoSelecionado: Boolean;
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

      if
        (dtmControles.GetInt('select count(SELECIONADO) from J_LIVRO_FINANCEIRO ' +
         ' where SELECIONADO = ''S'' and PESSOA_ID = ' + cdsPessoaAuxPESSOAID.AsString) = 0)
      then
        Result := False
      else begin
        Result := True;
        Exit;
      end;

      cdsPessoaAux.Next;
    end;
  finally
    cdsPessoaAux.First;
    cdsPessoaAux.EnableControls;
  end;
end;

procedure TfrmGerenciaBoletoRemessa.FormActivate(Sender: TObject);
begin
  frmGerenciaBoletoRemessa.WindowState := wsMaximized;
end;

procedure TfrmGerenciaBoletoRemessa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sqlBanco.Close;
  sqlPessoa.Close;
  sqlCompromisso.Close;
  sqlPesqCompromisso.Close;
  sqlAgruparReferencia.Close;

  Action := caFree;
  frmGerenciaBoletoRemessa := nil;
end;

procedure TfrmGerenciaBoletoRemessa.FormCreate(Sender: TObject);
begin
  vlAbrindoForm := True;
  vgBoletoID := 0;

  sqlBanco.Connection             := dtmControles.DB;
  sqlPessoa.Connection            := dtmControles.DB;
  sqlCompromisso.Connection       := dtmControles.DB;
  sqlPesqCompromisso.Connection   := dtmControles.DB;
  sqlAgruparReferencia.Connection := dtmControles.DB;

  vgDataAtualTipo4    := dtmControles.DataHoraBanco(4);
  vgDataAtualTipoDate := StrToDate(vgDataAtualTipo4);

  SelecioneTodosCompromissos('N');
  DesabilitaPessoaECompromisso;
  pgcFiltro.ActivePageIndex := 0;
  tabPrevisoes.TabIndex := 0;
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

procedure TfrmGerenciaBoletoRemessa.pgcFiltroChange(Sender: TObject);
begin
  if pgcFiltro.ActivePage = tbcRemessa then
    tabRemessa.TabIndex := 0
  else if pgcFiltro.ActivePage = tbcRetorno then begin
    CarregarDadosBanco;
    cbxDadosBanco.SetFocus;
  end;
end;

procedure TfrmGerenciaBoletoRemessa.PreencherCliente;
var
  viPessoaId: string;
begin
  viPessoaId := '';

  sqlPessoa.First;
  cdsPessoaAux.EmptyDataSet;
  cdsPessoaAux.DisableControls;
  while not sqlPessoa.Eof do begin

    if viPessoaId = sqlPessoaPESSOA_ID.AsString then begin
      sqlPessoa.Next;
      Continue;
    end;

    cdsPessoaAux.Insert;
    viPessoaId := sqlPessoaPESSOA_ID.AsString;
    cdsPessoaAux.FieldByName('PESSOAID').AsString    := sqlPessoaPESSOA_ID.AsString;
    cdsPessoaAux.FieldByName('NOME').AsString        := sqlPessoaNOME.AsString;
    cdsPessoaAux.FieldByName('SELECIONADO').AsString := 'N';
    cdsPessoaAux.Post;

    sqlPessoa.Next;
  end;
  cdsPessoaAux.EnableControls;
end;

procedure TfrmGerenciaBoletoRemessa.SelecioneTodosCompromissos(vpSelecionar: string);
begin
  if vpSelecionar = 'S' then begin

    cdsPessoaAux.DisableControls;
    cdsPessoaAux.First;
    while not cdsPessoaAux.Eof do begin

      if cdsPessoaAuxSELECIONADO.AsString = 'N' then begin
        cdsPessoaAux.Next;
        Continue;
      end;

      ExecutaSqlAuxiliar('update J_LIVRO_FINANCEIRO set SELECIONADO = ' + QuotedStr(vpSelecionar) +
        ' where BOLETA_ID is null and SITUACAO in (''1'',''2'') ' +
        ' and PESSOA_ID = ' + cdsPessoaAuxPESSOAID.AsString, 1);

      cdsPessoaAux.Next;
    end;
    cdsPessoaAux.First;
    cdsPessoaAux.EnableControls;
  end
  else if vpSelecionar = 'N' then begin
    ExecutaSqlAuxiliar('update J_LIVRO_FINANCEIRO set SELECIONADO = ' + QuotedStr(vpSelecionar) +
      ' where BOLETA_ID is null and SITUACAO in (''1'',''2'')', 1);
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
    cdsPessoaAux.First;
    while not cdsPessoaAux.Eof do begin
      cdsPessoaAux.Edit;
      cdsPessoaAuxSELECIONADO.AsString := vpSelecionar;
      cdsPessoaAux.Post;

      cdsPessoaAux.Next;
    end;
    cdsPessoaAux.First;
    cdsPessoaAux.EnableControls;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmGerenciaBoletoRemessa.sqlCompromissoAfterScroll(
  DataSet: TDataSet);
begin
  VisualizarImprimiBoleto.Enabled := not sqlCompromissoBOLETA_ID.IsNull;
  GerarBoleto.Enabled := sqlCompromissoBOLETA_ID.IsNull;
  CancelarBoleto.Enabled := not sqlCompromissoBOLETA_ID.IsNull;
end;

procedure TfrmGerenciaBoletoRemessa.sqlCompromissoCalcFields(DataSet: TDataSet);
begin
  sqlCompromissocalc_referencia.AsString := dtmLookupContabil.FormatarAnoMes(sqlCompromissoANO_MES_REFERENCIA.AsString);

  if sqlCompromissoSELECIONADO.AsString = 'S' then
    sqlCompromissocalc_valor_a_pagar.AsCurrency := sqlCompromissocalc_valor_a_pagar.AsCurrency + sqlCompromissoVALOR_AGENDADO.AsCurrency;

  if sqlCompromissoBOLETA_ID.AsString = '' then
    sqlCompromissogerou_boleto_calc.AsString := 'N'
  else
    sqlCompromissogerou_boleto_calc.AsString := 'S';
end;


procedure TfrmGerenciaBoletoRemessa.sqlPesqCompromissoCalcFields(
  DataSet: TDataSet);
begin
  sqlPesqCompromissocalc_referencia.AsString := dtmLookupContabil.FormatarAnoMes(sqlPesqCompromissoANO_MES_REFERENCIA.AsString);
end;

procedure TfrmGerenciaBoletoRemessa.tabPrevisoesChange(Sender: TObject);
var
  viFiltro: string;
  viDataIni: string;
  viDataFim: string;
  viPesquisa: string;
  viReferencia: string;
begin
  viFiltro  := '';
  viDataIni := '';
  viDataFim := '';
  viReferencia := '';

  pnlPesquisaPersonalizada.Visible := tabPrevisoes.TabIndex = 9;
  if pnlPesquisaPersonalizada.Visible then
    edtPesqNome.SetFocus;

  try
    Screen.Cursor := crHourGlass;

    // Montar filtro(s) de clientes ............................................
    case tabPrevisoes.TabIndex of
      0: begin // Todos
           viFiltro := '';
         end;
      1: begin // Vencidos/Dia atual
           viDataFim := vgDataAtualTipo4;
           viFiltro := ' and (LF.DATA_VENCIMENTO <= ' +
             QuotedStr(dtmControles.DataParaString(StrToDate(viDataFim))) + ')';
         end;
      2: begin // At� 7 dias
           viDataFim := DateToStr(StrToDate(vgDataAtualTipo4) + 7);
           viFiltro := ' and (LF.DATA_VENCIMENTO <= ' +
             QuotedStr(dtmControles.DataParaString(StrToDate(viDataFim))) + ')';
         end;
      3: begin // M�s atual
           MontarDataInicioFinal(vgDataAtualTipo4, viDataIni, viDataFim, '/');
           viReferencia := QuotedStr(PegarAnoMes(viDataFim));

           viFiltro := ' and LF.ANO_MES_REFERENCIA <= ' + viReferencia;
         end;
      4: begin // Pr�ximo m�s
          viReferencia := QuotedStr(PegarAnoMes(DateToStr(vgDataAtualTipoDate + 30)));
          viFiltro := ' and LF.ANO_MES_REFERENCIA <= ' + viReferencia;
         end;
      5: begin // At� 2 meses
           viReferencia := QuotedStr(PegarAnoMes(DateToStr(vgDataAtualTipoDate + 60)));
           viFiltro := ' and LF.ANO_MES_REFERENCIA <= ' + viReferencia;
         end;
      6: begin // At� 6 meses
           viReferencia := QuotedStr(PegarAnoMes(DateToStr(vgDataAtualTipoDate + 180)));
           viFiltro := ' and LF.ANO_MES_REFERENCIA <= ' + viReferencia;
         end;
      7: begin // At� 12 meses
           viReferencia := QuotedStr(PegarAnoMes(DateToStr(vgDataAtualTipoDate + 333)));
           viFiltro := ' and LF.ANO_MES_REFERENCIA <= ' + viReferencia;
         end;
      8: begin // At� final do ano
          MontarDataInicioFinal(vgDataAtualTipo4, viDataIni, viDataFim, '/', '12');
          viReferencia := QuotedStr(PegarAnoMes(viDataFim));
          viFiltro := ' and LF.ANO_MES_REFERENCIA <= ' + viReferencia;
         end;
      9: begin // Personalizado
           if (edtDataInicial.EditValue = null) or (edtDataFinal.EditValue = null) then begin
             edtDataInicial.Date := StrToDate(dtmControles.DataHoraBanco(4));
             edtDataFinal.Date   := StrToDate(dtmControles.DataHoraBanco(4));
             Exit;
           end;
           viDataIni := DateToStr(edtDataInicial.Date);
           viDataFim := DateToStr(edtDataFinal.Date);

          if Trim(edtPesqNome.Text) <> '' then
            viFiltro := ' and P.NOME like ' + QuotedStr(Trim(edtPesqNome.Text) + '%');

          viFiltro := viFiltro + ' and LF.DATA_VENCIMENTO between ' +
            QuotedStr(dtmControles.DataParaString(StrToDate(viDataIni))) + ' and ' +
            QuotedStr(dtmControles.DataParaString(StrToDate(viDataFim)));
         end;
    end;

    viPesquisa :=
      ' select ' +
      '  P.PESSOA_ID, ' +
      '  P.NOME, ' +
      '  P.SELECIONADO, ' +
      '  LF.ANO_MES_REFERENCIA, ' +
      '  LF.DATA_VENCIMENTO ' +
      ' from ' +
      '   J_PESSOA P ' +

      '  inner join J_LIVRO_FINANCEIRO LF ' +
      '  on LF.PESSOA_ID = P.PESSOA_ID ' +

      '  where P.UTILIZA_BOLETO = ''S'' ' +
      '  and LF.SITUACAO IN (''1'',''2'') ' + viFiltro +

      '  group by ' +
      '   P.PESSOA_ID, ' +
      '   P.NOME, ' +
      '   P.SELECIONADO, ' +
      '   LF.ANO_MES_REFERENCIA, ' +
      '   LF.DATA_VENCIMENTO ' +

      ' order by ' +
      '   P.NOME desc ';

    sqlPessoa.Active := False;
    sqlPessoa.SQL.Text := viPesquisa;
    sqlPessoa.Active := True;

    if vlAbrindoForm then
      exit;

    if sqlPessoa.RecordCount = 0 then begin
      Application.MessageBox('N�o existe informa��o para o per�odo! ','Aviso', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;

    PreencherCliente;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmGerenciaBoletoRemessa.ValidarCamposObrigatorios;
var
  viDadosPessoa : TStringList;
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

      viDadosPessoa := dtmControles.GetFields(
        'select NOME, CPFCNPJ, ENDERECO_LOGRADOURO, ENDERECO_BAIRRO, '+
        ' ENDERECO_CEP, ENDERECO_CIDADE_ID, ENDERECO_CIDADE_UF '+
        ' from J_PESSOA WHERE PESSOA_ID = '+ cdsPessoaAuxPESSOAID.AsString);

      if viDadosPessoa.Values['NOME'] = '' then begin
        Application.MessageBox(Pchar('Informar nome para o cliente ' +
          viDadosPessoa.Values['CPFCNPJ'] + '.'),'Aviso', MB_OK + MB_ICONINFORMATION);
        Abort;
      end;
      if viDadosPessoa.Values['CPFCNPJ'] = '' then begin
        Application.MessageBox(Pchar('Informar CPF/CNPJ para o cliente ' +
          cdsPessoaAuxNOME.AsString + '.'),'Aviso', MB_OK + MB_ICONINFORMATION);
        Abort;
      end;
      if viDadosPessoa.Values['ENDERECO_LOGRADOURO'] = '' then begin
        Application.MessageBox(Pchar('Informar logradouro para o cliente ' +
          cdsPessoaAuxNOME.AsString + '.'),'Aviso', MB_OK + MB_ICONINFORMATION);
        Abort;
      end;
      if viDadosPessoa.Values['ENDERECO_BAIRRO'] = '' then begin
        Application.MessageBox(Pchar('Informar bairro para o cliente ' +
          cdsPessoaAuxNOME.AsString + '.'),'Aviso', MB_OK + MB_ICONINFORMATION);
        Abort;
      end;
      if viDadosPessoa.Values['ENDERECO_CEP'] = '' then begin
        Application.MessageBox(Pchar('Informar CEP para o cliente ' +
          cdsPessoaAuxNOME.AsString + '.'),'Aviso', MB_OK + MB_ICONINFORMATION);
        Abort;
      end;
      if viDadosPessoa.Values['ENDERECO_CIDADE_UF'] = '' then begin
        Application.MessageBox(Pchar('Informar UF para o cliente ' +
          cdsPessoaAuxNOME.AsString + '.'),'Aviso', MB_OK + MB_ICONINFORMATION);
        Abort;
      end;
      if viDadosPessoa.Values['ENDERECO_CIDADE_ID'] = '' then begin
        Application.MessageBox(Pchar('Informar cidade para o cliente ' +
          cdsPessoaAuxNOME.AsString + '.'),'Aviso', MB_OK + MB_ICONINFORMATION);
        Abort;
      end;

      cdsPessoaAux.Next;
    end;
  finally
    cdsPessoaAux.First;
    cdsPessoaAux.EnableControls;
  end;
end;

procedure TfrmGerenciaBoletoRemessa.VisualizarImprimiBoletoClick(
  Sender: TObject);
begin
  if sqlCompromissoBOLETA_ID.AsInteger = 0  then begin
    Application.MessageBox('Arquivo n�o foi gerado!','Aviso', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  vgCaminhoArquivo := dtmControles.GetStr('select PATH_GERARPDF from J_BOLETO where BOLETO_ID = ' +
    sqlCompromissoBOLETA_ID.AsString);

  if not FileExists(vgCaminhoArquivo) then begin
    Application.MessageBox('Caminho do arquivo n�o encontrado!','Aviso', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  ExibirFormulario(TfrmVisualizaBoleto, frmVisualizaBoleto, True);
end;

end.