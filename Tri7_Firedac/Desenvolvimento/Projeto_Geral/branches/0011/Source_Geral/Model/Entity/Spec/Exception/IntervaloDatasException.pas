unit IntervaloDatasException;

interface

uses
  System.SysUtils;

type
  EIntervaloDatasException = class(Exception)
  public
    constructor Create; reintroduce;
  end;

implementation

{ EIntervaloDatasException }

constructor EIntervaloDatasException.Create;
begin
  inherited Create('A data final não pode ser menor do que a data final.');
end;

end.
