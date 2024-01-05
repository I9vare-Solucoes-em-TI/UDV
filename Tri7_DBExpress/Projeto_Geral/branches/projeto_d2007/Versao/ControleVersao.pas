unit ControleVersao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZAbstractTable, ZDataset,
  ZAbstractConnection, ZConnection, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, Menus,
  StdCtrls, cxButtons, ExtCtrls, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  cxSplitter, cxFilterControl, cxContainer, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  ComObj, cxGridExportLink, cxLabel;

type
  TfrmControleVersao = class(TForm)
    DB: TZConnection;
    sqlPesquisaVersao: TZQuery;
    sqlPesquisaVersaonome_cartorio: TStringField;
    sqlPesquisaVersaonome_sistema: TStringField;
    sqlPesquisaVersaonumero_versao: TStringField;
    dtsVersao: TDataSource;
    grdPesquisa: TcxGrid;
    gridPesquisa: TcxGridDBTableView;
    grdPesquisaLevel1: TcxGridLevel;
    gridPesquisanome_cartorio: TcxGridDBColumn;
    gridPesquisanome_sistema: TcxGridDBColumn;
    gridPesquisanumero_versao: TcxGridDBColumn;
    Panel1: TPanel;
    btnCarregar: TcxButton;
    Panel4: TPanel;
    cxBtnFechar: TcxButton;
    lcbCartorio: TcxLookupComboBox;
    sqlCartorio: TZQuery;
    dtsCartorio: TDataSource;
    sqlCartoriocartorio_id: TIntegerField;
    sqlCartorionome_cartorio: TStringField;
    Label2: TLabel;
    cxButton2: TcxButton;
    btnExportar: TcxButton;
    lblExpandir: TcxLabel;
    lblContrair: TcxLabel;
    Label1: TLabel;
    sqlPesquisaVersaonumero_versao_anterior: TStringField;
    gridPesquisanumero_versao_anterior: TcxGridDBColumn;
    sqlCartoriocidade: TStringField;
    sqlCartoriouf: TStringField;
    sqlPesquisaVersaocidade: TStringField;
    sqlPesquisaVersaouf: TStringField;
    gridPesquisacidade: TcxGridDBColumn;
    gridPesquisauf: TcxGridDBColumn;
    procedure cxBtnFecharClick(Sender: TObject);
    procedure btnCarregarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lcbCartorioPropertiesEditValueChanged(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
    procedure lblExpandirClick(Sender: TObject);
    procedure lblContrairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmControleVersao: TfrmControleVersao;

implementation

{$R *.dfm}

procedure TfrmControleVersao.btnCarregarClick(Sender: TObject);
begin
  if not DB.Connected then
  begin
    DB.Connect;
    sqlPesquisaVersao.Active := True;
    sqlCartorio.Active := True;
  end;
end;

procedure TfrmControleVersao.btnExportarClick(Sender: TObject);
var
  HandleXLS : Variant;
begin
  if not sqlPesquisaVersao.IsEmpty then
  begin
  try
    if not DirectoryExists('C:\Temp') then
      CreateDir('C:\Temp');

    ExportGridToExcel('C:\temp\RelTemp.xls', grdPesquisa);
    HandleXLS := CreateOleObject('Excel.Application');
    HandleXLS.WorkBooks.Open('C:\temp\RelTemp.xls');
    HandleXLS.DisplayAlerts := False;
    HandleXLS.Visible := True;
  except

  end;

  end
  else Application.MessageBox('Nenhum registro carregado!', 'Atenção', MB_OK + MB_ICONWARNING);

end;

procedure TfrmControleVersao.cxBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmControleVersao.cxButton2Click(Sender: TObject);
begin
  lcbCartorio.EditValue := Null;
end;

procedure TfrmControleVersao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  lblContrair.Visible := False;
  lblExpandir.Visible := False;
  Label1.Visible      := True;
  Application.ProcessMessages;

  sqlPesquisaVersao.Active := False;
  sqlCartorio.Active       := False;
  DB.Disconnect;
end;

procedure TfrmControleVersao.lblContrairClick(Sender: TObject);
begin
  gridPesquisa.ViewData.Collapse(True);
end;

procedure TfrmControleVersao.lblExpandirClick(Sender: TObject);
begin
  gridPesquisa.ViewData.Expand(True);  
end;

procedure TfrmControleVersao.lcbCartorioPropertiesEditValueChanged(
  Sender: TObject);
begin
  sqlPesquisaVersao.Filtered := False;

  if lcbCartorio.Text <> '' then
  begin
    sqlPesquisaVersao.Filter   := 'nome_cartorio=' + QuotedStr(lcbCartorio.Text);
    sqlPesquisaVersao.Filtered := True;
  end;
  
end;

end.
