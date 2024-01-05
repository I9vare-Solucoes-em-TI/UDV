unit RegraEnvioSeloDAOImpl;

interface

uses
  RegraEnvioSeloDAO,
  Data.SqlExpr,
  Data.DB,
  RegraEnvioSelo,
  RegraEnvioSeloList,
  SeloGrupo;

type
  TRegraEnvioSeloDAO = class(TInterfacedObject, IRegraEnvioSeloDAO)
  private
    FSQLConnection: TSQLConnection;

    procedure PreencherParametros(
      const vpParams: TParams;
      const vpValue: IRegraEnvioSelo);
  public
    constructor Create(
      const vpSQLConnection: TSQLConnection); reintroduce;

    function Get(
      const vpValue: TDataSet): IRegraEnvioSelo; overload;

    function GetByID(
      const vpValue: Variant): IRegraEnvioSelo; virtual; abstract;

    function GetList: TRegraEnvioSeloList;

    function Get(
      const vpValue: ISeloGrupo): IRegraEnvioSelo; overload;

    class function GetColunas: string; static;

    procedure Inserir(
      const vpValue: IRegraEnvioSelo);

    procedure Alterar(
      const vpValue: IRegraEnvioSelo);

    procedure Excluir(
      const vpValue: IRegraEnvioSelo); overload; virtual; abstract;

    procedure Excluir(
      const vpValue: ISeloGrupo); overload;
  end;

implementation

uses
  System.SysUtils,
  RegraEnvioSeloImpl,
  BooleanHelper,
  SeloGrupoDAOImpl;

{ TRegraEnvioSeloDAO }

procedure TRegraEnvioSeloDAO.Alterar(
  const vpValue: IRegraEnvioSelo);
{$REGION 'Variáveis'}
var
  viSQL: string;
  viParams: TParams;
{$ENDREGION}
begin
  viSQL := {$REGION 'Comando SQL UPDATE'}

    {$REGION 'Cláusula UPDATE'}
    'UPDATE ' +
    'G_REGRA_ENVIO_SELO ' +
    {$ENDREGION}

    {$REGION 'Cláusula SET, Colunas e Parâmetros'}
    'SELO_GRUPO_ID = :P_SELO_GRUPO_ID, ' +
    'INTERVALO = :P_INTERVALO' +
    {$ENDREGION}

    {$REGION 'Cláusula WHERE e Parâmetros'}
    'WHERE ' +
    'REGRA_ENVIO_SELO_ID = :P_REGRA_ENVIO_SELO_ID';
    {$ENDREGION}

  {$ENDREGION}

  viParams := TParams.Create;
  try
    viParams.CreateParam(TFieldType.ftInteger, 'P_REGRA_ENVIO_SELO_ID',
      TParamType.ptInput);

    viParams.CreateParam(TFieldType.ftInteger, 'P_SELO_GRUPO_ID',
      TParamType.ptInput);

    viParams.CreateParam(TFieldType.ftInteger, 'P_INTERVALO',
      TParamType.ptInput);

    PreencherParametros(viParams, vpValue);
    FSQLConnection.Execute(viSQL, viParams);
  finally
    FreeAndNil(viParams);
  end;
end;

constructor TRegraEnvioSeloDAO.Create(
  const vpSQLConnection: TSQLConnection);
begin
  inherited Create;
  FSQLConnection := vpSQLConnection;
end;

procedure TRegraEnvioSeloDAO.Excluir(
  const vpValue: ISeloGrupo);
{$REGION 'Variáveis'}
var
  viSQL: string;
  viParams: TParams;
{$ENDREGION}
begin
  viSQL := {$REGION 'Comando SQL DELETE'}
    'DELETE ' +

    {$REGION 'Cláusula FROM'}
    'FROM ' +
    'G_REGRA_ENVIO_SELO ' +
    {$ENDREGION}

    {$REGION 'Cláusula WHERE e Parâmetros'}
    'WHERE ' +
    'SELO_GRUPO_ID = :P_SELO_GRUPO_ID';
    {$ENDREGION}

  {$ENDREGION}

  viParams := TParams.Create;
  try
    viParams.CreateParam(TFieldType.ftInteger, 'P_SELO_GRUPO_ID',
      TParamType.ptInput).AsInteger := vpValue.SeloGrupoID;

    FSQLConnection.Execute(viSQL, viParams);
  finally
    FreeAndNil(viParams);
  end;
end;

function TRegraEnvioSeloDAO.Get(
  const vpValue: ISeloGrupo): IRegraEnvioSelo;
{$REGION 'Variáveis'}
var
  viSQL: string;
  viParams: TParams;
  viDataSet: TDataSet;
{$ENDREGION}
begin
  Result := nil;

  viSQL := {$REGION 'Comando SQL SELECT'}
    'SELECT ' +

    {$REGION 'Colunas'}
    'G_RES.REGRA_ENVIO_SELO_ID G_RES_REGRA_ENVIO_SELO_ID, ' +
    'G_RES.INTERVALO G_RES_INTERVALO ' +
    {$ENDREGION}

    {$REGION 'Cláusula FROM'}
    'FROM ' +
    'G_REGRA_ENVIO_SELO G_RES ' +
    {$ENDREGION}

    {$REGION 'Cláusula WHERE e Parâmetros'}
    'WHERE ' +
    'G_RES.SELO_GRUPO_ID = :P_SELO_GRUPO_ID';
    {$ENDREGION}

  {$ENDREGION}

  viParams := TParams.Create;
  try
    viParams.CreateParam(TFieldType.ftInteger, 'P_SELO_GRUPO_ID',
      TParamType.ptInput).AsInteger := vpValue.SeloGrupoID;

    FSQLConnection.Execute(viSQL, viParams, viDataSet);
    try
      if viDataSet.IsEmpty then
        Exit;

      try
        viDataSet.First;
        Result := Get(viDataSet);
        Result.SeloGrupo := vpValue;
      finally
        viDataSet.Close;
      end;
    finally
      FreeAndNil(viDataSet);
    end;
  finally
    FreeAndNil(viParams);
  end;
end;

class function TRegraEnvioSeloDAO.GetColunas: string;
begin
  Result := {$REGION 'Colunas'}
    'G_RES.REGRA_ENVIO_SELO_ID G_RES_REGRA_ENVIO_SELO_ID, ' +
    TSeloGrupoDAO.GetColunas + ', ' +
    'G_RES.INTERVALO G_RES_INTERVALO';
  {$ENDREGION}
end;

function TRegraEnvioSeloDAO.Get(
  const vpValue: TDataSet): IRegraEnvioSelo;
{$REGION 'Variáveis'}
var
  viField: TField;
  viSeloGrupoDAO: TSeloGrupoDAO;
{$ENDREGION}
begin
  Result := TRegraEnvioSelo.Create;
  with vpValue, Result do
  begin
    viField := FindField('G_RES_REGRA_ENVIO_SELO_ID');
    if Assigned(viField) then
      RegraEnvioSeloID := viField.AsInteger;

    viField := FindField('G_SG_SELO_GRUPO_ID');
    if Assigned(viField) and
      viField.IsNull.&Not then
    begin
      viSeloGrupoDAO := TSeloGrupoDAO.Create(FSQLConnection);
      try
        SeloGrupo := viSeloGrupoDAO.Get(vpValue);
      finally
        FreeAndNil(viSeloGrupoDAO);
      end;
    end;

    viField := FindField('G_RES_INTERVALO');
    if Assigned(viField) then
      Intervalo := viField.AsInteger;
  end;
end;

function TRegraEnvioSeloDAO.GetList: TRegraEnvioSeloList;
{$REGION 'Variáveis'}
var
  viSQL: string;
  viDataSet: TDataSet;
  viRegraEnvioSelo: IRegraEnvioSelo;
{$ENDREGION}
begin
  Result := TRegraEnvioSeloList.Create;

  viSQL := {$REGION 'Comando SQL SELECT'}
    'SELECT ' +

    GetColunas + ' ' +

    {$REGION 'Cláusula FROM'}
    'FROM ' +
    'G_REGRA_ENVIO_SELO G_RES ' +
    {$ENDREGION}

    {$REGION 'Cláusula INNER JOIN'}
    'INNER JOIN ' +
    'G_SELO_GRUPO G_SG ' +

    {$REGION 'Cláusula ON'}
    'ON ' +
    'G_RES.SELO_GRUPO_ID = G_SG.SELO_GRUPO_ID ' +
    {$ENDREGION}

    {$ENDREGION}

    {$REGION 'Cláusula INNER JOIN'}
    'INNER JOIN ' +
    'G_SISTEMA G_S ' +

    {$REGION 'Cláusula ON'}
    'ON ' +
    'G_SG.SISTEMA_ID = G_S.SISTEMA_ID';
    {$ENDREGION}

    {$ENDREGION}

  {$ENDREGION}

  FSQLConnection.Execute(viSQL, nil, viDataSet);
  try
    if viDataSet.IsEmpty then
      Exit;

    try
      viDataSet.First;
      while viDataSet.Eof.&Not do
        try
          viRegraEnvioSelo := Get(viDataSet);
          Result.Add(viRegraEnvioSelo);
        finally
          viDataSet.Next;
        end;

      Result.TrimExcess;
    finally
      viDataSet.Close;
    end;
  finally
    FreeAndNil(viDataSet);
  end;
end;

procedure TRegraEnvioSeloDAO.Inserir(
  const vpValue: IRegraEnvioSelo);
{$REGION 'Variáveis'}
var
  viSQL: string;
  viParams: TParams;
{$ENDREGION}
begin
  viSQL := {$REGION 'Comando SQL INSERT'}
    'INSERT ' +

    {$REGION 'Cláusula INTO'}
    'INTO ' +
    'G_REGRA_ENVIO_SELO ' +
    {$ENDREGION}

    {$REGION 'Colunas'}
    '(' +
    'REGRA_ENVIO_SELO_ID, ' +
    'SELO_GRUPO_ID, ' +
    'INTERVALO' +
    ') ' +
    {$ENDREGION}

    {$REGION 'Cláusula VALUES e Parâmetros'}
    'VALUES ' +
    '(' +
    ':P_REGRA_ENVIO_SELO_ID, ' +
    ':P_SELO_GRUPO_ID, ' +
    ':P_INTERVALO' +
    ')';

  {$ENDREGION}

  {$ENDREGION}

  viParams := TParams.Create;
  try
    viParams.CreateParam(TFieldType.ftInteger, 'P_REGRA_ENVIO_SELO_ID',
      TParamType.ptInput);

    viParams.CreateParam(TFieldType.ftInteger, 'P_SELO_GRUPO_ID',
      TParamType.ptInput);

    viParams.CreateParam(TFieldType.ftInteger, 'P_INTERVALO',
      TParamType.ptInput);

    PreencherParametros(viParams, vpValue);
    FSQLConnection.Execute(viSQL, viParams);
  finally
    FreeAndNil(viParams);
  end;
end;

procedure TRegraEnvioSeloDAO.PreencherParametros(
  const vpParams: TParams;
  const vpValue: IRegraEnvioSelo);
{$REGION 'Variáveis'}
var
  viParam: TParam;
{$ENDREGION}
begin
  with vpParams, vpValue do
  begin
    viParam := FindParam('P_REGRA_ENVIO_SELO_ID');
    if Assigned(viParam) then
      viParam.AsInteger := RegraEnvioSeloID;

    viParam := FindParam('P_SELO_GRUPO_ID');
    if Assigned(viParam) then
      viParam.AsInteger := SeloGrupo.SeloGrupoID;

    viParam := FindParam('P_INTERVALO');
    if Assigned(viParam) then
      viParam.AsInteger := Intervalo;
  end;
end;

end.
