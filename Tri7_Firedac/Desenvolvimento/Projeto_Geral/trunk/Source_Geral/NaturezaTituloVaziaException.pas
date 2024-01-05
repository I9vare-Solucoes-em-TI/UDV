unit NaturezaTituloVaziaException;

interface

uses
  System.SysUtils;

type
  ENaturezaTituloVaziaException = class(Exception)
  public
    constructor Create; reintroduce;
  end;

implementation

{ ENaturezaTituloVaziaException }

constructor ENaturezaTituloVaziaException.Create;
begin
  inherited Create('Por favor, informe a Natureza do Título.');
end;

end.
