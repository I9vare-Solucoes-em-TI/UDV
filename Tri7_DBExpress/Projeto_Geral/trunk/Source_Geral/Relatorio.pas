unit Relatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxCustomData,
  DB, ExtCtrls, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, cxButtons,
  DBClient, SimpleDS, frxClass, frxRich, Menus, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, cxDBData, cxImageComboBox;

type
  TfrmRelatorio = class(TForm)
    grdRelatorio: TcxGrid;
    grdRelatorioDBTableView1: TcxGridDBTableView;
    grdRelatorioLevel1: TcxGridLevel;
    Panel1: TPanel;
    sqlRelatorio: TSimpleDataSet;
    dsRelatorio: TDataSource;
    sqlRelatorioGRUPO: TStringField;
    sqlRelatorioCONFIG_RELATORIO_ID: TFMTBCDField;
    sqlRelatorioDESCRICAO: TStringField;
    sqlRelatorioRELATORIO: TBlobField;
    grdRelatorioDBTableView1GRUPO: TcxGridDBColumn;
    grdRelatorioDBTableView1DESCRICAO: TcxGridDBColumn;
    grdRelatorioDBTableView1DBImg: TcxGridDBColumn;
    frxRelatorio: TfrxReport;
    chkExpandir: TCheckBox;
    cxButton4: TcxButton;
    cxButton2: TcxButton;
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chkExpandirClick(Sender: TObject);
    function frxRelatorioUserFunction(const MethodName: String;
      var Params: Variant): Variant;
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
    WPath : String;
    procedure ParametrosRelatorio;

  public
    { Public declarations }
    procedure CarregaRelatorio;
  end;

var
  frmRelatorio: TfrmRelatorio;

implementation

uses Controles, Rotinas, VisualizaRelatorios;

{$R *.dfm}
{$WARN IMPLICIT_STRING_CAST OFF}
{$WARN IMPLICIT_STRING_CAST_LOSS OFF}

procedure TfrmRelatorio.cxButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmRelatorio.cxButton2Click(Sender: TObject);
begin
  Close; 
end;

procedure TfrmRelatorio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sqlRelatorio.Close;
  Action := caFree;
  frmRelatorio := nil;
end;

procedure TfrmRelatorio.FormCreate(Sender: TObject);
begin
  sqlRelatorio.Connection := dtmControles.DB;
  sqlRelatorio.DataSet.Params[0].AsInteger := vgId;
  sqlRelatorio.Open;

  CriarFuncoesRelatorio(frxRelatorio);

  vgImpressao.Cabecalho := dtmControles.BuscarConfig('PRINCIPAL', 'GERAL', 'CABECALHO_RELATORIO', 'W');
end;

procedure TfrmRelatorio.CarregaRelatorio;
var Rel : TStringList;
    Caminho, ID :  string;
begin
  if Trim(sqlRelatorioRELATORIO.AsString) <> '' then
  begin
    ID := sqlRelatorioCONFIG_RELATORIO_ID.AsString;
    Caminho   := WPath + ID + '.fr3';
    Rel := TStringList.Create;
    Rel.Text := DeCompressString(sqlRelatorioRELATORIO.AsString);
    Rel.SaveToFile(Caminho);
    Application.ProcessMessages;
    Rel.Free;
    frxRelatorio.LoadFromFile(WPath + IntToStr(sqlRelatorioCONFIG_RELATORIO_ID.AsInteger) + '.fr3');
    DeleteFile(Caminho);
    ParametrosRelatorio;
    ShowPreview('Preview',frxRelatorio, wsMaximized);
  end
  else Application.MessageBox('Não há relatórios cadastrados!', 'Atenção', MB_OK + MB_ICONWARNING);

end;

procedure TfrmRelatorio.cxButton4Click(Sender: TObject);
begin
  CarregaRelatorio;
end;

procedure TfrmRelatorio.FormShow(Sender: TObject);
begin
  WPath := ExtractFilePath(Application.ExeName);
  chkExpandir.Checked := True;
end;

procedure TfrmRelatorio.ParametrosRelatorio;
var RichView1 : TfrxRichView;
    Memo1 : TfrxMemoView;
begin
  RichView1 := TfrxRichView(frxRelatorio.FindObject('rchCabecalho'));
  if RichView1 <> nil then
     RichView1.RichEdit.Text:= vgImpressao.Cabecalho
  else begin
       Memo1 := TfrxMemoView(frxRelatorio.FindObject('mmoCabecalho'));
       if Memo1 <> nil then
          Memo1.Memo.Text:= vgImpressao.Cabecalho;
  end;

end;

procedure TfrmRelatorio.chkExpandirClick(Sender: TObject);
begin
  if chkExpandir.Checked then
     grdRelatorioDBTableView1.DataController.Groups.FullExpand
  else grdRelatorioDBTableView1.DataController.Groups.FullCollapse;
end;

function TfrmRelatorio.frxRelatorioUserFunction(const MethodName: String;
  var Params: Variant): Variant;
begin
  Result := ExecutarFuncoesRelatorio(MethodName, Params);
end;

end.
