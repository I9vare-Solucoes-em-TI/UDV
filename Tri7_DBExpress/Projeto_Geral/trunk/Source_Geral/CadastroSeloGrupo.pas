unit CadastroSeloGrupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, FMTBcd, DB, DBClient, Provider,
  SqlExpr, ActnList, ComCtrls, StdCtrls, cxButtons, ExtCtrls,
  cxEdit,
  cxImageComboBox, cxMaskEdit, cxDropDownEdit, cxDBEdit, cxTextEdit,
  cxContainer, cxLabel, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid, cxCheckBox,
  Menus,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxPC, System.Actions, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBData;

type
  TfrmCadSeloGrupo = class(TfrmCadBasico)
    ClientAncestralSELO_GRUPO_ID: TFMTBCDField;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralSITUACAO: TStringField;
    ClientAncestralNUMERO: TFMTBCDField;
    ClientAncestralCONTROLE_AUTOMATICO: TStringField;
    ClientAncestralTIPO_CARTORIO: TStringField;
    ClientAncestralDESCRICAO_COMPLETA: TStringField;
    cxLabel3: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    ClientAncestralESTOQUE_MINIMO: TFMTBCDField;
    tabGrupo: TcxTabControl;
    grdBasica: TcxGrid;
    grdBasicaDBTableView1: TcxGridDBTableView;
    cxGridBasicaDBCodigo: TcxGridDBColumn;
    grdBasicaDBTableViewNUMERO: TcxGridDBColumn;
    grdBasicaDBTableViewTIPO_CARTORIO: TcxGridDBColumn;
    grdBasicaDBTableView1Column2: TcxGridDBColumn;
    cxGridBasicaDBSituacao: TcxGridDBColumn;
    grdBasicaDBTableViewDESCRICAO_COMPLETA: TcxGridDBColumn;
    grdBasicaDBTableView1ESTOQUE_MINIMO: TcxGridDBColumn;
    grdBasicaLevel1: TcxGridLevel;
    ClientAncestralPAGINA_ACRESCE: TStringField;
    btnValidar: TcxButton;
    cxLabel4: TcxLabel;
    edtDescricao: TcxDBTextEdit;
    edtNumeto: TcxDBTextEdit;
    edtEstoqueMinimo: TcxDBTextEdit;
    cxDBImageComboBox1: TcxDBImageComboBox;
    chbSituacao: TcxDBCheckBox;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    cxDBTextEdit1: TcxDBTextEdit;
    ClientAncestralSELO_USUARIO: TStringField;
    lblSistema: TcxLabel;
    ibxSistema: TcxDBImageComboBox;
    ClientAncestralSISTEMA_ID: TFMTBCDField;
    grdBasicaDBTableView1SISTEMA_ID: TcxGridDBColumn;
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnValidarClick(Sender: TObject);
    procedure tabGrupoChange(Sender: TObject);
  private
    { Private declarations }
  public
    procedure SetState (AState : TDataSetState);override;
    procedure LoadData; override;
  end;

var
  frmCadSeloGrupo: TfrmCadSeloGrupo;

implementation

uses
  Lookup,
  Controles,
  EstoqueSelo;

{$R *.dfm}

procedure TfrmCadSeloGrupo.ExecuteGravarExecute(Sender: TObject);
begin
  VerificarPreenchimentoEDT_DB(edtDescricao.Text, 'Descrição', edtDescricao);
  VerificarPreenchimentoEDT_DB(edtNumeto.Text, 'Número do Tipo do Selo', edtNumeto);

  inherited;
end;

procedure TfrmCadSeloGrupo.LoadData;
begin
  ClientAncestral.Open;
  inherited;
end;

procedure TfrmCadSeloGrupo.SetState(AState: TDataSetState);
begin
  inherited;
  grdBasica.Enabled   := State = dsBrowse;
end;

procedure TfrmCadSeloGrupo.tabGrupoChange(Sender: TObject);
begin
  inherited;
  Screen.Cursor := crHourGlass;
  ClientAncestral.Filtered := False;
  if tabGrupo.TabIndex < 2 then
  begin
    if tabGrupo.TabIndex = 0 then
         ClientAncestral.Filter := 'SITUACAO = '+QuotedStr('A')
    else ClientAncestral.Filter := 'SITUACAO = '+QuotedStr('I');
    ClientAncestral.Filtered := True;
  end;
  Screen.Cursor := crDefault;
end;

procedure TfrmCadSeloGrupo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action          := caFree;
  frmCadSeloGrupo := nil;
end;

procedure TfrmCadSeloGrupo.ExecuteIncluirExecute(Sender: TObject);
begin
  inherited;
  ClientAncestralSITUACAO.AsString            := 'A';
  //ClientAncestralSISTEMA_ID.AsInteger         := vgId;
  edtDescricao.SetFocus;
end;

procedure TfrmCadSeloGrupo.btnValidarClick(Sender: TObject);
var
  viEstoqueSelo : TEstoqueSelo;
begin
  inherited;
  Screen.Cursor := crHourGlass;
  viEstoqueSelo := TEstoqueSelo.Create;
  viEstoqueSelo.MSN := False;
  viEstoqueSelo.VerificaEstoque;
  FreeAndNil(viEstoqueSelo);
  Screen.Cursor := crDefault;
end;

procedure TfrmCadSeloGrupo.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

procedure TfrmCadSeloGrupo.FormCreate(Sender: TObject);
begin
  inherited;
  vgNomeTabela    := 'G_SELO_GRUPO';
  vgChavePrimaria := 'SELO_GRUPO_ID';
  tabGrupoChange(Self);
end;

end.
