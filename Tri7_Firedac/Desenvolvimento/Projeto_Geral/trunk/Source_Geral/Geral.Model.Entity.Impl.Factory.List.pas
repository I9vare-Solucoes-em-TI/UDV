unit Geral.Model.Entity.Impl.Factory.List;

interface

uses
  Geral.Model.Entity.Spec.Factory,
  Geral.Model.Entity.Spec.List;

type
  TListFactory<T> = class(TInterfacedObject, IFactory<IList<T>>)
  public
    function GetInstance: IList<T>;
    class function New: IFactory<IList<T>>;
  end;

implementation

uses
  Geral.Model.Entity.Impl.List.Spring;

{ TListFactory<T> }

function TListFactory<T>.GetInstance: IList<T>;
begin
  Result := TList<T>.New;
end;

class function TListFactory<T>.New: IFactory<IList<T>>;
begin
  Result := Create;
end;

end.
