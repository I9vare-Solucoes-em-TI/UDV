unit ApresentanteNomeVazioException;

interface

uses
  System.SysUtils;

type
  EApresentanteNomeVazioException = class(Exception)
  public
    constructor Create; reintroduce;
  end;

implementation

{ EApresentanteNomeVazioException }

constructor EApresentanteNomeVazioException.Create;
begin
  inherited Create('Por favor, informe o nome do Apresentante.');
end;

end.
