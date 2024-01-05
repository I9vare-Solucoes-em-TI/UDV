unit ConfiguracaoDAOImpl;

interface

uses
  ConfiguracaoDAO,
  Data.SqlExpr,
  Data.DB,
  Configuracao,
  ConfiguracaoList,
  ConfiguracaoGrupoList;

type
  TConfiguracaoDAO = class(TInterfacedObject, IConfiguracaoDAO)
  private
    FSQLConnection: TSQLConnection;
  public
    constructor Create(
      const vpSQLConnection: TSQLConnection); reintroduce;

    function Get(
      const vpValue: TDataSet): IConfiguracao;

    function GetByID(
      const vpValue: Variant): IConfiguracao; virtual; abstract;

    function GetList: TConfiguracaoList; overload; virtual; abstract;

    function GetList(
      const vpConfiguracaoGrupoList: TConfiguracaoGrupoList):
        TConfiguracaoList; overload;

    procedure Inserir(
      const vpValue: IConfiguracao); virtual; abstract;

    procedure Alterar(
      const vpValue: IConfiguracao); virtual; abstract;

    procedure Excluir(
      const vpValue: IConfiguracao); virtual; abstract;
  end;

implementation

uses
  ConfiguracaoImpl,
  ConfiguracaoGrupoDAOImpl,
  System.SysUtils,
  System.Classes,
  IntegerList,
  IntegerListHelper,
  ConfiguracaoGrupoListHelper,
  BooleanHelper;

{ TConfiguracaoDAO }

constructor TConfiguracaoDAO.Create(
  const vpSQLConnection: TSQLConnection);
begin
  inherited Create;
  FSQLConnection := vpSQLConnection;
end;

function TConfiguracaoDAO.Get(
  const vpValue: TDataSet): IConfiguracao;
{$REGION 'Variáveis'}
var
  viField: TField;
  viConfiguracaoGrupoDAO: TConfiguracaoGrupoDAO;
{$ENDREGION}
begin
  Result := TConfiguracao.Create;
  with vpValue, Result do
  begin
    viField := FindField('G_C_CONFIG_ID');
    if Assigned(viField) then
      ConfiguracaoID := viField.AsInteger;

    viField := FindField('G_CG_CONFIG_GRUPO_ID');
    if Assigned(viField) then
    begin
      viConfiguracaoGrupoDAO := TConfiguracaoGrupoDAO.Create(FSQLConnection);
      try
        ConfiguracaoGrupo := viConfiguracaoGrupoDAO.Get(vpValue);
      finally
        FreeAndNil(viConfiguracaoGrupoDAO);
      end;
    end;

    viField := FindField('G_C_SECAO');
    if Assigned(viField) then
      Secao := viField.AsString;

    viField := FindField('G_C_NOME');
    if Assigned(viField) then
      Nome := viField.AsString;

    viField := FindField('G_C_VALOR');
    if Assigned(viField) then
      Valor := viField.AsString;

    viField := FindField('G_C_DESCRICAO');
    if Assigned(viField) then
      Descricao := viField.AsString;

    viField := FindField('G_C_TEXTO');
    if Assigned(viField) then
      Texto := viField.AsString;
  end;
end;

function TConfiguracaoDAO.GetList(
  const vpConfiguracaoGrupoList: TConfiguracaoGrupoList): TConfiguracaoList;
{$REGION 'Constantes'}
const
  CI_CAPACITY: Integer = 11;
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viSQLDataSet: TSQLDataSet;
  viSQL: TStrings;
  viListConfiguracaoGrupoID: TIntegerList;
  viConfiguracao: IConfiguracao;
{$ENDREGION}
begin
  Result := TConfiguracaoList.Create;

  viSQLDataSet := TSQLDataSet.Create(nil);
  viSQLDataSet.SQLConnection := FSQLConnection;

  viSQL := TStringList.Create;
  viSQL.Capacity := CI_CAPACITY;

  viListConfiguracaoGrupoID := vpConfiguracaoGrupoList.
    GetListConfiguracaoGrupoID;

  try
    with viSQL do
    begin
      {$REGION 'Comando SQL SELECT'}
      Add('SELECT');

      {$REGION 'Colunas'}
      Add('G_C.CONFIG_ID G_C_CONFIG_ID,');
      Add('G_C.CONFIG_GRUPO_ID G_C_CONFIG_GRUPO_ID,');
      Add('G_C.SECAO G_C_SECAO,');
      Add('G_C.NOME G_C_NOME,');
      Add('G_C.VALOR G_C_VALOR,');
      Add('G_C.DESCRICAO G_C_DESCRICAO,');
      Add('G_C.TEXTO G_C_TEXTO');
      {$ENDREGION}

      {$REGION 'Cláusula FROM'}
      Add('FROM');
      Add('G_CONFIG G_C');
      {$ENDREGION}

      {$REGION 'Cláusula WHERE e Parâmetros'}
      Add('WHERE');
      Add('G_C.CONFIG_GRUPO_ID IN (' +
        viListConfiguracaoGrupoID.ToString + ');')
      {$ENDREGION}

      {$ENDREGION}
    end;

    with viSQLDataSet do
    begin
      CommandText := viSQL.Text;
      Open;

      try
        if IsEmpty then
          Exit;

        First;
        while Eof.&Not do
          try
            viConfiguracao := Get(viSQLDataSet);

            viConfiguracao.ConfiguracaoGrupo := vpConfiguracaoGrupoList.
              GetByConfiguracaoGrupoID(FieldByName(
                'G_C_CONFIG_GRUPO_ID').AsInteger);

            Result.Add(viConfiguracao);
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
    FreeAndNil(viListConfiguracaoGrupoID);
  end;
end;

end.
