unit SexoHelper;

interface

uses
  Sexo;

type
  TSexoHelper = record helper for TSexo
  private
    {$REGION 'Constantes'}
    const CL_MASCULINO_CHAR: Char = 'M';
    const CL_FEMININO_CHAR: Char = 'F';

    const CL_MASCULINO_STRING: string = 'Masculino';
    const CL_FEMININO_STRING: string = 'Feminino';
    {$ENDREGION}

    function Equals(
      const vpValue: TSexo): Boolean;

    class function IfThen(
      const vpValue: Boolean;
      const vpTrue: TSexo;
      const vpFalse: TSexo = TSexo(-1)): TSexo; static;

    class function IsMasculino(
      const vpValue: Char): Boolean; overload; static;

    class function IsFeminino(
      const vpValue: Char): Boolean; overload; static;

    class function IsMasculino(
      const vpValue: string): Boolean; overload; static;

    class function IsFeminino(
      const vpValue: string): Boolean; overload; static;
  public
    function ToChar: Char;
    function ToString: string;

    class function FromChar(
      const vpValue: Char): TSexo; static;

    class function FromString(
      const vpValue: string): TSexo; static;

    function IsMasculino: Boolean; overload;
    function IsFeminino: Boolean; overload;
    class function GetNull: TSexo; static;
    function IsNull: Boolean;
    function IsNotNull: Boolean;
  end;

implementation

uses
  System.Character,
  System.Math,
  System.SysUtils,
  System.StrUtils,
  System.Types,
  BooleanHelper;

{ TSexoHelper }

function TSexoHelper.Equals(
  const vpValue: TSexo): Boolean;
begin
  Result := Self = vpValue;
end;

class function TSexoHelper.FromChar(
  const vpValue: Char): TSexo;
begin
  Result := IfThen(IsMasculino(vpValue), tsMasculino,
    IfThen(IsFeminino(vpValue), tsFeminino));
end;

class function TSexoHelper.FromString(
  const vpValue: string): TSexo;
begin
  Result := IfThen(IsMasculino(vpValue), tsMasculino,
    IfThen(IsFeminino(vpValue), tsFeminino));
end;

class function TSexoHelper.GetNull: TSexo;
begin
  Result := TSexo(-1);
end;

class function TSexoHelper.IfThen(
  const vpValue: Boolean;
  const vpTrue: TSexo;
  const vpFalse: TSexo): TSexo;
begin
  if vpValue then
    Result := vpTrue
  else
    Result := vpFalse;
end;

class function TSexoHelper.IsFeminino(
  const vpValue: Char): Boolean;
begin
  Result := CL_FEMININO_CHAR.IsInArray(vpValue);
end;

class function TSexoHelper.IsFeminino(
  const vpValue: string): Boolean;
begin
  Result := CL_FEMININO_STRING.Equals(vpValue);
end;

function TSexoHelper.IsFeminino: Boolean;
begin
  Result := Equals(tsFeminino);
end;

function TSexoHelper.IsNull: Boolean;
begin
  Result := Equals(GetNull);
end;

function TSexoHelper.IsMasculino: Boolean;
begin
  Result := Equals(tsMasculino);
end;

function TSexoHelper.IsNotNull: Boolean;
begin
  Result := IsNull;
  Result.Negate;
end;

class function TSexoHelper.IsMasculino(
  const vpValue: Char): Boolean;
begin
  Result := CL_MASCULINO_CHAR.IsInArray(vpValue);
end;

class function TSexoHelper.IsMasculino(
  const vpValue: string): Boolean;
begin
  Result := CL_MASCULINO_STRING.Equals(vpValue);
end;

function TSexoHelper.ToChar: Char;
begin
  Result := System.StrUtils.IfThen(IsMasculino, CL_MASCULINO_CHAR,
    System.StrUtils.IfThen(IsFeminino, CL_FEMININO_CHAR, NullChar)).
      Chars[ZeroValue];
end;

function TSexoHelper.ToString: string;
begin
  Result := System.StrUtils.IfThen(IsMasculino, CL_MASCULINO_STRING,
    System.StrUtils.IfThen(IsFeminino, CL_FEMININO_STRING));
end;

end.
