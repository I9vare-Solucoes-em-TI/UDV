unit HoraVaziaException;

interface

uses
  System.SysUtils;

type
  EHoraVaziaException = class(Exception)
  public
    constructor Create; reintroduce;
  end;

implementation

{ EHoraVaziaException }

constructor EHoraVaziaException.Create;
begin
  inherited Create('Por favor, informe a hora.');
end;

end.
