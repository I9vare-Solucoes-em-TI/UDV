unit Orientacao;

interface

uses
  Windows, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  CadAuxiliar, cxContainer, cxEdit, DB, SimpleDS, cxDBEdit, StdCtrls, Buttons,
  cxMaskEdit, cxDBLookupComboBox, FrameEditorSimples, ExtCtrls, cxLabel, SqlExpr,
  cxButtons, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, FMTBcd,
  cxControls, cxDropDownEdit, cxCalendar, cxTextEdit, cxLookupEdit, cxDBLookupEdit,
  dxGDIPlusClasses, DBClient, Provider, DbxDevartInterBase;

type
  TfrmOrientacao = class(TfrmCadAuxiliar)
    Panel2: TPanel;
    Bevel4: TBevel;
    lblInformacao: TcxLabel;
    Panel4: TPanel;
    imgEditar: TImage;
    imgNova: TImage;
    Panel3: TPanel;
    pnlNovo: TPanel;
    btnConfirmar: TcxButton;
    Panel6: TPanel;
    cxLabel9: TcxLabel;
    edtDescricao: TcxDBTextEdit;
    cxButton1: TcxButton;
    sqlOrientacao: TSimpleDataSet;
    dtsOrientacao: TDataSource;
    Panel12: TPanel;
    Panel13: TPanel;
    Label3: TLabel;
    lcxUsuarioChat: TcxLookupComboBox;
    chbTodos: TCheckBox;
    btnAdcionarPara: TcxButton;
    Panel38: TPanel;
    Panel39: TPanel;
    sbnExcluirUsuarioChat: TSpeedButton;
    lstPara: TListBox;
    lstParaCodigo: TListBox;
    btnLimparHistorico: TcxButton;
    edtDataOrientacao: TcxDBDateEdit;
    cxLabel1: TcxLabel;
    btnFechar: TcxButton;
    fmeEditorSimples: TfmeEditorSimples;
    sqlOrientacaoORIENTACAO_ID: TFMTBCDField;
    sqlOrientacaoUSUARIO_RECEBEU_ID: TFMTBCDField;
    sqlOrientacaoRECEBEU: TStringField;
    sqlOrientacaoUSUARIO_ENVIOU_ID: TFMTBCDField;
    sqlOrientacaoMENSAGEM: TBlobField;
    sqlOrientacaoDATA_CADASTRO: TSQLTimeStampField;
    sqlOrientacaoDATA_ORIENTACAO: TSQLTimeStampField;
    sqlOrientacaoDATA_CANCELADO: TSQLTimeStampField;
    sqlOrientacaoID_CONTROLE: TFMTBCDField;
    sqlOrientacaoDATA_EXCLUIDO: TSQLTimeStampField;
    sqlOrientacaoTITULO: TStringField;
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sqlOrientacaoAfterScroll(DataSet: TDataSet);
    procedure sbnExcluirUsuarioChatClick(Sender: TObject);
    procedure chbTodosClick(Sender: TObject);
    procedure btnAdcionarParaClick(Sender: TObject);
    procedure btnLimparHistoricoClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    vgNovaOrientacao : Boolean;
    vgVisualizando: Boolean;
  end;

var
  frmOrientacao: TfrmOrientacao;

implementation

uses Rotinas, Controles;

{$R *.dfm}

procedure TfrmOrientacao.btnConfirmarClick(Sender: TObject);
var
  vCont, vCont2: integer;
  vIDControle: integer;
  procedure InserirOrientacao(vPara: string);
  begin
    with dtmControles.sqlAuxiliar do
    begin
      Active := False;
      Sql.Clear;
      Sql.Add('INSERT INTO R_ORIENTACAO(ORIENTACAO_ID, USUARIO_RECEBEU_ID, '+
              '                   USUARIO_ENVIOU_ID, MENSAGEM, DATA_CADASTRO, '+
              '                   DATA_ORIENTACAO, TITULO, ID_CONTROLE)'+
              '            VALUES(:ORIENTACAO_ID, :USUARIO_RECEBEU_ID, '+
              '                   :USUARIO_ENVIOU_ID, :MENSAGEM, :DATA_CADASTRO,  '+
              '                   :DATA_ORIENTACAO, :TITULO, :ID_CONTROLE)');
      Params[0].AsCurrency := dtmControles.GetInt('SELECT GEN_ID(CHAT_SEQ,1) FROM RDB$DATABASE');
      Params[1].AsString := vPara;
      Params[2].AsString := vgUsuarioID;
      Params[3].AsMemo := CompressString(fmeEditorSimples.wptTexto.AsString);
      Params[4].AsString := dtmControles.DataHoraBanco(5);
      Params[5].AsString := FormatDateTime('DD.MM.YYYY hh:mm:ss', edtDataOrientacao.Date);
      Params[6].AsString := edtDescricao.Text;
      Params[7].AsCurrency := vIDControle;
      ExecSql(False);
    end;
  end;
begin
  if imgEditar.Visible then  //Se estiver em modo de edição, excluir antes
  begin
    with dtmControles.sqlAuxiliar do
    begin
      Active := False;
      Sql.Clear;
      Sql.Add('DELETE FROM R_ORIENTACAO WHERE ID_CONTROLE = '+sqlOrientacaoID_CONTROLE.AsString);
      ExecSql(False);
    end;
  end;

  if (trim(edtDescricao.Text) = '') then
  begin
    Application.MessageBox('Título não pode ser branco!!!', 'Atenção', mb_Ok + MB_ICONEXCLAMATION);
    edtDescricao.SetFocus;
    exit;
  end;

  if (trim(edtDataOrientacao.Text) = '') then
  begin
    Application.MessageBox('A data não pode ser vazia!!!', 'Atenção', mb_Ok + MB_ICONEXCLAMATION);
    edtDescricao.SetFocus;
    exit;
  end;

  if chbTodos.Checked = False then
  begin
    vCont := lstPara.Items.Count;
    if vCont > 0 then
    begin
      vCont2 := 0;
      vIDControle := dtmControles.GetInt('SELECT GEN_ID(CONTROLE_SEQ,1) FROM RDB$DATABASE');
      while vCont2 <> vCont do
      begin
        InserirOrientacao(lstParaCodigo.Items.Strings[vCont2]);
        vCont2 := vCont2 + 1;
      end;
    end
    else
    begin
      if Trim(lcxUsuarioChat.EditText) = '' then
        Exit;
      vIDControle := dtmControles.GetInt('SELECT GEN_ID(CONTROLE_SEQ,1) FROM RDB$DATABASE');
      InserirOrientacao(CurrToStr(lcxUsuarioChat.EditValue));
    end;
  end
  else
  begin
    if Application.MessageBox('Tem certeza que deseja enviar a mensagem para Todos?', 'Pergunta', MB_YESNO +
      MB_DEFBUTTON2 + MB_ICONQUESTION) = IDYES then
    begin
      with dtmControles.SimpleAuxiliar do
      begin
        Active := False;
        DataSet.CommandText := 'SELECT USUARIO_ID FROM G_USUARIO '+
                               ' WHERE SITUACAO = '+QuotedStr('A');
        Active := True;
        First;
      end;
      vIDControle := dtmControles.GetInt('SELECT GEN_ID(CONTROLE_SEQ,1) FROM RDB$DATABASE');
      while not dtmControles.SimpleAuxiliar.Eof do
      begin
        InserirOrientacao(dtmControles.SimpleAuxiliar.Fields[0].AsString);
        dtmControles.SimpleAuxiliar.Next;
      end;
    end;
  end;
  dtmControles.SimpleAuxiliar.Active := False;  
  Close;
end;

procedure TfrmOrientacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmOrientacao := nil;
end;

procedure TfrmOrientacao.FormShow(Sender: TObject);
begin
  inherited;
  if edtDescricao.Text <> '' then
    fmeEditorSimples.wptTexto.SetFocus;

  imgEditar.Visible := sqlOrientacaoORIENTACAO_ID.AsInteger > 0;
  imgNova.Visible   := sqlOrientacaoORIENTACAO_ID.AsInteger = 0;

  lstPara.Clear;
  lstParaCodigo.Clear;

  if (imgEditar.Visible) and (not vgVisualizando) then
  begin
    lblInformacao.Caption := ' Alterando Orientação ';
    with dtmControles.SimpleAuxiliar do
    begin
      Active := False;
      DataSet.CommandText := 'SELECT O.USUARIO_RECEBEU_ID, U.LOGIN '+
                             ' FROM R_ORIENTACAO O, G_USUARIO U '+
                             ' WHERE O.USUARIO_RECEBEU_ID = U.USUARIO_ID '+
                             ' AND ID_CONTROLE = '+sqlOrientacaoID_CONTROLE.AsString;
      Active := True;
      First;
    end;
    while not dtmControles.SimpleAuxiliar.Eof do
    begin
      lstPara.Items.Add(dtmControles.SimpleAuxiliar.FieldByName('LOGIN').AsString);
      lstParaCodigo.Items.Add(FormatFloat('00000000',dtmControles.SimpleAuxiliar.FieldByName('USUARIO_RECEBEU_ID').AsCurrency));
      dtmControles.SimpleAuxiliar.Next;
    end;
  end;
  dtmControles.SimpleAuxiliar.Active := False;  
end;

procedure TfrmOrientacao.sqlOrientacaoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  fmeEditorSimples.wptTexto.AsString := DeCompressString(sqlOrientacaoMENSAGEM.AsAnsiString);
end;

procedure TfrmOrientacao.sbnExcluirUsuarioChatClick(Sender: TObject);
var
  vIndice: integer;
begin
  if lstPara.Items.Count > 0 then
  begin
    vIndice := lstPara.ItemIndex;
    lstPara.Items.Delete(vIndice);
    lstParaCodigo.Items.Delete(vIndice);
  end;
end;

procedure TfrmOrientacao.chbTodosClick(Sender: TObject);
begin
  if chbTodos.Checked then
  begin
    lcxUsuarioChat.Enabled := False;
    lcxUsuarioChat.Clear;
    lstPara.Clear;
    lstParaCodigo.Clear;
  end
  else
    lcxUsuarioChat.Enabled := True;
end;

procedure TfrmOrientacao.btnAdcionarParaClick(Sender: TObject);
begin
  if lcxUsuarioChat.EditValue <> Null then
  begin
    if Pos(FormatFloat('00000000',lcxUsuarioChat.EditValue),lstParaCodigo.Items.Text) = 0 then
    begin
      lstPara.Items.Add(lcxUsuarioChat.EditText);
      lstParaCodigo.Items.Add(FormatFloat('00000000',lcxUsuarioChat.EditValue));
    end;
  end;
end;

procedure TfrmOrientacao.btnLimparHistoricoClick(Sender: TObject);
begin
  if chbTodos.Checked then
  begin
    lcxUsuarioChat.Enabled := True;
    chbTodos.Checked := False;
  end;
  lcxUsuarioChat.Clear;
  lstPara.Clear;
  lstParaCodigo.Clear;
end;

procedure TfrmOrientacao.btnFecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmOrientacao.FormCreate(Sender: TObject);
begin
  inherited;
  vgVisualizando := False;
end;

end.
