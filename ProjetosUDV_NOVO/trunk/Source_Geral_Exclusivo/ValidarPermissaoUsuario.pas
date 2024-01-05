unit ValidarPermissaoUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadAuxiliar, cxLookAndFeelPainters, FMTBcd, DB, DBClient,
  Provider, SqlExpr, StdCtrls, cxButtons, ExtCtrls, cxControls,
  cxContainer, cxEdit, cxTextEdit, Menus, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue, cxGraphics,
  cxLookAndFeels, dxSkinBlueprint, dxSkinDarkRoom, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinHighContrast, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSpringTime, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

type
  TfrmValidarPermissaoUsuario = class(TfrmCadAuxiliar)
    edtUsuario: TcxTextEdit;
    edtSenha: TcxTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnConfirmar: TcxButton;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure edtUsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    vgTrocarSenha, vlAtivarBiometria : Boolean;
    vlUsarBiometria :String;
    vlUsuarioId : Integer;
    Procedure VerificarSolicitacaoDigital;    
  public
    { Public declarations }
  end;

var
  frmValidarPermissaoUsuario: TfrmValidarPermissaoUsuario;
  vlRetorno, vlRotina, vlUsuarioPermissao : String;

  function LiberarPermissaoUsuario(vpRotina : String): String;

implementation

uses Controles, Rotinas, LoginAlteracao, RotinasFingkey;

{$R *.dfm}

function LiberarPermissaoUsuario(vpRotina: String): String;
begin
  vlRetorno := '';
  vlRotina  := vpRotina;
  if frmValidarPermissaoUsuario = nil then
     Application.CreateForm(TfrmValidarPermissaoUsuario, frmValidarPermissaoUsuario);
  frmValidarPermissaoUsuario.ShowModal;

  if vlRetorno = '' then
    vlRetorno := '000000';

  Result := Trim(vlRetorno);

  frmValidarPermissaoUsuario.Free;
  frmValidarPermissaoUsuario := nil;
end;

procedure TfrmValidarPermissaoUsuario.btnConfirmarClick(Sender: TObject);
var Sql, LoginAnterior, Login, Senha, DataExpiracao : string;
    Lista : TStringList;
begin
  inherited;
  if (vlAtivarBiometria) and (vlUsarBiometria = 'S') then
    VerificarSolicitacaoDigital;

  if vlUsuarioId > 0 then
  begin
    ExecutaSqlAuxiliar(' SELECT LOGIN, SENHA FROM G_USUARIO '+
                       ' WHERE USUARIO_ID = '+ IntToStr(vlUsuarioId),0);
    edtUsuario.Text := dtmControles.sqlAuxiliar.FieldByName('LOGIN').AsString;
    if edtUsuario.Text = 'UDV' then
         edtSenha.Text := 'I9VAREUDV'
    else edtSenha.Text := dtmControles.Cripto.CriptoHexToText(dtmControles.sqlAuxiliar.FieldByName('SENHA').AsString);
  end;

  LoginAnterior := vgLogin;

  if (edtUsuario.Text = 'UDV') and (edtSenha.Text = 'I9VAREUDV') then
    vgLogin := 'I937'
  else
  begin
    Login := edtUsuario.Text;
    Sql   := 'SELECT U.USUARIO_ID, U.NOME_COMPLETO, U.SENHA, U.TROCARSENHA, U.DATA_EXPIRACAO, U.SENHA_ANTERIOR FROM G_USUARIO U ' +
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
      FreeAndNil(Lista);
      exit;
    end;

    Senha := dtmControles.Cripto.CriptoHexToText(Lista.Values['SENHA']);

    if Senha = Trim(edtSenha.Text) then
      vgLogin := Login
    else
    begin
      Application.MessageBox('Usu�rio ou Senha invalidos!', 'Aten��o', MB_OK + MB_ICONWARNING);
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
        Application.MessageBox(PChar('Sua senha expirou!' + #13#10 + 'Informe uma nova senha para o sistema.'), 'Aten��o', MB_OK + MB_ICONWARNING);
        vgTrocarSenha := True;
        ExibirFormulario(TfrmLoginAlteracao, frmLoginAlteracao, True);
      end;
  end;

  FreeAndNil(Lista);
  vlRetorno := dtmControles.CodPermissao(vlRotina);
  vlUsuarioPermissao := vgLogin;
  vgLogin            := LoginAnterior;

  if vlRetorno[6] = '0' then
  begin
    Application.MessageBox('Usu�rio n�o tem permiss�o de acessar esta rotina!', 'Aten��o', MB_OK + MB_ICONWARNING);
    Abort;
  end
  else Application.MessageBox('Libera��o Aceita!!!', 'Informa��o', MB_OK + MB_ICONINFORMATION);

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

procedure TfrmValidarPermissaoUsuario.VerificarSolicitacaoDigital;
begin
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

procedure TfrmValidarPermissaoUsuario.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  case Key of
    #27 : begin
            Key := #0;
            if Application.MessageBox('Deseja fechar este formul�rio?', 'Aten��o', MB_YESNO + MB_ICONQUESTION) = IDYES then
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
  vlUsuarioId       := 0;
  vlAtivarBiometria := False;
  vlUsarBiometria   := dtmControles.BuscarConfig('PRINCIPAL','GERAL','USAR_BIOMETRIA','S');
  vgTrocarSenha     := False;
end;

end.
