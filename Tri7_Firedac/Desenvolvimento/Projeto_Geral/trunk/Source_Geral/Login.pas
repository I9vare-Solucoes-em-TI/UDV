unit Login;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  Buttons,
  Db,
  Provider,
  SqlExpr,
  jpeg,
  ExtCtrls,
  FMTBcd,
  cxButtons,
  cxControls,
  cxContainer,
  cxEdit,
  Menus,
  cxLabel,
  cxTextEdit,
  IniFiles,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  frxClass,
  System.UITypes,
  dxSkinsCore,
  dxSkinOffice2007Black,
  dxSkinOffice2007Blue,
  dxSkinOffice2007Green,
  dxSkinOffice2007Pink,
  dxSkinOffice2007Silver,
  FireDAC.Stan.Param,
  dxGDIPlusClasses,
  Vcl.ImgList,
  dxSkinCaramel,
  dxSkinCoffee,
  dxSkinGlassOceans,
  dxSkiniMaginary;

type
  TfrmLogin = class(TForm)
    TimerBiometria: TTimer;
    imgAcesso: TImage;
    edtUsuario: TcxTextEdit;
    edtSenha: TcxTextEdit;
    btnConfirmar: TImage;
    btnCancelar: TImage;
    lblMensagem: TcxLabel;
    imgDigitalBiometrica2: TImage;
    imgDigitalBiometrica1: TImage;
    ImgLogin: TcxImageList;
    imgDigitalCertificado1: TImage;
    imgDigitalCertificado2: TImage;
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure imgDigitalBiometrica1Click(Sender: TObject);
    procedure edtUsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TimerBiometriaTimer(Sender: TObject);
    procedure lblLembrarSenhaClick(Sender: TObject);
    procedure edtSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure imgDigitalCertificado1Click(Sender: TObject);
  private
    vlTentativas : Integer;

    function VerificarSolicitacaoDigital: Integer;
    function VerificarSolicitacaoCertificado: Integer;
    function AutenticarPKI: Integer;

    procedure MostrarMensagem;
  public
    { Public declarations }
    vgTrocarSenha, vgLogoff, vlAtivarBiometria, vlAtivarCertificado : Boolean;
    vlImage1Frente : Boolean;
    vlUsarBiometria,
    vlUsarCertificado,
    vlNivelSegurancaSenha : String;
  end;

var
  frmLogin: TfrmLogin;
  vgLoginNomeSistema : String;

implementation

{$WARN SYMBOL_PLATFORM OFF}

uses
  Controles,
  Principal,
  Rotinas,
  LoginAlteracao,
  RotinasFingkey,
  Math,
  Conexao,
  EurekaLog,
  Geral.Model.Entity.Spec.PKI,
  Geral.Model.Entity.Spec.Maybe,
  Geral.Controller.Factory.Entity.PKI,
  MensagemUtils,
  Geral.Model.Business.Spec.UsuarioPKI,
  Geral.Controller.Factory.Business.UsuarioPKI,
  I9Query;

{$R *.DFM}

procedure TfrmLogin.FormActivate(Sender: TObject);
begin
  MostrarMensagem;

  if DebugHook <> 0 then
  begin
    edtUsuario.Text := dtmControles.LoginAdmin;
    edtSenha.Text   := dtmControles.SenhaAdmin;
  end;

  if edtUsuario.Text = '' then
       edtUsuario.SetFocus
  else edtSenha.SetFocus;
end;

procedure TfrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssAlt]) and (Key = VK_F4) then
  begin
    Key := VK_Clear;
    ShowMessage('Esta tela não pode ser fechada com "ALT + F4"');
  end;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  vgControleLogin := False;
  frmPrincipal.FormActivate(self);

  Action    := caFree;
  frmLogin  := nil;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
var
  vUltimoUsuarioLogado : string;
  Ini                  : TIniFile;
begin
  edtUsuario.Clear;
//  lblNomeSistema.Caption := vgLoginNomeSistema;

  try
    //imgAcesso.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'Login_'+vgSistemaNome+'.jpg');

    if AnsiUpperCase(vgSistemaNome) = 'ADMINISTRATIVO' then
      ImgLogin.GetImage(0, imgAcesso.Picture.Bitmap)
    else if AnsiUpperCase(vgSistemaNome) = 'CAIXA' then
      ImgLogin.GetImage(1, imgAcesso.Picture.Bitmap)
    else if AnsiUpperCase(vgSistemaNome) = 'FINANCEIROTRI7' then
      ImgLogin.GetImage(2, imgAcesso.Picture.Bitmap)
    else if AnsiUpperCase(vgSistemaNome) = 'PROTESTO' then
      ImgLogin.GetImage(3, imgAcesso.Picture.Bitmap)
    else if AnsiUpperCase(vgSistemaNome) = 'REGISTROCIVIL' then
      ImgLogin.GetImage(4, imgAcesso.Picture.Bitmap)
    else if AnsiUpperCase(vgSistemaNome) = 'REGISTROIMOVEIS' then
      ImgLogin.GetImage(5, imgAcesso.Picture.Bitmap)
    else if AnsiUpperCase(vgSistemaNome) = 'RTDPJ' then
      ImgLogin.GetImage(6, imgAcesso.Picture.Bitmap)
    else if AnsiUpperCase(vgSistemaNome) = 'TABELIONATONOTAS' then
      ImgLogin.GetImage(7, imgAcesso.Picture.Bitmap)
    else if AnsiUpperCase(vgSistemaNome) = 'LIVRODIARIO' then
      ImgLogin.GetImage(8, imgAcesso.Picture.Bitmap);

  except
    ShowMessage('Imagem do Login não pode ser carregada!!!');
  end;

  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Config.ini');
  vUltimoUsuarioLogado := Ini.ReadString('Geral', 'UltimoUsuarioLogadoNOTAS', '');
  if Trim(vUltimoUsuarioLogado) <> '' then
    edtUsuario.Text := Trim(vUltimoUsuarioLogado);
  Ini.Free;

  vlAtivarBiometria   := False;
  vlAtivarCertificado := False;

  vlUsarBiometria       := dtmControles.BuscarConfig('PRINCIPAL','GERAL','USAR_BIOMETRIA','S');
  vlUsarCertificado     := dtmControles.BuscarConfig('PRINCIPAL','GERAL','USAR_CERTIFICADO','S');
  vlNivelSegurancaSenha := dtmControles.BuscarParametroOutroSistema('NIVEL_SENHA', 'SENHA','PRINCIPAL','5');

  imgDigitalBiometrica1.Visible := False;
  imgDigitalBiometrica2.Visible := False;
  imgDigitalCertificado1.Visible := False;
  imgDigitalCertificado2.Visible := False;
  TimerBiometria.Enabled := False;

  if vlUsarBiometria = 'S' then
    if LocalizarHardwareFingKey(False) then
    begin
      TimerBiometria.Enabled := True;
      imgDigitalBiometrica1.Visible := True;
      imgDigitalBiometrica2.Visible := True;
    end;

  if vlUsarCertificado = 'S' then
  begin
    TimerBiometria.Enabled := True;
    imgDigitalCertificado1.Visible := True;
    imgDigitalCertificado2.Visible := True;
  end;

  vgTrocarSenha := False;
  vgLogoff      := False;
  vlTentativas  := 0;

  if vlNivelSegurancaSenha = '3' then
    edtSenha.Properties.CharCase := ecNormal;
end;

procedure TfrmLogin.btnConfirmarClick(Sender: TObject);
var Sql, Login, Senha, DataExpiracao : string;
    Lista : TStringList;
    viSenhaAdmin : String;
    vUltimoUsuarioLogado: string;
    Ini  : TIniFile;
    viUsuarioId: Integer;
begin
  viUsuarioId := 0;

  try
    if vlAtivarBiometria then
      viUsuarioId := VerificarSolicitacaoDigital
    else
    if vlAtivarCertificado then
      viUsuarioId := VerificarSolicitacaoCertificado;
  finally
    vlAtivarBiometria   := False;
    vlAtivarCertificado := False;
  end;

  viSenhaAdmin := dtmControles.SenhaAdmin;

  if viUsuarioId > 0 then
  begin
    ExecutaSqlAuxiliar(' SELECT LOGIN, SENHA FROM G_USUARIO '+
                       ' WHERE USUARIO_ID = '+ IntToStr(viUsuarioId),0);
    edtUsuario.Text := dtmControles.sqlAuxiliar.FieldByName('LOGIN').AsString;

    if dtmControles.IsLoginAdmin(
      edtUsuario.Text) then
      edtSenha.Text := viSenhaAdmin
    else
      edtSenha.Text := dtmControles.Cripto.CriptoHexToText(
        dtmControles.sqlAuxiliar.FieldByName(
          'SENHA').AsString);

    dtmControles.sqlAuxiliar.Active := False;
  end;

  if dtmControles.IsLoginAdmin(
    edtUsuario.Text) and
    (edtSenha.Text = viSenhaAdmin) then
  begin
    vgLogin       := edtUsuario.Text;
    vgLoginSigla := 'TRI7';
    vgUsuarioNome := 'Administrador do Sistema';
    vgUsuarioFuncao := 'Administrador do Sistema';
    vgUsuarioAssina := 'S';
    vgUsuarioID   := '123456';
    vgSenhaAtual := viSenhaAdmin;
    vgChamarLogin := False;
    Sql   := 'SELECT USUARIO_ID, LOGIN FROM G_USUARIO WHERE USUARIO_ID = 123456 ';

    Lista := dtmControles.GetFields(Sql);
    try
      if Trim(Lista.Values['USUARIO_ID']) = '' then
      begin
        Sql := ' INSERT INTO G_USUARIO(USUARIO_ID, TROCARSENHA, LOGIN, SITUACAO) ' +
               '                VALUES(123456, '+QuotedStr('N')+','+ dtmControles.LoginAdmin.QuotedString +','+QuotedStr('A')+') ';
        dtmControles.ExecSQL(Sql);
      end
      else
      begin
        if not dtmControles.IsLoginAdmin(
          Lista.Values['LOGIN'].Trim) then
        begin
          Sql := ' UPDATE G_USUARIO SET LOGIN = ' + dtmControles.LoginAdmin.QuotedString +
                 ' WHERE USUARIO_ID = ' + vgUsuarioID;
          dtmControles.ExecSQL(Sql);
        end;
      end;
    finally
      FreeAndNil(Lista);
    end;

    vgAbrirChat := True;

    Close;
    ConfigurarEurekaLogEvents;

    if Controles.SolicitarOrdemServico then
      Controles.VerificarSequenciaOS;

    exit;
  end;

  if dtmControles.IsLoginAdmin(
    edtUsuario.Text) then
  begin
    Application.MessageBox(Pchar('Usuário ou Senha invalidos!'), 'Aviso', MB_OK + MB_ICONEXCLAMATION);
    exit;
  end;

  Login := edtUsuario.Text;
  Sql   := 'SELECT U.USUARIO_ID, U.NOME_COMPLETO, U.SENHA, U.TROCARSENHA, ' +
           'U.DATA_EXPIRACAO, U.SENHA_ANTERIOR, U.FUNCAO, U.ASSINA, U.SIGLA, U.SOMENTE_BIOMETRIA, ' +
           'U.SOMENTE_CERTIFICADO, US.EXIBIR_ALERTA_VERSAO FROM G_USUARIO U ' +
           'LEFT JOIN G_USUARIO_SISTEMA US ON ' +
           '     U.USUARIO_ID = US.USUARIO_ID ' +
           'WHERE U.SITUACAO = ''A'' ' +
           '  AND U.LOGIN = ' + QuotedStr(Login) + ' AND US.SISTEMA_ID = ' + IntToStr(vgId);

  Lista := dtmControles.GetFields(Sql);
  try
    if (vlUsarBiometria = 'S') and (Trim(Lista.Values['SOMENTE_BIOMETRIA']) = 'S') and (viUsuarioId = 0) then
    begin
      Application.MessageBox(Pchar('Usuário só tem permissão de logar com a biometria!'), 'Aviso', MB_OK + MB_ICONEXCLAMATION);
      edtSenha.Text := '';
      edtUsuario.SetFocus;
      edtUsuario.SelectAll;
      dtmControles.sqlAuxiliar.Active := False;
      exit;
    end;

    if (vlUsarCertificado = 'S') and (Trim(Lista.Values['SOMENTE_CERTIFICADO']) = 'S') and (viUsuarioId = 0) then
    begin
      Application.MessageBox(Pchar('Usuário só tem permissão de logar com o certificado!'), 'Aviso', MB_OK + MB_ICONEXCLAMATION);
      edtSenha.Text := '';
      edtUsuario.SetFocus;
      edtUsuario.SelectAll;
      dtmControles.sqlAuxiliar.Active := False;
      exit;
    end;

    if Trim(Lista.Values['USUARIO_ID']) = '' then
    begin
      Application.MessageBox(Pchar('Login não cadastrado!'), 'Aviso', MB_OK + MB_ICONEXCLAMATION);
      edtSenha.Text := '';
      edtUsuario.SetFocus;
      edtUsuario.SelectAll;
      dtmControles.sqlAuxiliar.Active := False;
      exit;
    end;

    Senha := dtmControles.Cripto.CriptoHexToText(Lista.Values['SENHA']);
    if ((Senha = Trim(edtSenha.Text)) and (trim(edtSenha.Text) <> '')) or ((trim(edtSenha.Text) = '') and (Lista.Values['TROCARSENHA'] = 'S')) then
    begin

      if not VerificarConexao(StrToInt(Lista.Values['USUARIO_ID']),vgId, vgSistemaNome, RetornaIP, GetMACAdress) then
        exit;

      vgUsuarioID     := Lista.Values['USUARIO_ID'];
      vgLogin         := edtUsuario.Text;
      vgLoginSigla    := Lista.Values['SIGLA'];
      vgSenhaAtual    := Senha;
      vgSenhaAnterior := dtmControles.Cripto.CriptoHexToText(Lista.Values['SENHA_ANTERIOR']);
      vgUsuarioNome   := Lista.Values['NOME_COMPLETO'];
      vgUsuarioFuncao := Lista.Values['FUNCAO'];
      vgUsuarioAssina := Lista.Values['ASSINA'];
      DataExpiracao   := Lista.Values['DATA_EXPIRACAO'];

      dtmControles.tmrAlertaVersao.Enabled := Lista.
        Values['EXIBIR_ALERTA_VERSAO'].Equals('S');

      Close;
      vgChamarLogin := False;
      vgAbrirChat := True;

      if Lista.Values['TROCARSENHA'] = 'S' then
      begin
        vgTrocarSenha   := True;
        vgControleLogin := True;
        ExibirFormulario(TfrmLoginAlteracao, frmLoginAlteracao, True);
      end
      else
      if Trim(DataExpiracao) <> '' then
        if StrToDate(DataExpiracao) < dtmControles.DataHoraBanco(3) then
        begin
          Application.MessageBox(PChar('Sua senha expirou!' + #13#10 + 'Informe uma nova senha para o sistema.'), 'Atenção', MB_OK + MB_ICONWARNING);
          vgTrocarSenha := True;
          ExibirFormulario(TfrmLoginAlteracao, frmLoginAlteracao, True);
        end;

      if Controles.SolicitarOrdemServico then
        Controles.VerificarSequenciaOS;
    end
    else
    begin
      Inc(vlTentativas);
      if vlTentativas < 3 then
      begin
        Application.MessageBox('Usuário ou Senha inválidos!', 'Atenção', MB_OK + MB_ICONWARNING);
        edtUsuario.SetFocus;
      end
      else
      begin
        Application.MessageBox(Pchar('Número de tentativas excedido!' + #13#10 + 'Por medida de segurança o sistema será fechado!'), 'Atenção', MB_OK + MB_ICONWARNING);
        btnCancelarClick(nil);
      end;
    end;
  finally
    FreeAndNil(Lista);
  end;

  //Gravar ultimo usuario logado no ini
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Config.ini');
  try
    vUltimoUsuarioLogado := Trim(edtUsuario.Text);
    Ini.WriteString('Geral', 'UltimoUsuarioLogadoNOTAS', vUltimoUsuarioLogado);
  finally
    Ini.Free;
  end;

  ConfigurarEurekaLogEvents;
  dtmControles.sqlAuxiliar.Active := False;
end;

function TfrmLogin.AutenticarPKI: Integer;
{$REGION 'Variáveis'}
var
  viSelecaoCertificadoDigital: ISelecaoCertificadoDigital;
  viX509Certificate: IMaybe<IX509Certificate>;  
  viUsuarioPKI_Business: IUsuarioPKI_Business;
  viUsuarioPKI_ID: Integer;
  viQuery: TI9Query;
  viUsuarioID: Integer;
  viLogin: string;
  viTexto: string;
  viAssinaturaTexto: IAssinaturaTexto;
{$ENDREGION}
begin
  Result := 0;

  viSelecaoCertificadoDigital := TSelecaoCertificadoDigitalFactory.New.GetInstance;
  viX509Certificate := viSelecaoCertificadoDigital.Selecionar;

  if not viX509Certificate.HasValue then
  begin
    TMensagemUtils.ExibirMensagemAtencao(
      'Por favor, selecione um certificado digital.');

    Exit;
  end;

  viUsuarioPKI_Business := TUsuarioPKI_BusinessFactory.New.GetInstance;
  try
    viUsuarioPKI_ID := viUsuarioPKI_Business.ValidarCadastro(
      viX509Certificate.Value);
  except
    on E: Exception do
    begin
      TMensagemUtils.ExibirMensagemAtencao(
        E.Message);

      Exit;
    end;
  end;

  viQuery := TI9Query.Create(
    nil);

  try
    viQuery.Connection := dtmControles.DB;

    viQuery.SQL.Text := {$REGION 'Comando SQL SELECT'}
      'SELECT ' +

      {$REGION 'Colunas'}
      'G_U.USUARIO_ID, ' +
      'G_U.LOGIN ' +
      {$ENDREGION}

      {$REGION 'Cláusula FROM'}
      'FROM ' +
      'G_USUARIO_PKI G_UP ' +
      {$ENDREGION}

      {$REGION 'Cláusula INNER JOIN'}
      'INNER JOIN ' +
      'G_USUARIO G_U ' +

      {$REGION 'Cláusula ON'}
      'ON ' +
      'G_U.USUARIO_ID = G_UP.USUARIO_ID ' +
      {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Cláusula WHERE e Parâmetros'}
      'WHERE ' +
      'G_UP.USUARIO_PKI_ID = :P_USUARIO_PKI_ID';
      {$ENDREGION}

    {$ENDREGION}

    {$REGION 'Preencher valores dos parâmetros'}
    viQuery.ParamByName(
      'P_USUARIO_PKI_ID').AsInteger := viUsuarioPKI_ID;
    {$ENDREGION}

    viQuery.Open;
    try
      viUsuarioID := viQuery.FieldByName(
        'USUARIO_ID').AsInteger;

      viLogin := viQuery.FieldByName(
        'LOGIN').AsString;
    finally
      viQuery.Close;
    end;
  finally
    viQuery.Free;
  end;

  viTexto := string.Format(
    'Autenticação PKI ID: %d, Login: %s',
    [viUsuarioID,
    viLogin]);

  viAssinaturaTexto := TAssinaturaTextoFactory.New.GetInstance;

  try
    viAssinaturaTexto.Assinar(
      viTexto,
      viX509Certificate.Value);
  except
    Exit;
  end;
  
  Result := viUsuarioPKI_ID;
end;

procedure TfrmLogin.btnCancelarClick(Sender: TObject);
begin
  vgChamarLogin := False;
  vgAbrirChat := False;
  Application.Terminate;
end;

procedure TfrmLogin.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
  function TeclaAtalho(const Key: integer): boolean;
  begin
    Result := GetKeyState(Key) and 128 > 0;
  end;
begin
  if (TeclaAtalho(VK_CONTROL)) or
    (TeclaAtalho(VK_MENU)) or
    (TeclaAtalho(VK_F1)) or
    (TeclaAtalho(VK_F2)) or
    (TeclaAtalho(VK_F3)) or
    (TeclaAtalho(VK_F4)) or
    (TeclaAtalho(VK_F5)) or
    (TeclaAtalho(VK_F6)) or
    (TeclaAtalho(VK_F7)) or
    (TeclaAtalho(VK_F8)) or
    (TeclaAtalho(VK_F9)) or
    (TeclaAtalho(VK_F10)) or
    (TeclaAtalho(VK_F11)) or
    (TeclaAtalho(VK_F12)) then
  begin
    ShowMessage('Digite o Usuário e Senha para entrar na aplicação!');
  end;
end;

procedure TfrmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #13 :
    begin
      Key := #0;
      PostMessage (Handle, WM_NEXTDLGCTL, 0, 0);
    end;
  end; {case}
end;

function TfrmLogin.VerificarSolicitacaoCertificado: Integer;
begin
  Result := 0;
  vgUsuarioPKI := EmptyStr;

  if (not imgDigitalCertificado1.Visible) or (not vgChamarLogin) then
    exit;

  Result := AutenticarPKI;

  if Result = 0 then
  begin
    abort;
    Application.MessageBox('Certificado não encontrado!', 'Atenção', MB_OK + MB_ICONINFORMATION);
    edtUsuario.SetFocus;
    vlAtivarCertificado := False;

  end
  else
  begin
    vgUsuarioPKI := Result.ToString;
    Result := dtmControles.GetInt(
      'SELECT USUARIO_ID FROM G_USUARIO_PKI WHERE USUARIO_PKI_ID = ' + vgUsuarioPKI);
  end;
end;

function TfrmLogin.VerificarSolicitacaoDigital: Integer;
begin
  if (not imgDigitalBiometrica1.Visible) or (not vgChamarLogin) then
  begin
    Result := 0;
    exit;
  end;

  vlVetBiometria.NomeTabela   := 'G_BIOMETRIA_USUARIO';
  vlVetBiometria.NomeIdTabela := 'BIOMETRIA_USUARIO_ID';
  vlVetBiometria.Chave_id     := 0;
  CarregarBaseBiometria(False);

  repeat
    Result := CapturarDigital('V', true, 'Permissão de Acesso');
    vlVetBiometria.idDigitalScannear := 0;
    if Result = 0 then
    begin
      if Application.MessageBox('Digital não encontrada. Repetir Operação?', 'Atenção', MB_YESNO + MB_ICONQUESTION) = idNo then
      begin
        edtUsuario.SetFocus;
        vlAtivarBiometria := False;
        abort
      end;
    end;
  until Result > 0;
end;

procedure TfrmLogin.imgDigitalBiometrica1Click(Sender: TObject);
begin
  edtUsuario.Clear;
  edtSenha.Clear;
  vgChamarLogin     := True;
  vlAtivarBiometria := True;
  btnConfirmarClick(self);
end;

procedure TfrmLogin.imgDigitalCertificado1Click(Sender: TObject);
begin
  edtUsuario.Clear;
  edtSenha.Clear;
  vgChamarLogin       := True;
  vlAtivarCertificado := True;
  btnConfirmarClick(self);
end;

procedure TfrmLogin.lblLembrarSenhaClick(Sender: TObject);
var
  viPergunta, viRespostaGravada, viRespostaInformada, viSenha : String;
begin
  ExecutaSqlAuxiliar(' SELECT U.LEMBRETE_PERGUNTA, U.LEMBRETE_RESPOSTA, U.SENHA '+
                     ' FROM G_USUARIO U '+  
                     '   LEFT JOIN G_USUARIO_SISTEMA US ON ' +
                     '   U.USUARIO_ID = US.USUARIO_ID ' +
                     ' WHERE U.SITUACAO = ''A'' ' +
                     '  AND U.LOGIN = ' + QuotedStr(edtUsuario.Text) + ' AND US.SISTEMA_ID = ' + IntToStr(vgId),0);
  if dtmControles.sqlAuxiliar.IsEmpty then
  begin
    dtmControles.sqlAuxiliar.Active := False;
    Application.MessageBox('Usuário não encontrado. Verifique se o nome do usuário esta correto!!!', 'Aviso', MB_OK + MB_ICONEXCLAMATION);
    edtUsuario.SetFocus;
    exit;
  end;

  viRespostaGravada := dtmControles.Cripto.CriptoHexToText(dtmControles.sqlAuxiliar.FieldByName('LEMBRETE_RESPOSTA').AsString);
  viPergunta        := dtmControles.Cripto.CriptoHexToText(dtmControles.sqlAuxiliar.FieldByName('LEMBRETE_PERGUNTA').AsString);
  viSenha           := dtmControles.Cripto.CriptoHexToText(dtmControles.sqlAuxiliar.FieldByName('SENHA').AsString);

  if not InputQuery(viPergunta, 'Resposta:', viRespostaInformada) then
  begin
    dtmControles.sqlAuxiliar.Active := False;
    exit;
  end;

  if AnsiLowerCase(viRespostaGravada) = AnsiLowerCase(viRespostaInformada) then
  begin
    Application.MessageBox(PChar('Sua Senha é '+viSenha), 'Resposta Correta!!!', MB_OK + MB_ICONINFORMATION);
    edtSenha.SetFocus;
  end
  else Application.MessageBox('Reposta Incorreta!!!', 'Aviso', MB_OK + MB_ICONEXCLAMATION);

  dtmControles.sqlAuxiliar.Active := False;
end;

procedure TfrmLogin.MostrarMensagem;
var
  INI : TiniFile;
begin
  INI 		                	:= TINIFile.Create(ExtractFilePath(Application.ExeName)+'VRS.ini'); //Caminho Arquivo Ini
  lblMensagem.Caption      	:= INI.ReadString('Biblia','PRIMEIRA_' + FormatDateTime('dd',Date),'') +#13+
                        	     INI.ReadString('Biblia','SEGUNDA_' +  FormatDateTime('dd',Date),'');
  INI.Free;
end;

procedure TfrmLogin.edtSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    btnConfirmarClick(self);
end;

procedure TfrmLogin.edtUsuarioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) and (imgDigitalBiometrica1.Visible) and (trim(edtUsuario.Text) = '') then
    imgDigitalBiometrica1Click(self);
end;

procedure TfrmLogin.TimerBiometriaTimer(Sender: TObject);
begin
  vlImage1Frente := not vlImage1Frente;

  if vlImage1Frente then
  begin
    if imgDigitalBiometrica1.Visible then
      imgDigitalBiometrica1.BringToFront;

    if imgDigitalCertificado1.Visible then
      imgDigitalCertificado1.BringToFront;
  end
  else
  begin
    if imgDigitalBiometrica2.Visible then
      imgDigitalBiometrica2.BringToFront;

    if imgDigitalCertificado2.Visible then
      imgDigitalCertificado2.BringToFront;
  end;
end;

end.
