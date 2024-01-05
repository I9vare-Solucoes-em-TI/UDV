unit Geral.Model.Animal;

interface

uses
  Geral.Model.DAO,
  Data.DB,
  FireDAC.Stan.Param,
  System.Classes,
  System.Generics.Collections;

type
  TEnSexo = (
    enSexoMacho,
    enSexoFemea,
    enSexoIgnorado);

  TAnimal = class
  private
    FAnimalId: Integer;
    FNome: String;
    FSexo: TEnSexo;
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
    property Sexo: TEnSexo read FSexo write FSexo;
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

  TAnimalUtil = class
  public
    {$REGION 'Sexo'}
      class function EnumeradoSexo(
        const vpSexo: String): TEnSexo;

      class function ValorSexo(
        const vpEnSexo: TEnSexo): String;

      class function DescricaoSexo(
        const vpEnSexo: TEnSexo): String;
    {$ENDREGION}

    class function Preencher(
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
      const vpServicoTipoId: Integer): TAnimal;

  end;

  TAnimalDAO = class(TDAO<TAnimal>)
  protected
    function CreateObject(
      const vpDataSet: TDataSet): TAnimal; override;

    function GetTableName: string; override;
    function GetColumns: TArray<string>; override;

    procedure FillParams(
      const vpParams: TFDParams;
      const vpIndex: Integer;
      const vpValue: TAnimal); override;
  end;

  TAnimalBusiness = class
  public
    class function Buscar(
      const vpAnimalId: Integer): TAnimal;

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

    class function Excluir(
      const vpAnimalId: Integer): Integer;

    class function Salvar(
      const vpAnimal: TAnimal): Integer;

    class function Consultar(
      const vpNome: String): TDataSet; overload;
  end;

implementation

uses
  Controles,
  System.SysUtils,
  System.StrUtils;

const

  {$REGION 'Sexo do animal'}

  {$REGION 'CL_ENUMERADO_SEXO'}
  CL_ENUMERADO_SEXO: array[0..2] of TEnSexo = (
    enSexoMacho,
    enSexoFemea,
    enSexoIgnorado);
  {$ENDREGION}

  {$REGION 'CL_DESCRICAO_SEXO'}
  CL_DESCRICAO_SEXO: array[0..2] of string = (
    'Macho',
    'Fêmea',
    'Ignorado');
  {$ENDREGION}

  {$REGION 'CL_VALOR_SEXO'}
  CL_VALOR_SEXO: array[0..2] of string = (
    'M',
    'F',
    'I');
  {$ENDREGION}

  {$ENDREGION}

{ TAnimalDAO }

function TAnimalDAO.CreateObject(
  const vpDataSet: TDataSet): TAnimal;
begin
  Result := TAnimal.Create;
  Result.AnimalId := vpDataSet.FieldByName('ANIMAL_ID').AsInteger;
  Result.Nome := vpDataSet.FieldByName('NOME').AsString;
  Result.Sexo := TAnimalUtil.EnumeradoSexo(vpDataSet.FieldByName('SEXO').AsString);
  Result.Raca := vpDataSet.FieldByName('RACA').AsString;
  Result.Cor := vpDataSet.FieldByName('COR').AsString;
  Result.SistemaId := vpDataSet.FieldByName('SISTEMA_ID').AsInteger;
  Result.DataNascimento := vpDataSet.FieldByName('DATA_NASCIMENTO').AsDateTime;
  Result.Observacao := vpDataSet.FieldByName('OBSERVACAO').AsString;
  Result.Pele := vpDataSet.FieldByName('PELE').AsString;
  Result.RegistroId := vpDataSet.FieldByName('REGISTRO_ID').AsInteger;
  Result.EspecieId := vpDataSet.FieldByName('ESPECIE_ID').AsInteger;
  Result.DataRegistro := vpDataSet.FieldByName('DATA_REGISTRO').AsDateTime;
  Result.ServicoTipoId := vpDataSet.FieldByName('SERVICO_TIPO_ID').AsInteger;
end;

procedure TAnimalDAO.FillParams(
  const vpParams: TFDParams;
  const vpIndex: Integer;
  const vpValue: TAnimal);
begin
  inherited;
  vpParams.ParamByName('ANIMAL_ID').AsIntegers[vpIndex] := vpValue.AnimalId;
  vpParams.ParamByName('NOME').AsStrings[vpIndex] := vpValue.Nome;
  vpParams.ParamByName('SEXO').AsStrings[vpIndex] := TAnimalUtil.ValorSexo(vpValue.Sexo);
  vpParams.ParamByName('RACA').AsStrings[vpIndex] := vpValue.Raca;
  vpParams.ParamByName('COR').AsStrings[vpIndex] := vpValue.Cor;
  vpParams.ParamByName('SISTEMA_ID').AsIntegers[vpIndex] := vpValue.SistemaId;
  vpParams.ParamByName('DATA_NASCIMENTO').AsDateTimes[vpIndex] := vpValue.DataNascimento;
  vpParams.ParamByName('OBSERVACAO').AsStrings[vpIndex] := vpValue.Observacao;
  vpParams.ParamByName('PELE').AsStrings[vpIndex] := vpValue.Pele;
  vpParams.ParamByName('REGISTRO_ID').AsIntegers[vpIndex] := vpValue.RegistroId;

  if vpValue.EspecieId <= 0 then
  begin
    vpParams.ParamByName('ESPECIE_ID').AsIntegers[vpIndex] := 0;
    vpParams.ParamByName('ESPECIE_ID').Clear;
    vpParams.ParamByName('ESPECIE_ID').Bound := True;
  end
  else
    vpParams.ParamByName('ESPECIE_ID').AsIntegers[vpIndex] := vpValue.EspecieId;

  vpParams.ParamByName('DATA_REGISTRO').AsDateTimes[vpIndex] := vpValue.DataRegistro;
  vpParams.ParamByName('SERVICO_TIPO_ID').AsIntegers[vpIndex] := vpValue.ServicoTipoId;
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

class function TAnimalBusiness.Buscar(
  const vpAnimalId: Integer): TAnimal;
var
  viAnimalDAO: TAnimalDAO;
begin
  viAnimalDAO := nil;
  try
    viAnimalDAO := TAnimalDAO.Create(dtmControles.DB);
    Result := viAnimalDAO.GetByID(vpAnimalId);
  finally
    FreeAndNil(viAnimalDAO);
  end;
end;

class function TAnimalBusiness.Cadastrar(
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
var
  viAnimal: TAnimal;
  viDataRegistro: TDateTime;
begin
  Result := 0;

  if vpDataRegistro > 0 then
    viDataRegistro := vpDataRegistro
  else
    viDataRegistro := dtmControles.DataHoraBanco(3);

  viAnimal := nil;
  try
    viAnimal := TAnimalUtil.Preencher(
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
      viDataRegistro,
      vpServicoTipoId);

    Result := Salvar(viAnimal);
  finally
    FreeAndNil(viAnimal);
  end;
end;

class function TAnimalBusiness.Consultar(
  const vpNome: String): TDataSet;
var
  viAnimalDao: TAnimalDao;
begin
  viAnimalDao := nil;
  try
    viAnimalDao := TAnimalDao.Create(dtmControles.DB);

    Result := viAnimalDao.GetListAsDataSet(
      [],
      0,
      0,
      'NOME LIKE :P_NOME',
      [vpNome + '%'],
      'NOME');

  finally
    FreeAndNil(viAnimalDao);
  end;
end;

class function TAnimalBusiness.Excluir(
  const vpAnimalId: Integer): Integer;
var
  viAnimalDAO: TAnimalDAO;
begin
  Result := 0;

  viAnimalDAO := nil;
  try
    viAnimalDAO := TAnimalDAO.Create(dtmControles.DB);
    Result := viAnimalDAO.Delete(vpAnimalId);
  finally
    FreeAndNil(viAnimalDAO);
  end;
end;

class function TAnimalBusiness.Salvar(
  const vpAnimal: TAnimal): Integer;
var
  viAnimalDAO: TAnimalDAO;
  viInTransaction: Boolean;
begin
  Result := 0;

  viAnimalDAO := nil;
  try
    viAnimalDAO := TAnimalDAO.Create(dtmControles.DB);

    viInTransaction := dtmControles.DB.InTransaction;
    if not viInTransaction then
      dtmControles.DB.StartTransaction;
    try
      if vpAnimal.AnimalId = 0 then
        vpAnimal.AnimalId := dtmControles.GerarSequencia('G_ANIMAL');

      viAnimalDAO.Post(vpAnimal);

      Result := vpAnimal.AnimalId;

      if not viInTransaction then
        dtmControles.DB.Commit;

    except
      if not viInTransaction then
        dtmControles.DB.Rollback;

      raise;
    end;

  finally
    FreeAndNil(viAnimalDAO);
  end;
end;

{ TAnimalUtil }

class function TAnimalUtil.DescricaoSexo(
  const vpEnSexo: TEnSexo): String;
begin
  Result := CL_DESCRICAO_SEXO[Ord(vpEnSexo)];
end;

class function TAnimalUtil.EnumeradoSexo(
  const vpSexo: String): TEnSexo;
begin
  Result := CL_ENUMERADO_SEXO[IndexStr(vpSexo, CL_VALOR_SEXO)];
end;

class function TAnimalUtil.Preencher(
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
  const vpServicoTipoId: Integer): TAnimal;
begin
  Result := TAnimal.Create;
  Result.AnimalId := vpAnimalId;
  Result.Nome := vpNome;
  Result.Sexo := vpSexo;
  Result.Raca := vpRaca;
  Result.Cor := vpCor;
  Result.SistemaId := vpSistemaId;
  Result.DataNascimento := vpDataNascimento;
  Result.Observacao := vpObservacao;
  Result.Pele := vpPele;
  Result.RegistroId := vpRegistroId;
  Result.EspecieId := vpEspecieId;
  Result.DataRegistro := vpDataRegistro;
  Result.ServicoTipoId := vpServicoTipoId;
end;

class function TAnimalUtil.ValorSexo(
  const vpEnSexo: TEnSexo): String;
begin
  Result := CL_VALOR_SEXO[Ord(vpEnSexo)];
end;

end.
