unit Conexao;

interface

uses
  Graphics, DB, Controls, FMTBcd, SqlExpr, Registry, Variants,
  Grids, DBGrids, ComCtrls, Classes, SysUtils, StdCtrls,
  Forms, ClipBrd,
  Windows;

  Function VerificarConexao(vpUsuarioId, vpSistemaId : Integer; vpSistemaTexto, vpSistemaIP, vpSistemaMAC : String):Boolean;
  procedure DesativarConexao(vpUsuarioId, vpSistemaId : Integer);

implementation

uses Controles;

procedure DesativarConexao(vpUsuarioId, vpSistemaId : Integer);
begin
   dtmControles.ExecSQL(' UPDATE G_CONEXAO SET ATTACHMENT_ID = null, STATUS = '+QuotedStr('I')+
                        ' WHERE SISTEMA_ID = '+ IntToStr(vpSistemaId)+
                        '   AND USUARIO_ID = '+ IntToStr(vpUsuarioId));
end;

Function VerificarConexao(vpUsuarioId, vpSistemaId : Integer; vpSistemaTexto, vpSistemaIP, vpSistemaMAC : String):Boolean;
var
  viConexao : TStringList;

  function GetIdConexao : Integer;
  begin
    Application.ProcessMessages;
    try
      Result := dtmControles.GetInt('SELECT COALESCE(MON$ATTACHMENT_ID, 0) '+
                                    'FROM MON$ATTACHMENTS '+
                                    'WHERE MON$ATTACHMENT_ID = CURRENT_CONNECTION ');
    except
      Result := 0;
    end;
  end;

  function GetAttachmentExiste: Boolean;
  begin
    try
      Result := dtmControles.GetInt('SELECT COALESCE(MON$ATTACHMENT_ID, 0) '+
                                    'FROM MON$ATTACHMENTS '+
                                    'WHERE MON$ATTACHMENT_ID = ' + viConexao.Values['ATTACHMENT_ID']) > 0;
    except
      Result := False;
    end;
  end;

  procedure RegistrarConexao;
  begin
    ExecutaSqlAuxiliar(' INSERT INTO G_CONEXAO( ' +
          '              CONEXAO_ID, '+
          '              IP_USUARIO, ' +
          '              MAC, ' +
          '              USUARIO_ID, ' +
          '              DATA_HORA, ' +
          '              SISTEMA_ID, ' +
          '              STATUS, ' +
          '              ATTACHMENT_ID) '+
          ' VALUES(      :CONEXAO_ID, ' +
          '              :IP_USUARIO, ' +
          '              :MAC, ' +
          '              :USUARIO_ID, ' +
          '              :DATA_HORA, ' +
          '              :SISTEMA_ID, ' +
          '              :STATUS,' +
          '              :ATTACHMENT_ID)', 2);

    with dtmControles.sqlAuxiliar do
    begin
      ParamByName('CONEXAO_ID').AsBCD        := dtmControles.GerarSequencia('G_CONEXAO');
      ParamByName('IP_USUARIO').AsString     := vpSistemaIP;
      ParamByName('MAC').AsString            := vpSistemaMAC;
      ParamByName('USUARIO_ID').AsInteger    := vpUsuarioId;
      ParamByName('DATA_HORA').AsString      := dtmControles.DataHoraBanco(5);
      ParamByName('SISTEMA_ID').AsInteger    := vpSistemaId;
      ParamByName('STATUS').AsString         := 'A';
      ParamByName('ATTACHMENT_ID').AsInteger := GetIdConexao;
      ExecSQL;
    end;
  end;

  procedure AtualizarConexao;
  begin
     ExecutaSqlAuxiliar(' UPDATE G_CONEXAO SET IP_USUARIO = :IP_USUARIO, '+
                        '              MAC = :MAC, '+
                        '              DATA_HORA = :DATA_HORA, '+
                        '              STATUS = :STATUS, '+
                        '              ATTACHMENT_ID = :ATTACHMENT_ID '+
                        ' WHERE CONEXAO_ID = '+ viConexao.Values['CONEXAO_ID'],2);
    with dtmControles.sqlAuxiliar do
    begin
      ParamByName('IP_USUARIO').AsString     := vpSistemaIP;
      ParamByName('MAC').AsString            := vpSistemaMAC;
      ParamByName('DATA_HORA').AsDateTime    := dtmControles.DataHoraBanco(3);
      ParamByName('STATUS').AsString         := 'A';
      ParamByName('ATTACHMENT_ID').AsInteger := GetIdConexao;
      ExecSQL;
    end;
  end;

begin
  viConexao := dtmControles.GetFields(' SELECT CONEXAO_ID, STATUS, IP_USUARIO, MAC, USUARIO_ID, COALESCE(ATTACHMENT_ID, 0) AS ATTACHMENT_ID '+
                                      ' FROM G_CONEXAO '+
                                      ' WHERE USUARIO_ID = '+IntToStr(vpUsuarioId)+
                                      '   AND SISTEMA_ID = '+IntToStr(vpSistemaId));
  try
    Result := True;
    if viConexao.Values['CONEXAO_ID'] = '' then
      RegistrarConexao
    else
    if viConexao.Values['IP_USUARIO'] = vpSistemaIP then
      AtualizarConexao
    else
    if viConexao.Values['MAC'] = vpSistemaMAC then
      AtualizarConexao
    else
    if viConexao.Values['ATTACHMENT_ID'] = '0' then
      AtualizarConexao
    else
    if viConexao.Values['STATUS'] = 'I' then
      AtualizarConexao
    else
    if (viConexao.Values['STATUS'] <> 'I') and (not GetAttachmentExiste) then
      AtualizarConexao
    else
    begin
      Application.MessageBox('Este usu�rio est� logado em outra maquina!!!', 'Informa��o', MB_ICONINFORMATION + MB_OK);
      Result := False;
      exit;
    end;
    Result := True;
  finally
    FreeAndNil(viConexao);
  end;
end;

end.
