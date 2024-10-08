unit CadBalanceteGrupo;

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
  ActnList, ComCtrls, StdCtrls, cxButtons, FrameEditorSimples, cxSplitter,
  cxLookAndFeels, dxSkinBlueprint, dxSkinDarkRoom, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinHighContrast, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSpringTime, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  cxNavigator, System.Actions;

type
  TfrmCadGrupoBalancete = class(TfrmCadBasico)
    cxLabel1: TcxLabel;
    grdBasica: TcxGrid;
    cxGridPesquisa: TcxGridDBTableView;
    cxGridPesquisaColumn1: TcxGridDBColumn;
    cxGridPesquisaColumn2: TcxGridDBColumn;
    grdBasicaLevel1: TcxGridLevel;
    ClientAncestralBALANCETE_GRUPO_ID: TBCDField;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralSITUACAO: TStringField;
    ClientAncestralPRINCIPAL: TStringField;
    cxGridPesquisaColumn3: TcxGridDBColumn;
    popBalancete: TPopupMenu;
    mniDefinircomoBalanceteprincipal: TMenuItem;
    cxLabel8: TcxLabel;
    ClientAncestralSIGLA: TStringField;
    lblSigla: TcxLabel;
    cxGridPesquisaColumn4: TcxGridDBColumn;
    fmeEditorSimples1: TfmeEditorSimples;
    ClientAncestralCABECALHO: TBlobField;
    splGrdBasica: TcxSplitter;
    chxPrincipal: TcxDBCheckBox;
    chbSituacao: TcxDBCheckBox;
    edtDescricao: TcxDBTextEdit;
    edtSigla: TcxDBTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure mniDefinircomoBalanceteprincipalClick(Sender: TObject);
    procedure ExecuteExcluirExecute(Sender: TObject);
    procedure ClientAncestralAfterScroll(DataSet: TDataSet);
    procedure ExecuteCancelarExecute(Sender: TObject);
  private

  public
    { Public declarations }
    procedure SetState (AState : TDataSetState);override;
    procedure LoadData; override;
  end;

var
  frmCadGrupoBalancete: TfrmCadGrupoBalancete;

implementation

uses Rotinas, Lookup, Controles, Lookup_Contabil;

{$R *.dfm}

procedure TfrmCadGrupoBalancete.mniDefinircomoBalanceteprincipalClick(
  Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Definir Grupo de Balancete selecionado como Principal?', 'Confirma��o', MB_YESNO) = IDNO then
    exit;

  ExecutaSqlAuxiliar(' UPDATE J_BALANCETE_GRUPO SET PRINCIPAL = '+QuotedStr('N'),1);
  ClientAncestral.Refresh;

  ClientAncestral.Edit;
  ClientAncestralPRINCIPAL.AsString := 'S';
  ClientAncestral.ApplyUpdates(-1);
  vgBalancetePrincipal := dtmControles.GetInt(' SELECT BALANCETE_GRUPO_ID FROM J_BALANCETE_GRUPO '+
                                              ' WHERE PRINCIPAL = ''S''');
end;

procedure TfrmCadGrupoBalancete.ClientAncestralAfterScroll(DataSet: TDataSet);
begin
  inherited;
  fmeEditorSimples1.wptTexto.AsString      := DeCompressString(ClientAncestral.FieldByName('CABECALHO').AsString);
  mniDefinircomoBalanceteprincipal.Enabled := ClientAncestralSITUACAO.AsString = 'A';
end;

procedure TfrmCadGrupoBalancete.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

procedure TfrmCadGrupoBalancete.ExecuteCancelarExecute(Sender: TObject);
begin
  fmeEditorSimples1.wptTexto.AsString := DeCompressString(ClientAncestral.FieldByName('CABECALHO').AsString);
  inherited;

end;

procedure TfrmCadGrupoBalancete.ExecuteExcluirExecute(Sender: TObject);
begin
  if ClientAncestralPRINCIPAL.AsString = 'S' then
  begin
    Application.MessageBox('Grupo de Balancete Principal n�o pode ser exclu�do!', 'Aten��o', MB_OK + MB_ICONWARNING);
    exit;
  end;

  ExecutaSqlAuxiliar(' DELETE FROM J_CENTRO_CUSTO '+
                     ' WHERE BALANCETE_GRUPO_ID = '+ClientAncestralBALANCETE_GRUPO_ID.AsString,1);

  inherited;
  mniDefinircomoBalanceteprincipal.Enabled := ClientAncestral.RecordCount > 1;
end;

procedure TfrmCadGrupoBalancete.ExecuteGravarExecute(Sender: TObject);
begin
  VerificarPreenchimentoEDT_DB(edtDescricao.text,'Descri��o',edtDescricao);
  VerificarPreenchimentoEDT_DB(edtSigla.text,'Sigla',edtSigla);
  ClientAncestral.FieldByName('CABECALHO').AsString := CompressString(fmeEditorSimples1.wptTexto.AsString);
  inherited;
  cxGridPesquisa.DataController.Groups.FullExpand;
  mniDefinircomoBalanceteprincipal.Enabled := ClientAncestral.RecordCount > 1;
end;

procedure TfrmCadGrupoBalancete.ExecuteIncluirExecute(Sender: TObject);
begin
  inherited;
  ClientAncestralSITUACAO.AsString    := 'A';

  if ClientAncestral.RecordCount = 0 then
       ClientAncestralPRINCIPAL.AsString :=  'S'
  else ClientAncestralPRINCIPAL.AsString :=  'N';

  edtDescricao.SetFocus;
end;

procedure TfrmCadGrupoBalancete.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dtmLookupContabil.AtualizarTabelas;
  inherited;
  Action               := caFree;
  frmCadGrupoBalancete := nil;
end;

procedure TfrmCadGrupoBalancete.FormCreate(Sender: TObject);
begin
  inherited;

  vgNomeTabela    := 'J_BALANCETE_GRUPO';
  vgChavePrimaria := 'BALANCETE_GRUPO_ID';

  cxGridPesquisa.DataController.Groups.FullExpand;
end;

procedure TfrmCadGrupoBalancete.LoadData;
begin
  ClientAncestral.Open;
  mniDefinircomoBalanceteprincipal.Enabled := ClientAncestral.RecordCount > 1;
  State := dsBrowse;
  SetState(State);
end;

procedure TfrmCadGrupoBalancete.SetState(AState: TDataSetState);
begin
  State := AState;
  CheckState;
  grdBasica.Enabled         := State = dsBrowse;
  fmeEditorSimples1.Enabled := State in [dsEdit, dsInsert];
  cxGridPesquisa.DataController.Groups.FullExpand;
end;

end.
