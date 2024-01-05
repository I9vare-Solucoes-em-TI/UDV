unit Emolumento_Periodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, cxLookAndFeelPainters, FMTBcd, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxImageComboBox, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, DBClient, Provider, SqlExpr, ActnList,
  ComCtrls, StdCtrls, cxButtons, ExtCtrls, cxCheckBox, cxDBEdit,
  cxMaskEdit, cxDropDownEdit, cxTextEdit, cxContainer, cxLabel,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, SimpleDS, cxGroupBox,
  cxCurrencyEdit, cxCalendar, Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter;

type
  TfrmEmolumento_Periodo = class(TfrmCadBasico)
    cxLabel1: TcxLabel;
    cxGroupBox1: TcxGroupBox;
    grdBasica: TcxGrid;
    grdBasicaDBTableView1: TcxGridDBTableView;
    grdBasicaLevel1: TcxGridLevel;
    ClientAncestralEMOLUMENTO_PERIODO_ID: TBCDField;
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
