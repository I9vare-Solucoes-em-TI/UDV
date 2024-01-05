unit Geral.View.EmailGravar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinMcSkin, cxGridExportLink,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, cxControls, cxContainer, cxEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxCalendar,
  cxImageComboBox, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxLabel,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  Vcl.StdCtrls, cxRadioGroup, cxGroupBox, cxTextEdit, cxMaskEdit, cxButtons,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, I9MemTable, FireDAC.Stan.Async,
  FireDAC.DApt, I9Query;

type
  TfrmEmailGravado = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxBtnFechar: TcxButton;
    cxGrid3: TcxGrid;
    gridPesquisa: TcxGridDBTableView;
    gridPesquisaDATA_ENVIO: TcxGridDBColumn;
    gridPesquisaSTATUS: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    dtsEmail: TDataSource;
    tblEmail: TI9MemTable;
    tblEmailEMAIL_ID: TIntegerField;
    tblEmailDATA_ENVIO: TSQLTimeStampField;
    tblEmailUSUARIO: TStringField;
    tblEmailASSUNTO: TStringField;
    tblEmailPARA: TStringField;
    tblEmailIP_MAQUINA: TStringField;
    tblEmailSISTEMA: TStringField;
    tblEmailOBSERVACAO: TStringField;
    tblEmailSTATUS: TStringField;
    Label37: TLabel;
    edtDataIni: TcxDateEdit;
    Label35: TLabel;
    edtDataFim: TcxDateEdit;
    Label2: TLabel;
    edtPara: TcxTextEdit;
    Label1: TLabel;
    lcbSistema: TcxLookupComboBox;
    gbxMostrar: TcxGroupBox;
    rdbMostrarTodos: TcxRadioButton;
    rdbEnviados: TcxRadioButton;
    rdbNaoEnviados: TcxRadioButton;
    btnPesquisar: TcxButton;
    btnLimpar: TcxButton;
    gridPesquisaEMAIL_ID: TcxGridDBColumn;
    gridPesquisaUSUARIO: TcxGridDBColumn;
    gridPesquisaASSUNTO: TcxGridDBColumn;
    gridPesquisaPARA: TcxGridDBColumn;
    gridPesquisaIP_MAQUINA: TcxGridDBColumn;
    gridPesquisaSISTEMA: TcxGridDBColumn;
    gridPesquisaOBSERVACAO: TcxGridDBColumn;
    btnExportar: TcxButton;
    sqlSistema: TI9Query;
    sqlSistemaSISTEMA_ID: TBCDField;
    sqlSistemaDESCRICAO: TStringField;
    dtsSistema: TDataSource;
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure cxBtnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExportarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarDados;
    procedure GerarPlanilha;
    procedure ListarSistemas;
  public
    { Public declarations }
  end;

var
  frmEmailGravado: TfrmEmailGravado;

implementation

{$R *.dfm}

Uses
  Geral.Model.EmailGravar,
  Lookup,
  Rotinas,
  Controles;

procedure TfrmEmailGravado.btnExportarClick(Sender: TObject);
begin
   GerarPlanilha;
end;

procedure TfrmEmailGravado.btnLimparClick(Sender: TObject);
begin
  edtDataIni.Clear;
  edtDataFim.Clear;
  lcbSistema.Clear;
  edtPara.Clear;
  rdbMostrarTodos.Checked := True;
  btnExportar.Enabled := False;

  tblEmail.EmptyDataSet;
end;

procedure TfrmEmailGravado.btnPesquisarClick(Sender: TObject);
begin
  CarregarDados;
end;

procedure TfrmEmailGravado.CarregarDados;
var
  viEmailGravarBusiness: TEmailGravarBusiness;
  viDataSet: TDataSet;
  viStatus: string;
  viSistemaId: Integer;
begin
  viEmailGravarBusiness := nil;
  viDataSet := nil;
  btnExportar.Enabled := False;
  tblEmail.EmptyDataSet;

  if rdbMostrarTodos.Checked then
    viStatus := 'T'
  else
  if rdbEnviados.Checked then
    viStatus := 'E'
  else
    viStatus := 'N';

  if lcbSistema.EditValue <> Null then
    viSistemaId := lcbSistema.EditValue
  else
    viSistemaId := 0;

  try
{    viEmailGravarBusiness := TEmailGravarBusiness.Create(dtmControles.ConexaoDb);

     viDataSet := viEmailGravarBusiness.Pesquisar(
      edtDataIni.Date,
      edtDataFim.Date,
      viSistemaId,
      edtPara.Text,
      viStatus);

     if Assigned(viDataSet) then
     begin
       tblEmail.CopyDataSet(viDataSet, [coRestart, coAppend]);
       btnExportar.Enabled := True;
     end;  }
  finally
    FreeAndNil(viEmailGravarBusiness);
    FreeAndNil(viDataSet);
  end;
end;

procedure TfrmEmailGravado.cxBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEmailGravado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  sqlSistema.Close;
  Action := caFree;
  frmEmailGravado := nil;
end;

procedure TfrmEmailGravado.FormCreate(Sender: TObject);
begin
//  sqlSistema.Connection := dtmControles.DB;
  //ListarSistemas;
end;

procedure TfrmEmailGravado.GerarPlanilha;
var
  i : integer;
  HandleXLS : Variant;
begin
  try
    if DirectoryExists('C:\temp') then
      CreateDir('C:\temp');

    ExportGridToExcel('C:\temp\RelTemp.xls', cxGrid3);

    AbrirPlanilha;
  except

  end;
end;

procedure TfrmEmailGravado.ListarSistemas;
var
  viSql: string;
begin
  viSql := 'SELECT SISTEMA_ID, '+
           '       DESCRICAO '+
           'FROM G_SISTEMA '+
           'WHERE SITUACAO = ''A'' '+
           'ORDER BY DESCRICAO ';

  sqlSistema.Close;
  sqlSistema.SQL.Text := viSql;
  sqlSistema.Open;
end;

end.
