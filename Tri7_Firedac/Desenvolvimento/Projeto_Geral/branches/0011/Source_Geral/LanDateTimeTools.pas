unit LanDateTimeTools;

interface

uses
Types, Classes, SysUtils, Windows;

function ServerDateTime(const AServerName: string): TDateTime;
function WorkstationDateTime(const AWorkstationName: string): TDateTime;

implementation

type
  PTimeOfDayInfo = ^TTimeOfDayInfo;
  TTimeOfDayInfo = packed record
  tod_elapsedt: DWORD;
  tod_msecs: DWORD;
  tod_hours: DWORD;
  tod_mins: DWORD;
  tod_secs: DWORD;
  tod_hunds: DWORD;
  tod_timezone: Longint;
  tod_tinterval: DWORD;
  tod_day: DWORD;
  tod_month: DWORD;
  tod_year: DWORD;
  tod_weekday: DWORD;
end;

  NET_API_STATUS = DWORD;

  function NetRemoteTOD(UncServerName: LPCWSTR; BufferPtr: PBYTE): NET_API_STATUS; stdcall;
  external 'netapi32.dll' Name 'NetRemoteTOD';

  function NetApiBufferFree(Buffer: Pointer): NET_API_STATUS; stdcall;
  external 'netapi32.dll' Name 'NetApiBufferFree';

function ServerDateTime(const AServerName: string): TDateTime;
const
  NERR_SUCCESS = 0;
var
  TimeOfDayInfo: PTimeOfDayInfo;
  ServerName: array[0..255] of WideChar;
  dwRetValue: NET_API_STATUS;
  GMTTime: TSystemTime;
  CurTime: TDateTime;
begin
  StringToWideChar(AServerName, @ServerName, SizeOf(ServerName));
  dwRetValue := NetRemoteTOD(@ServerName, PBYTE(@TimeOfDayInfo));
  if dwRetValue <> NERR_SUCCESS then
  raise Exception.Create(SysErrorMessage(dwRetValue));

  with TimeOfDayInfo^ do
  begin
    FillChar(GMTTime, SizeOf(GMTTime), 0);
    with GMTTime do
    begin
     wYear := tod_year;
     wMonth := tod_month;
     wDayOfWeek := tod_weekday;
     wDay := tod_day;
     wHour := tod_hours;
     wMinute := tod_mins;
     wSecond := tod_secs;
     wMilliseconds := tod_hunds;
    end;

    CurTime := SystemTimeToDateTime(GMTTime);
    if tod_timezone <> -1 then
     CurTime := CurTime + ((1 / 24 / 60) * -tod_timezone);
    Result := CurTime;
  end;

  NetApiBufferFree(TimeOfDayInfo);
end;

function WorkstationDateTime(const AWorkstationName: string): TDateTime;
begin
  Result := ServerDateTime(AWorkstationName)
end;

end.
