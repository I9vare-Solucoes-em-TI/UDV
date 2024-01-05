unit DataVaziaException;

interface

uses
  System.SysUtils;

type
  EDataVaziaException = class(Exception)
  public
    constructor Create; reintroduce;
  end;

implementation

{ EDataVaziaException }

constructor EDataVaziaException.Create;
begin
  inherited Create('Por favor, informe a data.');
end;

end.
