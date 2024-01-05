unit CadastroRapidoContas;

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
  DbxDevartInterBase, cxButtonEdit, dxToggleSwitch, dxDBToggleSwitch;

type
  TAgendaConciliacao = record
    Conciliacao : Boolean;
    Operacao, Historico : String;
    CaixaId : Integer;
  end;

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
    pnlSalvarComo: TPanel;
    btnSalvarNovo: TcxButton;
    ClientAncestralOPERACAO: TStringField;
    ClientDuplicar: TClientDataSet;
    ClientDuplicarLIVRO_AGENDAMENTO_ID: TFMTBCDField;
    ClientDuplicarDATA_INICIAL: TSQLTimeStampField;
    ClientDuplicarDATA_FINAL: TSQLTimeStampField;
    ClientDuplicarPERIODO: TStringField;
    ClientDuplicarVALOR_PARCELA: TFMTBCDField;
    ClientDuplicarQTD: TFMTBCDField;
    ClientDuplicarSITUACAO: TStringField;
    ClientDuplicarESPECIE: TStringField;
    ClientDuplicarBALANCETE_GRUPO_ID: TFMTBCDField;
    ClientDuplicarHISTORICO: TStringField;
    ClientDuplicarOBSERVACAO: TStringField;
    ClientDuplicarCONTABIL_CONTA_ID: TFMTBCDField;
    ClientDuplicarPESSOA_ID: TFMTBCDField;
    ClientDuplicarDATA_REGISTRO: TSQLTimeStampField;
    ClientDuplicarVALOR_PROLABORE: TFMTBCDField;
    ClientDuplicarCENTRO_CUSTO_ID: TFMTBCDField;
    ClientDuplicarTIPO: TStringField;
    ClientDuplicarIR: TStringField;
    ClientDuplicarCNJ: TStringField;
    ClientDuplicarCAIXA_ID: TFMTBCDField;
    ClientDuplicarCONTABIL_GRUPO_ID: TFMTBCDField;
    ClientDuplicarDOCUMENTO_NUMERO: TStringField;
    ClientDuplicarREGISTRO_PARCIAL: TStringField;
    ClientDuplicarOPERACAO: TStringField;
    ClientAncestralORCAMENTO_ID: TFMTBCDField;
    pnlMsgAlteracao: TPanel;
    pnlDadosPrincipais: TPanel;
    cxLabel5: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    lblCliente: TcxLabel;
    cxLabel14: TcxLabel;
    btnPessoaNova: TcxButton;
    icxOperacao: TcxDBImageComboBox;
    icxTipo: TcxImageComboBox;
    icxEspecie: TcxDBImageComboBox;
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
    lcxCaixa: TcxDBLookupComboBox;
    cxDBTextEdit2: TcxDBTextEdit;
    chbTrocarSenha: TcxDBCheckBox;
    cxDBCheckBox1: TcxDBCheckBox;
    chxRegistroParcial: TcxDBCheckBox;
    ClientAncestralPARCELA_INICIAL: TFMTBCDField;
    ClientAncestralREFERENCIA_TIPO: TStringField;
    ClientAncestralREFERENCIA_PERIODO: TStringField;
    ClientAncestralCALC_DATAPROX_VENC: TDateField;
    cxLabel17: TcxLabel;
    lcxModalodadeCompromisso: TcxDBLookupComboBox;
    ClientAncestralTIPO_MODALIDADE_ID: TFMTBCDField;
    sqlTipoModalidade: TSimpleDataSet;
    sqlTipoModalidadeTIPO_MODALIDADE_ID: TFMTBCDField;
    sqlTipoModalidadeDESCRICAO: TStringField;
    sqlTipoModalidadeTIPO: TStringField;
    sqlTipoModalidadeSITUACAO: TStringField;
    dtsTipoModalidade: TDataSource;
    ClientAncestralGRUPO_LANCAMENTO_ID: TFMTBCDField;
    ClientAncestralGRUPO_PESSOA_ID: TFMTBCDField;
    sqlCentroCustoAtivo: TSimpleDataSet;
    sqlCentroCustoAtivoDESCRICAO: TStringField;
    sqlCentroCustoAtivoCENTRO_CUSTO_ID: TFMTBCDField;
    sqlCentroCustoAtivoBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlCentroCustoAtivoPERSONALIZADO: TStringField;
    sqlCentroCustoAtivoTIPO_ITEM: TStringField;
    dtsCentroCustoAtivo: TDataSource;
    sqlCentroCustoAtivoTIPO_GLOBAL: TStringField;
    ClientAncestralCENTRO_RESERVA_ID: TFMTBCDField;
    sqlCentroReserva: TSimpleDataSet;
    dtsCentroReserva: TDataSource;
    sqlCentroReservaDESCRICAO: TStringField;
    sqlCentroReservaCENTRO_CUSTO_ID: TFMTBCDField;
    sqlCentroReservaBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlCentroReservaPERSONALIZADO: TStringField;
    sqlCentroReservaTIPO_ITEM: TStringField;
    sqlCentroReservaTIPO_GLOBAL: TStringField;
    Panel3: TPanel;
    pgcDados: TcxPageControl;
    tabContasFixa: TcxTabSheet;
    pnlValor: TPanel;
    cxLabel10: TcxLabel;
    edtValorFixo: TcxDBCurrencyEdit;
    pnlDadosValores: TPanel;
    icxPeriodoFixo: TcxDBImageComboBox;
    cxLabel11: TcxLabel;
    tabContasLimitadas: TcxTabSheet;
    pnlDespesasLimitadas: TPanel;
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
    tabReserva: TcxTabSheet;
    lcxReserva: TcxDBLookupComboBox;
    tabCentroCustos: TcxTabSheet;
    lcxCentroCusto: TcxDBLookupComboBox;
    btnCentroPersonalizado: TcxButton;
    btnCentroReservaPers: TcxButton;
    pnlCentroMsg: TcxLabel;
    btnPlanoContas: TcxButton;
    ClientAncestralUSUARIO_ID: TFMTBCDField;
    btnPessoaPesquisar: TcxButton;
    cxLabel16: TcxLabel;
    edtDataVencimentoFixa: TcxDBDateEdit;
    cxDBCheckBox2: TcxDBCheckBox;
    ClientAncestralCONTABIL_RL: TStringField;
    pgcReferencia: TcxPageControl;
    tabRefData: TcxTabSheet;
    edtDataRegistro: TcxDBDateEdit;
    tabRefAno: TcxTabSheet;
    cxDBImageComboBox1: TcxDBImageComboBox;
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
    procedure tabBalanceteChanging(Sender: TObject; var AllowChange: Boolean);
    procedure lcxCentroCustoPropertiesChange(Sender: TObject);
    procedure lcxReservaPropertiesChange(Sender: TObject);
    procedure lcxCentroCustoPropertiesEditValueChanged(Sender: TObject);
    procedure btnCentroPersonalizadoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure pgcDadosChange(Sender: TObject);
    procedure lcxReservaPropertiesEditValueChanged(Sender: TObject);
    procedure btnCentroReservaPersClick(Sender: TObject);
    procedure btnPlanoContasClick(Sender: TObject);
    procedure btnPessoaPesquisarClick(Sender: TObject);
  private
    vlContratoItemParcela, vlPermitirAtivarAgendamento : Boolean;
    vlDataProxima : TDate;
    procedure HabilitarTabValor;
    procedure SalvarRegistro(vpSalvarComo: Boolean = False);

    // Centro Custo e Reserva
    procedure AtualizarCentroCustoReserva(vpSimpleDataSet : TSimpleDataSet; vpClientDataSet : TClientDataSet;
        vpLookup : TcxDBLookupComboBox; vpTipoCentro : Integer);
    procedure VerificarCentroCustoReserva(vpSimpleDataSet : TSimpleDataSet; vpClientDataSet : TClientDataSet;
        vpLookup : TcxDBLookupComboBox;  vpTipoCentro : Integer);
    procedure VerificarItensCentroCustoReserva(vpSimpleDataSet : TSimpleDataSet;
        vpLookup : TcxDBLookupComboBox; vpId, vpTipoCentro : Integer);
    procedure VerificarCentroPersonalizado(vpSimpleDataSet : TSimpleDataSet;
        vpLookup : TcxDBLookupComboBox; vpTipoCentro : Integer);
  public
    vlCriandoForm, vlAtivandoForm: Boolean;
    { Public declarations }
  end;

var
  frmCadastroRapidoContas: TfrmCadastroRapidoContas;
  vgDuplicarContaId, vgDuplicaCentroCustoId : Integer;
  vgAgendamentoAlterar, vgSalvarNovo : Boolean;
  vgAgendaConc : TAgendaConciliacao;

implementation

uses
  Lookup, Controles, Rotinas, Lookup_Contabil, Lookup_Servico, Pessoa,
  PessoaPreCadastro, LookupFinanceiro, Cadastro, CentroCustoPersonalizado,
  CadPlanoContas, Pesquisa, CadBasico;

{$R *.dfm}

procedure TfrmCadastroRapidoContas.AtualizarCentroCustoReserva(vpSimpleDataSet : TSimpleDataSet; vpClientDataSet : TClientDataSet;
        vpLookup : TcxDBLookupComboBox; vpTipoCentro : Integer);
begin
  pnlCentroMsg.Caption := '';
  if vpLookup.EditValue = null then
    exit;

  if vgCentroCusto.Cancelado then
  begin
    if vgDuplicaCentroCustoId = 0 then
      dtmLookupFinanceiro.VerificarCentroCustoReserva(ClientAncestralLIVRO_AGENDAMENTO_ID.AsInteger, vpClientDataSet, IntToStr(vpTipoCentro))
    else
    begin
      dtmLookupFinanceiro.VerificarCentroCustoReserva(vgDuplicaCentroCustoId, vpClientDataSet, IntToStr(vpTipoCentro));
      vgCentroCusto.Confirmado := True;
    end;
  end;

  pnlCentroMsg.Caption := dtmLookupFinanceiro.VerificarPreenchimentoCentroCusto(IntToStr(vpLookup.EditValue),
                                                              vpSimpleDataSet.FieldByName('TIPO_ITEM').AsString, vpClientDataSet);
  if not vpClientDataSet.IsEmpty then
    exit;

  if vpSimpleDataSet.FieldByName('TIPO_ITEM').AsString = '3' then
  begin
    Application.MessageBox('Nenhum Item vinculado!!!', 'Atenção', mb_Ok + MB_ICONEXCLAMATION);
    vpLookup.EditValue := null;
  end;
  vpLookup.SetFocus;
end;

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

procedure TfrmCadastroRapidoContas.btnCancelarClick(Sender: TObject);
begin
  vgDadosCadastro.ChaveIdPrincipal := 0;
  vgDadosCadastro.Confirmado       := False;
  inherited;
end;

procedure TfrmCadastroRapidoContas.btnCentroPersonalizadoClick(Sender: TObject);
begin
  inherited;
  VerificarCentroPersonalizado(sqlCentroCustoAtivo, lcxCentroCusto, 1);
end;

procedure TfrmCadastroRapidoContas.btnConfirmarClick(Sender: TObject);
begin
  SalvarRegistro;
  vgDadosCadastro.SalvarNovo := True;
  if ClientAncestral.State in [dsInsert] then
    ClientAncestral.Fields[0].AsInteger := dtmControles.GerarSequencia
        (vgDadosCadastro.Tabela);
  ClientAncestral.ApplyUpdates(-1);
  vgDadosCadastro.ChaveIdPrincipal := ClientAncestral.Fields[0].AsInteger;

  vgCentroCusto.Confirmado := True;
  if sqlCentroCustoAtivoTIPO_ITEM.AsString = '3' then
       dtmLookupFinanceiro.GravarCentroCustoReserva(vgDadosCadastro.ChaveIdPrincipal, 'LIVRO_AGENDAMENTO_ID','1', dtmLookupFinanceiro.ClientCentroCustos)
  else dtmLookupFinanceiro.ApagarCentroCustoReserva('LIVRO_AGENDAMENTO_ID', '1', dtmLookupFinanceiro.ClientCentroCustos, vgDadosCadastro.ChaveIdPrincipal);

  if sqlCentroReservaTIPO_ITEM.AsString = '3' then
       dtmLookupFinanceiro.GravarCentroCustoReserva(vgDadosCadastro.ChaveIdPrincipal, 'LIVRO_AGENDAMENTO_ID','2', dtmLookupFinanceiro.ClientCentroReserva)
  else dtmLookupFinanceiro.ApagarCentroCustoReserva('LIVRO_AGENDAMENTO_ID', '2', dtmLookupFinanceiro.ClientCentroReserva, vgDadosCadastro.ChaveIdPrincipal);

  inherited;
  close;
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
begin
  vgSalvarNovo := True;
  btnConfirmarClick(self);
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
  CadPessoa(True);
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
  CadPessoa(True);

  if vgPessoa.PessoaId > 0 then
    ClientAncestralPESSOA_ID.AsInteger := vgPessoa.PessoaId;
end;

procedure TfrmCadastroRapidoContas.btnPessoaPesquisarClick(Sender: TObject);
var
  viChave : String;
begin
  inherited;
  viChave := PesqPessoa();
  if viChave <> '' then
    ClientAncestralPESSOA_ID.AsInteger := StrToInt(viChave);
end;

procedure TfrmCadastroRapidoContas.btnPlanoContasClick(Sender: TObject);
begin
  inherited;
  if lcxGrupoContabil.EditValue <> null then
  begin
    vgGrupoContabilIDIncluir := sqlGrupoContabilCONTABIL_GRUPO_ID.AsInteger;
    vgGrupoContabilOperacao  := icxOperacao.ItemIndex;
  end;

  CadastroPlanoContas(True);
  sqlPlanoContas.Refresh;
  if lcxGrupoContabil.EditValue <> null then
    ClientAncestralCONTABIL_CONTA_ID.AsInteger := vgGrupoContabilIDIncluir;
  vgGrupoContabilIDIncluir := 0;
end;

procedure TfrmCadastroRapidoContas.btnCentroReservaPersClick(Sender: TObject);
begin
  inherited;
  VerificarCentroPersonalizado(sqlCentroReserva, lcxReserva, 2);
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
  vgSalvarNovo   := False;
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
  lcxClientePropertiesEditValueChanged(Self);
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
      ClientAncestralOPERACAO.AsVariant           := FieldByName('OPERACAO').AsVariant;
      ClientAncestralDATA_INICIAL.AsVariant       := FieldByName('DATA_INICIAL').AsVariant;
      ClientAncestralDATA_FINAL.AsVariant         := FieldByName('DATA_FINAL').AsVariant;
      ClientAncestralPERIODO.AsVariant            := FieldByName('PERIODO').AsVariant;
      ClientAncestralVALOR_PARCELA.AsVariant      := FieldByName('VALOR_PARCELA').AsVariant;
      ClientAncestralQTD.AsVariant                := FieldByName('QTD').AsVariant;

      if vlPermitirAtivarAgendamento then
           ClientAncestralSITUACAO.AsVariant      := '1'
      else ClientAncestralSITUACAO.AsString       := '0';

      ClientAncestralESPECIE.AsVariant            := FieldByName('ESPECIE').AsVariant;
      ClientAncestralHISTORICO.AsVariant          := FieldByName('HISTORICO').AsVariant;
      ClientAncestralOBSERVACAO.AsVariant         := FieldByName('OBSERVACAO').AsVariant;
      ClientAncestralBALANCETE_GRUPO_ID.AsVariant := FieldByName('BALANCETE_GRUPO_ID').AsVariant;
      ClientAncestralCONTABIL_GRUPO_ID.AsVariant  := FieldByName('CONTABIL_GRUPO_ID').AsVariant;
      ClientAncestralCONTABIL_CONTA_ID.AsVariant  := FieldByName('CONTABIL_CONTA_ID').AsVariant;
      ClientAncestralPESSOA_ID.AsVariant          := FieldByName('PESSOA_ID').AsVariant;
      ClientAncestralDATA_REGISTRO.AsDateTime     := dtmControles.DataHoraBanco(3);
      ClientAncestralVALOR_PROLABORE.AsVariant    := FieldByName('VALOR_PROLABORE').AsVariant;
      ClientAncestralCENTRO_CUSTO_ID.AsVariant    := FieldByName('CENTRO_CUSTO_ID').AsVariant;
      ClientAncestralCENTRO_RESERVA_ID.AsVariant  := FieldByName('CENTRO_RESERVA_ID').AsVariant;
      ClientAncestralORCAMENTO_ID.AsVariant       := FieldByName('ORCAMENTO_ID').AsVariant;
      ClientAncestralDOC_TIPO.AsVariant           := FieldByName('DOC_TIPO').AsVariant;
      ClientAncestralTIPO_MODALIDADE_ID.AsVariant := FieldByName('TIPO_MODALIDADE_ID').AsVariant;
      ClientAncestralTIPO.AsVariant               := FieldByName('TIPO').AsVariant;
      ClientAncestralCNJ.AsVariant                := FieldByName('CNJ').AsVariant;
      ClientAncestralCAIXA_ID.AsVariant           := FieldByName('CAIXA_ID').AsVariant;
      ClientAncestralREFERENCIA_TIPO.AsVariant    := FieldByName('REFERENCIA_TIPO').AsVariant;
      ClientAncestralREFERENCIA_PERIODO.AsVariant := FieldByName('REFERENCIA_PERIODO').AsVariant;
      ClientAncestralCONTABIL_RL.AsVariant        := FieldByName('CONTABIL_RL').AsVariant;

      if vlPermitirAtivarAgendamento then
           ClientAncestralSITUACAO.AsString := '1'
      else ClientAncestralSITUACAO.AsString := '0';

      icxOperacao.Enabled := False;
      tabBalancete.TabIndex := FieldByName('BALANCETE_GRUPO_ID').AsInteger - 1;

      if ClientAncestralDATA_FINAL.IsNull then
        icxTipo.ItemIndex := 0
      else
        icxTipo.ItemIndex := 1;
      tabBalanceteChange(Self);
      vgDuplicaCentroCustoId   := FieldByName('LIVRO_AGENDAMENTO_ID').AsInteger;
      vgCentroCusto.Confirmado := True;
      VerificarItensCentroCustoReserva(sqlCentroCustoAtivo, lcxCentroCusto, vgDuplicaCentroCustoId, 1);
      VerificarItensCentroCustoReserva(sqlCentroReserva, lcxReserva, vgDuplicaCentroCustoId, 2);
      close;
    end;
  end;

  procedure ValidarCampos;
  var
    viDataVencimento : String;
  begin
    icxOperacao.Enabled        := False;
    tabBalancete.TabIndex      := ClientAncestralBALANCETE_GRUPO_ID.AsInteger - 1;
    pnlMsgAlteracao.Visible    := not vgAgendamentoAlterar;
    pnlDadosPrincipais.Enabled := vgAgendamentoAlterar and (ClientAncestralSITUACAO.AsInteger < 2);
    pnlDadosPermitidos.Enabled := (ClientAncestralSITUACAO.AsInteger < 2);
    pnlDadosValores.Enabled    := vgAgendamentoAlterar and (ClientAncestralSITUACAO.AsInteger < 2);
    cbxParcelas.Enabled        := vgAgendamentoAlterar;
    btnConfirmar.Enabled       := pnlDadosPermitidos.Enabled;

    tabContasFixa.Enabled         := (vgAgendamentoAlterar) or ((icxTipo.EditValue = '1') and (ClientAncestralSITUACAO.AsInteger < 2));
    pnlDespesasLimitadas.Enabled  := tabContasFixa.Enabled;
    tabContasClientes.Enabled     := tabContasFixa.Enabled;

    if not pnlDadosValores.Enabled then
    begin
      viDataVencimento := dtmControles.GetStr(' SELECT MIN(DATA_VENCIMENTO) FROM J_LIVRO_FINANCEIRO '+
                                              ' WHERE LIVRO_AGENDAMENTO_ID = '+ClientAncestralLIVRO_AGENDAMENTO_ID.AsString+
                                              '   AND SITUACAO IN (1,2)');
      if viDataVencimento <> '' then
        ClientAncestralCALC_DATAPROX_VENC.AsDateTime := StrToDate(viDataVencimento);

      edtDataVencimentoFixa.DataBinding.DataField := 'CALC_DATAPROX_VENC';
      vlDataProxima := edtDataVencimentoFixa.Date;
    end;

    if not vgAgendamentoAlterar then
    begin
      case ClientAncestralSITUACAO.AsInteger of
        1   : begin
                pnlMsgAlteracao.Caption    := 'Já existe(m) itens pagos com este agendamento. Alteração liberada somente para alguns itens, ou cancele e cria um novo';
                pnlDadosPrincipais.Color   := $00C4E1E1;
                pnlDadosValores.Color      := $00C4E1E1;
                pnlDespesasLimitadas.Color := $00C4E1E1;
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
  vgDuplicaCentroCustoId := 0;
  inherited;

  Screen.Cursor := crHourGlass;
  dtmLookupContabil.CarregarTabBalancete(tabBalancete);
  sqlPlanoContas.Connection      := dtmControles.DB;
  sqlGrupoContabil.Connection    := dtmControles.DB;
  sqlTipoModalidade.Connection   := dtmControles.DB;
  sqlCentroReserva.Connection    := dtmControles.DB;
  sqlCentroCustoAtivo.Connection := dtmControles.DB;
  vlPermitirAtivarAgendamento    := dtmControles.CodPermissao('ESP_ATIVAR_AGENDAMENTO')[6] = '1';

  tabRefData.TabVisible := icxTipo.ItemIndex = 1;
  tabRefAno.TabVisible  := icxTipo.ItemIndex = 0;

  dtmLookupServico.ClientParcelas.Filtered := False;
  pnlSalvarComo.Visible := (ClientAncestral.State in [dsInsert]) and (vgDuplicarContaId = 0);
  if ClientAncestral.State in [dsInsert] then
  begin
    if vgDuplicarContaId = 0 then
    begin
      icxTipo.ItemIndex := 0;
      if vlPermitirAtivarAgendamento then
           ClientAncestralSITUACAO.AsString := '1'
      else ClientAncestralSITUACAO.AsString := '0';

      ClientAncestralESPECIE.AsString  := 'D';

      if vgAgendaConc.Conciliacao then
      begin
        ClientAncestralOPERACAO.AsString  := vgAgendaConc.Operacao;
        ClientAncestralCAIXA_ID.AsInteger := vgAgendaConc.CaixaId;
        ClientAncestralHISTORICO.AsString := vgAgendaConc.Historico;
        icxTipo.ItemIndex                 := 3;
        icxTipo.Enabled                   := False;
        lcxCaixa.Enabled                  := False;
      end
      else
      begin
        ClientAncestralOPERACAO.AsString := 'D';
        ClientAncestralCAIXA_ID.AsInteger := vgCaixaPrincipalID;
        icxTipo.Properties.Items[2].Destroy;
      end;

      ClientAncestralDOC_TIPO.AsString := 'F';
      ClientAncestralDATA_REGISTRO.AsDateTime := dtmControles.DataHoraBanco(3);
      ClientAncestralCENTRO_CUSTO_ID.AsInteger:= vgCentroCustoPrincipal[tabBalancete.TabIndex];
      ClientAncestralQtd.AsInteger := 1;
      ClientAncestralREFERENCIA_TIPO.AsString     := '1';
      ClientAncestralREFERENCIA_PERIODO.AsString  := '1';
      ClientAncestralUSUARIO_ID.AsString          := vgUsuarioID;
      ClientAncestralCONTABIL_RL.AsString         := 'N';
    end
    else DuplicarConta;
    tabBalanceteChange(Self);
    pnlMsgAlteracao.Visible := False;
  end
  else
  begin
    tabBalancete.TabIndex := dtmLookupContabil.SetarBalanceteItem(ClientAncestralBALANCETE_GRUPO_ID.AsInteger);

    if ClientAncestralDATA_FINAL.IsNull then
      icxTipo.ItemIndex := 0
    else
      icxTipo.ItemIndex := 1;
    tabBalanceteChange(Self);
    ValidarCampos;
  end;

  if (vgDuplicarContaId = 0) and (not (ClientAncestral.State in [dsInsert])) then
  begin
    VerificarItensCentroCustoReserva(sqlCentroCustoAtivo, lcxCentroCusto, ClientAncestralLIVRO_AGENDAMENTO_ID.AsInteger, 1);
    VerificarItensCentroCustoReserva(sqlCentroReserva, lcxReserva, ClientAncestralLIVRO_AGENDAMENTO_ID.AsInteger, 2);
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
  // Somente JUridico
  tabContasClientes.TabVisible := False;

  tabContasLimitadas.TabVisible := (icxTipo.ItemIndex = 1);
  tabContasFixa.TabVisible := (icxTipo.ItemIndex = 0);
  chxReceberCliente.Enabled := (icxOperacao.editValue = 'D');
//  icxTipo.Enabled := (viBalancete <> 3);
//  lcxCliente.Enabled := (viBalancete <> 3);

//  viClienteText := 'Cliente';
 // if viBalancete = 3 then
 //   icxTipo.ItemIndex := 1;

  if icxOperacao.editValue = 'D' then
  begin
    viCaption := 'Despesa';
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
    if tabContasFixa.TabVisible then
       pgcDados.ActivePage := tabContasFixa
  else pgcDados.ActivePage := tabOrcamento;

  if (pgcDados.ActivePage <> tabContasLimitadas) and (not vlAtivandoForm) then
    ClientAncestralPERIODO.AsInteger := 1;

  icxProLaborePeriodoPropertiesEditValueChanged(Self);
end;

procedure TfrmCadastroRapidoContas.icxDocTipoPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  edtDocTipo.Enabled := icxDocTipo.EditValue <> '0';
  if (not edtDocTipo.Enabled) and (ClientAncestral.State in [dsEdit, dsInsert]) then
   ClientAncestralDOCUMENTO_NUMERO.AsVariant := null;
end;

procedure TfrmCadastroRapidoContas.icxOperacaoPropertiesChange(Sender: TObject);
begin
  inherited;
  if vlCriandoForm then
    exit;

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
    frmCadastroRapidoContas.Height := 615;
    dtmLookupServico.SomarGridValores(ClientAncestral, vlCriandoForm, edtTotalParcelas, edtRestante, 1);
  end
  else
    frmCadastroRapidoContas.Height := 425;

  if vlAtivandoForm then
    exit;

  if ClientAncestral.State in [dsEdit, dsInsert] then
    ClientAncestralQTD.AsInteger := 1;
end;

procedure TfrmCadastroRapidoContas.icxTipoPropertiesChange(Sender: TObject);
begin
  inherited;
  tabBalanceteChange(self);

  tabRefData.TabVisible      := icxTipo.ItemIndex = 1;
  tabRefAno.TabVisible       := (icxTipo.ItemIndex in [1,3]);
  chxRegistroParcial.Enabled := (icxTipo.ItemIndex in [1,2]);

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

procedure TfrmCadastroRapidoContas.lcxCentroCustoPropertiesChange(
  Sender: TObject);
begin
  inherited;
  if lcxCentroCusto.Text = '' then
       tabCentroCustos.Caption := 'Vincular Centro Custo'
  else tabCentroCustos.Caption := 'Centro Custo '+lcxCentroCusto.Text;
end;

procedure TfrmCadastroRapidoContas.lcxCentroCustoPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  VerificarCentroCustoReserva(sqlCentroCustoAtivo, dtmLookupFinanceiro.ClientCentroCustos, lcxCentroCusto, 1);
end;

procedure TfrmCadastroRapidoContas.lcxClientePropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  btnPessoaAlterar.Enabled := lcxCliente.EditValue <> null;

  if dtmLookupContabil.sqlPessoasTodasUTILIZA_BOLETO.AsString = 'S' then
       lblCliente.Caption := 'Favorecido - Permite Emissão de Boleto!'
  else lblCliente.Caption := 'Favorecido';
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
    ClientAncestralCNJ.AsString := sqlPlanoContasCNJ.AsString;
  end;
end;

procedure TfrmCadastroRapidoContas.lcxGrupoContabilPropertiesEditValueChanged(Sender: TObject);
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

procedure TfrmCadastroRapidoContas.lcxOrcamentoPropertiesChange(
  Sender: TObject);
begin
  inherited;
  if lcxOrcamento.Text = '' then
       tabOrcamento.Caption := 'Vincular Orçamento'
  else tabOrcamento.Caption := 'Orçamento '+dtmLookupFinanceiro.sqlOrcamentoHISTORICO.AsString;

  tabOrcamento.Highlighted := lcxOrcamento.Text <> '';
end;

procedure TfrmCadastroRapidoContas.lcxReservaPropertiesChange(Sender: TObject);
begin
  inherited;
  if lcxReserva.Text = '' then
       tabReserva.Caption := 'Vincular Reserva/Provisão'
  else tabReserva.Caption := lcxReserva.Text;

  tabReserva.Highlighted := lcxReserva.Text <> '';
end;

procedure TfrmCadastroRapidoContas.lcxReservaPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  VerificarCentroCustoReserva(sqlCentroReserva, dtmLookupFinanceiro.ClientCentroReserva, lcxReserva, 2);
end;

procedure TfrmCadastroRapidoContas.pgcDadosChange(Sender: TObject);
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

procedure TfrmCadastroRapidoContas.SalvarRegistro(vpSalvarComo: Boolean);

  procedure ValidarAlteracaoData;
  var
    viAnoMesAntes, viAnoMesNovo, viAnoMes : String;
  begin
    if (not vgAgendamentoAlterar) and (icxTipo.ItemIndex = 0) then
    begin
      if (edtDataVencimentoFixa.Date <> vlDataProxima) then
      begin
        viAnoMesAntes := PegarAnoMes(DateToStr(vlDataProxima));
        viAnoMesNovo  := PegarAnoMes(DateToStr(edtDataVencimentoFixa.Date));
        viAnoMes      := Copy(viAnoMesNovo,5,2) + '/'+ Copy(viAnoMesNovo,1,4);

        if viAnoMesAntes > viAnoMesNovo then
        begin
          Application.MessageBox(Pchar('O próximo vencimento deve ser igual ou maior que '+viAnoMes+'.'), 'Atenção', mb_Ok + MB_ICONEXCLAMATION);
          pgcDados.ActivePageIndex := 0;
          edtDataVencimentoFixa.Date;
          Abort;
        end
        else
        begin
          vgAgendamentoAlterar := True;
          ClientAncestralDATA_INICIAL.AsDateTime := edtDataVencimentoFixa.Date;
        end;
      end;
    end;
  end;

begin
  pgcDados.ActivePageIndex := StrToInt(icxTipo.EditValue)-1;

  VerificarPreenchimentoLCX_DB(lcxCompromisso.Text, 'Compromisso', lcxCompromisso);
  VerificarPreenchimentoLCX_DB(lcxCliente.Text, lblCliente.Caption, lcxCliente);
  VerificarPreenchimentoEDT_DB(edtHistorico.Text, 'Histórico', edtHistorico);
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

  VerificarPreenchimentoLCX_DB(lcxModalodadeCompromisso.Text, 'Modalidade do Compromisso', lcxModalodadeCompromisso);

  if lcxReserva.Text = '' then
    pgcDados.ActivePage := tabReserva;
  VerificarPreenchimentoLCX_DB(lcxReserva.Text, 'Reserva/Provisão', lcxReserva);

  if lcxCentroCusto.Text = '' then
    pgcDados.ActivePage := tabCentroCustos;
  VerificarPreenchimentoLCX_DB(lcxCentroCusto.Text, 'Centro de Custos', lcxCentroCusto);

  if edtProLaboreQtdParcela.editValue = 0 then
    ClientAncestralQtd.AsInteger := 1;

  if ClientAncestralPERIODO.AsInteger in [1, 6] then
    ClientAncestralDATA_FINAL.AsVariant := null;

  ClientAncestralBalancete_Grupo_Id.AsInteger := vgTabBalancete[tabBalancete.TabIndex];
  vlContratoItemParcela := (dtmLookupServico.ClientParcelas.RecordCount > 0) and (icxProLaborePeriodo.EditValue = 9);
  ValidarAlteracaoData;
end;

procedure TfrmCadastroRapidoContas.tabBalanceteChange(Sender: TObject);
begin
  inherited;
  sqlGrupoContabil.Active := False;
  sqlCentroReserva.Active := False;
  if icxOperacao.Text = '' then
    exit;

  sqlGrupoContabil.DataSet.ParamByName('TIPO').AsString := IntToStr((icxOperacao.ItemIndex + 1));
  sqlGrupoContabil.DataSet.ParamByName('BALANCETE_GRUPO_ID').AsInteger := vgTabBalancete[tabBalancete.TabIndex];
  sqlGrupoContabil.Active := True;

  sqlTipoModalidade.Active := False;
  sqlTipoModalidade.DataSet.ParamByName('TIPO').AsString := icxOperacao.EditValue;
  sqlTipoModalidade.Active := True;
  if sqlTipoModalidade.RecordCount = 1 then
    ClientAncestralTIPO_MODALIDADE_ID.AsInteger := sqlTipoModalidadeTIPO_MODALIDADE_ID.AsInteger;

  sqlCentroCustoAtivo.Active := False;
  sqlCentroCustoAtivo.DataSet.ParamByName('BALANCETE_GRUPO_ID').AsInteger := vgTabBalancete[tabBalancete.TabIndex];
  sqlCentroCustoAtivo.Active := True;
  if (sqlCentroCustoAtivo.RecordCount = 1) and (ClientAncestralCENTRO_CUSTO_ID.AsVariant = null) then
    ClientAncestralCENTRO_CUSTO_ID.AsInteger := sqlCentroCustoAtivoCENTRO_CUSTO_ID.AsInteger;

  sqlCentroReserva.Active := False;
  sqlCentroReserva.DataSet.ParamByName('BALANCETE_GRUPO_ID').AsInteger := vgTabBalancete[tabBalancete.TabIndex];
  sqlCentroReserva.Active := True;
  if (sqlCentroReserva.RecordCount = 1) AND (ClientAncestralCENTRO_RESERVA_ID.AsVariant = null)  then
    ClientAncestralCENTRO_RESERVA_ID.AsInteger := sqlCentroReservaCENTRO_CUSTO_ID.AsInteger;

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

procedure TfrmCadastroRapidoContas.tabBalanceteChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if (not vlCriandoForm) then
    if not pnlDadosPrincipais.Enabled then
      Abort;

  inherited;

end;

procedure TfrmCadastroRapidoContas.VerificarCentroCustoReserva(vpSimpleDataSet : TSimpleDataSet; vpClientDataSet : TClientDataSet;
        vpLookup : TcxDBLookupComboBox;  vpTipoCentro : Integer);
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

procedure TfrmCadastroRapidoContas.VerificarCentroPersonalizado(vpSimpleDataSet : TSimpleDataSet;
        vpLookup : TcxDBLookupComboBox; vpTipoCentro : Integer);
begin
  vgDadosCadastro.SalvarNovo := False;
  vgCentroCusto.BalanceteId  := vgTabBalancete[tabBalancete.TabIndex];
  vgCentroCusto.Cancelado    := False;
  vgCentroCusto.Agendamento  := True;
  vgCentroCusto.TipoCentro   := vpTipoCentro;

  case vpTipoCentro of
    1 : vgCentroCusto.ClientCentro := dtmLookupFinanceiro.ClientCentroCustos;
    2 : vgCentroCusto.ClientCentro := dtmLookupFinanceiro.ClientCentroReserva;
  end;
  ExibirFormulario(TfrmCentroCustoPersonalizado, frmCentroCustoPersonalizado, true);
  AtualizarCentroCustoReserva(vpSimpleDataSet, vgCentroCusto.ClientCentro, vpLookup, vpTipoCentro);
end;

procedure TfrmCadastroRapidoContas.VerificarItensCentroCustoReserva(vpSimpleDataSet : TSimpleDataSet;
        vpLookup : TcxDBLookupComboBox; vpId, vpTipoCentro : Integer);
begin
  vgCentroCusto.Agendamento := True;
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

  if vpLookup.EditValue <> null then
    pnlCentroMsg.Caption := dtmLookupFinanceiro.VerificarPreenchimentoCentroCusto(IntToStr(vpLookup.EditValue),
                                                                vpSimpleDataSet.FieldByName('TIPO_ITEM').AsString,vgCentroCusto.ClientCentro);

end;

end.










