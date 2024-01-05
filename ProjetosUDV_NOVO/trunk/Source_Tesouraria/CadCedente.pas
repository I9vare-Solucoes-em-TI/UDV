unit CadCedente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, Menus, cxLookAndFeelPainters, FMTBcd, DB, DBClient,
  Provider, SqlExpr, ActnList, ComCtrls, StdCtrls, cxButtons, ExtCtrls,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxTextEdit, cxDBEdit, cxControls, cxContainer, cxEdit,
  cxLabel, cxGraphics, dxSkinscxPCPainter, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, cxPC, cxImageComboBox,
  cxMaskEdit, cxDropDownEdit, cxGroupBox, cxCheckBox, cxCurrencyEdit, cxSpinEdit,
  SimpleDS, cxCalendar, cxLookAndFeels, dxSkinBlueprint, dxSkinDarkRoom,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinHighContrast, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013White, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSpringTime,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxPCdxBarPopupMenu,
  cxNavigator, dxBarBuiltInMenu, DbxDevartInterBase, System.Actions;

type
  TfrmCadCedente = class(TfrmCadBasico)
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    pgcGrid: TcxPageControl;
    tbcContas: TcxTabSheet;
    grdBasica: TcxGrid;
    grdBasicaDBTableView1: TcxGridDBTableView;
    grdBasicaLevel1: TcxGridLevel;
    tbcBoleto: TcxTabSheet;
    grdBasicaDBTableView1Column1: TcxGridDBColumn;
    grdBasicaDBTableView1Column2: TcxGridDBColumn;
    grdBasicaDBTableView1Column3: TcxGridDBColumn;
    grdBasicaDBTableView1Column5: TcxGridDBColumn;
    ClientAncestralCEDENTE_ID: TFMTBCDField;
    ClientAncestralSITUACAO: TStringField;
    ClientAncestralPRINCIPAL: TStringField;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralUSAR_BOLETO: TStringField;
    ClientAncestralEND_LOG: TStringField;
    ClientAncestralEND_CEP: TStringField;
    ClientAncestralEND_CIDADE: TStringField;
    ClientAncestralEND_BAIRRO: TStringField;
    ClientAncestralEND_UF: TStringField;
    ClientAncestralDB_NOMEBANCO: TStringField;
    ClientAncestralDB_CODIGOBANCO: TStringField;
    ClientAncestralDB_AGENCIA: TStringField;
    ClientAncestralDB_CONTA: TStringField;
    ClientAncestralDB_CODIGOCEDENTE: TStringField;
    ClientAncestralDB_CARTEIRA: TStringField;
    ClientAncestralDB_CONVENIO: TStringField;
    ClientAncestralDB_TAXA: TFMTBCDField;
    ClientAncestralDB_MULTA: TFMTBCDField;
    Panel1: TPanel;
    Bevel1: TBevel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    cxLabel7: TcxLabel;
    lblTaxa: TcxLabel;
    cxLabel4: TcxLabel;
    ClientAncestralSINCRONIZAR_REUNI: TStringField;
    ClientAncestralCOBRAR_MULTA: TStringField;
    ClientAncestralCOBRAR_BOLETO: TStringField;
    grdBasicaDBTableView1Column4: TcxGridDBColumn;
    ClientAncestralPRAZO_PAGAMENTO: TStringField;
    ClientAncestralPRAZO_DIA: TFMTBCDField;
    cxLabel2: TcxLabel;
    sqlRelatorio: TSimpleDataSet;
    dtsRelatorio: TDataSource;
    sqlRelatorioDESCRICAO: TStringField;
    sqlRelatorioCONFIG_RELATORIO_ID: TFMTBCDField;
    ClientAncestralCONFIG_RELATORIO_ID: TFMTBCDField;
    ClientAncestralCONTABIL_CONTA_MULTA_ID: TFMTBCDField;
    ClientAncestralCONTABIL_CONTA_TAXA_ID: TFMTBCDField;
    ClientAncestralDIA_VENCIMENTO_PADRAO: TFMTBCDField;
    ClientAncestralDB_DIGITOCONTA: TStringField;
    ClientAncestralDB_DIGITOCODIGO_CEDENTE: TStringField;
    cxLabel16: TcxLabel;
    ClientAncestralCAIXA_ID: TFMTBCDField;
    ClientAncestralCNPJ_CPF: TStringField;
    cxLabel17: TcxLabel;
    chxCobrarTaxa: TcxDBCheckBox;
    edtValorTaxa: TcxDBCurrencyEdit;
    lcxCaixa: TcxDBLookupComboBox;
    icxPrazo: TcxDBImageComboBox;
    edtPrazo: TcxDBSpinEdit;
    cxDBSpinEdit1: TcxDBSpinEdit;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    ClientAncestralRAZAO_SOCIAL: TStringField;
    edtDescricao: TcxDBTextEdit;
    icxBoleto: TcxDBImageComboBox;
    icxSincronizaReuni: TcxDBImageComboBox;
    chbSituacao: TcxDBCheckBox;
    edtRazao: TcxDBTextEdit;
    edtCPFCNPJ: TcxDBMaskEdit;
    cxGroupBox6: TcxGroupBox;
    lblEndereco: TcxLabel;
    cxLabel34: TcxLabel;
    cxLabel35: TcxLabel;
    cxLabel36: TcxLabel;
    cxLabel38: TcxLabel;
    edtEndereco: TcxDBTextEdit;
    edtBairro: TcxDBTextEdit;
    edtCidade: TcxDBTextEdit;
    edtUF: TcxDBComboBox;
    edtCEP: TcxDBMaskEdit;
    cxLabel39: TcxLabel;
    cxDBTextEdit19: TcxDBTextEdit;
    cxLabel15: TcxLabel;
    ClientAncestralDB_MODALIDADE: TStringField;
    ClientAncestralDB_DIGITOAGENCIA: TStringField;
    cxLabel18: TcxLabel;
    icxBanco: TcxDBImageComboBox;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit9: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextEdit7: TcxDBTextEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    cxDBTextEdit8: TcxDBTextEdit;
    lcxModeloBoleto: TcxDBLookupComboBox;
    btnGravarDados: TcxButton;
    btnLimpar: TcxButton;
    x: TcxDBCheckBox;
    ClientAncestralENDERECO_NUCLEO_ASSOCIADO: TStringField;
    chxTaxaAssociado: TcxDBCheckBox;
    cxLabel19: TcxLabel;
    lcxCompromissoJuros: TcxDBLookupComboBox;
    ClientAncestralDB_LANCAR_TAXAMEDIA_ASSOCIADO: TStringField;
    ClientAncestralCONTABIL_CONTA_JUROS_ID: TFMTBCDField;
    cxLabel20: TcxLabel;
    lcxReservaId: TcxDBLookupComboBox;
    ClientAncestralDB_RESERVA_JUROS_ID: TFMTBCDField;
    ClientAncestralEND_EMAIL: TStringField;
    cxLabel21: TcxLabel;
    icxLayout: TcxDBImageComboBox;
    ClientAncestralLAYOUT_REMESSA: TStringField;
    ClientAncestralDATA_REGISTRO_BOLETO: TStringField;
    cxLabel22: TcxLabel;
    cxDBImageComboBox1: TcxDBImageComboBox;
    ClientAncestralPIX_CHAVE: TStringField;
    cxGroupBox1: TcxGroupBox;
    cxLabel23: TcxLabel;
    cxDBTextEdit10: TcxDBTextEdit;
    ClientAncestralPIX_CEDENTE: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ClientAncestralAfterScroll(DataSet: TDataSet);
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure btnGravarDadosClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure ClientAncestralAfterEdit(DataSet: TDataSet);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure icxPrazoPropertiesEditValueChanged(Sender: TObject);
    procedure chxCobrarTaxaClick(Sender: TObject);
  private
    procedure SetState (AState : TDataSetState);override;
    procedure LoadData; override;
  public
    { Public declarations }
  end;

var
  frmCadCedente: TfrmCadCedente;

implementation

uses Controles, Lookup, Rotinas, Principal, Lookup_Contabil;

{$R *.dfm}

procedure TfrmCadCedente.btnGravarDadosClick(Sender: TObject);
begin
  inherited;

  if (ClientAncestralUSAR_BOLETO.AsString = 'S') then
    VerificarPreenchimentoLCX_DB(lcxCaixa.Text, 'Caixa de Lan�amento', lcxCaixa);

  if not (State in [dsEdit, dsInsert]) then
    ClientAncestral.edit;

  ClientAncestralDB_NOMEBANCO.AsString := icxBanco.Text;
  VerificarPreenchimentoLCX_DB(lcxModeloBoleto.Text, 'Modelo do Boleto Banc�rio', lcxModeloBoleto);

  if not chxCobrarTaxa.Checked then
    ClientAncestralCONTABIL_CONTA_TAXA_ID.AsVariant := null;

  if icxPrazo.EditValue = '2' then
  begin
    if edtPrazo.EditValue = 0 then
    begin
      Application.MessageBox('Dia de Prazo de Pagamento inv�lido!!!','Informa��o', MB_ICONINFORMATION + MB_OK);
      edtPrazo.SetFocus;
      exit;
    end;
  end
  else ClientAncestralPRAZO_DIA.AsCurrency := 0;

  VerificarPreenchimentoLCX_DB(lcxCompromissoJuros.Text, 'Compromisso Juros Boleto',lcxCompromissoJuros);
  VerificarPreenchimentoLCX_DB(lcxReservaId.Text, 'Reserva/Provis�o', lcxReservaId);
  VerificarPreenchimentoICX_DB(icxLayout.Text, 'Layout', icxLayout);

  ClientAncestral.ApplyUpdates(-1);
  btnGravarDados.Enabled := False;
end;

procedure TfrmCadCedente.btnLimparClick(Sender: TObject);
begin
  inherited;
  ClientAncestral.Edit;
  ClientAncestralDB_NOMEBANCO.AsVariant     := null;
  ClientAncestralDB_CODIGOBANCO.AsVariant   := null;
  ClientAncestralDB_AGENCIA.AsVariant       := null;
  ClientAncestralDB_CONTA.AsVariant         := null;
  ClientAncestralDB_CODIGOCEDENTE.AsVariant := null;
  ClientAncestralDB_CONVENIO.AsVariant      := null;
  ClientAncestralDB_DIGITOCONTA.AsVariant   := null;
  ClientAncestralDB_CARTEIRA.AsVariant      := null;
  ClientAncestralDB_TAXA.AsVariant          := null;
  ClientAncestralDB_MULTA.AsVariant         := null;    
  ClientAncestral.post;
  btnGravarDados.Enabled := True;
end;

procedure TfrmCadCedente.ClientAncestralAfterEdit(DataSet: TDataSet);
begin
  inherited;
  if not btnGravarDados.Enabled then
    btnGravarDados.Enabled := True;
end;

procedure TfrmCadCedente.ClientAncestralAfterScroll(DataSet: TDataSet);
begin
  inherited;
  tbcBoleto.TabVisible := ClientAncestralUSAR_BOLETO.AsString = 'S';

  ExecutaSqlAuxiliar(' SELECT COUNT(PESSOA_ID) AS QTD '+
                     ' FROM T_PESSOA '+
                     ' WHERE CEDENTE_ID = '+ ClientAncestralCEDENTE_ID.AsString,0);
  if ClientAncestral.RecordCount > 0 then
  begin
    if ClientAncestralSINCRONIZAR_REUNI.AsString = 'S' then
      icxSincronizaReuni.Enabled := (dtmControles.sqlAuxiliar.FieldByName('QTD').AsInteger = 0);
  end
  else icxSincronizaReuni.Enabled := True;
  chxCobrarTaxaClick(self);
end;

procedure TfrmCadCedente.chxCobrarTaxaClick(Sender: TObject);
begin
  inherited;
  edtValorTaxa.Enabled       := chxCobrarTaxa.Checked;
  lblTaxa.Enabled            := chxCobrarTaxa.Checked;
//  chxTaxaAssociado.Enabled   := chxCobrarTaxa.Checked;

  if not chxTaxaAssociado.Enabled then
  begin
    if ClientAncestral.State in [dsEdit] then
      ClientAncestralDB_LANCAR_TAXAMEDIA_ASSOCIADO.AsString := 'N';
  end;

  if not edtValorTaxa.Enabled then
    if ClientAncestral.State in [dsEdit] then
      ClientAncestralDB_TAXA.AsCurrency := 0;
end;

procedure TfrmCadCedente.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  pgcGrid.ActivePageIndex := 0;
  edtDescricao.SetFocus;
end;

procedure TfrmCadCedente.ExecuteGravarExecute(Sender: TObject);
  procedure ValidarDados;
  begin
    if (ClientAncestralSITUACAO.AsString = 'I') and (ClientAncestralPRINCIPAL.AsString = 'S') then
    begin
      Application.MessageBox('O Cedente Principal n�o pode ser inativado!!!', 'Aten��o', MB_OK + MB_ICONWARNING);
      abort;
    end;

    VerificarPreenchimentoEDT_DB(edtDescricao.text,'Descri��o',edtDescricao);
    if ClientAncestralUSAR_BOLETO.AsString = 'S' then
    begin
      VerificarPreenchimentoEDT_DB(edtEndereco.Text, 'Logradouro', edtEndereco);
      VerificarPreenchimentoEDT_DB(edtCidade.Text, 'Cidade', edtCidade);
      VerificarPreenchimentoCBX_DB(edtUF.Text, 'UF', edtUF);
      if ClientAncestralEND_CEP.AsString = '' then
      begin
        Application.MessageBox('CEP inv�lido!!!', 'Aten��o', MB_OK + MB_ICONWARNING);
        edtCEP.SetFocus;
        abort;
      end;

      VerificarPreenchimentoEDT_DB(edtRazao.Text, 'Raz�o Social', edtRazao);
      if ClientAncestralCNPJ_CPF.AsString = '' then
      begin
        Application.MessageBox('CNPJ inv�lido!!!', 'Aten��o', MB_OK + MB_ICONWARNING);
        edtCPFCNPJ.SetFocus;
        abort;
      end;
    end;
  end;
begin
  if ClientAncestralSINCRONIZAR_REUNI.AsString = 'S' then
  begin
    ExecutaSqlAuxiliar(' SELECT COUNT(PESSOA_ID) AS QTD '+
                       ' FROM T_PESSOA '+
                       ' WHERE (CPF IS NULL OR TRIM(CPF) = '+ QuotedStr('')+')'+
                       '   AND NOT SITUACAO = '+QuotedStr('0')+
                       '   AND CEDENTE_ID = '+ ClientAncestralCEDENTE_ID.AsString,0);
    if dtmControles.sqlAuxiliar.FieldByName('QTD').AsInteger > 0 then
    begin
      Application.MessageBox(Pchar('Existem pessoas sem CPF Cadastradas no sistema!!!'+#13+#13+
                                   '>> Sincroniza�ao do Reuni n�o permitida!!!'), 'Aten��o', MB_OK + MB_ICONWARNING);
      exit;
    end;
  end;

  ValidarDados;

  inherited;
  tbcBoleto.TabVisible := ClientAncestralUSAR_BOLETO.AsString = 'S';

  // Se existir somente um Cedente, seta ele como principal
  if ClientAncestral.RecordCount = 1 then
  begin
    ClientAncestral.Edit;
    ClientAncestralPRINCIPAL.AsString := 'S';
    ClientAncestral.ApplyUpdates(-1);
    frmPrincipal.MostrarCedenteAtivo(ClientAncestralCEDENTE_ID.AsString);
    frmPrincipal.AdvToolBarPager1.Refresh;
    frmPrincipal.Update;
  end;
end;

procedure TfrmCadCedente.ExecuteIncluirExecute(Sender: TObject);
begin
  inherited;
  pgcGrid.ActivePageIndex := 0;
  ClientAncestralUSAR_BOLETO.AsString       := 'S';
  ClientAncestralSINCRONIZAR_REUNI.AsString := 'S';
  ClientAncestralSITUACAO.AsString          := 'A';
  ClientAncestralCOBRAR_BOLETO.AsString     := 'N';
  ClientAncestralCOBRAR_MULTA.AsString      := 'N';
  ClientAncestralPRAZO_PAGAMENTO.AsString   := '1';
  ClientAncestralPRAZO_DIA.AsCurrency       := 0;
  ClientAncestralDIA_VENCIMENTO_PADRAO.AsCurrency := 10;  
  ClientAncestralCONTABIL_CONTA_MULTA_ID.AsString := 'N';
  ClientAncestralCONTABIL_CONTA_TAXA_ID.AsVariant := null;
  edtDescricao.SetFocus;
end;

procedure TfrmCadCedente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dtmLookup.AtualizarTabelas;

  Action        := caFree;
  frmCadCedente := nil;
end;

procedure TfrmCadCedente.FormCreate(Sender: TObject);
begin
  inherited;
  vgNomeTabela    := 'T_CEDENTE';
  vgChavePrimaria := 'CEDENTE_ID';

  sqlRelatorio.Connection := dtmControles.DB;
  sqlRelatorio.Active     := True;
  
  pgcGrid.ActivePageIndex := 0;
end;

procedure TfrmCadCedente.icxPrazoPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  edtPrazo.Enabled := icxPrazo.EditValue = '2';
end;

procedure TfrmCadCedente.LoadData;
begin
  ClientAncestral.Open;
  inherited;
end;

procedure TfrmCadCedente.SetState(AState: TDataSetState);
begin
  inherited;
  pgcGrid.Enabled := State = dsBrowse;
end;

end.
