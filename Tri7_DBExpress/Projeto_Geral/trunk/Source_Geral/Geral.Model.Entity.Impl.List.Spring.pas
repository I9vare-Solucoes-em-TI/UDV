unit Geral.Model.Entity.Impl.List.Spring;

interface

uses
  Geral.Model.Entity.Spec.List,
  Spring.Collections,
  Geral.Model.Entity.Spec.Enumerator;

type
  TList<T> = class(TInterfacedObject,
    Geral.Model.Entity.Spec.List.IList<T>)
  private
    FList: Spring.Collections.IList<T>;
  public
    constructor Create;

    function Add(
      const vpValue: T): Geral.Model.Entity.Spec.List.IList<T>;

    function AddRange(
      const vpValue: Geral.Model.Entity.Spec.List.IList<T>):
      Geral.Model.Entity.Spec.List.IList<T>; overload;

    function AddRange(
      const vpValue: TArray<T>):
      Geral.Model.Entity.Spec.List.IList<T>; overload;

    function Count: Integer;
    function GetEnumerator: Geral.Model.Entity.Spec.Enumerator.IEnumerator<T>;

    function Where(
      const vpValue: TPredicate<T>): Geral.Model.Entity.Spec.List.IList<T>;

    function Any: Boolean; overload;

    function Any(
      const vpValue: TPredicate<T>): Boolean; overload;

    function Single: T; overload;

    function Single(
      const vpValue: TPredicate<T>): T; overload;

    function ToArray: TArray<T>;

    function Contains(
      const vpValue: T): Boolean; overload;

    function Contains(
      const vpValue: T;
      const vpComparer: TEqualityComparison<T>): Boolean; overload;

    function IsEmpty: Boolean;

    function GetItem(
      vpIndex: Integer): T;

    function All(
      const vpValue: TPredicate<T>): Boolean;

    function First: T; overload;

    function First(
      const vpValue: TPredicate<T>): T; overload;

    function FirstOrDefault: T; overload;

    function FirstOrDefault(
      const vpValue: TPredicate<T>): T; overload;

    function Last: T; overload;

    function Last(
      const vpValue: TPredicate<T>): T; overload;

    function Max(
      const vpValue: TComparison<T>): T;

    function Min(
      const vpValue: TComparison<T>): T;

    function Ordered(
      const vpValue: TComparison<T>): Geral.Model.Entity.Spec.List.IList<T>;

    function Reversed: Geral.Model.Entity.Spec.List.IList<T>;

    function SkipWhile(
      const vpValue: TPredicate<T>): Geral.Model.Entity.Spec.List.IList<T>;

    function TakeWhile(
      const vpValue: TPredicate<T>): Geral.Model.Entity.Spec.List.IList<T>;

    function IndexOf(
      const vpValue: T): Integer;

    function RemoveDuplicates(
      const vpEqualityComparison: TEqualityComparison<T>):
      Geral.Model.Entity.Spec.List.IList<T>;

    function EqualsTo(
      const vpList: Geral.Model.Entity.Spec.List.IList<T>;
      const vpComparer: TEqualityComparison<T>): Boolean;

    class function New: Geral.Model.Entity.Spec.List.IList<T>;

    procedure ForEach(
      const vpValue: TAction<T>);

    procedure SetItem(
      vpIndex: Integer;
      const vpValue: T);

    procedure Clear;

    procedure RemoveAll(
      const vpValue: TPredicate<T>);

    procedure TrimExcess;
  end;

implementation

uses
  Geral.Model.Entity.Impl.Enumerator.Spring,
  Spring,
  System.Generics.Defaults;

{ TList<T> }

function TList<T>.Add(
  const vpValue: T): Geral.Model.Entity.Spec.List.IList<T>;
begin
  Result := Self;

  FList.Add(
    vpValue);
end;

function TList<T>.AddRange(
  const vpValue: Geral.Model.Entity.Spec.List.IList<T>):
  Geral.Model.Entity.Spec.List.IList<T>;
begin
  Result := Self;

  vpValue.ForEach(
    procedure(const vpValue: T)
    begin
      Add(vpValue);
    end);
end;

function TList<T>.AddRange(
  const vpValue: TArray<T>): Geral.Model.Entity.Spec.List.IList<T>;
begin
  Result := Self;

  FList.AddRange(
    vpValue);
end;

function TList<T>.All(
  const vpValue: Geral.Model.Entity.Spec.List.TPredicate<T>): Boolean;
begin
  Result := FList.All(
    TPredicate<T>(
      vpValue));
end;

function TList<T>.Any: Boolean;
begin
  Result := FList.Any;
end;

function TList<T>.Any(
  const vpValue: Geral.Model.Entity.Spec.List.TPredicate<T>): Boolean;
begin
  Result := FList.Any(
    TPredicate<T>(
      vpValue));
end;

procedure TList<T>.Clear;
begin
  FList.Clear;
end;

function TList<T>.Contains(
  const vpValue: T): Boolean;
begin
  Result := FList.Contains(
    vpValue);
end;

function TList<T>.Contains(
  const vpValue: T;
  const vpComparer: Geral.Model.Entity.Spec.List.TEqualityComparison<T>):
  Boolean;
begin
  Result := FList.Contains(
    vpValue,
    TEqualityComparison<T>(
      vpComparer));
end;

function TList<T>.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TList<T>.Create;
begin
  inherited;
  FList := TCollections.CreateList<T>;
end;

function TList<T>.EqualsTo(
  const vpList: Geral.Model.Entity.Spec.List.IList<T>;
  const vpComparer: Geral.Model.Entity.Spec.List.TEqualityComparison<T>):
  Boolean;
{$REGION 'Variáveis'}
var
  viEnumerator1: Geral.Model.Entity.Spec.Enumerator.IEnumerator<T>;
  viEnumerator2: Geral.Model.Entity.Spec.Enumerator.IEnumerator<T>;
{$ENDREGION}
begin
  viEnumerator1 := GetEnumerator;
  viEnumerator2 := vpList.GetEnumerator;

  while viEnumerator1.MoveNext do
    if not (viEnumerator2.MoveNext and
      vpComparer(
        viEnumerator1.Current,
        viEnumerator2.Current)) then
      Exit(
        False);

  Result := not viEnumerator2.MoveNext;
end;

function TList<T>.First: T;
begin
  Result := FList.First;
end;

function TList<T>.First(
  const vpValue: Geral.Model.Entity.Spec.List.TPredicate<T>): T;
begin
  Result := FList.First(
    TPredicate<T>(
      vpValue));
end;

function TList<T>.FirstOrDefault: T;
begin
  Result := FList.FirstOrDefault;
end;

function TList<T>.FirstOrDefault(
  const vpValue: Geral.Model.Entity.Spec.List.TPredicate<T>): T;
begin
  Result := FList.FirstOrDefault(
    TPredicate<T>(
      vpValue));
end;

procedure TList<T>.ForEach(
  const vpValue: Geral.Model.Entity.Spec.List.TAction<T>);
begin
  FList.ForEach(
    TAction<T>(
      vpValue));
end;

function TList<T>.GetEnumerator:
  Geral.Model.Entity.Spec.Enumerator.IEnumerator<T>;
begin
  Result := TEnumerator<T>.New(
    FList.GetEnumerator);
end;

function TList<T>.GetItem(
  vpIndex: Integer): T;
begin
  Result := FList[vpIndex];
end;

function TList<T>.IndexOf(
  const vpValue: T): Integer;
begin
  Result := FList.IndexOf(
    vpValue);
end;

function TList<T>.IsEmpty: Boolean;
begin
  Result := FList.IsEmpty;
end;

function TList<T>.Last(
  const vpValue: Geral.Model.Entity.Spec.List.TPredicate<T>): T;
begin
  Result := FList.Last(
    TPredicate<T>(
      vpValue));
end;

function TList<T>.Max(
  const vpValue: Geral.Model.Entity.Spec.List.TComparison<T>): T;
begin
  Result := FList.Max(
    TComparison<T>(
      vpValue));
end;

function TList<T>.Min(
  const vpValue: Geral.Model.Entity.Spec.List.TComparison<T>): T;
begin
  Result := FList.Min(
    TComparison<T>(
      vpValue));
end;

function TList<T>.Last: T;
begin
  Result := FList.Last;
end;

class function TList<T>.New: Geral.Model.Entity.Spec.List.IList<T>;
begin
  Result := Create;
end;

function TList<T>.Ordered(
  const vpValue: Geral.Model.Entity.Spec.List.TComparison<T>):
  Geral.Model.Entity.Spec.List.IList<T>;
{$REGION 'Variáveis'}
var
  viResult: Geral.Model.Entity.Spec.List.IList<T>;
{$ENDREGION}
begin
  viResult := New;

  FList.Ordered(
    TComparison<T>(
      vpValue))
    .ForEach(
      procedure(const arg: T)
      begin
        viResult.Add(
          arg);
      end);

  Result := viResult;
end;

procedure TList<T>.RemoveAll(
  const vpValue: Geral.Model.Entity.Spec.List.TPredicate<T>);
begin
  FList.RemoveAll(
    TPredicate<T>(
      vpValue));
end;

function TList<T>.RemoveDuplicates(
  const vpEqualityComparison:
  Geral.Model.Entity.Spec.List.TEqualityComparison<T>):
  Geral.Model.Entity.Spec.List.IList<T>;
{$REGION 'Variáveis'}
var
  viResult: Geral.Model.Entity.Spec.List.IList<T>;
{$ENDREGION}
begin
  viResult := New;

  ForEach(
    procedure(const vpValue: T)
    begin
      if not viResult.Contains(
        vpValue,
        vpEqualityComparison) then
        viResult.Add(
          vpValue);
    end);

  Result := viResult;
end;

function TList<T>.Reversed: Geral.Model.Entity.Spec.List.IList<T>;
{$REGION 'Variáveis'}
var
  viResult: Geral.Model.Entity.Spec.List.IList<T>;
{$ENDREGION}
begin
  viResult := New;

  FList.Reversed.ForEach(
    procedure(const arg: T)
    begin
      viResult.Add(
        arg);
    end);

  Result := viResult;
end;

procedure TList<T>.SetItem(
  vpIndex: Integer;
  const vpValue: T);
begin
  FList[vpIndex] := vpValue;
end;

function TList<T>.Single: T;
begin
  Result := FList.Single;
end;

function TList<T>.Single(
  const vpValue: Geral.Model.Entity.Spec.List.TPredicate<T>): T;
begin
  Result := FList.Single(
    TPredicate<T>(
      vpValue));
end;

function TList<T>.SkipWhile(
  const vpValue: Geral.Model.Entity.Spec.List.TPredicate<T>):
  Geral.Model.Entity.Spec.List.IList<T>;
{$REGION 'Variáveis'}
var
  viResult: Geral.Model.Entity.Spec.List.IList<T>;
{$ENDREGION}
begin
  viResult := New;

  FList.SkipWhile(
    TPredicate<T>(
      vpValue))
    .ForEach(
      procedure(const arg: T)
      begin
        viResult.Add(
          arg);
      end);

  Result := viResult;
end;

function TList<T>.TakeWhile(
  const vpValue: Geral.Model.Entity.Spec.List.TPredicate<T>):
  Geral.Model.Entity.Spec.List.IList<T>;
{$REGION 'Variáveis'}
var
  viResult: Geral.Model.Entity.Spec.List.IList<T>;
{$ENDREGION}
begin
  viResult := New;

  FList.TakeWhile(
    TPredicate<T>(
      vpValue))
    .ForEach(
      procedure(const arg: T)
      begin
        viResult.Add(
          arg);
      end);

  Result := viResult;
end;

function TList<T>.ToArray: TArray<T>;
begin
  Result := FList.ToArray;
end;

procedure TList<T>.TrimExcess;
begin
  FList.TrimExcess;
end;

function TList<T>.Where(
  const vpValue: Geral.Model.Entity.Spec.List.TPredicate<T>):
  Geral.Model.Entity.Spec.List.IList<T>;
{$REGION 'Variáveis'}
var
  viResult: Geral.Model.Entity.Spec.List.IList<T>;
{$ENDREGION}
begin
  viResult := New;

  FList.Where(
    TPredicate<T>(
      vpValue))
    .ForEach(
      procedure(const arg: T)
      begin
        viResult.Add(
          arg);
      end);

  Result := viResult;
end;

end.
