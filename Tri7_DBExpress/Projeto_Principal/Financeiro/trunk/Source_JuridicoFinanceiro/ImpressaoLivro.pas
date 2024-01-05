unit ImpressaoLivro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, Menus, StdCtrls,
  cxButtons, cxTextEdit, cxControls, cxContainer, cxEdit, cxGroupBox,
  cxMaskEdit, cxDropDownEdit, cxCalendar, ExtCtrls, cxLabel, dxGDIPlusClasses,
  DB, DBClient, SimpleDS, frxClass, frxDBSet;

type
  TfrmImpressaoLivro = class(TForm)
    pnlInformacao: TPanel;
    imgPagar: TImage;
    lblInformacaoCertidao: TcxLabel;
    Shape1: TShape;
    cxLabel3: TcxLabel;
    Label8: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edtPesqDtRegIni: TcxDateEdit;
    edtPesqDtRegFim: TcxDateEdit;
    btnPesquisarRegistro: TcxButton;
    edtLivro: TcxTextEdit;
    edtFolha: TcxTextEdit;
    edtAssina: TcxTextEdit;
    btnConfirmarItem: TcxButton;
    btnCancelar: TcxButton;
    sqlPesquisa: TSimpleDataSet;
    sqlPesquisaREGISTRO_DIARIO_ID: TFMTBCDField;
    sqlPesquisaDESCRICAO: TStringField;
    sqlPesquisaAPRESENTANTE: TStringField;
    sqlPesquisaVALOR: TFMTBCDField;
    sqlPesquisaOPERACAO: TStringField;
    sqlPesquisaUSUARIO_ID: TFMTBCDField;
    sqlPesquisaPROTOCOLO: TFMTBCDField;
    sqlPesquisaDATA: TSQLTimeStampField;
    sqlPesquisaCONTROLE_ID: TFMTBCDField;
    sqlPesquisaQTD: TFMTBCDField;
    sqlPesquisaESCREVENTE: TFMTBCDField;
    sqlPesquisaSERVENTIA: TStringField;
    sqlPesquisaCAIXA_SERVICO_ID: TFMTBCDField;
    sqlPesquisaCALC_RECEITA: TCurrencyField;
    sqlPesquisaCALC_DESPESA: TCurrencyField;
    sqlPesquisaSELO: TStringField;
    sqlPesquisaLIVRO: TStringField;
    sqlPesquisaFOLHA: TStringField;
    dtsPesquisa: TDataSource;
    frxDBRelatorio: TfrxDBDataset;
    frxLivroDiario: TfrxReport;
    btnLimparPesquisa: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConfirmarItemClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnPesquisarRegistroClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtPesqDtRegIniKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAssinaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure frxLivroDiarioAfterPrintReport(Sender: TObject);
    function frxLivroDiarioUserFunction(const MethodName: string;
      var Params: Variant): Variant;
    procedure sqlPesquisaCalcFields(DataSet: TDataSet);
    procedure btnLimparPesquisaClick(Sender: TObject);
  private
   vgUltimaFolha, vgUltimoLivro : String;
    procedure CarregarParametro(Valor : String);
    procedure SetarParametros;
  public
    { Public declarations }
  end;

var
  frmImpressaoLivro: TfrmImpressaoLivro;
  vgLivroOK : Boolean;
  vgImpressaoDataInicial, vgImpressaoDataFinal : TDate;
implementation

uses
  Controles, VisualizaRelatorios, Lookup;

{$R *.dfm}

procedure TfrmImpressaoLivro.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmImpressaoLivro.btnConfirmarItemClick(Sender: TObject);
var
  viRelatorioLivroDiario : string;
begin
  viRelatorioLivroDiario := dtmControles.BuscarConfig('REGISTRO_DIARIO', 'RELATORIO', 'RELATORIO_DIARIO', 'S');

  VerificarPreenchimentoedt_tx(edtLivro.Text, 'Número do Livro',edtLivro);
  VerificarPreenchimentoedt_tx(edtFolha.Text, 'Número da Folha',edtFolha);
  VerificarPreenchimentoedt_tx(edtAssina.Text, 'Oficial/Escrevente que Assina',edtAssina);

  viRelatorioLivroDiario := dtmControles.BuscarConfig('REGISTRO_DIARIO', 'RELATORIO', 'RELATORIO_DIARIO', 'S');
  ExibirRelatorio(frxLivroDiario, viRelatorioLivroDiario, SetarParametros);

  vgLivroOK := True;
  Close;
end;

procedure TfrmImpressaoLivro.btnLimparPesquisaClick(Sender: TObject);
begin
  btnConfirmarItem.Enabled     := False;
  btnPesquisarRegistro.Enabled := True;
  edtPesqDtRegIni.Enabled      := True;
  edtPesqDtRegFim.Enabled      := True;

  edtPesqDtRegIni.Date := vgImpressaoDataInicial;
  edtPesqDtRegFim.Date := vgImpressaoDataFinal;
  edtLivro.Clear;
  edtFolha.Clear;
  edtAssina.Clear;
end;

procedure TfrmImpressaoLivro.btnPesquisarRegistroClick(Sender: TObject);
var
  viDataInicial, viDataFinal, viPesquisa, OficialAssina  : String;
begin
  VerificarPreenchimentoDTA_TX(edtPesqDtRegIni.Text, 'Data Inicial',edtPesqDtRegIni);
  VerificarPreenchimentoDTA_TX(edtPesqDtRegFim.Text, 'Data Final',edtPesqDtRegFim);

  viDataInicial := DateToStr(edtPesqDtRegIni.Date);
  viDataFinal   := DateToStr(edtPesqDtRegFim.Date);

  Screen.Cursor := crHourGlass;
  viPesquisa := ' SELECT * FROM C_REGISTRO_DIARIO '+
                ' WHERE NOT REGISTRO_DIARIO_ID IS NULL '+
                ' AND DATA BETWEEN '+ QuotedStr(dtmControles.DataParaString(StrToDate(viDataInicial))) + ' AND '+
                                                 QuotedStr(dtmControles.DataParaString(StrToDate(viDataFinal)))+
                ' ORDER BY DATA, SERVENTIA, CAIXA_SERVICO_ID, PROTOCOLO';

  sqlPesquisa.Active := False;
  sqlPesquisa.DataSet.CommandText := viPesquisa;
  sqlPesquisa.Active := True;
  Screen.Cursor := crDefault;

  edtLivro.Text  := dtmControles.BuscarConfig('REGISTRO_DIARIO', 'RELATORIO', 'LIVRO_NUMERO_ATUAL', 'S');
  edtFolha.Text  := dtmControles.BuscarConfig('REGISTRO_DIARIO', 'RELATORIO', 'FOLHA_NUMERO_ATUAL', 'S');
  OficialAssina  := dtmControles.BuscarConfig('REGISTRO_DIARIO', 'RELATORIO', 'OFICIAL_ESCREVENTE_ASSINA', 'S');

  btnConfirmarItem.Enabled     := True;
  btnPesquisarRegistro.Enabled := False;
  edtPesqDtRegIni.Enabled      := False;
  edtPesqDtRegFim.Enabled      := False;

  edtAssina.Text := OficialAssina;
  edtLivro.SetFocus;
end;

procedure TfrmImpressaoLivro.CarregarParametro(Valor: String);
begin
  if Trim(Valor) <> '' then
  begin
    //Final da Impressão
    vgUltimoLivro := GetField(Valor);
    vgUltimaFolha := Valor;
  end;
end;

procedure TfrmImpressaoLivro.edtPesqDtRegIniKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
    btnPesquisarRegistroClick(Self);
end;

procedure TfrmImpressaoLivro.FormActivate(Sender: TObject);
begin
  vgLivroOK := False;
  edtPesqDtRegIni.Date := vgImpressaoDataInicial;
  edtPesqDtRegFim.Date := vgImpressaoDataFinal;
  edtPesqDtRegIni.SetFocus;
end;

procedure TfrmImpressaoLivro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmImpressaoLivro := nil;
end;

procedure TfrmImpressaoLivro.FormCreate(Sender: TObject);
begin
  sqlPesquisa.Connection := dtmControles.DB;

  ExecRetornaValores := CarregarParametro;
  CriarFuncoesRelatorio(frxLivroDiario);
end;

procedure TfrmImpressaoLivro.frxLivroDiarioAfterPrintReport(Sender: TObject);
begin
  dtmLookup.AtualizarParametro('LIVRO_NUMERO_ATUAL', 'RELATORIO', 'REGISTRO_DIARIO', '17', vgUltimoLivro);
  dtmLookup.AtualizarParametro('FOLHA_NUMERO_ATUAL', 'RELATORIO', 'REGISTRO_DIARIO', '17', vgUltimaFolha);
end;

function TfrmImpressaoLivro.frxLivroDiarioUserFunction(const MethodName: string;
  var Params: Variant): Variant;
begin
  Result := ExecutarFuncoesRelatorio(MethodName, Params);
end;

procedure TfrmImpressaoLivro.edtAssinaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    btnConfirmarItemClick(Self);
end;

procedure TfrmImpressaoLivro.SetarParametros;
begin
  frxLivroDiario.Variables.Variables['vgNomeCartorio']  := QuotedStr(dtmControles.BuscarConfig('PRINCIPAL', 'CARTORIO', 'NOME', 'S'));
  frxLivroDiario.Variables.Variables['vgLogin']         := QuotedStr(vgLogin);
  frxLivroDiario.Variables.Variables['vgDataInicial']   := QuotedStr(edtPesqDtRegIni.Text);
  frxLivroDiario.Variables.Variables['vgDataFinal']     := QuotedStr(edtPesqDtRegFim.Text);
  frxLivroDiario.Variables.Variables['Livro']           := QuotedStr(edtLivro.Text);
  frxLivroDiario.Variables.Variables['Folha']           := QuotedStr(edtFolha.Text);
  frxLivroDiario.Variables.Variables['TotalFolhas']     := QuotedStr('3000');
  frxLivroDiario.Variables.Variables['vgOficialAssina'] := QuotedStr(edtAssina.Text);
  frxLivroDiario.Variables.Variables['ANO']             := QuotedStr(copy(edtPesqDtRegFim.Text,7,4));
end;

procedure TfrmImpressaoLivro.sqlPesquisaCalcFields(DataSet: TDataSet);
begin
  if sqlPesquisaOPERACAO.AsString = 'C' then
       sqlPesquisaCALC_RECEITA.AsCurrency := sqlPesquisaVALOR.AsCurrency * sqlPesquisaQTD.AsInteger
  else sqlPesquisaCALC_DESPESA.AsCurrency := sqlPesquisaVALOR.AsCurrency * sqlPesquisaQTD.AsInteger;
end;

end.
