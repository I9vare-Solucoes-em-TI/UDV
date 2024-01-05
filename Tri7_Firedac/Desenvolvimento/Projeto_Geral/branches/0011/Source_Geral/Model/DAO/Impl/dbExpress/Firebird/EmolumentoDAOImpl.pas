unit EmolumentoDAOImpl;

interface

uses
  I9Query,
  FireDAC.Stan.Param,
  I9Query,
  I9Connection,
  EmolumentoDAO,
  Data.SqlExpr,
  Data.DB,
  Emolumento,
  EmolumentoList,
  Sistema;

type
  TEmolumentoDAO = class(TInterfacedObject, IEmolumentoDAO)
  private
    FConnection: TI9Connection;

    procedure PreencherParametros(
      const vpI9Query: TI9Query;
      const vpValue: IEmolumento);
  public
    constructor Create(
      const vpConnection: TI9Connection); reintroduce;

    function Get(
      const vpValue: TDataSet;
      const vpPrefix: string = '';
      const vpPrefixSistema: string = ''): IEmolumento;

    function GetByID(
      const vpValue: Variant): IEmolumento;

    function GetList: TEmolumentoList;

    function GetListBySistemaESituacao(
      const vpSistema: ISistema;
      const vpSituacao: Boolean): TEmolumentoList;

    class function GetColunas(
      const vpLoadSistema: Boolean;
      const vpPrefix: string = '';
      const vpPrefixSistema: string = ''): string; static;

    procedure Inserir(
      const vpValue: IEmolumento);

    procedure Alterar(
      const vpValue: IEmolumento); virtual; abstract;

    procedure Excluir(
      const vpValue: IEmolumento); virtual; abstract;
  end;

implementation

{$WARN CONSTRUCTING_ABSTRACT OFF}

uses
  EmolumentoImpl,
  SistemaDAOImpl,
  System.SysUtils,
  System.Classes,
  BooleanHelper,
  System.StrUtils;

{ TEmolumentoDAO }

constructor TEmolumentoDAO.Create(
  const vpConnection: TI9Connection);
begin
  inherited Create;
  FConnection := vpConnection;
end;

function TEmolumentoDAO.Get(
  const vpValue: TDataSet;
  const vpPrefix: string = '';
  const vpPrefixSistema: string = ''): IEmolumento;
{$REGION 'Variáveis'}
var
  viField: TField;
  viSistemaDAO: TSistemaDAO;
{$ENDREGION}
begin
  Result := TEmolumento.Create;

  with vpValue, Result do
  begin
    viField := FindField(string.Format('G_E%s_EMOLUMENTO_ID', [vpPrefix]));
    if Assigned(viField) then
      EmolumentoID := viField.AsInteger;

    viField := FindField(string.Format('G_E%s_DESCRICAO', [vpPrefix]));
    if Assigned(viField) then
      Descricao := viField.AsString;

    viField := FindField(string.Format('G_S%s_SISTEMA_ID', [vpPrefixSistema]));
    if Assigned(viField) then
    begin
      viSistemaDAO := TSistemaDAO.Create(FConnection);
      try
        Sistema := viSistemaDAO.Get(
          vpValue,
          vpPrefixSistema);
      finally
        FreeAndNil(viSistemaDAO);
      end;
    end;

    viField := FindField(string.Format('G_E%s_SITUACAO', [vpPrefix]));
    if Assigned(viField) then
      Situacao := Boolean.FromStringAtivoInativo(viField.AsString);
  end;
end;

function TEmolumentoDAO.GetByID(
  const vpValue: Variant): IEmolumento;
{$REGION 'Constantes'}
const
  CI_LOAD_SISTEMA: Boolean = True;
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viSQL: string;
  viParams: TFDParams;
  viDataSet: TDataSet;
{$ENDREGION}
begin
  Result := nil;

  viSQL := {$REGION 'Comando SQL SELECT'}
    'SELECT ' +

    GetColunas(CI_LOAD_SISTEMA) + ' ' +

    {$REGION 'Cláusula FROM'}
    'FROM ' +
    'G_EMOLUMENTO G_E ' +
    {$ENDREGION}

    {$REGION 'Cláusula INNER JOIN'}
    'INNER JOIN ' +
    'G_SISTEMA G_S ' +

    {$REGION 'Cláusula ON'}
    'ON ' +
    'G_E.SISTEMA_ID = G_S.SISTEMA_ID ' +
    {$ENDREGION}

    {$ENDREGION}

    {$REGION 'Cláusula WHERE e Parâmetros'}
    'WHERE ' +
    'G_E.EMOLUMENTO_ID = :P_EMOLUMENTO_ID';
    {$ENDREGION}

  {$ENDREGION}

  viParams := TFDParams.Create;
  try
    viParams.CreateParam(
      TFieldType.ftInteger,
      'P_EMOLUMENTO_ID',
      TParamType.ptInput).AsInteger := vpValue;

    FConnection.Execute(
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
    Result.EmolumentoID := vpValue;
  finally
    viDataSet.Close;
    FreeAndNil(viDataSet);
  end;
end;

class function TEmolumentoDAO.GetColunas(
  const vpLoadSistema: Boolean;
  const vpPrefix: string;
  const vpPrefixSistema: string): string;
begin
  Result := {$REGION 'Colunas'}
    string.Format('G_E%s.EMOLUMENTO_ID G_E%s_EMOLUMENTO_ID, ',
      [vpPrefix, vpPrefix]) +

    string.Format('G_E%s.DESCRICAO G_E%s_DESCRICAO, ',
      [vpPrefix, vpPrefix]) +

    IfThen(vpLoadSistema, TSistemaDAO.GetColunas(vpPrefixSistema),
      string.Format('G_E%s.SISTEMA_ID G_E%s_SISTEMA_ID',
      [vpPrefix, vpPrefix])) + ', ' +

    string.Format('G_E%s.SITUACAO G_E%s_SITUACAO', [vpPrefix, vpPrefix]);
  {$ENDREGION}
end;

function TEmolumentoDAO.GetList: TEmolumentoList;
{$REGION 'Variáveis'}
var
  viSQLDataSet: TI9Query;
  viSQL: TStrings;
  viEmolumento: IEmolumento;
{$ENDREGION}
begin
  Result := TEmolumentoList.Create;

  viSQLDataSet := TI9Query.Create(nil);
  viSQLDataSet.Connection := FConnection;

  viSQL := TStringList.Create;

  try
    with viSQLDataSet do
    begin
      with viSQL do
      begin
        {$REGION 'Comando SQL SELECT'}
        Add('SELECT');

        {$REGION 'Colunas'}
        Add('G_E.EMOLUMENTO_ID G_E_EMOLUMENTO_ID,');
        Add('G_E.DESCRICAO G_E_DESCRICAO,');
        Add('G_S.SISTEMA_ID G_S_SISTEMA_ID,');
        Add('G_S.DESCRICAO G_S_DESCRICAO,');
        Add('G_S.SITUACAO G_S_SITUACAO,');
        Add('G_S.VERSAO G_S_VERSAO');
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        Add('FROM');
        Add('G_EMOLUMENTO G_E');
        {$ENDREGION}

        {$REGION 'Cláusula INNER JOIN'}
        Add('INNER JOIN');
        Add('G_SISTEMA G_S');

        {$REGION 'Cláusula ON'}
        Add('ON');
        Add('G_E.SISTEMA_ID = G_S.SISTEMA_ID;');
        {$ENDREGION}

        {$ENDREGION}

        {$ENDREGION}
      end;

      SQL.Text := viSQL.Text;
      Open;

      try
        if IsEmpty then
          Exit;

        First;
        while Eof.&Not do
          try
            viEmolumento := Get(viSQLDataSet);
            Result.Add(viEmolumento);
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

function TEmolumentoDAO.GetListBySistemaESituacao(
  const vpSistema: ISistema;
  const vpSituacao: Boolean): TEmolumentoList;
{$REGION 'Constantes'}
const
  CI_LOAD_SISTEMA: Boolean = False;
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viSQL: string;
  viParams: TFDParams;
  viDataSet: TDataSet;
  viEmolumento: IEmolumento;
{$ENDREGION}
begin
  Result := TEmolumentoList.Create;

  viSQL := {$REGION 'Comando SQL SELECT'}
    'SELECT ' +

    GetColunas(CI_LOAD_SISTEMA) + ' ' +

    {$REGION 'Cláusula FROM'}
    'FROM ' +
    'G_EMOLUMENTO G_E ' +
    {$ENDREGION}

    {$REGION 'Cláusula WHERE e Parâmetros'}
    'WHERE ' +
    'G_E.SISTEMA_ID = :P_SISTEMA_ID AND ' +
    'G_E.SITUACAO = :P_SITUACAO';
    {$ENDREGION}

  {$ENDREGION}

  viParams := TFDParams.Create;
  try
    viParams.CreateParam(TFieldType.ftInteger,
      'P_SISTEMA_ID', TParamType.ptInput).AsInteger := vpSistema.SistemaID;

    viParams.CreateParam(TFieldType.ftString,
      'P_SITUACAO', TParamType.ptInput).AsString :=
        vpSituacao.ToCharAtivoInativo;

    FConnection.Execute(viSQL, viParams, viDataSet);
    try
      try
        if viDataSet.IsEmpty then
          Exit;

        viDataSet.First;
        while viDataSet.Eof.&Not do
          try
            viEmolumento := Get(viDataSet);
            viEmolumento.Sistema := vpSistema;
            viEmolumento.Situacao := vpSituacao;
            Result.Add(viEmolumento);
          finally
            viDataSet.Next;
          end;
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

procedure TEmolumentoDAO.PreencherParametros(
  const vpI9Query: TI9Query;
  const vpValue: IEmolumento);
{$REGION 'Variáveis'}
var
  viParam: TFDParam;
{$ENDREGION}
begin
  with vpI9Query.Params, vpValue do
  begin
    viParam := FindParam('P_EMOLUMENTO_ID');
    if Assigned(viParam) then
      viParam.AsInteger := vpValue.EmolumentoID;

    viParam := FindParam('P_DESCRICAO');
    if Assigned(viParam) then
      viParam.AsString := Descricao;

    viParam := FindParam('P_SISTEMA_ID');
    if Assigned(viParam) then
      with viParam do
        if Assigned(Sistema) then
          AsInteger := Sistema.SistemaID
        else
        begin
          DataType := ftInteger;
          Clear;
          Bound := True;
        end;
  end;
end;

procedure TEmolumentoDAO.Inserir(
  const vpValue: IEmolumento);
{$REGION 'Variáveis'}
var
  viSQLDataSet: TI9Query;
  viSQL: TStrings;
{$ENDREGION}
begin
  viSQLDataSet := TI9Query.Create(nil);
  viSQLDataSet.Connection := FConnection;

  viSQL := TStringList.Create;

  try
    with viSQLDataSet do
    begin
      with viSQL do
      begin
        {$REGION 'Comando SQL INSERT'}
        Add('INSERT');

        {$REGION 'Cláusula INTO'}
        Add('INTO');
        Add('G_EMOLUMENTO');
        {$ENDREGION}

        {$REGION 'Colunas'}
        Add('(');
        Add('EMOLUMENTO_ID,');
        Add('DESCRICAO,');
        Add('SISTEMA_ID');
        Add(')');
        {$ENDREGION}

        {$REGION 'Cláusula VALUES e Parâmetros'}
        Add('VALUES');
        Add('(');
        Add(':P_EMOLUMENTO_ID,');
        Add(':P_DESCRICAO,');
        Add(':P_SISTEMA_ID');
        Add(');');
        {$ENDREGION}

        {$ENDREGION}
      end;

      SQL.Text := viSQL.Text;
      PreencherParametros(viSQLDataSet, vpValue);
      ExecSQL;
    end;
  finally
    FreeAndNil(viSQLDataSet);
    FreeAndNil(viSQL);
  end;
end;

end.
