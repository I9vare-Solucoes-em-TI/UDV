unit Geral.Model.Entity.Impl.Enumerator.Spring;

interface

uses
  Geral.Model.Entity.Spec.Enumerator,
  Spring.Collections;

type
  TEnumerator<T> = class(TInterfacedObject,
    Geral.Model.Entity.Spec.Enumerator.IEnumerator<T>)
  private
    FEnumerator: Spring.Collections.IEnumerator<T>;
  public
    constructor Create(
      const vpEnumerator: Spring.Collections.IEnumerator<T>); reintroduce;

    function GetCurrent: T;
    function MoveNext: Boolean;

    class function New(
      const vpEnumerator: Spring.Collections.IEnumerator<T>):
      Geral.Model.Entity.Spec.Enumerator.IEnumerator<T>;

    property Current: T read GetCurrent;
  end;

implementation

{ TEnumerator<T> }

constructor TEnumerator<T>.Create(
  const vpEnumerator: Spring.Collections.IEnumerator<T>);
begin
  inherited Create;
  FEnumerator := vpEnumerator;
end;

function TEnumerator<T>.GetCurrent: T;
begin
  Result := FEnumerator.Current;
end;

function TEnumerator<T>.MoveNext: Boolean;
begin
  Result := FEnumerator.MoveNext;
end;

class function TEnumerator<T>.New(
  const vpEnumerator: Spring.Collections.IEnumerator<T>):
  Geral.Model.Entity.Spec.Enumerator.IEnumerator<T>;
begin
  Result := TEnumerator<T>.Create(
    vpEnumerator);
end;

end.
