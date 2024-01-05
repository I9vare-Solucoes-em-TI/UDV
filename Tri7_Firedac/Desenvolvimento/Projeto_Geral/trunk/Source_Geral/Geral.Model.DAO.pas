unit Geral.Model.DAO;

interface

uses
  I9Connection,
  System.Generics.Collections,
  FireDAC.Stan.Param,
  Data.DB,
  I9Query,
  System.Classes;

type
  TAbstractDAO = class abstract
  private
    FConnection: TI9Connection;
  protected
    function CreateQuery: TI9Query; virtual;
  public
    constructor Create(
      const vpConnection: TI9Connection); reintroduce;
  end;

  TDAO<T: class> = class abstract(TAbstractDAO)
  private
    FPrimaryKey: string;
    FColumns: TStrings;

    const CL_RECORDS_PER_EXECUTE: Integer = 1000;

    function ExecuteQueryBatch(
      const vpSQL: string;
      const vpValues: TObjectList<T>): Integer;

    function GetInsertSQL: string;
    function GetUpdateSQL: string;
    function GetDeleteSQL: string;
    function GetPostSQL: string;

    function GetParamName(
      const vpColumn: string): string;
  protected
    function CreateQuery: TI9Query; override;

    function CreateObject(
      const vpDataSet: TDataSet): T; virtual; abstract;

    function GetTableName: string; virtual; abstract;
    function GetColumns: TArray<string>; virtual; abstract;

    procedure FillParams(
      const vpParams: TFDParams;
      const vpIndex: Integer;
      const vpValue: T); virtual; abstract;
  public
    constructor Create(
      const vpConnection: TI9Connection); reintroduce;

    function Insert(
      const vpValue: T): Integer;

    function InsertBatch(
      const vpValues: TObjectList<T>): Integer;

    function GetByID(
      const vpID: Integer): T;

    function GetByID_AsDataSet(
      const vpColumns: array of string;
      const vpID: Integer): TDataSet;

    function Update(
      const vpValue: T): Integer;

    function UpdateBatch(
      const vpValues: TObjectList<T>): Integer;

    function Delete(
      const vpID: Integer): Integer; overload;

    function Delete(
      const vpCondition: string;
      const vpParams: array of Variant): Integer; overload;

    function DeleteBatch(
      const vpIDs: TList<Integer>): Integer;

    function Post(
      const vpValue: T): Integer;

    function PostBatch(
      const vpValues: TObjectList<T>): Integer;

    function GetObject(
      const vpCondition: string;
      const vpParams: array of Variant;
      const vpOrder: string): T;

    function GetList(
      const vpFirst: Integer;
      const vpSkip: Integer;
      const vpCondition: string;
      const vpParams: array of Variant;
      const vpOrder: string): TObjectList<T>;

    function GetListAsDataSet(
      const vpColumns: array of string;
      const vpFirst: Integer;
      const vpSkip: Integer;
      const vpCondition: string;
      const vpParams: array of Variant;
      const vpOrder: string): TDataSet;

    function Exists(
      const vpSkip: Integer;
      const vpCondition: string;
      const vpParams: array of Variant;
      const vpOrder: string): Boolean;

    destructor Destroy; override;
  end;

implementation

uses
  System.SysUtils;

{ TDAO<T> }

constructor TDAO<T>.Create(
  const vpConnection: TI9Connection);
var
  viList: TStrings;
  viTableName: string;
  viColumns: TArray<string>;
begin
  inherited Create(
    vpConnection);

  viTableName := GetTableName;

  viList := TStringList.Create;
  try
    FConnection.GetKeyFieldNames(
      string.Empty,
      string.Empty,
      viTableName,
      string.Empty,
      viList);

    FPrimaryKey := viList[0];
  finally
    viList.Free;
  end;

  FColumns := TStringList.Create;
  viColumns := GetColumns;

  if Length(viColumns) = 0 then
    FConnection.GetFieldNames(
      string.Empty,
      string.Empty,
      viTableName,
      string.Empty,
      FColumns)
  else
    FColumns.AddStrings(
      viColumns);
end;

function TDAO<T>.Delete(
  const vpID: Integer): Integer;
var
  viIDs: TList<Integer>;
begin
  viIDs := TList<Integer>.Create;
  try
    viIDs.Add(
      vpID);

    Result := DeleteBatch(
      viIDs);
  finally
    viIDs.Free;
  end;
end;

function TDAO<T>.CreateQuery: TI9Query;
begin
  Result := inherited CreateQuery;
end;

function TDAO<T>.Delete(const vpCondition: string;
  const vpParams: array of Variant): Integer;
var
  viQuery: TI9Query;
  viSql: string;
begin
  viQuery := CreateQuery;

  try
    viSql := {$REGION 'Comando SQL DELETE'}
      'DELETE '+
      'FROM '+
       GetTableName +
      ' WHERE '+
      vpCondition;
    {$ENDREGION}

    Result := viQuery.ExecSQL(viSql, vpParams);
  finally
    viQuery.Free;
  end;

end;

function TDAO<T>.DeleteBatch(
  const vpIDs: TList<Integer>): Integer;
var
  viQuery: TI9Query;
  viID: Integer;
  I: Integer;
begin
  Result := 0;
  viQuery := CreateQuery;
  I := 0;

  try
    viQuery.SQL.Text := GetDeleteSQL;
    viQuery.Params.ArraySize := CL_RECORDS_PER_EXECUTE;

    for viID in vpIDs do
    begin
      viQuery.ParamByName(
        FPrimaryKey).AsIntegers[I] := viID;

      Inc(I);

      if I = CL_RECORDS_PER_EXECUTE then
      begin
        viQuery.Execute(I);
        Result := Result + viQuery.RowsAffected;
        I := 0;
      end;
    end;

    if I > 0 then
    begin
      viQuery.Execute(I);
      Result := Result + viQuery.RowsAffected;
    end;
  finally
    viQuery.Free;
  end;
end;

destructor TDAO<T>.Destroy;
begin
  FColumns.Free;
  inherited;
end;

function TDAO<T>.ExecuteQueryBatch(
  const vpSQL: string;
  const vpValues: TObjectList<T>): Integer;
var
  viQuery: TI9Query;
  viValue: T;
  I: Integer;
begin
  Result := 0;
  viQuery := CreateQuery;
  I := 0;

  try
    viQuery.SQL.Text := vpSQL;
    viQuery.Params.ArraySize := CL_RECORDS_PER_EXECUTE;

    for viValue in vpValues do
    begin
      FillParams(
        viQuery.Params,
        I,
        viValue);

      Inc(I);

      if I = CL_RECORDS_PER_EXECUTE then
      begin
        viQuery.Execute(I);
        Result := Result + viQuery.RowsAffected;
        I := 0;
      end;
    end;

    if I > 0 then
    begin
      viQuery.Execute(I);
      Result := Result + viQuery.RowsAffected;
    end;
  finally
    viQuery.Free;
  end;
end;

function TDAO<T>.Exists(
  const vpSkip: Integer;
  const vpCondition: string;
  const vpParams: array of Variant;
  const vpOrder: string): Boolean;
var
  viDataSet: TDataSet;
begin
  Result := False;
  viDataSet := nil;

  try
    viDataSet := GetListAsDataSet(
      ['1'],
      1,
      vpSkip,
      vpCondition,
      vpParams,
      vpOrder);

    if viDataSet.IsEmpty then
      Exit;

    Result := True;
  finally
    if Assigned(viDataSet) then
      viDataSet.Close;

    FreeAndNil(viDataSet);
  end;
end;

function TDAO<T>.GetObject(
  const vpCondition: string;
  const vpParams: array of Variant;
  const vpOrder: string): T;
var
  viList: TObjectList<T>;
begin
  Result := nil;
  viList := nil;

  try
    try
      viList := GetList(
        1,
        0,
        vpCondition,
        vpParams,
        vpOrder);

      if not Assigned(viList) then
        Exit;

      if viList.Count = 0 then
        Exit;

      Result := viList.First;
    except
      Result.Free;
      raise;
    end;
  finally
    if Assigned(viList) then
      viList.OwnsObjects := False;

    viList.Free;
  end;
end;

function TDAO<T>.GetByID(
  const vpID: Integer): T;
var
  viDataSet: TDataSet;
begin
  Result := nil;
  viDataSet := nil;

  try
    try
      viDataSet := GetByID_AsDataSet(
        [],
        vpID);

      if viDataSet.IsEmpty then
        Exit;

      Result := CreateObject(
        viDataSet);
    except
      Result.Free;
      raise;
    end;
  finally
    if Assigned(viDataSet) then
      viDataSet.Close;

    viDataSet.Free;
  end;
end;

function TDAO<T>.GetByID_AsDataSet(
  const vpColumns: array of string;
  const vpID: Integer): TDataSet;
var
  viCondition: string;
  viParam: string;
begin
  viParam := GetParamName(
    FPrimaryKey);

  viCondition := string.Format(
    '%s = %s',
    [FPrimaryKey,
    viParam]);

  Result := GetListAsDataSet(
    vpColumns,
    0,
    0,
    viCondition,
    [vpID],
    string.Empty);
end;

function TDAO<T>.GetDeleteSQL: string;
var
  viParam: string;
  viCondition: string;
begin
  viParam := GetParamName(
    FPrimaryKey);

  viCondition := string.Format(
    '%s = %s',
    [FPrimaryKey,
    viParam]);

  Result := string.Format(
    'DELETE FROM %s WHERE %s',
    [GetTableName,
    viCondition]);
end;

function TDAO<T>.GetInsertSQL: string;
var
  viSQL_Columns: string;
  viColumn: string;
  viParam: string;
  viParams: TStrings;
  viSQL_Params: string;
begin
  viParams := TStringList.Create;
  try
    viSQL_Columns := string.Join(
      ', ',
      FColumns.ToStringArray);

    for viColumn in FColumns do
    begin
      viParam := GetParamName(
        viColumn);

      viParams.Add(
        viParam);
    end;

    viSQL_Params := string.Join(
      ', ',
      viParams.ToStringArray);

    Result := string.Format(
      'INSERT INTO %s (%s) VALUES (%s)',
      [GetTableName,
      viSQL_Columns,
      viSQL_Params]);
  finally
    viParams.Free;
  end;
end;

function TDAO<T>.GetList(
  const vpFirst: Integer;
  const vpSkip: Integer;
  const vpCondition: string;
  const vpParams: array of Variant;
  const vpOrder: string): TObjectList<T>;
var
  viDataSet: TDataSet;
  viObject: T;
begin
  Result := nil;
  viDataSet := nil;

  try
    try
      viDataSet := GetListAsDataSet(
        [],
        vpFirst,
        vpSkip,
        vpCondition,
        vpParams,
        vpOrder);

      if viDataSet.IsEmpty then
        Exit;

      Result := TObjectList<T>.Create;

      viDataSet.First;
      while not viDataSet.Eof do
      begin
        viObject := CreateObject(
          viDataSet);

        Result.Add(
          viObject);

        viDataSet.Next;
      end;
    except
      Result.Free;
      raise;
    end;
  finally
    if Assigned(viDataSet) then
      viDataSet.Close;

    viDataSet.Free;
  end;
end;

function TDAO<T>.GetListAsDataSet(
  const vpColumns: array of string;
  const vpFirst: Integer;
  const vpSkip: Integer;
  const vpCondition: string;
  const vpParams: array of Variant;
  const vpOrder: string): TDataSet;
var
  viSQL: string;
  viFirst: string;
  viSkip: string;
  viOrder: string;
  viQuery: TI9Query;
  viWhere: string;
  viSQL_Columns: string;
begin
  viQuery := CreateQuery;
  Result := viQuery;

  try
    viFirst := string.Empty;
    if vpFirst > 0 then
      viFirst := 'FIRST ' + vpFirst.ToString;

    viSkip := string.Empty;
    if vpSkip > 0 then
      viSkip := 'SKIP ' + vpSkip.ToString;

    viSQL_Columns := '*';
    if Length(vpColumns) > 0 then
      viSQL_Columns := string.Join(
        ', ',
        vpColumns);

    viWhere := string.Empty;
    if not vpCondition.IsEmpty then
      viWhere := 'WHERE ' + vpCondition;

    viOrder := string.Empty;
    if not vpOrder.IsEmpty then
      viOrder := 'ORDER BY ' + vpOrder;

    viSQL := string.Format(
      'SELECT %s %s %s FROM %s %s %s',
      [viFirst,
      viSkip,
      viSQL_Columns,
      GetTableName,
      viWhere,
      viOrder]);

    viQuery.Open(
      viSQL,
      vpParams);
  except
    Result.Close;
    Result.Free;
    raise;
  end;
end;

function TDAO<T>.GetParamName(
  const vpColumn: string): string;
begin
  Result := ':' + vpColumn;
end;

function TDAO<T>.GetPostSQL: string;
var
  viSQL_Columns: string;
  viColumn: string;
  viParam: string;
  viParams: TStrings;
  viSQL_Params: string;
begin
  viParams := TStringList.Create;
  try
    viSQL_Columns := string.Join(
      ', ',
      FColumns.ToStringArray);

    for viColumn in FColumns do
    begin
      viParam := GetParamName(
        viColumn);

      viParams.Add(
        viParam);
    end;

    viSQL_Params := string.Join(
      ', ',
      viParams.ToStringArray);

    Result := string.Format(
      'UPDATE OR INSERT INTO %s (%s) VALUES (%s)',
      [GetTableName,
      viSQL_Columns,
      viSQL_Params]);
  finally
    viParams.Free;
  end;
end;

function TDAO<T>.GetUpdateSQL: string;
var
  viColumn: string;
  viParam: string;
  viSQL_Values: string;
  viValue: string;
  viValues: TStrings;
  viCondition: string;
begin
  viValues := TStringList.Create;
  try
    for viColumn in FColumns do
    begin
      if viColumn = FPrimaryKey then
        Continue;

      viParam := GetParamName(
        viColumn);

      viValue := string.Format(
        '%s = %s',
        [viColumn,
        viParam]);

      viValues.Add(
        viValue);
    end;

    viSQL_Values := string.Join(
      ', ',
      viValues.ToStringArray);

    viParam := GetParamName(
      FPrimaryKey);

    viCondition := string.Format(
      '%s = %s',
      [FPrimaryKey,
      viParam]);

    Result := string.Format(
      'UPDATE %s SET %s WHERE %s',
      [GetTableName,
      viSQL_Values,
      viCondition]);
  finally
    viValues.Free;
  end;
end;

function TDAO<T>.Insert(
  const vpValue: T): Integer;
var
  viValues: TObjectList<T>;
begin
  viValues := TObjectList<T>.Create(
    False);

  try
    viValues.Add(
      vpValue);

    Result := InsertBatch(
      viValues);
  finally
    viValues.Free;
  end;
end;

function TDAO<T>.InsertBatch(
  const vpValues: TObjectList<T>): Integer;
var
  viSQL: string;
begin
  viSQL := GetInsertSQL;

  Result := ExecuteQueryBatch(
    viSQL,
    vpValues);
end;

function TDAO<T>.Update(
  const vpValue: T): Integer;
var
  viValues: TObjectList<T>;
begin
  viValues := TObjectList<T>.Create(
    False);

  try
    viValues.Add(
      vpValue);

    Result := UpdateBatch(
      viValues);
  finally
    viValues.Free;
  end;
end;

function TDAO<T>.UpdateBatch(
  const vpValues: TObjectList<T>): Integer;
var
  viSQL: string;
begin
  viSQL := GetUpdateSQL;

  Result := ExecuteQueryBatch(
    viSQL,
    vpValues);
end;

function TDAO<T>.Post(
  const vpValue: T): Integer;
var
  viValues: TObjectList<T>;
begin
  viValues := TObjectList<T>.Create(
    False);

  try
    viValues.Add(
      vpValue);

    Result := PostBatch(
      viValues);
  finally
    viValues.Free;
  end;
end;

function TDAO<T>.PostBatch(
  const vpValues: TObjectList<T>): Integer;
var
  viSQL: string;
begin
  viSQL := GetPostSQL;

  Result := ExecuteQueryBatch(
    viSQL,
    vpValues);
end;

{ TAbstractDAO }

constructor TAbstractDAO.Create(
  const vpConnection: TI9Connection);
begin
  inherited Create;
  FConnection := vpConnection;
end;

function TAbstractDAO.CreateQuery: TI9Query;
begin
  Result := TI9Query.Create(nil);
  Result.Connection := FConnection;
end;

end.
