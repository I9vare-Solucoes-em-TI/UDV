unit Termo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadAuxiliar, cxLookAndFeelPainters, FMTBcd, DB, DBClient,
  Provider, SqlExpr, StdCtrls, cxButtons, ExtCtrls, cxTextEdit, cxMaskEdit,
  cxSpinEdit, cxControls, cxContainer, cxEdit, cxGroupBox, frxClass,
  frxDBSet, cxLabel, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, Menus, dxSkinsCore, dxSkinsDefaultPainters, cxGraphics,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue, dxGDIPlusClasses,
  cxCurrencyEdit, cxCheckBox, cxImageComboBox, dxSkinscxPCPainter, WPPanel,
  WPCTRRich, WPTbar, WPRTEDefs, WPCTRMemo, cxPC, cxCalendar;

type

  TfrmTermo = class(TfrmCadAuxiliar)
    ClientAncestralDOCUMENTO_ID: TBCDField;
    ClientAncestralNUMERO_REGISTRO: TBCDField;
    ClientAncestralLIVRO: TStringField;
    ClientAncestralNUMERO_PAGINAS: TBCDField;
    ClientAncestralNUMERO_VIAS: TBCDField;
    ClientAncestralDATA_REGISTRO: TSQLTimeStampField;
    ClientAncestralAPRESENTANTE: TStringField;
    ClientAncestralOBSERVACAO: TBlobField;
    ClientAncestralVALOR_DOCUMENTO: TBCDField;
    ClientAncestralTAXA_JUDICIARIA: TBCDField;
    ClientAncestralVALOR_CUSTAS: TBCDField;
    ClientAncestralTIPO_DOCUMENTO_ID: TBCDField;
    ClientAncestralEMOLUMENTO_ID: TBCDField;
    ClientAncestralVALOR_TOTAL: TBCDField;
    ClientAncestralLIVRO_NUMERO: TBCDField;
    ClientAncestralLIVRO_PAGINA: TBCDField;
    ClientAncestralNUMERO_PESSOAS: TBCDField;
    ClientAncestralPAGINA_ID: TIntegerField;
    btnConfirmarItem: TcxButton;
    Panel4: TPanel;
    imgPagar: TImage;
    lblInformacaoCertidao: TcxLabel;
    frxTermo: TfrxReport;
    frxDBRelatorio: TfrxDBDataset;
    pgcTermo: TcxPageControl;
    tabImpressao: TcxTabSheet;
    tabTermoAbertura: TcxTabSheet;
    cxLabel1: TcxLabel;
    WPRichText1: TWPRichText;
    wptFerramentas: TWPToolBar;
    cxLabel7: TcxLabel;
    speNumColunas: TcxSpinEdit;
    btnGravarAlteracao: TcxButton;
    btnCancelarAlteracao: TcxButton;
    tabTermoFechamento: TcxTabSheet;
    WPRichText2: TWPRichText;
    WPToolBar1: TWPToolBar;
    cxLabel4: TcxLabel;
    cxSpinEdit1: TcxSpinEdit;
    sqlTextosTermo: TClientDataSet;
    sqlTextosTermoTEXTO: TBlobField;
    sqlTextosTermoORDEM: TIntegerField;
    cxLabel5: TcxLabel;
    Label3: TLabel;
    icxTermo: TcxImageComboBox;
    edtData: TcxDateEdit;
    edtNomeOficial: TcxTextEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lcxEscreventeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnConfirmarItemClick(Sender: TObject);
    procedure icxTermoPropertiesEditValueChanged(Sender: TObject);
    procedure btnGravarAlteracaoClick(Sender: TObject);
    procedure WPRichText1KeyPress(Sender: TObject; var Key: Char);
    procedure pgcTermoChange(Sender: TObject);
    procedure btnCancelarAlteracaoClick(Sender: TObject);
  private
    vlControleId : Integer;
    procedure SetarParametros;
  public
  end;

var
  frmTermo: TfrmTermo;

implementation

uses Lookup, Controles, Rotinas, GerenciadorCadastro, IBVisualConst,
  VisualizaRelatorios;


{$R *.dfm}

procedure TfrmTermo.btnCancelarAlteracaoClick(Sender: TObject);
begin
  inherited;
  icxTermoPropertiesEditValueChanged(icxTermo);
  btnCancelarAlteracao.Enabled := False;
  btnGravarAlteracao.Enabled   := False;
end;

procedure TfrmTermo.btnConfirmarItemClick(Sender: TObject);
var
  viRelatorioTermo : string;
begin
  sqlTextosTermo.EmptyDataSet;
  sqlTextosTermo.Insert;
  if icxTermo.EditValue = '1' then
       sqlTextosTermoTEXTO.AsString := WPRichText1.AsString
  else sqlTextosTermoTEXTO.AsString := WPRichText2.AsString;
  sqlTextosTermo.Post;

  pgcTermo.ActivePageIndex := 0;
  VerificarPreenchimentoEDT_tx(edtNomeOficial.Text, 'Quem Assina',edtNomeOficial);
  VerificarPreenchimentoDTA_TX(edtData.Text, 'Data',edtData);

  viRelatorioTermo := dtmControles.BuscarConfig('REGISTRO_DIARIO', 'RELATORIO', 'RELATORIO_TERMO', 'S');
  ExibirRelatorio(frxTermo, viRelatorioTermo, SetarParametros);
end;

procedure TfrmTermo.btnGravarAlteracaoClick(Sender: TObject);
var
  viTipo : String;
begin
  inherited;

  if icxTermo.EditValue = '1' then
       viTipo := 'TERMO_ABERTURA'
  else viTipo := 'TERMO_FECHAMENTO';

  ExecutaSimpleDSAux(' SELECT TEXTO, CONFIG_ID FROM G_CONFIG ' +
                     ' WHERE NOME = '+ QuotedStr(viTipo)+
                     '  AND (TERMINAL IS NULL OR TERMINAL = '+QuotedStr('')+')'+
                     '   AND SECAO    = '+ QuotedStr('TERMO')+
                     '   AND CONFIG_GRUPO_ID = (SELECT CONFIG_GRUPO_ID FROM G_CONFIG_GRUPO '+
                     '                          WHERE DESCRICAO = '+QuotedStr('REGISTRO_DIARIO')+
                     '                            AND SISTEMA_ID = 17)',0);
  dtmControles.SimpleAuxiliar.Edit;
  if icxTermo.EditValue = '1' then
       dtmControles.SimpleAuxiliar.FieldByName('TEXTO').AsVariant := CompressString(WPRichText1.AsString)
  else dtmControles.SimpleAuxiliar.FieldByName('TEXTO').AsVariant := CompressString(WPRichText2.AsString);
  dtmControles.SimpleAuxiliar.ApplyUpdates(-1);

  btnGravarAlteracao.Enabled   := False;
  btnCancelarAlteracao.Enabled := False;
  dtmControles.sqlConfig.Refresh;
end;


procedure TfrmTermo.FormActivate(Sender: TObject);
begin
  inherited;
  edtNomeOficial.EditValue := dtmControles.BuscarConfig('REGISTRO_DIARIO', 'RELATORIO', 'OFICIAL_ESCREVENTE_ASSINA', 'S');
  pgcTermo.ActivePageIndex := 0;
  icxTermoPropertiesEditValueChanged(icxTermo);
  pgcTermoChange(self);
end;

procedure TfrmTermo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action   := caFree;
  frmTermo := nil;
end;

procedure TfrmTermo.icxTermoPropertiesEditValueChanged(Sender: TObject);
var
  WptTextoTermo : TWPRichText;
begin
  inherited;
  WptTextoTermo := TWPRichText.Create(nil);

  if icxTermo.EditValue = '1' then
       WptTextoTermo.AsString := dtmControles.BuscarConfig('REGISTRO_DIARIO','TERMO','TERMO_ABERTURA','T')
  else WptTextoTermo.AsString := dtmControles.BuscarConfig('REGISTRO_DIARIO','TERMO','TERMO_FECHAMENTO','T');

  tabTermoAbertura.TabVisible   := icxTermo.EditValue = '1';
  tabTermoFechamento.TabVisible := icxTermo.EditValue = '2';

  if WptTextoTermo.Text = '' then
       btnGravarAlteracaoClick(self)
  else
  begin
    if icxTermo.EditValue = '1' then
         WPRichText1.AsString :=  WptTextoTermo.AsString
    else WPRichText2.AsString :=  WptTextoTermo.AsString;
  end;

end;

procedure TfrmTermo.lcxEscreventeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = 13 then
    btnConfirmarItemClick(Self);
end;

procedure TfrmTermo.pgcTermoChange(Sender: TObject);
begin
  inherited;
  case pgcTermo.ActivePageIndex of
    0 : icxTermo.SetFocus;
    1 : WPRichText1.SetFocus;
    2 : WPRichText2.SetFocus;
  end;

end;

procedure TfrmTermo.SetarParametros;
begin
  frxTermo.Variables.Variables['vgNomeCartorio']  := QuotedStr(dtmControles.BuscarConfig('PRINCIPAL', 'CARTORIO', 'NOME', 'S'));
  frxTermo.Variables.Variables['vgLogin']         := QuotedStr(vgLogin);
  frxTermo.Variables.Variables['vgEscrevente']    := QuotedStr(edtNomeOficial.Text);
  frxTermo.Variables.Variables['Data']            := QuotedStr(Rotinas.MaiusculoMinusculo(FormatDateTime('dddd, dd',edtData.Date) + ' de ' +
                                                   FormatDateTime('MMMM', edtData.Date) + ' de ' +
                                                   FormatDateTime('yyyy', edtData.Date)));
  if icxTermo.EditValue = '1' then
       frxTermo.Variables.Variables['TERMO']      := QuotedStr('TERMO DE ABERTURA')
  else frxTermo.Variables.Variables['TERMO']      := QuotedStr('TERMO DE FECHAMENTO')

end;

procedure TfrmTermo.WPRichText1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  btnGravarAlteracao.Enabled   := True;
  btnCancelarAlteracao.Enabled := True;
end;

end.
