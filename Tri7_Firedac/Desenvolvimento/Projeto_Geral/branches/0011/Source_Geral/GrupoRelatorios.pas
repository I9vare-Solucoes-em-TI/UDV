unit GrupoRelatorios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, DB, cxGridLevel, cxGridDBTableView, cxGrid, DBClient,
  cxDBEdit, cxContainer, cxLabel, cxSplitter,
  Menus, Data.FMTBcd, cxControls, cxEdit,

  cxGridCustomTableView, cxGridTableView, cxClasses, cxGridCustomView,
  cxTextEdit, Datasnap.Provider, Data.SqlExpr, System.Actions, Vcl.ActnList,
  Vcl.ComCtrls, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, cxDBData, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, I9Query;
type
  TGrupoRelatorios = class
  private
    FGrupoRelatorioID: Integer;
    FDescricao: string;
    FSistemaID: Integer;

    procedure SetGrupoRelatorioID(
      const Value: Integer);

    procedure SetDescricao(
      const Value: string);

    procedure SetSistemaID(
      const Value: Integer);
  public
    constructor Create(
      const vpGrupoRelatorioID: Integer;
      const vpDescricao: string;
      const vpSistemaID: Integer);

    property GrupoRelatorioID: Integer read FGrupoRelatorioID
      write SetGrupoRelatorioID;

    property Descricao: string read FDescricao write SetDescricao;
    property SistemaID: Integer read FSistemaID write SetSistemaID;
  end;

  TfrmGrupoRelatorio = class(TfrmCadBasico)
    grdGrupoRelatorio: TcxGrid;
    grdGrupoRelatorioDBTableView1: TcxGridDBTableView;
    grdGrupoRelatorioLevel1: TcxGridLevel;
    cxLabel2: TcxLabel;
    cxLabel1: TcxLabel;
    ClientAncestralGRUPO_RELATORIO_ID: TBCDField;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralSISTEMA_ID: TBCDField;
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
    vlID, vlId1 : Integer;
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
  ClientAncestralSISTEMA_ID.AsInteger := vlID;
  inherited;

end;

procedure TfrmGrupoRelatorio.FormCreate(Sender: TObject);
begin
  inherited;

  vlId1 := vgId;
  vlId  := vgId;
  if vgId = 20 then
  begin
    vlId  := 5;
    vlId1 := 17;
  end;

  DataSetAncestral.Params[0].AsInteger := vlID;
  DataSetAncestral.Params[1].AsInteger := vlId1;
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

{ TGrupoRelatorios }

constructor TGrupoRelatorios.Create(
  const vpGrupoRelatorioID: Integer;
  const vpDescricao: string;
  const vpSistemaID: Integer);
begin
  inherited Create;

  GrupoRelatorioID := vpGrupoRelatorioID;
  Descricao := vpDescricao;
  SistemaID := vpSistemaID;
end;

procedure TGrupoRelatorios.SetDescricao(
  const Value: string);
begin
  FDescricao := Value;
end;

procedure TGrupoRelatorios.SetGrupoRelatorioID(
  const Value: Integer);
begin
  FGrupoRelatorioID := Value;
end;

procedure TGrupoRelatorios.SetSistemaID(
  const Value: Integer);
begin
  FSistemaID := Value;
end;

end.
