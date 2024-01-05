unit LogChat;

interface

uses
  I9Query,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WPCTRRich, cxEdit, DB, frxDBSet, SimpleDS, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxGrid, cxDBLookupComboBox,
  cxCalendar, StdCtrls, cxButtons, ExtCtrls, cxPC, cxControls,
  Menus, cxContainer,
  ComCtrls,
  frxClass, DBClient, cxGridTableView,
  cxClasses, cxGridCustomView, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxTextEdit, cxMaskEdit, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  dxBarBuiltInMenu, dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, cxDBData;

type
  TfrmLogChat = class(TForm)
    dtsChat: TDataSource;
    sqlChat: TI9Query;
    pagMovimentacao: TcxPageControl;
    tbsTitulosAndamento: TcxTabSheet;
    Panel2: TPanel;
    lblRegistrosEncontrados: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    btnPesquisar: TcxButton;
    btnLimparPesquisa: TcxButton;
    grdPesquisa: TcxGrid;
    gridPesquisaPedidos: TcxGridDBTableView;
    grdPesquisaLevel1: TcxGridLevel;
    btnFechar: TcxButton;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    edtDataIni: TcxDateEdit;
    edtDataFim: TcxDateEdit;
    lcxFuncionarioEnviou: TcxLookupComboBox;
    sqlChatCHAT_ID: TBCDField;
    sqlChatUSUARIO_RECEBEU_ID: TBCDField;
    sqlChatUSUARIO_ENVIOU_ID: TBCDField;
    sqlChatMENSAGEM: TStringField;
    sqlChatDATA: TSQLTimeStampField;
    sqlChatRECEBEU: TStringField;
    sqlChatEXCLUIR: TStringField;
    gridPesquisaPedidosUSUARIO_RECEBEU_ID: TcxGridDBColumn;
    gridPesquisaPedidosUSUARIO_ENVIOU_ID: TcxGridDBColumn;
    gridPesquisaPedidosMENSAGEM: TcxGridDBColumn;
    gridPesquisaPedidosDATA: TcxGridDBColumn;
    sqlChatMensagemCalc: TStringField;
    sqlChatMENSAGEM_BLOB: TBlobField;
    frxLogChat: TfrxDBDataset;
    btnImprimirLog: TcxButton;
    sqlChatUsuarioEnviouCalc: TStringField;
    sqlChatUsuarioRecebeuCalc: TStringField;
    sqlChatImprimir: TI9Query;
    sqlChatImprimirMensagemCalc: TStringField;
    sqlChatImprimirUsuarioEnviouCalc: TStringField;
    sqlChatImprimirUsuarioRecebeuCalc: TStringField;
    sqlChatImprimirUSUARIO_ENVIOU_ID: TBCDField;
    sqlChatImprimirDATA: TSQLTimeStampField;
    Label4: TLabel;
    lcxFuncionarioRecebeu: TcxLookupComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnLimparPesquisaClick(Sender: TObject);
    procedure sqlChatCalcFields(DataSet: TDataSet);
    procedure btnImprimirLogClick(Sender: TObject);
    procedure sqlChatImprimirCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    vpRelatorioChat: string;
    vQuantidadeRegistro: integer;
    vpQtdeUsuarioAtivo: integer;
    procedure LerConfig;
    procedure ParametrosRelatorio;
  public
    { Public declarations }
  end;

var
  frmLogChat: TfrmLogChat;

implementation
uses Controles, Lookup, Rotinas, VisualizaRelatorios;
{$R *.dfm}

procedure TfrmLogChat.LerConfig;
begin
  vpRelatorioChat := dtmControles.BuscarConfig('PRINCIPAL','RELATORIO','RELATORIO_CHAT','S');
end;

procedure TfrmLogChat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmLogChat := nil;
end;

procedure TfrmLogChat.FormCreate(Sender: TObject);
begin
  LerConfig;
  sqlChat.Connection         := dtmControles.DBH;
  sqlChatImprimir.Connection := dtmControles.DBH;
  gridPesquisaPedidosUSUARIO_ENVIOU_ID.RepositoryItem := dtmLookup.listaG_Usuario;
  gridPesquisaPedidosUSUARIO_RECEBEU_ID.RepositoryItem := dtmLookup.listaG_Usuario;
  lcxFuncionarioEnviou.RepositoryItem := dtmLookup.Lista_UsuarioSistema;
  lcxFuncionarioRecebeu.RepositoryItem := dtmLookup.Lista_UsuarioSistema;
end;

procedure TfrmLogChat.FormShow(Sender: TObject);
begin
  Update;
  Screen.Cursor := crSQLWait;
  edtDataIni.Date := dtmControles.DataHoraBanco(3);
  edtDataFim.Date := dtmControles.DataHoraBanco(3);
  Screen.Cursor := crDefault;
end;

procedure TfrmLogChat.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLogChat.btnPesquisarClick(Sender: TObject);
var
  vSql: string;
  vSqlComplemento: string;
begin
  Screen.Cursor := crSQLWait ;
  vSqlComplemento := '';
  vSql := 'SELECT * '+
          'FROM   G_CHAT ';

  if Trim(edtDataIni.Text) <> '' then
  begin
    if Trim(edtDataFim.Text) = '' then
      edtDataFim.Text := edtDataIni.Text;
    vSqlComplemento := ' WHERE DATA '+
                       Controles.MontarSqlData(StrToDate(edtDataIni.Text),StrToDate(edtDataFim.Text));
  end;
  if lcxFuncionarioEnviou.Text <> '' then
  begin
    if Trim(vSqlComplemento) = '' then
      vSqlComplemento := ' WHERE USUARIO_ENVIOU_ID = '+ IntToStr(lcxFuncionarioEnviou.EditValue)
    else
      vSqlComplemento := vSqlComplemento + ' AND USUARIO_ENVIOU_ID = '+ IntToStr(lcxFuncionarioEnviou.EditValue);
  end;
  if lcxFuncionarioRecebeu.Text <> '' then
  begin
    if Trim(vSqlComplemento) = '' then
      vSqlComplemento := ' WHERE USUARIO_RECEBEU_ID = '+ IntToStr(lcxFuncionarioRecebeu.EditValue)
    else
      vSqlComplemento := vSqlComplemento + ' AND USUARIO_RECEBEU_ID = '+ IntToStr(lcxFuncionarioRecebeu.EditValue);
  end;

  with sqlChat do
  begin
    Active := False;
    SQL.Text := vSql + vSqlComplemento + ' ORDER BY CHAT_ID ';
    Active := True;

    lblRegistrosEncontrados.Caption := ' Nº de Registros Encontrados: '+ IntToStr(RecordCount);
  end;
  Screen.Cursor := crDefault;
end;

procedure TfrmLogChat.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #13 :
    begin
      if (not (ActiveControl is TcxGrid)) then
      begin
        Key := #0;
        PostMessage (Handle, WM_NEXTDLGCTL, 0, 0);
      end;
    end;
  end; {case}
end;

procedure TfrmLogChat.btnLimparPesquisaClick(Sender: TObject);
begin
  lcxFuncionarioRecebeu.Clear;
  lcxFuncionarioEnviou.Clear;
  edtDataIni.Clear;
  edtDataFim.Clear;
end;

procedure TfrmLogChat.sqlChatCalcFields(DataSet: TDataSet);
var
  vWptChat : TWPRichText;
begin
  vWptChat := TWPRichText.Create(Application);  //Chat
  vWptChat.Clear;
  vWptChat.AsString := DeCompressString(sqlChatMENSAGEM_BLOB.AsAnsiString);
  sqlChatMensagemCalc.AsString := Copy(vWptChat.Text,1,2000);
  vWptChat.Free;
  with dtmControles.sqlAuxiliar do
  begin
    Active := False;
    Sql.Clear;
    Sql.Add('SELECT LOGIN '+
            'FROM   G_USUARIO '+
            ' WHERE USUARIO_ID = :USUARIO_ID ');
    Params[0].AsCurrency := sqlChatUSUARIO_ENVIOU_ID.AsCurrency;
    Active := True;
    sqlChatUsuarioEnviouCalc.AsString := dtmControles.sqlAuxiliar.Fields[0].AsString;
  end;
  with dtmControles.sqlAuxiliar do
  begin
    Active := False;
    Sql.Clear;
    Sql.Add('SELECT LOGIN '+
            'FROM   G_USUARIO '+
            ' WHERE USUARIO_ID = :USUARIO_ID ');
    Params[0].AsCurrency := sqlChatUSUARIO_RECEBEU_ID.AsCurrency;
    Active := True;
    sqlChatUsuarioRecebeuCalc.AsString := dtmControles.sqlAuxiliar.Fields[0].AsString;
  end;
  dtmControles.sqlAuxiliar.Active := False;
end;

procedure TfrmLogChat.btnImprimirLogClick(Sender: TObject);
var
  vSql: string;
  vSqlComplemento: string;
begin
  Screen.Cursor := crSQLWait;

  with dtmControles.sqlAuxiliar do
  begin
    Active := False;
    Sql.Clear;
    Sql.Add('SELECT COUNT(*) '+
            'FROM   G_USUARIO '+
            ' WHERE SITUACAO = '+QuotedStr('A'));
    Active := True;
    vpQtdeUsuarioAtivo := dtmControles.sqlAuxiliar.Fields[0].AsInteger;
  end;

  vSqlComplemento := '';
  vSql := ' SELECT DISTINCT USUARIO_ENVIOU_ID, DATA FROM G_CHAT ';

  if Trim(edtDataIni.Text) <> '' then
  begin
    if Trim(edtDataFim.Text) = '' then
      edtDataFim.Text := edtDataIni.Text;
    vSqlComplemento := ' WHERE DATA '+
                       Controles.MontarSqlData(StrToDate(edtDataIni.Text),StrToDate(edtDataFim.Text));
  end;

  if lcxFuncionarioEnviou.Text <> '' then
  begin
    if Trim(vSqlComplemento) = '' then
      vSqlComplemento := vSqlComplemento + ' WHERE USUARIO_ENVIOU_ID = '+ IntToStr(lcxFuncionarioEnviou.EditValue)
    else
      vSqlComplemento := vSqlComplemento + ' AND USUARIO_ENVIOU_ID = '+ IntToStr(lcxFuncionarioEnviou.EditValue);
  end;

  if lcxFuncionarioRecebeu.Text <> '' then
  begin
    if Trim(vSqlComplemento) = '' then
      vSqlComplemento := vSqlComplemento + ' WHERE USUARIO_RECEBEU_ID = '+ IntToStr(lcxFuncionarioRecebeu.EditValue)
    else
      vSqlComplemento := vSqlComplemento + ' AND USUARIO_RECEBEU_ID = '+ IntToStr(lcxFuncionarioRecebeu.EditValue);
  end;

  with sqlChatImprimir do
  begin
    Active := False;
    SQL.Text := vSql + vSqlComplemento + ' ORDER BY DATA ';
    Active := True;
  end;
  Screen.Cursor := crDefault;

  sqlChatImprimir.DisableControls;
  ExibirRelatorio(dtmControles.frxRelatorio ,vpRelatorioChat, ParametrosRelatorio);
  sqlChatImprimir.EnableControls;
  Screen.Cursor := crDefault;
  dtmControles.sqlAuxiliar.Active := False;  
end;

procedure TfrmLogChat.ParametrosRelatorio;
begin
  with dtmControles do
  begin
    frxRelatorio.Variables.Variables['vgNomeCartorio'] := QuotedStr(dtmControles.BuscarConfig('PRINCIPAL', 'CARTORIO', 'NOME', 'S'));
    frxRelatorio.Variables.Variables['vgLogin'] := QuotedStr(vgLogin);
    frxRelatorio.Variables.Variables['vgDataIni'] := QuotedStr(edtDataIni.Text);
    frxRelatorio.Variables.Variables['vgDataFim'] := QuotedStr(edtDataFim.Text);
    frxRelatorio.Variables.Variables['vgQtdeRegistro'] := QuotedStr(IntToStr(vQuantidadeRegistro));
  end;
end;

procedure TfrmLogChat.sqlChatImprimirCalcFields(DataSet: TDataSet);
var
  vWptChat : TWPRichText;
  vUsuRecebeu: integer;
begin
  with dtmControles.sqlAuxiliar do
  begin
    Active := False;
    Sql.Clear;
    Sql.Add('SELECT MENSAGEM_BLOB FROM G_CHAT '+
            ' WHERE DATA = '+ QuotedStr(FormatDateTime('DD.MM.YYYY hh:mm:ss',sqlChatImprimirDATA.AsDateTime))+
            ' AND USUARIO_ENVIOU_ID = :USUARIO_ENVIOU_ID ');
    Params[0].AsCurrency := sqlChatImprimirUSUARIO_ENVIOU_ID.AsCurrency;
    Active := True;
  end;
  vWptChat := TWPRichText.Create(Application);  //Chat
  vWptChat.Clear;
  vWptChat.AsString := DeCompressString(dtmControles.sqlAuxiliar.Fields[0].AsAnsiString);
  sqlChatImprimirMensagemCalc.AsString := Copy(vWptChat.Text,1,2000);
  vWptChat.Free;

  with dtmControles.sqlAuxiliar do
  begin
    Active := False;
    Sql.Clear;
    Sql.Add('SELECT COUNT(*) FROM G_CHAT '+
            ' WHERE DATA = '+ QuotedStr(FormatDateTime('DD.MM.YYYY hh:mm:ss',sqlChatImprimirDATA.AsDateTime))+
            ' AND USUARIO_ENVIOU_ID = :USUARIO_ENVIOU_ID ');
    Params[0].AsCurrency := sqlChatImprimirUSUARIO_ENVIOU_ID.AsCurrency;
    Active := True;
  end;

  if dtmControles.sqlAuxiliar.Fields[0].AsCurrency = vpQtdeUsuarioAtivo then
    sqlChatImprimirUsuarioRecebeuCalc.AsString := 'TODOS'
  else if dtmControles.sqlAuxiliar.Fields[0].AsCurrency > 1 then
    sqlChatImprimirUsuarioRecebeuCalc.AsString := 'VÁRIOS'
  else
  begin
    with dtmControles.sqlAuxiliar do
    begin
      Active := False;
      Sql.Clear;
      Sql.Add('SELECT USUARIO_RECEBEU_ID FROM G_CHAT '+
            ' WHERE DATA = '+ QuotedStr(FormatDateTime('DD.MM.YYYY hh:mm:ss',sqlChatImprimirDATA.AsDateTime))+
            ' AND USUARIO_ENVIOU_ID = :USUARIO_ENVIOU_ID ');
      Params[0].AsCurrency := sqlChatImprimirUSUARIO_ENVIOU_ID.AsCurrency;
      Active := True;
    end;
    vUsuRecebeu := dtmControles.sqlAuxiliar.Fields[0].AsInteger;
    with dtmControles.sqlAuxiliar do
    begin
      Active := False;
      Sql.Clear;
      Sql.Add('SELECT LOGIN '+
              'FROM   G_USUARIO '+
              ' WHERE USUARIO_ID = :USUARIO_ID ');
      Params[0].AsCurrency := vUsuRecebeu;
      Active := True;
      sqlChatImprimirUsuarioRecebeuCalc.AsString := dtmControles.sqlAuxiliar.Fields[0].AsString;
    end;
  end;

  with dtmControles.sqlAuxiliar do
  begin
    Active := False;
    Sql.Clear;
    Sql.Add('SELECT LOGIN '+
            'FROM   G_USUARIO '+
            ' WHERE USUARIO_ID = :USUARIO_ID ');
    Params[0].AsCurrency := sqlChatImprimirUSUARIO_ENVIOU_ID.AsCurrency;
    Active := True;
    sqlChatImprimirUsuarioEnviouCalc.AsString := dtmControles.sqlAuxiliar.Fields[0].AsString;
  end;
  dtmControles.sqlAuxiliar.Active := False;  
end;

end.

