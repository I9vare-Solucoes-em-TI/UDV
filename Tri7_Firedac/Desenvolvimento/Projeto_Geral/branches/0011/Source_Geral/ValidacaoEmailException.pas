unit ValidacaoEmailException;

interface

uses
  System.SysUtils;

type
  EValidacaoEmailException = class(Exception)
  private
    const CI_MSG: string = 'E-mail inválido.';
  public
    constructor Create; reintroduce;
  end;

implementation

{ EValidacaoEmailException }

constructor EValidacaoEmailException.Create;
begin
  inherited Create(CI_MSG);
end;

end.
