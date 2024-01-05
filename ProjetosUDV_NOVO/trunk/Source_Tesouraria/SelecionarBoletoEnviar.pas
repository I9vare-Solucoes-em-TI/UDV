unit SelecionarBoletoEnviar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  ExtCtrls, cxContainer, cxLabel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, DBClient, SimpleDS, cxCheckBox, cxCurrencyEdit,
  cxTextEdit, cxLookAndFeels, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  cxNavigator, Data.DBXInterBase, frxClass, DbxDevartInterBase, cxImageComboBox;

type
  TBoleto = Record
    Flag : Boolean;
    Selecao, EnviarEmail : string;
  End;

  TfrmSelecionarBoletoEnviar = class(TForm)
    Panel2: TPanel;
    Bevel4: TBevel;
    lblInformacaoLancamento: TcxLabel;
    Panel4: TPanel;
    imgEMAIL: TImage;
    Panel1: TPanel;
    sqlBoletos: TSimpleDataSet;
    dtsBoletos: TDataSource;
    sqlBoletosselecionar: TBooleanField;
    sqlBoletosBOLETA_ID: TFMTBCDField;
    sqlBoletosVALOR: TFMTBCDField;
    sqlBoletosPESSOA_ID: TFMTBCDField;
    sqlBoletosPESSOA_GRUPO_ID: TFMTBCDField;
    sqlBoletoscalc_Nome: TStringField;
    sqlBoletosDATA_EMISSAO: TSQLTimeStampField;
    imgImprimir: TImage;
    sqlBoletosNOME: TStringField;
    sqlBoletosDESCRICAO: TStringField;
    chxMarcarTodos: TcxCheckBox;
    popBoleto: TPopupMenu;
    popMudarParaImpressao: TMenuItem;
    sqlBoletosCAMINHO_ARQUIVO: TStringField;
    popMudarParaEmail: TMenuItem;
    sqlBoletosTRANSMITIDO: TStringField;
    cxGrid1: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBTableView3Column1: TcxGridDBColumn;
    cxGridDBTableView3Column5: TcxGridDBColumn;
    cxGridDBTableView3Column6: TcxGridDBColumn;
    cxGridDBTableView3Column3: TcxGridDBColumn;
    cxGridDBTableView3Column4: TcxGridDBColumn;
    cxGridDBTableView3Column2: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    btnConfirmarCompromisso: TcxButton;
    cxButton1: TcxButton;
    procedure btnConfirmarCompromissoClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cxGridDBTableView3CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure sqlBoletosCalcFields(DataSet: TDataSet);
    procedure cxGridDBTableView3Column2PropertiesChange(Sender: TObject);
    procedure chxMarcarTodosClick(Sender: TObject);
    procedure popMudarParaImpressaoClick(Sender: TObject);
    procedure sqlBoletosAfterScroll(DataSet: TDataSet);
    procedure popMudarParaEmailClick(Sender: TObject);
    procedure MarcarDesmarcarCompromissos(vpMarcar : Boolean; vpTodos : Boolean = True);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelecionarBoletoEnviar: TfrmSelecionarBoletoEnviar;
  vgBoleto : TBoleto;

implementation

uses Controles, Lookup, Lookup_Contabil;

{$R *.dfm}

procedure TfrmSelecionarBoletoEnviar.btnConfirmarCompromissoClick(Sender: TObject);
begin
  sqlBoletos.DisableControls;
  sqlBoletos.First;
  vgBoleto.Selecao := '';
  while not sqlBoletos.eof do
  begin
    if sqlBoletosselecionar.AsBoolean then
    begin
      if vgBoleto.Selecao = '' then
           vgBoleto.Selecao := sqlBoletosBOLETA_ID.AsString
      else vgBoleto.Selecao := vgBoleto.Selecao + ', '+ sqlBoletosBOLETA_ID.AsString;
    end;
    sqlBoletos.Next;
  end;
  vgBoleto.Flag := True;
  close;
end;

procedure TfrmSelecionarBoletoEnviar.chxMarcarTodosClick(Sender: TObject);
begin
  dtmLookup.MarcarDesmarcarCompromissos(sqlBoletos, chxMarcarTodos.Checked);
end;

procedure TfrmSelecionarBoletoEnviar.cxButton1Click(Sender: TObject);
begin
  vgBoleto.Flag := False;
  close;
end;

procedure TfrmSelecionarBoletoEnviar.cxGridDBTableView3Column2PropertiesChange(
  Sender: TObject);
begin
  sqlBoletos.Post;
end;

procedure TfrmSelecionarBoletoEnviar.cxGridDBTableView3CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.RecordViewInfo.GridRecord.Values[4] = True then
    ACanvas.Font.Color := clRed;
end;

procedure TfrmSelecionarBoletoEnviar.FormActivate(Sender: TObject);
begin
  MarcarDesmarcarCompromissos(True, False);
end;

procedure TfrmSelecionarBoletoEnviar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sqlBoletos.Active  := False;
  Action                    := caFree;
  frmSelecionarBoletoEnviar := nil
end;

procedure TfrmSelecionarBoletoEnviar.FormCreate(Sender: TObject);
begin
  sqlBoletos.Connection := dtmControles.DB;

  imgEMAIL.Visible    := vgBoleto.EnviarEmail = 'S';
  imgImprimir.Visible := vgBoleto.EnviarEmail <> 'S';

  Screen.Cursor := crHourGlass;
  sqlBoletos.Active := False;
  sqlBoletos.DataSet.ParamByName('CEDENTE_ID').AsBCD     := vgCedenteAtivo;
  sqlBoletos.DataSet.ParamByName('ANO_MES_BOLETO').AsBCD := vgPeriodoAtual;
  sqlBoletos.DataSet.ParamByName('EMAIL').AsString       := vgBoleto.EnviarEmail;
  sqlBoletos.Active := True;
  Screen.Cursor := crDefault;

  popMudarParaEmail.Visible     := vgBoleto.EnviarEmail = 'N';
  popMudarParaImpressao.Visible := vgBoleto.EnviarEmail = 'S';
end;

procedure TfrmSelecionarBoletoEnviar.MarcarDesmarcarCompromissos(vpMarcar,
  vpTodos: Boolean);
begin
  sqlBoletos.DisableControls;
  sqlBoletos.First;
  while not sqlBoletos.eof do
  begin
    sqlBoletos.Edit;
    if (not vpTodos) and (sqlBoletosTRANSMITIDO.AsString = 'S') then
         sqlBoletos.FieldByName('Selecionar').AsBoolean := False
    else sqlBoletos.FieldByName('Selecionar').AsBoolean := vpMarcar;
    sqlBoletos.post;
    sqlBoletos.next;
  end;
  sqlBoletos.First;
  sqlBoletos.EnableControls;
end;

procedure TfrmSelecionarBoletoEnviar.popMudarParaEmailClick(Sender: TObject);
var
  viNomeArquivo, viPastaVelha, viPastaNova : String;
begin
  if Application.MessageBox(Pchar('Confirma envio do boleto '+sqlBoletosBOLETA_ID.AsString+
                                  ' para a pasta de email?'),
      'Confirmação', MB_YESNO) = IDNO then
    exit;

  ExecutaSqlAuxiliar(' UPDATE T_BOLETA SET ENVIO_EMAIL = '+ QuotedStr('S')+', '+
                     '                   CAMINHO_ARQUIVO = :CAMINHO_ARQUIVO '+
                     ' WHERE CEDENTE_ID = '+IntToStr(vgCedenteAtivo)+
                     '   AND BOLETA_ID = '+ sqlBoletosBOLETA_ID.AsString,2);
  With dtmControles.sqlAuxiliar do
  begin
    viNomeArquivo := ExtractFileName(sqlBoletosCAMINHO_ARQUIVO.AsString);
    viPastaVelha  := ExtractFileDir(sqlBoletosCAMINHO_ARQUIVO.AsString);
    viPastaNova   := viPastaVelha+ '\EMAIL';
    ParamByName('CAMINHO_ARQUIVO').AsString := viPastaNova +'\'+ viNomeArquivo;
    ExecSQL(FALSE);
  end;

  MoveFile(Pchar(viPastaVelha+'\'+viNomeArquivo), Pchar(viPastaNova+'\'+viNomeArquivo));
  sqlBoletos.Refresh;
  dtmLookup.MarcarDesmarcarCompromissos(sqlBoletos, True);
end;

procedure TfrmSelecionarBoletoEnviar.popMudarParaImpressaoClick(
  Sender: TObject);
var
  viNomeArquivo, viPastaVelha, viPastaNova : String;
begin
  if Application.MessageBox(Pchar('Confirma envio do boleto '+sqlBoletosBOLETA_ID.AsString+
                                  ' para a pasta de impressao?'),
      'Confirmação', MB_YESNO) = IDNO then
    exit;

  ExecutaSqlAuxiliar(' UPDATE T_BOLETA SET ENVIO_EMAIL = '+ QuotedStr('N')+', '+
                     '                   CAMINHO_ARQUIVO = :CAMINHO_ARQUIVO '+
                     ' WHERE CEDENTE_ID = '+IntToStr(vgCedenteAtivo)+
                     '   AND BOLETA_ID = '+ sqlBoletosBOLETA_ID.AsString,2);
  With dtmControles.sqlAuxiliar do
  begin
    viNomeArquivo := ExtractFileName(sqlBoletosCAMINHO_ARQUIVO.AsString);
    viPastaVelha  := ExtractFileDir(sqlBoletosCAMINHO_ARQUIVO.AsString);
    viPastaNova   := copy(viPastaVelha,1, length(viPastaVelha)-6);
    ParamByName('CAMINHO_ARQUIVO').AsString := viPastaNova +'\'+ viNomeArquivo;
    ExecSQL(FALSE);
  end;

  MoveFile(Pchar(viPastaVelha+'\'+viNomeArquivo), Pchar(viPastaNova+'\'+viNomeArquivo));
  sqlBoletos.Refresh;
  dtmLookup.MarcarDesmarcarCompromissos(sqlBoletos, True);
end;

procedure TfrmSelecionarBoletoEnviar.sqlBoletosAfterScroll(DataSet: TDataSet);
begin
  popMudarParaEmail.Enabled     := not sqlBoletos.IsEmpty;
  popMudarParaImpressao.Enabled := not sqlBoletos.IsEmpty;
end;

procedure TfrmSelecionarBoletoEnviar.sqlBoletosCalcFields(
  DataSet: TDataSet);
begin
  if sqlBoletosPESSOA_ID.IsNull then
       sqlBoletoscalc_Nome.AsString := sqlBoletosDESCRICAO.AsString
  else sqlBoletoscalc_Nome.AsString := sqlBoletosNOME.AsString;
end;

end.
