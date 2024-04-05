unit Geral.Model.Util.Enum;

interface

type
  TEnumUtil = class
  public
    class procedure BuscarDados<T>(
      const vpValor: T;
      out vpEnumTipo: string;
      out vpEnumElemento: string);
  end;

implementation

uses
  System.Rtti;

{ TEnumUtil }

class procedure TEnumUtil.BuscarDados<T>(
  const vpValor: T;
  out vpEnumTipo: string;
  out vpEnumElemento: string);
var
  viValue: TValue;
begin
  viValue := TValue.From<T>(vpValor);
  vpEnumTipo := string(viValue.TypeInfo^.Name);
  vpEnumElemento := viValue.ToString;
end;

end.
