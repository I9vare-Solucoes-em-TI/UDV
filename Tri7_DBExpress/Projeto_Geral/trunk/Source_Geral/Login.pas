unit Login;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Db, Provider, SqlExpr,
  jpeg, ExtCtrls, FMTBcd, cxButtons, cxControls,
  cxContainer, cxEdit, Menus, cxLabel, cxTextEdit, IniFiles, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, frxClass, System.UITypes, dxSkinsCore,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver;

type
  TfrmLogin = class(TForm)
    imgDigitalBiometrica1: TImage;
    TimerBiometria: TTimer;
    imgDigitalBiometrica2: TImage;
    imgAcesso: TImage;
    edtUsuario: TcxTextEdit;
    edtSenha: TcxTextEdit;
    btnConfirmar: TcxButton;
    btnCancelar: TcxButton;
    lblMensagem: TcxLabel;
    lblNomeSistema: TcxLabel;
    Shape1: TShape;
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtSenhaEnter(Sender: TObject);
    procedure edtSenhaExit(Sender: TObject);
    procedure imgDigitalBiometrica1Click(Sender: TObject);
    procedure edtUsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TimerBiometriaTimer(Sender: TObject);
    procedure lblLembrarSenhaClick(Sender: TObject);
  private
    vlTentativas : Integer; 
    Procedure VerificarSolicitacaoDigital;
    procedure MostrarMensagem;
  public
    { Public declarations }
    vgTrocarSenha, vgLogoff, vlAtivarBiometria : Boolean;
    vlUsuarioId : Integer;
    vlImage1Frente : Boolean;
    vlUsarBiometria, vlNivelSegurancaSenha : String;
  end;

var
  frmLogin: TfrmLogin;
  vgLoginNomeSistema : String;

implementation

{$WARN SYMBOL_PLATFORM OFF}

uses Controles, Principal, Rotinas, LoginAlteracao, RotinasFingkey, Math,
     Conexao, EurekaLog;

{$R *.DFM}

procedure TfrmLogin.FormActivate(Sender: TObject);
begin
  MostrarMensagem;

  if DebugHook <> 0 then
  begin
    edtUsuario.Text := dtmControles.LoginAdmin;
    edtSenha.Text := dtmControles.SenhaAdmin;
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
    ShowMessage('Esta tela n�o pode ser fechada com "ALT + F4"');
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
  vUltimoUsuarioLogado: string;
  Ini  : TIniFile;
begin
  edtUsuario.Clear;
  lblNomeSistema.Caption := vgLoginNomeSistema;

  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Config.ini');
  vUltimoUsuarioLogado := Ini.ReadString('Geral', 'UltimoUsuarioLogadoNOTAS', '');
  if Trim(vUltimoUsuarioLogado) <> '' then
    edtUsuario.Text := Trim(vUltimoUsuarioLogado);
  Ini.Free;

  vlAtivarBiometria := False;
  vlUsarBiometria       := dtmControles.BuscarConfig('PRINCIPAL','GERAL','USAR_BIOMETRIA','S');
  vlNivelSegurancaSenha := dtmControles.BuscarParametroOutroSistema('NIVEL_SENHA', 'SENHA','PRINCIPAL','5');
  imgDigitalBiometrica1.Visible := False;
  imgDigitalBiometrica2.Visible := False;

  if vlUsarBiometria = 'S' then
    if LocalizarHardwareFingKey(False) then
    begin
      TimerBiometria.Enabled := True;
      imgDigitalBiometrica1.Visible := True;
      imgDigitalBiometrica2.Visible := True;
    end
    else TimerBiometria.Enabled := False;

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
begin
  if vlAtivarBiometria then
    VerificarSolicitacaoDigital;

  viSenhaAdmin := dtmControles.SenhaAdmin;

  if vlUsuarioId > 0 then
  begin
    ExecutaSqlAuxiliar(' SELECT LOGIN, SENHA FROM G_USUARIO '+
                       ' WHERE USUARIO_ID = '+ IntToStr(vlUsuarioId),0);
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
    vgUsuarioID   := '123456';
    vgSenhaAtual := viSenhaAdmin;
    vgChamarLogin := False;
    vgUsarAvisarAgenda := dtmControles.BuscarConfig('AGENDA','GERAL','USAR_AVISAR_AGENDA','S');
    with dtmControles.sqlG_Agenda do
    begin
      Active := False;
      DataSet.Params[0].AsCurrency := StrToInt(vgUsuarioID);
      Active := True;
      dtmControles.timerAgendaTimer(Self);
    end;
    Sql   := 'SELECT USUARIO_ID, LOGIN FROM G_USUARIO WHERE USUARIO_ID = 123456 ';
    Lista := dtmControles.GetFields(Sql);
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

    vgAbrirChat := True;

    Close;
    Lista.Free;

    if DebugHook = 0 then
      ConfigurarEurekaLogEvents;

    if Controles.SolicitarOrdemServico then
      Controles.VerificarSequenciaOS;

    exit;
  end;

  if dtmControles.IsLoginAdmin(
    edtUsuario.Text) then
  begin
    Application.MessageBox(Pchar('Usu�rio ou Senha invalidos!'), 'Aviso', MB_OK + MB_ICONEXCLAMATION);
    exit;
  end;

  Login := edtUsuario.Text;
  Sql   := 'SELECT U.USUARIO_ID, U.NOME_COMPLETO, U.SENHA, U.TROCARSENHA, ' +
           'U.DATA_EXPIRACAO, U.SENHA_ANTERIOR, U.FUNCAO, U.SIGLA, ' +
           'US.EXIBIR_ALERTA_VERSAO FROM G_USUARIO U ' +
           'LEFT JOIN G_USUARIO_SISTEMA US ON ' +
           '     U.USUARIO_ID = US.USUARIO_ID ' +
           'WHERE U.SITUACAO = ''A'' ' +
           '  AND U.LOGIN = ' + QuotedStr(Login) + ' AND US.SISTEMA_ID = ' + IntToStr(vgId);
  Lista := dtmControles.GetFields(Sql);
  if Trim(Lista.Values['USUARIO_ID']) = '' then
  begin
    Application.MessageBox(Pchar('Login n�o cadastrado!'), 'Aviso', MB_OK + MB_ICONEXCLAMATION);
    edtSenha.Text := '';
    edtUsuario.SetFocus;
    edtUsuario.SelectAll;
    Lista.Free;
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
    DataExpiracao   := Lista.Values['DATA_EXPIRACAO'];

    dtmControles.tmrAlertaVersao.Enabled := Lista.
      Values['EXIBIR_ALERTA_VERSAO'].Equals('S');

    vgUsarAvisarAgenda := dtmControles.BuscarConfig('AGENDA','GERAL','USAR_AVISAR_AGENDA','S');
    with dtmControles.sqlG_Agenda do
    begin
      Active := False;
      DataSet.Params[0].AsCurrency := StrToInt(vgUsuarioID);
      Active := True;
      dtmControles.timerAgendaTimer(Self);
    end;

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
        Application.MessageBox(PChar('Sua senha expirou!' + #13#10 + 'Informe uma nova senha para o sistema.'), 'Aten��o', MB_OK + MB_ICONWARNING);
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
      Application.MessageBox('Usu�rio ou Senha inv�lidos!', 'Aten��o', MB_OK + MB_ICONWARNING);
      edtUsuario.SetFocus;
    end
    else
    begin
      Application.MessageBox(Pchar('N�mero de tentativas excedido!' + #13#10 + 'Por medida de seguran�a o sistema ser� fechado!'), 'Aten��o', MB_OK + MB_ICONWARNING);
      btnCancelarClick(nil);
    end;
  end;

  //Gravar ultimo usuario logado no ini
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Config.ini');
  try
    vUltimoUsuarioLogado := Trim(edtUsuario.Text);
    Ini.WriteString('Geral', 'UltimoUsuarioLogadoNOTAS', vUltimoUsuarioLogado);
  finally
    Ini.Free;
  end;

  if DebugHook = 0 then
    ConfigurarEurekaLogEvents;

  Lista.Free;
  dtmControles.sqlAuxiliar.Active := False;
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
    ShowMessage('Digite o Usu�rio e Senha para entrar na aplica��o!');
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

procedure TfrmLogin.edtSenhaEnter(Sender: TObject);
begin
  btnConfirmar.Default := True;
end;

procedure TfrmLogin.edtSenhaExit(Sender: TObject);
begin
  btnConfirmar.Default := False;
end;

Procedure TfrmLogin.VerificarSolicitacaoDigital;
begin
  if (not imgDigitalBiometrica1.Visible) or (not vgChamarLogin) then
  begin
    vlUsuarioId := 0;
    exit;
  end;

  vlVetBiometria.NomeTabela   := 'G_BIOMETRIA_USUARIO';
  vlVetBiometria.NomeIdTabela := 'BIOMETRIA_USUARIO_ID';
  vlVetBiometria.Chave_id     := 0;
  CarregarBaseBiometria(False);

  repeat
    vlUsuarioId := CapturarDigital('V', true, 'Permiss�o de Acesso');
    vlVetBiometria.idDigitalScannear := 0;
    if vlUsuarioId = 0 then
    begin
      if MessageDlg('Digital n�o encontrada. Repetir Opera��o?', mtConfirmation, [mbYes, mbNo],0) = mrNo then
      begin
        edtUsuario.SetFocus;
        vlAtivarBiometria := False;         
        abort
      end;
    end;
  until vlUsuarioId > 0;
end;

procedure TfrmLogin.imgDigitalBiometrica1Click(Sender: TObject);
begin
  edtUsuario.Clear;
  edtSenha.Clear;
  vgChamarLogin     := True;
  vlAtivarBiometria := True;
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
    Application.MessageBox('Usu�rio n�o encontrado. Verifique se o nome do usu�rio esta correto!!!', 'Aviso', MB_OK + MB_ICONEXCLAMATION);
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
    Application.MessageBox(PChar('Sua Senha � '+viSenha), 'Resposta Correta!!!', MB_OK + MB_ICONINFORMATION);
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
       imgDigitalBiometrica1.BringToFront
  else imgDigitalBiometrica2.BringToFront;
end;

end.
