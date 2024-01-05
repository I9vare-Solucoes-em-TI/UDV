unit Feriado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, FMTBcd, DB, DBClient,
  Provider, SqlExpr, ActnList, ComCtrls, StdCtrls, cxButtons, ExtCtrls,

  cxEdit, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxTextEdit, cxDBEdit, cxContainer, cxLabel, cxCheckBox,
  cxMaskEdit, cxDropDownEdit, cxImageComboBox, DBCtrls, SimpleDS,

  ImgList, Menus, Buttons, Grids, DBGrids,
  System.Actions, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData;

type
  TfrmFeriado = class(TfrmCadBasico)
    ClientAncestralFERIADO_ID: TFMTBCDField;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralSITUACAO: TStringField;
    ClientAncestralTIPO: TStringField;
    ClientAncestralDIA: TFMTBCDField;
    ClientAncestralMES: TFMTBCDField;
    ClientAncestralANO: TFMTBCDField;
    pnlDadosFeriado: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    edtCodigo: TcxDBTextEdit;
    edtNome: TcxDBTextEdit;
    chbSituacao: TcxDBCheckBox;
    edtTipo: TcxDBImageComboBox;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    edtAno: TcxDBTextEdit;
    edtDia: TcxDBComboBox;
    edtMes: TcxDBComboBox;
    grdFeriado: TcxGrid;
    grdFeriadoDBTableView1: TcxGridDBTableView;
    grdFeriadoDBTableView1FERIADO_ID: TcxGridDBColumn;
    grdFeriadoDBTableView1DESCRICAO: TcxGridDBColumn;
    grdFeriadoDBTableView1TIPO: TcxGridDBColumn;
    grdFeriadoDBTableView1DIA: TcxGridDBColumn;
    grdFeriadoDBTableView1MES: TcxGridDBColumn;
    grdFeriadoDBTableView1ANO: TcxGridDBColumn;
    grdFeriadoDBTableView1SITUACAO: TcxGridDBColumn;
    grdFeriadoLevel1: TcxGridLevel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure edtTipoPropertiesEditValueChanged(Sender: TObject);
    procedure ExecuteGravarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vgQuery : TSimpleDataSet;
    procedure SetState (AState : TDataSetState);override;
  end;

var
  frmFeriado: TfrmFeriado;

implementation

uses Controles;

{$R *.dfm}

procedure TfrmFeriado.FormCreate(Sender: TObject);
begin
  inherited;
  ClientAncestral.Open;

  vgChavePrimaria := 'FERIADO_ID';
  vgNomeTabela := 'G_FERIADO';
end;

procedure TfrmFeriado.SetState(AState: TDataSetState);
begin
  inherited;
  grdFeriado.Enabled := State = dsBrowse;
  pnlDadosFeriado.Enabled := not grdFeriado.Enabled;
end;

procedure TfrmFeriado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClientAncestral.Close;
  inherited;
  Action     := caFree;
  frmFeriado := nil;
end;

procedure TfrmFeriado.ExecuteIncluirExecute(Sender: TObject);
begin
  inherited;
  ClientAncestralSITUACAO.AsString := 'A';
  edtTipo.SetFocus;
end;

procedure TfrmFeriado.edtTipoPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  edtAno.Enabled := edtTipo.EditValue = 'V'

end;

procedure TfrmFeriado.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  edtTipo.SetFocus;
end;

procedure TfrmFeriado.ExecuteGravarExecute(Sender: TObject);
begin
  if edtTipo.EditValue = 'F' then
    ClientAncestralANO.AsVariant := Null;
  inherited;

end;

end.