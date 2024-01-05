unit Geral.Controller.Spec.RegistroEdicao;

interface

uses
  Data.DB;

type
  IControleRegistroEdicao = interface
    ['{B12E4A05-4DEF-4063-93A3-BA892939F19C}']

    function Bloquear(
      const vpTabela: string;
      const vpChave: Integer;
      const vpCampo: string): TDataSet;

    function VerificarBloqueio(
      const vpTabela: string;
      const vpChave: Integer;
      const vpCampo: string;
      const vpTimeoutSegundos: Integer): TDataSet;

    function Desbloquear(
      const vpTabela: string;
      const vpChave: Integer;
      const vpCampo: string;
      const vpUsuarioID: Integer): Integer;
  end;

implementation

end.
