unit Geral.Model.Entity.Impl.JSONSource.DataSet;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Geral.Model.Entity.Spec.JSONSource,
  System.JSON,
  Data.DB,
  Data.FmtBcd,
  Geral.Model.Entity.AnonymousMethods;

type
  IValueToJSONValue<T> = interface
    ['{0B3BC0E8-70F3-41A3-82E3-E08D52C766D5}']

    function JSONValue: TFunction<T, TJSONValue>;
  end;

  IJSONValueConverters = interface
    ['{31E0A0D9-CD5F-4191-A163-7CC0B51986FF}']

    function StringConverter: IValueToJSONValue<string>;
    function IntegerConverter: IValueToJSONValue<Integer>;
    function BooleanConverter: IValueToJSONValue<Boolean>;
    function DoubleConverter: IValueToJSONValue<Double>;
    function CurrencyConverter: IValueToJSONValue<Currency>;
    function BcdConverter: IValueToJSONValue<TBcd>;
    function DateTimeConverter: IValueToJSONValue<TDateTime>;
    function BytesConverter: IValueToJSONValue<TArray<Byte>>;

    function RegisterStringConverter(
      const vpValue: IValueToJSONValue<string>): IJSONValueConverters;

    function RegisterIntegerConverter(
      const vpValue: IValueToJSONValue<Integer>): IJSONValueConverters;

    function RegisterBooleanConverter(
      const vpValue: IValueToJSONValue<Boolean>): IJSONValueConverters;

    function RegisterDoubleConverter(
      const vpValue: IValueToJSONValue<Double>): IJSONValueConverters;

    function RegisterCurrencyConverter(
      const vpValue: IValueToJSONValue<Currency>): IJSONValueConverters;

    function RegisterBcdConverter(
      const vpValue: IValueToJSONValue<TBcd>): IJSONValueConverters;

    function RegisterDateTimeConverter(
      const vpValue: IValueToJSONValue<TDateTime>): IJSONValueConverters;

    function RegisterBytesConverter(
      const vpValue: IValueToJSONValue<TArray<Byte>>): IJSONValueConverters;
  end;

  TJSONValueConverters = class(TInterfacedObject, IJSONValueConverters)
  private
    FStringConverter: IValueToJSONValue<string>;
    FIntegerConverter: IValueToJSONValue<Integer>;
    FBooleanConverter: IValueToJSONValue<Boolean>;
    FDoubleConverter: IValueToJSONValue<Double>;
    FCurrencyConverter: IValueToJSONValue<Currency>;
    FBcdConverter: IValueToJSONValue<TBcd>;
    FDateTimeConverter: IValueToJSONValue<TDateTime>;
    FBytesConverter: IValueToJSONValue<TArray<Byte>>;
  public
    constructor Create(
      const vpStringToJSONValue: IValueToJSONValue<string>;
      const vpIntegerToJSONValue: IValueToJSONValue<Integer>;
      const vpBooleanToJSONValue: IValueToJSONValue<Boolean>;
      const vpDoubleToJSONValue: IValueToJSONValue<Double>;
      const vpCurrencyToJSONValue: IValueToJSONValue<Currency>;
      const vpBcdToJSONValue: IValueToJSONValue<TBcd>;
      const vpDateTimeToJSONValue: IValueToJSONValue<TDateTime>;
      const vpBytesToJSONValue: IValueToJSONValue<TArray<Byte>>); reintroduce;

    function StringConverter: IValueToJSONValue<string>;
    function IntegerConverter: IValueToJSONValue<Integer>;
    function BooleanConverter: IValueToJSONValue<Boolean>;
    function DoubleConverter: IValueToJSONValue<Double>;
    function CurrencyConverter: IValueToJSONValue<Currency>;
    function BcdConverter: IValueToJSONValue<TBcd>;
    function DateTimeConverter: IValueToJSONValue<TDateTime>;
    function BytesConverter: IValueToJSONValue<TArray<Byte>>;

    function RegisterStringConverter(
      const vpValue: IValueToJSONValue<string>): IJSONValueConverters;

    function RegisterIntegerConverter(
      const vpValue: IValueToJSONValue<Integer>): IJSONValueConverters;

    function RegisterBooleanConverter(
      const vpValue: IValueToJSONValue<Boolean>): IJSONValueConverters;

    function RegisterDoubleConverter(
      const vpValue: IValueToJSONValue<Double>): IJSONValueConverters;

    function RegisterCurrencyConverter(
      const vpValue: IValueToJSONValue<Currency>): IJSONValueConverters;

    function RegisterBcdConverter(
      const vpValue: IValueToJSONValue<TBcd>): IJSONValueConverters;

    function RegisterDateTimeConverter(
      const vpValue: IValueToJSONValue<TDateTime>): IJSONValueConverters;

    function RegisterBytesConverter(
      const vpValue: IValueToJSONValue<TArray<Byte>>): IJSONValueConverters;

    class function New: IJSONValueConverters;
  end;

  TDefaultStringToJSONValue = class(TInterfacedObject,
    IValueToJSONValue<string>)
  private
    function StringToJSONValue(
      const vpValue: string): TJSONValue;
  public
    function JSONValue: TFunction<string, TJSONValue>;
    class function New: IValueToJSONValue<string>;
  end;

  TDefaultIntegerToJSONValue = class(TInterfacedObject,
    IValueToJSONValue<Integer>)
  private
    function IntegerToJSONValue(
      const vpValue: Integer): TJSONValue;
  public
    function JSONValue: TFunction<Integer, TJSONValue>;
    class function New: IValueToJSONValue<Integer>;
  end;

  TDefaultBooleanToJSONValue = class(TInterfacedObject,
    IValueToJSONValue<Boolean>)
  private
    function BooleanToJSONValue(
      const vpValue: Boolean): TJSONValue;
  public
    function JSONValue: TFunction<Boolean, TJSONValue>;
    class function New: IValueToJSONValue<Boolean>;
  end;

  TDefaultDoubleToJSONValue = class(TInterfacedObject,
    IValueToJSONValue<Double>)
  private
    function DoubleToJSONValue(
      const vpValue: Double): TJSONValue;
  public
    function JSONValue: TFunction<Double, TJSONValue>;
    class function New: IValueToJSONValue<Double>;
  end;

  TDefaultCurrencyToJSONValue = class(TInterfacedObject,
    IValueToJSONValue<Currency>)
  private
    function CurrencyToJSONValue(
      const vpValue: Currency): TJSONValue;

    function ISO4217CurrencyCode: string;
    function LocaleName: string;
  public
    function JSONValue: TFunction<Currency, TJSONValue>;
    class function New: IValueToJSONValue<Currency>;
  end;

  TDefaultBcdToJSONValue = class(TInterfacedObject,
    IValueToJSONValue<TBcd>)
  private
    function BcdToJSONValue(
      const vpValue: TBcd): TJSONValue;
  public
    function JSONValue: TFunction<TBcd, TJSONValue>;
    class function New: IValueToJSONValue<TBcd>;
  end;

  TDefaultDateTimeToJSONValue = class(TInterfacedObject,
    IValueToJSONValue<TDateTime>)
  private
    function DateTimeToJSONValue(
      const vpValue: TDateTime): TJSONValue;
  public
    function JSONValue: TFunction<TDateTime, TJSONValue>;
    class function New: IValueToJSONValue<TDateTime>;
  end;

  TDefaultBytesToJSONValue = class(TInterfacedObject,
    IValueToJSONValue<TArray<Byte>>)
  private
    function BytesToJSONValue(
      const vpValue: TArray<Byte>): TJSONValue;
  public
    function JSONValue: TFunction<TArray<Byte>, TJSONValue>;
    class function New: IValueToJSONValue<TArray<Byte>>;
  end;

  TSimpleCurrencyToJSONValue = class(TInterfacedObject,
    IValueToJSONValue<Currency>)
  private
    function CurrencyToJSONValue(
      const vpValue: Currency): TJSONValue;
  public
    function JSONValue: TFunction<Currency, TJSONValue>;
    class function New: IValueToJSONValue<Currency>;
  end;

  TCustomValueToJSONValue<T> = class(TInterfacedObject, IValueToJSONValue<T>)
  private
    FJSONValue: TFunction<T, TJSONValue>;
  public
    constructor Create(
      const vpJSONValue: TFunction<T, TJSONValue>); reintroduce;

    function JSONValue: TFunction<T, TJSONValue>;

    class function New(
      const vpJSONValue: TFunction<T, TJSONValue>): IValueToJSONValue<T>;
  end;

  TDataSetRecordAsJSONSource<T: TDataSet> = class(TInterfacedObject,
    IJSONSource<TJSONObject>)
  private
    FDataSet: T;
    FJSONValueConverters: IJSONValueConverters;

    function CreateJSONPair(
      const vpField: TField): TJSONPair;

    function StringToJSONValue(
      const vpValue: string): TJSONValue;

    function IntegerToJSONValue(
      const vpValue: Integer): TJSONValue;

    function BooleanToJSONValue(
      const vpValue: Boolean): TJSONValue;

    function DoubleToJSONValue(
      const vpValue: Double): TJSONValue;

    function CurrencyToJSONValue(
      const vpValue: Currency): TJSONValue;

    function BcdToJSONValue(
      const vpValue: TBcd): TJSONValue;

    function DateTimeToJSONValue(
      const vpValue: TDateTime): TJSONValue;

    function BytesToJSONValue(
      const vpValue: TArray<Byte>): TJSONValue;

    function CreateJSONKey(
      const vpField: TField): TJSONString;

    function CreateJSONValue(
      const vpField: TField): TJSONValue;
  public
    constructor Create(
      const vpDataSet: T;
      const vpJSONValueConverters: IJSONValueConverters); reintroduce;

    function Data: TJSONObject;

    class function New(
      const vpDataSet: T): IJSONSource<TJSONObject>; overload;

    class function New(
      const vpDataSet: T;
      const vpJSONValueConverters: IJSONValueConverters):
      IJSONSource<TJSONObject>; overload;
  end;

  TDataSetAsJSONSource<T: TDataSet> = class(TInterfacedObject,
    IJSONSource<TJSONArray>)
  private
    FDataSet: T;
    FJSONValueConverters: IJSONValueConverters;
  public
    constructor Create(
      const vpDataSet: T;
      const vpJSONValueConverters: IJSONValueConverters); reintroduce;

    function Data: TJSONArray;

    class function New(
      const vpDataSet: T): IJSONSource<TJSONArray>; overload;

    class function New(
      const vpDataSet: T;
      const vpJSONValueConverters: IJSONValueConverters):
      IJSONSource<TJSONArray>; overload;
  end;

implementation

uses
  System.SysUtils,
  System.DateUtils,
  System.NetEncoding,
  Winapi.Windows;

{ TDataSetRecordAsJSONSource }

function TDataSetRecordAsJSONSource<T>.BcdToJSONValue(
  const vpValue: TBcd): TJSONValue;
begin
  Result := FJSONValueConverters
  .BcdConverter
  .JSONValue
  .Invoke(
    vpValue);
end;

function TDataSetRecordAsJSONSource<T>.BooleanToJSONValue(
  const vpValue: Boolean): TJSONValue;
begin
  Result := FJSONValueConverters
  .BooleanConverter
  .JSONValue
  .Invoke(
    vpValue);
end;

function TDataSetRecordAsJSONSource<T>.BytesToJSONValue(
  const vpValue: TArray<Byte>): TJSONValue;
begin
  Result := FJSONValueConverters
  .BytesConverter
  .JSONValue
  .Invoke(
    vpValue);
end;

constructor TDataSetRecordAsJSONSource<T>.Create(
  const vpDataSet: T;
  const vpJSONValueConverters: IJSONValueConverters);
begin
  inherited Create;
  FDataSet := vpDataSet;
  FJSONValueConverters := vpJSONValueConverters;
end;

function TDataSetRecordAsJSONSource<T>.CreateJSONKey(
  const vpField: TField): TJSONString;
begin
  Result := TJSONString.Create(
    vpField.FieldName.ToLower);
end;

function TDataSetRecordAsJSONSource<T>.CreateJSONPair(
  const vpField: TField): TJSONPair;
begin
  Result := TJSONPair.Create(
    CreateJSONKey(
      vpField),
    CreateJSONValue(
      vpField));
end;

function TDataSetRecordAsJSONSource<T>.CreateJSONValue(
  const vpField: TField): TJSONValue;
begin
  if vpField.IsNull then
    Exit(
      TJSONNull.Create);

  case vpField.DataType of
    TFieldType.ftString:
      Result := StringToJSONValue(
        vpField.AsString);

    TFieldType.ftInteger:
      Result := IntegerToJSONValue(
        vpField.AsInteger);

    TFieldType.ftBoolean:
      Result := BooleanToJSONValue(
        vpField.AsBoolean);

    TFieldType.ftFloat:
      Result := DoubleToJSONValue(
        vpField.AsFloat);

    TFieldType.ftCurrency:
      Result := CurrencyToJSONValue(
        vpField.AsCurrency);

    TFieldType.ftBCD, TFieldType.ftFMTBcd:
      Result := BcdToJSONValue(
        vpField.AsBCD);

    TFieldType.ftDateTime, TFieldType.ftTimeStamp:
      Result := DateTimeToJSONValue(
        vpField.AsDateTime);

    TFieldType.ftBlob:
      Result := BytesToJSONValue(
        vpField.AsBytes);
  end;
end;

function TDataSetRecordAsJSONSource<T>.CurrencyToJSONValue(
  const vpValue: Currency): TJSONValue;
begin
  Result := FJSONValueConverters
  .CurrencyConverter
  .JSONValue
  .Invoke(
    vpValue);
end;

function TDataSetRecordAsJSONSource<T>.Data: TJSONObject;
{$REGION 'Variáveis'}
var
  viField: TField;
{$ENDREGION}
begin
  Result := TJSONObject.Create;

  for viField in FDataSet.Fields do
    Result.AddPair(
      CreateJSONPair(
        viField));
end;

function TDataSetRecordAsJSONSource<T>.DateTimeToJSONValue(
  const vpValue: TDateTime): TJSONValue;
begin
  Result := FJSONValueConverters
  .DateTimeConverter
  .JSONValue
  .Invoke(
    vpValue);
end;

function TDataSetRecordAsJSONSource<T>.DoubleToJSONValue(
  const vpValue: Double): TJSONValue;
begin
  Result := FJSONValueConverters
  .DoubleConverter
  .JSONValue
  .Invoke(
    vpValue);
end;

function TDataSetRecordAsJSONSource<T>.IntegerToJSONValue(
  const vpValue: Integer): TJSONValue;
begin
  Result := FJSONValueConverters
  .IntegerConverter
  .JSONValue
  .Invoke(
    vpValue);
end;

class function TDataSetRecordAsJSONSource<T>.New(
  const vpDataSet: T;
  const vpJSONValueConverters: IJSONValueConverters): IJSONSource<TJSONObject>;
begin
  Result := Create(
    vpDataSet,
    vpJSONValueConverters);
end;

class function TDataSetRecordAsJSONSource<T>.New(
  const vpDataSet: T): IJSONSource<TJSONObject>;
begin
  Result := New(
    vpDataSet,
    TJSONValueConverters.New);
end;

function TDataSetRecordAsJSONSource<T>.StringToJSONValue(
  const vpValue: string): TJSONValue;
begin
  Result := FJSONValueConverters
  .StringConverter
  .JSONValue
  .Invoke(
    vpValue);
end;

{ TDataSetAsJSONSource }

constructor TDataSetAsJSONSource<T>.Create(
  const vpDataSet: T;
  const vpJSONValueConverters: IJSONValueConverters);
begin
  inherited Create;
  FDataSet := vpDataSet;
  FJSONValueConverters := vpJSONValueConverters;
end;

function TDataSetAsJSONSource<T>.Data: TJSONArray;
{$REGION 'Variáveis'}
var
  viBookmark: TBookmark;
{$ENDREGION}
begin
  Result := TJSONArray.Create;

  viBookmark := FDataSet.Bookmark;
  try
    FDataSet.First;
    while not FDataSet.Eof do
      try
        Result.AddElement(
          TDataSetRecordAsJSONSource<T>.New(
            FDataSet,
            FJSONValueConverters)
          .Data);
      finally
        FDataSet.Next;
      end;
  finally
    FDataSet.GotoBookmark(
      viBookmark);
  end;
end;

class function TDataSetAsJSONSource<T>.New(
  const vpDataSet: T): IJSONSource<TJSONArray>;
begin
  Result := New(
    vpDataSet,
    TJSONValueConverters.New);
end;

{ TDefaultStringToJSONValue }

function TDefaultStringToJSONValue.JSONValue: TFunction<string, TJSONValue>;
begin
  Result := StringToJSONValue;
end;

class function TDefaultStringToJSONValue.New:
  IValueToJSONValue<string>;
begin
  Result := Create;
end;

function TDefaultStringToJSONValue.StringToJSONValue(
  const vpValue: string): TJSONValue;
begin
  Result := TJSONString.Create(
    vpValue);
end;

{ TDefaultIntegerToJSONValue }

function TDefaultIntegerToJSONValue.IntegerToJSONValue(
  const vpValue: Integer): TJSONValue;
begin
  Result := TJSONNumber.Create(
    vpValue);
end;

function TDefaultIntegerToJSONValue.JSONValue: TFunction<Integer, TJSONValue>;
begin
  Result := IntegerToJSONValue;
end;

class function TDefaultIntegerToJSONValue.New:
  IValueToJSONValue<Integer>;
begin
  Result := Create;
end;

{ TDefaultBooleanToJSONValue }

function TDefaultBooleanToJSONValue.BooleanToJSONValue(
  const vpValue: Boolean): TJSONValue;
begin
  if vpValue then
    Exit(
      TJSONTrue.Create);

  Result := TJSONFalse.Create;
end;

function TDefaultBooleanToJSONValue.JSONValue: TFunction<Boolean, TJSONValue>;
begin
  Result := BooleanToJSONValue;
end;

class function TDefaultBooleanToJSONValue.New:
  IValueToJSONValue<Boolean>;
begin
  Result := Create;
end;

{ TDefaultDoubleToJSONValue }

function TDefaultDoubleToJSONValue.DoubleToJSONValue(
  const vpValue: Double): TJSONValue;
begin
  Result := TJSONNumber.Create(
    vpValue);
end;

function TDefaultDoubleToJSONValue.JSONValue: TFunction<Double, TJSONValue>;
begin
  Result := DoubleToJSONValue;
end;

class function TDefaultDoubleToJSONValue.New:
  IValueToJSONValue<Double>;
begin
  Result := Create;
end;

{ TSimpleCurrencyToJSONValue }

function TSimpleCurrencyToJSONValue.CurrencyToJSONValue(
  const vpValue: Currency): TJSONValue;
begin
  Result := TJSONNumber.Create(
    vpValue);
end;

function TSimpleCurrencyToJSONValue.JSONValue: TFunction<Currency, TJSONValue>;
begin
  Result := CurrencyToJSONValue;
end;

class function TSimpleCurrencyToJSONValue.New:
  IValueToJSONValue<Currency>;
begin
  Result := Create;
end;

{ TDefaultBcdToJSONValue }

function TDefaultBcdToJSONValue.BcdToJSONValue(
  const vpValue: TBcd): TJSONValue;
begin
  Result := TDefaultDoubleToJSONValue
  .New
  .JSONValue
  .Invoke(
    BcdToDouble(
      vpValue));
end;

function TDefaultBcdToJSONValue.JSONValue: TFunction<TBcd, TJSONValue>;
begin
  Result := BcdToJSONValue;
end;

class function TDefaultBcdToJSONValue.New: IValueToJSONValue<TBcd>;
begin
  Result := Create;
end;

{ TDefaultDateTimeToJSONValue }

function TDefaultDateTimeToJSONValue.DateTimeToJSONValue(
  const vpValue: TDateTime): TJSONValue;
begin
  Result := TDefaultStringToJSONValue
  .New
  .JSONValue
  .Invoke(
    DateToISO8601(
      vpValue));
end;

function TDefaultDateTimeToJSONValue.JSONValue:
  TFunction<TDateTime, TJSONValue>;
begin
  Result := DateTimeToJSONValue;
end;

class function TDefaultDateTimeToJSONValue.New:
  IValueToJSONValue<TDateTime>;
begin
  Result := Create;
end;

{ TDefaultBytesToJSONValue }

function TDefaultBytesToJSONValue.BytesToJSONValue(
  const vpValue: TArray<Byte>): TJSONValue;
begin
  Result := TDefaultStringToJSONValue
  .New
  .JSONValue
  .Invoke(
    TNetEncoding.Base64.EncodeBytesToString(
      vpValue));
end;

function TDefaultBytesToJSONValue.JSONValue:
  TFunction<TArray<Byte>, TJSONValue>;
begin
  Result := BytesToJSONValue;
end;

class function TDefaultBytesToJSONValue.New:
  IValueToJSONValue<TArray<Byte>>;
begin
  Result := Create;
end;

{ TDefaultCurrencyToJSONValue }

function TDefaultCurrencyToJSONValue.CurrencyToJSONValue(
  const vpValue: Currency): TJSONValue;
begin
  Result := TJSONObject.Create
  .AddPair(
    'amount',
    TSimpleCurrencyToJSONValue
    .New
    .JSONValue
    .Invoke(
      vpValue))
  .AddPair(
    'currency',
    TJSONObject.Create
    .AddPair(
      'code',
      TDefaultStringToJSONValue
      .New
      .JSONValue
      .Invoke(
        ISO4217CurrencyCode))
    .AddPair(
      'symbol',
      TDefaultStringToJSONValue
      .New
      .JSONValue
      .Invoke(
        FormatSettings.CurrencyString)))
  .AddPair(
    'locale',
    TDefaultStringToJSONValue
    .New
    .JSONValue
    .Invoke(
      LocaleName));
end;

function TDefaultCurrencyToJSONValue.ISO4217CurrencyCode: string;
begin
  Result := System.SysUtils.GetLocaleStr(
    Languages.UserDefaultLocale,
    LOCALE_SINTLSYMBOL,
    string.Empty);
end;

function TDefaultCurrencyToJSONValue.JSONValue:
  TFunction<Currency, TJSONValue>;
begin
  Result := CurrencyToJSONValue;
end;

function TDefaultCurrencyToJSONValue.LocaleName: string;
begin
  Result := Languages.LocaleName[
    Languages.IndexOf(
      Languages.UserDefaultLocale)];
end;

class function TDefaultCurrencyToJSONValue.New:
  IValueToJSONValue<Currency>;
begin
  Result := Create;
end;

{ TCustomValueToJSONValue<T> }

constructor TCustomValueToJSONValue<T>.Create(
  const vpJSONValue: TFunction<T, TJSONValue>);
begin
  inherited Create;
  FJSONValue := vpJSONValue;
end;

function TCustomValueToJSONValue<T>.JSONValue: TFunction<T, TJSONValue>;
begin
  Result := FJSONValue;
end;

class function TCustomValueToJSONValue<T>.New(
  const vpJSONValue: TFunction<T, TJSONValue>): IValueToJSONValue<T>;
begin
  Result := Create(
    vpJSONValue);
end;

{ TJSONValueConverters }

function TJSONValueConverters.BcdConverter: IValueToJSONValue<TBcd>;
begin
  Result := FBcdConverter;
end;

function TJSONValueConverters.BooleanConverter: IValueToJSONValue<Boolean>;
begin
  Result := FBooleanConverter;
end;

function TJSONValueConverters.BytesConverter: IValueToJSONValue<TArray<Byte>>;
begin
  Result := FBytesConverter;
end;

constructor TJSONValueConverters.Create(
  const vpStringToJSONValue: IValueToJSONValue<string>;
  const vpIntegerToJSONValue: IValueToJSONValue<Integer>;
  const vpBooleanToJSONValue: IValueToJSONValue<Boolean>;
  const vpDoubleToJSONValue: IValueToJSONValue<Double>;
  const vpCurrencyToJSONValue: IValueToJSONValue<Currency>;
  const vpBcdToJSONValue: IValueToJSONValue<TBcd>;
  const vpDateTimeToJSONValue: IValueToJSONValue<TDateTime>;
  const vpBytesToJSONValue: IValueToJSONValue<TArray<Byte>>);
begin
  inherited Create;

  RegisterStringConverter(
    vpStringToJSONValue)
  .RegisterIntegerConverter(
    vpIntegerToJSONValue)
  .RegisterBooleanConverter(
    vpBooleanToJSONValue)
  .RegisterDoubleConverter(
    vpDoubleToJSONValue)
  .RegisterCurrencyConverter(
    vpCurrencyToJSONValue)
  .RegisterBcdConverter(
    vpBcdToJSONValue)
  .RegisterDateTimeConverter(
    vpDateTimeToJSONValue)
  .RegisterBytesConverter(
    vpBytesToJSONValue);
end;

function TJSONValueConverters.CurrencyConverter: IValueToJSONValue<Currency>;
begin
  Result := FCurrencyConverter;
end;

function TJSONValueConverters.DateTimeConverter: IValueToJSONValue<TDateTime>;
begin
  Result := FDateTimeConverter;
end;

function TJSONValueConverters.DoubleConverter: IValueToJSONValue<Double>;
begin
  Result := FDoubleConverter;
end;

function TJSONValueConverters.IntegerConverter: IValueToJSONValue<Integer>;
begin
  Result := FIntegerConverter;
end;

class function TJSONValueConverters.New: IJSONValueConverters;
begin
  Result := Create(
    TDefaultStringToJSONValue.New,
    TDefaultIntegerToJSONValue.New,
    TDefaultBooleanToJSONValue.New,
    TDefaultDoubleToJSONValue.New,
    TDefaultCurrencyToJSONValue.New,
    TDefaultBcdToJSONValue.New,
    TDefaultDateTimeToJSONValue.New,
    TDefaultBytesToJSONValue.New);
end;

function TJSONValueConverters.RegisterBcdConverter(
  const vpValue: IValueToJSONValue<TBcd>): IJSONValueConverters;
begin
  Result := Self;
  FBcdConverter := vpValue;
end;

function TJSONValueConverters.RegisterBooleanConverter(
  const vpValue: IValueToJSONValue<Boolean>): IJSONValueConverters;
begin
  Result := Self;
  FBooleanConverter := vpValue;
end;

function TJSONValueConverters.RegisterBytesConverter(
  const vpValue: IValueToJSONValue<TArray<Byte>>): IJSONValueConverters;
begin
  Result := Self;
  FBytesConverter := vpValue;
end;

function TJSONValueConverters.RegisterCurrencyConverter(
  const vpValue: IValueToJSONValue<Currency>): IJSONValueConverters;
begin
  Result := Self;
  FCurrencyConverter := vpValue;
end;

function TJSONValueConverters.RegisterDateTimeConverter(
  const vpValue: IValueToJSONValue<TDateTime>): IJSONValueConverters;
begin
  Result := Self;
  FDateTimeConverter := vpValue;
end;

function TJSONValueConverters.RegisterDoubleConverter(
  const vpValue: IValueToJSONValue<Double>): IJSONValueConverters;
begin
  Result := Self;
  FDoubleConverter := vpValue;
end;

function TJSONValueConverters.RegisterIntegerConverter(
  const vpValue: IValueToJSONValue<Integer>): IJSONValueConverters;
begin
  Result := Self;
  FIntegerConverter := vpValue;
end;

function TJSONValueConverters.RegisterStringConverter(
  const vpValue: IValueToJSONValue<string>): IJSONValueConverters;
begin
  Result := Self;
  FStringConverter := vpValue;
end;

function TJSONValueConverters.StringConverter: IValueToJSONValue<string>;
begin
  Result := FStringConverter;
end;

class function TDataSetAsJSONSource<T>.New(
  const vpDataSet: T;
  const vpJSONValueConverters: IJSONValueConverters): IJSONSource<TJSONArray>;
begin
  Result := Create(
    vpDataSet,
    vpJSONValueConverters);
end;

end.
