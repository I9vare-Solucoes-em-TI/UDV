{* @hash       2b3a4f080d4b5e2a8e9e0d19eed146145d119703095919aaedf5e5e6a83c
 * @version    1.0.0.0
 * @unit       Geral.Model.Entity.Impl.Maybe.pas
 * @author     I9vare
 * @copyright  Copyright (c) 2013 I9vare Gestão e Soluções em TI. (https://www.i9vare.com)
 *}

unit Geral.Model.Entity.Impl.Maybe;

interface

uses
  Geral.Model.Entity.Spec.Maybe;

type
  TSome<T> = class(TInterfacedObject, IMaybe<T>)
  private
    FValue: T;

    constructor Create(
      const vpValue: T); reintroduce;
  public
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
