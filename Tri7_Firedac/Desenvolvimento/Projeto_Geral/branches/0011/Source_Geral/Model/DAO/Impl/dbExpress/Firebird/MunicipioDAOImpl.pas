unit MunicipioDAOImpl;

interface

uses
  I9Query,
  I9Connection,
  MunicipioDAO,
  Data.SqlExpr,
  Data.DB,
  Municipio,
  MunicipioList;

type
  TMunicipioDAO = class(TInterfacedObject, IMunicipioDAO)
  private
    FConnection: TI9Connection;
  public
    constructor Create(
      const vpConnection: TI9Connection); reintroduce;

    function Get(
      const vpValue: TDataSet): IMunicipio; overload;

    function Get(
      const vpValue: TDataSet;
      const vpPrefix: string): IMunicipio; overload;

    function GetByID(
      const vpValue: Variant): IMunicipio; virtual; abstract;

    function GetList: TMunicipioList;

    procedure Inserir(
      const vpValue: IMunicipio); virtual; abstract;

    procedure Alterar(
      const vpValue: IMunicipio); virtual; abstract;

    procedure Excluir(
      const vpValue: IMunicipio); virtual; abstract;
  end;

implementation

uses
  MunicipioImpl,
  System.SysUtils,
  System.Classes,
  BooleanHelper;

{ TMunicipioDAO }

constructor TMunicipioDAO.Create(
  const vpConnection: TI9Connection);
begin
  inherited Create;
  FConnection := vpConnection;
end;

function TMunicipioDAO.Get(
  const vpValue: TDataSet): IMunicipio;
{$REGION 'Variáveis'}
var
  viField: TField;
{$ENDREGION}
begin
  Result := TMunicipio.Create;
  with vpValue, Result do
  begin
    viField := FindField('G_M_MUNICIPIO_ID');
    if Assigned(viField) then
      MunicipioID := viField.AsInteger;

    viField := FindField('G_M_MUNICIPIO');
    if Assigned(viField) then
      Municipio := viField.AsString;

    viField := FindField('G_M_CODIGO_IBGE');
    if Assigned(viField) then
      CodigoIBGE := viField.AsString;

    viField := FindField('G_M_SIGLA');
    if Assigned(viField) then
      Sigla := viField.AsString;
  end;
end;

function TMunicipioDAO.Get(
  const vpValue: TDataSet;
  const vpPrefix: string): IMunicipio;
{$REGION 'Variáveis'}
var
  viField: TField;
{$ENDREGION}
begin
  Result := TMunicipio.Create;
  with vpValue, Result do
  begin
    viField := FindField(string.Format('G_M%s_MUNICIPIO_ID', [vpPrefix]));
    if Assigned(viField) then
      MunicipioID := viField.AsInteger;

    viField := FindField(string.Format('G_M%s_MUNICIPIO', [vpPrefix]));
    if Assigned(viField) then
      Municipio := viField.AsString;

    viField := FindField(string.Format('G_M%s_CODIGO_IBGE', [vpPrefix]));
    if Assigned(viField) then
      CodigoIBGE := viField.AsString;

    viField := FindField(string.Format('G_M%s_SIGLA', [vpPrefix]));
    if Assigned(viField) then
      Sigla := viField.AsString;
  end;
end;

function TMunicipioDAO.GetList: TMunicipioList;
{$REGION 'Constantes'}
const
  CI_CAPACITY: Integer = 7;
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viSQL: TStrings;
  viSQLText: string;
  viSQLDataSet: TI9Query;
  viMunicipio: IMunicipio;
{$ENDREGION}
begin
  Result := TMunicipioList.Create;

  viSQL := TStringList.Create;
  try
    with viSQL do
    begin
      Capacity := CI_CAPACITY;

      {$REGION 'Comando SQL SELECT'}
      Add('SELECT');

      {$REGION 'Colunas'}
      Add('G_M.MUNICIPIO_ID G_M_MUNICIPIO_ID,');
      Add('G_M.MUNICIPIO G_M_MUNICIPIO,');
      Add('G_M.CODIGO_IBGE G_M_CODIGO_IBGE,');
      Add('G_M.SIGLA G_M_SIGLA');
      {$ENDREGION}

      {$REGION 'Cláusula FROM'}
      Add('FROM');
      Add('G_MUNICIPIO G_M');
      {$ENDREGION}

      {$ENDREGION}

      viSQLText := Text;
    end;
  finally
    FreeAndNil(viSQL);
  end;

  viSQLDataSet := TI9Query.Create(nil);
  try
    with viSQLDataSet do
    begin
      Connection := FConnection;
      SQL.Text := viSQLText;
      Open;

      try
        if IsEmpty then
          Exit;

        First;
        while Eof.&Not do
          try
            viMunicipio := Get(viSQLDataSet);
            Result.Add(viMunicipio);
          finally
            Next;
          end;

        Result.TrimExcess;
      finally
        Close;
      end;
    end;
  finally
    FreeAndNil(viSQLDataSet);
  end;
end;

end.
