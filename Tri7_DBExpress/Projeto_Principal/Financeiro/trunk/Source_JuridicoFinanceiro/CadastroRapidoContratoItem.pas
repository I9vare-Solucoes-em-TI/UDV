unit CadastroRapidoContratoItem;

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
  cxImage, cxLookAndFeels, dxSkinBlueprint, dxSkinDarkRoom,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinHighContrast, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSpringTime, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  cxPCdxBarPopupMenu, cxNavigator, cxRadioGroup;

type
  TfrmCadastroRapidoContratoItem = class(TfrmCadastroAuxSimplificado)
    ClientAncestralPROCESSO_CONTRATO_ITEM_ID: TFMTBCDField;
    ClientAncestralTIPO: TStringField;
    ClientAncestralDATA_INICIAL: TSQLTimeStampField;
    ClientAncestralDATA_FINAL: TSQLTimeStampField;
    ClientAncestralPERIODO: TStringField;
    ClientAncestralVALOR_PARCELA: TFMTBCDField;
    ClientAncestralVALOR_PERCENTUAL: TFMTBCDField;
    ClientAncestralVALOR_PROLABORE: TFMTBCDField;
    ClientAncestralSITUACAO: TStringField;
    ClientAncestralPROCESSO_CONTRATO_ID: TFMTBCDField;
    ClientAncestralESPECIE: TStringField;
    ClientAncestralPROCESSO_TRAMITE_ID: TFMTBCDField;
    ClientAncestralREAJUSTE: TStringField;
    ClientAncestralQTD_SALARIO: TFMTBCDField;
    ClientAncestralDEFINICAO_VALOR: TStringField;
    ClientAncestralTAREFA_ID: TFMTBCDField;
    ClientAncestralQTD: TFMTBCDField;
    ClientAncestralBENEFICIO_DISTRIBUIR: TStringField;
    ClientAncestralBENEFICIO_PETICIONADOR: TFMTBCDField;
    ClientAncestralBENEFICIO_CAPTADOR: TFMTBCDField;
    ClientAncestralVALOR_DISTRIBUIR: TFMTBCDField;
    ClientAncestralTIPO_BENEFICIO_ID: TFMTBCDField;
    pgcPersonalizados: TcxPageControl;
    tabValorPersonalizado: TcxTabSheet;
    cbxParcelas: TcxGroupBox;
    gridParcelas: TDBCtrlGrid;
    edtParcelaDataVencimento: TcxDBDateEdit;
    edtParcelaValor: TcxDBCurrencyEdit;
    edtParcelaSituacao: TcxDBImageComboBox;
    HeaderControl1: THeaderControl;
    btnDuplicarParcela: TcxButton;
    btnExcluirParcela: TcxButton;
    btnAdicionarParcela: TcxButton;
    imgSituacaoEdicao: TcxImage;
    lblRestante: TcxLabel;
    edtTotalParcelas: TcxCurrencyEdit;
    edtRestante: TcxCurrencyEdit;
    cxGroupBox1: TcxGroupBox;
    cxLabel5: TcxLabel;
    cxLabel8: TcxLabel;
    icxTipoContrato: TcxDBImageComboBox;
    icxEspecie: TcxDBImageComboBox;
    pgcDados: TcxPageControl;
    tabExito: TcxTabSheet;
    cxLabel1: TcxLabel;
    lblCobrancaValor: TcxLabel;
    cxLabel3: TcxLabel;
    lcxTipoBeneficio: TcxDBLookupComboBox;
    edtBeneficioPercentual: TcxDBCurrencyEdit;
    edtBeneficioValorFixo: TcxDBCurrencyEdit;
    cxGroupBox2: TcxGroupBox;
    tabHonorario: TcxTabSheet;
    lblTotal: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel27: TcxLabel;
    lblDataLimite: TcxLabel;
    icxProLaborePeriodo: TcxDBImageComboBox;
    edtProLaboreValorTotal: TcxDBCurrencyEdit;
    edtProLaboreQtdParcela: TcxDBSpinEdit;
    edtProLaboreValorParcela: TcxDBCurrencyEdit;
    edtProLaboreDataInicial: TcxDBDateEdit;
    edtProLaboreDataFinal: TcxDBDateEdit;
    tabMensalidade: TcxTabSheet;
    lblVigencia: TcxLabel;
    cxLabel13: TcxLabel;
    lblMeses: TcxLabel;
    cxLabel16: TcxLabel;
    edtVigencia: TcxDBSpinEdit;
    cxDBDateEdit1: TcxDBDateEdit;
    icxMensalidadePeriodo: TcxDBImageComboBox;
    pgcValorDefinicao: TcxPageControl;
    tabValorDefinido: TcxTabSheet;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    edtHonorariosDenifido: TcxDBCurrencyEdit;
    icxReajuste: TcxDBImageComboBox;
    tabValorSalario: TcxTabSheet;
    cxLabel14: TcxLabel;
    edtSalarioMinimo: TcxDBCurrencyEdit;
    edtHonorarioMensal: TcxDBCurrencyEdit;
    lblDefinicaoCobranca: TcxLabel;
    icxDefinicaoCobranca: TcxDBImageComboBox;
    icxBeneficioDistribuir: TcxDBImageComboBox;
    edtBeneficioCaptador: TcxDBCurrencyEdit;
    edtBeneficioPeticionador: TcxDBCurrencyEdit;
    edtBeneficioGestor: TcxDBCurrencyEdit;
    ClientAncestralBENEFICIO_GESTOR: TFMTBCDField;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure icxTipoCobrancaPropertiesEditValueChanged(Sender: TObject);
    procedure icxTipoContratoPropertiesChange(Sender: TObject);
    procedure icxProLaborePeriodoPropertiesEditValueChanged(Sender: TObject);
    procedure edtProLaboreValorTotalExit(Sender: TObject);
    procedure edtProLaboreQtdParcelaPropertiesEditValueChanged(Sender: TObject);
    procedure edtProLaboreQtdParcelaClick(Sender: TObject);
    procedure edtProLaboreDataInicialExit(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure icxMensalidadePeriodoPropertiesEditValueChanged(Sender: TObject);
    procedure edtSalarioMinimoExit(Sender: TObject);
    procedure btnAdicionarParcelaClick(Sender: TObject);
    procedure btnExcluirParcelaClick(Sender: TObject);
    procedure btnDuplicarParcelaClick(Sender: TObject);
    procedure cbxParcelasExit(Sender: TObject);
    procedure edtParcelaDataVencimentoPropertiesEditValueChanged(
      Sender: TObject);
    procedure edtParcelaValorPropertiesEditValueChanged(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure icxBeneficioDistribuirPropertiesChange(Sender: TObject);
    procedure lcxTipoBeneficioEnter(Sender: TObject);
    procedure lcxTipoBeneficioExit(Sender: TObject);
    procedure lcxTipoBeneficioPropertiesChange(Sender: TObject);
  private
    vlContratoItemParcela : Boolean;
    vlLocal : string;
    vlTipoContrato : Integer;
  public
    vlCriandoForm : Boolean;
    { Public declarations }
  end;

var
  frmCadastroRapidoContratoItem: TfrmCadastroRapidoContratoItem;
  vgBeneficioEconomico : Boolean;
  vgTituloCadastroItem : String;

implementation

uses
  Lookup, Controles, GerenciadorServico, LookupJuridico, Rotinas,
  Lookup_Contabil, Lookup_Servico;

{$R *.dfm}

procedure TfrmCadastroRapidoContratoItem.btnAdicionarParcelaClick(
  Sender: TObject);
begin
  inherited;
  vlTipoContrato := icxTipoContrato.EditValue;
  if (not vlTipoContrato in [1,6]) or (icxProLaborePeriodo.EditValue = '3') then
    exit;

  if not dtmLookupServico.ClientParcelas.Active then
    dtmLookupServico.ClientParcelas.Active := True;

  if not dtmLookupServico.ClientParcelas.IsEmpty then
    dtmLookupServico.ClientParcelas.Append;

  edtParcelaDataVencimento.SetFocus;
end;

procedure TfrmCadastroRapidoContratoItem.btnConfirmarClick(Sender: TObject);
begin
  if icxTipoContrato.EditValue <> 5 then
  begin
    edtBeneficioCaptador.Clear;
    edtBeneficioPeticionador.Clear;
    icxBeneficioDistribuir.ItemIndex := 0;
    VerificarPreenchimentoDTA_DB(edtProLaboreDataInicial.Text, 'Data Inicial', edtProLaboreDataInicial)
  end
  else
  begin
    VerificarPreenchimentoICX_DB(icxBeneficioDistribuir.EditValue, 'A quem distribuir?', icxBeneficioDistribuir);
    if icxBeneficioDistribuir.ItemIndex in [1,3] then
    begin
       VerificarPreenchimentoCUR_DB(edtBeneficioCaptador.EditValue, 'Captador?', edtBeneficioCaptador);
       if icxBeneficioDistribuir.ItemIndex = 3 then
         VerificarPreenchimentoCUR_DB(edtBeneficioPeticionador.EditValue, 'Peticionador(es)?', edtBeneficioPeticionador)
    end
    else
      if icxBeneficioDistribuir.ItemIndex = 2 then
        VerificarPreenchimentoCUR_DB(edtBeneficioPeticionador.EditValue, 'Peticionador(es)?', edtBeneficioPeticionador);
  end;

  if (ClientAncestralVALOR_PROLABORE.AsCurrency = 0) and (edtTotalParcelas.editValue > 0) then
    ClientAncestralVALOR_PROLABORE.AsCurrency := edtTotalParcelas.editValue;

  if (pgcDados.ActivePage = tabHonorario) and (edtProLaboreValorTotal.Enabled) and
    (ClientAncestralVALOR_PROLABORE.AsCurrency = 0) then
  begin
    Application.MessageBox('Valor do Pró-Labore não pode ser zerado!!!', 'Atenção', MB_OK + MB_ICONWARNING);
    edtProLaboreValorTotal.SetFocus;
    exit;
  end
  else 
    if (pgcDados.ActivePage = tabMensalidade) then
    begin
      ClientAncestralDATA_FINAL.AsVariant :=  CalcularDataVencimento(ClientAncestralDATA_INICIAL.AsDateTime, 4, ClientAncestralQTD.AsInteger-1);
      if (ClientAncestralVALOR_PARCELA.AsCurrency = 0) then
      begin
        Application.MessageBox('Valor do Honorário não pode ser zerado!!!', 'Atenção', MB_OK + MB_ICONWARNING);
        if icxMensalidadePeriodo.EditValue = '1' then
             edtHonorariosDenifido.SetFocus
        else edtSalarioMinimo.SetFocus;
        exit;
      end;

      if icxMensalidadePeriodo.EditValue = '1' then
        VerificarPreenchimentoICX_DB(icxReajuste.text, 'Reajuste', icxReajuste);
    end;

  if icxDefinicaoCobranca.Visible then
    VerificarPreenchimentoICX_DB(icxDefinicaoCobranca.text, 'Definição da Cobrança', icxDefinicaoCobranca);

  if edtProLaboreQtdParcela.editValue = 0 then
    ClientAncestralVALOR_PARCELA.AsInteger := 1;

  if ClientAncestralPERIODO.AsInteger in [1, 2] then
  begin
    ClientAncestralDATA_FINAL.AsVariant := null;
    if ClientAncestralPERIODO.AsInteger = 2 then
      ClientAncestralDATA_INICIAL.AsVariant := null;
  end;

  if vgDadosContratoItem.TarefaId > 0 then
    ClientAncestralTAREFA_ID.AsInteger := vgDadosContratoItem.TarefaId;

  if (ClientAncestralSITUACAO.AsString = '0') and (not vgBeneficioEconomico) then
    ClientAncestralSITUACAO.AsString := '1';

  vlContratoItemParcela := (dtmLookupServico.ClientParcelas.RecordCount > 0) and (icxProLaborePeriodo.EditValue = 6);
  inherited;

end;

procedure TfrmCadastroRapidoContratoItem.btnDuplicarParcelaClick(
  Sender: TObject);
var
  viValor : Currency;
  viData  : TDate;
begin
  inherited;
  if not btnDuplicarParcela.Enabled then
    exit;

  dtmLookupServico.ClientParcelas.Last;
  viValor := dtmLookupServico.ClientParcelasVALOR_PARCELA.AsCurrency;
  viData  := CalcularDataVencimento(dtmLookupServico.ClientParcelasDATA_VENCIMENTO.AsDateTime, 4, 1);

  dtmLookupServico.ClientParcelas.Append;
  dtmLookupServico.ClientParcelasVALOR_PARCELA.AsCurrency   := viValor;
  dtmLookupServico.ClientParcelasDATA_VENCIMENTO.AsDateTime := viData;
  dtmLookupServico.ClientParcelas.Post;
end;

procedure TfrmCadastroRapidoContratoItem.btnExcluirParcelaClick(
  Sender: TObject);
begin
  vlTipoContrato := icxTipoContrato.EditValue;
  if (not vlTipoContrato in [1,6]) or (icxProLaborePeriodo.EditValue = '3') or
     (dtmLookupServico.ClientParcelas.RecordCount = 0) then
    exit;

  if dtmLookupServico.ClientParcelas.State in [dsInsert, dsedit] then
    dtmLookupServico.ClientParcelas.Cancel;

  inherited;

  dtmLookupServico.ClientParcelas.Delete;
  dtmLookupServico.SomarGridValores(ClientAncestral, vlCriandoForm, edtTotalParcelas, edtRestante, 1);
end;

procedure TfrmCadastroRapidoContratoItem.cbxParcelasExit(Sender: TObject);
begin
  inherited;
  if dtmLookupServico.ClientParcelas.State in [dsEdit, dsInsert] then
    dtmLookupServico.ClientParcelas.Post;
end;

procedure TfrmCadastroRapidoContratoItem.edtSalarioMinimoExit(Sender: TObject);
begin
  inherited;
  if (ClientAncestral.State in [dsEdit, dsInsert]) and (icxMensalidadePeriodo.EditValue = 2) then
    ClientAncestralVALOR_PARCELA.AsCurrency := dtmLookupJuridico.CalcularValorHonorarioSalario(ClientAncestralQTD_SALARIO.AsCurrency);
end;

procedure TfrmCadastroRapidoContratoItem.edtParcelaDataVencimentoPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  imgSituacaoEdicao.Visible  := True;
  btnDuplicarParcela.Enabled := False;
end;

procedure TfrmCadastroRapidoContratoItem.edtParcelaValorPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  imgSituacaoEdicao.Visible  := True;
  btnDuplicarParcela.Enabled := False;
end;

procedure TfrmCadastroRapidoContratoItem.edtProLaboreDataInicialExit(
  Sender: TObject);
begin
  inherited;
  if vlCriandoForm then
    exit;
  
  if ClientAncestralDATA_INICIAL.AsVariant = Null then
    ClientAncestralDATA_INICIAL.AsDateTime := dtmControles.DataHoraBanco(3);

  if ClientAncestralPERIODO.AsInteger = 1 then
       ClientAncestralDATA_FINAL.AsVariant := null
  else ClientAncestralDATA_FINAL.AsVariant :=  CalcularDataVencimento(ClientAncestralDATA_INICIAL.AsDateTime, 4, ClientAncestralQTD.AsInteger-1);
end;

procedure TfrmCadastroRapidoContratoItem.edtProLaboreQtdParcelaClick(
  Sender: TObject);
begin
  inherited;
  edtProLaboreQtdParcelaPropertiesEditValueChanged(self);
end;

procedure TfrmCadastroRapidoContratoItem.edtProLaboreQtdParcelaPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if vlCriandoForm then
    exit;

  if ClientAncestral.State in [dsEdit, dsInsert] then
  begin
    if icxProLaborePeriodo.EditValue = '3' then
    begin
      if ClientAncestralTIPO.AsInteger in [1,6,7] then
      begin
        if edtProLaboreValorTotal.EditValue > 0 then
          ClientAncestralVALOR_PARCELA.AsCurrency := (edtProLaboreValorTotal.EditValue / edtProLaboreQtdParcela.EditValue);
      end
      else ClientAncestralVALOR_PARCELA.AsCurrency := 0;
      edtProLaboreDataInicialExit(self);
    end;
  end;
end;

procedure TfrmCadastroRapidoContratoItem.edtProLaboreValorTotalExit(
  Sender: TObject);
begin
  inherited;
  edtProLaboreQtdParcelaPropertiesEditValueChanged(self);
  if icxProLaborePeriodo.EditValue = 6 then
    dtmLookupServico.SomarGridValores(ClientAncestral, vlCriandoForm, edtTotalParcelas, edtRestante, 1);
end;

procedure TfrmCadastroRapidoContratoItem.FormActivate(Sender: TObject);
var
  viTramiteId : String;

begin
  inherited;
  if icxTipoContrato.Enabled then
       icxTipoContrato.SetFocus
  else icxEspecie.SetFocus;

  edtProLaboreValorTotalExit(self);

  icxTipoContrato.Enabled := not vgBeneficioEconomico;

  if vgBeneficioEconomico and (ClientAncestral.State in [dsInsert])then
  begin
    viTramiteId := IntToStr(vgDadosCadastro.ChaveIdTerciaria);
    ClientAncestralTIPO.AsString := '7';
    ExecutaSimpleDSAux(' SELECT EXITO_CREDITO_HONORARIO, EXITO_CREDITO_DISTRIBUIR '+
                       ' FROM J_PROCESSO_TRAMITE '+
                       ' WHERE PROCESSO_TRAMITE_ID = '+  viTramiteId,0);
    ClientAncestralVALOR_PROLABORE.AsCurrency  := dtmControles.SimpleAuxiliar.FieldByName('EXITO_CREDITO_HONORARIO').AsCurrency;
    ClientAncestralVALOR_DISTRIBUIR.AsCurrency := dtmControles.SimpleAuxiliar.FieldByName('EXITO_CREDITO_DISTRIBUIR').AsCurrency;
    ClientAncestralSITUACAO.AsString := '0';
    ClientAncestral.Fields[0].AsInteger := dtmControles.GerarSequencia(vgDadosCadastro.Tabela);
    ClientAncestral.ApplyUpdates(-1);
    ClientAncestral.edit;
  end;

  edtProLaboreValorTotal.Enabled := not vgBeneficioEconomico;
  vlCriandoForm := False;
  edtProLaboreValorTotalExit(self);
end;

procedure TfrmCadastroRapidoContratoItem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmCadastroRapidoContratoItem := nil;
end;

procedure TfrmCadastroRapidoContratoItem.FormCreate(Sender: TObject);
begin
  vlCriandoForm := True;
  inherited;

  tabExito.Caption     := 'Dados da Cobrança';
  tabHonorario.Caption := 'Dados da Cobrança';

  if vgTituloCadastroItem <> '' then
    lblInformaca.Caption := vgTituloCadastroItem;

  dtmLookupServico.ClientParcelas.Filtered := False;
  pgcValorDefinicao.HideTabs := True;
  pgcValorDefinicao.Top:= 7;

  if ClientAncestral.State in [dsInsert] then
  begin
    ClientAncestralSITUACAO.AsString := '1';
    ClientAncestralESPECIE.AsString  := 'D';
    ClientAncestralTIPO.AsString     := '1';
    ClientAncestralQTD.AsInteger     := 1;
    ClientAncestralPROCESSO_CONTRATO_ID.AsInteger := vgDadosCadastro.ChaveIdSecundaria;
    ClientAncestralPROCESSO_TRAMITE_ID.AsInteger  := vgDadosCadastro.ChaveIdTerciaria;
    icxProLaborePeriodo.ItemIndex    := 0 ;
    ClientAncestralPERIODO.AsVariant := icxProLaborePeriodo.EditValue;
    ClientAncestralDATA_INICIAL.AsDateTime := dtmControles.DataHoraBanco(3);
    ClientAncestralBENEFICIO_DISTRIBUIR.AsInteger := 0;
  end;

  if vgDadosContratoItem.TarefaId > 0 then
  begin
    ClientAncestralTIPO.AsInteger             := 6;
    ClientAncestralTAREFA_ID.AsInteger        := vgDadosContratoItem.TarefaId;
    ClientAncestralVALOR_PROLABORE.AsCurrency := vgDadosContratoItem.Valor;
  end
  else icxTipoContrato.Properties.Items.Delete(5);

  icxTipoContrato.Enabled := vgDadosContratoItem.TarefaId = 0;
end;

procedure TfrmCadastroRapidoContratoItem.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = 107 then
    btnAdicionarParcelaClick(self)
  else
    if key = 109 then
      btnExcluirParcelaClick(self)
  else
    if key = 106 then
      btnDuplicarParcelaClick(self);
end;

procedure TfrmCadastroRapidoContratoItem.icxBeneficioDistribuirPropertiesChange(
  Sender: TObject);
begin
  inherited;
  edtBeneficioCaptador.Enabled     := icxBeneficioDistribuir.ItemIndex = 0;
  edtBeneficioPeticionador.Enabled := icxBeneficioDistribuir.ItemIndex = 0;
  edtBeneficioGestor.Enabled       := icxBeneficioDistribuir.ItemIndex = 0;

  if icxBeneficioDistribuir.ItemIndex = 1 then
  begin
    edtBeneficioCaptador.Clear;
    edtBeneficioPeticionador.Clear;
    edtBeneficioGestor.Clear;
  end;
end;

procedure TfrmCadastroRapidoContratoItem.icxMensalidadePeriodoPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if icxMensalidadePeriodo.ItemIndex = 0 then
    pgcValorDefinicao.ActivePage := tabValorDefinido
  else
  begin
    pgcValorDefinicao.ActivePage := tabValorSalario;
    edtSalarioMinimoExit(self);
  end;
end;

procedure TfrmCadastroRapidoContratoItem.icxProLaborePeriodoPropertiesEditValueChanged(
  Sender: TObject);
var
  viPeriodo, viTipo : Integer;
begin
  inherited;
  if icxProLaborePeriodo.EditValue = null then
    exit;

  viPeriodo := StrtoInt(icxProLaborePeriodo.EditValue);

  edtProLaboreQtdParcela.Enabled := viPeriodo = 3;
  btnAdicionarParcela.Enabled    := viPeriodo = 6;
  cbxParcelas.Enabled            := viPeriodo = 6;
  edtProLaboreDataInicial.Enabled:= viPeriodo = 3;

  if icxTipoContrato.EditValue = null then
    exit;

  viTipo := icxTipoContrato.EditValue;
  if (viTipo in [1,6,7]) and (icxProLaborePeriodo.EditValue = 6) then
  begin
    tabValorPersonalizado.TabVisible := True;
    frmCadastroRapidoContratoItem.Height := 480;
    dtmLookupServico.SomarGridValores(ClientAncestral, vlCriandoForm, edtTotalParcelas, edtRestante, 1);
    pgcPersonalizados.ActivePage := tabValorPersonalizado;
    if vgBeneficioEconomico then
      tabValorPersonalizado.TabVisible := True;
  end
  else frmCadastroRapidoContratoItem.Height := 240;

  if vlCriandoForm then
    exit;

  if ClientAncestral.State in [dsEdit, dsInsert] then
    ClientAncestralQTD.AsInteger := 1;
end;

procedure TfrmCadastroRapidoContratoItem.icxTipoCobrancaPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
{  lblCobrancaValor.Enabled := StrToInt(icxTipoCobranca.EditValue) in [2,4];
  edtCobrancaValor.Enabled := StrToInt(icxTipoCobranca.EditValue) in [2,4];
  lblCobrancaHoras.Enabled := StrToInt(icxTipoCobranca.EditValue) = 3;
  edtCobrancaHoras.Enabled := StrToInt(icxTipoCobranca.EditValue) = 3;

  if not (ClientAncestral.State in [dsInsert, dsEdit]) then
    exit;

  case StrToInt(icxTipoCobranca.EditValue) of
   1 : begin
         ClientAncestralFATURADO_VALOR.AsVariant := null;
         ClientAncestralFATURADO_HORAS.AsVariant := null;
       end;
   2 : begin
         ClientAncestralFATURADO_HORAS.AsVariant := null;
         lblCobrancaValor.Caption := 'Valor em R$';
         ClientAncestralFATURADO_VALOR.AsCurrency := 0;
         edtCobrancaValor.Properties.DisplayFormat := 'R$ ,0.00';
       end;
   3 : begin
         ClientAncestralFATURADO_VALOR.AsVariant := null;
         ClientAncestralFATURADO_HORAS.AsVariant := '00:00';
       end;
   4 : begin
         ClientAncestralFATURADO_HORAS.AsVariant := null;
         lblCobrancaValor.Caption := 'Valor %';
         ClientAncestralFATURADO_VALOR.AsCurrency := 0;
         edtCobrancaValor.Properties.DisplayFormat := '% ,0.00';
       end;
  end;

  if StrToInt(icxTipoPeriodo.EditValue) < 3 then
    ClientAncestralHORA_FINAL.AsVariant := null}
end;

procedure TfrmCadastroRapidoContratoItem.icxTipoContratoPropertiesChange(
  Sender: TObject);
var
  viTipo : Integer;
begin
  inherited;

  if icxTipoContrato.EditValue = null then
    exit;

  viTipo := icxTipoContrato.EditValue;

  tabExito.TabVisible              := viTipo = 5;
  tabHonorario.TabVisible          := viTipo in [1,6,7];
  tabMensalidade.TabVisible        := viTipo in [2,3,4];
  edtProLaboreValorTotal.Enabled   := viTipo in [1,6,7];
  edtProLaboreValorParcela.Enabled := (viTipo > 1) and (viTipo < 6);
  btnAdicionarParcela.Visible      := viTipo in [1,6,7];
  btnExcluirParcela.Visible        := viTipo in [1,6,7];
  btnDuplicarParcela.Visible       := viTipo in [1,6,7];
  icxDefinicaoCobranca.Visible     := viTipo = 6;
  lblDefinicaoCobranca.Visible     := viTipo = 6;

  if (viTipo = 1) and (icxProLaborePeriodo.EditValue = 6) then
  begin
    frmCadastroRapidoContratoItem.Height := 480;
    tabValorPersonalizado.TabVisible := True;
    pgcPersonalizados.ActivePage     := tabValorPersonalizado;
  end
  else frmCadastroRapidoContratoItem.Height := 240;

  if ClientAncestral.State in [dsInsert, dsEdit] then
    ClientAncestralDEFINICAO_VALOR.AsVariant := 1;

  icxProLaborePeriodo.Properties.Items.Clear;
  case viTipo of
    1,6,7 : begin
            dtmLookup.CarregarIcxComboBoxDB('3', 'Parcela(s) Fixa(s)',icxProLaborePeriodo);
            dtmLookup.CarregarIcxComboBoxDB('6', 'Parcelas Variáveis',icxProLaborePeriodo);
            pgcDados.ActivePage  := tabHonorario;
            icxProLaborePeriodoPropertiesEditValueChanged(self);

            if ClientAncestral.State in [dsInsert] then
              ClientAncestralPERIODO.AsInteger := 3;

          if viTipo = 1 then
          begin
            lblTotal.Caption    := 'Total Pró-Labore';
            lblRestante.Caption := 'Total Parcelas            Restante à Definir do Pró-Labore';
          end
          else
          begin
            lblTotal.Caption    := 'Total Remuneração';
            lblRestante.Caption := 'Total Parcelas            Restante à Definir Remuneração';
          end;
        end;
    2 : begin
          icxMensalidadePeriodo.Properties.Items.Clear;
          lblVigencia.Visible := True;
          edtVigencia.Visible := True;
          lblMeses.Visible    := True;

          dtmLookup.CarregarIcxComboBoxDB('3', 'Mensal',icxProLaborePeriodo);
          pgcDados.ActivePage  := tabMensalidade;

          if ClientAncestral.State in [dsInsert, dsEdit] then
            ClientAncestralPERIODO.AsInteger := 3;
        end;
    3,4 : begin
            dtmLookup.CarregarIcxComboBoxDB('1', 'Parcela(s) Fixa(s)',icxProLaborePeriodo);
            pgcDados.ActivePage := tabMensalidade;
            lblVigencia.Visible := False;
            edtVigencia.Visible := False;
            lblMeses.Visible    := False;
            if ClientAncestral.State in [dsInsert, dsEdit] then
            begin
              ClientAncestralPERIODO.AsInteger := 1;
              ClientAncestralQTD.AsInteger     := 1;
            end;
          end;
    5 : begin
          dtmLookup.CarregarIcxComboBoxDB('2', 'Uma Vez',icxProLaborePeriodo);
          pgcDados.ActivePage := tabExito;
          if ClientAncestral.State in [dsInsert, dsEdit] then
            ClientAncestralPERIODO.AsInteger := 2;
          icxBeneficioDistribuirPropertiesChange(Self);             
        end;
   end;

   if vlCriandoForm then
     exit;

   if ClientAncestral.State in [dsEdit, dsInsert] then
   begin
     ClientAncestralDATA_INICIAL.AsDateTime     := dtmControles.DataHoraBanco(3);
     ClientAncestralDATA_FINAL.AsVariant        := null;
     icxProLaborePeriodo.ItemIndex              := 0 ;
     ClientAncestralPERIODO.AsVariant           := icxProLaborePeriodo.EditValue;
     ClientAncestralVALOR_PARCELA.AsCurrency    := 0;
     ClientAncestralVALOR_PERCENTUAL.AsCurrency := 0;
     ClientAncestralVALOR_PROLABORE.AsCurrency  := 0;
     ClientAncestralQTD.AsVariant               := 1;
   end;
end;

procedure TfrmCadastroRapidoContratoItem.lcxTipoBeneficioEnter(Sender: TObject);
begin
  inherited;
  vlLocal := '';
end;

procedure TfrmCadastroRapidoContratoItem.lcxTipoBeneficioExit(Sender: TObject);
begin
  inherited;
  dtmLookup.CadastrarRegBasicoGeral( nil,ClientAncestral, ClientAncestralTIPO_BENEFICIO_ID.AsInteger, 'J_TIPO_BENEFICIO', 'TIPO_BENEFICIO_ID', vlLocal, False, True, False);
end;

procedure TfrmCadastroRapidoContratoItem.lcxTipoBeneficioPropertiesChange(
  Sender: TObject);
begin
  inherited;
  if lcxTipoBeneficio.text <> '' then
    vlLocal := lcxTipoBeneficio.text;
end;

end.
