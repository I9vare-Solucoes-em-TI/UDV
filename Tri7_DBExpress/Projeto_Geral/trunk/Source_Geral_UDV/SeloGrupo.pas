unit SeloGrupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, cxLookAndFeelPainters, FMTBcd, DB, DBClient,
  Provider, SqlExpr, ActnList, ComCtrls, StdCtrls, cxButtons, ExtCtrls,
  FrameEditorSimples, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxImageComboBox, cxMaskEdit,
  cxDropDownEdit, cxDBEdit, cxTextEdit, cxContainer, cxLabel, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxCheckBox, FrameEditor, Menus,
  cxCalendar, cxGroupBox, SimpleDS, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter,
  cxCurrencyEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxLookAndFeels, cxNavigator, dxSkinWhiteprint, dxSkinBlueprint,
  dxSkinDarkRoom, dxSkinDevExpressStyle, dxSkinFoggy, dxSkinHighContrast,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013White, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp,
  dxSkinSharpPlus, dxSkinSpringTime, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinDevExpressDarkStyle, cxPCdxBarPopupMenu, cxPC;

type
  TfrmCadSeloGrupo = class(TfrmCadBasico)
    ClientAncestralSELO_GRUPO_ID: TFMTBCDField;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralSITUACAO: TStringField;
    ClientAncestralNUMERO: TFMTBCDField;
    ClientAncestralCONTROLE_AUTOMATICO: TStringField;
    ClientAncestralTIPO_CARTORIO: TStringField;
    ClientAncestralDESCRICAO_COMPLETA: TStringField;
    cxLabel3: TcxLabel;
    cxLabel1: TcxLabel;
    edtDescricao: TcxDBTextEdit;
    cxLabel2: TcxLabel;
    edtNumeto: TcxDBTextEdit;
    cxLabel4: TcxLabel;
    cxDBImageComboBox1: TcxDBImageComboBox;
    chbSituacao: TcxDBCheckBox;
    cxLabel5: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    cxLabel6: TcxLabel;
    edtEstoqueMinimo: TcxDBTextEdit;
    ClientAncestralESTOQUE_MINIMO: TFMTBCDField;
    btnValidar: TcxButton;
    tabGrupo: TcxTabControl;
    grdBasica: TcxGrid;
    grdBasicaDBTableView1: TcxGridDBTableView;
    cxGridBasicaDBCodigo: TcxGridDBColumn;
    grdBasicaDBTableViewNUMERO: TcxGridDBColumn;
    grdBasicaDBTableViewTIPO_CARTORIO: TcxGridDBColumn;
    grdBasicaDBTableView1Column2: TcxGridDBColumn;
    cxGridBasicaDBSituacao: TcxGridDBColumn;
    grdBasicaDBTableViewDESCRICAO_COMPLETA: TcxGridDBColumn;
    grdBasicaDBTableView1ESTOQUE_MINIMO: TcxGridDBColumn;
    grdBasicaLevel1: TcxGridLevel;
    ClientAncestralPAGINA_ACRESCE: TStringField;
    grdBasicaDBTableView1Column1: TcxGridDBColumn;
    cxLabel7: TcxLabel;
    cxDBImageComboBox2: TcxDBImageComboBox;
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnValidarClick(Sender: TObject);
    procedure tabGrupoChange(Sender: TObject);
  private
    { Private declarations }
  public
    procedure SetState (AState : TDataSetState);override;
    procedure LoadData; override;
  end;

var
  frmCadSeloGrupo: TfrmCadSeloGrupo;

implementation

uses Lookup, Controles, Rotinas, EstoqueSelo;

{$R *.dfm}

procedure TfrmCadSeloGrupo.ExecuteGravarExecute(Sender: TObject);
begin
  VerificarPreenchimentoEDT_DB(edtDescricao.Text, 'Descri��o', edtDescricao);
  VerificarPreenchimentoEDT_DB(edtNumeto.Text, 'N�mero do Tipo do Selo', edtNumeto);

  inherited;
end;

procedure TfrmCadSeloGrupo.LoadData;
begin
  ClientAncestral.Open;
  inherited;
end;

procedure TfrmCadSeloGrupo.SetState(AState: TDataSetState);
begin
  inherited;
  grdBasica.Enabled   := State = dsBrowse;
end;

procedure TfrmCadSeloGrupo.tabGrupoChange(Sender: TObject);
begin
  inherited;
  Screen.Cursor := crHourGlass;
  ClientAncestral.Filtered := False;
  if tabGrupo.TabIndex < 2 then
  begin
    if tabGrupo.TabIndex = 0 then
         ClientAncestral.Filter := 'SITUACAO = '+QuotedStr('A')
    else ClientAncestral.Filter := 'SITUACAO = '+QuotedStr('I');
    ClientAncestral.Filtered := True;
  end;
  Screen.Cursor := crDefault;
end;

procedure TfrmCadSeloGrupo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action          := caFree;
  frmCadSeloGrupo := nil;
end;

procedure TfrmCadSeloGrupo.ExecuteIncluirExecute(Sender: TObject);
begin
  inherited;
  ClientAncestralSITUACAO.AsString            := 'A';
  //ClientAncestralSISTEMA_ID.AsInteger         := vgId;
  edtDescricao.SetFocus;
end;

procedure TfrmCadSeloGrupo.btnValidarClick(Sender: TObject);
var
  viEstoqueSelo : TEstoqueSelo;
begin
  inherited;
  viEstoqueSelo := TEstoqueSelo.Create;
  viEstoqueSelo.VerificaEstoque(False);
  FreeAndNil(viEstoqueSelo);
end;

procedure TfrmCadSeloGrupo.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

procedure TfrmCadSeloGrupo.FormCreate(Sender: TObject);
begin
  inherited;
  vgNomeTabela    := 'G_SELO_GRUPO';
  vgChavePrimaria := 'SELO_GRUPO_ID';
  tabGrupoChange(Self);
end;

end.
