unit LogMensagens;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  cxEdit,
  Menus,
  DB,
  cxGridLevel,
  cxGridDBTableView,
  cxGrid,
  cxDBLookupComboBox,
  StdCtrls,
  cxButtons,
  cxCalendar,
  ExtCtrls,
  cxSplitter,
  DBClient,
  SimpleDS,
  WPCTRRich,
  cxControls,
  cxContainer,
  ComCtrls,
  cxGridCustomTableView,
  cxGridTableView,
  cxClasses,
  cxGridCustomView,
  cxDropDownEdit,
  cxLookupEdit,
  cxDBLookupEdit,
  cxTextEdit,
  cxMaskEdit,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  dxCore, cxDateUtils,
  cxStyles,
  cxCustomData,
  cxFilter,
  cxData,
  cxDataStorage,
  cxNavigator,
  cxDBData;

type
  TfrmLogMensagens = class(TForm)
    pnl15: TPanel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    edtDataIniChat: TcxDateEdit;
    edtDataFimChat: TcxDateEdit;
    btnPesquisarLogChat: TcxButton;
    lcxDE: TcxLookupComboBox;
    lcxPARA: TcxLookupComboBox;
    btnLimparPesquisaMensagens: TcxButton;
    pnl16: TPanel;
    lblRegistrosEncontrados: TLabel;
    lbl10: TLabel;
    grdPesquisa: TcxGrid;
    gridPesquisaPedidos: TcxGridDBTableView;
    gridPesquisaPedidosDATA: TcxGridDBColumn;
    gridPesquisaPedidosUSUARIO_ENVIOU_ID: TcxGridDBColumn;
    gridPesquisaPedidosUSUARIO_RECEBEU_ID: TcxGridDBColumn;
    gridPesquisaPedidosMENSAGEM: TcxGridDBColumn;
    grdPesquisaLevel1: TcxGridLevel;
    Panel1: TPanel;
    btnFechar: TcxButton;
    cxSplitter5: TcxSplitter;
    edtLogChat: TMemo;
    sqlLogChat: TSimpleDataSet;
    sqlLogChatCHAT_ID: TFMTBCDField;
    sqlLogChatUSUARIO_RECEBEU_ID: TFMTBCDField;
    sqlLogChatUSUARIO_ENVIOU_ID: TFMTBCDField;
    sqlLogChatMENSAGEM: TStringField;
    sqlLogChatDATA: TSQLTimeStampField;
    sqlLogChatRECEBEU: TStringField;
    sqlLogChatEXCLUIR: TStringField;
    sqlLogChatGRAVAR_PARA_CONSULTA: TStringField;
    sqlLogChatID_CONTROLE: TFMTBCDField;
    sqlLogChatMensagemCalc: TStringField;
    sqlLogChatUsuarioEnviouCalc: TStringField;
    sqlLogChatUsuarioRecebeuCalc: TStringField;
    sqlLogChatMENSAGEM_BLOB: TBlobField;
    sqlLogChatMOSTRAR_NO_LOG: TStringField;
    dtsLogChat: TDataSource;
    popExcluirDoLog: TPopupMenu;
    ExcluirdoLogdeMensagens1: TMenuItem;
    procedure btnLimparPesquisaMensagensClick(Sender: TObject);
    procedure btnPesquisarLogChatClick(Sender: TObject);
    procedure sqlLogChatAfterScroll(DataSet: TDataSet);
    procedure sqlLogChatCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure ExcluirdoLogdeMensagens1Click(Sender: TObject);
    procedure lcxDEPropertiesChange(Sender: TObject);
    procedure lcxPARAPropertiesChange(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure AtualizarTextoLogChat;    
  public
    { Public declarations }
  end;

var
  frmLogMensagens: TfrmLogMensagens;

implementation

uses
  Controles,
  Rotinas,
  IntervaloDatas,
  IntervaloDatasImpl,
  IntervaloDatasException,
  MensagemUtils,
  FocoUtils,
  System.DateUtils;

{$R *.dfm}

procedure TfrmLogMensagens.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLogMensagens.btnLimparPesquisaMensagensClick(Sender: TObject);
begin
  lcxDE.Clear;
  lcxPARA.Clear;
end;

procedure TfrmLogMensagens.btnPesquisarLogChatClick(Sender: TObject);
{$REGION 'Vari�veis'}
var
  vSql: string;
  vSqlComplemento: string;
  viDataInicial: TDateTime;
  viDataFinal: TDateTime;
  viIntervaloDatas: IIntervaloDatas;
{$ENDREGION}
begin
  try
    viDataInicial := 0;
    if edtDataIniChat.EditValue <> Null then
      viDataInicial := DateOf(
        edtDataIniChat.Date);

    viDataFinal := 0;
    if edtDataFimChat.EditValue <> Null then
      viDataFinal := DateOf(
        edtDataFimChat.Date);

    viIntervaloDatas := TIntervaloDatas.New(
      viDataInicial,
      viDataFinal);

    if viIntervaloDatas.TemDataFinal then
      viIntervaloDatas.Validar;
  except
    on E: EIntervaloDatasException do
    begin
      TMensagemUtils.ExibirMensagemAtencao(
        E.Message);

      TFocoUtils.Focar(
        edtDataFimChat);

      edtDataFimChat.DroppedDown := True;
      Exit;
    end;
  end;

  Screen.Cursor := crSQLWait ;
  vSqlComplemento := '';
  vSql := 'SELECT * '+
          ' FROM   G_CHAT '+
          ' WHERE (MOSTRAR_NO_LOG IS NULL OR MOSTRAR_NO_LOG = '+QuotedStr('S')+') ';

  if Trim(edtDataIniChat.Text) <> '' then
  begin
    if Trim(edtDataFimChat.Text) = '' then
      edtDataFimChat.Text := edtDataIniChat.Text;
    vSqlComplemento := vSqlComplemento + ' AND DATA '+
                       Controles.MontarSqlData(StrToDate(edtDataIniChat.Text),StrToDate(edtDataFimChat.Text));
  end;

  if lcxDE.EditValue <> Null then
    vSqlComplemento := vSqlComplemento + ' AND (USUARIO_ENVIOU_ID = '+ IntToStr(lcxDE.EditValue) + ' AND USUARIO_RECEBEU_ID = '+ vgUsuarioID +') '
  else if lcxPARA.EditValue <> Null then
    vSqlComplemento := vSqlComplemento + ' AND (USUARIO_ENVIOU_ID = '+ vgUsuarioID + ' AND USUARIO_RECEBEU_ID = '+ IntToStr(lcxPARA.EditValue) +') '
  else
    vSqlComplemento := vSqlComplemento + ' AND (USUARIO_ENVIOU_ID = '+ vgUsuarioID + ' OR USUARIO_RECEBEU_ID = '+ vgUsuarioID +') ';

  {with dtmControles.sqlAuxiliar do
  begin
    Active := False;
    Sql.Clear;
    Sql.Add('SELECT COUNT(*) '+
            'FROM   G_CHAT '+
            ' WHERE (MOSTRAR_NO_LOG IS NULL OR MOSTRAR_NO_LOG = '+QuotedStr('S')+') '+
            vSqlComplemento);
    Active := True;
  end;
  lblRegistrosEncontrados.Caption := ' N� de Registros Encontrados: '+ IntToStr(dtmControles.sqlAuxiliar.Fields[0].AsInteger);
  dtmControles.sqlAuxiliar.Active := False;}

  with sqlLogChat do
  begin
    Active := False;
    DataSet.CommandText := vSql + vSqlComplemento + ' ORDER BY DATA DESC ';
    sqlLogchat.AfterScroll := nil;
    Active := True;
    sqlLogchat.AfterScroll := sqlLogChatAfterScroll;
  end;

  lblRegistrosEncontrados.Caption := 'N� de Registros Encontrados: ' +
    sqlLogChat.RecordCount.ToString;

  AtualizarTextoLogChat;
  Screen.Cursor := crDefault;
end;

procedure TfrmLogMensagens.ExcluirdoLogdeMensagens1Click(Sender: TObject);
begin
  if sqlLogChat.IsEmpty then
    exit;
  sqlLogChat.Edit;
  sqlLogChatMOSTRAR_NO_LOG.AsString := 'N';
  sqlLogChat.ApplyUpdates(-1);
  Application.ProcessMessages;
end;

procedure TfrmLogMensagens.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmLogMensagens := nil;
end;

procedure TfrmLogMensagens.FormCreate(Sender: TObject);
begin
  sqlLogChat.Connection := dtmControles.DBH;

  edtDataIniChat.EditValue := dtmControles.DataHoraBanco(3) - 5;
  edtDataFimChat.EditValue := dtmControles.DataHoraBanco(3);
  lcxDE.Clear;
  lcxPARA.Clear;
end;

procedure TfrmLogMensagens.lcxDEPropertiesChange(Sender: TObject);
begin
  lcxPARA.Clear;
end;

procedure TfrmLogMensagens.lcxPARAPropertiesChange(Sender: TObject);
begin
  lcxDE.Clear;
end;

procedure TfrmLogMensagens.sqlLogChatAfterScroll(DataSet: TDataSet);
begin
  AtualizarTextoLogChat;
end;

procedure TfrmLogMensagens.sqlLogChatCalcFields(DataSet: TDataSet);
var
  vWptChat : TWPRichText;
begin
  vWptChat := TWPRichText.Create(Application);  //Chat
  vWptChat.AsString := DeCompressString(sqlLogChatMENSAGEM_BLOB.AsAnsiString);
  sqlLogChatMensagemCalc.AsString := Copy(vWptChat.Text, 1, 2000);
  FreeAndNil(vWptChat);
  
  with dtmControles.sqlAuxiliar do
  begin
    Active := False;
    Sql.Clear;
    Sql.Add('SELECT LOGIN '+
            'FROM   G_USUARIO '+
            ' WHERE USUARIO_ID = :USUARIO_ID ');
    Params[0].AsCurrency := sqlLogChatUSUARIO_ENVIOU_ID.AsCurrency;
    Active := True;
    sqlLogChatUsuarioEnviouCalc.AsString := dtmControles.sqlAuxiliar.Fields[0].AsString;
    Active := False;
  end;
  with dtmControles.sqlAuxiliar do
  begin
    Active := False;
    Sql.Clear;
    Sql.Add('SELECT LOGIN '+
            'FROM   G_USUARIO '+
            ' WHERE USUARIO_ID = :USUARIO_ID ');
    Params[0].AsCurrency := sqlLogChatUSUARIO_RECEBEU_ID.AsCurrency;
    Active := True;
    sqlLogChatUsuarioRecebeuCalc.AsString := dtmControles.sqlAuxiliar.Fields[0].AsString;
    Active := False;
  end;

end;

procedure TfrmLogMensagens.AtualizarTextoLogChat;
begin
  edtLogChat.Clear;
  if sqlLogChat.RecordCount > 0 then
    edtLogChat.Text := sqlLogChatMensagemCalc.AsString;
end;

end.
