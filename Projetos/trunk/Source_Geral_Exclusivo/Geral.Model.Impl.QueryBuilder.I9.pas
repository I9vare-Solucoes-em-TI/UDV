unit Geral.Model.Impl.QueryBuilder.I9;

interface

uses
  Geral.Model.Spec.QueryBuilder,
  I9Query,
  I9Connection;

type
  TParamValue = Geral.Model.Spec.QueryBuilder.TParamValue;

  TI9QueryBuilder = class(TInterfacedObject, IQueryBuilder<TI9Query>)
  private
    FConnection: TI9Connection;
    FFirst: Integer;
    FSkip: Integer;
    FDistinct: Boolean;
    FColumns: TArray<string>;
    FTables: TArray<string>;
    FJoins: TArray<string>;
    FCondition: string;
    FParams: TArray<TParamValue>;
    FUnnamedParams: TArray<Variant>;
    FGroupByColumns: TArray<string>;
    FHavingCondition: string;
    FOrderByColumns: TArray<string>;
    FSql: string;
    FBeforeOpen: TBeforeOpen<TI9Query>;

    constructor Create(
      const vpConnection: TI9Connection); reintroduce;

    function CreateSql: string;

    function CreateParams(
      const vpQuery: TI9Query): TArray<TParamValue>;

    procedure DoBeforeOpen(
      const vpQuery: TI9Query);
  public
    class function New(
      const vpConnection: TI9Connection): IQueryBuilder<TI9Query>;

    function First(
      const vpFirst: Integer): IQueryBuilder<TI9Query>;

    function Skip(
      const vpSkip: Integer): IQueryBuilder<TI9Query>;

    function Distinct: IQueryBuilder<TI9Query>;

    function Columns(
      const vpColumns: TArray<string>): IQueryBuilder<TI9Query>;

    function Table(
      const vpTable: string): IQueryBuilder<TI9Query>;

    function Tables(
      const vpTables: TArray<string>): IQueryBuilder<TI9Query>;

    function Joins(
      const vpJoins: TArray<string>): IQueryBuilder<TI9Query>;

    function Where(
      const vpCondition: string): IQueryBuilder<TI9Query>;

    function GroupBy(
      const vpColumns: TArray<string>): IQueryBuilder<TI9Query>;

    function Having(
      const vpCondition: string): IQueryBuilder<TI9Query>;

    function OrderBy(
      const vpColumns: TArray<string>): IQueryBuilder<TI9Query>;

    function Sql(
      const vpSql: string): IQueryBuilder<TI9Query>;

    function Params(
      const vpParams: TArray<TParamValue>): IQueryBuilder<TI9Query>; overload;

    function Params(
      const vpParams: TArray<Variant>): IQueryBuilder<TI9Query>; overload;

    function RegisterBeforeOpen(
      const vpBeforeOpen: TBeforeOpen<TI9Query>): IQueryBuilder<TI9Query>;

    function Open: TI9Query;
  end;

function NewParam(
  const vpName: string;
  const vpValue: Variant): TParamValue;

implementation

uses
  System.SysUtils,
  System.Generics.Collections,
  System.Classes,
  FireDAC.Stan.Param;

{ TI9QueryBuilder }

function TI9QueryBuilder.Columns(
  const vpColumns: TArray<string>): IQueryBuilder<TI9Query>;
begin
  FColumns := vpColumns;
  Result := Self;
end;

constructor TI9QueryBuilder.Create(
  const vpConnection: TI9Connection);
begin
  inherited Create;
  FConnection := vpConnection;
  FFirst := 0;
  FSkip := 0;
  FDistinct := False;
  FColumns := [];
  FTables := [];
  FJoins := [];
  FCondition := string.Empty;
  FParams := [];
  FUnnamedParams := [];
  FGroupByColumns := [];
  FHavingCondition := string.Empty;
  FOrderByColumns := [];
  FSql := string.Empty;
  FBeforeOpen := nil;
end;

function TI9QueryBuilder.CreateParams(
  const vpQuery: TI9Query): TArray<TParamValue>;
var
  I: Integer;
  viList: TList<TParamValue>;
  viParamValue: TParamValue;
begin
  viList := nil;
  try
    viList := TList<TParamValue>.Create;

    for I := 0 to vpQuery.Params.Count - 1 do
    begin
      viParamValue := NewParam(
        vpQuery.Params[I].Name,
        FUnnamedParams[I]);

      viList.Add(viParamValue);
    end;

    Result := viList.ToArray;
  finally
    FreeAndNil(viList);
  end;
end;

function TI9QueryBuilder.CreateSql: string;
var
  viDistinct: string;
  viColumns: string;
  viTables: string;
  viJoins: string;
  viWhere: string;
  viGroupBy: string;
  viHaving: string;
  viOrderBy: string;
begin
  viDistinct := string.Empty;
  if FDistinct then
    viDistinct := 'DISTINCT';

  viColumns := '*';
  if Length(FColumns) > 0 then
    viColumns := string.Join(
      ', ',
      FColumns);

  viTables := string.Join(
    ', ',
    FTables);

  viJoins := string.Empty;
  if Length(FJoins) > 0 then
    viJoins := string.Join(
      ' ',
      FJoins);

  viWhere := string.Empty;
  if not FCondition.IsEmpty then
    viWhere := 'WHERE ' + FCondition;

  viGroupBy := string.Empty;
  if Length(FGroupByColumns) > 0 then
    viGroupBy := string.Format(
      'GROUP BY %s',
      [string.Join(
        ', ',
        FGroupByColumns)]);

  viHaving := string.Empty;
  if not FHavingCondition.IsEmpty then
    viHaving := 'HAVING ' + FHavingCondition;

  viOrderBy := string.Empty;
  if Length(FOrderByColumns) > 0 then
    viOrderBy := string.Format(
      'ORDER BY %s',
      [string.Join(
        ', ',
        FOrderByColumns)]);

  Result := string.Format(
    'SELECT %s %s FROM %s %s %s %s %s %s',
    [viDistinct,
    viColumns,
    viTables,
    viJoins,
    viWhere,
    viGroupBy,
    viHaving,
    viOrderBy]);
end;

function TI9QueryBuilder.Distinct: IQueryBuilder<TI9Query>;
begin
  FDistinct := True;
  Result := Self;
end;

procedure TI9QueryBuilder.DoBeforeOpen(
  const vpQuery: TI9Query);
begin
  if not Assigned(FBeforeOpen) then
    Exit;

  FBeforeOpen(vpQuery);
end;

function TI9QueryBuilder.First(
  const vpFirst: Integer): IQueryBuilder<TI9Query>;
begin
  FFirst := vpFirst;
  Result := Self;
end;

function TI9QueryBuilder.GroupBy(
  const vpColumns: TArray<string>): IQueryBuilder<TI9Query>;
begin
  FGroupByColumns := vpColumns;
  Result := Self;
end;

function TI9QueryBuilder.Having(
  const vpCondition: string): IQueryBuilder<TI9Query>;
begin
  FHavingCondition := vpCondition;
  Result := Self;
end;

function TI9QueryBuilder.Joins(
  const vpJoins: TArray<string>): IQueryBuilder<TI9Query>;
begin
  FJoins := vpJoins;
  Result := Self;
end;

class function TI9QueryBuilder.New(
  const vpConnection: TI9Connection): IQueryBuilder<TI9Query>;
begin
  Result := Create(vpConnection);
end;

function TI9QueryBuilder.Open: TI9Query;
var
  viParamValue: TParamValue;
begin
  Result := nil;
  try
    Result := TI9Query.Create(nil);
    Result.Connection := FConnection;

    if FFirst > 0 then
      Result.FetchOptions.RecsMax := FFirst;

    if FSkip > 0 then
      Result.FetchOptions.RecsSkip := FSkip;

    if FSql.IsEmpty then
      Sql(CreateSql);

    Result.SQL.Text := FSql;

    if Length(FParams) = 0 then
      Params(CreateParams(Result));

    for viParamValue in FParams do
      Result.ParamByName(viParamValue.Name).Value := viParamValue.Value;

    DoBeforeOpen(Result);
    Result.Open;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

function TI9QueryBuilder.OrderBy(
  const vpColumns: TArray<string>): IQueryBuilder<TI9Query>;
begin
  FOrderByColumns := vpColumns;
  Result := Self;
end;

function TI9QueryBuilder.Params(
  const vpParams: TArray<Variant>): IQueryBuilder<TI9Query>;
begin
  FUnnamedParams := vpParams;
  Result := Self;
end;

function TI9QueryBuilder.RegisterBeforeOpen(
  const vpBeforeOpen: TBeforeOpen<TI9Query>): IQueryBuilder<TI9Query>;
begin
  FBeforeOpen := vpBeforeOpen;
  Result := Self;
end;

function TI9QueryBuilder.Params(
  const vpParams: TArray<TParamValue>): IQueryBuilder<TI9Query>;
begin
  FParams := vpParams;
  Result := Self;
end;

function TI9QueryBuilder.Skip(
  const vpSkip: Integer): IQueryBuilder<TI9Query>;
begin
  FSkip := vpSkip;
  Result := Self;
end;

function TI9QueryBuilder.Sql(
  const vpSql: string): IQueryBuilder<TI9Query>;
begin
  FSql := vpSql;
  Result := Self;
end;

function TI9QueryBuilder.Table(
  const vpTable: string): IQueryBuilder<TI9Query>;
begin
  Result := Tables([vpTable]);
end;

function TI9QueryBuilder.Tables(
  const vpTables: TArray<string>): IQueryBuilder<TI9Query>;
begin
  FTables := vpTables;
  Result := Self;
end;

function TI9QueryBuilder.Where(
  const vpCondition: string): IQueryBuilder<TI9Query>;
begin
  FCondition := vpCondition;
  Result := Self;
end;

function NewParam(
  const vpName: string;
  const vpValue: Variant): TParamValue;
begin
  Result := TParamValue.New(vpName, vpValue);
end;

end.
