{* @hash       2b3a4f080d4b5e2a8e9e0d19eed146145d119703095919aaedf5e5e6a83c
 * @version    1.0.0.0
 * @unit       Geral.Model.Entity.Impl.Email.Indy.pas
 * @author     I9vare
 * @copyright  Copyright (c) 2013 I9vare Gestão e Soluções em TI. (https://www.i9vare.com)
 *}

unit Geral.Model.Entity.Impl.Email.Indy;

interface

uses
  Geral.Model.Entity.Spec.Email,
  Geral.Model.Entity.Spec.List;

type
  TEnvioEmail = class(TInterfacedObject, IEnvioEmail)
  private
    FUsuario: string;
    FSenha: string;
    FAutenticarServidor: Boolean;
    FHostSMTP: string;
    FSSL: Boolean;
    FPortaSMTP: Integer;

    constructor Create(
      const vpUsuario: string;
      const vpSenha: string;
      const vpAutenticarServidor: Boolean;
      const vpHostSMTP: string;
      const vpSSL: Boolean;
      const vpPortaSMTP: Integer); reintroduce;

    function EmailDestinatario(
      const vpPara: IList<IEmailItem>): string;
  public
    class function New(
      const vpUsuario: string;
      const vpSenha: string;
      const vpAutenticarServidor: Boolean;
      const vpHostSMTP: string;
      const vpSSL: Boolean;
      const vpPortaSMTP: Integer): IEnvioEmail;

    procedure Enviar(
      const vpEmail: IEmail);
  end;

implementation

uses
  EmailIndy,
  System.SysUtils,
  System.StrUtils,
  Geral.Model.Entity.Impl.Factory.List,
  System.Classes;

{ TEnvioEmail }

constructor TEnvioEmail.Create(
  const vpUsuario: string;
  const vpSenha: string;
  const vpAutenticarServidor: Boolean;
  const vpHostSMTP: string;
  const vpSSL: Boolean;
  const vpPortaSMTP: Integer);
begin
  inherited Create;
  FUsuario := vpUsuario;
  FSenha := vpSenha;
  FAutenticarServidor := vpAutenticarServidor;
  FHostSMTP := vpHostSMTP;
  FSSL := vpSSL;
  FPortaSMTP := vpPortaSMTP;
end;

function TEnvioEmail.EmailDestinatario(
  const vpPara: IList<IEmailItem>): string;
{$REGION 'Variáveis'}
var
  viEmailList: IList<string>;
  viEmailItem: IEmailItem;
{$ENDREGION}
begin
  viEmailList := TListFactory<string>.New.GetInstance;

  for viEmailItem in vpPara do
    viEmailList.Add(
      viEmailItem.Email);

  Result := string.Join(
    ',',
    viEmailList.ToArray);
end;

procedure TEnvioEmail.Enviar(
  const vpEmail: IEmail);
var
  viMensagemResult: string;
  viEmailDestinatario: string;
  viSolicitarConfirmacao: Boolean;
  viListaAnexos: TStrings;
begin
  viListaAnexos := nil;
  try
    try
      viEmailDestinatario := EmailDestinatario(vpEmail.Para);
      viSolicitarConfirmacao := Assigned(vpEmail.ConfirmacaoLeitura);

      if Assigned(vpEmail.Anexo) then
      begin
        viListaAnexos := TStringList.Create;
        viListaAnexos.AddStrings(vpEmail.Anexo.ToArray);
      end;

      if not TEmail.EnviarEMail(
        vpEmail.De.Email,
        FUsuario,
        FSenha,
        FAutenticarServidor,
        FHostSMTP,
        FSSL,
        vpEmail.De.Nome,
        FPortaSMTP,
        vpEmail.Corpo,
        viEmailDestinatario,
        vpEmail.Assunto,
        viListaAnexos,
        False,
        viMensagemResult,
        viSolicitarConfirmacao,
        vpEmail.TypeHtml) then
        raise Exception.Create(
          viMensagemResult);

    except
      on E: Exception do
        raise Exception.CreateFmt(
          'Não foi possível enviar o e-mail devido ao motivo abaixo:%s%s',
          [DupeString(
            sLineBreak,
            2),
          E.Message]);
    end;
  finally
    FreeAndNil(viListaAnexos);
  end;
end;

class function TEnvioEmail.New(
  const vpUsuario: string;
  const vpSenha: string;
  const vpAutenticarServidor: Boolean;
  const vpHostSMTP: string;
  const vpSSL: Boolean;
  const vpPortaSMTP: Integer): IEnvioEmail;
begin
  Result := Create(
    vpUsuario,
    vpSenha,
    vpAutenticarServidor,
    vpHostSMTP,
    vpSSL,
    vpPortaSMTP);
end;

end.
