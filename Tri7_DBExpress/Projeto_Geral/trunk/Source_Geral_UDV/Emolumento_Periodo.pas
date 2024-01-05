unit Emolumento_Periodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, DB, cxGridLevel, cxGridDBTableView, cxGrid, cxDBEdit,
  cxContainer, cxLabel, cxGroupBox, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, dxSkinsCore, dxSkinBlack, dxSkinCaramel,
  dxSkinCoffee, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinOffice2007Black, FMTBcd, cxControls, cxEdit, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBData, cxGridCustomTableView, cxGridTableView, cxClasses,
  cxGridCustomView, cxMaskEdit, cxDropDownEdit, cxCalendar, cxCheckBox,
  cxTextEdit, DBClient, Provider, SqlExpr, ActnList, ComCtrls, StdCtrls,
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
