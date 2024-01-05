unit Geral.Model.Entity.Impl.List.Number;

interface

uses
  Geral.Model.Entity.Spec.List.Number,
  Geral.Model.Entity.Spec.List;

type
  TIntegerList = class(TInterfacedObject, INumberList<Integer>)
  private
    FList: IList<Integer>;
  public
    constructor Create(
      const vpList: IList<Integer>); reintroduce;

    function List: IList<Integer>;
    function Sum: Integer;
    function Max: Integer;

    class function New(
      const vpList: IList<Integer>): INumberList<Integer>;
  end;

  TCurrencyList = class(TInterfacedObject, INumberList<Currency>)
  private
    FList: IList<Currency>;
  public
    constructor Create(
      const vpList: IList<Currency>); reintroduce;

    function List: IList<Currency>;
    function Sum: Currency;
    function Max: Currency;

    class function New(
      const vpList: IList<Currency>): INumberList<Currency>;
  end;

implementation

uses
  System.Math,
  System.Types;

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
  viResult: Integer;
{$ENDREGION}
begin
  viResult := List.FirstOrDefault;

  List.ForEach(
    procedure(
      const vpValue: Integer)
    begin
      if CompareValue(
        vpValue,
        viResult) = GreaterThanValue then
        viResult := vpValue;
    end);

  Result := viResult;
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
  viResult: Integer;
{$ENDREGION}
begin
  viResult := ZeroValue;

  List.ForEach(
    procedure(
      const vpValue: Integer)
    begin
      viResult := viResult +
        vpValue;
    end);

  Result := viResult;
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
  viResult: Currency;
{$ENDREGION}
begin
  viResult := List.FirstOrDefault;

  List.ForEach(
    procedure(
      const vpValue: Currency)
    begin
      if vpValue > viResult then
        viResult := vpValue;
    end);

  Result := viResult;
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
  viResult: Currency;
{$ENDREGION}
begin
  viResult := ZeroValue;

  List.ForEach(
    procedure(
      const vpValue: Currency)
    begin
      viResult := viResult +
        vpValue;
    end);

  Result := viResult;
end;

end.
