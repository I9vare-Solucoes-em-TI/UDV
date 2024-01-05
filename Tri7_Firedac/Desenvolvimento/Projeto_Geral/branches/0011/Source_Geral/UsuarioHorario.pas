unit UsuarioHorario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,Controls, Forms,
  Dialogs, ExtCtrls, DateUtils, ControleBloqueio;
Type
  THoraExtra = RECORD
     Extra : Boolean;
     HoraExtraInicio : string;
     HoraExtraFim : string;
  end;

var
  vlBloqueioHorario : TControleBloqueio;

  procedure CriarControleHorario;
  procedure DestruirControleHorario;
  function ValidaHoraExtra : THoraExtra;

implementation

uses Controles, Rotinas;

procedure CriarControleHorario;
var
  viUsuario : TStringList;
  viSql : String;
  viHoraExtra : THoraExtra;
  viDiasUteis : Boolean;
  viDataHoraServidor : TDateTime;
begin
  viSql := 'SELECT CONTROLE_HORARIO, HORA_INICIO, HORA_FIM, DIAS_UTEIS '+
           'FROM G_USUARIO '+
           'WHERE USUARIO_ID = ' + vgUsuarioID;
  viUsuario := dtmControles.GetFields(viSql);
  try
    viDataHoraServidor := dtmControles.DataHoraBanco(3);

    if viUsuario.Values['CONTROLE_HORARIO'] = 'S' then
    begin
      viDiasUteis := True;
      viHoraExtra := ValidaHoraExtra;

      if (viUsuario.Values['DIAS_UTEIS'] = 'S') then
        viDiasUteis := dtmControles.VerificarDiaUtil(viDataHoraServidor);

      if viUsuario <> nil then
      begin
        vlBloqueioHorario := TControleBloqueio.Create;
        try
          if (not viDiasUteis) and (viHoraExtra.Extra) then
            vlBloqueioHorario.HorarioInicio   := StrToTime(viHoraExtra.HoraExtraInicio)
          else
           vlBloqueioHorario.HorarioInicio   := StrToTime(viUsuario.Values['HORA_INICIO']);

          if not viHoraExtra.Extra then
            vlBloqueioHorario.HorarioFinal  := StrToTime(viUsuario.Values['HORA_FIM'])
          else
            vlBloqueioHorario.HorarioFinal  := StrToTime(viHoraExtra.HoraExtraFim);

          vlBloqueioHorario.Tolerancia      := 600;
          vlBloqueioHorario.Bloqueio        := (not viDiasUteis) and (not viHoraExtra.Extra);
          vlBloqueioHorario.ServidorHorario := TimeOf(viDataHoraServidor);// + (900 / SecsPerDay);

        except
          ShowMessage('Erro ao ativar o controle de horário!');
          vlBloqueioHorario.Destroy;
          FreeAndNil(viUsuario);
          Exit;
        end;

        if not vlBloqueioHorario.Ativar then
        begin
          vlBloqueioHorario.Destroy;
          Application.ProcessMessages;
          if Application.MessageBox('Sistema não pode ser usado pois esta fora do horário padrão de funcionamento!', 'Atenção', MB_OK + MB_ICONWARNING) = mrOk then
            Application.Terminate;
        end;
      end;
    end;
  finally
    FreeAndNil(viUsuario);
  end;

end;

procedure DestruirControleHorario;
begin
  FreeAndNil(
    vlBloqueioHorario);
end;

function ValidaHoraExtra : THoraExtra;
var
  viSql : string;
  viHoraServidor : TDateTime;
  viHoraExtra : TStringList;
begin
  viHoraServidor := dtmControles.DataHoraBanco(3);
  Try
    viSql := ' SELECT HORA_INICIO, HORA_FIM FROM G_HORA_EXTRA ' +
             ' WHERE DATA_HORA_EXTRA ' + MontarSqlData(viHoraServidor, viHoraServidor) +
             ' AND USUARIO_ID = ' + vgUsuarioID;
    viHoraExtra := dtmControles.GetFields(viSql);

    Result.HoraExtraInicio := viHoraExtra.Values['HORA_INICIO'];
    Result.HoraExtraFim    := viHoraExtra.Values['HORA_FIM'];

    Result.Extra := Result.HoraExtraFim <> '';
  Finally
    FreeAndNil(viHoraExtra);
  End;
end;

end.
