unit Movimentacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, Menus, cxLookAndFeelPainters, dxSkinscxPCPainter,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  DB, cxDBData, cxTextEdit, cxCurrencyEdit, cxImageComboBox, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxGroupBox, StdCtrls, cxRadioGroup,
  cxCheckBox, cxMaskEdit, cxDropDownEdit, cxCalendar, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxPC, cxButtons, ExtCtrls,
  cxContainer, cxLabel, DBClient, SimpleDS, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSCore, dxPScxCommon, cxCheckComboBox, cxLookAndFeels,
  dxSkinBlueprint, dxSkinDarkRoom, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinHighContrast, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013White, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSpringTime,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxPCdxBarPopupMenu,
  ComCtrls, dxCore, cxDateUtils, cxNavigator, dxSkinDevExpressDarkStyle,
  dxBarBuiltInMenu, frxClass, DbxDevartInterBase;

type
  TfrmMovimentacao = class(TForm)
    Panel2: TPanel;
    Bevel4: TBevel;
    lblInformacaoLancamento: TcxLabel;
    Panel4: TPanel;
    imgReceber: TImage;
    PanelBotaoFechar: TPanel;
    pgcPesquisa: TcxPageControl;
    tabGerenciador: TcxTabSheet;
    Panel9: TPanel;
    lblSituacao: TcxLabel;
    lblDataIni: TcxLabel;
    lblDataFim: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel8: TcxLabel;
    lblDocumento: TcxLabel;
    cxLabel2: TcxLabel;
    lblDescricao: TcxLabel;
    rdbEntradas: TcxRadioButton;
    rdbSaidas: TcxRadioButton;
    chxAgruparBalancete: TcxCheckBox;
    chxAgruparCentroCustos: TcxCheckBox;
    chxAgruparCompromisso: TcxCheckBox;
    chxAgruparReferencia: TcxCheckBox;
    chxAgruparPessoa: TcxCheckBox;
    pgcGrid: TcxPageControl;
    tabentradas: TcxTabSheet;
    tabSaidas: TcxTabSheet;
    cxGridSaidas: TcxGrid;
    cxGridDBTableSaidas: TcxGridDBTableView;
    cxGridDBTableSaidasCompromisso: TcxGridDBColumn;
    cxGridDBTableSaidasBalancete: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBTableSaidasReferencia: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBTableSaidasCentroCusto: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGridEntradas: TcxGrid;
    cxGridDBTableEntradas: TcxGridDBTableView;
    cxGridDBTableEntradasNome: TcxGridDBColumn;
    cxGridDBTableEntradasColumn2: TcxGridDBColumn;
    cxGridDBTableEntradasCompromisso: TcxGridDBColumn;
    cxGridDBTableEntradasBalancete: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridDBColumn13: TcxGridDBColumn;
    cxGridDBColumn14: TcxGridDBColumn;
    cxGridDBColumn15: TcxGridDBColumn;
    cxGridDBColumn16: TcxGridDBColumn;
    cxGridDBTableEntradasReferencia: TcxGridDBColumn;
    cxGridDBColumn18: TcxGridDBColumn;
    cxGridDBColumn19: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    sqlPesquisa1: TSimpleDataSet;
    sqlPesquisa1calc_referencia: TStringField;
    sqlPesquisa1calc_Descricao: TStringField;
    dtsPesquisa1: TDataSource;
    sqlPesquisa1SITUACAO: TStringField;
    sqlPesquisa1LANCAMENTO_COMPROMISSO_ID: TFMTBCDField;
    sqlPesquisa1COMPROMISSO_VENCIDO_ID: TFMTBCDField;
    sqlPesquisa1PESSOA_ID: TFMTBCDField;
    sqlPesquisa1CONTABIL_CONTA_ID: TFMTBCDField;
    sqlPesquisa1VALOR_ATUAL: TFMTBCDField;
    sqlPesquisa1BOLETA_ID: TFMTBCDField;
    sqlPesquisa1DIFERENCA: TStringField;
    sqlPesquisa1VALOR_ORIGEM: TFMTBCDField;
    sqlPesquisa1QTD_ADICIONAL: TFMTBCDField;
    sqlPesquisa1ATUALIZADO: TStringField;
    sqlPesquisa1DATA_REALIZACAO: TSQLTimeStampField;
    sqlPesquisa1BALANCETE_GRUPO_ID: TFMTBCDField;
    sqlPesquisa1ANO_MES_REFERENCIA: TStringField;
    sqlPesquisa1PESSOA_NOME: TStringField;
    sqlPesquisa1SAIDA_NUMERO: TFMTBCDField;
    sqlPesquisa1SAIDA_TIPO: TStringField;
    sqlPesquisa1DESCRICAO: TStringField;
    sqlPesquisa1CENTRO_CUSTO_ID: TFMTBCDField;
    sqlPesquisa1PESSOA_CPF: TStringField;
    sqlPesquisa1PESSOA_RG: TStringField;
    sqlPesquisa1calc_TipoDocumento: TStringField;
    sqlPesquisa1calc_NumeroDocumento: TStringField;
    sqlPesquisa1calc_NaoAssociado: TBooleanField;
    sqlPesquisa1RECIBO_NUMERO: TFMTBCDField;
    sqlPesquisa1SAIDA_PESSOA_ID: TFMTBCDField;
    sqlPesquisa1ANO_MES_REALIZADO: TStringField;
    sqlPesquisa1SAIDA_DOCUMENTO: TStringField;
    cxGridDBTableEntradasCentroCusto: TcxGridDBColumn;
    chxTaxaBoleto: TcxCheckBox;
    lblPesquisaDiaAtual: TcxLabel;
    cxGridDBTableSaidasColumn1: TcxGridDBColumn;
    cxGridDBTableSaidasNome: TcxGridDBColumn;
    tabPendenteQuitado: TcxTabSheet;
    Panel3: TPanel;
    cxLabel1: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel7: TcxLabel;
    chxAgrupar1Compromisso: TcxCheckBox;
    chxAgrupar1Referencia: TcxCheckBox;
    cbxPesquisaCompromisso: TcxCheckComboBox;
    sqlPesquisaDetalhada: TSimpleDataSet;
    dtsPesquisaDetalhada: TDataSource;
    sqlPesquisaDetalhadaCONTABIL_CONTA_ID: TFMTBCDField;
    sqlPesquisaDetalhadaCENTRO_CUSTO_ID: TFMTBCDField;
    sqlPesquisaDetalhadaBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlPesquisaDetalhadaVALOR_ATUAL: TFMTBCDField;
    sqlPesquisaDetalhadaANO_MES_REFERENCIA: TStringField;
    pgcPendencia: TcxPageControl;
    tabPendenciaDetalhada: TcxTabSheet;
    tabPendenciaTotal: TcxTabSheet;
    cxGridPendenciaDetalhada: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBNome: TcxGridDBColumn;
    cxGridDBCompromisso: TcxGridDBColumn;
    cxGridDBReferencia: TcxGridDBColumn;
    cxGridDBColumn20: TcxGridDBColumn;
    cxGridDBBalancete: TcxGridDBColumn;
    cxGridDBCentroCusto: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    cxGridPendenciaSoma: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn21: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    sqlPesquisaPendenciaSoma: TSimpleDataSet;
    dtsPesquisaPendenciaSoma: TDataSource;
    sqlPesquisaPendenciaSomaVALOR_TOTAL: TFMTBCDField;
    chxAgrupar1CentroCustos: TcxCheckBox;
    chxAgrupar1Balancete: TcxCheckBox;
    sqlPesquisaPendenciaSomaNOME: TStringField;
    sqlPesquisaDetalhadaNOME: TStringField;
    sqlPesquisaQuitado: TSimpleDataSet;
    dtsPesquisaQuitado: TDataSource;
    sqlPesquisaQuitadoNOME: TStringField;
    lblJuntarDados1: TcxLabel;
    lblExpandirDados1: TcxLabel;
    lblExpandirDados: TcxLabel;
    lblJuntarDados: TcxLabel;
    tabQuitado: TcxTabSheet;
    lblResultadoPesquisa: TcxLabel;
    cxGridQuitados: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridLevel4: TcxGridLevel;
    cxGridDBTableSaidasColumn2: TcxGridDBColumn;
    icxPesqSituacao: TcxImageComboBox;
    edtPesqDataIni: TcxDateEdit;
    edtPesqDataFim: TcxDateEdit;
    cxGroupBox1: TcxGroupBox;
    icxPesqTipoDocumento: TcxImageComboBox;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    edtPesqNumero: TcxTextEdit;
    edtPesqPessoa: TcxTextEdit;
    lcxPesqCompromisso: TcxLookupComboBox;
    edtPesqReferencia: TcxMaskEdit;
    edtPesqDescricao: TcxTextEdit;
    edtPesqDocumento: TcxTextEdit;
    ClientPesquisaDetalhada: TClientDataSet;
    ClientPesquisaDetalhadaCONTABIL_CONTA_ID: TFMTBCDField;
    ClientPesquisaDetalhadaCENTRO_CUSTO_ID: TFMTBCDField;
    ClientPesquisaDetalhadaBALANCETE_GRUPO_ID: TFMTBCDField;
    ClientPesquisaDetalhadaVALOR_ATUAL: TFMTBCDField;
    ClientPesquisaDetalhadacalc_referencia: TStringField;
    ClientPesquisaDetalhadaANO_MES_REFERENCIA: TStringField;
    ClientPesquisaDetalhadaNOME: TStringField;
    chxSelecaoMultipla: TcxCheckBox;
    popExportacao: TPopupMenu;
    ExportalExcel1: TMenuItem;
    btnPesquisar: TcxButton;
    btnLimpar: TcxButton;
    cxBtnFechar: TcxButton;
    cbxCompromisso: TcxCheckComboBox;
    icxPeriodo: TcxImageComboBox;
    cbxReferenciaFinal: TcxComboBox;
    btnPesquisarAssociado: TcxButton;
    btnLimparAssociado: TcxButton;
    cxTabSheet1: TcxTabSheet;
    Panel1: TPanel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxCompAgendados: TcxCheckComboBox;
    lcxPesqGrupo: TcxLookupComboBox;
    icxPesqGrau: TcxImageComboBox;
    btnPesquisaAgendados: TcxButton;
    cxButton3: TcxButton;
    gdrCompromissoAgendado: TcxGrid;
    cxGridDBTableView4: TcxGridDBTableView;
    cxGridDBTableView2Column5: TcxGridDBColumn;
    cxGridDBTableView2Column1: TcxGridDBColumn;
    cxGridDBTableValor: TcxGridDBColumn;
    cxGridDBTableView2Column6: TcxGridDBColumn;
    cxGridDBTableView2Column2: TcxGridDBColumn;
    cxGridDBTableView2Column3: TcxGridDBColumn;
    cxGridLevel6: TcxGridLevel;
    cxGridDBTableViewCaNome: TcxGridDBColumn;
    cxGridDBTableViewCaGrupo: TcxGridDBColumn;
    sqlCompromissoAgendado: TSimpleDataSet;
    dtsCompromissoAgendado: TDataSource;
    sqlCompromissoAgendadoNOME: TStringField;
    sqlCompromissoAgendadoGRUPO: TStringField;
    sqlCompromissoAgendadoGRAU: TStringField;
    sqlCompromissoAgendadoPLANO_CONTA: TStringField;
    sqlCompromissoAgendadoVALOR_ATUAL: TFMTBCDField;
    sqlCompromissoAgendadoPERIODO: TStringField;
    sqlCompromissoAgendadoANO_MES_INICIAL: TStringField;
    sqlCompromissoAgendadoANO_MES_FINAL: TStringField;
    sqlCompromissoAgendadoCONTABIL_CONTA_ID: TFMTBCDField;
    sqlCompromissoAgendadocalc_AnoMesFinal: TStringField;
    sqlCompromissoAgendadocalc_AnoMesInicial: TStringField;
    sqlCompromissoAgendadoCALC_VALOR: TCurrencyField;
    sqlCompromissoAgendadoSITUACAO_LOCAL: TStringField;
    sqlCompromissoAgendadoSITUACAO_GERAL: TStringField;
    chxAgrupar1Pessoa: TcxCheckBox;
    chxCaAgruparGrupo: TcxCheckBox;
    chxCaAgruparNome: TcxCheckBox;
    btnImprimir: TcxButton;
    dtsAssociados: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxBtnFecharClick(Sender: TObject);
    procedure rdbEntradasClick(Sender: TObject);
    procedure rdbSaidasClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sqlPesquisa1CalcFields(DataSet: TDataSet);
    procedure icxPesqSituacaoPropertiesEditValueChanged(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure edtPesqNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure edtPesqReferenciaKeyPress(Sender: TObject; var Key: Char);
    procedure edtPesqDataFimKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chxAgruparBalanceteClick(Sender: TObject);
    procedure chxAgruparCentroCustosClick(Sender: TObject);
    procedure chxAgruparCompromissoClick(Sender: TObject);
    procedure chxAgruparReferenciaClick(Sender: TObject);
    procedure chxAgruparPessoaClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure pgcPesquisaChange(Sender: TObject);
    procedure btnPesquisarAssociadoClick(Sender: TObject);
    procedure btnLimparAssociadoClick(Sender: TObject);
    procedure lblExpandirDados1Click(Sender: TObject);
    procedure lblJuntarDados1Click(Sender: TObject);
    procedure lblJuntarDadosClick(Sender: TObject);
    procedure lblExpandirDadosClick(Sender: TObject);
    procedure chxAgrupar1PessoaClick(Sender: TObject);
    procedure chxAgrupar1CompromissoClick(Sender: TObject);
    procedure chxAgrupar1ReferenciaClick(Sender: TObject);
    procedure chxAgrupar1BalanceteClick(Sender: TObject);
    procedure chxAgrupar1CentroCustosClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure ClientPesquisaDetalhadaCalcFields(DataSet: TDataSet);
    procedure chxSelecaoMultiplaClick(Sender: TObject);
    procedure ExportalExcel1Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure btnPesquisaAgendadosClick(Sender: TObject);
    procedure sqlCompromissoAgendadoCalcFields(DataSet: TDataSet);
    procedure chxCaAgruparGrupoClick(Sender: TObject);
    procedure chxCaAgruparNomeClick(Sender: TObject);
  private
    vlTaxaBoleto, vlTaxaCompromisso : String;
    vlCompromissoIndice : array[1..20] of String;
    procedure VerificarOrdemAgrupamento;
    procedure VerificarOrdemAgrupamento1;
    procedure CarregarCompromissoVencidoAgendado(vpLista : TcxCheckComboBox; vpVencido : Boolean);
  public
    { Public declarations }
  end;

var
  frmMovimentacao: TfrmMovimentacao;

implementation

uses Lookup, Controles, Rotinas, TituloRelatorio, Lookup_Contabil;

{$R *.dfm}

procedure TfrmMovimentacao.btnImprimirClick(Sender: TObject);
begin
  ExibirFormulario(TfrmTituloRelatorio, frmTituloRelatorio, True);
  if vgRelatorioImprimir then
  begin
    if pgcPesquisa.ActivePageIndex = 0 then
    begin
      if rdbEntradas.Checked then
           dtmLookup.dxComponentPrinter.CurrentLink.Component := cxGridEntradas
      else dtmLookup.dxComponentPrinter.CurrentLink.Component := cxGridSaidas;
    end
    else
      if pgcPesquisa.ActivePageIndex = 1 then
      begin
        case pgcPendencia.ActivePageIndex of
         0 : dtmLookup.dxComponentPrinter.CurrentLink.Component := cxGridPendenciaDetalhada;
         1 : dtmLookup.dxComponentPrinter.CurrentLink.Component := cxGridPendenciaSoma;
         2 : dtmLookup.dxComponentPrinter.CurrentLink.Component := cxGridQuitados;
        end
      end
    else dtmLookup.dxComponentPrinter.CurrentLink.Component := gdrCompromissoAgendado;
    dtmLookup.dxComponentPrinterLink.Preview;
  end;
end;

procedure TfrmMovimentacao.btnLimparAssociadoClick(Sender: TObject);
begin
  cbxCompromisso.EditValue      := '';
  icxPeriodo.EditValue          := '1';
  cbxReferenciaFinal.EditValue  := vgPeriodoAtualS;

  sqlPesquisaDetalhada.Active     := False; 
  sqlPesquisaPendenciaSoma.Active := False;   
  sqlPesquisaQuitado.Active       := False; 

  chxAgrupar1Balancete.Checked    := False; 
  chxAgrupar1Compromisso.Checked  := False; 
  chxAgrupar1CentroCustos.Checked := False; 
  chxAgrupar1Pessoa.Checked       := True; 
  chxAgrupar1Referencia.Checked   := False;         
  
  cxGridDBTableView1.DataController.Filter.Root.Clear;    
  VerificarOrdemAgrupamento1;
  lblResultadoPesquisa.Caption := 'Resultado da Pesquisa';
end;

procedure TfrmMovimentacao.btnLimparClick(Sender: TObject);
begin
  edtPesqDataIni.Clear;
  edtPesqDataFim.Clear;
  icxPesqSituacao.EditValue := '2';
  icxPesqSituacaoPropertiesEditValueChanged(self);

  edtPesqReferencia.Clear;
  edtPesqNumero.Clear;
  edtPesqPessoa.Clear;
  edtPesqDescricao.Clear;
  edtPesqDocumento.Clear;
  lcxPesqCompromisso.EditValue := null;

  chxAgruparBalancete.Checked    := True; 
  chxAgruparCompromisso.Checked  := False; 
  chxAgruparCentroCustos.Checked := False; 
  chxAgruparPessoa.Checked       := False; 
  chxAgruparReferencia.Checked   := False;         
  
  if rdbEntradas.Checked then
       rdbEntradasClick(self)
  else rdbSaidasClick(Self);

  chxAgruparBalancete.Checked := True;
  VerificarOrdemAgrupamento;  
end;

procedure TfrmMovimentacao.btnPesquisaAgendadosClick(Sender: TObject);
var
  viSql : string;
begin
  viSql := ' SELECT P.NOME, PG.DESCRICAO AS GRUPO, P.GRAU, '+
           '        CC.DESCRICAO AS PLANO_CONTA, '+
           '        CA.VALOR_ATUAL,CA.PERIODO, '+
           '        CA.SITUACAO_LOCAL, CA.SITUACAO_GERAL, '+
           '        CA.ANO_MES_INICIAL, ANO_MES_FINAL, '+
           '        CA.CONTABIL_CONTA_ID '+
           ' FROM T_PESSOA P '+
           '   LEFT OUTER JOIN T_PESSOA_GRUPO PG ON '+
           '   P.PESSOA_GRUPO_ID = PG.PESSOA_GRUPO_ID '+
           '   LEFT OUTER JOIN T_COMPROMISSO_AGENDADO CA ON '+
           '   P.PESSOA_ID = CA.PESSOA_ID '+

           '   LEFT OUTER JOIN T_CONTABIL_CONTA CC ON '+
           '   CA.CONTABIL_CONTA_ID = CC.CONTABIL_CONTA_ID '+
           ' WHERE P.SITUACAO = ''1'''+
           '   AND CA.SITUACAO_LOCAL = ''1'''+
           '   AND CA.SITUACAO_GERAL = ''1''';

  if lcxPesqGrupo.Text <> '' then
    viSql := viSql + ' AND P.PESSOA_GRUPO_ID = '+ IntToStr(lcxPesqGrupo.EditValue);

  if icxPesqGrau.EditValue <> '-1' then
    viSql := viSql + ' AND P.GRAU = '+ IntToStr(icxPesqGrau.EditValue);

  if cxCompAgendados.EditValue <> '' then
  begin
    cbxPesquisaCompromisso.EditValue := cxCompAgendados.EditValue;
    viSql := viSql + ' AND CA.CONTABIL_CONTA_ID IN ('+cbxPesquisaCompromisso.Text+')';
  end;

  viSql := viSql + ' ORDER BY GRUPO, NOME ';

  sqlCompromissoAgendado.Active := False;
  sqlCompromissoAgendado.DataSet.CommandText := viSql;
  sqlCompromissoAgendado.Active := True;
end;

procedure TfrmMovimentacao.btnPesquisarAssociadoClick(Sender: TObject);
var
  viSql, viSql2, viCondicao1, viMesLimite, viListaPessoasDebito : string;

  procedure PreencherCompromissosDetalhados;
  begin
    while not sqlPesquisaDetalhada.Eof do
    begin
      ClientPesquisaDetalhada.Append;
      ClientPesquisaDetalhadaCONTABIL_CONTA_ID.AsVariant  := sqlPesquisaDetalhadaCONTABIL_CONTA_ID.AsVariant;
      ClientPesquisaDetalhadaCENTRO_CUSTO_ID.AsVariant    := sqlPesquisaDetalhadaCENTRO_CUSTO_ID.AsVariant;
      ClientPesquisaDetalhadaBALANCETE_GRUPO_ID.AsVariant := sqlPesquisaDetalhadaBALANCETE_GRUPO_ID.AsVariant;
      ClientPesquisaDetalhadaVALOR_ATUAL.AsVariant        := sqlPesquisaDetalhadaVALOR_ATUAL.AsVariant;
      ClientPesquisaDetalhadaANO_MES_REFERENCIA.AsVariant := sqlPesquisaDetalhadaANO_MES_REFERENCIA.AsVariant;
      ClientPesquisaDetalhadaNOME.AsVariant               := sqlPesquisaDetalhadaNOME.AsVariant;
      ClientPesquisaDetalhada.Post;
      sqlPesquisaDetalhada.Next;
    end;
  end;

  Function PegarPessoasAtraso:String;
  var
    viCompromissosEncontrado : String;
    viSqlPegar : string;
    viSqlExecutar, viCondicaoExecutar : String;
  begin
    viCompromissosEncontrado := '';


    if cbxCompromisso.EditValue <> '' then
      viSqlPegar := ' SELECT PESSOA_ID, CONTABIL_CONTA_ID '+
                    ' FROM T_COMPROMISSO_VENCIDO '+
                    ' WHERE ANO_MES_REFERENCIA <= '+ QuotedStr(viMesLimite)+
                    '   AND SITUACAO = ''1'''+
                    '   AND CEDENTE_ID = '+ IntToStr(vgCedenteAtivo)
    else
      viSqlPegar := ' SELECT DISTINCT(PESSOA_ID) '+
                    ' FROM T_COMPROMISSO_VENCIDO '+
                    ' WHERE ANO_MES_REFERENCIA <= '+ QuotedStr(viMesLimite)+
                    '   AND SITUACAO = ''1'''+
                    '   AND CEDENTE_ID = '+ IntToStr(vgCedenteAtivo);

    if cbxCompromisso.EditValue <> '' then
    begin
      viSqlPegar := viSqlPegar + ' AND CONTABIL_CONTA_ID IN ('+ cbxPesquisaCompromisso.Text+')'+
                                 ' GROUP BY PESSOA_ID, CONTABIL_CONTA_ID ';
    end;

    ExecutaSimpleDSAux(viSqlPegar,0);

    while not dtmControles.SimpleAuxiliar.eof do
    begin
      viCompromissosEncontrado := '';
      viSqlExecutar            := viSql;
      viCondicaoExecutar       := viCondicao1;

      viSqlPegar := '';
      viSqlPegar := ' SELECT COMPROMISSO_VENCIDO_ID '+
                    ' FROM T_COMPROMISSO_VENCIDO '+
                    ' WHERE ANO_MES_REFERENCIA <= '+ QuotedStr(dtmLookup.FormatarAnoMes(cbxReferenciaFinal.EditValue, 'S'))+
                    '   AND PESSOA_ID = '+ dtmControles.SimpleAuxiliar.FieldByName('PESSOA_ID').AsString+
                    '   AND SITUACAO = ''1'''+
                    '   AND CEDENTE_ID = '+ IntToStr(vgCedenteAtivo);
      if cbxCompromisso.EditValue <> '' then
         viSqlPegar := viSqlPegar + '   AND CONTABIL_CONTA_ID = '+dtmControles.SimpleAuxiliar.FieldByName('CONTABIL_CONTA_ID').AsString;
      ExecutaSqlAuxiliar(viSqlPegar,0);

      while not dtmControles.sqlAuxiliar.eof do
      begin
        viCompromissosEncontrado := viCompromissosEncontrado + ','+ dtmControles.sqlAuxiliar.FieldByName('COMPROMISSO_VENCIDO_ID').AsString;
        dtmControles.sqlAuxiliar.next;
      end;

      if viCompromissosEncontrado <> '' then
        viListaPessoasDebito := viListaPessoasDebito + ','+dtmControles.SimpleAuxiliar.FieldByName('PESSOA_ID').AsString;

      viCondicaoExecutar := viCondicaoExecutar + ' AND CV.COMPROMISSO_VENCIDO_ID IN ('+copy(viCompromissosEncontrado,2,length(viCompromissosEncontrado))+')';
      viSqlExecutar := viSqlExecutar + viCondicaoExecutar + ' ORDER BY P.NOME, CV.CONTABIL_CONTA_ID, CV.ANO_MES_REFERENCIA ';

      sqlPesquisaDetalhada.Active := False;
      sqlPesquisaDetalhada.DataSet.CommandText := viSqlExecutar;
      sqlPesquisaDetalhada.Active := True;

      PreencherCompromissosDetalhados;

      dtmControles.SimpleAuxiliar.next;
    end;

{    if viCompromissosEncontrado = '' then
         Result := '0'
    else Result := copy(viCompromissosEncontrado,2,length(viCompromissosEncontrado));}
  end;

  Procedure AssociadosQuitados;
  begin
    viSql := ' SELECT NOME '+
             ' FROM T_PESSOA '+
             ' WHERE SITUACAO IN (''1'', ''3'') '+
             '   AND CEDENTE_ID = '+ IntToStr(vgCedenteAtivo)+
             '   AND NOT PESSOA_ID IN (SELECT PESSOA_ID FROM T_COMPROMISSO_VENCIDO '+
             '                          WHERE ANO_MES_REFERENCIA <= '+ QuotedStr(dtmLookup.FormatarAnoMes(cbxReferenciaFinal.EditValue, 'S'))+
             '                          AND SITUACAO = ''1'''+
             '                          AND CEDENTE_ID = '+ IntToStr(vgCedenteAtivo);
    if cbxCompromisso.EditValue <> '' then
    begin
      viSql := viSql + ' AND CONTABIL_CONTA_ID IN ('+cbxPesquisaCompromisso.Text+'))';
      tabQuitado.Caption := 'Associados Quitados >> ['+cbxCompromisso.Text +'] até '+ cbxReferenciaFinal.Text;
    end
    else
    begin
      viSql := viSql + ')';
      tabQuitado.Caption := 'Associados Quitados até '+ cbxReferenciaFinal.Text+' >> Todos Compromissos';
    end;

    viSql := viSql + ' ORDER BY NOME ';
    sqlPesquisaQuitado.Active := False;
    sqlPesquisaQuitado.DataSet.CommandText := viSql;
    sqlPesquisaQuitado.Active := True;
  end;

  procedure CarregarCompromissosDetalhados;
  begin
    if icxPeriodo.EditValue = '1' then
      PegarPessoasAtraso
    else
    begin
      viSql := viSql + viCondicao1 + ' ORDER BY P.NOME, CV.CONTABIL_CONTA_ID, CV.ANO_MES_REFERENCIA ';
      sqlPesquisaDetalhada.Active := False;
      sqlPesquisaDetalhada.DataSet.CommandText := viSql;
      sqlPesquisaDetalhada.Active := True;
      PreencherCompromissosDetalhados;
    end;
  end;

begin
  Screen.Cursor := crHourGlass;

  viMesLimite := dtmLookup.DeclementarAnoMes(dtmLookup.FormatarAnoMes(cbxReferenciaFinal.EditValue, 'S'),2);

  viSql := ' SELECT CV.CONTABIL_CONTA_ID, P.NOME, CV.CENTRO_CUSTO_ID, '+
           '        CV.BALANCETE_GRUPO_ID, CV.VALOR_ATUAL, CV.ANO_MES_REFERENCIA '+
           ' FROM T_COMPROMISSO_VENCIDO CV LEFT OUTER JOIN T_PESSOA P '+
           '    ON CV.PESSOA_ID = P.PESSOA_ID '+
           ' WHERE P.SITUACAO IN (''1'',''3'')'+
           '  AND CV.ANO_MES_REFERENCIA <= '+ QuotedStr(dtmLookup.FormatarAnoMes(cbxReferenciaFinal.EditValue, 'S'))+
           '  AND (DETALHADO = '+ QuotedStr('N') + ' OR DETALHADO IS NULL '+')';

  viSql2 := ' SELECT SUM(CV.VALOR_ATUAL) AS VALOR_TOTAL, P.NOME '+
            '  FROM T_COMPROMISSO_VENCIDO CV LEFT OUTER JOIN T_PESSOA P '+
            '    ON CV.PESSOA_ID = P.PESSOA_ID '+
            '  WHERE P.SITUACAO IN (''1'',''3'')' +
            '  AND CV.ANO_MES_REFERENCIA <= '+ QuotedStr(dtmLookup.FormatarAnoMes(cbxReferenciaFinal.EditValue, 'S'))+
            ' AND (DETALHADO = '+ QuotedStr('N') + ' OR DETALHADO IS NULL '+')';

  // Condicoes de compromissos vencidos
  viCondicao1 := ' AND CV.SITUACAO = ''1''';

  if cbxCompromisso.EditValue <> '' then
  begin
    cbxPesquisaCompromisso.EditValue := cbxCompromisso.EditValue;
    viCondicao1 := viCondicao1 + ' AND CV.CONTABIL_CONTA_ID IN ('+cbxPesquisaCompromisso.Text+')'
  end;

  ClientPesquisaDetalhada.EmptyDataSet;
  viListaPessoasDebito := '';

  ClientPesquisaDetalhada.DisableControls;
  CarregarCompromissosDetalhados;
  ClientPesquisaDetalhada.EnableControls;

  if viListaPessoasDebito <> '' then
    viSql2 := viSql2 + ' AND CV.PESSOA_ID IN ('+copy(viListaPessoasDebito,2,length(viListaPessoasDebito))+')';

  viSql2 := viSql2 + viCondicao1 + ' GROUP BY P.NOME ORDER BY P.NOME ';
  sqlPesquisaPendenciaSoma.Active := False;
  sqlPesquisaPendenciaSoma.DataSet.CommandText := viSql2;
  sqlPesquisaPendenciaSoma.Active := True;

  AssociadosQuitados;

  cxGridDBTableView1.DataController.Filter.Root.Clear;
  cxGridDBTableView1.DataController.Groups.FullExpand;
  Screen.Cursor := crDefault;
  lblResultadoPesquisa.Caption := 'Resultado de Pendências >> ['+cbxCompromisso.Text +'] '+icxPeriodo.Text + ' até '+ cbxReferenciaFinal.Text;
end;

procedure TfrmMovimentacao.btnPesquisarClick(Sender: TObject);
var
  viSql, viCondicao, viPessoas, viSituacaoAssociado : String;
begin
  viSql := ' SELECT CV.* '+
           ' FROM T_COMPROMISSO_VENCIDO CV  '+
           ' LEFT OUTER JOIN T_PESSOA P ON' +
           ' CV.PESSOA_ID = P.PESSOA_ID' +
           ' WHERE CV.CEDENTE_ID = '+ IntToStr(vgCedenteAtivo)+
           ' AND (CV.DETALHADO = '+ QuotedStr('N') + ' OR CV.DETALHADO IS NULL '+')';

  if rdbEntradas.Checked then
       viSql := viSql + ' AND CV.TIPO_OPERACAO = ''C'''
  else
    viSql := viSql + ' AND CV.TIPO_OPERACAO = ''D'''+
                     ' AND (CV.CONTABILIZAR <> '+ QuotedStr('N')+')';

  if (icxPesqSituacao.EditValue <> '0') then
    if icxPesqSituacao.EditValue = '4' then
         viSql := viSql + ' AND CV.SITUACAO IN (''1'',''2'')'
    else
    begin
      viSql := viSql + ' AND CV.SITUACAO = '+ QuotedStr(icxPesqSituacao.EditValue);
      if icxPesqSituacao.EditValue = '1' then
        viSql := viSql +' AND P.SITUACAO IN ('+QuotedStr('1')+','+QuotedStr('3')+')';
    end;

  if (not chxTaxaBoleto.Checked) and (vlTaxaBoleto = 'S') and (vlTaxaCompromisso <> '') then
    viSql := viSql + ' AND NOT CV.CONTABIL_CONTA_ID = '+vlTaxaCompromisso;

  viCondicao := '';

  // Data Inicial e Final
  if (edtPesqDataIni.Text <> '') and (edtPesqDataFim.Text <> '') then
    viCondicao := ' AND CV.DATA_REALIZACAO '+ MontarSqlData(edtPesqDataIni.EditValue, edtPesqDataFim.EditValue);

  // Referencia do Compromisso
  if (edtPesqReferencia.Text <> '  /    ') then
    viCondicao := viCondicao + ' AND CV.ANO_MES_REFERENCIA = '+ QuotedStr(dtmLookup.FormatarAnoMes(edtPesqReferencia.EditValue, 'S'));

  // Referencia do Compromisso
  if trim(edtPesqNumero.Text) <> '' then
  begin
    if rdbEntradas.Checked then
    begin
      if icxPesqTipoDocumento.EditValue = '1' then
           viCondicao := viCondicao + ' AND CV.BOLETA_ID = '+ IntToStr(edtPesqNumero.EditValue)
      else viCondicao := viCondicao + ' AND CV.RECIBO_NUMERO  = '+ IntToStr(edtPesqNumero.EditValue);
    end
    else
    begin
      if icxPesqTipoDocumento.EditValue = '2' then
           viCondicao := viCondicao + ' AND CV.SAIDA_NUMERO = '+ IntToStr(edtPesqNumero.EditValue)+
                                      ' AND CV.SAIDA_TIPO = ''R'''
      else viCondicao := viCondicao + ' AND CV.SAIDA_NUMERO = '+ IntToStr(edtPesqNumero.EditValue)+
                                      ' AND CV.SAIDA_TIPO = ''C'''
    end;
  end;

  // Nome do Associado
  if trim(edtPesqPessoa.Text) <> '' then
  begin
    if (icxPesqSituacao.EditValue <> '1') and (icxPesqSituacao.EditValue <> '0') then
      viCondicao := viCondicao + ' AND CV.PESSOA_NOME LIKE '+QuotedStr(trim(edtPesqPessoa.Text)+'%')
    else
    begin
      viPessoas := dtmControles.GetStr('SELECT * FROM D_SP_PESSOA('+ QuotedStr(edtPesqPessoa.Text) + ')');
      Delete(viPessoas, 1, 1);
      if viPessoas <> '' then
        viCondicao := viCondicao + ' AND CV.PESSOA_ID IN (' + viPessoas + ')';
    end;
  end;

  // Compromisso
  if lcxPesqCompromisso.EditValue <> null then
    viCondicao := viCondicao + ' AND CV.CONTABIL_CONTA_ID = '+ IntToStr(lcxPesqCompromisso.EditValue);

  // Descricao
  if trim(edtPesqDescricao.Text) <> '' then
    viCondicao := viCondicao + ' AND CV.DESCRICAO LIKE '+ QuotedStr('%'+trim(edtPesqDescricao.Text)+'%');

  // Documento
  if trim(edtPesqDocumento.Text) <> '' then
    viCondicao := viCondicao + ' AND CV.SAIDA_DOCUMENTO LIKE '+ QuotedStr('%'+trim(edtPesqDocumento.Text)+'%');

  if (viCondicao = '') and (icxPesqSituacao.EditValue <> '1') then
  begin
    viCondicao := ' AND CV.DATA_REALIZACAO '+ MontarSqlData(dtmControles.DataHoraBanco(3), dtmControles.DataHoraBanco(3));
    lblPesquisaDiaAtual.Caption := '<< Pesquisa do Dia Atual >>';
  end
  else lblPesquisaDiaAtual.Caption := '<< Resultado da Pesquisa >>';

  sqlPesquisa1.Active := False;
  if rdbEntradas.Checked then
  begin
    if (icxPesqSituacao.EditValue = '1') OR (icxPesqSituacao.EditValue = '0') then
    begin
      cxGridDBTableEntradasNome.DataBinding.FieldName := 'PESSOA_ID';
      cxGridDBTableEntradasNome.RepositoryItem        := dtmLookup.Lista_Pessoas;
    end
    else
    begin
      cxGridDBTableEntradasNome.DataBinding.FieldName := 'PESSOA_NOME';
      cxGridDBTableEntradasNome.RepositoryItem        := nil;
    end;
  end;

  cxGridDBTableEntradas.DataController.Filter.Root.Clear;
  cxGridDBTableSaidas.DataController.Filter.Root.Clear;

  sqlPesquisa1.DataSet.CommandText := viSql + viCondicao + ' ORDER BY CV.DATA_REALIZACAO DESC, CV.ANO_MES_REFERENCIA, CV.CONTABIL_CONTA_ID ';
  sqlPesquisa1.Active := True;

  cxGridDBTableSaidas.DataController.Groups.FullExpand;
  cxGridDBTableEntradas.DataController.Groups.FullExpand;
end;

procedure TfrmMovimentacao.CarregarCompromissoVencidoAgendado(vpLista : TcxCheckComboBox; vpVencido : Boolean);
begin
  if vpVencido then
    ExecutaSqlAuxiliar(' SELECT DISTINCT(CC.DESCRICAO), CC.CONTABIL_CONTA_ID '+
                       ' FROM T_COMPROMISSO_VENCIDO CV LEFT OUTER JOIN T_CONTABIL_CONTA CC ON '+
                       '   CV.CONTABIL_CONTA_ID = CC.CONTABIL_CONTA_ID '+
                       ' WHERE CV.SITUACAO = ''1'''+
                       ' ORDER BY CC.DESCRICAO',0)
  else
    ExecutaSqlAuxiliar(' SELECT DISTINCT(CC.DESCRICAO), CC.CONTABIL_CONTA_ID '+
                       ' FROM T_COMPROMISSO_AGENDADO CA LEFT OUTER JOIN T_CONTABIL_CONTA CC ON '+
                       '   CV.CONTABIL_CONTA_ID = CC.CONTABIL_CONTA_ID '+
                       ' WHERE CV.SITUACAO_LOCAL = ''1'''+
                       ' ORDER BY CC.DESCRICAO',0);

  vpLista.Properties.Items.Clear;
  cbxPesquisaCompromisso.Properties.Items.Clear;
  while not dtmControles.sqlAuxiliar.Eof do
  begin
    vpLista.Properties.Items.AddCheckItem(dtmControles.sqlAuxiliar.FieldByName('DESCRICAO').AsString,
                                                 dtmControles.sqlAuxiliar.FieldByName('DESCRICAO').AsString);
    cbxPesquisaCompromisso.Properties.Items.AddCheckItem(dtmControles.sqlAuxiliar.FieldByName('CONTABIL_CONTA_ID').AsString,
                                                 dtmControles.sqlAuxiliar.FieldByName('CONTABIL_CONTA_ID').AsString);
    dtmControles.sqlAuxiliar.Next;
  end;
end;

procedure TfrmMovimentacao.chxAgrupar1BalanceteClick(Sender: TObject);
begin
  if chxAgrupar1Balancete.Checked then
       cxGridDBBalancete.GroupIndex := 5
  else cxGridDBBalancete.GroupIndex := -1;
  cxGridDBBalancete.Visible := not chxAgrupar1Balancete.Checked;

  cxGridDBTableView1.DataController.Groups.FullExpand;
  VerificarOrdemAgrupamento1;  
end;

procedure TfrmMovimentacao.chxAgrupar1CentroCustosClick(Sender: TObject);
begin
  if chxAgruparCentroCustos.Checked then
       cxGridDBCentroCusto.GroupIndex := 5
  else cxGridDBCentroCusto.GroupIndex := -1;
  cxGridDBCentroCusto.Visible := not chxAgruparCentroCustos.Checked;

  cxGridDBTableView1.DataController.Groups.FullExpand;
  VerificarOrdemAgrupamento1;  
end;

procedure TfrmMovimentacao.chxAgrupar1CompromissoClick(Sender: TObject);
begin
  if chxAgrupar1Compromisso.Checked then
       cxGridDBCompromisso.GroupIndex := 5
  else cxGridDBCompromisso.GroupIndex := -1;
  cxGridDBCompromisso.Visible := not chxAgrupar1Compromisso.Checked;

  cxGridDBTableView1.DataController.Groups.FullExpand;
  VerificarOrdemAgrupamento1;  
end;

procedure TfrmMovimentacao.chxAgrupar1PessoaClick(Sender: TObject);
begin
  if chxAgrupar1Pessoa.Checked then
       cxGridDBNome.GroupIndex := 5
  else cxGridDBNome.GroupIndex := -1;
  cxGridDBNome.Visible := not chxAgrupar1Pessoa.Checked;

  cxGridDBTableView1.DataController.Groups.FullExpand;
  VerificarOrdemAgrupamento1;
end;

procedure TfrmMovimentacao.chxAgrupar1ReferenciaClick(Sender: TObject);
begin
  if chxAgrupar1Referencia.Checked then
       cxGridDBReferencia.GroupIndex := 5
  else cxGridDBReferencia.GroupIndex := -1;
  cxGridDBReferencia.Visible := not chxAgrupar1Referencia.Checked;

  cxGridDBTableView1.DataController.Groups.FullExpand;
  VerificarOrdemAgrupamento1;  
end;

procedure TfrmMovimentacao.chxAgruparBalanceteClick(Sender: TObject);
begin
  if chxAgruparBalancete.Checked then
       cxGridDBTableEntradasBalancete.GroupIndex := 5
  else cxGridDBTableEntradasBalancete.GroupIndex := -1;
  cxGridDBTableEntradasBalancete.Visible := not chxAgruparBalancete.Checked;

  if chxAgruparBalancete.Checked then
       cxGridDBTableSaidasBalancete.GroupIndex := 5
  else cxGridDBTableSaidasBalancete.GroupIndex := -1;
  cxGridDBTableSaidasBalancete.Visible := not chxAgruparBalancete.Checked;

  cxGridDBTableSaidas.DataController.Groups.FullExpand;
  cxGridDBTableEntradas.DataController.Groups.FullExpand;
  VerificarOrdemAgrupamento;  
end;

procedure TfrmMovimentacao.chxAgruparCentroCustosClick(Sender: TObject);
begin
  if chxAgruparCentroCustos.Checked then
       cxGridDBTableEntradasCentroCusto.GroupIndex := 5
  else cxGridDBTableEntradasCentroCusto.GroupIndex := -1;
  cxGridDBTableEntradasCentroCusto.Visible := not chxAgruparCentroCustos.Checked;

  if chxAgruparCentroCustos.Checked then
       cxGridDBTableSaidasCentroCusto.GroupIndex := 5
  else cxGridDBTableSaidasCentroCusto.GroupIndex := -1;
  cxGridDBTableSaidasCentroCusto.Visible := not chxAgruparCentroCustos.Checked;

  cxGridDBTableSaidas.DataController.Groups.FullExpand;
  cxGridDBTableEntradas.DataController.Groups.FullExpand;
  VerificarOrdemAgrupamento;  
end;

procedure TfrmMovimentacao.chxAgruparCompromissoClick(Sender: TObject);
begin
  if chxAgruparCompromisso.Checked then
       cxGridDBTableEntradasCompromisso.GroupIndex := 5
  else cxGridDBTableEntradasCompromisso.GroupIndex := -1;
  cxGridDBTableEntradasCompromisso.Visible := not chxAgruparCompromisso.Checked;

  if chxAgruparCompromisso.Checked then
       cxGridDBTableSaidasCompromisso.GroupIndex := 5
  else cxGridDBTableSaidasCompromisso.GroupIndex := -1;
  cxGridDBTableSaidasCompromisso.Visible := not chxAgruparCompromisso.Checked;

  cxGridDBTableSaidas.DataController.Groups.FullExpand;
  cxGridDBTableEntradas.DataController.Groups.FullExpand;
  VerificarOrdemAgrupamento;
end;

procedure TfrmMovimentacao.chxAgruparPessoaClick(Sender: TObject);
begin
  if chxAgruparPessoa.Checked then
       cxGridDBTableEntradasNome.GroupIndex := 5
  else cxGridDBTableEntradasNome.GroupIndex := -1;
  cxGridDBTableEntradasNome.Visible := not chxAgruparPessoa.Checked;

  if chxAgruparPessoa.Checked then
       cxGridDBTableSaidasNome.GroupIndex := 5
  else cxGridDBTableSaidasNome.GroupIndex := -1;
  cxGridDBTableSaidasNome.Visible := not chxAgruparPessoa.Checked;

  cxGridDBTableSaidas.DataController.Groups.FullExpand;
  cxGridDBTableEntradas.DataController.Groups.FullExpand;
  VerificarOrdemAgrupamento;
end;

procedure TfrmMovimentacao.chxAgruparReferenciaClick(Sender: TObject);
begin
  if chxAgruparReferencia.Checked then
       cxGridDBTableEntradasReferencia.GroupIndex := 5
  else cxGridDBTableEntradasReferencia.GroupIndex := -1;
  cxGridDBTableEntradasReferencia.Visible := not chxAgruparReferencia.Checked;

  if chxAgruparReferencia.Checked then
       cxGridDBTableSaidasReferencia.GroupIndex := 5
  else cxGridDBTableSaidasReferencia.GroupIndex := -1;
  cxGridDBTableSaidasReferencia.Visible := not chxAgruparReferencia.Checked;

  cxGridDBTableSaidas.DataController.Groups.FullExpand;
  cxGridDBTableEntradas.DataController.Groups.FullExpand;
  VerificarOrdemAgrupamento;
end;

procedure TfrmMovimentacao.ClientPesquisaDetalhadaCalcFields(DataSet: TDataSet);
begin
  ClientPesquisaDetalhadacalc_referencia.AsString := dtmLookup.FormatarAnoMes(ClientPesquisaDetalhadaANO_MES_REFERENCIA.AsString);
end;

procedure TfrmMovimentacao.cxBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TfrmMovimentacao.cxButton1Click(Sender: TObject);
begin
  vgRelatorioTitulo := lblResultadoPesquisa.Caption;
  case pgcPendencia.ActivePageIndex of
   0 : dtmLookup.dxComponentPrinter.CurrentLink.Component := cxGridPendenciaDetalhada;
   1 : dtmLookup.dxComponentPrinter.CurrentLink.Component := cxGridPendenciaSoma;
   2 : begin
         vgRelatorioTitulo := tabQuitado.Caption;
         dtmLookup.dxComponentPrinter.CurrentLink.Component := cxGridQuitados;
       end;
  end;
  ExibirFormulario(TfrmTituloRelatorio, frmTituloRelatorio, True);
  if vgRelatorioImprimir then
    dtmLookup.dxComponentPrinter.Preview;
end;

procedure TfrmMovimentacao.cxButton3Click(Sender: TObject);
begin
  cxCompAgendados.EditValue := '';
  lcxPesqGrupo.EditValue    := -1;
  icxPesqGrau.EditValue     := -1;
  btnPesquisaAgendadosClick(self);
end;

procedure TfrmMovimentacao.chxCaAgruparGrupoClick(Sender: TObject);
begin
  if chxCaAgruparGrupo.Checked then
       cxGridDBTableViewCaGrupo.GroupIndex := 2
  else cxGridDBTableViewCaGrupo.GroupIndex := -1;
  cxGridDBTableViewCaGrupo.Visible := not chxCaAgruparGrupo.Checked;

  cxGridDBTableView4.DataController.Groups.FullExpand;
end;

procedure TfrmMovimentacao.chxCaAgruparNomeClick(Sender: TObject);
begin
  if chxCaAgruparNome.Checked then
       cxGridDBTableViewCaNome.GroupIndex := 2
  else cxGridDBTableViewCaNome.GroupIndex := -1;
  cxGridDBTableViewCaNome.Visible := not chxCaAgruparNome.Checked;

  cxGridDBTableView4.DataController.Groups.FullExpand;
end;

procedure TfrmMovimentacao.chxSelecaoMultiplaClick(Sender: TObject);
begin
  cxGridDBTableEntradas.OptionsSelection.MultiSelect := chxSelecaoMultipla.Checked;
  cxGridDBTableSaidas.OptionsSelection.MultiSelect   := chxSelecaoMultipla.Checked;
  cxGridDBTableView1.OptionsSelection.MultiSelect    := chxSelecaoMultipla.Checked;
  cxGridDBTableView2.OptionsSelection.MultiSelect    := chxSelecaoMultipla.Checked;
  cxGridDBTableView3.OptionsSelection.MultiSelect    := chxSelecaoMultipla.Checked;
end;

procedure TfrmMovimentacao.lblExpandirDados1Click(Sender: TObject);
begin
  cxGridDBTableView1.DataController.Groups.FullExpand;
end;

procedure TfrmMovimentacao.lblJuntarDadosClick(Sender: TObject);
begin
  cxGridDBTableSaidas.DataController.Groups.FullCollapse;
  cxGridDBTableEntradas.DataController.Groups.FullCollapse;
end;

procedure TfrmMovimentacao.lblExpandirDadosClick(Sender: TObject);
begin
  cxGridDBTableSaidas.DataController.Groups.FullExpand;
  cxGridDBTableEntradas.DataController.Groups.FullExpand;
end;

procedure TfrmMovimentacao.lblJuntarDados1Click(Sender: TObject);
begin
  cxGridDBTableView1.DataController.Groups.FullCollapse;
end;

procedure TfrmMovimentacao.edtPesqDataFimKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    btnPesquisar.SetFocus;
    btnPesquisarClick(Self);
  end;
end;

procedure TfrmMovimentacao.edtPesqNumeroKeyPress(Sender: TObject;
  var Key: Char);
begin
  DigitaInteiro(key);
end;

procedure TfrmMovimentacao.edtPesqReferenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
  DigitaInteiro(key);
end;

procedure TfrmMovimentacao.ExportalExcel1Click(Sender: TObject);
begin
  if pgcPesquisa.ActivePageIndex = 0 then
  begin
    if pgcGrid.ActivePage = tabentradas then
         dtmLookup.ExportarExcel(cxGridEntradas)
    else dtmLookup.ExportarExcel(cxGridSaidas);
  end
  else
    if pgcPesquisa.ActivePageIndex = 1 then
    begin
      if pgcPendencia.ActivePage = tabPendenciaDetalhada then
        dtmLookup.ExportarExcel(cxGridPendenciaDetalhada)
      else
        if pgcPendencia.ActivePage = tabPendenciaTotal then
          dtmLookup.ExportarExcel(cxGridPendenciaSoma)
        else
          dtmLookup.ExportarExcel(cxGridQuitados)
    end
  else
   if pgcPesquisa.ActivePageIndex = 2 then
     dtmLookup.ExportarExcel(gdrCompromissoAgendado);
end;

procedure TfrmMovimentacao.FormActivate(Sender: TObject);
begin
  if (pgcPesquisa.ActivePageIndex = 0) and (edtPesqDataIni.Enabled) then
    edtPesqDataIni.SetFocus;
end;

procedure TfrmMovimentacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  sqlpesquisa1.Active             := False;
  sqlPesquisaDetalhada.Active     := False;
  sqlPesquisaPendenciaSoma.Active := False;
  sqlPesquisaQuitado.Active       := False;  

  Action := caFree;
  frmMovimentacao := nil;
end;

procedure TfrmMovimentacao.FormCreate(Sender: TObject);
begin
  sqlPesquisa1.Connection             := dtmControles.db;
  sqlPesquisaDetalhada.Connection     := dtmControles.db;
  sqlPesquisaPendenciaSoma.Connection := dtmControles.db;
  sqlPesquisaQuitado.Connection       := dtmControles.db;
  sqlCompromissoAgendado.Connection   := dtmControles.db;

  pgcPesquisa.ActivePageIndex  := 0;
  pgcPendencia.ActivePageIndex := 0;
  vlTaxaBoleto := dtmControles.GetStr( 'SELECT COBRAR_BOLETO FROM T_CEDENTE WHERE CEDENTE_ID = '+IntToStr(vgCedenteAtivo));
  if vlTaxaBoleto = 'S' then
    vlTaxaCompromisso := dtmControles.GetStr( 'SELECT CONTABIL_CONTA_TAXA_ID FROM T_CEDENTE WHERE CEDENTE_ID = '+IntToStr(vgCedenteAtivo));

  pgcGrid.HideTabs := True;
  btnLimparClick(self);
  btnPesquisarClick(self);
end;

procedure TfrmMovimentacao.icxPesqSituacaoPropertiesEditValueChanged(
  Sender: TObject);
begin
  edtPesqDataIni.Enabled := icxPesqSituacao.EditValue <> '1';
  edtPesqDataFim.Enabled := icxPesqSituacao.EditValue <> '1';
  lblDataIni.Enabled     := icxPesqSituacao.EditValue <> '1';
  lblDataFim.Enabled     := icxPesqSituacao.EditValue <> '1';

  if icxPesqSituacao.EditValue = '1' then
  begin
    edtPesqDataIni.Clear;
    edtPesqDataFim.Clear;
  end;
  
end;

procedure TfrmMovimentacao.pgcPesquisaChange(Sender: TObject);
begin
  if pgcPesquisa.ActivePageIndex = 1 then
  begin
    CarregarCompromissoVencidoAgendado(cbxCompromisso, True);
    dtmLookup.CarregarPeriodo(cbxReferenciaFinal,8,'',IntToStr(vgPeriodoAtual));
    btnLimparAssociadoClick(Self);
    btnPesquisarAssociadoClick(Self);
  end
  else
    if pgcPesquisa.ActivePageIndex = 2 then
      CarregarCompromissoVencidoAgendado(cxCompAgendados, True);
end;

procedure TfrmMovimentacao.rdbEntradasClick(Sender: TObject);
begin
  pgcGrid.ActivePage := tabentradas;
  icxPesqTipoDocumento.EditValue := 1;

  lblSituacao.Enabled       := True;
  icxPesqSituacao.Enabled   := True;

  lblDescricao.enabled      := False;
  edtPesqDescricao.Enabled  := False;
  edtPesqDescricao.Clear;

  lblDocumento.Enabled      := False;
  edtPesqDocumento.Enabled  := False;
  edtPesqDocumento.Clear;

  lcxPesqCompromisso.EditValue      := null;
  lcxPesqCompromisso.RepositoryItem := dtmLookup.Lista_CompReceitassTodos;

  chxTaxaBoleto.Enabled := (vlTaxaBoleto = 'S') and (vlTaxaCompromisso <> '');
  btnPesquisarClick(self);
end;

procedure TfrmMovimentacao.rdbSaidasClick(Sender: TObject);
begin
  pgcGrid.ActivePage := tabsaidas;
  icxPesqTipoDocumento.EditValue := 2;

  icxPesqSituacao.EditValue := '2';
  lblSituacao.Enabled       := False;
  icxPesqSituacao.Enabled   := False;

  lblDescricao.enabled      := True;
  edtPesqDescricao.Enabled  := True;

  lcxPesqCompromisso.EditValue      := null;
  lcxPesqCompromisso.RepositoryItem := dtmLookup.Lista_CompSaidasTodos;

  lblDocumento.Enabled      := True;
  edtPesqDocumento.Enabled  := True;
  chxTaxaBoleto.Enabled     := False;
  btnPesquisarClick(self);  
end;

procedure TfrmMovimentacao.sqlCompromissoAgendadoCalcFields(DataSet: TDataSet);
begin
  if (sqlCompromissoAgendadoSITUACAO_LOCAL.AsString = '1') and
     ((sqlCompromissoAgendadoSITUACAO_GERAL.AsString = '1') or (sqlCompromissoAgendadoSITUACAO_GERAL.IsNull)) then
        sqlCompromissoAgendadoCALC_VALOR.AsCurrency := sqlCompromissoAgendadoVALOR_ATUAL.AsCurrency
   else sqlCompromissoAgendadoCALC_VALOR.AsCurrency := 0;

  sqlCompromissoAgendadocalc_AnoMesInicial.AsString := dtmLookup.FormatarAnoMes(sqlCompromissoAgendadoANO_MES_INICIAL.AsString);
  if (not sqlCompromissoAgendadoANO_MES_FINAL.IsNull) and (sqlCompromissoAgendadoANO_MES_FINAL.AsString <> '') then
    sqlCompromissoAgendadocalc_AnoMesFinal.AsString := dtmLookup.FormatarAnoMes(sqlCompromissoAgendadoANO_MES_FINAL.AsString);
end;

procedure TfrmMovimentacao.sqlPesquisa1CalcFields(DataSet: TDataSet);
begin
  sqlPesquisa1calc_referencia.AsString := dtmLookup.FormatarAnoMes(sqlPesquisa1ANO_MES_REFERENCIA.AsString);

  if rdbSaidas.Checked then
  begin
    if sqlPesquisa1PESSOA_NOME.AsString <> '' then
      sqlPesquisa1calc_Descricao.AsString := sqlPesquisa1PESSOA_NOME.AsString + ' - ' +
                                                        sqlPesquisa1Descricao.AsString
    else sqlPesquisa1calc_Descricao.AsString := sqlPesquisa1Descricao.AsString;
  end
  else
  begin
    if rdbEntradas.Checked then
    begin
      if  sqlPesquisa1BOLETA_ID.AsInteger > 0 then
      begin
        sqlPesquisa1calc_TipoDocumento.AsString   := '1';
        sqlPesquisa1calc_NumeroDocumento.AsString := sqlPesquisa1BOLETA_ID.AsString;
      end
      else
      begin
        if  sqlPesquisa1RECIBO_NUMERO.AsInteger > 0 then
        begin

          sqlPesquisa1calc_TipoDocumento.AsString   := '2';
          sqlPesquisa1calc_NumeroDocumento.AsString := sqlPesquisa1RECIBO_NUMERO.AsString;
        end;
      end;
      sqlPesquisa1calc_NaoAssociado.AsBoolean := not sqlPesquisa1PESSOA_ID.IsNull;
    end;
  end;
end;

procedure TfrmMovimentacao.VerificarOrdemAgrupamento;
begin
  if chxAgruparBalancete.Checked then
       chxAgruparBalancete.Caption := 'Agrupar Balancete(' +IntToStr(cxGridDBTableEntradasBalancete.GroupIndex+1)+')'
  else chxAgruparBalancete.Caption := 'Agrupar Balancete';

  if chxAgruparCentroCustos.Checked then
       chxAgruparCentroCustos.Caption := 'Agrupar Centro Custos(' +IntToStr(cxGridDBTableEntradasCentroCusto.GroupIndex+1)+')'
  else chxAgruparCentroCustos.Caption := 'Agrupar Centro Custos';

  if chxAgruparPessoa.Checked then
       chxAgruparPessoa.Caption := 'Agrupar Pessoa(' +IntToStr(cxGridDBTableEntradasNome.GroupIndex+1)+')'
  else chxAgruparPessoa.Caption := 'Agrupar Pessoa';

  if chxAgruparCompromisso.Checked then
       chxAgruparCompromisso.Caption := 'Agrupar Compromisso(' +IntToStr(cxGridDBTableEntradasCompromisso.GroupIndex+1)+')'
  else chxAgruparCompromisso.Caption := 'Agrupar Compromisso';

  if chxAgruparReferencia.Checked then
       chxAgruparReferencia.Caption := 'Agrupar Ref. Comp.(' +IntToStr(cxGridDBTableEntradasReferencia.GroupIndex+1)+')'
  else chxAgruparReferencia.Caption := 'Agrupar Ref. Comp.';

end;

procedure TfrmMovimentacao.VerificarOrdemAgrupamento1;
begin
  if chxAgrupar1Balancete.Checked then
       chxAgrupar1Balancete.Caption := 'Agrupar Balancete(' +IntToStr(cxGridDBBalancete.GroupIndex+1)+')'
  else chxAgrupar1Balancete.Caption := 'Agrupar Balancete';

  if chxAgrupar1CentroCustos.Checked then
       chxAgrupar1CentroCustos.Caption := 'Agrupar Centro Custos(' +IntToStr(cxGridDBCentroCusto.GroupIndex+1)+')'
  else chxAgrupar1CentroCustos.Caption := 'Agrupar Centro Custos';

  if chxAgrupar1Pessoa.Checked then
       chxAgrupar1Pessoa.Caption := 'Agrupar Pessoa(' +IntToStr(cxGridDBNome.GroupIndex+1)+')'
  else chxAgrupar1Pessoa.Caption := 'Agrupar Pessoa';

  if chxAgrupar1Compromisso.Checked then
       chxAgrupar1Compromisso.Caption := 'Agrupar Compromisso(' +IntToStr(cxGridDBCompromisso.GroupIndex+1)+')'
  else chxAgrupar1Compromisso.Caption := 'Agrupar Compromisso';

  if chxAgrupar1Referencia.Checked then
       chxAgrupar1Referencia.Caption := 'Agrupar Referência(' +IntToStr(cxGridDBReferencia.GroupIndex+1)+')'
  else chxAgrupar1Referencia.Caption := 'Agrupar Referência';
end;

end.
