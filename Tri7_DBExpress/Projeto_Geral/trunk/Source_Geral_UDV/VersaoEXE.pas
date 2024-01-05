unit VersaoEXE;

interface
Uses Windows, SysUtils, Classes, Types, Forms, ShellAPI, Registry;

  //Controle de Vers�o
  procedure CriaExeApartirdoResource;
  function  AtualizaValidaEXE(vfLocalAtualizacao, vfArquivoEXE, vfChave: string): Boolean;
  function RegistrarDLL(const ServerLocation: string; Register: Boolean): Boolean;


implementation

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
    Ms := TMemoryStream.Create; //Arranja espa�o na mem�ria
    Ms.Clear;
    Bf := LockResource(Rh);
    Ms.WriteBuffer(Bf[0], SizeofResource(HInstance, Rw));
      //Carrega o Resource na mem�ria
    Ms.Seek(0, 0);
    Ms.SavetoFile('Update.exe'); //Salva o Resource como execut�vel
    UnlockResource(Rh); //Libera os recursos
    FreeResource(Rh);
    Ms.Free;
  end;
end;

function AtualizaValidaEXE(vfLocalAtualizacao, vfArquivoEXE, vfChave: string): Boolean;
var
  vVersao1, vVersao2 : TDateTime;
  vVersaoAtualizador1, vVersaoAtualizador2: TDateTime;
  vVersaoChat1, vVersaoChat2: TDateTime;
  i: Integer;
  vSucesso: boolean;
  vDirSystem: Array[0..144] of Char;
  vDirString: string;
  vNew: string;
  vNomeExe: string;
  vParametro: string;
  vAtualizador: string;
  vChat: string;
  vReg: TRegistry;
  vVerificaSeEh64: boolean;
  procedure AtualizarDLL(vDll: string; vRegistrar: boolean);
  begin
    GetSystemDirectory(vDirSystem, 144); //Pega o diret�rio do sistema do windows
    vDirString := vDirSystem;
    if vRegistrar = True then
    begin
      if not FileExists(vDirString + '\'+vDll) then
      begin
        if CopyFile(PChar(vfLocalAtualizacao + '\'+vDll), PChar(vDirString + '\'+vDll) , False) then
        begin
            vSucesso := RegistrarDLL(vDirString + '\'+vDll, vRegistrar);
            if vSucesso = False then
              Application.MessageBox(Pchar('N�o foi possivel registrar a dll: '+vDirString + '\'+vDll), 'Aten��o', MB_OK + MB_ICONERROR);
            //efetuar o registro da dll aqui
        end
        else
          Application.MessageBox(Pchar('N�o foi possivel copiar a dll: '+vDll), 'Aten��o', MB_OK + MB_ICONERROR);
      end;
    end
    else
    begin
      if not FileExists(vDll) then
      begin
        if not CopyFile(PChar(vfLocalAtualizacao + '\'+vDll), PChar(vDll) , False) then
          Application.MessageBox(Pchar('N�o foi possivel copiar a dll: '+vDll), 'Aten��o', MB_OK + MB_ICONERROR);
      end;
    end;
  end;
  procedure AtualizaRegistro(vRootKey: HKEY; vOpenKey, vNomeValor, vConteudo: string);
  var
    S: String;
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
{    //Validar chave do sistema
    if  dtmRotinas.wel_ValidarChaveDoSistema(vfChave) = False then //Se chave n�o for v�lida
    begin
      Application.MessageBox('Chave Usada para acessar o Sistema � Inv�lida! Contate o Suporte T�cnico!', 'Erro', mb_Ok + mb_IconError);
      Result := False;
      Exit;
    end;}

    AtualizarDLL('fbclient.dll', False);
    AtualizarDLL('dbexpida40.dll', False);

    DeleteFile('Update.exe');
    DeleteFile(vNomeExe + '.new');
    DeleteFile(vNomeExe + '.old');

    //Atualizar arquivo de atualiza��o
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
        vVersaoAtualizador2 := FileDateToDateTime(FileAge(vfLocalAtualizacao+'AtualizarTri7.exe')); //Verifica vers�o do aplicativo do servidor
        if vVersaoAtualizador2 > vVersaoAtualizador1 then //Se existe nova vers�o
        begin
          CopyFile(PChar(vfLocalAtualizacao+'AtualizarTri7.exe'), PChar(vAtualizador), False);
        end;
      end;
    end;

    //Atualizar Vers�o do sistema
    if FileExists(vfLocalAtualizacao+vfArquivoEXE) then //Verifica se o existe aplicativo do INI
    begin
      vVersao1 := FileDateToDateTime(FileAge(Application.Exename)); //Verifica vers�o do aplicativo do Atual
      vVersao2 := FileDateToDateTime(FileAge(vfLocalAtualizacao+vfArquivoEXE)); //Verifica vers�o do aplicativo do INI
      if vVersao2 > vVersao1 then //Se existe nova vers�o
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