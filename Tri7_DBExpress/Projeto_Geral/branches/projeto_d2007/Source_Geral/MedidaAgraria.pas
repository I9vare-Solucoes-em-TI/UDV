unit MedidaAgraria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, cxLookAndFeelPainters, FMTBcd, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxCheckBox, cxDBEdit, cxTextEdit, cxContainer, cxLabel, DBClient,
  Provider, SqlExpr, ActnList, ComCtrls, StdCtrls, cxButtons, ExtCtrls,
  SimpleDS, cxCurrencyEdit, Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter;

type
  TfrmMedidaAgraria = class(TfrmCadBasico)
    cxLabel1: TcxLabel;
    edtDescricao: TcxDBTextEdit;
    chbSituacao: TcxDBCheckBox;
    grdMedidaItem: TcxGrid;
    grdMedidaItemDBTableView1: TcxGridDBTableView;
    cxGridBasicaDBTipoMedida: TcxGridDBColumn;
    cxGridBasicaDBValor: TcxGridDBColumn;
    grdMedidaItemLevel1: TcxGridLevel;
    ClientAncestralMEDIDA_AGRARIA_ID: TFMTBCDField;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralSITUACAO: TStringField;
    dtsMedidaItem: TDataSource;
    sqlMedidaItem: TSimpleDataSet;
    sqlMedidaItemMEDIDA_ITEM_ID: TFMTBCDField;
    sqlMedidaItemVALOR: TFMTBCDField;
    sqlMedidaItemMEDIDA_AGRARIA_ID: TFMTBCDField;
    sqlMedidaItemMEDIDA_TIPO_ID: TFMTBCDField;
    grdMedidaAgraria: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure sqlMedidaItemNewRecord(DataSet: TDataSet);
    procedure sqlMedidaItemAfterPost(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure SetState (AState : TDataSetState);override;
    procedure LoadData; override;
  end;

var
  frmMedidaAgraria: TfrmMedidaAgraria;

implementation

uses Lookup, Controles;

{$R *.dfm}

{ TfrmMedidaAgraria }

procedure TfrmMedidaAgraria.LoadData;
begin
  sqlMedidaItem.Connection := dtmControles.DB;

  ClientAncestral.Open;
  sqlMedidaItem.Open;
  inherited;

end;

procedure TfrmMedidaAgraria.SetState(AState: TDataSetState);
begin
  inherited;
  grdMedidaAgraria.Enabled := state = dsBrowse;
  grdMedidaItem.Enabled    := state = dsBrowse;

  if ClientAncestral.IsEmpty then
    grdMedidaItem.Enabled := False;
end;

procedure TfrmMedidaAgraria.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  sqlMedidaItem.Close;

  Action           := caFree;
  frmMedidaAgraria := nil;
end;

procedure TfrmMedidaAgraria.ExecuteGravarExecute(Sender: TObject);
begin
  inherited;
  ClientAncestral.Refresh;
end;

procedure TfrmMedidaAgraria.ExecuteIncluirExecute(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

procedure TfrmMedidaAgraria.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

procedure TfrmMedidaAgraria.sqlMedidaItemNewRecord(DataSet: TDataSet);
begin
  inherited;
  if sqlMedidaItem.State in [dsInsert] then
    sqlMedidaItem.FieldByName('MEDIDA_ITEM_ID').AsCurrency := dtmControles.GerarSequencia('G_MEDIDA_ITEM');
  sqlMedidaItemMEDIDA_AGRARIA_ID.AsCurrency := ClientAncestralMEDIDA_AGRARIA_ID.AsCurrency;

end;

procedure TfrmMedidaAgraria.sqlMedidaItemAfterPost(DataSet: TDataSet);
begin
  inherited;
  sqlMedidaItem.ApplyUpdates(-1);
end;

procedure TfrmMedidaAgraria.FormKeyPress(Sender: TObject; var Key: Char);
begin
//  inherited;

end;

procedure TfrmMedidaAgraria.FormCreate(Sender: TObject);
begin
  inherited;
  vgNomeTabela    := 'G_MEDIDA_AGRARIA';
  vgChavePrimaria := 'MEDIDA_AGRARIA_ID';
end;

end.
