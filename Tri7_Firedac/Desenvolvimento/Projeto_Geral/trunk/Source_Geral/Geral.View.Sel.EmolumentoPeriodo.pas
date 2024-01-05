unit Geral.View.Sel.EmolumentoPeriodo;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  Vcl.Menus,
  cxControls,
  cxStyles,
  cxCustomData,
  cxFilter,
  cxData,
  cxDataStorage,
  cxEdit,
  cxNavigator,
  Data.DB,
  cxDBData,
  cxGridLevel,
  cxClasses,
  cxGridCustomView,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridDBTableView,
  cxGrid,
  Vcl.StdCtrls,
  cxButtons,
  Vcl.ExtCtrls,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  I9MemTable;

type
  TfrmSelEmolumentoPeriodo = class(TForm)
    pnlRodape: TPanel;
    btnConfirmar: TcxButton;
    btnCancelar: TcxButton;
    grdEmolumentoPeriodoDBTableView: TcxGridDBTableView;
    grdEmolumentoPeriodoLevel: TcxGridLevel;
    grdEmolumentoPeriodo: TcxGrid;
    tblEmolumentoPeriodo: TI9MemTable;
    dtsEmolumentoPeriodo: TDataSource;
    tblEmolumentoPeriodoEMOLUMENTO_PERIODO_ID: TIntegerField;
    tblEmolumentoPeriodoDESCRICAO: TStringField;
    tblEmolumentoPeriodoSITUACAO: TStringField;
    tblEmolumentoPeriodoDATA_INICIAL: TDateTimeField;
    grdEmolumentoPeriodoDBTableViewDESCRICAO: TcxGridDBColumn;
    grdEmolumentoPeriodoDBTableViewSITUACAO: TcxGridDBColumn;
    grdEmolumentoPeriodoDBTableViewDATA_INICIAL: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure grdEmolumentoPeriodoDBTableViewCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    class function Selecionar: Integer;
  end;

implementation

uses
  Controles,
  Geral.Controller.EmolumentoPeriodo,
  Geral.Model.EmolumentoPeriodo,
  System.Generics.Collections,
  Lookup;

{$R *.dfm}

{ TfrmSelEmolumentoPeriodo }

procedure TfrmSelEmolumentoPeriodo.FormCreate(Sender: TObject);
var
  viEmolumentoPeriodoController: TEmolumentoPeriodoController;
  viEmolumentoPeriodoList: TObjectList<TEmolumentoPeriodo>;
  viEmolumentoPeriodo: TEmolumentoPeriodo;
begin
  tblEmolumentoPeriodo.Open;
  viEmolumentoPeriodoController := nil;
  viEmolumentoPeriodoList := nil;

  try
    viEmolumentoPeriodoController := TEmolumentoPeriodoController.Create;
    viEmolumentoPeriodoList := viEmolumentoPeriodoController.ListarAtivos;

    for viEmolumentoPeriodo in viEmolumentoPeriodoList do
    begin
      tblEmolumentoPeriodo.Append;
      tblEmolumentoPeriodoEMOLUMENTO_PERIODO_ID.AsInteger := viEmolumentoPeriodo.EmolumentoPeriodoID;
      tblEmolumentoPeriodoDESCRICAO.AsString := viEmolumentoPeriodo.Descricao;
      tblEmolumentoPeriodoSITUACAO.AsString := viEmolumentoPeriodo.Situacao;
      tblEmolumentoPeriodoDATA_INICIAL.AsDateTime := viEmolumentoPeriodo.DataInicial;
      tblEmolumentoPeriodo.Post;
    end;

    tblEmolumentoPeriodo.First;
  finally
    viEmolumentoPeriodoController.Free;
    viEmolumentoPeriodoList.Free;
  end;

  btnConfirmar.Enabled := not tblEmolumentoPeriodo.IsEmpty;
end;

procedure TfrmSelEmolumentoPeriodo.FormDestroy(Sender: TObject);
begin
  tblEmolumentoPeriodo.Close;
end;

procedure TfrmSelEmolumentoPeriodo.grdEmolumentoPeriodoDBTableViewCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  if tblEmolumentoPeriodo.IsEmpty then
    Exit;

  btnConfirmar.Click;
end;

class function TfrmSelEmolumentoPeriodo.Selecionar: Integer;
var
  viFrmSelEmolumentoPeriodo: TfrmSelEmolumentoPeriodo;
begin
  Result := 0;

  viFrmSelEmolumentoPeriodo := Self.Create(
    Application);

  try
    if viFrmSelEmolumentoPeriodo.ShowModal <> mrOk then
      Exit;

    Result := viFrmSelEmolumentoPeriodo.tblEmolumentoPeriodoEMOLUMENTO_PERIODO_ID.AsInteger;
  finally
    viFrmSelEmolumentoPeriodo.Release;
  end;
end;

end.
