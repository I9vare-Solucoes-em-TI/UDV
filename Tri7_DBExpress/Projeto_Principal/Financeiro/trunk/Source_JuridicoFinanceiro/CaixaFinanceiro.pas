unit CaixaFinanceiro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, cxLookAndFeelPainters, FMTBcd, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  DBClient, Provider, SqlExpr, ActnList, ComCtrls, StdCtrls, cxButtons,
  ExtCtrls, cxTextEdit, cxDBEdit, cxContainer, cxLabel, cxSplitter,
  cxMaskEdit, cxDropDownEdit, cxImageComboBox, cxCheckBox, Menus, dxSkinsCore,
  dxSkinsDefaultPainters, SimpleDS, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxLookAndFeels, dxSkinBlueprint, dxSkinDarkRoom,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinHighContrast, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013White, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSpringTime,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxNavigator,
  System.Actions, cxCalendar, cxGroupBox;

type
  TfrmCaixaFinanceiro = class(TfrmCadBasico)
    grdServico: TcxGrid;
    grdServicoDBTableView1: TcxGridDBTableView;
    grdServicoLevel1: TcxGridLevel;
    cxLabel1: TcxLabel;
    grdServicoDBTableView1DESCRICAO: TcxGridDBColumn;
    grdServicoDBTableView1SITUACAO: TcxGridDBColumn;
    ClientAncestralCAIXA_ID: TFMTBCDField;
    ClientAncestralSITUACAO: TStringField;
    ClientAncestralRESPONSAVEL_ID: TFMTBCDField;
    grdServicoDBTableViewBANCO: TcxGridDBColumn;
    popPrincipal: TPopupMenu;
    mniDefinirCentroCustoPrincipal: TMenuItem;
    ClientAncestralPRINCIPAL: TStringField;
    grdServicoDBTableView1PRINCIPAL: TcxGridDBColumn;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralRESUMO: TStringField;
    ClientAncestralINTERNO: TStringField;
    cxLabel2: TcxLabel;
    grdServicoDBTableView1Column1: TcxGridDBColumn;
    lblBancoBoleto: TcxLabel;
    ClientAncestralBANCO_ID: TFMTBCDField;
    cxButton1: TcxButton;
    ClientAncestralTIPO_CAIXA: TStringField;
    ClientAncestralPREVISAO_SALDO: TStringField;
    grdServicoDBTableView1Column2: TcxGridDBColumn;
    grdServicoDBTableView1Column3: TcxGridDBColumn;
    cxLabel3: TcxLabel;
    ClientAncestralCONCILIACAO_DATA_INICIO: TSQLTimeStampField;
    ClientAncestralCONCILIACAO_REALIZAR: TStringField;
    edtDescricao: TcxDBTextEdit;
    edtDescricaoResumida: TcxDBTextEdit;
    lcxTipoCaixa: TcxDBImageComboBox;
    cxBANCO_ID: TcxDBLookupComboBox;
    cbxConciliacao: TcxGroupBox;
    chxConciliacao: TcxDBCheckBox;
    edtDataConciliacao: TcxDBDateEdit;
    lblDataConciliacao: TcxLabel;
    cxDBCheckBox1: TcxDBCheckBox;
    chbSituacao: TcxDBCheckBox;
    grdServicoDBTableView1Column4: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure mniDefinirCentroCustoPrincipalClick(Sender: TObject);
    procedure brnResponsavelLimparClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure lcxTipoCaixaPropertiesChange(Sender: TObject);
    procedure ExecuteCancelarExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure chxConciliacaoClick(Sender: TObject);
    procedure ClientAncestralAfterScroll(DataSet: TDataSet);
  private
    vlCancelar : Boolean;
  public
    { Public declarations }
    procedure LoadData; override;
    procedure SetState (AState : TDataSetState);override;
  end;

var
  frmCaixaFinanceiro: TfrmCaixaFinanceiro;

implementation

uses Controles, Lookup, LookupFinanceiro, Lookup_Contabil;

{$R *.dfm}

procedure TfrmCaixaFinanceiro.FormCreate(Sender: TObject);
begin
  ClientAncestral.Open;
  inherited;
  vgNomeTabela    := 'J_CAIXA';
  vgChavePrimaria := 'CAIXA_ID';
end;

procedure TfrmCaixaFinanceiro.lcxTipoCaixaPropertiesChange(Sender: TObject);
begin
  inherited;
  cxBANCO_ID.Enabled     := lcxTipoCaixa.ItemIndex = 0;
  lblBancoBoleto.Enabled := lcxTipoCaixa.ItemIndex = 0;
  cbxConciliacao.Enabled := lcxTipoCaixa.ItemIndex = 0;
  chxConciliacao.Enabled     := lcxTipoCaixa.ItemIndex = 0;

  if not cxBANCO_ID.Enabled then
  begin
    if (state in [dsEdit, dsInsert]) and not vlCancelar then
    begin
      ClientAncestralBANCO_ID.AsVariant := null;
      ClientAncestralCONCILIACAO_REALIZAR.AsString := 'N';
     end;
  end;
  chxConciliacaoClick(self);
end;

procedure TfrmCaixaFinanceiro.LoadData;
begin
  inherited;
  if Trim(vgChave) <> '' then
     ClientAncestral.Locate('CAIXA_ID', vgChave, [loCaseInsensitive]);
end;

procedure TfrmCaixaFinanceiro.mniDefinirCentroCustoPrincipalClick(
  Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Definir Caixa Financeiro selecionado como Principal?', 'Confirma��o', MB_YESNO) = IDNO then
    exit;

  ExecutaSqlAuxiliar(' UPDATE J_CAIXA SET PRINCIPAL = '+QuotedStr('N'),1);
  ClientAncestral.Refresh;

  ClientAncestral.Edit;
  ClientAncestralPRINCIPAL.AsString := 'S';
  ClientAncestral.ApplyUpdates(-1);
end;

procedure TfrmCaixaFinanceiro.SetState(AState: TDataSetState);
begin
  inherited;
  grdServico.Enabled := State = dsBrowse;
end;

procedure TfrmCaixaFinanceiro.ExecuteGravarExecute(Sender: TObject);
var
  viValor : Currency;

  procedure VerificarItemInativo;
  begin
  if (ClientAncestralSITUACAO.AsString = 'I') and (ClientAncestralCAIXA_ID.AsInteger > 0) then
  begin
    // Verifica se existe Agendamento vinculado a esta Conta
    viValor := dtmControles.GetInt(' SELECT COUNT(LIVRO_AGENDAMENTO_ID) FROM J_LIVRO_AGENDAMENTO '+
                                   ' WHERE SITUACAO = '+QuotedStr('1')+
                                   '   AND CAIXA_ID = '+ClientAncestralCAIXA_ID.AsString);
      if viValor > 0 then
    begin
      Application.MessageBox(Pchar('Item n�o pode ser Inativado.'+#13+#13+ 'Existem agendamento(s) vinculado a mesma!!!'), 'Aten��o', MB_OK + MB_ICONWARNING);
      abort;
    end;

    viValor := dtmLookupContabil.CalcularSaldoCaixa(ClientAncestralCAIXA_ID.AsString);
    if viValor <> 0 then
    begin
      Application.MessageBox(Pchar('Item n�o pode ser Inativado.'+#13+#13+ 'O Saldo do Caixa deve estar Zerado!!!'), 'Aten��o', MB_OK + MB_ICONWARNING);
      abort;
    end;
  end;
  end;

begin
  VerificarPreenchimentoEDT_DB(edtDescricao.Text, 'Descri��o Completa', edtDescricao);
  VerificarPreenchimentoEDT_DB(edtDescricaoResumida.Text, 'Descri��o Resumida', edtDescricaoResumida);
  VerificarPreenchimentoICX_DB(lcxTipoCaixa.Text, 'Tipo do Caixa', lcxTipoCaixa);

  if chxConciliacao.Checked then
    VerificarPreenchimentoDTA_DB(edtDataConciliacao.Text, 'Data Concilia��o', edtDataConciliacao);

  VerificarItemInativo;

  if ClientAncestral.RecordCount = 0 then
    ClientAncestralPRINCIPAL.AsString := 'S';

  inherited;
end;

procedure TfrmCaixaFinanceiro.ExecuteIncluirExecute(Sender: TObject);
begin
  inherited;
  ClientAncestralSITUACAO.AsString            := 'A';
  ClientAncestralINTERNO.AsString             := 'N';
  ClientAncestralPRINCIPAL.AsString           := 'N';
  ClientAncestralPREVISAO_SALDO.AsString      := 'S';
  ClientAncestralCONCILIACAO_REALIZAR.AsString:= 'N';
  edtDescricao.SetFocus;
end;

procedure TfrmCaixaFinanceiro.brnResponsavelLimparClick(Sender: TObject);
begin
  inherited;
  if State in [dsInsert, dsEdit] then
    ClientAncestralRESPONSAVEL_ID.AsVariant := null;
end;

procedure TfrmCaixaFinanceiro.chxConciliacaoClick(Sender: TObject);
begin
  inherited;
  lblDataConciliacao.Enabled := chxConciliacao.Checked;
  edtDataConciliacao.Enabled := chxConciliacao.Checked;

  if not chxConciliacao.Checked then
    if (ClientAncestral.state in [dsEdit, dsInsert]) and not vlCancelar then
      ClientAncestralCONCILIACAO_DATA_INICIO.AsString := '';
end;

procedure TfrmCaixaFinanceiro.ClientAncestralAfterScroll(DataSet: TDataSet);
begin
  inherited;
  chxConciliacaoClick(self);
  mniDefinirCentroCustoPrincipal.Enabled := ClientAncestralSITUACAO.AsString = 'A';
end;

procedure TfrmCaixaFinanceiro.cxButton1Click(Sender: TObject);
begin
  inherited;
  if State in [dsInsert, dsEdit] then
    ClientAncestralBANCO_ID.AsVariant := null;
end;

procedure TfrmCaixaFinanceiro.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

procedure TfrmCaixaFinanceiro.ExecuteCancelarExecute(Sender: TObject);
begin
  vlCancelar := True;
  inherited;
  vlCancelar := False;
end;

procedure TfrmCaixaFinanceiro.FormActivate(Sender: TObject);
begin
  inherited;
  vlCancelar := False;
end;

procedure TfrmCaixaFinanceiro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dtmLookupFinanceiro.AtualizarTabelas;
  dtmLookupContabil.AtualizarTabelas;
  vgCaixaPrincipalID := dtmControles.GetInt(' SELECT CAIXA_ID FROM J_CAIXA WHERE PRINCIPAL = ''S''');

  Action             := caFree;
  frmCaixaFinanceiro := nil;
end;

end.
