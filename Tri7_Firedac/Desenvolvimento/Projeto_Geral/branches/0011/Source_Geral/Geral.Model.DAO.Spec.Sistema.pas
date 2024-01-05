unit Geral.Model.DAO.Spec.Sistema;

interface

uses
  Geral.Model.Entity.Spec.Sistema;

type
  ISistemaDAO = interface
    ['{8EC09856-5939-4A7B-B19C-16A404803204}']

    function ByID(
      const vpValue: Integer): ISistema;
  end;

implementation

end.
