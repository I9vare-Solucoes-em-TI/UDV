unit I9Register;

interface

procedure Register;

implementation

uses
  System.Classes,
  I9Connection,
  I9Query,
  I9StoredProc,
  I9Transaction,
  I9MemTable;

procedure Register;
begin
  RegisterComponents(
    'I9vare',
    [TI9Connection,
    TI9Query,
    TI9StoredProc,
    TI9Transaction,
    TI9MemTable]);
end;

end.
