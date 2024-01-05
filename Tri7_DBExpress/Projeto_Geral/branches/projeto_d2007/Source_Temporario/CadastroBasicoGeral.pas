unit CadastroBasicoGeral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, cxLookAndFeelPainters, FMTBcd, DB, DBClient,
  Provider, SqlExpr, ActnList, ComCtrls, StdCtrls, cxButtons, ExtCtrls,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, WPCTRRich, WPTbar, WPRuler, WPRTEDefs, WPCTRMemo,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxSplitter, cxTextEdit,
  cxDBEdit, cxContainer, cxLabel, cxImageComboBox, cxCheckBox, Menus,
  FrameEditorSimples, Buttons, cxCalendar, cxTimeEdit, cxCurrencyEdit,
  cxBlobEdit, dxSkinsCore, dxSkinsDefaultPainters, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter;

type
  TfrmCadastroBasicoGeral = class(TfrmCadBasico)
    cxSplitter1: TcxSplitter;
    chbSituacao: TcxDBCheckBox;
    grdBasica: TcxGrid;
    grdBasicaDBTableView1: TcxGridDBTableView;
    cxGridBasicaDBCodigo: TcxGridDBColumn;
    cxGridBasicaDBDescricao: TcxGridDBColumn;
    cxGridBasicaDBSituacao: TcxGridDBColumn;
    grdBasicaLevel1: TcxGridLevel;
    cxSplitter2: TcxSplitter;
    fmeEditorSimples: TfmeEditorSimples;
    cxLabel1: TcxLabel;
    edtDescricao: TcxDBTextEdit;
    MarcacaomAnual1: TMenuItem;
    btnSelecionar: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ClientAncestralAfterScroll(DataSet: TDataSet);
    procedure fmeEditorSimpleswptTextoChange(Sender: TObject);
    procedure ExecuteFecharExecute(Sender: TObject);
    procedure ExecutePesquisaExecute(Sender: TObject);
    procedure grdBasicaDBTableView1DblClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure MarcacaomAnual1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure SetState (AState : TDataSetState);override;
    procedure LoadData; override;
  end;

var
  frmCadastroBasicoGeral: TfrmCadastroBasicoGeral;

implementation

uses Controles, Principal, Rotinas, Pesquisa, Lookup, ControleVariaveis;

{$R *.dfm}

procedure TfrmCadastroBasicoGeral.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if vgChaveRetorno = -1 then
    vgChaveRetorno := 0;

  dtmLookup.AtualizarTabelas;
  Action                 := caFree;
  frmCadastroBasicoGeral := nil;
end;

procedure TfrmCadastroBasicoGeral.LoadData;
begin
  if Trim(vgChave) <> '' then
     ClientAncestral.Locate(vgDadosCadastroGeral.Chave, vgChave, [loCaseInsensitive]);
  inherited;
end;

procedure TfrmCadastroBasicoGeral.MarcacaomAnual1Click(Sender: TObject);
begin
  inherited;
  Marcacao_Adicionar(fmeEditorSimples.wptTexto,'MANUAL');
end;

procedure TfrmCadastroBasicoGeral.SetState(AState: TDataSetState);
begin
  inherited;
  grdBasica.Enabled := State = dsBrowse;
  fmeEditorSimples.vgEditar := State in [dsEdit, dsInsert];
end;

procedure TfrmCadastroBasicoGeral.ExecuteGravarExecute(Sender: TObject);
begin
  if vgDadosCadastroGeral.Texto then
    ClientAncestral.FieldByName('TEXTO').AsString := CompressString(fmeEditorSimples.wptTexto.AsString);

  if vgDadosCadastroGeral.Sistema then
    ClientAncestral.FieldByName('SISTEMA_ID').AsCurrency := vgId;
  inherited;

end;

procedure TfrmCadastroBasicoGeral.ExecuteIncluirExecute(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
  ClientAncestral.FieldByName('SITUACAO').AsString := 'A';
end;

procedure TfrmCadastroBasicoGeral.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

procedure TfrmCadastroBasicoGeral.FormShow(Sender: TObject);
begin
  inherited;
  frmCadastroBasicoGeral.Caption := vgDadosCadastroGeral.Caption;
  fmeEditorSimples.Visible       := vgDadosCadastroGeral.Texto;
  cxSplitter2.Visible            := vgDadosCadastroGeral.Texto;
  if vgDadosCadastroGeral.Texto then
       grdBasica.Align := alTop
  else grdBasica.Align := alClient;

  cxBtnIncluir.SetFocus;
end;

procedure TfrmCadastroBasicoGeral.FormCreate(Sender: TObject);
begin
  inherited;
  DataSetAncestral.Close;
  ClientAncestral.Close;
  DataSetAncestral.CommandText := ' SELECT * '+
                                  ' FROM '+ vgDadosCadastroGeral.Tabela;
  if vgDadosCadastroGeral.Sistema then
    DataSetAncestral.CommandText := DataSetAncestral.CommandText +
                                    '  WHERE SISTEMA_ID = '+ IntToStr(vgId);
  ClientAncestral.Open;
  cxGridBasicaDBCodigo.DataBinding.FieldName := vgDadosCadastroGeral.Chave;

  vgNomeTabela    := vgDadosCadastroGeral.Tabela;
  vgChavePrimaria := vgDadosCadastroGeral.Chave;

  if vgChaveRetorno = -1 then
       btnSelecionar.Visible := True
  else btnSelecionar.Visible := False;
end;

procedure TfrmCadastroBasicoGeral.ClientAncestralAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if vgDadosCadastroGeral.Texto then
    fmeEditorSimples.wptTexto.AsString := DeCompressString(ClientAncestral.FieldByName('TEXTO').AsString)
end;

procedure TfrmCadastroBasicoGeral.fmeEditorSimpleswptTextoChange(
  Sender: TObject);
begin
  inherited;
  if State = dsBrowse then
  begin
     ExecuteAlterar.Execute;
     fmeEditorSimples.wptTexto.SetFocus;
  end;
end;

procedure TfrmCadastroBasicoGeral.ExecuteFecharExecute(Sender: TObject);
begin
  inherited;
  vgChaveRetorno := 0;
end;

procedure TfrmCadastroBasicoGeral.ExecutePesquisaExecute(Sender: TObject);
begin
  inherited;
  vgChave := PesqCadGeral(Caption, vgDadosCadastroGeral.Tabela, vgDadosCadastroGeral.Chave);
  LoadData;
end;

procedure TfrmCadastroBasicoGeral.grdBasicaDBTableView1DblClick(
  Sender: TObject);
begin
  inherited;
  vgChaveRetorno := ClientAncestral.FieldByName(vgDadosCadastroGeral.Chave).AsInteger;
  Close;
end;

procedure TfrmCadastroBasicoGeral.btnSelecionarClick(Sender: TObject);
begin
  inherited;
  if State in [dsEdit, dsInsert] then
    ExecuteGravarExecute(self);

  grdBasicaDBTableView1DblClick(self);
end;

end.
