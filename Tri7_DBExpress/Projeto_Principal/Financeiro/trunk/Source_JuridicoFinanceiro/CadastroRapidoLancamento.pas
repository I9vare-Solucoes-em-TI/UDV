unit CadastroRapidoLancamento;

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
  cxPCdxBarPopupMenu, dxCore, cxDateUtils, dxSkinDevExpressDarkStyle,
  dxBarBuiltInMenu, DbxDevartInterBase;

type
  TfrmCadastroRapidoLancamento = class(TfrmCadastroAuxSimplificado)
    tabBalancete: TcxTabControl;
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
    ClientAncestralOPERACAO: TStringField;
    ClientAncestralCONTABIL_CONTA_ID: TFMTBCDField;
    ClientAncestralPESSOA_ID: TFMTBCDField;
    ClientAncestralDATA_REGISTRO: TSQLTimeStampField;
    ClientAncestralVALOR_PROLABORE: TFMTBCDField;
    ClientAncestralCENTRO_CUSTO_ID: TFMTBCDField;
    sqlGrupoContabil: TSimpleDataSet;
    sqlGrupoContabilDESCRICAO: TStringField;
    sqlGrupoContabilCONTABIL_GRUPO_ID: TFMTBCDField;
    sqlGrupoContabilBALANCETE_GRUPO_ID: TFMTBCDField;
    dtsGrupoContabil: TDataSource;
    sqlPlanoContas: TSimpleDataSet;
    sqlPlanoContasCONTABIL_CONTA_ID: TFMTBCDField;
    sqlPlanoContasDESCRICAO: TStringField;
    dtsPlanoContas: TDataSource;
    ClientAncestralIR: TStringField;
    ClientAncestralCNJ: TStringField;
    sqlPlanoContasIR: TStringField;
    sqlPlanoContasCNJ: TStringField;
    pnlSalvarComo: TPanel;
    btnSalvarNovo: TcxButton;
    StatusBar: TStatusBar;
    pgcDados: TcxPageControl;
    tabContasFixa: TcxTabSheet;
    tabOrcamento: TcxTabSheet;
    cxButton4: TcxButton;
    ClientAncestralORCAMENTO_ID: TFMTBCDField;
    lcxOrcamento: TcxLookupComboBox;
    pnlDadosPrincipais: TPanel;
    cxLabel5: TcxLabel;
    cxLabel12: TcxLabel;
    cxButton1: TcxButton;
    cxLabel3: TcxLabel;
    icxOperacao: TcxImageComboBox;
    lcxGrupoContabil: TcxLookupComboBox;
    lcxCompromisso: TcxLookupComboBox;
    btnPadraoCompromisso: TcxButton;
    pnlDadosPermitidos: TPanel;
    cxLabel4: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel15: TcxLabel;
    edtHistorico: TcxTextEdit;
    cxButton2: TcxButton;
    icxDocTipo: TcxImageComboBox;
    edtDocumentoNumero: TcxTextEdit;
    edtDetalhe: TcxTextEdit;
    chxIR: TcxCheckBox;
    chxCNJ: TcxCheckBox;
    chxRegistroParcial: TcxCheckBox;
    ClientAncestralREFERENCIA_TIPO: TStringField;
    ClientAncestralREFERENCIA_PERIODO: TStringField;
    tabCentroCustos: TcxTabSheet;
    lcxCentroCusto: TcxLookupComboBox;
    sqlTipoModalidade: TSimpleDataSet;
    sqlTipoModalidadeTIPO_MODALIDADE_ID: TFMTBCDField;
    sqlTipoModalidadeDESCRICAO: TStringField;
    sqlTipoModalidadeTIPO: TStringField;
    sqlTipoModalidadeSITUACAO: TStringField;
    dtsTipoModalidade: TDataSource;
    tabReserva: TcxTabSheet;
    lcxReserva: TcxLookupComboBox;
    ClientAncestralTIPO_MODALIDADE_ID: TFMTBCDField;
    pgcPessoa: TcxPageControl;
    tabPessoa: TcxTabSheet;
    lcxFavorecido: TcxLookupComboBox;
    cxButton5: TcxButton;
    tabAssociado: TcxTabSheet;
    lcxResponsavel: TcxLookupComboBox;
    cxButton7: TcxButton;
    btnCentroPersonalizado: TcxButton;
    btnCentroReservaPers: TcxButton;
    ClientAncestralCENTRO_RESERVA_ID: TFMTBCDField;
    sqlCentroReserva: TSimpleDataSet;
    sqlCentroReservaDESCRICAO: TStringField;
    sqlCentroReservaCENTRO_CUSTO_ID: TFMTBCDField;
    sqlCentroReservaBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlCentroReservaPERSONALIZADO: TStringField;
    sqlCentroReservaTIPO_ITEM: TStringField;
    sqlCentroReservaTIPO_GLOBAL: TStringField;
    dtsCentroReserva: TDataSource;
    sqlCentroCustoAtivo: TSimpleDataSet;
    sqlCentroCustoAtivoDESCRICAO: TStringField;
    sqlCentroCustoAtivoCENTRO_CUSTO_ID: TFMTBCDField;
    sqlCentroCustoAtivoBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlCentroCustoAtivoPERSONALIZADO: TStringField;
    sqlCentroCustoAtivoTIPO_ITEM: TStringField;
    sqlCentroCustoAtivoTIPO_GLOBAL: TStringField;
    dtsCentroCustoAtivo: TDataSource;
    pnlCentroMsg: TcxLabel;
    ClientAncestralCONTABIL_RL: TStringField;
    pnlValores: TPanel;
    pnlValorComplemento: TPanel;
    cbxValorComplemento: TcxGroupBox;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    cxLabel16: TcxLabel;
    edtDesconto: TcxCurrencyEdit;
    edtOutraDeducao: TcxCurrencyEdit;
    edtMulta: TcxCurrencyEdit;
    edtJuros: TcxCurrencyEdit;
    edtValorFinal: TcxCurrencyEdit;
    cxLabel17: TcxLabel;
    cxLabel11: TcxLabel;
    edtObservacaoMonetaria: TcxTextEdit;
    cxLabel19: TcxLabel;
    cxLabel18: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel2: TcxLabel;
    lblDataDespesa: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel1: TcxLabel;
    pnlAlerta: TPanel;
    edtDataVencimento: TcxDateEdit;
    edtRefAnoMes: TcxMaskEdit;
    edtDataPagamento: TcxDateEdit;
    lcxModalidade: TcxLookupComboBox;
    edtDataLancamento: TcxDateEdit;
    edtValor: TcxCurrencyEdit;
    icxEspecie: TcxImageComboBox;
    lcxConta: TcxLookupComboBox;
    chxAtivarValorComplemento: TcxCheckBox;
    chxContabilRetiradaLucro: TcxCheckBox;
    cxLabel20: TcxLabel;
    edtOutrasTaxas: TcxCurrencyEdit;
    btnPessoaAlterar: TcxButton;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure tabBalanceteChange(Sender: TObject);
    procedure lcxCompromissoPropertiesEditValueChanged(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure icxOperacaoPropertiesChange(Sender: TObject);
    procedure lcxGrupoContabilPropertiesEditValueChanged(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure btnPadraoCompromissoClick(Sender: TObject);
    procedure lcxFavorecidoPropertiesEditValueChanged(Sender: TObject);
    procedure btnSalvarNovoClick(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure lcxOrcamentoPropertiesChange(Sender: TObject);
    procedure tabBalanceteChanging(Sender: TObject; var AllowChange: Boolean);
    procedure icxDocTipoPropertiesEditValueChanged(Sender: TObject);
    procedure btnPessoaAlterarClick(Sender: TObject);
    procedure lcxCentroCustoPropertiesChange(Sender: TObject);
    procedure lcxReservaPropertiesChange(Sender: TObject);
    procedure cxButton7Click(Sender: TObject);
    procedure btnCentroPersonalizadoClick(Sender: TObject);
    procedure btnCentroReservaPersClick(Sender: TObject);
    procedure lcxCentroCustoPropertiesEditValueChanged(Sender: TObject);
    procedure lcxReservaPropertiesEditValueChanged(Sender: TObject);
    procedure pgcDadosChange(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
    procedure chxAtivarValorComplementoClick(Sender: TObject);
  private
    vlContratoItemParcela : Boolean;
    vlOperacaoDefault : String;
    vlBalcanteceteDefault : integer;
    procedure HabilitarTabValor(vpOperacao : String);
    procedure SalvarRegistro(vpSalvarComo : Boolean = False);
    procedure LimparCampos;

    // Centro Custo e Reserva
    procedure AtualizarCentroCustoReserva(vpSimpleDataSet : TSimpleDataSet; vpClientDataSet : TClientDataSet;
        vpLookup : TcxLookupComboBox; vpTipoCentro : Integer);
    procedure VerificarCentroCustoReserva(vpSimpleDataSet : TSimpleDataSet; vpClientDataSet : TClientDataSet;
        vpLookup : TcxLookupComboBox;  vpTipoCentro : Integer);
    procedure VerificarItensCentroCustoReserva(vpSimpleDataSet : TSimpleDataSet;
        vpLookup : TcxLookupComboBox; vpId, vpTipoCentro : Integer);
    procedure VerificarCentroPersonalizado(vpSimpleDataSet : TSimpleDataSet;
        vpLookup : TcxLookupComboBox; vpTipoCentro : Integer);
    procedure VerificarAtualizacaoValorAgendado;
    Function CalcularValorFinal:Currency;
  public
    vlCriandoForm, vlAtivandoForm : Boolean;
    { Public declarations }
  end;

  function InserirLancamentoAutomaticoLivroCaixa(vpRegistro: string): Boolean;

var
  frmCadastroRapidoLancamento: TfrmCadastroRapidoLancamento;

implementation

uses
  Lookup, Controles, Rotinas,
  Lookup_Contabil, Lookup_Servico, Pessoa, PessoaPreCadastro, RegistroParcial,
  ValidarPermissaoUsuario, LookupFinanceiro, Cadastro, Previsao, CentroCustoPersonalizado,
  Confirmacao, ItensVinculados;

{$R *.dfm}
function InserirLancamentoAutomaticoLivroCaixa(vpRegistro: string): Boolean;
begin
  try

  except on E: Exception do
    Result := False;
  end;
end;

procedure TfrmCadastroRapidoLancamento.AtualizarCentroCustoReserva(
  vpSimpleDataSet: TSimpleDataSet; vpClientDataSet: TClientDataSet;
  vpLookup: TcxLookupComboBox; vpTipoCentro: Integer);
begin
  pnlCentroMsg.Caption := '';
  if vpLookup.EditValue = null then
    exit;

  if vgCentroCusto.Cancelado then
  begin
    if vgDadosLivroCaixa.DuplicaCentroCustoId = 0 then
    begin
      if vgDadosLivroCaixa.LivroCaixaId = 0 then
           dtmLookupFinanceiro.VerificarCentroCustoReserva(vgDadosLivroCaixa.LivroAgendamentoId, vpClientDataSet, IntToStr(vpTipoCentro))
      else dtmLookupFinanceiro.VerificarCentroCustoReserva(vgDadosLivroCaixa.LivroCaixaId, vpClientDataSet, IntToStr(vpTipoCentro))
    end
    else
    begin
      dtmLookupFinanceiro.VerificarCentroCustoReserva(vgDadosLivroCaixa.DuplicaCentroCustoId, vpClientDataSet, IntToStr(vpTipoCentro));
      vgCentroCusto.Confirmado := True;
    end;
  end;

  pnlCentroMsg.Caption := dtmLookupFinanceiro.VerificarPreenchimentoCentroCusto(IntToStr(vpLookup.EditValue),
                                                              vpSimpleDataSet.FieldByName('TIPO_ITEM').AsString, vpClientDataSet);
  if not vpClientDataSet.IsEmpty then
    exit;

  if vpSimpleDataSet.FieldByName('TIPO_ITEM').AsString = '3' then
  begin
    Application.MessageBox('Nenhum Item vinculado!!!', 'Aten��o', mb_Ok + MB_ICONEXCLAMATION);
    vpLookup.EditValue := null;
  end;
  vpLookup.SetFocus;
end;

procedure TfrmCadastroRapidoLancamento.btnCentroPersonalizadoClick(
  Sender: TObject);
begin
  inherited;
  VerificarCentroPersonalizado(sqlCentroCustoAtivo, lcxCentroCusto, 1);
end;

procedure TfrmCadastroRapidoLancamento.btnCentroReservaPersClick(
  Sender: TObject);
begin
  inherited;
  VerificarCentroPersonalizado(sqlCentroReserva, lcxReserva, 2);
end;

procedure TfrmCadastroRapidoLancamento.btnConfirmarClick(Sender: TObject);
begin
  SalvarRegistro;
  vgDadosLivroCaixa.Confirmado  := True;
  vgDadosCadastro.AtualizarSaldo:= True;

  vgCentroCusto.Confirmado := True;
  if sqlCentroCustoAtivoTIPO_ITEM.AsString = '3' then
       dtmLookupFinanceiro.GravarCentroCustoReserva(vgDadosLivroCaixa.LivroCaixaId, 'LIVRO_CAIXA_ID','1', dtmLookupFinanceiro.ClientCentroCustos)
  else dtmLookupFinanceiro.ApagarCentroCustoReserva('LIVRO_CAIXA_ID', '1', dtmLookupFinanceiro.ClientCentroCustos, vgDadosLivroCaixa.LivroCaixaId);

  if sqlCentroReservaTIPO_ITEM.AsString = '3' then
       dtmLookupFinanceiro.GravarCentroCustoReserva(vgDadosLivroCaixa.LivroCaixaId, 'LIVRO_CAIXA_ID','2', dtmLookupFinanceiro.ClientCentroReserva)
  else dtmLookupFinanceiro.ApagarCentroCustoReserva('LIVRO_CAIXA_ID', '2', dtmLookupFinanceiro.ClientCentroReserva, vgDadosLivroCaixa.LivroCaixaId);
  Close;
end;

procedure TfrmCadastroRapidoLancamento.btnPessoaAlterarClick(Sender: TObject);
begin
  inherited;
  vgNovoCadastro := False;
  vgPessoa.Nome  := '';
  vgPessoa.PessoaId := lcxFavorecido.EditValue;
  CadPessoa(True);
end;

procedure TfrmCadastroRapidoLancamento.btnSalvarNovoClick(Sender: TObject);
begin
  SalvarRegistro;
  inherited;
  vlOperacaoDefault     := icxOperacao.EditValue;
  vlBalcanteceteDefault := tabBalancete.TabIndex;

  vgDadosLivroCaixa.Confirmado   := True;
  vgDadosLivroCaixa.LivroCaixaId := 0;
//  vgDadosCadastro.AtualizarSaldo:= True;

  LimparCampos;
  FormCreate(self);
  FormActivate(self);
end;


function TfrmCadastroRapidoLancamento.CalcularValorFinal: Currency;
var
  viDesconto, viOutraDeducao, viJuros, viMulta, viValorAgendado, viValorFinal, viOutrasTaxas : Currency;

  procedure ValidarValor(vpEdit : TcxCurrencyEdit);
  begin
    if vpEdit.Text = '' then
      vpEdit.EditValue := 0
    else
      if vpEdit.EditValue < 0 then
      begin
        Application.MessageBox('Valor negativo n�o permitido!!!', 'Aten��o', mb_Ok + MB_ICONEXCLAMATION);
        vpEdit.Text := '';
        vpEdit.SetFocus;
        Abort;
      end;
  end;
begin
  ValidarValor(edtValor);
  ValidarValor(edtJuros);
  ValidarValor(edtMulta);
  ValidarValor(edtOutraDeducao);
  ValidarValor(edtOutrasTaxas);
  ValidarValor(edtDesconto);

  if (edtOutraDeducao.EditValue > edtValor.EditValue) then
    edtOutraDeducao.EditValue := 0;

  if (edtDesconto.EditValue > edtValor.EditValue) then
    edtDesconto.EditValue := 0
  else
  begin
    if (not vlAtivandoForm) and (edtDesconto.EditValue > edtValor.EditValue) then
    begin
      Application.MessageBox('Valor do Desconto est� maior que o Valor Faturado!!!', 'Aten��o', mb_Ok + MB_ICONEXCLAMATION);
      edtDesconto.SetFocus;
      Abort;
    end;
  end;

  viValorAgendado := edtValor.EditValue;
  viJuros         := edtJuros.EditValue;
  viMulta         := edtMulta.EditValue;
  viDesconto      := edtDesconto.EditValue;
  viOutraDeducao  := edtOutraDeducao.EditValue;
  viOutrasTaxas   := edtOutrasTaxas.EditValue;

  viValorFinal := viValorAgendado - (viDesconto+viOutraDeducao) + (viJuros+viMulta+viOutrasTaxas);
  Result       := viValorFinal;
end;

procedure TfrmCadastroRapidoLancamento.chxAtivarValorComplementoClick(
  Sender: TObject);
begin
  inherited;
  pnlValorComplemento.Visible := chxAtivarValorComplemento.Checked;
  if chxAtivarValorComplemento.Checked then
  begin
    frmCadastroRapidoLancamento.Height := 525;
    pgcDados.Height := 204;
  end
  else
  begin
    frmCadastroRapidoLancamento.Height := 450;
    pgcDados.Height := 125;
  end;

  if vlAtivandoForm then
    exit;

  if chxAtivarValorComplemento.Checked then
       vgPesquisaPadraoLayout := 'S'
  else vgPesquisaPadraoLayout := 'N';
  PadronizacaoLayout(vgPesquisaPadraoLayout, 'LAYOUT', 'LancamentoValorComplemento', 'S');
end;

procedure TfrmCadastroRapidoLancamento.cxButton1Click(Sender: TObject);
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
      lcxFavorecido.EditValue := vgPessoa.PessoaId;
      exit;
    end;

  vgCadastrarFuncao := False;
  vgNovoCadastro    := True;
  vgPessoa.PessoaId := 0;
  CadPessoa(True);

  if vgPessoa.PessoaId > 0 then
    lcxFavorecido.editValue := vgPessoa.PessoaId;
end;

procedure TfrmCadastroRapidoLancamento.cxButton2Click(Sender: TObject);
begin
  inherited;
  if lcxCompromisso.Text = '' then
  begin
    Application.MessageBox('Hist�rico n�o preenchido !!!', 'Aten��o', mb_Ok + MB_ICONEXCLAMATION);
    exit;
  end;

  dtmLookupContabil.GravarHistorico(edtHistorico.Text, IntToStr(lcxCompromisso.EditValue));
  Application.MessageBox('Hist�rico padr�o salvo neste Compromisso !!!', 'Aten��o', mb_Ok + MB_ICONEXCLAMATION);
end;

procedure TfrmCadastroRapidoLancamento.btnPadraoCompromissoClick(Sender: TObject);
begin
  inherited;
  if lcxFavorecido.Text = '' then
    exit;

  if lcxCompromisso.Text = '' then
       dtmLookupContabil.GravarCompromissoPadrao(IntToStr(lcxFavorecido.EditValue), '')
  else dtmLookupContabil.GravarCompromissoPadrao(IntToStr(lcxFavorecido.EditValue), IntToStr(lcxCompromisso.EditValue));

  Application.MessageBox('Compromisso padr�o salvo neste Favorecido !!!', 'Aten��o', mb_Ok + MB_ICONEXCLAMATION);
end;

procedure TfrmCadastroRapidoLancamento.cxButton4Click(Sender: TObject);
begin
  inherited;
  lcxOrcamento.EditValue := null;
end;

procedure TfrmCadastroRapidoLancamento.cxButton7Click(Sender: TObject);
begin
  inherited;
  lcxResponsavel.EditValue := null;
end;

procedure TfrmCadastroRapidoLancamento.edtValorExit(Sender: TObject);
begin
  inherited;
  edtValorFinal.EditValue := CalcularValorFinal;
end;

procedure TfrmCadastroRapidoLancamento.FormActivate(Sender: TObject);
var
  viChaveId : Integer;
begin
  inherited;
  vlAtivandoForm := True;

  LockWindowUpdate(Handle);
  vgPesquisaPadraoLayout := PadronizacaoLayout('', 'LAYOUT', 'LancamentoValorComplemento', 'S');
  chxAtivarValorComplemento.Checked := vgPesquisaPadraoLayout = 'S';
  chxAtivarValorComplementoClick(self);
  LockWindowUpdate(0);

  pnlSalvarComo.Visible    := vgDadosLivroCaixa.Novo;
  pgcDados.ActivePageIndex := 0;

  if not vgDadosLivroCaixa.Bloqueado then
  begin
    if (vgDadosLivroCaixa.Novo)then
    begin
      if vgAgendaConc.Conciliacao then
           lcxFavorecido.SetFocus
      else icxOperacao.SetFocus
    end
    else
      if vgDadosLivroCaixa.DuplicarItem then
        edtValor.SetFocus
    else
      if vgDadosLivroCaixa.LivroAgendamentoId > 0 then
           edtHistorico.SetFocus
      else
      begin
        if pgcPessoa.ActivePage = tabPessoa then
             lcxFavorecido.SetFocus
        else lcxResponsavel.SetFocus;
      end;
  end;

  vlCriandoForm := False;

  icxOperacaoPropertiesChange(Self);
  edtValorExit(self);

  chxIR.EditValue          := 'N';
  chxCNJ.EditValue         := 'N';
  if vgDadosLivroCaixa.ContabilContaID > 0 then
  begin
    lcxGrupoContabil.EditValue  := dtmControles.GetInt(' SELECT CONTABIL_GRUPO_ID FROM J_CONTABIL_CONTA '+
                                                       ' WHERE CONTABIL_CONTA_ID = '+IntToStr(vgDadosLivroCaixa.ContabilContaID));
    lcxCompromisso.EditValue := vgDadosLivroCaixa.ContabilContaID;
    edtHistorico.EditValue   := vgDadosLivroCaixa.Historico;
    chxIR.EditValue          := vgDadosLivroCaixa.IR;
    chxCNJ.EditValue         := vgDadosLivroCaixa.CNJ;
  end;

  if vgDadosLivroCaixa.DuplicaCentroCustoId = 0 then
  begin
    if vgDadosLivroCaixa.LivroCaixaId > 0  then
         viChaveId := vgDadosLivroCaixa.LivroCaixaId
    else viChaveId := vgDadosLivroCaixa.LivroAgendamentoId;

    VerificarItensCentroCustoReserva(sqlCentroCustoAtivo, lcxCentroCusto, viChaveId, 1);
    VerificarItensCentroCustoReserva(sqlCentroReserva, lcxReserva, viChaveId, 2);
  end
  else
  begin
    VerificarItensCentroCustoReserva(sqlCentroCustoAtivo, lcxCentroCusto, vgDadosLivroCaixa.DuplicaCentroCustoId, 1);
    VerificarItensCentroCustoReserva(sqlCentroReserva, lcxReserva, vgDadosLivroCaixa.DuplicaCentroCustoId, 2);
  end;

  chxAtivarValorComplemento.Checked := (edtValor.EditValue <> edtValorFinal.EditValue);
  vlAtivandoForm := False;
end;

procedure TfrmCadastroRapidoLancamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  vgDadosCadastro.SomentePesquisa := False;
  vgDadosLivroCaixa.Bloqueado     := False;
  vgAgendaConc.Conciliacao        := False;
  vgDadosLivroCaixa.ValorProtocolo:= 0;

  dtmLookupFinanceiro.AbrirFecharTelaBranco(False);
  vgDadosCadastro.AtualizarSaldo  := True;
  if frmPrevisao <> nil then
    frmPrevisao.FormActivate(Self);

  Action := caFree;
  frmCadastroRapidoLancamento := nil;
end;

procedure TfrmCadastroRapidoLancamento.FormCreate(Sender: TObject);
var
  viCaixaId : Integer;
  procedure VerificarOpcoePermitidas;
  begin
    if dtmControles.CodPermissao('ESP_OPCAO_APORTE_RETIRADA') = '000000' then
         icxOperacao.RepositoryItem := dtmLookupContabil.ComboDespesaReceitaSomente
    else icxOperacao.RepositoryItem := dtmLookupContabil.ComboDespesaReceitaOutros;
  end;

  procedure HabilitarRegistroNovo;
  begin
    if vgAgendaConc.Conciliacao then
    begin
      icxOperacao.EditValue  := vgAgendaConc.Operacao;
      edtHistorico.EditValue := vgAgendaConc.Historico;
      edtValor.EditValue     := vgAgendaConc.Valor;
      lcxConta.EditValue     := vgAgendaConc.CaixaId;

      edtDataVencimento.EditValue := vgAgendaConc.Data;
      edtDataPagamento.Date       := vgAgendaConc.Data;
      edtRefAnoMes.EditValue      := PegarAnoMes(DateToStr(vgAgendaConc.Data));
      icxEspecie.EditValue        := 'E';

      icxOperacao.Enabled         := False;
      edtValor.Enabled            := False;
      edtDataPagamento.Enabled    := False;
      lcxConta.Enabled            := False;
      lblInformaca.Caption        := 'Lan�amento CONCILIA��O ';
    end
    else
    begin
      if vlOperacaoDefault = '' then
        icxOperacao.EditValue := 'D'
      else
      begin
        icxOperacao.EditValue := vlOperacaoDefault;
        tabBalancete.TabIndex := vlBalcanteceteDefault;
      end;
      edtDataVencimento.EditValue := dtmControles.DataHoraBanco(3);
      edtDataPagamento.Date       := dtmControles.DataHoraBanco(3);
      edtRefAnoMes.EditValue      := vgDadosLivroCaixa.AnoMesReferencia;
      icxEspecie.EditValue        := 'D';
      lcxConta.EditValue          := viCaixaId;
    end;

    edtDataLancamento.EditValue := dtmControles.DataHoraBanco(3);
    lcxCentroCusto.EditValue    := vgCentroCustoPrincipal[tabBalancete.TabIndex];
    edtDocumentoNumero.EditValue:= '';
    edtDetalhe.EditValue        := '';
    chxContabilRetiradaLucro.Checked := False;
  end;

  procedure HabilitarRegistroAgendado;
  begin
    tabBalancete.TabIndex := dtmLookupContabil.SetarBalanceteItem(vgDadosLivroCaixa.BalanceteGrupoId);
    vgDadosLivroCaixa.DuplicaCentroCustoId := vgDadosLivroCaixa.LivroCaixaId;

    if vgDadosLivroCaixa.Operacao <> 'O' then
    begin
      edtDataVencimento.Enabled          := vgDadosLivroCaixa.LivroAgendamentoId = 0;
      icxOperacao.EditValue              := vgDadosLivroCaixa.Operacao;

      if vgDadosLivroCaixa.ValorProtocolo > 0 then
           edtValor.EditValue := vgDadosLivroCaixa.ValorProtocolo
      else edtValor.EditValue := vgDadosLivroCaixa.ValorFaturado - vgDadosLivroCaixa.ValorPago;
      edtValor.Enabled := vgDadosLivroCaixa.ValorProtocolo = 0;

      edtDesconto.EditValue             := vgDadosLivroCaixa.ValorDesconto;
      edtOutraDeducao.EditValue         := vgDadosLivroCaixa.ValorOutraDeducao;
      edtJuros.EditValue                := vgDadosLivroCaixa.ValorJuros;
      edtMulta.EditValue                := vgDadosLivroCaixa.ValorMulta;
      edtOutrasTaxas.EditValue          := vgDadosLivroCaixa.ValorOutrasTaxas;
      edtObservacaoMonetaria.EditValue  := vgDadosLivroCaixa.ObservacaoMonetaria;
      chxContabilRetiradaLucro.Checked  := vgDadosLivroCaixa.ContabilRL = 'S';

      vgDadosLivroCaixa.ValorCompromisso := edtValor.EditValue;

      if vgDadosLivroCaixa.OrcamentoId > 0 then
        lcxOrcamento.EditValue := vgDadosLivroCaixa.OrcamentoId;

      if vgDadosLivroCaixa.ReservaId > 0 then
        lcxReserva.EditValue := vgDadosLivroCaixa.ReservaId;

      if vgDadosLivroCaixa.DuplicarItem then
      begin
        vgDadosLivroCaixa.LivroCaixaId         := 0;
        vgDadosLivroCaixa.LivroAgendamentoId   := 0;
        vgDadosLivroCaixa.LivroFinanceiroID    := 0;
        vgDadosLivroCaixa.ValorCompromisso     := 0;
        lblInformaca.Caption                   := 'Duplicando Lan�amento';
      end;
    end
    else
    begin
      icxOperacao.Enabled    := False;
      icxOperacao.EditValue  := 'D';
      lcxOrcamento.EditValue := vgDadosLivroCaixa.LivroAgendamentoId;
      vgDadosLivroCaixa.LivroAgendamentoId := 0;
      vgDadosLivroCaixa.LivroFinanceiroID  := 0;
      edtValor.EditValue                   := 0;
    end;

    if vgDadosLivroCaixa.DuplicarItem then
    begin
      edtDataVencimento.EditValue := dtmControles.DataHoraBanco(3);
      edtDataLancamento.EditValue := dtmControles.DataHoraBanco(3);
      edtDataPagamento.Date       := dtmControles.DataHoraBanco(3);
      edtRefAnoMes.EditValue      := vgDadosLivroCaixa.AnoMesReferencia;
      edtDocumentoNumero.EditValue:= '';
      edtDetalhe.EditValue        := '';
    end
    else
    begin
      vgDadosLivroCaixa.DuplicaCentroCustoId := 0;
      edtDataVencimento.Date      := StrToDate(TrocaPtoPBarra(vgDadosLivroCaixa.DataVencimento));
      edtDataLancamento.EditValue := vgDadosLivroCaixa.DataLancamento;
      edtDataPagamento.EditValue  := vgDadosLivroCaixa.DataPagamento;
      edtRefAnoMes.EditValue      := vgDadosLivroCaixa.AnoMesReferencia;
      edtDetalhe.EditValue        := vgDadosLivroCaixa.Observacao;
      edtDocumentoNumero.EditValue:= vgDadosLivroCaixa.DocumentoNumero;
    end;

    edtRefAnoMes.EditValue      := vgDadosLivroCaixa.AnoMesReferencia;

    icxEspecie.EditValue        := vgDadosLivroCaixa.Especie;
    if vgDadosLivroCaixa.CaixaID <> 0 then
         lcxConta.EditValue          := vgDadosLivroCaixa.CaixaID
    else lcxConta.EditValue          := viCaixaId;

    edtDetalhe.EditValue         := vgDadosLivroCaixa.Observacao;

    if vgDadosLivroCaixa.PessoaId > 0 then
      lcxFavorecido.EditValue    := vgDadosLivroCaixa.PessoaId;

    if vgDadosLivroCaixa.ResponsavelId > 0 then
      lcxResponsavel.EditValue   := vgDadosLivroCaixa.ResponsavelId;

    chxRegistroParcial.EditValue := vgDadosLivroCaixa.RegistroParcial;
    icxDocTipo.EditValue         := vgDadosLivroCaixa.DocTipo;
    icxOperacao.Enabled          := vgDadosLivroCaixa.LivroCaixaId = 0;
    chxRegistroParcial.Visible   := vgDadosLivroCaixa.LivroCaixaId = 0;
    lcxModalidade.EditValue      := vgDadosLivroCaixa.TipoModalidadeId;
    lcxCentroCusto.EditValue     := vgDadosLivroCaixa.CentroCustoId;

    pnlDadosPrincipais.Enabled := (not vgDadosLivroCaixa.Bloqueado);
    icxOperacao.Enabled        := (vgDadosLivroCaixa.LivroAgendamentoId = 0) or (vgDadosLivroCaixa.ConciliacaoId = '');
    pnlDadosPermitidos.Enabled := (not vgDadosLivroCaixa.Bloqueado);
    tabContasFixa.Enabled      := (not vgDadosLivroCaixa.Bloqueado);
    tabBalancete.Enabled       := (not vgDadosLivroCaixa.Bloqueado);

    edtValor.Enabled           := (vgDadosLivroCaixa.ConciliacaoId = '');
    edtDataPagamento.Enabled   := (vgDadosLivroCaixa.ConciliacaoId = '');
    lcxConta.Enabled           := (vgDadosLivroCaixa.ConciliacaoId = '');
    cbxValorComplemento.Enabled:= (vgDadosLivroCaixa.ConciliacaoId = '');

    if (vgDadosLivroCaixa.Bloqueado) or (vgDadosLivroCaixa.ConciliacaoId <> '') then
    begin
      Panel2.Color  := clRed;
      Panel4.Color  := clRed;
      lblInformaca.Style.Color     := clRed;
      lblInformaca.Style.TextColor := clWhite;

      if vgDadosLivroCaixa.Bloqueado then
           pnlAlerta.Caption := 'ALTERA��O N�O PERMITIDA. '+vgDadosLivroCaixa.MensagemBloqueado
      else pnlAlerta.Caption := vgDadosLivroCaixa.MensagemBloqueado;
    end;

  end;
begin
  dtmLookupFinanceiro.AbrirFecharTelaBranco;
  tabAssociado.TabVisible := False;
  vlCriandoForm := True;
  vgDadosLivroCaixa.Confirmado := False;
  pgcPessoa.ActivePageIndex    := 0;
  inherited;

  sqlPlanoContas.Connection      := dtmControles.DB;
  sqlGrupoContabil.Connection    := dtmControles.DB;
  sqlTipoModalidade.Connection   := dtmControles.DB;
  sqlCentroReserva.Connection    := dtmControles.DB;
  sqlCentroCustoAtivo.Connection := dtmControles.DB;

  VerificarOpcoePermitidas;
  pnlAlerta.Visible  := (vgDadosLivroCaixa.Bloqueado) or (vgDadosLivroCaixa.ConciliacaoId <> '');
  viCaixaId          := dtmControles.GetInt(' SELECT CAIXA_ID FROM J_CAIXA WHERE PRINCIPAL = '+QuotedStr('S'));

  dtmLookupContabil.CarregarTabBalancete(tabBalancete);
  if vgDadosLivroCaixa.Novo then
       HabilitarRegistroNovo
  else HabilitarRegistroAgendado;

  if vgPermissaoInterno then
       lcxConta.RepositoryItem := dtmLookupContabil.Lista_CaixaTodosAtivos
  else lcxConta.RepositoryItem := dtmLookupContabil.Lista_CaixaAtivos;
end;

procedure TfrmCadastroRapidoLancamento.HabilitarTabValor(vpOperacao : String);
var
  viBalancete : Integer;
  viCaption, viClienteText : String;
begin
  viBalancete := vgTabBalancete[tabBalancete.TabIndex];

  viClienteText := 'Cliente (Receber de quem?)';

  case icxOperacao.ItemIndex of
    0 : begin
            viCaption := 'de Pagamento';
            if viBalancete <> 3 then
              viClienteText := 'Favorecido (Pagar pra quem?)';
          end;
    1 : begin
            viCaption := 'de Entrada';
          end;
    2 : begin
            viCaption     := 'do Aporte';
            viClienteText := 'Pessoa que fez o Aporte?';
          end;
    3 : begin
            viCaption := 'da Retirada';
            viClienteText := 'Pessoa que fez a Retirada?';
          end;
  end;

  lblDataDespesa.Caption := 'Data '+viCaption;
  tabPessoa.Caption      := viClienteText;
end;

procedure TfrmCadastroRapidoLancamento.icxDocTipoPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  edtDocumentoNumero.Enabled := (icxDocTipo.ItemIndex <> -1) and (icxDocTipo.EditValue <> '0');
  if (not icxDocTipo.Enabled) and (ClientAncestral.State in [dsEdit, dsInsert]) then
   edtDocumentoNumero.EditValue := null;
end;

procedure TfrmCadastroRapidoLancamento.icxOperacaoPropertiesChange(Sender: TObject);
begin
  inherited;

  chxContabilRetiradaLucro.Enabled := (icxOperacao.EditValue = 'D') OR (icxOperacao.EditValue = 'AD');
  if vlCriandoForm then
    exit;

  if (not chxContabilRetiradaLucro.Checked) then
    chxContabilRetiradaLucro.Checked := False;
  tabBalanceteChange(self);
end;

procedure TfrmCadastroRapidoLancamento.lcxCentroCustoPropertiesChange(
  Sender: TObject);
begin
  inherited;
  if lcxCentroCusto.Text = '' then
       tabCentroCustos.Caption := 'Vincular Centro Custo'
  else tabCentroCustos.Caption := 'Centro Custo '+lcxCentroCusto.Text;
end;

procedure TfrmCadastroRapidoLancamento.lcxCentroCustoPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  VerificarCentroCustoReserva(sqlCentroCustoAtivo, dtmLookupFinanceiro.ClientCentroCustos, lcxCentroCusto, 1);
end;

procedure TfrmCadastroRapidoLancamento.lcxCompromissoPropertiesEditValueChanged(
  Sender: TObject);
begin
  if (lcxCompromisso.Text = '') or vlAtivandoForm or vgAgendaConc.Conciliacao then
    exit;

  btnPadraoCompromisso.Enabled  := True;
  edtHistorico.EditValue := dtmLookupContabil.VerificarHistoricoPadrao(lcxCompromisso.Text, IntToStr(lcxCompromisso.EditValue));
  chxIR.EditValue        := sqlPlanoContasIR.AsString;
  chxCNJ.EditValue       := sqlPlanoContasCNJ.AsString;
end;

procedure TfrmCadastroRapidoLancamento.lcxFavorecidoPropertiesEditValueChanged(
  Sender: TObject);
var
  viLista : TStringList;
begin
  inherited;
  btnPessoaAlterar.Enabled    := lcxFavorecido.EditValue <> null;
  if lcxFavorecido.Text = '' then
    exit;

  viLista := dtmControles.GetFields(' SELECT CG.CONTABIL_GRUPO_ID, P.CONTABIL_CONTA_ID '+
                                    ' FROM J_PESSOA P '+
                                    '   LEFT OUTER JOIN J_CONTABIL_CONTA CC ON '+
                                    '   P.CONTABIL_CONTA_ID = CC.CONTABIL_CONTA_ID '+
                                    '   LEFT OUTER JOIN J_CONTABIL_GRUPO CG ON '+
                                    '   CC.CONTABIL_GRUPO_ID = CG.CONTABIL_GRUPO_iD '+
                                    ' WHERE P.PESSOA_ID = '+IntToStr(lcxFavorecido.EditValue));
  if viLista.Values['CONTABIL_GRUPO_ID'] = '' then
    exit;

  lcxGrupoContabil.EditValue := viLista.Values['CONTABIL_GRUPO_ID'];
  lcxCompromisso.EditValue   := viLista.Values['CONTABIL_CONTA_ID'];
  lcxCompromissoPropertiesEditValueChanged(self)
end;

procedure TfrmCadastroRapidoLancamento.lcxGrupoContabilPropertiesEditValueChanged(
  Sender: TObject);
var
  viOperacao : String;
begin
  inherited;
  if vlCriandoForm or (lcxGrupoContabil.Text = '') then
    exit;

  if not vgAgendaConc.Conciliacao then
    edtHistorico.Text := lcxCompromisso.Text;

  sqlPlanoContas.Active := False;
  sqlPlanoContas.DataSet.ParamByName('CONTABIL_GRUPO_ID').AsInteger := lcxGrupoContabil.EditValue;

  if icxOperacao.Text = '' then
    exit;

  viOperacao := icxOperacao.editvalue;
  sqlPlanoContas.Active  := True;
  lcxCompromisso.Enabled := True;

  if sqlPlanoContas.RecordCount = 1 then
    lcxCompromisso.EditValue := sqlPlanoContasCONTABIL_CONTA_ID.AsInteger;
end;

procedure TfrmCadastroRapidoLancamento.lcxOrcamentoPropertiesChange(
  Sender: TObject);
begin
  inherited;
  if lcxOrcamento.Text = '' then
       tabOrcamento.Caption := 'Vincular Or�amento'
  else tabOrcamento.Caption := 'Or�amento '+dtmLookupFinanceiro.sqlOrcamentoHISTORICO.AsString;

  tabOrcamento.Highlighted := lcxOrcamento.Text <> '';
end;

procedure TfrmCadastroRapidoLancamento.lcxReservaPropertiesChange(
  Sender: TObject);
begin
  inherited;
  if lcxReserva.Text = '' then
       tabReserva.Caption := 'Vincular Reserva'
  else tabReserva.Caption := lcxReserva.Text;

  tabReserva.Highlighted := lcxReserva.Text <> '';
end;

procedure TfrmCadastroRapidoLancamento.lcxReservaPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  VerificarCentroCustoReserva(sqlCentroReserva, dtmLookupFinanceiro.ClientCentroReserva, lcxReserva, 2);
end;

procedure TfrmCadastroRapidoLancamento.LimparCampos;
begin
  vgDadosLivroCaixa.ContabilContaID := 0;
  vgDadosLivroCaixa.Historico := '';

  lcxFavorecido.EditValue    := Null;
  lcxCompromisso.EditValue   := null;
  lcxGrupoContabil.EditValue := Null;
  edtHistorico.Clear;
  edtDocumentoNumero.Clear;
  edtDetalhe.Clear;
  edtValor.Clear;
  edtDataLancamento.Clear;
  icxEspecie.Clear;
  lcxConta.EditValue := null;
  chxIR.Checked := False;
  chxCNJ.Checked:= False;
end;

procedure TfrmCadastroRapidoLancamento.pgcDadosChange(Sender: TObject);
begin
  inherited;
  pnlCentroMsg.Visible := (pgcDados.ActivePage = tabReserva) or (pgcDados.ActivePage = tabCentroCustos);
  if pnlCentroMsg.Visible then
  begin
    if pgcDados.ActivePage = tabReserva then
         AtualizarCentroCustoReserva(sqlCentroReserva, dtmLookupFinanceiro.ClientCentroReserva, lcxReserva, 2)
    else AtualizarCentroCustoReserva(sqlCentroCustoAtivo, dtmLookupFinanceiro.ClientCentroCustos, lcxCentroCusto, 1);

    btnCentroPersonalizado.Enabled := (lcxCentroCusto.Text <> '') and
                                       (sqlCentroCustoAtivo.FieldByName('TIPO_ITEM').AsString = '3') and (pgcDados.ActivePage <> tabReserva);
    btnCentroReservaPers.Enabled   := (lcxReserva.Text <> '') and
                                      (sqlCentroReserva.FieldByName('TIPO_ITEM').AsString = '3') and (pgcDados.ActivePage = tabReserva);
  end;
end;

procedure TfrmCadastroRapidoLancamento.SalvarRegistro(vpSalvarComo: Boolean);
var
  viSituacao : String;

  {$REGION 'VALIDAR DADOS'}
  procedure ValidarDados;
  begin
    pgcDados.ActivePageIndex := 0;
    VerificarPreenchimentoLCX_TX(lcxFavorecido.Text, tabPessoa.Caption, lcxFavorecido);
    VerificarPreenchimentoLCX_TX(lcxGrupoContabil.Text, 'Grupo do Compromisso', lcxGrupoContabil);
    VerificarPreenchimentoLCX_TX(lcxCompromisso.Text, 'Compromisso', lcxCompromisso);
    VerificarPreenchimentoEDT_TX(edtHistorico.Text, 'Hist�rico', edtHistorico);
    VerificarPreenchimentoDTA_TX(edtDataVencimento.Text, 'Data de Vencimento', edtDataVencimento);
    VerificarPreenchimentoDTA_TX(edtDataPagamento.Text, lblDataDespesa.Caption, edtDataPagamento);
    VerificarPreenchimentoCUR_TX(edtValor.EditValue, 'Valor', edtValor);

    if icxDocTipo.Enabled then
      VerificarPreenchimentoICX_TX(icxDocTipo.Text, 'Doc. Tipo', icxDocTipo);

    if (edtValor.EditValue = null) or (edtValor.Text = '') then
    begin
      Application.MessageBox(Pchar('Campo Valor n�o pode ser vazio!!!'), 'Aviso', MB_OK + MB_DEFBUTTON1 + MB_ICONINFORMATION);
      edtValor.SetFocus;
      Abort;
    end;

    if ((edtDataPagamento.Date + 30) < StrToDate(dtmControles.DataHoraBanco(4))) and (not vgPertmissaoAlteracao) then
    begin
      if Application.MessageBox('Data de Registro inferior a 30 dias. Solicitar Permiss�o?', 'Confirma��o', MB_YESNO) = IDNO then
        Abort;

      if LiberarPermissaoUsuario('ESP_PERMISSAO_DATA')[6] = '0' then
        Abort;
    end;

    if (StrToDate(FormatDateTime('DD/MM/YYYY',edtDataPagamento.Date)) > StrToDate(dtmControles.DataHoraBanco(4))) then
    begin
      Application.MessageBox(Pchar('Data do Registro n�o pode ser maior que a Data Atual!!!'), 'Aviso', MB_OK + MB_DEFBUTTON1 + MB_ICONINFORMATION);
      Abort;
    end;

    dtmLookupContabil.VerificaAnoMesFechado(DateToStr(edtDataPagamento.Date));

    if lcxModalidade.Enabled then
    begin
      VerificarPreenchimentoLCX_TX(lcxModalidade.Text, 'Modalidade do Compromisso', lcxModalidade);
      VerificarPreenchimentoLCX_TX(lcxConta.Text, 'Caixa Lan�amento', lcxConta);
    end;

    pgcDados.ActivePage := tabReserva;
    VerificarPreenchimentoLCX_TX(lcxReserva.Text, 'Reserva', lcxReserva);

    pgcDados.ActivePage := tabCentroCustos;
    VerificarPreenchimentoLCX_TX(lcxCentroCusto.Text, 'Centro de Custo', lcxCentroCusto);

  end;
  {$ENDREGION}

  procedure VerificarPermissao;
  begin
    if vgLogin <> 'TRI7' then
    begin
      if (DateToStr(edtDataLancamento.Date) <> dtmControles.DataHoraBanco(4)) and (not vgPertmissaoAlteracao) then
      begin
        if Application.MessageBox('Data de Lan�amento Diferente da Data Atual. Solicitar Permiss�o?', 'Confirma��o', MB_YESNO) = IDNO then
          Abort;

        if LiberarPermissaoUsuario('ESP_PERMISSAO_DATA')[6] = '0' then
          Abort;

      end
      else
        if ((icxOperacao.EditValue = 'AR') or (icxOperacao.EditValue = 'AD')) and (vgLogin <> 'TRI7') then
          if LiberarPermissaoUsuario('ESP_OPCAO_APORTE_RETIRADA')[6] = '0' then
            Abort;
    end;
  end;

  procedure PreparaDadosSalvar;
  begin
    vgDadosLivroCaixa.CaixaID           := lcxConta.EditValue;
    vgDadosLivroCaixa.DataLancamento    := FormatDateTime('DD.MM.YYYY',edtDataLancamento.Date);
    vgDadosLivroCaixa.DataPagamento     := FormatDateTime('DD.MM.YYYY',edtDataPagamento.Date);
    vgDadosLivroCaixa.DataVencimento    := FormatDateTime('DD.MM.YYYY',edtDataVencimento.Date);

    if vgDadosLivroCaixa.Novo or vgDadosLivroCaixa.DuplicarItem then
      vgDadosLivroCaixa.ValorCompromisso:= 0
    else
      if vgDadosLivroCaixa.Operacao = 'O' then
        vgDadosLivroCaixa.ValorCompromisso := edtValor.EditValue;

    if lcxFavorecido.EditValue <> null then
         vgDadosLivroCaixa.PessoaId := lcxFavorecido.EditValue
    else vgDadosLivroCaixa.PessoaId := 0;

    if lcxResponsavel.EditValue <> null then
         vgDadosLivroCaixa.ResponsavelId := lcxResponsavel.EditValue
    else vgDadosLivroCaixa.ResponsavelId := 0;

    vgDadosLivroCaixa.ValorPago           := edtValorFinal.EditValue;
    vgDadosLivroCaixa.ValorFaturado       := edtValor.EditValue;
    vgDadosLivroCaixa.ValorDesconto       := edtDesconto.EditValue;
    vgDadosLivroCaixa.ValorOutraDeducao   := edtOutraDeducao.EditValue;
    vgDadosLivroCaixa.ValorJuros          := edtJuros.EditValue;
    vgDadosLivroCaixa.ValorMulta          := edtMulta.EditValue;
    vgDadosLivroCaixa.ValorOutrasTaxas    := edtOutrasTaxas.EditValue;
    if edtObservacaoMonetaria.EditValue = NULL then
         vgDadosLivroCaixa.ObservacaoMonetaria := ''
    else vgDadosLivroCaixa.ObservacaoMonetaria := edtObservacaoMonetaria.EditValue;
    vgDadosLivroCaixa.Especie           := icxEspecie.EditValue;
    vgDadosLivroCaixa.Referencia        := edtRefAnoMes.EditValue;
    vgDadosLivroCaixa.Operacao          := icxOperacao.EditValue;
    vgDadosLivroCaixa.ContabilContaID   := lcxCompromisso.EditValue;
    vgDadosLivroCaixa.ContabilGrupoId   := lcxGrupoContabil.EditValue;
    vgDadosLivroCaixa.CentroCustoId     := lcxCentroCusto.EditValue;
    vgDadosLivroCaixa.BalanceteGrupoId  := vgTabBalancete[tabBalancete.TabIndex];
    vgDadosLivroCaixa.Historico         := edtHistorico.EditValue;
    vgDadosLivroCaixa.AnoMesRegistro    := IntToStr(dtmLookupContabil.PegarAnoMes(vgDadosLivroCaixa.DataPagamento));
    vgDadosLivroCaixa.Observacao        := edtDetalhe.EditValue;
    vgDadosLivroCaixa.IR                := chxIR.EditValue;
    vgDadosLivroCaixa.CNJ               := chxCNJ.EditValue;
    vgDadosLivroCaixa.DocumentoNumero   := edtDocumentoNumero.EditValue;
    vgDadosLivroCaixa.ReservaId         := lcxReserva.EditValue;
    vgDadosLivroCaixa.TipoCargaId       := 0;
    vgDadosLivroCaixa.IdentificacaoId   := 0;
    vgDadosLivroCaixa.IdentificacaoTipo := '';
    vgDadosLivroCaixa.DescricaoAgrupada := '';

    if chxContabilRetiradaLucro.Checked then
         vgDadosLivroCaixa.ContabilRL := 'S'
    else vgDadosLivroCaixa.ContabilRL := 'N';

    if icxDocTipo.Enabled then
         vgDadosLivroCaixa.DocTipo  := icxDocTipo.EditValue
    else vgDadosLivroCaixa.DocTipo  := '';

    if lcxModalidade.EditValue <> null then
         vgDadosLivroCaixa.TipoModalidadeId := lcxModalidade.EditValue
    else vgDadosLivroCaixa.TipoModalidadeId := 0;

    if lcxOrcamento.Text = '' then
          vgDadosLivroCaixa.OrcamentoId := 0
    else vgDadosLivroCaixa.OrcamentoId := lcxOrcamento.EditValue;

    if lcxOrcamento.Text = '' then
         vgDadosLivroCaixa.OrcamentoId := 0
    else vgDadosLivroCaixa.OrcamentoId := lcxOrcamento.EditValue;

    if lcxResponsavel.Text = '' then
         vgDadosLivroCaixa.ResponsavelId := 0
    else vgDadosLivroCaixa.ResponsavelId := lcxResponsavel.EditValue;
  end;

begin
  ValidarDados;
  viSituacao := '3';
  VerificarPermissao;

  if chxRegistroParcial.Checked then
  begin
    vgDadosCadastro.SomentePesquisa := True;
    vgDadosLivroCaixa.Novo          := True;
    vgAgendamentoValorAgendado      := vgDadosLivroCaixa.ValorCompromisso;
    vgAgendamentoValorPagar         := edtValorFinal.EditValue;
    ExibirFormulario(TfrmCadastroRapidoRegistroParcial, frmCadastroRapidoRegistroParcial, True);
    if not vgDadosCadastro.Confirmado then
      Abort;

    if (vgDadosLivroCaixa.Situacao[1] in ['7','8']) and (vgAgendamentoSituacaoParcial = '2') then
         viSituacao := '8'
    else viSituacao := vgAgendamentoSituacaoParcial
  end
  else
    if Application.MessageBox('Confirma Lan�amento no Livro Caixa?',
        'Confirma��o', MB_YESNO) = IDNO then
      abort;

  dtmControles.StartTransaction;
  try
    PreparaDadosSalvar;

    if vgDadosLivroCaixa.LivroCaixaId = 0 then
    begin
      vgDadosLivroCaixa.Ordem := dtmControles.GerarSequencia('J_LIVRO_CAIXA_ORDEM');
      dtmLookupContabil.RegistrarRecebimentoFinanceiro;
      dtmLookupFinanceiro.BaixarEstornar('R', viSituacao, vgDadosLivroCaixa.LivroFinanceiroID, vgDadosLivroCaixa.LIvroAgendamentoId, 0, 0);
      dtmControles.Commit;
      if viSituacao = '3' then
      begin
        dtmLookupServico.VerificarAtualizacaoAgendamento;
        VerificarAtualizacaoValorAgendado;
        if vgDadosLivroCaixa.Faturamento = 'S' then
          ExecutaSqlAuxiliar(' UPDATE J_LIVRO_FINANCEIRO SET SITUACAO = '+ QuotedStr('3')+
                             ' WHERE FECHAMENTO_ID = '+IntToStr(vgDadosLivroCaixa.LivroFinanceiroID),1);
      end;
    end
    else
    begin
      dtmLookupContabil.RegistrarRecebimentoFinanceiro(0, True);
      dtmControles.Commit;
      vgDadosCadastro.Confirmado := True;
    end
  except
    dtmControles.Roolback;
    ShowMessage('Problemas na Grava��o. Tente Novamente!!!');
    Abort;
  end;
end;

procedure TfrmCadastroRapidoLancamento.tabBalanceteChange(Sender: TObject);
begin
  inherited;

  sqlGrupoContabil.Active  := False;
  if icxOperacao.Text = '' then
    exit;

  sqlGrupoContabil.DataSet.ParamByName('TIPO').AsString := IntToStr((icxOperacao.ItemIndex+1));
  sqlGrupoContabil.DataSet.ParamByName('BALANCETE_GRUPO_ID').AsInteger := vgTabBalancete[tabBalancete.TabIndex];
  sqlGrupoContabil.Active := True;

  sqlCentroCustoAtivo.Active := False;
  sqlCentroCustoAtivo.DataSet.ParamByName('BALANCETE_GRUPO_ID').AsInteger := vgTabBalancete[tabBalancete.TabIndex];
  sqlCentroCustoAtivo.Active := True;
  if (sqlCentroCustoAtivo.RecordCount = 1) and (lcxCentroCusto.EditValue = null) then
    lcxCentroCusto.EditValue := sqlCentroCustoAtivoCENTRO_CUSTO_ID.AsInteger;

  sqlCentroReserva.Active := False;
  sqlCentroReserva.DataSet.ParamByName('BALANCETE_GRUPO_ID').AsInteger := vgTabBalancete[tabBalancete.TabIndex];
  sqlCentroReserva.Active := True;
  if (sqlCentroReserva.RecordCount = 1) AND (lcxReserva.EditValue = null)  then
    lcxReserva.EditValue := sqlCentroReservaCENTRO_CUSTO_ID.AsInteger;


  sqlTipoModalidade.Active := False;
  sqlTipoModalidade.DataSet.ParamByName('TIPO').AsString := icxOperacao.EditValue;
  sqlTipoModalidade.Active := True;
  if sqlTipoModalidade.RecordCount = 1 then
    lcxModalidade.EditValue := sqlTipoModalidadeTIPO_MODALIDADE_ID.AsInteger;

  if not vlAtivandoForm then
  begin
    lcxGrupoContabil.EditValue := null;
    lcxCompromisso.EditValue   := Null;
    lcxCompromisso.Enabled     := False;

    if vgDadosLivroCaixa.Novo then
    begin
      if sqlGrupoContabil.RecordCount = 1 then
        lcxGrupoContabil.EditValue := sqlGrupoContabilCONTABIL_GRUPO_ID.AsInteger;
    end;
  end;
  HabilitarTabValor(icxOperacao.EditValue);
end;

procedure TfrmCadastroRapidoLancamento.tabBalanceteChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if (not vlCriandoForm) and
     ((vgDadosLivroCaixa.LivroAgendamentoId > 0) or (vgDadosLivroCaixa.Operacao = 'O')) then
    abort;

  inherited;
end;

procedure TfrmCadastroRapidoLancamento.VerificarAtualizacaoValorAgendado;
begin
  if (vgDadosLivroCaixa.ValorCompromisso > 0) and (vgDadosLivroCaixa.ValorPago <> vgDadosLivroCaixa.ValorCompromisso) and
   (vgAgendamentoSituacaoParcial <> '2') and (vgDadosLivroCaixa.LivroAgendamentoId > 0) and (vgDadosLivroCaixa.PeriodoId = 1) then
  begin
    if Application.MessageBox('Atualizar Valor do Agendamento?', 'Confirma��o', MB_YESNO) = IDNO then
      Exit;

    ExecutaSqlAuxiliar(' UPDATE J_LIVRO_FINANCEIRO SET VALOR_AGENDADO = :VALOR '+
                       ' WHERE LIVRO_AGENDAMENTO_ID = '+IntToStr(vgDadosLivroCaixa.LivroAgendamentoId) +
                       '   AND SITUACAO = '+QuotedStr('1'),2);
    with dtmControles.sqlAuxiliar do
    begin
      ParamByName('VALOR').AsCurrency := edtValor.EditValue;
      ExecSQL(FALSE);
    end;

    ExecutaSqlAuxiliar(' UPDATE J_LIVRO_AGENDAMENTO SET VALOR_PARCELA = :VALOR1, VALOR_PROLABORE = :VALOR2 '+
                       ' WHERE LIVRO_AGENDAMENTO_ID = '+IntToStr(vgDadosLivroCaixa.LivroAgendamentoId) +
                       '   AND SITUACAO = '+QuotedStr('1'),2);
    with dtmControles.sqlAuxiliar do
    begin
      ParamByName('VALOR1').AsCurrency := edtValor.EditValue;
      ParamByName('VALOR2').AsCurrency := edtValor.EditValue;
      ExecSQL(FALSE);
    end;
  end;
end;

procedure TfrmCadastroRapidoLancamento.VerificarCentroCustoReserva(
  vpSimpleDataSet: TSimpleDataSet; vpClientDataSet: TClientDataSet;
  vpLookup: TcxLookupComboBox; vpTipoCentro: Integer);
begin
  if vlCriandoForm then
    exit;

  btnCentroPersonalizado.Enabled := (vpLookup.Text <> '') and
                                    (vpSimpleDataSet.FieldByName('TIPO_ITEM').AsString = '3') and (vpTipoCentro = 1);
  btnCentroReservaPers.Enabled   := (vpLookup.Text <> '') and
                                    (vpSimpleDataSet.FieldByName('TIPO_ITEM').AsString = '3') and (vpTipoCentro = 2);
  if vpLookup.Text = '' then
    exit;

  case vpSimpleDataSet.FieldByName('TIPO_ITEM').AsInteger of
    1,2 : pnlCentroMsg.Caption := dtmLookupFinanceiro.VerificarPreenchimentoCentroCusto(IntToStr(vpLookup.EditValue),
                                                            vpSimpleDataSet.FieldByName('TIPO_ITEM').AsString, vpClientDataSet);
    3 :  begin
           if vpTipoCentro = 1 then
                btnCentroPersonalizadoClick(self)
           else btnCentroReservaPersClick(self);
         end;
  end;
end;

procedure TfrmCadastroRapidoLancamento.VerificarCentroPersonalizado(
  vpSimpleDataSet: TSimpleDataSet; vpLookup: TcxLookupComboBox;
  vpTipoCentro: Integer);
begin
  vgDadosCadastro.SalvarNovo := False;
  vgCentroCusto.BalanceteId  := vgTabBalancete[tabBalancete.TabIndex];
  vgCentroCusto.Cancelado    := False;
  vgCentroCusto.Agendamento  := vgDadosLivroCaixa.LivroCaixaId = 0;
  vgCentroCusto.TipoCentro   := vpTipoCentro;

  case vpTipoCentro of
    1 : vgCentroCusto.ClientCentro := dtmLookupFinanceiro.ClientCentroCustos;
    2 : vgCentroCusto.ClientCentro := dtmLookupFinanceiro.ClientCentroReserva;
  end;
  ExibirFormulario(TfrmCentroCustoPersonalizado, frmCentroCustoPersonalizado, true);
  AtualizarCentroCustoReserva(vpSimpleDataSet, vgCentroCusto.ClientCentro, vpLookup, vpTipoCentro);
  vgDadosCadastro.SomentePesquisa := True;
end;

procedure TfrmCadastroRapidoLancamento.VerificarItensCentroCustoReserva(
  vpSimpleDataSet: TSimpleDataSet; vpLookup: TcxLookupComboBox; vpId,
  vpTipoCentro: Integer);
begin
  vgCentroCusto.Agendamento := vgDadosLivroCaixa.LivroCaixaId = 0;
  case vpTipoCentro of
    1 : begin
          dtmLookupFinanceiro.VerificarCentroCustoReserva(vpId, dtmLookupFinanceiro.ClientCentroCustos, IntToStr(vpTipoCentro));
          vgCentroCusto.ClientCentro := dtmLookupFinanceiro.ClientCentroCustos;
        end;
    2 : begin
          dtmLookupFinanceiro.VerificarCentroCustoReserva(vpId, dtmLookupFinanceiro.ClientCentroReserva,  IntToStr(vpTipoCentro));
          vgCentroCusto.ClientCentro := dtmLookupFinanceiro.ClientCentroReserva;
        end;
  end;

  if vpLookup.EditValue = null then
    exit;
  pnlCentroMsg.Caption := dtmLookupFinanceiro.VerificarPreenchimentoCentroCusto(IntToStr(vpLookup.EditValue),
                                                               vpSimpleDataSet.FieldByName('TIPO_ITEM').AsString,vgCentroCusto.ClientCentro);
end;

end.

