unit BoletoBanco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, FMTBcd,
  cxEdit, DB,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  DBClient, Provider, SqlExpr, ActnList, ComCtrls, StdCtrls, cxButtons,
  ExtCtrls, cxTextEdit, cxDBEdit, cxContainer, cxLabel, cxSplitter,
  cxMaskEdit, cxDropDownEdit, cxImageComboBox, cxCheckBox, Menus,






  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, SimpleDS, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, cxDBData, DbxDevartInterBase,
  System.Actions;

type
  TfrmBoletoBanco = class(TfrmCadBasico)
    grdBancos: TcxGrid;
    grdBancosDBTableView1: TcxGridDBTableView;
    grdBancosLevel1: TcxGridLevel;
    cxSplitter1: TcxSplitter;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel13: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel14: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel11: TcxLabel;
    grdBancosDBTableView1Column1: TcxGridDBColumn;
    icxBanco: TcxDBImageComboBox;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    lcbModeloBoleto: TcxDBLookupComboBox;
    ClientAncestralBOLETO_BANCO_ID: TFMTBCDField;
    ClientAncestralDB_NOME_BANCO: TStringField;
    ClientAncestralDB_CODIGO_BANCO: TStringField;
    ClientAncestralDB_AGENCIA: TStringField;
    ClientAncestralDB_CONTA: TStringField;
    ClientAncestralDB_DIGITO_CONTA: TStringField;
    ClientAncestralDB_CODIGO_CEDENTE: TStringField;
    ClientAncestralDB_CARTEIRA: TStringField;
    ClientAncestralDB_CONVENIO: TStringField;
    ClientAncestralDB_DIGITO_BANCO: TStringField;
    ClientAncestralCONFIG_RELATORIO_ID: TFMTBCDField;
    sqlRelatorio: TSimpleDataSet;
    sqlRelatorioDESCRICAO: TStringField;
    sqlRelatorioCONFIG_RELATORIO_ID: TFMTBCDField;
    dtsRelatorio: TDataSource;
    chbSituacao: TcxDBCheckBox;
    ClientAncestralSITUACAO: TStringField;
    ClientAncestralDB_CEDENTE: TStringField;
    cxLabel1: TcxLabel;
    cxDBTextEdit7: TcxDBTextEdit;
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
  frmBoletoBanco: TfrmBoletoBanco;

implementation

uses Controles;

{$R *.dfm}

procedure TfrmBoletoBanco.FormCreate(Sender: TObject);
begin
  vgNomeTabela    := 'G_BOLETO_BANCO';
  vgChavePrimaria := 'BOLETO_BANCO_ID';
  ClientAncestral.Open;
  inherited;
  sqlRelatorio.Connection := dtmControles.DB;
  sqlRelatorio.Active := True;
end;

procedure TfrmBoletoBanco.LoadData;
begin
  inherited;
  if Trim(vgChave) <> '' then
     ClientAncestral.Locate('BOLETO_BANCO_ID', vgChave, [loCaseInsensitive]);
end;

procedure TfrmBoletoBanco.SetState(AState: TDataSetState);
begin
  inherited;
  grdBancos.Enabled := State = dsBrowse;
end;

procedure TfrmBoletoBanco.ExecuteGravarExecute(Sender: TObject);
begin
  VerificarPreenchimentoICX_DB(icxBanco.Text,'Banco',icxBanco);

  if ClientAncestralBOLETO_BANCO_ID.IsNull then
    ClientAncestralBOLETO_BANCO_ID.AsCurrency := dtmControles.GerarSequencia('C_BOLETO_BANCO');

  ClientAncestralDB_NOME_BANCO.AsString := icxBanco.Text;
  inherited;
end;

procedure TfrmBoletoBanco.ExecuteIncluirExecute(Sender: TObject);
begin
  inherited;
  ClientAncestralSITUACAO.AsString := 'A';
  icxBanco.SetFocus;
end;

procedure TfrmBoletoBanco.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  icxBanco.SetFocus;
end;

procedure TfrmBoletoBanco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  sqlRelatorio.Active := False;
  Action              := caFree;
  frmBoletoBanco      := nil;
end;

end.
