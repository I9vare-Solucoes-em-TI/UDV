unit Orientacoes;

interface

uses
  I9Query,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, cxButtons, ExtCtrls, DB, cxDBData, WPCTRMemo,
  WPCTRRich, cxSplitter, cxGridLevel, cxGridDBTableView, cxGrid, SimpleDS,
  cxControls,
  cxEdit, cxCalendar,
  DBClient, WPRTEDefs, cxGridCustomTableView, cxGridTableView, cxClasses,
  cxGridCustomView, cxPC, cxContainer,
  cxDBEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLabel, Vcl.Buttons,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, FrameEditorSimples,
  cxGroupBox, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, DbxDevartInterBase;

type
  TfrmOrientacoes = class(TForm)
    sqlOrientacoes: TI9Query;
    dtsOrientacoes: TDataSource;
    pagOrientacoes: TcxPageControl;
    tbsCadastro: TcxTabSheet;
    tbsOrientacoes: TcxTabSheet;
    gridOrientacao: TcxGrid;
    gridPesquisaPessoas: TcxGridDBTableView;
    gridPesquisaPessoasUSUARIO_ENVIOU_ID: TcxGridDBColumn;
    gridPesquisaPessoasDATA: TcxGridDBColumn;
    gridPesquisaPessoasMENSAGEM: TcxGridDBColumn;
    cxGridLevel4: TcxGridLevel;
    spl1: TcxSplitter;
    edtMensagemOrientacao: TWPRichText;
    sqlOrientacao: TI9Query;
    dtsOrientacao: TDataSource;
    sqlOrientacaoORIENTACAO_ID: TBCDField;
    sqlOrientacaoUSUARIO_ENVIOU_ID: TBCDField;
    sqlOrientacaoMENSAGEM: TBlobField;
    sqlOrientacaoDATA_CADASTRO: TSQLTimeStampField;
    sqlOrientacaoDATA_ORIENTACAO: TSQLTimeStampField;
    sqlOrientacaoSITUACAO: TStringField;
    sqlOrientacaoTITULO: TStringField;
    pnlCadastro: TPanel;
    pnlTitulo: TPanel;
    cxLabel9: TcxLabel;
    edtDataOrientacao: TcxDBDateEdit;
    cxLabel1: TcxLabel;
    edtDescricao: TcxDBTextEdit;
    pnlDados: TPanel;
    pnlUsuariosEnviar: TPanel;
    Panel13: TPanel;
    Label3: TLabel;
    lcxUsuarioSistema: TcxLookupComboBox;
    chbTodos: TCheckBox;
    btnAdcionarPara: TcxButton;
    Panel38: TPanel;
    Panel39: TPanel;
    lstPara: TListBox;
    lstParaCodigo: TListBox;
    btnExcluirUsuario: TcxButton;
    sqlOrientacoesORIENTACAO_USUARIO_ID: TBCDField;
    sqlOrientacoesUSUARIO_ID: TBCDField;
    sqlOrientacoesRECEBIDO: TStringField;
    sqlOrientacoesORIENTACAO_ID: TBCDField;
    sqlOrientacoesUSUARIO_ENVIOU_ID: TBCDField;
    sqlOrientacoesMENSAGEM: TBlobField;
    sqlOrientacoesDATA_CADASTRO: TSQLTimeStampField;
    sqlOrientacoesDATA_ORIENTACAO: TSQLTimeStampField;
    sqlOrientacoesSITUACAO: TStringField;
    sqlOrientacoesTITULO: TStringField;
    fmeEditorSimples: TfmeEditorSimples;
    Panel1: TPanel;
    pnlBotoesItemPedido: TPanel;
    btnExcluir: TcxButton;
    btnGravar: TcxButton;
    btnCancelar: TcxButton;
    btnIncluir: TcxButton;
    btnAlterar: TcxButton;
    Panel2: TPanel;
    Panel3: TPanel;
    PanelBotaoFechar: TPanel;
    cxBtnFechar: TcxButton;
    Panel4: TPanel;
    pnlBotoes: TPanel;
    Panel5: TPanel;
    imgPagar: TImage;
    lblInformacaoCertidao: TcxLabel;
    cxGroupBox1: TcxGroupBox;
    edtPesquisa: TEdit;
    cxLabel2: TcxLabel;
    btnPesquisar: TcxButton;
    btnLimpar: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sqlOrientacoesAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure pagOrientacoesChange(Sender: TObject);
    procedure sqlOrientacaoAfterScroll(DataSet: TDataSet);
    procedure btnAdcionarParaClick(Sender: TObject);
    procedure btnExcluirUsuarioClick(Sender: TObject);
    procedure sqlOrientacaoAfterInsert(DataSet: TDataSet);
    procedure cxBtnFecharClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
  private
    { Private declarations }
    vpPermissao_ExcluirMensagem, vpPermissao_GravarMensagem: string;
    procedure AtualizarBotoes(vTipoOperacao: string);
  public
    { Public declarations }
  end;

var
  frmOrientacoes: TfrmOrientacoes;

implementation

uses Controles, Rotinas;

{$R *.dfm}
{$WARN IMPLICIT_STRING_CAST OFF}
{$WARN IMPLICIT_STRING_CAST_LOSS OFF}

procedure TfrmOrientacoes.cxBtnFecharClick(Sender: TObject);
begin
  sqlOrientacao.Close;

  Close;
end;

procedure TfrmOrientacoes.btnAdcionarParaClick(Sender: TObject);
begin
  if lcxUsuarioSistema.EditValue <> Null then
  begin
    if Pos(FormatFloat('00000000',lcxUsuarioSistema.EditValue),lstParaCodigo.Items.Text) = 0 then
    begin
      lstPara.Items.Add(lcxUsuarioSistema.EditText);
      lstParaCodigo.Items.Add(FormatFloat('00000000',lcxUsuarioSistema.EditValue));
      lcxUsuarioSistema.Clear;
    end;
  end;
end;

procedure TfrmOrientacoes.btnAlterarClick(Sender: TObject);
begin
  sqlOrientacao.Edit;

  pnlCadastro.Enabled := True;
  AtualizarBotoes('A');
end;

procedure TfrmOrientacoes.btnCancelarClick(Sender: TObject);
begin
  sqlOrientacao.Cancel;

  pnlCadastro.Enabled := False;
  AtualizarBotoes('C');
end;

procedure TfrmOrientacoes.btnExcluirClick(Sender: TObject);
begin
  vpPermissao_ExcluirMensagem := dtmControles.CodPermissao('ESP_EXCLUIR_MENSAGEM');
  VerificarPermissao(vpPermissao_ExcluirMensagem[6]);

  if
    Application.MessageBox(
      'Esta Orientação será excluída de todos os usuários. Deseja realmente continuar??',
      'Pergunta',
      MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION
    ) = IDNO
  then
    Exit;

  sqlOrientacao.Edit;
  sqlOrientacaoSITUACAO.AsString := 'I';
  sqlOrientacao.ApplyUpdates(-1);

  sqlOrientacoes.Refresh;
  pagOrientacoes.ActivePage := tbsOrientacoes;
  gridOrientacao.SetFocus;

  pnlCadastro.Enabled := False;
end;

procedure TfrmOrientacoes.btnExcluirUsuarioClick(Sender: TObject);
var
  vIndice: Integer;
begin
  if lstPara.Items.Count > 0 then
  begin
    vIndice := lstPara.ItemIndex;
    lstPara.Items.Delete(vIndice);
    lstParaCodigo.Items.Delete(vIndice);
  end;
end;

procedure TfrmOrientacoes.btnGravarClick(Sender: TObject);
var
  i: Integer;

  procedure InserirUsuarioOrientacao(vUsuarioReceber: string);
  begin
    with dtmControles.sqlAuxiliar do
    begin
      Active := False;
      SQL.Clear;

      SQL.Add('INSERT INTO G_ORIENTACAO_USUARIO (');
      SQL.Add('  ORIENTACAO_USUARIO_ID,');
      SQL.Add('  ORIENTACAO_ID,');
      SQL.Add('  USUARIO_ID');
      SQL.Add(') VALUES (');
      SQL.Add('  :ORIENTACAO_USUARIO_ID,');
      SQL.Add('  :ORIENTACAO_ID,');
      SQL.Add('  :USUARIO_ID');
      SQL.Add(')');

      Params[0].AsString := dtmControles.GerarSequencia('G_ORIENTACAO_USUARIO');
      Params[1].AsString := sqlOrientacaoORIENTACAO_ID.AsString;
      Params[2].AsString := vUsuarioReceber;

      ExecSQL;
    end;
  end;

begin
  if chbTodos.Checked then
  begin
    if
      Application.MessageBox(
        'Deseja realmente enviar a mensagem para Todos?',
        'Pergunta',
        MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION
      ) = IDNO
    then
      Exit;
  end;

  if (trim(edtDescricao.Text) = '') then
  begin
    Application.MessageBox('O preenchimento do Título é obrigatório!', 'Atenção', mb_Ok + MB_ICONEXCLAMATION);
    edtDescricao.SetFocus;
    Exit;
  end;

  if (trim(edtDataOrientacao.Text) = '') then
  begin
    Application.MessageBox('O preenchimento da data é obrigatório!', 'Atenção', mb_Ok + MB_ICONEXCLAMATION);
    edtDataOrientacao.SetFocus;
    Exit;
  end;

  if
    (not chbTodos.Checked) and
    (lstPara.Items.Count = 0) and
    (Trim(lcxUsuarioSistema.EditText) = '')
  then
  begin
    Application.MessageBox('É necessário selecionar pelo menos um usuário para enviar a orientação!', 'Atenção', mb_Ok + MB_ICONEXCLAMATION);
    lcxUsuarioSistema.SetFocus;
    Exit;
  end;

  if sqlOrientacao.State = dsEdit then
  begin
    with dtmControles.sqlAuxiliar do
    begin
      Active := False;
      SQL.Clear;

      SQL.Add('DELETE FROM G_ORIENTACAO_USUARIO');
      SQL.Add('WHERE ORIENTACAO_ID = ' + sqlOrientacaoORIENTACAO_ID.AsString);
      ExecSQL;
    end;
  end;

  sqlOrientacaoMENSAGEM.AsAnsiString := CompressString(fmeEditorSimples.wptTexto.AsString);
  sqlOrientacao.ApplyUpdates(-1);

  if not chbTodos.Checked then
  begin
    if lstPara.Items.Count > 0 then
    begin
      for i := 0 to lstPara.Items.Count - 1 do
        InserirUsuarioOrientacao(lstParaCodigo.Items.Strings[i]);
    end
    else
    begin
      if Trim(lcxUsuarioSistema.EditText) = '' then
        Exit;

      InserirUsuarioOrientacao(CurrToStr(lcxUsuarioSistema.EditValue));
    end;

    if lstParaCodigo.Items.IndexOf(vgUsuarioID) = -1 then
      InserirUsuarioOrientacao(vgUsuarioID);
  end
  else
  begin
    with dtmControles.SimpleAuxiliar do
    begin
      Active := False;
      SQL.Text := 'SELECT USUARIO_ID FROM G_USUARIO '+
                             ' WHERE SITUACAO = '+QuotedStr('A');
      Active := True;
      First;
    end;

    while not dtmControles.SimpleAuxiliar.Eof do
    begin
      InserirUsuarioOrientacao(dtmControles.SimpleAuxiliar.Fields[0].AsString);
      dtmControles.SimpleAuxiliar.Next;
    end;

    dtmControles.SimpleAuxiliar.Active := False;
  end;

  lstPara.Clear;
  pnlCadastro.Enabled := False;
  AtualizarBotoes('G');

  sqlOrientacoes.Refresh;
  pagOrientacoes.ActivePage := tbsOrientacoes;
  gridOrientacao.SetFocus;
end;

procedure TfrmOrientacoes.btnIncluirClick(Sender: TObject);
begin
  sqlOrientacao.Active := False;
  sqlOrientacao.Params[0].AsInteger := 0;
  sqlOrientacao.Active := True;
  sqlOrientacao.Insert;

  lstPara.Clear;

  pnlCadastro.Enabled := True;
  AtualizarBotoes('I');
  edtDescricao.SetFocus;
end;

procedure TfrmOrientacoes.btnLimparClick(Sender: TObject);
begin
  edtPesquisa.Clear;
  btnPesquisarClick(Self);
  edtPesquisa.SetFocus;
end;

procedure TfrmOrientacoes.btnPesquisarClick(Sender: TObject);
var
  vStringPesquisa: string;
  vOrientacoesARetornar: string;
  vStringList: TStringList;

  function FindTexto(const stringPesquisa: String; Var Texto: TWPRichText): boolean;
  var
    Posicao: Integer;
    vString: string;
  begin
    vString := Texto.Text;
    Posicao := Pos(AnsiLowerCase(stringPesquisa),AnsiLowerCase(vString));
    if Posicao > 0 then
      FindTexto := True
    else
      FindTexto := False;
  end;
begin
  Screen.Cursor := crHourGlass;

  vStringList := TStringList.Create;
  vStringPesquisa := Trim(edtPesquisa.Text);
  vOrientacoesARetornar := '';

  if vStringPesquisa <> '' then
  begin
    sqlOrientacoes.Filtered := False;
    sqlOrientacoes.Filter   := ' UPPER(TITULO) LIKE '+QuotedStr('%'+vStringPesquisa+'%');
    sqlOrientacoes.Filtered := True;
    sqlOrientacoes.First;
  end
  else
  begin
    sqlOrientacoes.Filtered := False;
    sqlOrientacoes.First;
  end;

  while not sqlOrientacoes.Eof do
  begin
    if vStringList.IndexOf(sqlOrientacoesORIENTACAO_ID.AsString) = -1 then
    begin
      vStringList.Add(sqlOrientacoesORIENTACAO_ID.AsString);
      vOrientacoesARetornar := vOrientacoesARetornar + sqlOrientacoesORIENTACAO_ID.AsString + ', ';
    end;
    sqlOrientacoes.Next;
  end;

  sqlOrientacoes.Filtered := False;
  sqlOrientacoes.First;

  while not sqlOrientacoes.Eof do
  begin
    edtMensagemOrientacao.AsString := DeCompressString(sqlOrientacoesMENSAGEM.AsAnsiString);
    if FindTexto(vStringPesquisa, edtMensagemOrientacao) = True then
    begin
      if vStringList.IndexOf(sqlOrientacoesORIENTACAO_ID.AsString) = -1 then
      begin
        vStringList.Add(sqlOrientacoesORIENTACAO_ID.AsString);
        vOrientacoesARetornar := vOrientacoesARetornar + sqlOrientacoesORIENTACAO_ID.AsString + ', ';
      end;
    end;
    sqlOrientacoes.Next;
  end;

  vOrientacoesARetornar := Copy(vOrientacoesARetornar, 0, Length(vOrientacoesARetornar) - 2);
  if Trim(vOrientacoesARetornar) = '' then
  begin
    sqlOrientacoes.Filtered := False;
    Application.MessageBox('Não foi possível localizar Orientação com a pesquisa feita!', 'Aviso', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
  end
  else
  begin
    with sqlOrientacoes do
    begin
      Filtered := False;
      Filter := ' ORIENTACAO_ID IN ('+vOrientacoesARetornar+')';
      Filtered := True;
      First;
    end;
  end;

  gridPesquisaPessoas.DataController.DataSource := dtsOrientacoes;
  FreeAndNil(vStringList);
  Screen.Cursor := crDefault;
end;

procedure TfrmOrientacoes.FormActivate(Sender: TObject);
begin
  if sqlOrientacoes.Active then
    sqlOrientacoes.Refresh; //Atualiza Mensagens gravadas
  edtPesquisa.SetFocus;
end;

procedure TfrmOrientacoes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action         := caFree;
  frmOrientacoes := nil;
end;

procedure TfrmOrientacoes.FormCreate(Sender: TObject);
begin
  sqlOrientacao.Connection  := dtmControles.DB;
  sqlOrientacoes.Connection := dtmControles.DB;

  vpPermissao_GravarMensagem := dtmControles.CodPermissao('ESP_GRAVAR_MENSAGEM');
  tbsCadastro.TabVisible := vpPermissao_GravarMensagem[6] = '1';

  with sqlOrientacoes do
  begin
    Active := False;
    SQL.Text :=
      ' SELECT ' +
      '   USU.ORIENTACAO_USUARIO_ID, ' +
      '   USU.USUARIO_ID, ' +
      '   USU.RECEBIDO, ' +
      '   ORI.ORIENTACAO_ID, ' +
      '   ORI.USUARIO_ENVIOU_ID, ' +
      '   ORI.MENSAGEM, ' +
      '   ORI.DATA_CADASTRO, ' +
      '   ORI.DATA_ORIENTACAO, ' +
      '   ORI.SITUACAO, ' +
      '   ORI.TITULO ' +

      ' FROM G_ORIENTACAO_USUARIO USU ' +

      ' LEFT JOIN G_ORIENTACAO ORI ' +
      ' ON USU.ORIENTACAO_ID = ORI.ORIENTACAO_ID ' +

      ' WHERE USU.USUARIO_ID = ' + vgUsuarioID +
      ' AND ORI.SITUACAO = ''A'' ' +

      ' ORDER BY ORI.DATA_ORIENTACAO DESC ';

    Active := True;
  end;

  pagOrientacoes.ActivePage := tbsOrientacoes;
end;

procedure TfrmOrientacoes.pagOrientacoesChange(Sender: TObject);
begin
  if pagOrientacoes.ActivePage = tbsCadastro then
  begin
    sqlOrientacao.Active := False;
    sqlOrientacao.Params[0].AsInteger := sqlOrientacoesORIENTACAO_ID.AsInteger;
    sqlOrientacao.Active := True;

    with dtmControles.SimpleAuxiliar do
    begin
      Active := False;
      SQL.Text :=
        ' SELECT USUARIO_ID ' +
        ' FROM G_ORIENTACAO_USUARIO ' +
        ' WHERE ORIENTACAO_ID = ' + IntToStr(sqlOrientacoesORIENTACAO_ID.AsInteger);
      Active := True;
      First;

      while not Eof do
      begin
        lcxUsuarioSistema.EditValue := Fields[0].AsInteger;
        btnAdcionarParaClick(Sender);
        Next;
      end;
    end;

    pnlTitulo.Enabled := False;
    pnlDados.Enabled := False;
  end
  else if pagOrientacoes.ActivePage = tbsOrientacoes then
    edtMensagemOrientacao.AsString := DeCompressString(sqlOrientacoesMENSAGEM.AsAnsiString);
end;

procedure TfrmOrientacoes.sqlOrientacaoAfterInsert(DataSet: TDataSet);
begin
  sqlOrientacaoORIENTACAO_ID.AsCurrency := dtmControles.GerarSequencia('G_ORIENTACAO');
  sqlOrientacaoSITUACAO.AsString := 'A';
  sqlOrientacaoUSUARIO_ENVIOU_ID.AsString := vgUsuarioID;
  sqlOrientacaoDATA_CADASTRO.AsDateTime := dtmControles.DataHoraBanco(3);
  sqlOrientacaoDATA_ORIENTACAO.AsDateTime := dtmControles.DataHoraBanco(3);
end;

procedure TfrmOrientacoes.sqlOrientacaoAfterScroll(DataSet: TDataSet);
begin
  fmeEditorSimples.wptTexto.AsString := DeCompressString(sqlOrientacaoMENSAGEM.AsAnsiString);
end;

procedure TfrmOrientacoes.sqlOrientacoesAfterScroll(DataSet: TDataSet);
begin
  edtMensagemOrientacao.AsString := DeCompressString(sqlOrientacoesMENSAGEM.AsAnsiString);
end;

procedure TfrmOrientacoes.AtualizarBotoes(vTipoOperacao: string);
begin
  if (vTipoOperacao = 'I') or (vTipoOperacao = 'A') then
  begin
    btnIncluir.Enabled     := False;
    btnAlterar.Enabled     := False;
    btnGravar.Enabled      := True;
    btnCancelar.Enabled    := True;
    btnExcluir.Enabled     := False;
    pnlTitulo.Enabled      := True;
    pnlDados.Enabled       := True;
    tbsOrientacoes.Enabled := False;
    cxBtnFechar.Enabled    := False;
  end
  else if (vTipoOperacao = 'G') or (vTipoOperacao = 'C') then
  begin
    btnIncluir.Enabled     := True;
    btnAlterar.Enabled     := True;
    btnGravar.Enabled      := False;
    btnCancelar.Enabled    := False;
    btnExcluir.Enabled     := True;
    pnlTitulo.Enabled      := True;
    pnlDados.Enabled       := False;
    tbsOrientacoes.Enabled := True;
    cxBtnFechar.Enabled    := True;
  end;
end;

end.
