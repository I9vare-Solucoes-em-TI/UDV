unit UsuarioSistema;

interface

uses
  I9Query,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, DB, cxGridLevel, cxGridDBTableView, cxGrid, cxSplitter,
  cxContainer, cxDBLookupComboBox, cxLabel, SimpleDS,
  Menus, FMTBcd, cxControls, cxEdit,

  cxGridCustomTableView, cxGridTableView, cxClasses,
  cxGridCustomView, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, DBClient, Provider, SqlExpr, ActnList, ComCtrls, StdCtrls,
  cxButtons, ExtCtrls, Data.DBXInterBase, System.Actions, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, cxDBData, DbxDevartInterBase;

type
  TfrmUsuarioSistema = class(TfrmCadBasico)
    cxGrid: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxSplitter1: TcxSplitter;
    cxLabel5: TcxLabel;
    lcbGrupo: TcxDBLookupComboBox;
    cxLabel1: TcxLabel;
    lcbUsuario: TcxDBLookupComboBox;
    sqlGrupo: TI9Query;
    sqlUsuario: TI9Query;
    dsGrupo: TDataSource;
    dsUsuario: TDataSource;
    ClientAncestralSISTEMA_ID: TBCDField;
    ClientAncestralUSUARIO_ID: TBCDField;
    ClientAncestralUSUARIO_GRUPO_ID: TBCDField;
    sqlGrupoUSUARIO_GRUPO_ID: TBCDField;
    sqlGrupoDESCRICAO: TStringField;
    sqlGrupoSITUACAO: TStringField;
    sqlUsuarioUSUARIO_ID: TBCDField;
    sqlUsuarioNOME_COMPLETO: TStringField;
    cxGridDBTableView1USUARIO_ID: TcxGridDBColumn;
    cxGridDBTableView1USUARIO_GRUPO_ID: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
  private
    { Private declarations }
    procedure Validar;
  public
    { Public declarations }
    procedure SetState (AState : TDataSetState);override;
    procedure LoadData; override;
  end;

var
  frmUsuarioSistema: TfrmUsuarioSistema;

implementation

uses Controles;

{$R *.dfm}

{ TfrmCadBasico1 }

procedure TfrmUsuarioSistema.LoadData;
begin
  inherited;

end;

procedure TfrmUsuarioSistema.SetState(AState: TDataSetState);
begin
  inherited;
  cxGrid.Enabled := State = dsBrowse;
  lcbUsuario.Enabled := State = dsInsert;
end;

procedure TfrmUsuarioSistema.FormCreate(Sender: TObject);
begin
  sqlGrupo.Connection   := dtmControles.DB;
  sqlUsuario.Connection := dtmControles.DB;
  
  DataSetAncestral.Close;
  DataSetAncestral.Params[0].AsInteger := vgId;
  ClientAncestral.Open;
  inherited;
  sqlGrupo.Open;
  sqlUsuario.Open;
end;

procedure TfrmUsuarioSistema.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  sqlGrupo.Close;
  sqlUsuario.Close;
  Action            := caFree;
  frmUsuarioSistema := nil;
end;

procedure TfrmUsuarioSistema.ExecuteGravarExecute(Sender: TObject);
begin
  Validar;
  if State =  dsInsert then
     ClientAncestralSISTEMA_ID.AsInteger := vgId;
  inherited;

end;

procedure TfrmUsuarioSistema.Validar;
var Sql : String;
begin
  if Trim(lcbGrupo.Text) = '' then
  begin
    Application.MessageBox('Grupo deve ser infomado!', 'Atenção', MB_OK + MB_ICONWARNING);
    lcbGrupo.SetFocus;
    Abort;
  end;

  if Trim(lcbGrupo.Text) = '' then
  begin
    Application.MessageBox('Usuário deve ser infomado!', 'Atenção', MB_OK + MB_ICONWARNING);
    lcbUsuario.SetFocus;
    Abort;
  end;

  if State = dsInsert then
  begin
    Sql := ' select usuario_id '+
           ' from g_usuario_sistema '+
           ' where sistema_id = ' + IntToStr(vgId) +
           ' and usuario_id = ' + IntToStr(lcbUsuario.EditValue);

    if dtmControles.GetInt(Sql) <> 0 then
    begin
      Application.MessageBox('Usuário já cadastrado para este sistema!', 'Atenção', MB_OK + MB_ICONWARNING);
      lcbUsuario.SetFocus;
      Abort;
    end;
  end;
end;

procedure TfrmUsuarioSistema.ExecuteIncluirExecute(Sender: TObject);
begin
  inherited;
  lcbGrupo.SetFocus;
end;

procedure TfrmUsuarioSistema.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  lcbGrupo.SetFocus;
end;

end.
