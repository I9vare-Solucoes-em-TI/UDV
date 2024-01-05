unit GerenciaBoletoERemessa;

interface

uses
  I9Query, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxControls, dxBarBuiltInMenu,
  cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxCalendar, cxCurrencyEdit, cxTextEdit,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, cxPC, cxDropDownEdit, cxMaskEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxLabel, Vcl.StdCtrls,
  cxButtons, Vcl.ExtCtrls, cxCheckBox, cxGroupBox, cxRadioGroup, Vcl.ComCtrls,
  dxCore, cxDateUtils, DbxDevartInterBase, Datasnap.DBClient, SimpleDS,
  cxImageComboBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  cxDBEdit, Caixa.Model.Business.Spec.Boleto, I9MemTable, System.Generics.Collections,
  cxEditRepositoryItems, cxGridExportLink, System.Win.ComObj, cxMemo, Vcl.DBCtrls,
  Cobranca;

type
  TfrmGerenciaBoletoRemessa = class(TForm)
    btnPesquisarRetorno: TcxButton;
    btnLimparRetorno: TcxButton;
    cxGroupBox6: TcxGroupBox;
    dtsRemessa: TDataSource;
    OpenDialogRetorno: TOpenDialog;
    pgcTipoArquivo: TcxPageControl;
    tbsRemessa: TcxTabSheet;
    tbsRetorno: TcxTabSheet;
    sqlContaCedente: TI9Query;
    sqlContaCedenteBANCO_ID: TStringField;
    sqlContaCedenteBANCO_NOME: TStringField;
    sqlContaCedenteCONTA_NUMERO: TStringField;
    sqlContaCedenteCONTA_DIGITO: TStringField;
    sqlContaCedenteAGENCIA_NUMERO: TStringField;
    sqlContaCedenteAGENCIA_DIGITO: TStringField;
    sqlContaCedenteCODIGO_CEDENTE_NUMERO: TStringField;
    sqlContaCedenteCODIGO_CEDENTE_DIGITO: TStringField;
    dtsContaCendente: TDataSource;
    sqlContaCedenteBANCO_CEDENTE_ID: TBCDField;
    sqlContaCedenteNOME_CEDENTE: TStringField;
    tblRetornoHistorico: TFDMemTable;
    dtsRetornoHistorico: TDataSource;
    pgcRemessa: TcxPageControl;
    tbsGerarRemessa: TcxTabSheet;
    tbsRemessaGerada: TcxTabSheet;
    Panel3: TPanel;
    btnPesquisaRemessa: TcxButton;
    btnLimparRemessa: TcxButton;
    btnGerarRemessa: TcxButton;
    lcxCedenteRemessa: TcxLookupComboBox;
    cxLabel14: TcxLabel;
    grdBoleto: TcxGrid;
    grdBoletoDBTableView1: TcxGridDBTableView;
    grdBoletoLevel1: TcxGridLevel;
    grdRemessa: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    cxLabel2: TcxLabel;
    edtDtRetornoIni: TcxDateEdit;
    edtDtRetornoFim: TcxDateEdit;
    lcxCedenteRetorno: TcxLookupComboBox;
    cxLabel4: TcxLabel;
    grdRetorno: TcxGrid;
    cxGridDBtvRetornoHistorico: TcxGridDBTableView;
    cxGridLevel3: TcxGridLevel;
    grdRetornoItem: TcxGrid;
    cxGridDBtvRetornoHistoricoItem: TcxGridDBTableView;
    cxGridLevel4: TcxGridLevel;
    cxGroupBox1: TcxGroupBox;
    btnPesquisarRemessaGerada: TcxButton;
    btnLimparRemessaGerada: TcxButton;
    cxLabel5: TcxLabel;
    edtDtRemessaIni: TcxDateEdit;
    edtDtRemessaFim: TcxDateEdit;
    lcxCedenteRemessaGerada: TcxLookupComboBox;
    cxLabel6: TcxLabel;
    cxButton1: TcxButton;
    tblRemessa: TI9MemTable;
    grdBoletoDBTableView1BOLETO_ID: TcxGridDBColumn;
    grdBoletoDBTableView1CARTEIRA: TcxGridDBColumn;
    grdBoletoDBTableView1NUMERO_DOCUMENTO: TcxGridDBColumn;
    grdBoletoDBTableView1VALOR_DOCUMENTO: TcxGridDBColumn;
    grdBoletoDBTableView1NOSSO_NUMERO: TcxGridDBColumn;
    grdBoletoDBTableView1DATA_PROCESSAMENTO: TcxGridDBColumn;
    grdBoletoDBTableView1DATA_OCORRENCIA: TcxGridDBColumn;
    grdBoletoDBTableView1TIPO_OCORRENCIA: TcxGridDBColumn;
    grdBoletoDBTableView1NOME: TcxGridDBColumn;
    grdBoletoDBTableView1CPFCNPJ: TcxGridDBColumn;
    grdBoletoDBTableView1CIDADE: TcxGridDBColumn;
    grdBoletoDBTableView1UF: TcxGridDBColumn;
    tblRemessaBOLETO_ID: TBCDField;
    tblRemessaCARTEIRA: TStringField;
    tblRemessaNUMERO_DOCUMENTO: TStringField;
    tblRemessaVALOR_DOCUMENTO: TBCDField;
    tblRemessaNOSSO_NUMERO: TStringField;
    tblRemessaDATA_PROCESSAMENTO: TSQLTimeStampField;
    tblRemessaDATA_OCORRENCIA: TSQLTimeStampField;
    tblRemessaTIPO_OCORRENCIA: TStringField;
    tblRemessaNOME: TStringField;
    tblRemessaCPFCNPJ: TStringField;
    tblRemessaLOGRADOURO: TStringField;
    tblRemessaNUMERO: TStringField;
    tblRemessaCOMPLEMENTO: TStringField;
    tblRemessaBAIRRO: TStringField;
    tblRemessaCIDADE: TStringField;
    tblRemessaUF: TStringField;
    tblRemessaCEP: TStringField;
    tblRemessaHistorico: TI9MemTable;
    dtsRemessaHistorico: TDataSource;
    tblRemessaHistoricoBOLETO_REMESSA_ID: TBCDField;
    tblRemessaHistoricoDATA_REMESSA: TSQLTimeStampField;
    tblRemessaHistoricoNUMERO_REMESSA: TBCDField;
    tblRemessaHistoricoNOME_ARQUIVO: TStringField;
    cxGridDBTableView2DATA_REMESSA: TcxGridDBColumn;
    cxGridDBTableView2NUMERO_REMESSA: TcxGridDBColumn;
    cxGridDBTableView2NOME_ARQUIVO: TcxGridDBColumn;
    cxGridDBTableView2USUARIO: TcxGridDBColumn;
    tblRemessaHistoricoItem: TI9MemTable;
    dtsRemessaHistoricoItem: TDataSource;
    tblRemessaHistoricoUSUARIO: TStringField;
    grdRemessaItem: TcxGrid;
    cxGridDBtvRemessaItem: TcxGridDBTableView;
    cxGridDBtvRemessaItemBOLETO_ID: TcxGridDBColumn;
    cxGridDBtvRemessaItemDATA_PROCESSAMENTO: TcxGridDBColumn;
    cxGridDBtvRemessaItemCARTEIRA: TcxGridDBColumn;
    cxGridDBtvRemessaItemNUMERO_DOCUMENTO: TcxGridDBColumn;
    cxGridDBtvRemessaItemNOSSO_NUMERO: TcxGridDBColumn;
    cxGridDBtvRemessaItemVALOR_DOCUMENTO: TcxGridDBColumn;
    cxGridDBtvRemessaItemTIPO_OCORRENCIA: TcxGridDBColumn;
    cxGridDBtvRemessaItemDATA_OCORRENCIA: TcxGridDBColumn;
    cxGridDBtvRemessaItemNOME: TcxGridDBColumn;
    cxGridDBtvRemessaItemCPFCNPJ: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    tblRemessaHistoricoItemBOLETO_REMESSA_ID: TBCDField;
    tblRemessaHistoricoItemBOLETO_ID: TBCDField;
    tblRemessaHistoricoItemCARTEIRA: TStringField;
    tblRemessaHistoricoItemNUMERO_DOCUMENTO: TStringField;
    tblRemessaHistoricoItemVALOR_DOCUMENTO: TBCDField;
    tblRemessaHistoricoItemNOSSO_NUMERO: TStringField;
    tblRemessaHistoricoItemDATA_PROCESSAMENTO: TSQLTimeStampField;
    tblRemessaHistoricoItemDATA_OCORRENCIA: TSQLTimeStampField;
    tblRemessaHistoricoItemTIPO_OCORRENCIA: TStringField;
    tblRemessaHistoricoItemNOME: TStringField;
    tblRemessaHistoricoItemCPFCNPJ: TStringField;
    tblRemessaHistoricoItemCIDADE: TStringField;
    tblRemessaHistoricoItemUF: TStringField;
    cxEditRepository1: TcxEditRepository;
    icb_tipo_ocorrencia: TcxEditRepositoryImageComboBoxItem;
    tblRetornoHistoricoItem: TFDMemTable;
    dtsRetornoHistoricoItem: TDataSource;
    tblRetornoHistoricoBOLETO_RETORNO_ID: TBCDField;
    tblRetornoHistoricoDATA_RETORNO: TSQLTimeStampField;
    tblRetornoHistoricoNOME_ARQUIVO: TStringField;
    tblRetornoHistoricoBANCO_CEDENTE_ID: TBCDField;
    tblRetornoHistoricoHASH_ARQUIVO: TStringField;
    tblRetornoHistoricoUSUARIO: TStringField;
    cxGridDBtvRetornoHistoricoBOLETO_RETORNO_ID: TcxGridDBColumn;
    cxGridDBtvRetornoHistoricoDATA_RETORNO: TcxGridDBColumn;
    cxGridDBtvRetornoHistoricoNOME_ARQUIVO: TcxGridDBColumn;
    cxGridDBtvRetornoHistoricoHASH_ARQUIVO: TcxGridDBColumn;
    cxGridDBtvRetornoHistoricoUSUARIO: TcxGridDBColumn;
    SaveDialogRemessa: TSaveDialog;
    ppmSaveFileRemessa: TPopupMenu;
    ppmSaveFileRetorno: TPopupMenu;
    ExportarArquivoRemessa1: TMenuItem;
    ExportarArquivoRetorno1: TMenuItem;
    sqlBoletoRetorno: TI9Query;
    tblRetornoHistoricoItemBOLETO_RETORNO_ITEM_ID: TBCDField;
    tblRetornoHistoricoItemBOLETO_RETORNO_ID: TBCDField;
    tblRetornoHistoricoItemBOLETO_ID: TBCDField;
    tblRetornoHistoricoItemOCORRENCIA: TStringField;
    tblRetornoHistoricoItemDATA_CORRENCIA: TSQLTimeStampField;
    tblRetornoHistoricoItemNUMERO_DOCUMENTO: TStringField;
    tblRetornoHistoricoItemNOSSO_NUMERO: TStringField;
    tblRetornoHistoricoItemVALOR: TBCDField;
    tblRetornoHistoricoItemDATA_CREDITO: TSQLTimeStampField;
    tblRetornoHistoricoItemDATA_BAIXA: TSQLTimeStampField;
    cxGridDBtvRetornoHistoricoItemOCORRENCIA: TcxGridDBColumn;
    cxGridDBtvRetornoHistoricoItemDATA_CORRENCIA: TcxGridDBColumn;
    cxGridDBtvRetornoHistoricoItemNUMERO_DOCUMENTO: TcxGridDBColumn;
    cxGridDBtvRetornoHistoricoItemNOSSO_NUMERO: TcxGridDBColumn;
    cxGridDBtvRetornoHistoricoItemVALOR: TcxGridDBColumn;
    cxGridDBtvRetornoHistoricoItemDATA_CREDITO: TcxGridDBColumn;
    cxGridDBtvRetornoHistoricoItemDATA_BAIXA: TcxGridDBColumn;
    grdListBoleto: TcxGrid;
    gridBoleto: TcxGridDBTableView;
    cxGridLevel5: TcxGridLevel;
    sqlBoletoRetornoBOLETO_ID: TBCDField;
    sqlBoletoRetornoCARTEIRA: TStringField;
    sqlBoletoRetornoDATA_PROCESSAMENTO: TSQLTimeStampField;
    sqlBoletoRetornoNUMERO_DOCUMENTO: TStringField;
    sqlBoletoRetornoNOSSO_NUMERO: TStringField;
    sqlBoletoRetornoVALOR_DOCUMENTO: TBCDField;
    sqlBoletoRetornoDATA_OCORRENCIA: TSQLTimeStampField;
    sqlBoletoRetornoTIPO_OCORRENCIA: TStringField;
    sqlBoletoRetornoNOME: TStringField;
    sqlBoletoRetornoCPFCNPJ: TStringField;
    dtsBoletoRetorno: TDataSource;
    gridBoletoBOLETO_ID: TcxGridDBColumn;
    gridBoletoCARTEIRA: TcxGridDBColumn;
    gridBoletoDATA_PROCESSAMENTO: TcxGridDBColumn;
    gridBoletoNUMERO_DOCUMENTO: TcxGridDBColumn;
    gridBoletoNOSSO_NUMERO: TcxGridDBColumn;
    gridBoletoVALOR_DOCUMENTO: TcxGridDBColumn;
    gridBoletoDATA_OCORRENCIA: TcxGridDBColumn;
    gridBoletoTIPO_OCORRENCIA: TcxGridDBColumn;
    gridBoletoNOME: TcxGridDBColumn;
    gridBoletoCPFCNPJ: TcxGridDBColumn;
    sqlBoletoRetornoVALOR_RECEBIDO: TBCDField;
    gridBoletoVALOR_RECEBIDO: TcxGridDBColumn;
    sqlMotivoRejeicao: TI9Query;
    dtsMotivoRejeicao: TDataSource;
    sqlMotivoRejeicaoBOLETO_MOTIVO_REJEICAO_ID: TBCDField;
    sqlMotivoRejeicaoBOLETO_RETORNO_ITEM_ID: TBCDField;
    sqlMotivoRejeicaoDESCRICAO_MOTIVO_REJEICAO: TStringField;
    ppmItemRetorno: TPopupMenu;
    ExportarPlanilha1: TMenuItem;
    grdMotivoRejeicao: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel6: TcxGridLevel;
    cxGridDBTableView1DESCRICAO_MOTIVO_REJEICAO: TcxGridDBColumn;
    N1: TMenuItem;
    ExportarGrupoSelecionado1: TMenuItem;
    cxGridDBtvRetornoHistoricoItemBOLETO_ID: TcxGridDBColumn;
    sqlBoletoRetornoVALOR_DESPESA_COBRANCA: TBCDField;
    gridBoletoVALOR_DESPESA_COBRANCA: TcxGridDBColumn;
    tbsBoleto: TcxTabSheet;
    cxGroupBox2: TcxGroupBox;
    btnPesquisarBoleto: TcxButton;
    btnLimparBoleto: TcxButton;
    lcxCedenteBoleto: TcxLookupComboBox;
    cxLabel3: TcxLabel;
    grdGerenciaBoleto: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBBOLETO_ID: TcxGridDBColumn;
    cxGridDBDATA_PROCESSAMENTO: TcxGridDBColumn;
    cxGridDBCARTEIRA: TcxGridDBColumn;
    cxGridDBNUMERO_DOCUMENTO: TcxGridDBColumn;
    cxGridDBNOSSO_NUMERO: TcxGridDBColumn;
    cxGridDBVALOR_DOCUMENTO: TcxGridDBColumn;
    cxGridDBTIPO_OCORRENCIA: TcxGridDBColumn;
    cxGridDBDATA_OCORRENCIA: TcxGridDBColumn;
    cxGridDBNOME: TcxGridDBColumn;
    cxGridDBCPFCNPJ: TcxGridDBColumn;
    cxGridDBCIDADE: TcxGridDBColumn;
    cxGridDBUF: TcxGridDBColumn;
    cxGridLevel7: TcxGridLevel;
    cxGroupBox5: TcxGroupBox;
    edtDataInicio: TcxDateEdit;
    edtDataFinal: TcxDateEdit;
    cxLabel11: TcxLabel;
    cxGroupBox3: TcxGroupBox;
    edtPesqNumero: TcxCurrencyEdit;
    mmoListaApont: TcxMemo;
    tblBoleto: TI9MemTable;
    dtsBoleto: TDataSource;
    cbxTipoNumero: TcxComboBox;
    icbTipoOcorrenciaBoleto: TcxImageComboBox;
    cxLabel1: TcxLabel;
    ppmBoleto: TPopupMenu;
    AlterarVencimento1: TMenuItem;
    N2: TMenuItem;
    Cancelar1: TMenuItem;
    tblBoletoBOLETO_ID: TBCDField;
    tblBoletoCARTEIRA: TStringField;
    tblBoletoNUMERO_DOCUMENTO: TStringField;
    tblBoletoVALOR_DOCUMENTO: TBCDField;
    tblBoletoNOSSO_NUMERO: TStringField;
    tblBoletoDATA_PROCESSAMENTO: TSQLTimeStampField;
    tblBoletoDATA_OCORRENCIA: TSQLTimeStampField;
    tblBoletoTIPO_OCORRENCIA: TStringField;
    tblBoletoNOME: TStringField;
    tblBoletoCPFCNPJ: TStringField;
    tblBoletoLOGRADOURO: TStringField;
    tblBoletoNUMERO: TStringField;
    tblBoletoCOMPLEMENTO: TStringField;
    tblBoletoBAIRRO: TStringField;
    tblBoletoCIDADE: TStringField;
    tblBoletoUF: TStringField;
    tblBoletoCEP: TStringField;
    cxGroupBox4: TcxGroupBox;
    edtDataVencimento: TcxDateEdit;
    N3: TMenuItem;
    ExportarBoletos1: TMenuItem;
    sqlBoletoRetornoDATA_VENCIMENTO: TSQLTimeStampField;
    tblBoletoDATA_VENCIMENTO: TSQLTimeStampField;
    tblRemessaDATA_VENCIMENTO: TSQLTimeStampField;
    cxGridDBTableView3DATA_VENCIMENTO: TcxGridDBColumn;
    grdBoletoDBTableView1DATA_VENCIMENTO: TcxGridDBColumn;
    tblRemessaHistoricoItemDATA_VENCIMENTO: TSQLTimeStampField;
    cxGridDBtvRemessaItemDATA_VENCIMENTO: TcxGridDBColumn;
    tblBoletocalc_check: TStringField;
    cxGridDBTableView3calc_selecao: TcxGridDBColumn;
    Inativar1: TMenuItem;
    N5: TMenuItem;
    lblBoletoSemRemessa: TcxLabel;
    sqlBoletoRetornoREMESSA_GERADA: TStringField;
    tblBoletoREMESSA_GERADA: TStringField;
    cxGridDBTableView3REMESSA_GERADA: TcxGridDBColumn;
    lblMarcarTodos: TcxLabel;
    lblDesmarcarTodos: TcxLabel;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    icbRemessaGerada: TcxImageComboBox;
    cxLabel7: TcxLabel;
    chbLista: TcxCheckBox;

    procedure btnGerarRemessaClick(Sender: TObject);
    procedure btnLimparRemessaClick(Sender: TObject);
    procedure btnPesquisaRemessaClick(Sender: TObject);
    procedure cxBtnFecharClick(Sender: TObject);
    procedure edtBoletoIdKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtNossoNumeroKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarRetornoClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure grdBoletoDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure btnPesquisarRemessaGeradaClick(Sender: TObject);
    procedure cxGridDBtvRemessaItemCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure btnLimparRemessaGeradaClick(Sender: TObject);

    procedure btnLimparRetornoClick(Sender: TObject);
    procedure cxGridDBtvRetornoHistoricoItemCPFCNPJGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: string);
    procedure grdBoletoDBTableView1CPFCNPJGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: string);
    procedure cxGridDBtvRemessaItemCPFCNPJGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: string);
    procedure ExportarArquivoRemessa1Click(Sender: TObject);
    procedure ExportarArquivoRetorno1Click(Sender: TObject);
    procedure gridBoletoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure ExportarGrupoSelecionado1Click(Sender: TObject);
    procedure cxGridDBtvRetornoHistoricoItemCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ExportarPlanilha1Click(Sender: TObject);
    procedure edtPesqNumeroEnter(Sender: TObject);
    procedure edtPesqNumeroExit(Sender: TObject);
    procedure edtPesqNumeroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnLimparBoletoClick(Sender: TObject);
    procedure btnPesquisarBoletoClick(Sender: TObject);
    procedure AlterarVencimento1Click(Sender: TObject);
    procedure Cancelar1Click(Sender: TObject);
    procedure ExportarBoletos1Click(Sender: TObject);
    procedure Inativar1Click(Sender: TObject);
    procedure icbTipoOcorrenciaBoletoPropertiesChange(Sender: TObject);
    procedure lblMarcarTodosClick(Sender: TObject);
    procedure lblDesmarcarTodosClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxGridDBTableView3CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure chbListaClick(Sender: TObject);

  private
    fBoletoBusiness : IBoletoBusiness;
    fNovaRemessa : INovaRemessa;
    fHistoricoRemessa : IHistoricoRemessa;
    fHistoricoRetorno : IHistoricoRetorno;

    procedure LimparDataSetRemessa;
    procedure LimparDataSetRemessaHistorico;
    procedure LimparDataSetRetornoHistorico;
    procedure LimparDataSetBoleto;

    function ValidarTipoOcorrencia(const vpTipoOcorrencia: TTipoOcorrencia): Boolean;

    procedure MarcarDesmarcarBoleto(const vpMarcar : Boolean);

    function GetListId(const vpDataSet: TDataSet; const vpCampo: string): TList<Integer>;
    procedure ValidarPeriodo(const vpDataIni, vpDataFim: TcxDateEdit);

    function GerarCSV: Boolean;
    procedure VisualizarCSV;

    procedure GerarPlanilhaGrid(const vpGrid: TcxGrid);
    procedure PesquisarRemessa(const vpRemessaId: Integer);
    procedure PesquisarRetorno(const vpReotrnoID: Integer);

    const C_ARQUIVO_EXPORTAR = 'C:\Temp\RelTemp.csv';

  public

  end;

var
  frmGerenciaBoletoRemessa: TfrmGerenciaBoletoRemessa;

implementation

uses
  Controles,
  Lookup,
  Rotinas,
  Atualizacao,
  Caixa.Controller.Factory.Business.Boleto,
  Winapi.ShellAPI;

{$R *.dfm}

procedure TfrmGerenciaBoletoRemessa.chbListaClick(Sender: TObject);
begin
  mmoListaApont.Enabled  := chbLista.Checked;
  mmoListaApont.Clear;

  if chbLista.Checked then
    edtPesqNumero.SetFocus;
end;

procedure TfrmGerenciaBoletoRemessa.cxBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmGerenciaBoletoRemessa.btnPesquisarBoletoClick(Sender: TObject);
var
  viDataSet: TDataSet;
  viNumeroList: TList<string>;
  viNumero: string;
  viTipoOcorrencia: TTipoOcorrencia;
  viTipoNumero: TTipoNumero;
  viRemessaGerada: TRemessaGerada;
begin
  viNumeroList := nil;
  edtDataVencimento.Enabled := False;
  LimparDataSetBoleto;

  VerificarPreenchimentoLCX_TX(lcxCedenteBoleto.Text, 'Conta Cedente', lcxCedenteBoleto);

  if Trim(mmoListaApont.Text) <> EmptyStr then
  begin
    viNumeroList := TList<string>.Create;
    for viNumero in mmoListaApont.Lines  do
      if Trim(viNumero) <> EmptyStr then
        viNumeroList.Add(Trim(viNumero));
  end
  else
  if Trim(edtPesqNumero.Text) <> EmptyStr then
  begin
    viNumeroList := TList<string>.Create;
    viNumeroList.Add(Trim(edtPesqNumero.Text));
  end
  else
   ValidarPeriodo(edtDataInicio, edtDataFinal);

  if (icbTipoOcorrenciaBoleto.ItemIndex < 0) or (icbTipoOcorrenciaBoleto.EditValue = 'TDS') then
    viTipoOcorrencia := toNenhuma
  else
    viTipoOcorrencia := Cobranca.TipoOcorrencia(icbTipoOcorrenciaBoleto.EditValue);

  if cbxTipoNumero.ItemIndex = 0 then
    viTipoNumero := TTipoNumero.tnNumeroDocumento
  else
    viTipoNumero := TTipoNumero.tnNossoNumero;

  if icbRemessaGerada.EditValue = 'S' then
    viRemessaGerada := rgSim
  else
  if icbRemessaGerada.EditValue = 'N' then
    viRemessaGerada := rgNao
  else
    viRemessaGerada := rgNenhum;

  viDataSet := fBoletoBusiness.Pesquisar(lcxCedenteBoleto.EditValue,
    edtDataInicio.Date,
    edtDataFinal.Date,
    viRemessaGerada,
    viTipoOcorrencia,
    viTipoNumero,
    viNumeroList);

  try
    if viDataSet = nil then
    begin
      Application.MessageBox('Pesquisa de boleto(s) não pode ser realizada!','Aviso', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;

    if viDataSet.RecordCount = 0 then
    begin
      Application.MessageBox('Nenhum boleto localizado!','Aviso', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;

    tblBoleto.CopyDataSet(viDataSet);
  finally
    FreeAndNil(viDataSet);
    FreeAndNil(viNumeroList);
  end;

  edtDataVencimento.Enabled := not tblBoleto.IsEmpty;
  ppmBoleto.AutoPopup := not tblBoleto.IsEmpty;
  lblMarcarTodos.Visible := not tblBoleto.IsEmpty;
  lblDesmarcarTodos.Visible := lblMarcarTodos.Visible;

  if ppmBoleto.AutoPopup then
  begin
    Inativar1.Enabled := viTipoOcorrencia = Cobranca.toBoletoGerado;
    AlterarVencimento1.Enabled := ((viTipoOcorrencia <> Cobranca.toBoletoInativado) and
                                   (viTipoOcorrencia <> Cobranca.toBoletoCancelado) and
                                   (viTipoOcorrencia <> Cobranca.toRetornoEntradaRejeitada) and
                                   (viTipoOcorrencia <> Cobranca.toRetornoLiquidadoNormal) and
                                   (viTipoOcorrencia <> Cobranca.toRetornoBaixaArquivo));
    Cancelar1.Enabled := AlterarVencimento1.Enabled;
  end;

end;

procedure TfrmGerenciaBoletoRemessa.btnPesquisaRemessaClick(Sender: TObject);
var
  viDataSet: TDataSet;
begin
  VerificarPreenchimentoLCX_TX(lcxCedenteRemessa.Text, 'Conta Cedente', lcxCedenteRemessa);

  LimparDataSetRemessa;

  viDataSet := fNovaRemessa.Pesquisar(lcxCedenteRemessa.EditValue);
  try
    if viDataSet = nil then
    begin
      Application.MessageBox('Pesquisa da remessa não pode ser realizada!','Aviso', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;

    if viDataSet.RecordCount = 0 then
    begin
      Application.MessageBox('Nenhuma remessa pendente pra esta conta!','Aviso', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;

    tblRemessa.CopyDataSet(viDataSet);
  finally
    FreeAndNil(viDataSet);
  end;

  lcxCedenteRemessa.Enabled := False;
  btnGerarRemessa.Enabled := not tblRemessa.IsEmpty;
end;

procedure TfrmGerenciaBoletoRemessa.btnPesquisarRemessaGeradaClick(
  Sender: TObject);
begin
  PesquisarRemessa(0);
end;

procedure TfrmGerenciaBoletoRemessa.PesquisarRemessa(const vpRemessaId: Integer);
var
  viDSRemessa,
  viDSRemessaItem: TDataSet;
  viRemessaList: TList<Integer>;
begin
  ValidarPeriodo(edtDtRemessaIni, edtDtRemessaFim);
  VerificarPreenchimentoLCX_TX(lcxCedenteRemessaGerada.Text, 'Conta Cedente', lcxCedenteRemessaGerada);

  LimparDataSetRemessaHistorico;

  viDSRemessa := fHistoricoRemessa.PesquisarRemessa(
    edtDtRemessaIni.Date,
    edtDtRemessaFim.Date,
    lcxCedenteRemessaGerada.EditValue,
    vpRemessaId);

  try
    if viDSRemessa = nil then
    begin
      Application.MessageBox('Pesquisa da remessa não pode ser realizada!','Aviso', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;

    if not viDSRemessa.IsEmpty then
    begin
      viRemessaList := GetListId(viDSRemessa, 'BOLETO_REMESSA_ID');

      viDSRemessaItem := fHistoricoRemessa.PesquisarRemessaItem(viRemessaList);
      try
        tblRemessaHistorico.CopyDataSet(viDSRemessa);
        tblRemessaHistoricoItem.CopyDataSet(viDSRemessaItem);
      finally
        FreeAndNil(viRemessaList);
        FreeAndNil(viDSRemessaItem);
      end;
    end;
  finally
    FreeAndNil(viDSRemessa);
    ppmSaveFileRemessa.AutoPopup := not tblRemessaHistorico.IsEmpty;
  end;
end;

procedure TfrmGerenciaBoletoRemessa.btnPesquisarRetornoClick(Sender: TObject);
begin
  PesquisarRetorno(0);
end;

procedure TfrmGerenciaBoletoRemessa.PesquisarRetorno(const vpReotrnoID: Integer);
var
  viDSRetorno,
  viDSRetornoItem: TDataSet;
  viRetornoList: TList<Integer>;
begin
  ValidarPeriodo(edtDtRetornoIni, edtDtRetornoFim);
  VerificarPreenchimentoLCX_TX(lcxCedenteRetorno.Text, 'Conta Cedente', lcxCedenteRetorno);

  LimparDataSetRetornoHistorico;
  sqlBoletoRetorno.Close;
  sqlMotivoRejeicao.Close;

  viDSRetorno := fHistoricoRetorno.PesquisarRetorno(
    edtDtRetornoIni.Date,
    edtDtRetornoFim.Date,
    lcxCedenteRetorno.EditValue,
    vpReotrnoID);

  try
    if viDSRetorno = nil then
    begin
      Application.MessageBox('Pesquisa da remessa não pode ser realizada!','Aviso', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;

    if not viDSRetorno.IsEmpty then
    begin
      viRetornoList := GetListId(viDSRetorno, 'BOLETO_RETORNO_ID');

      viDSRetornoItem := fHistoricoRetorno.PesquisarRetornoItem(viRetornoList);
      try
        tblRetornoHistorico.CopyDataSet(viDSRetorno);
        tblRetornoHistoricoItem.CopyDataSet(viDSRetornoItem);
        sqlBoletoRetorno.Open;
        sqlMotivoRejeicao.Open;
      finally
        FreeAndNil(viRetornoList);
        FreeAndNil(viDSRetornoItem);
      end;
    end;
  finally
    FreeAndNil(viDSRetorno);
    ppmSaveFileRetorno.AutoPopup := not tblRetornoHistorico.IsEmpty;
    ppmItemRetorno.AutoPopup     := not tblRetornoHistoricoItem.IsEmpty;
  end;

end;

procedure TfrmGerenciaBoletoRemessa.Cancelar1Click(Sender: TObject);
var
  viBoletos: TList<Integer>;
begin
  viBoletos := nil;

  tblBoleto.Filtered := False;
  tblBoleto.Filter   := 'calc_check=''S''';
  try
    tblBoleto.Filtered := True;
    viBoletos := GetListId(tblBoleto, 'BOLETO_ID');
    tblBoleto.Filtered := False;

    if (viBoletos.Count <= 0) then
    begin
      ShowMessage('Nenhum boleto selecionado!');
      Exit;
    end;

    if Application.MessageBox(PWideChar('Confirma cancelar o(s) ' + viBoletos.Count.ToString + ' boleto(s) selecionado(s)?'), 'Atenção', MB_YESNO + MB_ICONQUESTION) = IDYES then
      try
        if fBoletoBusiness.Cancelar(viBoletos) > 0 then
        begin
          ShowMessage('Cancelado(s) com sucesso!');
          btnPesquisarBoletoClick(nil);
        end
        else
          ShowMessage('Não foi possivel cancelar o(s) boleto(s)!');
      except
        on E: Exception do
          Application.MessageBox(PChar(E.Message), 'Atenção', MB_ICONWARNING + MB_OK);
      end;
  finally
    tblBoleto.Filtered := False;
    tblBoleto.Filter   := '';
    FreeAndNil(viBoletos);
  end;
end;

procedure TfrmGerenciaBoletoRemessa.cxButton1Click(Sender: TObject);
var
  viRetornoId: Integer;
  viFrmAtualizacao: TfrmAtualizacao;
begin
  VerificarPreenchimentoLCX_TX(lcxCedenteRetorno.Text, 'Conta Cedente', lcxCedenteRetorno);

  if OpenDialogRetorno.Execute then
  begin
    try
      viFrmAtualizacao := TfrmAtualizacao.Create(nil);
      try
        viFrmAtualizacao.lblTexto.Caption := 'Processando Retorno...';
        viFrmAtualizacao.Show;
        Application.ProcessMessages;
        viRetornoId := fBoletoBusiness.ProcessarRetorno(OpenDialogRetorno.FileName, lcxCedenteRetorno.EditValue, StrToInt(vgUsuarioID));

      finally
        FreeAndNil(viFrmAtualizacao);
      end;

      if viRetornoId > 0 then
      begin
        edtDtRetornoIni.Date := Date;
        edtDtRetornoFim.Date := Date;
        PesquisarRetorno(viRetornoId);
        Application.MessageBox('Arquivo retorno processado com sucesso!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      end
      else
        Application.MessageBox('Retorno não processado!', 'Atenção', MB_OK + MB_ICONWARNING);
    except
      on E: Exception do
        Application.MessageBox(PChar(E.Message), 'Atenção', MB_ICONWARNING + MB_OK);
    end;
  end;
end;

procedure TfrmGerenciaBoletoRemessa.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmGerenciaBoletoRemessa.btnLimparBoletoClick(Sender: TObject);
begin
  edtDataInicio.Clear;
  edtDataFinal.Clear;
  edtPesqNumero.Clear;
  mmoListaApont.Clear;
  icbTipoOcorrenciaBoleto.EditValue := 'TDS';
  icbRemessaGerada.EditValue := 'T';

  lblMarcarTodos.Visible    := False;
  lblDesmarcarTodos.Visible := lblMarcarTodos.Visible;

  LimparDataSetBoleto;
end;

procedure TfrmGerenciaBoletoRemessa.btnLimparRemessaClick(Sender: TObject);
begin
  btnGerarRemessa.Enabled     := False;
  lcxCedenteRemessa.Enabled   := True;
  lcxCedenteRemessa.SetFocus;

  LimparDataSetRemessa;
end;

procedure TfrmGerenciaBoletoRemessa.btnLimparRemessaGeradaClick(
  Sender: TObject);
begin
  edtDtRemessaIni.Clear;
  edtDtRemessaFim.Clear;
  ppmSaveFileRemessa.AutoPopup      := False;

  LimparDataSetRemessaHistorico;
end;

procedure TfrmGerenciaBoletoRemessa.btnLimparRetornoClick(Sender: TObject);
begin
  edtDtRetornoIni.Clear;
  edtDtRetornoFim.Clear;
  ppmSaveFileRetorno.AutoPopup := False;

  LimparDataSetRetornoHistorico;
end;

procedure TfrmGerenciaBoletoRemessa.AlterarVencimento1Click(Sender: TObject);
var
  viBoletos: TList<Integer>;
begin
  viBoletos := nil;

  if edtDataVencimento.Date <= 0 then
  begin
    Application.MessageBox('Data de vencimento não informada!', 'Atenção', MB_OK + MB_ICONWARNING);
    Exit;
  end;

  tblBoleto.Filtered := False;
  tblBoleto.Filter   := 'calc_check=''S''';
  try
    tblBoleto.Filtered := True;
    viBoletos := GetListId(tblBoleto, 'BOLETO_ID');
    tblBoleto.Filtered := False;

    if (viBoletos.Count <= 0) then
    begin
      ShowMessage('Nenhum boleto selecionado!');
      Exit;
    end;

    if Application.MessageBox(PWideChar('Confirma alterar o(s) vencimento(s) do(s) ' + viBoletos.Count.ToString + ' boleto(s) selecionado(s)?'), 'Atenção', MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      try
        if fBoletoBusiness.AlterarVencimento(viBoletos, edtDataVencimento.Date) > 0 then
        begin
          ShowMessage('Alterado(s) com sucesso!');
          btnPesquisarBoletoClick(nil);
        end
        else
          ShowMessage('Não foi possivel alterar o(s) vencimento(s)!');

      except
        on E: Exception do
          Application.MessageBox(PChar(E.Message), 'Atenção', MB_ICONWARNING + MB_OK);
      end;
    end;
  finally
    tblBoleto.Filtered := False;
    tblBoleto.Filter   := '';
    FreeAndNil(viBoletos);
  end;

end;

procedure TfrmGerenciaBoletoRemessa.btnGerarRemessaClick(Sender: TObject);
var
  viBoletos: TList<Integer>;
  viRemessaID: Integer;
  viFrmAtualizacao: TfrmAtualizacao;

  {$REGION 'ValidarInformacoesBoleto'}

  procedure ValidarInformacoesBoleto;
  begin
    if Trim(tblRemessaCPFCNPJ.AsString) = '' then
    begin
      Application.MessageBox('Por favor, Informar CPF/CNPJ para continuar!', 'Aviso', MB_OK + MB_ICONINFORMATION);
      Abort;
    end;

    if Trim(tblRemessaCIDADE.AsString) = ''  then
    begin
      Application.MessageBox(Pchar('Cliente ' + tblRemessaNOME.AsString + ' NÃO possui cidade CADASTRADA!'), 'Aviso', MB_OK + MB_ICONINFORMATION);
      Abort;
    end;

    if Trim(tblRemessaLOGRADOURO.AsString) = '' then
    begin
      Application.MessageBox('Por favor, Informar o logradouro para continuar!', 'Aviso', MB_OK + MB_ICONINFORMATION);
      Abort;
    end;

    if Trim(tblRemessaUF.AsString) = '' then
    begin
      Application.MessageBox('Por favor, Informar o UF para continuar!', 'Aviso', MB_OK + MB_ICONINFORMATION);
      Abort;
    end;

    if Trim(tblRemessaCEP.AsString) = '' then
    begin
      Application.MessageBox('Por favor, Informar o CEP para continuar!', 'Aviso', MB_OK + MB_ICONINFORMATION);
      Abort;
    end;
  end;
  {$ENDREGION}

begin
  viRemessaID := 0;

  VerificarPreenchimentoLCX_TX(lcxCedenteRemessa.Text, 'Conta Cedente', lcxCedenteRemessa);

  if Application.MessageBox('Confirma gerar remessa para os boletos listados?', 'Pergunta', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION) = IDNO then
    exit;

  tblRemessa.DisableControls;
  viBoletos := TList<Integer>.Create;
  try
    try
      viFrmAtualizacao := TfrmAtualizacao.Create(nil);
      viFrmAtualizacao.lblTexto.Caption := 'Gerando Remessa...';
      viFrmAtualizacao.Show;
      Application.ProcessMessages;

      try
        tblRemessa.First;
        while not tblRemessa.Eof do
        begin
          ValidarInformacoesBoleto;

          viBoletos.Add(tblRemessaBOLETO_ID.AsInteger);

          tblRemessa.Next;
        end;

        viRemessaID := fBoletoBusiness.GerarRemessa(viBoletos, lcxCedenteRemessa.EditValue, StrToInt(vgUsuarioID));
      finally
        FreeAndNil(viFrmAtualizacao);
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox(PChar(E.Message), 'Atenção', MB_ICONWARNING + MB_OK);
        Exit;
      end;
    end;

    if viRemessaID > 0 then
    begin
      edtDtRemessaIni.Date := dtmControles.DataHoraBanco(3);
      edtDtRemessaFim.Date := edtDtRemessaIni.Date;
      lcxCedenteRemessaGerada.EditValue := lcxCedenteRemessa.EditValue;

      btnLimparRemessaClick(Self);

      pgcRemessa.ActivePage := tbsRemessaGerada;
      PesquisarRemessa(viRemessaID);

      Application.MessageBox('Arquivo de remessa gerado com sucesso!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    end
    else
      Application.MessageBox('Remessa não gerada!', 'Atenção', MB_OK + MB_ICONWARNING);
  finally
    FreeAndNil(viBoletos);
    tblRemessa.EnableControls;
  end;

  {$REGION 'Abrir o Windows Explorer com o arquivo de remessa selecionado'}
  if (viRemessaID > 0) and (not tblRemessaHistorico.IsEmpty) then
    ShellExecute(
      0,
      nil,
      PWideChar(
        'explorer.exe'),
      PWideChar(
        string.Format(
          '/select, %s',
          [ IncludeTrailingPathDelimiter(fBoletoBusiness.GetLocalArquivoRemessa(lcxCedenteRemessa.EditValue)) +
            tblRemessaHistoricoNOME_ARQUIVO.AsString])),
      nil,
      SW_SHOWNORMAL);
  {$ENDREGION}
end;

procedure TfrmGerenciaBoletoRemessa.grdBoletoDBTableView1CPFCNPJGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  AText := RetornaCPFCNPJFormatado(AText);
end;

procedure TfrmGerenciaBoletoRemessa.grdBoletoDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  viTipoOcorrencia: TTipoOcorrencia;
begin
  viTipoOcorrencia :=  Cobranca.TipoOcorrencia(
    AViewInfo.RecordViewInfo.GridRecord.Values[grdBoletoDBTableView1TIPO_OCORRENCIA.Index]);

  case viTipoOcorrencia of
    TTipoOcorrencia.toBoletoCancelado     : ACanvas.Font.Color := clRed;
    TTipoOcorrencia.toBoletoAlterado,
    TTipoOcorrencia.toBoletoValorAlterado : ACanvas.Font.Color := clPurple;
  end;
end;

procedure TfrmGerenciaBoletoRemessa.gridBoletoCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  viTipoOcorrencia: TTipoOcorrencia;
begin
  viTipoOcorrencia :=  Cobranca.TipoOcorrencia(
    AViewInfo.RecordViewInfo.GridRecord.Values[gridBoletoTIPO_OCORRENCIA.Index]);

  case viTipoOcorrencia of
    TTipoOcorrencia.toBoletoCancelado        : ACanvas.Font.Color := clRed;
    TTipoOcorrencia.toBoletoAlterado,
    TTipoOcorrencia.toBoletoValorAlterado    : ACanvas.Font.Color := clPurple;
    TTipoOcorrencia.toRetornoLiquidadoNormal : ACanvas.Font.Color := clGreen;
  end;
end;

procedure TfrmGerenciaBoletoRemessa.icbTipoOcorrenciaBoletoPropertiesChange(
  Sender: TObject);
begin
  LimparDataSetBoleto;
  if icbTipoOcorrenciaBoleto.EditValue <> Null then
    lblBoletoSemRemessa.Visible := Cobranca.TipoOcorrencia(icbTipoOcorrenciaBoleto.EditValue) = toBoletoGerado
  else
    lblBoletoSemRemessa.Visible := False;
end;

procedure TfrmGerenciaBoletoRemessa.Inativar1Click(Sender: TObject);
var
  viBoletos: TList<Integer>;
begin
  viBoletos := nil;

  tblBoleto.Filtered := False;
  tblBoleto.Filter   := 'calc_check=''S''';
  try
    tblBoleto.Filtered := True;
    viBoletos := GetListId(tblBoleto, 'BOLETO_ID');
    tblBoleto.Filtered := False;

    if (viBoletos.Count <= 0) then
    begin
      ShowMessage('Nenhum boleto selecionado!');
      Exit;
    end;

    if Application.MessageBox(PWideChar('Confirma inativar o(s) ' + viBoletos.Count.ToString + ' boleto(s) selecionado(s)?'), 'Atenção', MB_YESNO + MB_ICONQUESTION) = IDYES then
      try
        if fBoletoBusiness.Inativar(viBoletos) > 0 then
        begin
          ShowMessage('Inativados(s) com sucesso!');
          btnPesquisarBoletoClick(nil);
        end
        else
          ShowMessage('Não foi possivel inativar o(s) boleto(s)!');
      except
        on E: Exception do
          Application.MessageBox(PChar(E.Message), 'Atenção', MB_ICONWARNING + MB_OK);
      end;
  finally
    tblBoleto.Filtered := False;
    tblBoleto.Filter   := '';
    FreeAndNil(viBoletos);
  end;

end;

procedure TfrmGerenciaBoletoRemessa.lblDesmarcarTodosClick(Sender: TObject);
begin
  MarcarDesmarcarBoleto(False);
end;

procedure TfrmGerenciaBoletoRemessa.lblMarcarTodosClick(Sender: TObject);
begin
  MarcarDesmarcarBoleto(True);
end;

procedure TfrmGerenciaBoletoRemessa.cxGridDBTableView3CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var
  viColumn: TcxGridDBColumn;
  viCheck: Boolean;
  viBoleto: TDataSet;
begin
  viColumn := TcxGridDBColumn(
    ACellViewInfo.Item);

  if viColumn.DataBinding.FieldName <> 'calc_check' then
    Exit;

  viBoleto := viColumn.DataBinding.DataController.DataSet;

  viCheck := viBoleto.FieldByName(
    'calc_check').AsString <> 'S';

  if viCheck then
  begin
    if not ValidarTipoOcorrencia(Cobranca.TipoOcorrencia(viBoleto.FieldByName(
      'TIPO_OCORRENCIA').AsString)) then
    begin
      Application.MessageBox('Boleto não pode ser selecionado!', 'Atenção', MB_OK + MB_ICONWARNING);
      Exit;
    end;
  end;

  if not (viBoleto.State in dsEditModes) then
    viBoleto.Edit;

  if viCheck then
    viBoleto.FieldByName(
      'calc_check').AsString := 'S'
  else
    viBoleto.FieldByName(
      'calc_check').AsString := 'N';

  viBoleto.Post;
  AHandled := True;
end;

procedure TfrmGerenciaBoletoRemessa.cxGridDBtvRemessaItemCPFCNPJGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  AText := RetornaCPFCNPJFormatado(AText);
end;

procedure TfrmGerenciaBoletoRemessa.cxGridDBtvRemessaItemCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  viTipoOcorrencia: TTipoOcorrencia;
begin
  viTipoOcorrencia :=  Cobranca.TipoOcorrencia(
    AViewInfo.RecordViewInfo.GridRecord.Values[cxGridDBtvRemessaItemTIPO_OCORRENCIA.Index]);

  case viTipoOcorrencia of
    TTipoOcorrencia.toBoletoCancelado     : ACanvas.Font.Color := clRed;
    TTipoOcorrencia.toBoletoAlterado,
    TTipoOcorrencia.toBoletoValorAlterado : ACanvas.Font.Color := clPurple;
  end;
end;

procedure TfrmGerenciaBoletoRemessa.cxGridDBtvRetornoHistoricoItemCPFCNPJGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  AText := RetornaCPFCNPJFormatado(AText);
end;

procedure TfrmGerenciaBoletoRemessa.cxGridDBtvRetornoHistoricoItemCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  viValor: Variant;
  viBoeltoID: Integer;
begin
  viBoeltoID := 0;
  viValor := AViewInfo.GridRecord.Values[cxGridDBtvRetornoHistoricoItemBOLETO_ID.Index];

  if not VarIsNull(viValor) then
    viBoeltoID := viValor;

  if viBoeltoID > 0 then
    Exit;

  ACanvas.Brush.Color := clSilver;
  ACanvas.Font.Color := clRed;
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

procedure TfrmGerenciaBoletoRemessa.edtPesqNumeroEnter(Sender: TObject);
begin
  if chbLista.Checked then
   frmGerenciaBoletoRemessa.KeyPreview := False;
end;

procedure TfrmGerenciaBoletoRemessa.edtPesqNumeroExit(Sender: TObject);
begin
  if chbLista.Checked then
    frmGerenciaBoletoRemessa.KeyPreview := True;

    if Trim(edtPesqNumero.Text) <> '' then
      btnPesquisarBoleto.SetFocus;

  frmGerenciaBoletoRemessa.KeyPreview := True;
end;

procedure TfrmGerenciaBoletoRemessa.edtPesqNumeroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if chbLista.Checked then
    if Key = 13 then
    begin
      if mmoListaApont.Lines.IndexOf(Trim(edtPesqNumero.Text)) >= 0 then
         ShowMessage('Já informado!')
      else
        mmoListaApont.Lines.Add(Trim(edtPesqNumero.Text));

      edtPesqNumero.Clear;
      edtPesqNumero.SetFocus;
    end;
end;

procedure TfrmGerenciaBoletoRemessa.ExportarArquivoRemessa1Click(
  Sender: TObject);
begin
  SaveDialogRemessa.FileName := tblRemessaHistoricoNOME_ARQUIVO.AsString;
  if SaveDialogRemessa.Execute then
    fHistoricoRemessa.ExportarArquivoRemessa(
      tblRemessaHistoricoBOLETO_REMESSA_ID.AsInteger,
      SaveDialogRemessa.FileName);
end;

procedure TfrmGerenciaBoletoRemessa.ExportarArquivoRetorno1Click(
  Sender: TObject);
begin
  SaveDialogRemessa.FileName := tblRetornoHistoricoNOME_ARQUIVO.AsString;
  if SaveDialogRemessa.Execute then
    fHistoricoRetorno.ExportarArquivoRetorno(
      tblRetornoHistoricoBOLETO_RETORNO_ID.AsInteger,
      SaveDialogRemessa.FileName);
end;

procedure TfrmGerenciaBoletoRemessa.ExportarBoletos1Click(Sender: TObject);
begin
  GerarPlanilhaGrid(grdGerenciaBoleto);
end;

procedure TfrmGerenciaBoletoRemessa.ExportarGrupoSelecionado1Click(
  Sender: TObject);
var
  viOcorrencia: string;
begin
  Screen.Cursor := crHourGlass;
  try
    viOcorrencia := tblRetornoHistoricoItemOCORRENCIA.AsString;
    tblRetornoHistoricoItem.Filtered := False;
    if not viOcorrencia.IsEmpty then
    begin
      tblRetornoHistoricoItem.Filter   := 'OCORRENCIA = '+QuotedStr(viOcorrencia);
      tblRetornoHistoricoItem.Filtered := True;
    end;
    tblRetornoHistoricoItem.First;

    if GerarCSV then
      VisualizarCSV;
  finally
    tblRetornoHistoricoItem.Filtered := False;
    tblRetornoHistoricoItem.Filter   := EmptyStr;
    Screen.Cursor := crDefault;
  end;

end;

procedure TfrmGerenciaBoletoRemessa.ExportarPlanilha1Click(Sender: TObject);
begin
  if GerarCSV then
    VisualizarCSV;
end;

procedure TfrmGerenciaBoletoRemessa.FormActivate(Sender: TObject);
begin
  frmGerenciaBoletoRemessa.WindowState := wsMaximized;
end;

procedure TfrmGerenciaBoletoRemessa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tblRemessa.Close;
  sqlContaCedente.Close;
  sqlBoletoRetorno.Close;
  sqlMotivoRejeicao.Close;

  Action := caFree;
  frmGerenciaBoletoRemessa := nil;
end;

procedure TfrmGerenciaBoletoRemessa.FormCreate(Sender: TObject);
begin
  fBoletoBusiness   := TBoletoBusinessFactory.New.GetInstance;
  fNovaRemessa      := TNovaRemessaFactory.New.GetInstance;
  fHistoricoRemessa := THistoricoRemessaFactory.New.GetInstance;
  fHistoricoRetorno := THistoricoRetornoFactory.New.GetInstance;

  pgcTipoArquivo.ActivePage := tbsBoleto;
  pgcRemessa.ActivePage     := tbsGerarRemessa;

  sqlContaCedente.Connection := dtmControles.DB;
  sqlContaCedente.Close;
  sqlContaCedente.Open;

  lcxCedenteRemessa.EditValue := sqlContaCedenteBANCO_CEDENTE_ID.AsInteger;
  lcxCedenteRemessaGerada.EditValue := sqlContaCedenteBANCO_CEDENTE_ID.AsInteger;
  lcxCedenteRetorno.EditValue := sqlContaCedenteBANCO_CEDENTE_ID.AsInteger;
  lcxCedenteBoleto.EditValue := sqlContaCedenteBANCO_CEDENTE_ID.AsInteger;

  edtDtRemessaIni.Date := Date;
  edtDtRemessaFim.Date := Date;

  edtDtRetornoIni.Date := Date;
  edtDtRetornoFim.Date := Date;

  icbTipoOcorrenciaBoleto.EditValue := 'TDS';
  icbRemessaGerada.EditValue        := 'T';

  if not DirectoryExists('C:\Temp') then
    ForceDirectories('C:\Temp');
end;

procedure TfrmGerenciaBoletoRemessa.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
   case Key of
    #27:
      begin
        Key := #0;
        if Application.MessageBox('Deseja fechar este formulário?', 'Atenção', MB_YESNO + MB_ICONQUESTION) = IDYES then
          Close;
      end;
    #13:
      begin
        if (not (ActiveControl is TMemo)) and (not (ActiveControl is TDBMemo)) and (not (ActiveControl is TDBRichEdit)) and (not (ActiveControl is TDBGrid)) and (not (ActiveControl is TcxGridSite)) then
        begin
          Key := #0;
          PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
        end;
      end;
  end; {case}
end;

function TfrmGerenciaBoletoRemessa.GerarCSV: Boolean;
var
  viPlanilha: TStringList;
  viHeader,
  viDetail,
  viRejeicao,
  viStatus: string;
begin
  viPlanilha := TStringList.Create;
  tblRetornoHistoricoItem.BlockReadSize := 1;
  try
    viHeader := 'BOLETO ID;NOSSO NUMERO;NUMERO DOCUMENTO;DATA OCORRENCIA; OCORRENCIA;VALOR; STATUS;MOTIVO REJEICAO;';
    viPlanilha.Add(viHeader);
    tblRetornoHistoricoItem.First;

    while not tblRetornoHistoricoItem.Eof do
    begin
      if tblRetornoHistoricoItemBOLETO_ID.AsInteger = 0 then
        viStatus := 'BOLETO NÃO LOCALIZADO NA BASE'
      else
        viStatus := 'BOLETO LOCALIZADO';

      viRejeicao := EmptyStr;

      sqlMotivoRejeicao.First;

      while not sqlMotivoRejeicao.Eof do
      begin
        viRejeicao := viRejeicao + sqlMotivoRejeicaoDESCRICAO_MOTIVO_REJEICAO.AsString + ' | ';
        sqlMotivoRejeicao.Next;
      end;

      viDetail := tblRetornoHistoricoItemBOLETO_ID.AsString + ';' +
                  tblRetornoHistoricoItemNOSSO_NUMERO.AsString + ';' +
                  tblRetornoHistoricoItemNUMERO_DOCUMENTO.AsString + ';' +
                  tblRetornoHistoricoItemDATA_CORRENCIA.AsString + ';' +
                  tblRetornoHistoricoItemOCORRENCIA.AsString + ';' +
                  FormatFloat(',0.00', tblRetornoHistoricoItemVALOR.AsFloat) + ';' +
                  viStatus + ';' +
                  viRejeicao + ';';
      viPlanilha.Add(viDetail);

      tblRetornoHistoricoItem.Next;
    end;

     DeleteFile(C_ARQUIVO_EXPORTAR);

     viPlanilha.SaveToFile(C_ARQUIVO_EXPORTAR);

     Result := FileExists(C_ARQUIVO_EXPORTAR);
  finally
    tblRetornoHistoricoItem.BlockReadSize := 0;
    FreeAndNil(viPlanilha);
  end;
end;

procedure TfrmGerenciaBoletoRemessa.GerarPlanilhaGrid(const vpGrid: TcxGrid);
var
  HandleXLS: Variant;
begin
  try
    ExportGridToExcel('C:\Temp\RelTemp.xls', vpGrid);

    HandleXLS := CreateOleObject('Excel.Application');
    HandleXLS.WorkBooks.Open('C:\Temp\RelTemp.xls');
    HandleXLS.DisplayAlerts := False;
    HandleXLS.Visible := True;
  except

  end;
end;

function TfrmGerenciaBoletoRemessa.GetListId(const vpDataSet: TDataSet;
  const vpCampo: string): TList<Integer>;
begin
  Result := TList<Integer>.Create;
  vpDataSet.DisableControls;
  try
    vpDataSet.First;
    while not vpDataSet.Eof do
    begin
      Result.Add(vpDataSet.FieldByName(vpCampo).AsInteger);
      vpDataSet.Next;
    end;
  finally
    vpDataSet.First;
    vpDataSet.EnableControls;
  end;
end;

procedure TfrmGerenciaBoletoRemessa.LimparDataSetBoleto;
begin
  tblBoleto.Close;
  tblBoleto.Open;
end;

procedure TfrmGerenciaBoletoRemessa.LimparDataSetRemessa;
begin
  tblRemessa.Close;
  tblRemessa.Open;
end;

procedure TfrmGerenciaBoletoRemessa.LimparDataSetRemessaHistorico;
begin
  tblRemessaHistorico.Close;
  tblRemessaHistorico.Open;
  tblRemessaHistoricoItem.Close;
  tblRemessaHistoricoItem.Open;
end;

procedure TfrmGerenciaBoletoRemessa.LimparDataSetRetornoHistorico;
begin
  tblRetornoHistorico.Close;
  tblRetornoHistorico.Open;
  tblRetornoHistoricoItem.Close;
  tblRetornoHistoricoItem.Open;
end;

procedure TfrmGerenciaBoletoRemessa.MarcarDesmarcarBoleto(
  const vpMarcar: Boolean);
var
  viTipo: string;
begin
  if vpMarcar then
    viTipo := 'S'
  else
    viTipo := 'N';

  tblBoleto.DisableControls;
  tblBoleto.First;
  try
    while not tblBoleto.eof do
    begin
      tblBoleto.Edit;
      if vpMarcar then
      begin
        if ValidarTipoOcorrencia(Cobranca.TipoOcorrencia(tblBoletoTIPO_OCORRENCIA.AsString)) then
          tblBoletocalc_check.AsString := viTipo
        else
          tblBoletocalc_check.AsString := 'N';
      end
      else
        tblBoletocalc_check.AsString := viTipo;
      tblBoleto.Post;

      tblBoleto.Next;
    end;
  finally
    tblBoleto.EnableControls;
    tblBoleto.First;
  end;
end;

function TfrmGerenciaBoletoRemessa.ValidarTipoOcorrencia(
  const vpTipoOcorrencia: TTipoOcorrencia): Boolean;
begin
  Result := ((vpTipoOcorrencia <> Cobranca.toBoletoInativado) and
             (vpTipoOcorrencia <> Cobranca.toBoletoCancelado) and
             (vpTipoOcorrencia <> Cobranca.toRetornoEntradaRejeitada) and
             (vpTipoOcorrencia <> Cobranca.toRetornoLiquidadoNormal) and
             (vpTipoOcorrencia <> Cobranca.toRetornoBaixaArquivo));
end;

procedure TfrmGerenciaBoletoRemessa.ValidarPeriodo(const vpDataIni, vpDataFim: TcxDateEdit);
begin
  if vpDataIni.Date <= 0 then
  begin
    Application.MessageBox('Data inicio deve ser informada!', 'Atenção', MB_OK + MB_ICONWARNING);
    vpDataIni.SetFocus;
    Abort;
  end;

  if vpDataFim.Date <= 0 then
  begin
    Application.MessageBox('Data final deve ser informada!', 'Atenção', MB_OK + MB_ICONWARNING);
    vpDataFim.SetFocus;
    Abort;
  end;

  if vpDataIni.Date > vpDataFim.Date then
  begin
    Application.MessageBox('Data Inicial não pode ser maior que a Data Final!', 'Atenção', MB_OK + MB_ICONWARNING);
    vpDataIni.SetFocus;
    Abort;
  end;
end;

procedure TfrmGerenciaBoletoRemessa.VisualizarCSV;
var
  HandleXLS : Variant;
begin
  try
    HandleXLS := CreateOleObject('Excel.Application');
    HandleXLS.WorkBooks.Open(C_ARQUIVO_EXPORTAR);
    HandleXLS.DisplayAlerts := False;
    HandleXLS.Visible := True;
  except

  end;
end;

end.
