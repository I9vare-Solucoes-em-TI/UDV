unit RegimeBensDAO;

interface

uses
  DAO,
  RegimeBens,
  RegimeBensList;

type
  IRegimeBensDAO = interface(IDAO<IRegimeBens, TRegimeBensList>)
    ['{F5452431-81BB-4DE7-B8CF-16CFC85C410B}']
  end;

implementation

end.
