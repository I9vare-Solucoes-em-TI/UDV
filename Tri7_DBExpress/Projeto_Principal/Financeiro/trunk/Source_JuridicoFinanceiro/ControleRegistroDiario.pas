unit ControleRegistroDiario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxCalendar,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxLabel, ExtCtrls,
  ToolWin, ActnMan, ActnCtrls, ActnMenus, cxTextEdit, StdCtrls, cxButtons,
  Menus, FrameEditor, cxContainer, cxGroupBox, ComCtrls, DBClient, SimpleDS,
  ActnList, XPStyleActnCtrls, StdStyleActnCtrls, cxMaskEdit, Controles,
  cxDropDownEdit, cxImageComboBox, clipbrd, WPRTEPaint, WPRTEDefs,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, WPCTRRich, cxPC,
  FrameEditorSimples, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxRadioGroup, cxTrackBar, WPCTRMemo,
  frxClass, frxDBSet, cxSplitter, cxCurrencyEdit, cxCheckBox, cxDBEdit, Buttons;

type
  TfrmControleRegistroDiario = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    pagPrincipal: TcxPageControl;
    tbsPesquisa: TcxTabSheet;
    Panel3: TPanel;
    sqlPesquisa: TSimpleDataSet;
    dtsPesquisa: TDataSource;
    frxEtiqueta: TfrxReport;
    sqlTextosEtiquetas: TClientDataSet;
    sqlTextosEtiquetasTEXTO: TBlobField;
    sqlTextosEtiquetasORDEM: TIntegerField;
    pnlPesquisar: TPanel;
    cxGroupBox6: TcxGroupBox;
    Label8: TLabel;
    cxLabel35: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    Panel2: TPanel;
    btnItemIncluir: TcxButton;
    Panel4: TPanel;
    btnFechar: TcxButton;
    pgcDados: TcxPageControl;
    tabReceitas: TcxTabSheet;
    GridPesquisa: TcxGrid;
    GridPesquisacxGridDBTableView3: TcxGridDBTableView;
    GridPesquisacxGridDBTableDataPedido: TcxGridDBColumn;
    GridPesquisacxGridDBTableProtocolo: TcxGridDBColumn;
    GridPesquisacxGridDBTableView3Column1: TcxGridDBColumn;
    GridPesquisacxGridDBTableUsuario: TcxGridDBColumn;
    GridPesquisacxGridLevel3: TcxGridLevel;
    sqlTipoServico: TSimpleDataSet;
    GridPesquisacxGridDBTableView3Column2: TcxGridDBColumn;
    GridPesquisacxGridDBTableView3Column3: TcxGridDBColumn;
    GridPesquisacxGridDBReceita: TcxGridDBColumn;
    cxLabel7: TcxLabel;
    ActionManager2: TActionManager;
    actImprimirEtiqueta: TAction;
    actFechamentoDia: TAction;
    cxLabel4: TcxLabel;
    sqlTipoServicoCAIXA_SERVICO_ID: TFMTBCDField;
    sqlTipoServicoDESCRICAO: TStringField;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    dtsTipoServico: TDataSource;
    btnAlterarRep: TcxButton;
    btnExcluirRep: TcxButton;
    actReabrirRegistroDiario: TAction;
    GridPesquisacxGridDBTableView3Column4: TcxGridDBColumn;
    GridPesquisacxGridDBTableView3Column7: TcxGridDBColumn;
    GridPesquisacxGridDBTableView3Column8: TcxGridDBColumn;
    cxLabel5: TcxLabel;
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
    GridPesquisacxGridDBTableView3Column5: TcxGridDBColumn;
    GridPesquisacxGridDBDespesa: TcxGridDBColumn;
    edtPesqDtRegIni: TcxDateEdit;
    edtPesqDtRegFim: TcxDateEdit;
    icxTipoSistema: TcxImageComboBox;
    lcxTipoServico: TcxLookupComboBox;
    lcxPesqUsuario: TcxLookupComboBox;
    edtPesqProtocolo: TcxTextEdit;
    edtPesqSelo: TcxTextEdit;
    edtPesqDetalhes: TcxTextEdit;
    btnPesquisarRegistro: TcxButton;
    btnLimparPesquisa: TcxButton;
    sqlPesquisaLIVRO: TStringField;
    sqlPesquisaFOLHA: TStringField;
    cxButton1: TcxButton;
    btnBalanceteFechar: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnLimparPesquisaClick(Sender: TObject);
    procedure edtPesqApresentanteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPesquisarRegistroClick(Sender: TObject);
    procedure actImprimirEtiquetaExecute(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure cxGridDBTableView5CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure btnItemIncluirClick(Sender: TObject);
    procedure sqlPesquisaCalcFields(DataSet: TDataSet);
    procedure btnExcluirRepClick(Sender: TObject);
    procedure sqlPesquisaAfterScroll(DataSet: TDataSet);
    procedure btnAlterarRepClick(Sender: TObject);
    procedure GridPesquisacxGridDBTableView3DblClick(Sender: TObject);
    procedure pgcDadosChange(Sender: TObject);
    procedure icxTipoSistemaPropertiesEditValueChanged(Sender: TObject);
    procedure btnBalanceteFecharClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
    vgEscreventeLogin : String;
    vlCriandoForm : Boolean; 

  public
    { Public declarations }
    vgModeloCabecalho1, vgModeloCabecalho2, vgModeloRodape : String;
    vgPaginaAtual : string;
    vpUsarNumeroLetra: string;
    vgEscreventePadrao : integer;
  end;

var
  frmControleRegistroDiario: TfrmControleRegistroDiario;
  vgImpressaoRealizada : Boolean;

implementation

uses Lookup,  Rotinas, Principal, Cadastro,
  ControleVariaveis, CadBasico, ValidarPermissaoUsuario, Etiqueta, VisualizaRelatorios, Atualizacao, 
  GerenciadorCadastro, CadastroAlteracao, ImpressaoLivro, 
  DespesasCaixaCartorio;

{$R *.dfm}

procedure TfrmControleRegistroDiario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sqlPesquisa.Active    := False;
  sqlTipoServico.Active := False;

  Action := caFree;
  frmControleRegistroDiario := nil;
end;

procedure TfrmControleRegistroDiario.FormActivate(Sender: TObject);
begin
//  ammOpcoes.ColorMap := dtmControles.StandardColorMap1;
//  ammOpcoes.ColorMap := dtmControles.StandardColorMap1;

  dtmControles.StandardColorMap1.BtnSelectedColor := clNavy;
  dtmControles.StandardColorMap1.Color            := clSkyBlue;
  dtmControles.StandardColorMap1.BtnSelectedFont  := clWindow;

  if pagPrincipal.ActivePageIndex = 0 then
    edtPesqProtocolo.SetFocus;
end;

procedure TfrmControleRegistroDiario.FormCreate(Sender: TObject);
begin
  vlCriandoForm := True;
  sqlPesquisa.Connection     := dtmControles.DB;
  sqlTipoServico.Connection  := dtmControles.DB;

  vgEscreventePadrao := dtmControles.BuscarConfig('PRINCIPAL','GERAL','ESCREVENTE_PADRAO','I');

  edtPesqDtRegIni.EditValue :=  dtmControles.DataHoraBanco(4);
  edtPesqDtRegFim.EditValue := dtmControles.DataHoraBanco(4);

  pagPrincipal.ActivePage   := tbsPesquisa;
  dtmLookup.CarregarListaSistemas(icxTipoSistema, False);
  pagPrincipal.ActivePageIndex := 0;
  btnPesquisarRegistroClick(Self);
  vlCriandoForm := False;
end;

procedure TfrmControleRegistroDiario.cxButton1Click(Sender: TObject);
begin
  ExibirFormulario(TfrmDespesasCaixa, frmDespesasCaixa);
end;

procedure TfrmControleRegistroDiario.cxGridDBTableView5CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
 if AViewInfo.RecordViewInfo.GridRecord.Values[0] = True then
    ACanvas.Font.Color := clRed;
end;

procedure TfrmControleRegistroDiario.pgcDadosChange(Sender: TObject);
begin
{ sqlPesquisa.Filtered  := False;
  sqlTipoServico.Active := False;
  if pgcDados.ActivePageIndex = 0 then
  begin
    sqlPesquisa.Filter   := ' OPERACAO = '+ QuotedStr('C');
    sqlTipoServico.DataSet.ParamByName('TIPO_TRANSACAO').AsString := 'C';
  end
  else
  begin
    sqlPesquisa.Filter   := ' OPERACAO = '+ QuotedStr('D');
    sqlTipoServico.DataSet.ParamByName('TIPO_TRANSACAO').AsString := 'D';
  end;
  sqlPesquisa.Filtered  := True;
  sqlTipoServico.Active := True;}
end;

procedure TfrmControleRegistroDiario.btnPesquisarRegistroClick(Sender: TObject);
var
  viPesquisa, viCondicao, viDataInicial, viDataFinal  : String;
  viPesqData : Boolean;
begin
  inherited;
  Screen.Cursor := crHourGlass;
  if (edtPesqDtRegIni.EditValue <> null) and (edtPesqDtRegFim.EditValue <> null) then
  begin
    viDataInicial := DateToStr(edtPesqDtRegIni.Date);
    viDataFinal   := DateToStr(edtPesqDtRegFim.Date);
    viPesqData    := True;
  end
  else
  begin
    viDataInicial := dtmControles.DataHoraBanco(4);
    viDataFinal   := dtmControles.DataHoraBanco(4);
    viPesqData    := False;
  end;

  viPesquisa := ' SELECT * FROM C_REGISTRO_DIARIO '+
                ' WHERE NOT REGISTRO_DIARIO_ID IS NULL ';

  // PESQUISA DATA
  if viPesqData then
    viCondicao := viCondicao + ' AND DATA BETWEEN '+ QuotedStr(dtmControles.DataParaString(StrToDate(viDataInicial))) + ' AND '+
                                                  QuotedStr(dtmControles.DataParaString(StrToDate(viDataFinal)));

  // PESQUISA TIPO DE SERVIÇO
  if lcxTipoServico.Text <> '' then
    viCondicao := viCondicao + ' AND CAIXA_SERVICO_ID = '+InttoStr(lcxTipoServico.editValue);

  // PESQUISA SERVENTIA
  if icxTipoSistema.Text <> '' then
    viCondicao := viCondicao + ' AND SERVENTIA = '+QuotedStr(icxTipoSistema.editValue);

      // PESQUISA POR SELO
  if trim(edtPesqSelo.Text) <> '' then
    viCondicao := ' AND SELO LIKE '+QuotedStr(edtPesqSelo.Text+'%');

  // PESQUISA POR PROTOCOLO
  if trim(edtPesqProtocolo.Text) <> '' then
    viCondicao := viCondicao + ' AND PROTOCOLO = '+edtPesqProtocolo.Text;

  // PESQUISA POR DETALHES
  if edtPesqDetalhes.Text <> '' then
    viCondicao := viCondicao + ' AND DESCRICAO LIKE '+QuotedStr('%'+edtPesqDetalhes.Text+'%');

  // PESQUISA POR USUARIO
  if lcxPesqUsuario.Text <> '' then
    viCondicao := viCondicao + ' AND USUARIO_ID = '+ inttostr(lcxPesqUsuario.EditValue);

  // CASO NÃO TENHA FILTRO DE PESQUISA, MOSTRA TODOS OS REGISTROS QUE ESTÃO EM ABERTO E OS QUE FORAM LAVRADOS NO DIA.
  if viCondicao = '' then
    viCondicao := ' AND (DATA IS NULL  '+
                  ' OR DATA '+ MontarSqlData(StrToDate(viDataInicial), StrToDate(viDataFinal))+')';

  sqlPesquisa.AfterScroll := Nil;
  sqlPesquisa.Active := False;
  sqlPesquisa.DataSet.CommandText := viPesquisa + viCondicao + ' ORDER BY DATA, SERVENTIA';
  sqlPesquisa.Active := True;

  if not vlCriandoForm  then
    edtPesqProtocolo.SetFocus;

  sqlPesquisa.AfterScroll := sqlPesquisaAfterScroll;
  sqlPesquisaAfterScroll(sqlPesquisa);
  GridPesquisacxGridDBTableView3.DataController.Groups.FullExpand;

  Screen.Cursor := crDefault;
end;

procedure TfrmControleRegistroDiario.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  DestruirComponentes;
end;

procedure TfrmControleRegistroDiario.FormShow(Sender: TObject);
begin
  if vgEscreventeLogin = 'S' then
  begin
    // Verifica se o usuário que esta logado assina
    if dtmControles.GetStr('SELECT ASSINA FROM G_USUARIO WHERE USUARIO_ID = '+vgUsuarioID) = 'S' then
      vgEscreventePadrao := StrToInt(vgUsuarioID);
  end;
end;

procedure TfrmControleRegistroDiario.GridPesquisacxGridDBTableView3DblClick(
  Sender: TObject);
begin
  btnAlterarRepClick(self);
end;

procedure TfrmControleRegistroDiario.icxTipoSistemaPropertiesEditValueChanged(
  Sender: TObject);
begin
  if icxTipoSistema.EditValue <> null then
  begin
    sqlTipoServico.Active := False;
    sqlTipoServico.DataSet.ParamByName('SERVENTIA').AsString := icxTipoSistema.EditValue;
    sqlTipoServico.Active := True;
  end;

  lcxTipoServico.Enabled := icxTipoSistema.EditValue <> null;

end;

procedure TfrmControleRegistroDiario.btnLimparPesquisaClick(Sender: TObject);
begin
  edtPesqProtocolo.Clear;
  edtPesqDtRegIni.Clear;
  edtPesqDtRegFim.Clear;
  edtPesqProtocolo.Clear;
  edtPesqDetalhes.Clear;
  edtPesqSelo.Clear; 
  icxTipoSistema.EditValue    := -1;
  lcxPesqUsuario.EditValue := null;
  lcxTipoServico.EditValue := null;
  btnPesquisarRegistroClick(Self);
end;

procedure TfrmControleRegistroDiario.actImprimirEtiquetaExecute(Sender: TObject);
begin
{  SolicitarAutorizacaoReimpressao('Selo(s)');
  vgEtiqueta.InicioEtiqueta  := dtmControles.BuscarConfig('SELO','ETIQUETA','ETIQUETA_ATUAL','I');

  vgEtiqueta.EscreventeNome       := '';
  vgEtiqueta.EscreventeId         := vgEscreventePadrao;
  vgEtiqueta.GrupoModeloEtiqueta  := 'MODELO_ETIQUETA_SELO';
  vgEtiqueta.QtdEtiqueta          := dtmControles.BuscarConfig('SELO','ETIQUETA','QTD_ETIQUETA','I');
  vgEtiqueta.QtdImprimir          := 1;

  Application.CreateForm(TfrmEtiqueta, frmEtiqueta);
  ExibirFormulario(TfrmEtiqueta,frmEtiqueta, true);

  if vgEtiqueta.InicioEtiqueta <> -1 then
    ImprimirEtiqueta;  }
end;

procedure TfrmControleRegistroDiario.btnAlterarRepClick(Sender: TObject);
begin
  if sqlPesquisa.IsEmpty then
    exit;
  ExibirFormulario(TfrmCadastroAlteracao, frmCadastroAlteracao, True);
end;

procedure TfrmControleRegistroDiario.btnBalanceteFecharClick(Sender: TObject);
begin
  vgImpressaoDataInicial := edtPesqDtRegIni.Date;
  vgImpressaoDataFinal   := edtPesqDtRegFim.Date;
  ExibirFormulario(TfrmImpressaoLivro, frmImpressaoLivro, true);
end;

procedure TfrmControleRegistroDiario.btnExcluirRepClick(Sender: TObject);
begin
  if Application.MessageBox(PCHAR('Excluir Item Selecionado. Confirma ?'),'Confirmar', MB_ICONQUESTION + MB_YESNO) = IDNO then
    exit;

  sqlPesquisa.Delete;
  sqlPesquisa.ApplyUpdates(-1);
end;

procedure TfrmControleRegistroDiario.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TfrmControleRegistroDiario.btnItemIncluirClick(Sender: TObject);
begin
  ExibirFormulario(TfrmGerenciadorCadastro, frmGerenciadorCadastro, True);

  if vgDadosCadastroItem.Confirmado then
  begin
    btnPesquisarRegistroClick(self);
    sqlPesquisa.Locate('CONTROLE_ID', vgDadosCadastroItem.ControleID, [loCaseInsensitive]);
  end;
end;

procedure TfrmControleRegistroDiario.SpeedButton1Click(Sender: TObject);
begin
  lcxTipoServico.EditValue := Null; 
end;

procedure TfrmControleRegistroDiario.SpeedButton3Click(Sender: TObject);
begin
  icxTipoSistema.EditValue := -1;
end;

procedure TfrmControleRegistroDiario.sqlPesquisaAfterScroll(DataSet: TDataSet);
begin
  btnAlterarRep.Enabled := sqlPesquisa.RecordCount > 0;
  btnExcluirRep.Enabled := sqlPesquisa.RecordCount > 0;
end;

procedure TfrmControleRegistroDiario.sqlPesquisaCalcFields(DataSet: TDataSet);
begin
  if sqlPesquisaOPERACAO.AsString = 'C' then
       sqlPesquisaCALC_RECEITA.AsCurrency := sqlPesquisaVALOR.AsCurrency * sqlPesquisaQTD.AsInteger
  else sqlPesquisaCALC_DESPESA.AsCurrency := sqlPesquisaVALOR.AsCurrency * sqlPesquisaQTD.AsInteger;
end;

procedure TfrmControleRegistroDiario.edtPesqApresentanteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
    btnPesquisarRegistroClick(self);
end;

end.
