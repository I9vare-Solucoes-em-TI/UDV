unit SeloLoteDAO;

interface

uses
  DAO,
  SeloLote,
  SeloLoteList;

type
  ISeloLoteDAO = interface(IDAO<ISeloLote, TSeloLoteList>)
    ['{5AEDAB04-7666-485B-96C2-5309B01B07A0}']
  end;

implementation

end.
