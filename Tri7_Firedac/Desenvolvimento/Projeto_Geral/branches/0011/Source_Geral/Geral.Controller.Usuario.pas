unit Geral.Controller.Usuario;

interface

uses
  System.Generics.Collections,
  Geral.Model.Usuario;

type
  TUsuarioController = class
  public
    class function Listar: TObjectList<TUsuario>;

    class function Buscar(
      const vpUsuarioId: Integer): TUsuario;

    class function BuscarNomeCompleto(
      const vpUsuarioID: Integer): string;
  end;

implementation

uses
  System.SysUtils;

{ TUsuarioController }

class function TUsuarioController.Buscar(
  const vpUsuarioId: Integer): TUsuario;
begin
  Result := TUsuarioBusiness.Buscar(vpUsuarioId);
end;

class function TUsuarioController.BuscarNomeCompleto(
  const vpUsuarioID: Integer): string;
begin
  Result := TUsuarioBusiness.BuscarNomeCompleto(vpUsuarioID);
end;

class function TUsuarioController.Listar: TObjectList<TUsuario>;
begin
  Result := TUsuarioBusiness.Listar;
end;

end.
