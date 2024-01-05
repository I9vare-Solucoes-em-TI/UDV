unit CadGrupoTextoModelo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, Menus, FMTBcd, cxEdit, DB, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls, cxGridCustomView,
  cxGrid, cxMaskEdit, cxDropDownEdit, cxImageComboBox, cxDBEdit, cxCheckBox,
  cxTextEdit, cxContainer, cxLabel, DBClient, Provider, SqlExpr, ActnList,
  ComCtrls, StdCtrls, cxButtons, ExtCtrls, cxSplitter, FrameEditor,
  System.Actions, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData,
  cxSpinEdit, dxBarBuiltInMenu, cxPC, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, I9Query;

type
  TfrmCadGrupoTextoModelo = class(TfrmCadBasico)
    grdBasica: TcxGrid;
    grdBasicaDBTableView1: TcxGridDBTableView;
    cxGridBasicaDBDescricao: TcxGridDBColumn;
    grdBasicaDBTableView1Column3: TcxGridDBColumn;
    grdBasicaLevel1: TcxGridLevel;
    cxSplitterBasico: TcxSplitter;
    lblDocumento: TcxLabel;
    cxLabel1: TcxLabel;
    grdBasicaDBTableView1Column2: TcxGridDBColumn;
    tbcTexto: TcxTabControl;
    fmeEditor1: TfmeEditor;
    edtDescricao: TcxDBTextEdit;
    icxTipo: TcxDBImageComboBox;
    chbSituacao: TcxDBCheckBox;
    ClientAncestralTB_TXMODELOGRUPO_ID: TBCDField;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralSITUACAO: TStringField;
    ClientAncestralSISTEMA_ID: TBCDField;
    ClientAncestralTIPO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
  public
    procedure SetState (AState : TDataSetState);override;
    procedure LoadData; override;
    { Public declarations }
  end;

var
  frmCadGrupoTextoModelo: TfrmCadGrupoTextoModelo;

implementation

uses Controles, Rotinas, Lookup;

{$R *.dfm}
{$WARNINGS OFF IMPLICIT_STRING_CAST}
{$WARNINGS OFF IMPLICIT_STRING_CAST_LOSS}

procedure TfrmCadGrupoTextoModelo.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

procedure TfrmCadGrupoTextoModelo.ExecuteGravarExecute(Sender: TObject);
  procedure VerificarPreenchimentoSPI_DB(vpDado, vpNomeCampo : string; var vpCampo : TcxDBSpinEdit);
  begin
    if Trim(vpDado) = '' then
    begin
      Application.MessageBox(Pchar('Campo '+vpNomeCampo+ ' não pode ser vazio!!!'), 'Aviso', MB_OK + MB_DEFBUTTON1 + MB_ICONINFORMATION);
      vpCampo.SetFocus;
      Abort;
    end;
  end;
begin
  VerificarPreenchimentoEDT_DB(edtDescricao.Text, 'Descrição do Grupo', edtDescricao);
  VerificarPreenchimentoICX_DB(icxTipo.Text, 'Tipo do Grupo', icxTipo);
  inherited;
end;

procedure TfrmCadGrupoTextoModelo.ExecuteIncluirExecute(Sender: TObject);
begin
  inherited;
  ClientAncestralSITUACAO.AsString := 'A';
  edtDescricao.SetFocus;
end;

procedure TfrmCadGrupoTextoModelo.FormActivate(Sender: TObject);
begin
  inherited;
  tbcTexto.TabIndex := 0;
end;

procedure TfrmCadGrupoTextoModelo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dtmLookup.AtualizarTabelas;

  Action                 := caFree;
  frmCadGrupoTextoModelo := nil;
end;

procedure TfrmCadGrupoTextoModelo.FormCreate(Sender: TObject);
begin
  inherited;
  DataSetAncestral.Params[0].AsInteger := vgId;
  ClientAncestral.Open;

  ClientAncestral.Open;
  vgNomeTabela    := 'G_TB_TXMODELOGRUPO';
  vgChavePrimaria := 'TB_TXMODELOGRUPO_ID';
end;

procedure TfrmCadGrupoTextoModelo.LoadData;
begin
  inherited;
end;

procedure TfrmCadGrupoTextoModelo.SetState(AState: TDataSetState);
begin
  inherited;
  grdBasica.Enabled := State = dsBrowse;
  fmeEditor1.Enabled := State in [dsInsert, dsEdit];
end;

end.
