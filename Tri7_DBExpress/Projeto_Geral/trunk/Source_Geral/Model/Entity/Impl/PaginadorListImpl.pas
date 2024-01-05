unit PaginadorListImpl;

interface

uses
  PaginadorList,
  System.Generics.Collections;

type
  TPaginadorList<T; A: TList<T>, constructor; B: TList<A>, constructor> = class(
    TInterfacedObject,
    IPaginadorList<T, A, B>)
  public
    function Get(
      const vpValues: A;
      const vpLimit: Integer): B;
  end;

implementation

{ TPaginadorList<T, A, B> }

function TPaginadorList<T, A, B>.Get(
  const vpValues: A;
  const vpLimit: Integer): B;
{$REGION 'Variáveis'}
var
  viValue: T;
  viValues: A;
{$ENDREGION}
begin
  Result := B.Create;

  if vpValues.Count = 0 then
    Exit;

  viValues := A.Create;
  Result.Add(viValues);

  for viValue in TList<T>(vpValues) do
  begin
    viValues.Add(viValue);

    if viValues.Count = vpLimit then
    begin
      viValues := A.Create;
      Result.Add(viValues);
    end;
  end;
end;

end.
