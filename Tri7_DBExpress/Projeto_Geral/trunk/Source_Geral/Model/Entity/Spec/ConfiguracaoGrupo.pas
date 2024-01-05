unit ConfiguracaoGrupo;

interface

uses
  Sistema;

type
  IConfiguracaoGrupo = interface
    ['{63CFA3E0-23BD-40AF-A2D5-72248B406BC8}']

    function GetConfiguracaoGrupoID: Integer;
    function GetDescricao: string;
    function GetSistema: ISistema;

    function Equals(
      const vpValue: IConfiguracaoGrupo): Boolean;

    function NotEquals(
      const vpValue: IConfiguracaoGrupo): Boolean;

    procedure SetConfiguracaoGrupoID(
      const Value: Integer);

    procedure SetDescricao(
      const Value: string);

    procedure SetSistema(
      const Value: ISistema);

    property ConfiguracaoGrupoID: Integer read GetConfiguracaoGrupoID
      write SetConfiguracaoGrupoID;

    property Descricao: string read GetDescricao write SetDescricao;
    property Sistema: ISistema read GetSistema write SetSistema;
  end;

implementation

end.
