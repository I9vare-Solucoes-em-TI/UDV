unit AtualizarEmolumento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, DBClient, SimpleDS,
  cxControls, cxContainer, cxEdit,
  cxTextEdit,
  StdCtrls, cxButtons, Buttons, ExtCtrls,

  cxSplitter, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxGroupBox, cxDBEdit, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxDBData, cxImageComboBox, cxDBLookupComboBox,
  cxCurrencyEdit, DbxDevartInterBase;

type
  TfrmAtualizarEmolumentos = class(TForm)
    Panel3: TPanel;
    Panel1: TPanel;
    SpeedButton2: TSpeedButton;
    btnFechar: TcxButton;
    sqlAtualizar: TSimpleDataSet;
    cdsPeriodo: TClientDataSet;
    cdsPeriodoEMOLUMENTO_PERIODO_ID: TFMTBCDField;
    cdsPeriodoDESCRICAO: TStringField;
    cdsPeriodoSITUACAO: TStringField;
    cdsPeriodoDATA_INICIAL: TSQLTimeStampField;
    cdsEmolumento: TClientDataSet;
    cdsEmolumentoEMOLUMENTO_ID: TFMTBCDField;
    cdsEmolumentoDESCRICAO: TStringField;
    cdsEmolumentoTIPO: TStringField;
    cdsEmolumentoSISTEMA_ID: TFMTBCDField;
    cdsEmolumentoSELO_GRUPO_ID: TFMTBCDField;
    cdsEmolumentoSITUACAO: TStringField;
    cdsEmolumentoItem: TClientDataSet;
    cdsEmolumentoItemVALOR_EMOLUMENTO: TFMTBCDField;
    cdsEmolumentoItemEMOLUMENTO_ITEM_ID: TFMTBCDField;
    cdsEmolumentoItemEMOLUMENTO_ID: TFMTBCDField;
    cdsEmolumentoItemVALOR_INICIO: TFMTBCDField;
    cdsEmolumentoItemVALOR_FIM: TFMTBCDField;
    cdsEmolumentoItemVALOR_TAXA_JUDICIARIA: TFMTBCDField;
    cdsEmolumentoItemEMOLUMENTO_PERIODO_ID: TFMTBCDField;
    cdsEmolumentoItemCODIGO: TFMTBCDField;
    cdsEmolumentoItemPAGINA_EXTRA: TFMTBCDField;
    cdsEmolumentoItemVALOR_PAGINA_EXTRA: TFMTBCDField;
    cdsEmolumentoItemVALOR_OUTRA_TAXA1: TFMTBCDField;
    cdsEmolumentoItemCODIGO_SELO: TStringField;
    cxGroupBox18: TcxGroupBox;
    cxGrid2: TcxGrid;
    cxGridDBTableEmolumento: TcxGridDBTableView;
    cxGridDBTableEmolumentoDBColumn1: TcxGridDBColumn;
    cxGridDBTableEmolumentoDBColumn2: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    cxGroupBox1: TcxGroupBox;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridDBTableViewTxEmol: TcxGridDBColumn;
    cxGridDBTableViewTxOutraTx: TcxGridDBColumn;
    cxGridDBTableView1DBColumn6: TcxGridDBColumn;
    cxGridDBTableView1DBColumn7: TcxGridDBColumn;
    cxGridDBTableView1DBColumn8: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxSplitter3: TcxSplitter;
    dtsPeriodo: TDataSource;
    dtsEmolumento: TDataSource;
    dtsEmolumentoItem: TDataSource;
    Label14: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    sqlG_Emolumento: TSimpleDataSet;
    sqlG_EmolumentoEMOLUMENTO_ID: TFMTBCDField;
    sqlG_EmolumentoDESCRICAO: TStringField;
    sqlG_EmolumentoTIPO: TStringField;
    sqlG_EmolumentoSISTEMA_ID: TFMTBCDField;
    sqlG_EmolumentoSELO_GRUPO_ID: TFMTBCDField;
    sqlG_EmolumentoSITUACAO: TStringField;
    dtsG_Emolumento: TDataSource;
    cdsEmolumentocalc_tabelasys: TIntegerField;
    cxGridDBTableEmolumentoColumn1: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAtualizarEmolumentos: TfrmAtualizarEmolumentos;

implementation

uses
  Controles;

{$R *.dfm}

procedure TfrmAtualizarEmolumentos.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAtualizarEmolumentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmAtualizarEmolumentos := nil;
end;

procedure TfrmAtualizarEmolumentos.FormCreate(Sender: TObject);
begin
  sqlG_Emolumento.Connection := dtmControles.DB;
  
  cdsPeriodo.LoadFromFile('C:\Temp\EMOLUMENTO_PERIODO.XML');
  cdsEmolumento.LoadFromFile('C:\Temp\EMOLUMENTO_TABELA.XML');
  cdsEmolumentoItem.LoadFromFile('C:\Temp\EMOLUMENTO_ITENS.XML');

  with sqlG_Emolumento do
  begin
    Active := False;
    DataSet.CommandText := ' SELECT * FROM G_EMOLUMENTO '+
                           ' WHERE SISTEMA_ID = :SISTEMA_ID '+
                           ' ORDER BY DESCRICAO ';
    DataSet.Params[0].AsCurrency := vgId;
    Active := True;
  end;
end;

end.
