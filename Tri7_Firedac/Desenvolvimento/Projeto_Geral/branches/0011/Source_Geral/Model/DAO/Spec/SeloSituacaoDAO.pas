unit SeloSituacaoDAO;

interface

uses
  DAO,
  SeloSituacao,
  SeloSituacaoList;

type
  ISeloSituacaoDAO = interface(IDAO<ISeloSituacao, TSeloSituacaoList>)
    ['{75CFFEB2-6DAB-4AF4-BD27-40806738CF36}']
  end;

implementation

end.
