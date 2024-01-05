unit PlanoConta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, cxLookAndFeelPainters, FMTBcd, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  DBClient, Provider, SqlExpr, ActnList, ComCtrls, StdCtrls, cxButtons,
  ExtCtrls, cxTextEdit, cxDBEdit, cxContainer, cxLabel, cxSplitter,
  cxMaskEdit, cxDropDownEdit, cxImageComboBox, cxCheckBox, Menus, dxSkinsCore,
  dxSkinsDefaultPainters, SimpleDS, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter;

type
  TfrmPlanoConta = class(TfrmCadBasico)
    grdServico: TcxGrid;
    grdServicoDBTableView1: TcxGridDBTableView;
    grdServicoLevel1: TcxGridLevel;
    cxLabel1: TcxLabel;
    cxSplitter1: TcxSplitter;
    grdServicoDBTableView1DESCRICAO: TcxGridDBColumn;
    grdServicoDBTableView1SITUACAO: TcxGridDBColumn;
    Label2: TLabel;
    ClientAncestralCAIXA_ID: TBCDField;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralSITUACAO: TStringField;
    ClientAncestralRESPONSAVEL_ID: TBCDField;
    edtDescricao: TcxDBTextEdit;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    chbSituacao: TcxDBCheckBox;
    grdServicoDBTableViewRESPONSAVEL: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExecuteGravarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LoadData; override;
    procedure SetState (AState : TDataSetState);override;
  end;

var
  frmPlanoConta: TfrmPlanoConta;

implementation

uses Controles, Lookup, LookupJuridico;

{$R *.dfm}

procedure TfrmPlanoConta.FormCreate(Sender: TObject);
begin
  ClientAncestral.Open;
  inherited;
  vgNomeTabela    := 'J_PLANO_CONTA';
  vgChavePrimaria := 'PLANO_CONTA_ID';
end;

procedure TfrmPlanoConta.LoadData;
begin
  inherited;
  if Trim(vgChave) <> '' then
     ClientAncestral.Locate('CAIXA_ID', vgChave, [loCaseInsensitive]);
end;

procedure TfrmPlanoConta.SetState(AState: TDataSetState);
begin
  inherited;
  grdServico.Enabled := State = dsBrowse;
end;

procedure TfrmPlanoConta.ExecuteGravarExecute(Sender: TObject);
begin
  VerificarPreenchimentoEDT_DB(edtDescricao.Text, 'Sistema', edtDescricao);
  inherited;

end;

procedure TfrmPlanoConta.ExecuteIncluirExecute(Sender: TObject);
begin
  inherited;
  ClientAncestralSITUACAO.AsString  := 'A';
  edtDescricao.SetFocus;
end;

procedure TfrmPlanoConta.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

procedure TfrmPlanoConta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action        := caFree;
  frmPlanoConta := nil;
end;

end.
