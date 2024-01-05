unit RegraEnvioSelo;

interface

uses
  SeloGrupo;

type
  IRegraEnvioSelo = interface
    ['{378C1A43-F206-4C1E-9C1D-0A2522BF842F}']

    function GetRegraEnvioSeloID: Integer;
    function GetSeloGrupo: ISeloGrupo;
    function GetIntervalo: Integer;

    function Equals(
      const vpValue: IRegraEnvioSelo): Boolean;

    function NotEquals(
      const vpValue: IRegraEnvioSelo): Boolean;

    procedure SetRegraEnvioSeloID(
      const Value: Integer);

    procedure SetSeloGrupo(
      const Value: ISeloGrupo);

    procedure SetIntervalo(
      const Value: Integer);

    property RegraEnvioSeloID: Integer read GetRegraEnvioSeloID
      write SetRegraEnvioSeloID;

    property SeloGrupo: ISeloGrupo read GetSeloGrupo write SetSeloGrupo;
    property Intervalo: Integer read GetIntervalo write SetIntervalo;
  end;

implementation

end.
