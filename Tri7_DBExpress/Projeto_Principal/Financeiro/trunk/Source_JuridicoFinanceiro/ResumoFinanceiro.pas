unit ResumoFinanceiro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, Menus, cxLookAndFeelPainters, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxCurrencyEdit, cxBlobEdit, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, DBClient, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGrid, StdCtrls, cxButtons, ExtCtrls,
  cxContainer, cxLabel, cxImageComboBox, cxGroupBox, cxPC, SimpleDS;

type
  TfrmResumoFinanceiro = class(TForm)
    Panel2: TPanel;
    Bevel4: TBevel;
    lblInformacaoLancamento: TcxLabel;
    Panel4: TPanel;
    imgReceber: TImage;
    btnConfirmar: TcxButton;
    sqlCaixa: TClientDataSet;
    dtsCaixa: TDataSource;
    sqlCaixaCAIXA_ID: TIntegerField;
    sqlCaixaPRINCIPAL: TStringField;
    sqlCaixaVALOR: TCurrencyField;
    cxPageControl1: TcxPageControl;
    tabPartesFinanceiras: TcxTabSheet;
    cxGroupBox1: TcxGroupBox;
    gdrResumoCaixas: TcxGrid;
    cxGridDBTableResumo: TcxGridDBTableView;
    cxGridDBTableResumoColumn1: TcxGridDBColumn;
    cxGridDBTableResumoColumn2: TcxGridDBColumn;
    cxGridDBTableResumoColumn3: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    grdResumoFinanceiro: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    sqlPartesFinanceiras: TSimpleDataSet;
    dtsPartesFinanceiras: TDataSource;
    sqlPartesFinanceirasVALOR: TFMTBCDField;
    sqlPartesFinanceirasPESSOA_ID: TFMTBCDField;
    sqlPartesFinanceirasCALC_VALOR_RECEBER: TCurrencyField;
    sqlPartesFinanceirasCALC_VALOR_DEVOLVER: TCurrencyField;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    sqlPartesFinanceirascalc_SALDO_CONTA_FINANCEIRA: TCurrencyField;
    sqlCaixaPESSOA_ID: TIntegerField;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    sqlPartesFinanceirasCALC_VALOR_RESTANTE_RECEBER: TCurrencyField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sqlPartesFinanceirasCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmResumoFinanceiro: TfrmResumoFinanceiro;

implementation

uses
  LookupJuridico, Lookup_Contabil, Controles;

{$R *.dfm}

procedure TfrmResumoFinanceiro.btnConfirmarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmResumoFinanceiro.FormActivate(Sender: TObject);
begin

  ExecutaSqlAuxiliar(' SELECT * FROM J_CAIXA WHERE SITUACAO = '+ QuotedStr('A')+
                     ' ORDER BY DESCRICAO',0);
  sqlCaixa.EmptyDataSet;

  While not dtmControles.sqlAuxiliar.Eof do
  begin
    sqlCaixa.Append;
    sqlCaixaCAIXA_ID.AsInteger  := dtmControles.sqlAuxiliar.FieldByName('CAIXA_ID').AsInteger;
    sqlCaixaPRINCIPAL.AsString  := dtmControles.sqlAuxiliar.FieldByName('PRINCIPAL').AsString;
    sqlCaixaPESSOA_ID.AsInteger := dtmControles.sqlAuxiliar.FieldByName('RESPONSAVEL_ID').AsInteger;
    sqlCaixaVALOR.AsCurrency    := dtmLookupJuridico.CalcularSaldoCaixa(sqlCaixaCAIXA_ID.AsString);
    sqlCaixa.Post;
    dtmControles.sqlAuxiliar.Next;
  end;

//  sqlPartesFinanceiras.Active := True;

end;

procedure TfrmResumoFinanceiro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sqlPartesFinanceiras.close;

  Action := caFree;
  frmResumoFinanceiro := nil;
end;

procedure TfrmResumoFinanceiro.FormCreate(Sender: TObject);
begin
  sqlPartesFinanceiras.Connection := dtmControles.db;
end;

procedure TfrmResumoFinanceiro.sqlPartesFinanceirasCalcFields(
  DataSet: TDataSet);
var
  viValorRecebido, viValorReceber : Currency;

begin

  // Verifica o Valor a Receber;
  viValorRecebido := dtmLookupJuridico.PrepararSqlSoma('', 'D', sqlPartesFinanceirasPESSOA_ID.AsString);
  viValorReceber  := sqlPartesFinanceirasVALOR.AsCurrency - viValorRecebido;
  sqlPartesFinanceirasCALC_VALOR_RECEBER.AsCurrency := viValorReceber;

  // Verifica o Saldo na Conta Financeira Pessoal
  if sqlCaixa.Locate('PESSOA_ID', sqlPartesFinanceirasPESSOA_ID.AsInteger, [loCaseInsensitive]) then
       sqlPartesFinanceirascalc_SALDO_CONTA_FINANCEIRA.AsCurrency := sqlCaixaVALOR.AsCurrency
  else sqlPartesFinanceirascalc_SALDO_CONTA_FINANCEIRA.AsCurrency := 0;

  // Verifica Valor Restante a Receber e Devolver
  if sqlPartesFinanceirascalc_SALDO_CONTA_FINANCEIRA.AsCurrency > viValorReceber then
  begin
    sqlPartesFinanceirasCALC_VALOR_RESTANTE_RECEBER.AsCurrency := 0;
    sqlPartesFinanceirasCALC_VALOR_DEVOLVER.AsCurrency         := sqlPartesFinanceirascalc_SALDO_CONTA_FINANCEIRA.AsCurrency - viValorReceber;
  end
  else
  begin
    sqlPartesFinanceirasCALC_VALOR_RESTANTE_RECEBER.AsCurrency := viValorReceber - sqlPartesFinanceirascalc_SALDO_CONTA_FINANCEIRA.AsCurrency;
    sqlPartesFinanceirasCALC_VALOR_DEVOLVER.AsCurrency         := 0;
  end;

end;

end.
