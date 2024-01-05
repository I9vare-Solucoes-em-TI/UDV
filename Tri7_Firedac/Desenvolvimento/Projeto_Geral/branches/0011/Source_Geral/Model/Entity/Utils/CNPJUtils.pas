unit CNPJUtils;

interface

type
  TCNPJUtils = class sealed
  public
    class function RetirarFormatacao(
      const vpValue: string): string; static;
  end;

implementation

uses
  System.SysUtils;

{ TCNPJUtils }

class function TCNPJUtils.RetirarFormatacao(
  const vpValue: string): string;
begin
  Result := vpValue.Replace(
    '.',
    string.Empty,
    [rfReplaceAll]
  ).Replace(
    '/',
    string.Empty,
    []
  ).Replace(
    '-',
    string.Empty,
    []
  );
end;

end.
