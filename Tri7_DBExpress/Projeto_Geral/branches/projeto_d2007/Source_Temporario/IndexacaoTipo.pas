unit IndexacaoTipo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, cxLookAndFeelPainters, FMTBcd, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  DBClient, Provider, SqlExpr, ActnList, ComCtrls, StdCtrls, cxButtons,
  ExtCtrls, cxTextEdit, cxDBEdit, cxContainer, cxLabel, cxSplitter,
  cxMaskEdit, cxDropDownEdit, cxCheckBox, cxImageComboBox, Menus, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter;

type
  TfrmIndexacaoTipo = class(TfrmCadBasico)
    grdGrupoRelatorio: TcxGrid;
    grdGrupoRelatorioDBTableView1: TcxGridDBTableView;
    grdGrupoRelatorioLevel1: TcxGridLevel;
    cxLabel2: TcxLabel;
    cxLabel1: TcxLabel;
    cxSplitter1: TcxSplitter;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    edtCodigo: TcxDBTextEdit;
    chbSituacao: TcxDBCheckBox;
    edtDescricao: TcxDBTextEdit;
    edtSigla: TcxDBTextEdit;
    grdGrupoRelatorioDBTableView1DESCRICAO: TcxGridDBColumn;
    grdGrupoRelatorioDBTableView1SIGLA: TcxGridDBColumn;
    grdGrupoRelatorioDBTableView1GRUPO: TcxGridDBColumn;
    grdGrupoRelatorioDBTableView1SITUACAO: TcxGridDBColumn;
    grdGrupoRelatorioDBTableView1INDEXACAO_TIPO_ID: TcxGridDBColumn;
    ClientAncestralINDEXACAO_TIPO_ID: TFMTBCDField;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralSIGLA: TStringField;
    ClientAncestralGRUPO: TStringField;
    ClientAncestralSITUACAO: TStringField;
    ClientAncestralSISTEMA_ID: TFMTBCDField;
    ClientAncestralBD: TStringField;
    icx: TcxDBImageComboBox;
    cxLabel5: TcxLabel;
    cxDBImageComboBox1: TcxDBImageComboBox;
    grdGrupoRelatorioDBTableView1BD: TcxGridDBColumn;
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
  frmIndexacaoTipo: TfrmIndexacaoTipo;

implementation

uses Controles, Pesquisa, Lookup;

{$R *.dfm}

procedure TfrmIndexacaoTipo.ExecuteGravarExecute(Sender: TObject);
begin
  ClientAncestralSISTEMA_ID.AsInteger := vgId;
  inherited;

end;

procedure TfrmIndexacaoTipo.FormCreate(Sender: TObject);
begin
  inherited;
  DataSetAncestral.Params[0].AsInteger := vgId;
  ClientAncestral.Open;
  vgNomeTabela    := 'G_INDEXACAO_TIPO';
  vgChavePrimaria := 'INDEXACAO_TIPO_ID';

end;

procedure TfrmIndexacaoTipo.LoadData;
begin
  if Trim(vgChave) <> '' then
     ClientAncestral.Locate('INDEXACAO_TIPO_ID', vgChave, [loCaseInsensitive]);
  inherited;

end;

procedure TfrmIndexacaoTipo.SetState(AState: TDataSetState);
begin
  inherited;
  grdGrupoRelatorio.Enabled := State = dsBrowse;
end;

procedure TfrmIndexacaoTipo.ExecuteIncluirExecute(Sender: TObject);
begin
  inherited;
  ClientAncestralSITUACAO.AsString := 'A';
  edtDescricao.SetFocus;
end;

procedure TfrmIndexacaoTipo.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

procedure TfrmIndexacaoTipo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action            := caFree;
  frmIndexacaoTipo  := nil;
end;

procedure TfrmIndexacaoTipo.ExecutePesquisaExecute(Sender: TObject);
begin
  inherited;
  vgChave := '';
  LoadData;
end;

end.
