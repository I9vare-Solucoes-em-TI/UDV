unit Banco;

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
  dxSkinsDefaultPainters;

type
  TfrmBanco = class(TfrmCadBasico)
    grdBancos: TcxGrid;
    grdBancosDBTableView1: TcxGridDBTableView;
    grdBancosLevel1: TcxGridLevel;
    cxLabel2: TcxLabel;
    edtCodigo: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    edtDescricao: TcxDBTextEdit;
    cxSplitter1: TcxSplitter;
    chbSituacao: TcxDBCheckBox;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralSITUACAO: TStringField;
    grdBancosDBTableView1BANCO_ID: TcxGridDBColumn;
    grdBancosDBTableView1DESCRICAO: TcxGridDBColumn;
    grdBancosDBTableView1SITUACAO: TcxGridDBColumn;
    ClientAncestralBANCO_ID: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LoadData; override;
    procedure SetState (AState : TDataSetState);override;
  end;

var
  frmBanco: TfrmBanco;

implementation

uses Controles, Lookup;

{$R *.dfm}

procedure TfrmBanco.FormCreate(Sender: TObject);
begin
  vgNomeTabela    := 'G_BANCO';
  vgChavePrimaria := '';
  ClientAncestral.Open;
  inherited;

end;

procedure TfrmBanco.LoadData;
begin
  inherited;
  if Trim(vgChave) <> '' then
     ClientAncestral.Locate('BANCO_ID', vgChave, [loCaseInsensitive]);
end;

procedure TfrmBanco.SetState(AState: TDataSetState);
begin
  inherited;
  edtCodigo.Enabled := State = dsInsert;
  grdBancos.Enabled := State = dsBrowse;
end;

procedure TfrmBanco.ExecuteIncluirExecute(Sender: TObject);
begin
  inherited;
  ClientAncestralSITUACAO.AsString := 'A';
  edtCodigo.SetFocus;
end;

procedure TfrmBanco.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

procedure TfrmBanco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action   := caFree;
  frmBanco := nil;
end;

end.
