unit EurekaLog;

interface

uses
  System.SysUtils, ETypes, EClasses, ExceptionLog7, StrUtils, Types, Controles;

  procedure ConfigurarEurekaLogEvents;
  procedure ConfigurarMensagensEurekaLog;

implementation

procedure ConfigurarEurekaLogEvents;
{$REGION 'Variáveis'}
var
  i: Integer;
  viCaminhoLog: string;
  viCodigoENomeCartorio: string;
  viUtilizaCaptureScreen: string;
  viAtivaLog: Boolean;
  viSistemaPermitido: Boolean;
  viListaSistema: TStringDynArray;
{$ENDREGION}

  function ExisteBarra(vpCaminhoLog: string): string;
  begin
    if Copy(vpCaminhoLog,Length(vpCaminhoLog),1) = '\' then
      Result := vpCaminhoLog
    else
      Result := vpCaminhoLog + '\';
  end;
begin
  if not CurrentEurekaLogOptions.ActivateEurekaLog then
    Exit;

  viAtivaLog := dtmControles.BuscarParametroOutroSistema('ATIVAR_LOG', 'LOG', 'PRINCIPAL','5') = 'S';
  SetEurekaLogState(viAtivaLog);
  if not CurrentEurekaLogOptions.Active then
  begin
    CurrentEurekaLogOptions.SenderClasses := esmNoSend;  // Desabilita Envio
    CurrentEurekaLogOptions.sndScreenshot := ssNone;
    Exit;
  end;

  viCodigoENomeCartorio  := dtmControles.BuscarParametroOutroSistema('CODIGO', 'CARTORIO', 'PRINCIPAL', '5') + ' - ' +
                            dtmControles.BuscarParametroOutroSistema('NOME', 'CARTORIO', 'PRINCIPAL', '5');
  viCaminhoLog           := dtmControles.BuscarParametroOutroSistema('CAMINHO_ARQUIVO_LOG', 'LOG', 'PRINCIPAL','5');
  viUtilizaCaptureScreen := dtmControles.BuscarParametroOutroSistema('UTILIZA_CAPTURE_SCREEN', 'LOG', 'PRINCIPAL','5');
  viListaSistema         := SplitString(dtmControles.BuscarParametroOutroSistema('HABILITA_LOG_SISTEMA', 'LOG', 'PRINCIPAL','5'),';');

  viSistemaPermitido := False;
  for i := Low(viListaSistema) to High(viListaSistema) - 1 do
  begin
    if IntToStr(vgId) = viListaSistema[i] then
    begin
      viSistemaPermitido := True;
      Break;
    end;
  end;

  if not viSistemaPermitido then
    Exit;

  if (CurrentEurekaLogOptions.Active) and (viAtivaLog) then
  begin
    CurrentEurekaLogOptions.SenderClasses         := esmSMTPClient;
    CurrentEurekaLogOptions.EMailMessage          := 'Padrão';
    CurrentEurekaLogOptions.sndShowSendDialog     := False; // Desabilita a tela de processando envio
    CurrentEurekaLogOptions.SendSMTPClientMessage := CurrentEurekaLogOptions.SendSMTPClientMessage + viCodigoENomeCartorio;

    if viUtilizaCaptureScreen = 'S' then
      CurrentEurekaLogOptions.sndScreenshot := ssForegroundWindow
    else
      CurrentEurekaLogOptions.sndScreenshot := ssNone;

    if Trim(viCaminhoLog) <> '' then
      CurrentEurekaLogOptions.OutputPath :=  ExisteBarra(viCaminhoLog) + FormatDateTime('DDMMYYYY_HHMM', Now) + '.Elf';

    ConfigurarMensagensEurekaLog;
  end;
end;

procedure ConfigurarMensagensEurekaLog;
{$REGION 'Variáveis'}
var
  viTipoMsg: string;
{$ENDREGION}
begin
  viTipoMsg := dtmControles.BuscarParametroOutroSistema('TIPO_MENSAGENS', 'LOG', 'PRINCIPAL','5');

  if not CurrentEurekaLogOptions.Active then
    Exit;

  if vgLogin = 'TRI7' then
  begin // Suporte: Com a opção de visualizar os detalhes (Apenas usuário TRI7)
    CurrentEurekaLogOptions.ExceptionDialogType          := edtMSClassic;
    CurrentEurekaLogOptions.edoShowSendErrorReportOption := True;
    CurrentEurekaLogOptions.edoRestartChecked            := True;
    CurrentEurekaLogOptions.edoShowDetailsButton         := True;
    Exit;
  end;

  if viTipoMsg = 'S' then
  begin // Simples: Minimo de informação.
    CurrentEurekaLogOptions.ExceptionDialogType          := edtMSClassic;
    CurrentEurekaLogOptions.edoShowSendErrorReportOption := False;
    CurrentEurekaLogOptions.edoShowDetailsButton         := False;
  end
  else if viTipoMsg = 'P' then
  begin // Padrão: Com a opção de enviar msg Botões (Sim/Não)
    CurrentEurekaLogOptions.ExceptionDialogType          := edtMSClassic;
    CurrentEurekaLogOptions.edoShowSendErrorReportOption := True;
    CurrentEurekaLogOptions.edoSendErrorReportChecked    := True;
    CurrentEurekaLogOptions.edoShowEMailControl          := False;
    CurrentEurekaLogOptions.edoShowDetailsButton         := False;
  end;
end;

end.
