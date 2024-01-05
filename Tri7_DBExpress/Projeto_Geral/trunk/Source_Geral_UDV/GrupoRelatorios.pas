unit GrupoRelatorios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, DB, cxGridLevel, cxGridDBTableView, cxGrid, DBClient,
  cxDBEdit, cxContainer, cxLabel, cxSplitter, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, dxSkinsCore, dxSkinBlack, dxSkinCaramel,
  dxSkinCoffee, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinOffice2007Black, FMTBcd, cxControls, cxEdit, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBData, cxGridCustomTableView, cxGridTableView, cxClasses,
  cxGridCustomView, cxTextEdit, Provider, SqlExpr, ActnList, ComCtrls, StdCtrls,
  cxButtons, ExtCtrls, dxSkinBlue, dxSkinBlueprint, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinMoneyTwins, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue;

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
