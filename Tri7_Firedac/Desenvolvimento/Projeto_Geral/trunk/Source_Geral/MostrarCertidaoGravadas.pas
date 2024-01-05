unit MostrarCertidaoGravadas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadAuxiliar, FMTBcd,
  cxEdit, DB,
  FrameEditorSimples, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, DBClient, Provider, SqlExpr, StdCtrls,
  cxButtons, ExtCtrls, cxTextEdit, cxContainer, cxLabel, WPRTEEdit,
  WPCTRRich, WPRuler, WPRTEDefs, Menus, ClipBrd,
  cxSplitter, cxPC, WPCTRMemo, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, cxDBData, cxCalendar, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, I9Query;

type
  TfrmMostrarCertidaoGravada = class(TfrmCadAuxiliar)
    btnConfirmar: TcxButton;
    Panel3: TPanel;
    edtDescricao: TcxTextEdit;
    pgcVisualizacao: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    pnlTexto: TPanel;
    fmeEditorSimples: TfmeEditorSimples;
    cxGridBasica: TcxGrid;
    cxGridBasicaDB: TcxGridDBTableView;
    cxGridBasicaDBDescricao: TcxGridDBColumn;
    cxGridBasicaDBData: TcxGridDBColumn;
    cxGridBasicaDBUsuario: TcxGridDBColumn;
    cxGridBasicaLevel1: TcxGridLevel;
    cxTabSheet2: TcxTabSheet;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxSplitterTexto: TcxSplitter;
    Panel2: TPanel;
    wptTexto: TWPRichText;
    WPReguaHorizontal: TWPRuler;
    cxLabel26: TcxLabel;
    ClientAncestralCERTIDAO_GRAVADA_ID: TBCDField;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralDATA: TSQLTimeStampField;
    ClientAncestralTEXTO: TBlobField;
    ClientAncestralUSUARIO_ID: TBCDField;
    btnPesquisarDoc: TcxButton;
    procedure ClientAncestralAfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ClientAncestralBeforeOpen(DataSet: TDataSet);
    procedure ClientAncestralAfterOpen(DataSet: TDataSet);
    procedure cxGridBasicaDBDblClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure pgcVisualizacaoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarDocClick(Sender: TObject);
    procedure edtDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
  public
  end;

var
  frmMostrarCertidaoGravada: TfrmMostrarCertidaoGravada;
  vgCertidaoSelecionada : Boolean;
  vgCertidaoId : integer;
  vgCertidaoNome : String;

implementation

uses Lookup, Rotinas, Controles, ControleVariaveis;

{$R *.dfm}
{$WARN IMPLICIT_STRING_CAST OFF}
{$WARN IMPLICIT_STRING_CAST_LOSS OFF}

procedure TfrmMostrarCertidaoGravada.ClientAncestralAfterScroll(
  DataSet: TDataSet);
  procedure AjustarTexto(vpWptTexto : TWPRichText);
  begin
    vpWptTexto.AsString := DeCompressString(ClientAncestral.FieldByName('TEXTO').AsString);
    vpWptTexto.SelectionAsString := '';
    vpWptTexto.AutoZoom := wpAutoZoomWidth;

    try
      vpWptTexto.ProtectedProp := [ppParProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
      vpWptTexto.SelectAll;
      vpWptTexto.CurrAttr.DeleteStyle([afsProtected]);
      vpWptTexto.BookmarkDeleteAllMarkers;
      Marcacao_RetirarDicionarioGramatical(vpWptTexto);
      vpWptTexto.HideSelection;
      vpWptTexto.CPPosition := $0;
    except
    end;
  end;

begin
  inherited;

  fmeEditorSimples.wptTexto.HideSelection;
  wptTexto.HideSelection;

  if pgcVisualizacao.ActivePageIndex = 0 then
       AjustarTexto(fmeEditorSimples.wptTexto)
  else AjustarTexto(wptTexto);
end;

procedure TfrmMostrarCertidaoGravada.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ClientAncestral.Active        := False;

  Action := caFree;
  frmMostrarCertidaoGravada := nil;
end;

procedure TfrmMostrarCertidaoGravada.ClientAncestralBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  ClientAncestral.AfterScroll := nil;
end;

procedure TfrmMostrarCertidaoGravada.ClientAncestralAfterOpen(DataSet: TDataSet);
begin
  inherited;
  ClientAncestral.AfterScroll := ClientAncestralAfterScroll;
end;

procedure TfrmMostrarCertidaoGravada.cxGridBasicaDBDblClick(Sender: TObject);
begin
  inherited;
  if not ClientAncestral.IsEmpty then
    btnConfirmarClick(self);
end;

procedure TfrmMostrarCertidaoGravada.edtDescricaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = 13 then
    btnPesquisarDocClick(Self);
end;

procedure TfrmMostrarCertidaoGravada.btnConfirmarClick(Sender: TObject);

  procedure SelecionatTexto(vpWptTexto : TWPRichText);
  begin
    vpWptTexto.SelectAll;
    vpWptTexto.CurrAttr.DeleteStyle([ afsProtected ]);
    RedefinirPadraoFonte(vpWptTexto);
    vpWptTexto.CopyToClipboard;
    vpWptTexto.ProtectedProp := [ppParProtected,ppProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
  end;

begin
  inherited;

  fmeEditorSimples.wptTexto.ProtectedProp := [ppParProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
  wptTexto.ProtectedProp         := [ppParProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];

  if (not (fmeEditorSimples.wptTexto.IsSelected)) and (not (wptTexto.IsSelected)) then
  begin
    if pgcVisualizacao.ActivePageIndex = 0 then
         SelecionatTexto(fmeEditorSimples.wptTexto)
    else SelecionatTexto(wptTexto);
  end
  else
  begin
    if pgcVisualizacao.ActivePageIndex = 0 then
    begin
      fmeEditorSimples.wptTexto.CurrAttr.DeleteStyle([ afsProtected ]);
      RedefinirPadraoFonte(fmeEditorSimples.wptTexto);
      fmeEditorSimples.wptTexto.CopyToClipboard;
    end
    else
    begin
      wptTexto.CurrAttr.DeleteStyle([ afsProtected ]);
      RedefinirPadraoFonte(wptTexto);
      wptTexto.CopyToClipboard;
    end;
  end;
  vgCertidaoId   := ClientAncestralCERTIDAO_GRAVADA_ID.AsInteger;
  vgCertidaoNome := ClientAncestralDESCRICAO.AsString;
  vgCertidaoSelecionada := True;
  close;
end;

procedure TfrmMostrarCertidaoGravada.btnPesquisarDocClick(Sender: TObject);
var
  viSql : String;
begin
  inherited;
  if vgId = 2 then
       viSql := ' SELECT * FROM T_CERTIDAO_GRAVADA '
  else viSql := ' SELECT * FROM D_CERTIDAO_GRAVADA ';

  if trim(edtDescricao.Text) <> '' then
    viSql := viSql + ' WHERE DESCRICAO LIKE '+QuotedStr(edtDescricao.Text+'%');

  viSql := viSql + ' ORDER BY DESCRICAO';

  ClientAncestral.Active := False;
  DataSetAncestral.SQL.Text := viSql;
  ClientAncestral.Active := True;
end;

procedure TfrmMostrarCertidaoGravada.FormShow(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

procedure TfrmMostrarCertidaoGravada.btnCancelarClick(Sender: TObject);
begin
  inherited;
  Clipboard.Clear;
end;

procedure TfrmMostrarCertidaoGravada.pgcVisualizacaoChange(Sender: TObject);
begin
  inherited;
  ClientAncestralAfterScroll(ClientAncestral);
end;

procedure TfrmMostrarCertidaoGravada.FormCreate(Sender: TObject);
begin
  inherited;
  btnPesquisarDocClick(self);
end;

end.
