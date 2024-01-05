unit Atalhos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, FMTBcd,
  cxEdit, DB,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  DBClient, Provider, SqlExpr, ActnList, ComCtrls, StdCtrls, cxButtons,
  ExtCtrls, cxTextEdit, cxDBEdit, cxContainer, cxLabel, cxSplitter,
  Menus, System.Actions, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData;

type
  TfrmAtalho = class(TfrmCadBasico)
    grdGrupoRelatorio: TcxGrid;
    grdGrupoRelatorioDBTableView1: TcxGridDBTableView;
    grdGrupoRelatorioLevel1: TcxGridLevel;
    cxLabel2: TcxLabel;
    edtAtalhoSistema: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    edtDescricao: TcxDBTextEdit;
    cxSplitter1: TcxSplitter;
    ClientAncestralSISTEMA_ROTINA_ID: TFMTBCDField;
    ClientAncestralCHAVE_ROTINA: TStringField;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralSISTEMA_MENU_ID: TFMTBCDField;
    ClientAncestralATALHO_SISTEMA: TStringField;
    ClientAncestralATALHO_USUARIO: TStringField;
    cxLabel3: TcxLabel;
    edtAtalhoUsuario: TcxDBTextEdit;
    grdGrupoRelatorioDBTableView1DESCRICAO: TcxGridDBColumn;
    grdGrupoRelatorioDBTableView1ATALHO_SISTEMA: TcxGridDBColumn;
    grdGrupoRelatorioDBTableView1ATALHO_USUARIO: TcxGridDBColumn;
    ClientAncestralSISTEMA_ID: TFMTBCDField;
    procedure FormCreate(Sender: TObject);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure ExecutePesquisaExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LoadData; override;
    procedure SetState (AState : TDataSetState);override;
  end;

var
  frmAtalho: TfrmAtalho;

implementation

uses Controles, Pesquisa;

{$R *.dfm}

procedure TfrmAtalho.FormCreate(Sender: TObject);
begin
  inherited;
  vgNomeTabela := 'V_G_SISTEMA_ROTINA';
  DataSetAncestral.Params[0].AsInteger := vgId;
  ClientAncestral.Open;
end;

procedure TfrmAtalho.LoadData;
begin
  inherited;
  if Trim(vgChave) <> '' then
     ClientAncestral.Locate('SISTEMA_ROTINA_ID', vgChave, [loCaseInsensitive]);
end;

procedure TfrmAtalho.SetState(AState: TDataSetState);
begin
  inherited;
  grdGrupoRelatorio.Enabled := State = dsBrowse;
end;

procedure TfrmAtalho.ExecuteIncluirExecute(Sender: TObject);
begin
  inherited;
  edtAtalhoUsuario.SetFocus;
end;

procedure TfrmAtalho.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  edtAtalhoUsuario.SetFocus;
end;

procedure TfrmAtalho.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action    := caFree;
  frmAtalho := nil;
end;

procedure TfrmAtalho.ExecuteGravarExecute(Sender: TObject);
var Sql, Rotina : String;
begin
  //inherited;
  Rotina := dtmControles.BuscarRotina(edtAtalhoUsuario.Text);
  if (Trim(Rotina) = '') or (ClientAncestralCHAVE_ROTINA.AsString = Trim(Rotina)) then
  begin
    try
      Sql := ' UPDATE G_SISTEMA_ROTINA SET ' +
             ' ATALHO_USUARIO = ' + QuotedStr(Trim(edtAtalhoUsuario.Text)) +
             ' WHERE SISTEMA_ROTINA_ID = ' + ClientAncestralSISTEMA_ROTINA_ID.AsString;
      dtmControles.ExecSQL(Sql);
    finally
      SetState(dsBrowse);
    end;
  end
  else begin
       Application.MessageBox('Atalho j� cadastrado para outra rotina!', 'Aten��o', MB_OK + MB_ICONWARNING);
       edtAtalhoUsuario.SetFocus;
  end
end;

procedure TfrmAtalho.ExecutePesquisaExecute(Sender: TObject);
begin
  inherited;
  vgChave := PesqRotina;
  LoadData;
end;

end.