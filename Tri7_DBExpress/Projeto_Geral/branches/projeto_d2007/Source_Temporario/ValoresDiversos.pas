unit ValoresDiversos;

interface

uses
  I9Query,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadAuxiliar, cxLookAndFeelPainters, FMTBcd, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxMaskEdit, cxImageComboBox, cxTextEdit, cxCurrencyEdit,
  cxContainer, cxLabel, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxPC, DBClient, Provider, SqlExpr, StdCtrls,
  cxButtons, ExtCtrls, WPRTEDefs, WPCTRMemo, WPCTRRich, WPRuler, WPTbar, Printers, WPRTEPaint,
  cxDropDownEdit, cxCalendar, cxCheckBox, cxTL, cxDBLookupComboBox,
  SimpleDS, cxInplaceContainer, cxDBTL, cxTLData, clipbrd, Menus, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter;

type
  TVetMoeda = array[1..8] of string;

const
  {Valores por extenso}
  aMoeda     : TVetMoeda = ('CRUZEIRO', 'CRUZEIRO NOVO', 'CRUZEIRO', 'CRUZADO', 'CRUZADO NOVO', 'CRUZEIRO', 'CRUZEIRO REAL', 'REAL');
  aSimbolo   : TVetMoeda = ('Cr$', 'Ncr$', 'Cr$', 'Cz$', 'Ncz$', 'Cr$', 'CR$', 'R$');
  aVigencia  : TVetMoeda = ('01.11.42 a 12.02.67', '13.02.67 a 14.05.70', '15.05.70 a 27.02.86', '28.02.86 a 15.01.89', '16.01.89 a 15.03.90', '16.03.90 a 31.07.93', '01.08.93 a 30.06.94', '01.07.94 em diante');
  aConversao : TVetMoeda = ('', '', 'Tirar 3 Zeros', 'Tirar 3 Zeros', 'Tirar 3 Zeros', 'Tirar 3 Zeros', 'Dividir por CR$ 2.750,00', '');

type
  TfrmValoresDiversos = class(TfrmCadAuxiliar)
    pgvValores: TcxPageControl;
    tabMoeda: TcxTabSheet;
    tabData: TcxTabSheet;
    tabPartes: TcxTabSheet;
    sqlMoedas: TClientDataSet;
    dtsMoedas: TDataSource;
    sqlMoedasMoeda: TStringField;
    sqlMoedasSimbolo: TStringField;
    sqlMoedasVigencia: TStringField;
    sqlMoedasConversao: TStringField;
    grdMoeda: TcxGrid;
    cxGridTableMoedas: TcxGridDBTableView;
    cxGridMoeda: TcxGridDBColumn;
    cxGridSimbolo: TcxGridDBColumn;
    cxGridVigencia: TcxGridDBColumn;
    cxGridConversao: TcxGridDBColumn;
    cxGridMoedas: TcxGridLevel;
    cxLabel13: TcxLabel;
    edtValorNumero: TcxCurrencyEdit;
    cxLabel1: TcxLabel;
    edtValorExtenso: TcxCurrencyEdit;
    cxLabel7: TcxLabel;
    edtPesqDataInicial: TcxDateEdit;
    icxPesqSituacao: TcxImageComboBox;
    cxDBTreeList1: TcxDBTreeList;
    cxDBTreeListColumn1: TcxDBTreeListColumn;
    cxDBTreeListColumn3: TcxDBTreeListColumn;
    cxDBTreeListColumn4: TcxDBTreeListColumn;
    cxDBTreeListColumn5: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn;
    tabImovel: TcxTabSheet;
    grdImovel: TcxGrid;
    cxGridUrbano: TcxGridDBTableView;
    cxGridUrbanoImovel: TcxGridDBColumn;
    cxGridUrbanoEstado: TcxGridDBColumn;
    cxGridUrbanoQuadra: TcxGridDBColumn;
    cxGridUrbanoLote: TcxGridDBColumn;
    cxGridUrbanoBairro: TcxGridDBColumn;
    cxGridUrbanoTipoImovel: TcxGridDBColumn;
    cxGridUrbanoComplemento: TcxGridDBColumn;
    cxGridUrbanoClasse: TcxGridDBColumn;
    cxGridUrbanoDBColumn1: TcxGridDBColumn;
    cxGridUrbanoMostrar: TcxGridDBColumn;
    cxGridRural: TcxGridDBTableView;
    cxGridRuralImovel: TcxGridDBColumn;
    cxGridRuralNomeIdentificacao: TcxGridDBColumn;
    cxGridRuralCaracteristicas: TcxGridDBColumn;
    cxGridRuralArea: TcxGridDBColumn;
    cxGridRuralClasse: TcxGridDBColumn;
    cxGridRuralDBColumn1: TcxGridDBColumn;
    cxGridRuralDBColumn2: TcxGridDBColumn;
    cxGridRuralMostrar: TcxGridDBColumn;
    cxGridLevelUrbano: TcxGridLevel;
    cxGridLevelRural: TcxGridLevel;
    sqlImoveis: TI9Query;
    sqlImoveisATO_VINCULOIMOVEL_ID: TBCDField;
    sqlImoveisATO_ID: TBCDField;
    sqlImoveisREGISTRO_NUMERO: TStringField;
    sqlImoveisIMOVEL_UNIDADE_ID: TBCDField;
    sqlImoveisTIPO_CLASSE: TStringField;
    sqlImoveisNUMERO: TBCDField;
    sqlImoveisUF: TStringField;
    sqlImoveisTB_BAIRRO_ID: TBCDField;
    sqlImoveisIMOVEL_ID: TBCDField;
    sqlImoveisNUMERO_UNIDADE: TStringField;
    sqlImoveisQUADRA: TStringField;
    sqlImoveisAREA: TBCDField;
    sqlImoveisTIPO_IMOVEL: TBCDField;
    sqlImoveisLOGRADOURO: TStringField;
    sqlImoveisCARACTERISTICA: TStringField;
    sqlImoveisCOMPLEMENTO: TStringField;
    sqlImoveiscalc_Selecionado: TBooleanField;
    sqlImoveiscalc_Mostrar: TBooleanField;
    dtsImoveis: TDataSource;
    btnCadastrar: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure sqlMoedasAfterScroll(DataSet: TDataSet);
    procedure edtValorNumeroPropertiesChange(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
  private
    procedure InserirValor;
  public
    { Public declarations }
  end;

var
  frmValoresDiversos: TfrmValoresDiversos;
  vgVetMoeda : TVetMoeda;

implementation

uses Rotinas, ControleVariaveis, Controles;

{$R *.dfm}

procedure TfrmValoresDiversos.FormCreate(Sender: TObject);
var
  i : integer;
begin
  inherited;
  for i := 8 downto 1 do
  begin
    sqlMoedas.Insert;
    sqlMoedasMoeda.AsString     := aMoeda[i];
    sqlMoedasSimbolo.AsString   := aSimbolo[i];
    sqlMoedasVigencia.AsString  := aVigencia[i];
    sqlMoedasConversao.AsString := aConversao[i];
    sqlMoedas.Post;
  end;
  sqlMoedas.Last;
end;

procedure TfrmValoresDiversos.sqlMoedasAfterScroll(DataSet: TDataSet);
var
  viSimbolo : string;
begin
  inherited;
  viSimbolo := sqlMoedasSimbolo.AsString;
  edtValorNumero.Properties.DisplayFormat := viSimbolo+ ' ,0.00;('+viSimbolo+' ,0.00)';
end;

procedure TfrmValoresDiversos.edtValorNumeroPropertiesChange(
  Sender: TObject);
var
  viValor : string;
begin
  inherited;
  if edtValorNumero.Text = '' then
    edtValorNumero.EditValue := 0;

  if edtValorNumero.EditValue <> null then
       viValor := edtValorNumero.EditValue
  else viValor := edtValorNumero.Text;

  case sqlMoedas.RecNo of
    1,3,6 : edtValorExtenso.Text := trim(ValorExtenso(StrToFloat(viValor), '', '', 1));
    2     : edtValorExtenso.Text := trim(ValorExtenso(StrToFloat(viValor), '', '', 7));
    4     : edtValorExtenso.Text := trim(ValorExtenso(StrToFloat(viValor), '', '', 6));
    5     : edtValorExtenso.Text := trim(ValorExtenso(StrToFloat(viValor), '', '', 8));
    7     : edtValorExtenso.Text := trim(ValorExtenso(StrToFloat(viValor), '', '', 9));
    8     : edtValorExtenso.Text := trim(ValorExtenso(StrToFloat(viValor), '', '', 3));
  end;
end;

procedure TfrmValoresDiversos.btnCadastrarClick(Sender: TObject);
begin
  inherited;
  case pgvValores.ActivePageIndex of
    0 : InserirValor;
  end;
  close;
end;

procedure TfrmValoresDiversos.InserirValor;
var
  viWptAuxiliar : TWPRichText;
begin
  viWptAuxiliar := TWPRichText.Create(nil);
  viWptAuxiliar.Visible := false;

  if vgId = 2 then
    viWptAuxiliar.CurrAttr.Style    := [afsBold];
  viWptAuxiliar.SelectionAsString := edtValorNumero.Text;
  viWptAuxiliar.HideSelection;
  viWptAuxiliar.CPPosition := $FFFFF;
  viWptAuxiliar.CurrAttr.Style := [];

  viWptAuxiliar.InputString(' (');
  viWptAuxiliar.SelectionAsString := edtValorExtenso.Text;
  viWptAuxiliar.InputString(')');
  viWptAuxiliar.SelectAll;
  RedefinirPadraoFonte(viWptAuxiliar);
  viWptAuxiliar.CopyToClipboard(true);
  viWptAuxiliar.Free;
end;

procedure TfrmValoresDiversos.FormShow(Sender: TObject);
begin
  inherited;
  tabData.TabVisible   := False;
  tabImovel.TabVisible := False;
  tabPartes.TabVisible := False;
  edtValorNumero.SetFocus;
end;

procedure TfrmValoresDiversos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmValoresDiversos := nil;
end;

procedure TfrmValoresDiversos.btnCancelarClick(Sender: TObject);
begin
  Clipboard.Clear;
  inherited;

end;

end.
