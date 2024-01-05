unit LivroCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinCoffee, dxSkinMcSkin, dxSkinOffice2007Silver,
  cxGraphics, cxLookAndFeelPainters, dxSkinscxPCPainter, Menus, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxImageComboBox, cxTextEdit, cxCalendar, cxCurrencyEdit, dxSkinsdxBarPainter,
  dxBar, dxBarExtItems, cxClasses, dxGDIPlusClasses, cxImage, GIFImg, ExtCtrls,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxControls, cxGridCustomView, cxGrid, cxPC, cxDropDownEdit, StdCtrls,
  cxButtons, cxGroupBox, cxMaskEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxContainer, cxLabel, DBClient, SimpleDS, cxRadioGroup,
  cxLookAndFeels, dxSkinBlueprint, dxSkinDarkRoom, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinHighContrast, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013White, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSpringTime,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxPCdxBarPopupMenu,
  ComCtrls, dxCore, cxDateUtils, cxNavigator, ImgList, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinPumpkin, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinDevExpressDarkStyle, frxClass, frxDBSet, FrameImagem, cxGridExportLink,
  dxBarBuiltInMenu, DbxDevartInterBase, cxCheckBox;

type

  TVetMeses = array[1..12,1..2] of string;

  TfrmLivroCaixa = class(TForm)
    pnlFiltro: TPanel;
    Panel1: TPanel;
    PanelBotoesBasicos: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Shape1: TShape;
    cxLabel1: TcxLabel;
    lcbConta: TcxLookupComboBox;
    PanelBotaoFechar: TPanel;
    gbxSomaItensSelecionados: TcxGroupBox;
    edtValorSomaSelecionados: TcxCurrencyEdit;
    pgcFiltro: TcxPageControl;
    tbcFiltro: TcxTabSheet;
    pnlDadosFiltro: TPanel;
    cxLabel4: TcxLabel;
    Panel2: TPanel;
    cxBtnExluir: TcxButton;
    cxBtnFechar: TcxButton;
    tabOpcoes: TcxTabControl;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarSubItem1: TdxBarSubItem;
    dxBarProgressSaldoPeriodo: TdxBarProgressItem;
    dxBarProgressReceber: TdxBarProgressItem;
    dxBarProgressSaldo: TdxBarProgressItem;
    dxBarButton1: TdxBarButton;
    dxBarSubItem2: TdxBarSubItem;
    dxBarHistorico: TdxBarButton;
    dxBarSaldo: TdxBarButton;
    dxBarPlanoConta: TdxBarButton;
    dxBarLancamentoMaisUsados: TdxBarButton;
    dxBarConciliacao: TdxBarButton;
    dxBarSubItem3: TdxBarSubItem;
    dxBarCancelado: TdxBarButton;
    dxBarAtivado: TdxBarButton;
    dxBarEstornar: TdxBarButton;
    dxBarCompensado: TdxBarButton;
    dxBarUsuario: TdxBarButton;
    dxBarFechaMovimento: TdxBarButton;
    dxBarDuplicar: TdxBarButton;
    pnlDadosFiltroPersonalizado: TPanel;
    dtsLivroCaixa: TDataSource;
    dtsCaixa: TDataSource;
    ClientCaixa: TClientDataSet;
    rdbPesquisaSimplificada: TcxRadioButton;
    rdbPesquisaPersonalizada: TcxRadioButton;
    pnlPesquisaPersonalizada: TPanel;
    Panel6: TPanel;
    cxLabel2: TcxLabel;
    ClientCaixaCAIXA_ID: TIntegerField;
    ClientCaixaPRINCIPAL: TStringField;
    ClientCaixaVALOR: TCurrencyField;
    ClientCaixaPESSOA_ID: TIntegerField;
    ClientCaixaDESCRICAO: TStringField;
    ImageList1: TImageList;
    edtDataInicial: TcxDateEdit;
    cxLabel3: TcxLabel;
    edtDataFinal: TcxDateEdit;
    popExportacao: TPopupMenu;
    actExportarExcel: TMenuItem;
    ClientCaixaRESUMO: TStringField;
    N1: TMenuItem;
    CamposGrid1: TMenuItem;
    sqlLivroCaixa: TSimpleDataSet;
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
    mniEstornarItem: TMenuItem;
    cxLabel6: TcxLabel;
    lcxPesqCompromisso: TcxLookupComboBox;
    sqlLivroCaixaORCAMENTO_ID: TFMTBCDField;
    sqlLivroCaixaINDICE_IMAGEM: TFMTBCDField;
    REsetarCamposdaGrid1: TMenuItem;
    N2: TMenuItem;
    frxDBdtRecibo: TfrxDBDataset;
    dtsRecibo: TDataSource;
    sqlLivroCaixaIDENTIFICADOR_ID: TFMTBCDField;
    sqlLivroCaixacalc_identificador: TStringField;
    sqlLivroCaixaDATA_LANCAMENTO: TSQLTimeStampField;
    sqlLivroCaixaDOC_TIPO: TStringField;
    cxLabel5: TcxLabel;
    lcxBalanceteGrupo: TcxLookupComboBox;
    mniDuplicarItem: TMenuItem;
    sqlLivroCaixaFAVORITO_SITUACAO: TStringField;
    mniLancamentoFavorito: TMenuItem;
    N3: TMenuItem;
    sqlLivroCaixaTIPO_MODALIDADE_ID: TFMTBCDField;
    sqlLivroCaixaNOME: TStringField;
    sqlLivroCaixaRESPONSAVEL: TStringField;
    sqlLivroCaixaCALC_PESSOA: TStringField;
    sqlLivroCaixaCALC_OBSERVACAO: TStringField;
    sqlLivroCaixaIDENTIFICADOR_TIPO: TStringField;
    sqlLivroCaixaRESPONSAVEL_ID: TFMTBCDField;
    sqlLivroCaixaCONFERIDO: TStringField;
    sqlLivroCaixaCENTRO_RESERVA_ID: TFMTBCDField;
    sqlLivroCaixaFATURAMENTO: TStringField;
    sqlLivroCaixaORDEM: TFMTBCDField;
    N4: TMenuItem;
    mniItensVinculado: TMenuItem;
    sqlRecibo: TSimpleDataSet;
    sqlReciboDATA_PAGAMENTO: TSQLTimeStampField;
    sqlReciboVALOR: TFMTBCDField;
    sqlReciboHISTORICO: TStringField;
    sqlReciboNOME: TStringField;
    sqlReciboCPFCNPJ: TStringField;
    sqlReciboLIVRO_CAIXA_ID: TFMTBCDField;
    sqlReciboDOC_TIPO: TStringField;
    sqlLivroCaixaVALOR_PREVISTO: TFMTBCDField;
    sqlLivroCaixaVALOR_DESCONTO: TFMTBCDField;
    sqlLivroCaixaVALOR_JUROS: TFMTBCDField;
    sqlLivroCaixaVALOR_MULTA: TFMTBCDField;
    sqlLivroCaixaVALOR_OUTRA_DEDUCAO: TFMTBCDField;
    sqlLivroCaixaVALOR_FATURADO: TFMTBCDField;
    sqlLivroCaixaOBSERVACAO_MONETARIA: TStringField;
    sqlLivroCaixaCONCILIACAO_REGISTRADO_ID: TStringField;
    sqlLivroCaixaCALC_SITUACAO: TStringField;
    sqlLivroCaixaSITUACAO: TStringField;
    pgcTipoLivroCaixa: TcxPageControl;
    pgcDados: TcxPageControl;
    cxTabSheet3: TcxTabSheet;
    cxTabSheet4: TcxTabSheet;
    fmeImagem1: TfmeImagem;
    pgcLivroCaixa: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    tbcPeriodo: TcxTabControl;
    pnlOpcoes: TPanel;
    pnlAgrupar: TPanel;
    Image1: TImage;
    Image7: TImage;
    lblAgrupar: TcxLabel;
    lblDesfazerAgrupamento: TcxLabel;
    pnlRecibo: TPanel;
    Image3: TImage;
    btnEmitirRecibo: TcxLabel;
    pnlEmitirComprovante: TPanel;
    Image4: TImage;
    btnEmitirComprovante: TcxLabel;
    Panel5: TPanel;
    cbxTipoDoc: TcxComboBox;
    rdbEmitirTodos: TcxRadioButton;
    rdbEmitirConfirmado: TcxRadioButton;
    rdbEmitirPendente: TcxRadioButton;
    pnlVisualizarItens: TPanel;
    Image2: TImage;
    cxLabel7: TcxLabel;
    grdBasica: TcxGrid;
    cxGridPesquisa: TcxGridDBTableView;
    cxGridPesquisaSituacao: TcxGridDBColumn;
    cxGridBasicaDBCodigo: TcxGridDBColumn;
    cxGridPesquisaColumn2: TcxGridDBColumn;
    cxGridPesquisaImagemVinculada: TcxGridDBColumn;
    cxGridBasicaDBVinculoOrcamento: TcxGridDBColumn;
    cxGridBasicaDBDataPag: TcxGridDBColumn;
    cxGridPesquisaBalanceteGrupo: TcxGridDBColumn;
    cxGridBasicaDBPlanoConta: TcxGridDBColumn;
    cxGridPesquisaHistorico: TcxGridDBColumn;
    cxGridBasicaDBTipoConta: TcxGridDBColumn;
    cxGridPesquisaDocTipo: TcxGridDBColumn;
    cxGridPesquisaIdentificador: TcxGridDBColumn;
    cxGridPesquisaDocNumero: TcxGridDBColumn;
    cxGridBasicaDBFavorecido: TcxGridDBColumn;
    cxGridPesquisaObservacao: TcxGridDBColumn;
    cxGridBasicaDBOperacao: TcxGridDBColumn;
    cxGridBasicaDBValorReceita: TcxGridDBColumn;
    cxGridBasicaDBValorDespesa: TcxGridDBColumn;
    cxGridPesquisadbOperacao: TcxGridDBColumn;
    cxGridPesquisaIndiceImagem: TcxGridDBColumn;
    cxGridPesquisaNumeroIdentificador: TcxGridDBColumn;
    cxGridPesquisaColumn1: TcxGridDBColumn;
    cxGridPesquisaColumn3: TcxGridDBColumn;
    cxGridPesquisaColumn4: TcxGridDBColumn;
    cxGridPesquisaINTERNO: TcxGridDBColumn;
    grdBasicaLevel1: TcxGridLevel;
    grdGridResumida: TcxGrid;
    cxGridDBTablePrevResumida: TcxGridDBTableView;
    cxGridDBCliente: TcxGridDBColumn;
    cxGridDBHistorico: TcxGridDBColumn;
    cxGridDBData: TcxGridDBColumn;
    cxGridDBColumn16: TcxGridDBColumn;
    cxGridDBTablePrevResumidaColumn2: TcxGridDBColumn;
    cxGridDBTablePrevValorRegistrar: TcxGridDBColumn;
    cxGridDBCaixaLancamento: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    cxGridDBTablePrevResumidaColumn1: TcxGridDBColumn;
    Panel7: TPanel;
    chxAgruparData: TcxCheckBox;
    cxGridPesquisaConciliacaoRegistrado: TcxGridDBColumn;
    sqlLivroCaixaCALC_CONCILIADO: TStringField;
    cxGridDBTablePrevResumidaColumn3: TcxGridDBColumn;
    dxBarSubItem4: TdxBarSubItem;
    dxBarButton2: TdxBarButton;
    chxMostrarCentroCustos: TcxCheckBox;
    cxGridDBTablePrevResumidaCCNome: TcxGridDBColumn;
    cxGridDBTablePrevResumidaCCValor: TcxGridDBColumn;
    cxGridDBTablePrevResumidaCCPercentual: TcxGridDBColumn;
    sqlLivroCaixaVALOR_REGISTRADO: TFMTBCDField;
    sqlLivroCaixaPERCENTUAL_REGISTRADO: TFMTBCDField;
    sqlLivroCaixaCENTRO_CUSTO_REGISTRADO: TStringField;
    cxGridPesquisaConferido: TcxGridDBColumn;
    cxGridDBTablePrevResumidaColumn4: TcxGridDBColumn;
    ClientCaixaPREVISAO_SALDO: TStringField;
    sqlLivroCaixaCONTABIL_RL: TStringField;
    dxBarButton3: TdxBarButton;
    dxBarStaticSaldoAtual: TdxBarStatic;
    dxBarStaticSaldoPeriodo: TdxBarStatic;
    dxBarStaticSaldoAnterior: TdxBarStatic;
    sqlLivroCaixaVALOR_AGENDADO: TFMTBCDField;
    sqlLivroCaixaVALOR_BOLETO: TFMTBCDField;
    sqlLivroCaixaNOSSO_NUMERO: TFMTBCDField;
    sqlReciboOPERACAO: TStringField;
    sqlLivroCaixaVALOR_OUTRAS_TAXAS: TFMTBCDField;
    rdbDataRegistro: TcxRadioButton;
    rdbDataLancamento: TcxRadioButton;
    edtBuscaRapida: TcxTextEdit;
    icxTipoCredito: TcxImageComboBox;
    cbxOrganizar: TcxComboBox;
    btnPesquisar: TcxButton;
    btnLimpar: TcxButton;
    cxButton3: TcxButton;
    btnRelatorio: TcxButton;
    cxBtnAlterar: TcxButton;
    chxDivisaoLucro: TcxCheckBox;
    dxBarButton4: TdxBarButton;
    cxGridPesquisaColumn5: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure lcbContaPropertiesEditValueChanged(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure rdbPesquisaSimplificadaClick(Sender: TObject);
    procedure rdbPesquisaPersonalizadaClick(Sender: TObject);
    procedure tbcPeriodoChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxBtnFecharClick(Sender: TObject);
    procedure edtBuscaRapidaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sqlLivroCaixaCalcFields(DataSet: TDataSet);
    procedure cxButton3Click(Sender: TObject);
    procedure cxBtnExluirClick(Sender: TObject);
    procedure tabOpcoesChange(Sender: TObject);
    procedure dxBarEstornarClick(Sender: TObject);
    procedure sqlLivroCaixaAfterScroll(DataSet: TDataSet);
    procedure cxBtnAlterarClick(Sender: TObject);
    procedure cxGridPesquisaDblClick(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
    procedure icxTipoCreditoPropertiesChange(Sender: TObject);
    procedure dxBarButton1Click(Sender: TObject);
    procedure actExportarExcelClick(Sender: TObject);
    procedure cxGridPesquisaSelectionChanged(Sender: TcxCustomGridTableView);
    procedure CamposGrid1Click(Sender: TObject);
    procedure cxGridPesquisaColumnPosChanged(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
    procedure cxGridPesquisaColumnSizeChanged(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
    procedure cbxOrganizarPropertiesChange(Sender: TObject);
    procedure mniEstornarItemClick(Sender: TObject);
    procedure lblAgruparClick(Sender: TObject);
    procedure REsetarCamposdaGrid1Click(Sender: TObject);
    procedure btnEmitirReciboClick(Sender: TObject);
    procedure lblDesfazerAgrupamentoClick(Sender: TObject);
    procedure btnEmitirComprovanteClick(Sender: TObject);
    procedure cbxTipoDocPropertiesChange(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure lcxPesqCompromissoPropertiesChange(Sender: TObject);
    procedure lcxBalanceteGrupoPropertiesChange(Sender: TObject);
    procedure mniDuplicarItemClick(Sender: TObject);
    procedure mniLancamentoFavoritoClick(Sender: TObject);
    procedure cxGridPesquisaCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure dxBarConciliacaoClick(Sender: TObject);
    procedure cxGridPesquisaConferidoPropertiesCloseUp(Sender: TObject);
    procedure sqlLivroCaixaBeforePost(DataSet: TDataSet);
    procedure mniItensVinculadoClick(Sender: TObject);
    procedure cxLabel7Click(Sender: TObject);
    procedure pgcLivroCaixaChange(Sender: TObject);
    procedure AtivarPesquisaPadrao(vpTipo : String; vpPesquisar : Boolean = False);
    procedure chxAgruparDataClick(Sender: TObject);
    procedure dxBarButton2Click(Sender: TObject);
    procedure chxMostrarCentroCustosClick(Sender: TObject);
    procedure cxGridDBTablePrevResumidaCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure dxBarButton3Click(Sender: TObject);
    procedure rdbDataRegistroClick(Sender: TObject);
    procedure dxBarButton4Click(Sender: TObject);
  private
    vlCriandoForm, vlScannerAtivado, vlMostrarCaptador, vlPermitirModificarContaUsuario : Boolean;
    vlVetMeses   : TVetMeses;
    vlVetPeriodo : array[1..12] of string;
    vlArquivoImagem : string;
    vlSqlPesquisa, vlCondicao, vlPesquisaGridPadrao : String;
    vlSaldoPeriodo, vlSaldoMesAnterior : real;

    function LerImagem(Numero: Integer; vpSiglaImg : Char; vpTipoDocumento : String; vpTransferencia : string = '#'): Boolean;
    procedure MontarPeriodos;
    procedure MontarSqlContas;
    procedure EmitirReciboComprovante(vpTipo, vpMsg : String);
    procedure AtualizarSaldo;
  public
    { Public declarations }
  end;

var
  frmLivroCaixa: TfrmLivroCaixa;

implementation

uses Controles, Lookup_Contabil, Rotinas, Lookup,
  Lookup_Servico, CadastroRapidoalteraLIvroCaixa, VisualizaRelatorios,
  CadastroRapidoTransferencia, Cadastro ,RelatorioFinanceiro,
  ValidarPermissaoUsuario, LookupFinanceiro, GridVisualizacao,
  CadastroRapidoLancamento, ItensVinculados, Principal;

{$R *.dfm}

procedure TfrmLivroCaixa.actExportarExcelClick(Sender: TObject);
begin
  if not DirectoryExists('C:\TEMP\') then
    MkDir('C:\TEMP\');

  vlMostrarCaptador := True;
  sqlLivroCaixa.Refresh;

  if pgcLivroCaixa.ActivePageIndex = 0 then
       ExportGridToExcel('C:\TEMP\RELTEMP.XLS', grdBasica)
  else ExportGridToExcel('C:\TEMP\RELTEMP.XLS', grdGridResumida);
  AbrirPlanilha();
  sqlLivroCaixa.Refresh;
  vlMostrarCaptador := False;
end;

procedure TfrmLivroCaixa.AtivarPesquisaPadrao(vpTipo: String;
  vpPesquisar: Boolean);
begin
  vlPesquisaGridPadrao :=  PadronizacaoLayout('', 'LAYOUT', 'LivroCaixaGridPadrao', '0');
  pgcLivroCaixa.ActivePageIndex := StrToInt(vlPesquisaGridPadrao);
end;

procedure TfrmLivroCaixa.AtualizarSaldo;
var
  viSaldo : Currency;
  viConta, viDataCalculo : String;
  viAnoMesAnterior : Integer;
begin
  viConta := '';
  if lcbConta.EditValue > 0 then
    viConta := IntToStr(lcbConta.EditValue);

  // Saldo Atual
  viSaldo := dtmLookupContabil.CalcularSaldoCaixa(viConta);
  dtmLookupContabil.CarregarSaldoVisualizacao(dxBarStaticSaldoAtual,  'Saldo Atual R$ ', viSaldo);

  // Saldo do Periodo
  viDataCalculo    := dtmLookupContabil.PegarDataFinalMes(vlVetPeriodo[tbcPeriodo.TabIndex+1]);
  vlSaldoPeriodo   := dtmLookupContabil.CalcularSaldoCaixa(viConta, viDataCalculo);
  dtmLookupContabil.CarregarSaldoVisualizacao(dxBarStaticSaldoPeriodo,  'Saldo de '+tbcPeriodo.Tabs[tbcPeriodo.TabIndex].Caption+' R$ ', vlSaldoPeriodo, True);

  // Saldo Mes Anterior
  viAnoMesAnterior := dtmLookupContabil.PegarAnoMes(viDataCalculo, True);
  vlSaldoMesAnterior   := dtmLookupContabil.CalcularSaldoCaixa(viConta, dtmLookupContabil.PegarDataFinalMes(IntToStr(viAnoMesAnterior)));
  dtmLookupContabil.CarregarSaldoVisualizacao(dxBarStaticSaldoAnterior,   'Saldo M�s Anterior R$ ', vlSaldoMesAnterior);
end;

procedure TfrmLivroCaixa.btnLimparClick(Sender: TObject);
var
  viDataIni, viDataFin : string;
begin
  edtDataInicial.EditValue := StrToDate(dtmControles.DataHoraBanco(4));
  edtDataFinal.EditValue   := StrToDate(dtmControles.DataHoraBanco(4));

  edtBuscaRapida.Clear;
  cbxTipoDoc.ItemIndex     := 0;
  rdbEmitirTodos.Checked   := True;

  lcxPesqCompromisso.EditValue := null;
  lcxBalanceteGrupo.EditValue  := null;
  rdbDataRegistro.Checked      := true;

  if not vlCriandoForm then
  begin
    icxTipoCredito.EditValue := '0';
    lcbConta.ItemIndex := 0;
    btnPesquisarClick(self);
  end;
  cxGridPesquisa.DataController.Filter.Clear;
end;

procedure TfrmLivroCaixa.btnPesquisarClick(Sender: TObject);
begin
  lcbContaPropertiesEditValueChanged(self);
end;

procedure TfrmLivroCaixa.btnRelatorioClick(Sender: TObject);
begin
  vgDadosCadastro.SomentePesquisa := True;
  ExibirFormulario(TfrmCadRelatorioFinanceiro, frmCadRelatorioFinanceiro, True);
end;

procedure TfrmLivroCaixa.CamposGrid1Click(Sender: TObject);
begin
  vgGrid.grid := cxGridPesquisa;
  vgGrid.form := 'LIVRO_CAIXA';
  vgDadosCadastro.SomentePesquisa := True;
  vgDadosLivroCaixa.Novo          := True;
  ExibirFormulario(TfrmGridVisualizacao, frmGridVisualizacao, true);
end;

procedure TfrmLivroCaixa.cxBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLivroCaixa.cbxOrganizarPropertiesChange(Sender: TObject);
begin
  if vlCriandoForm then
    exit;

  dtmLookup.AtualizarParametro('TIPO_ORDENACAO_LIVRO_CAIXA', 'LIVRO_CAIXA', 'FINANCEIRO', '18', IntToStr(cbxOrganizar.ItemIndex));
  btnPesquisarClick(self);
end;

procedure TfrmLivroCaixa.cbxTipoDocPropertiesChange(Sender: TObject);
begin
  btnPesquisarClick(self);
end;

procedure TfrmLivroCaixa.chxAgruparDataClick(Sender: TObject);
begin
  if chxAgruparData.Checked then
  begin
    cxGridDBData.GroupIndex := 0;
    cxGridDBTablePrevResumida.DataController.Groups.FullExpand;
  end
  else cxGridDBData.GroupIndex := -1;
end;

procedure TfrmLivroCaixa.chxMostrarCentroCustosClick(Sender: TObject);
begin
  cxGridDBTablePrevResumidaCCNome.Visible       := chxMostrarCentroCustos.Checked;
  cxGridDBTablePrevResumidaCCValor.Visible      := chxMostrarCentroCustos.Checked;
  cxGridDBTablePrevResumidaCCPercentual.Visible := chxMostrarCentroCustos.Checked;

  if vlCriandoForm then
    Exit;
    
  btnPesquisarClick(self);
end;

procedure TfrmLivroCaixa.cxBtnAlterarClick(Sender: TObject);
var
  viLancamentoParcial : Boolean;
begin
  if (DateToStr(sqlLivroCaixaDATA_PAGAMENTO.AsDateTime) <> dtmControles.DataHoraBanco(4))
      and (vgLogin <> 'TRI7') then
  begin
    if Application.MessageBox('Data de Lan�amento Diferente da Data Atual. Solicitar Permiss�o?', 'Confirma��o', MB_YESNO) = IDNO then
      exit;

    if LiberarPermissaoUsuario('ESP_PERMISSAO_DATA')[6] = '0' then
      exit;
  end;

  if (sqlLivroCaixaINTERNO.AsString = 'S') then
    if Application.MessageBox('Item n�o pode ser exclu�do.', 'Confirma��o', MB_YESNO) = IDNO then
      exit;

  vgDadosCadastro.SomentePesquisa := False;

  if sqlLivroCaixaCONCILIACAO_REGISTRADO_ID.AsString <> '' then
    vgDadosLivroCaixa.MensagemBloqueado := 'Item ja Conciliado. Altera��o de alguns campos n�o permitido!!!'
  else
    if sqlLivroCaixaIDENTIFICADOR_TIPO.AsString = 'XF' then
      vgDadosLivroCaixa.MensagemBloqueado := 'ITEM AUTOM�TICO DO FINANCEIRO XIMENES!!!'
  else
    if sqlLivroCaixaAUTOMATICO.AsString = 'S' then
       vgDadosLivroCaixa.MensagemBloqueado := 'LAN�AMENTO INTERNO!!!';

  if pos('T',sqlLivroCaixaOPERACAO.AsString) = 0 then
  begin
    // Verifica se N�o � Agendamento Parcial de Agendamento;
    if sqlLivroCaixaLIVRO_FINANCEIRO_ID.AsInteger > 0 then
    begin
      viLancamentoParcial := dtmControles.GetInt(' SELECT LIVRO_FINANCEIRO_ID FROM J_LIVRO_FINANCEIRO '+
                                                 ' WHERE LIVRO_FINANCEIRO_ID = '+ sqlLivroCaixaLIVRO_FINANCEIRO_ID.AsString+
                                                 '   AND SITUACAO = '+QuotedStr('2')) > 0;
      if viLancamentoParcial then
      begin
        Application.MessageBox(Pchar('Item n�o pode ser alterado.'+ #13+#13+
                                     'Estorne e Lance Novamente!!!'),'Aten��o', mb_Ok + MB_ICONEXCLAMATION);
        abort;
      end;
    end;

    vgDadosCadastro.SomentePesquisa := True;
    dtmLookupServico.CarregarDadosLancamento(2, sqlLivroCaixaLIVRO_CAIXA_ID.AsInteger, sqlLivroCaixa);

    vgDadosLivroCaixa.Bloqueado     := ((sqlLivroCaixaIDENTIFICADOR_TIPO.AsString = 'XF') or (sqlLivroCaixaAUTOMATICO.AsString = 'S')) and (not vgPermissaoInterno);
    vgDadosLivroCaixa.ConciliacaoId := sqlLivroCaixaCONCILIACAO_REGISTRADO_ID.AsString;

    ExibirFormulario(TfrmCadastroRapidoLancamento, frmCadastroRapidoLancamento, True);
  end
  else
  begin
    vgDadosCadastro.SomentePesquisa       := True;
    vgDadosLivroCaixa.Novo                := False;
    vgDadosLivroCaixa.DataPagamento       := sqlLivroCaixaDATA_PAGAMENTO.AsString;
    vgDadosLivroCaixa.DataLancamento      := sqlLivroCaixaDATA_LANCAMENTO.AsString;
    vgDadosLivroCaixa.DataVencimento      := sqlLivroCaixaDATA_VENCIMENTO.AsString;
    vgDadosLivroCaixa.Observacao          := sqlLivroCaixaOBSERVACAO.AsString;
    vgDadosLivroCaixa.ContabilContaID     := sqlLivroCaixaCONTABIL_CONTA_ID.AsInteger;
    vgDadosLivroCaixa.Historico           := sqlLivroCaixaHISTORICO.AsString;
    vgDadosLivroCaixa.ValorCompromisso    := sqlLivroCaixaVALOR.AsCurrency;
    vgDadosLivroCaixa.CaixaTransferenciaId:= sqlLivroCaixaCAIXA_TRANSFERENCIA_ID.AsInteger;
    vgDadosLivroCaixa.Automatico          := sqlLivroCaixaAUTOMATICO.AsString = 'S';
    vgDadosLivroCaixa.RefPeriodo          := '';
    vgDadosLivroCaixa.Referencia          := sqlLivroCaixaREFERENCIA.AsString;
    vgDadosLivroCaixa.ConciliacaoId       := sqlLivroCaixaCONCILIACAO_REGISTRADO_ID.AsString;
    CadTransferencia(True);
  end;

  if vgDadosCadastro.Confirmado then
  begin
    sqlLivroCaixa.Refresh;
    if vgDadosLivroCaixa.Novo then
      sqlLivroCaixa.Locate('CAIXA_TRANSFERENCIA_ID', vgDadosLivroCaixa.CaixaTransferenciaId, [loCaseInsensitive]);
  end;
  AtualizarSaldo;
end;

procedure TfrmLivroCaixa.cxBtnExluirClick(Sender: TObject);
var
  viMensagem, viCaixaTransferenciaID, viSql : String;

  procedure Validar;
  begin
    if (sqlLivroCaixaLIVRO_FINANCEIRO_ID.AsInteger > 0) or (sqlLivroCaixaINTERNO.AsString = 'S') then
    begin
      Application.MessageBox(Pchar('Item de Agendamento e/ou Faturamento n�o pode ser exclu�do.'+#13+#13+ 'Estorne e/ou Cancele o Item!!!'), 'Aten��o', MB_OK + MB_ICONWARNING);
      abort;
    end;

    if (sqlLivroCaixaAUTOMATICO.AsString = 'S') then
    begin
      Application.MessageBox(Pchar('Item de Lan�amento Interno.'+#13+#13+ 'Exclus�o n�o permitida!!!'), 'Aten��o', MB_OK + MB_ICONWARNING);
      abort;
    end;

    if sqlLivroCaixaCALC_CONCILIADO.AsString = 'S' then
    begin
      Application.MessageBox(Pchar('Item ja Conciliado.'+#13+#13+ 'Exclus�o n�o permitida!!!'), 'Aten��o', MB_OK + MB_ICONWARNING);
      abort;
    end;
  end;

begin
  Validar;

  viCaixaTransferenciaID := '';
  if sqlLivroCaixaCAIXA_TRANSFERENCIA_ID.AsInteger > 0 then
  begin
    viCaixaTransferenciaID := sqlLivroCaixaCAIXA_TRANSFERENCIA_ID.AsString;
    viMensagem := 'Excluir transfer�ncia selecionada'
  end
  else
    if pos('A',sqlLivroCaixaOPERACAO.AsString) > 0 then
         viMensagem := 'Excluir Aporte selecionado'
    else viMensagem := 'Excluir item selecionado';


  if (DateToStr(sqlLivroCaixaDATA_PAGAMENTO.AsDateTime) <> dtmControles.DataHoraBanco(4))
      and (vgLogin <> 'TRI7') then
  begin
    if Application.MessageBox('Data de Lan�amento Diferente da Data Atual. Solicitar Permiss�o?', 'Confirma��o', MB_YESNO) = IDNO then
      exit;

    if LiberarPermissaoUsuario('ESP_PERMISSAO_DATA')[6] = '0' then
      exit;
  end;

  if Application.MessageBox(Pchar(viMensagem+'. Confirma?'), 'Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
    exit;

  viSql := ' DELETE FROM J_LIVRO_CAIXA ';
  if viCaixaTransferenciaID <> '' then
       viSql := viSql + ' WHERE CAIXA_TRANSFERENCIA_ID = '+viCaixaTransferenciaID
  else viSql := viSql + ' WHERE LIVRO_CAIXA_ID = '+ sqlLivroCaixaLIVRO_CAIXA_ID.AsString;

  ExecutaSqlAuxiliar(viSql,1);
  sqlLivroCaixa.Refresh;
  AtualizarSaldo;
end;

procedure TfrmLivroCaixa.cxButton3Click(Sender: TObject);
begin
  btnLimparClick(self);
  dtmLookupContabil.CarregarSaldoCaixa(ClientCaixa, True);
  lcbConta.EditValue := 0;
  btnPesquisarClick(self);
end;

procedure TfrmLivroCaixa.cxGridDBTablePrevResumidaCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if (AViewInfo.RecordViewInfo.GridRecord.Values[12]) = 'S' then
    ACanvas.Font.Color  := clBlue
  else
    if (AViewInfo.RecordViewInfo.GridRecord.Values[12]) = 'I' then
      ACanvas.Font.Color  := clRed;
end;

procedure TfrmLivroCaixa.cxGridPesquisaColumnPosChanged(
  Sender: TcxGridTableView; AColumn: TcxGridColumn);
begin
  cxGridPesquisa.StoreToIniFile('GRID_LIVROCAIXA.ini');
  AtualizarConfiguracoes(cxGridPesquisa, 'LIVRO_CAIXA');
end;

procedure TfrmLivroCaixa.cxGridPesquisaColumnSizeChanged(
  Sender: TcxGridTableView; AColumn: TcxGridColumn);
begin
  cxGridPesquisa.StoreToIniFile('GRID_LIVROCAIXA.ini');
end;

procedure TfrmLivroCaixa.cxGridPesquisaConferidoPropertiesCloseUp(
  Sender: TObject);
begin
  if (sqlLivroCaixa.State in [dsEdit]) then
  sqlLivroCaixa.Post;
end;

procedure TfrmLivroCaixa.cxGridPesquisaCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if (AViewInfo.RecordViewInfo.GridRecord.Values[26]) = 'S' then
    ACanvas.Font.Color  := clBlue
  else
    if (AViewInfo.RecordViewInfo.GridRecord.Values[26]) = 'I' then
      ACanvas.Font.Color  := clRed;
end;

procedure TfrmLivroCaixa.cxGridPesquisaDblClick(Sender: TObject);
begin
  if cxBtnAlterar.Enabled then
    cxBtnAlterarClick(self);
end;

procedure TfrmLivroCaixa.cxGridPesquisaSelectionChanged(
  Sender: TcxCustomGridTableView);
var
  viQtd : Integer;

  Procedure VerificarAgrupamento;
  begin
    viQtd := cxGridPesquisa.DataController.GetSelectedCount;
    if viQtd = 1 then
    begin
      if sqlLivroCaixaINDICE_IMAGEM.asInteger <> 0  then
      begin
        pnlAgrupar.Visible := True;
        lblAgrupar.Enabled := False;
        lblDesfazerAgrupamento.Enabled := True;
      end
      else pnlAgrupar.Visible := False;

      gbxSomaItensSelecionados.Visible := False;
      exit;
    end;
    gbxSomaItensSelecionados.Visible := True;
    dtmLookupFinanceiro.SomarSelecionados(cxGridPesquisa, edtValorSomaSelecionados, cxGridBasicaDBValorReceita, cxGridBasicaDBValorDespesa, cxGridBasicaDBOperacao, False, 0);

    if (viQtd > 1) and not pnlAgrupar.Visible then
    begin
      pnlAgrupar.Visible := True;
      lblAgrupar.Enabled := True;
      lblDesfazerAgrupamento.Enabled := False;
    end;
  end;

  procedure VerificarEmitirReciboComprovante;
  begin
    pnlRecibo.Visible            :=  sqlLivroCaixaDOC_TIPO.AsString = 'R';
    pnlEmitirComprovante.Visible :=  sqlLivroCaixaDOC_TIPO.AsString = 'F';
  end;

begin
  pnlOpcoes.Visible := not sqlLivroCaixa.IsEmpty;
  VerificarAgrupamento;
  VerificarEmitirReciboComprovante;
end;

procedure TfrmLivroCaixa.cxLabel7Click(Sender: TObject);
begin
  mniItensVinculadoClick(Self);
end;

procedure TfrmLivroCaixa.mniDuplicarItemClick(Sender: TObject);
begin
  vgDadosCadastro.SomentePesquisa := True;
  vgDadosLivroCaixa.DuplicarItem  := True;
  dtmLookupServico.CarregarDadosLancamento(2, sqlLivroCaixaLIVRO_CAIXA_ID.AsInteger, sqlLivroCaixa);
  ExibirFormulario(TfrmCadastroRapidoLancamento, frmCadastroRapidoLancamento, True);
  if vgDadosLivroCaixa.Confirmado then
    sqlLivroCaixa.Refresh;
  vgDadosLivroCaixa.DuplicarItem := False;
end;

procedure TfrmLivroCaixa.btnEmitirComprovanteClick(Sender: TObject);
begin
  EmitirReciboComprovante('F','Doc.Fiscal');
end;

procedure TfrmLivroCaixa.btnEmitirReciboClick(Sender: TObject);
begin
  EmitirReciboComprovante('R','Emiss�o de Recibo');
end;

procedure TfrmLivroCaixa.dxBarButton1Click(Sender: TObject);
begin
  vgDadosCadastro.SomentePesquisa := True;
  vgDadosLivroCaixa.Novo          := True;
  CadTransferencia(True);
  if vgDadosCadastro.Confirmado then
    lcbContaPropertiesEditValueChanged(self);
end;

procedure TfrmLivroCaixa.dxBarButton2Click(Sender: TObject);
var
  viSql : String;
begin
  if Application.MessageBox('Desfazer Concilia��o do Item Selecionado?', 'Confirma��o', MB_YESNO) = IDNO then
    exit;

  if LiberarPermissaoUsuario('ESP_DESFAZER_CONCILIACAO')[6] = '0' then
    exit;

  ExecutaSqlAuxiliar(' UPDATE J_LIVRO_CAIXA SET DATA_PAGAMENTO = DATA_ANTERIOR, '+
                     '                        ANO_MES_REGISTRO = ANO_MES_ANTERIOR '+
                     ' WHERE CONCILIACAO_REGISTRADO_ID = '+QuotedStr(sqlLivroCaixaCONCILIACAO_REGISTRADO_ID.AsString)+
                     '   AND NOT DATA_ANTERIOR IS NULL', 1);

  ExecutaSqlAuxiliar(' UPDATE J_LIVRO_CAIXA SET CONCILIACAO_REGISTRADO_ID = NULL '+
                     ' WHERE CONCILIACAO_REGISTRADO_ID = '+QuotedStr(sqlLivroCaixaCONCILIACAO_REGISTRADO_ID.AsString), 1);

  viSql := ' UPDATE J_CONCILIACAO_REGISTRADO SET SITUACAO = '+ QuotedStr('0')+','+
           '                                   LANCAMENTO = '+ QuotedStr('5')+','+
           '                                     LIBERADO = '+ QuotedStr('N')+','+
           '                       CONCILIACAO_VINCULO_ID = NULL';

  viSql := viSql + ' WHERE CONCILIACAO_REGISTRADO_ID = '+QuotedStr(sqlLivroCaixaCONCILIACAO_REGISTRADO_ID.AsString)+
                   '    OR CONCILIACAO_VINCULO_ID = '+QuotedStr(sqlLivroCaixaCONCILIACAO_REGISTRADO_ID.AsString);
  ExecutaSqlAuxiliar(viSql,1);

  sqlLivroCaixa.Refresh;
  Application.MessageBox('Concilia��o do Item Desfeita!!!', 'Aten��o', mb_Ok + MB_ICONEXCLAMATION);
end;

procedure TfrmLivroCaixa.dxBarButton3Click(Sender: TObject);
begin
  vgPertmissaoAlteracao := LiberarPermissaoUsuario('ESP_PERMISSAO_DATA')[6] <> '0';
  if vgPertmissaoAlteracao then
    Application.MessageBox('Permiss�o Ativada!!!', 'Informa��o', mb_Ok + MB_ICONINFORMATION);
end;

procedure TfrmLivroCaixa.dxBarButton4Click(Sender: TObject);
begin
  vgPermissaoInterno := LiberarPermissaoUsuario('ESP_PERMISSAO_LANC_INTERNO')[6] <> '0';
  if vgPermissaoInterno then
    Application.MessageBox('Permiss�o Lan�amento Interno Ativada!!!', 'Informa��o', mb_Ok + MB_ICONINFORMATION);
end;

procedure TfrmLivroCaixa.dxBarConciliacaoClick(Sender: TObject);
begin
  CadConciliacaoBancaria;
end;

procedure TfrmLivroCaixa.dxBarEstornarClick(Sender: TObject);
var
  viId, viTipo : Integer;
  viLivroFinanceiroId : String;

  function VerificarValorPagoSituacao(vpCampo, vpId, vpLivroFinanceiroId, vpCondicao : String; vpMofificarSituacao : Boolean):Currency;
  var
    viValorSoma, viValorAgendado : Currency;
    viSituacao : String;
  begin
    viValorSoma := dtmControles.GetFloat(' SELECT SUM(LC.VALOR) '+
                                         ' FROM J_LIVRO_CAIXA LC '+
                                         ' LEFT OUTER JOIN J_LIVRO_FINANCEIRO LF ON '+
                                         '   LC.LIVRO_FINANCEIRO_ID = LF.LIVRO_FINANCEIRO_ID '+
                                         ' WHERE LF.'+vpCampo +'='+vpId + vpCondicao);

    if vpLivroFinanceiroId <> '' then
      viValorAgendado := dtmControles.GetFloat(' SELECT VALOR_AGENDADO FROM J_LIVRO_FINANCEIRO '+
                                           ' WHERE LIVRO_FINANCEIRO_ID = '+vpLivroFinanceiroId);
    Result := viValorSoma;

    if vpMofificarSituacao then
    begin
      if viValorSoma >= viValorAgendado then
        viSituacao := '1'
      else
        if viValorSoma = 0 then
             viSituacao := '1'
        else viSituacao := '2';

      ExecutaSqlAuxiliar(' UPDATE J_LIVRO_FINANCEIRO SET SITUACAO = '+ viSituacao+
                         ' WHERE LIVRO_FINANCEIRO_ID = '+vpLivroFinanceiroId,1);
    end;
  end;

begin
    if sqlLivroCaixaCALC_CONCILIADO.AsString = 'S' then
    begin
      Application.MessageBox(Pchar('Item ja Conciliado.'+#13+#13+ 'Exclus�o n�o permitida!!!'), 'Aten��o', MB_OK + MB_ICONWARNING);
      abort;
   end;

  if DateToStr(sqlLivroCaixaDATA_PAGAMENTO.AsDateTime) <> dtmControles.DataHoraBanco(4) then
  begin
    if Application.MessageBox('Data de Lan�amento Diferente da Data Atual. Solicitar Permiss�o?', 'Confirma��o', MB_YESNO) = IDNO then
      exit;

    if LiberarPermissaoUsuario('ESP_PERMISSAO_DATA')[6] = '0' then
      exit;
  end;

  if Application.MessageBox(Pchar('Estornar item selecionado. Confirma?'), 'Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
    exit;

  viTipo := 0 ;
  if sqlLivroCaixaLIVRO_REMUNERACAO_ID.AsInteger > 0 then
  begin
    viTipo := 1;
    viId   := sqlLivroCaixaLIVRO_REMUNERACAO_ID.AsInteger;
  end
  else
    if sqlLivroCaixaPROCESSO_CONTRATO_ITEM_ID.AsInteger > 0 then
    begin
      viTipo := 2;
      viId   := sqlLivroCaixaPROCESSO_CONTRATO_ITEM_ID.AsInteger;
    end
    else
    begin
      viTipo := 3;
      viId   := sqlLivroCaixaLIVRO_AGENDAMENTO_ID.AsInteger;
    end;

  viLivroFinanceiroId := sqlLivroCaixaLIVRO_FINANCEIRO_ID.AsString;
  ExecutaSqlAuxiliar('DELETE FROM J_CENTRO_RATEIO WHERE LIVRO_CAIXA_ID = '+sqlLivroCaixaLIVRO_CAIXA_ID.AsString,1);
  ExecutaSqlAuxiliar('UPDATE J_LIVRO_FINANCEIRO SET SITUACAO = '+QuotedStr('7')+', LIVRO_CAIXA_FATURADO_ID = NULL '+
                     'WHERE LIVRO_CAIXA_FATURADO_ID = '+ sqlLivroCaixaLIVRO_CAIXA_ID.AsString,1);
  ExecutaSqlAuxiliar('DELETE FROM J_LIVRO_CAIXA WHERE LIVRO_CAIXA_ID = '+sqlLivroCaixaLIVRO_CAIXA_ID.AsString,1);

  case viTipo of
    1 : begin
          dtmLookupServico.VerificarConclusaoItemContrato('J_PROCESSO_CONTRATO_ITEM', ' PROCESSO_CONTRATO_ITEM_ID',
                                   IntToStr(viId),
                                   ' AND LIVRO_REMUNERACAO_ID IS NULL ',
                                   sqlLivroCaixa, True);
          VerificarValorPagoSituacao('PROCESSO_CONTRATO_ITEM_ID', IntToStr(viId), viLivroFinanceiroId, ' AND LF.LIVRO_REMUNERACAO_ID IS NULL', True);
        end;
    2 : begin
          dtmLookupServico.VerificarConclusaoItemContrato('J_LIVRO_REMUNERACAO', 'LIVRO_REMUNERACAO_ID',
                                          IntToStr(viId),
                                          ' AND NOT LIVRO_REMUNERACAO_ID IS NULL ',
                                          sqlLivroCaixa, True);
          VerificarValorPagoSituacao('LIVRO_REMUNERACAO_ID', IntToStr(viId),viLivroFinanceiroId, '', True);
        end;
    3 : dtmLookupFinanceiro.BaixarEstornar('E', sqlLivroCaixaFATURAMENTO.AsString, StrToInt(viLivroFinanceiroId), viId, 0, 0);
  end;
  tbcPeriodoChange(self);

end;

procedure TfrmLivroCaixa.edtBuscaRapidaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    btnPesquisarClick(Self);
end;

procedure TfrmLivroCaixa.EmitirReciboComprovante(vpTipo, vpMsg : String);
var
  viReciboCompId, ARowIndex : integer;
  ARowInfo : TcxRowInfo;

  procedure VerificarTipoDoc;
  var
    i : Integer;
  begin
    with cxGridPesquisa.DataController do
    begin
      for i := 0 to Pred(GetSelectedCount) do
      begin
        ARowIndex := GetSelectedRowIndex(i); // retorna o �ndice da linha selecionada
        ARowInfo  := GetRowInfo(ARowIndex); // retorna informa��o da linha selecionada}

        if Values[ARowInfo.RecordIndex, cxGridPesquisaDocTipo.index] <> vpTipo then
        begin
          Application.MessageBox(Pchar('Item(s) Selecionado(S) devem ter o "Tipo Doc = '+ vpMsg+'"!!!'), 'Aten��o', mb_Ok + MB_ICONEXCLAMATION);
          abort;
        end;

        if Values[ARowInfo.RecordIndex, cxGridPesquisaNumeroIdentificador.index] > 0 then
        begin
          if viReciboCompId = 0 then
            viReciboCompId := Values[ARowInfo.RecordIndex, cxGridPesquisaNumeroIdentificador.index];

          if viReciboCompId <> Values[ARowInfo.RecordIndex, cxGridPesquisaNumeroIdentificador.index] then
          begin
            Application.MessageBox('Item(s) com numero de recibo/comp. diferente".!!!', 'Aten��o', mb_Ok + MB_ICONEXCLAMATION);
            abort;
          end;
        end;
      end;
    end;
  end;

  procedure AtualizarRecibo;
  var
    i : Integer;
  begin
    Screen.Cursor := crHourGlass;

    with cxGridPesquisa.DataController do
    begin
      for i := 0 to Pred(GetSelectedCount) do
      begin
        ARowIndex := GetSelectedRowIndex(i);
        ARowInfo  := GetRowInfo(ARowIndex);
        dtmLookup.UpdateSimplesTabela('J_LIVRO_CAIXA', 'IDENTIFICADOR_ID', ' AND DOC_TIPO = '+QuotedStr(vpTipo),
                                      IntToStr(viReciboCompId), VarToStr(Values[ARowInfo.RecordIndex, cxGridBasicaDBCodigo.index]));
      end;
    end;
  end;

begin
  viReciboCompId := 0;
  VerificarTipoDoc;

  if viReciboCompId = 0 then
  begin
    viReciboCompId := dtmControles.GerarSequencia('IDENTIFICADOR_'+vpTipo);
    AtualizarRecibo;
    sqlLivroCaixa.Refresh;
  end;

  sqlRecibo.Active := False;
  sqlRecibo.DataSet.ParamByName('IDENTIFICADOR_ID').AsInteger := viReciboCompId;
  sqlRecibo.DataSet.ParamByName('DOC_TIPO').AsString          := vpTipo;
  sqlRecibo.Active := True;

  case vpTipo[1] of
    'R' : ExibirRelatorio(dtmControles.frxRelatorio, IntToStr(8), dtmControles.ParametrosRelatorio, True);
    'F' : ExibirRelatorio(dtmControles.frxRelatorio, IntToStr(8), dtmControles.ParametrosRelatorio, True);
  end;
  Screen.Cursor := crDefault;
end;

procedure TfrmLivroCaixa.mniEstornarItemClick(Sender: TObject);
begin
  dxBarEstornarClick(Self);
end;

procedure TfrmLivroCaixa.mniItensVinculadoClick(Sender: TObject);
begin
  vgDadosCadastro.SomentePesquisa := True;
  vgItensVinculados.Id     := sqlLivroCaixaLIVRO_FINANCEIRO_ID.AsString;
  vgItensVinculados.Campo  := 'FECHAMENTO_ID';
  vgItensVinculados.Titulo := 'Itens do Faturamento - '+sqlLivroCaixaHISTORICO.AsString;
  ExibirFormulario(TfrmItensVinculados, frmItensVinculados, True);
end;

procedure TfrmLivroCaixa.mniLancamentoFavoritoClick(Sender: TObject);
begin
  if Application.MessageBox('Definir Item nos Lan�amentos Favoritos?', 'Confirma��o', MB_YESNO) = IDNO then
    exit;

  ExecutaSqlAuxiliar(' UPDATE J_LIVRO_CAIXA SET FAVORITO_SITUACAO = '+ QuotedStr('S')+','+
                     '                          VALOR = :VALOR '+
                     ' WHERE LIVRO_CAIXA_ID = '+sqlLivroCaixaLIVRO_CAIXA_ID.AsString,2);
  with dtmControles.sqlAuxiliar do
  begin
    ParamByName('VALOR').AsCurrency := sqlLivroCaixaVALOR.AsCurrency;
    ExecSQL(FALSE);
  end;
  sqlLivroCaixa.Refresh;
  frmPrincipal.CriarMenuFavoritos;
end;

procedure TfrmLivroCaixa.FormActivate(Sender: TObject);
begin
  if not vlCriandoForm then
    AtualizarSaldo
  else
  begin
    MontarPeriodos;
    btnLimparClick(self);
    dtmLookupContabil.CarregarSaldoCaixa(ClientCaixa, True);
    vlCriandoForm := False;
    lcbConta.EditValue := 0;
  end;
  cbxOrganizarPropertiesChange(self);

  vlCriandoForm := False;
  AtivarPesquisaPadrao('', True);

  edtBuscaRapida.SetFocus;

  // Temporario
  vgPertmissaoAlteracao := True;
end;

procedure TfrmLivroCaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  vgDadosImagem.Localizado := False;
  vgPertmissaoAlteracao    := False;
  vgPermissaoInterno       := False;

  Action := caFree;
  frmLivroCaixa := nil;
end;

procedure TfrmLivroCaixa.FormCreate(Sender: TObject);

  procedure VerificarLancamentoInterno;
  begin
    cxGridPesquisaINTERNO.Visible := dtmControles.GetStr(' SELECT FIRST 1 AUTOMATICO FROM J_LIVRO_CAIXA WHERE AUTOMATICO = ''S''') = 'S';
    if not cxGridPesquisaINTERNO.Visible then
    begin
      icxTipoCredito.Properties.Items[7].Destroy;
      icxTipoCredito.Properties.Items[6].Destroy;
    end;
  end;

begin
  vgDataAtualTipo4    := dtmControles.DataHoraBanco(4);
  vgDataAtualTipoDate := StrToDate(vgDataAtualTipo4);
  VerificarLancamentoInterno;

  try
    SetarConfiguracao(cxGridPesquisa, 'LIVRO_CAIXA');
    cxGridPesquisa.RestoreFromIniFile('GRID_LIVROCAIXA.ini');
  except

  end;

  pgcDados.HideTabs        := True;
  tabOpcoes.TabIndex       := 0;
  pgcDados.ActivePageIndex := 0;
  vlScannerAtivado         := False;

  sqlLivroCaixa.Connection        := dtmControles.DB;
  sqlRecibo.Connection            := dtmControles.DB;
  vlCriandoForm                   := True;
  chxMostrarCentroCustosClick(self);
  cbxOrganizar.ItemIndex          := dtmControles.BuscarConfig('FINANCEIRO','LIVRO_CAIXA','TIPO_ORDENACAO_LIVRO_CAIXA','I');

  pgcLivroCaixaChange(self);
  tbcPeriodo.Tabs.Clear;
  rdbPesquisaSimplificada.Checked := True;
  rdbPesquisaSimplificadaClick(self);
end;

procedure TfrmLivroCaixa.FormDeactivate(Sender: TObject);
begin
  vgDadosCadastro.AtualizarSaldo:= True;
end;

procedure TfrmLivroCaixa.icxTipoCreditoPropertiesChange(Sender: TObject);
begin
  btnPesquisarClick(Self);
end;

procedure TfrmLivroCaixa.lblAgruparClick(Sender: TObject);
var
  i, viContImagem, viComprovanteId: integer;
  ARowIndex: integer;
  ARowInfo: TcxRowInfo;
  viData, viDataAux, viTipo, viOperacao, viTipoAux, viOperacaoAux, vlIndiceImagem, viValor : String;
  viDescricaoAgrupador : String;

  procedure ValidarAgrupamento;
  begin
    if (viData <> viDataAux) then
    begin
      Application.MessageBox('Agrupamento n�o permitido. Os Registros devem estar na mesma data!!!', 'Aten��o', mb_Ok + MB_ICONEXCLAMATION);
      abort;
    end;

    if (viOperacao <> viOperacaoAux) then
    begin
      Application.MessageBox('Agrupamento n�o permitido. Os Registros devem ser do mesmo tipo de opera��o!!!', 'Aten��o', mb_Ok + MB_ICONEXCLAMATION);
      abort;
    end;

    if VarToStr(cxGridPesquisa.DataController.Values[ARowInfo.RecordIndex, cxGridPesquisaIndiceImagem.index]) <> '' then
    begin
      Application.MessageBox('Agrupamento n�o permitido. Existe registro selecionado j� agrupado!!!', 'Aten��o', mb_Ok + MB_ICONEXCLAMATION);
      abort;
    end;

    if VarToStr(cxGridPesquisa.DataController.Values[ARowInfo.RecordIndex, cxGridPesquisaImagemVinculada.index]) = '1' then
    begin
      Inc(viContImagem);
      if viContImagem > 1 then
      begin
        Application.MessageBox('Agrupamento n�o permitido. Existem comprovantes digitalizados para + de 1 registro!!!', 'Aten��o', mb_Ok + MB_ICONEXCLAMATION);
        abort;
      end;
      vlIndiceImagem := VarToStr(cxGridPesquisa.DataController.Values[ARowInfo.RecordIndex, cxGridBasicaDBCodigo.index]);
    end;

  end;

begin

  with cxGridPesquisa.DataController do
  begin
    viData := '';
    viContImagem := 0;
    // Validar Sele��o
    for i := 0 to Pred(GetSelectedCount) do
    begin
      ARowIndex := GetSelectedRowIndex(i); // retorna o �ndice da linha selecionada
      ARowInfo  := GetRowInfo(ARowIndex); // retorna informa��o da linha selecionada}

      viValor := Values[ARowInfo.RecordIndex, cxGridPesquisaDocTipo.index];
      if viData = '' then
      begin
        viData         := VarToStr(Values[ARowInfo.RecordIndex, cxGridBasicaDBDataPag.index]);
        viOperacao     := VarToStr(Values[ARowInfo.RecordIndex, cxGridBasicaDBOperacao.index])[1];
        viTipo         := VarToStr(Values[ARowInfo.RecordIndex, cxGridPesquisaDocTipo.index]);
        vlIndiceImagem := VarToStr(Values[ARowInfo.RecordIndex, cxGridBasicaDBCodigo.index]);
      end;

      viDataAux     := VarToStr(Values[ARowInfo.RecordIndex, cxGridBasicaDBDataPag.index]);
      viTipoAux     := VarToStr(Values[ARowInfo.RecordIndex, cxGridPesquisaDocTipo.index]);
      viOperacaoAux := VarToStr(Values[ARowInfo.RecordIndex, cxGridBasicaDBOperacao.index])[1];
      ValidarAgrupamento;
    end;

    repeat
      if not InputQuery('Descri��o do Agrupamento', 'Descri��o', viDescricaoAgrupador) then
        exit;
    until viDescricaoAgrupador <> '';
    Screen.Cursor := crHourGlass;

    // Agrupar Sele��o
    viComprovanteId := dtmControles.GerarSequencia('IDENTIFICADOR_F');
    for i := 0 to Pred(GetSelectedCount) do
    begin
      ARowIndex := GetSelectedRowIndex(i); // retorna o �ndice da linha selecionada
      ARowInfo  := GetRowInfo(ARowIndex); // retorna informa��o da linha selecionada}
      dtmLookup.UpdateSimplesTabela('J_LIVRO_CAIXA', 'INDICE_IMAGEM','', vlIndiceImagem, VarToStr(Values[ARowInfo.RecordIndex, cxGridBasicaDBCodigo.index]));
      dtmLookup.UpdateSimplesTabela('J_LIVRO_CAIXA', 'IDENTIFICADOR_ID', ' AND DOC_TIPO = '+QuotedStr('F'), IntToStr(viComprovanteId), VarToStr(Values[ARowInfo.RecordIndex, cxGridBasicaDBCodigo.index]));
      dtmLookup.UpdateSimplesTabela('J_LIVRO_CAIXA', 'DESCRICAO_AGRUPADOR', '', QuotedStr(viDescricaoAgrupador), VarToStr(Values[ARowInfo.RecordIndex, cxGridBasicaDBCodigo.index]));
    end;

    sqlLivroCaixa.Refresh;
    Screen.Cursor := crDefault;
  end;

end;

procedure TfrmLivroCaixa.lblDesfazerAgrupamentoClick(Sender: TObject);
begin
  if Application.MessageBox('Dezfazer agrupamento, confirma?','Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
    exit;

  Screen.Cursor := crHourGlass;
  ExecutaSqlAuxiliar(' UPDATE J_LIVRO_CAIXA SET INDICE_IMAGEM = null, '+
                     '                          IDENTIFICADOR_ID =  NULL '+
                     ' WHERE INDICE_IMAGEM = '+sqlLivroCaixaINDICE_IMAGEM.AsString,1);
  sqlLivroCaixa.Refresh;
  Screen.Cursor := crDefault;
end;

procedure TfrmLivroCaixa.lcbContaPropertiesEditValueChanged(Sender: TObject);
begin
  if vlCriandoForm then
    exit;

  MontarSqlContas;
  cxGridPesquisa.DataController.Groups.FullExpand;
  cxGridDBTablePrevResumida.DataController.Groups.FullExpand;
end;

procedure TfrmLivroCaixa.lcxBalanceteGrupoPropertiesChange(Sender: TObject);
begin
  btnPesquisarClick(self);
end;

procedure TfrmLivroCaixa.lcxPesqCompromissoPropertiesChange(Sender: TObject);
begin
  btnPesquisarClick(self);
end;

function TfrmLivroCaixa.LerImagem(Numero: Integer; vpSiglaImg : Char;
        vpTipoDocumento : String; vpTransferencia : string = '#'): Boolean;
var
  viArquivo : string;
begin
  if not dtmLookup.VerificarPastaImagem(vpTipoDocumento, Numero) then
    exit;

  vlArquivoImagem := vgDadosImagem.Pasta + vpSiglaImg +'_' + FormatFloat('000000',Numero)+vpTransferencia+'.i9s';
  fmeImagem1.SetNomeAquivo(vlArquivoImagem);
end;

procedure TfrmLivroCaixa.MontarPeriodos;
var
  viData1, viData2, viMes, viMesMenor, viOrdenacao : String;
  i : Integer;
  viPrimeiraData : TDate;
begin

  MontarDataInicioFinal(vgDataAtualTipo4, viData1, viData2, '/');

  ExecutaSqlAuxiliar(' SELECT FIRST 1 DATA_PAGAMENTO '+
                     ' FROM J_LIVRO_CAIXA '+
                     ' ORDER BY DATA_PAGAMENTO ',0);

  if dtmControles.sqlAuxiliar.IsEmpty then
       viPrimeiraData := StrToDate(viData1)
  else viPrimeiraData := dtmControles.sqlAuxiliar.FieldByName('DATA_PAGAMENTO').AsDateTime;

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

procedure TfrmLivroCaixa.MontarSqlContas;
var
  viSql, viCondicao, viConta, viValor : String;
  viCamposCentroCusto, viCondicaoCentroCusto : String;

  procedure MontarCondicao;
  begin
    viCondicao := '';

    viConta := '';
    if lcbConta.EditValue > 0 then
    begin
      viConta    := IntToStr(lcbConta.EditValue);
      viCondicao := ' AND LC.CAIXA_ID = '+ viConta;
    end;

    if chxDivisaoLucro.Checked then
      viCondicao := ' AND LC.CONTABIL_RL = '+ QuotedStr('S');

    // Por Periodo Personalizado e/ou Periodo ANO/Referencia
    if pnlDadosFiltroPersonalizado.Visible then
    begin
      if rdbDataRegistro.Checked then
           viCondicao := viCondicao +  ' AND LC.DATA_PAGAMENTO '+ MontarSqlData(edtDataInicial.Date , edtDataFinal.Date)
      else viCondicao := viCondicao +  ' AND LC.DATA_LANCAMENTO '+ MontarSqlData(edtDataInicial.Date , edtDataFinal.Date);

      if lcxPesqCompromisso.EditValue <> null then
        viCondicao := viCondicao + ' AND LC.CONTABIL_CONTA_ID = '+IntToStr(lcxPesqCompromisso.EditValue);
    end
    else
      if (tbcPeriodo.Tabs.Count > 0) then
        viCondicao := viCondicao + ' AND ANO_MES_REGISTRO = '+ QuotedStr(vlVetPeriodo[tbcPeriodo.TabIndex+1]);

    if trim(edtBuscaRapida.Text) <> '' then
    begin
      viCondicao := viCondicao + ' AND ((LC.HISTORICO LIKE '+ QuotedStr('%'+edtBuscaRapida.Text+'%')+')'+
                       ' OR (P.NOME LIKE '+ QuotedStr('%'+edtBuscaRapida.Text+'%') +')'+
                       ' OR (A.NOME LIKE '+ QuotedStr('%'+edtBuscaRapida.Text+'%') +')'+
                       ' OR (LC.DOCUMENTO_NUMERO = '+ QuotedStr(edtBuscaRapida.Text) +')'+
                       ' OR (LC.OBSERVACAO LIKE '+ QuotedStr('%'+edtBuscaRapida.Text+'%') +')';

      viValor := TrocaVirgPPto(RetornaNumericoValor(edtBuscaRapida.Text));
      if (viValor <> '') and (viValor <> '0') then
        viCondicao := viCondicao + ' OR (LC.VALOR = '+ viValor +') '+
                                   ' OR (LF.VALOR_AGENDADO = '+ viValor +')'+
                                   ' OR (LC.VALOR_FATURADO = '+ viValor +')'+
                                   ' OR (B.VALOR = '+ viValor +')';

      viValor := RetornaNumerico(edtBuscaRapida.Text);
      if viValor <> '' then
           viCondicao := viCondicao + ' OR (B.NOSSO_NUMERO =' +viValor +'))'
      else viCondicao := viCondicao + ')';
    end;

    case icxTipoCredito.EditValue of
      1 : viCondicao := viCondicao + ' AND LC.OPERACAO = '+ QuotedStr('R');
      2 : viCondicao := viCondicao + ' AND LC.OPERACAO = '+ QuotedStr('D');
      3 : viCondicao := viCondicao + ' AND ((LC.OPERACAO = '+ QuotedStr('AD')+') OR (LC.OPERACAO = '+ QuotedStr('AR')+') OR'+
                                   '      (LC.OPERACAO = '+ QuotedStr('TD')+') OR (LC.OPERACAO = '+ QuotedStr('TR')+'))';
      4 : viCondicao := viCondicao + ' AND ((LC.OPERACAO = '+ QuotedStr('D')+') OR (LC.OPERACAO = '+ QuotedStr('AD')+'))';
      5 : viCondicao := viCondicao + ' AND ((LC.OPERACAO = '+ QuotedStr('R')+') OR (LC.OPERACAO = '+ QuotedStr('AR')+'))';
      6 : viCondicao := viCondicao + ' AND LC.AUTOMATICO = '+ QuotedStr('S');
      7 : viCondicao := viCondicao + ' AND LC.AUTOMATICO IS NULL ';
    end;

    case cbxTipoDoc.ItemIndex of
      1 : viCondicao := viCondicao + ' AND LC.DOC_TIPO = '+ QuotedStr('F');
      2 : viCondicao := viCondicao + ' AND LC.DOC_TIPO = '+ QuotedStr('R');
      3 : viCondicao := viCondicao + ' AND LC.DOC_TIPO = '+ QuotedStr('E');
      4 : viCondicao := viCondicao + ' AND LC.DOC_TIPO = '+ QuotedStr('B');
      5 : viCondicao := viCondicao + ' AND LC.DOC_TIPO = '+ QuotedStr('X');
      6 : viCondicao := viCondicao + ' AND LC.DOC_TIPO = '+ QuotedStr('P');
      7 : viCondicao := viCondicao + ' AND LC.DOC_TIPO = '+ QuotedStr('0');
      8 : viCondicao := viCondicao + ' AND LC.DOC_TIPO = '+ QuotedStr('1');
    end;

    if rdbEmitirConfirmado.Checked then
      viCondicao := viCondicao + ' AND NOT LC.IDENTIFICADOR_ID IS NULL '
    else
      if rdbEmitirPendente.Checked then
        viCondicao := viCondicao + ' AND LC.IDENTIFICADOR_ID IS NULL ';

    if lcxBalanceteGrupo.EditValue <> null then
      viCondicao := viCondicao + ' AND LC.BALANCETE_GRUPO_ID = '+IntToStr(lcxBalanceteGrupo.EditValue);
  end;

  procedure MontarComposCondicaoCentroCusto;
  begin
    if not chxMostrarCentroCustos.Checked then
      viCamposCentroCusto :=', LC.HISTORICO AS CENTRO_CUSTO_REGISTRADO '+
                            ', LC.VALOR AS VALOR_REGISTRADO '+
                            ', LC.VALOR AS PERCENTUAL_REGISTRADO'
    else
    begin
      viCamposCentroCusto :=
        ' ,CASE '+
        '   WHEN CR.PERCENTUAL > 0 THEN (CR.PERCENTUAL * LC.VALOR)/100 '+
        ' ELSE LC.VALOR '+
        ' END AS VALOR_REGISTRADO, '+

        ' CASE '+
        '   WHEN CR.PERCENTUAL > 0 THEN CR.PERCENTUAL '+
        ' ELSE 100 '+
        ' END AS PERCENTUAL_REGISTRADO, '+

        ' CASE '+
        '   WHEN CR.PERCENTUAL > 0 THEN CT.DESCRICAO '+
        ' ELSE  (SELECT CC1.DESCRICAO FROM J_CENTRO_CUSTO CC1 '+
        '        WHERE CC1.CENTRO_CUSTO_ID = LC.CENTRO_CUSTO_ID '+
        '        AND CC1.TIPO_ITEM = ''1'') '+
        ' END AS CENTRO_CUSTO_REGISTRADO ';

      viCondicaoCentroCusto :=
        ' LEFT OUTER JOIN J_CENTRO_RATEIO CR ON '+
        ' CR.LIVRO_CAIXA_ID = LC.LIVRO_CAIXA_ID '+
        ' LEFT OUTER JOIN J_CENTRO_CUSTO CT ON '+
        ' CT.CENTRO_CUSTO_ID = CR.CENTRO_CUSTO_ID ';
    end;
  end;

begin
  MontarComposCondicaoCentroCusto;

  visql := ' SELECT LC.*, B.VALOR AS VALOR_BOLETO, B.NOSSO_NUMERO, '+
           '        LF.PROCESSO_CONTRATO_ITEM_ID, LF.LIVRO_REMUNERACAO_ID, LF.LIVRO_AGENDAMENTO_ID, '+
           '        LF.LIVRO_AGENDAMENTO_ID, LF.VALOR_AGENDADO, '+
           '        CC.DESCRICAO AS CONTABIL_CONTA_DESCRICAO, '+
           '        CC.GRUPO AS GRUPO_SECUDARIO, CC.INTERNO, '+
           '        CG.DESCRICAO AS GRUPO_PRINCIPAL, '+
           '        P.NOME, A.NOME AS RESPONSAVEL '+viCamposCentroCusto+
           ' FROM J_LIVRO_CAIXA LC '+
           '   LEFT OUTER JOIN J_LIVRO_FINANCEIRO LF ON '+
           '   LC.LIVRO_FINANCEIRO_ID = LF.LIVRO_FINANCEIRO_ID '+
           '   LEFT OUTER JOIN J_CONTABIL_CONTA CC ON '+
           '   LC.CONTABIL_CONTA_ID = CC.CONTABIL_CONTA_ID '+
           '   LEFT OUTER JOIN J_CONTABIL_GRUPO CG ON '+
           '   CG.CONTABIL_GRUPO_ID = CC.CONTABIL_GRUPO_ID '+
           '   LEFT OUTER JOIN J_PESSOA P ON '+
           '   LC.PESSOA_ID = P.PESSOA_ID '+
           '   LEFT OUTER JOIN J_PESSOA A ON '+
           '   LC.RESPONSAVEL_ID = A.PESSOA_ID '+viCondicaoCentroCusto+
           '   LEFT OUTER JOIN J_BOLETO B ON '+
           '   LF.BOLETA_ID = B.BOLETO_ID '+
           ' WHERE NOT LC.LIVRO_CAIXA_ID IS NULL ';
  MontarCondicao;

  vlSqlPesquisa := viSql;
  vlCondicao    := viCondicao;

  if cbxOrganizar.ItemIndex = 0 then
       viSql := viSql + viCondicao + 'ORDER BY DATA_PAGAMENTO'
  else viSql := viSql + viCondicao + 'ORDER BY DATA_PAGAMENTO DESC';

  sqlLivroCaixa.AfterScroll := nil;
  sqlLivroCaixa.Active := False;
  sqlLivroCaixa.DataSet.CommandText := viSql;
  sqlLivroCaixa.Active := True;

  if rdbPesquisaSimplificada.Checked then
  begin
    dxBarProgressSaldoPeriodo. Visible := ivAlways;
    dxBarProgressSaldo.Visible         := ivAlways;

    AtualizarSaldo;
  end
  else
  begin
    dxBarProgressSaldoPeriodo.Visible := ivNever;
    dxBarProgressSaldo.Visible        := ivNever;
  end;

  sqlLivroCaixa.AfterScroll := sqlLivroCaixaAfterScroll;
  sqlLivroCaixaAfterScroll(sqlLivroCaixa);
  Screen.Cursor := crDefault;
end;

procedure TfrmLivroCaixa.pgcLivroCaixaChange(Sender: TObject);
begin
  if vlCriandoForm then
    exit;
  vlPesquisaGridPadrao := IntToStr(pgcLivroCaixa.ActivePageIndex);
  PadronizacaoLayout(vlPesquisaGridPadrao, 'LAYOUT', 'LivroCaixaGridPadrao', '0');
  chxAgruparDataClick(self);
end;

procedure TfrmLivroCaixa.rdbDataRegistroClick(Sender: TObject);
begin
  btnPesquisarClick(self);
end;

procedure TfrmLivroCaixa.rdbPesquisaPersonalizadaClick(Sender: TObject);
begin
  LockWindowUpdate(Handle);
  pnlDadosFiltroPersonalizado.Visible := True;
  pnlFiltro.Height := 173;
  edtDataInicial.SetFocus;
  tbcPeriodo.HideTabs := True;
  LockWindowUpdate(0);
end;

procedure TfrmLivroCaixa.rdbPesquisaSimplificadaClick(Sender: TObject);
begin
  LockWindowUpdate(Handle);
  pnlDadosFiltroPersonalizado.Visible := False;
  pnlFiltro.Height := 129;
  tbcPeriodo.HideTabs := False;
  LockWindowUpdate(0);
end;

procedure TfrmLivroCaixa.ResetarCamposdaGrid1Click(Sender: TObject);
begin
  if Application.MessageBox('Resetar/Refazer Campos da Grid?', 'Confirma��o', MB_YESNO) = IDNO then
    exit;

  ExecutaSqlAuxiliar(' DELETE FROM J_GRID WHERE FORM = '+QuotedStr('LIVRO_CAIXA'),1);
  Application.MessageBox('Reabra o Formul�rio para ativar as configura��es da Grid!!!', 'Informa��o', mb_Ok + MB_ICONEXCLAMATION);
  DeleteFile(ExtractFileDir(Application.ExeName)+'\GRID_LIVROCAIXA.ini');
end;

procedure TfrmLivroCaixa.sqlLivroCaixaAfterScroll(DataSet: TDataSet);
begin
  dxBarEstornar.Enabled := (sqlLivroCaixaLIVRO_AGENDAMENTO_ID.AsInteger > 0) or
                           (sqlLivroCaixaLIVRO_REMUNERACAO_ID.AsInteger > 0) or
                           (sqlLivroCaixaFATURAMENTO.AsString = 'S') or
                           (sqlLivroCaixaPROCESSO_CONTRATO_ITEM_ID.AsInteger > 0);
  mniEstornarItem.Enabled       := dxBarEstornar.Enabled;
  mniDuplicarItem.Enabled       := (not sqlLivroCaixa.IsEmpty) and
                                   ((sqlLivroCaixaOPERACAO.AsString[1] in ['D', 'R']) OR (pos('A', sqlLivroCaixaOPERACAO.AsString) > 0)) AND
                                   (sqlLivroCaixaIDENTIFICADOR_TIPO.AsString <> 'XF');
  mniLancamentoFavorito.Enabled := (not sqlLivroCaixa.IsEmpty) and (sqlLivroCaixaOPERACAO.AsString[1] in ['D', 'R']) AND (sqlLivroCaixaIDENTIFICADOR_TIPO.AsString <> 'XF') AND
                                   (sqlLivroCaixaFAVORITO_SITUACAO.AsString <> 'S');
  cxBtnAlterar.Enabled        := not sqlLivroCaixa.IsEmpty;
  cxBtnExluir.Enabled         := not sqlLivroCaixa.IsEmpty;
  pnlVisualizarItens.Visible  := sqlLivroCaixaFATURAMENTO.AsString = 'S';
  mniItensVinculado.Visible   := sqlLivroCaixaFATURAMENTO.AsString = 'S';
end;

procedure TfrmLivroCaixa.sqlLivroCaixaBeforePost(DataSet: TDataSet);
begin
  if sqlLivroCaixaCONFERIDO.AsVariant <> sqlLivroCaixaCONFERIDO.oldValue then
  begin
    ExecutaSqlAuxiliar(' UPDATE J_LIVRO_CAIXA SET CONFERIDO = '+ QuotedStr(sqlLivroCaixaCONFERIDO.AsString)+
                       ' WHERE LIVRO_CAIXA_ID = '+ sqlLivroCaixaLIVRO_CAIXA_ID.AsString,1);
    if (sqlLivroCaixa.State in [dsEdit]) then
      sqlLivroCaixa.CancelUpdates;
    sqlLivroCaixa.Refresh;
    Abort;
  end;
end;

procedure TfrmLivroCaixa.sqlLivroCaixaCalcFields(DataSet: TDataSet);
var
  viOperacao : String;

  procedure VerificarexistenciaImagem;
    procedure BuscarImagem(vpId : Integer);
    begin
      dtmLookup.VerificarPastaImagem('Financeiro', vpId, True);
      vgDadosImagem.Localizado := True;
      vlArquivoImagem := vgDadosImagem.Pasta + 'F_' + FormatFloat('000000',vpId)+'#.i9s'
    end;
  begin

    if sqlLivroCaixaINDICE_IMAGEM.AsInteger > 0 then
      BuscarImagem(sqlLivroCaixaINDICE_IMAGEM.AsInteger)
    else
      if sqlLivroCaixaCAIXA_TRANSFERENCIA_ID.AsInteger = 0 then
         BuscarImagem(sqlLivroCaixaLIVRO_CAIXA_ID.AsInteger)
    else BuscarImagem(sqlLivroCaixaCAIXA_TRANSFERENCIA_ID.AsInteger);

    if FileExists(vlArquivoImagem) then
      sqlLivroCaixacalc_ImagemVinculada.AsString := '1';
  end;

  procedure VerificarSituacao;
  begin
    if sqlLivroCaixaSITUACAO.AsString = 'F' then
      sqlLivroCaixaCALC_SITUACAO.AsString := 'F'
    else
      if not sqlLivroCaixaCONCILIACAO_REGISTRADO_ID.IsNull then
        sqlLivroCaixaCALC_SITUACAO.AsString := 'D';
  end;

  {$REGION 'VerificarJurosMulta'}
  procedure VerificarJurosMulta;
  var
    viObservacao : String;

    procedure PreencherObservacao(vpObs : string);
    begin
      viObservacao := viObservacao + vpObs
    end;
  begin
    if sqlLivroCaixaVALOR_FATURADO.AsCurrency <> sqlLivroCaixaVALOR.AsCurrency then
    begin
      viObservacao := '';

      if sqlLivroCaixaVALOR_MULTA.AsCurrency > 0 then
        PreencherObservacao(' + Multa '+ FormatFloat(',#0.00', sqlLivroCaixaVALOR_MULTA.AsCurrency));
      if sqlLivroCaixaVALOR_JUROS.AsCurrency > 0 then
        PreencherObservacao(' + Juros '+ FormatFloat(',#0.00', sqlLivroCaixaVALOR_JUROS.AsCurrency));
      if sqlLivroCaixaVALOR_OUTRAS_TAXAS.AsCurrency > 0 then
        PreencherObservacao(' + Outras Taxas '+ FormatFloat(',#0.00', sqlLivroCaixaVALOR_OUTRAS_TAXAS.AsCurrency));
      if sqlLivroCaixaVALOR_DESCONTO.AsCurrency > 0 then
        PreencherObservacao(' - Desconto '+ FormatFloat(',#0.00', sqlLivroCaixaVALOR_DESCONTO.AsCurrency));
      if sqlLivroCaixaVALOR_OUTRA_DEDUCAO.AsCurrency > 0 then
        PreencherObservacao(' - Outras Dedu��es '+ FormatFloat(',#0.00', sqlLivroCaixaVALOR_OUTRA_DEDUCAO.AsCurrency));
      if sqlLivroCaixaOBSERVACAO_MONETARIA.AsString <> '' then
        PreencherObservacao(' ** '+sqlLivroCaixaOBSERVACAO_MONETARIA.AsString);

      if sqlLivroCaixaCALC_OBSERVACAO.AsString = '' then
           sqlLivroCaixaCALC_OBSERVACAO.AsString := viObservacao
      else sqlLivroCaixaCALC_OBSERVACAO.AsString := sqlLivroCaixaCALC_OBSERVACAO.AsString + ' ** '+ viObservacao;
    end;
  end;
  {$ENDREGION}

begin
  viOperacao := sqlLivroCaixaOPERACAO.AsString;

  case viOperacao[1] of
    'R' : sqlLivroCaixacalc_ValorReceita.AsCurrency := sqlLivroCaixaVALOR.AsCurrency;
    'D' : sqlLivroCaixacalc_ValorDespesa.AsCurrency := sqlLivroCaixaVALOR.AsCurrency;
    'A', 'T' : begin
                 if (viOperacao = 'AR') or (viOperacao = 'TR') then
                      sqlLivroCaixacalc_ValorReceita.AsCurrency := sqlLivroCaixaVALOR.AsCurrency
                 else sqlLivroCaixacalc_ValorDespesa.AsCurrency := sqlLivroCaixaVALOR.AsCurrency;
               end;
  end;

  VerificarexistenciaImagem;

  if vlMostrarCaptador then
    if not sqlLivroCaixaPROCESSO_ID.IsNull then
      sqlLivroCaixacalc_captador.AsString := dtmControles.GetStr('SELECT FIRST 1 P.NOME '+
                                                                 ' FROM J_PROCESSO_RESPONSAVEL PR '+
                                                                 '   LEFT OUTER JOIN J_PESSOA P ON '+
                                                                 '   PR.PESSOA_ID = P.PESSOA_ID '+
                                                                 ' WHERE PR.PROCESSO_ID = '+sqlLivroCaixaPROCESSO_ID.AsString +
                                                                 '   AND PR.PESSOA_TIPO = '+QuotedStr('C'));

  sqlLivroCaixacalc_Agrupado.asBoolean      := sqlLivroCaixaINDICE_IMAGEM.AsString <> '';
  sqlLivroCaixacalc_vinculo.AsBoolean       := sqlLivroCaixaORCAMENTO_ID.AsInteger > 0;


  if sqlLivroCaixaNOME.AsString <> '' then
  begin
    sqlLivroCaixaCALC_PESSOA.AsString := sqlLivroCaixaNOME.AsString;
    if sqlLivroCaixaRESPONSAVEL.AsString <> '' then
      sqlLivroCaixaCALC_OBSERVACAO.AsString := sqlLivroCaixaRESPONSAVEL.AsString;
  end
  else sqlLivroCaixaCALC_PESSOA.AsString := sqlLivroCaixaRESPONSAVEL.AsString;

  if sqlLivroCaixaOBSERVACAO.AsString <> '' then
  begin
    if sqlLivroCaixaCALC_OBSERVACAO.AsString = '' then
         sqlLivroCaixaCALC_OBSERVACAO.AsString := sqlLivroCaixaOBSERVACAO.AsString
    else sqlLivroCaixaCALC_OBSERVACAO.AsString := sqlLivroCaixaCALC_OBSERVACAO.AsString + ' - ' +
                                                  sqlLivroCaixaOBSERVACAO.AsString;
  end;

  if (sqlLivroCaixaCONTABIL_RL.AsString = 'S') then
  begin
    if sqlLivroCaixaCALC_OBSERVACAO.AsString = '' then
         sqlLivroCaixaCALC_OBSERVACAO.AsString := 'Registro Contabil de Distribui��o de Lucro'
    else sqlLivroCaixaCALC_OBSERVACAO.AsString := sqlLivroCaixaCALC_OBSERVACAO.AsString + ' - '+
                                                  'Registro Contabil de Distribui��o de Lucro';
  end;

  if not sqlLivroCaixaIDENTIFICADOR_ID.IsNull then
    sqlLivroCaixacalc_Identificador.AsString  := sqlLivroCaixaDOC_TIPO.AsString +'-'+ FormatFloat('###.###',sqlLivroCaixaIDENTIFICADOR_ID.AsInteger);

  if sqlLivroCaixaFAVORITO_SITUACAO.AsString = 'S' then
    sqlLivroCaixacalc_ImagemVinculada.AsString := '3';

  if not sqlLivroCaixaCONCILIACAO_REGISTRADO_ID.IsNull then
    sqlLivroCaixaCALC_CONCILIADO.AsString := 'S';

  if (sqlLivroCaixaVALOR_BOLETO.AsCurrency > 0) AND
     (sqlLivroCaixaVALOR_AGENDADO.AsCurrency <> sqlLivroCaixaVALOR_BOLETO.AsCurrency) then
    if sqlLivroCaixaCALC_OBSERVACAO.AsString = '' then
         sqlLivroCaixaCALC_OBSERVACAO.AsString := 'Valor do Boleto = '+FormatFloat('R$ ,#0.00', sqlLivroCaixaVALOR_BOLETO.AsCurrency)
    else sqlLivroCaixaCALC_OBSERVACAO.AsString := sqlLivroCaixaCALC_OBSERVACAO.AsString +
                                                  ' ** Valor do Boleto = '+FormatFloat('R$ ,#0.00', sqlLivroCaixaVALOR_BOLETO.AsCurrency);

  if (sqlLivroCaixaVALOR_AGENDADO.AsCurrency > 0 ) AND
     (sqlLivroCaixaVALOR_AGENDADO.AsCurrency <> sqlLivroCaixaVALOR_REGISTRADO.AsCurrency) then
    sqlLivroCaixaCALC_OBSERVACAO.AsString := sqlLivroCaixaCALC_OBSERVACAO.AsString + ' ** ' +
                                             'Valor Agendado = '+FormatFloat('R$ ,#0.00', sqlLivroCaixaVALOR_AGENDADO.AsCurrency);

  VerificarJurosMulta;
end;

procedure TfrmLivroCaixa.tabOpcoesChange(Sender: TObject);
begin
  if tabOpcoes.TabIndex = 0 then
  begin
    pgcDados.ActivePageIndex := 0;
    if sqlLivroCaixa.Active then
      sqlLivroCaixa.Refresh;
  end
  else
  begin
    if not vlScannerAtivado then
    begin
      fmeImagem1.Ativar;
      fmeImagem1.SetNomeAquivo('C:\Temp\Imagem.tif');
      vlScannerAtivado := True;
    end;

    pgcDados.ActivePageIndex := 1;
    if sqlLivroCaixaINDICE_IMAGEM.AsInteger > 0 then
       LerImagem(sqlLivroCaixaINDICE_IMAGEM.AsInteger, 'F', 'Financeiro')
    else
      if sqlLivroCaixaCAIXA_TRANSFERENCIA_ID.AsInteger = 0 then
         LerImagem(sqlLivroCaixaLIVRO_CAIXA_ID.AsInteger, 'F', 'Financeiro')
      else LerImagem(sqlLivroCaixaCAIXA_TRANSFERENCIA_ID.AsInteger, 'F', 'Financeiro', 'T');
  end;
end;

procedure TfrmLivroCaixa.tbcPeriodoChange(Sender: TObject);
begin
  btnPesquisarClick(self);
  gbxSomaItensSelecionados.Visible := False;
  if not vlCriandoForm then
    grdBasica.SetFocus;
end;

end.
