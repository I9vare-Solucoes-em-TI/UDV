unit UFListSimpleFactory;

interface

uses
  System.Classes;

type
  TUFListSimpleFactory = class sealed
  public
    class function Get: TStrings; static;
  end;

implementation

{ TUFListSimpleFactory }

class function TUFListSimpleFactory.Get: TStrings;
{$REGION 'Constantes'}
const
  CI_CAPACITY: Integer = 27;
{$ENDREGION}
begin
  Result := TStringList.Create;
  with Result do
  begin
    Capacity := CI_CAPACITY;

    Add('AC');
    Add('AL');
    Add('AM');
    Add('AP');
    Add('BA');
    Add('CE');
    Add('DF');
    Add('ES');
    Add('GO');
    Add('MA');
    Add('MG');
    Add('MS');
    Add('MT');
    Add('PA');
    Add('PB');
    Add('PE');
    Add('PR');
    Add('PI');
    Add('RJ');
    Add('RN');
    Add('RO');
    Add('RR');
    Add('RS');
    Add('SC');
    Add('SE');
    Add('SP');
    Add('TO');
  end;
end;

end.
