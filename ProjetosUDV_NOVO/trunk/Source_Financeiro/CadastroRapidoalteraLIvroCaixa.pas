unit CadastroRapidoalteraLIvroCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadastroAuxSimplificado, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, Menus,
  FMTBcd, cxDropDownEdit, cxCalendar, cxDBEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxCurrencyEdit, cxMaskEdit, cxImageComboBox, cxTextEdit,
  cxGroupBox, DB, DBClient, Provider, SqlExpr, StdCtrls, cxButtons, ExtCtrls,
  cxLabel, dxSkinDevExpressDarkStyle, cxCheckBox, dxSkinscxPCPainter,
  cxPCdxBarPopupMenu, cxPC, SimpleDS, dxBarBuiltInMenu, DbxDevartInterBase;

type
  TfrmCadastroRapidoAlteraLivroCaixa = class(TfrmCadastroAuxSimplificado)
    ClientAncestralLIVRO_CAIXA_ID: TFMTBCDField;
    ClientAncestralHISTORICO: TStringField;
    ClientAncestralESPECIE: TStringField;
    ClientAncestralOBSERVACAO: TStringField;
    ClientAncestralVALOR: TFMTBCDField;
    ClientAncestralDATA_PAGAMENTO: TSQLTimeStampField;
    ClientAncestralCONTABIL_CONTA_ID: TFMTBCDField;
    ClientAncestralREFERENCIA: TStringField;
    ClientAncestralCAIXA_ID: TFMTBCDField;
    ClientAncestralANO_MES_REGISTRO: TStringField;
    ClientAncestralIR: TStringField;
    ClientAncestralCNJ: TStringField;
    ClientAncestralDOCUMENTO_NUMERO: TStringField;
    ClientAncestralCONTABIL_GRUPO_ID: TFMTBCDField;
    ClientAncestralPESSOA_ID: TFMTBCDField;
    ClientAncestralOPERACAO: TStringField;
    tabBalancete: TcxTabControl;
    cxLabel3: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel15: TcxLabel;
    cxLabel7: TcxLabel;
    lblCliente: TcxLabel;
    lcxCliente: TcxDBLookupComboBox;
    chbTrocarSenha: TcxDBCheckBox;
    lcxGrupoContabil: TcxDBLookupComboBox;
    lcxCompromisso: TcxDBLookupComboBox;
    edtHistorico: TcxDBTextEdit;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxGroupBox1: TcxGroupBox;
    cxLabel8: TcxLabel;
    lblDataDespesa: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel1: TcxLabel;
    edtValor: TcxDBCurrencyEdit;
    edtDataLancamento: TcxDBDateEdit;
    icxEspecie: TcxDBImageComboBox;
    lcxConta: TcxDBLookupComboBox;
    sqlPlanoContas: TSimpleDataSet;
    sqlPlanoContasCONTABIL_CONTA_ID: TFMTBCDField;
    sqlPlanoContasDESCRICAO: TStringField;
    sqlPlanoContasIR: TStringField;
    dtsPlanoContas: TDataSource;
    ClientAncestralBALANCETE_GRUPO_ID: TFMTBCDField;
    ClientAncestralLIVRO_FINANCEIRO_ID: TFMTBCDField;
    sqlGrupoContabil: TSimpleDataSet;
    sqlGrupoContabilDESCRICAO: TStringField;
    sqlGrupoContabilCONTABIL_GRUPO_ID: TFMTBCDField;
    sqlGrupoContabilBALANCETE_GRUPO_ID: TFMTBCDField;
    dtsGrupoContabil: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure tabBalanceteChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lcxGrupoContabilPropertiesEditValueChanged(Sender: TObject);
  private
    vlCriandoForm : Boolean;
   
  public
    { Public declarations }
  end;

var
  frmCadastroRapidoAlteraLivroCaixa: TfrmCadastroRapidoAlteraLivroCaixa;

implementation

uses Controles, Lookup_Contabil, ValidarPermissaoUsuario, LookupFinanceiro;

{$R *.dfm}

procedure TfrmCadastroRapidoAlteraLivroCaixa.btnConfirmarClick(Sender: TObject);
begin
  VerificarPreenchimentoEDT_DB(edtHistorico.EditValue, 'Histórico', edtHistorico);
  VerificarPreenchimentoLCX_DB(lcxGrupoContabil.Text, 'Grupo do Compromisso', lcxGrupoContabil);
  VerificarPreenchimentoLCX_DB(lcxCompromisso.Text, 'Compromisso', lcxCompromisso);

  if (DateToStr(edtDataLancamento.Date) <> dtmControles.DataHoraBanco(4)) AND (vgLogin <> 'I937') then
  begin
    if Application.MessageBox('Data de Lançamento Diferente da Data Atual. Solicitar Permissão?', 'Confirmação', MB_YESNO) = IDNO then
      exit;

    if LiberarPermissaoUsuario('ESP_PERMISSAO_DATA')[6] = '0' then
      exit;
  end;

  ClientAncestralANO_MES_REGISTRO.AsString := IntToStr(dtmLookupContabil.PegarAnoMes(DateToStr(edtDataLancamento.EditValue)));
  inherited;

end;

procedure TfrmCadastroRapidoAlteraLivroCaixa.FormActivate(Sender: TObject);
begin

  inherited;
  edtHistorico.SetFocus;
  vlCriandoForm := False;

  tabBalanceteChange(Self);
end;

procedure TfrmCadastroRapidoAlteraLivroCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  sqlPlanoContas.Close;
  sqlGrupoContabil.Close;
  dtmLookupFinanceiro.AbrirFecharTelaBranco(False);

  Action := caFree;
  frmCadastroRapidoAlteraLivroCaixa := nil;
end;

procedure TfrmCadastroRapidoAlteraLivroCaixa.FormCreate(Sender: TObject);
begin
  dtmLookupFinanceiro.AbrirFecharTelaBranco;

  vlCriandoForm := True;
  sqlPlanoContas.Connection   := dtmControles.DB;
  sqlGrupoContabil.Connection := dtmControles.DB;
  inherited;

  dtmLookupContabil.CarregarTabBalancete(tabBalancete);
  tabBalancete.TabIndex := ClientAncestralBALANCETE_GRUPO_ID.AsInteger - 1;
end;

procedure TfrmCadastroRapidoAlteraLivroCaixa.lcxGrupoContabilPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if lcxGrupoContabil.Text = '' then
    exit;

  sqlPlanoContas.Active := False;
  sqlPlanoContas.DataSet.ParamByName('CONTABIL_GRUPO_ID').AsInteger := lcxGrupoContabil.EditValue;
  sqlPlanoContas.Active := True;

  if (sqlPlanoContas.RecordCount = 1) and (ClientAncestral.State in [dsEdit, dsInsert]) then
    ClientAncestralCONTABIL_CONTA_ID.AsInteger := sqlPlanoContasCONTABIL_CONTA_ID.AsInteger;

  lcxCompromisso.Enabled := True
end;

procedure TfrmCadastroRapidoAlteraLivroCaixa.tabBalanceteChange(
  Sender: TObject);
var
  viBalancete : Integer;
  viCaption, viClienteText, viTipoGrupoContabil : String;

begin
  inherited;

  if ClientAncestralCONTABIL_GRUPO_ID.AsString <> '' then
  begin
    viTipoGrupoContabil := dtmControles.GetStr(' SELECT TIPO FROM T_CONTABIL_GRUPO WHERE CONTABIL_GRUPO_ID = '+ ClientAncestralCONTABIL_GRUPO_ID.AsString);

    sqlGrupoContabil.Active := False;
    sqlGrupoContabil.DataSet.ParamByName('TIPO').AsString := viTipoGrupoContabil;
    sqlGrupoContabil.DataSet.ParamByName('BALANCETE_GRUPO_ID').AsInteger := vgTabBalancete[tabBalancete.TabIndex];
    sqlGrupoContabil.Active := True;
  end;

  viBalancete := vgTabBalancete[tabBalancete.TabIndex];

  viClienteText := 'Cliente (Receber de quem?)';

  if ClientAncestralOPERACAO.AsString = 'D' then
  begin
    viCaption := 'de Pagamento';
    if viBalancete <> 3 then
       viClienteText := 'Favorecido (Pagar pra quem?)';
  end
  else
    if ClientAncestralOPERACAO.AsString = 'R' then
       viCaption := 'de Entrada'
  else
    if ClientAncestralOPERACAO.AsString = 'AR' then
    begin
      viCaption     := 'do Aporte';
      viClienteText := 'Pessoa que fez o Aporte?';
    end
  else
  begin
     viCaption     := 'da Retirada';
     viClienteText := 'Pessoa que fez a Retirada?';
  end;

  lblDataDespesa.Caption := 'Data '+viCaption;
  lblCliente.Caption     := viClienteText;

  if not vlCriandoForm then
  begin
    lcxGrupoContabilPropertiesEditValueChanged(Self);
    exit;
  end;

  lcxCliente.Enabled       := ClientAncestralLIVRO_FINANCEIRO_ID.IsNull;
  lcxGrupoContabil.Enabled := ClientAncestralLIVRO_FINANCEIRO_ID.IsNull;
  lcxCompromisso.Enabled   := ClientAncestralLIVRO_FINANCEIRO_ID.IsNull;
end;

end.
