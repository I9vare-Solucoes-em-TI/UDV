unit Geral.Model.Spec.QueryBuilder;

interface

uses
  Data.DB;

type
  TParamValue = record
    Name: string;
    Value: Variant;

    constructor New(
      const vpName: string;
      const vpValue: Variant);
  end;

  TBeforeOpen<T: TDataSet> = reference to procedure(
    const vpQuery: T);

  IQueryBuilder<T: TDataSet> = interface
    ['{2D315059-ABE8-4AF3-B335-4AF8A432ECC1}']

    function First(
      const vpFirst: Integer): IQueryBuilder<T>;

    function Skip(
      const vpSkip: Integer): IQueryBuilder<T>;

    function Distinct: IQueryBuilder<T>;

    function Columns(
      const vpColumns: TArray<string>): IQueryBuilder<T>;

    function Table(
      const vpTable: string): IQueryBuilder<T>;

    function Tables(
      const vpTables: TArray<string>): IQueryBuilder<T>;

    function Joins(
      const vpJoins: TArray<string>): IQueryBuilder<T>;

    function Where(
      const vpCondition: string): IQueryBuilder<T>;

    function GroupBy(
      const vpColumns: TArray<string>): IQueryBuilder<T>;

    function Having(
      const vpCondition: string): IQueryBuilder<T>;

    function OrderBy(
      const vpColumns: TArray<string>): IQueryBuilder<T>;

    function Sql(
      const vpSql: string): IQueryBuilder<T>;

    function Params(
      const vpParams: TArray<TParamValue>): IQueryBuilder<T>; overload;

    function Params(
      const vpParams: TArray<Variant>): IQueryBuilder<T>; overload;

    function RegisterBeforeOpen(
      const vpBeforeOpen: TBeforeOpen<T>): IQueryBuilder<T>;

    function Open: T;
  end;

implementation

{ TParamValue }

constructor TParamValue.New(
  const vpName: string;
  const vpValue: Variant);
begin
  Name := vpName;
  Value := vpValue;
end;

end.
