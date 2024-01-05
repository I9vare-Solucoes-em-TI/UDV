unit VersaoEXE;

interface
Uses Windows, SysUtils, Classes, Types, Forms, ShellAPI, Registry, Vcl.Dialogs;

  //Controle de Versão
  procedure CriaExeApartirdoResource;
  function  AtualizaValidaEXE(vfLocalAtualizacao, vfArquivoEXE, vfChave: string): Boolean;
  function  AtualizaChat(vfLocalAtualizacao: string): Boolean;
  function RegistrarDLL(const ServerLocation: string; Register: Boolean): Boolean;


implementation

{$WARN SYMBOL_PLATFORM OFF}
{$WARN SYMBOL_DEPRECATED OFF}

uses
  Rotinas;

function AtualizaChat(vfLocalAtualizacao: string): Boolean;
var versao1,
    versao2 : TDateTime;
    viArquivo1,
    viArquivo2,
    viArquivoEXE : string;
begin
  Result := True;
  viArquivoEXE := 'Chat.exe';

  viArquivo1 := ExtractFilePath(Application.ExeName)+ viArquivoEXE;
  viArquivo2 := vfLocalAtualizacao + viArquivoEXE;

  if FileExists(viArquivo1) then
    versao1 := FileDateToDateTime(FileAge(viArquivo1))
  else
    versao1 := StrToDateTime('31/12/1899');

  //Verifica a versão do aplicativo atual
  if FileExists(viArquivo2) then //Verifica se o existe aplicativo do INI
  begin
    versao2 := FileDateToDateTime(FileAge(viArquivo2)); //Verifica versão do aplicativo do INI
    if versao2 > versao1 then //Se existe nova versão
    begin
      //Mata o processo do Chat caso o mesmo exista
      if ProcessoExiste(viArquivoEXE) then
        KillTask(viArquivoEXE);
      //copia para a pasta corrente com nome
      if not CopyFile(PChar(viArquivo2), PChar(viArquivo1), false) then
      begin
        Application.MessageBox('Não foi possivel atualizar o sistema de chat no momento!', 'Atenção', MB_OK + MB_ICONERROR);
        Result := False;
      end;
    end;
   end;
end;

function RegistrarDLL(const ServerLocation: string; Register: Boolean): Boolean;
var
  ServerDllRegisterServer: function: HResult; stdcall;
  ServerDllUnregisterServer: function: HResult; stdcall;
  ServerHandle: THandle;

  procedure UnloadServerFunctions;
  begin
    @ServerDllRegisterServer := nil;
    @ServerDllUnregisterServer := nil;
    FreeLibrary(ServerHandle);
  end;
  function LoadServerFunctions: Boolean;
  begin
    Result := False;
    ServerHandle := SafeLoadLibrary(ServerLocation);
    if (ServerHandle <> 0) then
    begin
      @ServerDllRegisterServer := GetProcAddress(ServerHandle,'DllRegisterServer');
      @ServerDllUnregisterServer := GetProcAddress(ServerHandle,'DllUnregisterServer');
      if (@ServerDllRegisterServer = nil) or (@ServerDllUnregisterServer = nil) then
        UnloadServerFunctions
      else
        Result := True;
    end;
  end;
begin
  Result := False;
  try
    if (LoadServerFunctions) then
    try
      case (Register) of
        False: Result := ServerDllUnregisterServer = S_OK;
        True: Result := ServerDllRegisterServer = S_OK;
      end;
    finally
      UnloadServerFunctions;
    end;
  except
  end;
end;

procedure CriaExeApartirdoResource;
var
  Rw: HRSRC;
  Rh: THandle;
  Bf: pchar;
  Ms: TMemoryStream;
begin
  Rw := FindResource(HInstance, 'Atualizador', 'exe');
  //Descobre o nome do resource do tipo exe
  Rh := LoadResource(HInstance, Rw); //Define o Handle
  if Rh <> 0 then
  begin
    Ms := TMemoryStream.Create; //Arranja espaço na memória
    Ms.Clear;
    Bf := LockResource(Rh);
    Ms.WriteBuffer(Bf[0], SizeofResource(HInstance, Rw));
      //Carrega o Resource na memória
    Ms.Seek(0, 0);
    Ms.SavetoFile('Update.exe'); //Salva o Resource como executável
    UnlockResource(Rh); //Libera os recursos
    FreeResource(Rh);
    Ms.Free;
  end;
end;

function AtualizaValidaEXE(vfLocalAtualizacao, vfArquivoEXE, vfChave: string): Boolean;
var
  vVersao1, vVersao2 : TDateTime;
  vVersaoAtualizador1, vVersaoAtualizador2: TDateTime;
  vNomeExe: string;
  vParametro: string;
  vAtualizador: string;
  vReg: TRegistry;

  procedure AtualizaRegistro(vRootKey: HKEY; vOpenKey, vNomeValor, vConteudo: string);
  begin
    try
      try
        vReg := Tregistry.create;
        vReg.RootKey := vRootKey;
        if not vReg.Openkey(vOpenKey, False) then
        begin
          if not vReg.ValueExists(vNomeValor) then
          begin
            vReg.WriteString(vNomeValor,vConteudo);
          end;
        end
        else
        begin
          vReg.Openkey(vOpenKey, True);
          vReg.WriteString(vNomeValor,vConteudo);
        end;
      finally
        vReg.CloseKey;
        vReg.Free;
      end;
    except
    end;
  end;
begin
  Result := True;
  vNomeExe :=  Copy(vfArquivoEXE, 1, Pos('.',vfArquivoEXE) - 1);
  if DebugHook = 0 then
  begin
    //Atualizar arquivo de atualização
    vAtualizador := ExtractFilePath(Application.ExeName)+'AtualizarTri7.exe';
    if FileExists(vfLocalAtualizacao+'AtualizarTri7.exe') then //Verifica se o existe aplicativo no servidor
    begin
      if not FileExists(vAtualizador) then
      begin
        CopyFile(PChar(vfLocalAtualizacao+'AtualizarTri7.exe'), PChar(vAtualizador), False);
      end
      else
      begin
        vVersaoAtualizador1 := FileDateToDateTime(FileAge(vAtualizador));
        vVersaoAtualizador2 := FileDateToDateTime(FileAge(vfLocalAtualizacao+'AtualizarTri7.exe')); //Verifica versão do aplicativo do servidor
        if vVersaoAtualizador2 > vVersaoAtualizador1 then //Se existe nova versão
        begin
          CopyFile(PChar(vfLocalAtualizacao+'AtualizarTri7.exe'), PChar(vAtualizador), False);
        end;
      end;
    end;

    //Atualizar Versão do sistema
    if FileExists(vfLocalAtualizacao+'\'+vfArquivoEXE) then //Verifica se o existe aplicativo do INI
    begin
      vVersao1 := FileDateToDateTime(FileAge(Application.Exename)); //Verifica versão do aplicativo do Atual
      vVersao2 := FileDateToDateTime(FileAge(IncludeTrailingPathDelimiter(vfLocalAtualizacao)+vfArquivoEXE)); //Verifica versão do aplicativo do INI

      if vVersao2 > vVersao1 then //Se existe nova versão
      begin
        if FileExists(vAtualizador) then
        begin
          vParametro := '"'+Application.Exename+'"' + ' ' + '"'+vfLocalAtualizacao+vfArquivoEXE+'"';
          ShellExecute(0, 'open', PChar(vAtualizador), PChar(vParametro), Pchar(ExtractFilePath(Application.ExeName)), SW_SHOWNORMAL);
          Application.Terminate;
        end;
        Application.ProcessMessages;
        Result := False;
      end;
    end;
  end;
end;

end.

