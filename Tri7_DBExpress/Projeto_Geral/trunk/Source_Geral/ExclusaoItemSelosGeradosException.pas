unit ExclusaoItemSelosGeradosException;

interface

uses
  System.SysUtils;

type
  EExclusaoItemSelosGeradosException = class(Exception)
  public
    constructor Create; reintroduce;
  end;

implementation

{ EExclusaoItemSelosGeradosException }

constructor EExclusaoItemSelosGeradosException.Create;
begin
  inherited Create('N�o � permitido excluir um item que tenha selos gerados.');
end;

end.
