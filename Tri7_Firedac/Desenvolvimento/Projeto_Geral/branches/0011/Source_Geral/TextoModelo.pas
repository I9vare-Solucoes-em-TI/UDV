unit TextoModelo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, FMTBcd, DB, DBClient,
  Provider, SqlExpr, ActnList, ComCtrls, StdCtrls, cxButtons, ExtCtrls,

  cxEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxSplitter, cxDropDownEdit, WPCTRRich,
  WPCTRMemo, cxDBEdit, cxTextEdit, cxMaskEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxContainer, cxLabel, Menus,
  ImgList, FrameEditor, Buttons, cxGroupBox,
  System.Actions, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData,
  cxCheckBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, I9Query;

type
  TPesquisaThread = class(TThread)
  private
  protected
    procedure Execute; override;
  end;
  
  TfrmTextoModelo = class(TfrmCadBasico)
    PanelPesquisa: TPanel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxSplitter1: TcxSplitter;
    cxGridBasica: TcxGrid;
    cxGridBasicaDBTableView1: TcxGridDBTableView;
    cxGridBasicaDBcodigo: TcxGridDBColumn;
    cxGridBasicaDBModeloAto: TcxGridDBColumn;
    cxGridBasicaDBDescricao: TcxGridDBColumn;
    cxGridBasicaLevel1: TcxGridLevel;
    lcbGrupo: TcxDBLookupComboBox;
    edtDescricao: TcxDBTextEdit;
    ImageList1: TImageList;
    ClientAncestralTEXTO_MODELO_ID: TBCDField;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralTEXTO: TBlobField;
    ClientAncestralTB_TXMODELOGRUPO_ID: TBCDField;
    ClientAncestralSISTEMA_ID: TBCDField;
    fmeEditor: TfmeEditor;
    gbxPesquisa: TcxGroupBox;
    cxLabel1: TcxLabel;
    edtPesquisar: TcxTextEdit;
    cxLabel2: TcxLabel;
    edtCodigo: TcxTextEdit;
    btnAdRegimeComunhao: TcxButton;
    ClientAncestralSITUACAO: TStringField;
    chbSituacao: TcxDBCheckBox;
    cxGridBasicaDBTableView1Column1: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ClientAncestralBeforePost(DataSet: TDataSet);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure ClientAncestralAfterScroll(DataSet: TDataSet);
    procedure ExecuteCancelarExecute(Sender: TObject);
    procedure fmeEditorwptTextoChange(Sender: TObject);
    procedure fmeEditorwptTextoChangeCursorPos(Sender: TObject);
    procedure fmeEditorwptTextoKeyPress(Sender: TObject; var Key: Char);
    procedure fmeEditorwptTextoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAdRegimeComunhaoClick(Sender: TObject);
    procedure fmeEditormniDicionarioGramaticalClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ClientAncestralBeforeOpen(DataSet: TDataSet);
    procedure ClientAncestralAfterOpen(DataSet: TDataSet);
    procedure edtCodigoEnter(Sender: TObject);
    procedure edtPesquisarEnter(Sender: TObject);
    procedure edtPesquisarPropertiesChange(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
  private
    vlGravarTexto : Boolean;
    Th: TPesquisaThread;
  public
    procedure SetState (AState : TDataSetState);override;
    procedure PesquisarTexto;
  end;

var
  frmTextoModelo: TfrmTextoModelo;

implementation

uses Controles, Math,
  Lookup, Cadastro, Rotinas;

{$R *.dfm}
{$WARN SYMBOL_DEPRECATED OFF}
{$WARN IMPLICIT_STRING_CAST OFF}
{$WARN IMPLICIT_STRING_CAST_LOSS OFF}

procedure TfrmTextoModelo.SetState(AState: TDataSetState);
begin
  inherited;
  if not vlGravarTexto then
  begin
    PanelData.Visible               := not cxBtnIncluir.Enabled;
    fmeEditor.wptTexto.Enabled      := not PanelData.Enabled;
    fmeEditor.PanelMarcacao.Enabled := not PanelData.Enabled;
  end;

  PanelPesquisa.Enabled := cxBtnIncluir.Enabled;
end;

procedure TfrmTextoModelo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action         := caFree;
  frmTextoModelo := nil;
end;

procedure TfrmTextoModelo.ExecuteGravarExecute(Sender: TObject);
begin
  VerificarPreenchimentoLCX_DB(lcbGrupo.Text, 'Grupo', lcbGrupo);
  VerificarPreenchimentoEDT_DB(edtDescricao.Text, 'Descri��o', edtDescricao);

  if vlGravarTexto and not (ClientAncestral.State in [dsEdit, dsInsert]) then
    ClientAncestral.Edit;
  ClientAncestralTEXTO.AsString        := CompressString(fmeEditor.wptTexto.AsString);
  ClientAncestralSISTEMA_ID.AsCurrency := vgId;

  if ClientAncestralSITUACAO.AsVariant = null then
    ClientAncestralSITUACAO.AsString := 'A';

  inherited;
  vlGravarTexto := False;
  gbxPesquisa.Visible := True;
  dtmControles.Auditoria('G_TEXTO_MODELO', 'TEXTO', vgOperacao, ClientAncestralTEXTO.AsString , ClientAncestralTEXTO_MODELO_ID.AsString ,Caption);
end;

procedure TfrmTextoModelo.ExecuteIncluirExecute(Sender: TObject);
begin
  inherited;
  gbxPesquisa.Visible := False;
  if not vlGravarTexto then
    edtDescricao.SetFocus;
  ClientAncestralSITUACAO.AsString := 'A';
end;

procedure TfrmTextoModelo.ClientAncestralBeforePost(DataSet: TDataSet);
begin
  inherited;
  if State in [dsInsert] then
    ClientAncestral.FieldByName('TEXTO_MODELO_ID').AsCurrency :=  dtmControles.GerarSequencia('G_TEXTO_MODELO');
end;

procedure TfrmTextoModelo.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  if not vlGravarTexto then
    edtDescricao.SetFocus;
end;

procedure TfrmTextoModelo.ClientAncestralAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if (State = dsBrowse) and vgExecutarAferScrool then
    fmeEditor.wptTexto.AsString := DeCompressString(ClientAncestralTEXTO.AsString);
end;

procedure TfrmTextoModelo.ExecuteCancelarExecute(Sender: TObject);
begin
  inherited;
  if ClientAncestralTEXTO_MODELO_ID.AsCurrency > 0 then
    fmeEditor.wptTexto.AsString := DeCompressString(ClientAncestralTEXTO.AsString);
  gbxPesquisa.Visible := True;
end;

procedure TfrmTextoModelo.fmeEditorwptTextoChange(Sender: TObject);
begin
  inherited;
  if not vlGravarTexto then
    if ClientAncestralTEXTO_MODELO_ID.AsCurrency > 0 then
    begin
      vlGravarTexto := True;
      SetState (dsEdit);
    end;
end;

procedure TfrmTextoModelo.fmeEditorwptTextoChangeCursorPos(Sender: TObject);
begin
  inherited;
  StatusBar.Panels[1].Text := fmeEditor.lblInfoMarcacaoInterna.Caption;
end;

procedure TfrmTextoModelo.fmeEditorwptTextoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  fmeEditor.wptTextoKeyPress(Sender, Key);
end;

procedure TfrmTextoModelo.fmeEditorwptTextoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not ClientAncestral.IsEmpty then
  begin
    vlGravarTexto := True;
    ExecuteAlterarExecute(self);
  end;
end;

procedure TfrmTextoModelo.btnAdRegimeComunhaoClick(Sender: TObject);
begin
  inherited;
  CadGruposTextoModelo(True);
end;

procedure TfrmTextoModelo.fmeEditormniDicionarioGramaticalClick(
  Sender: TObject);
begin
  inherited;
  vgMarcacaoAutoGrupo := 'GLOBAL';
  fmeEditor.actMarcacaoAutomaticaExecute(Sender);
end;

procedure TfrmTextoModelo.FormShow(Sender: TObject);
begin
  inherited;
  fmeEditor.wptTexto.AsString := DeCompressString(ClientAncestralTEXTO.AsString);
  edtPesquisar.SetFocus;
end;

procedure TfrmTextoModelo.FormCreate(Sender: TObject);
begin
  inherited;
  ClientAncestral.Close;
  DataSetAncestral.ParamByName('SISTEMA_ID').AsBCD := vgId;
  ClientAncestral.Open;
end;

{ TPesquisaThread }

procedure TPesquisaThread.Execute;
begin
  inherited;
  Synchronize(frmTextoModelo.PesquisarTexto);
end;

procedure TfrmTextoModelo.PesquisarTexto;
var Sql : String;
begin
  ClientAncestral.Close;
  Sql := ' SELECT * FROM G_TEXTO_MODELO ' +
         ' WHERE SISTEMA_ID =  ' + IntToStr(vgId);
  if Trim(edtCodigo.Text) <> '' then
     Sql := Sql + ' AND TEXTO_MODELO_ID = ' + edtCodigo.Text
  else
  if Trim(edtPesquisar.Text) <> '' then
     Sql := Sql + ' AND DESCRICAO LIKE ' + QuotedStr(edtPesquisar.Text + '%');
  DataSetAncestral.SQL.Text := Sql + ' ORDER BY DESCRICAO ';
  ClientAncestral.Open;
end;

procedure TfrmTextoModelo.ClientAncestralBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  ClientAncestral.AfterScroll := nil;
end;

procedure TfrmTextoModelo.ClientAncestralAfterOpen(DataSet: TDataSet);
begin
  inherited;
  ClientAncestral.AfterScroll := ClientAncestralAfterScroll;
end;

procedure TfrmTextoModelo.edtCodigoEnter(Sender: TObject);
begin
  inherited;
  edtPesquisar.Clear;
end;

procedure TfrmTextoModelo.edtPesquisarEnter(Sender: TObject);
begin
  inherited;
  edtCodigo.Clear;
end;

procedure TfrmTextoModelo.edtPesquisarPropertiesChange(Sender: TObject);
begin
  inherited;
  DBApplication.ProcessMessages;
  Th := TPesquisaThread.Create (true);  // start
  th.FreeOnTerminate:= true;
  application.ProcessMessages;
  th.Resume;
end;

procedure TfrmTextoModelo.edtCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  DigitaInteiro(Key);
end;

end.



