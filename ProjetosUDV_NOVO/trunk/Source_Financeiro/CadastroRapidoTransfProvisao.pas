unit CadastroRapidoTransfProvisao;

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
  TfrmCadastroRapidoTransfProvisao = class(TfrmCadastroAuxSimplificado)
    tabBalancete: TcxTabControl;
    cxLabel4: TcxLabel;
    dtsPlanoContas: TDataSource;
    sqlPlanoContas: TSimpleDataSet;
    sqlPlanoContasCONTABIL_CONTA_ID: TFMTBCDField;
    sqlPlanoContasDESCRICAO: TStringField;
    sqlPlanoContasCONTABIL_GRUPO_ID: TFMTBCDField;
    cxLabel1: TcxLabel;
    lblDataDespesa: TcxLabel;
    edtHistorico: TcxTextEdit;
    edtValor: TcxCurrencyEdit;
    edtDataLancamento: TcxDateEdit;
    cxGroupBox1: TcxGroupBox;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    lcxProvisaoOrigem: TcxLookupComboBox;
    lcxProvisaoDestino: TcxLookupComboBox;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure tabBalanceteChange(Sender: TObject);
    procedure icxOperacaoPropertiesChange(Sender: TObject);
    procedure SalvarRegistro(vpSalvarComo : Boolean = False);
    procedure LimparCampos;
  private
    vlContratoItemParcela : Boolean;

  public
    vlCriandoForm : Boolean;
    { Public declarations }
  end;

var
  frmCadastroRapidoTransfProvisao: TfrmCadastroRapidoTransfProvisao;

implementation

uses
  Lookup, Controles, Rotinas,
  Lookup_Contabil, Lookup_Servico, Pessoa, PessoaPreCadastro,
  ValidarPermissaoUsuario, LookupFinanceiro;

{$R *.dfm}

procedure TfrmCadastroRapidoTransfProvisao.btnConfirmarClick(Sender: TObject);
begin
  SalvarRegistro;
  vgDadosLivroCaixa.Confirmado := True;
  vgDadosCadastro.Confirmado   := True;
  Close;
  inherited;
end;

procedure TfrmCadastroRapidoTransfProvisao.FormActivate(Sender: TObject);
begin
  inherited;
  edtHistorico.SetFocus;

  vlCriandoForm := False;
  icxOperacaoPropertiesChange(Self);
end;

procedure TfrmCadastroRapidoTransfProvisao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  vgDadosCadastro.SomentePesquisa := False;
  vgDadosCadastro.AtualizarSaldo  := True;

  dtmLookupFinanceiro.AbrirFecharTelaBranco(False);
  Action := caFree;
  frmCadastroRapidoTransfProvisao := nil;
end;

procedure TfrmCadastroRapidoTransfProvisao.FormCreate(Sender: TObject);
var
  viCaixaId : Integer;
begin
  dtmLookupFinanceiro.AbrirFecharTelaBranco;

  vlCriandoForm := True;
  vgDadosLivroCaixa.Confirmado := False;
  tabBalancete.HideTabs        := True;
  inherited;

  sqlPlanoContas.Connection := dtmControles.DB;
  dtmLookupContabil.CarregarTabBalancete(tabBalancete);

  if vgDadosLivroCaixa.Novo then
    edtDataLancamento.EditValue := dtmControles.DataHoraBanco(3)
  else
  begin
    edtDataLancamento.EditValue := vgDadosLivroCaixa.DataPagamento;
    edtHistorico.EditValue      := vgDadosLivroCaixa.Historico;
    edtValor.EditValue          := vgDadosLivroCaixa.ValorCompromisso;

    // Pegar o Caixa de Oriem e Caixa de Destino
    ExecutaSqlAuxiliar(' SELECT RESERVA_ID, OPERACAO FROM J_LIVRO_CAIXA WHERE PROVISAO_TRANSFERENCIA_ID = '+ IntToStr(vgDadosLivroCaixa.ProvisaoTransferenciaId),0);
    while not dtmControles.sqlAuxiliar.Eof do
    begin
      if dtmControles.sqlAuxiliar.FieldByName('OPERACAO').AsString = 'PD' then
           lcxProvisaoOrigem.EditValue  := dtmControles.sqlAuxiliar.FieldByName('RESERVA_ID').AsInteger
      else lcxProvisaoDestino.EditValue := dtmControles.sqlAuxiliar.FieldByName('RESERVA_ID').AsInteger;
      dtmControles.sqlAuxiliar.Next;
    end;
  end;
end;

procedure TfrmCadastroRapidoTransfProvisao.icxOperacaoPropertiesChange(Sender: TObject);
begin
  inherited;
  if vlCriandoForm then
    exit;
  tabBalanceteChange(self);
end;

procedure TfrmCadastroRapidoTransfProvisao.LimparCampos;
begin
  vgDadosLivroCaixa.ContabilContaID := 0;
  vgDadosLivroCaixa.Historico := '';

  lcxProvisaoOrigem.EditValue   := null;
  lcxProvisaoDestino.EditValue  := null;
  edtHistorico.Clear;
  edtValor.Clear;
  edtDataLancamento.Clear;
end;

procedure TfrmCadastroRapidoTransfProvisao.SalvarRegistro(vpSalvarComo: Boolean);
var
  viSituacao : String;
  viTransferenciaId1, viTransferenciaId2 : Integer;

  procedure Validar;
  begin
    VerificarPreenchimentoEDT_TX(edtHistorico.Text, 'Hist�rico', edtHistorico);
    VerificarPreenchimentoLCX_TX(lcxProvisaoOrigem.Text, 'Provis�o Origem', lcxProvisaoOrigem);
    VerificarPreenchimentoLCX_TX(lcxProvisaoDestino.Text, 'Provis�o Destino', lcxProvisaoDestino);
    VerificarPreenchimentoDTA_TX(edtDataLancamento.Text, 'Data de Lan�amento', edtDataLancamento);
    VerificarPreenchimentoCUR_TX(edtValor.EditValue, 'Valor', edtValor);

    if (edtValor.EditValue = null) or (edtValor.Text = '') then
    begin
      Application.MessageBox(Pchar('Campo Valor n�o pode ser vazio!!!'), 'Aviso', MB_OK + MB_DEFBUTTON1 + MB_ICONINFORMATION);
      edtValor.SetFocus;
      Abort;
    end;

    if lcxProvisaoOrigem.Text = lcxProvisaoDestino.Text then
    begin
      Application.MessageBox(Pchar('Provis�o de Origem n�o pode ser igual a Provis�o de Destino!!!'), 'Aviso', MB_OK + MB_DEFBUTTON1 + MB_ICONINFORMATION);
      lcxProvisaoOrigem.SetFocus;
      Abort;
    end;

    if  (FormatDateTime('DD/MM/YYYY',edtDataLancamento.Date) <> dtmControles.DataHoraBanco(4)) AND (vgLogin <> 'I937') then
    begin
      if Application.MessageBox('Data de Lan�amento Diferente da Data Atual. Solicitar Permiss�o?', 'Confirma��o', MB_YESNO) = IDNO then
        Abort;

      if LiberarPermissaoUsuario('ESP_PERMISSAO_DATA')[6] = '0' then
        Abort;
    end;

    if ((edtDataLancamento.Date + 30) < StrToDate(dtmControles.DataHoraBanco(4))) then
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
begin
  Validar;

  if Application.MessageBox('Confirma Transfer�ncia do Valor nas Provis�es Informadas?',
      'Confirma��o', MB_YESNO) = IDNO then
    Abort;

  try
    dtmControles.StartTransaction;
    viTransferenciaId1 := 0; viTransferenciaId2 := 0;

    dtmLookupContabil.InicializarVariaveisLivroCaixa;
    if not vgDadosLivroCaixa.Novo then
    begin
      ExecutaSqlAuxiliar(' SELECT LIVRO_CAIXA_ID FROM J_LIVRO_CAIXA WHERE PROVISAO_TRANSFERENCIA_ID = '+IntToStr(vgDadosLivroCaixa.ProvisaoTransferenciaId),0);
      viTransferenciaId1 := dtmControles.sqlAuxiliar.FieldByName('LIVRO_CAIXA_ID').AsInteger;
      dtmControles.sqlAuxiliar.Next;
      viTransferenciaId2    := dtmControles.sqlAuxiliar.FieldByName('LIVRO_CAIXA_ID').AsInteger;

      ExecutaSqlAuxiliar('DELETE FROM J_LIVRO_CAIXA WHERE PROVISAO_TRANSFERENCIA_ID = '+IntToStr(vgDadosLivroCaixa.ProvisaoTransferenciaId),1);
    end
    else vgDadosLivroCaixa.ProvisaoTransferenciaId := dtmControles.GerarSequencia('J_PROVISAO_TRANSFERENCIA');

    vgDadosLivroCaixa.DataLancamento    := FormatDateTime('DD.MM.YYYY',edtDataLancamento.Date);
    vgDadosLivroCaixa.DataVencimento    := vgDadosLivroCaixa.DataLancamento;
    vgDadosLivroCaixa.DataPagamento     := vgDadosLivroCaixa.DataLancamento;

    vgDadosLivroCaixa.ValorCompromisso      := edtValor.EditValue;
    vgDadosLivroCaixa.ValorPago             := edtValor.EditValue;
    vgDadosLivroCaixa.Especie               := 'D';
    vgDadosLivroCaixa.Referencia            := IntToStr(dtmLookupContabil.PegarAnoMes(DateToStr(edtDataLancamento.Date)));
    vgDadosLivroCaixa.PessoaId              := 0;
    vgDadosLivroCaixa.CentroCustoId         := vgCentroCustoPrincipal[tabBalancete.TabIndex];
    vgDadosLivroCaixa.Historico             := edtHistorico.EditValue;
    vgDadosLivroCaixa.AnoMesRegistro        := IntToStr(dtmLookupContabil.PegarAnoMes(vgDadosLivroCaixa.DataPagamento));
    vgDadosLivroCaixa.IR                    := '';
    vgDadosLivroCaixa.DocumentoNumero       := '';
    vgDadosLivroCaixa.DocTipo               := '';
    vgDadosLivroCaixa.ResponsavelId         := 0;
    vgDadosLivroCaixa.CompromissoVencidoId  := 0;
    vgDadosLivroCaixa.TipoDespesaID         := 0;
    vgDadosLivroCaixa.AssociadoId           := 0;
    vgDadosLivroCaixa.AssociadoFavorecido   := '';

    // Lan�ar Transferencia Debito
    vgDadosLivroCaixa.Operacao          := 'PD';
    vgDadosLivroCaixa.CaixaID           := vgCaixaPrincipalID;
    vgDadosLivroCaixa.ReservaId         := lcxProvisaoOrigem.EditValue;
    vgDadosLivroCaixa.BalanceteGrupoId  := dtmControles.GetInt(' SELECT BALANCETE_GRUPO_ID FROM T_RESERVA WHERE RESERVA_ID = '+IntToStr(vgDadosLivroCaixa.ReservaId));
    vgDadosLivroCaixa.Ordem             := dtmControles.GerarSequencia('J_LIVRO_PROVTRANSF_ORDEM');
    dtmLookupContabil.RegistrarRecebimentoFinanceiro(viTransferenciaId1);

    // Lan�ar Transferencia Cr�dito
    vgDadosLivroCaixa.Operacao          := 'PR';
    vgDadosLivroCaixa.ReservaId         := lcxProvisaoDestino.EditValue;
    vgDadosLivroCaixa.BalanceteGrupoId  := dtmControles.GetInt(' SELECT BALANCETE_GRUPO_ID FROM T_RESERVA WHERE RESERVA_ID = '+IntToStr(vgDadosLivroCaixa.ReservaId));
    vgDadosLivroCaixa.Ordem             := dtmControles.GerarSequencia('J_LIVRO_PROVTRANSF_ORDEM');
    dtmLookupContabil.RegistrarRecebimentoFinanceiro(viTransferenciaId2);

    vgDadosLivroCaixa.ProvisaoTransferenciaId := 0;
    dtmControles.Commit;
  except
    on E: Exception do
    begin
      MessageDlg('Erro: ' + E.Message, mtError, [mbOk], 0);
      dtmControles.Roolback;
      Abort;
    end;
  end;
end;

procedure TfrmCadastroRapidoTransfProvisao.tabBalanceteChange(Sender: TObject);
VAR
  viOperacao : String;
begin
  inherited;
  sqlPlanoContas.Active := False;
  sqlPlanoContas.DataSet.ParamByName('BALANCETE_GRUPO_ID').AsInteger := vgTabBalancete[tabBalancete.TabIndex];
  sqlPlanoContas.Active := True;
end;

end.
