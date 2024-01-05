unit MedidaTipo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, cxLookAndFeelPainters, FMTBcd, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxTextEdit, cxDBEdit, cxContainer, cxLabel, DBClient, Provider, SqlExpr,
  ActnList, ComCtrls, StdCtrls, cxButtons, ExtCtrls, Menus, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter;

type
  TfrmMedidaTipo = class(TfrmCadBasico)
    cxLabel1: TcxLabel;
    edtDescricao: TcxDBTextEdit;
    cxLabel2: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    grdBasica: TcxGrid;
    grdBasicaDBTableView1: TcxGridDBTableView;
    cxGridBasicaDBCodigo: TcxGridDBColumn;
    cxGridBasicaDBDescricao: TcxGridDBColumn;
    grdBasicaLevel1: TcxGridLevel;
    cxGridBasicaDbSigla: TcxGridDBColumn;
    ClientAncestralMEDIDA_TIPO_ID: TBCDField;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralSIGLA: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExecuteGravarExecute(Sender: TObject);
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
  frmMedidaTipo: TfrmMedidaTipo;

implementation

uses Controles;

{$R *.dfm}

{ TfrmMedidaTipo }

procedure TfrmMedidaTipo.LoadData;
begin
  ClientAncestral.Open;
  inherited;

end;

procedure TfrmMedidaTipo.SetState(AState: TDataSetState);
begin
  inherited;
  grdBasica.Enabled := state = dsBrowse;
end;

procedure TfrmMedidaTipo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action        := caFree;
  frmMedidaTipo := Nil;
end;

procedure TfrmMedidaTipo.ExecuteGravarExecute(Sender: TObject);
begin
  inherited;
  ClientAncestral.Refresh;
end;

procedure TfrmMedidaTipo.ExecuteIncluirExecute(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

procedure TfrmMedidaTipo.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

procedure TfrmMedidaTipo.FormCreate(Sender: TObject);
begin
  inherited;
  vgNomeTabela    := 'G_MEDIDA_TIPO';
  vgChavePrimaria := 'MEDIDA_TIPO_ID';
end;

end.
