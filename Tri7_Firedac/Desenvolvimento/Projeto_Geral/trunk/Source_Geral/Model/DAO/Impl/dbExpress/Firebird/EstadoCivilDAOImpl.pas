unit EstadoCivilDAOImpl;

interface

uses
  I9Query,
  I9Connection,
  EstadoCivilDAO,
  Data.SqlExpr,
  Data.DB,
  EstadoCivil,
  EstadoCivilList,
  Sistema;

type
  TEstadoCivilDAO = class(TInterfacedObject, IEstadoCivilDAO)
  private
    FConnection: TI9Connection;
  public
    constructor Create(
      const vpValue: TI9Connection); reintroduce;

    function Get(
      const vpValue: TDataSet): IEstadoCivil; overload;

    function Get(
      const vpValue: TDataSet;
      const vpPrefix: string): IEstadoCivil; overload;

    function GetByID(
      const vpValue: Variant): IEstadoCivil; virtual; abstract;

    function GetList: TEstadoCivilList; virtual; abstract;

    function GetListBySistemaESituacao(
      const vpSistema: ISistema;
      const vpSituacao: Boolean): TEstadoCivilList;

    procedure Inserir(
      const vpValue: IEstadoCivil); virtual; abstract;

    procedure Alterar(
      const vpValue: IEstadoCivil); virtual; abstract;

    procedure Excluir(
      const vpValue: IEstadoCivil); virtual; abstract;
  end;

implementation

uses
  EstadoCivilImpl,
  SistemaDAOImpl,
  System.SysUtils,
  BooleanHelper,
  System.Classes;

{ TEstadoCivilDAO }

constructor TEstadoCivilDAO.Create(
  const vpValue: TI9Connection);
begin
  inherited Create;
  FConnection := vpValue;
end;

function TEstadoCivilDAO.Get(
  const vpValue: TDataSet): IEstadoCivil;
{$REGION 'Variáveis'}
var
  viField: TField;
  viSistemaDAO: TSistemaDAO;
{$ENDREGION}
begin
  Result := TEstadoCivil.Create;
  with vpValue, Result do
  begin
    viField := FindField('G_EC_TB_ESTADOCIVIL_ID');
    if Assigned(viField) then
      EstadoCivilID := viField.AsInteger;

    viField := FindField('G_EC_DESCRICAO');
    if Assigned(viField) then
      Descricao := viField.AsString;

    viField := FindField('G_EC_SITUACAO');
    if Assigned(viField) then
      Situacao := Boolean.FromStringAtivoInativo(viField.AsString);

    viField := FindField('G_S_SISTEMA_ID');
    if Assigned(viField) and
      viField.IsNull.&Not then
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

function TEstadoCivilDAO.Get(
  const vpValue: TDataSet;
  const vpPrefix: string): IEstadoCivil;
{$REGION 'Variáveis'}
var
  viField: TField;
  viSistemaDAO: TSistemaDAO;
{$ENDREGION}
begin
  Result := TEstadoCivil.Create;
  with vpValue, Result do
  begin
    viField := FindField(string.Format('G_EC%s_TB_ESTADOCIVIL_ID', [vpPrefix]));
    if Assigned(viField) then
      EstadoCivilID := viField.AsInteger;

    viField := FindField(string.Format('G_EC%s_DESCRICAO', [vpPrefix]));
    if Assigned(viField) then
      Descricao := viField.AsString;

    viField := FindField(string.Format('G_EC%s_SITUACAO', [vpPrefix]));
    if Assigned(viField) then
      Situacao := Boolean.FromStringAtivoInativo(viField.AsString);

    viField := FindField(string.Format('G_S%s_SISTEMA_ID', [vpPrefix]));
    if Assigned(viField) and
      viField.IsNull.&Not then
    begin
      viSistemaDAO := TSistemaDAO.Create(FConnection);
      try
        Sistema := viSistemaDAO.Get(vpValue, vpPrefix);
      finally
        FreeAndNil(viSistemaDAO);
      end;
    end;
  end;
end;

function TEstadoCivilDAO.GetListBySistemaESituacao(
  const vpSistema: ISistema;
  const vpSituacao: Boolean): TEstadoCivilList;
{$REGION 'Constantes'}
const
  CI_CAPACITY: Integer = 8;
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viSQL: TStrings;
  viSQLText: string;
  viSQLDataSet: TI9Query;
  viEstadoCivil: IEstadoCivil;
{$ENDREGION}
begin
  Result := TEstadoCivilList.Create;
  viSQL := TStringList.Create;

  try
    with viSQL do
    begin
      Capacity := CI_CAPACITY;

      {$REGION 'Comando SQL SELECT'}
      Add('SELECT');

      {$REGION 'Colunas'}
      Add('G_EC.TB_ESTADOCIVIL_ID G_EC_TB_ESTADOCIVIL_ID,');
      Add('G_EC.DESCRICAO G_EC_DESCRICAO');
      {$ENDREGION}

      {$REGION 'Cláusula FROM'}
      Add('FROM');
      Add('G_TB_ESTADOCIVIL G_EC');
      {$ENDREGION}

      {$REGION 'Cláusula WHERE e Parâmetros'}
      Add('WHERE');
      Add('G_EC.SISTEMA_ID = :P_SISTEMA_ID AND');
      Add('G_EC.SITUACAO = :P_SITUACAO');
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

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_SISTEMA_ID').AsInteger := vpSistema.SistemaID;
      ParamByName('P_SITUACAO').AsString := vpSituacao.ToCharAtivoInativo;
      {$ENDREGION}

      Open;
      try
        if IsEmpty then
          Exit;

        First;
        while Eof.&Not do
          try
            viEstadoCivil := Get(viSQLDataSet);
            viEstadoCivil.Sistema := vpSistema;
            viEstadoCivil.Situacao := vpSituacao;
            Result.Add(viEstadoCivil);
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
