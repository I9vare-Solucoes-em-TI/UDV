unit CadastroBasicoGeral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, DB, DBClient, ActnList, cxButtons, WPCTRMemo, cxGridLevel,
  cxGridDBTableView, cxGrid, cxSplitter, cxDBEdit, cxContainer, cxLabel, Menus,
  FrameEditorSimples,
  cxGridCustomTableView,
  cxGridTableView, cxClasses, cxGridCustomView, cxTextEdit, cxCheckBox,
  Provider, SqlExpr, ComCtrls, StdCtrls, ExtCtrls, Data.FMTBcd, cxControls,
  cxEdit, System.Actions,

  cxPC, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData,
  cxGroupBox, cxRadioGroup, dxSkinsCore, dxSkinBlack, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinMcSkin, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  dxSkinCoffee, dxSkiniMaginary, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, I9Query;

type
  TfrmCadastroBasicoGeral = class(TfrmCadBasico)
    cxSplitter1: TcxSplitter;
    chbSituacao: TcxDBCheckBox;
    cxSplitter2: TcxSplitter;
    fmeEditorSimples: TfmeEditorSimples;
    edtDescricao: TcxDBTextEdit;
    MarcacaomAnual1: TMenuItem;
    btnSelecionar: TcxButton;
    tbcSistemas: TcxTabControl;
    grdBasica: TcxGrid;
    grdBasicaDBTableView1: TcxGridDBTableView;
    cxGridBasicaDBCodigo: TcxGridDBColumn;
    cxGridBasicaDBDescricao: TcxGridDBColumn;
    cxGridBasicaDBSituacao: TcxGridDBColumn;
    grdBasicaLevel1: TcxGridLevel;
    rdgSituacao: TcxRadioGroup;
    lblDescricao: TcxLabel;
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
    procedure tbcSistemasChange(Sender: TObject);
    procedure rdgSituacaoClick(Sender: TObject);
  private
    procedure CarregarTabela(vpSistema : string);
  public
    procedure SetState (AState : TDataSetState);override;
    procedure LoadData; override;
  end;

var
  frmCadastroBasicoGeral: TfrmCadastroBasicoGeral;

implementation

uses Controles, Rotinas, Pesquisa, ControleVariaveis, Lookup;

{$R *.dfm}
{$WARN IMPLICIT_STRING_CAST OFF}
{$WARN IMPLICIT_STRING_CAST_LOSS OFF}

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

procedure TfrmCadastroBasicoGeral.rdgSituacaoClick(Sender: TObject);
begin
  inherited;
  CarregarTabela(IntToStr(vgId));
end;

procedure TfrmCadastroBasicoGeral.SetState(AState: TDataSetState);
begin
  inherited;
  grdBasica.Enabled         := State = dsBrowse;
  fmeEditorSimples.vgEditar := State in [dsEdit, dsInsert];
  rdgSituacao.Enabled       := State = dsBrowse;
end;

procedure TfrmCadastroBasicoGeral.tbcSistemasChange(Sender: TObject);
begin
  inherited;
//  CarregarTabela(IntToStr(vgListaSistemas[tbcSistemas.TabIndex]));
end;

procedure TfrmCadastroBasicoGeral.ExecuteGravarExecute(Sender: TObject);
begin
  VerificarPreenchimentoEDT_DB(edtDescricao.Text, 'Descri��o', edtDescricao);

  if vgDadosCadastroGeral.Texto then
    ClientAncestral.FieldByName('TEXTO').AsAnsiString := CompressString(fmeEditorSimples.wptTexto.AsString);

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

  if vgDadosCadastroGeral.HabTabSistema then
    dtmControles.CarregarSistemasTab(tbcSistemas);

  tbcSistemasChange(Self);

  if vgDadosCadastroGeral.Texto then
       tbcSistemas.Align := alTop
  else tbcSistemas.Align := alClient;

  cxBtnIncluir.SetFocus;
end;

procedure TfrmCadastroBasicoGeral.FormCreate(Sender: TObject);
begin
  inherited;
  if not vgDadosCadastroGeral.HabTabSistema then
    CarregarTabela(IntToStr(vgId));

  cxGridBasicaDBCodigo.DataBinding.FieldName := vgDadosCadastroGeral.Chave;

  vgNomeTabela    := vgDadosCadastroGeral.Tabela;
  vgChavePrimaria := vgDadosCadastroGeral.Chave;

  if vgChaveRetorno = -1 then
       btnSelecionar.Visible := True
  else btnSelecionar.Visible := False;
end;

procedure TfrmCadastroBasicoGeral.CarregarTabela(vpSistema: string);
var
  viCondicao : string;
begin
 viCondicao := '';

  case rdgSituacao.ItemIndex of
    0 : viCondicao := ' AND SITUACAO = ''A'' ';
    1 : viCondicao := ' AND SITUACAO = ''I'' ';
  end;

  if vgDadosCadastroGeral.Sistema then
    viCondicao := viCondicao + ' AND SISTEMA_ID = '+ vpSistema;

  DataSetAncestral.Close;
  ClientAncestral.Close;
  DataSetAncestral.SQL.Text := ' SELECT * '+
                                  ' FROM '+ vgDadosCadastroGeral.Tabela +
                                  ' WHERE 1=1 ' + viCondicao;
  ClientAncestral.Open;
end;

procedure TfrmCadastroBasicoGeral.ClientAncestralAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if vgDadosCadastroGeral.Texto then
    fmeEditorSimples.wptTexto.AsString := DeCompressString(ClientAncestral.FieldByName('TEXTO').AsAnsiString)
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
  vgChaveRetorno := ClientAncestral.FieldByName(vgDadosCadastroGeral.Chave).AsInteger;
  inherited;
end;

procedure TfrmCadastroBasicoGeral.ExecutePesquisaExecute(Sender: TObject);
begin
  inherited;
  vgChave := PesqCadGeral(
    Caption,
    vgDadosCadastroGeral.Tabela,
    vgDadosCadastroGeral.Chave,
    vgDadosCadastroGeral.UsaCondicao);
  LoadData;
end;

procedure TfrmCadastroBasicoGeral.grdBasicaDBTableView1DblClick(
  Sender: TObject);
begin
  inherited;
  if btnSelecionar.Visible then
  begin
    vgChaveRetorno := ClientAncestral.FieldByName(vgDadosCadastroGeral.Chave).AsInteger;
    Close;
  end;
end;

procedure TfrmCadastroBasicoGeral.btnSelecionarClick(Sender: TObject);
begin
  inherited;
  if State in [dsEdit, dsInsert] then
    ExecuteGravarExecute(self);

  grdBasicaDBTableView1DblClick(self);
end;

end.
