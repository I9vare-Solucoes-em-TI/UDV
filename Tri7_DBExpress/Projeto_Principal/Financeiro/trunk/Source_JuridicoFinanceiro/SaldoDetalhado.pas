unit SaldoDetalhado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxPCdxBarPopupMenu, cxContainer, cxEdit, ComCtrls, dxCore,
  cxDateUtils, Menus, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBData, cxCurrencyEdit, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid, StdCtrls,
  cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxPC,
  ExtCtrls, dxBarBuiltInMenu, cxRadioGroup, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxPSCore, dxPScxCommon, cxGroupBox, cxGridChartView,
  cxGridDBChartView, cxImageComboBox;

type
  TfrmSaldoDetalhado = class(TForm)
    ClientSaldoDetalhado: TClientDataSet;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    CurrencyField1: TCurrencyField;
    IntegerField2: TIntegerField;
    StringField2: TStringField;
    ClientSaldoDetalhadoSALDO_ANTERIOR: TCurrencyField;
    ClientSaldoDetalhadoRECEITAS: TCurrencyField;
    ClientSaldoDetalhadoDESPESAS: TCurrencyField;
    ClientSaldoDetalhadoENTRADAS: TCurrencyField;
    ClientSaldoDetalhadoSAIDAS: TCurrencyField;
    dtsSaldoDetalhado: TDataSource;
    Panel1: TPanel;
    pgcPeriodo: TcxPageControl;
    cxTabSheet2: TcxTabSheet;
    Panel2: TPanel;
    cxBtnFechar: TcxButton;
    pgcPesquisa: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxRadioButton1: TcxRadioButton;
    cxRadioButton2: TcxRadioButton;
    cxTabSheet3: TcxTabSheet;
    cxLabel2: TcxLabel;
    edtDataInicial: TcxDateEdit;
    edtDataFinal: TcxDateEdit;
    cxLabel1: TcxLabel;
    btnPesquisar: TcxButton;
    chxInativos: TCheckBox;
    ClientSaldoDetalhadoSITUACAO: TStringField;
    dxComponentPrinter1: TdxComponentPrinter;
    btnImprimir: TcxButton;
    dxComponentPrinter1Link2: TdxGridReportLink;
    Panel3: TPanel;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    cxGroupBox3: TcxGroupBox;
    edtTotalReceitas: TcxCurrencyEdit;
    edtTotalDespesas: TcxCurrencyEdit;
    edtResultado: TcxCurrencyEdit;
    pgcDados: TcxPageControl;
    cxTabSheet4: TcxTabSheet;
    cxTabSheet5: TcxTabSheet;
    gdrCompromissoAgendado: TcxGrid;
    cxGridDBTablePrevisao: TcxGridDBTableView;
    cxGridDBTablePrevisaoColumn1: TcxGridDBColumn;
    cxGridDBTablePrevisaoColumn2: TcxGridDBColumn;
    cxGridDBTablePrevisaoSaldoAnterior: TcxGridDBColumn;
    cxGridDBTablePrevisaoReceitas: TcxGridDBColumn;
    cxGridDBTablePrevisaoDespesas: TcxGridDBColumn;
    cxGridDBTablePrevisaoEntradas: TcxGridDBColumn;
    cxGridDBTablePrevisaoSaidas: TcxGridDBColumn;
    cxGridDBTablePrevisaoSaldoAtual: TcxGridDBColumn;
    cxGridLevel7: TcxGridLevel;
    ClientGrafico: TClientDataSet;
    dtsClienteGrafico: TDataSource;
    ClientGraficoRECEITAS: TCurrencyField;
    ClientGraficoDESPESAS: TCurrencyField;
    ClientGraficoRESULTADO: TCurrencyField;
    cxGridGrafico: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridGraficoDBChartView1: TcxGridDBChartView;
    cxGridGraficoDBChartView1Series1: TcxGridDBChartSeries;
    cxGridGraficoDBChartView1Series2: TcxGridDBChartSeries;
    cxGridGraficoDBChartView1Series3: TcxGridDBChartSeries;
    cxGridGraficoLevel1: TcxGridLevel;
    dxComponentPrinter1Link1: TdxGridReportLink;
    rdbAnoMesEscolher: TcxRadioButton;
    btnPesquisarSaldo: TcxButton;
    icxAno: TcxImageComboBox;
    icxMes: TcxImageComboBox;
    btnFecharLivroCaixa: TcxButton;
    btnReabrirLivroCaixa: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cxBtnFecharClick(Sender: TObject);
    procedure chxInativosClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSaldoDetalhado: TfrmSaldoDetalhado;

implementation

uses Lookup_Contabil, Controles, Lookup, Rotinas;

{$R *.dfm}

procedure TfrmSaldoDetalhado.btnImprimirClick(Sender: TObject);
var
  viRelatorio : String;
begin
  inherited;
  viRelatorio := '';
  repeat
    if not InputQuery('Relatório de Saldo Detalhado', 'Nome do Relatório:', viRelatorio) then
      Abort;
  until (viRelatorio <> '');

  if pgcDados.ActivePageIndex = 0 then
  begin
    dxComponentPrinter1Link2.ReportTitle.Text := viRelatorio;
    dxComponentPrinter1Link2.Preview;
  end
  else
  begin
    dxComponentPrinter1Link1.ReportTitle.Text := viRelatorio;
    dxComponentPrinter1Link1.Preview;
  end;
end;

procedure TfrmSaldoDetalhado.btnPesquisarClick(Sender: TObject);

  procedure CarregarGrafico;
  begin
    ClientGrafico.EmptyDataSet;
    ClientGrafico.Insert;
    ClientGraficoRECEITAS.AsCurrency  := edtTotalReceitas.EditValue;
    ClientGraficoDESPESAS.AsCurrency  := edtTotalDespesas.EditValue;
    ClientGraficoRESULTADO.AsCurrency := edtResultado.EditValue;
    ClientGrafico.Post;

    ClientGraficoDESPESAS.DisplayLabel := 'DESPESAS = '+
                                          FormatFloat('% #0.00',
                                          ((ClientGraficoDESPESAS.AsCurrency * 100) / ClientGraficoRECEITAS.AsCurrency));

    ClientGraficoRESULTADO.DisplayLabel := 'RESULTADO = '+
                                          FormatFloat('% #0.00',
                                          ((ClientGraficoRESULTADO.AsCurrency * 100) / ClientGraficoRECEITAS.AsCurrency));

  end;

begin
  VerificarPreenchimentoDTA_TX(edtDataInicial.Text, 'Data Inicial', edtDataInicial);
  VerificarPreenchimentoDTA_TX(edtDataInicial.Text, 'Data Final', edtDataFinal);

  if edtDataFinal.Date < edtDataInicial.Date then
  begin
    Application.MessageBox('Data Inicial não pode ser maior que a Data Final!!!', 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
    edtDataFinal.SetFocus;
    exit;
  end;

  pgcDados.ActivePageIndex := 0;
  dtmLookupContabil.CarregarSaldoDetalhado(ClientSaldoDetalhado, edtDataInicial.Text, edtDataFinal.Text, chxInativos.Checked);
  edtTotalReceitas.EditValue := cxGridDBTablePrevisao.DataController.Summary.FooterSummaryValues[1];
  edtTotalDespesas.EditValue := cxGridDBTablePrevisao.DataController.Summary.FooterSummaryValues[2];
  edtResultado.EditValue     := cxGridDBTablePrevisao.DataController.Summary.FooterSummaryValues[1] -
                                cxGridDBTablePrevisao.DataController.Summary.FooterSummaryValues[2];
  CarregarGrafico;
end;

procedure TfrmSaldoDetalhado.chxInativosClick(Sender: TObject);
begin
  btnPesquisarClick(Self);
end;

procedure TfrmSaldoDetalhado.cxBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSaldoDetalhado.FormActivate(Sender: TObject);
begin
  btnPesquisarClick(Self);
end;

procedure TfrmSaldoDetalhado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmSaldoDetalhado := nil;
end;

procedure TfrmSaldoDetalhado.FormCreate(Sender: TObject);
var
  viDataIni, viDataFin : String;
begin
  pgcDados.ActivePageIndex := 0;
  vgDataAtualTipo4    := dtmControles.DataHoraBanco(4);
  MontarDataInicioFinal(vgDataAtualTipo4, viDataIni, viDataFin, '/');
  edtDataInicial.Text := viDataIni;
  edtDataFinal.Text   := viDataFin;
end;

end.

