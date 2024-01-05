unit DicionarioGramatical;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, cxLookAndFeelPainters, FMTBcd, DB, DBClient,
  Provider, SqlExpr, ActnList, ComCtrls, StdCtrls, cxButtons, ExtCtrls,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxGroupBox, cxTextEdit, cxDBEdit, cxContainer, cxLabel, Menus, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter;

type
  TfrmDicionarioGramatical = class(TfrmCadBasico)
    cxGridBasica: TcxGrid;
    cxGridBasicaDBTableView1: TcxGridDBTableView;
    cxGridBasicaDBPalavra: TcxGridDBColumn;
    cxGridBasicaDBPrefixo: TcxGridDBColumn;
    cxGridBasicaLevel1: TcxGridLevel;
    ClientAncestralGRAMATICA_ID: TFMTBCDField;
    cxLabel1: TcxLabel;
    edtPalavra: TcxDBTextEdit;
    cxLabel2: TcxLabel;
    edtPrefixo: TcxDBTextEdit;
    cxGroupBox1: TcxGroupBox;
    Panel1: TPanel;
    cxLabel3: TcxLabel;
    ediSufixoMS: TcxDBTextEdit;
    cxLabel4: TcxLabel;
    edtSufixoMP: TcxDBTextEdit;
    Panel2: TPanel;
    cxLabel5: TcxLabel;
    edtSufixoFS: TcxDBTextEdit;
    cxLabel6: TcxLabel;
    edtSufixoFP: TcxDBTextEdit;
    Label1: TLabel;
    ClientAncestralSUFIXO_MS: TStringField;
    ClientAncestralSUFIXO_MP: TStringField;
    ClientAncestralSUFIXO_FS: TStringField;
    ClientAncestralSUFIXO_FP: TStringField;
    ClientAncestralPALAVRA: TStringField;
    ClientAncestralPREFIXO: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ClientAncestralBeforePost(DataSet: TDataSet);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure ExecuteGravarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    procedure SetState (AState : TDataSetState);override;
    procedure LoadData; override;
  end;

var
  frmDicionarioGramatical: TfrmDicionarioGramatical;

implementation

uses Controles;

{$R *.dfm}

{ TfrmDicionarioGramatical }

procedure TfrmDicionarioGramatical.LoadData;
begin
  ClientAncestral.Open;
  inherited;

end;

procedure TfrmDicionarioGramatical.SetState(AState: TDataSetState);
begin
  inherited;
  cxGridBasica.Enabled := cxBtnIncluir.Enabled;  

end;

procedure TfrmDicionarioGramatical.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action      := caFree;
  frmDicionarioGramatical := nil;

end;

procedure TfrmDicionarioGramatical.ClientAncestralBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  if State in [dsInsert] then
    ClientAncestral.FieldByName('GRAMATICA_ID').AsCurrency :=  dtmControles.GerarSequencia('G_GRAMATICA');

end;

procedure TfrmDicionarioGramatical.ExecuteIncluirExecute(Sender: TObject);
begin
  inherited;
  edtPalavra.SetFocus;
end;

procedure TfrmDicionarioGramatical.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  edtPalavra.SetFocus;
end;

procedure TfrmDicionarioGramatical.ExecuteGravarExecute(Sender: TObject);
begin
  VerificarPreenchimentoEDT_DB(edtPalavra.Text, 'Palavra', edtPalavra);
  inherited;
end;

end.
