unit ConfiguracaoGrupoDAOImpl;

interface

uses
  I9Query,
  I9Connection,
  ConfiguracaoGrupoDAO,
  Data.SqlExpr,
  Data.DB,
  ConfiguracaoGrupo,
  ConfiguracaoGrupoList,
  Sistema;

type
  TConfiguracaoGrupoDAO = class(TInterfacedObject, IConfiguracaoGrupoDAO)
  private
    FConnection: TI9Connection;
  public
    constructor Create(
      const vpConnection: TI9Connection); reintroduce;

    function Get(
      const vpValue: TDataSet): IConfiguracaoGrupo;

    function GetByID(
      const vpValue: Variant): IConfiguracaoGrupo; virtual; abstract;

    function GetList: TConfiguracaoGrupoList; overload; virtual; abstract;

    function GetList(
      const vpValue: ISistema): TConfiguracaoGrupoList; overload;

    procedure Inserir(
      const vpValue: IConfiguracaoGrupo); virtual; abstract;

    procedure Alterar(
      const vpValue: IConfiguracaoGrupo); virtual; abstract;

    procedure Excluir(
      const vpValue: IConfiguracaoGrupo); virtual; abstract;
  end;

implementation

uses
  System.SysUtils,
  ConfiguracaoGrupoImpl,
  SistemaDAOImpl,
  System.Classes,
  BooleanHelper;

{ TConfiguracaoGrupoDAO }

constructor TConfiguracaoGrupoDAO.Create(
  const vpConnection: TI9Connection);
begin
  inherited Create;
  FConnection := vpConnection;
end;

function TConfiguracaoGrupoDAO.Get(
  const vpValue: TDataSet): IConfiguracaoGrupo;
{$REGION 'Variáveis'}
var
  viField: TField;
  viSistemaDAO: TSistemaDAO;
{$ENDREGION}
begin
  Result := TConfiguracaoGrupo.Create;
  with vpValue, Result do
  begin
    viField := FindField('G_CG_CONFIG_GRUPO_ID');
    if Assigned(viField) then
      ConfiguracaoGrupoID := viField.AsInteger;

    viField := FindField('G_CG_DESCRICAO');
    if Assigned(viField) then
      Descricao := viField.AsString;

    viField := FindField('G_S_SISTEMA_ID');
    if Assigned(viField) then
    begin
      viSistemaDAO := TSistemaDAO.Create(FConnection);
      try
        Sistema := viSistemaDAO.Get(vpValue);
      finally
        FreeAndNil(viSistemaDAO);
      end;
    end;
  end;
end;

function TConfiguracaoGrupoDAO.GetList(
  const vpValue: ISistema): TConfiguracaoGrupoList;
{$REGION 'Constantes'}
const
  CI_CAPACITY: Integer = 7;
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viSQLDataSet: TI9Query;
  viSQL: TStrings;
  viConfiguracaoGrupo: IConfiguracaoGrupo;
{$ENDREGION}
begin
  Result := TConfiguracaoGrupoList.Create;

  viSQLDataSet := TI9Query.Create(nil);
  viSQLDataSet.Connection := FConnection;

  viSQL := TStringList.Create;
  viSQL.Capacity := CI_CAPACITY;

  try
    with viSQL do
    begin
      {$REGION 'Comando SQL SELECT'}
      Add('SELECT');

      {$REGION 'Colunas'}
      Add('G_CG.CONFIG_GRUPO_ID G_CG_CONFIG_GRUPO_ID,');
      Add('G_CG.DESCRICAO G_CG_DESCRICAO');
      {$ENDREGION}

      {$REGION 'Cláusula FROM'}
      Add('FROM');
      Add('G_CONFIG_GRUPO G_CG');
      {$ENDREGION}

      {$REGION 'Cláusula WHERE e Parâmetros'}
      Add('WHERE');
      Add('G_CG.SISTEMA_ID = :P_SISTEMA_ID;');
      {$ENDREGION}

      {$ENDREGION}
    end;

    with viSQLDataSet do
    begin
      SQL.Text := viSQL.Text;

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_SISTEMA_ID').AsInteger := vpValue.SistemaID;
      {$ENDREGION}

      Open;

      try
        if IsEmpty then
          Exit;

        First;
        while Eof.&Not do
          try
            viConfiguracaoGrupo := Get(viSQLDataSet);
            viConfiguracaoGrupo.Sistema := vpValue;
            Result.Add(viConfiguracaoGrupo);
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
    FreeAndNil(viSQL);
  end;
end;

end.
