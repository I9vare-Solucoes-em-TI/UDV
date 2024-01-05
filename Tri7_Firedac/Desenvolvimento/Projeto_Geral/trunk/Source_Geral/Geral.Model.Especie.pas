unit Geral.Model.Especie;

interface

uses
  Geral.Model.DAO,
  Data.DB,
  FireDAC.Stan.Param,
  System.Classes,
  System.Generics.Collections;

type
  TEspecie = class
  private
    FEspecieId: Integer;
    FDescricao: string;
    FCategoria: string;
  public
    property EspecieId: Integer read FEspecieId write FEspecieId;
    property Descricao: string read FDescricao write FDescricao;
    property Categoria: string read FCategoria write FCategoria;
  end;

  TEspecieUtil = class
  public
    class function Preencher(
      vpEspecieId: Integer;
      vpDescricao: string;
      vpCategoria: string): TEspecie;
  end;

  TEspecieDAO = class(TDAO<TEspecie>)
  public
    function CreateObject(
      const vpDataSet: TDataSet): TEspecie; override;

    function GetTableName: string; override;
    function GetColumns: TArray<string>; override;

    procedure FillParams(
      const vpParams: TFDParams;
      const vpIndex: Integer;
      const vpValue: TEspecie); override;
  end;

  TEspecieBusiness = class
  public
    class function Buscar(
      const vpEspecieId: Integer): TEspecie;

    class function BuscarDescricao(
      const vpEspecieId: Integer): String;

    class function Consultar: TDataSet;
  end;

implementation

uses
  Controles,
  I9Query,
  System.SysUtils;

{ TEspecieUtil }

class function TEspecieUtil.Preencher(
  vpEspecieId: Integer;
  vpDescricao: string;
  vpCategoria: string): TEspecie;
begin
  Result := TEspecie.Create;
  Result.EspecieId := vpEspecieId;
  Result.Descricao := vpDescricao;
  Result.Categoria := vpCategoria;
end;

{ TEspecieDAO }

function TEspecieDAO.CreateObject(
  const vpDataSet: TDataSet): TEspecie;
begin
  Result := TEspecieUtil.Preencher(
    vpDataSet.FieldByName('ESPECIE_ID').AsInteger,
    vpDataSet.FieldByName('DESCRICAO').AsString,
    vpDataSet.FieldByName('CATEGORIA').AsString);
end;

procedure TEspecieDAO.FillParams(
  const vpParams: TFDParams;
  const vpIndex: Integer;
  const vpValue: TEspecie);
begin
  inherited;
  vpParams.ParamByName('ESPECIE_ID').AsIntegers[vpIndex] := vpValue.EspecieId;
  vpParams.ParamByName('DESCRICAO').AsStrings[vpIndex] := vpValue.Descricao;
  vpParams.ParamByName('CATEGORIA').AsStrings[vpIndex] := vpValue.Categoria;
end;

function TEspecieDAO.GetColumns: TArray<string>;
begin
  Result := [];
end;

function TEspecieDAO.GetTableName: string;
begin
  Result := 'G_ESPECIE';
end;

{ TEspecieBusiness }

class function TEspecieBusiness.Buscar(
  const vpEspecieId: Integer): TEspecie;
var
  viEspecieDao: TEspecieDAO;
begin
  viEspecieDao := nil;
  try
    viEspecieDao := TEspecieDAO.Create(dtmControles.DB);
    Result := viEspecieDao.GetByID(vpEspecieId);
  finally
    FreeAndNil(viEspecieDao)
  end;
end;

class function TEspecieBusiness.BuscarDescricao(
  const vpEspecieId: Integer): String;
var
  viEspecie: TEspecie;
begin
  Result := '';

  viEspecie := nil;
  try
    viEspecie := Buscar(vpEspecieId);

    if viEspecie = nil then
      Exit;

    Result := viEspecie.Descricao;

  finally
    FreeAndNil(viEspecie);
  end;
end;

class function TEspecieBusiness.Consultar: TDataSet;
var
  viEspecieDao: TEspecieDAO;
begin
  viEspecieDao := nil;
  try
    viEspecieDao := TEspecieDAO.Create(dtmControles.DB);

    Result := viEspecieDao.getListAsDataSet(
      [],
      0,
      0,
      '',
      [],
      'ESPECIE_ID');

  finally
    FreeAndNil(viEspecieDao)
  end;
end;

end.
