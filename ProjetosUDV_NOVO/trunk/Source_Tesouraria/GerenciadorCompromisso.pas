unit GerenciadorCompromisso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FrameCompromisso, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxCurrencyEdit, cxTextEdit, cxImageComboBox, cxCheckBox,
  cxSplitter, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxContainer, cxGroupBox, ExtCtrls, DBClient, SimpleDS, Menus, StdCtrls,
  cxButtons, cxLabel, cxPC, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, Buttons, cxProgressBar, MaskUtils,
  cxLookAndFeels, dxSkinBlueprint, dxSkinDarkRoom, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinHighContrast, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSpringTime, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  cxNavigator, cxPCdxBarPopupMenu, dxBarBuiltInMenu, Data.DBXInterBase,
  DbxDevartInterBase, cxRadioGroup, cxCheckComboBox;

type
  TfrmGerenciadorCompromisso = class(TForm)
    Panel1: TPanel;
    splitFamilia: TcxSplitter;
    sqlCompromissoLancado: TSimpleDataSet;
    dtsCompromissoLancado: TDataSource;
    sqlCompromissoMensal: TSimpleDataSet;
    dtsCompromissoMensal: TDataSource;
    sqlCompromissoMensalcalc_AnoMesFinal: TStringField;
    sqlCompromissoMensalcalc_AnoMesInicial: TStringField;
    sqlCompromissoMensalLANCAMENTO_COMPROMISSO_ID: TFMTBCDField;
    sqlCompromissoMensalSITUACAO: TStringField;
    sqlCompromissoMensalDATA_REGISTRO: TSQLTimeStampField;
    sqlCompromissoMensalANO_MES_INICIAL: TStringField;
    sqlCompromissoMensalPERIODO: TStringField;
    sqlCompromissoMensalVALOR_ATUAL: TFMTBCDField;
    sqlCompromissoMensalVALOR_ANTERIOR: TFMTBCDField;
    sqlCompromissoMensalANO_MES_FINAL: TStringField;
    sqlCompromissoMensalCONTABIL_CONTA_ID: TFMTBCDField;
    sqlCompromissoMensalcalc_Fixo: TStringField;
    Panel2: TPanel;
    fmeCompromisso1: TfmeCompromisso;
    popCompromissoAgendado: TPopupMenu;
    popAtivar: TMenuItem;
    N4: TMenuItem;
    popExcluirAgendado: TMenuItem;
    MenuItem4: TMenuItem;
    popReajustarValorAgendado: TMenuItem;
    popCancelarCompromisso: TMenuItem;
    popLancados: TPopupMenu;
    popLancadoModificarValor: TMenuItem;
    MenuItem5: TMenuItem;
    popLancadoEstornar: TMenuItem;
    popLancadoCancelar: TMenuItem;
    sqlCompromissoMensalcalc_AnoMesLancamento: TStringField;
    sqlCompromissoMensalANO_MES_LANCAMENTO: TStringField;
    N1: TMenuItem;
    sqlPessoasAtualiza: TSimpleDataSet;
    sqlPessoasAtualizaPESSOA_ID: TFMTBCDField;
    popIniciarAgendamento: TMenuItem;
    sqlAssociados: TSimpleDataSet;
    dtsAssociados: TDataSource;
    sqlAssociadosPESSOA_ID: TFMTBCDField;
    sqlAssociadosSITUACAO_LOCAL: TStringField;
    sqlAssociadosVALOR_ATUAL: TFMTBCDField;
    sqlAssociadosLANCAMENTO_COMPROMISSO_ID: TFMTBCDField;
    sqlAssociadosNOME: TStringField;
    sqlAssociadosCOMPROMISSO_AGENDADO_ID: TFMTBCDField;
    sqlCompromissoMensalTODOS_SOCIOS: TStringField;
    chxTodos: TcxCheckBox;
    sqlCompromissoLancadocalc_AnoMesFinal: TStringField;
    sqlCompromissoLancadocalc_AnoMesInicial: TStringField;
    sqlCompromissoLancadoLANCAMENTO_COMPROMISSO_ID: TFMTBCDField;
    sqlCompromissoLancadoSITUACAO: TStringField;
    sqlCompromissoLancadoDATA_REGISTRO: TSQLTimeStampField;
    sqlCompromissoLancadoANO_MES_INICIAL: TStringField;
    sqlCompromissoLancadoPERIODO: TStringField;
    sqlCompromissoLancadoVALOR_ATUAL: TFMTBCDField;
    sqlCompromissoLancadoVALOR_ANTERIOR: TFMTBCDField;
    sqlCompromissoLancadoANO_MES_FINAL: TStringField;
    sqlCompromissoLancadoCONTABIL_CONTA_ID: TFMTBCDField;
    sqlCompromissoLancadoANO_MES_LANCAMENTO: TStringField;
    sqlCompromissoLancadoTODOS_SOCIOS: TStringField;
    sqlCompromissoRealizado: TSimpleDataSet;
    dtsCompromissoRealizado: TDataSource;
    sqlCompromissoRealizadoPESSOA_ID: TFMTBCDField;
    sqlCompromissoRealizadoCONTABIL_CONTA_ID: TFMTBCDField;
    sqlCompromissoRealizadoVALOR_ATUAL: TFMTBCDField;
    sqlCompromissoRealizadoANO_MES_REFERENCIA: TStringField;
    sqlCompromissoRealizadoSITUACAO: TStringField;
    sqlCompromissoRealizadoLANCAMENTO_COMPROMISSO_ID: TFMTBCDField;
    sqlCompromissoRealizadoDIFERENCA: TStringField;
    sqlCompromissoRealizadoQTD_ADICIONAL: TFMTBCDField;
    sqlCompromissoRealizadoATUALIZADO: TStringField;
    sqlCompromissoRealizadoDATA_REALIZACAO: TSQLTimeStampField;
    sqlCompromissoRealizadoNOME: TStringField;
    sqlCompromissoRealizadocalc_referencia: TStringField;
    sqlCompromissoMensalCENTRO_CUSTO_ID: TFMTBCDField;
    sqlCompromissoMensalCEDENTE_ID: TFMTBCDField;
    sqlCompromissoMensalBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlCompromissoLancadoBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlCompromissoRealizadoBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlAssociadosBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlAssociadosCEDENTE_ID: TFMTBCDField;
    sqlAssociadoscalc_porcet: TFloatField;
    sqlAssociadosGRAU: TStringField;
    cxProgress: TcxProgressBar;
    pnlImpressao: TPanel;
    cxSplitter1: TcxSplitter;
    popDesfazerReajuste: TMenuItem;
    sqlCompromissoMensalREAJUSTE_AUTOMATICO: TStringField;
    N2: TMenuItem;
    Renovar1: TMenuItem;
    lblInformacaoLancamento: TcxLabel;
    popCompromissos: TPopupMenu;
    ExportalExcel1: TMenuItem;
    sqlAssociadosCALC_VALOR: TCurrencyField;
    sqlReservaCompromisso: TSimpleDataSet;
    dtsReservaCompromisso: TDataSource;
    sqlReservaCompromissoCONTABIL_RESERVA_ID: TFMTBCDField;
    sqlReservaCompromissoCONTABIL_CONTA_ID: TFMTBCDField;
    sqlReservaCompromissoPERCENTUAL: TFMTBCDField;
    sqlReservaCompromissoRESERVA_ID: TFMTBCDField;
    sqlReservaCompromissoLANCAMENTO_COMPROMISSO_ID: TFMTBCDField;
    cxBtnFechar: TcxButton;
    N3: TMenuItem;
    VincularReservadoMs1: TMenuItem;
    popDesativarCompromisso: TMenuItem;
    popLancadoReativar: TMenuItem;
    pgcTabCompromissos: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    pgcCompromissos: TcxPageControl;
    cxTabSheet3: TcxTabSheet;
    gdrCompromissoAgendado: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBTableView2Column8: TcxGridDBColumn;
    cxGridDBTableView2Column5: TcxGridDBColumn;
    cxGridDBTableView2Column1: TcxGridDBColumn;
    cxGridDBTableValor: TcxGridDBColumn;
    cxGridDBTableView2Column6: TcxGridDBColumn;
    cxGridDBTableView2Column2: TcxGridDBColumn;
    cxGridDBTableView2Column3: TcxGridDBColumn;
    cxGridDBTableView2Column4: TcxGridDBColumn;
    cxGridDBTableView2Column7: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    tbcReserva: TcxTabSheet;
    Panel5: TPanel;
    cxLabel7: TcxLabel;
    cxLabel2: TcxLabel;
    lcxReserva: TcxLookupComboBox;
    edtPercentual: TcxCurrencyEdit;
    btnAdicionarReserva: TcxButton;
    btnReservaExclui: TcxButton;
    cxGrid1: TcxGrid;
    cxGridDBTableView5: TcxGridDBTableView;
    cxGridDBTableView5Column1: TcxGridDBColumn;
    cxGridDBTableView5Column2: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    cxGroupBox2: TcxGroupBox;
    pgcCompromissos1: TcxPageControl;
    cxTabSheet4: TcxTabSheet;
    grdCompromissosLancados: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxTabSheet5: TcxTabSheet;
    cxGrid4: TcxGrid;
    cxGridDBTableView7: TcxGridDBTableView;
    cxGridDBColumn20: TcxGridDBColumn;
    cxGridDBColumn21: TcxGridDBColumn;
    cxGridLevel7: TcxGridLevel;
    sqlReservaLancado: TSimpleDataSet;
    dtsReservaLancado: TDataSource;
    sqlReservaLancadoCONTABIL_RESERVA_ID: TFMTBCDField;
    sqlReservaLancadoCONTABIL_CONTA_ID: TFMTBCDField;
    sqlReservaLancadoPERCENTUAL: TFMTBCDField;
    sqlReservaLancadoRESERVA_ID: TFMTBCDField;
    sqlReservaLancadoLANCAMENTO_COMPROMISSO_ID: TFMTBCDField;
    sqlAjusteProgramado: TSimpleDataSet;
    dtsAjusteProgramado: TDataSource;
    pgcVinculo: TcxPageControl;
    cxTabSheet6: TcxTabSheet;
    cxTabSheet7: TcxTabSheet;
    cxTabSheet8: TcxTabSheet;
    cxGroupBox3: TcxGroupBox;
    pgcDados: TcxPageControl;
    tabAssociados: TcxTabSheet;
    cxGridCompromissos: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBTableAssociado: TcxGridDBColumn;
    cxGridDBTableGrau: TcxGridDBColumn;
    cxGridDBAssociadoValor: TcxGridDBColumn;
    cxGridDBTableSituacao: TcxGridDBColumn;
    cxGridDBTablePorcentagem: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    Panel4: TPanel;
    btnImprimir: TSpeedButton;
    lblExpandirDados: TcxLabel;
    lblJuntarDados: TcxLabel;
    chxSelecaoMultipla: TCheckBox;
    tabCompromissos: TcxTabSheet;
    cxGrid3: TcxGrid;
    cxGridDBTableView4: TcxGridDBTableView;
    cxGridDBTableNome: TcxGridDBColumn;
    cxGridDBValor: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBColumn12: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridLevel4: TcxGridLevel;
    Panel3: TPanel;
    lcxCompromissoMostrar: TcxLookupComboBox;
    icxSituacaoMostrar: TcxImageComboBox;
    Panel6: TPanel;
    rdbAjusteMesAtual: TcxRadioButton;
    rdbAjusteProximoMes: TcxRadioButton;
    cxGrid2: TcxGrid;
    cxGridDBTableView6: TcxGridDBTableView;
    cxGridDBTableView4Column1: TcxGridDBColumn;
    cxGridDBTableView4Column2: TcxGridDBColumn;
    cxGridDBTableView4Column3: TcxGridDBColumn;
    cxGridDBTableView4Column4: TcxGridDBColumn;
    cxGridDBTableView6Column1: TcxGridDBColumn;
    cxGridLevel6: TcxGridLevel;
    cxGridTotalAssociados: TcxGrid;
    cxGridDBTableView8: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn13: TcxGridDBColumn;
    cxGridLevel8: TcxGridLevel;
    sqlTotalAssociado: TSimpleDataSet;
    dtsTotalAssociado: TDataSource;
    sqlAjusteProgramadoPROGRAMACAO_AJUSTE_ID: TFMTBCDField;
    sqlAjusteProgramadoCOMPROMISSO_AGENDADO_ID: TFMTBCDField;
    sqlAjusteProgramadoCOMPROMISSO_REAJUSTAR: TStringField;
    sqlAjusteProgramadoCOMPROMISSO_SITUACAO: TStringField;
    sqlAjusteProgramadoANO_MES: TStringField;
    sqlAjusteProgramadoSITUACAO: TStringField;
    sqlAjusteProgramadoPESSOA_ID: TFMTBCDField;
    sqlAjusteProgramadoVALOR_ANTERIOR: TFMTBCDField;
    sqlAjusteProgramadoSITUACAO_ANTERIOR: TStringField;
    sqlAjusteProgramadoNOME: TStringField;
    sqlAjusteProgramadoVALOR_ATUAL: TFMTBCDField;
    sqlAjusteProgramadocalc_AnoMes: TStringField;
    sqlTotalAssociadoNOME: TStringField;
    sqlTotalAssociadoGRAU: TStringField;
    sqlTotalAssociadoVALOR: TFMTBCDField;
    Panel7: TPanel;
    cbxCompromisso: TcxCheckComboBox;
    btnPesquisarAssociado: TcxButton;
    cbxPesquisaCompromisso: TcxCheckComboBox;
    btnAdAssociado: TSpeedButton;
    btnRemoverAssociado: TSpeedButton;
    chxValor: TcxCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sqlCompromissoMensalCalcFields(DataSet: TDataSet);
    procedure btnConfirmarCompromissoClick(Sender: TObject);
    procedure cxBtnFecharClick(Sender: TObject);
    procedure popAtivarClick(Sender: TObject);
    procedure popExcluirAgendadoClick(Sender: TObject);
    procedure popCancelarCompromissoClick(Sender: TObject);
    procedure sqlCompromissoMensalAfterScroll(DataSet: TDataSet);
    procedure rdbCompromissosMensaisClick(Sender: TObject);
    procedure rdbCompromissosDiversosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnLimparCompromissoClick(Sender: TObject);
    procedure cxLabel1Click(Sender: TObject);
    procedure RealizarLanamentoIndividual1Click(Sender: TObject);
    procedure sqlAssociadosAfterPost(DataSet: TDataSet);
    procedure fmeCompromisso1lcxCompromissoPropertiesEditValueChanged(
      Sender: TObject);
    procedure sqlCompromissoLancadoCalcFields(DataSet: TDataSet);
    procedure fmeCompromisso1icxPeriodoPropertiesEditValueChanged(
      Sender: TObject);
    procedure sqlCompromissoLancadoAfterScroll(DataSet: TDataSet);
    procedure popLancadoEstornarClick(Sender: TObject);
    procedure popLancadoCancelarClick(Sender: TObject);
    procedure sqlCompromissoRealizadoInternalDataSetCalcFields(
      DataSet: TDataSet);
    procedure gdrCompromissoAgendadoEnter(Sender: TObject);
    procedure grdCompromissosLancadosEnter(Sender: TObject);
    procedure btnReservarAdicionClick(Sender: TObject);
    procedure pgcDadosChange(Sender: TObject);
    procedure btnRemoverAssociadoClick(Sender: TObject);
    procedure fmeCompromisso1tabBalanceteChange(Sender: TObject);
    procedure chxValorClick(Sender: TObject);
    procedure sqlAssociadosCalcFields(DataSet: TDataSet);
    procedure sqlCompromissoRealizadoCalcFields(DataSet: TDataSet);
    procedure cxGridDBTableView3CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure popReajustarValorAgendadoClick(Sender: TObject);
    procedure popDesfazerReajusteClick(Sender: TObject);
    procedure lblJuntarDadosClick(Sender: TObject);
    procedure lblExpandirDadosClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure chxSelecaoMultiplaClick(Sender: TObject);
    procedure Renovar1Click(Sender: TObject);
    procedure ExportalExcel1Click(Sender: TObject);
    procedure sqlReservaCompromissoAfterScroll(DataSet: TDataSet);
    procedure btnAdicionarReservaClick(Sender: TObject);
    procedure btnReservaExcluiClick(Sender: TObject);
    procedure VincularReservadoMs1Click(Sender: TObject);
    procedure popDesativarCompromissoClick(Sender: TObject);
    procedure popLancadoReativarClick(Sender: TObject);
    procedure rdbAjusteMesAtualClick(Sender: TObject);
    procedure rdbAjusteProximoMesClick(Sender: TObject);
    procedure pgcVinculoChange(Sender: TObject);
    procedure btnPesquisarAssociadoClick(Sender: TObject);
  private
    vgAlterando : Boolean;
    Procedure AtivarPopMenus;
    procedure AtivarDesativarCompromisso(vpSituacao : string; vpPerguntar : Boolean);
    function VerificarReserva(vpContabilContaId : String; vpLancamentoId : String):Currency;
    procedure InserirReserva(vpReservaId : Variant; vpContabilContaId,
           vpLancamentoId : Integer; vpPercentual : Currency = 100);
    procedure VerificarReajuste;
  public
    Procedure AtivarLancamentosMensais(vpCompromisso : Integer; vpPessoas : String;
       vpMostrarMensagem, vpLancarVencido : Boolean; vpSituacaoGeral : String);
    Procedure RealizarLancamentosMensais(vpMostrarMensagem : Boolean);
    procedure CarregarContasPendentesRealizadas(vpMesInicial, vpMesFinal,
          vpSituacao, vpContabilContaId, vpLancamentoCompId : String);
    procedure AtualizaContasBalancete;
    procedure AtivarAfterScroll(vpAtivar : Boolean);
    procedure AtivarProgress(vpCompromisso : String; vpQtd : Integer);
    procedure RealizarLancamentoReservaMensal(vpAnoMes : string; vpLancamentoId : String = '');
    procedure CarregarCompromissoAssociado;
  end;

var
  frmGerenciadorCompromisso: TfrmGerenciadorCompromisso;

implementation

uses Controles, Lookup, Rotinas, RotinasFingkey, SelecionarAssociado,
  ReajustarValorCompromisso, TituloRelatorio, VisualizaRelatorios,
  Lookup_Contabil;

{$R *.dfm}

procedure TfrmGerenciadorCompromisso.AtivarAfterScroll(vpAtivar: Boolean);
begin
 if vpAtivar then
 begin
  sqlCompromissoLancado.AfterScroll := sqlCompromissoLancadoAfterScroll;
  sqlCompromissoMensal.AfterScroll  := sqlCompromissoMensalAfterScroll;
 end
 else
 begin
   sqlCompromissoLancado.AfterScroll := nil;
   sqlCompromissoMensal.AfterScroll  := nil;
 end;

end;

procedure TfrmGerenciadorCompromisso.AtivarDesativarCompromisso(vpSituacao : string;
       vpPerguntar : Boolean);
var
  viMensagem : String;
begin
  if vpPerguntar then
  begin
    if vpSituacao = '1' then
         viMensagem := 'Ativar Compromisso?'
    else viMensagem := 'Desativar Compromisso?'+#13+#13+
                       '>> O compromisso será desativado para todos os sócios vinculados'+#13+
                       '>> Atenção: Os compromissos vencidos continuarão ativos!!!';

    if Application.MessageBox(Pchar(viMensagem), 'Confirmação', MB_YESNO) = IDNO then
    begin
      popAtivar.Checked := not popAtivar.Checked;
      exit;
    end;
  end;

  ExecutaSqlAuxiliar(' UPDATE T_COMPROMISSO_AGENDADO SET SITUACAO_GERAL = '+ QuotedStr(vpSituacao)+
                     ' WHERE LANCAMENTO_COMPROMISSO_ID = '+ sqlCompromissoMensalLANCAMENTO_COMPROMISSO_ID.AsString+
                     ' AND CEDENTE_ID = '+ IntToStr(vgCedenteAtivo),1);

  sqlCompromissoMensal.Edit;
  sqlCompromissoMensalSITUACAO.AsString := vpSituacao;
  sqlCompromissoMensal.ApplyUpdates(-1);

  if vpPerguntar then
  begin
    if vpSituacao = '1' then
         viMensagem := 'Ativado'
    else viMensagem := 'Desativado';

    Application.MessageBox(Pchar('Agendamento ' +viMensagem+'!!!'), 'Informação', MB_OK + MB_ICONWARNING);
  end;
end;

procedure TfrmGerenciadorCompromisso.AtivarLancamentosMensais(vpCompromisso : Integer; vpPessoas : String;
       vpMostrarMensagem, vpLancarVencido : Boolean; vpSituacaoGeral : String);
var
  viTodos, viSql, viMensagem : String;
begin
  viSql := ' SELECT LC.*, CC.FIXO, CC.DESCRICAO AS COMPROMISSO  '+
           ' FROM T_LANCAMENTO_COMPROMISSO LC LEFT OUTER JOIN T_CONTABIL_CONTA CC ON '+
           '    LC.CONTABIL_CONTA_ID = CC.CONTABIL_CONTA_ID '+
           ' WHERE LC.CEDENTE_ID = '+ IntToStr(vgCedenteAtivo);
  if vpCompromisso > 0 then
    viSql := viSql + ' AND LC.LANCAMENTO_COMPROMISSO_ID = '+ IntToStr(vpCompromisso)+
                     ' AND (LC.SITUACAO IN (''1'',''2''))'
  else
    viSql := viSql + ' AND LC.SITUACAO = ''1'''+
                     ' AND TODOS_SOCIOS = ''S''';

  viSql := viSql + ' ORDER BY LC.LANCAMENTO_COMPROMISSO_ID ';
  ExecutaSimpleDSAux(viSql,0);

  if vpMostrarMensagem then
  begin
    viTodos := dtmControles.SimpleAuxiliar.FieldByName('TODOS_SOCIOS').AsString;

    if viTodos = 'S' then
         viMensagem := 'ATENÇÃO: O compromisso será lançado para TODOS OS SÓCIOS ativos!!!'
    else viMensagem := 'ATENÇÃO: O compromisso será lançado para os sócios vinculados ao mesmo!!!';

    if Application.MessageBox(Pchar('Iniciar Agendamento do Compromisso Selecionado?'+#13+#13+viMensagem), 'Confirmação', MB_YESNO) = IDNO then
    begin
      Screen.Cursor := crDefault;
      abort;
    end;
    pnlImpressao.Visible := True;
    pnlImpressao.Refresh;
  end;

  with dtmControles.SimpleAuxiliar do
  begin
    First;
    while not eof do
    begin
      vgCompromissoVencido.SituacaoLocal           := '1';
      vgCompromissoVencido.ContabilContaId         := FieldByName('CONTABIL_CONTA_ID').AsInteger;
      vgCompromissoVencido.LancamentoCompromissoId := FieldByName('LANCAMENTO_COMPROMISSO_ID').AsString;
      vgCompromissoVencido.CentroCustoId           := FieldByName('CENTRO_CUSTO_ID').AsInteger;
      vgCompromissoVencido.BalanceteGrupoId        := FieldByName('BALANCETE_GRUPO_ID').AsInteger;
      vgCompromissoVencido.Obrigatorio             := FieldByName('TODOS_SOCIOS').AsString;
      vgCompromissoVencido.BoletoId                := '';
      vgCompromissoVencido.ReciboId                := '';
      vgCompromissoVencido.AnoMesLancamento        := '';
      vgCompromissoVencido.SituacaoGeral           := vpSituacaoGeral;
      vgCompromissoVencido.Valor                   := FieldByName('VALOR_ATUAL').AsFloat;
      vgCompromissoVencido.PeriodoInicial          := FieldByName('ANO_MES_INICIAL').AsString;
      vgCompromissoVencido.PeriodoTipo             := FieldByName('PERIODO').AsInteger;
      if FieldByName('ANO_MES_FINAL').AsVariant = null then
           vgCompromissoVencido.PeriodoFinal := FieldByName('ANO_MES_INICIAL').AsString
      else vgCompromissoVencido.PeriodoFinal := FieldByName('ANO_MES_FINAL').AsString;
      vgCompromissoVencido.AtualizarAgendado := False;
      vgCompromissoVencido.MostrarMensagem   := False;

      viTodos := FieldByName('TODOS_SOCIOS').AsString;
      // Vincula o Compromisso a todos os associados frequentes
      sqlPessoasAtualiza.Active := False;

      if viTodos = 'S' then
      begin
        sqlPessoasAtualiza.DataSet.CommandText := ' SELECT PESSOA_ID FROM T_PESSOA WHERE SITUACAO IN (''1'',''3'')'+
                                                  ' AND CEDENTE_ID = '+ IntToStr(vgCedenteAtivo);
        sqlPessoasAtualiza.Active := True;
      end
      else
        if vpPessoas <> '' then
        begin
           sqlPessoasAtualiza.DataSet.CommandText := ' SELECT PESSOA_ID FROM T_PESSOA '+
                                                     ' WHERE PESSOA_ID IN ('+vpPessoas+')'+
                                                     '   AND SITUACAO IN (''1'',''3'')'+
                                                     '   AND CEDENTE_ID = '+ IntToStr(vgCedenteAtivo);
           sqlPessoasAtualiza.Active := True;
        end;

      // Agendar Compromisso
      if sqlPessoasAtualiza.Active then
      begin
        with sqlPessoasAtualiza do
        begin
          First;
          AtivarProgress('Inserindo '+ dtmControles.SimpleAuxiliar.FieldByName('COMPROMISSO').AsString+'...', sqlPessoasAtualiza.RecordCount);
          while not eof do
          begin
            vgCompromissoVencido.PessoaId  := FieldByName('PESSOA_ID').AsInteger;
            if not vpLancarVencido then
              dtmLookup.AdicionarCompromisso(False, True, False, 'C')
            else
            begin
              if vgCompromissoVencido.PeriodoInicial = IntToStr(vgPeriodoAtual) then
                   dtmLookup.AdicionarCompromisso(True, False, False, 'C')
              else dtmLookup.AdicionarCompromisso(False, True, False, 'C');
            end;
            cxProgress.Position := cxProgress.Position + 1;
            cxProgress.Refresh;
            Next;
          end;
        end;
      end;
      Next;
    end;
  end;

  if vpMostrarMensagem then
  begin
    sqlCompromissoMensal.Edit;
    sqlCompromissoMensalSITUACAO.AsString := '1';
    sqlCompromissoMensal.ApplyUpdates(-1);
    AtivarDesativarCompromisso('1', False);
    if not vpLancarVencido then
         Application.MessageBox('Agendamento Iniciado!!!', 'Informação', MB_OK + MB_ICONWARNING)
    else Application.MessageBox('Agendamento Iniciado e Lançado!!!', 'Informação', MB_OK + MB_ICONWARNING);
    pnlImpressao.Visible := False;
  end;
end;

procedure TfrmGerenciadorCompromisso.AtivarPopMenus;
var
  viAtivarPopLancado : Boolean;
begin
  popReajustarValorAgendado.Enabled := (not sqlCompromissoMensal.IsEmpty) and (not sqlAssociados.IsEmpty);
  if sqlCompromissoMensalLANCAMENTO_COMPROMISSO_ID.AsString = '' then
       popExcluirAgendado.Enabled := (not sqlCompromissoMensal.IsEmpty)
  else popExcluirAgendado.Enabled := (not sqlCompromissoMensal.IsEmpty) and
                                       (dtmControles.GetInt(' SELECT COUNT(COMPROMISSO_VENCIDO_ID) '+
                                                            ' FROM T_COMPROMISSO_VENCIDO '+
                                                            ' WHERE LANCAMENTO_COMPROMISSO_ID = '+sqlCompromissoMensalLANCAMENTO_COMPROMISSO_ID.AsString+
                                                            '   AND SITUACAO = ''2''') = 0);

  popDesativarCompromisso.Enabled   := (not sqlCompromissoMensal.IsEmpty) and
                                       (dtmControles.GetInt(' SELECT COUNT(COMPROMISSO_VENCIDO_ID) '+
                                                            ' FROM T_COMPROMISSO_VENCIDO '+
                                                            ' WHERE LANCAMENTO_COMPROMISSO_ID = '+sqlCompromissoMensalLANCAMENTO_COMPROMISSO_ID.AsString+
                                                            '   AND SITUACAO = ''2''') > 0);
  popAtivar.Enabled                 := (not sqlCompromissoMensal.IsEmpty) and (not sqlAssociados.IsEmpty);
  popDesfazerReajuste.Enabled       := (not sqlCompromissoMensal.IsEmpty) and (sqlCompromissoMensalREAJUSTE_AUTOMATICO.AsString = 'S');   
  popCancelarCompromisso.Enabled    := ((not sqlCompromissoMensal.IsEmpty) and (not sqlAssociados.IsEmpty)
                                        and (sqlCompromissoMensalcalc_Fixo.AsString = 'N')) and (not popExcluirAgendado.Enabled);
  popIniciarAgendamento.Enabled     := (not sqlCompromissoMensal.IsEmpty) and (sqlAssociados.IsEmpty);// and (sqlCompromissoMensalTODOS_SOCIOS.AsString = 'S');
  btnAdAssociado.Visible            := (sqlCompromissoMensalTODOS_SOCIOS.AsString = 'N') and (sqlCompromissoMensalSITUACAO.AsString = '1');
  btnRemoverAssociado.Visible       := (sqlCompromissoMensalTODOS_SOCIOS.AsString = 'N') and (sqlCompromissoMensalSITUACAO.AsString = '1')
                                        and (not sqlAssociados.IsEmpty);

  // Pops Menus de Lancamentos Efetuados
  viAtivarPopLancado               := (not sqlCompromissoLancado.IsEmpty) and (sqlCompromissoLancadoSITUACAO.AsString = '3') and (sqlCompromissoLancadoANO_MES_FINAL.AsString = IntToStr(vgPeriodoAtual));
  popLancadoModificarValor.Enabled := viAtivarPopLancado;
  popLancadoEstornar.Enabled       := viAtivarPopLancado and (sqlCompromissoLancadoPERIODO.AsInteger = 2)
                                      and (dtmControles.GetInt(' SELECT COUNT(COMPROMISSO_VENCIDO_ID) '+
                                                               ' FROM T_COMPROMISSO_VENCIDO '+
                                                               ' WHERE LANCAMENTO_COMPROMISSO_ID = '+sqlCompromissoLancadoLANCAMENTO_COMPROMISSO_ID.AsString+
                                                               '   AND SITUACAO = ''2''') = 0);
  popLancadoCancelar.Enabled := viAtivarPopLancado and (not popLancadoEstornar.Enabled);
  popLancadoReativar.Enabled := sqlCompromissoLancadoANO_MES_FINAL.IsNull;
end;

procedure TfrmGerenciadorCompromisso.AtivarProgress(vpCompromisso : String; vpQtd : Integer);
begin
  cxProgress.Properties.Max := vpQtd;
  cxProgress.Properties.Min := 0;
  cxProgress.Position       := 0;
  pnlImpressao.Caption      := vpCompromisso;
  frmGerenciadorCompromisso.Refresh;
end;

procedure TfrmGerenciadorCompromisso.AtualizaContasBalancete;
begin
  AtivarAfterScroll(False);
  sqlCompromissoMensal.Close;
  sqlCompromissoMensal.DataSet.ParamByName('CEDENTE_ID').AsBCD         := vgCedenteAtivo;
  sqlCompromissoMensal.DataSet.ParamByName('BALANCETE_GRUPO_ID').AsBCD := vgTabBalancete[fmeCompromisso1.tabBalancete.TabIndex];
  sqlCompromissoMensal.Open;
  sqlReservaCompromisso.Active := True;

  sqlAssociados.Close;
  sqlAssociados.DataSet.ParamByName('CEDENTE_ID').AsBCD         := vgCedenteAtivo;
  sqlAssociados.DataSet.ParamByName('BALANCETE_GRUPO_ID').AsBCD := vgTabBalancete[fmeCompromisso1.tabBalancete.TabIndex];
  sqlAssociados.Open;

  sqlCompromissoLancado.Close;
  sqlCompromissoLancado.DataSet.ParamByName('CEDENTE_ID').AsBCD         := vgCedenteAtivo;
  sqlCompromissoLancado.DataSet.ParamByName('BALANCETE_GRUPO_ID').AsBCD := vgTabBalancete[fmeCompromisso1.tabBalancete.TabIndex];
  sqlCompromissoLancado.Open;
  sqlReservaLancado.Active := True;

  VerificarReajuste;

  AtivarAfterScroll(True);
end;

procedure TfrmGerenciadorCompromisso.btnReservarAdicionClick(Sender: TObject);
begin
  ExibirFormulario(TfrmSelecionarAssociado, frmSelecionarAssociado, True);
  if (not vgAssociado.Flag) or (vgAssociado.Selecao = '') then
  begin
    Application.MessageBox('Nenhum sócio selecionado para este agendamento!!!', 'Atenção', MB_OK + MB_ICONWARNING);
    exit;
  end;

  AtivarLancamentosMensais(sqlCompromissoMensalLANCAMENTO_COMPROMISSO_ID.AsInteger, vgAssociado.Selecao, False, False, '1');
  sqlAssociados.Refresh;
  sqlCompromissoRealizado.Refresh;
  AtivarPopMenus;
end;

procedure TfrmGerenciadorCompromisso.btnAdicionarReservaClick(Sender: TObject);
begin
  VerificarPreenchimentoLCX_TX(lcxReserva.Text, 'Reserva', lcxReserva);
  VerificarPreenchimentoCUR_TX(edtPercentual.EditValue, '% Percentual', edtPercentual);

  sqlReservaCompromisso.DisableControls;
  sqlReservaCompromisso.First;
  While not sqlReservaCompromisso.Eof do
  begin
    if sqlReservaCompromissoRESERVA_ID.AsInteger = lcxReserva.EditValue then
    begin
      sqlReservaCompromisso.EnableControls;
      Application.MessageBox('Esta Reserva já esta adicionada neste compromisso!!!', 'Atenção', MB_OK + MB_ICONWARNING);
      lcxReserva.SetFocus;
      exit;
    end;
    sqlReservaCompromisso.Next;
  end;
  sqlReservaCompromisso.EnableControls;

  if (VerificarReserva(sqlCompromissoMensalCONTABIL_CONTA_ID.AsString,
                       sqlCompromissoMensalLANCAMENTO_COMPROMISSO_ID.AsString)+edtPercentual.EditValue) > 100  then
  begin
    Application.MessageBox('Percentual de Reserva não pode ser maior que 100%!!!', 'Atenção', MB_OK + MB_ICONWARNING);
    edtPercentual.SetFocus;
    exit;
  end;

  InserirReserva(lcxReserva.EditValue, sqlCompromissoMensalCONTABIL_CONTA_ID.AsInteger,
                 sqlCompromissoMensalLANCAMENTO_COMPROMISSO_ID.AsInteger, edtPercentual.EditValue);
  lcxReserva.EditValue := null;
  edtPercentual.Clear;
end;

procedure TfrmGerenciadorCompromisso.btnConfirmarCompromissoClick(
  Sender: TObject);
var
  viLancamentoMensalId : Integer;

begin
  fmeCompromisso1.btnConfirmarCompromissoClick(Self);

  // Verifica se existe o compromisso já agendado
  ExecutaSqlAuxiliar(' SELECT LANCAMENTO_COMPROMISSO_ID FROM T_LANCAMENTO_COMPROMISSO '+
                     ' WHERE CONTABIL_CONTA_ID = '+ IntToStr(fmeCompromisso1.lcxCompromisso.EditValue)+
                     '   AND SITUACAO IN ('+QuotedStr('1')+', '+QuotedStr('2')+ ')',0);
  if not dtmControles.sqlAuxiliar.IsEmpty then
  begin
    Application.MessageBox('Compromisso já agendado. Verifique!!!!!!', 'Atenção', MB_OK + MB_ICONWARNING);
    exit;
  end;

  vgAlterando := True;
  AtivarAfterScroll(False);
  sqlCompromissoMensal.Insert;
  viLancamentoMensalId := dtmControles.GerarSequencia('T_LANCAMENTO_COMPROMISSO');
  sqlCompromissoMensalLANCAMENTO_COMPROMISSO_ID.AsCurrency := viLancamentoMensalId;
  sqlCompromissoMensalDATA_REGISTRO.AsString               := dtmControles.DataHoraBanco(4);
  sqlCompromissoMensalSITUACAO.AsString                    := '2';
  sqlCompromissoMensalANO_MES_INICIAL.AsString := copy(fmeCompromisso1.cbxMesAnoInicial.EditValue,4,4) + copy(fmeCompromisso1.cbxMesAnoInicial.EditValue,1,2);
  if fmeCompromisso1.cbxMesAnoFinal.EditValue <> null then
    sqlCompromissoMensalANO_MES_FINAL.AsString      := copy(fmeCompromisso1.cbxMesAnoFinal.EditValue,4,4) + copy(fmeCompromisso1.cbxMesAnoFinal.EditValue,1,2);
  sqlCompromissoMensalPERIODO.AsInteger             := StrToInt(fmeCompromisso1.icxPeriodo.EditValue);
  sqlCompromissoMensalVALOR_ATUAL.AsCurrency        := fmeCompromisso1.edtValor.EditValue;
  sqlCompromissoMensalCONTABIL_CONTA_ID.AsInteger   := fmeCompromisso1.lcxCompromisso.EditValue;
  sqlCompromissoMensalCENTRO_CUSTO_ID.AsCurrency    := fmeCompromisso1.lcxCentroCusto.EditValue;
  sqlCompromissoMensalCEDENTE_ID.AsCurrency         := vgCedenteAtivo;
  sqlCompromissoMensalBALANCETE_GRUPO_ID.AsCurrency := vgTabBalancete[fmeCompromisso1.tabBalancete.TabIndex];

  if chxTodos.Checked then
       sqlCompromissoMensalTODOS_SOCIOS.AsString := 'S'
  else sqlCompromissoMensalTODOS_SOCIOS.AsString := 'N';

  sqlCompromissoMensalVALOR_ANTERIOR.AsCurrency:= 0;
  sqlCompromissoMensal.ApplyUpdates(-1);

  InserirReserva(fmeCompromisso1.lcxReserva.EditValue, sqlCompromissoMensalCONTABIL_CONTA_ID.AsInteger,
                sqlCompromissoMensalLANCAMENTO_COMPROMISSO_ID.AsInteger);

  vgAlterando := False;
  AtivarAfterScroll(True);
  sqlCompromissoMensal.Refresh;
  dtmLookup.AtualizarTabelas;
  btnLimparCompromissoClick(Self);
  AtivarPopMenus;
  sqlCompromissoMensal.Locate('LANCAMENTO_COMPROMISSO_ID', viLancamentoMensalId, [loCaseInsensitive]);
  RealizarLanamentoIndividual1Click(self);
  RealizarLancamentoReservaMensal(IntToStr(vgPeriodoAtual));
end;

procedure TfrmGerenciadorCompromisso.btnLimparCompromissoClick(Sender: TObject);
begin
  vgFiltrarGerenciamento := True;
  fmeCompromisso1.btnLimparCompromissoClick(Self);
  chxTodos.Checked       := True;
end;

procedure TfrmGerenciadorCompromisso.btnPesquisarAssociadoClick(
  Sender: TObject);
var
  viSql : String;
begin
  viSql := ' SELECT P.NOME, P.GRAU, SUM(COALESCE(CA.VALOR_ATUAL,0)) AS VALOR '+
           ' FROM T_PESSOA P '+
           '   LEFT OUTER JOIN T_COMPROMISSO_AGENDADO CA ON '+
           '   CA.PESSOA_ID = P.PESSOA_ID '+
           ' WHERE P.SITUACAO = ''1'''+
           '   AND ((CA.SITUACAO_GERAL = ''1'') or (CA.SITUACAO_GERAL IS NULL)) ';

  if cbxCompromisso.EditValue <> '' then
  begin
    cbxPesquisaCompromisso.EditValue := cbxCompromisso.EditValue;
    viSql := viSql + ' AND CA.CONTABIL_CONTA_ID IN ('+cbxPesquisaCompromisso.Text+')'
  end;

  viSql := viSql + ' GROUP BY P.NOME, P.GRAU ';

  sqlTotalAssociado.Active := False;
  sqlTotalAssociado.DataSet.CommandText := viSql;
  sqlTotalAssociado.Active := True;

end;

procedure TfrmGerenciadorCompromisso.btnRemoverAssociadoClick(Sender: TObject);
begin
  if Application.MessageBox(Pchar('Remover o associado do agendamento deste compromisso?'+#13+#13+
                                  '>> Atenção: Os compromissos vencidos continuarão ativos!!!'), 'Confirmação', MB_YESNO) = IDNO then
     exit;

   ExecutaSqlAuxiliar(' DELETE FROM T_COMPROMISSO_AGENDADO '+
                      ' WHERE LANCAMENTO_COMPROMISSO_ID = '+sqlCompromissoMensalLANCAMENTO_COMPROMISSO_ID.AsString+
                      ' AND PESSOA_ID = '+sqlAssociadosPESSOA_ID.AsString,1);

  sqlAssociados.Refresh;
  AtivarPopMenus;
end;

procedure TfrmGerenciadorCompromisso.btnReservaExcluiClick(Sender: TObject);
begin
  if Application.MessageBox('Confirma exclusão da reserva?', 'Confirmação', MB_YESNO) = IDNO then
    exit;

  sqlReservaCompromisso.Delete;
  sqlReservaCompromisso.ApplyUpdates(-1);
end;

procedure TfrmGerenciadorCompromisso.CarregarCompromissoAssociado;
begin
  ExecutaSqlAuxiliar('  SELECT DISTINCT(CC.DESCRICAO), CC.CONTABIL_CONTA_ID '+
                     '  FROM T_COMPROMISSO_AGENDADO CA '+
                     '    LEFT OUTER JOIN T_CONTABIL_CONTA CC ON '+
                     '    CA.CONTABIL_CONTA_ID = CC.CONTABIL_CONTA_ID '+
                     '    LEFT OUTER JOIN T_PESSOA P ON '+
                     '    CA.PESSOA_ID = P.PESSOA_ID '+
                     '  WHERE ((CA.SITUACAO_GERAL = ''1'') or (CA.SITUACAO_GERAL IS NULL)) '+
                     '    AND P.SITUACAO = ''1'' '+
                     '  ORDER BY CC.DESCRICAO',0);
  cbxCompromisso.Properties.Items.Clear;
  cbxPesquisaCompromisso.Properties.Items.Clear;
  while not dtmControles.sqlAuxiliar.Eof do
  begin
    cbxCompromisso.Properties.Items.AddCheckItem(dtmControles.sqlAuxiliar.FieldByName('DESCRICAO').AsString,
                                                 dtmControles.sqlAuxiliar.FieldByName('DESCRICAO').AsString);
    cbxPesquisaCompromisso.Properties.Items.AddCheckItem(dtmControles.sqlAuxiliar.FieldByName('CONTABIL_CONTA_ID').AsString,
                                                 dtmControles.sqlAuxiliar.FieldByName('CONTABIL_CONTA_ID').AsString);
    dtmControles.sqlAuxiliar.Next;
  end;
end;

procedure TfrmGerenciadorCompromisso.CarregarContasPendentesRealizadas(vpMesInicial, vpMesFinal,
          vpSituacao, vpContabilContaId, vpLancamentoCompId : String);
var
  viSql : String;
begin
 if vpLancamentoCompId = '' then
 begin
   lcxCompromissoMostrar.EditValue := null;
   icxSituacaoMostrar.EditValue    := null;
   sqlCompromissoRealizado.Active := False;
   exit;
 end;


  viSql := ' SELECT CV.*, P.NOME '+
           ' FROM T_COMPROMISSO_VENCIDO CV LEFT OUTER JOIN T_PESSOA P '+
           '   ON CV.PESSOA_ID = P.PESSOA_ID '+
           ' WHERE (CV.CONTABIL_CONTA_ID = '+ vpContabilContaId +
           '   AND (CV.ANO_MES_REFERENCIA BETWEEN '+ QuotedStr(vpMesInicial)+ ' AND '+QuotedStr(vpMesInicial)+')'+
           '   AND CV.LANCAMENTO_COMPROMISSO_ID IS NULL'+
           '   AND CV.CEDENTE_ID = '+ IntToStr(vgCedenteAtivo)+
           '   AND CV.BALANCETE_GRUPO_ID = '+ IntToStr(vgTabBalancete[fmeCompromisso1.tabBalancete.TabIndex])+
           '   AND CV.TIPO_OPERACAO = '+ QuotedStr('C')+
           '   AND NOT CV.PESSOA_ID IS NULL)'+
           '   OR ((CV.LANCAMENTO_COMPROMISSO_ID = '+vpLancamentoCompId + ')'+
           '   AND (CV.ANO_MES_REFERENCIA BETWEEN '+ QuotedStr(vpMesInicial)+ ' AND '+QuotedStr(vpMesInicial)+'))'+
           '   ORDER BY P.NOME, CV.ANO_MES_REFERENCIA ';
  sqlCompromissoRealizado.Active := False;
  sqlCompromissoRealizado.DataSet.CommandText := viSql;
  sqlCompromissoRealizado.Active := True;

  lcxCompromissoMostrar.EditValue := StrToInt(vpContabilContaId);
  icxSituacaoMostrar.EditValue    := vpSituacao;
end;

procedure TfrmGerenciadorCompromisso.cxBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TfrmGerenciadorCompromisso.cxGridDBTableView3CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.RecordViewInfo.GridRecord.Values[3] = '2' then
    ACanvas.Font.Color := clOlive;

end;

procedure TfrmGerenciadorCompromisso.chxSelecaoMultiplaClick(Sender: TObject);
begin
  cxGridDBTableView3.OptionsSelection.MultiSelect := chxSelecaoMultipla.Checked;
  cxGridDBTableView3.OptionsSelection.CellSelect  := not chxSelecaoMultipla.Checked;
  cxGridDBTableAssociado.Options.Focusing   := chxSelecaoMultipla.Checked;
  cxGridDBTableGrau.Options.Focusing        := chxSelecaoMultipla.Checked;
  cxGridDBAssociadoValor.Options.Focusing   := chxSelecaoMultipla.Checked;
  cxGridDBTableSituacao.Options.Editing     := not chxSelecaoMultipla.Checked;
  cxGridCompromissos.SetFocus;
end;

procedure TfrmGerenciadorCompromisso.chxValorClick(Sender: TObject);
begin
  if chxValor.Checked then
       cxGridDBAssociadoValor.GroupIndex := 0
  else cxGridDBAssociadoValor.GroupIndex := -1;

  if (chxValor.Checked) and (chxSelecaoMultipla.Checked) then
    chxSelecaoMultipla.Checked := False;

  chxSelecaoMultipla.Enabled := not chxValor.Checked;
end;

procedure TfrmGerenciadorCompromisso.grdCompromissosLancadosEnter(Sender: TObject);
begin
  tabAssociados.TabVisible := False;
  pgcDados.ActivePage      := tabCompromissos;
  sqlCompromissoLancadoAfterScroll(sqlCompromissoLancado);
end;

procedure TfrmGerenciadorCompromisso.InserirReserva(vpReservaId : Variant; vpContabilContaId,
           vpLancamentoId : Integer; vpPercentual : Currency = 100);
begin
  if vpReservaId = null then
    exit;

  sqlReservaCompromisso.Append;
  sqlReservaCompromissoCONTABIL_RESERVA_ID.AsInteger       := dtmControles.GerarSequencia('CONTABIL_RESERVA_ID');
  sqlReservaCompromissoCONTABIL_CONTA_ID.AsInteger         := vpContabilContaId;
  sqlReservaCompromissoRESERVA_ID.AsInteger                := vpReservaId;
  sqlReservaCompromissoLANCAMENTO_COMPROMISSO_ID.AsInteger := vpLancamentoId;
  sqlReservaCompromissoPERCENTUAL.AsCurrency               := vpPercentual;
  sqlReservaCompromisso.ApplyUpdates(-1);
end;

procedure TfrmGerenciadorCompromisso.lblExpandirDadosClick(Sender: TObject);
begin
  cxGridDBTableView3.DataController.Groups.FullExpand;
end;

procedure TfrmGerenciadorCompromisso.lblJuntarDadosClick(Sender: TObject);
begin
  cxGridDBTableView3.DataController.Groups.FullCollapse;
end;

procedure TfrmGerenciadorCompromisso.cxLabel1Click(Sender: TObject);
var
  i : Integer;
begin
  sqlCompromissoMensal.DisableControls;
  sqlCompromissoMensal.First;
  for i := 0 to 10 do
  begin
    if vgTabBalancete[i] = -1 then
      break;

    fmeCompromisso1.tabBalancete.TabIndex := i;
    while not sqlCompromissoMensal.Eof do
    begin
      if VerificarReserva(sqlCompromissoMensalCONTABIL_CONTA_ID.AsString,
                          sqlCompromissoMensalLANCAMENTO_COMPROMISSO_ID.AsString) < 100 then
      begin
        sqlCompromissoMensal.EnableControls;
        Application.MessageBox(Pchar('Existe(m) Compromisso(s) com Reserva < 100%!!!'+#13+#13+
                                     'Operação Cancelada.'), 'Atenção', MB_OK + MB_ICONWARNING);
        exit;
      end;
      sqlCompromissoMensal.Next;
    end;
  end;
  fmeCompromisso1.tabBalancete.TabIndex := 0;
  sqlCompromissoMensal.EnableControls;
  RealizarLancamentosMensais(True);
  AtivarPopMenus;
end;

procedure TfrmGerenciadorCompromisso.popDesativarCompromissoClick(
  Sender: TObject);
begin
  if Application.MessageBox(Pchar('Desativar agendamento selecionado?'),'Confirmação', MB_YESNO) = IDNO then
    exit;

  Screen.Cursor := crHourGlass;
  ExecutaSqlAuxiliar(' UPDATE T_LANCAMENTO_COMPROMISSO SET SITUACAO = '+QuotedStr('4')+
                     ' WHERE LANCAMENTO_COMPROMISSO_ID = '+sqlCompromissoMensalLANCAMENTO_COMPROMISSO_ID.AsString,1);

  ExecutaSqlAuxiliar(' UPDATE T_COMPROMISSO_AGENDADO SET SITUACAO_GERAL = '+ QuotedStr('4')+
                     ' WHERE LANCAMENTO_COMPROMISSO_ID = '+ sqlCompromissoMensalLANCAMENTO_COMPROMISSO_ID.AsString+
                     ' AND CEDENTE_ID = '+ IntToStr(vgCedenteAtivo),1);

  sqlCompromissoMensal.Refresh;
  sqlCompromissoLancado.Refresh;
  Screen.Cursor := crDefault;
end;

procedure TfrmGerenciadorCompromisso.ExportalExcel1Click(Sender: TObject);
begin
  case pgcVinculo.ActivePageIndex of
    0 : dtmLookup.ExportarExcel(cxGridCompromissos);
    2 : dtmLookup.ExportarExcel(cxGridTotalAssociados);
  end;
end;

procedure TfrmGerenciadorCompromisso.fmeCompromisso1icxPeriodoPropertiesEditValueChanged(
  Sender: TObject);
var
   viPeriodo : Integer;
begin
  with fmeCompromisso1 do
  begin
    cbxMesAnoFinal.Enabled := icxPeriodo.EditValue = '3';

    if strtoint(icxPeriodo.EditValue) in [1,4,5] then
         cbxMesAnoFinal.EditValue := null
    else cbxMesAnoFinal.EditValue := cbxMesAnoinicial.EditValue;

    if icxPeriodo.EditValue <> null then
    begin
      viPeriodo := StrToInt(icxPeriodo.EditValue);
      case viPeriodo of
        1,4,5 : begin
              if icxPeriodo.RepositoryItem = dtmLookup.Combo_PeriodoLimitado then
                   dtmLookup.CarregarPeriodo(cbxMesAnoInicial,3,'','')
              else dtmLookup.CarregarPeriodo(cbxMesAnoInicial,3,'',dtmLookup.InclementarAnoMes(IntToStr(vgPeriodoAtual)));
              dtmLookup.CarregarPeriodo(cbxMesAnoFinal,3,'','');
            end;
        2 : begin
              dtmLookup.CarregarPeriodo(cbxMesAnoInicial,3,'','');
              dtmLookup.CarregarPeriodo(cbxMesAnoFinal,3,'','');
            end;
        3 : begin
              dtmLookup.CarregarPeriodo(cbxMesAnoInicial,3,'','');
              dtmLookup.CarregarPeriodo(cbxMesAnoFinal,4,'','');
            end;
      end;
      cbxMesAnoinicial.EditValue := dtmLookup.FormatarAnoMes(IntToStr(vgPeriodoAtual));
    end;
  end;
end;

procedure TfrmGerenciadorCompromisso.fmeCompromisso1lcxCompromissoPropertiesEditValueChanged(
  Sender: TObject);
begin

  chxTodos.Checked;
end;

procedure TfrmGerenciadorCompromisso.fmeCompromisso1tabBalanceteChange(
  Sender: TObject);
begin
  fmeCompromisso1.tabBalanceteChange(Sender);
  AtualizaContasBalancete;

  gdrCompromissoAgendadoEnter(Self);
  if sqlAssociados.Active then
    sqlAssociados.Refresh;
end;

procedure TfrmGerenciadorCompromisso.FormActivate(Sender: TObject);
begin
  if fmeCompromisso1.rdbCompromissosDiversos.Checked then
       rdbCompromissosDiversosClick(self)
  else rdbCompromissosMensaisClick(Self);

  gdrCompromissoAgendadoEnter(gdrCompromissoAgendado);
  sqlCompromissoMensalAfterScroll(sqlCompromissoMensal);
end;

procedure TfrmGerenciadorCompromisso.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sqlCompromissoMensal.Close;
  sqlAssociados.Close;
  sqlCompromissoLancado.Close;

  sqlPessoasAtualiza.Active       := False;
  sqlCompromissoRealizado.Active  := False;

  Action                    := caFree;
  frmGerenciadorcompromisso := nil;
end;

procedure TfrmGerenciadorCompromisso.FormCreate(Sender: TObject);
begin
  sqlCompromissoMensal.Connection     := dtmControles.DB;
  sqlPessoasAtualiza.Connection       := dtmControles.DB;
  sqlCompromissoLancado.Connection    := dtmControles.DB;
  sqlAssociados.Connection            := dtmControles.DB;
  sqlCompromissoRealizado.Connection  := dtmControles.DB;
  sqlReservaCompromisso.Connection    := dtmControles.DB;
  sqlReservaLancado.Connection        := dtmControles.DB;
  sqlAjusteProgramado.Connection      := dtmControles.DB;
  sqlTotalAssociado.Connection        := dtmControles.DB;

  pgcVinculo.ActivePageIndex         := 0;
  pgcTabCompromissos.ActivePageIndex := 0;
  dtmLookup.CarregarTabBalancete(fmeCompromisso1.tabBalancete);
  AtualizaContasBalancete;
  pgcCompromissos.ActivePageIndex  := 0;
  pgcCompromissos1.ActivePageIndex := 0;
  AtivarPopMenus;
  pgcDados.ActivePage:= tabAssociados;
  fmeCompromisso1.icxPeriodo.RepositoryItem := dtmLookup.Combo_Periodo;
end;

procedure TfrmGerenciadorCompromisso.FormShow(Sender: TObject);
begin
  btnLimparCompromissoClick(self);
  fmeCompromisso1.rdbCompromissosDiversos.Checked := True;
  rdbCompromissosDiversosClick(self);
end;

procedure TfrmGerenciadorCompromisso.gdrCompromissoAgendadoEnter(
  Sender: TObject);
begin
  tabAssociados.TabVisible := True;
  sqlCompromissoMensalAfterScroll(sqlCompromissoMensal);
end;

procedure TfrmGerenciadorCompromisso.pgcDadosChange(Sender: TObject);
begin
  btnAdAssociado.Enabled      := pgcDados.ActivePage = tabAssociados;
  btnRemoverAssociado.Enabled := pgcDados.ActivePage = tabAssociados;
  chxValor.Visible            := pgcDados.ActivePage = tabAssociados;
end;

procedure TfrmGerenciadorCompromisso.pgcVinculoChange(Sender: TObject);
begin
  if pgcVinculo.ActivePageIndex = 2 then
  begin
    CarregarCompromissoAssociado;
    btnPesquisarAssociadoClick(self);
  end;
end;

procedure TfrmGerenciadorCompromisso.popAtivarClick(Sender: TObject);
begin
   if popAtivar.Checked then
        AtivarDesativarCompromisso('1', True)
   else AtivarDesativarCompromisso('2', True);
end;

procedure TfrmGerenciadorCompromisso.popExcluirAgendadoClick(Sender: TObject);
begin
  ExecutaSqlAuxiliar(' SELECT LANCAMENTO_COMPROMISSO_ID FROM T_COMPROMISSO_VENCIDO '+
                     ' WHERE LANCAMENTO_COMPROMISSO_ID = '+sqlCompromissoMensalLANCAMENTO_COMPROMISSO_ID.AsString+
                     ' AND SITUACAO = ''2''',0);

  if not dtmControles.sqlAuxiliar.IsEmpty then
  begin
    if sqlCompromissoMensalcalc_Fixo.AsString = 'S' then
         Application.MessageBox('Exclusão não permitida. Já existem lançamentos realizados neste agendamento!!!', 'Atenção', MB_OK + MB_ICONWARNING)
    else Application.MessageBox(Pchar('Exclusão não permitida. Já existem lançamentos realizados neste agendamento!!!'+#13+#13+
                                     '>> Obs. Pode ser utilizado a opção de cancelamento!!!'), 'Atenção', MB_OK + MB_ICONWARNING);
    exit;
  end;

  if Application.MessageBox(Pchar('Confirma exclusão do agendamento selecionado?'+#13+#13+
      'ATENÇÃO: A EXCLUSÃO DO AGENDAMENTO É IRREVERSÍVEL!!!'),
      'Confirmação', MB_YESNO) = IDNO then
      exit;

  try
    dtmControles.StartTransaction;
    // Excluir os Itens de Reserva Vinculado
    ExecutaSqlAuxiliar(' DELETE FROM T_COMPROMISSO_RESERVA '+
                       ' WHERE LANCAMENTO_COMPROMISSO_ID = '+sqlCompromissoMensalLANCAMENTO_COMPROMISSO_ID.AsString,1);

    // Excluir a Conta do Item de Reserva
    ExecutaSqlAuxiliar(' DELETE FROM T_CONTABIL_RESERVA '+
                       ' WHERE LANCAMENTO_COMPROMISSO_ID = '+sqlCompromissoMensalLANCAMENTO_COMPROMISSO_ID.AsString,1);

    // Excluir os agendamentos de todos os sociso deste compromisso
    ExecutaSqlAuxiliar(' DELETE FROM T_COMPROMISSO_AGENDADO '+
                       ' WHERE LANCAMENTO_COMPROMISSO_ID = '+sqlCompromissoMensalLANCAMENTO_COMPROMISSO_ID.AsString,1);

    ExecutaSqlAuxiliar(' DELETE FROM T_COMPROMISSO_VENCIDO '+
                       ' WHERE LANCAMENTO_COMPROMISSO_ID = '+sqlCompromissoMensalLANCAMENTO_COMPROMISSO_ID.AsString,1);

    sqlCompromissoMensal.delete;
    sqlCompromissoMensal.ApplyUpdates(-1);
    dtmControles.Commit;
    sqlCompromissoMensal.Refresh;
    sqlCompromissoMensalAfterScroll(sqlCompromissoMensal);
  except
    dtmControles.Roolback;
    ShowMessage('Problema na Exclusão do Compromisso!!!');
  end;
  AtivarPopMenus;
end;

procedure TfrmGerenciadorCompromisso.popLancadoCancelarClick(Sender: TObject);
begin
  if Application.MessageBox(Pchar('Confirma o cancelamento deste compromisso?'+#13+#13+
      '>> ATENÇÃO: Os compromissos quitados não serão cancelados!!!'),
      'Confirmação', MB_YESNO) = IDNO then
        exit;

  // Excluir os agendamentos de todos os socios deste compromisso
  ExecutaSqlAuxiliar(' DELETE FROM T_COMPROMISSO_AGENDADO '+
                     ' WHERE LANCAMENTO_COMPROMISSO_ID = '+sqlCompromissoLancadoLANCAMENTO_COMPROMISSO_ID.AsString,1);

  ExecutaSqlAuxiliar(' DELETE FROM T_COMPROMISSO_VENCIDO '+
                     ' WHERE LANCAMENTO_COMPROMISSO_ID = '+sqlCompromissoLancadoLANCAMENTO_COMPROMISSO_ID.AsString+
                     '   AND SITUACAO IN (''1'',''3'')',1);

  sqlCompromissoLancado.edit;
  sqlCompromissoLancadoSITUACAO.AsString := '3';
  sqlCompromissoLancado.ApplyUpdates(-1);
  AtivarPopMenus;
  sqlCompromissoLancado.Refresh;
end;

procedure TfrmGerenciadorCompromisso.popLancadoEstornarClick(Sender: TObject);
begin
  if Application.MessageBox(Pchar('Confirma estorno deste compromisso?'+#13+#13+
      '>> ATENÇÃO: O ESTORNO É IRREVERSÍVEL!!!'),
      'Confirmação', MB_YESNO) = IDNO then
        exit;

  // Excluir os agendamentos de todos os socios deste compromisso
  ExecutaSqlAuxiliar(' DELETE FROM T_COMPROMISSO_AGENDADO '+
                     ' WHERE LANCAMENTO_COMPROMISSO_ID = '+sqlCompromissoLancadoLANCAMENTO_COMPROMISSO_ID.AsString,1);

  ExecutaSqlAuxiliar(' DELETE FROM T_COMPROMISSO_VENCIDO '+
                     ' WHERE LANCAMENTO_COMPROMISSO_ID = '+sqlCompromissoLancadoLANCAMENTO_COMPROMISSO_ID.AsString+
                     '   AND SITUACAO IN (''1'',''3'')',1);

  ExecutaSqlAuxiliar(' DELETE FROM T_COMPROMISSO_RESERVA '+
                     ' WHERE LANCAMENTO_COMPROMISSO_ID = '+sqlCompromissoLancadoLANCAMENTO_COMPROMISSO_ID.AsString,1);

  ExecutaSqlAuxiliar(' DELETE FROM T_CONTABIL_RESERVA '+
                     ' WHERE LANCAMENTO_COMPROMISSO_ID = '+sqlCompromissoLancadoLANCAMENTO_COMPROMISSO_ID.AsString,1);

  sqlCompromissoLancado.Delete;
  sqlCompromissoLancado.ApplyUpdates(-1);
  AtivarPopMenus;
  sqlCompromissoLancado.Refresh;
end;

procedure TfrmGerenciadorCompromisso.popReajustarValorAgendadoClick(
  Sender: TObject);
begin
  vgReajustarCompromissoId := sqlCompromissoMensalCONTABIL_CONTA_ID.AsInteger;
  vgReajustarValor         := sqlCompromissoMensalVALOR_ATUAL.AsCurrency;
  ExibirFormulario(TfrmReajustarValorCompromisso, frmReajustarValorCompromisso, True);

  if vgReajustarOK then
  begin
    sqlAssociados.Refresh;

    if vgNovoValor > 0 then
    begin
      sqlCompromissoMensal.Edit;
      sqlCompromissoMensalVALOR_ANTERIOR.AsCurrency    := sqlCompromissoMensalVALOR_ATUAL.AsCurrency;
      sqlCompromissoMensalVALOR_ATUAL.AsCurrency       := vgNovoValor;
      sqlCompromissoMensalREAJUSTE_AUTOMATICO.AsString := 'S';
      sqlCompromissoMensal.ApplyUpdates(-1);
    end;

  end;
end;

procedure TfrmGerenciadorCompromisso.rdbAjusteMesAtualClick(Sender: TObject);
begin
  VerificarReajuste;
end;

procedure TfrmGerenciadorCompromisso.rdbAjusteProximoMesClick(Sender: TObject);
begin
  VerificarReajuste;
end;

procedure TfrmGerenciadorCompromisso.rdbCompromissosDiversosClick(
  Sender: TObject);
begin
  vgFiltrarGerenciamento := True;
  fmeCompromisso1.rdbCompromissosDiversosClick(Self);

  chxTodos.Enabled := fmeCompromisso1.icxPeriodo.Enabled;
  if not fmeCompromisso1.icxPeriodo.Enabled then
    chxTodos.Checked := True;
end;

procedure TfrmGerenciadorCompromisso.rdbCompromissosMensaisClick(
  Sender: TObject);
begin
  vgFiltrarGerenciamento := True;
  fmeCompromisso1.rdbCompromissosMensaisClick(self);

  chxTodos.Enabled := fmeCompromisso1.icxPeriodo.Enabled;
  if not fmeCompromisso1.icxPeriodo.Enabled then
    chxTodos.Checked := True;

end;

procedure TfrmGerenciadorCompromisso.RealizarLanamentoIndividual1Click(
  Sender: TObject);
begin
  if (sqlCompromissoMensalTODOS_SOCIOS.AsString = 'N') then
  begin
    ExibirFormulario(TfrmSelecionarAssociado, frmSelecionarAssociado, True);
    if (not vgAssociado.Flag) or (vgAssociado.Selecao = '') then
    begin
      Application.MessageBox('Nenhum sócio selecionado para este agendamento!!!', 'Atenção', MB_OK + MB_ICONWARNING);
      exit;
    end;
  end
  else vgAssociado.Selecao := '';

  Screen.Cursor := crHourGlass;
  if sqlCompromissoMensalPERIODO.AsInteger = 2 then
  begin
    AtivarLancamentosMensais(sqlCompromissoMensalLANCAMENTO_COMPROMISSO_ID.AsInteger, vgAssociado.Selecao, True, True, '1');
    // Conclui os Compromissos que Venceu
    ExecutaSqlAuxiliar(' UPDATE T_LANCAMENTO_COMPROMISSO SET SITUACAO = '+ QuotedStr('3')+
                       ' WHERE ANO_MES_FINAL = '+ QuotedStr(IntToStr(vgPeriodoAtual))+
                       '   AND CEDENTE_ID = '+ IntToStr(vgCedenteAtivo),1);
    grdCompromissosLancadosEnter(grdCompromissosLancados);
  end
  else
  begin
    pgcDados.ActivePage:= tabAssociados;
    AtivarLancamentosMensais(sqlCompromissoMensalLANCAMENTO_COMPROMISSO_ID.AsInteger, vgAssociado.Selecao, True, False, '2');
    gdrCompromissoAgendadoEnter(gdrCompromissoAgendado);
  end;
  Screen.Cursor := crDefault;
  sqlAssociados.Refresh;
  sqlCompromissoMensal.Refresh;
  sqlCompromissoLancado.Refresh;
  AtivarPopMenus;
end;

procedure TfrmGerenciadorCompromisso.RealizarLancamentoReservaMensal(vpAnoMes : string;
      vpLancamentoId : String = '');
begin
  ExecutaSimpleDSAux(' SELECT R.* '+
                     ' FROM T_LANCAMENTO_COMPROMISSO L '+
                     '   LEFT OUTER JOIN T_CONTABIL_RESERVA R ON '+
                     '   L.LANCAMENTO_COMPROMISSO_ID = R.LANCAMENTO_COMPROMISSO_ID '+
                     ' WHERE CEDENTE_ID = 1 '+
                     '  AND NOT R.RESERVA_ID IS NULL '+
                     '  AND ((L.SITUACAO = ''1'') OR ((L.SITUACAO = ''3'') AND (ANO_MES_FINAL = '+QuotedStr(vpAnoMes)+')))',0);
  with dtmControles.SimpleAuxiliar do
  begin
    First;
    // Apaga as Reservas Existentes no Mes
    if vpLancamentoId = '' then
      ExecutaSqlAuxiliar(' delete from T_COMPROMISSO_RESERVA CR '+
                         ' where CR.REFERENCIA_ANOMES = '+QuotedStr(vpAnoMes)+
                         '   and CR.lancamento_compromisso_id IN (SELECT CV.LANCAMENTO_COMPROMISSO_ID '+
                         '                                        FROM T_LANCAMENTO_COMPROMISSO CV '+
                         '                                        WHERE ((CV.SITUACAO = ''1'') OR (CV.SITUACAO = ''3'')))',1)
    else
      ExecutaSqlAuxiliar(' delete from T_COMPROMISSO_RESERVA CR '+
                         '  where CR.REFERENCIA_ANOMES = '+QuotedStr(vpAnoMes)+
                         '   and CR.lancamento_compromisso_id = '+vpLancamentoId,1);

    while not eof do
    begin
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
        if vpLancamentoId = '' then
        begin
          ParamByName('COMPROMISSO_RESERVA_ID').AsCurrency   := dtmControles.GerarSequencia('T_COMPROMISSO_RESERVA');
          ParamByName('LANCAMENTO_COMPROMISSO_ID').AsInteger := dtmControles.SimpleAuxiliar.FieldByName('LANCAMENTO_COMPROMISSO_ID').AsInteger;
          ParamByName('CONTABIL_CONTA_ID').AsInteger         := dtmControles.SimpleAuxiliar.FieldByName('CONTABIL_CONTA_ID').AsInteger;
          ParamByName('RESERVA_ID').AsInteger                := dtmControles.SimpleAuxiliar.FieldByName('RESERVA_ID').AsInteger;
          ParamByName('PERCENTUAL').AsCurrency               := dtmControles.SimpleAuxiliar.FieldByName('PERCENTUAL').AsCurrency;
          ParamByName('REFERENCIA_ANOMES').AsString          := vpAnoMes;
          ExecSQL(FALSE);
        end
        else
        begin
          ParamByName('COMPROMISSO_RESERVA_ID').AsCurrency   := dtmControles.GerarSequencia('T_COMPROMISSO_RESERVA');
          ParamByName('LANCAMENTO_COMPROMISSO_ID').AsInteger := StrToInt(vpLancamentoId);
          ParamByName('CONTABIL_CONTA_ID').AsInteger         := sqlCompromissoLancadoCONTABIL_CONTA_ID.AsInteger;
          ParamByName('RESERVA_ID').AsInteger                := dtmControles.GetInt('SELECT RESERVA_ID FROM T_CONTABIL_RESERVA WHERE LANCAMENTO_COMPROMISSO_ID = '+ vpLancamentoId);
          ParamByName('PERCENTUAL').AsCurrency               := 100;
          ParamByName('REFERENCIA_ANOMES').AsString          := vpAnoMes;
          ExecSQL(FALSE);
          Application.MessageBox('Vinculo Atualizado!!!', 'Informação', MB_OK + MB_ICONWARNING);
          Break;
        end;
      end;
      Next;
    end;
    Close;
  end;
end;

procedure TfrmGerenciadorCompromisso.RealizarLancamentosMensais(
  vpMostrarMensagem: Boolean);
var
  viCompromissoLancado : Boolean;
  viPessoaId, viSituacaoId : Integer;

  Function VerificarBimestralTrimestral:Boolean;
  var
    viMesLancamento, viQtd, viConst, i : Integer;
    viMesAtual, viMeses : String;
  begin
    viMesAtual      := copy(IntToStr(vgPeriodoAtual),5,2);
    viMesLancamento := StrtoInt(copy(dtmControles.SimpleAuxiliar.FieldByName('ANO_MES_INICIAL').AsString,5,2));
    if dtmControles.SimpleAuxiliar.FieldByName('PERIODO').AsInteger = 4 then //Bimestral
    begin
      viConst := 2;
      viQtd   := 5
    end
    else
    begin
      viQtd   := 3;
      viConst := 3;
    end;

    viMeses := '';
    viMeses := FormatFloat('00',viMesLancamento);
    for i := 1 to viQtd do
    begin
      viMesLancamento := viMesLancamento + viConst;
      if viMesLancamento > 12 then
        viMesLancamento := viMesLancamento - 12;
      viMeses := viMeses + ','+ FormatFloat('00',viMesLancamento);
    end;
    result := pos(viMesAtual, viMeses) > 0;
  end;

begin
  if vpMostrarMensagem then
  begin
    if Application.MessageBox(Pchar('Confirma lançamento dos compromissos mensais dos sócios?'+#13+#13+
        'ATENÇÃO: Somente serão lançados compromissos ainda não lançados neste mês!!!'),
        'Confirmação', MB_YESNO) = IDNO then
        exit;
    pnlImpressao.Visible := True;
    pnlImpressao.Refresh;
  end;

  Screen.Cursor        := crHourGlass;


  // Inativar Compromissos Agendados Concluidos
  ExecutaSqlAuxiliar(' UPDATE T_COMPROMISSO_AGENDADO SET SITUACAO_GERAL = '+ QuotedStr('3')+
                     ' WHERE ANO_MES_FINAL < '+ QuotedStr(IntToStr(vgPeriodoAtual))+
                     ' AND CEDENTE_ID = ' +IntToStr(vgCedenteAtivo),1);


  viCompromissoLancado := False;
  ExecutaSimpleDSAux(' SELECT * '+
                     ' FROM T_COMPROMISSO_AGENDADO '+
                     ' WHERE (SITUACAO_GERAL = ''1'') OR (SITUACAO_GERAL IS NULL) '+
                     '   AND CEDENTE_ID = '+ IntToStr(vgCedenteAtivo)+
                     ' ORDER BY PESSOA_ID',0);
  With dtmControles.SimpleAuxiliar do
  begin
    First;
    AtivarProgress('Inserindo Compromisso. Aguarde!!!', dtmControles.SimpleAuxiliar.RecordCount);

    viSituacaoid := 0;
    viPessoaId   := 0;
    while not eof do
    begin
      if (viPessoaId <> FieldByName('PESSOA_ID').AsInteger) then
      begin
        viPessoaId  := FieldByName('PESSOA_ID').AsInteger;
        viSituacaoid := dtmControles.GetInt('SELECT SITUACAO FROM T_PESSOA WHERE PESSOA_ID = '+IntToStr(viPessoaId));
      end;

      if not(viSituacaoid in [1,3]) then
      begin
        cxProgress.Position := cxProgress.Position + 1;
        Next;
        Continue;
      end;

      dtmLookup.VerificarProgramacaoAjuste(FieldByName('COMPROMISSO_AGENDADO_ID').AsString, InttoStr(vgPeriodoAtual));

      if FieldByName('PERIODO').AsInteger in [1..3] then
      begin
        if (FieldByName('ANO_MES_LANCAMENTO').AsString = IntToStr(vgPeriodoAtual)) or
           (FieldByName('ANO_MES_INICIAL').AsInteger > vgPeriodoAtual) then
        begin
          cxProgress.Position := cxProgress.Position + 1;
          Next;
          Continue;
        end;
      end
      else
      begin
        if (FieldByName('ANO_MES_LANCAMENTO').AsString = IntToStr(vgPeriodoAtual)) or
        (not VerificarBimestralTrimestral) then
        begin
          cxProgress.Position := cxProgress.Position + 1;
          Next;
          Continue;
        end;
      end;

      viCompromissoLancado                   := True;
      vgCompromissoVencido.PessoaId          := FieldByName('PESSOA_ID').AsInteger;
      vgCompromissoVencido.ContabilContaId   := FieldByName('CONTABIL_CONTA_ID').AsInteger;
      vgCompromissoVencido.CentroCustoId     := FieldByName('CENTRO_CUSTO_ID').AsInteger;
      vgCompromissoVencido.BoletoId          := '';
      vgCompromissoVencido.ReciboId          := '';
      vgCompromissoVencido.BalanceteGrupoId  := FieldByName('BALANCETE_GRUPO_ID').AsInteger;
      vgCompromissoVencido.Valor             := FieldByName('VALOR_ATUAL').AsFloat;
      vgCompromissoVencido.PeriodoInicial    := IntToStr(vgPeriodoAtual);
      vgCompromissoVencido.PeriodoFinal      := IntToStr(vgPeriodoAtual);
      vgCompromissoVencido.Obrigatorio       := FieldByName('OBRIGATORIO').AsString;
      vgCompromissoVencido.AtualizarAgendado := False;
      vgCompromissoVencido.MostrarMensagem   := False;
      vgCompromissoVencido.SituacaoLocal     := FieldByName('SITUACAO_LOCAL').AsString;
      vgCompromissoVencido.PeriodoTipo       := 3;
      vgCompromissoVencido.LancamentoCompromissoId := FieldByName('LANCAMENTO_COMPROMISSO_ID').AsString;
      vgCompromissoVencido.AnoMesLancamento  := IntToStr(vgPeriodoAtual);
      vgCompromissoVencido.SituacaoGeral     := '';

      if FieldByName('LANCAMENTO_COMPROMISSO_ID').AsVariant = null then
           vgCompromissoVencido.ReservaId := FieldByName('RESERVA_ID').AsInteger
      else vgCompromissoVencido.ReservaId := 0;

      dtmLookup.AdicionarCompromisso(True, False, False, 'C');
      Edit;
      FieldByName('ANO_MES_LANCAMENTO').AsString := IntToStr(vgPeriodoAtual);
      ApplyUpdates(-1);
      cxProgress.Position := cxProgress.Position + 1;
      cxProgress.Refresh;
      Next;
    end;
  end;

  RealizarLancamentoReservaMensal(IntToStr(vgPeriodoAtual));
  if viCompromissoLancado then
  begin
    // Exclui compromissos já concluidos
    ExecutaSqlAuxiliar(' DELETE FROM T_COMPROMISSO_AGENDADO '+
                       ' WHERE ANO_MES_FINAL = '+QuotedStr(IntToStr(vgPeriodoAtual))+
                       '   AND CEDENTE_ID = ' +IntToStr(vgCedenteAtivo),1);

    // Atualiza o Ano_Mes_Lancamento dos compromissos agendados já concluidos
    ExecutaSqlAuxiliar(' UPDATE T_LANCAMENTO_COMPROMISSO SET ANO_MES_LANCAMENTO = '+ QuotedStr(IntToStr(vgPeriodoAtual))+
                       ' WHERE SITUACAO = ''1'''+
                       ' AND CEDENTE_ID = ' +IntToStr(vgCedenteAtivo),1);

    // Conclui os Compromissos que Venceu
    ExecutaSqlAuxiliar(' UPDATE T_LANCAMENTO_COMPROMISSO SET SITUACAO = '+ QuotedStr('3')+
                       ' WHERE ANO_MES_FINAL = '+ QuotedStr(IntToStr(vgPeriodoAtual))+
                       ' AND CEDENTE_ID = ' +IntToStr(vgCedenteAtivo),1);
  end;
  Screen.Cursor := crDefault;

  if vpMostrarMensagem then
  begin
    pnlImpressao.Visible := False;
    sqlCompromissoMensal.Refresh;
    sqlCompromissoLancado.Refresh;
    if viCompromissoLancado then
         Application.MessageBox('Lançamento Mensal Realizado!!!', 'Informação', MB_OK + MB_ICONWARNING)
    else Application.MessageBox('Nenhum agendamento encontrado a ser realizado!!!', 'Informação', MB_OK + MB_ICONWARNING);
  end;

end;

procedure TfrmGerenciadorCompromisso.popLancadoReativarClick(Sender: TObject);
begin
  if Application.MessageBox(Pchar('Reativando agendamento mensal selecionado?'),'Confirmação', MB_YESNO) = IDNO then
    exit;
  Screen.Cursor := crHourGlass;
  ExecutaSqlAuxiliar(' UPDATE T_LANCAMENTO_COMPROMISSO SET SITUACAO = '+QuotedStr('1')+
                     ' WHERE LANCAMENTO_COMPROMISSO_ID = '+sqlCompromissoLancadoLANCAMENTO_COMPROMISSO_ID.AsString,1);

  ExecutaSqlAuxiliar(' UPDATE T_COMPROMISSO_AGENDADO SET SITUACAO_GERAL = '+ QuotedStr('1')+
                     ' WHERE LANCAMENTO_COMPROMISSO_ID = '+ sqlCompromissoLancadoLANCAMENTO_COMPROMISSO_ID.AsString+
                     ' AND CEDENTE_ID = '+ IntToStr(vgCedenteAtivo),1);

  sqlCompromissoMensal.Refresh;
  sqlCompromissoLancado.Refresh;
  Screen.Cursor := crDefault;
end;

procedure TfrmGerenciadorCompromisso.Renovar1Click(Sender: TObject);
var
  viAnoInicial, viAnoFinal : String; 
begin
  if Application.MessageBox(Pchar('Renovar Compromisso Agendado. Confirma?'), 'Confirmação', MB_YESNO) = IDNO then
    exit;

  try
    dtmControles.StartTransaction;
{    ExecutaSqlAuxiliar(' UPDATE T_COMPROMISSO_AGENDADO SET SITUACAO = '+QuotedStr('1')+
                       ' WHERE LANCAMENTO_COMPROMISSO_ID = '+ sqlCompromissoLancadoLANCAMENTO_COMPROMISSO_ID.AsString,1);}

    // Renova por mais um Ano
    viAnoFinal   :=  InttoStr(StrtoInt(copy(dtmControles.DataHoraBanco(4), 7,4))+1)+
                         Copy(sqlCompromissoLancadoANO_MES_FINAL.AsString,5,2);         
    
    ExecutaSqlAuxiliar(' UPDATE T_LANCAMENTO_COMPROMISSO SET SITUACAO = '+QuotedStr('1')+', '+
                       '                                   ANO_MES_FINAL = '+ QuotedStr(viAnoFinal)+ 
                       ' WHERE LANCAMENTO_COMPROMISSO_ID = '+ sqlCompromissoLancadoLANCAMENTO_COMPROMISSO_ID.AsString,1);

    dtmControles.Commit;
    sqlCompromissoLancado.Refresh;
    sqlCompromissoRealizado.Refresh;    
    sqlCompromissoMensal.Refresh;    
  except   
    dtmControles.Roolback;
    Application.MessageBox(Pchar('Erro na Renovação. Tente Novamente!!!'), 'Informação', MB_OK + MB_ICONWARNING);    
  end;

end;

procedure TfrmGerenciadorCompromisso.btnImprimirClick(Sender: TObject);
begin
  dtmLookup.dxComponentPrinter.CurrentLink.Component := cxGridCompromissos;
  vgRelatorioTitulo := 'Título do Relatório';
  ExibirFormulario(TfrmTituloRelatorio, frmTituloRelatorio, True);
  if vgRelatorioImprimir then
    dtmLookup.dxComponentPrinter.Preview;
//    dtmControles.dxComponentPrinter.Print(True,nil,nil);
end;

procedure TfrmGerenciadorCompromisso.popCancelarCompromissoClick(
  Sender: TObject);
begin
  ExecutaSqlAuxiliar(' SELECT LANCAMENTO_COMPROMISSO_ID FROM T_COMPROMISSO_VENCIDO '+
                     ' WHERE LANCAMENTO_COMPROMISSO_ID = '+sqlCompromissoMensalLANCAMENTO_COMPROMISSO_ID.AsString,0);
  if not dtmControles.sqlAuxiliar.IsEmpty then
  begin
    if Application.MessageBox(Pchar('Confirma cancelamento deste compromisso?'+#13+#13+
        'ATENÇÃO: Os compromissos quitados não serão cancelados!!!.'),
        'Confirmação', MB_YESNO) = IDNO then
      exit;
  end
  else
    if Application.MessageBox(Pchar('Confirma cancelamento deste compromisso?'+#13+#13+
        'ATENÇÃO: O CANCELAMENTO É IRREVERSÍVEL!!!'),
        'Confirmação', MB_YESNO) = IDNO then
          exit;

  // Excluir os agendamentos de todos os socios deste compromisso
  ExecutaSqlAuxiliar(' DELETE FROM T_COMPROMISSO_AGENDADO '+
                     ' WHERE LANCAMENTO_COMPROMISSO_ID = '+sqlCompromissoMensalLANCAMENTO_COMPROMISSO_ID.AsString,1);

  ExecutaSqlAuxiliar(' DELETE FROM T_COMPROMISSO_VENCIDO '+
                     ' WHERE LANCAMENTO_COMPROMISSO_ID = '+sqlCompromissoMensalLANCAMENTO_COMPROMISSO_ID.AsString+
                     '   AND SITUACAO IN (''1'',''3'')',1);

  sqlCompromissoMensal.Edit;
  sqlCompromissoMensalSITUACAO.AsString := '4';
  sqlCompromissoMensal.ApplyUpdates(-1);
  AtivarPopMenus;
  sqlCompromissoMensal.Refresh;
  sqlCompromissoLancado.Refresh;
end;

procedure TfrmGerenciadorCompromisso.popDesfazerReajusteClick(Sender: TObject);
begin
  if Application.MessageBox('Defazer Reajuste do Valor do Compromisso. Confirma?', 'Pergunta', MB_YESNO) = IDNO then
    exit;

  try
    dtmControles.StartTransaction;
    if sqlCompromissoMensalREAJUSTE_AUTOMATICO.AsString = 'S' then
    begin
      sqlCompromissoMensal.Edit;
      sqlCompromissoMensalVALOR_ATUAL.AsCurrency       := sqlCompromissoMensalVALOR_ANTERIOR.AsCurrency;
      sqlCompromissoMensalREAJUSTE_AUTOMATICO.AsString := 'N';
      sqlCompromissoMensal.ApplyUpdates(-1);
    end;

    ExecutaSqlAuxiliar(' UPDATE T_COMPROMISSO_AGENDADO SET VALOR_ATUAL = VALOR_ANTERIOR, '+
                       '                               REAJUSTE_AUTOMATICO = ''N'''+
                       ' WHERE REAJUSTE_AUTOMATICO = ''S'''+
                       '   AND LANCAMENTO_COMPROMISSO_ID = '+ sqlCompromissoMensalLANCAMENTO_COMPROMISSO_ID.AsString,1);
    dtmControles.Commit;
    Application.MessageBox('Reajuste Desfeito com Sucesso!!!', 'Informação', MB_OK + MB_ICONINFORMATION);
  except
    dtmControles.Roolback;
    Application.MessageBox('Problemas ao desfazer o reajuste. Operação não realizada!!!', 'Informação', MB_OK + MB_ICONERROR);
  end;
end;

procedure TfrmGerenciadorCompromisso.sqlAssociadosAfterPost(DataSet: TDataSet);
begin
  ExecutaSqlAuxiliar(' UPDATE T_COMPROMISSO_AGENDADO SET SITUACAO_LOCAL = '+QuotedStr(sqlAssociadosSITUACAO_LOCAL.AsString)+
                     ' WHERE COMPROMISSO_AGENDADO_ID = '+ sqlAssociadosCOMPROMISSO_AGENDADO_ID.AsString+
                     ' AND CEDENTE_ID = ' +IntToStr(vgCedenteAtivo),1);
end;

procedure TfrmGerenciadorCompromisso.sqlAssociadosCalcFields(DataSet: TDataSet);
begin
  if sqlAssociados.RecordCount > 0 then
  begin
    sqlAssociadoscalc_porcet.AsCurrency := (100/sqlAssociados.RecordCount);
    if (sqlAssociadosSITUACAO_LOCAL.AsString = '1') then
         sqlAssociadosCALC_VALOR.AsCurrency := sqlAssociadosVALOR_ATUAL.AsCurrency
    else sqlAssociadosCALC_VALOR.AsCurrency := 0;
  end;
end;

procedure TfrmGerenciadorCompromisso.sqlCompromissoLancadoAfterScroll(
  DataSet: TDataSet);
begin
  AtivarPopMenus;
  if sqlCompromissoMensal.IsEmpty then
    exit;

  if sqlCompromissoMensalPERIODO.AsInteger = 1 then
    CarregarContasPendentesRealizadas(sqlCompromissoLancadoANO_MES_INICIAL.AsString,
                                      sqlCompromissoLancadoANO_MES_INICIAL.AsString,
                                      sqlCompromissoLancadoSITUACAO.AsString,
                                      sqlCompromissoLancadoCONTABIL_CONTA_ID.AsString,
                                      sqlCompromissoLancadoLANCAMENTO_COMPROMISSO_ID.AsString)
  else
    CarregarContasPendentesRealizadas(sqlCompromissoLancadoANO_MES_INICIAL.AsString,
                                      sqlCompromissoLancadoANO_MES_FINAL.AsString,
                                      sqlCompromissoLancadoSITUACAO.AsString,
                                      sqlCompromissoLancadoCONTABIL_CONTA_ID.AsString,
                                      sqlCompromissoLancadoLANCAMENTO_COMPROMISSO_ID.AsString);
end;

procedure TfrmGerenciadorCompromisso.sqlCompromissoLancadoCalcFields(
  DataSet: TDataSet);
begin
  sqlCompromissoLancadocalc_AnoMesInicial.AsString := dtmLookup.FormatarAnoMes(sqlCompromissoLancadoANO_MES_INICIAL.AsString);
  if (not sqlCompromissoLancadoANO_MES_FINAL.IsNull) and (sqlCompromissoLancadoANO_MES_FINAL.AsString <> '') then
    sqlCompromissoLancadocalc_AnoMesFinal.AsString := dtmLookup.FormatarAnoMes(sqlCompromissoLancadoANO_MES_FINAL.AsString);
end;

procedure TfrmGerenciadorCompromisso.sqlCompromissoMensalAfterScroll(
  DataSet: TDataSet);
begin
  if vgAlterando then
    exit;

  if sqlCompromissoMensal.IsEmpty then
  begin
    sqlAssociados.Active := False;
    exit;
  end;

  if sqlCompromissoMensalPERIODO.AsInteger = 1 then
    CarregarContasPendentesRealizadas(sqlCompromissoMensalANO_MES_LANCAMENTO.AsString,
                                      sqlCompromissoMensalANO_MES_LANCAMENTO.AsString,
                                      sqlCompromissoMensalSITUACAO.AsString,
                                      sqlCompromissoMensalCONTABIL_CONTA_ID.AsString,
                                      sqlCompromissoMensalLANCAMENTO_COMPROMISSO_ID.AsString)
  else
    CarregarContasPendentesRealizadas(sqlCompromissoMensalANO_MES_INICIAL.AsString,
                                      sqlCompromissoMensalANO_MES_FINAL.AsString,
                                      sqlCompromissoMensalSITUACAO.AsString,
                                      sqlCompromissoMensalCONTABIL_CONTA_ID.AsString,
                                      sqlCompromissoMensalLANCAMENTO_COMPROMISSO_ID.AsString);

  sqlAssociados.Close;
  sqlAssociados.DataSet.ParamByName('CEDENTE_ID').AsBCD                 := vgCedenteAtivo;
  sqlAssociados.DataSet.ParamByName('BALANCETE_GRUPO_ID').AsBCD         := vgTabBalancete[fmeCompromisso1.tabBalancete.TabIndex];
  sqlAssociados.DataSet.ParamByName('LANCAMENTO_COMPROMISSO_ID').AsBCD  := sqlCompromissoMensalLANCAMENTO_COMPROMISSO_ID.AsCurrency;
  sqlAssociados.Open;

  popAtivar.Checked := sqlCompromissoMensalSITUACAO.AsString = '1';
  if popAtivar.Checked then
       popAtivar.Caption := 'Desativar Compromisso'
  else popAtivar.Caption := 'Ativar Compromisso';
  AtivarPopMenus;
end;

procedure TfrmGerenciadorCompromisso.sqlCompromissoMensalCalcFields(
  DataSet: TDataSet);
begin
  if vgAlterando then
    exit;

  sqlCompromissoMensalcalc_AnoMesInicial.AsString := dtmLookup.FormatarAnoMes(sqlCompromissoMensalANO_MES_INICIAL.AsString);
  if (not sqlCompromissoMensalANO_MES_FINAL.IsNull) and (sqlCompromissoMensalANO_MES_FINAL.AsString <> '') then
    sqlCompromissoMensalcalc_AnoMesFinal.AsString := dtmLookup.FormatarAnoMes(sqlCompromissoMensalANO_MES_FINAL.AsString);

  if sqlCompromissoMensalANO_MES_LANCAMENTO.AsVariant <> null then
       sqlCompromissoMensalcalc_AnoMesLancamento.AsString := dtmLookup.FormatarAnoMes(sqlCompromissoMensalANO_MES_LANCAMENTO.AsString)
  else sqlCompromissoMensalcalc_AnoMesLancamento.AsString := '-';

  sqlCompromissoMensalcalc_Fixo.AsString := dtmControles.GetStr(' SELECT FIXO FROM T_CONTABIL_CONTA '+
                                                                ' WHERE CONTABIL_CONTA_ID = '+ sqlCompromissoMensalContabil_Conta_Id.AsString);
end;

procedure TfrmGerenciadorCompromisso.sqlCompromissoRealizadoCalcFields(
  DataSet: TDataSet);
begin
  sqlCompromissoRealizadocalc_Referencia.AsString := dtmLookup.FormatarAnoMes(sqlCompromissoRealizadoANO_MES_REFERENCIA.AsString);
end;

procedure TfrmGerenciadorCompromisso.sqlCompromissoRealizadoInternalDataSetCalcFields(
  DataSet: TDataSet);
begin
  sqlCompromissoRealizadocalc_Referencia.AsString := dtmLookup.FormatarAnoMes(sqlCompromissoRealizadoANO_MES_REFERENCIA.AsString);
end;

procedure TfrmGerenciadorCompromisso.sqlReservaCompromissoAfterScroll(
  DataSet: TDataSet);
begin
  if sqlReservaCompromisso.RecordCount = 0 then
    tbcReserva.Caption := 'Vincular Reserva!!!'
  else
  begin
    if VerificarReserva(sqlCompromissoMensalCONTABIL_CONTA_ID.AsString, sqlCompromissoMensalLANCAMENTO_COMPROMISSO_ID.AsString) < 100 then
         tbcReserva.Caption := 'Reserva(s) Vinculada(s) < 100%!!!'
    else tbcReserva.Caption := '100% Reserva Vinculada';
  end;
  btnReservaExclui.Visible := not sqlReservaCompromisso.IsEmpty;
end;

procedure TfrmGerenciadorCompromisso.VerificarReajuste;
begin
  sqlAjusteProgramado.Close;
  sqlAjusteProgramado.DataSet.ParamByName('LANCAMENTO_COMPROMISSO_ID').AsBCD := sqlCompromissoMensalLANCAMENTO_COMPROMISSO_ID.AsInteger;
  if rdbAjusteMesAtual.Checked then
       sqlAjusteProgramado.DataSet.ParamByName('ANOMES').AsBCD    := vgPeriodoAtual
  else sqlAjusteProgramado.DataSet.ParamByName('ANOMES').AsString := dtmLookupContabil.InclementarAnoMes(vgPeriodoAtual.ToString);
  sqlAjusteProgramado.Open;
end;

function TfrmGerenciadorCompromisso.VerificarReserva(
  vpContabilContaId: String; vpLancamentoId : String): Currency;
begin
  // Verifica se o Total de Reserva já está 100%
  if vpContabilContaId = '' then
    exit;

  Result := dtmControles.GetFloat(' SELECT SUM(PERCENTUAL) FROM T_CONTABIL_RESERVA '+
                                  ' WHERE CONTABIL_CONTA_ID = '+ vpContabilContaId+
                                  '  AND LANCAMENTO_COMPROMISSO_ID = '+vpLancamentoId);
end;

procedure TfrmGerenciadorCompromisso.VincularReservadoMs1Click(Sender: TObject);
var
  viAnoMes : String;
begin
  if Application.MessageBox(Pchar('Vincular Reserva do Compromisso do Mês Selecionado. Confirma?'), 'Confirmação', MB_YESNO) = IDNO then
    exit;

   viAnoMes := sqlCompromissoLancadoANO_MES_FINAL.AsString;
   if not InputQuery('Digite o Ano Mês Lançamento (ANO/MES)','Ano/Mes:', viAnoMes)then
     abort;

   if viAnoMes = '' then
     viAnoMes := sqlCompromissoLancadoANO_MES_FINAL.AsString;

  RealizarLancamentoReservaMensal(viAnoMes, sqlCompromissoLancadoLANCAMENTO_COMPROMISSO_ID.AsString);
end;

end.


