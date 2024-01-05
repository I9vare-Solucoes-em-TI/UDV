unit CadGrupoContabil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, Menus, cxLookAndFeelPainters, FMTBcd, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, cxDBEdit, cxCurrencyEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxImageComboBox, cxContainer, cxLabel, ExtCtrls, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxPC, DBClient, Provider, SqlExpr,
  ActnList, ComCtrls, StdCtrls, cxButtons, cxLookAndFeels, dxSkinBlueprint,
  dxSkinDarkRoom, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinHighContrast, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013White, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSpringTime,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxPCdxBarPopupMenu,
  cxNavigator, dxBarBuiltInMenu, System.Actions;

type
  TfrmCadGrupoContabil = class(TfrmCadBasico)
    ClientAncestralCONTABIL_GRUPO_ID: TFMTBCDField;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralSITUACAO: TStringField;
    ClientAncestralTIPO: TStringField;
    ClientAncestralCEDENTE_ID: TFMTBCDField;
    ClientAncestralBALANCETE_GRUPO_ID: TFMTBCDField;
    tabBalancete: TcxTabControl;
    pnlDados: TPanel;
    cxLabel2: TcxLabel;
    cxLabel1: TcxLabel;
    ClientAncestralOPERACAO: TStringField;
    cxLabel3: TcxLabel;
    ClientAncestralORDEM: TFMTBCDField;
    tabGrupo: TcxTabControl;
    grdBasica: TcxGrid;
    cxGridPesquisa: TcxGridDBTableView;
    cxGridPesquisaColumn4: TcxGridDBColumn;
    cxGridPesquisaColumn1: TcxGridDBColumn;
    cxGridPesquisaColumn2: TcxGridDBColumn;
    cxGridPesquisaColumn3: TcxGridDBColumn;
    cxGridPesquisaColumn5: TcxGridDBColumn;
    grdBasicaLevel1: TcxGridLevel;
    icxTipoOperacao: TcxDBImageComboBox;
    edtOrdem: TcxDBTextEdit;
    chbSituacao: TcxDBCheckBox;
    edtDescricao: TcxDBTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure tabBalanceteChange(Sender: TObject);
    procedure tabBalanceteChanging(Sender: TObject; var AllowChange: Boolean);
    procedure edtOrdemKeyPress(Sender: TObject; var Key: Char);
    procedure tabGrupoChange(Sender: TObject);
  private
    procedure SetState (AState : TDataSetState);override;
    procedure LoadData; override;
  public
  end;

var
  frmCadGrupoContabil: TfrmCadGrupoContabil;

implementation

uses Rotinas, Lookup, Controles, Lookup_Contabil;

{$R *.dfm}

procedure TfrmCadGrupoContabil.tabGrupoChange(Sender: TObject);
begin
  inherited;
  ClientAncestral.Filtered := False;
  ClientAncestral.Filter := '';

  case tabGrupo.TabIndex of
    0: ClientAncestral.Filter := 'SITUACAO = ' + QuotedStr('A');
    1: ClientAncestral.Filter := 'SITUACAO = ' + QuotedStr('I');
    2: exit;
  end;

  ClientAncestral.Filtered := True;
  Screen.Cursor := crDefault;
end;

procedure TfrmCadGrupoContabil.edtOrdemKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  DigitaInteiro(Key);
end;

procedure TfrmCadGrupoContabil.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  if dtmLookup.sqlCedenteAtivos.RecordCount < 1 then
  begin
    Application.MessageBox('N�o existe nenhum cedente cadastrado ou ativo!', 'Aten��o', MB_OK + MB_ICONWARNING);
    exit;
  end;

  icxTipoOperacao.SetFocus;
end;

procedure TfrmCadGrupoContabil.ExecuteGravarExecute(Sender: TObject);
begin
  VerificarPreenchimentoICX_DB(icxTipoOperacao.text,'Tipo da Opera��o',icxTipoOperacao);
  VerificarPreenchimentoEDT_DB(edtDescricao.text,'Descri��o',edtDescricao);
  VerificarPreenchimentoEDT_DB(edtOrdem.text,'Ordem',edtOrdem);

  case ClientAncestralOPERACAO.AsInteger of
    1,3 : ClientAncestralTIPO.AsString := '1';
    4   : ClientAncestralTIPO.AsString := '2';
  else
    ClientAncestralTIPO.AsInteger := ClientAncestralOPERACAO.AsInteger - 2;
  end;

  ClientAncestralBALANCETE_GRUPO_ID.AsInteger := vgTabBalancete[tabBalancete.TabIndex];

  inherited;
  cxGridPesquisa.DataController.Groups.FullExpand;
end;

procedure TfrmCadGrupoContabil.ExecuteIncluirExecute(Sender: TObject);
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

  inherited;
  ClientAncestralSITUACAO.AsString    := 'A';
  ClientAncestralCEDENTE_ID.AsInteger := dtmControles.GetInt('SELECT CEDENTE_ID FROM T_CEDENTE WHERE PRINCIPAL = ''S''');

  icxTipoOperacao.SetFocus;
end;

procedure TfrmCadGrupoContabil.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dtmLookup.AtualizarTabelas;

  Action              := caFree;
  frmCadGrupoContabil := nil;
end;

procedure TfrmCadGrupoContabil.FormCreate(Sender: TObject);
begin
  inherited;
  vgNomeTabela    := 'T_CONTABIL_GRUPO';
  vgChavePrimaria := 'CONTABIL_GRUPO_ID';
  dtmLookup.CarregarTabBalancete(tabBalancete);
  cxGridPesquisa.DataController.Groups.FullExpand;
  tabGrupoChange(Self);
end;

procedure TfrmCadGrupoContabil.LoadData;
begin
  Screen.Cursor := crHourGlass;
  LockWindowUpdate(Handle);
  ClientAncestral.Close;
  DataSetAncestral.ParamByName('CEDENTE_ID').AsInteger         := vgCedenteAtivo;
  DataSetAncestral.ParamByName('BALANCETE_GRUPO_ID').AsInteger := vgTabBalancete[tabBalancete.TabIndex];
  ClientAncestral.Open;
  LockWindowUpdate(0);
  Screen.Cursor := crDefault;
  inherited;
end;

procedure TfrmCadGrupoContabil.SetState(AState: TDataSetState);
begin
  inherited;
  pnlDados.Enabled     := State in [dsEdit, dsInsert];
  grdBasica.Enabled    := State = dsBrowse;
  PanelData.Enabled    := True;
  cxGridPesquisa.DataController.Groups.FullExpand;
end;

procedure TfrmCadGrupoContabil.tabBalanceteChange(Sender: TObject);
begin
  inherited;
  LoadData;
end;

procedure TfrmCadGrupoContabil.tabBalanceteChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  if State in [dsInsert, dsEdit] then
    abort;
end;

end.