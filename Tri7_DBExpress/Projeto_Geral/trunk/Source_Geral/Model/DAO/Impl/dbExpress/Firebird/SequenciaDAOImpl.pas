unit SequenciaDAOImpl;

interface

uses
  SequenciaDAO,
  Data.SqlExpr,
  Data.DB,
  Sequencia,
  SequenciaList;

type
  TSequenciaDAO = class(TInterfacedObject, ISequenciaDAO)
  private
    FSQLConnection: TSQLConnection;

    procedure PreencherParametros(
      const vpParams: TParams;
      const vpValue: ISequencia);
  public
    constructor Create(
      const vpSQLConnection: TSQLConnection); reintroduce;

    function Get(
      const vpValue: TDataSet): ISequencia; overload;

    function GetByID(
      const vpValue: Variant): ISequencia;

    function GetList: TSequenciaList; virtual; abstract;

    procedure Inserir(
      const vpValue: ISequencia);

    procedure Alterar(
      const vpValue: ISequencia);

    procedure Excluir(
      const vpValue: ISequencia); virtual; abstract;

    procedure AlterarSequencia(
      const vpValue: ISequencia); virtual; abstract;
  end;

implementation

uses
  System.SysUtils,
  SequenciaImpl,
  System.Math,
  System.Types;

{ TSequenciaDAO }

procedure TSequenciaDAO.Alterar(
  const vpValue: ISequencia);
{$REGION 'Variáveis'}
var
  viSQL: string;
  viParams: TParams;
{$ENDREGION}
begin
  viSQL := {$REGION 'Comando SQL UPDATE'}

    {$REGION 'Cláusula UPDATE'}
    'UPDATE ' +
    'G_SEQUENCIA ' +
    {$ENDREGION}

    {$REGION 'Cláusula SET, Colunas e Parâmetros'}
    'SET ' +
    'SEQUENCIA = :P_SEQUENCIA ' +
    {$ENDREGION}

    {$REGION 'Cláusula WHERE e Parâmetros'}
    'WHERE ' +
    'TABELA = :P_TABELA';
    {$ENDREGION}

  {$ENDREGION}

  viParams := TParams.Create;
  try
    with viParams do
    begin
      CreateParam(TFieldType.ftInteger, 'P_SEQUENCIA', TParamType.ptInput);
      CreateParam(TFieldType.ftString, 'P_TABELA', TParamType.ptInput);
    end;

    PreencherParametros(viParams, vpValue);
    FSQLConnection.Execute(viSQL, viParams);
  finally
    FreeAndNil(viParams);
  end;
end;

constructor TSequenciaDAO.Create(
  const vpSQLConnection: TSQLConnection);
begin
  inherited Create;
  FSQLConnection := vpSQLConnection;
end;

function TSequenciaDAO.Get(
  const vpValue: TDataSet): ISequencia;
{$REGION 'Variáveis'}
var
  viField: TField;
{$ENDREGION}
begin
  Result := TSequencia.Create;
  with vpValue, Result do
  begin
    viField := FindField('G_S_TABELA');
    if Assigned(viField) then
      Tabela := viField.AsString;

    viField := FindField('G_S_SEQUENCIA');
    if Assigned(viField) then
      Sequencia := viField.AsInteger;
  end;
end;

function TSequenciaDAO.GetByID(
  const vpValue: Variant): ISequencia;
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
    'G_S.SEQUENCIA G_S_SEQUENCIA ' +
    {$ENDREGION}

    {$REGION 'Cláusula FROM'}
    'FROM ' +
    'G_SEQUENCIA G_S ' +
    {$ENDREGION}

    {$REGION 'Cláusula WHERE e Parâmetros'}
    'WHERE ' +
    'G_S.TABELA = :P_TABELA';
    {$ENDREGION}

  {$ENDREGION}

  viParams := TParams.Create;
  try
    viParams.CreateParam(TFieldType.ftString, 'P_TABELA',
      TParamType.ptInput).AsString := vpValue;

    FSQLConnection.Execute(viSQL, viParams, viDataSet);
    try
      if viDataSet.IsEmpty then
        Exit;

      try
        viDataSet.First;
        Result := Get(viDataSet);
        Result.Tabela := vpValue;
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

procedure TSequenciaDAO.Inserir(
  const vpValue: ISequencia);
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
    'G_SEQUENCIA ' +
    {$ENDREGION}

    {$REGION 'Colunas'}
    '(' +
    'TABELA, ' +
    'SEQUENCIA' +
    ') ' +
    {$ENDREGION}

    {$REGION 'Cláusula VALUES e Parâmetros'}
    'VALUES ' +
    '(' +
    ':P_TABELA, ' +
    ':P_SEQUENCIA' +
    ')';
    {$ENDREGION}

  {$ENDREGION}

  viParams := TParams.Create;
  try
    with viParams do
    begin
      CreateParam(TFieldType.ftInteger, 'P_SEQUENCIA', TParamType.ptInput);
      CreateParam(TFieldType.ftString, 'P_TABELA', TParamType.ptInput);
    end;

    PreencherParametros(viParams, vpValue);
    FSQLConnection.Execute(viSQL, viParams);
  finally
    FreeAndNil(viParams);
  end;
end;


procedure TSequenciaDAO.PreencherParametros(
  const vpParams: TParams;
  const vpValue: ISequencia);
{$REGION 'Variáveis'}
var
  viParam: TParam;
{$ENDREGION}
begin
  with vpParams, vpValue do
  begin
    viParam := FindParam('P_TABELA');
    if Assigned(viParam) then
      with viParam do
        if Tabela.IsEmpty then
          Clear
        else
          AsString := Tabela;

    viParam := FindParam('P_SEQUENCIA');
    if Assigned(viParam) then
      with viParam do
        if CompareValue(Sequencia, ZeroValue) = GreaterThanValue then
          AsInteger := Sequencia
        else
          Clear;
  end;
end;

end.
