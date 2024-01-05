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
  cxImageComboBox, dxBarBuiltInMenu, DbxDevartInterBase, cxDBEdit, cxCheckBox;

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
    sqlRelatorioAnaliticoPROCESSO_ID: TFMTBCDField;
    sqlRelatorioAnaliticoHISTORICO: TStringField;
    sqlRelatorioAnaliticoANO_MES_REGISTRO: TStringField;
    sqlRelatorioAnaliticoDATA_VENCIMENTO: TSQLTimeStampField;
    sqlRelatorioAnaliticoPROCESSO_CONTRATO_ITEM_ID: TFMTBCDField;
    sqlRelatorioAnaliticoLIVRO_AGENDAMENTO_ID: TFMTBCDField;
    sqlRelatorioAnaliticoLIVRO_REMUNERACAO_ID: TFMTBCDField;
    sqlRelatorioAnaliticoCONTABIL_CONTA_DESCRICAO: TStringField;
    sqlRelatorioAnaliticoGRUPO_SECUDARIO: TStringField;
    sqlRelatorioAnaliticoGRUPO_PRINCIPAL: TStringField;
    sqlRelatorioAnaliticoNOME: TStringField;
    sqlRelatorioAnaliticoCLIENTE: TStringField;
    sqlRelatorioSimplificadoVALOR: TFMTBCDField;
    sqlRelatorioSimplificadoOPERACAO: TStringField;
    sqlRelatorioSimplificadoCONTABIL_CONTA_DESCRICAO: TStringField;
    sqlRelatorioSimplificadoGRUPO_SECUDARIO: TStringField;
    sqlRelatorioSimplificadoGRUPO_PRINCIPAL: TStringField;
    sqlRelatorioAnaliticoBALANCETE_GRUPO: TStringField;
    sqlRelatorioSimplificadoBALANCETE_GRUPO: TStringField;
    sqlRelatorioSimplificadoBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlRelatorioAnaliticoCAIXA: TStringField;
    sqlRelatorioAnaliticoDOCUMENTO_NUMERO: TStringField;
    sqlRelatorioDiario: TSimpleDataSet;
    dtsRelatorioDiario: TDataSource;
    sqlRelatorioDiarioCAIXA: TStringField;
    sqlRelatorioDiarioDATA_PAGAMENTO: TSQLTimeStampField;
    sqlRelatorioDiarioCONTABIL_CONTA_DESCRICAO: TStringField;
    sqlRelatorioDiarioGRUPO_SECUDARIO: TStringField;
    sqlRelatorioDiarioGRUPO_PRINCIPAL: TStringField;
    sqlRelatorioDiarioNOME: TStringField;
    sqlRelatorioDiarioBALANCETE_GRUPO: TStringField;
    sqlRelatorioDiarioDOCUMENTO_NUMERO: TStringField;
    sqlRelatorioDiarioHISTORICO: TStringField;
    sqlRelatorioDiarioOBSERVACAO: TStringField;
    frxDBDatasetDiario: TfrxDBDataset;
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
    sqlPlanoContasIR: TStringField;
    sqlPlanoContasCNJ: TStringField;
    dtsPlanoContas: TDataSource;
    tabBalancete: TcxTabControl;
    lblConta: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
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
    sqlRelatorioSimplificadoQTD: TIntegerField;
    sqlRelatorioCentroCusto: TSimpleDataSet;
    StringField1: TStringField;
    SQLTimeStampField1: TSQLTimeStampField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    FMTBCDField1: TFMTBCDField;
    StringField10: TStringField;
    FMTBCDField2: TFMTBCDField;
    StringField11: TStringField;
    dtsCentroCusto: TDataSource;
    sqlRelatorioCentroCustoVALOR_REGISTRADO: TFMTBCDField;
    sqlRelatorioCentroCustoPERCENTUAL_REGISTRADO: TFMTBCDField;
    sqlRelatorioCentroCustoCENTRO_CUSTO_REGISTRADO: TStringField;
    frxDBDatasetDiarioCentroCusto: TfrxDBDataset;
    cxLabel13: TcxLabel;
    ClientCaixaPREVISAO_SALDO: TStringField;
    cxLabel14: TcxLabel;
    lcbConta: TcxLookupComboBox;
    icxTipoCaixa: TcxImageComboBox;
    icxOperacao: TcxImageComboBox;
    icxIR: TcxImageComboBox;
    icxCNJ: TcxImageComboBox;
    imgTipoRelatorio: TcxImageComboBox;
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
    cxLabel12: TcxLabel;
    lcxCentroCusto: TcxLookupComboBox;
    cxButton1: TcxButton;
    pgcPeriodo: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    lblMesAnoReferencia: TcxLabel;
    edtMesAnoContaInicial: TcxMaskEdit;
    edtMesAnoContaFinal: TcxMaskEdit;
    cxLabel4: TcxLabel;
    cxTabSheet2: TcxTabSheet;
    cxLabel2: TcxLabel;
    edtDataInicial: TcxDateEdit;
    edtDataFinal: TcxDateEdit;
    cxLabel1: TcxLabel;
    pgcOrdenacao: TcxPageControl;
    tabOrganizacao: TcxTabSheet;
    cbxOrganizar: TcxComboBox;
    tabOrdenacao: TcxTabSheet;
    cbxOrdenacao: TcxComboBox;
    rdbCrescente: TcxRadioButton;
    rdbDeCrescente: TcxRadioButton;
    chxSomarExcluidos: TcxCheckBox;
    sqlConciliacaoBancaria: TSimpleDataSet;
    dtsConciliacaoBancaria: TDataSource;
    frxDBDatasetConciliacaoBancaria: TfrxDBDataset;
    sqlConciliacaoBancariaCONCILIACAO_REGISTRADO_ID: TStringField;
    sqlConciliacaoBancariaCAIXA: TStringField;
    sqlConciliacaoBancariaVALOR: TFMTBCDField;
    sqlConciliacaoBancariaOPERACAO: TStringField;
    sqlConciliacaoBancariaDOCUMENTO_NUMERO: TStringField;
    sqlConciliacaoBancariaHISTORICO: TStringField;
    sqlConciliacaoBancariaOBSERVACAO: TStringField;
    sqlConciliacaoBancariaCAIXA_ID: TFMTBCDField;
    sqlConciliacaoBancariaCONTABIL_CONTA_DESCRICAO: TStringField;
    sqlConciliacaoBancariaGRUPO_SECUDARIO: TStringField;
    sqlConciliacaoBancariaGRUPO_PRINCIPAL: TStringField;
    sqlConciliacaoBancariaNOME: TStringField;
    sqlConciliacaoBancariaBALANCETE_GRUPO: TStringField;
    sqlConciliacaoBancariaCONC_DESCRICAO: TStringField;
    sqlConciliacaoBancariaCONCVALOR: TFMTBCDField;
    sqlConciliacaoBancariaCONC_OBSERVACAO: TStringField;
    sqlConciliacaoBancariaDATA_PAGAMENTO: TSQLTimeStampField;
    sqlConciliacaoBancariaCONTABIL_RL: TStringField;
    sqlConciliacaoBancariaDOC_TIPO: TStringField;
    frxDBDatasetcABECALHO: TfrxDBDataset;
    sqlRelatorioDiarioESPECIE: TStringField;
    sqlRelatorioDiarioCONTABIL_RL: TStringField;
    sqlRelatorioCentroCustoESPECIE: TStringField;
    sqlRelatorioCentroCustoCONTABIL_RL: TStringField;
    sqlRelatorioCentroCustoCONTABIL_HISTORICO: TStringField;
    sqlRelatorioDiarioVALOR: TFMTBCDField;
    sqlRelatorioDiarioCONTABIL_HISTORICO: TStringField;
    sqlRelatorioDiarioCONTABIL_PESSOA_NOME: TStringField;
    sqlRelatorioCentroCustoCONTABIL_PESSOA_NOME: TStringField;
    sqlRelatorioDiarioDOC_TIPO: TStringField;
    sqlRelatorioCentroCustoDOC_TIPO: TStringField;
    sqlFaturamentoDetalhado: TSimpleDataSet;
    dtsFaturamentoDetalhado: TDataSource;
    sqlFaturamentoDetalhadoDATA_FATURAMENTO: TSQLTimeStampField;
    sqlFaturamentoDetalhadoHISTORICO: TStringField;
    sqlFaturamentoDetalhadoLIVRO_CAIXA_FATURADO_ID: TFMTBCDField;
    sqlFaturamentoDetalhadoMODALIDADE: TStringField;
    sqlFaturamentoDetalhadoCONTABIL_CONTA_ID: TFMTBCDField;
    sqlFaturamentoDetalhadoVALOR: TFMTBCDField;
    sqlFaturamentoDetalhadoOPERACAO: TStringField;
    sqlFaturamentoDetalhadoNOME: TStringField;
    sqlFaturamentoDetalhadoCOMPROMISSO: TStringField;
    frxDBDataSetFaturamentoDetalhado: TfrxDBDataset;
    sqlFaturamentoDetalhadoVALOR_PAGO: TFMTBCDField;
    sqlFaturamentoDetalhadoDATA_PAGAMENTO: TMemoField;
    sqlFaturamentoDetalhadoLIVRO_FINANCEIRO_ID: TFMTBCDField;
    procedure FormCreate(Sender: TObject);
    procedure pgcPeriodoChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRelatorioClick(Sender: TObject);
    function frxReport1UserFunction(const MethodName: string;
      var Params: Variant): Variant;
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
    procedure cxButton1Click(Sender: TObject);
    procedure lcbContaPropertiesEditValueChanged(Sender: TObject);
    procedure imgTipoRelatorioPropertiesChange(Sender: TObject);
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
  lcbConta.ItemIndex         := 0;
  icxOperacao.ItemIndex      := 0;
  icxIR.ItemIndex            := 0;
  icxCNJ.ItemIndex           := 0;
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
  dtmLookup.GravarConfiguracaoSalva('FINANCEIRO_RELATORIO', viNome, icxIR.EditValue, '3');
  dtmLookup.GravarConfiguracaoSalva('FINANCEIRO_RELATORIO', viNome, icxCNJ.EditValue, '4');
  dtmLookup.GravarConfiguracaoSalva('FINANCEIRO_RELATORIO', viNome, icxCNJ.EditValue, '5');
  dtmLookup.GravarConfiguracaoSalva('FINANCEIRO_RELATORIO', viNome, lcxGrupoContabil.EditValue, '6');
  dtmLookup.GravarConfiguracaoSalva('FINANCEIRO_RELATORIO', viNome, cbxGrupoPlano.EditValue, '7');
  dtmLookup.GravarConfiguracaoSalva('FINANCEIRO_RELATORIO', viNome, lcxCompromisso.EditValue, '8');
  dtmLookup.GravarConfiguracaoSalva('FINANCEIRO_RELATORIO', viNome, lcxFavorecido.EditValue, '9');
  dtmLookup.GravarConfiguracaoSalva('FINANCEIRO_RELATORIO', viNome, edtHistorico.Text, '10');
  dtmLookup.GravarConfiguracaoSalva('FINANCEIRO_RELATORIO', viNome, cbxOrdenacao.EditValue, '11');
  dtmLookup.GravarConfiguracaoSalva('FINANCEIRO_RELATORIO', viNome, lcxCentroCusto.EditValue, '14');

  if rdbCrescente.Checked then
       dtmLookup.GravarConfiguracaoSalva('FINANCEIRO_RELATORIO', viNome, '1', '12')
  else dtmLookup.GravarConfiguracaoSalva('FINANCEIRO_RELATORIO', viNome, '2', '12');

  dtmLookup.GravarConfiguracaoSalva('FINANCEIRO_RELATORIO', viNome, imgTipoRelatorio.EditValue, '13');
end;

procedure TfrmCadRelatorioFinanceiro.btnRelatorioClick(Sender: TObject);
var
  viSql, viCondicao, viCondicaoFiltro, viRelatorioId : String;

  {$REGION 'PreencherDadosSintetico'}
  procedure PreencherDadosSintetico;
  var
    viOrdem : String;
  begin
    viSql := ' SELECT SUM(LC.VALOR) AS VALOR, '+
             '         COUNT(LC.LIVRO_CAIXA_ID) AS QTD, '+
             '         LC.OPERACAO, '+
             '         CC.DESCRICAO AS CONTABIL_CONTA_DESCRICAO, '+
             '         CC.GRUPO AS GRUPO_SECUDARIO, '+
             '         CG.DESCRICAO AS GRUPO_PRINCIPAL, '+
             '         BG.DESCRICAO AS BALANCETE_GRUPO, '+
             '         LC.BALANCETE_GRUPO_ID '+
             '  FROM J_LIVRO_CAIXA LC '+
             '    LEFT OUTER JOIN J_LIVRO_FINANCEIRO LF ON '+
             '    LC.LIVRO_FINANCEIRO_ID = LF.LIVRO_FINANCEIRO_ID '+
             '    LEFT OUTER JOIN J_CONTABIL_CONTA CC ON '+
             '    LC.CONTABIL_CONTA_ID = CC.CONTABIL_CONTA_ID '+
             '    LEFT OUTER JOIN J_CONTABIL_GRUPO CG ON '+
             '    CC.CONTABIL_GRUPO_ID = CG.CONTABIL_GRUPO_ID ' +
             '    LEFT OUTER JOIN J_BALANCETE_GRUPO BG ON '+
             '    LC.BALANCETE_GRUPO_ID = BG.BALANCETE_GRUPO_ID '+
             '    LEFT OUTER JOIN J_CAIXA C ON '+
             '    LC.CAIXA_ID = C.CAIXA_ID '+
             ' WHERE NOT LC.LIVRO_CAIXA_ID IS NULL '+viCondicao +
             '    AND LC.OPERACAO IN ('+QuotedStr('R')+','+QuotedStr('D')+','+QuotedStr('AR')+','+QuotedStr('AD')+')'+
             ' GROUP BY BG.DESCRICAO, LC.BALANCETE_GRUPO_ID, LC.OPERACAO, CG.DESCRICAO, CC.GRUPO, CC.DESCRICAO';

    if imgTipoRelatorio.EditValue = '1' then
         viSql := viSql + ' ORDER BY LC.BALANCETE_GRUPO_ID, LC.OPERACAO DESC, CG.DESCRICAO, CC.GRUPO, CC.DESCRICAO'
    else
    begin
      if rdbDeCrescente.Checked then
           viOrdem := ' DESC'
      else viOrdem := '';

      if cbxOrdenacao.ItemIndex = 0 then
           viSql := viSql + ' ORDER BY LC.BALANCETE_GRUPO_ID, LC.OPERACAO DESC, CC.DESCRICAO '+viOrdem
      else viSql := viSql + ' ORDER BY LC.BALANCETE_GRUPO_ID, LC.OPERACAO DESC, VALOR '+viOrdem;
    end;
  end;
  {$ENDREGION}

  {$REGION 'PreencherDadosAnalitico'}
  procedure PreencherDadosAnalitico;
  begin
    viSql := ' SELECT C.DESCRICAO AS CAIXA, LC.*, '+
             '        LF.PROCESSO_CONTRATO_ITEM_ID, LF.LIVRO_REMUNERACAO_ID, LF.LIVRO_AGENDAMENTO_ID, '+
             '        CC.DESCRICAO AS CONTABIL_CONTA_DESCRICAO, '+
             '        CC.GRUPO AS GRUPO_SECUDARIO, '+
             '        CG.DESCRICAO AS GRUPO_PRINCIPAL,'+
             '        P.NOME,   '+
             '        BG.DESCRICAO AS BALANCETE_GRUPO, '+
             '        (SELECT FIRST 1 PP.NOME AS CLIENTE FROM  '+
             '         J_PROCESSO_PARTE PP '+
             '         WHERE PP.PRINCIPAL = '+QuotedStr('S')+
             '           AND PP.PROCESSO_ID = LC.PROCESSO_ID) '+
             '   FROM J_LIVRO_CAIXA LC '+
             '   LEFT OUTER JOIN J_LIVRO_FINANCEIRO LF ON '+
             '   LC.LIVRO_FINANCEIRO_ID = LF.LIVRO_FINANCEIRO_ID '+
             '   LEFT OUTER JOIN J_CONTABIL_CONTA CC ON '+
             '   LC.CONTABIL_CONTA_ID = CC.CONTABIL_CONTA_ID '+
             '   LEFT OUTER JOIN J_CONTABIL_GRUPO CG ON '+
             '   CC.CONTABIL_GRUPO_ID = CG.CONTABIL_GRUPO_ID '+
             '   LEFT OUTER JOIN J_PESSOA P ON' +
             '   LC.PESSOA_ID = P.PESSOA_ID '+
             '   LEFT OUTER JOIN J_BALANCETE_GRUPO BG ON '+
             '   LC.BALANCETE_GRUPO_ID = BG.BALANCETE_GRUPO_ID '+
             '   LEFT OUTER JOIN J_CAIXA C ON '+
             '   LC.CAIXA_ID = C.CAIXA_ID '+
             ' WHERE NOT LC.LIVRO_CAIXA_ID IS NULL '+viCondicao+
             ' AND LC.OPERACAO IN ('+QuotedStr('R')+','+QuotedStr('D')+','+QuotedStr('AR')+','+QuotedStr('AD')+')';
    case cbxOrganizar.ItemIndex of
      0 : viSql := viSql + ' ORDER BY LC.BALANCETE_GRUPO_ID, LC.OPERACAO DESC, GRUPO_PRINCIPAL, CONTABIL_CONTA_DESCRICAO, P.NOME, LC.DATA_PAGAMENTO';
      1 : viSql := viSql + ' ORDER BY LC.BALANCETE_GRUO_ID, LC.OPERACAO DESC, P.NOME, GRUPO_PRINCIPAL, CONTABIL_CONTA_DESCRICAO, P.NOME, LC.DATA_PAGAMENTO';
      2 : viSql := viSql + ' ORDER BY LC.DATA_PAGAMENTO, C.DESCRICAO, LC.LIVRO_CAIXA_ID ';
    end;
  end;
  {$ENDREGION}


  {$REGION 'PreencherDadosConciliacaoBancaria'}
  procedure PreencherDadosConciliacaoBancaria;
  begin
    viSql := ' SELECT CR.CONCILIACAO_REGISTRADO_ID, C.DESCRICAO AS CAIXA, LC.VALOR, LC.OPERACAO, '+
             '        LC.DOCUMENTO_NUMERO, LC.DOC_TIPO, LC.HISTORICO, LC.OBSERVACAO, LC.CAIXA_ID, '+
             '        CC.DESCRICAO AS CONTABIL_CONTA_DESCRICAO, '+
             '        CC.GRUPO AS GRUPO_SECUDARIO, '+
             '        CG.DESCRICAO AS GRUPO_PRINCIPAL, '+
             '        P.NOME, LC.CONTABIL_RL, '+
             '        BG.DESCRICAO AS BALANCETE_GRUPO, '+
             '        CR.DESCRICAO AS CONC_DESCRICAO, CR.VALOR AS CONCVALOR, CR.DATA_PAGAMENTO, '+
             '        CR.OBSERVACAO AS CONC_OBSERVACAO '+
             ' FROM J_CONCILIACAO CB '+
             '   LEFT OUTER JOIN J_CONCILIACAO_REGISTRADO CR ON '+
             '   CB.CONCILIACAO_ID = CR.CONCILIACAO_ID '+
             '   LEFT OUTER JOIN J_LIVRO_CAIXA LC ON '+
             '   CR.CONCILIACAO_REGISTRADO_ID = LC.CONCILIACAO_REGISTRADO_ID'+
             '   LEFT OUTER JOIN J_CONTABIL_CONTA CC ON '+
             '   LC.CONTABIL_CONTA_ID = CC.CONTABIL_CONTA_ID '+
             '   LEFT OUTER JOIN J_CONTABIL_GRUPO CG ON '+
             '   CC.CONTABIL_GRUPO_ID = CG.CONTABIL_GRUPO_ID '+
             '   LEFT OUTER JOIN J_PESSOA P ON '+
             '   LC.PESSOA_ID = P.PESSOA_ID '+
             '   LEFT OUTER JOIN J_BALANCETE_GRUPO BG ON '+
             '   LC.BALANCETE_GRUPO_ID = BG.BALANCETE_GRUPO_ID '+
             '   LEFT OUTER JOIN J_CAIXA C ON '+
             '   LC.CAIXA_ID = C.CAIXA_ID '+
             ' WHERE CB.CAIXA_ID = '+IntToStr(lcbConta.EditValue)+viCondicao+
             ' ORDER BY CR.DATA_PAGAMENTO, CR.CONCILIACAO_REGISTRADO_ID ';
  end;
  {$ENDREGION}

  procedure PreencherDadosFaturamentoDetalhado;
  begin
    viSql := ' SELECT LC.LIVRO_FINANCEIRO_ID, '+
             '        LC.DATA_VENCIMENTO AS DATA_FATURAMENTO, '+
             '        (SELECT LIST(CAST(LC2.DATA_PAGAMENTO AS DATE),'' * '') FROM J_LIVRO_CAIXA LC2 '+
             '        WHERE LC2.LIVRO_FINANCEIRO_ID = LC.LIVRO_FINANCEIRO_ID) AS DATA_PAGAMENTO, '+
             '        TRIM(LC.HISTORICO) AS HISTORICO, '+
             '        LF.LIVRO_CAIXA_FATURADO_ID, '+
             '        TM.DESCRICAO AS MODALIDADE, '+
             '        LF.CONTABIL_CONTA_ID, '+
             '        SUM(LF.VALOR_AGENDADO) AS VALOR, '+
             '        LF.OPERACAO, '+
             '        P.NOME, '+
             '        (SELECT SUM(LC1.VALOR) FROM J_LIVRO_CAIXA LC1 '+
             '        WHERE LC1.LIVRO_FINANCEIRO_ID = LC.LIVRO_FINANCEIRO_ID) AS VALOR_PAGO, '+
             '        CC.DESCRICAO AS COMPROMISSO '+
             ' FROM J_LIVRO_FINANCEIRO LF '+
             '   LEFT OUTER JOIN J_PESSOA P ON '+
             '   LF.PESSOA_ID = P.PESSOA_ID '+
             '   LEFT OUTER JOIN J_CONTABIL_CONTA CC ON '+
             '   LF.CONTABIL_CONTA_ID = CC.CONTABIL_CONTA_ID '+
             '   LEFT OUTER JOIN J_LIVRO_CAIXA LC ON '+
             '   LF.LIVRO_CAIXA_FATURADO_ID = LC.LIVRO_CAIXA_ID '+
             '   LEFT OUTER JOIN J_TIPO_MODALIDADE TM ON '+
             '   LF.TIPO_MODALIDADE_ID = TM.TIPO_MODALIDADE_ID '+
             ' WHERE LF.LIVRO_CAIXA_FATURADO_ID > 0 '+viCondicao+
              ' GROUP BY '+
             '        LC.LIVRO_FINANCEIRO_ID, '+
             '        DATA_FATURAMENTO, '+
             '        LC.HISTORICO, '+
             '        LF.LIVRO_CAIXA_FATURADO_ID, '+
             '        MODALIDADE, '+
             '        LF.CONTABIL_CONTA_ID, '+
             '        LF.OPERACAO, '+
             '        P.NOME, '+
             '        COMPROMISSO, '+
             '        LC.VALOR '+
             ' ORDER BY HISTORICO ';
  end;

  {$REGION 'PreencherDadosDiarios'}
  procedure PreencherDadosDiarios(vpTipo : Integer);

    {$REGION 'CarregarDadosPrincipal'}
    procedure CarregarDadosPrincipal(vpIndex : Integer);
    begin
      case vpIndex of
        1 : viSql := ' SELECT C.DESCRICAO AS CAIXA, LC.DATA_PAGAMENTO, LC.VALOR, LC.OPERACAO, '+
                     '  LC.DOCUMENTO_NUMERO, LC.HISTORICO, LC.OBSERVACAO, LC.CAIXA_ID, '+
                     '  LC.CONTABIL_HISTORICO, LC.CONTABIL_PESSOA_NOME, '+
                     '  CC.DESCRICAO AS CONTABIL_CONTA_DESCRICAO, LC.DOC_TIPO, '+
                     '  CC.GRUPO AS GRUPO_SECUDARIO, '+
                     '  CG.DESCRICAO AS GRUPO_PRINCIPAL, '+
                     '  P.NOME, LC.ESPECIE, LC.CONTABIL_RL, '+
                     '  BG.DESCRICAO AS BALANCETE_GRUPO, '+
                     '   (SELECT FIRST 1 C1.DESCRICAO FROM J_LIVRO_CAIXA LC1 '+
                     '    INNER JOIN J_CAIXA C1 ON '+
                     '    C1.CAIXA_ID = LC1.CAIXA_ID '+
                     '   WHERE LC1.CAIXA_TRANSFERENCIA_ID = LC.CAIXA_TRANSFERENCIA_ID '+
                     '     AND NOT LC1.OPERACAO = LC.OPERACAO) AS CAIXA_DESTINO ';
        2 : viSql := viSql +
                     ' FROM J_LIVRO_CAIXA LC '+
                     '   LEFT OUTER JOIN J_CONTABIL_CONTA CC ON '+
                     '   LC.CONTABIL_CONTA_ID = CC.CONTABIL_CONTA_ID '+
                     '   LEFT OUTER JOIN J_CONTABIL_GRUPO CG ON '+
                     '   CC.CONTABIL_GRUPO_ID = CG.CONTABIL_GRUPO_ID '+
                     '   LEFT OUTER JOIN J_PESSOA P ON '+
                     '   LC.PESSOA_ID = P.PESSOA_ID '+
                     '   LEFT OUTER JOIN J_BALANCETE_GRUPO BG ON '+
                     '   LC.BALANCETE_GRUPO_ID = BG.BALANCETE_GRUPO_ID '+
                     '   LEFT OUTER JOIN J_CAIXA C ON '+
                     '   LC.CAIXA_ID = C.CAIXA_ID ';
        3 : begin
              viSql := viSql +
                      ' WHERE NOT LC.LIVRO_CAIXA_ID IS NULL '+viCondicao;
              if vpTipo = 3 then
                   viSql := viSql +  ' ORDER BY LC.DATA_PAGAMENTO, C.DESCRICAO, LC.LIVRO_CAIXA_ID '
              else viSql := viSql +  ' ORDER BY CENTRO_CUSTO_REGISTRADO, LC.DATA_PAGAMENTO, C.DESCRICAO, LC.LIVRO_CAIXA_ID '
            end;
      end;
    end;
    {$ENDREGION}

    {$REGION 'CarregarDadosCentroCusto'}
    procedure CarregarDadosCentroCusto(vpIndex : Integer);
    begin
      if vpTipo <> 5 then
        exit;

      if vpIndex = 1 then
        viSql := viSql +
                ' , CASE '+
                '   WHEN CR.PERCENTUAL > 0 THEN (CR.PERCENTUAL * LC.VALOR)/100 '+
                ' ELSE LC.VALOR '+
                ' END AS VALOR_REGISTRADO, '+

                ' CASE               '+
                '   WHEN CR.PERCENTUAL > 0 THEN CR.PERCENTUAL '+
                ' ELSE 100 '+
                ' END AS PERCENTUAL_REGISTRADO, '+

                ' CASE '+
                '   WHEN CR.PERCENTUAL > 0 THEN CT.DESCRICAO '+
                ' ELSE  (SELECT CC1.DESCRICAO FROM J_CENTRO_CUSTO CC1 '+
                '        WHERE CC1.CENTRO_CUSTO_ID = LC.CENTRO_CUSTO_ID '+
                '        AND CC1.TIPO_ITEM = ''1'') '+
                ' END AS CENTRO_CUSTO_REGISTRADO '
        else
          viSql := viSql +
                  ' LEFT OUTER JOIN J_CENTRO_RATEIO CR ON '+
                  ' CR.LIVRO_CAIXA_ID = LC.LIVRO_CAIXA_ID '+
                  ' LEFT OUTER JOIN J_CENTRO_CUSTO CT ON '+
                  ' CT.CENTRO_CUSTO_ID = CR.CENTRO_CUSTO_ID ';
    end;
    {$ENDREGION}

  begin
    CarregarDadosPrincipal(1);
    CarregarDadosCentroCusto(1);
    CarregarDadosPrincipal(2);
    CarregarDadosCentroCusto(2);
    CarregarDadosPrincipal(3);
  end;
  {$ENDREGION}

  {$REGION 'PreencherDadosRelatorio'}
  procedure PreencherDadosRelatorio(vpModelo : Integer; vpParametro : string;
       vpSqlRelatorio : TSimpleDataSet);
   begin
     case vpModelo of
       1,4 : PreencherDadosSintetico;
       2   : PreencherDadosAnalitico;
       3,5 : PreencherDadosDiarios(vpModelo);
       6   : PreencherDadosConciliacaoBancaria;
       7   : PreencherDadosFaturamentoDetalhado;
      end;

     vpSqlRelatorio.Active := False;
     vpSqlRelatorio.DataSet.CommandText := viSql;
     vpSqlRelatorio.Active := True;
     viRelatorioId := dtmControles.BuscarConfig('FINANCEIRO', 'RELATORIO',vpParametro, 'S');
   end;
   {$ENDREGION}

  {$REGION 'VerificarCondicao'}
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

     if icxIR.ItemIndex > 0 then
     begin
       if icxIR.EditValue = 'S' then
            viCondicao := viCondicao+ ' AND LC.IR = '+ QuotedStr(icxIR.EditValue)
       else viCondicao := viCondicao+ ' AND (LC.IR <> '+QuotedStr('S')+' OR LC.IR IS NULL)';
     end;

     if icxCNJ.ItemIndex > 0 then
     begin
       if icxCNJ.EditValue = 'N' then
            viCondicao := viCondicao+ ' AND (LC.CNJ <> '+QuotedStr('S')+' OR LC.CNJ IS NULL)'
       else viCondicao := viCondicao+ ' AND LC.CNJ = '+ QuotedStr(icxCNJ.EditValue);
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

     if lcxCentroCusto.Text <> '' then
       viCondicao := viCondicao+ ' AND LC.CENTRO_CUSTO_ID = '+ IntToStr(lcxCentroCusto.EditValue);


     if pgcPeriodo.ActivePageIndex = 1 then
          viCondicao := viCondicao + ' AND LC.DATA_PAGAMENTO '+ MontarSqlData(edtDataInicial.Date , edtDataFinal.Date)
     else viCondicao := viCondicao + ' AND (LC.ANO_MES_REGISTRO >= '+TrocarAnoMes(edtMesAnoContaInicial.EditValue)+
                                     ' AND LC.ANO_MES_REGISTRO <= '+TrocarAnoMes(edtMesAnoContaFinal.EditValue)+')';
  end;
  {$ENDREGION}

begin
  inherited;

  VerificarCondicao;

  case StrToInt(imgTipoRelatorio.EditValue) of
    1 : PreencherDadosRelatorio(1,'FINANCEIRO_SINTETICO', sqlRelatorioSimplificado);
    2 : PreencherDadosRelatorio(2,'FINANCEIRO_ANALITICO', sqlRelatorioAnalitico);
    3 : PreencherDadosRelatorio(3,'FINANCEIRO_DIARIO', sqlRelatorioDiario);
    4 : PreencherDadosRelatorio(4,'FINANCEIRO_SINTETICO', sqlRelatorioSimplificado);
    5 : PreencherDadosRelatorio(5,'FINANCEIRO_CENTRO_CUSTO', sqlRelatorioCentroCusto);
    6 : PreencherDadosRelatorio(6,'FINANCEIRO_CONCILIACAO_BANCARIA', sqlConciliacaoBancaria);
    7 : PreencherDadosRelatorio(7,'FINANCEIRO_FATURAMENTO_DETALHADO', sqlFaturamentoDetalhado);
  end;

  btnRelatorio.Enabled := False;
  dtmLookupContabil.CarregarCabecalho(vgTabBalancete[tabBalancete.TabIndex]);
  ExibirRelatorio(frxReport1, viRelatorioId, ParametrosRelatorioBalancete, True, frxReport1.PrintOptions.Printer);
  btnRelatorio.Enabled := True;
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

  viSql := ' SELECT CC.CONTABIL_CONTA_ID, CC.DESCRICAO, CC.IR, CC.CNJ '+
           ' FROM J_CONTABIL_CONTA CC LEFT OUTER JOIN J_CONTABIL_GRUPO CG ON '+
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

procedure TfrmCadRelatorioFinanceiro.cxButton1Click(Sender: TObject);
begin
  inherited;
  lcxCentroCusto.Clear;
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
    icxIR.EditValue           := ProximoValor;
    icxCNJ.EditValue          := ProximoValor;
    icxCNJ.EditValue          := ProximoValor;
    lcxGrupoContabil.EditValue:= ProximoValor(True);
    cbxGrupoPlano.EditValue   := ProximoValor;
    lcxCompromisso.EditValue  := ProximoValor(True);
    lcxFavorecido.EditValue   := ProximoValor(True);
    edtHistorico.Text         := ProximoValor;
    cbxOrdenacao.EditValue    := ProximoValor;
    lcxCentroCusto.EditValue  := ProximoValor(True);

    viValor := ProximoValor;
    if viValor = '1' then
         rdbCrescente.Checked   := True
    else rdbDeCrescente.Checked := True;

    viValor := ProximoValor;
    imgTipoRelatorio.EditValue := viValor[1];
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
  btnLimparClick(Self);
  imgTipoRelatorioPropertiesChange(self);
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

  vlCriandoForm := True;
  sqlRelatorioAnalitico.Connection     := dtmControles.DB;
  sqlRelatorioSimplificado.Connection  := dtmControles.DB;
  sqlRelatorioDiario.Connection        := dtmControles.DB;
  sqlGrupoContabil.Connection          := dtmControles.DB;
  sqlPlanoContas.Connection            := dtmControles.DB;
  sqlRelatorioCentroCusto.Connection   := dtmControles.DB;
  sqlConciliacaoBancaria.Connection    := dtmControles.DB;
  sqlFaturamentoDetalhado.Connection   := dtmControles.DB;
  icxTipoCaixa.EditValue := '0';

  dtmLookupContabil.CarregarTabBalancete(tabBalancete);
  dtmLookupContabil.CarregarSaldoCaixa(ClientCaixa, True);
end;

function TfrmCadRelatorioFinanceiro.frxReport1UserFunction(
  const MethodName: string; var Params: Variant): Variant;
begin
  inherited;
  if AnsiSameText(MethodName, 'CalcularSaldoCaixa') then
       Result := dtmLookupContabil.CalcularSaldoCaixa(Params[0],Params[1])
  else Result := ExecutarFuncoesRelatorio(MethodName, Params);
end;

procedure TfrmCadRelatorioFinanceiro.HabilitarCampos(vpHabilitado: Boolean);
begin
  tabOrganizacao.TabVisible := vpHabilitado;
  tabOrdenacao.TabVisible   := not vpHabilitado;

  if vpHabilitado then
       pgcOrdenacao.ActivePage := tabOrganizacao
  else pgcOrdenacao.ActivePage := tabOrdenacao;

  cbxOrganizar.Enabled := imgTipoRelatorio.EditValue = '2';
  if not cbxOrganizar.Enabled then
    cbxOrganizar.ItemIndex := 0;
end;

procedure TfrmCadRelatorioFinanceiro.icxOperacaoPropertiesChange(
  Sender: TObject);
begin
  inherited;
  if vlCriandoForm then
    exit;
  tabBalanceteChange(self);
end;

procedure TfrmCadRelatorioFinanceiro.imgTipoRelatorioPropertiesChange(
  Sender: TObject);
var
  viQtdConciliacao : Integer;

  procedure VerificarConciliacao(vpMensagem : string);
  begin
    Application.MessageBox(Pchar(vpMensagem),'Aviso', MB_OK + MB_ICONINFORMATION);
    imgTipoRelatorio.ItemIndex := 0;
    lcbConta.SetFocus;
    abort;
  end;

begin
  inherited;
  case StrToInt(imgTipoRelatorio.EditValue) of
    1 : HabilitarCampos(True);
    2 : HabilitarCampos(True);
    3,7 : begin
          HabilitarCampos(True);
          pgcPeriodo.ActivePageIndex := 1;
        end;
    4 : HabilitarCampos(False);
    5 : HabilitarCampos(True);
    6 : begin
          if lcbConta.ItemIndex = 0 then
            VerificarConciliacao('Selecione o Caixa que deseja o Relat�rio da Concilia��o!!!')
          else
          begin
            viQtdConciliacao := dtmControles.GetInt(' select count(conciliacao_id) from j_conciliacao where caixa_id = '+IntToStr(lcbConta.EditValue));
            if viQtdConciliacao = 0 then
              VerificarConciliacao('O Caixa selecionado n�o possui concilia��o!!!')
          end;

          HabilitarCampos(True);
          pgcPeriodo.ActivePageIndex := 1;
        end;

  end;
end;

procedure TfrmCadRelatorioFinanceiro.lcbContaPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  icxTipoCaixa.Enabled      := lcbConta.ItemIndex = 0;
  chxSomarExcluidos.Enabled := lcbConta.ItemIndex = 0;
  if lcbConta.ItemIndex > 0 then
  begin
    icxTipoCaixa.EditValue := 0;
    chxSomarExcluidos.Checked := False;
  end;
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
  viPeriodo, viCaixa, viDataInicial, viDataFinal : String;

  procedure CalcularSaldos;
  begin
    viSaldo := dtmLookupContabil.CalcularSaldoCaixa(viCaixa, dtmLookupContabil.PegarDataFinalMes(dtmLookupContabil.DeclementarAnoMes(TrocarAnoMes(edtMesAnoContaInicial.EditValue),1)));
    frxReport1.Variables.Variables['SALDO_ANTERIOR'] := viSaldo;

    viSaldo := dtmLookupContabil.CalcularSaldoCaixa(viCaixa, dtmLookupContabil.PegarDataFinalMes(TrocarAnoMes(edtMesAnoContaInicial.EditValue)));
    frxReport1.Variables.Variables['SALDO_ATUAL'] := viSaldo;

    viDataInicial := '01/'+Copy(edtMesAnoContaInicial.text,1,2)+'/'+Copy(edtMesAnoContaInicial.text,3,4);
    viDataFinal   := dtmLookupContabil.PegarDataFinalMes(TrocarAnoMes(edtMesAnoContaInicial.EditValue));

    viSaldo  := dtmLookupContabil.PrepararSqlSoma(viCaixa, 'D', '', chxSomarExcluidos.Checked, viDataFinal,'',viDataInicial);
    frxReport1.Variables.Variables['DESPESAS'] := viSaldo;

    viSaldo  := dtmLookupContabil.PrepararSqlSoma(viCaixa, 'R', '', chxSomarExcluidos.Checked, viDataFinal,'',viDataInicial);
    frxReport1.Variables.Variables['RECEITAS'] := viSaldo;

    viSaldo  := dtmLookupContabil.PrepararSqlSoma(viCaixa, 'AR', '', chxSomarExcluidos.Checked, viDataFinal,'',viDataInicial);
    frxReport1.Variables.Variables['ENTRADAS'] := viSaldo;

    viSaldo  := dtmLookupContabil.PrepararSqlSoma(viCaixa, 'AD', '', chxSomarExcluidos.Checked, viDataFinal,'',viDataInicial);
    frxReport1.Variables.Variables['SAIDAS'] := viSaldo;
  end;

begin
  CriarFuncoesRelatorio(frxReport1);
  frxReport1.AddFunction('function CalcularSaldoCaixa(vpCaixaId : String; vpDataFinal : string = ''):Currency', 'I9vare', 'Retornar Saldo Caixa');

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
  frxReport1.Variables.Variables['vgIR']              := QuotedStr(icxIR.EditValue);
  frxReport1.Variables.Variables['vgCNJ']             := QuotedStr(icxCNJ.EditValue);
  frxReport1.Variables.Variables['vgGrupoContabil']   := QuotedStr(lcxGrupoContabil.Text);
  frxReport1.Variables.Variables['vgGrupoPlano']      := QuotedStr(cbxGrupoPlano.Text);
  frxReport1.Variables.Variables['vgCompromisso']     := QuotedStr(lcxCompromisso.Text);
  frxReport1.Variables.Variables['vgFavorecido']      := QuotedStr(lcxFavorecido.Text);
  frxReport1.Variables.Variables['vgHistorico']       := QuotedStr(edtHistorico.Text);
  frxReport1.Variables.Variables['vgTipoCaixa']       := QuotedStr(icxTipoCaixa.Text);

  if pgcPeriodo.ActivePageIndex = 0 then
  begin
    viCaixa := '';
    if lcbConta.EditValue > 0 then
      viCaixa := IntToStr(lcbConta.EditValue);

    CalcularSaldos;
  end;

  if imgTipoRelatorio.EditValue = '4' then
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
    if imgTipoRelatorio.EditValue = '3' then
      imgTipoRelatorio.EditValue := '2';
  end
  else edtDataInicial.SetFocus;
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
           ' FROM J_CONTABIL_GRUPO '+
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
