unit UsuarioSistema;

interface

uses
  I9Query,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, cxLookAndFeelPainters, FMTBcd, DB, DBClient,
  Provider, SqlExpr, ActnList, ComCtrls, StdCtrls, cxButtons, ExtCtrls,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxSplitter, cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxLabel, SimpleDS, Menus,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxLookAndFeels, cxNavigator,
   dxSkinBlueprint, dxSkinDarkRoom,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinHighContrast, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013White, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSpringTime,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

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
    procedure SetState(AState: TDataSetState); override;
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
  sqlGrupo.Connection := dtmControles.DB;
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
  Action := caFree;
  frmUsuarioSistema := nil;
end;

procedure TfrmUsuarioSistema.ExecuteGravarExecute(Sender: TObject);
begin
  Validar;
  if State = dsInsert then
    ClientAncestralSISTEMA_ID.AsInteger := vgId;
  inherited;

end;

procedure TfrmUsuarioSistema.Validar;
var
  Sql: String;
begin
  if Trim(lcbGrupo.Text) = '' then
  begin
    Application.MessageBox('Grupo deve ser infomado!', 'Atenção',
      MB_OK + MB_ICONWARNING);
    lcbGrupo.SetFocus;
    Abort;
  end;

  if Trim(lcbGrupo.Text) = '' then
  begin
    Application.MessageBox('Usuário deve ser infomado!', 'Atenção',
      MB_OK + MB_ICONWARNING);
    lcbUsuario.SetFocus;
    Abort;
  end;

  if State = dsInsert then
  begin
    Sql := ' select usuario_id ' + ' from g_usuario_sistema ' +
      ' where sistema_id = ' + IntToStr(vgId) + ' and usuario_id = ' +
      IntToStr(lcbUsuario.EditValue);

    if dtmControles.GetInt(Sql) <> 0 then
    begin
      Application.MessageBox('Usuário já cadastrado para este sistema!',
        'Atenção', MB_OK + MB_ICONWARNING);
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
