unit SequenciaDAO;

interface

uses
  DAO,
  Sequencia,
  SequenciaList;

type
  ISequenciaDAO = interface(IDAO<ISequencia, TSequenciaList>)
    ['{722D261A-F7A6-4164-9683-7D736EF00135}']

    procedure AlterarSequencia(
      const vpValue: ISequencia);
  end;

implementation

end.
