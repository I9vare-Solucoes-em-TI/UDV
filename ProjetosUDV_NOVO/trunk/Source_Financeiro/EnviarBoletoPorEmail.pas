unit EnviarBoletoPorEmail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxTextEdit,
  cxCurrencyEdit, cxCheckBox, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, Vcl.ExtCtrls, cxLabel, Datasnap.DBClient, SimpleDS,
  DbxDevartInterBase, dxSkinsCore, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinscxPCPainter, cxCalendar;

type
  TfrmEnviarBoletoPorEmail = class(TForm)
    Panel2: TPanel;
    lblInformaca: TcxLabel;
    Panel4: TPanel;
    imgTitulo: TImage;
    Panel1: TPanel;
    Panel3: TPanel;
    btnConfirmar: TcxButton;
    btnCancelar: TcxButton;
    dtsBoletos: TDataSource;
    sqlBoletos: TSimpleDataSet;
    sqlBoletosNOME: TStringField;
    sqlBoletosCPFCNPJ: TStringField;
    sqlBoletosEMAIL1: TStringField;
    sqlBoletosVALOR_AGENDADO: TFMTBCDField;
    sqlBoletosBOLETA_ID: TFMTBCDField;
    sqlBoletosNOSSO_NUMERO: TFMTBCDField;
    sqlBoletosDATA_EMISSAO: TSQLTimeStampField;
    sqlBoletosDATA_VENCIMENTO: TSQLTimeStampField;
    sqlBoletosSELECIONADO: TStringField;
    cxGridCliente: TcxGrid;
    cxGridClienteDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    cxGridClienteDBTableView2NOME: TcxGridDBColumn;
    cxGridClienteDBTableView2BOLETA_ID: TcxGridDBColumn;
    cxGridClienteDBTableView2DATA_EMISSAO: TcxGridDBColumn;
    cxGridClienteDBTableView2DATA_VENCIMENTO: TcxGridDBColumn;
    cxGridClienteDBTableView2SELECIONADO: TcxGridDBColumn;
    cxGridClienteDBTableView2NOSSO_NUMERO: TcxGridDBColumn;
    cxGridClienteDBTableView2EMAIL1: TcxGridDBColumn;
    chxMarcarTodos: TcxCheckBox;
    chxAgruparDesagrupar: TcxCheckBox;
    cxGridClienteDBTableView2VALOR_AGENDADO: TcxGridDBColumn;
    sqlBoletosLIVRO_FINANCEIRO_ID: TFMTBCDField;
    sqlBoletosPESSOA_ID: TFMTBCDField;
    sqlBoletosPATH_GERARPDF: TStringField;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxGridClienteDBTableView2CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure chxMarcarTodosClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chxAgruparDesagruparClick(Sender: TObject);
  private
    { Private declarations }
    procedure SelecionarTodosCompromissos(vpSelecionar: Boolean);
  public
    { Public declarations }
  end;

var
  frmEnviarBoletoPorEmail: TfrmEnviarBoletoPorEmail;

implementation

uses
  Controles;

const
  vcClienteSelecionado = 7;

{$R *.dfm}

procedure TfrmEnviarBoletoPorEmail.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEnviarBoletoPorEmail.btnConfirmarClick(Sender: TObject);
begin
  sqlBoletos.DisableControls;
  sqlBoletos.First;
  while not sqlBoletos.Eof do begin
    if
      (Trim(sqlBoletosSELECIONADO.AsString) = 'N') or
      (Trim(sqlBoletosEMAIL1.AsString) = '')
    then begin
      sqlBoletos.Next;
      Continue;
    end;

    ExecutaSqlAuxiliar('update J_PESSOA set SELECIONADO = ' + QuotedStr('S') +
      ' where PESSOA_ID = ' + sqlBoletosPESSOA_ID.AsString, 1);

    ExecutaSqlAuxiliar('update J_LIVRO_FINANCEIRO set SELECIONADO = ' + QuotedStr('S') +
      ' where LIVRO_FINANCEIRO_ID = ' + sqlBoletosLIVRO_FINANCEIRO_ID.AsString +
      ' and BOLETA_ID = ' + sqlBoletosBOLETA_ID.AsString, 1);

    sqlBoletos.Next;
  end;
  close;
end;

procedure TfrmEnviarBoletoPorEmail.chxAgruparDesagruparClick(Sender: TObject);
begin
  if chxAgruparDesagrupar.Checked then begin
    cxGridClienteDBTableView2.OptionsView.GroupFooters := gfInvisible;
    cxGridClienteDBTableView2NOME.GroupIndex := 0;
    cxGridClienteDBTableView2NOME.Visible := False;

    cxGridClienteDBTableView2.DataController.Groups.FullExpand;
  end
  else begin
    cxGridClienteDBTableView2.OptionsView.GroupFooters := gfVisibleWhenExpanded;
    cxGridClienteDBTableView2NOME.GroupIndex := -1;
    cxGridClienteDBTableView2NOME.Visible := True;
  end
end;

procedure TfrmEnviarBoletoPorEmail.chxMarcarTodosClick(Sender: TObject);
begin
  SelecionarTodosCompromissos(chxMarcarTodos.checked);
end;

procedure TfrmEnviarBoletoPorEmail.cxGridClienteDBTableView2CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.RecordViewInfo.GridRecord.Values[vcClienteSelecionado] = 'S' then
    ACanvas.Font.Color := clRed;
end;

procedure TfrmEnviarBoletoPorEmail.FormActivate(Sender: TObject);
begin
  SelecionarTodosCompromissos(False);
end;

procedure TfrmEnviarBoletoPorEmail.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sqlBoletos.Close;

  Action := caFree;
  frmEnviarBoletoPorEmail := nil;
end;

procedure TfrmEnviarBoletoPorEmail.FormCreate(Sender: TObject);
begin
  sqlBoletos.Connection := dtmControles.DB;
  sqlBoletos.Active := False;
  sqlBoletos.Active := True;
end;

procedure TfrmEnviarBoletoPorEmail.SelecionarTodosCompromissos(
  vpSelecionar: Boolean);
begin
  sqlBoletos.DisableControls;
  sqlBoletos.First;
  while not sqlBoletos.Eof do begin
    sqlBoletos.Edit;

    if vpSelecionar then
      sqlBoletos.FieldByName('SELECIONADO').AsString := 'S'
    else
      sqlBoletos.FieldByName('SELECIONADO').AsString := 'N';

    sqlBoletos.Post;
    sqlBoletos.Next;
  end;
  sqlBoletos.First;
  sqlBoletos.EnableControls;
end;

end.
