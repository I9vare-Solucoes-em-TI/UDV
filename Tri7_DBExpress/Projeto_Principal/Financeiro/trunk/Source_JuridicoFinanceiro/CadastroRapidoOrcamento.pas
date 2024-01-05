unit CadastroRapidoOrcamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadastroAuxSimplificado, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, Menus,
  cxLookAndFeelPainters, FMTBcd, DB, DBClient, Provider, SqlExpr, StdCtrls,
  cxButtons, ExtCtrls, cxControls, cxContainer, cxEdit, cxLabel, cxCheckBox,
  cxDBEdit, cxTextEdit, cxGroupBox, cxGraphics, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxMaskEdit, cxDropDownEdit, SimpleDS, cxSpinEdit,
  cxTimeEdit, cxCalendar, cxMemo, cxRichEdit, cxImageComboBox, cxCurrencyEdit,
  dxSkinscxPCPainter, cxPC, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, ComCtrls, DBCGrids,
  cxImage, cxRadioGroup, cxLookAndFeels, dxSkinBlueprint, dxSkinDarkRoom,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinHighContrast, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSpringTime, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  cxPCdxBarPopupMenu, dxSkinDevExpressDarkStyle, dxBarBuiltInMenu,
  DbxDevartInterBase;

type
  TfrmCadastroRapidoOrcamento = class(TfrmCadastroAuxSimplificado)
    dtsPlanoContas: TDataSource;
    sqlPlanoContas: TSimpleDataSet;
    sqlPlanoContasCONTABIL_CONTA_ID: TFMTBCDField;
    sqlPlanoContasDESCRICAO: TStringField;
    ClientAncestralLIVRO_AGENDAMENTO_ID: TFMTBCDField;
    ClientAncestralDATA_INICIAL: TSQLTimeStampField;
    ClientAncestralDATA_FINAL: TSQLTimeStampField;
    ClientAncestralPERIODO: TStringField;
    ClientAncestralVALOR_PARCELA: TFMTBCDField;
    ClientAncestralQTD: TFMTBCDField;
    ClientAncestralSITUACAO: TStringField;
    ClientAncestralESPECIE: TStringField;
    ClientAncestralBALANCETE_GRUPO_ID: TFMTBCDField;
    ClientAncestralHISTORICO: TStringField;
    ClientAncestralOBSERVACAO: TStringField;
    ClientAncestralPROCESSO_TRAMITE_ID: TFMTBCDField;
    ClientAncestralCONTABIL_CONTA_ID: TFMTBCDField;
    ClientAncestralPESSOA_ID: TFMTBCDField;
    ClientAncestralDATA_REGISTRO: TSQLTimeStampField;
    ClientAncestralVALOR_PROLABORE: TFMTBCDField;
    ClientAncestralCENTRO_CUSTO_ID: TFMTBCDField;
    ClientAncestralTIPO: TStringField;
    ClientAncestralIR: TStringField;
    ClientAncestralCNJ: TStringField;
    ClientAncestralCAIXA_ID: TFMTBCDField;
    tabBalancete: TcxTabControl;
    cxLabel5: TcxLabel;
    lblCliente: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel14: TcxLabel;
    ClientAncestralCONTABIL_GRUPO_ID: TFMTBCDField;
    sqlPlanoContasIR: TStringField;
    sqlPlanoContasCNJ: TStringField;
    ClientAncestralDOCUMENTO_NUMERO: TStringField;
    ClientAncestralREGISTRO_PARCIAL: TStringField;
    dtsGrupoContabil: TDataSource;
    sqlGrupoContabil: TSimpleDataSet;
    sqlGrupoContabilDESCRICAO: TStringField;
    sqlGrupoContabilCONTABIL_GRUPO_ID: TFMTBCDField;
    sqlGrupoContabilBALANCETE_GRUPO_ID: TFMTBCDField;
    ClientAncestralOPERACAO: TStringField;
    cxLabel10: TcxLabel;
    cxLabel3: TcxLabel;
    edtHistorico: TcxDBTextEdit;
    edtValorFixo: TcxDBCurrencyEdit;
    lcxCliente: TcxDBLookupComboBox;
    cxButton1: TcxButton;
    lcxGrupoContabil: TcxDBLookupComboBox;
    lcxCompromisso: TcxDBLookupComboBox;
    lcxCaixa: TcxDBLookupComboBox;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure cbxParcelasExit(Sender: TObject);
    procedure tabBalanceteChange(Sender: TObject);
    procedure icxTipoPropertiesChange(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure lcxGrupoContabilPropertiesEditValueChanged(Sender: TObject);
    procedure edtValorFixoExit(Sender: TObject);
  private
    vlContratoItemParcela: Boolean;
    procedure HabilitarTabValor;
    procedure SalvarRegistro(vpSalvarComo: Boolean = False);
  public
    vlCriandoForm, vlAtivandoForm: Boolean;
    { Public declarations }
  end;

var
  frmCadastroRapidoOrcamento: TfrmCadastroRapidoOrcamento;
  vgDataUltimoPagamento: string;
  vgDuplicarContaId : Integer;

implementation

uses
  Lookup, Controles, Rotinas, Lookup_Contabil, Lookup_Servico, Pessoa,
  PessoaPreCadastro, LookupFinanceiro, Cadastro;

{$R *.dfm}

procedure TfrmCadastroRapidoOrcamento.btnConfirmarClick(Sender: TObject);
begin
  SalvarRegistro;
  inherited;
end;

procedure TfrmCadastroRapidoOrcamento.cbxParcelasExit(Sender: TObject);
begin
  inherited;
  if dtmLookupServico.ClientParcelas.State in [dsEdit, dsInsert] then
    dtmLookupServico.ClientParcelas.Post;
end;

procedure TfrmCadastroRapidoOrcamento.cxButton1Click(Sender: TObject);
begin
  inherited;
  vgPessoa.PessoaTipo        := 'F';
  vgPessoa.CPF_CNPJ          := '';
  vgPessoa.Selecionar        := True;
  vgPessoa.PessoaTipoVinculo := '6:Padr�o';
  vgPessoa.Nome              := '';

  frmPessoaPreCadastro := TfrmPessoaPreCadastro.Create(self);
  frmPessoaPreCadastro.ShowModal;
  if vgPessoa.PessoaId = - 1 then
    exit
  else
    if vgPessoa.PessoaId > 0 then
    begin
      lcxCliente.EditValue := vgPessoa.PessoaId;
      exit;
    end;

  vgCadastrarFuncao := False;
  vgNovoCadastro    := True;
  vgPessoa.PessoaId := 0;
  CadPessoa(True);

  if vgPessoa.PessoaId > 0 then
    lcxCliente.EditValue := vgPessoa.PessoaId;
end;

procedure TfrmCadastroRapidoOrcamento.edtValorFixoExit(Sender: TObject);
begin
  inherited;
  if edtValorFixo.EditValue = null then
    exit;

  VerificarPreenchimentoCUR_DB(edtValorFixo.EditValue, 'Valor', edtValorFixo);
end;

procedure TfrmCadastroRapidoOrcamento.FormActivate(Sender: TObject);
begin
  inherited;
  vlAtivandoForm := True;
  edtHistorico.SetFocus;

  vlCriandoForm := False;

  if ClientAncestral.State in [dsInsert] then
  begin
    vlAtivandoForm := False;
    HabilitarTabValor;
  end
  else
  begin
    HabilitarTabValor;
    vlAtivandoForm := False;
  end;
end;

procedure TfrmCadastroRapidoOrcamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  vgDadosCadastro.SomentePesquisa := False;
  dtmLookupFinanceiro.AbrirFecharTelaBranco(False);
  vgDuplicarContaId := 0;

  Action := caFree;
  frmCadastroRapidoOrcamento := nil;
end;

procedure TfrmCadastroRapidoOrcamento.FormCreate(Sender: TObject);
begin
  dtmLookupFinanceiro.AbrirFecharTelaBranco;
  vlCriandoForm := True;

  if vgCaixaPrincipalID = 0 then
  begin
    Application.MessageBox('Defina um caixa principal em CADASTRO/CAIXA FINANCEIRO!!!','Aten��o', MB_OK + MB_ICONWARNING);
    btnConfirmar.Enabled := False;
    abort;
  end;

  inherited;

  Screen.Cursor := crHourGlass;
  dtmLookupContabil.CarregarTabBalancete(tabBalancete);
  sqlPlanoContas.Connection   := dtmControles.DB;
  sqlGrupoContabil.Connection := dtmControles.DB;

  dtmLookupServico.ClientParcelas.Filtered := False;
  if ClientAncestral.State in [dsInsert] then
  begin
    ClientAncestralSITUACAO.AsString        := '1';
    ClientAncestralESPECIE.AsString         := 'D';
    ClientAncestralDATA_REGISTRO.AsDateTime := dtmControles.DataHoraBanco(3);
    ClientAncestralCAIXA_ID.AsInteger       := vgCaixaPrincipalID;
    ClientAncestralQtd.AsInteger := 1;
    tabBalanceteChange(Self);
  end
  else
  begin
    tabBalancete.TabIndex := ClientAncestralBALANCETE_GRUPO_ID.AsInteger - 1;
    tabBalanceteChange(Self);
  end;
  Screen.Cursor := crDefault;
end;

procedure TfrmCadastroRapidoOrcamento.HabilitarTabValor;
var
  viBalancete: Integer;
  viCaption, viClienteText: string;
begin
  viBalancete := vgTabBalancete[tabBalancete.TabIndex];
  lcxCliente.Enabled := (viBalancete <> 3);
end;

procedure TfrmCadastroRapidoOrcamento.icxTipoPropertiesChange(Sender: TObject);
begin
  inherited;
  tabBalanceteChange(self);
end;

procedure TfrmCadastroRapidoOrcamento.lcxGrupoContabilPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if lcxGrupoContabil.Text = '' then
    exit;

  sqlPlanoContas.Active := False;
  sqlPlanoContas.DataSet.ParamByName('CONTABIL_GRUPO_ID').AsInteger := lcxGrupoContabil.EditValue;
  sqlPlanoContas.Active := True;

  if (sqlPlanoContas.RecordCount = 1) and (ClientAncestral.State in [dsEdit, dsInsert]) then
    ClientAncestralCONTABIL_CONTA_ID.AsInteger := sqlPlanoContasCONTABIL_CONTA_ID.AsInteger;

  lcxCompromisso.Enabled := True;
end;

procedure TfrmCadastroRapidoOrcamento.SalvarRegistro(vpSalvarComo: Boolean);
begin
  VerificarPreenchimentoLCX_DB(lcxCompromisso.Text, 'Compromisso', lcxCompromisso);
  VerificarPreenchimentoLCX_DB(lcxCliente.Text, lblCliente.Caption, lcxCliente);
  VerificarPreenchimentoEDT_DB(edtHistorico.Text, 'Nome do Or�amento', edtHistorico);
  VerificarPreenchimentoCUR_DB(edtValorFixo.EditValue, 'Valor', edtValorFixo);

  ClientAncestralVALOR_PROLABORE.AsCurrency   := ClientAncestralVALOR_PARCELA.AsCurrency;
  ClientAncestralBalancete_Grupo_Id.AsInteger := vgTabBalancete[tabBalancete.TabIndex];
  ClientAncestralCentro_Custo_Id.AsInteger    := vgCentroCustoPrincipal[tabBalancete.TabIndex];
  ClientAncestralPERIODO.AsInteger            := 1;
  ClientAncestralOPERACAO.AsString            := 'O';
end;

procedure TfrmCadastroRapidoOrcamento.tabBalanceteChange(Sender: TObject);
begin
  inherited;
  sqlGrupoContabil.Active := False;

  sqlGrupoContabil.DataSet.ParamByName('TIPO').AsString := '1';
  sqlGrupoContabil.DataSet.ParamByName('BALANCETE_GRUPO_ID').AsInteger := vgTabBalancete[tabBalancete.TabIndex];
  sqlGrupoContabil.Active := True;

  if vlCriandoForm then
  begin
    lcxGrupoContabilPropertiesEditValueChanged(Self);
    exit;
  end;

  if (ClientAncestral.State in [dsInsert, dsEdit]) and (vgDuplicarContaId = 0) then
  begin
    ClientAncestralCONTABIL_CONTA_ID.AsVariant := null;
    ClientAncestralCONTABIL_GRUPO_ID.AsVariant := null;
  end;
  HabilitarTabValor;
  sqlPlanoContas.Active := False;
  lcxGrupoContabilPropertiesEditValueChanged(Self);
end;

end.










