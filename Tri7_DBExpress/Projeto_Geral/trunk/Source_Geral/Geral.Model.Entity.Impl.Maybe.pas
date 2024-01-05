unit Geral.Model.Entity.Impl.Maybe;

interface

uses
  Geral.Model.Entity.Spec.Maybe;

type
  TSome<T> = class(TInterfacedObject, IMaybe<T>)
  private
    FValue: T;
  public
    constructor Create(
      const vpValue: T); reintroduce;

    function HasValue: Boolean;
    function Value: T;

    class function New(
      const vpValue: T): IMaybe<T>;
  end;

  TNone<T> = class(TInterfacedObject, IMaybe<T>)
  public
    function HasValue: Boolean;
    function Value: T;
    class function New: IMaybe<T>;
  end;

implementation

uses
  System.SysUtils;

{ TSome<T> }

constructor TSome<T>.Create(
  const vpValue: T);
begin
  inherited Create;
  FValue := vpValue;
end;

function TSome<T>.HasValue: Boolean;
begin
  Result := True;
end;

class function TSome<T>.New(
  const vpValue: T): IMaybe<T>;
begin
  Result := Create(
    vpValue);
end;

function TSome<T>.Value: T;
begin
  Result := FValue;
end;

{ TNone<T> }

function TNone<T>.HasValue: Boolean;
begin
  Result := False;
end;

class function TNone<T>.New: IMaybe<T>;
begin
  Result := Create;
end;

function TNone<T>.Value: T;
begin
  raise Exception.Create(
    'No value found.');
end;

end.
