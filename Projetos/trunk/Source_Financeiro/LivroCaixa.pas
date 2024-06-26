unit LivroCaixa;

interface

uses
  I9Query,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  cxGraphics, cxLookAndFeelPainters, Menus, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxImageComboBox, cxTextEdit, cxCalendar, cxCurrencyEdit, dxBar,
  dxBarExtItems, cxClasses, dxGDIPlusClasses, cxImage, GIFImg, ExtCtrls,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxControls, cxGridCustomView, cxGrid, cxPC, cxDropDownEdit, StdCtrls,
  cxButtons, cxGroupBox, cxMaskEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxContainer, cxLabel, DBClient, SimpleDS, cxRadioGroup,
  cxPCdxBarPopupMenu,  ComCtrls, dxCore, cxDateUtils, cxNavigator, ImgList,
  frxClass, frxDBSet, FrameImagem, cxGridExportLink,
  dxBarBuiltInMenu, DbxDevartInterBase, Vcl.Buttons, cxCheckBox, cxLookAndFeels,
  FN.Model.GED, Geral.Model.GED, frxRich, dxSkinsCore, dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinscxPCPainter, dxSkinsdxBarPainter, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type

  TVetMeses = array[1..12,1..2] of string;

  TfrmLivroCaixa = class(TForm)
    pnlFiltro: TPanel;
    Panel1: TPanel;
    PanelBotoesBasicos: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Shape1: TShape;
    lcbConta: TcxLookupComboBox;
    PanelBotaoFechar: TPanel;
    gbxSomaItensSelecionados: TcxGroupBox;
    edtValorSomaSelecionados: TcxCurrencyEdit;
    pgcFiltro: TcxPageControl;
    tbcFiltro: TcxTabSheet;
    pnlDadosFiltro: TPanel;
    cxLabel4: TcxLabel;
    Panel2: TPanel;
    cxBtnIncluir: TcxButton;
    cxBtnExluir: TcxButton;
    cxBtnAlterar: TcxButton;
    cxBtnFechar: TcxButton;
    tabOpcoes: TcxTabControl;
    pgcDados: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    tbcPeriodo: TcxTabControl;
    pnlOrdenacao: TPanel;
    imgOrdenarAvancar: TcxImage;
    imgOrdenarVoltar: TcxImage;
    cxTabSheet2: TcxTabSheet;
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
    dxBarAjusteSaldo: TdxBarButton;
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
    fmeImagem1: TfmeImagem;
    cxLabel3: TcxLabel;
    popExportacao: TPopupMenu;
    actExportarExcel: TMenuItem;
    ClientCaixaRESUMO: TStringField;
    N1: TMenuItem;
    CamposGrid1: TMenuItem;
    sqlLivroCaixa: TI9Query;
    sqlLivroCaixaDATA_PAGAMENTO: TSQLTimeStampField;
    sqlLivroCaixaLIVRO_CAIXA_ID: TBCDField;
    sqlLivroCaixaCAIXA_ID: TBCDField;
    sqlLivroCaixaVALOR: TBCDField;
    sqlLivroCaixaOPERACAO: TStringField;
    sqlLivroCaixaPESSOA_ID: TBCDField;
    sqlLivroCaixaREFERENCIA: TStringField;
    sqlLivroCaixaOBSERVACAO: TStringField;
    sqlLivroCaixaCONTABIL_CONTA_ID: TBCDField;
    sqlLivroCaixaCENTRO_CUSTO_ID: TBCDField;
    sqlLivroCaixacalc_ValorDespesa: TCurrencyField;
    sqlLivroCaixacalc_ValorReceita: TCurrencyField;
    sqlLivroCaixacalc_vinculo: TBooleanField;
    sqlLivroCaixacalc_ImagemVinculada: TStringField;
    sqlLivroCaixacalc_Agrupado: TBooleanField;
    sqlLivroCaixaESPECIE: TStringField;
    sqlLivroCaixaDOCUMENTO_DESCRICAO: TStringField;
    sqlLivroCaixaBALANCETE_GRUPO_ID: TBCDField;
    sqlLivroCaixaLIVRO_FINANCEIRO_ID: TBCDField;
    sqlLivroCaixaHISTORICO: TStringField;
    sqlLivroCaixaANO_MES_REGISTRO: TStringField;
    sqlLivroCaixaDATA_VENCIMENTO: TSQLTimeStampField;
    sqlLivroCaixaLIVRO_AGENDAMENTO_ID: TBCDField;
    sqlLivroCaixaCONTABIL_CONTA_DESCRICAO: TStringField;
    sqlLivroCaixaGRUPO_SECUDARIO: TStringField;
    sqlLivroCaixaGRUPO_PRINCIPAL: TStringField;
    sqlLivroCaixacalc_ValorMovimento: TCurrencyField;
    sqlLivroCaixaCAIXA_TRANSFERENCIA_ID: TBCDField;
    sqlLivroCaixaIR: TStringField;
    sqlLivroCaixaDOCUMENTO_NUMERO: TStringField;
    sqlLivroCaixacalc_captador: TStringField;
    sqlLivroCaixaINTERNO: TStringField;
    sqlLivroCaixaAUTOMATICO: TStringField;
    mniEstornarItem: TMenuItem;
    cxLabel6: TcxLabel;
    sqlLivroCaixaORCAMENTO_ID: TBCDField;
    sqlLivroCaixaINDICE_IMAGEM: TBCDField;
    REsetarCamposdaGrid1: TMenuItem;
    N2: TMenuItem;
    pnlOpcoes: TPanel;
    pnlCancelarComprovante: TPanel;
    Image7: TImage;
    lblCancelarComprovante: TcxLabel;
    pnlRecibo: TPanel;
    btnEmitirRecibo: TcxLabel;
    Image3: TImage;
    frxDBdtRecibo: TfrxDBDataset;
    frxRecibo: TfrxReport;
    sqlRecibo: TI9Query;
    dtsRecibo: TDataSource;
    Panel5: TPanel;
    cbxTipoDoc: TcxComboBox;
    rdbEmitirTodos: TcxRadioButton;
    rdbEmitirConfirmado: TcxRadioButton;
    rdbEmitirPendente: TcxRadioButton;
    sqlLivroCaixacalc_identificador: TStringField;
    sqlLivroCaixaASSOCIADO_ID: TBCDField;
    sqlLivroCaixaCOMPROMISSO_VENCIDO_ID: TBCDField;
    sqlLivroCaixaDATA_LANCAMENTO: TSQLTimeStampField;
    sqlLivroCaixaIDENTIFICACAO_TIPO: TStringField;
    sqlLivroCaixaRESERVA_ID: TBCDField;
    sqlLivroCaixaDOC_TIPO: TStringField;
    sqlLivroCaixaFAVORECIDO_ASSOCIADO: TStringField;
    sqlLivroCaixaNOME: TStringField;
    sqlLivroCaixaASSOCIADO: TStringField;
    sqlLivroCaixaCALC_PESSOA: TStringField;
    sqlLivroCaixaCALC_OBSERVACAO: TStringField;
    cxLabel5: TcxLabel;
    N3: TMenuItem;
    mniLancamentoFavorito: TMenuItem;
    mniDuplicarItem: TMenuItem;
    sqlLivroCaixaFAVORITO_SITUACAO: TStringField;
    sqlLivroCaixaTIPO_DESPESA_ID: TBCDField;
    pgcVisualizacao: TcxPageControl;
    tabVisualizacaoDetalhada: TcxTabSheet;
    tabVisualizacaoSimplificada: TcxTabSheet;
    grdBasica: TcxGrid;
    cxGridPesquisa: TcxGridDBTableView;
    cxGridBasicaDBCodigo: TcxGridDBColumn;
    cxGridPesquisaImagemVinculada: TcxGridDBColumn;
    cxGridBasicaDBDataPag: TcxGridDBColumn;
    cxGridPesquisaBalanceteGrupo: TcxGridDBColumn;
    cxGridBasicaDBPlanoConta: TcxGridDBColumn;
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
    grdBasicaLevel1: TcxGridLevel;
    grdSimplificada: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    dtsCaixaSimplificado: TDataSource;
    sqlCaixaSimplificado: TI9Query;
    sqlCaixaSimplificadoCAIXA_ID: TBCDField;
    sqlCaixaSimplificadoOPERACAO: TStringField;
    sqlCaixaSimplificadoDATA_PAGAMENTO: TSQLTimeStampField;
    sqlCaixaSimplificadoNOME_PESSOA: TStringField;
    sqlCaixaSimplificadoITEM_UNICO: TStringField;
    sqlCaixaSimplificadoHISTORICO: TStringField;
    sqlCaixaSimplificadoVALOR: TBCDField;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    cxGridDBTableView1Column3: TcxGridDBColumn;
    cxGridDBTableView1Column4: TcxGridDBColumn;
    cxGridDBTableView1Column5: TcxGridDBColumn;
    cxGridDBTableView1operacao: TcxGridDBColumn;
    cxGridDBTableView1RECEITA: TcxGridDBColumn;
    cxGridDBTableView1DESPESA: TcxGridDBColumn;
    sqlCaixaSimplificadocalc_ValorDespesa: TCurrencyField;
    sqlCaixaSimplificadocalc_ValorReceita: TCurrencyField;
    sqlLivroCaixaIDENTIFICACAO_ID: TBCDField;
    mniExcluir: TMenuItem;
    N4: TMenuItem;
    edtDataInicial: TcxDateEdit;
    edtDataFinal: TcxDateEdit;
    lcxPesqCompromisso: TcxLookupComboBox;
    lcxBalanceteGrupo: TcxLookupComboBox;
    edtBuscaRapida: TcxTextEdit;
    icxTipoCredito: TcxImageComboBox;
    cbxOrganizar: TcxComboBox;
    btnPesquisar: TcxButton;
    btnLimpar: TcxButton;
    cxButton3: TcxButton;
    btnRelatorio: TcxButton;
    sqlLivroCaixaSITUACAO: TStringField;
    cxGridDBTableView1Column7: TcxGridDBColumn;
    sqlCaixaSimplificadoSITUACAO: TStringField;
    cxGridPesquisaColumn1: TcxGridDBColumn;
    btnAdValor: TSpeedButton;
    btnDeduzirValor: TSpeedButton;
    sqlReciboDATA_PAGAMENTO: TSQLTimeStampField;
    sqlReciboVALOR: TBCDField;
    sqlReciboHISTORICO: TStringField;
    sqlReciboDOC_TIPO: TStringField;
    sqlReciboIDENTIFICACAO_ID: TBCDField;
    sqlReciboNOME_PESSOA: TStringField;
    sqlReciboCPFCNPJ: TStringField;
    sqlReciboLIVRO_CAIXA_ID: TBCDField;
    sqlReciboCALC_IDENTIFICADOR: TStringField;
    sqlReciboDOCUMENTO_NUMERO: TStringField;
    sqlReciboPLANO_CONTA: TStringField;
    sqlReciboCALC_REFERENCIA: TStringField;
    sqlReciboREFERENCIA: TStringField;
    frxDBDatasetcABECALHO: TfrxDBDataset;
    cxLabel7: TcxLabel;
    lcxReserva: TcxLookupComboBox;
    cxGridPesquisaHistorico: TcxGridDBColumn;
    sqlLivroCaixaDESCRICAO_AGRUPADOR: TStringField;
    sqlLivroCaixaORDEM: TBCDField;
    sqlLivroCaixaCALC_ORDEM: TIntegerField;
    sqlCaixaSimplificadoCALC_ORDEM: TIntegerField;
    sqlCaixaSimplificadoORDEM: TBCDField;
    sqlCaixaSimplificadoCALC_SALDO: TCurrencyField;
    cxGridDBTableView1Column8: TcxGridDBColumn;
    dxBarProgressSaldoAnterior: TdxBarProgressItem;
    dxBarStaticSaldoPeriodo: TdxBarStatic;
    dxBarStaticSaldoAnterior: TdxBarStatic;
    dxBarStaticSaldoAtual: TdxBarStatic;
    imgImprimirRelSimplificado: TcxImage;
    frxDBDataSetDemonstrativo: TfrxDBDataset;
    frxDBDatasetLivroCaixaSimplif: TfrxDBDataset;
    lcxCentroCusto: TcxLookupComboBox;
    cxLabel8: TcxLabel;
    lblTipoCaixa: TcxLabel;
    lcxTipoCaixa: TcxImageComboBox;
    chxTodos: TcxCheckBox;
    sqlCaixaSimplificadoCALC_OBSERVACAO: TStringField;
    cxGridDBTableView1Column6: TcxGridDBColumn;
    sqlCaixaSimplificadoCAIXA_TRANSFERENCIA_ID: TBCDField;
    cxGridDBTableView1Column9: TcxGridDBColumn;
    cxGridDBTableView1Column10: TcxGridDBColumn;
    sqlCaixaSimplificadoIDENTIFICACAO_ID: TBCDField;
    rdbDataLancamento: TcxRadioButton;
    rdbDataRegistro: TcxRadioButton;
    sqlCaixaSimplificadoQTD: TIntegerField;
    cxGridDBTableView1Column12: TcxGridDBColumn;
    sqlCaixaSimplificadoDOCUMENTO_NUMERO: TStringField;
    sqlCaixaSimplificadoREFERENCIA: TStringField;
    cxGridDBTableView1Column13: TcxGridDBColumn;
    cxGridDBTableView1Column14: TcxGridDBColumn;
    sqlCaixaSimplificadoDOC_TIPO: TStringField;
    cxGridDBTableView1Column15: TcxGridDBColumn;
    pnlAgrupar: TPanel;
    lblAgrupar: TcxLabel;
    Image1: TImage;
    sqlCaixaSimplificadoDOCUMENTO: TStringField;
    chxVerificarVinculos: TcxCheckBox;
    Expo1: TMenuItem;
    cxTabSheet3: TcxTabSheet;
    cxGrid1: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    cxGridDBTableView2Column1: TcxGridDBColumn;
    cxGridDBTableView2Column2: TcxGridDBColumn;
    cxGridDBTableView2Column3: TcxGridDBColumn;
    cxGridDBTableView2Column4: TcxGridDBColumn;
    cxGridDBTableView2Column5: TcxGridDBColumn;
    sqlTransfProvisao: TI9Query;
    dtsTransfProvisao: TDataSource;
    sqlTransfProvisaoLIVRO_CAIXA_ID: TBCDField;
    sqlTransfProvisaoHISTORICO: TStringField;
    sqlTransfProvisaoDATA_PAGAMENTO: TSQLTimeStampField;
    sqlTransfProvisaoOBSERVACAO: TStringField;
    sqlTransfProvisaoOPERACAO: TStringField;
    sqlTransfProvisaoRESERVA_ID: TBCDField;
    sqlTransfProvisaoVALOR: TBCDField;
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
    procedure REsetarCamposdaGrid1Click(Sender: TObject);
    procedure btnEmitirReciboClick(Sender: TObject);
    procedure ParametrosRelatorio;
    procedure btnEmitirComprovanteClick(Sender: TObject);
    procedure cbxTipoDocPropertiesChange(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure lcxPesqCompromissoPropertiesChange(Sender: TObject);
    procedure lcxBalanceteGrupoPropertiesChange(Sender: TObject);
    procedure mniDuplicarItemClick(Sender: TObject);
    procedure mniLancamentoFavoritoClick(Sender: TObject);
    procedure sqlCaixaSimplificadoCalcFields(DataSet: TDataSet);
    procedure cxGridDBTableView1DblClick(Sender: TObject);
    procedure sqlCaixaSimplificadoAfterScroll(DataSet: TDataSet);
    procedure sqlLivroCaixaAfterRefresh(DataSet: TDataSet);
    procedure pgcVisualizacaoChange(Sender: TObject);
    procedure lblCancelarComprovanteClick(Sender: TObject);
    procedure cxBtnIncluirClick(Sender: TObject);
    procedure mniExcluirClick(Sender: TObject);
    procedure btnAdValorClick(Sender: TObject);
    procedure btnDeduzirValorClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sqlReciboCalcFields(DataSet: TDataSet);
    procedure cxGridDBTableView1SelectionChanged(
      Sender: TcxCustomGridTableView);
    procedure imgOrdenarVoltarClick(Sender: TObject);
    procedure imgOrdenarAvancarClick(Sender: TObject);
    procedure sqlCaixaSimplificadoBeforeOpen(DataSet: TDataSet);
    procedure imgImprimirRelSimplificadoClick(Sender: TObject);
    procedure lcxCentroCustoPropertiesChange(Sender: TObject);
    procedure chxTodosClick(Sender: TObject);
    procedure rdbDataRegistroClick(Sender: TObject);
    procedure Expo1Click(Sender: TObject);
  private
    vlCriandoForm, vlExportandoImagem, vlScannerAtivado : Boolean;
    vlVetMeses   : TVetMeses;
    vlVetPeriodo : array[1..12] of string;
    vlArquivoImagem : string;
    vlSqlPesquisa, vlCondicao, vlCondSimpl, vlListaProvisao : String;
    FSaldoAnterior, vlSaldoMesAnterior, vlSaldoPeriodo : real;
    FOrdem : Integer;

    function LerImagem(Numero: Integer; vpSiglaImg : Char; vpTipoDocumento : String;
          vpTransferencia : string = '#'; vpSomenteLeitura : Boolean = False): Boolean;
    procedure MontarPeriodos;
    procedure MontarSqlContas;
    procedure MontarSqlPesquisaSimplificada;
    procedure AtualizarSaldoContas;
    procedure EmitirReciboComprovante(vpTipo, vpMsg : String);
    procedure AtualizarSaldo;
    procedure AtualizarOrdemExtrato(vpVoltar : Boolean;
            vpSimpleDataSet : TI9Query);
    procedure ParametrosRelatorioSimplificado;
    procedure ExcluirItem(vpSimpleDataSet : TI9Query);
    procedure GerarPdfImagemLivroCaixa;
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
  CadastroRapidoLancamento, RotinasImagem;

{$R *.dfm}

procedure TfrmLivroCaixa.actExportarExcelClick(Sender: TObject);
begin
{  if not DirectoryExists('C:\TEMP\') then
    MkDir('C:\TEMP\');

  if pgcVisualizacao.ActivePageIndex = 0 then
       ExportGridToExcel('C:\TEMP\RELTEMP.XLS', grdBasica)
  else ExportGridToExcel('C:\TEMP\RELTEMP.XLS', grdSimplificada);

  AbrirPlanilha();}

  if pgcVisualizacao.ActivePageIndex = 0 then
       dtmLookup.ExportarExcel(grdBasica)
  else dtmLookup.ExportarExcel(grdSimplificada);
end;

procedure TfrmLivroCaixa.AtualizarOrdemExtrato(vpVoltar : Boolean;
            vpSimpleDataSet : TI9Query);
var
  viSql : String;
  viOrdemAtual, viOrdemNova  : Integer;
  viDataPosterior, viDataAnterior : TDate;

  procedure AtualizarRegistro(vpOrdemAtualizar, vpOrdemNova : string);
  begin
    // Atualiza Registro Posterior/Anterior
    ExecutaSqlAuxiliar(' UPDATE J_LIVRO_CAIXA SET ORDEM = '+ vpOrdemNova+
                       ' WHERE ORDEM =  '+vpOrdemAtualizar,1);
  end;

begin
  if cxGridBasicaDBDataPag.SortIndex <> 0 then
  begin
    Application.MessageBox(Pchar('Os registros devem estar ordenados por data.'+#13+#13+
                                 'Pressione no T�tulo do Campo data para ordenar!!!'), 'Aten��o', MB_OK + MB_ICONWARNING);
    exit;
  end;

  viOrdemAtual := vpSimpleDataSet.FieldByName('ORDEM').AsInteger;
  vpSimpleDataSet.DisableControls;

  viDataAnterior := vpSimpleDataSet.FieldByName('DATA_PAGAMENTO').AsDateTime;

  if vpVoltar then
       vpSimpleDataSet.Prior
  else vpSimpleDataSet.Next;
  viOrdemNova     := vpSimpleDataSet.FieldByName('ORDEM').AsInteger;
  viDataPosterior := vpSimpleDataSet.FieldByName('DATA_PAGAMENTO').AsDateTime;

  if viDataAnterior <> viDataPosterior then
  begin
    vpSimpleDataSet.EnableControls;
    Application.MessageBox(Pchar('Data n�o pode ser alterada!!!'), 'Aten��o', MB_OK + MB_ICONWARNING);
    exit;
  end;

  AtualizarRegistro(IntToStr(viOrdemNova), '999999');
  AtualizarRegistro(IntToStr(viOrdemAtual) , IntToStr(viOrdemNova));
  AtualizarRegistro('999999' , IntToStr(viOrdemAtual));
  tbcPeriodoChange(self);
  vpSimpleDataSet.Locate('ORDEM', viOrdemNova, [loCaseInsensitive]);
  vpSimpleDataSet.EnableControls;


{  FOrdem := 0;
  FSaldoAnterior := vlSaldoMesAnterior;
  sqlLivroCaixa.Refresh;
  sqlCaixaSimplificado.Refresh;}

//  vpSimpleDataSet.Locate('ORDEM', viOrdemNova, [loCaseInsensitive]);
//  vpSimpleDataSet.EnableControls;

  //if pgcVisualizacao.ActivePageIndex = 0 then
//       cxGridPesquisa.DataController.SelectRows(cxGridPesquisa.DataController.RecNo-1,cxGridPesquisa.DataController.RecNo-1)
//  else cxGridDBTableView1.DataController.SelectRows(cxGridDBTableView1.DataController.RecNo-1,cxGridDBTableView1.DataController.RecNo-1);

{  FOrdem := 0;
  FSaldoAnterior := vlSaldoMesAnterior;
  sqlLivroCaixa.Refresh;
  sqlCaixaSimplificado.Refresh;}
end;

procedure TfrmLivroCaixa.AtualizarSaldo;
var
  viSaldo : Currency;
  viConta, viDataCalculo : String;
  viAnoMesAnterior : Integer;
begin
  if lcbConta.EditValue = null then
    exit;

  viConta := '';
  if lcbConta.EditValue > 0 then
    viConta := IntToStr(lcbConta.EditValue);

  // Saldo Atual
  viSaldo := dtmLookupContabil.CalcularSaldoCaixa(lcxTipoCaixa.EditValue, viConta,'');
  dtmLookupContabil.CarregarSaldoVisualizacao(dxBarStaticSaldoAtual,  'Saldo Atual R$ ', viSaldo);

  // Saldo do Periodo
  viDataCalculo    := dtmLookupContabil.PegarDataFinalMes(vlVetPeriodo[tbcPeriodo.TabIndex+1]);
  vlSaldoPeriodo   := dtmLookupContabil.CalcularSaldoCaixa(lcxTipoCaixa.EditValue, viConta, '',viDataCalculo);
  dtmLookupContabil.CarregarSaldoVisualizacao(dxBarStaticSaldoPeriodo,  'Saldo de '+tbcPeriodo.Tabs[tbcPeriodo.TabIndex].Caption+' R$ ', vlSaldoPeriodo, True);

  // Saldo Mes Anterior
  viAnoMesAnterior := dtmLookupContabil.PegarAnoMes(viDataCalculo, True);
  vlSaldoMesAnterior   := dtmLookupContabil.CalcularSaldoCaixa(lcxTipoCaixa.EditValue, viConta, '', dtmLookupContabil.PegarDataFinalMes(IntToStr(viAnoMesAnterior)));
  dtmLookupContabil.CarregarSaldoVisualizacao(dxBarStaticSaldoAnterior,   'Saldo M�s Anterior R$ ', vlSaldoMesAnterior);
end;

procedure TfrmLivroCaixa.AtualizarSaldoContas;
begin

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
  lcxReserva.EditValue         := null;
  lcxCentroCusto.EditValue     := null;
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

procedure TfrmLivroCaixa.cxBtnIncluirClick(Sender: TObject);
begin
  vgDadosCadastro.SomentePesquisa := True;
  dtmLookupServico.CarregarDadosLancamento(1, 0, nil);
  CadLancamentoCaixa(True);
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

procedure TfrmLivroCaixa.chxTodosClick(Sender: TObject);
begin
  if chxTodos.Checked then
    lcxTipoCaixa.EditValue := -1;
  MontarSqlContas;
  cxGridPesquisa.DataController.Groups.FullExpand;
end;

procedure TfrmLivroCaixa.cxBtnAlterarClick(Sender: TObject);
var
  viLancamentoParcial : Boolean;
begin

  if sqlLivroCaixaSITUACAO.AsString = 'F' then
  begin
    Application.MessageBox(Pchar('Altera��o n�o permitida. Livro Caixa Fechado!!!'), 'Aten��o', MB_OK + MB_ICONWARNING);
    exit;
  end;

  if (DateToStr(sqlLivroCaixaDATA_PAGAMENTO.AsDateTime) <> dtmControles.DataHoraBanco(4))
      and (vgLogin <> 'I937') then
  begin
    if Application.MessageBox('Data de Lan�amento Diferente da Data Atual. Solicitar Permiss�o?', 'Confirma��o', MB_YESNO) = IDNO then
      exit;

    if LiberarPermissaoUsuario('ESP_PERMISSAO_DATA')[6] = '0' then
      exit;
  end;

  if (sqlLivroCaixaINTERNO.AsString = 'S') then
  begin
    Application.MessageBox(Pchar('Item n�o pode ser alterado!!!'), 'Aten��o', MB_OK + MB_ICONWARNING);
    exit;
  end;

  vgDadosCadastro.SomentePesquisa := False;
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
        exit;
      end;
    end;

    if (sqlLivroCaixaCOMPROMISSO_VENCIDO_ID.AsInteger > 0) then
    begin
      Application.MessageBox(Pchar('Item s� pode ser alterado pelo Gerenciador de Receitas!!!'), 'Aten��o', MB_OK + MB_ICONWARNING);
      exit;
    end;

    vgDadosCadastro.SomentePesquisa := True;
    vgDadosLivroCaixa.Bloqueado     := (sqlLivroCaixaIDENTIFICACAO_ID.AsInteger > 0);
    dtmLookupServico.CarregarDadosLancamento(2, sqlLivroCaixaLIVRO_CAIXA_ID.AsInteger, sqlLivroCaixa);
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
    CadTransferencia(True);
  end;

  if vgDadosCadastro.Confirmado then
  begin
    sqlLivroCaixa.Refresh;
    if vgDadosLivroCaixa.Novo then
      sqlLivroCaixa.Locate('CAIXA_TRANSFERENCIA_ID', vgDadosLivroCaixa.CaixaTransferenciaId, [loCaseInsensitive]);
  end;
  AtualizarSaldo
end;

procedure TfrmLivroCaixa.cxBtnExluirClick(Sender: TObject);
begin
  if pgcVisualizacao.ActivePageIndex = 0 then
    ExcluirItem(sqlLivroCaixa)
  else
    Application.MessageBox(Pchar('Exclus�o somente pela Visualiza��o Detalhada!!!'), 'Aten��o', MB_OK + MB_ICONWARNING);
end;

procedure TfrmLivroCaixa.cxButton3Click(Sender: TObject);
begin
  btnLimparClick(self);
  dtmLookupContabil.CarregarSaldoCaixa(ClientCaixa, True);
  lcbConta.EditValue := 0;
  btnPesquisarClick(self);
end;

procedure TfrmLivroCaixa.cxGridDBTableView1DblClick(Sender: TObject);
begin
  Application.MessageBox(Pchar('Altera��o somente pela visualiza��o detalhada!!!'), 'Aten��o', MB_OK + MB_ICONWARNING);
{  if sqlCaixaSimplificadoITEM_UNICO.AsString = 'S' then
  begin
    if cxBtnAlterar.Enabled then
    begin
      sqlLivroCaixa.Locate('LIVRO_CAIXA_ID'
      cxBtnAlterarClick(self);
    end;
  end
  else
  begin
    Application.MessageBox(Pchar('Altera��o somente pela visualiza��o detalhada!!!'), 'Aten��o', MB_OK + MB_ICONWARNING);
    exit;
  end;}
end;

procedure TfrmLivroCaixa.cxGridDBTableView1SelectionChanged(
  Sender: TcxCustomGridTableView);
var
  viQtd : Integer;

  Procedure VerificarAgrupamento;
  begin
    viQtd := cxGridDBTableView1.DataController.GetSelectedCount;
    if viQtd = 1 then
    begin
      gbxSomaItensSelecionados.Visible := False;
      exit;
    end;
    gbxSomaItensSelecionados.Visible := True;
    dtmLookupFinanceiro.SomarSelecionados(cxGridDBTableView1, edtValorSomaSelecionados, cxGridDBTableView1RECEITA,
                                          cxGridDBTableView1DESPESA, cxGridDBTableView1operacao, False,0);
  end;

begin
  pnlOpcoes.Visible := not sqlLivroCaixa.IsEmpty;
  VerificarAgrupamento;
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
      gbxSomaItensSelecionados.Visible := False;
      exit;
    end;
    gbxSomaItensSelecionados.Visible := True;
    dtmLookupFinanceiro.SomarSelecionados(cxGridPesquisa, edtValorSomaSelecionados, cxGridBasicaDBValorReceita, cxGridBasicaDBValorDespesa, cxGridBasicaDBOperacao, False,0);
  end;


  procedure VerificarEmitirReciboComprovante;
  begin
    pnlRecibo.Visible            :=  sqlLivroCaixaDOC_TIPO.AsString = 'R';
//    pnlEmitirComprovante.Visible :=  sqlLivroCaixaDOC_TIPO.AsString = 'F';
  end;

begin
  pnlOpcoes.Visible := not sqlLivroCaixa.IsEmpty;
  VerificarAgrupamento;
  VerificarEmitirReciboComprovante;
end;

procedure TfrmLivroCaixa.btnAdValorClick(Sender: TObject);
begin
  edtValorSomaSelecionados.EditValue := dtmLookupFinanceiro.AdicionarDeduzirValorSelecionados(edtValorSomaSelecionados.EditValue,'A');
end;

procedure TfrmLivroCaixa.btnDeduzirValorClick(Sender: TObject);
begin
  edtValorSomaSelecionados.EditValue := dtmLookupFinanceiro.AdicionarDeduzirValorSelecionados(edtValorSomaSelecionados.EditValue,'D');
end;

procedure TfrmLivroCaixa.btnEmitirComprovanteClick(Sender: TObject);
begin
//  EmitirReciboComprovante('F','Doc.Fiscal');
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
  if DateToStr(sqlLivroCaixaDATA_PAGAMENTO.AsDateTime) <> dtmControles.DataHoraBanco(4) then
  begin
    if Application.MessageBox('Data de Lan�amento Diferente da Data Atual. Solicitar Permiss�o?', 'Confirma��o', MB_YESNO) = IDNO then
      exit;

    if LiberarPermissaoUsuario('ESP_PERMISSAO_DATA')[6] = '0' then
      exit;
  end;

  if Application.MessageBox(Pchar('Estornar item selecionado. Confirma?'), 'Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
    exit;

  viId   := sqlLivroCaixaLIVRO_AGENDAMENTO_ID.AsInteger;

  viLivroFinanceiroId := sqlLivroCaixaLIVRO_FINANCEIRO_ID.AsString;
  ExecutaSqlAuxiliar('DELETE FROM J_LIVRO_CAIXA WHERE LIVRO_CAIXA_ID = '+sqlLivroCaixaLIVRO_CAIXA_ID.AsString,1);

  dtmLookupFinanceiro.BaixarEstornar('E', '', StrToInt(viLivroFinanceiroId), viId, 0, 0);
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
  viRelatorioId : String;

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
        dtmLookup.UpdateSimplesTabela('J_LIVRO_CAIXA', 'IDENTIFICACAO_ID', ' AND DOC_TIPO = '+QuotedStr(vpTipo),
                                      IntToStr(viReciboCompId), VarToStr(Values[ARowInfo.RecordIndex, cxGridBasicaDBCodigo.index]));
      end;
    end;
  end;

  procedure BuscarRelatorio(vpModelo : String);
  begin
    viRelatorioId := dtmControles.BuscarConfig('FINANCEIRO','RELATORIO',vpModelo,'S');
    if viRelatorioId = '' then
    begin
      Application.MessageBox(Pchar('Comprovante/Recibo n�o Configurado!!!'), 'Aten��o', MB_OK + MB_ICONWARNING);
      abort;
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
  sqlRecibo.ParamByName('IDENTIFICACAO_ID').AsInteger := viReciboCompId;
  sqlRecibo.ParamByName('DOC_TIPO').AsString          := vpTipo;
  sqlRecibo.Active := True;

  dtmLookup.CarregarCabecalho(sqlLivroCaixaBALANCETE_GRUPO_ID.AsInteger);
  case vpTipo[1] of
    'F' : begin
            BuscarRelatorio('COMPROVANTE_DOC_FISCAL');
            ExibirRelatorio(frxRecibo, viRelatorioId, ParametrosRelatorio, True);
          end;
    'R' : begin
            if sqlLivroCaixaOPERACAO.AsString = 'D' then
                 BuscarRelatorio('RECIBO_SAIDA_FINANCEIRO')
            else BuscarRelatorio('RECIBO_ENTRADA_FINANCEIRO');
            ExibirRelatorio(frxRecibo, viRelatorioId, ParametrosRelatorio, True);
          end;
  end;
  Screen.Cursor := crDefault;
end;

procedure TfrmLivroCaixa.ExcluirItem(vpSimpleDataSet: TI9Query);
var
  viMensagem, viCaixaTransferenciaID, viSql : String;
begin
  if vpSimpleDataSet.FieldByName('SITUACAO').AsString = 'F' then
  begin
    Application.MessageBox(Pchar('Exclus�o n�o permitida. Livro Caixa Fechado!!!'), 'Aten��o', MB_OK + MB_ICONWARNING);
    exit;
  end;

  if (sqlLivroCaixaLIVRO_FINANCEIRO_ID.AsInteger > 0) or (sqlLivroCaixaINTERNO.AsString = 'S') then
  begin
    Application.MessageBox(Pchar('Item de Agendamento n�o pode ser exclu�do.'+#13+#13+ 'Estorne e/ou Cancele o Item!!!'), 'Aten��o', MB_OK + MB_ICONWARNING);
    exit;
  end;

  if (sqlLivroCaixaCOMPROMISSO_VENCIDO_ID.AsInteger > 0) then
  begin
    Application.MessageBox(Pchar('Item s� pode ser exclu�do e/ou estornado pelo Gerenciador de Receitas!!!'), 'Aten��o', MB_OK + MB_ICONWARNING);
    exit;
  end;

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
      and (vgLogin <> 'I937') then
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

procedure TfrmLivroCaixa.Expo1Click(Sender: TObject);
begin
  GerarPdfImagemLivroCaixa;
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

procedure TfrmLivroCaixa.mniEstornarItemClick(Sender: TObject);
begin
  if sqlLivroCaixaSITUACAO.AsString = 'F' then
  begin
    Application.MessageBox(Pchar('Estorno n�o permitido. Livro Caixa Fechado!!!'), 'Aten��o', MB_OK + MB_ICONWARNING);
    exit;
  end;

  dxBarEstornarClick(Self);
end;

procedure TfrmLivroCaixa.mniExcluirClick(Sender: TObject);
begin
  cxBtnExluirClick(Self);
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
    ExecSQL;
  end;
  sqlLivroCaixa.Refresh;
end;

procedure TfrmLivroCaixa.FormActivate(Sender: TObject);
begin
  if vlExportandoImagem then
    Exit;

  if not vlCriandoForm then
  begin
    cbxOrganizarPropertiesChange(self);
    AtualizarSaldo;
  end
  else
  begin
    MontarPeriodos;
    btnLimparClick(self);
    dtmLookupContabil.CarregarSaldoCaixa(ClientCaixa, True);
    lcbConta.EditValue := 0;
    vlCriandoForm := False;
    cbxOrganizarPropertiesChange(Self);
  end;
  vlCriandoForm := False;

  edtBuscaRapida.SetFocus;
end;

procedure TfrmLivroCaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmLivroCaixa := nil;
end;

procedure TfrmLivroCaixa.FormCreate(Sender: TObject);
begin
  vgDataAtualTipo4     := dtmControles.DataHoraBanco(4);
  vgDataAtualTipoDate  := StrToDate(vgDataAtualTipo4);
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
  sqlCaixaSimplificado.Connection := dtmControles.DB;
  sqlTransfProvisao.Connection    := dtmControles.DB;

  vlCriandoForm            := True;
  cbxOrganizar.ItemIndex   := dtmControles.BuscarConfig('FINANCEIRO','LIVRO_CAIXA','TIPO_ORDENACAO_LIVRO_CAIXA','I');

  tbcPeriodo.Tabs.Clear;
  rdbPesquisaSimplificada.Checked := True;
  pgcVisualizacao.ActivePageIndex := 0;
  rdbPesquisaSimplificadaClick(self);
end;

procedure TfrmLivroCaixa.FormDeactivate(Sender: TObject);
begin
  vgDadosCadastro.AtualizarSaldo:= True;
end;

procedure TfrmLivroCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 107) and (gbxSomaItensSelecionados.Visible) then
    btnAdValorClick(self);

  if (key = 109) and (gbxSomaItensSelecionados.Visible) then
    btnDeduzirValorClick(self);
end;

procedure TfrmLivroCaixa.GerarPdfImagemLivroCaixa;
var
  viSaveDialog: TSaveDialog;
//  viGEDFin: TGedFinanceiro;
  viArquivoImagem,
  viCaminhoDestino: string;
  viRelPrimeiraPagina,
  viRelPaginaAnexo: Integer;
const
  C_TEMP_IMAGEM = 'C:\Temp\ImgFimTemp.tiff';
  C_TEMP_REL = 'C:\Temp\RelFimTemp.jpg';

  {$REGION 'SalvarImagemRelatorio'}
  procedure SalvarImagemRelatorio(const vpRelId: Integer);
  begin
    vlExportandoImagem := True;
    DeleteFile(C_TEMP_REL);

    if vpRelId > 0 then
    begin
      dtmControles.frxJPEGExport1.SeparateFiles := False;
      dtmControles.frxJPEGExport1.FileName := 'C:\Temp\RelFimTemp.jpeg';

      dtmLookup.CarregarCabecalho(1);
      ExibirRelatorio(
        dtmControles.frxRelatorio,
        vpRelId.ToString,
        ParametrosRelatorio,
        False,
        EmptyStr,
        False,
        True,
        EmptyStr,
        dtmControles.frxJPEGExport1);

      RotinasImagem.SaveTiffFile(C_TEMP_REL, C_TEMP_IMAGEM, True);
      vlExportandoImagem := False;
    end;
  end;
  {$ENDREGION}
begin
  viSaveDialog := nil;
//  viGEDFin := nil;
  viArquivoImagem  := EmptyStr;
  viCaminhoDestino := EmptyStr;

  viRelPrimeiraPagina := dtmControles.BuscarConfig('FINANCEIRO','LIVRO_CAIXA','REL_PRIMEIRA_PAGINA_LIVRO_CAIXA','I');
  viRelPaginaAnexo := dtmControles.BuscarConfig('FINANCEIRO','LIVRO_CAIXA','REL_ANEXO_PAGINA_LIVRO_CAIXA','I');

  if not DirectoryExists('c:\Temp') then
    ForceDirectories('c:\Temp');

  DeleteFile(C_TEMP_IMAGEM);

  vlCriandoForm := True;
  sqlLivroCaixa.DisableControls;
  try
    viSaveDialog := TSaveDialog.Create(nil);
    viSaveDialog.Filter := 'PDF files (*.pdf)|*.pdf';
    viSaveDialog.DefaultExt := 'pdf';

    if not viSaveDialog.Execute then
      Exit;

    viCaminhoDestino := viSaveDialog.FileName;

    SalvarImagemRelatorio(viRelPrimeiraPagina);

//    viGEDFin := TGedFinanceiro.Create(TTipoArquivo.tiLivroCaixa, TFormatoArquivo.faImagem, '.i9s');

    sqlLivroCaixa.First;
    while not sqlLivroCaixa.Eof do
    begin
      if sqlLivroCaixacalc_ImagemVinculada.AsString = '1' then
      begin
        SalvarImagemRelatorio(viRelPaginaAnexo);

{        if sqlLivroCaixaINDICE_IMAGEM.AsInteger > 0 then
           LerImagem(sqlLivroCaixaINDICE_IMAGEM.AsInteger, 'F', 'Financeiro', '#', True)
        else
          if sqlLivroCaixaCAIXA_TRANSFERENCIA_ID.AsInteger = 0 then
               LerImagem(sqlLivroCaixaLIVRO_CAIXA_ID.AsInteger, 'F', 'Financeiro', '#', True)
          else LerImagem(sqlLivroCaixaCAIXA_TRANSFERENCIA_ID.AsInteger, 'F', 'Financeiro', 'T', True);

     {   if sqlLivroCaixaINDICE_IMAGEM.AsInteger > 0 then
          viArquivoImagem := viGEDFin.CaminhoArquivo(sqlLivroCaixaINDICE_IMAGEM.AsInteger)
        else
        if sqlLivroCaixaCAIXA_TRANSFERENCIA_ID.AsInteger = 0 then
          viArquivoImagem := viGEDFin.CaminhoArquivo(sqlLivroCaixaLIVRO_CAIXA_ID.AsInteger)
        else
          viArquivoImagem := viGEDFin.CaminhoArquivo(sqlLivroCaixaLIVRO_CAIXA_ID.AsInteger, '', 'T');}

        viArquivoImagem := vlArquivoImagem;
        RotinasImagem.SaveTiffFile(viArquivoImagem, C_TEMP_IMAGEM, True);
      end;

      sqlLivroCaixa.Next;
    end;

    if FileExists(C_TEMP_IMAGEM) then
      RotinasImagem.ConvertTiffToPDF(C_TEMP_IMAGEM, viCaminhoDestino);

    vlCriandoForm := False;
  finally
    sqlLivroCaixa.EnableControls;
    FreeAndNil(viSaveDialog);
//    FreeAndNil(viGEDFin);
    DeleteFile(C_TEMP_IMAGEM);
    DeleteFile(C_TEMP_REL);
  end;
end;

procedure TfrmLivroCaixa.icxTipoCreditoPropertiesChange(Sender: TObject);
begin
  chxTodos.Checked := False;
  MontarSqlContas;
  cxGridPesquisa.DataController.Groups.FullExpand;
end;

procedure TfrmLivroCaixa.imgImprimirRelSimplificadoClick(Sender: TObject);
var
  viRelatorio : string;
begin
  viRelatorio := dtmControles.BuscarConfig('FINANCEIRO', 'RELATORIO','LIVRO_DIARIO_SIMPLIFICADO', 'S');
  if viRelatorio = '' then
  begin
    Application.MessageBox(Pchar('Relat�rio simplificado n�o configurado!!!'), 'Aten��o', MB_OK + MB_ICONWARNING);
    exit;
  end;
  dtmLookup.CarregarCabecalho(1);
  ExibirRelatorio(dtmControles.frxRelatorio, viRelatorio, ParametrosRelatorioSimplificado, True);
end;

procedure TfrmLivroCaixa.imgOrdenarAvancarClick(Sender: TObject);
begin
  if pgcVisualizacao.ActivePageIndex = 0 then
       AtualizarOrdemExtrato(False, sqlLivroCaixa)
  else AtualizarOrdemExtrato(False, sqlCaixaSimplificado);
end;

procedure TfrmLivroCaixa.imgOrdenarVoltarClick(Sender: TObject);
begin
  if pgcVisualizacao.ActivePageIndex = 0 then
       AtualizarOrdemExtrato(True, sqlLivroCaixa)
  else AtualizarOrdemExtrato(True, sqlCaixaSimplificado);
end;

procedure TfrmLivroCaixa.lblCancelarComprovanteClick(Sender: TObject);
begin
  if Application.MessageBox(Pchar(lblCancelarComprovante.Caption+'. Confirma?'), 'Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
    exit;

  ExecutaSqlAuxiliar(' UPDATE J_LIVRO_CAIXA SET IDENTIFICACAO_ID = NULL '+
                     ' WHERE DOC_TIPO = '+QuotedStr(sqlLivroCaixaDOC_TIPO.AsString)+
                     '   AND IDENTIFICACAO_ID = '+sqlLivroCaixaIDENTIFICACAO_ID.AsString,1);
  sqlLivroCaixa.Refresh;
  sqlCaixaSimplificado.Refresh;
end;

procedure TfrmLivroCaixa.lcbContaPropertiesEditValueChanged(Sender: TObject);
begin
  if vlCriandoForm then
    exit;

  lcxTipoCaixa.Enabled := lcbConta.ItemIndex = 0;
  lblTipoCaixa.Enabled := lcbConta.ItemIndex = 0;
  chxTodos.Enabled     := lcbConta.ItemIndex = 0;

  if lcbConta.ItemIndex > 0 then
       lcxTipoCaixa.EditValue := -1
  else chxTodos.Checked := True;

  MontarSqlContas;
  cxGridPesquisa.DataController.Groups.FullExpand;
end;

procedure TfrmLivroCaixa.lcxBalanceteGrupoPropertiesChange(Sender: TObject);
begin
  btnPesquisarClick(self);
end;

procedure TfrmLivroCaixa.lcxCentroCustoPropertiesChange(Sender: TObject);
begin
   edtDataInicial.EditValue := null;
   edtDataFinal.EditValue   := null;
end;

procedure TfrmLivroCaixa.lcxPesqCompromissoPropertiesChange(Sender: TObject);
begin
  btnPesquisarClick(self);
end;

function TfrmLivroCaixa.LerImagem(Numero: Integer; vpSiglaImg : Char;
        vpTipoDocumento : String; vpTransferencia : string = '#';
        vpSomenteLeitura : Boolean = False): Boolean;
var
  viArquivo : string;
begin
  if not dtmLookup.VerificarPastaImagem(vpTipoDocumento, Numero) then
    exit;

  vlArquivoImagem := vgDadosImagem.Pasta + vpSiglaImg +'_' + FormatFloat('000000',Numero)+vpTransferencia+'.i9s';
  if vpSomenteLeitura then
    Exit;
  fmeImagem1.LoadFromFile(vlArquivoImagem);
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
  viSql, viCondicao, viCondicaoTranf, viConta, viValor : String;
  viSaldo  : Currency;

  procedure MontarCondicao;
  begin
    viCondicao := '';
    viConta    := '';

    if lcbConta.EditValue > 0 then
    begin
      viConta    := IntToStr(lcbConta.EditValue);
      viCondicao := ' AND LC.CAIXA_ID = '+ viConta;
    end;

    if lcxTipoCaixa.Text <> '' then
      viCondicao := ' AND (C.TIPO_CAIXA = '+ QuotedStr(lcxTipoCaixa.EditValue)+
                    ' AND (LC.RELATORIO_INTERNO IS NULL OR (LC.RELATORIO_INTERNO = '+QuotedStr('S')+')))';

    // Por Periodo Personalizado e/ou Periodo ANO/Referencia
    if pnlDadosFiltroPersonalizado.Visible then
    begin
      if lcxCentroCusto.EditValue = null then
        if rdbDataRegistro.Checked then
             viCondicaoTranf :=  ' AND LC.DATA_PAGAMENTO '+ MontarSqlData(edtDataInicial.Date , edtDataFinal.Date)
        else viCondicaoTranf :=  ' AND LC.DATA_LANCAMENTO '+ MontarSqlData(edtDataInicial.Date , edtDataFinal.Date);

      if lcxPesqCompromisso.EditValue <> null then
        viCondicaoTranf := ' AND LC.CONTABIL_CONTA_ID = '+IntToStr(lcxPesqCompromisso.EditValue);
    end
    else
      if (tbcPeriodo.Tabs.Count > 0) then
        viCondicaoTranf := ' AND ANO_MES_REGISTRO = '+ QuotedStr(vlVetPeriodo[tbcPeriodo.TabIndex+1]);

    viCondicao := viCondicao + viCondicaoTranf;

    if icxTipoCredito.EditValue = 1 then
      viCondicao := viCondicao + ' AND LC.OPERACAO = '+ QuotedStr('R')
    else
      if icxTipoCredito.EditValue = 2 then
        viCondicao := viCondicao + ' AND LC.OPERACAO = '+ QuotedStr('D')
    else
      if icxTipoCredito.EditValue = 3 then
        viCondicao := viCondicao + ' AND ((LC.OPERACAO = '+ QuotedStr('AD')+') OR (LC.OPERACAO = '+ QuotedStr('AR')+') OR'+
                                   '      (LC.OPERACAO = '+ QuotedStr('TD')+') OR (LC.OPERACAO = '+ QuotedStr('TR')+'))'
    else viCondicao := viCondicao + ' AND NOT ((LC.OPERACAO = '+ QuotedStr('PD')+') OR (LC.OPERACAO = '+ QuotedStr('PR')+'))';

    case cbxTipoDoc.ItemIndex of
      1 : viCondicao := viCondicao + ' AND LC.DOC_TIPO = '+ QuotedStr('F');
      2 : viCondicao := viCondicao + ' AND LC.DOC_TIPO = '+ QuotedStr('R');
      3 : viCondicao := viCondicao + ' AND LC.DOC_TIPO = '+ QuotedStr('B');
      4 : viCondicao := viCondicao + ' AND LC.DOC_TIPO = '+ QuotedStr('E');
      5 : viCondicao := viCondicao + ' AND LC.DOC_TIPO = '+ QuotedStr('T');
      6 : viCondicao := viCondicao + ' AND LC.DOC_TIPO = '+ QuotedStr('ER');
      7 : viCondicao := viCondicao + ' AND LC.DOC_TIPO = '+ QuotedStr('EB');
      8 : viCondicao := viCondicao + ' AND LC.DOC_TIPO = '+ QuotedStr('0');
    end;

    if rdbEmitirConfirmado.Checked then
      viCondicao := viCondicao + ' AND NOT LC.IDENTIFICACAO_ID IS NULL '
    else
      if rdbEmitirPendente.Checked then
        viCondicao := viCondicao + ' AND LC.IDENTIFICACAO_ID IS NULL ';

    if lcxBalanceteGrupo.EditValue <> null then
      viCondicao := viCondicao + ' AND LC.BALANCETE_GRUPO_ID = '+IntToStr(lcxBalanceteGrupo.EditValue);

    if lcxReserva.EditValue <> null then
      viCondicao := viCondicao + ' AND LC.RESERVA_ID = '+IntToStr(lcxReserva.EditValue);

    if lcxCentroCusto.EditValue <> null then
      viCondicao := viCondicao + ' AND LC.CENTRO_CUSTO_ID = '+IntToStr(lcxCentroCusto.EditValue);

    if trim(edtBuscaRapida.Text) <> '' then
    begin
      viCondicao  := viCondicao + ' AND ((LC.HISTORICO LIKE '+ QuotedStr('%'+edtBuscaRapida.Text+'%')+')'+
                       ' OR (P.NOME LIKE '+ QuotedStr('%'+edtBuscaRapida.Text+'%') +')'+
                       ' OR (A.NOME LIKE '+ QuotedStr('%'+edtBuscaRapida.Text+'%') +')'+
                       ' OR (LC.OBSERVACAO LIKE '+ QuotedStr('%'+edtBuscaRapida.Text+'%') +')';


      viValor := TrocaVirgPPto(RetornaNumericoValor(edtBuscaRapida.Text));
      if viValor <> '' then
        viCondicao := viCondicao + ' OR (LC.VALOR = '+ viValor +')'; 

      vlCondSimpl := viCondicao +')';             
      viCondicao := viCondicao + ' OR (CC.DESCRICAO LIKE '+ QuotedStr('%'+edtBuscaRapida.Text+'%') +'))';    
    end
    else vlCondSimpl := viCondicao;       
  end;

  procedure MontarSqlTranfProvisao;
  var
    viSql : String;
  begin
    viSql := ' SELECT LC.LIVRO_CAIXA_ID, LC.HISTORICO, LC.DATA_PAGAMENTO, LC.OBSERVACAO, LC.OPERACAO, LC.RESERVA_ID, LC.VALOR '+
             ' FROM J_LIVRO_CAIXA LC '+
             ' WHERE OPERACAO IN (''PD'', ''PR'')'+ viCondicaoTranf +
             '  ORDER BY LC.LIVRO_CAIXA_ID ';
    sqlTransfProvisao.Active := False;
    sqlTransfProvisao.SQL.Text := viSql;
    sqlTransfProvisao.Active := True;
  end;

begin
  Screen.Cursor := crHourGlass;
  visql := ' SELECT LC.*, '+
           '        LF.LIVRO_AGENDAMENTO_ID, '+
           '        CC.DESCRICAO AS CONTABIL_CONTA_DESCRICAO, '+
           '        CC.GRUPO AS GRUPO_SECUDARIO, CC.INTERNO, '+
           '        CG.DESCRICAO AS GRUPO_PRINCIPAL,'+
           '    P.NOME, A.NOME AS ASSOCIADO '+
           '   FROM J_LIVRO_CAIXA LC '+
           '   LEFT OUTER JOIN J_LIVRO_FINANCEIRO LF ON '+
           '   LC.LIVRO_FINANCEIRO_ID = LF.LIVRO_FINANCEIRO_ID '+
           '   LEFT OUTER JOIN T_CONTABIL_CONTA CC ON '+
           '   LC.CONTABIL_CONTA_ID = CC.CONTABIL_CONTA_ID '+
           '   LEFT OUTER JOIN T_CONTABIL_GRUPO CG ON '+
           '   CC.CONTABIL_GRUPO_ID = CG.CONTABIL_GRUPO_ID '+
           '   LEFT OUTER JOIN J_PESSOA P ON '+
           '   LC.PESSOA_ID = P.PESSOA_ID '+
           '   LEFT OUTER JOIN T_PESSOA A ON '+
           '   LC.ASSOCIADO_ID = A.PESSOA_ID '+
           '   LEFT OUTER JOIN J_CAIXA C ON '+
           '   LC.CAIXA_ID = C.CAIXA_ID '+
           ' WHERE NOT LC.LIVRO_CAIXA_ID IS NULL ';

  if chxVerificarVinculos.Checked then
       viCondicao := ' AND LC.LIVRO_CAIXA_ID IN('+vlListaProvisao+')'
  else MontarCondicao;

  vlSqlPesquisa := viSql;
  vlCondicao    := viCondicao;

  if cbxOrganizar.ItemIndex = 0 then
       viSql := viSql + viCondicao + ' ORDER BY DATA_PAGAMENTO, ORDEM, LIVRO_CAIXA_ID'
  else viSql := viSql + viCondicao + ' ORDER BY DATA_PAGAMENTO DESC, ORDEM DESC, LIVRO_CAIXA_ID DESC';

  sqlLivroCaixa.AfterScroll := nil;
  sqlLivroCaixa.Active := False;
  sqlLivroCaixa.SQL.Text := viSql;
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

  MontarSqlPesquisaSimplificada;
  sqlCaixaSimplificado.AfterScroll := sqlCaixaSimplificadoAfterScroll;

  MontarSqlTranfProvisao;

  pnlOrdenacao.Enabled := NOT sqlLivroCaixa.IsEmpty;

  Screen.Cursor := crDefault;
end;

procedure TfrmLivroCaixa.MontarSqlPesquisaSimplificada;
var
  viSql : String;
begin
  Screen.Cursor := crHourGlass;
  visql := ' SELECT SUM(LC.VALOR) AS VALOR, LC.CAIXA_ID, LC.OPERACAO, LC.DATA_PAGAMENTO, LC.SITUACAO, DOCUMENTO_NUMERO, DOC_TIPO,'+
           '       LC.ORDEM, LC.CAIXA_TRANSFERENCIA_ID, IDENTIFICACAO_ID,COUNT(LC.LIVRO_CAIXA_ID) AS QTD, '+
           '     (CASE '+
           '       WHEN LC.DESCRICAO_AGRUPADOR <> '''' THEN LC.DESCRICAO_AGRUPADOR '+
           '       WHEN (LC.ASSOCIADO_ID = 0) OR (LC.ASSOCIADO_ID IS NULL) OR (LC.DOC_TIPO = ''F'') THEN P.NOME '+
           '       WHEN LC.ASSOCIADO_ID > 0 THEN A.NOME '+
           '     END) AS NOME_PESSOA, '+
           '    (CASE '+
           '       WHEN (LC.ASSOCIADO_ID = 0) OR (LC.ASSOCIADO_ID IS NULL) and (OPERACAO = ''D'') THEN ''S'' '+
           '       WHEN (LC.ASSOCIADO_ID = 0) OR (LC.ASSOCIADO_ID IS NULL) and (OPERACAO = ''R'') THEN ''S'' '+
           '      ELSE ''N'' '+
           '    END) AS ITEM_UNICO, '+
           '     (CASE '+
           '       WHEN (LC.ASSOCIADO_ID > 0) AND (OPERACAO = ''R'') THEN ''Recebimento de Associado'' '+
           '       WHEN (LC.ASSOCIADO_ID > 0) AND (OPERACAO = ''D'') THEN LC.HISTORICO '+
           '       WHEN (LC.ASSOCIADO_ID = 0) OR (LC.ASSOCIADO_ID IS NULL) and (OPERACAO = ''R'') THEN LC.HISTORICO '+
           '       WHEN (LC.ASSOCIADO_ID = 0) OR (LC.ASSOCIADO_ID IS NULL) and (OPERACAO = ''D'') THEN LC.HISTORICO '+
           '       WHEN (OPERACAO = ''AD'') THEN ''Retirada de Valores'' '+
           '       WHEN (OPERACAO = ''AR'') THEN ''Aporte de Valores'' '+
           '       WHEN (OPERACAO = ''TD'') THEN ''Sa�da - '' || LC.HISTORICO '+
           '       WHEN (OPERACAO = ''TR'') THEN ''Entrada - '' || LC.HISTORICO '+
           '     END) AS HISTORICO, '+
           '     (CASE WHEN (OPERACAO = ''D'') THEN LC.REFERENCIA '+
           '   ELSE '''''+
           '   END) AS REFERENCIA, '+
           ' (CASE WHEN ((DOCUMENTO_NUMERO = '''') OR (DOCUMENTO_NUMERO = NULL)) THEN CAST(IDENTIFICACAO_ID AS INTEGER) '+
           '  ELSE DOCUMENTO_NUMERO '+
           ' END) AS DOCUMENTO '+
           '   FROM J_LIVRO_CAIXA LC '+
           '     LEFT OUTER JOIN J_PESSOA P ON '+
           '     LC.PESSOA_ID = P.PESSOA_ID '+
           '     LEFT OUTER JOIN T_PESSOA A ON '+
           '     LC.ASSOCIADO_ID = A.PESSOA_ID '+
           '     LEFT OUTER JOIN J_CAIXA C ON '+
           '     LC.CAIXA_ID = C.CAIXA_ID '+
           '   WHERE NOT LC.LIVRO_CAIXA_ID IS NULL ';
  viSql := viSql + vlCondSimpl +
           ' GROUP BY DATA_PAGAMENTO, ORDEM, NOME_PESSOA, IDENTIFICACAO_ID, DOC_TIPO, DOCUMENTO_NUMERO, REFERENCIA, '+
           '  LC.CAIXA_ID, LC.OPERACAO, HISTORICO, ITEM_UNICO, LC.SITUACAO, LC.CAIXA_TRANSFERENCIA_ID ';

  if cbxOrganizar.ItemIndex = 0 then
       viSql := viSql + 'ORDER BY DATA_PAGAMENTO, ORDEM '
  else viSql := viSql + 'ORDER BY DATA_PAGAMENTO DESC, ORDEM DESC';

  sqlCaixaSimplificado.AfterScroll := nil;
  sqlCaixaSimplificado.Active := False;
  sqlCaixaSimplificado.SQL.Text := viSql;
  sqlCaixaSimplificado.Active := True;
end;

procedure TfrmLivroCaixa.ParametrosRelatorio;
var RichView1 : TfrxRichView;
    Memo1 : TfrxMemoView;
begin
  RichView1 := TfrxRichView(dtmControles.frxRelatorio.FindObject('rchCabecalho'));
  if RichView1 <> nil then
     RichView1.RichEdit.Text:= dtmControles.BuscarConfig('PRINCIPAL', 'RELATORIO', 'CABECALHO_RELATORIO', 'T')
  else begin
       Memo1 := TfrxMemoView(dtmControles.frxRelatorio.FindObject('mmoCabecalho'));
       if Memo1 <> nil then
          Memo1.Text:= dtmControles.BuscarConfig('PRINCIPAL', 'RELATORIO', 'CABECALHO_RELATORIO', 'W');;
  end;

  CriarFuncoesRelatorio(frxRecibo);

  dtmControles.frxRelatorio.Variables.Variables['MesAnoReferencia'] := QuotedStr(tbcPeriodo.Tabs[tbcPeriodo.TabIndex].Caption);
  dtmControles.frxRelatorio.Variables.Variables['Apresentante']     := QuotedStr(sqlLivroCaixaCALC_PESSOA.AsString);
  dtmControles.frxRelatorio.Variables.Variables['Historico']        := QuotedStr(sqlLivroCaixaHISTORICO.AsString);
  dtmControles.frxRelatorio.Variables.Variables['Caixa']            := QuotedStr(lcbConta.Text);
end;

procedure TfrmLivroCaixa.ParametrosRelatorioSimplificado;
begin
  dtmControles.frxRelatorio.Variables.Variables['SaldoAnterior'] := QuotedStr(FormatFloat('R$ ,#0.00', vlSaldoMesAnterior));
  dtmControles.frxRelatorio.Variables.Variables['SaldoPeriodo']  := QuotedStr(FormatFloat('R$ ,#0.00', vlSaldoPeriodo));
  dtmControles.frxRelatorio.Variables.Variables['Periodo']       := QuotedStr(tbcPeriodo.Tabs[tbcPeriodo.TabIndex].Caption);

  if (lcxTipoCaixa.Text = '') and (lcbConta.ItemIndex = 0) then
       dtmControles.frxRelatorio.Variables.Variables['TipoCaixa']   := QuotedStr('Todos Tipo de Caixa')
  else
    if (lcbConta.ItemIndex = 0) then
       dtmControles.frxRelatorio.Variables.Variables['TipoCaixa']   := QuotedStr(lcxTipoCaixa.Text)
  else dtmControles.frxRelatorio.Variables.Variables['TipoCaixa']   := QuotedStr('');

  dtmControles.frxRelatorio.Variables.Variables['Caixa'] := QuotedStr(lcbConta.Text);
end;

procedure TfrmLivroCaixa.pgcVisualizacaoChange(Sender: TObject);
begin
  if (sqlLivroCaixa.IsEmpty) or vlCriandoForm then
    exit;

  imgImprimirRelSimplificado.Visible := pgcVisualizacao.ActivePageIndex = 1;
  if pgcVisualizacao.ActivePageIndex = 0 then
  begin
    sqlLivroCaixa.Locate('ORDEM',sqlCaixaSimplificadoORDEM.AsInteger, [loCaseInsensitive]);
    cxGridPesquisa.Focused;
    cxGridPesquisa.Controller.FocusedRecordIndex;
    cxGridPesquisa.DataController.FocusedRecordIndex;
    grdBasica.SetFocus;
  end
  else
    if pgcVisualizacao.ActivePageIndex = 1 then
    begin
      sqlCaixaSimplificado.Locate('ORDEM',sqlLivroCaixaORDEM.AsInteger, [loCaseInsensitive]);
      cxGridDBTableView1.Focused;
      cxGridDBTableView1.Controller.FocusedRecordIndex;
      cxGridDBTableView1.DataController.FocusedRecordIndex;
      grdSimplificada.SetFocus;
    end;
end;

procedure TfrmLivroCaixa.rdbDataRegistroClick(Sender: TObject);
begin
  btnPesquisarClick(self);
end;

procedure TfrmLivroCaixa.rdbPesquisaPersonalizadaClick(Sender: TObject);

  procedure VerificarProvissaoTruncada;
  begin
    // Verificar Provis�o Itens Duplicados (Reserva no Livro Caixa e Reserva no Lancamento_compromisso)
//    vlListaProvisao := '';
{   vlListaProvisao := dtmControles.GetStr(' SELECT list(cast(ci.livro_caixa_id as integer))'+
                                           ' FROM J_LIVRO_CAIXA CI'+
                                           '   LEFT OUTER JOIN T_COMPROMISSO_VENCIDO CV ON'+
                                           '   CI.COMPROMISSO_VENCIDO_ID = CV.COMPROMISSO_VENCIDO_ID'+
                                           ' WHERE ((CI.OPERACAO = ''R'') OR (CI.OPERACAO = ''AR''))'+
                                           '   AND ANO_MES_REGISTRO >=''201704'''+
                                           '   AND NOT CI.RESERVA_ID IS NULL'+
                                           '   AND NOT CV.LANCAMENTO_COMPROMISSO_ID IS NULL ');
//    if vlListaProvisao <> '' then
//      ExecutaSqlAuxiliar(' UPDATE J_LIVRO_CAIXA SET RESERVA_ID = NULL '+
//                         ' WHERE LIVRO_CAIXA_ID IN ('+vlListaProvisao+')',1);}

   // Verificar Provis�o Truncada
    vlListaProvisao := '';
    vlListaProvisao := dtmControles.GetStr(' SELECT list(cast(ci.livro_caixa_id as integer)) '+
                                           ' FROM J_LIVRO_CAIXA CI '+
                                           '   LEFT OUTER JOIN T_COMPROMISSO_VENCIDO CV ON '+
                                           '   CI.COMPROMISSO_VENCIDO_ID = CV.COMPROMISSO_VENCIDO_ID '+
                                           '   LEFT OUTER JOIN T_COMPROMISSO_RESERVA CR ON '+
                                           '   CR.CONTABIL_CONTA_ID = CI.CONTABIL_CONTA_ID AND '+
                                           '   CR.REFERENCIA_ANOMES = CI.ANO_MES_REGISTRO AND '+
                                           '   CR.LANCAMENTO_COMPROMISSO_ID = CV.LANCAMENTO_COMPROMISSO_ID '+
                                           '   LEFT OUTER JOIN T_RESERVA R ON '+
                                           '   R.RESERVA_ID = CI.RESERVA_ID OR '+
                                           '   (R.RESERVA_ID = CR.RESERVA_ID AND '+
                                           '   NOT CV.LANCAMENTO_COMPROMISSO_ID IS NULL) '+
                                           '   LEFT OUTER JOIN T_BALANCETE_GRUPO BG ON '+
                                           '   CI.BALANCETE_GRUPO_ID = BG.BALANCETE_GRUPO_ID '+
                                           ' WHERE ((CI.OPERACAO = ''R'') OR (CI.OPERACAO = ''AR''))'+
                                           '   AND ANO_MES_REGISTRO >=''201704'''+
                                           '   AND R.RESERVA_ID IS NULL');
    chxVerificarVinculos.Visible := vlListaProvisao <> '';
  end;

begin
  VerificarProvissaoTruncada;
  LockWindowUpdate(Handle);
  pnlDadosFiltroPersonalizado.Visible := True;
  pnlFiltro.Height := 173;
  edtDataInicial.SetFocus;
  tbcPeriodo.HideTabs := True;
  LockWindowUpdate(0);
end;

procedure TfrmLivroCaixa.rdbPesquisaSimplificadaClick(Sender: TObject);
begin
  chxVerificarVinculos.Checked := False;
  LockWindowUpdate(Handle);
  pnlDadosFiltroPersonalizado.Visible := False;
  pnlFiltro.Height := 129;
  tbcPeriodo.HideTabs := False;
  LockWindowUpdate(0);

  if vlCriandoForm then
    exit;

  btnLimparClick(self);
  edtBuscaRapida.SetFocus;
end;

procedure TfrmLivroCaixa.ResetarCamposdaGrid1Click(Sender: TObject);
begin
  if Application.MessageBox('Resetar/Refazer Campos da Grid?', 'Confirma��o', MB_YESNO) = IDNO then
    exit;

  ExecutaSqlAuxiliar(' DELETE FROM J_GRID WHERE FORM = '+QuotedStr('LIVRO_CAIXA'),1);
  Application.MessageBox('Reabra o Formul�rio para ativar as configura��es da Grid!!!', 'Informa��o', mb_Ok + MB_ICONEXCLAMATION);
  DeleteFile(ExtractFileDir(Application.ExeName)+'\GRID_LIVROCAIXA.ini');
end;

procedure TfrmLivroCaixa.sqlCaixaSimplificadoAfterScroll(DataSet: TDataSet);
begin
  dxBarEstornar.Enabled         := False;
  mniEstornarItem.Enabled       := dxBarEstornar.Enabled;
  mniDuplicarItem.Enabled       := False;
  mniLancamentoFavorito.Enabled := False;
  cxBtnAlterar.Enabled          := (not sqlCaixaSimplificado.IsEmpty) and (sqlCaixaSimplificadoITEM_UNICO.AsString = 'S');
  mniExcluir.Enabled            := cxBtnAlterar.Enabled;
end;

procedure TfrmLivroCaixa.sqlCaixaSimplificadoBeforeOpen(DataSet: TDataSet);
begin
  FSaldoAnterior := vlSaldoMesAnterior;
  FOrdem         := 0;
end;

procedure TfrmLivroCaixa.sqlCaixaSimplificadoCalcFields(DataSet: TDataSet);
VAR
  viOperacao : String;
begin
  viOperacao := sqlCaixaSimplificadoOPERACAO.AsString;

  case viOperacao[1] of
    'R' : sqlCaixaSimplificadocalc_ValorReceita.AsCurrency := sqlCaixaSimplificadoVALOR.AsCurrency;
    'D' : sqlCaixaSimplificadocalc_ValorDespesa.AsCurrency := sqlCaixaSimplificadoVALOR.AsCurrency;
    'A', 'T' : begin
                 if (viOperacao = 'AR') or (viOperacao = 'TR') then
                      sqlCaixaSimplificadocalc_ValorReceita.AsCurrency := sqlCaixaSimplificadoVALOR.AsCurrency
                 else sqlCaixaSimplificadocalc_ValorDespesa.AsCurrency := sqlCaixaSimplificadoVALOR.AsCurrency;
               end;
  end;
//  sqlCaixaSimplificadoCALC_ORDEM.AsInteger := sqlCaixaSimplificado.RecNo;

  if Pos('T', sqlCaixaSimplificadoOPERACAO.AsString) > 0 then
    sqlCaixaSimplificadoCALC_OBSERVACAO.AsString := 'Caixa '+dtmControles.GetStr(' SELECT C.RESUMO '+
                                                                        ' FROM J_CAIXA C LEFT OUTER JOIN J_LIVRO_CAIXA LC ON ' +
                                                                        '   LC.CAIXA_ID = C.CAIXA_ID '+
                                                                        ' WHERE LC.CAIXA_TRANSFERENCIA_ID = '+sqlCaixaSimplificadoCAIXA_TRANSFERENCIA_ID.AsString+
                                                                        '   AND NOT LC.OPERACAO = '+QuotedStr(sqlCaixaSimplificadoOPERACAO.AsString));
  if DataSet.State = dsInternalCalc then
  begin
    if pos('R',sqlCaixaSimplificadoOPERACAO.AsString) > 0 then
         sqlCaixaSimplificadoCALC_SALDO.AsFloat := FSaldoAnterior + sqlCaixaSimplificadoVALOR.AsFloat
    else sqlCaixaSimplificadoCALC_SALDO.AsFloat := FSaldoAnterior - sqlCaixaSimplificadoVALOR.AsFloat;
    FSaldoAnterior := sqlCaixaSimplificadoCALC_SALDO.AsFloat;
    Inc(FOrdem);
    sqlCaixaSimplificadoCALC_ORDEM.AsInteger := FOrdem;
  end;
end;

procedure TfrmLivroCaixa.sqlLivroCaixaAfterRefresh(DataSet: TDataSet);
begin
  sqlCaixaSimplificado.Refresh;
end;

procedure TfrmLivroCaixa.sqlLivroCaixaAfterScroll(DataSet: TDataSet);
begin
  dxBarEstornar.Enabled   := (sqlLivroCaixaLIVRO_AGENDAMENTO_ID.AsInteger > 0);
  mniEstornarItem.Enabled := dxBarEstornar.Enabled;
  mniDuplicarItem.Enabled       := (not sqlLivroCaixa.IsEmpty) and (sqlLivroCaixaOPERACAO.AsString[1] in ['D', 'R']);
  mniLancamentoFavorito.Enabled := (not sqlLivroCaixa.IsEmpty) and (sqlLivroCaixaOPERACAO.AsString[1] in ['D', 'R']) AND
                                   (sqlLivroCaixaFAVORITO_SITUACAO.AsString <> 'S');
  cxBtnAlterar.Enabled    := not sqlLivroCaixa.IsEmpty;
  mniExcluir.Enabled      := cxBtnAlterar.Enabled;

  pnlCancelarComprovante.Visible := ((sqlLivroCaixaDOC_TIPO.AsString = 'F') or (sqlLivroCaixaDOC_TIPO.AsString = 'R'))
                                    and (sqlLivroCaixaIDENTIFICACAO_ID.AsInteger > 0);
  if sqlLivroCaixaDOC_TIPO.AsString = 'F' then
       lblCancelarComprovante.Caption := 'Cancelar Comprovante'
  else lblCancelarComprovante.Caption := 'Cancelar Emiss�o do Recibo';

end;

procedure TfrmLivroCaixa.sqlLivroCaixaCalcFields(DataSet: TDataSet);
var
  viOperacao : String;
{  procedure VerificarexistenciaImagem;
  begin
    if sqlLivroCaixaCAIXA_TRANSFERENCIA_ID.AsInteger = 0 then
    begin
      dtmLookup.VerificarPastaImagem('Financeiro', sqlLivroCaixaLIVRO_CAIXA_ID.AsInteger, True);
      vlArquivoImagem := vgDadosImagem.Pasta + 'F_' + FormatFloat('000000',sqlLivroCaixaLIVRO_CAIXA_ID.AsInteger)+'#.i9s'
    end
    else
    begin
      dtmLookup.VerificarPastaImagem('Financeiro', sqlLivroCaixaCAIXA_TRANSFERENCIA_ID.AsInteger, True);
      vlArquivoImagem := vgDadosImagem.Pasta + 'F_' + FormatFloat('000000',sqlLivroCaixaCAIXA_TRANSFERENCIA_ID.AsInteger)+'T.i9s';
    end;

    if FileExists(vlArquivoImagem) then
      sqlLivroCaixacalc_ImagemVinculada.AsString := '1'
  end;}

  procedure VerificarexistenciaImagem;
    procedure BuscarImagem(vpId : Integer; vpSigla : String = '#');
    begin
      dtmLookup.VerificarPastaImagem('Financeiro', vpId, True);
      vlArquivoImagem := vgDadosImagem.Pasta + 'F_' + FormatFloat('000000',vpId)+vpSigla+'.i9s'
    end;
  begin
    if sqlLivroCaixaAUTOMATICO.AsString = 'A' then
      exit;

    if sqlLivroCaixaINDICE_IMAGEM.AsInteger > 0 then
      BuscarImagem(sqlLivroCaixaINDICE_IMAGEM.AsInteger)
    else
      if sqlLivroCaixaCAIXA_TRANSFERENCIA_ID.AsInteger = 0 then
         BuscarImagem(sqlLivroCaixaLIVRO_CAIXA_ID.AsInteger)
    else BuscarImagem(sqlLivroCaixaCAIXA_TRANSFERENCIA_ID.AsInteger, 'T');

    if FileExists(vlArquivoImagem) then
      sqlLivroCaixacalc_ImagemVinculada.AsString := '1';
  end;

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
  sqlLivroCaixacalc_Agrupado.asBoolean      := sqlLivroCaixaINDICE_IMAGEM.AsString <> '';
  sqlLivroCaixacalc_vinculo.AsBoolean       := sqlLivroCaixaORCAMENTO_ID.AsInteger > 0;

  if not sqlLivroCaixaIDENTIFICACAO_ID.IsNull then
    sqlLivroCaixacalc_Identificador.AsString  := sqlLivroCaixaDOC_TIPO.AsString +'-'+ FormatFloat('###.###',sqlLivroCaixaIDENTIFICACAO_ID.AsInteger);

  if sqlLivroCaixaNOME.AsString <> '' then
  begin
    sqlLivroCaixaCALC_PESSOA.AsString := sqlLivroCaixaNOME.AsString;
    if sqlLivroCaixaASSOCIADO.AsString <> '' then
      sqlLivroCaixaCALC_OBSERVACAO.AsString := sqlLivroCaixaASSOCIADO.AsString;
  end
  else sqlLivroCaixaCALC_PESSOA.AsString := sqlLivroCaixaASSOCIADO.AsString;

  if sqlLivroCaixaOBSERVACAO.AsString <> '' then
  begin
    if sqlLivroCaixaCALC_OBSERVACAO.AsString = '' then
         sqlLivroCaixaCALC_OBSERVACAO.AsString := sqlLivroCaixaOBSERVACAO.AsString
    else sqlLivroCaixaCALC_OBSERVACAO.AsString := sqlLivroCaixaCALC_OBSERVACAO.AsString + ' - ' +
                                                  sqlLivroCaixaOBSERVACAO.AsString;
  end;

//  if sqlLivroCaixaFAVORITO_SITUACAO.AsString = 'S' then
//    sqlLivroCaixacalc_ImagemVinculada.AsString := '3';

//  sqlLivroCaixaCALC_ORDEM.AsInteger := sqlLivroCaixa.RecNo;

end;

procedure TfrmLivroCaixa.sqlReciboCalcFields(DataSet: TDataSet);
begin
  if not sqlReciboIDENTIFICACAO_ID.IsNull then
    sqlReciboCALC_IDENTIFICADOR.AsString  := sqlReciboDOC_TIPO.AsString +'-'+ FormatFloat('###.###',sqlReciboIDENTIFICACAO_ID.AsInteger);

  sqlReciboCALC_REFERENCIA.AsString := dtmLookupContabil.FormatarAnoMes(sqlReciboREFERENCIA.AsString);
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
      fmeImagem1.LoadFromFile('C:\Temp\Imagem.tif');
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
  if vlCriandoForm then
    exit;

  MontarSqlContas;
  cxGridPesquisa.DataController.Groups.FullExpand;

  if not vlCriandoForm then
    if pgcVisualizacao.ActivePageIndex = 0 then
         grdBasica.SetFocus
    else grdSimplificada.SetFocus;
end;

end.



