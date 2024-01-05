unit Anotacao;

interface

uses
  I9Query,
  Windows, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  CadAuxiliar, cxContainer, DB, SimpleDS, cxDBEdit, FrameEditorSimples,
  ExtCtrls, cxLabel, DBClient, StdCtrls, cxButtons, Menus, FMTBcd, cxControls,
  cxEdit, cxTextEdit, Provider, SqlExpr, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, DbxDevartInterBase, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmAnotacao = class(TfrmCadAuxiliar)
    Panel3: TPanel;
    fmeEditorSimples: TfmeEditorSimples;
    Panel6: TPanel;
    cxLabel9: TcxLabel;
    sqlAnotacao: TI9Query;
    sqlAnotacaoANOTACAO_ID: TBCDField;
    sqlAnotacaoUSUARIO_ID: TBCDField;
    sqlAnotacaoDATA: TSQLTimeStampField;
    sqlAnotacaoTITULO: TStringField;
    dtsAnotacao: TDataSource;
    sqlAnotacaoMENSAGEM: TBlobField;
    lblInformacao: TLabel;
    edtDescricao: TcxDBTextEdit;
    btnConfirmar: TcxButton;
    btnCancelarItem: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sqlAnotacaoAfterScroll(DataSet: TDataSet);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarItemClick(Sender: TObject);
  private
    { Private declarations }
  public
    vgNovaAnotacao : Boolean;
  end;

var
  frmAnotacao: TfrmAnotacao;

implementation

uses Rotinas, Controles;

{$R *.dfm}
{$WARN IMPLICIT_STRING_CAST OFF}
{$WARN IMPLICIT_STRING_CAST_LOSS OFF}

procedure TfrmAnotacao.btnCancelarItemClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmAnotacao.btnConfirmarClick(Sender: TObject);
begin
  inherited;
  VerificarPreenchimentoEDT_DB(edtDescricao.Text, 'Descrição', edtDescricao);

  if sqlAnotacaoANOTACAO_ID.AsCurrency = 0 then
  begin
    sqlAnotacaoANOTACAO_ID.AsCurrency := dtmControles.GetInt('SELECT GEN_ID(CHAT_SEQ,1) FROM RDB$DATABASE');
    sqlAnotacaoUSUARIO_ID.AsString := vgUsuarioID;
    sqlAnotacaoDATA.AsDateTime := dtmControles.DataHoraBanco(3);
  end;
  sqlAnotacaoMENSAGEM.AsAnsiString := CompressString(fmeEditorSimples.wptTexto.AsString);
  sqlAnotacao.Post;
  Close;
end;

procedure TfrmAnotacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmAnotacao := nil;
end;

procedure TfrmAnotacao.FormShow(Sender: TObject);
begin
  inherited;
  if edtDescricao.Text <> '' then
    fmeEditorSimples.wptTexto.SetFocus;

  if sqlAnotacaoANOTACAO_ID.AsInteger > 0 then
    lblInformacao.Caption := ' Alterando anotação '
  else if sqlAnotacaoANOTACAO_ID.AsInteger = 0 then
    lblInformacao.Caption := ' Nova anotação '
end;

procedure TfrmAnotacao.sqlAnotacaoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  fmeEditorSimples.wptTexto.AsString := DeCompressString(sqlAnotacaoMENSAGEM.AsAnsiString);
end;

end.
