unit Geral.Model.Animal;

interface

uses
  Geral.Model.DAO,
  Data.DB,
  FireDAC.Stan.Param,
  System.Classes,
  System.Generics.Collections;

type
  TAnimal = class
  private
    FAnimalId: Integer;
    FNome: String;
    FSexo: String;
    FRaca: String;
    FCor: String;
    FSistemaId: Integer;
    FDataNascimento: TDateTime;
    FObservacao: String;
    FPele: String;
    FRegistroId: Integer;
    FEspecieId: Integer;
    FDataRegistro: TDateTime;
    FServicoTipoId: Integer;
  public
    property AnimalId: Integer read FAnimalId write FAnimalId;
    property Nome: String read FNome write FNome;
    property Sexo: String read FSexo write FSexo;
    property Raca: String read FRaca write FRaca;
    property Cor: String read FCor write FCor;
    property SistemaId: Integer read FSistemaId write FSistemaId;
    property DataNascimento: TDateTime read FDataNascimento write FDataNascimento;
    property Observacao: String read FObservacao write FObservacao;
    property Pele: String read FPele write FPele;
    property RegistroId: Integer read FRegistroId write FRegistroId;
    property EspecieId: Integer read FEspecieId write FEspecieId;
    property DataRegistro: TDateTime read FDataRegistro write FDataRegistro;
    property ServicoTipoId: Integer read FServicoTipoId write FServicoTipoId;
  end;

  TAnimalDAO = class(TDAO<TAnimal>)
  protected
    function CreateObject(
      const vpDataSet: TDataSet): TConfig; override;

    function GetTableName: string; override;
    function GetColumns: TArray<string>; override;

    procedure FillParams(
      const vpParams: TFDParams;
      const vpIndex: Integer;
      const vpValue: TConfig); override;
  end;

  TAnimalBusiness = class
  public
    class procedure  Salvar(
      const vpAnimal: TAnimal);
  end;

implementation

{ TAnimalDAO }

function TAnimalDAO.CreateObject(
  const vpDataSet: TDataSet): TConfig;
begin
  Result := TAnimal.Create;
  Result.AnimalId := vpDataSet.FieldByName('ANIMAL_ID').AsInteger;
  Result.Nome := vpDataSet.FieldByName('NOME').String;
  Result.Sexo := vpDataSet.FieldByName('SEXO').String;
  Result.Raca := vpDataSet.FieldByName('RACA').String;
  Result.Cor := vpDataSet.FieldByName('COR').String;
  Result.SistemaId := vpDataSet.FieldByName('SISTEMA_ID').Integer;
  Result.DataNascimento := vpDataSet.FieldByName('DATA_NASCIMENTO').TDateTime;
  Result.Observacao := vpDataSet.FieldByName('OBSERVACAO').String;
  Result.Pele := vpDataSet.FieldByName('PELE').String;
  Result.RegistroId := vpDataSet.FieldByName('REGISTRO_ID').Integer;
  Result.EspecieId := vpDataSet.FieldByName('ESPECIE_ID').Integer;
  Result.DataRegistro := vpDataSet.FieldByName('DATA_REGISTRO').TDateTime;
  Result.ServicoTipoId := vpDataSet.FieldByName('SERVICO_TIPO_ID').Integer;
end;

procedure TAnimalDAO.FillParams(
  const vpParams: TFDParams;
  const vpIndex: Integer;
  const vpValue: TConfig);
begin
  inherited;
  vpParams.ParamByName('ANIMAL_ID').AsIntegers[vpIndex] := vpValue.AnimalId;
  vpParams.ParamByName('NOME').Strings[vpIndex] := vpValue.Nome;
  vpParams.ParamByName('SEXO').Strings[vpIndex] := vpValue.Sexo;
  vpParams.ParamByName('RACA').Strings[vpIndex] := vpValue.Raca;
  vpParams.ParamByName('COR').Strings[vpIndex] := vpValue.Cor;
  vpParams.ParamByName('SISTEMA_ID').Integers[vpIndex] := vpValue.SistemaId;
  vpParams.ParamByName('DATA_NASCIMENTO').TDateTimes[vpIndex] := vpValue.DataNascimento;
  vpParams.ParamByName('OBSERVACAO').Strings[vpIndex] := vpValue.Observacao;
  vpParams.ParamByName('PELE').Strings[vpIndex] := vpValue.Pele;
  vpParams.ParamByName('REGISTRO_ID').Integers[vpIndex] := vpValue.RegistroId;
  vpParams.ParamByName('ESPECIE_ID').Integers[vpIndex] := vpValue.EspecieId;
  vpParams.ParamByName('DATA_REGISTRO').TDateTimes[vpIndex] := vpValue.DataRegistro;
  vpParams.ParamByName('SERVICO_TIPO_ID').Integers[vpIndex] := vpValue.ServicoTipoId;
end;

function TAnimalDAO.GetColumns: TArray<string>;
begin
  Result := [];
end;

function TAnimalDAO.GetTableName: string;
begin
  Result := 'G_ANIMAL';
end;

{ TAnimalBusiness }

class procedure TAnimalBusiness.Salvar(
  const vpAnimal: TAnimal);
var
  viAnimalDao: TAnimalDao;
  viInTransaction: Boolean;
begin
  viAnimalDao := TAnimalDao.Create(dtmControles.DB);
  try
    viInTransaction := dtmControles.DB.InTransaction;
    if not viInTransaction then
      dtmControles.DB.StartTransaction;
    try
      if vpAnimal.AnimalId = 0 then
      begin
        vpAnimal.AnimalId := dtmControles.GerarSequencia('G_ANIMAL');

        viAnimalDao.Insert(vpAnimal);
      end
      else
        viAnimalDao.Update(vpAnimal);

      if not viInTransaction then
        dtmControles.DB.Commit;
    except
      if not viInTransaction then
        dtmControles.DB.Rollback;

      raise;
    end;
  finally
    FreeAndNil(viAnimalDao);
  end;
end;

end.
