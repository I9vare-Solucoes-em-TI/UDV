unit EstadoCivil;

interface

uses
  Sistema;

type
  IEstadoCivil = interface
    ['{20E4D87B-B509-4C14-84FB-73333F8E5C22}']

    function GetEstadoCivilID: Integer;
    function GetDescricao: string;
    function GetSituacao: Boolean;
    function GetSistema: ISistema;

    function Equals(
      const vpValue: IEstadoCivil): Boolean;

    function NotEquals(
      const vpValue: IEstadoCivil): Boolean;

    procedure SetEstadoCivilID(
      const Value: Integer);

    procedure SetDescricao(
      const Value: string);

    procedure SetSituacao(
      const Value: Boolean);

    procedure SetSistema(
      const Value: ISistema);

    property EstadoCivilID: Integer read GetEstadoCivilID
      write SetEstadoCivilID;

    property Descricao: string read GetDescricao write SetDescricao;
    property Situacao: Boolean read GetSituacao write SetSituacao;
    property Sistema: ISistema read GetSistema write SetSistema;
  end;

implementation

end.
