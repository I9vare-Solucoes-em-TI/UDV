unit CadastroRapidoTransferencia;

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
  TfrmCadastroRapidoTransferencia = class(TfrmCadastroAuxSimplificado)
    tabBalancete: TcxTabControl;
    cxLabel5: TcxLabel;
    cxLabel4: TcxLabel;
    dtsPlanoContas: TDataSource;
    sqlPlanoContas: TSimpleDataSet;
    sqlPlanoContasCONTABIL_CONTA_ID: TFMTBCDField;
    sqlPlanoContasDESCRICAO: TStringField;
    cxLabel6: TcxLabel;
    lcxCompromisso: TcxLookupComboBox;
    edtHistorico: TcxTextEdit;
    edtDetalhe: TcxTextEdit;
    cxGroupBox1: TcxGroupBox;
    lblDataDespesa: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    lcxContaOrigem: TcxLookupComboBox;
    lcxContaDestino: TcxLookupComboBox;
    edtValor: TcxCurrencyEdit;
    edtDataLancamento: TcxDateEdit;
    sqlPlanoContasCONTABIL_GRUPO_ID: TFMTBCDField;
    pnlSalvarComo: TPanel;
    btnSalvarNovo: TcxButton;
    chxContabilRetiradaLucro: TcxCheckBox;
    pnlAlerta: TPanel;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure tabBalanceteChange(Sender: TObject);
    procedure lcxCompromissoPropertiesEditValueChanged(Sender: TObject);
    procedure icxOperacaoPropertiesChange(Sender: TObject);
    procedure SalvarRegistro(vpSalvarComo : Boolean = False);
    procedure btnSalvarNovoClick(Sender: TObject);
    procedure LimparCampos;
  private
    vlContratoItemParcela : Boolean;

  public
    vlCriandoForm : Boolean;
    { Public declarations }
  end;

var
  frmCadastroRapidoTransferencia: TfrmCadastroRapidoTransferencia;

implementation

uses
  Lookup, Controles, Rotinas,
  Lookup_Contabil, Lookup_Servico, Pessoa, PessoaPreCadastro,
  ValidarPermissaoUsuario, LookupFinanceiro;

{$R *.dfm}

procedure TfrmCadastroRapidoTransferencia.btnConfirmarClick(Sender: TObject);
begin
  SalvarRegistro;
  vgDadosLivroCaixa.Confirmado := True;
  vgDadosCadastro.Confirmado   := True;
  Close;
  inherited;
end;

procedure TfrmCadastroRapidoTransferencia.btnSalvarNovoClick(Sender: TObject);
begin
  SalvarRegistro;
  vgDadosLivroCaixa.Confirmado := True;
  vgDadosCadastro.Confirmado   := True;
  LimparCampos;
  FormCreate(self);
  FormActivate(self);
  inherited;
end;

procedure TfrmCadastroRapidoTransferencia.FormActivate(Sender: TObject);
begin
  inherited;
  vlCriandoForm := False;
  icxOperacaoPropertiesChange(Self);

  if vgAgendaConc.Conciliacao then
  begin
    edtHistorico.EditValue      := vgAgendaConc.Historico ;
    edtValor.EditValue          := vgAgendaConc.Valor;
    edtDataLancamento.EditValue := vgAgendaConc.Data;

    if vgAgendaConc.Operacao = 'R' then
         lcxContaDestino.EditValue := vgAgendaConc.CaixaId
    else lcxContaOrigem.EditValue  := vgAgendaConc.CaixaId;

    lcxContaOrigem.Enabled      := vgAgendaConc.Operacao = 'R';
    lcxContaDestino.Enabled     := vgAgendaConc.Operacao = 'D';

    edtValor.Enabled            := False;
    edtDataLancamento.Enabled   := False;
    edtDetalhe.SetFocus;
  end
  else lcxCompromisso.SetFocus;
end;

procedure TfrmCadastroRapidoTransferencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  vgDadosCadastro.SomentePesquisa := False;
  vgDadosCadastro.AtualizarSaldo  := True;

  dtmLookupFinanceiro.AbrirFecharTelaBranco(False);
  Action := caFree;
  frmCadastroRapidoTransferencia := nil;
end;

procedure TfrmCadastroRapidoTransferencia.FormCreate(Sender: TObject);
var
  viCaixaId : Integer;
begin
  dtmLookupFinanceiro.AbrirFecharTelaBranco;

  vlCriandoForm := True;
  vgDadosLivroCaixa.Confirmado := False;
  tabBalancete.HideTabs        := True;
  pnlSalvarComo.Visible        := vgDadosLivroCaixa.Novo;
  inherited;

  sqlPlanoContas.Connection := dtmControles.DB;
  dtmLookupContabil.CarregarTabBalancete(tabBalancete);

  if vgDadosLivroCaixa.Novo then
  begin
    edtDataLancamento.EditValue       := dtmControles.DataHoraBanco(3);
    edtDetalhe.EditValue              := '';
    chxContabilRetiradaLucro.Checked  := False;

    if vgPermissaoInterno then
    begin
      lcxContaOrigem.RepositoryItem  := dtmLookupContabil.Lista_CaixaTodosAtivos;
      lcxContaDestino.RepositoryItem := dtmLookupContabil.Lista_CaixaTodosAtivos;
    end;
  end
  else
  begin
    edtDataLancamento.EditValue := vgDadosLivroCaixa.DataPagamento;
    edtDetalhe.EditValue        := vgDadosLivroCaixa.Observacao;
    lcxCompromisso.EditValue    := vgDadosLivroCaixa.ContabilContaID;
    edtHistorico.EditValue      := vgDadosLivroCaixa.Historico;
    edtValor.EditValue          := vgDadosLivroCaixa.ValorCompromisso;

    if vgDadosLivroCaixa.ContabilRL = 'S' then
         chxContabilRetiradaLucro.Checked := True
    else chxContabilRetiradaLucro.Checked := False;

    lcxContaOrigem.RepositoryItem  := dtmLookupContabil.Lista_CaixaTodosAtivos;
    lcxContaDestino.RepositoryItem := dtmLookupContabil.Lista_CaixaTodosAtivos;

    // Pegar o Caixa de Oriem e Caixa de Destino
    ExecutaSqlAuxiliar(' SELECT CAIXA_ID, OPERACAO FROM J_LIVRO_CAIXA WHERE CAIXA_TRANSFERENCIA_ID = '+ IntToStr(vgDadosLivroCaixa.CaixaTransferenciaId),0);
    while not dtmControles.sqlAuxiliar.Eof do
    begin
      if dtmControles.sqlAuxiliar.FieldByName('OPERACAO').AsString = 'TD' then
           lcxContaOrigem.EditValue := dtmControles.sqlAuxiliar.FieldByName('CAIXA_ID').AsInteger
      else lcxContaDestino.EditValue := dtmControles.sqlAuxiliar.FieldByName('CAIXA_ID').AsInteger;
      dtmControles.sqlAuxiliar.Next;
    end;
  end;

  lcxContaOrigem.Enabled    := (vgDadosLivroCaixa.ConciliacaoId = '') and ((not vgDadosLivroCaixa.Automatico) or vgPermissaoInterno);
  lcxContaDestino.Enabled   := (vgDadosLivroCaixa.ConciliacaoId = '') and ((not vgDadosLivroCaixa.Automatico) or vgPermissaoInterno);
  edtValor.Enabled          := (vgDadosLivroCaixa.ConciliacaoId = '') and ((not vgDadosLivroCaixa.Automatico) or vgPermissaoInterno);
  edtDataLancamento.Enabled := (vgDadosLivroCaixa.ConciliacaoId = '') and ((not vgDadosLivroCaixa.Automatico) or vgPermissaoInterno);
  pnlAlerta.Visible         := (vgDadosLivroCaixa.ConciliacaoId <> '') or (vgDadosLivroCaixa.Bloqueado) or (vgDadosLivroCaixa.Automatico  or (not vgPermissaoInterno));

  if vgDadosLivroCaixa.Bloqueado then
       pnlAlerta.Caption := 'ALTERA��O N�O PERMITIDA. '+vgDadosLivroCaixa.MensagemBloqueado
  else pnlAlerta.Caption := vgDadosLivroCaixa.MensagemBloqueado;

  if (vgDadosLivroCaixa.Bloqueado) or (vgDadosLivroCaixa.ConciliacaoId <> '') then
  begin
    Panel2.Color  := clRed;
    Panel4.Color  := clRed;
    lblInformaca.Style.Color     := clRed;
    lblInformaca.Style.TextColor := clWhite;
  end;

end;

procedure TfrmCadastroRapidoTransferencia.icxOperacaoPropertiesChange(Sender: TObject);
begin
  inherited;
  if vlCriandoForm then
    exit;
  tabBalanceteChange(self);
end;

procedure TfrmCadastroRapidoTransferencia.lcxCompromissoPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if vlCriandoForm then
    exit;
  edtHistorico.Text := lcxCompromisso.Text;
end;

procedure TfrmCadastroRapidoTransferencia.LimparCampos;
begin
  vgDadosLivroCaixa.ContabilContaID := 0;
  vgDadosLivroCaixa.Historico := '';

  lcxCompromisso.EditValue   := null;
  lcxContaOrigem.EditValue   := null;
  lcxContaDestino.EditValue  := null;
  edtHistorico.Clear;
  edtDetalhe.Clear;
  edtValor.Clear;
  edtDataLancamento.Clear;
end;

procedure TfrmCadastroRapidoTransferencia.SalvarRegistro(vpSalvarComo: Boolean);
var
  viSituacao, viConciliacaoId : String;
  viTransferenciaId1, viTransferenciaId2, viLivroCaixaOrigem : Integer;

  {$REGION 'Validar'}
  procedure Validar;
  begin
    VerificarPreenchimentoLCX_TX(lcxCompromisso.Text, 'Compromisso', lcxCompromisso);
    VerificarPreenchimentoEDT_TX(edtHistorico.Text, 'Hist�rico', edtHistorico);
    VerificarPreenchimentoLCX_TX(lcxContaOrigem.Text, 'Conta Origem', lcxContaOrigem);
    VerificarPreenchimentoLCX_TX(lcxContaDestino.Text, 'Conta Destino', lcxContaDestino);
    VerificarPreenchimentoDTA_TX(edtDataLancamento.Text, 'Data de Lan�amento', edtDataLancamento);
    VerificarPreenchimentoCUR_TX(edtValor.EditValue, 'Valor', edtValor);

    if (edtValor.EditValue = null) or (edtValor.Text = '') then
    begin
      Application.MessageBox(Pchar('Campo Valor n�o pode ser vazio!!!'), 'Aviso', MB_OK + MB_DEFBUTTON1 + MB_ICONINFORMATION);
      edtValor.SetFocus;
      Abort;
    end;

    if lcxContaOrigem.Text = lcxContaDestino.Text then
    begin
      Application.MessageBox(Pchar('Conta Origem n�o pode ser igual a Conta de Destino!!!'), 'Aviso', MB_OK + MB_DEFBUTTON1 + MB_ICONINFORMATION);
      lcxContaOrigem.SetFocus;
      Abort;
    end;

    if  (FormatDateTime('DD/MM/YYYY',edtDataLancamento.Date) <> dtmControles.DataHoraBanco(4)) AND (vgLogin <> 'TRI7') and (not vgPertmissaoAlteracao) then
    begin
      if Application.MessageBox('Data de Lan�amento Diferente da Data Atual. Solicitar Permiss�o?', 'Confirma��o', MB_YESNO) = IDNO then
        Abort;

      if LiberarPermissaoUsuario('ESP_PERMISSAO_DATA')[6] = '0' then
        Abort;
    end;

    if ((edtDataLancamento.Date + 30) < StrToDate(dtmControles.DataHoraBanco(4))) and (not vgPertmissaoAlteracao)then
    begin
      if Application.MessageBox('Data de Lan�amento inferior a 30 dias. Solicitar Permiss�o?', 'Confirma��o', MB_YESNO) = IDNO then
        Abort;

      if LiberarPermissaoUsuario('ESP_PERMISSAO_DATA')[6] = '0' then
        Abort;
    end;

    if (StrToDate(FormatDateTime('DD/MM/YYYY',edtDataLancamento.Date)) > StrToDate(dtmControles.DataHoraBanco(4))) then
    begin
      Application.MessageBox(Pchar('Data de Lan�amento n�o pode ser maior que a Data Atual!!!'), 'Aviso', MB_OK + MB_DEFBUTTON1 + MB_ICONINFORMATION);
      Abort;
    end;
  end;
  {$ENDREGION}

begin
  Validar;

  if Application.MessageBox('Confirma Transfer�ncia do Valor nas Contas Informadas?',
      'Confirma��o', MB_YESNO) = IDNO then
    Abort;

  dtmControles.StartTransaction;
  try
    viTransferenciaId1 := 0; viTransferenciaId2 := 0;

    viTransferenciaId1 := vgDadosLivroCaixa.CaixaTransferenciaId;
    viConciliacaoId    := vgDadosLivroCaixa.ConciliacaoId;
    dtmLookupContabil.InicializarVariaveisLivroCaixa;
    if not vgDadosLivroCaixa.Novo then
    begin
      vgDadosLivroCaixa.CaixaTransferenciaId := viTransferenciaId1;
      ExecutaSqlAuxiliar(' SELECT LIVRO_CAIXA_ID FROM J_LIVRO_CAIXA WHERE CAIXA_TRANSFERENCIA_ID = '+IntToStr(vgDadosLivroCaixa.CaixaTransferenciaId ),0);
      viTransferenciaId1 := dtmControles.sqlAuxiliar.FieldByName('LIVRO_CAIXA_ID').AsInteger;
      dtmControles.sqlAuxiliar.Next;
      viTransferenciaId2    := dtmControles.sqlAuxiliar.FieldByName('LIVRO_CAIXA_ID').AsInteger;

      ExecutaSqlAuxiliar('DELETE FROM J_LIVRO_CAIXA WHERE CAIXA_TRANSFERENCIA_ID = '+IntToStr(vgDadosLivroCaixa.CaixaTransferenciaId),1);
    end
    else vgDadosLivroCaixa.CaixaTransferenciaId := dtmControles.GerarSequencia('J_CAIXA_TRANSFERENCIA');

    vgDadosLivroCaixa.DataLancamento    := FormatDateTime('DD.MM.YYYY',edtDataLancamento.Date);
    vgDadosLivroCaixa.DataVencimento    := vgDadosLivroCaixa.DataLancamento;
    vgDadosLivroCaixa.DataPagamento     := vgDadosLivroCaixa.DataLancamento;

    vgDadosLivroCaixa.ValorCompromisso      := edtValor.EditValue;
    vgDadosLivroCaixa.ValorPago             := edtValor.EditValue;
    vgDadosLivroCaixa.Especie               := 'D';
    vgDadosLivroCaixa.Referencia            := IntToStr(dtmLookupContabil.PegarAnoMes(DateToStr(edtDataLancamento.Date)));
    vgDadosLivroCaixa.ContabilContaID       := lcxCompromisso.EditValue;
    vgDadosLivroCaixa.ContabilGrupoId       := sqlPlanoContasCONTABIL_GRUPO_ID.AsInteger;
    vgDadosLivroCaixa.CentroCustoId         := vgCentroCustoPrincipal[tabBalancete.TabIndex];
    vgDadosLivroCaixa.BalanceteGrupoId      := vgTabBalancete[tabBalancete.TabIndex];
    vgDadosLivroCaixa.Historico             := edtHistorico.EditValue;
    vgDadosLivroCaixa.AnoMesRegistro        := IntToStr(dtmLookupContabil.PegarAnoMes(vgDadosLivroCaixa.DataPagamento));
    vgDadosLivroCaixa.Observacao            := edtDetalhe.EditValue;
    vgDadosLivroCaixa.ConciliacaoId         := viConciliacaoId;

    if chxContabilRetiradaLucro.Checked then
         vgDadosLivroCaixa.ContabilRL := 'S'
    else vgDadosLivroCaixa.ContabilRL := 'N';

    // Lan�ar Transferencia Debito
    vgDadosLivroCaixa.Operacao := 'TD';
    vgDadosLivroCaixa.CaixaID  := lcxContaOrigem.EditValue;
    dtmLookupContabil.RegistrarRecebimentoFinanceiro(viTransferenciaId1);
    viLivroCaixaOrigem := vgDadosLivroCaixa.LivroCaixaId;

    // Lan�ar Transferencia Cr�dito
    vgDadosLivroCaixa.Operacao   := 'TR';
    vgDadosLivroCaixa.CaixaID    := lcxContaDestino.EditValue;
    dtmLookupContabil.RegistrarRecebimentoFinanceiro(viTransferenciaId2);

    vgDadosLivroCaixa.CaixaTransferenciaId := 0;
    dtmControles.Commit;

    if vgAgendaConc.Operacao = 'D' then
      vgDadosLivroCaixa.LivroCaixaId := viLivroCaixaOrigem;

  except
    dtmControles.Roolback;
    ShowMessage('Problemas na Grava��o. Tente Novamente!!!');
    Abort;
  end;
end;

procedure TfrmCadastroRapidoTransferencia.tabBalanceteChange(Sender: TObject);
VAR
  viOperacao : String;
begin
  inherited;
  sqlPlanoContas.Active := False;
  sqlPlanoContas.DataSet.ParamByName('BALANCETE_GRUPO_ID').AsInteger := vgTabBalancete[tabBalancete.TabIndex];
  sqlPlanoContas.Active := True;
end;

end.