unit EmolumentoPeriodoDAOImpl;

interface

uses
  EmolumentoPeriodoDAO,
  Data.SqlExpr,
  Data.DB,
  EmolumentoPeriodo,
  EmolumentoPeriodoList,
  Sistema;

type
  TEmolumentoPeriodoDAO = class(TInterfacedObject, IEmolumentoPeriodoDAO)
  private
    FSQLConnection: TSQLConnection;

    procedure PreencherParametros(
      const vpSQLDataSet: TSQLDataSet;
      const vpValue: IEmolumentoPeriodo);
  public
    constructor Create(
      const vpSQLConnection: TSQLConnection); reintroduce;

    function Get(
      const vpValue: TDataSet;
      const vpPrefix: string = ''): IEmolumentoPeriodo;

    function GetByID(
      const vpValue: Variant): IEmolumentoPeriodo;

    function GetList: TEmolumentoPeriodoList;

    function GetListDistinctByEmolumentoSistema(
      const vpValue: ISistema): TEmolumentoPeriodoList; virtual; abstract;

    class function New(
      const vpSQLConnection: TSQLConnection): IEmolumentoPeriodoDAO; static;

    class function GetColunas(
      const vpPrefix: string = ''): string; static;

    procedure Inserir(
      const vpValue: IEmolumentoPeriodo);

    procedure Alterar(
      const vpValue: IEmolumentoPeriodo); virtual; abstract;

    procedure Excluir(
      const vpValue: IEmolumentoPeriodo); virtual; abstract;
  end;

implementation

uses
  EmolumentoPeriodoImpl,
  System.SysUtils,
  BooleanHelper,
  System.Classes;

{ TEmolumentoPeriodoDAO }

constructor TEmolumentoPeriodoDAO.Create(
  const vpSQLConnection: TSQLConnection);
begin
  inherited Create;
  FSQLConnection := vpSQLConnection;
end;

function TEmolumentoPeriodoDAO.Get(
  const vpValue: TDataSet;
  const vpPrefix: string): IEmolumentoPeriodo;
{$REGION 'Vari�veis'}
var
  viField: TField;
{$ENDREGION}
begin
  Result := TEmolumentoPeriodo.New;

  with vpValue, Result do
  begin
    viField := FindField(string.Format('G_EP%s_EMOLUMENTO_PERIODO_ID',
      [vpPrefix]));

    if Assigned(viField) then
      EmolumentoPeriodoID := viField.AsInteger;

    viField := FindField(string.Format('G_EP%s_DESCRICAO', [vpPrefix]));
    if Assigned(viField) then
      Descricao := viField.AsString;

    viField := FindField(string.Format('G_EP%s_SITUACAO', [vpPrefix]));
    if Assigned(viField) then
      Situacao := Boolean.FromStringAtivoInativo(viField.AsString);

    viField := FindField(string.Format('G_EP%s_DATA_INICIAL', [vpPrefix]));
    if Assigned(viField) then
      DataInicial := viField.AsDateTime;
  end;
end;

function TEmolumentoPeriodoDAO.GetByID(
  const vpValue: Variant): IEmolumentoPeriodo;
{$REGION 'Vari�veis'}
var
  viSQL: string;
  viParams: TParams;
  viDataSet: TDataSet;
{$ENDREGION}
begin
  Result := nil;

  viSQL := {$REGION 'Comando SQL SELECT'}
    'SELECT ' +

    GetColunas + ' ' +

    {$REGION 'Cl�usula FROM'}
    'FROM ' +
    'G_EMOLUMENTO_PERIODO G_EP ' +
    {$ENDREGION}

    {$REGION 'Cl�usula WHERE e Par�metros'}
    'WHERE ' +
    'G_EP.EMOLUMENTO_PERIODO_ID = :P_EMOLUMENTO_PERIODO_ID';
    {$ENDREGION}

  {$ENDREGION}

  viParams := TParams.Create;
  try
    viParams.CreateParam(
      TFieldType.ftInteger,
      'P_EMOLUMENTO_PERIODO_ID',
      TParamType.ptInput).AsInteger := vpValue;

    FSQLConnection.Execute(
      viSQL,
      viParams,
      viDataSet);
  finally
    FreeAndNil(viParams);
  end;

  try
    if viDataSet.IsEmpty then
      Exit;

    viDataSet.First;
    Result := Get(viDataSet);
    Result.EmolumentoPeriodoID := vpValue;
  finally
    viDataSet.Close;
    FreeAndNil(viDataSet);
  end;
end;

class function TEmolumentoPeriodoDAO.GetColunas(
  const vpPrefix: string): string;
begin
  Result := {$REGION 'Colunas'}
    string.Format('G_EP%s.EMOLUMENTO_PERIODO_ID G_EP%s_EMOLUMENTO_PERIODO_ID, ',
      [vpPrefix, vpPrefix]) +

    string.Format('G_EP%s.DESCRICAO G_EP%s_DESCRICAO, ', [vpPrefix, vpPrefix]) +
    string.Format('G_EP%s.SITUACAO G_EP%s_SITUACAO, ', [vpPrefix, vpPrefix]) +

    string.Format('G_EP%s.DATA_INICIAL G_EP%s_DATA_INICIAL, ',
      [vpPrefix, vpPrefix]) +

    string.Format('G_EP%s.ANO G_EP%s_ANO', [vpPrefix, vpPrefix]);
  {$ENDREGION}
end;

function TEmolumentoPeriodoDAO.GetList: TEmolumentoPeriodoList;
{$REGION 'Vari�veis'}
var
  viSQLDataSet: TSQLDataSet;
  viSQL: TStrings;
  viEmolumentoPeriodo: IEmolumentoPeriodo;
{$ENDREGION}
begin
  Result := TEmolumentoPeriodoList.Create;

  viSQLDataSet := TSQLDataSet.Create(nil);
  viSQLDataSet.SQLConnection := FSQLConnection;

  viSQL := TStringList.Create;

  try
    with viSQLDataSet do
    begin
      with viSQL do
      begin
        {$REGION 'Comando SQL SELECT'}
        Add('SELECT');

        {$REGION 'Colunas'}
        Add('G_EP.EMOLUMENTO_PERIODO_ID G_EP_EMOLUMENTO_PERIODO_ID,');
        Add('G_EP.DESCRICAO G_EP_DESCRICAO,');
        Add('G_EP.SITUACAO G_EP_SITUACAO,');
        Add('G_EP.DATA_INICIAL G_EP_DATA_INICIAL');
        {$ENDREGION}

        {$REGION 'Cl�usula FROM'}
        Add('FROM');
        Add('G_EMOLUMENTO_PERIODO G_EP;');
        {$ENDREGION}

        {$ENDREGION}
      end;

      CommandText := viSQL.Text;
      Open;

      try
        if IsEmpty then
          Exit;

        First;
        while Eof.&Not do
          try
            viEmolumentoPeriodo := Get(viSQLDataSet);
            Result.Add(viEmolumentoPeriodo);
          finally
            Next;
          end;
      finally
        Close;
      end;
    end;
  finally
    FreeAndNil(viSQLDataSet);
    FreeAndNil(viSQL);
  end;
end;

procedure TEmolumentoPeriodoDAO.Inserir(
  const vpValue: IEmolumentoPeriodo);
{$REGION 'Vari�veis'}
var
  viSQLDataSet: TSQLDataSet;
  viSQL: TStrings;
{$ENDREGION}
begin
  viSQLDataSet := TSQLDataSet.Create(nil);
  viSQLDataSet.SQLConnection := FSQLConnection;

  viSQL := TStringList.Create;

  try
    with viSQLDataSet do
    begin
      with viSQL do
      begin
        {$REGION 'Comando SQL INSERT'}
        Add('INSERT');

        {$REGION 'Cl�usula INTO'}
        Add('INTO');
        Add('G_EMOLUMENTO_PERIODO');
        {$ENDREGION}

        {$REGION 'Colunas'}
        Add('(');
        Add('EMOLUMENTO_PERIODO_ID,');
        Add('DESCRICAO,');
        Add('SITUACAO,');
        Add('DATA_INICIAL');
        Add(')');
        {$ENDREGION}

        {$REGION 'Cl�usula VALUES e Par�metros'}
        Add('VALUES');
        Add('(');
        Add(':P_EMOLUMENTO_PERIODO_ID,');
        Add(':P_DESCRICAO,');
        Add(':P_SITUACAO,');
        Add(':P_DATA_INICIAL');
        Add(');');
        {$ENDREGION}

        {$ENDREGION}
      end;

      CommandText := viSQL.Text;
      PreencherParametros(viSQLDataSet, vpValue);
      ExecSQL;
    end;
  finally
    FreeAndNil(viSQLDataSet);
    FreeAndNil(viSQL);
  end;
end;

class function TEmolumentoPeriodoDAO.New(
  const vpSQLConnection: TSQLConnection): IEmolumentoPeriodoDAO;
begin
  Result := TEmolumentoPeriodoDAO.Create(vpSQLConnection);
end;

procedure TEmolumentoPeriodoDAO.PreencherParametros(
  const vpSQLDataSet: TSQLDataSet;
  const vpValue: IEmolumentoPeriodo);
{$REGION 'Vari�veis'}
var
  viParam: TParam;
{$ENDREGION}
begin
  with vpSQLDataSet.Params, vpValue do
  begin
    viParam := FindParam('P_EMOLUMENTO_PERIODO_ID');
    if Assigned(viParam) then
      viParam.AsInteger := EmolumentoPeriodoID;

    viParam := FindParam('P_DESCRICAO');
    if Assigned(viParam) then
      viParam.AsString := Descricao;

    viParam := FindParam('P_SITUACAO');
    if Assigned(viParam) then
      viParam.AsString := Situacao.ToCharAtivoInativo;

    viParam := FindParam('P_DATA_INICIAL');
    if Assigned(viParam) then
      viParam.AsDateTime := DataInicial;
  end;
end;

end.