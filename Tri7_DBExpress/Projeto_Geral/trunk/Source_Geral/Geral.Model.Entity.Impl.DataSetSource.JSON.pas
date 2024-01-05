unit Geral.Model.Entity.Impl.DataSetSource.JSON;

interface

uses
  Geral.Model.Entity.Spec.DataSetSource,
  Data.DB,
  System.JSON,
  Data.FmtBcd,
  Geral.Model.Entity.AnonymousMethods;

type
  IJSONValueToValue<T> = interface
    ['{B5C98B5B-86C2-4D2C-BB7E-DA64ABCF606E}']

    function Value: TFunction<TJSONValue, T>;
  end;

  TDefaultJSONValueToString = class(TInterfacedObject,
    IJSONValueToValue<string>)
  private
    function JSONValueToString(
      const vpValue: TJSONValue): string;
  public
    function Value: TFunction<TJSONValue, string>;
    class function New: IJSONValueToValue<string>;
  end;

  TDefaultJSONValueToInteger = class(TInterfacedObject,
    IJSONValueToValue<Integer>)
  private
    function JSONValueToInteger(
      const vpValue: TJSONValue): Integer;
  public
    function Value: TFunction<TJSONValue, Integer>;
    class function New: IJSONValueToValue<Integer>;
  end;

  TDefaultJSONValueToBoolean = class(TInterfacedObject,
    IJSONValueToValue<Boolean>)
  private
    function JSONValueToBoolean(
      const vpValue: TJSONValue): Boolean;
  public
    function Value: TFunction<TJSONValue, Boolean>;
    class function New: IJSONValueToValue<Boolean>;
  end;

  TDefaultJSONValueToDouble = class(TInterfacedObject,
    IJSONValueToValue<Double>)
  private
    function JSONValueToDouble(
      const vpValue: TJSONValue): Double;
  public
    function Value: TFunction<TJSONValue, Double>;
    class function New: IJSONValueToValue<Double>;
  end;

  TDefaultJSONValueToCurrency = class(TInterfacedObject,
    IJSONValueToValue<Currency>)
  private
    function JSONValueToCurrency(
      const vpValue: TJSONValue): Currency;
  public
    function Value: TFunction<TJSONValue, Currency>;
    class function New: IJSONValueToValue<Currency>;
  end;

  TDefaultJSONValueToBcd = class(TInterfacedObject,
    IJSONValueToValue<TBcd>)
  private
    function JSONValueToBcd(
      const vpValue: TJSONValue): TBcd;
  public
    function Value: TFunction<TJSONValue, TBcd>;
    class function New: IJSONValueToValue<TBcd>;
  end;

  TDefaultJSONValueToDateTime = class(TInterfacedObject,
    IJSONValueToValue<TDateTime>)
  private
    function JSONValueToDateTime(
      const vpValue: TJSONValue): TDateTime;
  public
    function Value: TFunction<TJSONValue, TDateTime>;
    class function New: IJSONValueToValue<TDateTime>;
  end;

  TDefaultJSONValueToBytes = class(TInterfacedObject,
    IJSONValueToValue<TArray<Byte>>)
  private
    function JSONValueToBytes(
      const vpValue: TJSONValue): TArray<Byte>;
  public
    function Value: TFunction<TJSONValue, TArray<Byte>>;
    class function New: IJSONValueToValue<TArray<Byte>>;
  end;

  TSimpleJSONValueToCurrency = class(TInterfacedObject,
    IJSONValueToValue<Currency>)
  private
    function JSONValueToCurrency(
      const vpValue: TJSONValue): Currency;
  public
    function Value: TFunction<TJSONValue, Currency>;
    class function New: IJSONValueToValue<Currency>;
  end;

  TCustomJSONValueToValue<T> = class(TInterfacedObject, IJSONValueToValue<T>)
  private
    FValue: TFunction<TJSONValue, T>;
  public
    constructor Create(
      const vpValue: TFunction<TJSONValue, T>); reintroduce;

    function Value: TFunction<TJSONValue, T>;

    class function New(
      const vpValue: TFunction<TJSONValue, T>): IJSONValueToValue<T>;
  end;

  TJSONObjectAsDataSetSource<T: TDataSet> = class(TInterfacedObject,
    IDataSetSource<T>)
  private
    FJSONObject: TJSONObject;
    FDataSet: T;
    FJSONValueToString: IJSONValueToValue<string>;
    FJSONValueToInteger: IJSONValueToValue<Integer>;
    FJSONValueToBoolean: IJSONValueToValue<Boolean>;
    FJSONValueToDouble: IJSONValueToValue<Double>;
    FJSONValueToCurrency: IJSONValueToValue<Currency>;
    FJSONValueToBcd: IJSONValueToValue<TBcd>;
    FJSONValueToDateTime: IJSONValueToValue<TDateTime>;
    FJSONValueToBytes: IJSONValueToValue<TArray<Byte>>;

    function FieldByJSONPair(
      const vpJSONPair: TJSONPair): TField;

    function FillField(
      const vpValue: TJSONValue;
      const vpField: TField): TField;

    function JSONValueToString(
      const vpValue: TJSONValue): string;

    function JSONValueToInteger(
      const vpValue: TJSONValue): Integer;

    function JSONValueToBoolean(
      const vpValue: TJSONValue): Boolean;

    function JSONValueToDouble(
      const vpValue: TJSONValue): Double;

    function JSONValueToCurrency(
      const vpValue: TJSONValue): Currency;

    function JSONValueToBcd(
      const vpValue: TJSONValue): TBcd;

    function JSONValueToDateTime(
      const vpValue: TJSONValue): TDateTime;

    function JSONValueToBytes(
      const vpValue: TJSONValue): TArray<Byte>;
  public
    constructor Create(
      const vpJSONObject: TJSONObject;
      const vpDataSet: T;
      const vpJSONValueToString: IJSONValueToValue<string>;
      const vpJSONValueToInteger: IJSONValueToValue<Integer>;
      const vpJSONValueToBoolean: IJSONValueToValue<Boolean>;
      const vpJSONValueToDouble: IJSONValueToValue<Double>;
      const vpJSONValueToCurrency: IJSONValueToValue<Currency>;
      const vpJSONValueToBcd: IJSONValueToValue<TBcd>;
      const vpJSONValueToDateTime: IJSONValueToValue<TDateTime>;
      const vpJSONValueToBytes: IJSONValueToValue<TArray<Byte>>); reintroduce;

    function Data: T;

    class function New(
      const vpJSONObject: TJSONObject;
      const vpDataSet: T): IDataSetSource<T>; overload;

    class function New(
      const vpJSONObject: TJSONObject;
      const vpDataSet: T;
      const vpJSONValueToString: IJSONValueToValue<string>;
      const vpJSONValueToInteger: IJSONValueToValue<Integer>;
      const vpJSONValueToBoolean: IJSONValueToValue<Boolean>;
      const vpJSONValueToDouble: IJSONValueToValue<Double>;
      const vpJSONValueToCurrency: IJSONValueToValue<Currency>;
      const vpJSONValueToBcd: IJSONValueToValue<TBcd>;
      const vpJSONValueToDateTime: IJSONValueToValue<TDateTime>;
      const vpJSONValueToBytes: IJSONValueToValue<TArray<Byte>>):
      IDataSetSource<T>; overload;
  end;

  TJSONArrayAsDataSetSource<T: TDataSet> = class(TInterfacedObject,
    IDataSetSource<T>)
  private
    FJSONArray: TJSONArray;
    FDataSet: T;
    FJSONValueToString: IJSONValueToValue<string>;
    FJSONValueToInteger: IJSONValueToValue<Integer>;
    FJSONValueToBoolean: IJSONValueToValue<Boolean>;
    FJSONValueToDouble: IJSONValueToValue<Double>;
    FJSONValueToCurrency: IJSONValueToValue<Currency>;
    FJSONValueToBcd: IJSONValueToValue<TBcd>;
    FJSONValueToDateTime: IJSONValueToValue<TDateTime>;
    FJSONValueToBytes: IJSONValueToValue<TArray<Byte>>;
  public
    constructor Create(
      const vpJSONArray: TJSONArray;
      const vpDataSet: T;
      const vpJSONValueToString: IJSONValueToValue<string>;
      const vpJSONValueToInteger: IJSONValueToValue<Integer>;
      const vpJSONValueToBoolean: IJSONValueToValue<Boolean>;
      const vpJSONValueToDouble: IJSONValueToValue<Double>;
      const vpJSONValueToCurrency: IJSONValueToValue<Currency>;
      const vpJSONValueToBcd: IJSONValueToValue<TBcd>;
      const vpJSONValueToDateTime: IJSONValueToValue<TDateTime>;
      const vpJSONValueToBytes: IJSONValueToValue<TArray<Byte>>); reintroduce;

    function Data: T;

    class function New(
      const vpJSONArray: TJSONArray;
      const vpDataSet: T): IDataSetSource<T>; overload;

    class function New(
      const vpJSONArray: TJSONArray;
      const vpDataSet: T;
      const vpJSONValueToString: IJSONValueToValue<string>;
      const vpJSONValueToInteger: IJSONValueToValue<Integer>;
      const vpJSONValueToBoolean: IJSONValueToValue<Boolean>;
      const vpJSONValueToDouble: IJSONValueToValue<Double>;
      const vpJSONValueToCurrency: IJSONValueToValue<Currency>;
      const vpJSONValueToBcd: IJSONValueToValue<TBcd>;
      const vpJSONValueToDateTime: IJSONValueToValue<TDateTime>;
      const vpJSONValueToBytes: IJSONValueToValue<TArray<Byte>>):
      IDataSetSource<T>; overload;
  end;

implementation

uses
  System.SysUtils,
  System.DateUtils,
  System.NetEncoding;

{ TJSONObjectAsDataSetSource }

constructor TJSONObjectAsDataSetSource<T>.Create(
  const vpJSONObject: TJSONObject;
  const vpDataSet: T;
  const vpJSONValueToString: IJSONValueToValue<string>;
  const vpJSONValueToInteger: IJSONValueToValue<Integer>;
  const vpJSONValueToBoolean: IJSONValueToValue<Boolean>;
  const vpJSONValueToDouble: IJSONValueToValue<Double>;
  const vpJSONValueToCurrency: IJSONValueToValue<Currency>;
  const vpJSONValueToBcd: IJSONValueToValue<TBcd>;
  const vpJSONValueToDateTime: IJSONValueToValue<TDateTime>;
  const vpJSONValueToBytes: IJSONValueToValue<TArray<Byte>>);
begin
  inherited Create;
  FJSONObject := vpJSONObject;
  FDataSet := vpDataSet;
  FJSONValueToString := vpJSONValueToString;
  FJSONValueToInteger := vpJSONValueToInteger;
  FJSONValueToBoolean := vpJSONValueToBoolean;
  FJSONValueToDouble := vpJSONValueToDouble;
  FJSONValueToCurrency := vpJSONValueToCurrency;
  FJSONValueToBcd := vpJSONValueToBcd;
  FJSONValueToDateTime := vpJSONValueToDateTime;
  FJSONValueToBytes := vpJSONValueToBytes;
end;

function TJSONObjectAsDataSetSource<T>.Data: T;
{$REGION 'Variáveis'}
var
  viJSONPair: TJSONPair;
  viField: TField;
{$ENDREGION}
begin
  Result := FDataSet;

  for viJSONPair in FJSONObject do
  begin
    viField := FieldByJSONPair(
      viJSONPair);

    if not Assigned(
      viField) then
      Continue;

    FillField(
      viJSONPair.JsonValue,
      viField);
  end;
end;

function TJSONObjectAsDataSetSource<T>.FieldByJSONPair(
  const vpJSONPair: TJSONPair): TField;
{$REGION 'Variáveis'}
var
  viField: TField;
{$ENDREGION}
begin
  for viField in FDataSet.Fields do
    if SameText(
      JSONValueToString(
        vpJSONPair.JsonString),
      viField.FieldName) then
      Exit(
        viField);

  Result := nil;
end;

function TJSONObjectAsDataSetSource<T>.FillField(
  const vpValue: TJSONValue;
  const vpField: TField): TField;
begin
  Result := vpField;

  if vpValue.Null then
  begin
    Result.Clear;
    Exit;
  end;

  case vpField.DataType of
    TFieldType.ftString:
      Result.AsString := JSONValueToString(
        vpValue);

    TFieldType.ftInteger:
      Result.AsInteger := JSONValueToInteger(
        vpValue);

    TFieldType.ftBoolean:
      Result.AsBoolean := JSONValueToBoolean(
        vpValue);

    TFieldType.ftFloat:
      Result.AsFloat := JSONValueToDouble(
        vpValue);

    TFieldType.ftCurrency:
      Result.AsCurrency := JSONValueToCurrency(
        vpValue);

    TFieldType.ftBCD, TFieldType.ftFMTBcd:
      Result.AsBCD := JSONValueToBcd(
        vpValue);

    TFieldType.ftDateTime, TFieldType.ftTimeStamp:
      Result.AsDateTime := JSONValueToDateTime(
        vpValue);

    TFieldType.ftBlob:
      Result.AsBytes := JSONValueToBytes(
        vpValue);
  end;
end;

function TJSONObjectAsDataSetSource<T>.JSONValueToBcd(
  const vpValue: TJSONValue): TBcd;
begin
  Result := FJSONValueToBcd
  .Value
  .Invoke(
    vpValue);
end;

function TJSONObjectAsDataSetSource<T>.JSONValueToBoolean(
  const vpValue: TJSONValue): Boolean;
begin
  Result := FJSONValueToBoolean
  .Value
  .Invoke(
    vpValue);
end;

function TJSONObjectAsDataSetSource<T>.JSONValueToBytes(
  const vpValue: TJSONValue): TArray<Byte>;
begin
  Result := FJSONValueToBytes
  .Value
  .Invoke(
    vpValue);
end;

function TJSONObjectAsDataSetSource<T>.JSONValueToCurrency(
  const vpValue: TJSONValue): Currency;
begin
  Result := FJSONValueToCurrency
  .Value
  .Invoke(
    vpValue);
end;

function TJSONObjectAsDataSetSource<T>.JSONValueToDateTime(
  const vpValue: TJSONValue): TDateTime;
begin
  Result := FJSONValueToDateTime
  .Value
  .Invoke(
    vpValue);
end;

function TJSONObjectAsDataSetSource<T>.JSONValueToDouble(
  const vpValue: TJSONValue): Double;
begin
  Result := FJSONValueToDouble
  .Value
  .Invoke(
    vpValue);
end;

function TJSONObjectAsDataSetSource<T>.JSONValueToInteger(
  const vpValue: TJSONValue): Integer;
begin
  Result := FJSONValueToInteger
  .Value
  .Invoke(
    vpValue);
end;

function TJSONObjectAsDataSetSource<T>.JSONValueToString(
  const vpValue: TJSONValue): string;
begin
  Result := FJSONValueToString
  .Value
  .Invoke(
    vpValue);
end;

class function TJSONObjectAsDataSetSource<T>.New(
  const vpJSONObject: TJSONObject;
  const vpDataSet: T;
  const vpJSONValueToString: IJSONValueToValue<string>;
  const vpJSONValueToInteger: IJSONValueToValue<Integer>;
  const vpJSONValueToBoolean: IJSONValueToValue<Boolean>;
  const vpJSONValueToDouble: IJSONValueToValue<Double>;
  const vpJSONValueToCurrency: IJSONValueToValue<Currency>;
  const vpJSONValueToBcd: IJSONValueToValue<TBcd>;
  const vpJSONValueToDateTime: IJSONValueToValue<TDateTime>;
  const vpJSONValueToBytes: IJSONValueToValue<TArray<Byte>>): IDataSetSource<T>;
begin
  Result := Create(
    vpJSONObject,
    vpDataSet,
    vpJSONValueToString,
    vpJSONValueToInteger,
    vpJSONValueToBoolean,
    vpJSONValueToDouble,
    vpJSONValueToCurrency,
    vpJSONValueToBcd,
    vpJSONValueToDateTime,
    vpJSONValueToBytes);
end;

class function TJSONObjectAsDataSetSource<T>.New(
  const vpJSONObject: TJSONObject;
  const vpDataSet: T): IDataSetSource<T>;
begin
  Result := New(
    vpJSONObject,
    vpDataSet,
    TDefaultJSONValueToString.New,
    TDefaultJSONValueToInteger.New,
    TDefaultJSONValueToBoolean.New,
    TDefaultJSONValueToDouble.New,
    TDefaultJSONValueToCurrency.New,
    TDefaultJSONValueToBcd.New,
    TDefaultJSONValueToDateTime.New,
    TDefaultJSONValueToBytes.New);
end;

{ TJSONArrayAsDataSetSource }

constructor TJSONArrayAsDataSetSource<T>.Create(
  const vpJSONArray: TJSONArray;
  const vpDataSet: T;
  const vpJSONValueToString: IJSONValueToValue<string>;
  const vpJSONValueToInteger: IJSONValueToValue<Integer>;
  const vpJSONValueToBoolean: IJSONValueToValue<Boolean>;
  const vpJSONValueToDouble: IJSONValueToValue<Double>;
  const vpJSONValueToCurrency: IJSONValueToValue<Currency>;
  const vpJSONValueToBcd: IJSONValueToValue<TBcd>;
  const vpJSONValueToDateTime: IJSONValueToValue<TDateTime>;
  const vpJSONValueToBytes: IJSONValueToValue<TArray<Byte>>);
begin
  inherited Create;
  FJSONArray := vpJSONArray;
  FDataSet := vpDataSet;
  FJSONValueToString := vpJSONValueToString;
  FJSONValueToInteger := vpJSONValueToInteger;
  FJSONValueToBoolean := vpJSONValueToBoolean;
  FJSONValueToDouble := vpJSONValueToDouble;
  FJSONValueToCurrency := vpJSONValueToCurrency;
  FJSONValueToBcd := vpJSONValueToBcd;
  FJSONValueToDateTime := vpJSONValueToDateTime;
  FJSONValueToBytes := vpJSONValueToBytes;
end;

function TJSONArrayAsDataSetSource<T>.Data: T;
{$REGION 'Variáveis'}
var
  viBookmark: TBookmark;
  viJSONValue: TJSONValue;
{$ENDREGION}
begin
  Result := FDataSet;
  viBookmark := FDataSet.Bookmark;

  try
    for viJSONValue in FJSONArray do
    begin
      Result.Append;

      TJSONObjectAsDataSetSource<T>.New(
        TJSONObject(
          viJSONValue),
        Result,
        FJSONValueToString,
        FJSONValueToInteger,
        FJSONValueToBoolean,
        FJSONValueToDouble,
        FJSONValueToCurrency,
        FJSONValueToBcd,
        FJSONValueToDateTime,
        FJSONValueToBytes)
      .Data;

      Result.Post;
    end;
  finally
    FDataSet.GotoBookmark(
      viBookmark);
  end;
end;

class function TJSONArrayAsDataSetSource<T>.New(
  const vpJSONArray: TJSONArray;
  const vpDataSet: T;
  const vpJSONValueToString: IJSONValueToValue<string>;
  const vpJSONValueToInteger: IJSONValueToValue<Integer>;
  const vpJSONValueToBoolean: IJSONValueToValue<Boolean>;
  const vpJSONValueToDouble: IJSONValueToValue<Double>;
  const vpJSONValueToCurrency: IJSONValueToValue<Currency>;
  const vpJSONValueToBcd: IJSONValueToValue<TBcd>;
  const vpJSONValueToDateTime: IJSONValueToValue<TDateTime>;
  const vpJSONValueToBytes: IJSONValueToValue<TArray<Byte>>): IDataSetSource<T>;
begin
  Result := Create(
    vpJSONArray,
    vpDataSet,
    vpJSONValueToString,
    vpJSONValueToInteger,
    vpJSONValueToBoolean,
    vpJSONValueToDouble,
    vpJSONValueToCurrency,
    vpJSONValueToBcd,
    vpJSONValueToDateTime,
    vpJSONValueToBytes);
end;

class function TJSONArrayAsDataSetSource<T>.New(
  const vpJSONArray: TJSONArray;
  const vpDataSet: T): IDataSetSource<T>;
begin
  Result := New(
    vpJSONArray,
    vpDataSet,
    TDefaultJSONValueToString.New,
    TDefaultJSONValueToInteger.New,
    TDefaultJSONValueToBoolean.New,
    TDefaultJSONValueToDouble.New,
    TDefaultJSONValueToCurrency.New,
    TDefaultJSONValueToBcd.New,
    TDefaultJSONValueToDateTime.New,
    TDefaultJSONValueToBytes.New);
end;

{ TDefaultJSONValueToString }

function TDefaultJSONValueToString.JSONValueToString(
  const vpValue: TJSONValue): string;
begin
  Result := TJSONString(
    vpValue)
  .Value;
end;

class function TDefaultJSONValueToString.New: IJSONValueToValue<string>;
begin
  Result := Create;
end;

function TDefaultJSONValueToString.Value: TFunction<TJSONValue, string>;
begin
  Result := JSONValueToString;
end;

{ TDefaultJSONValueToInteger }

function TDefaultJSONValueToInteger.JSONValueToInteger(
  const vpValue: TJSONValue): Integer;
begin
  Result := TJSONNumber(
    vpValue)
  .AsInt;
end;

class function TDefaultJSONValueToInteger.New: IJSONValueToValue<Integer>;
begin
  Result := Create;
end;

function TDefaultJSONValueToInteger.Value: TFunction<TJSONValue, Integer>;
begin
  Result := JSONValueToInteger;
end;

{ TDefaultJSONValueToBoolean }

function TDefaultJSONValueToBoolean.JSONValueToBoolean(
  const vpValue: TJSONValue): Boolean;
begin
  Result := vpValue is TJSONTrue;
end;

class function TDefaultJSONValueToBoolean.New: IJSONValueToValue<Boolean>;
begin
  Result := Create;
end;

function TDefaultJSONValueToBoolean.Value: TFunction<TJSONValue, Boolean>;
begin
  Result := JSONValueToBoolean;
end;

{ TDefaultJSONValueToDouble }

function TDefaultJSONValueToDouble.JSONValueToDouble(
  const vpValue: TJSONValue): Double;
begin
  Result := TJSONNumber(
    vpValue)
  .AsDouble;
end;

class function TDefaultJSONValueToDouble.New: IJSONValueToValue<Double>;
begin
  Result := Create;
end;

function TDefaultJSONValueToDouble.Value: TFunction<TJSONValue, Double>;
begin
  Result := JSONValueToDouble;
end;

{ TDefaultJSONValueToCurrency }

function TDefaultJSONValueToCurrency.JSONValueToCurrency(
  const vpValue: TJSONValue): Currency;
begin
  Result := TSimpleJSONValueToCurrency
  .New
  .Value
  .Invoke(
    TJSONObject(
      vpValue)
    .Values['amount']);
end;

class function TDefaultJSONValueToCurrency.New: IJSONValueToValue<Currency>;
begin
  Result := Create;
end;

function TDefaultJSONValueToCurrency.Value: TFunction<TJSONValue, Currency>;
begin
  Result := JSONValueToCurrency;
end;

{ TDefaultJSONValueToBcd }

function TDefaultJSONValueToBcd.JSONValueToBcd(
  const vpValue: TJSONValue): TBcd;
begin
  Result := DoubleToBcd(
    TDefaultJSONValueToDouble
    .New
    .Value
    .Invoke(
      vpValue));
end;

class function TDefaultJSONValueToBcd.New: IJSONValueToValue<TBcd>;
begin
  Result := Create;
end;

function TDefaultJSONValueToBcd.Value: TFunction<TJSONValue, TBcd>;
begin
  Result := JSONValueToBcd;
end;

{ TDefaultJSONValueToDateTime }

function TDefaultJSONValueToDateTime.JSONValueToDateTime(
  const vpValue: TJSONValue): TDateTime;
begin
  Result := ISO8601ToDate(
    TDefaultJSONValueToString
    .New
    .Value
    .Invoke(
      vpValue));
end;

class function TDefaultJSONValueToDateTime.New: IJSONValueToValue<TDateTime>;
begin
  Result := Create;
end;

function TDefaultJSONValueToDateTime.Value: TFunction<TJSONValue, TDateTime>;
begin
  Result := JSONValueToDateTime;
end;

{ TDefaultJSONValueToBytes }

function TDefaultJSONValueToBytes.JSONValueToBytes(
  const vpValue: TJSONValue): TArray<Byte>;
begin
  Result := TNetEncoding.Base64.DecodeStringToBytes(
    TDefaultJSONValueToString
    .New
    .Value
    .Invoke(
      vpValue));
end;

class function TDefaultJSONValueToBytes.New: IJSONValueToValue<TArray<Byte>>;
begin
  Result := Create;
end;

function TDefaultJSONValueToBytes.Value: TFunction<TJSONValue, TArray<Byte>>;
begin
  Result := JSONValueToBytes;
end;

{ TSimpleJSONValueToCurrency }

function TSimpleJSONValueToCurrency.JSONValueToCurrency(
  const vpValue: TJSONValue): Currency;
begin
  Result := TJSONNumber(
    vpValue)
  .AsDouble;
end;

class function TSimpleJSONValueToCurrency.New: IJSONValueToValue<Currency>;
begin
  Result := Create;
end;

function TSimpleJSONValueToCurrency.Value: TFunction<TJSONValue, Currency>;
begin
  Result := JSONValueToCurrency;
end;

{ TCustomJSONValueToValue<T> }

constructor TCustomJSONValueToValue<T>.Create(
  const vpValue: TFunction<TJSONValue, T>);
begin
  inherited Create;
  FValue := vpValue;
end;

class function TCustomJSONValueToValue<T>.New(
  const vpValue: TFunction<TJSONValue, T>): IJSONValueToValue<T>;
begin
  Result := Create(
    vpValue);
end;

function TCustomJSONValueToValue<T>.Value: TFunction<TJSONValue, T>;
begin
  Result := FValue;
end;

end.
