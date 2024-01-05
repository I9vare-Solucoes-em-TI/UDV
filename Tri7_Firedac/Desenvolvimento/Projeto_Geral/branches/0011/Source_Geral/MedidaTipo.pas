unit MedidaTipo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, FMTBcd, cxEdit, DB, cxGridLevel, cxGridCustomTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxTextEdit, cxDBEdit, cxContainer, cxLabel, DBClient, Provider, SqlExpr,
  ActnList, ComCtrls, StdCtrls, cxButtons, ExtCtrls, Menus,cxGridTableView,
  System.Actions, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  I9Query;

type
  TfrmMedidaTipo = class(TfrmCadBasico)
    edtDescricao: TcxDBTextEdit;
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
    lblDescricao: TcxLabel;
    lblSigla: TcxLabel;
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
