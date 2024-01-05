unit Sequencia;

interface

type
  ISequencia = interface
    ['{F0633DE5-2EDC-4A8E-BA11-17B9148BD681}']

    function GetTabela: string;
    function GetSequencia: Integer;

    function Equals(
      const vpValue: ISequencia): Boolean;

    function NotEquals(
      const vpValue: ISequencia): Boolean;

    procedure SetTabela(
      const Value: string);

    procedure SetSequencia(
      const Value: Integer);

    property Tabela: string read GetTabela write SetTabela;
    property Sequencia: Integer read GetSequencia write SetSequencia;
  end;

implementation

end.
