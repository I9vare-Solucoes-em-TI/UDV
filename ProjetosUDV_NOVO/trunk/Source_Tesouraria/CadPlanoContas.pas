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
  cxLookAndFeels, dxSkinBlueprint, dxSkinDarkRoom, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinHighContrast, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSpringTime, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  cxPCdxBarPopupMenu, cxNavigator, dxBarBuiltInMenu, System.Actions,
  DbxDevartInterBase, SimpleDS;

type
  TfrmCadPlanoContas = class(TfrmCadBasico)
    ClientAncestralCONTABIL_CONTA_ID: TFMTBCDField;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralSITUACAO: TStringField;
    ClientAncestralPLANO: TFMTBCDField;
    ClientAncestralGENERICO: TStringField;
    ClientAncestralCONTABIL_GRUPO_ID: TFMTBCDField;
    ClientAncestralVALOR_DEFAULT: TFMTBCDField;
    ClientAncestralGRUPO: TStringField;
    ClientAncestralcalc_Tipo: TStringField;
    ClientAncestralFIXO: TStringField;
    ClientAncestralQTD_LIMITADA: TStringField;
    ClientAncestralCEDENTE_ID: TFMTBCDField;
    tabBalancete: TcxTabControl;
    ClientAncestralBALANCETE_GRUPO_ID: TFMTBCDField;
    cxLabel8: TcxLabel;
    cxLabel7: TcxLabel;
    popRealizado: TPopupMenu;
    popAtivarGenerico: TMenuItem;
    popDesativarGenerico: TMenuItem;
    dtsGrupoContabil: TDataSource;
    sqlGrupoContabil: TSimpleDataSet;
    sqlGrupoContabilDESCRICAO: TStringField;
    sqlGrupoContabilCONTABIL_GRUPO_ID: TFMTBCDField;
    sqlGrupoContabilBALANCETE_GRUPO_ID: TFMTBCDField;
    ClientAncestralPROGRAMAR_REAJUSTE: TStringField;
    pnlDados: TPanel;
    cxLabel5: TcxLabel;
    cxGroupBox2: TcxGroupBox;
    Bevel1: TBevel;
    lcxItem: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel6: TcxLabel;
    cbxGrupoPlano: TcxComboBox;
    icxGenerico: TcxDBImageComboBox;
    edtDescricao: TcxDBTextEdit;
    icxFixo: TcxDBImageComboBox;
    cxLabel1: TcxLabel;
    icxQtd: TcxDBImageComboBox;
    chxProgramarReajuste: TcxDBCheckBox;
    cxLabel9: TcxLabel;
    chbSituacao: TcxDBCheckBox;
    icxTipo: TcxImageComboBox;
    lcxGrupoContabil: TcxDBLookupComboBox;
    pgcListagem: TcxPageControl;
    tabPlanoDetalhado: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    tbcOperacao: TcxTabControl;
    cxGridListagemPlano: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    sqlPlanoListagem: TSimpleDataSet;
    dtsPlanoLIstagem: TDataSource;
    sqlPlanoListagemCONTA: TStringField;
    sqlPlanoListagemSITUACAO: TStringField;
    sqlPlanoListagemGENERICO: TStringField;
    sqlPlanoListagemGRUPO_SECUNDARIO: TStringField;
    sqlPlanoListagemFIXO: TStringField;
    sqlPlanoListagemQTD_LIMITADA: TStringField;
    sqlPlanoListagemGRUPO_PRINCIPAL: TStringField;
    sqlPlanoListagemOPERACAO: TStringField;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    cxGridDBTableView1Column3: TcxGridDBColumn;
    cxGridDBTableView1Column4: TcxGridDBColumn;
    cxGridDBTableView1Column5: TcxGridDBColumn;
    cxGridDBTableView1Column6: TcxGridDBColumn;
    cxGridDBTableView1Column7: TcxGridDBColumn;
    cxGridDBTableView1Column8: TcxGridDBColumn;
    PopupMenu1: TPopupMenu;
    MenuItem1: TMenuItem;
    Panel1: TPanel;
    btnGravarDados: TcxButton;
    tabGrupo: TcxTabControl;
    grdBasica: TcxGrid;
    cxGridPesquisa: TcxGridDBTableView;
    cxGridPesquisaTipo: TcxGridDBColumn;
    cxGridPesquisaColumn3: TcxGridDBColumn;
    cxGridPesquisaColumn1: TcxGridDBColumn;
    cxGridPesquisaColumn2: TcxGridDBColumn;
    cxGridPesquisaColumn5: TcxGridDBColumn;
    cxGridPesquisaColumn4: TcxGridDBColumn;
    cxGridPesquisaColumn9: TcxGridDBColumn;
    cxGridPesquisaSituacao: TcxGridDBColumn;
    grdBasicaLevel1: TcxGridLevel;
    cxGridPesquisaColumn6: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure icxTipoPropertiesEditValueChanged(Sender: TObject);
    procedure lcxGrupoContabilPropertiesEditValueChanged(Sender: TObject);
    procedure cbxGrupoPlanoPropertiesEditValueChanged(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure ClientAncestralCalcFields(DataSet: TDataSet);
    procedure ExecuteCancelarExecute(Sender: TObject);
    procedure icxMensalPropertiesEditValueChanged(Sender: TObject);
    procedure ClientAncestralAfterScroll(DataSet: TDataSet);
    procedure tabBalanceteChange(Sender: TObject);
    procedure tabBalanceteChanging(Sender: TObject; var AllowChange: Boolean);
    procedure ExecuteExcluirExecute(Sender: TObject);
    procedure popAtivarGenericoClick(Sender: TObject);
    procedure popDesativarGenericoClick(Sender: TObject);
    procedure tbcOperacaoChange(Sender: TObject);
    procedure pgcListagemChange(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
  private
    vlAlterar : Boolean; 
    procedure SetState (AState : TDataSetState);override;
    procedure LoadData; override;
    procedure CarregarGrupo;
  public
    { Public declarations }
  end;

var
  frmCadPlanoContas: TfrmCadPlanoContas;

implementation

uses Rotinas, Controles, Lookup, Lookup_Contabil;

{$R *.dfm}

procedure TfrmCadPlanoContas.CarregarGrupo;
var
  viDescricao : string;
begin
  if State in [dsEdit] then
    viDescricao := cbxGrupoPlano.Text;

  cbxGrupoPlano.Properties.Items.Clear;
  if lcxGrupoContabil.EditValue = null then
  begin
    lcxGrupoContabil.Properties.Items.Clear;
    exit;
  end;

  Screen.Cursor := crHourGlass;
  ExecutaSimpleDSAux(' SELECT DISTINCT(GRUPO) '+
                     ' FROM T_CONTABIL_CONTA '+
                     ' WHERE CONTABIL_GRUPO_ID = '+ IntToStr(lcxGrupoContabil.EditValue) +
                     ' ORDER BY GRUPO ',0);
//  icxGenerico.Enabled := dtmControles.SimpleAuxiliar.eof;
  While not dtmControles.SimpleAuxiliar.Eof do
  begin
    cbxGrupoPlano.Properties.Items.Add(dtmControles.SimpleAuxiliar.FieldByName('GRUPO').AsString);
    dtmControles.SimpleAuxiliar.Next;
  end;
  cbxGrupoPlano.Clear;

  if State in [dsEdit] then
    cbxGrupoPlano.EditValue := viDescricao;
  Screen.Cursor := crDefault;
end;

procedure TfrmCadPlanoContas.cbxGrupoPlanoPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  // Verifica se existe mais de um registro neste Grupo
  ExecutaSimpleDSAux(' SELECT GENERICO '+
                     ' FROM T_CONTABIL_CONTA '+
                     ' WHERE GRUPO = '+ QuotedStr(cbxGrupoPlano.Text)+
                     '   AND NOT CONTABIL_CONTA_ID = '+ CurrToStr(ClientAncestralCONTABIL_CONTA_ID.AsCurrency)+
                     '   AND CONTABIL_GRUPO_ID = '+ IntToStr(lcxGrupoContabil.EditValue),0);
  if dtmControles.SimpleAuxiliar.RecordCount >= 1 then
  begin
//    icxGenerico.Enabled   := False;
    if vlAlterar then
      ClientAncestralGENERICO.AsString := dtmControles.SimpleAuxiliar.FieldByName('GENERICO').AsString;
  end
  else
  begin
//    icxGenerico.Enabled   := True;
    if vlAlterar then
      ClientAncestralGENERICO.AsString := 'N';
  end;
end;

procedure TfrmCadPlanoContas.ClientAncestralAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if (ClientAncestral.Active) and (ClientAncestral.State in [dsBrowse]) then
  begin
    icxTipo.EditValue          := ClientAncestralcalc_Tipo.AsString;
    lcxGrupoContabil.EditValue := ClientAncestralCONTABIL_GRUPO_ID.AsInteger;
    cbxGrupoPlano.EditValue    := ClientAncestral.FieldByName('GRUPO').AsString;
  end;
end;

procedure TfrmCadPlanoContas.ClientAncestralCalcFields(DataSet: TDataSet);
begin
  inherited;
  if ClientAncestralCONTABIL_GRUPO_ID.AsInteger > 0 then
    ClientAncestralcalc_Tipo.AsString := dtmControles.GetStr('SELECT TIPO FROM T_CONTABIL_GRUPO WHERE CONTABIL_GRUPO_ID = '+ClientAncestralCONTABIL_GRUPO_ID.AsString);
end;

procedure TfrmCadPlanoContas.pgcListagemChange(Sender: TObject);
begin
  inherited;
  if pgcListagem.ActivePageIndex = 1 then
  begin
    sqlPlanoListagem.Active := False;
    sqlPlanoListagem.DataSet.ParamByName('BALANCETE_GRUPO_ID').AsBCD := vgTabBalancete[tabBalancete.TabIndex];
    sqlPlanoListagem.Active := True;
  end;

end;

procedure TfrmCadPlanoContas.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  vlAlterar := True;
  icxTipo.EditValue          := ClientAncestralcalc_Tipo.AsString;
  lcxGrupoContabil.EditValue := ClientAncestralCONTABIL_GRUPO_ID.AsInteger;
  cbxGrupoPlano.EditValue    := ClientAncestral.FieldByName('GRUPO').AsString;
  cbxGrupoPlanoPropertiesEditValueChanged(self);
  icxMensalPropertiesEditValueChanged(Self);
  edtDescricao.SetFocus;
end;

procedure TfrmCadPlanoContas.ExecuteCancelarExecute(Sender: TObject);
begin
  vlAlterar := False;
  ClientAncestral.AfterScroll := nil;
  inherited;
  ClientAncestral.AfterScroll := ClientAncestralAfterScroll;
  grdBasica.SetFocus;
end;

procedure TfrmCadPlanoContas.ExecuteExcluirExecute(Sender: TObject);
begin
  ClientAncestral.AfterScroll := nil;
  inherited;
  ClientAncestral.AfterScroll := ClientAncestralAfterScroll;  
  ClientAncestralAfterScroll(ClientAncestral);
  grdBasica.SetFocus;
end;

procedure TfrmCadPlanoContas.ExecuteGravarExecute(Sender: TObject);
begin
  if Trim(cbxGrupoPlano.Text) = '' then
  begin
    Application.MessageBox('Grupo Descri��o deve ser infomado!', 'Aten��o', MB_OK + MB_ICONWARNING);
    cbxGrupoPlano.SetFocus;
    exit;
  end;

  VerificarPreenchimentoICX_DB(icxGenerico.text,'Generico',icxGenerico);
  VerificarPreenchimentoEDT_DB(lcxItem.Caption,'Compromisso',edtDescricao);

  ClientAncestralGRUPO.AsString := cbxGrupoPlano.Text;
  vlAlterar := False;

  ClientAncestral.AfterScroll := nil;
  inherited;
  ClientAncestral.AfterScroll := ClientAncestralAfterScroll;
  grdBasica.SetFocus;
end;

procedure TfrmCadPlanoContas.ExecuteIncluirExecute(Sender: TObject);
begin
  if dtmLookup.sqlCedenteAtivos.RecordCount < 1 then
  begin
    Application.MessageBox('N�o existe nenhum cedente cadastrado!', 'Aten��o', MB_OK + MB_ICONWARNING);
    exit;
  end;

  if tabBalancete.Tabs.Count = 0 then
  begin
    Application.MessageBox('N�o existe nenhum balancete cadastrado!', 'Aten��o', MB_OK + MB_ICONWARNING);
    exit;
  end;

  ClientAncestralAfterScroll(ClientAncestral);
  inherited;
  ClientAncestralSITUACAO.AsString            := 'A';
  ClientAncestralQTD_LIMITADA.AsString        := 'S';
  ClientAncestralCEDENTE_ID.AsInteger         := vgCedenteAtivo;
  ClientAncestralBALANCETE_GRUPO_ID.AsInteger := vgTabBalancete[tabBalancete.TabIndex];
  ClientAncestralPROGRAMAR_REAJUSTE.AsString  := 'N';
  cbxGrupoPlano.Enabled := False;
  icxTipo.ItemIndex := tbcOperacao.TabIndex;
  lcxGrupoContabil.SetFocus;
  vlAlterar := True; 
end;

procedure TfrmCadPlanoContas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dtmLookup.AtualizarTabelas;

  Action            := caFree;
  frmCadPlanoContas := nil;
end;

procedure TfrmCadPlanoContas.FormCreate(Sender: TObject);
begin
  inherited;
  sqlGrupoContabil.Connection := dtmControles.DB;
  sqlPlanoListagem.Connection := dtmControles.DB;
  pgcListagem.ActivePageIndex := 0;

  vgNomeTabela    := 'T_CONTABIL_CONTA';
  vgChavePrimaria := 'CONTABIL_CONTA_ID';
  dtmLookup.CarregarTabBalancete(tabBalancete);
  tbcOperacaoChange(Self);
end;

procedure TfrmCadPlanoContas.icxMensalPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  chxProgramarReajuste.Enabled  := (icxFixo.EditValue = 'S') and (icxTipo.EditValue = '2');
  icxQtd.Enabled                := icxFixo.EditValue = 'N';

  if not vlAlterar then
    exit;

  if icxFixo.EditValue = 'S' then
       ClientAncestralQTD_LIMITADA.AsString := 'S'
  else ClientAncestralPROGRAMAR_REAJUSTE.AsString := 'N';
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
  ClientAncestral.AfterScroll := ClientAncestralAfterScroll;
  ClientAncestralAfterScroll(ClientAncestral);
  sqlGrupoContabil.Active := True;
  lcxGrupoContabil.EditValue := null;
end;

procedure TfrmCadPlanoContas.lcxGrupoContabilPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;

  if lcxGrupoContabil.EditValue = null then
    exit;

  CarregarGrupo;
  cbxGrupoPlano.Enabled := True;
end;

procedure TfrmCadPlanoContas.LoadData;
begin
  Screen.Cursor := crHourGlass;
  LockWindowUpdate(Handle);

  ClientAncestral.AfterScroll := nil;
  ClientAncestral.Close;
  DataSetAncestral.ParamByName('CEDENTE_ID').AsInteger         := vgCedenteAtivo;
  DataSetAncestral.ParamByName('BALANCETE_GRUPO_ID').AsInteger := vgTabBalancete[tabBalancete.TabIndex];
  ClientAncestral.Open;
  ClientAncestral.AfterScroll := ClientAncestralAfterScroll;
  LockWindowUpdate(0);
  ClientAncestralAfterScroll(ClientAncestral);
  Screen.Cursor := crDefault;

  dtmLookup.FiltrarGrupoContasBalancete(dtmLookup.sqlGrupoContabilSaidas,vgTabBalancete[tabBalancete.TabIndex], True);
  dtmLookup.FiltrarGrupoContasBalancete(dtmLookup.sqlGrupoContabilEntradas,vgTabBalancete[tabBalancete.TabIndex], True);

  inherited;
end;

procedure TfrmCadPlanoContas.MenuItem1Click(Sender: TObject);
begin
  inherited;
  dtmLookup.ExportarExcel(cxGridListagemPlano);
end;

procedure TfrmCadPlanoContas.popAtivarGenericoClick(Sender: TObject);
begin
  inherited;
  ClientAncestral.AfterScroll := nil;
  ExecutaSqlAuxiliar(' UPDATE T_CONTABIL_CONTA SET GENERICO = ''S'''+
                     ' WHERE GRUPO = '+QuotedStr(ClientAncestralGRUPO.AsString),1);
  ClientAncestral.Refresh;
  ClientAncestral.AfterScroll := ClientAncestralAfterScroll;
  Application.MessageBox('GRUPO ATIVADO COMO GEN�RICO!!!', 'informa��o', MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmCadPlanoContas.popDesativarGenericoClick(Sender: TObject);
begin
  inherited;
  ClientAncestral.AfterScroll := nil;
  ExecutaSqlAuxiliar(' UPDATE T_CONTABIL_CONTA SET GENERICO = ''N'''+
                     ' WHERE GRUPO = '+QuotedStr(ClientAncestralGRUPO.AsString),1);
  ClientAncestral.Refresh;
  ClientAncestral.AfterScroll := ClientAncestralAfterScroll;
  Application.MessageBox('GEN�RICO DO GRUPO DESATIVADO!!!', 'informa��o', MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmCadPlanoContas.SetState(AState: TDataSetState);
begin
  inherited;
  pnlDados.Enabled     := State in [dsEdit, dsInsert];
  grdBasica.Enabled    := State = dsBrowse;
  tbcOperacao.Enabled  := State = dsBrowse;
  PanelData.Enabled    := True;
  icxGenerico.Enabled  := State in [dsEdit, dsInsert];
//  cxGridPesquisa.DataController.Groups.FullExpand;
end;

procedure TfrmCadPlanoContas.tabBalanceteChange(Sender: TObject);
begin
  inherited;
  LoadData;
  pgcListagem.ActivePageIndex := 0;
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
  ClientAncestral.AfterScroll := nil;
  with cxGridPesquisa.DataController.Filter.Root do
  begin
    Clear;
    AddItem(cxGridPesquisaTipo, foEqual, tbcOperacao.TabIndex+1, 'N');
    case tabGrupo.TabIndex of
      0: AddItem(cxGridPesquisaSituacao, foEqual, 'A', 'N');
      1: AddItem(cxGridPesquisaSituacao, foEqual, 'I', 'N');
    end;
  end;
  ClientAncestral.AfterScroll := ClientAncestralAfterScroll;
  ClientAncestralAfterScroll(ClientAncestral);
end;

end.
