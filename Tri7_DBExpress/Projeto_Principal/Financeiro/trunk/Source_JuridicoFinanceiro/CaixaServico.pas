unit CaixaServico;

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
  TfrmCaixaServico = class(TfrmCadBasico)
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
    ClientAncestralSISTEMA_ID: TBCDField;
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
  frmCaixaServico: TfrmCaixaServico;

implementation

uses Controles, Lookup;

{$R *.dfm}

procedure TfrmCaixaServico.FormCreate(Sender: TObject);
begin
  ClientAncestral.Open;
  inherited;
  vgNomeTabela    := 'C_CAIXA_SERVICO';
  vgChavePrimaria := 'CAIXA_SERVICO_ID';

  dtmLookup.CarregarListaSistemasDB(ibxSistema);
end;

procedure TfrmCaixaServico.LoadData;
begin
  inherited;
  if Trim(vgChave) <> '' then
     ClientAncestral.Locate('CAIXA_SERVICO_ID', vgChave, [loCaseInsensitive]);
end;

procedure TfrmCaixaServico.SetState(AState: TDataSetState);
begin
  inherited;
  grdServico.Enabled := State = dsBrowse;
end;

procedure TfrmCaixaServico.ExecuteGravarExecute(Sender: TObject);
begin
  VerificarPreenchimentoICX_DB(ibxSistema.Text, 'Sistema', ibxSistema);
  VerificarPreenchimentoICX_DB(IbxTransacao.Text, 'Tipo Transação', IbxTransacao);
  inherited;

end;

procedure TfrmCaixaServico.ExecuteIncluirExecute(Sender: TObject);
begin
  inherited;
  ClientAncestralINTERNO_SISTEMA.AsString  := 'N';
  ClientAncestralEMITIR_RELATORIO.AsString := 'N';
  IbxTransacao.SetFocus;
end;

procedure TfrmCaixaServico.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  IbxTransacao.SetFocus;
end;

procedure TfrmCaixaServico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action          := caFree;
  frmCaixaServico := nil;
end;

end.
