unit Geral.Controller.Sistema;

interface

uses
  System.Generics.Collections,
  Geral.Model.Sistema;

type
  TSistemaController = class
  public
    class function Buscar(
      const vpSistemaId: Integer): TSistema;

    class function BuscarNomeSistema(
      const vpSistemaId: Integer): string;

    class function Listar: TObjectList<TSistema>; overload;

    class function Listar(
      const vpSituacao: String): TObjectList<TSistema>; overload;
  end;

implementation

{ TSistemaController }

class function TSistemaController.Listar: TObjectList<TSistema>;
begin
  Result := TSistemaBusiness.Listar;
end;

class function TSistemaController.Buscar(
  const vpSistemaId: Integer): TSistema;
begin
  Result := TSistemaBusiness.Buscar(vpSistemaId);
end;

class function TSistemaController.BuscarNomeSistema(
  const vpSistemaId: Integer): string;
begin
  Result := TSistemaBusiness.BuscarNomeSistema(
    vpSistemaId);
end;

class function TSistemaController.Listar(
  const vpSituacao: String): TObjectList<TSistema>;
begin
  Result := TSistemaBusiness.Listar(vpSituacao);
end;

end.
