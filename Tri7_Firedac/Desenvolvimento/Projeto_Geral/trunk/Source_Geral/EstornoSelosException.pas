unit EstornoSelosException;

interface

uses
  System.SysUtils;

type
  EEstornoSelosException = class(Exception)
  public
    constructor Create(
      const vpMotivo: string); reintroduce;
  end;

implementation

uses
  System.StrUtils;

{ EEstornoSelosException }

constructor EEstornoSelosException.Create(
  const vpMotivo: string);
begin
  inherited Create('Não foi possível estornar os selos devido ao motivo ' +
    'abaixo:' + DupeString(sLineBreak, 2) + vpMotivo);
end;

end.
