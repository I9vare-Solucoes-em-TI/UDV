unit Conexao;

interface

uses
  Graphics, DB, Controls, FMTBcd, SqlExpr, Registry, Variants,
  Grids, DBGrids, ComCtrls, Classes, SysUtils, StdCtrls,
  Forms, ClipBrd,
  Windows;

  Function VerificarConexao(vpUsuarioId, vpSistemaId : Integer; vpSistemaTexto : String):Boolean;

implementation

uses Controles, Rotinas;

Function VerificarConexao(vpUsuarioId, vpSistemaId : Integer; vpSistemaTexto : String):Boolean;
var
  viConexao : TStringList;
  viIdLocal : Integer;
  viIpLocal : string;

  function GetIdConexao: Integer;
  begin
    try
      Result := dtmControles.GetInt('SELECT COALESCE(MON$ATTACHMENT_ID, 0) '+
                                    'FROM MON$ATTACHMENTS '+
                                    'WHERE MON$ATTACHMENT_ID = CURRENT_CONNECTION ');
    except
      Result := 0;
    end;
  end;

  procedure RegistrarConexao;
  begin
    ExecutaSqlAuxiliar(' INSERT INTO G_CONEXAO( ' +
        '              CONEXAO_ID, '+
        '              IP_USUARIO, ' +
        '              USUARIO_ID, ' +
        '              DATA_HORA, ' +
        '              SISTEMA_ID, ' +
        '              ATTACHMENT_ID) ' +
        ' VALUES(      :CONEXAO_ID, ' +
        '              :IP_USUARIO, ' +
        '              :USUARIO_ID, ' +
        '              :DATA_HORA, ' +
        '              :SISTEMA_ID, ' +
        '              :ATTACHMENT_ID)', 2);
    with dtmControles.sqlAuxiliar do
    begin
      ParamByName('CONEXAO_ID').AsBCD     := dtmControles.GerarSequencia('G_CONEXAO');
      ParamByName('IP_USUARIO').AsString  := viIpLocal;
      ParamByName('USUARIO_ID').AsInteger := vpUsuarioId;
      ParamByName('DATA_HORA').AsString   := dtmControles.DataHoraBanco(5);
      ParamByName('SISTEMA_ID').AsInteger := vpSistemaId;
      ParamByName('ATTACHMENT_ID').AsInteger := viIdLocal;
      ExecSQL;
    end;
  end;

  procedure AtualizarConexao;
  begin
     ExecutaSqlAuxiliar(' UPDATE G_CONEXAO SET IP_USUARIO = :IP_USUARIO, '+
                        '              DATA_HORA = :DATA_HORA, '+
                        '              ATTACHMENT_ID = :ATTACHMENT_ID'+
                        ' WHERE CONEXAO_ID = '+ viConexao.Values['CONEXAO_ID'],2);
    with dtmControles.sqlAuxiliar do
    begin
      ParamByName('IP_USUARIO').AsString  := viIpLocal;
      ParamByName('DATA_HORA').AsString   := dtmControles.DataHoraBanco(5);
      ParamByName('ATTACHMENT_ID').AsInteger := viIdLocal;
      ExecSQL;
    end;
  end;

  function VerificarUsuarioLogado:Boolean;
  var
    viUsuarioId : Integer;
  begin
    viUsuarioId := dtmControles.GetInt(' SELECT FIRST 1 USUARIO_ID FROM G_CONEXAO '+
                                       ' WHERE SISTEMA_ID = '+IntToStr(vpSistemaId)+
                                       '   AND IP_USUARIO = '+QuotedStr(viConexao.Values['IP_USUARIO'])+
                                       ' ORDER BY CONEXAO_ID DESC');
    if IntToStr(viUsuarioId) = viConexao.Values['USUARIO_ID'] then
      Result := True
    else
      Result := False;
  end;

begin
  try
    viIpLocal := RetornaIP;

    viConexao := dtmControles.GetFields(' SELECT CONEXAO_ID, STATUS, IP_USUARIO, USUARIO_ID, COALESCE(ATTACHMENT_ID, -1) AS ATTACHMENT_ID '+
                                        ' FROM G_CONEXAO '+
                                        ' WHERE USUARIO_ID = '+IntToStr(vpUsuarioId)+
                                        '   AND SISTEMA_ID = '+IntToStr(vpSistemaId));
    Result := True;

    viIdLocal   := GetIdConexao(viIpLocal);

    //Valida se o usuário tem uma entrada na tabela de G_CONEXAO para o sistema
    if viConexao.Values['CONEXAO_ID'] = '' then
      RegistrarConexao
    else
    //Valida se o IP da maquina que esta logando no sistema é o mesmo que esta na tabela G_CONEXAO para o usuário
    if viIpLocal = viConexao.Values['IP_USUARIO'] then
      AtualizarConexao
    else
    if StrToInt(viConexao.Values['ATTACHMENT_ID']) <> GetIdConexao(viConexao.Values['IP_USUARIO']) then
      AtualizarConexao
    else
    begin
      Application.MessageBox('Este usuário está logado em outra maquina!!!', 'Informação', MB_ICONINFORMATION + MB_OK);
      Result := False;
      exit;
    end;

  finally
    FreeAndNil(viConexao);
  end;
end;

end.

