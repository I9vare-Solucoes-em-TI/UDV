unit Geral.Controller.Animal;

interface

uses
  Data.DB,
  Geral.Model.Animal;

type
  TAnimalController = class
  public
    class function Buscar(
      const vpAnimalId: Integer): TAnimal;

    class function Excluir(
      const vpAnimalId: Integer): Integer;

    class function Salvar(
      const vpAnimal: TAnimal): Integer;

    class function Cadastrar(
      const vpAnimalId: Integer;
      const vpNome: String;
      const vpSexo: TEnSexo;
      const vpRaca: String;
      const vpCor: String;
      const vpSistemaId: Integer;
      const vpDataNascimento: TDateTime;
      const vpObservacao: String;
      const vpPele: String;
      const vpRegistroId: Integer;
      const vpEspecieId: Integer;
      const vpDataRegistro: TDateTime;
      const vpServicoTipoId: Integer): Integer;

    class function Consultar(
      const vpNome: String): TDataSet;
  end;

implementation

{ TAnimalController }

class function TAnimalController.Buscar(
  const vpAnimalId: Integer): TAnimal;
begin
  Result := TAnimalBusiness.Buscar(vpAnimalId);
end;

class function TAnimalController.Cadastrar(
  const vpAnimalId: Integer;
  const vpNome: String;
  const vpSexo: TEnSexo;
  const vpRaca: String;
  const vpCor: String;
  const vpSistemaId: Integer;
  const vpDataNascimento: TDateTime;
  const vpObservacao: String;
  const vpPele: String;
  const vpRegistroId: Integer;
  const vpEspecieId: Integer;
  const vpDataRegistro: TDateTime;
  const vpServicoTipoId: Integer): Integer;
begin
  Result := TAnimalBusiness.Cadastrar(
    vpAnimalId,
    vpNome,
    vpSexo,
    vpRaca,
    vpCor,
    vpSistemaId,
    vpDataNascimento,
    vpObservacao,
    vpPele,
    vpRegistroId,
    vpEspecieId,
    vpDataRegistro,
    vpServicoTipoId);
end;

class function TAnimalController.Consultar(
  const vpNome: String): TDataSet;
begin
  Result := TAnimalBusiness.Consultar(vpNome);
end;

class function TAnimalController.Excluir(
  const vpAnimalId: Integer): Integer;
begin
  Result := TAnimalBusiness.Excluir(vpAnimalId);
end;

class function TAnimalController.Salvar(
  const vpAnimal: TAnimal): Integer;
begin
  Result := TAnimalController.Salvar(vpAnimal);
end;

end.
