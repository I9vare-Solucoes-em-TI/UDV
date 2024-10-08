unit ItensAgendamento;

interface

uses
  I9Query,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.Menus, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxCalendar,
  cxImageComboBox, cxCurrencyEdit, cxCheckBox, frxClass, frxDBSet, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxLabel,
  DbxDevartInterBase, Datasnap.DBClient, SimpleDS;

type
  TfrmItensAgendamento = class(TForm)
    Panel2: TPanel;
    lblInformaca: TcxLabel;
    Panel4: TPanel;
    imgTitulo: TImage;
    Panel6: TPanel;
    btnRelatorio: TcxButton;
    gdrCompromissoAgendado: TcxGrid;
    cxGridDBTablePrevisao: TcxGridDBTableView;
    cxGridLevel7: TcxGridLevel;
    frxDBDatasetItens: TfrxDBDataset;
    btnCancelar: TcxButton;
    sqlItensAgendamento: TI9Query;
    dtsItensAgendamento: TDataSource;
    sqlItensAgendamentoDATA_VENCIMENTO: TSQLTimeStampField;
    sqlItensAgendamentoVALOR_AGENDADO: TBCDField;
    sqlItensAgendamentoOPERACAO: TStringField;
    sqlItensAgendamentoCOMPROMISSO: TStringField;
    sqlItensAgendamentoHISTORICO: TStringField;
    sqlItensAgendamentoQTD: TBCDField;
    sqlItensAgendamentoPARCELA: TBCDField;
    sqlItensAgendamentoPARCELA_INICIAL: TBCDField;
    sqlItensAgendamentoCAIXA_ID: TBCDField;
    sqlItensAgendamentoDATA_PAGAMENTO: TSQLTimeStampField;
    sqlItensAgendamentoVALOR_REGISTRADO: TBCDField;
    cxGridDBTablePrevisaoColumn1: TcxGridDBColumn;
    cxGridDBTablePrevisaoColumn3: TcxGridDBColumn;
    cxGridDBTablePrevisaoColumn4: TcxGridDBColumn;
    cxGridDBTablePrevisaoColumn5: TcxGridDBColumn;
    cxGridDBTablePrevisaoColumn6: TcxGridDBColumn;
    cxGridDBTablePrevisaoColumn7: TcxGridDBColumn;
    cxGridDBTablePrevisaoColumn8: TcxGridDBColumn;
    cxGridDBTablePrevisaoColumn2: TcxGridDBColumn;
    cxGridDBTablePrevisaoColumn9: TcxGridDBColumn;
    sqlItensAgendamentoLIVRO_FINANCEIRO_ID: TBCDField;
    sqlItensAgendamentoCALC_PARCELA: TStringField;
    sqlItensAgendamentoSITUACAO: TStringField;
    cxGridDBTablePrevisaoColumn10: TcxGridDBColumn;
    sqlItensAgendamentoDATA_FINAL: TSQLTimeStampField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRelatorioClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure sqlItensAgendamentoCalcFields(DataSet: TDataSet);
    procedure cxGridDBTablePrevisaoCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  private
    procedure ParametrosRelatorio;
  public
    { Public declarations }
  end;

var
  frmItensAgendamento: TfrmItensAgendamento;
  vgItemAgendamentoId, vgItemFinanceiroId : Integer;

implementation

uses
  Controles, VisualizaRelatorios, Lookup, LookupFinanceiro, Lookup_Contabil;

{$R *.dfm}

procedure TfrmItensAgendamento.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmItensAgendamento.btnRelatorioClick(Sender: TObject);
var
  viRelatorio : string;
begin
  viRelatorio := dtmControles.BuscarConfig('FINANCEIRO', 'RELATORIO','RELATORIO_ITENS_AGENDAMENTO', 'S');
  if viRelatorio = '' then
  begin
    Application.MessageBox(Pchar('Relat�rio n�o configurado!!!'), 'Aten��o', MB_OK + MB_ICONWARNING);
    exit;
  end;
  ExibirRelatorio(dtmControles.frxRelatorio, viRelatorio, ParametrosRelatorio, True);
end;

procedure TfrmItensAgendamento.cxGridDBTablePrevisaoCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if (AViewInfo.RecordViewInfo.GridRecord.Values[0]) = vgItemFinanceiroId then
    ACanvas.Font.Color  := clBlue
  else
    if (AViewInfo.RecordViewInfo.GridRecord.Values[1]) = 3 then
      ACanvas.Font.Color  := clGreen
  else
    if (AViewInfo.RecordViewInfo.GridRecord.Values[1]) = 4 then
      ACanvas.Font.Color  := clRed;
end;

procedure TfrmItensAgendamento.FormActivate(Sender: TObject);
begin
  sqlItensAgendamento.Active := False;
  sqlItensAgendamento.ParamByName('LIVRO_AGENDAMENTO_ID').AsInteger := vgItemAgendamentoId;
  sqlItensAgendamento.Active := True;

  if sqlItensAgendamentoDATA_FINAL.IsNull then
    lblInformaca.Caption := lblInformaca.Caption + ' - Mensal Tempo Indeterminado...';

  sqlItensAgendamento.Connection := dtmControles.DB;
end;

procedure TfrmItensAgendamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action              := caFree;
  frmItensAgendamento := nil;
end;

procedure TfrmItensAgendamento.ParametrosRelatorio;
begin
  dtmControles.frxRelatorio.Variables.Variables['Titulo'] := QuotedStr(lblInformaca.Caption);
end;

procedure TfrmItensAgendamento.sqlItensAgendamentoCalcFields(DataSet: TDataSet);
begin
  sqlItensAgendamentoCALC_PARCELA.AsString := dtmLookupContabil.CalcularParcela(sqlItensAgendamentoPARCELA.AsInteger,
                                                                                sqlItensAgendamentoPARCELA_INICIAL.AsInteger,
                                                                                sqlItensAgendamentoQTD.AsInteger);
end;

end.
