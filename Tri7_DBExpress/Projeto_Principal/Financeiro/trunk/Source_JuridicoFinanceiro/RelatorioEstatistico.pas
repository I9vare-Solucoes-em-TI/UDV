unit RelatorioEstatistico;

interface

uses
  I9Query,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.Menus, dxBarBuiltInMenu, cxPC,
  Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxLabel, cxRadioGroup, cxTextEdit,
  cxMaskEdit, Data.DB, Datasnap.DBClient, DbxDevartInterBase, dxCore,
  dxCoreClasses, dxHashUtils, dxSpreadSheetCore, dxSpreadSheetPrinting,
  dxSpreadSheetFormulas, dxSpreadSheetFunctions, dxSpreadSheetGraphics,
  dxSpreadSheetClasses, dxSpreadSheetTypes, dxSpreadSheet, tmsAdvGridExcel,
  SimpleDS, cxCustomData, cxStyles, cxTL, cxTLdxBarBuiltInMenu,
  VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.TeeProcs, VCLTee.Chart,
  VCLTee.DBChart, cxInplaceContainer, cxDBTL, cxTLData;

type
  TfrmRelatorioEstatistico = class(TForm)
    Panel1: TPanel;
    Bevel4: TBevel;
    lblInformaca: TcxLabel;
    Panel4: TPanel;
    imgTitulo: TImage;
    Panel7: TPanel;
    cxButton1: TcxButton;
    Panel2: TPanel;
    cxPageControl2: TcxPageControl;
    cxTabSheet2: TcxTabSheet;
    dtsDados: TDataSource;
    ClientDados: TClientDataSet;
    ClientDadosOPERACAO: TStringField;
    ClientDadosGRUPO_CONTABIL: TStringField;
    ClientDadosCOMPROMISSO: TStringField;
    ClientDadosAMO_MES: TIntegerField;
    ClientDadosVALOR_REGISTRADO: TCurrencyField;
    ClientDadosVALOR_PERCENTUAL: TCurrencyField;
    lblMesAnoReferencia: TcxLabel;
    edtMesAnoContaInicial: TcxMaskEdit;
    edtMesAnoContaFinal: TcxMaskEdit;
    cxLabel4: TcxLabel;
    btnPesquisar: TcxButton;
    btnLimpar: TcxButton;
    cxRadioButton1: TcxRadioButton;
    cxLabel1: TcxLabel;
    cxRadioButton2: TcxRadioButton;
    sqlDados: TI9Query;
    sqlDadosTIPO: TStringField;
    sqlDadosGRUPO_CONTABIL: TStringField;
    sqlDadosGRUPO_SECUNDARIO: TStringField;
    sqlDadosCOMPROMISSO: TStringField;
    sqlDadosANO_MES_REGISTRO: TStringField;
    sqlDadosVALOR: TBCDField;
    AdvGridExcelIO1: TAdvGridExcelIO;
    Button1: TButton;
    cxDBTreeList1: TcxDBTreeList;
    cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn3: TcxDBTreeListColumn;
    DBChart1: TDBChart;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioEstatistico: TfrmRelatorioEstatistico;

implementation

{$R *.dfm}

procedure TfrmRelatorioEstatistico.Button1Click(Sender: TObject);
begin
//  dxSpreadSheet1.ActiveSheetAsTable.CreateCell(0, 0).AsString := 'TESTE';
//  dxSpreadSheet1.ActiveSheetAsTable.CreateCell(0, 0).Style.DataFormat.FormatCode := '0.00';
//  dxSpreadSheet1.ActiveSheetAsTable.Cells[1,1].AsVariant := 'TESTE';
end;

procedure TfrmRelatorioEstatistico.cxButton1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmRelatorioEstatistico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmRelatorioEstatistico := nil;
end;

end.
