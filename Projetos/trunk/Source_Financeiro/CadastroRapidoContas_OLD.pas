unit CadastroRapidoContas;

interface

uses
  I9Query,
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
  TfrmCadastroRapidoContas = class(TfrmCadastroAuxSimplificado)
    cbxParcelas: TcxGroupBox;
    btnDuplicarParcela: TcxButton;
    btnExcluirParcela: TcxButton;
    btnAdicionarParcela: TcxButton;
    gridParcelas: TDBCtrlGrid;
    HeaderControl1: THeaderControl;
    imgSituacaoEdicao: TcxImage;
    edtParcelaDataVencimento: TcxDBDateEdit;
    edtParcelaValor: TcxDBCurrencyEdit;
    edtParcelaSituacao: TcxDBImageComboBox;
    edtRestante: TcxCurrencyEdit;
    edtTotalParcelas: TcxCurrencyEdit;
    lblRestante: TcxLabel;
    dtsPlanoContas: TDataSource;
    sqlPlanoContas: TI9Query;
    sqlPlanoContasCONTABIL_CONTA_ID: TBCDField;
    sqlPlanoContasDESCRICAO: TStringField;
    ClientAncestralLIVRO_AGENDAMENTO_ID: TBCDField;
    ClientAncestralDATA_INICIAL: TSQLTimeStampField;
    ClientAncestralDATA_FINAL: TSQLTimeStampField;
    ClientAncestralPERIODO: TStringField;
    ClientAncestralVALOR_PARCELA: TBCDField;
    ClientAncestralQTD: TBCDField;
    ClientAncestralSITUACAO: TStringField;
    ClientAncestralESPECIE: TStringField;
    ClientAncestralBALANCETE_GRUPO_ID: TBCDField;
    ClientAncestralHISTORICO: TStringField;
    ClientAncestralOBSERVACAO: TStringField;
    ClientAncestralCONTABIL_CONTA_ID: TBCDField;
    ClientAncestralPESSOA_ID: TBCDField;
    ClientAncestralDATA_REGISTRO: TSQLTimeStampField;
    ClientAncestralVALOR_PROLABORE: TBCDField;
    ClientAncestralCENTRO_CUSTO_ID: TBCDField;
    ClientAncestralTIPO: TStringField;
    ClientAncestralIR: TStringField;
    ClientAncestralCAIXA_ID: TBCDField;
    tabBalancete: TcxTabControl;
    ClientAncestralCONTABIL_GRUPO_ID: TBCDField;
    sqlPlanoContasIR: TStringField;
    ClientAncestralDOCUMENTO_NUMERO: TStringField;
    ClientAncestralREGISTRO_PARCIAL: TStringField;
    dtsGrupoContabil: TDataSource;
    sqlGrupoContabil: TI9Query;
    sqlGrupoContabilDESCRICAO: TStringField;
    sqlGrupoContabilCONTABIL_GRUPO_ID: TBCDField;
    sqlGrupoContabilBALANCETE_GRUPO_ID: TBCDField;
    pnlSalvarComo: TPanel;
    btnSalvarNovo: TcxButton;
    ClientAncestralOPERACAO: TStringField;
    ClientDuplicar: TClientDataSet;
    ClientDuplicarLIVRO_AGENDAMENTO_ID: TBCDField;
    ClientDuplicarDATA_INICIAL: TSQLTimeStampField;
    ClientDuplicarDATA_FINAL: TSQLTimeStampField;
    ClientDuplicarPERIODO: TStringField;
    ClientDuplicarVALOR_PARCELA: TBCDField;
    ClientDuplicarQTD: TBCDField;
    ClientDuplicarSITUACAO: TStringField;
    ClientDuplicarESPECIE: TStringField;
    ClientDuplicarBALANCETE_GRUPO_ID: TBCDField;
    ClientDuplicarHISTORICO: TStringField;
    ClientDuplicarOBSERVACAO: TStringField;
    ClientDuplicarCONTABIL_CONTA_ID: TBCDField;
    ClientDuplicarPESSOA_ID: TBCDField;
    ClientDuplicarDATA_REGISTRO: TSQLTimeStampField;
    ClientDuplicarVALOR_PROLABORE: TBCDField;
    ClientDuplicarCENTRO_CUSTO_ID: TBCDField;
    ClientDuplicarTIPO: TStringField;
    ClientDuplicarIR: TStringField;
    ClientDuplicarCNJ: TStringField;
    ClientDuplicarCAIXA_ID: TBCDField;
    ClientDuplicarCONTABIL_GRUPO_ID: TBCDField;
    ClientDuplicarDOCUMENTO_NUMERO: TStringField;
    ClientDuplicarREGISTRO_PARCIAL: TStringField;
    ClientDuplicarOPERACAO: TStringField;
    ClientAncestralORCAMENTO_ID: TBCDField;
    pnlMsgAlteracao: TPanel;
    pnlDadosPrincipais: TPanel;
    cxLabel5: TcxLabel;
    cxLabel8: TcxLabel;
    lblDataDespesa: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    lblCliente: TcxLabel;
    cxLabel14: TcxLabel;
    btnPessoaNova: TcxButton;
    icxOperacao: TcxDBImageComboBox;
    icxTipo: TcxImageComboBox;
    icxEspecie: TcxDBImageComboBox;
    edtDataRegistro: TcxDBDateEdit;
    lcxCliente: TcxDBLookupComboBox;
    lcxGrupoContabil: TcxDBLookupComboBox;
    lcxCompromisso: TcxDBLookupComboBox;
    btnPessoaAlterar: TcxButton;
    pnlDadosPermitidos: TPanel;
    cxLabel4: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel3: TcxLabel;
    ClientAncestralDOC_TIPO: TStringField;
    cxLabel15: TcxLabel;
    edtHistorico: TcxDBTextEdit;
    cxButton2: TcxButton;
    icxDocTipo: TcxDBImageComboBox;
    edtDocTipo: TcxDBTextEdit;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    cxDBTextEdit2: TcxDBTextEdit;
    chbTrocarSenha: TcxDBCheckBox;
    cxDBCheckBox2: TcxDBCheckBox;
    pgcDados: TcxPageControl;
    tabContasFixa: TcxTabSheet;
    pnlValor: TPanel;
    cxLabel10: TcxLabel;
    edtValorFixo: TcxDBCurrencyEdit;
    pnlDadosValores: TPanel;
    cxLabel16: TcxLabel;
    edtDataVencimentoFixa: TcxDBDateEdit;
    icxPeriodoFixo: TcxDBImageComboBox;
    cxLabel11: TcxLabel;
    tabContasLimitadas: TcxTabSheet;
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
    tabContasClientes: TcxTabSheet;
    cxLabel9: TcxLabel;
    lblCobrancaValor: TcxLabel;
    cxLabel1: TcxLabel;
    edtBeneficioValorFixo: TcxDBCurrencyEdit;
    edtDataLancamento: TcxDBDateEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    chxReceberCliente: TcxDBCheckBox;
    tabOrcamento: TcxTabSheet;
    lcxOrcamento: TcxDBLookupComboBox;
    cxButton3: TcxButton;
    ClientAncestralPARCELA_INICIAL: TBCDField;
    ClientAncestralRESERVA_ID: TBCDField;
    tabReserva: TcxTabSheet;
    cxButton1: TcxButton;
    lcxReserva: TcxDBLookupComboBox;
    pgcReferencia: TcxPageControl;
    tabRefData: TcxTabSheet;
    cxDBDateEdit1: TcxDBDateEdit;
    tabRefAno: TcxTabSheet;
    cxDBImageComboBox1: TcxDBImageComboBox;
    ClientAncestralREFERENCIA_PERIODO: TStringField;
    ClientAncestralREFERENCIA_TIPO: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure icxProLaborePeriodoPropertiesEditValueChanged(Sender: TObject);
    procedure edtProLaboreValorTotalExit(Sender: TObject);
    procedure edtProLaboreQtdParcelaPropertiesEditValueChanged(Sender: TObject);
    procedure edtProLaboreQtdParcelaClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnAdicionarParcelaClick(Sender: TObject);
    procedure btnExcluirParcelaClick(Sender: TObject);
    procedure btnDuplicarParcelaClick(Sender: TObject);
    procedure cbxParcelasExit(Sender: TObject);
    procedure edtParcelaDataVencimentoPropertiesEditValueChanged(Sender: TObject);
    procedure edtParcelaValorPropertiesEditValueChanged(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tabBalanceteChange(Sender: TObject);
    procedure icxTipoPropertiesChange(Sender: TObject);
    procedure edtProLaboreDataInicialExit(Sender: TObject);
    procedure lcxCompromissoPropertiesEditValueChanged(Sender: TObject);
    procedure btnPessoaNovaClick(Sender: TObject);
    procedure icxOperacaoPropertiesChange(Sender: TObject);
    procedure lcxGrupoContabilPropertiesEditValueChanged(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure btnSalvarNovoClick(Sender: TObject);
    procedure edtValorFixoExit(Sender: TObject);
    procedure edtParcelaValorExit(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxDBLookupComboBox2PropertiesChange(Sender: TObject);
    procedure lcxOrcamentoPropertiesChange(Sender: TObject);
    procedure btnPessoaAlterarClick(Sender: TObject);
    procedure lcxClientePropertiesEditValueChanged(Sender: TObject);
    procedure icxDocTipoPropertiesEditValueChanged(Sender: TObject);
    procedure lcxReservaPropertiesChange(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    vlContratoItemParcela: Boolean;
    procedure HabilitarTabValor;
    procedure SalvarRegistro(vpSalvarComo: Boolean = False);
  public
    vlCriandoForm, vlAtivandoForm: Boolean;
    { Public declarations }
  end;

var
  frmCadastroRapidoContas: TfrmCadastroRapidoContas;
  vgDuplicarContaId : Integer;
  vgAgendamentoAlterar : Boolean;

implementation

uses
  Lookup, Controles, Rotinas, Lookup_Contabil, Lookup_Servico, Pessoa,
  PessoaPreCadastro, LookupFinanceiro;

{$R *.dfm}

procedure TfrmCadastroRapidoContas.btnAdicionarParcelaClick(Sender: TObject);
begin
  inherited;
  if (icxProLaborePeriodo.EditValue <> '9') then
    exit;

  if not dtmLookupServico.ClientParcelas.Active then
    dtmLookupServico.ClientParcelas.Active := True;

  if not dtmLookupServico.ClientParcelas.IsEmpty then
    dtmLookupServico.ClientParcelas.Append;

  edtParcelaDataVencimento.SetFocus;
end;

procedure TfrmCadastroRapidoContas.btnConfirmarClick(Sender: TObject);
begin
  SalvarRegistro;
  inherited;
end;

procedure TfrmCadastroRapidoContas.btnDuplicarParcelaClick(Sender: TObject);
var
  viValor: Currency;
  viData: TDate;
begin
  inherited;
  if not btnDuplicarParcela.Enabled then
    exit;

  dtmLookupServico.ClientParcelas.Last;
  viValor := dtmLookupServico.ClientParcelasVALOR_PARCELA.AsCurrency;
  viData := CalcularDataVencimento(dtmLookupServico.ClientParcelasDATA_VENCIMENTO.AsDateTime, 1, 1);

  dtmLookupServico.ClientParcelas.Append;
  dtmLookupServico.ClientParcelasVALOR_PARCELA.AsCurrency := viValor;
  dtmLookupServico.ClientParcelasDATA_VENCIMENTO.AsDateTime := viData;
  dtmLookupServico.ClientParcelas.Post;
end;

procedure TfrmCadastroRapidoContas.btnExcluirParcelaClick(Sender: TObject);
begin
  if (icxProLaborePeriodo.EditValue <> '9') or (dtmLookupServico.ClientParcelas.RecordCount = 0) then
    exit;

  if dtmLookupServico.ClientParcelas.State in [dsInsert, dsedit] then
    dtmLookupServico.ClientParcelas.Cancel;

  inherited;

  dtmLookupServico.ClientParcelas.Delete;
  dtmLookupServico.SomarGridValores(ClientAncestral, vlCriandoForm, edtTotalParcelas, edtRestante, 1);
end;

procedure TfrmCadastroRapidoContas.btnSalvarNovoClick(Sender: TObject);
  procedure SalvarRegistroAtual;
  begin
    With dtmLookupServico.sqlLivroAgendamento do
    begin
      Active := False;
      ParamByName('LIVRO_AGENDAMENTO_ID').AsInteger := vgDadosCadastro.ChaveIdPrincipal;
      Active := True;
    end;

    // Apagar Compromissos do Agendamento ainda não Concluídos
    ExecutaSqlAuxiliar(' DELETE FROM J_LIVRO_FINANCEIRO '+
                       ' WHERE LIVRO_AGENDAMENTO_ID = '+InttoStr(vgDadosCadastro.ChaveIdPrincipal)+
                       '   AND SITUACAO = '+QuotedStr('1'),1);
    dtmLookupServico.RealizarLancamentoContas;
  end;
begin
  SalvarRegistro;
  vgDadosCadastro.SalvarNovo := True;
  if ClientAncestral.State in [dsInsert] then
    ClientAncestral.Fields[0].AsInteger := dtmControles.GerarSequencia
        (vgDadosCadastro.Tabela);
  ClientAncestral.ApplyUpdates(-1);
  vgDadosCadastro.ChaveIdPrincipal := ClientAncestral.Fields[0].AsInteger;
  SalvarRegistroAtual;
  inherited;
  vgDadosCadastro.ChaveIdPrincipal := 0;
  vgDadosCadastro.SalvarNovo := False;
  ClientAncestral.Insert;
  FormCreate(self);
  FormActivate(self);
end;

procedure TfrmCadastroRapidoContas.cbxParcelasExit(Sender: TObject);
begin
  inherited;
  if dtmLookupServico.ClientParcelas.State in [dsEdit, dsInsert] then
    dtmLookupServico.ClientParcelas.Post;
end;

procedure TfrmCadastroRapidoContas.btnPessoaAlterarClick(Sender: TObject);
begin
  inherited;
  vgNovoCadastro := False;
  vgPessoa.Nome  := '';
  vgPessoa.PessoaId := lcxCliente.EditValue;
  ExibirFormulario(TfrmCadPessoa, frmCadPessoa, True);
end;

procedure TfrmCadastroRapidoContas.btnPessoaNovaClick(Sender: TObject);
begin
  inherited;
  vgPessoa.PessoaTipo := 'F';
  vgPessoa.CPF_CNPJ := '';
  vgPessoa.Selecionar := True;
  vgPessoa.PessoaTipoVinculo := '6:Padrão';
  vgPessoa.Nome := '';

  frmPessoaPreCadastro := TfrmPessoaPreCadastro.Create(self);
  frmPessoaPreCadastro.ShowModal;
  if vgPessoa.PessoaId = -1 then
    exit
  else if vgPessoa.PessoaId > 0 then
  begin
    ClientAncestralPESSOA_ID.AsInteger := vgPessoa.PessoaId;
    exit;
  end;

  vgCadastrarFuncao := False;
  vgNovoCadastro := True;
  vgPessoa.PessoaId := 0;
  frmCadPessoa := TfrmCadPessoa.Create(self);
  frmCadPessoa.ShowModal;

  if vgPessoa.PessoaId > 0 then
    ClientAncestralPESSOA_ID.AsInteger := vgPessoa.PessoaId;
end;

procedure TfrmCadastroRapidoContas.cxButton1Click(Sender: TObject);
begin
  inherited;
  ClientAncestralRESERVA_ID.AsVariant := null;
end;

procedure TfrmCadastroRapidoContas.cxButton2Click(Sender: TObject);
begin
  inherited;
  if lcxCompromisso.Text = '' then
    exit;

  dtmLookupContabil.GravarHistorico(edtHistorico.Text, IntToStr(lcxCompromisso.EditValue));
end;

procedure TfrmCadastroRapidoContas.cxButton3Click(Sender: TObject);
begin
  inherited;
  ClientAncestralORCAMENTO_ID.AsVariant := null;
end;

procedure TfrmCadastroRapidoContas.cxDBLookupComboBox2PropertiesChange(
  Sender: TObject);
begin
  inherited;
  if lcxOrcamento.Text = '' then
       tabOrcamento.Caption := 'Vincular Orçamento'
  else tabOrcamento.Caption := 'Compromisso Vinculado ao Orçamento '+dtmLookupFinanceiro.sqlOrcamentoHISTORICO.AsString;

  tabOrcamento.Highlighted := lcxOrcamento.Text <> '';
end;

procedure TfrmCadastroRapidoContas.edtParcelaDataVencimentoPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  imgSituacaoEdicao.Visible := True;
  btnDuplicarParcela.Enabled := False;
end;

procedure TfrmCadastroRapidoContas.edtParcelaValorExit(Sender: TObject);
begin
  inherited;
  VerificarPreenchimentoCUR_DB(edtParcelaValor.EditValue, 'Valor', edtParcelaValor);
end;

procedure TfrmCadastroRapidoContas.edtParcelaValorPropertiesEditValueChanged(Sender: TObject);
begin
  imgSituacaoEdicao.Visible := True;
  inherited;
  btnDuplicarParcela.Enabled := False;
end;

procedure TfrmCadastroRapidoContas.edtProLaboreDataInicialExit(Sender: TObject);
begin
  inherited;
  if vlCriandoForm then
    exit;

  if ClientAncestralDATA_INICIAL.AsVariant = Null then
    ClientAncestralDATA_INICIAL.AsDateTime := dtmControles.DataHoraBanco(3);

  if ClientAncestralPERIODO.AsInteger <= 6 then
    ClientAncestralDATA_FINAL.AsVariant := null
  else
    ClientAncestralDATA_FINAL.AsVariant := CalcularDataVencimento(ClientAncestralDATA_INICIAL.AsDateTime, 1, ClientAncestralQTD.AsInteger - 1);
end;

procedure TfrmCadastroRapidoContas.edtProLaboreQtdParcelaClick(Sender: TObject);
begin
  inherited;
  edtProLaboreQtdParcelaPropertiesEditValueChanged(self);
end;

procedure TfrmCadastroRapidoContas.edtProLaboreQtdParcelaPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if vlCriandoForm then
    exit;

  if ClientAncestral.State in [dsEdit, dsInsert] then
  begin
    if icxProLaborePeriodo.EditValue = '8' then
    begin
      if edtProLaboreValorTotal.EditValue > 0 then
        ClientAncestralVALOR_PARCELA.AsCurrency := (edtProLaboreValorTotal.EditValue / edtProLaboreQtdParcela.EditValue);
      edtProLaboreDataInicialExit(self);
    end;
  end;
end;

procedure TfrmCadastroRapidoContas.edtProLaboreValorTotalExit(Sender: TObject);
begin
  inherited;
  if edtProLaboreValorTotal.EditValue = null then
    exit;

  VerificarPreenchimentoCUR_DB(edtProLaboreValorTotal.EditValue, 'Valor', edtProLaboreValorTotal);
  edtProLaboreQtdParcelaPropertiesEditValueChanged(self);
  if icxProLaborePeriodo.EditValue = 9 then
    dtmLookupServico.SomarGridValores(ClientAncestral, vlCriandoForm, edtTotalParcelas, edtRestante, 1);
end;

procedure TfrmCadastroRapidoContas.edtValorFixoExit(Sender: TObject);
begin
  inherited;
  if edtValorFixo.EditValue = null then
    exit;

  VerificarPreenchimentoCUR_DB(edtValorFixo.EditValue, 'Valor', edtValorFixo);
end;

procedure TfrmCadastroRapidoContas.FormActivate(Sender: TObject);
begin
  inherited;
  vlAtivandoForm := True;
  if vgAgendamentoAlterar or (ClientAncestral.State in [dsInsert]) then
  begin
    if icxOperacao.Enabled then
      icxOperacao.SetFocus
    else
      lcxCliente.SetFocus;
  end
  else
    if pnlDadosPermitidos.Enabled then
      edtHistorico.SetFocus;

  edtProLaboreValorTotalExit(self);
  vlCriandoForm := False;

  if ClientAncestral.State in [dsInsert] then
  begin
    if vgDuplicarContaId > 0 then
      lblInformaca.Caption := 'DUPLICANDO Agendamento';

    icxOperacaoPropertiesChange(self);
    vlAtivandoForm := False;
    HabilitarTabValor;
  end
  else
  begin
    HabilitarTabValor;
    vlAtivandoForm := False;
  end;
end;

procedure TfrmCadastroRapidoContas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  vgDadosCadastro.SomentePesquisa := False;
  dtmLookupFinanceiro.AbrirFecharTelaBranco(False);
  vgDuplicarContaId := 0;

  Action := caFree;
  frmCadastroRapidoContas := nil;
end;

procedure TfrmCadastroRapidoContas.FormCreate(Sender: TObject);

  procedure VerificarOpcoePermitidas;
  begin
    if dtmControles.CodPermissao('ESP_OPCAO_APORTE_RETIRADA') = '000000' then
      icxOperacao.RepositoryItem := dtmLookupContabil.ComboDespesaReceitaSomente
    else
      icxOperacao.RepositoryItem := dtmLookupContabil.ComboDespesaReceitaOutros;
  end;

  procedure DuplicarConta;
  begin
    ExecutaSimpleDSAux(' SELECT * '+
                       ' FROM J_LIVRO_AGENDAMENTO '+
                       ' WHERE LIVRO_AGENDAMENTO_ID = '+IntToStr(vgDuplicarContaId),0);
    With dtmControles.SimpleAuxiliar do
    begin
      ClientAncestralDATA_INICIAL.AsVariant       := FieldByName('DATA_INICIAL').AsVariant;
      ClientAncestralDATA_FINAL.AsVariant         := FieldByName('DATA_FINAL').AsVariant;
      ClientAncestralPERIODO.AsVariant            := FieldByName('PERIODO').AsVariant;
      ClientAncestralVALOR_PARCELA.AsVariant      := FieldByName('VALOR_PARCELA').AsVariant;
      ClientAncestralQTD.AsVariant                := FieldByName('QTD').AsVariant;
      ClientAncestralSITUACAO.AsVariant           := FieldByName('SITUACAO').AsVariant;
      ClientAncestralESPECIE.AsVariant            := FieldByName('ESPECIE').AsVariant;
      ClientAncestralHISTORICO.AsVariant          := FieldByName('HISTORICO').AsVariant;
      ClientAncestralOBSERVACAO.AsVariant         := FieldByName('OBSERVACAO').AsVariant;
      ClientAncestralBALANCETE_GRUPO_ID.AsVariant := FieldByName('BALANCETE_GRUPO_ID').AsVariant;
      ClientAncestralCONTABIL_GRUPO_ID.AsVariant  := FieldByName('CONTABIL_GRUPO_ID').AsVariant;
      ClientAncestralCONTABIL_CONTA_ID.AsVariant  := FieldByName('CONTABIL_CONTA_ID').AsVariant;
      ClientAncestralPESSOA_ID.AsVariant          := FieldByName('PESSOA_ID').AsVariant;
      ClientAncestralDATA_REGISTRO.AsVariant      := FieldByName('DATA_REGISTRO').AsVariant;
      ClientAncestralVALOR_PROLABORE.AsVariant    := FieldByName('VALOR_PROLABORE').AsVariant;
      ClientAncestralCENTRO_CUSTO_ID.AsVariant    := FieldByName('CENTRO_CUSTO_ID').AsVariant;
      ClientAncestralTIPO.AsVariant               := FieldByName('TIPO').AsVariant;
      ClientAncestralCAIXA_ID.AsVariant           := FieldByName('CAIXA_ID').AsVariant;
      ClientAncestralOPERACAO.AsVariant           := FieldByName('OPERACAO').AsVariant;
      ClientAncestralREFERENCIA_TIPO.AsVariant           := FieldByName('REFERENCIA_TIPO').AsVariant;
      ClientAncestralREFERENCIA_PERIODO.AsVariant := FieldByName('REFERENCIA_PERIODO').AsVariant;

      icxOperacao.Enabled := False;
      tabBalancete.TabIndex := FieldByName('BALANCETE_GRUPO_ID').AsInteger - 1;

      if ClientAncestralDATA_FINAL.IsNull then
        icxTipo.ItemIndex := 0
      else
        icxTipo.ItemIndex := 1;
      tabBalanceteChange(Self);
    end;
  end;

  procedure ValidarCampos;
  begin
    icxOperacao.Enabled        := False;
    tabBalancete.TabIndex      := ClientAncestralBALANCETE_GRUPO_ID.AsInteger - 1;
    pnlMsgAlteracao.Visible    := not vgAgendamentoAlterar;
    pnlDadosPrincipais.Enabled := vgAgendamentoAlterar and (ClientAncestralSITUACAO.AsInteger < 2);
    pnlDadosPermitidos.Enabled := (ClientAncestralSITUACAO.AsInteger < 2);
    pnlDadosValores.Enabled    := vgAgendamentoAlterar and (ClientAncestralSITUACAO.AsInteger < 2);
    pgcDados.Enabled           := (vgAgendamentoAlterar) or
                                  ((icxTipo.EditValue = '1') and (ClientAncestralSITUACAO.AsInteger < 2));
    cbxParcelas.Enabled        := vgAgendamentoAlterar;
    btnConfirmar.Enabled       := pnlDadosPermitidos.Enabled;

    if not vgAgendamentoAlterar then
    begin
      case ClientAncestralSITUACAO.AsInteger of
        1   : begin
                pnlMsgAlteracao.Caption  := 'Já existe(m) itens pagos com este agendamento. Alteração liberada somente para alguns itens, ou cancele e cria um novo';
                pnlDadosPermitidos.Color := $00C4E1E1;
                pnlValor.Color           := $00C4E1E1;
              end;
        2   : pnlMsgAlteracao.Caption := 'Serviço Concluído. Alteração não permitida';
        3,4 : pnlMsgAlteracao.Caption := 'Serviço Cancelado/Desativado. Alteração não permitida.';
       else pnlMsgAlteracao.Caption  := '';
      end;
    end;
  end;

begin
  dtmLookupFinanceiro.AbrirFecharTelaBranco;
  vlCriandoForm := True;
  inherited;

  Screen.Cursor := crHourGlass;
  dtmLookupContabil.CarregarTabBalancete(tabBalancete);
  sqlPlanoContas.Connection   := dtmControles.DB;
  sqlGrupoContabil.Connection := dtmControles.DB;
  VerificarOpcoePermitidas;

  tabRefData.TabVisible := icxTipo.ItemIndex = 1;
  tabRefAno.TabVisible  := icxTipo.ItemIndex = 0;

  dtmLookupServico.ClientParcelas.Filtered := False;
  pnlSalvarComo.Visible := (ClientAncestral.State in [dsInsert]) and (vgDuplicarContaId = 0);
  if ClientAncestral.State in [dsInsert] then
  begin
    if vgDuplicarContaId = 0 then
    begin
      icxTipo.ItemIndex := 0;
      ClientAncestralSITUACAO.AsString := '1';
      ClientAncestralESPECIE.AsString  := 'D';
      ClientAncestralOPERACAO.AsString := 'D';
      ClientAncestralDOC_TIPO.AsString := 'F';
      ClientAncestralDATA_REGISTRO.AsDateTime := dtmControles.DataHoraBanco(3);
      ClientAncestralCAIXA_ID.AsInteger := vgCaixaPrincipalID;
      ClientAncestralQtd.AsInteger      := 1;
      ClientAncestralREFERENCIA_TIPO.AsString    := '1';
      ClientAncestralREFERENCIA_PERIODO.AsString := '1';
    end
    else DuplicarConta;
    tabBalanceteChange(Self);
    pnlMsgAlteracao.Visible := False;
  end
  else
  begin
    if ClientAncestralDATA_FINAL.IsNull then
      icxTipo.ItemIndex := 0
    else
      icxTipo.ItemIndex := 1;
    tabBalanceteChange(Self);
    ValidarCampos
  end;
  Screen.Cursor := crDefault;
end;

procedure TfrmCadastroRapidoContas.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = 107 then
    btnAdicionarParcelaClick(self)
  else if key = 109 then
    btnExcluirParcelaClick(self)
  else if key = 106 then
    btnDuplicarParcelaClick(self);
end;

procedure TfrmCadastroRapidoContas.HabilitarTabValor;
var
  viBalancete: Integer;
  viCaption, viClienteText: string;
begin
  viBalancete := vgTabBalancete[tabBalancete.TabIndex];
  tabContasClientes.TabVisible := viBalancete = 3;
  tabContasLimitadas.TabVisible := (viBalancete <> 3) and (icxTipo.ItemIndex = 1);
  tabContasFixa.TabVisible := (viBalancete <> 3) and (icxTipo.ItemIndex = 0);
  chxReceberCliente.Enabled := (viBalancete = 3) and (icxOperacao.editValue = 'D');
  icxTipo.Enabled := (viBalancete <> 3);
  lcxCliente.Enabled := (viBalancete <> 3);

  viClienteText := 'Cliente';
  if viBalancete = 3 then
    icxTipo.ItemIndex := 1;

  if icxOperacao.editValue = 'D' then
  begin
    viCaption := 'Despesa';
    if viBalancete <> 3 then
      viClienteText := 'Favorecido';
  end
  else
    viCaption := 'Receita';

  tabContasClientes.Caption := viCaption + ' do Cliente';
  tabContasLimitadas.Caption := viCaption + ' Limitadas';
  tabContasFixa.Caption := viCaption + ' Fixa';
  lblCliente.Caption := viClienteText;

  if tabContasClientes.TabVisible then
    pgcDados.ActivePage := tabContasClientes
  else if tabContasLimitadas.TabVisible then
    pgcDados.ActivePage := tabContasLimitadas
  else
    pgcDados.ActivePage := tabContasFixa;

  if (pgcDados.ActivePage <> tabContasLimitadas) and (not vlAtivandoForm) then
    ClientAncestralPERIODO.AsInteger := 1;

  icxProLaborePeriodoPropertiesEditValueChanged(Self);
end;

procedure TfrmCadastroRapidoContas.icxDocTipoPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  edtDocTipo.Enabled := icxDocTipo.ItemIndex = 0;
  if (not edtDocTipo.Enabled) and (ClientAncestral.State in [dsEdit, dsInsert]) then
   ClientAncestralDOCUMENTO_NUMERO.AsVariant := null;
end;

procedure TfrmCadastroRapidoContas.icxOperacaoPropertiesChange(Sender: TObject);
begin
  inherited;
  icxDocTipo.Enabled := (icxOperacao.EditValue = 'D') OR (icxOperacao.EditValue = 'AD');
  edtDocTipo.Enabled := (icxOperacao.EditValue = 'D') OR (icxOperacao.EditValue = 'AD');
  if vlCriandoForm then
    exit;

  icxDocTipo.Enabled := icxOperacao.EditValue = 'D';
  if (not icxDocTipo.Enabled) and (ClientAncestral.State in [dsEdit, dsInsert]) then
  begin
    ClientAncestralDOC_TIPO.AsVariant        := null;
    ClientAncestralDOCUMENTO_NUMERO.AsVariant:= null;
  end;

  tabBalanceteChange(self);
end;

procedure TfrmCadastroRapidoContas.icxProLaborePeriodoPropertiesEditValueChanged(Sender: TObject);
var
  viPeriodo: Integer;
begin
  inherited;
  if icxProLaborePeriodo.EditValue = null then
    exit;

  viPeriodo := StrtoInt(icxProLaborePeriodo.EditValue);

  edtProLaboreQtdParcela.Enabled := viPeriodo = 8;
  btnAdicionarParcela.Enabled := viPeriodo = 9;
  cbxParcelas.Enabled := viPeriodo = 9;
  edtProLaboreDataInicial.Enabled := viPeriodo = 8;

  if (pgcDados.ActivePage = tabContasLimitadas) and (icxProLaborePeriodo.EditValue = 9) then
  begin
    frmCadastroRapidoContas.Height := 585;
    dtmLookupServico.SomarGridValores(ClientAncestral, vlCriandoForm, edtTotalParcelas, edtRestante, 1);
  end
  else
    frmCadastroRapidoContas.Height := 395;

  if vlAtivandoForm then
    exit;

  if ClientAncestral.State in [dsEdit, dsInsert] then
    ClientAncestralQTD.AsInteger := 1;
end;

procedure TfrmCadastroRapidoContas.icxTipoPropertiesChange(Sender: TObject);
begin
  inherited;
  tabBalanceteChange(self);

  tabRefData.TabVisible := icxTipo.ItemIndex = 1;
  tabRefAno.TabVisible  := icxTipo.ItemIndex = 0;
  if tabRefData.TabVisible then
  begin
    pgcReferencia.ActivePage := tabRefData;
    if (ClientAncestral.State in [dsEdit, dsInsert]) and (not vlCriandoForm) then
      ClientAncestralREFERENCIA_PERIODO.AsString := '1';
  end
  else
  begin
    pgcReferencia.ActivePage := tabRefAno;
    if (ClientAncestral.State in [dsEdit, dsInsert]) and (not vlCriandoForm) then
      ClientAncestralDATA_REGISTRO.AsDateTime := dtmControles.DataHoraBanco(3);
  end;
end;

procedure TfrmCadastroRapidoContas.lcxClientePropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  btnPessoaAlterar.Enabled := lcxCliente.EditValue <> null;
end;

procedure TfrmCadastroRapidoContas.lcxCompromissoPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if lcxCompromisso.TExt = '' then
    exit;

  if ClientAncestral.State in [dsEdit, dsInsert] then
  begin
    ClientAncestralHISTORICO.AsString := dtmLookupContabil.VerificarHistoricoPadrao(lcxCompromisso.Text, IntToStr(lcxCompromisso.EditValue));
    ClientAncestralIR.AsString := sqlPlanoContasIR.AsString;
  end;
end;

procedure TfrmCadastroRapidoContas.lcxGrupoContabilPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if lcxGrupoContabil.Text = '' then
    exit;

  sqlPlanoContas.Active := False;
  sqlPlanoContas.ParamByName('CONTABIL_GRUPO_ID').AsInteger := lcxGrupoContabil.EditValue;
  sqlPlanoContas.Active := True;

  if (sqlPlanoContas.RecordCount = 1) and (ClientAncestral.State in [dsEdit, dsInsert]) then
    ClientAncestralCONTABIL_CONTA_ID.AsInteger := sqlPlanoContasCONTABIL_CONTA_ID.AsInteger;

  lcxCompromisso.Enabled := True;
end;

procedure TfrmCadastroRapidoContas.lcxOrcamentoPropertiesChange(
  Sender: TObject);
begin
  inherited;
  if lcxOrcamento.Text = '' then
       tabOrcamento.Caption := 'Vincular Orçamento'
  else tabOrcamento.Caption := 'Compromisso Vinculado ao Orçamento '+dtmLookupFinanceiro.sqlOrcamentoHISTORICO.AsString;

  tabOrcamento.Highlighted := lcxOrcamento.Text <> '';
end;

procedure TfrmCadastroRapidoContas.lcxReservaPropertiesChange(Sender: TObject);
begin
  inherited;
  if lcxReserva.Text = '' then
       tabReserva.Caption := 'Vincular Reserva'
  else tabReserva.Caption := 'Vinculado a Reserva '+dtmLookupContabil.sqlReservasAtivasDESCRICAO.AsString;

  tabReserva.Highlighted := lcxReserva.Text <> '';
end;

procedure TfrmCadastroRapidoContas.SalvarRegistro(vpSalvarComo: Boolean);
begin
  VerificarPreenchimentoLCX_DB(lcxCompromisso.Text, 'Compromisso', lcxCompromisso);
  VerificarPreenchimentoDTA_DB(edtDataRegistro.Text, lblDataDespesa.Caption, edtDataRegistro);
  VerificarPreenchimentoLCX_DB(lcxCliente.Text, lblCliente.Caption, lcxCliente);
  VerificarPreenchimentoEDT_DB(edtHistorico.Text, 'Histórico', edtHistorico);
  if icxDocTipo.Enabled then
    VerificarPreenchimentoICX_DB(icxDocTipo.Text, 'Dopc. Tipo', icxDocTipo);

  if pgcDados.ActivePage = tabContasFixa then
  begin
    VerificarPreenchimentoCUR_DB(edtValorFixo.EditValue, 'Valor', edtValorFixo);
    VerificarPreenchimentoDTA_DB(edtDataVencimentoFixa.Text, 'Data Vencimento', edtDataVencimentoFixa);
    VerificarPreenchimentoICX_DB(icxPeriodoFixo.Text, 'Periodo', icxPeriodoFixo);
    ClientAncestralVALOR_PROLABORE.AsCurrency := ClientAncestralVALOR_PARCELA.AsCurrency
  end
  else if pgcDados.ActivePage = tabContasLimitadas then
  begin
    if (edtTotalParcelas.editValue <> null) and (ClientAncestralPERIODO.AsInteger = 9) then
      ClientAncestralVALOR_PROLABORE.AsCurrency := edtTotalParcelas.editValue;

    VerificarPreenchimentoCUR_DB(edtProLaboreValorTotal.EditValue, 'Valor', edtProLaboreValorTotal);
    VerificarPreenchimentoDTA_DB(edtProLaboreDataInicial.Text, 'Data Vencimento', edtProLaboreDataInicial);
  end
  else
  begin
    VerificarPreenchimentoCUR_DB(edtBeneficioValorFixo.EditValue, 'Valor', edtBeneficioValorFixo);
    VerificarPreenchimentoDTA_DB(edtDataLancamento.Text, 'Data Lançamento', edtDataLancamento);
    ClientAncestralPERIODO.AsInteger := 2;
    ClientAncestralDATA_FINAL.AsVariant := ClientAncestralDATA_INICIAL.AsVariant;
    ClientAncestralVALOR_PROLABORE.AsCurrency := ClientAncestralVALOR_PARCELA.AsCurrency
  end;

  pgcDados.ActivePage := tabReserva;
  VerificarPreenchimentoLCX_DB(lcxReserva.Text,'Reserva', lcxReserva);

  if edtProLaboreQtdParcela.editValue = 0 then
    ClientAncestralQtd.AsInteger := 1;

  if ClientAncestralPERIODO.AsInteger in [1, 6] then
    ClientAncestralDATA_FINAL.AsVariant := null;

  ClientAncestralBalancete_Grupo_Id.AsInteger := vgTabBalancete[tabBalancete.TabIndex];
  ClientAncestralCentro_Custo_Id.AsInteger := vgCentroCustoPrincipal[tabBalancete.TabIndex];
  vlContratoItemParcela := (dtmLookupServico.ClientParcelas.RecordCount > 0) and (icxProLaborePeriodo.EditValue = 9);
end;

procedure TfrmCadastroRapidoContas.tabBalanceteChange(Sender: TObject);
begin
  inherited;
  sqlGrupoContabil.Active := False;
  if icxOperacao.Text = '' then
    exit;

  sqlGrupoContabil.ParamByName('TIPO').AsString := IntToStr((icxOperacao.ItemIndex + 1));
  sqlGrupoContabil.ParamByName('BALANCETE_GRUPO_ID').AsInteger := vgTabBalancete[tabBalancete.TabIndex];
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

