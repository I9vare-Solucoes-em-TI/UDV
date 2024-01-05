unit GrupoRelatorios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, cxLookAndFeelPainters, FMTBcd, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  DBClient, Provider, SqlExpr, ActnList, ComCtrls, StdCtrls, cxButtons,
  ExtCtrls, cxTextEdit, cxDBEdit, cxContainer, cxLabel, cxSplitter, Menus,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter;

type
  TfrmGrupoRelatorio = class(TfrmCadBasico)
    grdGrupoRelatorio: TcxGrid;
    grdGrupoRelatorioDBTableView1: TcxGridDBTableView;
    grdGrupoRelatorioLevel1: TcxGridLevel;
    cxLabel2: TcxLabel;
    cxLabel1: TcxLabel;
    ClientAncestralGRUPO_RELATORIO_ID: TFMTBCDField;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralSISTEMA_ID: TFMTBCDField;
    cxSplitter1: TcxSplitter;
    grdGrupoRelatorioDBTableView1GRUPO_RELATORIO_ID: TcxGridDBColumn;
    grdGrupoRelatorioDBTableView1DESCRICAO: TcxGridDBColumn;
    edtCodigo: TcxDBTextEdit;
    edtDescricao: TcxDBTextEdit;
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExecutePesquisaExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LoadData; override;
    procedure SetState (AState : TDataSetState);override;
  end;

var
  frmGrupoRelatorio: TfrmGrupoRelatorio;

implementation

uses Controles, Pesquisa;

{$R *.dfm}

procedure TfrmGrupoRelatorio.ExecuteGravarExecute(Sender: TObject);
begin
  ClientAncestralSISTEMA_ID.AsInteger := vgId;
  inherited;

end;

procedure TfrmGrupoRelatorio.FormCreate(Sender: TObject);
begin
  inherited;
  DataSetAncestral.Params[0].AsInteger := vgId;
  ClientAncestral.Open;
  vgNomeTabela    := 'G_GRUPO_RELATORIO';
  vgChavePrimaria := 'GRUPO_RELATORIO_ID';

end;

procedure TfrmGrupoRelatorio.LoadData;
begin
  if Trim(vgChave) <> '' then
     ClientAncestral.Locate('GRUPO_RELATORIO_ID', vgChave, [loCaseInsensitive]);
  inherited;

end;

procedure TfrmGrupoRelatorio.SetState(AState: TDataSetState);
begin
  inherited;
  grdGrupoRelatorio.Enabled := State = dsBrowse;
end;

procedure TfrmGrupoRelatorio.ExecuteIncluirExecute(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

procedure TfrmGrupoRelatorio.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

procedure TfrmGrupoRelatorio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action            := caFree;
  frmGrupoRelatorio := nil;
end;

procedure TfrmGrupoRelatorio.ExecutePesquisaExecute(Sender: TObject);
begin
  inherited;
  vgChave := PesqGrupoRelatorio;
  LoadData;
end;

end.
