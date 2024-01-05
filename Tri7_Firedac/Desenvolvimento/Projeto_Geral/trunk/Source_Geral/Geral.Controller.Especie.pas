unit Geral.Controller.Especie;

interface

uses
  Data.DB,
  Geral.Model.Especie;

type
  TEspecieController = class
  public
    class function Buscar(
      const vpEspecieId: Integer): TEspecie;

    class function BuscarDescricao(
      const vpEspecieId: Integer): string;

    class function Consultar: TDataSet;
  end;

implementation

{ TEspecieController }

class function TEspecieController.Buscar(
  const vpEspecieId: Integer): TEspecie;
begin
  Result := TEspecieBusiness.Buscar(vpEspecieId);
end;

class function TEspecieController.BuscarDescricao(
  const vpEspecieId: Integer): string;
begin
  Result := TEspecieBusiness.BuscarDescricao(vpEspecieId);
end;

class function TEspecieController.Consultar: TDataSet;
begin
  Result := TEspecieBusiness.Consultar;
end;

end.
