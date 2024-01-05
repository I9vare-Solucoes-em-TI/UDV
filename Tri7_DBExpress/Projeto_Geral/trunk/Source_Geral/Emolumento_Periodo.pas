unit Emolumento_Periodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, DB, cxGridLevel, cxGridDBTableView, cxGrid, cxDBEdit,
  cxContainer, cxLabel, cxGroupBox,
  Menus, Data.FMTBcd, cxControls, cxEdit,

  cxGridCustomTableView, cxGridTableView, cxClasses, cxGridCustomView,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxCheckBox, cxTextEdit,
  Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr, System.Actions,
  Vcl.ActnList, Vcl.ComCtrls, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, cxDBData;

type
  TfrmEmolumento_Periodo = class(TfrmCadBasico)
    cxLabel1: TcxLabel;
    cxGroupBox1: TcxGroupBox;
    grdBasica: TcxGrid;
    grdBasicaDBTableView1: TcxGridDBTableView;
    grdBasicaLevel1: TcxGridLevel;
    ClientAncestralEMOLUMENTO_PERIODO_ID: TFMTBCDField;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralSITUACAO: TStringField;
    ClientAncestralDATA_INICIAL: TSQLTimeStampField;
    cxLabel2: TcxLabel;
    grdBasicaDBTableView1DESCRICAO: TcxGridDBColumn;
    grdBasicaDBTableView1SITUACAO: TcxGridDBColumn;
    grdBasicaDBTableView1DATA_INICIAL: TcxGridDBColumn;
    cxLabel3: TcxLabel;
    ClientAncestralANO: TStringField;
    edtDescricao: TcxDBTextEdit;
    chbSituacao: TcxDBCheckBox;
    edtDataInicialPeriodo: TcxDBDateEdit;
    cxDBTextEdit1: TcxDBTextEdit;
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure SetState (AState : TDataSetState);override;
    procedure LoadData; override;
  end;

var
  frmEmolumento_Periodo: TfrmEmolumento_Periodo;

implementation

uses Lookup, Controles;

{$R *.dfm}

{ TfrmCadAtoTipo }

procedure TfrmEmolumento_Periodo.LoadData;
begin
  ClientAncestral.Open;
  inherited;
end;

procedure TfrmEmolumento_Periodo.SetState(AState: TDataSetState);
begin
  inherited;
  grdBasica.Enabled := State = dsBrowse;
end;

procedure TfrmEmolumento_Periodo.ExecuteGravarExecute(Sender: TObject);
begin
  inherited;
  ClientAncestral.Refresh;
  dtmLookup.sqlG_Emolumento_Periodo.Refresh;
end;

procedure TfrmEmolumento_Periodo.ExecuteIncluirExecute(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

procedure TfrmEmolumento_Periodo.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

procedure TfrmEmolumento_Periodo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmEmolumento_Periodo := nil;
end;

procedure TfrmEmolumento_Periodo.FormCreate(Sender: TObject);
begin
  inherited;
  vgNomeTabela    := 'G_EMOLUMENTO_PERIODO';
  vgChavePrimaria := 'EMOLUMENTO_PERIODO_ID';
end;

end.