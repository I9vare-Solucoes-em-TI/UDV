unit Conversao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadAuxiliar, cxLookAndFeelPainters, FMTBcd, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxContainer, cxTextEdit, cxCurrencyEdit, StdCtrls,
  DBClient, Provider, SqlExpr, cxButtons, ExtCtrls;

type
  TfrmConversao = class(TfrmCadAuxiliar)
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cxCurrencyEdit1: TcxCurrencyEdit;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    cxDBLookupComboBox2: TcxDBLookupComboBox;
    cxGrid2: TcxGrid;
    cxGridDBTableView4: TcxGridDBTableView;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridDBColumn14: TcxGridDBColumn;
    cxGridDBTableView4DBColumn1: TcxGridDBColumn;
    cxGridDBTableView4DBColumn2: TcxGridDBColumn;
    cxGridLevel4: TcxGridLevel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConversao: TfrmConversao;

implementation

{$R *.dfm}

end.
