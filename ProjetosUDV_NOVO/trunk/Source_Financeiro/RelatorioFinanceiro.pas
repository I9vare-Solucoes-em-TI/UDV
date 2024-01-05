unit RelatorioFinanceiro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadastroAuxSimplificado, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, Menus, FMTBcd, DB, DBClient, Provider,
  SqlExpr, StdCtrls, cxButtons, ExtCtrls, cxLabel, ComCtrls, dxCore,
  cxDateUtils, cxTextEdit, cxDropDownEdit, cxCalendar, cxMaskEdit, cxGroupBox,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxRadioGroup,
  dxSkinscxPCPainter, cxPCdxBarPopupMenu, cxPC, SimpleDS, frxClass, frxDBSet,
  cxImageComboBox, dxBarBuiltInMenu, DbxDevartInterBase, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid;

type
  TfrmCadRelatorioFinanceiro = class(TfrmCadastroAuxSimplificado)
    sqlRelatorioAnalitico: TSimpleDataSet;
    dtsRelatorioAnalitico: TDataSource;
    dtsRelatorioSimplificado: TDataSource;
    sqlRelatorioSimplificado: TSimpleDataSet;
    frxReport1: TfrxReport;
    frxDBDataSetDemonstrativo: TfrxDBDataset;
    frxDBDataSetFinanceiroSintetico: TfrxDBDataset;
    btnRelatorio: TcxButton;
    sqlRelatorioAnaliticoLIVRO_CAIXA_ID: TFMTBCDField;
    sqlRelatorioAnaliticoCAIXA_ID: TFMTBCDField;
    sqlRelatorioAnaliticoVALOR: TFMTBCDField;
    sqlRelatorioAnaliticoOPERACAO: TStringField;
    sqlRelatorioAnaliticoPESSOA_ID: TFMTBCDField;
    sqlRelatorioAnaliticoDATA_PAGAMENTO: TSQLTimeStampField;
    sqlRelatorioAnaliticoREFERENCIA: TStringField;
    sqlRelatorioAnaliticoOBSERVACAO: TStringField;
    sqlRelatorioAnaliticoCONTABIL_CONTA_ID: TFMTBCDField;
    sqlRelatorioAnaliticoCENTRO_CUSTO_ID: TFMTBCDField;
    sqlRelatorioAnaliticoESPECIE: TStringField;
    sqlRelatorioAnaliticoDOCUMENTO_DESCRICAO: TStringField;
    sqlRelatorioAnaliticoBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlRelatorioAnaliticoLIVRO_FINANCEIRO_ID: TFMTBCDField;
    sqlRelatorioAnaliticoHISTORICO: TStringField;
    sqlRelatorioAnaliticoANO_MES_REGISTRO: TStringField;
    sqlRelatorioAnaliticoDATA_VENCIMENTO: TSQLTimeStampField;
    sqlRelatorioAnaliticoLIVRO_AGENDAMENTO_ID: TFMTBCDField;
    sqlRelatorioAnaliticoCONTABIL_CONTA_DESCRICAO: TStringField;
    sqlRelatorioAnaliticoGRUPO_SECUDARIO: TStringField;
    sqlRelatorioAnaliticoGRUPO_PRINCIPAL: TStringField;
    sqlRelatorioAnaliticoBALANCETE_GRUPO: TStringField;
    sqlRelatorioAnaliticoCAIXA: TStringField;
    sqlRelatorioAnaliticoDOCUMENTO_NUMERO: TStringField;
    sqlRelatorioDiario: TSimpleDataSet;
    dtsRelatorioDiario: TDataSource;
    sqlRelatorioDiarioCAIXA: TStringField;
    sqlRelatorioDiarioCONTABIL_CONTA_DESCRICAO: TStringField;
    sqlRelatorioDiarioGRUPO_SECUDARIO: TStringField;
    sqlRelatorioDiarioGRUPO_PRINCIPAL: TStringField;
    sqlRelatorioDiarioBALANCETE_GRUPO: TStringField;
    sqlRelatorioDiarioDOCUMENTO_NUMERO: TStringField;
    sqlRelatorioDiarioHISTORICO: TStringField;
    sqlRelatorioDiarioOBSERVACAO: TStringField;
    frxDBDatasetDiario: TfrxDBDataset;
    sqlRelatorioDiarioVALOR: TFMTBCDField;
    sqlRelatorioDiarioOPERACAO: TStringField;
    sqlRelatorioDiarioCAIXA_ID: TFMTBCDField;
    sqlRelatorioDiarioCAIXA_DESTINO: TStringField;
    dtsGrupoContabil: TDataSource;
    sqlGrupoContabil: TSimpleDataSet;
    sqlGrupoContabilDESCRICAO: TStringField;
    sqlGrupoContabilCONTABIL_GRUPO_ID: TFMTBCDField;
    sqlGrupoContabilBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlPlanoContas: TSimpleDataSet;
    sqlPlanoContasCONTABIL_CONTA_ID: TFMTBCDField;
    sqlPlanoContasDESCRICAO: TStringField;
    dtsPlanoContas: TDataSource;
    btnLimpar: TcxButton;
    Panel3: TPanel;
    lcxModelo: TcxLookupComboBox;
    cxLabel11: TcxLabel;
    btnModeloSalvar: TcxButton;
    btnModeloExcluir: TcxButton;
    ClientCaixa: TClientDataSet;
    ClientCaixaCAIXA_ID: TIntegerField;
    ClientCaixaPRINCIPAL: TStringField;
    ClientCaixaVALOR: TCurrencyField;
    ClientCaixaPESSOA_ID: TIntegerField;
    ClientCaixaDESCRICAO: TStringField;
    dtsCaixa: TDataSource;
    ClientCaixaRESUMO: TStringField;
    sqlRelatorioSimplificadoVALOR: TFMTBCDField;
    sqlRelatorioSimplificadoOPERACAO: TStringField;
    sqlRelatorioSimplificadoCONTABIL_CONTA_DESCRICAO: TStringField;
    sqlRelatorioSimplificadoGRUPO_SECUDARIO: TStringField;
    sqlRelatorioSimplificadoGRUPO_PRINCIPAL: TStringField;
    sqlRelatorioSimplificadoBALANCETE_GRUPO: TStringField;
    sqlRelatorioSimplificadoBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlRelatorioDiarioNOME: TStringField;
    sqlRelatorioAnaliticoNOME: TStringField;
    ClientReserva: TClientDataSet;
    ClientReservaRESERVA_DESCRICAO: TStringField;
    ClientReservaVALOR_RESERVA: TCurrencyField;
    ClientReservaBALANCETE_GRUPO_ID: TIntegerField;
    ClientReservaVALOR_ENTRADA: TCurrencyField;
    ClientReservaVALOR_SAIDA: TCurrencyField;
    ClientReservaRESERVA_ID: TIntegerField;
    ClientReservaSALDO_ANTERIOR: TCurrencyField;
    ClientReservaRESULTADO_MES: TCurrencyField;
    ClientReservaTRANSFERENCIA_ENTRADA: TCurrencyField;
    ClientReservaTRANSFERENCIA_SAIDA: TCurrencyField;
    dtsReserva: TDataSource;
    ClientSaldoReserva: TClientDataSet;
    ClientSaldoReservaRESERVA_DESCRICAO: TStringField;
    ClientSaldoReservaVALOR_RESERVA: TCurrencyField;
    ClientSaldoReservaBALANCETE_GRUPO_ID: TIntegerField;
    ClientSaldoReservaVALOR_ENTRADA: TCurrencyField;
    ClientSaldoReservaVALOR_SAIDA: TCurrencyField;
    ClientSaldoReservaRESERVA_ID: TIntegerField;
    ClientSaldoReservaSALDO_ANTERIOR: TCurrencyField;
    ClientSaldoReservaRESULTADO_MES: TCurrencyField;
    frxDBDatasetProvisao: TfrxDBDataset;
    sqlItensGenericos: TSimpleDataSet;
    dtsItensGenericos: TDataSource;
    sqlItensGenericosCONTABIL_CONTA_DESCRICAO: TStringField;
    sqlItensGenericosVALOR: TFMTBCDField;
    sqlItensGenericosNOME: TStringField;
    sqlItensGenericosHISTORICO: TStringField;
    sqlItensGenericosOBSERVACAO: TStringField;
    frxDBDatasetItensGenerico: TfrxDBDataset;
    sqlRelatorioSimplificadoGENERICO: TStringField;
    sqlRelatorioDiarioDATA_PAGAMENTO: TSQLTimeStampField;
    sqlRelatorioAnaliticoORDEM_GRUPO: TFMTBCDField;
    sqlRelatorioSomatorioGrupo: TSimpleDataSet;
    FMTBCDField1: TFMTBCDField;
    StringField1: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    FMTBCDField2: TFMTBCDField;
    dtsRelatorioSomatorioGrupo: TDataSource;
    frxDBDataSetFinanceiroSomatorioGrupo: TfrxDBDataset;
    sqlRelatorioResumido: TSimpleDataSet;
    dtsRelatorioResumido: TDataSource;
    frxDBDataSetFinanceiroResumido: TfrxDBDataset;
    sqlRelatorioResumidoVALOR: TFMTBCDField;
    sqlRelatorioResumidoOPERACAO: TStringField;
    sqlRelatorioResumidoGRUPO_PRINCIPAL: TStringField;
    sqlRelatorioResumidoBALANCETE_GRUPO: TStringField;
    sqlRelatorioResumidoBALANCETE_GRUPO_ID: TFMTBCDField;
    dtsSaldoDetalhado: TDataSource;
    ClientSaldoDetalhado: TClientDataSet;
    IntegerField1: TIntegerField;
    StringField2: TStringField;
    CurrencyField1: TCurrencyField;
    IntegerField2: TIntegerField;
    StringField6: TStringField;
    StringField7: TStringField;
    ClientSaldoDetalhadoSALDO_ANTERIOR: TCurrencyField;
    ClientSaldoDetalhadoRECEITAS: TCurrencyField;
    ClientSaldoDetalhadoDESPESAS: TCurrencyField;
    ClientSaldoDetalhadoENTRADAS: TCurrencyField;
    ClientSaldoDetalhadoSAIDAS: TCurrencyField;
    ClientSaldoDetalhadoBALANCETE_GRUPO_ID: TIntegerField;
    frxDBDSaldoDetalhado: TfrxDBDataset;
    ClientSaldoDetalhadoGRUPO: TStringField;
    pgcRelatorio: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    tabBalancete: TcxTabControl;
    lblConta: TcxLabel;
    rdbRelSintetico: TcxRadioButton;
    rdbRelAnalitico: TcxRadioButton;
    pgcPeriodo: TcxPageControl;
    cxTabSheet3: TcxTabSheet;
    lblMesAnoReferencia: TcxLabel;
    edtMesAnoContaInicial: TcxMaskEdit;
    edtMesAnoContaFinal: TcxMaskEdit;
    cxLabel4: TcxLabel;
    cxTabSheet4: TcxTabSheet;
    cxLabel2: TcxLabel;
    edtDataInicial: TcxDateEdit;
    edtDataFinal: TcxDateEdit;
    cxLabel1: TcxLabel;
    rdbRelDiario: TcxRadioButton;
    cxLabel8: TcxLabel;
    rdbRelSomatorio: TcxRadioButton;
    pgcOrdenacao: TcxPageControl;
    tabOrganizacao: TcxTabSheet;
    cbxOrganizar: TcxComboBox;
    tabOrdenacao: TcxTabSheet;
    cbxOrdenacao: TcxComboBox;
    rdbCrescente: TcxRadioButton;
    rdbDeCrescente: TcxRadioButton;
    lcbConta: TcxLookupComboBox;
    icxOperacao: TcxImageComboBox;
    cxGroupBox1: TcxGroupBox;
    cxLabel5: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel15: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel3: TcxLabel;
    lcxGrupoContabil: TcxLookupComboBox;
    cbxGrupoPlano: TcxComboBox;
    lcxCompromisso: TcxLookupComboBox;
    lcxFavorecido: TcxLookupComboBox;
    edtHistorico: TcxTextEdit;
    btnLimparGrupoContabil: TcxButton;
    btnLimparGrupoPlano: TcxButton;
    btnLimparCompromisso: TcxButton;
    btnLimparFornecedor: TcxButton;
    cxButton1: TcxButton;
    lcxCentroCusto: TcxLookupComboBox;
    cxLabel12: TcxLabel;
    chxTodosBalancete: TCheckBox;
    chxUnirCaixas: TCheckBox;
    cxLabel13: TcxLabel;
    icxTipoCaixa: TcxImageComboBox;
    rdbRelResumido: TcxRadioButton;
    cxTabSheet5: TcxTabSheet;
    cxTabSheet6: TcxTabSheet;
    grdSintetico: TcxGrid;
    cxGridDBTableCompromissos: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    cxGridDBTableCompromissosColumn1: TcxGridDBColumn;
    cxGridDBTableCompromissosColumn2: TcxGridDBColumn;
    cxGridDBTableCompromissosColumn3: TcxGridDBColumn;
    cxGridDBTableCompromissosColumn4: TcxGridDBColumn;
    cxGridDBTableCompromissosColumn5: TcxGridDBColumn;
    chxExportarExcel: TCheckBox;
    grdAnalitico: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    cxGridDBTableView1Column3: TcxGridDBColumn;
    cxGridDBTableView1Column4: TcxGridDBColumn;
    grdResumido: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    cxGridDBTableView1Column5: TcxGridDBColumn;
    cxGridDBTableView1Column6: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure pgcPeriodoChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRelatorioClick(Sender: TObject);
    function frxReport1UserFunction(const MethodName: string;
      var Params: Variant): Variant;
    procedure rdbRelDiarioClick(Sender: TObject);
    procedure rdbRelSinteticoClick(Sender: TObject);
    procedure rdbRelSomatorioClick(Sender: TObject);
    procedure HabilitarCampos(vpHabilitado : Boolean);
    procedure tabBalanceteChange(Sender: TObject);
    procedure icxOperacaoPropertiesChange(Sender: TObject);
    procedure lcxGrupoContabilPropertiesEditValueChanged(Sender: TObject);
    procedure cbxGrupoPlanoPropertiesEditValueChanged(Sender: TObject);
    procedure btnLimparGrupoContabilClick(Sender: TObject);
    procedure btnLimparGrupoPlanoClick(Sender: TObject);
    procedure btnLimparCompromissoClick(Sender: TObject);
    procedure btnLimparFornecedorClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure cxLookupComboBox1PropertiesEditValueChanged(Sender: TObject);
    procedure btnModeloSalvarClick(Sender: TObject);
    procedure btnModeloExcluirClick(Sender: TObject);
    procedure lcbContaPropertiesEditValueChanged(Sender: TObject);
    procedure rdbRelResumidoClick(Sender: TObject);
  private
    vlCriandoForm, vlTravarCarregarPlano : Boolean;
    vlModeloRelatorio : String;
    procedure ParametrosRelatorioBalancete;
    procedure CarregarPlanoContas;
  public
    { Public declarations }
  end;

var
  frmCadRelatorioFinanceiro: TfrmCadRelatorioFinanceiro;

implementation

uses Controles, Rotinas, Lookup, Lookup_Contabil,
  VisualizaRelatorios, LookupFinanceiro;

{$R *.dfm}

procedure TfrmCadRelatorioFinanceiro.btnLimparClick(Sender: TObject);
begin
  inherited;
  lcbConta.ItemIndex    := 0;
  icxOperacao.ItemIndex := 0;
  pgcPeriodo.ActivePageIndex := 0;
  edtHistorico.Clear;

  edtMesAnoContaInicial.EditValue := PegarAnoMes(dtmControles.DataHoraBanco(4), True);
  edtMesAnoContaFinal.EditValue   := PegarAnoMes(dtmControles.DataHoraBanco(4), True);

  edtDataInicial.EditValue := StrToDate(dtmControles.DataHoraBanco(4));
  edtDataFinal.EditValue   := StrToDate(dtmControles.DataHoraBanco(4));

end;

procedure TfrmCadRelatorioFinanceiro.btnLimparCompromissoClick(Sender: TObject);
begin
  inherited;
  lcxCompromisso.Clear;
end;

procedure TfrmCadRelatorioFinanceiro.btnLimparFornecedorClick(Sender: TObject);
begin
  inherited;
  lcxFavorecido.Clear;
end;

procedure TfrmCadRelatorioFinanceiro.btnLimparGrupoContabilClick(
  Sender: TObject);
begin
  inherited;
  lcxGrupoContabil.Clear;
end;

procedure TfrmCadRelatorioFinanceiro.btnLimparGrupoPlanoClick(Sender: TObject);
begin
  inherited;
  cbxGrupoPlano.Clear;
end;

procedure TfrmCadRelatorioFinanceiro.btnModeloExcluirClick(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Excluir Modelo de Relat�rio?', 'Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
    exit;
  ExecutaSqlAuxiliar(' DELETE FROM G_CONFIGURACAO_SALVA '+
                     ' WHERE LOCAL = '+QuotedStr('FINANCEIRO_RELATORIO')+
                     '   AND DESCRICAO = '+QuotedStr(lcxModelo.Text)+
                     '   AND SISTEMA_ID = '+IntToStr(vgId),1);
  dtmLookup.sqlConfiguracaoSalva.Refresh;
end;

procedure TfrmCadRelatorioFinanceiro.btnModeloSalvarClick(Sender: TObject);
var
  viNome : String;
begin
  inherited;
  if Application.MessageBox('Salvar Configura��es de Relat�rio?', 'Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
    exit;

  viNome := '';
  repeat
    if not InputQuery('Nome do Modelo do Relar�rio', 'Nome:', viNome) then
     exit;
  until viNome <> '';

  viNome := AnsiUpperCase(viNome);
  dtmLookup.GravarConfiguracaoSalva('FINANCEIRO_RELATORIO', viNome, '', '0');
  dtmLookup.GravarConfiguracaoSalva('FINANCEIRO_RELATORIO', viNome, lcbConta.EditValue, '1');
  dtmLookup.GravarConfiguracaoSalva('FINANCEIRO_RELATORIO', viNome, icxOperacao.EditValue, '2');

  dtmLookup.GravarConfiguracaoSalva('FINANCEIRO_RELATORIO', viNome, lcxGrupoContabil.EditValue, '6');
  dtmLookup.GravarConfiguracaoSalva('FINANCEIRO_RELATORIO', viNome, cbxGrupoPlano.EditValue, '7');
  dtmLookup.GravarConfiguracaoSalva('FINANCEIRO_RELATORIO', viNome, lcxCompromisso.EditValue, '8');
  dtmLookup.GravarConfiguracaoSalva('FINANCEIRO_RELATORIO', viNome, lcxFavorecido.EditValue, '9');
  dtmLookup.GravarConfiguracaoSalva('FINANCEIRO_RELATORIO', viNome, edtHistorico.Text, '10');
  dtmLookup.GravarConfiguracaoSalva('FINANCEIRO_RELATORIO', viNome, cbxOrdenacao.EditValue, '11');

  if rdbCrescente.Checked then
       dtmLookup.GravarConfiguracaoSalva('FINANCEIRO_RELATORIO', viNome, '1', '12')
  else dtmLookup.GravarConfiguracaoSalva('FINANCEIRO_RELATORIO', viNome, '2', '12');

  if rdbRelSintetico.Checked then
    dtmLookup.GravarConfiguracaoSalva('FINANCEIRO_RELATORIO', viNome, '1', '13')
  else
    if rdbRelAnalitico.Checked then
      dtmLookup.GravarConfiguracaoSalva('FINANCEIRO_RELATORIO', viNome, '2', '13')
  else
    if rdbRelDiario.Checked then
      dtmLookup.GravarConfiguracaoSalva('FINANCEIRO_RELATORIO', viNome, '3', '13')
  else
    dtmLookup.GravarConfiguracaoSalva('FINANCEIRO_RELATORIO', viNome, '4', '13');
end;

procedure TfrmCadRelatorioFinanceiro.btnRelatorioClick(Sender: TObject);
var
  viSql, viCondicao, viCondicaoFiltro, viRelatorioId, viGrupoBalancete : String;

  procedure PreencherDadosSintetico(vpOpcao : String);
  var
    viOrdem, viAgruparAddSint, viAgruparAddRes  : String;

  begin
    viAgruparAddSint := '';
    viAgruparAddRes  := '';

    viSql := ' SELECT SUM(LC.VALOR) AS VALOR, '+
             '         LC.OPERACAO, '+
             '         CG.DESCRICAO AS GRUPO_PRINCIPAL, '+
             '         CG.ORDEM, '+
             '         BG.DESCRICAO AS BALANCETE_GRUPO, '+
             '         LC.BALANCETE_GRUPO_ID ';

    if vpOpcao = '2' then
    begin
      viSql := viSql +
             '         ,CC.GRUPO AS GRUPO_SECUDARIO';
      viAgruparAddRes  := ', CC.GRUPO ';
    end;

    if vpOpcao = '1' then
    begin
      viSql := viSql +
             '         ,CC.GRUPO AS GRUPO_SECUDARIO, '+
             '         CC.DESCRICAO AS CONTABIL_CONTA_DESCRICAO, '+
             '         CASE GENERICO '+
             '         WHEN ''S'' THEN ''*'''+
             '         ELSE '+QuotedStr('')+
             '         END AS GENERICO ';
      viAgruparAddSint := ', CC.GRUPO, CC.DESCRICAO, GENERICO';
    end;

    viSql := viSql +
             '  FROM J_LIVRO_CAIXA LC '+
             '    LEFT OUTER JOIN J_LIVRO_FINANCEIRO LF ON '+
             '    LC.LIVRO_FINANCEIRO_ID = LF.LIVRO_FINANCEIRO_ID '+
             '    LEFT OUTER JOIN T_CONTABIL_CONTA CC ON '+
             '    LC.CONTABIL_CONTA_ID = CC.CONTABIL_CONTA_ID '+
             '    LEFT OUTER JOIN T_CONTABIL_GRUPO CG ON '+
             '    CC.CONTABIL_GRUPO_ID = CG.CONTABIL_GRUPO_ID ' +
             '    LEFT OUTER JOIN T_BALANCETE_GRUPO BG ON '+
             '    LC.BALANCETE_GRUPO_ID = BG.BALANCETE_GRUPO_ID '+
             '    LEFT OUTER JOIN J_CAIXA C ON '+
             '    LC.CAIXA_ID = C.CAIXA_ID '+
             ' WHERE NOT LC.LIVRO_CAIXA_ID IS NULL '+viCondicao;
    if vpOpcao = '1' then
      viSql := viSql +
             '    AND LC.OPERACAO IN ('+QuotedStr('R')+','+QuotedStr('D')+','+QuotedStr('AR')+','+QuotedStr('AD')+')'
    else
      viSql := viSql +
             '    AND LC.OPERACAO IN ('+QuotedStr('R')+','+QuotedStr('D')+')';

    viSql := viSql +
             ' GROUP BY LC.BALANCETE_GRUPO_ID, BG.DESCRICAO, LC.OPERACAO, CG.ORDEM, CG.DESCRICAO'+viAgruparAddRes + viAgruparAddSint;

    viSql := viSql + ' ORDER BY LC.BALANCETE_GRUPO_ID,BG.DESCRICAO, LC.OPERACAO DESC, CG.ORDEM, CG.DESCRICAO'+viAgruparAddRes + viAgruparAddSint;

{    if (rdbRelSintetico.Checked) then
    begin
      if rdbDeCrescente.Checked then
           viOrdem := ' DESC'
      else viOrdem := '';

      if cbxOrdenacao.ItemIndex = 0 then
           viSql := viSql + ' ORDER BY LC.BALANCETE_GRUPO_ID, LC.OPERACAO DESC, CG.ORDEM '+viAgruparAdd+viOrdem
      else viSql := viSql + ' ORDER BY LC.BALANCETE_GRUPO_ID, LC.OPERACAO DESC, VALOR '+viOrdem;
    end;}
  end;

  procedure PreencherDadosGenerico;
  begin
    viSql := ' SELECT CC.DESCRICAO AS CONTABIL_CONTA_DESCRICAO, '+
             '        LC.HISTORICO, LC.OBSERVACAO, VALOR, '+
             '        CASE '+
             '         WHEN LC.PESSOA_ID > 0 THEN P.NOME '+
             '         WHEN LC.ASSOCIADO_ID > 0 THEN PU.NOME '+
             '        ELSE '+ QuotedStr('')+
             '        END AS NOME '+
             ' FROM J_LIVRO_CAIXA LC '+
             '   LEFT OUTER JOIN T_CONTABIL_CONTA CC ON '+
             '   LC.CONTABIL_CONTA_ID = CC.CONTABIL_CONTA_ID '+
             '   LEFT OUTER JOIN J_PESSOA P ON '+
             '   LC.PESSOA_ID > 0 AND '+
             '   LC.PESSOA_ID = P.PESSOA_ID '+
             '   LEFT OUTER JOIN T_PESSOA PU ON '+
             '   LC.ASSOCIADO_ID > 0 AND '+
             '   LC.ASSOCIADO_ID = PU.PESSOA_ID '+
             '   LEFT OUTER JOIN J_CAIXA C ON '+
             '   LC.CAIXA_ID = C.CAIXA_ID '+
             '   LEFT OUTER JOIN T_CONTABIL_GRUPO CG ON '+
             '   CC.CONTABIL_GRUPO_ID = CG.CONTABIL_GRUPO_ID ' +
             '   LEFT OUTER JOIN T_BALANCETE_GRUPO BG ON '+
             '   LC.BALANCETE_GRUPO_ID = BG.BALANCETE_GRUPO_ID '+
             ' WHERE CC.GENERICO = ''S'''+viCondicao+
             ' ORDER BY CC.DESCRICAO, LC.DATA_PAGAMENTO';
  end;

  procedure PreencherDadosAnalitico;
  begin
    viSql := ' SELECT C.DESCRICAO AS CAIXA, LC.*, '+
             '        LF.LIVRO_AGENDAMENTO_ID, '+
             '        CC.DESCRICAO AS CONTABIL_CONTA_DESCRICAO, '+
             '        CC.GRUPO AS GRUPO_SECUDARIO, '+
             '        CG.ORDEM AS ORDEM_GRUPO,'+
             '        CG.DESCRICAO AS GRUPO_PRINCIPAL,'+
             '        P.NOME,   '+
             '        BG.DESCRICAO AS BALANCETE_GRUPO, '+
             '  CASE '+
             '   WHEN LC.PESSOA_ID > 0 THEN P.NOME '+
             '   WHEN LC.ASSOCIADO_ID > 0 THEN PU.NOME '+
             '  ELSE '+QuotedStr('')+
             '  END AS NOME '+
             '   FROM J_LIVRO_CAIXA LC '+
             '   LEFT OUTER JOIN J_LIVRO_FINANCEIRO LF ON '+
             '   LC.LIVRO_FINANCEIRO_ID = LF.LIVRO_FINANCEIRO_ID '+
             '   LEFT OUTER JOIN T_CONTABIL_CONTA CC ON '+
             '   LC.CONTABIL_CONTA_ID = CC.CONTABIL_CONTA_ID '+
             '   LEFT OUTER JOIN T_CONTABIL_GRUPO CG ON '+
             '   CC.CONTABIL_GRUPO_ID = CG.CONTABIL_GRUPO_ID '+
             '   LEFT OUTER JOIN J_PESSOA P ON '+
             '   LC.PESSOA_ID > 0 AND '+
             '   LC.PESSOA_ID = P.PESSOA_ID '+
             '   LEFT OUTER JOIN T_PESSOA PU ON '+
             '   LC.ASSOCIADO_ID > 0 AND '+
             '   LC.ASSOCIADO_ID = PU.PESSOA_ID '+
             '   LEFT OUTER JOIN T_BALANCETE_GRUPO BG ON '+
             '   LC.BALANCETE_GRUPO_ID = BG.BALANCETE_GRUPO_ID '+
             '   LEFT OUTER JOIN J_CAIXA C ON '+
             '   LC.CAIXA_ID = C.CAIXA_ID '+
             ' WHERE NOT LC.LIVRO_CAIXA_ID IS NULL '+viCondicao+
             ' AND LC.OPERACAO IN ('+QuotedStr('R')+','+QuotedStr('D')+','+QuotedStr('AR')+','+QuotedStr('AD')+')';
    case cbxOrganizar.ItemIndex of
      0 : viSql := viSql + ' ORDER BY LC.BALANCETE_GRUPO_ID, LC.OPERACAO DESC, ORDEM_GRUPO, GRUPO_PRINCIPAL, CONTABIL_CONTA_DESCRICAO, LC.HISTORICO, LC.DATA_PAGAMENTO';
      1 : viSql := viSql + ' ORDER BY LC.BALANCETE_GRUO_ID, LC.OPERACAO DESC, P.NOME, ORDEM_GRUPO, GRUPO_PRINCIPAL, CONTABIL_CONTA_DESCRICAO, P.NOME, LC.DATA_PAGAMENTO';
      2 : viSql := viSql + ' ORDER BY LC.DATA_PAGAMENTO, C.DESCRICAO, LC.LIVRO_CAIXA_ID ';
    end;
  end;

  procedure PreencherDadosDiarios;
  begin
    viSql := ' SELECT C.DESCRICAO AS CAIXA, LC.DATA_PAGAMENTO, LC.VALOR, LC.OPERACAO, '+
             ' LC.DOCUMENTO_NUMERO, LC.HISTORICO, LC.OBSERVACAO, LC.CAIXA_ID, '+
             '  CC.DESCRICAO AS CONTABIL_CONTA_DESCRICAO, '+
             '  CC.GRUPO AS GRUPO_SECUDARIO, '+
             '  CG.DESCRICAO AS GRUPO_PRINCIPAL, '+
             '  CASE '+
             '   WHEN LC.PESSOA_ID > 0 THEN P.NOME '+
             '   WHEN LC.ASSOCIADO_ID > 0 THEN PU.NOME '+
             '  ELSE '+QuotedStr('')+
             '  END AS NOME, '+
             '  BG.DESCRICAO AS BALANCETE_GRUPO, '+
             '   (SELECT FIRST 1 C1.DESCRICAO FROM J_LIVRO_CAIXA LC1 '+
             '    INNER JOIN J_CAIXA C1 ON '+
             '    C1.CAIXA_ID = LC1.CAIXA_ID '+
             '   WHERE LC1.CAIXA_TRANSFERENCIA_ID = LC.CAIXA_TRANSFERENCIA_ID '+
             '     AND NOT LC1.OPERACAO = LC.OPERACAO) AS CAIXA_DESTINO '+
             ' FROM J_LIVRO_CAIXA LC '+
             '   LEFT OUTER JOIN T_CONTABIL_CONTA CC ON '+
             '   LC.CONTABIL_CONTA_ID = CC.CONTABIL_CONTA_ID '+
             '   LEFT OUTER JOIN T_CONTABIL_GRUPO CG ON '+
             '   CC.CONTABIL_GRUPO_ID = CG.CONTABIL_GRUPO_ID '+
             '   LEFT OUTER JOIN J_PESSOA P ON '+
             '   LC.PESSOA_ID > 0 AND '+
             '   LC.PESSOA_ID = P.PESSOA_ID '+
             '   LEFT OUTER JOIN T_PESSOA PU ON '+
             '   LC.ASSOCIADO_ID > 0 AND '+
             '   LC.ASSOCIADO_ID = PU.PESSOA_ID '+
             '   LEFT OUTER JOIN T_BALANCETE_GRUPO BG ON '+
             '   LC.BALANCETE_GRUPO_ID = BG.BALANCETE_GRUPO_ID '+
             '   LEFT OUTER JOIN J_CAIXA C ON '+
             '   LC.CAIXA_ID = C.CAIXA_ID '+
             ' WHERE NOT LC.LIVRO_CAIXA_ID IS NULL '+viCondicao;
    if chxUnirCaixas.Checked then
         viSql := viSql + ' ORDER BY LC.DATA_PAGAMENTO, C.DESCRICAO '
    else viSql := viSql + ' ORDER BY LC.CAIXA_ID, LC.DATA_PAGAMENTO, C.DESCRICAO ';
  end;

   procedure PreencherDadosRelatorio(vpModelo : Integer; vpParametro : string;
        vpSqlRelatorio : TSimpleDataSet);
   begin
     case vpModelo of
       1   : PreencherDadosSintetico('1');
       2   : PreencherDadosAnalitico;
       3   : PreencherDadosDiarios;
       4   : PreencherDadosSintetico('2');
       5   : PreencherDadosGenerico;
       6   : PreencherDadosSintetico('3');
      end;

     vpSqlRelatorio.Active := False;
     vpSqlRelatorio.DataSet.CommandText := viSql;
     vpSqlRelatorio.Active := True;
     viRelatorioId := dtmControles.BuscarConfig('FINANCEIRO', 'RELATORIO',vpParametro, 'S');
   end;

   procedure VerificarCondicao;
   begin
     viCondicao := '';

     if lcbConta.EditValue > 0 then
       viCondicao := viCondicao+ ' AND LC.CAIXA_ID = '+ IntToStr(lcbConta.EditValue);

     if icxTipoCaixa.EditValue > 0 then
       viCondicao := viCondicao+ ' AND C.CAIXA_ID = '+ IntToStr(icxTipoCaixa.EditValue);

     if icxOperacao.ItemIndex <> 0 then
     begin
       if icxOperacao.ItemIndex <= 4 then
         viCondicao := viCondicao+ ' AND CG.TIPO = '+ QuotedStr(IntToStr((icxOperacao.ItemIndex)))
       else
       begin
         if icxOperacao.ItemIndex = 5 then
              viCondicao := viCondicao+ ' AND ((CG.TIPO = '+QuotedStr('1')+') OR (CG.TIPO = '+QuotedStr('2')+'))'
         else viCondicao := viCondicao+ ' AND ((CG.TIPO = '+QuotedStr('3')+') OR (CG.TIPO = '+QuotedStr('4')+'))';
       end;
     end;

     if lcxGrupoContabil.Text <> '' then
       viCondicao := viCondicao+ ' AND LC.CONTABIL_GRUPO_ID = '+ IntToStr(lcxGrupoContabil.EditValue);

     if cbxGrupoPlano.Text <> '' then
       viCondicao := viCondicao+ ' AND CC.GRUPO = '+ QuotedStr(cbxGrupoPlano.Text);

     if lcxCompromisso.Text <> '' then
       viCondicao := viCondicao+ ' AND LC.CONTABIL_CONTA_ID = '+ IntToStr(lcxCompromisso.EditValue);

     if lcxFavorecido.Text <> '' then
       viCondicao := viCondicao+ ' AND LC.PESSOA_ID = '+ IntToStr(lcxFavorecido.EditValue);

     if Trim(edtHistorico.Text) <> '' then
       viCondicao := viCondicao+ ' AND LC.HISTORICO LIKE '+ QuotedStr(edtHistorico.Text+'%');

     if not chxTodosBalancete.Checked then
       viCondicao := viCondicao+ ' AND LC.BALANCETE_GRUPO_ID = '+IntToStr(vgTabBalancete[tabBalancete.TabIndex])
     else
     begin
       viGrupoBalancete := dtmControles.GetStr(' SELECT GRUPO FROM T_BALANCETE_GRUPO '+
                                               ' WHERE BALANCETE_GRUPO_ID = '+IntToStr(vgTabBalancete[tabBalancete.TabIndex]));
       if viGrupoBalancete <> '' then
         viCondicao := viCondicao+ ' AND BG.GRUPO = '+QuotedStr(viGrupoBalancete);
     end;

     if lcxCentroCusto.Text <> '' then
       viCondicao := viCondicao+ ' AND LC.CENTRO_CUSTO_ID = '+ IntToStr(lcxCentroCusto.EditValue);

     if pgcPeriodo.ActivePageIndex = 1 then
          viCondicao := viCondicao + ' AND LC.DATA_PAGAMENTO '+ MontarSqlData(edtDataInicial.Date , edtDataFinal.Date)
     else viCondicao := viCondicao + ' AND (LC.ANO_MES_REGISTRO >= '+TrocarAnoMes(edtMesAnoContaInicial.EditValue)+
                                     ' AND LC.ANO_MES_REGISTRO <= '+TrocarAnoMes(edtMesAnoContaFinal.EditValue)+')';
   end;

   procedure CarregarSaldoProvimentosCaixa;
   var
      viDataInicial, viDataFinal : String;
   begin
     viDataInicial := '01/'+Copy(edtMesAnoContaInicial.Text,1,2) + '/'+Copy(edtMesAnoContaInicial.Text,4,4);
     viDataFinal   := dtmLookupContabil.PegarDataFinalMes(dtmLookupContabil.ConverterAnoMesBase(edtMesAnoContaFinal.Text, True));
     dtmLookupContabil.CarregarSaldoReservas(ClientReserva, ClientSaldoReserva, dtmLookupContabil.ConverterAnoMesBase(edtMesAnoContaFinal.Text, True), True);
     dtmLookupContabil.CarregarSaldoDetalhado(ClientSaldoDetalhado,viDataInicial,viDataFinal, False, True);
   end;

begin
  inherited;

  VerificarCondicao;

  if rdbRelSintetico.Checked then
  begin
    PreencherDadosRelatorio(1,'FINANCEIRO_SINTETICO', sqlRelatorioSimplificado);
    PreencherDadosRelatorio(5,'FINANCEIRO_SINTETICO', sqlItensGenericos);
  end
  else
    if rdbRelAnalitico.Checked then
      PreencherDadosRelatorio(2,'FINANCEIRO_ANALITICO', sqlRelatorioAnalitico)
  else
    if rdbRelDiario.Checked then
      PreencherDadosRelatorio(3,'FINANCEIRO_DIARIO', sqlRelatorioDiario)
  else
    if rdbRelSomatorio.Checked then
      PreencherDadosRelatorio(4,'FINANCEIRO_SOMATORIO_GRUPO', sqlRelatorioSomatorioGrupo)
  else
    if rdbRelResumido.Checked then
      PreencherDadosRelatorio(6,'FINANCEIRO_RESUMIDO', sqlRelatorioResumido);


  if chxExportarExcel.Checked then
  begin
    if rdbRelSintetico.Checked then
      dtmLookup.ExportarExcel(grdSintetico)
    else
      if rdbRelAnalitico.Checked then
        dtmLookup.ExportarExcel(grdAnalitico)
    else
      if rdbRelResumido.Checked then
        dtmLookup.ExportarExcel(grdResumido);
    exit;
  end;

  CarregarSaldoProvimentosCaixa;
  dtmLookup.CarregarCabecalho(vgTabBalancete[tabBalancete.TabIndex]);
  ExibirRelatorio(frxReport1, viRelatorioId, ParametrosRelatorioBalancete, True, frxReport1.PrintOptions.Printer);
end;

procedure TfrmCadRelatorioFinanceiro.CarregarPlanoContas;
var
  viSql : String;
begin
  if vlCriandoForm or (lcxGrupoContabil.Text = '') then
  begin
    lcxCompromisso.Enabled := False;
    exit;
  end;

  viSql := ' SELECT CC.CONTABIL_CONTA_ID, CC.DESCRICAO, CC.IR '+
           ' FROM T_CONTABIL_CONTA CC LEFT OUTER JOIN T_CONTABIL_GRUPO CG ON '+
           '    CC.CONTABIL_GRUPO_ID = CG.CONTABIL_GRUPO_ID '+
           ' WHERE CC.CONTABIL_GRUPO_ID = '+ IntToStr(lcxGrupoContabil.EditValue);
  if cbxGrupoPlano.Text <> '' then
    viSql := viSql + ' AND CC.GRUPO = '+QuotedStr(cbxGrupoPlano.Text);
  viSql := viSql + ' ORDER BY CC.DESCRICAO ';

  sqlPlanoContas.Active  := False;
  sqlPlanoContas.DataSet.CommandText := viSql;
  sqlPlanoContas.Active  := True;
  lcxCompromisso.Enabled := True;

  if sqlPlanoContas.RecordCount = 1 then
    lcxCompromisso.EditValue := sqlPlanoContasCONTABIL_CONTA_ID.AsInteger;
end;

procedure TfrmCadRelatorioFinanceiro.cbxGrupoPlanoPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  lcxCompromisso.Clear;
  if vlTravarCarregarPlano then
    exit;
  CarregarPlanoContas;
end;

procedure TfrmCadRelatorioFinanceiro.cxLookupComboBox1PropertiesEditValueChanged(
  Sender: TObject);

  Function ProximoValor(vpNull : Boolean = False):Variant;
  begin
    dtmLookup.sqlConfiguracaoDados.Next;
    Result := dtmLookup.sqlConfiguracaoDados.FieldByName('VALOR').AsVariant;
    if (Result = '' ) and vpNull then
      Result := Null;
  end;

  procedure CarregarDados;
  var
    viValor : string;
  begin
    if lcxModelo.Text = '' then
      exit;

    dtmLookup.BuscarConficuracaoSalva('FINANCEIRO_RELATORIO', lcxModelo.Text);

    lcbConta.EditValue        := dtmLookup.sqlConfiguracaoDados.FieldByName('VALOR').AsVariant;
    icxOperacao.EditValue     := ProximoValor;
    lcxGrupoContabil.EditValue:= ProximoValor(True);
    cbxGrupoPlano.EditValue   := ProximoValor;
    lcxCompromisso.EditValue  := ProximoValor(True);
    lcxFavorecido.EditValue   := ProximoValor(True);
    edtHistorico.Text         := ProximoValor;
    cbxOrdenacao.EditValue    := ProximoValor;

    viValor := ProximoValor;
    if viValor = '1' then
         rdbCrescente.Checked   := True
    else rdbDeCrescente.Checked := True;

    viValor := ProximoValor;
    case viValor[1] of
     '1' : rdbRelSintetico.Checked := True;
     '2' : rdbRelAnalitico.Checked := True;
     '3' : rdbRelDiario.Checked    := True;
     '4' : rdbRelSomatorio.Checked := True;
    end;
  end;

begin
  inherited;
  btnModeloExcluir.Enabled := lcxModelo.EditValue <> null;
  dtmLookup.CarregarConfiguracaoSalva('FINANCEIRO_RELATORIO');
  CarregarDados;
end;

procedure TfrmCadRelatorioFinanceiro.FormActivate(Sender: TObject);
begin
  inherited;
  icxTipoCaixa.ItemIndex := 0;
  btnLimparClick(Self);
  rdbRelSinteticoClick(self);
  edtMesAnoContaInicial.SetFocus;
  vlCriandoForm := False;
  icxOperacaoPropertiesChange(Self);
  dtmLookup.CarregarConfiguracaoSalva('FINANCEIRO_RELATORIO');
end;

procedure TfrmCadRelatorioFinanceiro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dtmLookupFinanceiro.AbrirFecharTelaBranco(False);
  Action := caFree;
  frmCadRelatorioFinanceiro := nil;
end;

procedure TfrmCadRelatorioFinanceiro.FormCreate(Sender: TObject);
begin
  inherited;
  dtmLookupFinanceiro.AbrirFecharTelaBranco;

  pgcRelatorio.ActivePageIndex := 0;
  pgcRelatorio.HideTabs        := True;
  vlCriandoForm := True;
  sqlRelatorioAnalitico.Connection     := dtmControles.DB;
  sqlRelatorioSimplificado.Connection  := dtmControles.DB;
  sqlRelatorioDiario.Connection        := dtmControles.DB;
  sqlGrupoContabil.Connection          := dtmControles.DB;
  sqlPlanoContas.Connection            := dtmControles.DB;
  sqlItensGenericos.Connection         := dtmControles.DB;
  sqlRelatorioSomatorioGrupo.Connection:= dtmControles.DB;
  sqlRelatorioResumido.Connection      := dtmControles.DB;

  dtmLookupContabil.CarregarTabBalancete(tabBalancete);
  dtmLookupContabil.CarregarSaldoCaixa(ClientCaixa, True);
end;

function TfrmCadRelatorioFinanceiro.frxReport1UserFunction(
  const MethodName: string; var Params: Variant): Variant;
begin
  inherited;
  if AnsiSameText(MethodName, 'CalcularSaldoCaixa') then
       Result := dtmLookupContabil.CalcularSaldoCaixa(Params[0],Params[1], Params[2])
  else Result := ExecutarFuncoesRelatorio(MethodName, Params);
end;

procedure TfrmCadRelatorioFinanceiro.HabilitarCampos(vpHabilitado: Boolean);
begin
  tabOrganizacao.TabVisible := vpHabilitado;
  tabOrdenacao.TabVisible   := not vpHabilitado;

  if vpHabilitado then
       pgcOrdenacao.ActivePage := tabOrganizacao
  else pgcOrdenacao.ActivePage := tabOrdenacao;

  cbxOrganizar.Enabled := rdbRelAnalitico.Checked;
  if not rdbRelAnalitico.Checked then
    cbxOrganizar.ItemIndex := 0;

  chxExportarExcel.Enabled := rdbRelSintetico.Checked or rdbRelAnalitico.Checked or rdbRelResumido.Checked;
  if not chxExportarExcel.Enabled then
    chxExportarExcel.Checked := False;
  
end;

procedure TfrmCadRelatorioFinanceiro.icxOperacaoPropertiesChange(
  Sender: TObject);
begin
  inherited;
  if vlCriandoForm then
    exit;
  tabBalanceteChange(self);
end;

procedure TfrmCadRelatorioFinanceiro.lcbContaPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  icxTipoCaixa.Enabled := lcbConta.ItemIndex = 0;
  if lcbConta.ItemIndex > 0 then
    icxTipoCaixa.EditValue := 0;
end;

procedure TfrmCadRelatorioFinanceiro.lcxGrupoContabilPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if lcxGrupoContabil.Text = '' then
  begin
    cbxGrupoPlano.Properties.Items.Clear;
    Exit;
  end;

  dtmLookupContabil.CarregarGrupo(cbxGrupoPlano, IntToStr(lcxGrupoContabil.EditValue));
  vlTravarCarregarPlano := True;
  CarregarPlanoContas;
  vlTravarCarregarPlano := False;
end;

procedure TfrmCadRelatorioFinanceiro.ParametrosRelatorioBalancete;
var
  viSaldoAtual, viSaldo : currency;
  viPeriodo, viCaixa, viDataInicial, viDataFinal, viBalanceteId,
  viGrupoBalancete : String;
  viCentroCusto : Integer;

  procedure CalcularSaldos;
  begin
    viSaldo := dtmLookupContabil.CalcularSaldoCaixa('', viCaixa, viBalanceteId,
                                                    dtmLookupContabil.PegarDataFinalMes(dtmLookupContabil.DeclementarAnoMes(TrocarAnoMes(edtMesAnoContaInicial.EditValue),1)),
                                                    viCentroCusto);
    frxReport1.Variables.Variables['SALDO_ANTERIOR'] := viSaldo;

    viSaldo := dtmLookupContabil.CalcularSaldoCaixa('', viCaixa, viBalanceteId, dtmLookupContabil.PegarDataFinalMes(TrocarAnoMes(edtMesAnoContaFinal.EditValue)),
                                                    viCentroCusto);
    frxReport1.Variables.Variables['SALDO_ATUAL'] := viSaldo;

    viDataInicial := '01/'+Copy(edtMesAnoContaInicial.text,1,2)+'/'+Copy(edtMesAnoContaInicial.text,3,4);
    viDataFinal   := dtmLookupContabil.PegarDataFinalMes(TrocarAnoMes(edtMesAnoContaFinal.EditValue));

    viSaldo  := dtmLookupContabil.PrepararSqlSoma('', viCaixa, viBalanceteId, 'D', '', viDataFinal,'',viDataInicial, viCentroCusto);
    frxReport1.Variables.Variables['DESPESAS'] := viSaldo;

    viSaldo  := dtmLookupContabil.PrepararSqlSoma('', viCaixa, viBalanceteId, 'R', '', viDataFinal,'',viDataInicial, viCentroCusto);
    frxReport1.Variables.Variables['RECEITAS'] := viSaldo;

    if icxOperacao.editValue = 'T' then
    begin
      viSaldo  := dtmLookupContabil.PrepararSqlSoma('', viCaixa, viBalanceteId, 'AR', '', viDataFinal,'',viDataInicial);
      frxReport1.Variables.Variables['ENTRADAS'] := viSaldo;

      viSaldo  := dtmLookupContabil.PrepararSqlSoma('', viCaixa, viBalanceteId, 'AD', '', viDataFinal,'',viDataInicial);
      frxReport1.Variables.Variables['SAIDAS'] := viSaldo;
    end
    else
    begin
      frxReport1.Variables.Variables['ENTRADAS'] := 0;
      frxReport1.Variables.Variables['SAIDAS']   := 0;
    end;
  end;

begin
  viBalanceteId := '';
  if not chxTodosBalancete.Checked then
    viBalanceteId := IntToStr(vgTabBalancete[tabBalancete.TabIndex])
  else
  begin
    viGrupoBalancete := dtmControles.GetStr(' SELECT GRUPO FROM T_BALANCETE_GRUPO '+
                                            ' WHERE BALANCETE_GRUPO_ID = '+IntToStr(vgTabBalancete[tabBalancete.TabIndex]));
    if viGrupoBalancete <> '' then
      viBalanceteId := dtmControles.GetStr(' SELECT LIST(CAST(BALANCETE_GRUPO_ID AS INTEGER)) '+
                                           ' FROM T_BALANCETE_GRUPO '+
                                           ' WHERE GRUPO = '+QuotedStr(viGrupoBalancete));
  end;

  if lcxCentroCusto.Text = '' then
       viCentroCusto := 0
  else viCentroCusto := lcxCentroCusto.EditValue;

  CriarFuncoesRelatorio(frxReport1);
  frxReport1.AddFunction('function CalcularSaldoCaixa(vpCaixaId, vpBalanceteId : String; vpDataFinal : string = ''):Currency', 'I9vare', 'Retornar Saldo Caixa');

  // Verificar Per�odo
  if pgcPeriodo.ActivePageIndex = 0 then
  begin
    viPeriodo := PegarMesExtenso(Copy(edtMesAnoContaInicial.EditValue,1,2));
    if edtMesAnoContaInicial.EditValue = edtMesAnoContaFinal.EditValue then
         viPeriodo := viPeriodo + '/' + Copy(edtMesAnoContaInicial.EditValue, 3,4)
    else viPeriodo := viPeriodo + '/' + Copy(edtMesAnoContaInicial.EditValue, 3,4)+ ' a '+
                   PegarMesExtenso(Copy(edtMesAnoContaFinal.EditValue,1,2)) +
                   '/'+ Copy(edtMesAnoContaFinal.EditValue, 3,4);
  end
  else
  begin
    viPeriodo := edtDataInicial.Text;
    if edtDataInicial.EditValue <> edtDataFinal.EditValue then
      viPeriodo := viPeriodo + ' a ' + edtDataFinal.Text;
  end;

  frxReport1.Variables.Variables['vgPeriodo']         := QuotedStr(viPeriodo);
  frxReport1.Variables.Variables['vgContaLancamento'] := QuotedStr(lcbConta.Text);
  frxReport1.Variables.Variables['vgOperacao']        := QuotedStr(icxOperacao.EditValue);
  frxReport1.Variables.Variables['vgGrupoContabil']   := QuotedStr(lcxGrupoContabil.Text);
  frxReport1.Variables.Variables['vgGrupoPlano']      := QuotedStr(cbxGrupoPlano.Text);
  frxReport1.Variables.Variables['vgCompromisso']     := QuotedStr(lcxCompromisso.Text);
  frxReport1.Variables.Variables['vgFavorecido']      := QuotedStr(lcxFavorecido.Text);
  frxReport1.Variables.Variables['vgHistorico']       := QuotedStr(edtHistorico.Text);
  frxReport1.Variables.Variables['vgBalanceteId']     := QuotedStr(viBalanceteId);
  frxReport1.Variables.Variables['vgTipoCaixa']       := QuotedStr(icxTipoCaixa.Text);

  if chxUnirCaixas.Checked then
       frxReport1.Variables.Variables['vgUnirCaixas'] := QuotedStr('S')
  else frxReport1.Variables.Variables['vgUnirCaixas'] := QuotedStr('N');

  if pgcPeriodo.ActivePageIndex = 0 then
  begin
    viCaixa := '';
    if lcbConta.EditValue > 0 then
      viCaixa := IntToStr(lcbConta.EditValue);

    CalcularSaldos;
  end;

  if rdbRelSomatorio.Checked then
       frxReport1.Variables.Variables['vgModeloRel']     := QuotedStr('SOMATORIO')
  else frxReport1.Variables.Variables['vgModeloRel']     := QuotedStr('');

  frxReport1.Variables.Variables['vgOrganizado']      := QuotedStr(IntToStr(cbxOrganizar.ItemIndex));
end;

procedure TfrmCadRelatorioFinanceiro.pgcPeriodoChange(Sender: TObject);
begin
  inherited;
  if pgcPeriodo.ActivePageIndex = 0 then
  begin
    edtMesAnoContaInicial.SetFocus;
    if rdbRelDiario.Checked then
      rdbRelAnalitico.Checked := True;
  end
  else edtDataInicial.SetFocus;
end;

procedure TfrmCadRelatorioFinanceiro.rdbRelSomatorioClick(
  Sender: TObject);
begin
  inherited;
  HabilitarCampos(False);
end;

procedure TfrmCadRelatorioFinanceiro.rdbRelDiarioClick(Sender: TObject);
begin
  inherited;
  HabilitarCampos(True);
  pgcPeriodo.ActivePageIndex := 1;
end;

procedure TfrmCadRelatorioFinanceiro.rdbRelResumidoClick(Sender: TObject);
begin
  inherited;
  HabilitarCampos(False);
end;

procedure TfrmCadRelatorioFinanceiro.rdbRelSinteticoClick(Sender: TObject);
begin
  inherited;
  HabilitarCampos(True);
end;

procedure TfrmCadRelatorioFinanceiro.tabBalanceteChange(Sender: TObject);
var
  viSql : String;
begin
  inherited;
  sqlGrupoContabil.Active := False;
  if icxOperacao.Text = '' then
    exit;

  viSql := ' SELECT DESCRICAO, CONTABIL_GRUPO_ID, BALANCETE_GRUPO_ID '+
           ' FROM T_CONTABIL_GRUPO '+
           ' WHERE BALANCETE_GRUPO_ID = '+ IntToStr(vgTabBalancete[tabBalancete.TabIndex]);
  if (icxOperacao.ItemIndex > 0) and (icxOperacao.ItemIndex < 5) then
    viSql := viSql + ' AND TIPO = '+ QuotedStr(IntToStr((icxOperacao.ItemIndex)));

  viSql := viSql + ' ORDER BY DESCRICAO ';
  sqlGrupoContabil.Active := False;
  sqlGrupoContabil.DataSet.CommandText := viSql;
  sqlGrupoContabil.Active := True;

  if not vlCriandoForm then
  begin
    lcxGrupoContabil.EditValue := null;
    lcxCompromisso.EditValue   := Null;
    lcxCompromisso.Enabled     := False;

    if sqlGrupoContabil.RecordCount = 1 then
      lcxGrupoContabil.EditValue := sqlGrupoContabilCONTABIL_GRUPO_ID.AsInteger;
  end;
end;

end.