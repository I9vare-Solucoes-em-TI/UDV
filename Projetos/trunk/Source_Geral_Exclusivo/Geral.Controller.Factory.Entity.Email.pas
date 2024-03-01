{* @hash       2b3a4f080d4b5e2a8e9e0d19eed146145d119703095919aaedf5e5e6a83c
 * @version    1.0.0.0
 * @unit       Geral.Controller.Factory.Entity.Email.pas
 * @author     I9vare
 * @copyright  Copyright (c) 2013 I9vare Gestão e Soluções em TI. (https://www.i9vare.com)
 *}

unit Geral.Controller.Factory.Entity.Email;

interface

uses
  Geral.Model.Entity.Spec.Factory,
  Geral.Model.Entity.Spec.Email,
  I9Connection,
  Data.DB;

type
  TEnvioEmailFactory = class(TInterfacedObject, IFactory<IEnvioEmail>)
  private
    FEmailConfigID: Integer;
    FConnection: TI9Connection;

    constructor Create(
      const vpEmailConfigID: Integer;
      const vpConnection: TI9Connection); reintroduce;

    function EmailConfig: TDataSet;
  public
    function GetInstance: IEnvioEmail;

    class function New(
      const vpEmailConfigID: Integer;
      const vpConnection: TI9Connection): IFactory<IEnvioEmail>;
  end;

implementation

uses
  Geral.Model.Entity.Impl.Email.Indy,
  I9Query,
  Controles;

{ TEnvioEmailFactory }

constructor TEnvioEmailFactory.Create(
  const vpEmailConfigID: Integer;
  const vpConnection: TI9Connection);
begin
  inherited Create;
  FEmailConfigID := vpEmailConfigID;
  FConnection := vpConnection;
end;

function TEnvioEmailFactory.EmailConfig: TDataSet;
{$REGION 'Variáveis'}
var
  viQuery: TI9Query;
{$ENDREGION}
begin
  viQuery := TI9Query.Create(
    nil);

  Result := viQuery;
  viQuery.Connection := FConnection;

  viQuery.SQL.Text := {$REGION 'Comando SQL SELECT'}
    'SELECT ' +

    {$REGION 'Colunas'}
    'G_EC.EMAIL_CONFIG_ID, ' +
    'G_EC.HOST_SMTP, ' +
    'G_EC.PORTA, ' +
    'G_EC.USER_NAME, ' +
    'G_EC.PASSWORD, ' +
    'G_EC.AUTENTICAR_SERVIDOR, ' +
    'G_EC.USAR_TSL_SSL '+
    {$ENDREGION}

    {$REGION 'Cláusula FROM'}
    'FROM ' +
    'G_EMAIL_CONFIG G_EC ' +
    {$ENDREGION}

    {$REGION 'Cláusula WHERE e Parâmetros'}
    'WHERE ' +
    'G_EC.EMAIL_CONFIG_ID = :P_EMAIL_CONFIG_ID';
    {$ENDREGION}

  {$ENDREGION}

  {$REGION 'Preencher valores dos parâmetros'}
  viQuery.ParamByName(
    'P_EMAIL_CONFIG_ID').AsInteger := FEmailConfigID;
  {$ENDREGION}

  Result.Open;
end;

function TEnvioEmailFactory.GetInstance: IEnvioEmail;
{$REGION 'Variáveis'}
var
  viEmailConfig: TDataSet;
  viUsuario: string;
  viSenha: string;
  viAutenticarServidor: Boolean;
  viHostSMTP: string;
  viPortaSMTP: Integer;
  viTSLSSL: Boolean;
{$ENDREGION}
begin
  viEmailConfig := EmailConfig;
  try
    viUsuario := viEmailConfig.FieldByName(
      'USER_NAME').AsString;

    viSenha := dtmControles.Cripto.CriptoHexToText(viEmailConfig.FieldByName(
      'PASSWORD').AsString);

    viAutenticarServidor := viEmailConfig.FieldByName(
      'AUTENTICAR_SERVIDOR').AsString = 'S';

    viTSLSSL := viEmailConfig.FieldByName(
      'USAR_TSL_SSL').AsString = 'S';

    viHostSMTP := viEmailConfig.FieldByName(
      'HOST_SMTP').AsString;

    if viEmailConfig.FieldByName('PORTA').AsString <> '' then
      viPortaSMTP := viEmailConfig.FieldByName(
        'PORTA').AsInteger
    else
      viPortaSMTP := 0

  finally
    viEmailConfig.Close;
    viEmailConfig.Free;
  end;

  Result := TEnvioEmail.New(
    viUsuario,
    viSenha,
    viAutenticarServidor,
    viHostSMTP,
    viTSLSSL,
    viPortaSMTP);
end;

class function TEnvioEmailFactory.New(
  const vpEmailConfigID: Integer;
  const vpConnection: TI9Connection): IFactory<IEnvioEmail>;
begin
  Result := Create(
    vpEmailConfigID,
    vpConnection);
end;

end.
