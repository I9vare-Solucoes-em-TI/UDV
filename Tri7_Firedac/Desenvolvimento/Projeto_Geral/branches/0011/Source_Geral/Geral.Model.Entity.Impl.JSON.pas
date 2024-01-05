unit Geral.Model.Entity.Impl.JSON;

interface

uses
  Geral.Model.Entity.Spec.JSON,
  System.JSON,
  Geral.Model.Entity.AnonymousMethods;

type
  TJSONAPI<T: TJSONValue> = class(TInterfacedObject, IJSONAPI<T>)
  private
    FJSONValue: T;
    FAutoDestroy: Boolean;
  public
    constructor Create(
      const vpJSONValue: T); reintroduce;

    function JSONValue: T;
    function AutoDestroy: IJSONAPI<T>;
    function ManualDestroy: IJSONAPI<T>;

    function ExecuteAction(
      const vpAction: TAction<T>): IJSONAPI<T>;

    class function New(
      const vpJSONValue: T): IJSONAPI<T>;

    destructor Destroy; override;
  end;

implementation

{ TJSONAPI<T> }

function TJSONAPI<T>.AutoDestroy: IJSONAPI<T>;
begin
  Result := Self;
  FAutoDestroy := True;
end;

constructor TJSONAPI<T>.Create(
  const vpJSONValue: T);
begin
  inherited Create;
  FJSONValue := vpJSONValue;
  ManualDestroy;
end;

destructor TJSONAPI<T>.Destroy;
begin
  if FAutoDestroy then
    JSONValue.Free;

  inherited;
end;

function TJSONAPI<T>.ExecuteAction(
  const vpAction: TAction<T>): IJSONAPI<T>;
begin
  Result := Self;

  vpAction(
    JSONValue);
end;

function TJSONAPI<T>.JSONValue: T;
begin
  Result := FJSONValue;
end;

function TJSONAPI<T>.ManualDestroy: IJSONAPI<T>;
begin
  Result := Self;
  FAutoDestroy := False;
end;

class function TJSONAPI<T>.New(
  const vpJSONValue: T): IJSONAPI<T>;
begin
  Result := Create(
    vpJSONValue);
end;

end.
