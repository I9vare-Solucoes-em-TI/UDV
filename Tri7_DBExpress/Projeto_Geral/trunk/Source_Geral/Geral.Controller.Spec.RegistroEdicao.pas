unit Geral.Controller.Spec.RegistroEdicao;

interface

uses
  System.JSON,
  Geral.Model.Entity.Spec.Maybe,
  Geral.Model.Entity.Spec.JSON;

type
  IRegistroEdicao = interface
    ['{8475AD31-2376-4FE7-8D6C-9C46E5368DA9}']

    function TryLock: IJSONAPI<TJSONObject>;
    function VerifyLock: IMaybe<IJSONAPI<TJSONObject>>;
  end;

  IDesbloqueioRegistroEdicao = interface
    ['{D6E11F28-1B46-4247-A05D-D9610AC81A1C}']

    function Unlock: Integer;
  end;

implementation

end.
