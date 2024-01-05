unit GeracaoSelosAntesRecebimentoException;

interface

uses
  System.SysUtils;

type
  EGeracaoSelosAntesRecebimentoException = class(Exception)
  public
    constructor Create; reintroduce;
  end;

implementation

{ EGeracaoSelosAntesRecebimentoException }

constructor EGeracaoSelosAntesRecebimentoException.Create;
begin
  inherited Create('N�o � permitido gerar o(s) selo(s) antes do recebimento.');
end;

end.
