unit DespesasCaixaCartorio;

interface

uses
  I9Query,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxImageComboBox, cxCalendar, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxContainer, cxLabel, StdCtrls, cxButtons, ExtCtrls, DBClient, SimpleDS,
  cxCheckBox;

type
  TfrmDespesasCaixa = class(TForm)
    Panel1: TPanel;
    PanelBotaoFechar: TPanel;
    cxBtnFechar: TcxButton;
    cxLabel7: TcxLabel;
    cxLabel1: TcxLabel;
    edtPesqDataInicial: TcxDateEdit;
    edtPesqDataFinal: TcxDateEdit;
    btnPesquisar: TcxButton;
    btnConfirmar: TcxButton;
    grdPesquisa: TcxGrid;
    cxGridPesquisa: TcxGridDBTableView;
    cxGridPesquisaColumn7: TcxGridDBColumn;
    cxGridPesquisaColumn1: TcxGridDBColumn;
    cxGridPesquisaColumn2: TcxGridDBColumn;
    cxGridPesquisaColumn6: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGridPesquisaColumn3: TcxGridDBColumn;
    cxGridPesquisaColumn4: TcxGridDBColumn;
    dtsDespesas: TDataSource;
    sqlDespesas: TI9Query;
    sqlDespesasCAIXA_ITEM_ID: TBCDField;
    sqlDespesasCAIXA_SERVICO_ID: TBCDField;
    sqlDespesasDESCRICAO: TStringField;
    sqlDespesasDATA_PAGAMENTO: TSQLTimeStampField;
    sqlDespesasVALOR_PAGO: TBCDField;
    sqlDespesasIMPORTADO: TStringField;
    sqlDespesascalc_Selecionar: TBooleanField;
    lblMarcarTodos: TcxLabel;
    lblDesmarcarTodos: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxBtnFecharClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDespesasCaixa: TfrmDespesasCaixa;

implementation

uses
  Controles, Lookup, Rotinas;

{$R *.dfm}

procedure TfrmDespesasCaixa.btnPesquisarClick(Sender: TObject);
var
  viSql : String;
begin

  VerificarPreenchimentoDTA_TX(edtPesqDataInicial.Text, 'Data Inicial', edtPesqDataInicial);
  VerificarPreenchimentoDTA_TX(edtPesqDataFinal.Text, 'Data Final', edtPesqDataFinal);

  Screen.Cursor := crHourGlass;
  viSql := ' SELECT CAIXA_ITEM_ID,'+
           '        CAIXA_SERVICO_ID,'+
           '        DESCRICAO,'+
           '        DATA_PAGAMENTO, '+
           '        VALOR_PAGO, '+
           '        IMPORTADO '+
           ' FROM C_CAIXA_ITEM '+
           ' WHERE TIPO_TRANSACAO = '+QuotedStr('D') +
           '  AND DATA_PAGAMENTO ' + MontarSqlData(edtPesqDataInicial.Date, edtPesqDataFinal.Date);
  sqlDespesas.Active := False;
  sqlDespesas.SQL.Text := viSql;
  sqlDespesas.Active := True;

  Screen.Cursor := crDefault;
  Screen.Cursor := crDefault;
end;

procedure TfrmDespesasCaixa.cxBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TfrmDespesasCaixa.FormActivate(Sender: TObject);
begin
  edtPesqDataInicial.SetFocus;
end;

procedure TfrmDespesasCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action           := caFree;
  frmDespesasCaixa := nil;
end;

procedure TfrmDespesasCaixa.FormCreate(Sender: TObject);
begin
  sqlDespesas.Connection := dtmControles.DB;

  edtPesqDataInicial.Date := dtmControles.DataHoraBanco(3);
  edtPesqDataFinal.Date   := dtmControles.DataHoraBanco(3);
end;

end.
