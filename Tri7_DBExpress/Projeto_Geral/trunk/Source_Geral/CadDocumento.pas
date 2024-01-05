unit CadDocumento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, Menus, cxLookAndFeelPainters, FMTBcd, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  cxGraphics, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls, cxGridCustomView,
  cxGrid, cxMaskEdit, cxDropDownEdit, cxImageComboBox, cxDBEdit, cxCheckBox,
  cxTextEdit, cxContainer, cxLabel, DBClient, Provider, SqlExpr, ActnList,
  ComCtrls, StdCtrls, cxButtons, ExtCtrls, cxSplitter, FrameEditor;

type
  TfrmCadDocumento = class(TfrmCadBasico)
    ClientAncestralTB_DOCUMENTOTIPO_ID: TBCDField;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralTEXTO: TBlobField;
    ClientAncestralSITUACAO: TStringField;
    ClientAncestralPOSSUI_NUMERACAO: TStringField;
    grdBasica: TcxGrid;
    grdBasicaDBTableView1: TcxGridDBTableView;
    cxGridBasicaDBDescricao: TcxGridDBColumn;
    grdBasicaDBTableView1Column3: TcxGridDBColumn;
    grdBasicaLevel1: TcxGridLevel;
    fmeEditor1: TfmeEditor;
    cxSplitterBasico: TcxSplitter;
    ClientAncestralORGAO_PADRAO: TStringField;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    grdBasicaDBTableView1Column1: TcxGridDBColumn;
    edtDescricao: TcxDBTextEdit;
    edtSimplificado: TcxDBTextEdit;
    chbSituacao: TcxDBCheckBox;
    cxdbDocOrgao: TcxDBImageComboBox;
    ClientAncestralDESCRICAO_SIMPLIFICADA: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ClientAncestralAfterScroll(DataSet: TDataSet);
  private
    procedure SetState (AState : TDataSetState);override;
    procedure LoadData; override;    
  public
    { Public declarations }
  end;

var
  frmCadDocumento: TfrmCadDocumento;

implementation

uses Controles, Rotinas, Lookup;

{$R *.dfm}

procedure TfrmCadDocumento.ClientAncestralAfterScroll(DataSet: TDataSet);
begin
  inherited;
  fmeEditor1.wptTexto.AsString := DeCompressString(ClientAncestral.FieldByName('TEXTO').AsString)
end;

procedure TfrmCadDocumento.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

procedure TfrmCadDocumento.ExecuteGravarExecute(Sender: TObject);
begin
  VerificarPreenchimentoEDT_DB(edtDescricao.Text, 'Descrição do Documento', edtDescricao);
  VerificarPreenchimentoEDT_DB(edtSimplificado.Text, 'Descrição Simplificada', edtSimplificado);
  ClientAncestral.FieldByName('TEXTO').AsString := CompressString(fmeEditor1.wptTexto.AsString);
  inherited;

end;

procedure TfrmCadDocumento.ExecuteIncluirExecute(Sender: TObject);
begin
  inherited;
  ClientAncestralSITUACAO.AsString := 'A';
  edtDescricao.SetFocus;
end;

procedure TfrmCadDocumento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dtmLookup.AtualizarTabelas;

  Action          := caFree;
  frmCadDocumento := nil;
end;

procedure TfrmCadDocumento.FormCreate(Sender: TObject);
begin
  inherited;
  vgNomeTabela    := 'G_TB_DOCUMENTOTIPO';
  vgChavePrimaria := 'TB_DOCUMENTOTIPO_ID';
end;

procedure TfrmCadDocumento.LoadData;
begin
  ClientAncestral.Open;
  inherited;
end;

procedure TfrmCadDocumento.SetState(AState: TDataSetState);
begin
  inherited;
  grdBasica.Enabled := State = dsBrowse;
end;

end.
