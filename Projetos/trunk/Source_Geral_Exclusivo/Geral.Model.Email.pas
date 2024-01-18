{* @hash       2b3a4f080d4b5e2a8e9e0d19eed146145d119703095919aaedf5e5e6a83c
 * @version    1.0.0.0
 * @unit       Geral.Model.Email.Simples.pas
 * @author     I9vare
 * @copyright  Copyright (c) 2013 I9vare Gestão e Soluções em TI. (https://www.i9vare.com)
 *}

unit Geral.Model.Email;

interface

uses
  Data.DB,
  System.SysUtils,
  System.StrUtils,
  System.IOUtils,
  System.Classes,
  I9Query,
  I9Connection,
  SHDocVw,
  Vcl.Forms,
  Geral.Model.Entity.Spec.List,
  Geral.Model.Entity.Spec.Email,
  System.Generics.Collections;

  type
  TEmailEnvio = class
  private
     FConnection: TI9Connection;
     FEmailConfigID : Integer;
     FEnvioEmail: IEnvioEmail;
     FEmailConfig: TDataSet;
     FWebBrowser: TWebBrowser;

     procedure EmailConfig;
     function WB_Get_HTML(const vpFileBody: string): string;
     function CabecalhoRadapePadrao(const vpCorpo: string): string;
     function GetEmailPadrao: string;
     function UsarTextoPadrao: Boolean;
     function GetTextoEmail: string;
     function GetTextoRodape: string;
     function GetTextoAssinatura: string;

     procedure GravarEmail(const vpEmailDestinatario: string;
       const vpAssunto: string;
       const vpStatus: string;
       const vpObservacao: string;
       const vpTabela: string;
       const vpCampoId: integer);
    function GetConfigEmailPadraoID: Integer;
  public
     function ExisteEmailConfigirador: Boolean;

     procedure EnviarEmail(
       const vpEmailDestinatario: string;
       const vpAssunto: string;
       const vpCorpo: string;
       const vpAnexo: IList<string>;
       const vpCorpoArquivoHtml: Boolean;
       const vpEmailCopia: string;
       const vpEmailCopiaOculta: string;
       const vpTabela: string;
       const vpCampoId: integer);overload;

     procedure EnviarEmail(
       const vpEmailDestinatario: string;
       const vpAssunto: string;
       const vpCorpo: string;
       const vpAnexo: string;
       const vpCorpoArquivoHtml: Boolean;
       const vpEmailCopia: string;
       const vpEmailCopiaOculta: string;
       const vpTabela: string;
       const vpCampoId: integer);overload;

     constructor Create(const vpEmailConfigID: Integer = 0); reintroduce;
     destructor Destroy; override;
  end;

implementation

uses
  Controles,
  Rotinas,
  Geral.Model.Entity.Impl.Email,
  Geral.Model.Entity.Impl.Email.Indy,
  Geral.Controller.Factory.Entity.Email,
  Geral.Model.Entity.Impl.IntervaloDatas,
  Geral.Model.Entity.Impl.Maybe,
  Geral.Model.Entity.Impl.Factory.List,
  Geral.Model.EmailGravar;


function TEmailEnvio.CabecalhoRadapePadrao(const vpCorpo: string): string;
var
  viTextoEmail,
  viRodapeEmail,
  viAssinaturaEmail: string;
  viStr: TStringList;
begin
  Result := vpCorpo;

  if not UsarTextoPadrao then
    Exit;

  viStr := nil;
  try
    viStr := TStringList.Create;
    viStr.Clear;

    viTextoEmail := GetTextoEmail;
    viRodapeEmail := GetTextoRodape;
    viAssinaturaEmail := GetTextoAssinatura;

    if not viTextoEmail.IsEmpty then
      viStr.Add(viTextoEmail);

    if not vpCorpo.IsEmpty then
      viStr.Add(vpCorpo);

    if not viRodapeEmail.IsEmpty then
      viStr.Add(viRodapeEmail);

    if not viAssinaturaEmail.IsEmpty then
      viStr.Add(viAssinaturaEmail);

    Result := viStr.Text;

  finally
    FreeAndNil(viStr);
  end;
end;

constructor TEmailEnvio.Create(const vpEmailConfigID: Integer = 0);
begin
  inherited Create;
  FConnection    := dtmControles.DB;

  if vpEmailConfigID > 0 then
    FEmailConfigID := vpEmailConfigID
  else
    FEmailConfigID := GetConfigEmailPadraoID;

  FEnvioEmail  := TEnvioEmailFactory.New(FEmailConfigID, FConnection).GetInstance;
  FEmailConfig := nil;

  FWebBrowser        := TWebBrowser.Create(nil);
  FWebBrowser.Visible:= False;
  FWebBrowser.Silent := true;

  EmailConfig;
end;

destructor TEmailEnvio.Destroy;
begin
  FreeAndNil(FEmailConfig);
  FreeAndNil(FWebBrowser);
  inherited;
end;

procedure TEmailEnvio.EmailConfig;
var
  viQuery: TI9Query;
begin
  viQuery := nil;
  try
    viQuery := TI9Query.Create(nil);
    viQuery.Connection := FConnection;
    FEmailConfig := viQuery;

    viQuery.SQL.Text := {$REGION 'SQL'}
      'SELECT ' +
      '  G_EC.EMAIL_CONFIG_ID, ' +
      '  G_EC.EMAIL_PADRAO, ' +
      '  G_EC.USER_NAME, '+
      '  G_EC.USAR_TEXTO_PADRAO, '+
      '  G_EC.TEXTO_EMAIL, '+
      '  G_EC.TEXTO_RODAPE, '+
      '  G_EC.ESPACO_TEXTO_RODAPE, '+
      '  G_EC.ADICIONAR_ASSINATURA_USUARIO '+
      'FROM ' +
      '  G_EMAIL_CONFIG G_EC ' +
      'WHERE ' +
      '  G_EC.EMAIL_CONFIG_ID = :P_EMAIL_CONFIG_ID';
    {$ENDREGION}

    viQuery.ParamByName('P_EMAIL_CONFIG_ID').AsInteger := FEmailConfigID;

    viQuery.Open;
  except
    FreeAndNil(FEmailConfig);
    raise;
  end;
end;

procedure TEmailEnvio.EnviarEmail(
  const vpEmailDestinatario, vpAssunto, vpCorpo,
  vpAnexo: string;
  const vpCorpoArquivoHtml: Boolean;
  const vpEmailCopia: string;
  const vpEmailCopiaOculta: string;
  const vpTabela: string;
  const vpCampoId: integer);
var
  viAnexo: IList<string>;
begin
  viAnexo := nil;

  if not vpAnexo.Trim.IsEmpty then
  begin
    viAnexo := TListFactory<string>.New.GetInstance;
    viAnexo.Add(vpAnexo);
  end;

  EnviarEmail(
    vpEmailDestinatario,
    vpAssunto,
    vpCorpo,
    viAnexo,
    vpCorpoArquivoHtml,
    vpEmailCopia,
    vpEmailCopiaOculta,
    vpTabela,
    vpCampoId);
end;

function TEmailEnvio.ExisteEmailConfigirador: Boolean;
begin
  Result := GetConfigEmailPadraoID > 0;
end;

procedure TEmailEnvio.EnviarEmail(
  const vpEmailDestinatario: string;
  const vpAssunto: string;
  const vpCorpo: string;
  const vpAnexo: IList<string>;
  const vpCorpoArquivoHtml: Boolean;
  const vpEmailCopia: string;
  const vpEmailCopiaOculta: string;
  const vpTabela: string;
  const vpCampoId: integer);
var
  viPara: IList<IEmailItem>;
  viDe: IEmailItem;
  viCorpo: string;
  viAnexo: IList<System.string>;
begin
  if vpCorpo.Trim.IsEmpty then
    raise Exception.Create('Corpo do e-mail não informado!');

  if vpCorpoArquivoHtml then
    viCorpo := WB_Get_HTML(vpCorpo)
  else
    viCorpo := CabecalhoRadapePadrao(vpCorpo);

  viDe := TEmailItem.New(
    'Nome da Unidade', { TODO : Colocar o nome da Unidade }
    GetEmailPadrao);

  viPara := TListFactory<IEmailItem>.New.GetInstance;

  viPara.Add(
    TEmailItem.New(
      string.Empty,
      vpEmailDestinatario));

  viAnexo := nil;
  if Assigned(vpAnexo) then
    viAnexo := TListFactory<string>.New.GetInstance.AddRange(vpAnexo.ToArray);

  try
    FEnvioEmail.Enviar(
      TEmail.New(
        nil,
        viDe,
        viPara,
        nil,
        nil,
        nil,
        vpAssunto,
        viCorpo,
        viAnexo,
        nil,
        True,
        vpEmailCopia,
        vpEmailCopiaOculta));
  except
    on E: Exception do
    begin
      GravarEmail(vpEmailDestinatario, vpAssunto, 'N', e.Message, vpTabela, vpCampoID);
      Exit;
    end;
  end;

  //GravarEmail(vpEmailDestinatario, vpAssunto, 'E', 'E-mail Enviado com Sucesso!!!', vpTabela, vpCampoID);
  { TODO : Verificar se vai usar essa estrutura de gravação nas tabelas de email }
end;

function TEmailEnvio.GetConfigEmailPadraoID: Integer;
var
  viQuery: TI9Query;
begin
  Result := 0;

  viQuery := TI9Query.Create(nil);
  try
    viQuery.Connection := FConnection;

    {$REGION 'Retorna E-mail Padrão do Sistema'}
    viQuery.SQL.Text := 'SELECT FIRST 1 EMAIL_CONFIG_ID '+
                        'FROM G_EMAIL_CONFIG '+
                        'WHERE SISTEMA_ID = :P_SISTEMA_ID ';
    viQuery.ParamByName('P_SISTEMA_ID').AsInteger := vgId;
    viQuery.Open;

    Result := viQuery.FieldByName('EMAIL_CONFIG_ID').AsInteger;

    viQuery.Close;
    {$ENDREGION}

    if Result > 0 then
      Exit;

    {$REGION 'Retorna E-mail Padrão Geral'}
    viQuery.SQL.Text := 'SELECT FIRST 1 EMAIL_CONFIG_ID '+
                        'FROM G_EMAIL_CONFIG '+
                        'WHERE PADRAO = ''S'' ';
    viQuery.Open;

    Result := viQuery.FieldByName('EMAIL_CONFIG_ID').AsInteger;

    viQuery.Close;
    {$ENDREGION}

    if Result > 0 then
      Exit;

    {$REGION 'Retorna Primeiro Registro (Metodo Anterior)'}
    viQuery.SQL.Text := 'SELECT FIRST 1 EMAIL_CONFIG_ID '+
                        'FROM G_EMAIL_CONFIG ';
    viQuery.Open;

    Result := viQuery.FieldByName('EMAIL_CONFIG_ID').AsInteger;

    viQuery.Close;
    {$ENDREGION}

  finally
    FreeAndNil(viQuery);
  end;
end;

function TEmailEnvio.GetEmailPadrao: string;
begin
  Result := Trim(FEmailConfig.FieldByName(
      'EMAIL_PADRAO').AsString);

  if Result = '' then
    Result := Trim(FEmailConfig.FieldByName(
    'USER_NAME').AsString);
end;

function TEmailEnvio.GetTextoAssinatura: string;
var
  viLinhas: Integer;
begin
  Result := EmptyStr;

  if Trim(FEmailConfig.FieldByName(
    'ADICIONAR_ASSINATURA_USUARIO').AsString) <> 'S' then
    Exit;

  viLinhas := FEmailConfig.FieldByName(
    'ESPACO_TEXTO_RODAPE').AsInteger;

  Result := DupeString(sLineBreak, viLinhas);

  Result := Result +
            MaiusculoMinusculo(vgUsuarioNome) + sLineBreak +
            MaiusculoMinusculo(vgUsuarioFuncao);
end;

function TEmailEnvio.GetTextoEmail: string;
begin
  Result := Rotinas.DeCompressString(
    FEmailConfig.FieldByName('TEXTO_EMAIL').AsString);
end;

function TEmailEnvio.GetTextoRodape: string;
begin
  Result := Rotinas.DeCompressString(
    FEmailConfig.FieldByName('TEXTO_RODAPE').AsString);
end;

procedure TEmailEnvio.GravarEmail(const vpEmailDestinatario, vpAssunto,
  vpStatus, vpObservacao: string;
  const vpTabela: string;
  const vpCampoId: integer);
var
  viEmailGravar: TEmailGravar;
begin
  viEmailGravar := nil;

  try
    viEmailGravar := TEmailGravar.Create;
    viEmailGravar.EmailId := 0;
    viEmailGravar.DataEnvio := dtmControles.DataHoraBanco(3);
    viEmailGravar.UsuarioId := vgUsuarioID.ToInteger;
    viEmailGravar.Assunto   := vpAssunto;
    viEmailGravar.Para      := vpEmailDestinatario;
    viEmailGravar.IpMaquina := Rotinas.RetornaIP;
    viEmailGravar.SistemaId := vgId;
    viEmailGravar.Status    := vpStatus;
    viEmailGravar.Observacao:= Copy(vpObservacao, 1, 260);
    viEmailGravar.Tabela    := vpTabela;
    viEmailGravar.CampoId   := vpCampoId;

    TEmailGravarBusiness.Cadastrar(viEmailGravar);
  finally
    FreeAndNil(viEmailGravar);
  end;

end;

function TEmailEnvio.UsarTextoPadrao: Boolean;
begin
  Result := FEmailConfig.FieldByName('USAR_TEXTO_PADRAO').AsString = 'S';
end;

function TEmailEnvio.WB_Get_HTML(const vpFileBody: string): string;
begin
  //Result := TFile.ReadAllText(vpFileBody, TEncoding.UTF8);

  FWebBrowser.Navigate(vpFileBody);
  Application.ProcessMessages;
  try
    try
      Result := UTF8Encode(FWebBrowser.OleObject.Document.documentElement.innerHTML);
    finally
      FWebBrowser.Navigate('about:blank');
    end;
  except
    raise;
  end;
end;

end.
