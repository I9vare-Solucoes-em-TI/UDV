unit SistemaDAOImpl;

interface

uses
  SistemaDAO,
  Data.SqlExpr,
  Data.DB,
  Sistema,
  SistemaList;

type
  TSistemaDAO = class(TInterfacedObject, ISistemaDAO)
  private
    FSQLConnection: TSQLConnection;
  public
    constructor Create(
      const vpSQLConnection: TSQLConnection); reintroduce;

    function Get(
      const vpValue: TDataSet): ISistema; overload;

    function Get(
      const vpValue: TDataSet;
      const vpPrefix: string): ISistema; overload;

    function GetByID(
      const vpValue: Variant): ISistema;

    function GetList: TSistemaList; virtual; abstract;

    class function GetColunas(
      const vpPrefix: string = ''): string; static;

    procedure Inserir(
      const vpValue: ISistema); virtual; abstract;

    procedure Alterar(
      const vpValue: ISistema); virtual; abstract;

    procedure Excluir(
      const vpValue: ISistema); virtual; abstract;
  end;

implementation

uses
  SistemaImpl,
  System.SysUtils,
  BooleanHelper,
  System.Classes;

{ TSistemaDAO }

constructor TSistemaDAO.Create(
  const vpSQLConnection: TSQLConnection);
begin
  inherited Create;
  FSQLConnection := vpSQLConnection;
end;

function TSistemaDAO.Get(
  const vpValue: TDataSet): ISistema;
{$REGION 'Variáveis'}
var
  viField: TField;
{$ENDREGION}
begin
  Result := TSistema.Create;

  with vpValue, Result do
  begin
    viField := FindField('G_S_SISTEMA_ID');
    if Assigned(viField) then
      SistemaID := viField.AsInteger;

    viField := FindField('G_S_DESCRICAO');
    if Assigned(viField) then
      Descricao := viField.AsString;

    viField := FindField('G_S_SITUACAO');
    if Assigned(viField) then
      Situacao := Boolean.FromStringAtivoInativo(viField.AsString);

    viField := FindField('G_S_VERSAO');
    if Assigned(viField) then
      Versao := viField.AsString;
  end;
end;

function TSistemaDAO.Get(
  const vpValue: TDataSet;
  const vpPrefix: string): ISistema;
{$REGION 'Variáveis'}
var
  viField: TField;
{$ENDREGION}
begin
  Result := TSistema.Create;

  with vpValue, Result do
  begin
    viField := FindField(string.Format('G_S%s_SISTEMA_ID', [vpPrefix]));
    if Assigned(viField) then
      SistemaID := viField.AsInteger;

    viField := FindField(string.Format('G_S%s_DESCRICAO', [vpPrefix]));
    if Assigned(viField) then
      Descricao := viField.AsString;

    viField := FindField(string.Format('G_S%s_SITUACAO', [vpPrefix]));
    if Assigned(viField) then
      Situacao := Boolean.FromStringAtivoInativo(viField.AsString);

    viField := FindField(string.Format('G_S%s_VERSAO', [vpPrefix]));
    if Assigned(viField) then
      Versao := viField.AsString;
  end;
end;

function TSistemaDAO.GetByID(
  const vpValue: Variant): ISistema;
{$REGION 'Constantes'}
const
  CI_CAPACITY: Integer = 8;
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viSQLDataSet: TSQLDataSet;
  viSQL: TStrings;
{$ENDREGION}
begin
  Result := nil;

  viSQLDataSet := TSQLDataSet.Create(nil);
  viSQLDataSet.SQLConnection := FSQLConnection;

  viSQL := TStringList.Create;
  viSQL.Capacity := CI_CAPACITY;

  try
    with viSQLDataSet do
    begin
      with viSQL do
      begin
        {$REGION 'Comando SQL SELECT'}
        Add('SELECT');

        {$REGION 'Colunas'}
        Add('G_S.DESCRICAO G_S_DESCRICAO,');
        Add('G_S.SITUACAO G_S_SITUACAO,');
        Add('G_S.VERSAO G_S_VERSAO');
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        Add('FROM');
        Add('G_SISTEMA G_S');
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        Add('WHERE');
        Add('G_S.SISTEMA_ID = :P_SISTEMA_ID;');
        {$ENDREGION}

        {$ENDREGION}
      end;

      CommandText := viSQL.Text;

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_SISTEMA_ID').AsInteger := vpValue;
      {$ENDREGION}

      Open;

      try
        if IsEmpty then
          Exit;

        First;
        Result := Get(viSQLDataSet);
        Result.SistemaID := vpValue;
      finally
        Close;
      end;
    end;
  finally
    FreeAndNil(viSQLDataSet);
    FreeAndNil(viSQL);
  end;
end;

class function TSistemaDAO.GetColunas(
  const vpPrefix: string): string;
begin
  Result := {$REGION 'Colunas'}
    string.Format('G_S%s.SISTEMA_ID G_S%s_SISTEMA_ID, ', [vpPrefix, vpPrefix]) +
    string.Format('G_S%s.DESCRICAO G_S%s_DESCRICAO, ', [vpPrefix, vpPrefix]) +
    string.Format('G_S%s.SITUACAO G_S%s_SITUACAO, ', [vpPrefix, vpPrefix]) +
    string.Format('G_S%s.VERSAO G_S%s_VERSAO', [vpPrefix, vpPrefix]);
  {$ENDREGION}
end;

end.
