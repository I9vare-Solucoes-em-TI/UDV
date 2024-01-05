unit EmolumentoVazioException;

interface

uses
  System.SysUtils;

type
  EEmolumentoVazioException = class(Exception)
  public
    constructor Create; reintroduce;
  end;

implementation

{ EEmolumentoVazioException }

constructor EEmolumentoVazioException.Create;
begin
  inherited Create('Por favor, informe a Tabela de Cobran�a.');
end;

end.
