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
  dxSkinDarkRoom, dxSkinDevExpressStyle, dxSkinFoggy, dxSkinHighContrast,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013White, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp,
  dxSkinSharpPlus, dxSkinSpringTime, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint, cxPCdxBarPopupMenu, cxNavigator, dxSkinDevExpressDarkStyle,
  dxBarBuiltInMenu, System.Actions;

type
  TfrmCadGrupoContabil = class(TfrmCadBasico)
    grdBasica: TcxGrid;
    cxGridPesquisa: TcxGridDBTableView;
    cxGridPesquisaColumn1: TcxGridDBColumn;
    cxGridPesquisaColumn2: TcxGridDBColumn;
    cxGridPesquisaColumn3: TcxGridDBColumn;
    cxGridPesquisaColumn5: TcxGridDBColumn;
    grdBasicaLevel1: TcxGridLevel;
    tabBalancete: TcxTabControl;
    pnlDados: TPanel;
    cxLabel2: TcxLabel;
    icxTipoOperacao: TcxDBImageComboBox;
    edtDescricao: TcxDBTextEdit;
    chbSituacao: TcxDBCheckBox;
    cxLabel1: TcxLabel;
    ClientAncestralCONTABIL_GRUPO_ID: TFMTBCDField;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralSITUACAO: TStringField;
    ClientAncestralTIPO: TStringField;
    ClientAncestralBALANCETE_GRUPO_ID: TFMTBCDField;
    ClientAncestralOPERACAO: TStringField;
    cxDBCheckBox1: TcxDBCheckBox;
    ClientAncestralTIPO_GLOBAL: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure tabBalanceteChange(Sender: TObject);
    procedure tabBalanceteChanging(Sender: TObject; var AllowChange: Boolean);
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

procedure TfrmCadGrupoContabil.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  icxTipoOperacao.SetFocus;
end;

procedure TfrmCadGrupoContabil.ExecuteGravarExecute(Sender: TObject);
begin
  VerificarPreenchimentoICX_DB(icxTipoOperacao.text,'Tipo da Opera��o',icxTipoOperacao);
  VerificarPreenchimentoEDT_DB(edtDescricao.text,'Descri��o',edtDescricao);

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
  if tabBalancete.Tabs.Count = 0 then
  begin
    Application.MessageBox('N�o existe nenhum balancete cadastrado!', 'Aten��o', MB_OK + MB_ICONWARNING);
    exit;
  end;

  inherited;
  ClientAncestralSITUACAO.AsString    := 'A';
  icxTipoOperacao.SetFocus;
end;

procedure TfrmCadGrupoContabil.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dtmLookupContabil.AtualizarTabelas;

  Action              := caFree;
  frmCadGrupoContabil := nil;
end;

procedure TfrmCadGrupoContabil.FormCreate(Sender: TObject);
begin
  inherited;
  vgNomeTabela    := 'J_CONTABIL_GRUPO';
  vgChavePrimaria := 'CONTABIL_GRUPO_ID';
  dtmLookupContabil.CarregarTabBalancete(tabBalancete);
  cxGridPesquisa.DataController.Groups.FullExpand;
end;

procedure TfrmCadGrupoContabil.LoadData;
begin
  Screen.Cursor := crHourGlass;
  LockWindowUpdate(Handle);
  ClientAncestral.Close;
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