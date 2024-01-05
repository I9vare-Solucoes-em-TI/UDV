unit Versao;

interface
Uses windows, SysUtils, Classes, Types, Forms;
  //Controle de Versão
  procedure CriaExeApartirdoResource;
  function  AtualizaEXE : Boolean;

  var vgVERSAO : String;
implementation

uses Atualizacao;

procedure CriaExeApartirdoResource;
var
  RI: HRSRC;
  Rh: THandle;
  Bf: pchar;
  Ms: TMemoryStream;
begin
  Ri := FindResource(HInstance, 'Atualizador', 'exe');
  //Descobre o nome do resource do tipo exe
  Rh := LoadResource(HInstance, Ri); //Define o Handle
  if Rh <> 0 then
  begin
    Ms := TMemoryStream.Create; //Arranja espaço na memória
    Ms.Clear;
    Bf := LockResource(Rh);
    Ms.WriteBuffer(Bf[0], SizeofResource(HInstance, Ri));
      //Carrega o Resource na memória
    Ms.Seek(0, 0);
    Ms.SavetoFile('Update.exe'); //Salva o Resource como executável
    UnlockResource(Rh); //Libera os recursos
    FreeResource(Rh);
    Ms.Free;
  end;
end;

function AtualizaEXE : Boolean;
var prog2, NomeExe: string;
    versao1, versao2 : TDateTime;
    i: Integer;
begin
  Result := True;
  NomeExe := Application.Exename;

  while Pos('\',NomeExe) <> 0 do
     Delete(NomeExe,1 ,Pos('\',NomeExe));
  NomeExe := copy(NomeExe, 1, Pos('.',NomeExe) - 1);

  {$ifdef VER180}		//D2007
  {Copiar DLLs do sistema
  Incio}
    if not FileExists('fbclient.dll') then
    begin
      CopyFile(PChar(vgVERSAO + '\fbclient.dll')  , PChar('fbclient.dll')  , false);
      CopyFile(PChar(vgVERSAO + '\dbexpida40.dll'), PChar('dbexpida40.dll'), false);
    end;
  {Fim}
  {$endif VER180}

  vgVERSAO  := vgVERSAO + '\' + NomeExe + '.exe';

  DeleteFile('Update.exe');
  DeleteFile(NomeExe + '.new');
  DeleteFile(NomeExe + '.old');

  versao1 := FileDateToDateTime(FileAge(Application.Exename));
    //Verifica a versão do aplicativo atual
  if FileExists(vgVERSAO) then //Verifica se o existe aplicativo do INI
  begin
    VERSAO2 := FileDateToDateTime(FileAge(vgVERSAO)); //Verifica versão do aplicativo do INI
    if VERSAO2 > VERSAO1 then //Se existe nova versão
    begin
      frmAtualizacao := TfrmAtualizacao.Create(Application);
      frmAtualizacao.Show;
      frmAtualizacao.Update;

      i := length(Application.Exename);
      prog2 := copy(Application.Exename, 1, i - 3) + 'new';
        //copia para a pasta corrente com nome
      CopyFile(PChar(vgVERSAO), PChar(prog2), false); // aplicativo.new
      CriaExeApartirdoResource; //Função que cria o Update.exe a partir do resource

      WinExec(Pchar('Update ' + NomeExe), 0); //Executa o update.exe
      Application.ProcessMessages;
      
      Result := False;
      frmAtualizacao.hide;
      frmAtualizacao.free;
    end;
   end;
end;

end. 
