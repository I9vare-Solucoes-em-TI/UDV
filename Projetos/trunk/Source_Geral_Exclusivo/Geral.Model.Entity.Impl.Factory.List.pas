{* @hash       2b3a4f080d4b5e2a8e9e0d19eed146145d119703095919aaedf5e5e6a83c
 * @version    1.0.0.0
 * @unit       Geral.Model.Entity.Impl.Factory.List.pas
 * @author     I9vare
 * @copyright  Copyright (c) 2013 I9vare Gestão e Soluções em TI. (https://www.i9vare.com)
 *}

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
