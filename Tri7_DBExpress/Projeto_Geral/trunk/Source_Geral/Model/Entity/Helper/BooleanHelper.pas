unit BooleanHelper;

interface

type
  TBooleanHelper = record helper for Boolean
  private
    {$REGION 'Constantes'}
    const CL_SIM: Char = 'S';
    const CL_NAO: Char = 'N';
    const CL_ATIVO: Char = 'A';
    const CL_INATIVO: Char = 'I';
    {$ENDREGION}
  public
    function Equals(
      const vpValue: Boolean): Boolean;

    function NotEquals(
      const vpValue: Boolean): Boolean;

    function &Not: Boolean;

    function &And(
      const vpValue: Boolean): Boolean;

    function &Or(
      const vpValue: Boolean): Boolean;

    class function FromCharSimNao(
      const vpValue: Char): Boolean; static;

    class function FromCharAtivoInativo(
      const vpValue: Char): Boolean; static;

    class function FromStringSimNao(
      const vpValue: string): Boolean; static;

    class function FromStringAtivoInativo(
      const vpValue: string): Boolean; static;

    function ToCharAtivoInativo: Char;
    function ToCharSimNao: Char;

    function ToStringAtivoInativo: string;
    function ToStringSimNao: string;

    procedure Negate;
  end;

implementation

uses
  System.Character,
  System.SysUtils,
  System.StrUtils,
  System.Types,
  System.Math;

{ TBooleanHelper }

procedure TBooleanHelper.Negate;
begin
  Self := Self.&Not;
end;

function TBooleanHelper.&Not: Boolean;
begin
  Result := not Self;
end;

function TBooleanHelper.NotEquals(
  const vpValue: Boolean): Boolean;
begin
  Result := Equals(vpValue);
  Result.Negate;
end;

function TBooleanHelper.&Or(
  const vpValue: Boolean): Boolean;
begin
  Result := Self or vpValue;
end;

function TBooleanHelper.ToCharAtivoInativo: Char;
begin
  Result := ToStringAtivoInativo.Chars[ZeroValue];
end;

function TBooleanHelper.ToCharSimNao: Char;
begin
  Result := ToStringSimNao.Chars[ZeroValue];
end;

function TBooleanHelper.ToStringAtivoInativo: string;
begin
  Result := IfThen(Self, CL_ATIVO, CL_INATIVO);
end;

function TBooleanHelper.ToStringSimNao: string;
begin
  Result := IfThen(Self, CL_SIM, CL_NAO);
end;

function TBooleanHelper.&And(
  const vpValue: Boolean): Boolean;
begin
  Result := Self and vpValue;
end;

function TBooleanHelper.Equals(
  const vpValue: Boolean): Boolean;
begin
  Result := Self = vpValue;
end;

class function TBooleanHelper.FromCharAtivoInativo(
  const vpValue: Char): Boolean;
begin
  Result := CL_ATIVO.IsInArray([vpValue]);
end;

class function TBooleanHelper.FromCharSimNao(
  const vpValue: Char): Boolean;
begin
  Result := CL_SIM.IsInArray([vpValue]);
end;

class function TBooleanHelper.FromStringAtivoInativo(
  const vpValue: string): Boolean;
{$REGION 'Variáveis'}
var
  viChar: Char;
{$ENDREGION}
begin
  viChar := NullChar;
  if vpValue.IsEmpty.&Not then
    viChar := vpValue.Chars[ZeroValue];

  Result := FromCharAtivoInativo(viChar);
end;

class function TBooleanHelper.FromStringSimNao(
  const vpValue: string): Boolean;
{$REGION 'Variáveis'}
var
  viChar: Char;
{$ENDREGION}
begin
  viChar := NullChar;
  if vpValue.IsEmpty.&Not then
    viChar := vpValue.Chars[ZeroValue];

  Result := FromCharSimNao(viChar);
end;

end.
