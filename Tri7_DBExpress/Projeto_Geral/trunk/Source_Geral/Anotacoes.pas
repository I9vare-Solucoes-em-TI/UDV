unit Anotacoes;

interface

uses
  I9Query,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, cxGridLevel, cxGridDBTableView, cxGrid, cxButtons, ExtCtrls,
  DBClient, SimpleDS, Menus, cxControls, cxGridCustomTableView, cxGridTableView,
  cxClasses, cxGridCustomView, StdCtrls, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, DbxDevartInterBase;

type
  TfrmAnotacoes = class(TForm)
    pnlBotoes: TPanel;
    pnlBotoesBasicos: TPanel;
    btnAnotacaoAlterar: TcxButton;
    btnAnotacaoExcluir: TcxButton;
    btnAnotacaoNova: TcxButton;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Panel1: TPanel;
    btnFechar: TcxButton;
    sqlAnotacao: TI9Query;
    dtsAnotacao: TDataSource;
    sqlAnotacaoANOTACAO_ID: TBCDField;
    sqlAnotacaoUSUARIO_ID: TBCDField;
    sqlAnotacaoMENSAGEM: TBlobField;
    sqlAnotacaoDATA: TSQLTimeStampField;
    sqlAnotacaoTITULO: TStringField;
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAnotacaoNovaClick(Sender: TObject);
    procedure btnAnotacaoAlterarClick(Sender: TObject);
    procedure btnAnotacaoExcluirClick(Sender: TObject);
    procedure cxGridDBTableView1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAnotacoes: TfrmAnotacoes;

implementation

uses Anotacao, Controles;

{$R *.dfm}

procedure TfrmAnotacoes.btnAnotacaoAlterarClick(Sender: TObject);
begin
  frmAnotacao := TfrmAnotacao.Create(nil);
  frmAnotacao.sqlAnotacao.Params[0].AsInteger := sqlAnotacaoANOTACAO_ID.AsInteger;
  frmAnotacao.sqlAnotacao.Active := True;
  frmAnotacao.sqlAnotacao.Edit;
  frmAnotacao.ShowModal;
  sqlAnotacao.Refresh;
end;

procedure TfrmAnotacoes.btnAnotacaoExcluirClick(Sender: TObject);
begin
 if Application.MessageBox('Excluir anotação selecionada?','Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
    exit;

  sqlAnotacao.Delete;
  sqlAnotacao.ApplyUpdates(-1);
end;

procedure TfrmAnotacoes.btnAnotacaoNovaClick(Sender: TObject);
begin
  frmAnotacao := TfrmAnotacao.Create(nil);
  frmAnotacao.sqlAnotacao.Active := False;
  frmAnotacao.sqlAnotacao.Params[0].AsInteger := 0;
  frmAnotacao.sqlAnotacao.Active := True;
  frmAnotacao.sqlAnotacao.Insert;
  frmAnotacao.ShowModal;
  sqlAnotacao.Refresh;
end;

procedure TfrmAnotacoes.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAnotacoes.cxGridDBTableView1DblClick(Sender: TObject);
begin
  btnAnotacaoAlterarClick(self);
end;

procedure TfrmAnotacoes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmAnotacoes := nil;
end;

procedure TfrmAnotacoes.FormCreate(Sender: TObject);
begin
  sqlAnotacao.Connection := dtmControles.DB;

  with sqlAnotacao do
  begin
    Active := False;
    Params[0].AsString := vgUsuarioID;
    Active := True;
  end;  
end;

end.
