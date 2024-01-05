unit Relatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, ExtCtrls, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxLookAndFeelPainters, StdCtrls, cxButtons,
  DBClient, SimpleDS, cxImageComboBox, frxDCtrl, frxClass, frxRich, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, Menus;

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
  else Application.MessageBox('N�o h� relat�rios cadastrados!', 'Aten��o', MB_OK + MB_ICONWARNING);

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
  frxRelatorio.Variables.Variables['vgNomeCartorio'] := QuotedStr(dtmControles.BuscarConfig('PRINCIPAL', 'CARTORIO', 'NOME', 'S'));

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
