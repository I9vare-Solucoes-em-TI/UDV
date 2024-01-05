unit CEPUtils;

interface

type
  TCEPUtils = class sealed
  public
    class function RetirarFormatacao(
      const vpValue: string): string; static;
  end;

implementation

uses
  System.SysUtils;

{ TCEPUtils }

class function TCEPUtils.RetirarFormatacao(
  const vpValue: string): string;
begin
  Result := vpValue.Replace(
    '.',
    string.Empty,
    []
  ).Replace(
    '-',
    string.Empty,
    []
  );
end;

end.
