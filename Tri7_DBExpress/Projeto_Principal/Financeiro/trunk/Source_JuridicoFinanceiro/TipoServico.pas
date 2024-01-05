unit TipoServico;

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
  dxSkinsDefaultPainters, SimpleDS, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter;

type
  TfrmTipoServico = class(TfrmCadBasico)
    grdServico: TcxGrid;
    grdServicoDBTableView1: TcxGridDBTableView;
    grdServicoLevel1: TcxGridLevel;
    cxLabel2: TcxLabel;
    edtCodigo: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    edtDescricao: TcxDBTextEdit;
    cxSplitter1: TcxSplitter;
    chbSituacao: TcxDBCheckBox;
    IbxTransacao: TcxDBImageComboBox;
    Label1: TLabel;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralSITUACAO: TStringField;
    ClientAncestralTIPO_TRANSACAO: TStringField;
    ClientAncestralCAIXA_SERVICO_ID: TBCDField;
    grdServicoDBTableView1CAIXA_SERVICO_ID: TcxGridDBColumn;
    grdServicoDBTableView1DESCRICAO: TcxGridDBColumn;
    grdServicoDBTableView1SITUACAO: TcxGridDBColumn;
    grdServicoDBTableView1TIPO_TRANSACAO: TcxGridDBColumn;
    Label2: TLabel;
    ibxSistema: TcxDBImageComboBox;
    ClientAncestralINTERNO_SISTEMA: TStringField;
    grdServicoDBTableView1Column1: TcxGridDBColumn;
    ClientAncestralEMITIR_RELATORIO: TStringField;
    ClientAncestralSERVENTIA_REGISTRO_DIARIO: TStringField;
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
  frmTipoServico: TfrmTipoServico;

implementation

uses Controles, Lookup;

{$R *.dfm}

procedure TfrmTipoServico.FormCreate(Sender: TObject);
var
  viServentias : String;
begin

  viServentias := dtmControles.BuscarConfig('PRINCIPAL', 'CARTORIO', 'TIPO_CARTORIO', 'S') +',9';

  ClientAncestral.active := False;
  DataSetAncestral.SQL.Text := ' SELECT * FROM C_CAIXA_SERVICO '+
                                  ' WHERE SERVENTIA_REGISTRO_DIARIO IN ('+viServentias+')'+
                                  ' ORDER BY DESCRICAO ';
  ClientAncestral.active := True;
  inherited;
  vgNomeTabela    := 'C_CAIXA_SERVICO';
  vgChavePrimaria := 'CAIXA_SERVICO_ID';

  dtmLookup.CarregarListaSistemasDB(ibxSistema, True);
  grdServicoDBTableView1.DataController.Groups.FullExpand;
end;

procedure TfrmTipoServico.LoadData;
begin
  inherited;
  if Trim(vgChave) <> '' then
     ClientAncestral.Locate('CAIXA_SERVICO_ID', vgChave, [loCaseInsensitive]);
end;

procedure TfrmTipoServico.SetState(AState: TDataSetState);
begin
  inherited;
  grdServico.Enabled := State = dsBrowse;
end;

procedure TfrmTipoServico.ExecuteGravarExecute(Sender: TObject);
begin
  VerificarPreenchimentoICX_DB(ibxSistema.Text, 'Sistema', ibxSistema);
  VerificarPreenchimentoICX_DB(IbxTransacao.Text, 'Tipo Transação', IbxTransacao);
  inherited;
  grdServicoDBTableView1.DataController.Groups.FullExpand;

end;

procedure TfrmTipoServico.ExecuteIncluirExecute(Sender: TObject);
begin
  inherited;
  ClientAncestralINTERNO_SISTEMA.AsString  := 'N';
  ClientAncestralEMITIR_RELATORIO.AsString := 'N';
  ClientAncestralSITUACAO.AsString         := 'A';
  IbxTransacao.SetFocus;
end;

procedure TfrmTipoServico.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  IbxTransacao.SetFocus;
end;

procedure TfrmTipoServico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action         := caFree;
  frmTipoServico := nil;
end;

end.
