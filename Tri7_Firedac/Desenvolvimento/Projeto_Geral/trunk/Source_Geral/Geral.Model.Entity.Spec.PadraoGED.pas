unit Geral.Model.Entity.Spec.PadraoGED;

interface

uses
  Geral.Model.Entity.Spec.Factory;

type
  IPrefixoFactory = interface(IFactory<string>)
    ['{21469714-1DCC-4A21-B680-963FF192D6ED}']
  end;

  ISufixoFactory = interface(IFactory<string>)
    ['{D8F22871-9FAA-46D0-A781-D94F1E3E9A14}']
  end;

  IExtensaoFactory = interface(IFactory<string>)
    ['{A4D87B7A-6599-4504-9385-54EDC4C4600F}']
  end;

implementation

end.
