unit CadEmailTextoPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, Menus, FMTBcd, cxEdit, DB, cxDBEdit,
  cxTextEdit,
  FrameEditorSimples, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxSplitter, cxContainer, cxLabel, DBClient, Provider, SqlExpr, ActnList,
  ComCtrls, StdCtrls, cxButtons, ExtCtrls,


  System.Actions, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData,
  cxCheckBox, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxImageComboBox, FrameEditor, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, I9Query;

type
  TfrmCademailTextoPadrao = class(TfrmCadBasico)
    cxLabel1: TcxLabel;
    cxLabel5: TcxLabel;
    Panel1: TPanel;
    cxSplitter1: TcxSplitter;
    grdBasica: TcxGrid;
    grdBasicaDBTableView1: TcxGridDBTableView;
    cxGridBasicaDBCodigo: TcxGridDBColumn;
    cxGridBasicaDBDescricao: TcxGridDBColumn;
    grdBasicaLevel1: TcxGridLevel;
    cxSplitter2: TcxSplitter;
    edtDescricao: TcxDBTextEdit;
    edtAssunto: TcxDBTextEdit;
    ClientAncestralEMAIL_TEXTO_PADRAO_ID: TBCDField;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralTEXTO: TBlobField;
    ClientAncestralASSUNTO: TStringField;
    ClientAncestralTIPO_EMAIL: TStringField;
    ClientAncestralASSUNTO_PADRAO: TStringField;
    cxLabel2: TcxLabel;
    grdBasicaDBTIPO_EMAIL: TcxGridDBColumn;
    icxTipoEmail: TcxDBImageComboBox;
    fmeEditorSimples: TfmeEditor;
    grdBasicaDBTableView1ASSUNTO: TcxGridDBColumn;
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fmeEditorSimpleswptTextoChange(Sender: TObject);
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure ClientAncestralAfterScroll(DataSet: TDataSet);
    procedure fmeEditorSimpleswptTextoKeyPress(Sender: TObject; var Key: Char);
    procedure fmeEditorSimpleswptTextoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    procedure SetState (AState : TDataSetState);override;
    procedure LoadData; override;
  end;

var
  frmCademailTextoPadrao: TfrmCademailTextoPadrao;

implementation

uses
  Lookup, Controles, Rotinas;

{$R *.dfm}
{$WARN IMPLICIT_STRING_CAST OFF}
{$WARN IMPLICIT_STRING_CAST_LOSS OFF}

procedure TfrmCademailTextoPadrao.ClientAncestralAfterScroll(DataSet: TDataSet);
begin
  inherited;
  fmeEditorSimples.wptTexto.AsString := DeCompressString(ClientAncestral.FieldByName('TEXTO').AsString);
end;

procedure TfrmCademailTextoPadrao.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

procedure TfrmCademailTextoPadrao.ExecuteGravarExecute(Sender: TObject);
begin
  VerificarPreenchimentoEDT_DB(edtDescricao.Text, 'Descrição', edtDescricao);
  VerificarPreenchimentoEDT_DB(edtAssunto.Text, 'Assunto', edtAssunto);
  VerificarPreenchimentoICX_DB(icxTipoEmail.Text, 'Tipo Email', icxTipoEmail);

  ClientAncestral.FieldByName('TEXTO').AsString := CompressString(fmeEditorSimples.wptTexto.AsString);
  inherited;
  ClientAncestral.Refresh;
end;

procedure TfrmCademailTextoPadrao.ExecuteIncluirExecute(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

procedure TfrmCademailTextoPadrao.fmeEditorSimpleswptTextoChange(Sender: TObject);
begin
  inherited;
  if State = dsBrowse then
  begin
    ExecuteAlterar.Execute;
    fmeEditorSimples.wptTexto.SetFocus;
  end;
end;

procedure TfrmCademailTextoPadrao.fmeEditorSimpleswptTextoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  fmeEditorSimples.wptTextoKeyDown(Sender, Key, Shift);

end;

procedure TfrmCademailTextoPadrao.fmeEditorSimpleswptTextoKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  fmeEditorSimples.wptTextoKeyPress(Sender, Key);

end;

procedure TfrmCademailTextoPadrao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dtmLookup.AtualizarTabelas;
  Action                 := caFree;
  frmCademailTextoPadrao := nil;
end;

procedure TfrmCademailTextoPadrao.FormCreate(Sender: TObject);
begin
  inherited;
  ClientAncestral.Open;
  vgNomeTabela    := 'G_EMAIL_TEXTO_PADRAO';
  vgChavePrimaria := 'EMAIL_TEXTO_PADRAO_ID';
end;

procedure TfrmCademailTextoPadrao.LoadData;
begin
  inherited;
  grdBasica.Enabled := State = dsBrowse;
end;

procedure TfrmCademailTextoPadrao.SetState(AState: TDataSetState);
begin
  inherited;
end;

end.
