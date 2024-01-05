unit GeracaoSelosException;

interface

uses
  System.SysUtils;

type
  EGeracaoSelosException = class(Exception)
  public
    constructor Create(
      const vpMotivo: string); reintroduce;
  end;

implementation

uses
  System.StrUtils;

{ EGeracaoSelosException }

constructor EGeracaoSelosException.Create(
  const vpMotivo: string);
begin
  inherited Create('Não foi possível gerar o(s) selo(s) devido ao motivo ' +
    'abaixo:' + DupeString(sLineBreak, 2) + vpMotivo);
end;

end.
