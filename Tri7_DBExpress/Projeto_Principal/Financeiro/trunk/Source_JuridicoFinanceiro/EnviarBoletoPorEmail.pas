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
    cxGridCliente: TcxGrid;
    cxGridClienteDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    cxGridClienteDBTableView2NOME: TcxGridDBColumn;
    cxGridClienteDBTableView2DATA_VENCIMENTO: TcxGridDBColumn;
    cxGridClienteDBTableView2SELECIONADO: TcxGridDBColumn;
    cxGridClienteDBTableView2NOSSO_NUMERO: TcxGridDBColumn;
    cxGridClienteDBTableView2EMAIL1: TcxGridDBColumn;
    chxMarcarTodos: TcxCheckBox;
    chxAgruparDesagrupar: TcxCheckBox;
    cxGridClienteDBTableView2VALOR_AGENDADO: TcxGridDBColumn;
    sqlBoletosCALC_EMAIL: TStringField;
    sqlBoletosNOSSO_NUMERO: TFMTBCDField;
    sqlBoletosPESSOA_ID: TFMTBCDField;
    sqlBoletosNOME: TStringField;
    sqlBoletosCPFCNPJ: TStringField;
    sqlBoletosEMAIL1: TStringField;
    sqlBoletosSELECIONADO: TStringField;
    sqlBoletosVALOR: TFMTBCDField;
    sqlBoletosDATA_EMISSAO: TSQLTimeStampField;
    sqlBoletosDATA_VENCIMENTO: TSQLTimeStampField;
    sqlBoletosBOLETO_EMAIL: TStringField;
    sqlBoletosBOLETO_DESCRICAO: TStringField;
    sqlBoletosBOLETO_ID: TFMTBCDField;
    sqlBoletosPATH_GERARPDF: TStringField;
    btnLimpar: TcxButton;
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
    procedure sqlBoletosCalcFields(DataSet: TDataSet);
    procedure cxGridClienteDBTableView2SELECIONADOPropertiesChange(
      Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
  private
    { Private declarations }
    procedure SelecionarTodosCompromissos(vpSelecionar: Boolean);
  public
    { Public declarations }
  end;

var
  frmEnviarBoletoPorEmail: TfrmEnviarBoletoPorEmail;
  vgSelecaoConfirmada : Boolean;

implementation

uses
  Controles;

const
  vcClienteSelecionado = 5;

{$R *.dfm}

procedure TfrmEnviarBoletoPorEmail.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEnviarBoletoPorEmail.btnConfirmarClick(Sender: TObject);
var
  viFlag : Boolean;
begin
  viFlag := False;
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

    viFlag := True;
    ExecutaSqlAuxiliar(' update J_BOLETO set SELECIONADO = ' + QuotedStr('S') +
                       ' where BOLETO_ID = ' + sqlBoletosBOLETO_ID.AsString, 1);

    sqlBoletos.Next;
  end;

  sqlBoletos.EnableControls;

  if not viFlag then
  begin
    Application.MessageBox('Nenhum Boleto Selecionado!','Informa��o', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  vgSelecaoConfirmada := viFlag;
  close;
end;

procedure TfrmEnviarBoletoPorEmail.btnLimparClick(Sender: TObject);
var
  viBoletoId : String;
begin
  if Application.MessageBox('Ignorar envio de email nos Itens Marcados?', 'Confirma��o', MB_YESNO) = IDNO then
    exit;

  sqlBoletos.DisableControls;
  sqlBoletos.First;
  viBoletoId := '';
  while not sqlBoletos.Eof do
  begin
    if sqlBoletosSELECIONADO.AsString = 'S' then
    begin
      if viBoletoId = '' then
           viBoletoId := viBoletoId + sqlBoletosBOLETO_ID.AsString
      else viBoletoId := viBoletoId + ', ' + sqlBoletosBOLETO_ID.AsString;
    end;
    sqlBoletos.Next;
  end;
  ExecutaSqlAuxiliar(' UPDATE J_BOLETO SET ENVIO_EMAIL = '+ QuotedStr('S')+','+
                     '                     SELECIONADO = ' + QuotedStr('N')+
                     ' WHERE BOLETO_ID IN ('+viBoletoId+')',1);
  sqlBoletos.EnableControls;
  sqlBoletos.Active := False;
  sqlBoletos.Active := True;
  SelecionarTodosCompromissos(False);
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

procedure TfrmEnviarBoletoPorEmail.cxGridClienteDBTableView2SELECIONADOPropertiesChange(
  Sender: TObject);
begin
  sqlBoletos.Post;
end;

procedure TfrmEnviarBoletoPorEmail.FormActivate(Sender: TObject);
begin
  ExecutaSqlAuxiliar(' update J_BOLETO set SELECIONADO = ' + QuotedStr('N') +
                     ' where SELECIONADO = '+QuotedStr('S'), 1);
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
  sqlBoletos.Active    := False;
  sqlBoletos.Active    := True;
  vgSelecaoConfirmada  := False;
  btnConfirmar.Enabled := not sqlBoletos.IsEmpty;
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

procedure TfrmEnviarBoletoPorEmail.sqlBoletosCalcFields(DataSet: TDataSet);
begin
  if sqlBoletosBOLETO_EMAIL.AsString = '' then
       sqlBoletosCALC_EMAIL.AsString := sqlBoletosEMAIL1.AsString
  else sqlBoletosCALC_EMAIL.AsString := sqlBoletosBOLETO_EMAIL.AsString;
end;

end.