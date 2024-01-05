unit CadRegimeComunhao;

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
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, cxDBEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit,
  FrameEditorSimples, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxSplitter, cxContainer, cxLabel, DBClient, Provider, SqlExpr, ActnList,
  ComCtrls, StdCtrls, cxButtons, ExtCtrls, cxLookAndFeels, cxNavigator;

type
  TfrmCadRegimeComunhao = class(TfrmCadBasico)
    cxLabel1: TcxLabel;
    cxLabel5: TcxLabel;
    Panel1: TPanel;
    cxSplitter1: TcxSplitter;
    grdBasica: TcxGrid;
    grdBasicaDBTableView1: TcxGridDBTableView;
    cxGridBasicaDBCodigo: TcxGridDBColumn;
    cxGridBasicaDBDescricao: TcxGridDBColumn;
    cxGridBasicaDBSituacao: TcxGridDBColumn;
    grdBasicaLevel1: TcxGridLevel;
    cxSplitter2: TcxSplitter;
    fmeEditorSimples: TfmeEditorSimples;
    MarcacaomAnual1: TMenuItem;
    edtDescricao: TcxDBTextEdit;
    lcxRegimeBens: TcxDBLookupComboBox;
    chbSituacao: TcxDBCheckBox;
    grdBasicaDBTableView1Column1: TcxGridDBColumn;
    ClientAncestralTB_REGIMECOMUNHAO_ID: TBCDField;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralTEXTO: TBlobField;
    ClientAncestralSITUACAO: TStringField;
    ClientAncestralTB_REGIMEBENS_ID: TBCDField;
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fmeEditorSimpleswptTextoChange(Sender: TObject);
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure ClientAncestralAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    procedure SetState (AState : TDataSetState);override;
    procedure LoadData; override;
  end;

var
  frmCadRegimeComunhao: TfrmCadRegimeComunhao;

implementation

uses
  Lookup, Controles, Rotinas;

{$R *.dfm}

procedure TfrmCadRegimeComunhao.ClientAncestralAfterScroll(DataSet: TDataSet);
begin
  inherited;
  fmeEditorSimples.wptTexto.AsString := DeCompressString(ClientAncestral.FieldByName('TEXTO').AsString);
end;

procedure TfrmCadRegimeComunhao.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

procedure TfrmCadRegimeComunhao.ExecuteGravarExecute(Sender: TObject);
begin
  VerificarPreenchimentoEDT_DB(edtDescricao.Text, 'Descrição', edtDescricao);
  VerificarPreenchimentoLCX_DB(lcxRegimeBens.Text, 'Regime de Bens', lcxRegimeBens);

  ClientAncestral.FieldByName('TEXTO').AsString := CompressString(fmeEditorSimples.wptTexto.AsString);
  inherited;
  ClientAncestral.Refresh;
end;

procedure TfrmCadRegimeComunhao.ExecuteIncluirExecute(Sender: TObject);
begin
  inherited;
  ClientAncestralSITUACAO.AsString := 'A';
  edtDescricao.SetFocus;
end;

procedure TfrmCadRegimeComunhao.fmeEditorSimpleswptTextoChange(Sender: TObject);
begin
  inherited;
  if State = dsBrowse then
  begin
    ExecuteAlterar.Execute;
    fmeEditorSimples.wptTexto.SetFocus;
  end;
end;

procedure TfrmCadRegimeComunhao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action               := caFree;
  frmCadRegimeComunhao := nil;
end;

procedure TfrmCadRegimeComunhao.FormCreate(Sender: TObject);
begin
  inherited;
  vgNomeTabela    := 'G_TB_REGIMECOMUNHAO';
  vgChavePrimaria := 'TB_REGIMECOMUNHAO_ID';
end;

procedure TfrmCadRegimeComunhao.LoadData;
begin
  inherited;
  grdBasica.Enabled := State = dsBrowse;
end;

procedure TfrmCadRegimeComunhao.SetState(AState: TDataSetState);
begin
  ClientAncestral.Open;
  inherited;
end;

end.
