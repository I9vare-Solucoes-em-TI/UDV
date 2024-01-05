unit AlteracaoItemSelosGeradosException;

interface

uses
  System.SysUtils;

type
  EAlteracaoItemSelosGeradosException = class(Exception)
  public
    constructor Create; reintroduce;
  end;

implementation

{ EAlteracaoItemSelosGeradosException }

constructor EAlteracaoItemSelosGeradosException.Create;
begin
  inherited Create('N�o � permitido alterar um item que tenha selos gerados.');
end;

end.
