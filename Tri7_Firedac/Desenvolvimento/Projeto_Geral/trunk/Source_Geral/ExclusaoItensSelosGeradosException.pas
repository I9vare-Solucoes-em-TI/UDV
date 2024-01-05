unit ExclusaoItensSelosGeradosException;

interface

uses
  System.SysUtils;

type
  EExclusaoItensSelosGeradosException = class(Exception)
  public
    constructor Create; reintroduce;
  end;

implementation

{ EExclusaoItensSelosGeradosException }

constructor EExclusaoItensSelosGeradosException.Create;
begin
  inherited Create('N�o � permitido excluir itens que tenham selos gerados.');
end;

end.
