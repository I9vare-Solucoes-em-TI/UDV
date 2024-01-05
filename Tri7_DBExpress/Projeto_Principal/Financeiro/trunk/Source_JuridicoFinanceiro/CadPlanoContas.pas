unit CadPlanoContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, Menus, cxLookAndFeelPainters, FMTBcd, DB, DBClient,
  Provider, SqlExpr, ActnList, ComCtrls, StdCtrls, cxButtons, ExtCtrls,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxCurrencyEdit, cxDBEdit, cxCheckBox,
  cxImageComboBox, cxDropDownEdit, cxDBLookupComboBox, cxLabel, cxTextEdit,
  cxMaskEdit, cxLookupEdit, cxDBLookupEdit, cxContainer, cxGroupBox,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxSpinEdit, cxBlobEdit, cxPC,
  cxLookAndFeels, dxSkinBlueprint, dxSkinDarkRoom, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinHighContrast, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013White, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSpringTime,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxPCdxBarPopupMenu,
  cxNavigator, dxSkinDevExpressDarkStyle, SimpleDS, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxSkinsdxBarPainter, dxSkinsdxRibbonPainter,
  dxPSCore, dxPScxCommon, dxBarBuiltInMenu, System.Actions, DbxDevartInterBase;

type
  TfrmCadPlanoContas = class(TfrmCadBasico)
    tabBalancete: TcxTabControl;
    pnlDados: TPanel;
    cxLabel5: TcxLabel;
    cxLabel9: TcxLabel;
    tbcOperacao: TcxTabControl;
    grdBasica: TcxGrid;
    cxGridPesquisa: TcxGridDBTableView;
    cxGridPesquisaColumn3: TcxGridDBColumn;
    cxGridPesquisaColumn1: TcxGridDBColumn;
    cxGridPesquisaColumn2: TcxGridDBColumn;
    cxGridPesquisaColumn7: TcxGridDBColumn;
    grdBasicaLevel1: TcxGridLevel;
    ClientAncestralCONTABIL_CONTA_ID: TFMTBCDField;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralGRUPO: TStringField;
    ClientAncestralSITUACAO: TStringField;
    ClientAncestralBALANCETE_GRUPO_ID: TFMTBCDField;
    ClientAncestralCONTABIL_GRUPO_ID: TFMTBCDField;
    ClientAncestralINTERNO: TStringField;
    ClientAncestralEXIGE_CONTRATO: TStringField;
    sqlGrupoContabil: TSimpleDataSet;
    sqlGrupoContabilDESCRICAO: TStringField;
    sqlGrupoContabilCONTABIL_GRUPO_ID: TFMTBCDField;
    sqlGrupoContabilBALANCETE_GRUPO_ID: TFMTBCDField;
    dtsGrupoContabil: TDataSource;
    cxLabel3: TcxLabel;
    lcxItem: TcxLabel;
    icxTipo: TcxImageComboBox;
    lcxGrupoContabil: TcxDBLookupComboBox;
    cbxGrupoPlano: TcxComboBox;
    edtDescricao: TcxDBTextEdit;
    chbSituacao: TcxDBCheckBox;
    cxDBCheckBox1: TcxDBCheckBox;
    ClientAncestralIR: TStringField;
    ClientAncestralCNJ: TStringField;
    cxDBCheckBox2: TcxDBCheckBox;
    cxDBCheckBox3: TcxDBCheckBox;
    cxGridPesquisaColumn4: TcxGridDBColumn;
    cxGridPesquisaColumn5: TcxGridDBColumn;
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinter1Link1: TdxGridReportLink;
    popImprimir: TPopupMenu;
    mniImprimirPlanoContas: TMenuItem;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    btnImprimir: TcxButton;
    cxGridPesquisaColumn6: TcxGridDBColumn;
    ClientAncestralSELECIONAR: TBooleanField;
    N1: TMenuItem;
    ExcluirTodosSelecionados1: TMenuItem;
    cxGridPesquisaColumn8: TcxGridDBColumn;
    cxDBCheckBox4: TcxDBCheckBox;
    ClientAncestralTIPO_GLOBAL: TStringField;
    cxGridPesquisaColumn9: TcxGridDBColumn;
    cxGridPesquisaColumn10: TcxGridDBColumn;
    ClientAncestralTIPO: TStringField;
    cxGridPesquisaTipo: TcxGridDBColumn;
    pnlPesquisa: TPanel;
    cxLabel4: TcxLabel;
    edtPalavraPesquisa: TcxTextEdit;
    btnPesquisar: TcxButton;
    btnLimpar: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure icxTipoPropertiesEditValueChanged(Sender: TObject);
    procedure lcxGrupoContabilPropertiesEditValueChanged(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure ExecuteCancelarExecute(Sender: TObject);
    procedure tabBalanceteChange(Sender: TObject);
    procedure tabBalanceteChanging(Sender: TObject; var AllowChange: Boolean);
    procedure ExecuteExcluirExecute(Sender: TObject);
    procedure tbcOperacaoChange(Sender: TObject);
    procedure mniImprimirPlanoContasClick(Sender: TObject);
    procedure cxLabel1Click(Sender: TObject);
    procedure cxLabel2Click(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure ExcluirTodosSelecionados1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cxGridPesquisaFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure edtPalavraPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    vlAlterar, vlAbrindoForm : Boolean;
    viId : Integer;
    procedure SetState (AState : TDataSetState);override;
    procedure LoadData; override;
  public
    { Public declarations }
  end;

var
  frmCadPlanoContas: TfrmCadPlanoContas;
  vgGrupoContabilIDIncluir, vgGrupoContabilOperacao : Integer;

implementation

uses Rotinas, Controles, Lookup, Lookup_Contabil;

{$R *.dfm}

procedure TfrmCadPlanoContas.btnImprimirClick(Sender: TObject);
begin
  inherited;
  mniImprimirPlanoContasClick(Self);
end;

procedure TfrmCadPlanoContas.btnLimparClick(Sender: TObject);
begin
  inherited;
  edtPalavraPesquisa.Clear;
  ClientAncestral.Filtered := False;
end;

procedure TfrmCadPlanoContas.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  if edtPalavraPesquisa.Text <> '' then
  begin
    ClientAncestral.Filtered := False;
    ClientAncestral.Filter   := ' DESCRICAO LIKE '+QuotedStr('%'+edtPalavraPesquisa.Text);
    ClientAncestral.Filtered := True;
  end
  else ClientAncestral.Filtered := False;
  cxGridPesquisa.ViewData.Expand(TRUE);
end;

procedure TfrmCadPlanoContas.cxGridPesquisaFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  if state <> dsBrowse then
    exit;

  if (ClientAncestral.Active) then
  begin
    if ClientAncestralTIPO.AsString <> '' then
      icxTipo.EditValue := ClientAncestralTIPO.AsString;
    cbxGrupoPlano.EditValue    := ClientAncestral.FieldByName('GRUPO').AsString;
  end;
end;

procedure TfrmCadPlanoContas.cxLabel1Click(Sender: TObject);
begin
  inherited;
  cxGridPesquisa.DataController.Groups.FullExpand
end;

procedure TfrmCadPlanoContas.cxLabel2Click(Sender: TObject);
begin
  inherited;
  cxGridPesquisa.DataController.Groups.FullCollapse
end;

procedure TfrmCadPlanoContas.edtPalavraPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if KEY = 13 then
    btnPesquisarClick(SELF);
end;

procedure TfrmCadPlanoContas.ExcluirTodosSelecionados1Click(Sender: TObject);
begin
  inherited;
  ClientAncestral.DisableControls;
  ClientAncestral.First;
  while not ClientAncestral.eof do
  begin
    if ClientAncestralselecionar.AsBoolean then
    begin
      try
        ExecutaSqlAuxiliar(' DELETE FROM J_CONTABIL_CONTA '+
                           ' WHERE CONTABIL_CONTA_ID = '+ClientAncestralCONTABIL_CONTA_ID.AsString,1);
      except
        Application.MessageBox('Item s� pode ser inativado!', 'Aten��o', MB_OK + MB_ICONWARNING);
        ClientAncestral.Next;
      end;
    end
    else ClientAncestral.Next;
  end;
  ClientAncestral.EnableControls;
end;

procedure TfrmCadPlanoContas.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  vlAlterar := True;
  icxTipo.EditValue          := dtmControles.GetStr('SELECT TIPO FROM J_CONTABIL_GRUPO WHERE CONTABIL_GRUPO_ID = '+ClientAncestralCONTABIL_GRUPO_ID.AsString);
  lcxGrupoContabil.EditValue := ClientAncestralCONTABIL_GRUPO_ID.AsInteger;
  cbxGrupoPlano.EditValue    := ClientAncestral.FieldByName('GRUPO').AsString;

  edtDescricao.SetFocus;
end;

procedure TfrmCadPlanoContas.ExecuteCancelarExecute(Sender: TObject);
begin
  vlAlterar := False;
  ClientAncestral.AfterScroll := nil;
  inherited;

  if vgGrupoContabilIDIncluir > 0 then
       Close
  else grdBasica.SetFocus;
end;

procedure TfrmCadPlanoContas.ExecuteExcluirExecute(Sender: TObject);
begin
  ClientAncestral.AfterScroll := nil;
  inherited;
  grdBasica.SetFocus;
end;

procedure TfrmCadPlanoContas.ExecuteGravarExecute(Sender: TObject);
var
  viNovo : Boolean;

  procedure VerificarItensAgendado;
  var
    viQtdAgendado : Integer;
  begin
    if viNovo then
      exit;

    if ClientAncestralSITUACAO.AsString = 'A' then
      exit;

    viQtdAgendado := dtmControles.GetInt(' SELECT COUNT(LIVRO_FINANCEIRO_ID) FROM J_LIVRO_FINANCEIRO '+
                                         ' WHERE CONTABIL_CONTA_ID = '+ClientAncestralCONTABIL_CONTA_ID.AsString +
                                         '  AND SITUACAO = '+QuotedStr('1'));
    if viQtdAgendado > 0 then
    begin
      Application.MessageBox(PChar('Item n�o pode ser inativado!!!'+#13+#13+
                                   'Existe agendamento ativo neste item.'), 'Aten��o', MB_OK + MB_ICONWARNING);
      abort;
    end;
  end;

  {$REGION 'PrepararSqlAtualizar'}
  procedure PrepararSqlAtualizar;
  begin
    viId := 0;
    ExecutaSqlAuxiliar(' UPDATE J_CONTABIL_CONTA SET DESCRICAO = :DESCRICAO, '+
                       '                                 GRUPO = :GRUPO, '+
                       '                              SITUACAO = :SITUACAO, '+
                       '                    BALANCETE_GRUPO_ID = :BALANCETE_GRUPO_ID, '+
                       '                     CONTABIL_GRUPO_ID = :CONTABIL_GRUPO_ID, '+
                       '                               INTERNO = :INTERNO, '+
                       '                                   CNJ = :CNJ, '+
                       '                                    IR = :IR, '+
                       '                           TIPO_GLOBAL = :TIPO_GLOBAL '+
                       ' WHERE CONTABIL_CONTA_ID = '+ClientAncestralCONTABIL_CONTA_ID.AsString, 2);
  end;
  {$ENDREGION}

  {$REGION 'PrepararSqlNovo'}
  procedure PrepararSqlNovo;
  begin
    ExecutaSqlAuxiliar(' INSERT INTO J_CONTABIL_CONTA( '+
                       '             CONTABIL_CONTA_ID, '+
                       '             DESCRICAO, '+
                       '             GRUPO,'+
                       '             SITUACAO,'+
                       '             BALANCETE_GRUPO_ID,'+
                       '             CONTABIL_GRUPO_ID,'+
                       '             INTERNO,'+
                       '             CNJ,'+
                       '             IR,'+
                       '             TIPO_GLOBAL)'+
                       ' VALUES(     :CONTABIL_CONTA_ID, '+
                       '             :DESCRICAO, '+
                       '             :GRUPO, '+
                       '             :SITUACAO, '+
                       '             :BALANCETE_GRUPO_ID, '+
                       '             :CONTABIL_GRUPO_ID, '+
                       '             :INTERNO, '+
                       '             :CNJ, '+
                       '             :IR, '+
                       '             :TIPO_GLOBAL)',2);
  end;
  {$ENDREGION}

  {$REGION 'GravarDados'}
  procedure GravarDados;
  begin
    with dtmControles.sqlAuxiliar do
    begin
      if viNovo then
      begin
        viId := dtmControles.GerarSequencia('J_CONTABIL_CONTA');
        ParamByName('CONTABIL_CONTA_ID').AsInteger:= viId;
      end;

      ParamByName('DESCRICAO').AsString           := ClientAncestralDESCRICAO.AsString;
      ParamByName('GRUPO').AsString               := ClientAncestralGRUPO.AsString;
      ParamByName('SITUACAO').AsString            := ClientAncestralSITUACAO.AsString;
      ParamByName('BALANCETE_GRUPO_ID').AsInteger := ClientAncestralBALANCETE_GRUPO_ID.AsInteger;
      ParamByName('CONTABIL_GRUPO_ID').AsInteger  := ClientAncestralCONTABIL_GRUPO_ID.AsInteger;
      ParamByName('INTERNO').AsString             := ClientAncestralINTERNO.AsString;
      ParamByName('CNJ').AsString                 := ClientAncestralCNJ.AsString;
      ParamByName('IR').AsString                  := ClientAncestralIR.AsString;
      ParamByName('TIPO_GLOBAL').AsString         := ClientAncestralTIPO_GLOBAL.AsString;
      ExecSQL(FALSE);
    end;
  end;
  {$ENDREGION}

begin
  if Trim(cbxGrupoPlano.Text) = '' then
  begin
    Application.MessageBox('Grupo Descri��o deve ser infomado!', 'Aten��o', MB_OK + MB_ICONWARNING);
    cbxGrupoPlano.SetFocus;
    exit;
  end;
  viNovo := State in [dsInsert];

  VerificarPreenchimentoEDT_DB(edtDescricao.Text,'Plano de Conta',edtDescricao);
  VerificarItensAgendado;
  ClientAncestralGRUPO.AsString := cbxGrupoPlano.Text;
  vlAlterar := False;


  if State in [dsInsert] then
       PrepararSqlNovo
  else PrepararSqlAtualizar;

  GravarDados;
  ClientAncestral.CancelUpdates;
  SetState (dsBrowse);
  ClientAncestral.Refresh;
  if viId > 0 then
    ClientAncestral.Locate('CONTABIL_CONTA_ID', viId, [loCaseInsensitive]);

  if vgGrupoContabilIDIncluir > 0 then
  begin
    Close;
    vgGrupoContabilIDIncluir := ClientAncestralCONTABIL_CONTA_ID.AsInteger;
  end
  else grdBasica.SetFocus;
end;

procedure TfrmCadPlanoContas.ExecuteIncluirExecute(Sender: TObject);
begin
  if tabBalancete.Tabs.Count = 0 then
  begin
    Application.MessageBox('N�o existe nenhum balancete cadastrado!', 'Aten��o', MB_OK + MB_ICONWARNING);
    exit;
  end;

  inherited;
  ClientAncestralSITUACAO.AsString       := 'A';
  ClientAncestralINTERNO.AsString        := 'N';
  ClientAncestralEXIGE_CONTRATO.AsString := 'N';
  ClientAncestralCNJ.AsString            := 'N';
  ClientAncestralIR.AsString             := 'N';

  ClientAncestralBALANCETE_GRUPO_ID.AsInteger := vgTabBalancete[tabBalancete.TabIndex];
  cbxGrupoPlano.Enabled := False;
  icxTipo.ItemIndex := tbcOperacao.TabIndex;

  if vgGrupoContabilIDIncluir = 0 then
    lcxGrupoContabil.SetFocus
  else
  begin
    lcxGrupoContabil.EditValue := vgGrupoContabilIDIncluir;
    cbxGrupoPlano.SetFocus;
  end;
  vlAlterar := True;
end;

procedure TfrmCadPlanoContas.FormActivate(Sender: TObject);
begin
  inherited;
  if not vlAbrindoForm then
    exit;

  ClientAncestral.AfterScroll := nil;
  dtmLookupContabil.MarcarDesmarcarCompromissosClient(ClientAncestral, False);
  vlAbrindoForm := False;

  if vgGrupoContabilIDIncluir > 0 then
  begin
    ClientAncestral.Locate('CONTABIL_GRUPO_ID', vgGrupoContabilIDIncluir, [loCaseInsensitive]);
    tbcOperacao.TabIndex := vgGrupoContabilOperacao;
    ExecuteIncluirExecute(self);
  end;

  if pnlPesquisa.Enabled then
    edtPalavraPesquisa.SetFocus;
end;

procedure TfrmCadPlanoContas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  sqlGrupoContabil.Active := False;
  dtmLookupContabil.AtualizarTabelas;

  Action            := caFree;
  frmCadPlanoContas := nil;
end;

procedure TfrmCadPlanoContas.FormCreate(Sender: TObject);
begin
  inherited;
  vlAbrindoForm := True;
  sqlGrupoContabil.Connection := dtmControles.DB;

  vgNomeTabela    := 'J_CONTABIL_CONTA';
  vgChavePrimaria := 'CONTABIL_CONTA_ID';
  dtmLookupContabil.CarregarTabBalancete(tabBalancete);
  tbcOperacaoChange(Self);

end;

procedure TfrmCadPlanoContas.icxTipoPropertiesEditValueChanged(Sender: TObject);
begin
  ClientAncestral.AfterScroll := nil;
  inherited;
  sqlGrupoContabil.Active := False;
  if icxTipo.Text = '' then
    exit;

  sqlGrupoContabil.DataSet.ParamByName('TIPO').AsString                := icxTipo.EditValue;
  sqlGrupoContabil.DataSet.ParamByName('BALANCETE_GRUPO_ID').AsInteger := vgTabBalancete[tabBalancete.TabIndex];

  ClientAncestral.Open;
  sqlGrupoContabil.Active := True;
  lcxGrupoContabil.EditValue := null;
end;

procedure TfrmCadPlanoContas.lcxGrupoContabilPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;

  if lcxGrupoContabil.EditValue = null then
    exit;

  dtmLookupContabil.CarregarGrupo(cbxGrupoPlano, IntToStr(lcxGrupoContabil.EditValue));
  cbxGrupoPlano.Enabled := True;
end;

procedure TfrmCadPlanoContas.LoadData;
begin
  Screen.Cursor := crHourGlass;
  LockWindowUpdate(Handle);

  if tabBalancete.TabIndex = -1 then
   exit;

  ClientAncestral.AfterScroll := nil;
  ClientAncestral.Close;
  DataSetAncestral.ParamByName('BALANCETE_GRUPO_ID').AsInteger := vgTabBalancete[tabBalancete.TabIndex];
  ClientAncestral.Open;
  LockWindowUpdate(0);
  Screen.Cursor := crDefault;

  dtmLookupContabil.FiltrarGrupoContasBalancete(dtmLookupContabil.sqlGrupoContabilSaidas,vgTabBalancete[tabBalancete.TabIndex], True);
  dtmLookupContabil.FiltrarGrupoContasBalancete(dtmLookupContabil.sqlGrupoContabilEntradas,vgTabBalancete[tabBalancete.TabIndex], True);

  inherited;
end;

procedure TfrmCadPlanoContas.mniImprimirPlanoContasClick(Sender: TObject);
var
  viRelatorio : String;
begin
  inherited;
  viRelatorio := '';
  repeat
    if not InputQuery('Relat�rio Plano de Contas', 'Nome do Relat�rio:', viRelatorio) then
      Abort;
  until (viRelatorio <> '');

  dxComponentPrinter1Link1.ReportTitle.Text := viRelatorio;
  dxComponentPrinter1Link1.Preview;
end;

procedure TfrmCadPlanoContas.SetState(AState: TDataSetState);
begin
  inherited;
  pnlDados.Enabled     := State in [dsEdit, dsInsert];
  grdBasica.Enabled    := State = dsBrowse;
  btnImprimir.Enabled  := State = dsBrowse;
  tbcOperacao.Enabled  := State = dsBrowse;
  pnlPesquisa.Visible  := State = dsBrowse;
  PanelData.Enabled    := True;
end;

procedure TfrmCadPlanoContas.tabBalanceteChange(Sender: TObject);
begin
  inherited;
  LoadData;
  icxTipoPropertiesEditValueChanged(self);
end;

procedure TfrmCadPlanoContas.tabBalanceteChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  if State in [dsInsert, dsEdit] then
    abort;
end;

procedure TfrmCadPlanoContas.tbcOperacaoChange(Sender: TObject);
begin
  inherited;
  with cxGridPesquisa.DataController.Filter.Root do
  begin
    Clear;
    AddItem(cxGridPesquisaTipo, foEqual, tbcOperacao.TabIndex+1, 'N');
  end;
end;

end.
