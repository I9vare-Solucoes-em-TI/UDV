unit ValidarPermissaoUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadAuxiliar, FMTBcd, DB, DBClient,
  Provider, SqlExpr, StdCtrls, cxButtons, ExtCtrls, cxControls,
  cxContainer, cxEdit, cxTextEdit, Menus, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinMcSkin, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinsDefaultPainters, System.UITypes,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  I9Query, dxGDIPlusClasses, frxClass;

type
  TfrmValidarPermissaoUsuario = class(TfrmCadAuxiliar)
    Label1: TLabel;
    Label2: TLabel;
    edtUsuario: TcxTextEdit;
    edtSenha: TcxTextEdit;
    btnConfirmar: TcxButton;
    imgDigitalBiometrica2: TImage;
    imgDigitalBiometrica1: TImage;
    imgDigitalCertificado2: TImage;
    imgDigitalCertificado1: TImage;
    TimerBiometria: TTimer;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure edtUsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TimerBiometriaTimer(Sender: TObject);
    procedure imgDigitalBiometrica1Click(Sender: TObject);
    procedure imgDigitalCertificado1Click(Sender: TObject);
  private
    vlImage1Frente,
    vgTrocarSenha,
    vlAtivarBiometria,
    vlAtivarCertificado : Boolean;
    vlUsarBiometria,
    vlUsarCertificado : String;
    FSistemaID: Integer;
    function VerificarSolicitacaoDigital: Integer;
    function VerificarSolicitacaoCertificado: Integer;
    function AutenticarPKI: Integer;
  public
    { Public declarations }
  end;

var
  frmValidarPermissaoUsuario: TfrmValidarPermissaoUsuario;
  vlRetorno, vlRotina, vlUsuarioPermissao, vlUsuarioIdLiberacao : String;
  vlOperacao : Integer;

  function LiberarPermissaoUsuario(
    vpRotina: String;
    const vpOperacao: Integer = 6;
    const vpSistemaID: Integer = 0): String; overload;

  function LiberarPermissaoUsuario(
    vpRotina: String;
    out vpUsuarioIdLiberacao: string;
    const vpOperacao: Integer = 6;
    const vpSistemaID: Integer = 0): String; overload;

implementation

uses
  Controles,
  Rotinas,
  LoginAlteracao,
  RotinasFingkey,
  System.Math,
  System.Types,
  Geral.Model.Entity.Spec.PKI,
  Geral.Model.Entity.Spec.Maybe,
  Geral.Controller.Factory.Entity.PKI,
  MensagemUtils,
  Geral.Model.Business.Spec.UsuarioPKI,
  Geral.Controller.Factory.Business.UsuarioPKI;

{$R *.dfm}
{$WARN SYMBOL_PLATFORM OFF}

function LiberarPermissaoUsuario(
  vpRotina : String;
  const vpOperacao : Integer = 6;
  const vpSistemaID: Integer = 0): String; overload;
begin
  vlRetorno := '';
  vlRotina  := vpRotina;
  vlOperacao := vpOperacao;

  if frmValidarPermissaoUsuario = nil then
     Application.CreateForm(TfrmValidarPermissaoUsuario, frmValidarPermissaoUsuario);

  frmValidarPermissaoUsuario.FSistemaID := IfThen(
    CompareValue(
      vpSistemaID,
      ZeroValue) = GreaterThanValue,
    vpSistemaID,
    vgId);

  frmValidarPermissaoUsuario.ShowModal;

  if vlRetorno = '' then
    vlRetorno := '000000';

  Result := Trim(vlRetorno);

  frmValidarPermissaoUsuario.Free;
  frmValidarPermissaoUsuario := nil;
end;

function LiberarPermissaoUsuario(
  vpRotina: String;
  out vpUsuarioIdLiberacao: string;
  const vpOperacao: Integer = 6;
  const vpSistemaID: Integer = 0): String; overload;
begin
  vlRetorno := '';
  vlRotina  := vpRotina;
  if frmValidarPermissaoUsuario = nil then
     Application.CreateForm(TfrmValidarPermissaoUsuario, frmValidarPermissaoUsuario);

  frmValidarPermissaoUsuario.FSistemaID := IfThen(
    CompareValue(
      vpSistemaID,
      ZeroValue) = GreaterThanValue,
    vpSistemaID,
    vgId);

  frmValidarPermissaoUsuario.ShowModal;

  if vlRetorno = '' then
    vlRetorno := '000000';

  vpUsuarioIdLiberacao := vlUsuarioIdLiberacao;
  Result := Trim(vlRetorno);

  frmValidarPermissaoUsuario.Free;
  frmValidarPermissaoUsuario := nil;
end;

procedure TfrmValidarPermissaoUsuario.btnConfirmarClick(Sender: TObject);
var Sql,
    LoginAnterior,
    Login,
    Senha,
    DataExpiracao : string;
    Lista : TStringList;
    viSenhaAdmin : String;
    viUsuarioId: Integer;
begin
  inherited;
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

  if DebugHook <> 0 then
    if (edtUsuario.Text = '') and (edtSenha.Text = '') then
    begin
      edtSenha.Text := viSenhaAdmin;
      edtUsuario.Text := dtmControles.LoginAdmin;
    end;

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

  LoginAnterior := vgLogin;

  if dtmControles.IsLoginAdmin(
    edtUsuario.Text) and (edtSenha.Text = viSenhaAdmin) then
    vgLogin := dtmControles.LoginAdmin
  else
  begin
    Login := edtUsuario.Text;
    Sql   := 'SELECT U.USUARIO_ID, U.NOME_COMPLETO, U.SENHA, U.TROCARSENHA, U.DATA_EXPIRACAO, U.SENHA_ANTERIOR FROM G_USUARIO U ' +
             'LEFT JOIN G_USUARIO_SISTEMA US ON ' +
             '     U.USUARIO_ID = US.USUARIO_ID ' +
             'WHERE U.SITUACAO = ''A'' ' +
             '  AND U.LOGIN = ' + QuotedStr(Login) + ' AND US.SISTEMA_ID = ' + FSistemaID.ToString;

    Lista := dtmControles.GetFields(Sql);
    try
      if Trim(Lista.Values['USUARIO_ID']) = '' then
      begin
        Application.MessageBox(Pchar('Login não cadastrado!'), 'Aviso', MB_OK + MB_ICONEXCLAMATION);
        edtSenha.Text := '';
        edtUsuario.SetFocus;
        edtUsuario.SelectAll;
        exit;
      end;

      Senha := dtmControles.Cripto.CriptoHexToText(Lista.Values['SENHA']);

      if Senha = Trim(edtSenha.Text) then
        vgLogin := Login
      else
      begin
        Application.MessageBox('Usuário ou Senha invalidos!', 'Atenção', MB_OK + MB_ICONWARNING);
        edtUsuario.SetFocus;
        Exit;
      end;

      DataExpiracao   := Lista.Values['DATA_EXPIRACAO'];
      if Lista.Values['TROCARSENHA'] = 'S' then
      begin
        vgTrocarSenha := True;
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
    finally
      FreeAndNil(Lista);
    end;
  end;

  vlRetorno := dtmControles.CodPermissao(
    vlRotina,
    FSistemaID);

  vlUsuarioPermissao   := vgLogin;
  vlUsuarioIdLiberacao := dtmControles.GetStr(' SELECT USUARIO_ID FROM G_USUARIO WHERE LOGIN = '+QuotedStr(vgLogin));
  vgLogin              := LoginAnterior;

  if vlRetorno[vlOperacao] = '0' then
  begin
    Application.MessageBox('Usuário não tem permissão de acessar esta rotina!', 'Atenção', MB_OK + MB_ICONWARNING);
    Abort;
  end
  else Application.MessageBox('Liberação Aceita!!!', 'Informação', MB_OK + MB_ICONINFORMATION);

  ModalResult := mrOk;
end;

procedure TfrmValidarPermissaoUsuario.edtUsuarioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key = 13) and (trim(edtUsuario.Text) = '') then
  begin
    edtUsuario.Clear;
    edtSenha.Clear;
    vlAtivarBiometria := True;
    btnConfirmarClick(Self);
  end;
end;

function TfrmValidarPermissaoUsuario.AutenticarPKI: Integer;
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

procedure TfrmValidarPermissaoUsuario.btnCancelarClick(Sender: TObject);
begin
  vlRetorno := '000000';

  ModalResult := mrCancel;
  inherited;

end;

procedure TfrmValidarPermissaoUsuario.FormShow(Sender: TObject);
begin
  inherited;
  edtUsuario.SetFocus;
end;

procedure TfrmValidarPermissaoUsuario.imgDigitalBiometrica1Click(
  Sender: TObject);
begin
  inherited;
  edtUsuario.Clear;
  edtSenha.Clear;
  vlAtivarBiometria := True;
  btnConfirmarClick(self);
end;

procedure TfrmValidarPermissaoUsuario.imgDigitalCertificado1Click(
  Sender: TObject);
begin
  inherited;
  edtUsuario.Clear;
  edtSenha.Clear;
  vlAtivarCertificado := True;
  btnConfirmarClick(self);
end;

procedure TfrmValidarPermissaoUsuario.TimerBiometriaTimer(Sender: TObject);
begin
  inherited;
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

function TfrmValidarPermissaoUsuario.VerificarSolicitacaoCertificado: Integer;
begin
  Result := 0;
  vgUsuarioPKI := EmptyStr;

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

function TfrmValidarPermissaoUsuario.VerificarSolicitacaoDigital: Integer;
begin
  vlVetBiometria.NomeTabela   := 'G_BIOMETRIA_USUARIO';
  vlVetBiometria.NomeIdTabela := 'BIOMETRIA_USUARIO_ID';
  vlVetBiometria.Chave_id     := 0;
  CarregarBaseBiometria(False);

  repeat
    Result := CapturarDigital('V', true, 'Permissão de Acesso');
    vlVetBiometria.idDigitalScannear := 0;
    if Result = 0 then
    begin
      if MessageDlg('Digital não encontrada. Repetir Operação?', mtConfirmation, [mbYes, mbNo],0) = mrNo then
      begin
        edtUsuario.SetFocus;
        vlAtivarBiometria := False;
        abort
      end;
    end;
  until Result > 0;
end;

procedure TfrmValidarPermissaoUsuario.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  case Key of
    #27 : begin
            Key := #0;
            if Application.MessageBox('Deseja fechar este formulário?', 'Atenção', MB_YESNO + MB_ICONQUESTION) = IDYES then
               Close;
          end;
    #13 : begin
            Key := #0;
            PostMessage (Handle, WM_NEXTDLGCTL, 0, 0);
          end;
  end; {case}
end;

procedure TfrmValidarPermissaoUsuario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmValidarPermissaoUsuario := nil;
end;

procedure TfrmValidarPermissaoUsuario.FormCreate(Sender: TObject);
begin
  inherited;
  vlAtivarBiometria   := False;
  vlAtivarCertificado := False;
  vlUsarBiometria     := dtmControles.BuscarConfig('PRINCIPAL','GERAL','USAR_BIOMETRIA','S');
  vlUsarCertificado   := dtmControles.BuscarConfig('PRINCIPAL','GERAL','USAR_CERTIFICADO','S');

  frmValidarPermissaoUsuario.Width := 270;

  imgDigitalBiometrica1.Visible  := False;
  imgDigitalBiometrica2.Visible  := False;
  imgDigitalCertificado1.Visible := False;
  imgDigitalCertificado2.Visible := False;
  TimerBiometria.Enabled         := False;

  if vlUsarBiometria = 'S' then
    if LocalizarHardwareFingKey(False) then
    begin
      frmValidarPermissaoUsuario.Width := 320;
      TimerBiometria.Enabled := True;
      imgDigitalBiometrica1.Visible := True;
      imgDigitalBiometrica2.Visible := True;
    end;

  if vlUsarCertificado = 'S' then
  begin
    frmValidarPermissaoUsuario.Width := 320;
    TimerBiometria.Enabled := True;
    imgDigitalCertificado1.Visible := True;
    imgDigitalCertificado2.Visible := True;
  end;
end;

end.
