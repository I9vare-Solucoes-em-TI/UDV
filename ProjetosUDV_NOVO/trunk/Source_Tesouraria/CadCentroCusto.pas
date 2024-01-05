unit CadCentroCusto;

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
  TfrmCadCentroCusto = class(TfrmCadBasico)
    grdBasica: TcxGrid;
    cxGridPesquisa: TcxGridDBTableView;
    cxGridPesquisaColumn1: TcxGridDBColumn;
    cxGridPesquisaColumn3: TcxGridDBColumn;
    grdBasicaLevel1: TcxGridLevel;
    tabBalancete: TcxTabControl;
    pnlDados: TPanel;
    edtDescricao: TcxDBTextEdit;
    chbSituacao: TcxDBCheckBox;
    cxLabel1: TcxLabel;
    ClientAncestralCENTRO_CUSTO_ID: TFMTBCDField;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralSITUACAO: TStringField;
    ClientAncestralCEDENTE_ID: TFMTBCDField;
    ClientAncestralBALANCETE_GRUPO_ID: TFMTBCDField;
    cxLabel8: TcxLabel;
    ClientAncestralPRINCIPAL: TStringField;
    chxPrincipal: TcxDBCheckBox;
    popCentroCusto: TPopupMenu;
    mniDefinirCentroCustoPrincipal: TMenuItem;
    cxGridPesquisaColumn2: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure tabBalanceteChange(Sender: TObject);
    procedure tabBalanceteChanging(Sender: TObject; var AllowChange: Boolean);
    procedure mniDefinirCentroCustoPrincipalClick(Sender: TObject);
    procedure ExecuteExcluirExecute(Sender: TObject);
  private
    procedure SetState (AState : TDataSetState);override;
    procedure LoadData; override;
  public
  end;

var
  frmCadCentroCusto: TfrmCadCentroCusto;

implementation

uses Rotinas, Lookup, Controles, Lookup_Contabil;

{$R *.dfm}

procedure TfrmCadCentroCusto.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

procedure TfrmCadCentroCusto.ExecuteExcluirExecute(Sender: TObject);
begin
  if ClientAncestralPRINCIPAL.AsString = 'S' then
  begin
    Application.MessageBox('Centro de Custo Principal não pode ser excluído!', 'Atenção', MB_OK + MB_ICONWARNING);
    exit;
  end;

  inherited;
  mniDefinirCentroCustoPrincipal.Enabled := ClientAncestral.RecordCount > 1;
end;

procedure TfrmCadCentroCusto.ExecuteGravarExecute(Sender: TObject);
begin
  VerificarPreenchimentoEDT_DB(edtDescricao.text,'Descrição',edtDescricao);
  ClientAncestralBALANCETE_GRUPO_ID.AsInteger := vgTabBalancete[tabBalancete.TabIndex];

  inherited;
  cxGridPesquisa.DataController.Groups.FullExpand;
end;

procedure TfrmCadCentroCusto.ExecuteIncluirExecute(Sender: TObject);
begin
  if dtmLookup.sqlCedenteAtivos.RecordCount < 1 then
  begin
    Application.MessageBox('Não existe nenhum cedente cadastrado!', 'Atenção', MB_OK + MB_ICONWARNING);
    exit;
  end;

  if tabBalancete.Tabs.Count = 0 then
  begin
    Application.MessageBox('Não existe nenhum balancete cadastrado!', 'Atenção', MB_OK + MB_ICONWARNING);
    exit;
  end;

  inherited;
  ClientAncestralSITUACAO.AsString    := 'A';
  ClientAncestralCEDENTE_ID.AsInteger := vgCedenteAtivo;

  if ClientAncestral.RecordCount = 0 then
       ClientAncestralPRINCIPAL.AsString :=  'S'
  else ClientAncestralPRINCIPAL.AsString :=  'N';

  edtDescricao.SetFocus;
end;

procedure TfrmCadCentroCusto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dtmLookup.AtualizarTabelas;

  Action            := caFree;
  frmCadCentroCusto := nil;
end;

procedure TfrmCadCentroCusto.FormCreate(Sender: TObject);
begin
  inherited;
  vgNomeTabela    := 'T_CENTRO_CUSTO';
  vgChavePrimaria := 'CENTRO_CUSTO_ID';
  dtmLookup.CarregarTabBalancete(tabBalancete);
  cxGridPesquisa.DataController.Groups.FullExpand;
end;

procedure TfrmCadCentroCusto.LoadData;
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

procedure TfrmCadCentroCusto.mniDefinirCentroCustoPrincipalClick(
  Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Definir Centro de Custo selecionado como Principal?', 'Confirmação', MB_YESNO) = IDNO then
    exit;

  ExecutaSqlAuxiliar(' UPDATE T_CENTRO_CUSTO SET PRINCIPAL = '+QuotedStr('N')+
                     ' WHERE BALANCETE_GRUPO_ID = '+IntToStr(vgTabBalancete[tabBalancete.TabIndex]),1);
  ClientAncestral.Refresh;

  ClientAncestral.Edit;
  ClientAncestralPRINCIPAL.AsString := 'S';
  ClientAncestral.ApplyUpdates(-1);
end;

procedure TfrmCadCentroCusto.SetState(AState: TDataSetState);
begin
  inherited;
  pnlDados.Enabled     := State in [dsEdit, dsInsert];
  grdBasica.Enabled    := State = dsBrowse;
  PanelData.Enabled    := True;
  cxGridPesquisa.DataController.Groups.FullExpand;
end;

procedure TfrmCadCentroCusto.tabBalanceteChange(Sender: TObject);
begin
  inherited;
  LoadData;
end;

procedure TfrmCadCentroCusto.tabBalanceteChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  if State in [dsInsert, dsEdit] then
    abort;
end;

end.
