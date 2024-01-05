unit InterfaceDll;

interface

uses
  Windows, SysUtils, StdCtrls, InterfaceDataSnap;

type
  TGetDataSnapProc = procedure(var I: IInterfaceDataSnap; vfIp: WideString);stdcall;

function GetDataSnapDll(vfPath, vfIp: WideString): IInterfaceDataSnap;

implementation

var
  GetInterface: TGetDataSnapProc;

function GetDataSnapDll(vfPath, vfIp: WideString):IInterfaceDataSnap;
var
  LibHandle: THandle;
begin
  Result := nil;
  LibHandle := LoadLibrary(Pchar(IncludeTrailingPathDelimiter(vfPath)+'financeiro.dll'));

  if LibHandle=0 then
    raise Exception.Create('DLL financeiro.dll não encontrada.');

  @GetInterface:= GetProcAddress(LibHandle,'GetDataSnapInt');
  if @GetInterface <> nil then
  begin
    GetInterface(Result, vfIp);
    Exit;
  end;

  FreeLibrary(LibHandle);
end;

end.


