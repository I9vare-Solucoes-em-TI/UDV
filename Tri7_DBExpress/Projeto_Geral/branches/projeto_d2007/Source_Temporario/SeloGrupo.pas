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
  cxCurrencyEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TfrmCadSeloGrupo = class(TfrmCadBasico)
    grdBasica: TcxGrid;
    grdBasicaDBTableView1: TcxGridDBTableView;
    cxGridBasicaDBCodigo: TcxGridDBColumn;
    cxGridBasicaDBDescricao: TcxGridDBColumn;
    cxGridBasicaDBSituacao: TcxGridDBColumn;
    grdBasicaLevel1: TcxGridLevel;
    ClientAncestralSELO_GRUPO_ID: TBCDField;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralSITUACAO: TStringField;
    ClientAncestralNUMERO: TBCDField;
    grdBasicaDBTableViewNUMERO: TcxGridDBColumn;
    ClientAncestralCONTROLE_AUTOMATICO: TStringField;
    grdBasicaDBTableView1Column2: TcxGridDBColumn;
    ClientAncestralTIPO_CARTORIO: TStringField;
    ClientAncestralDESCRICAO_COMPLETA: TStringField;
    grdBasicaDBTableViewDESCRICAO_COMPLETA: TcxGridDBColumn;
    grdBasicaDBTableViewTIPO_CARTORIO: TcxGridDBColumn;
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
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure SetState (AState : TDataSetState);override;
    procedure LoadData; override;
  end;

var
  frmCadSeloGrupo: TfrmCadSeloGrupo;

implementation

uses Lookup, Controles, Rotinas;

{$R *.dfm}

procedure TfrmCadSeloGrupo.ExecuteGravarExecute(Sender: TObject);
var
  i : Integer;
begin
  VerificarPreenchimentoEDT_DB(edtDescricao.Text, 'Descrição', edtDescricao);
  VerificarPreenchimentoEDT_DB(edtNumeto.Text, 'Número do Tipo do Selo', edtNumeto);

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
end;

end.                                                                                                                               -
