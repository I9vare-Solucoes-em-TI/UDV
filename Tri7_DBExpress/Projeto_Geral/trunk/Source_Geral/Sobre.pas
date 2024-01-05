unit Sobre;

interface

uses
  I9Query,
  I9Connection,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg, Menus,
  cxButtons, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMemo, cxRichEdit, cxImage, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, frxClass, dxBarBuiltInMenu, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI, Data.DB, FireDAC.Comp.Client, cxPC, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, Datasnap.DBClient, Datasnap.Provider,
  FireDAC.Comp.DataSet, cxDBEdit, dxGDIPlusClasses, cxLabel;

type
  TCargaThread = class(TThread)
  protected
    procedure Execute; override;
  end;

  TfrmSobre = class(TForm)
    DB: TI9Connection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    qryVersaoHistorico: TI9Query;
    ProviderVersaoHistorico: TDataSetProvider;
    sqlVersaoHistorico: TClientDataSet;
    sqlVersaoHistoricoversao_historico_Id: TAutoIncField;
    sqlVersaoHistoriconumero_versao: TStringField;
    sqlVersaoHistoricotexto: TBlobField;
    sqlVersaoHistoricodata_versao: TSQLTimeStampField;
    sqlVersaoHistoricosistema_id: TIntegerField;
    dtsVersaoHistorico: TDataSource;
    Panel1: TPanel;
    cxImage2: TcxImage;
    btnFechar: TcxButton;
    cxRichEdit1: TcxRichEdit;
    lblCarregandoHistoricoVersoes: TcxLabel;
    Panel2: TPanel;
    grdHistoricoVersoes: TcxGrid;
    grdHistoricoVersoesDBTableView: TcxGridDBTableView;
    grdHistoricoVersoesDBTableViewnumero_versao: TcxGridDBColumn;
    grdHistoricoVersoesDBTableViewdata_versao: TcxGridDBColumn;
    grdHistoricoVersoesLevel: TcxGridLevel;
    memTexto: TcxDBMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    ThCarga: TCargaThread;

    procedure ConectarHistoricoVersoes;
    procedure DesconectarHistoricoVersoes;
  public
    { Public declarations }
  end;

var
  frmSobre: TfrmSobre;

implementation

uses
  Controles,
  Rotinas,
  Principal;

{$R *.dfm}

procedure TfrmSobre.ConectarHistoricoVersoes;
begin
  if ConectadoInternet then
  begin
    DB.Open;
    sqlVersaoHistorico.Close;
    sqlVersaoHistorico.Open;
    DB.Close;
    lblCarregandoHistoricoVersoes.Hide;

    dtmControles.ExecSQL('UPDATE G_USUARIO_SISTEMA SET ' +
      'EXIBIR_ALERTA_VERSAO = ''N'' WHERE SISTEMA_ID = ' + vgId.ToString +
      ' AND USUARIO_ID = ' + vgUsuarioID);

    dtmControles.tmrAlertaVersao.Enabled := False;

    // 1 = Registro de Imóveis
    if vgId = 1 then
      frmPrincipal.btnSobre.ImageIndex := 56
    else
      frmPrincipal.btnSobre.ImageIndex := 61;
  end
  else
    lblCarregandoHistoricoVersoes.Caption := 'Não há conexão com a Internet.';
end;

procedure TfrmSobre.DesconectarHistoricoVersoes;
begin
  sqlVersaoHistorico.Close;
end;

procedure TfrmSobre.FormActivate(Sender: TObject);
begin
  ThCarga := TCargaThread.Create(True);  // start
  ThCarga.FreeOnTerminate := True;
  Application.ProcessMessages;
  ThCarga.Start;
end;

procedure TfrmSobre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DesconectarHistoricoVersoes;

  Action   := caFree;
  frmSobre := nil;
end;

procedure TfrmSobre.FormCreate(Sender: TObject);
begin
  FDPhysMySQLDriverLink1.VendorLib := ExtractFilePath(Application.ExeName) +
    'libmysql.dll';

  sqlVersaoHistorico.ParamByName('SISTEMA_ID').AsInteger := vgId;
  sqlVersaoHistorico.ParamByName('LIMITE').AsInteger := 10;
end;

{ TCargaThread }

procedure TCargaThread.Execute;
begin
  inherited;
  Synchronize(frmSobre.ConectarHistoricoVersoes);
end;

end.

