unit Geral.Model.Entity.Impl.List.Number;

interface

uses
  Geral.Model.Entity.Spec.List.Number,
  Geral.Model.Entity.Spec.List;

type
  TIntegerList = class(TInterfacedObject, INumberList<Integer>)
  private
    FList: IList<Integer>;

    constructor Create(
      const vpList: IList<Integer>); reintroduce;
  public
    function List: IList<Integer>;
    function Sum: Integer;
    function Max: Integer;

    class function New(
      const vpList: IList<Integer>): INumberList<Integer>;
  end;

  TCurrencyList = class(TInterfacedObject, INumberList<Currency>)
  private
    FList: IList<Currency>;

    constructor Create(
      const vpList: IList<Currency>); reintroduce;
  public
    function List: IList<Currency>;
    function Sum: Currency;
    function Max: Currency;

    class function New(
      const vpList: IList<Currency>): INumberList<Currency>;
  end;

implementation

{ TIntegerList }

constructor TIntegerList.Create(
  const vpList: IList<Integer>);
begin
  inherited Create;
  FList := vpList;
end;

function TIntegerList.List: IList<Integer>;
begin
  Result := FList;
end;

function TIntegerList.Max: Integer;
{$REGION 'Variáveis'}
var
  viValue: Integer;
{$ENDREGION}
begin
  Result := List.FirstOrDefault;

  for viValue in List do
    if viValue > Result then
      Result := viValue;
end;

class function TIntegerList.New(
  const vpList: IList<Integer>): INumberList<Integer>;
begin
  Result := Create(
    vpList);
end;

function TIntegerList.Sum: Integer;
{$REGION 'Variáveis'}
var
  viValue: Integer;
{$ENDREGION}
begin
  Result := 0;

  for viValue in List do
    Result := Result +
      viValue;
end;

{ TCurrencyList }

constructor TCurrencyList.Create(
  const vpList: IList<Currency>);
begin
  inherited Create;
  FList := vpList;
end;

function TCurrencyList.List: IList<Currency>;
begin
  Result := FList;
end;

function TCurrencyList.Max: Currency;
{$REGION 'Variáveis'}
var
  viValue: Currency;
{$ENDREGION}
begin
  Result := List.FirstOrDefault;

  for viValue in List do
    if viValue > Result then
      Result := viValue;
end;

class function TCurrencyList.New(
  const vpList: IList<Currency>): INumberList<Currency>;
begin
  Result := Create(
    vpList);
end;

function TCurrencyList.Sum: Currency;
{$REGION 'Variáveis'}
var
  viValue: Currency;
{$ENDREGION}
begin
  Result := 0;

  for viValue in List do
    Result := Result +
      viValue;
end;

end.
