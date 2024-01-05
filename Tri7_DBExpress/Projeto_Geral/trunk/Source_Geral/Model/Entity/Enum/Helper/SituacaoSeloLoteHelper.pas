unit SituacaoSeloLoteHelper;

interface

uses
  SituacaoSeloLote;

type
  TSituacaoSeloLoteHelper = record helper for TSituacaoSeloLote
  private
    {$REGION 'Constantes'}
    const CL_CHAR_AGUARDANDO_USO: Char = 'A';
    const CL_CHAR_FECHADO: Char = 'F';
    const CL_CHAR_ATIVADO: Char = 'I';

    const CL_STRING_AGUARDANDO_USO: string = 'Aguardando Uso';
    const CL_STRING_FECHADO: string = 'Fechado';
    const CL_STRING_ATIVADO: string = 'Ativado';
    {$ENDREGION}

    function Equals(
      const vpValue: TSituacaoSeloLote): Boolean;

    function IsAguardandoUso: Boolean; overload;

    class function IsAguardandoUso(
      const vpValue: Char): Boolean; overload; static;

    class function IsAguardandoUso(
      const vpValue: string): Boolean; overload; static;

    function IsFechado: Boolean; overload;

    class function IsFechado(
      const vpValue: Char): Boolean; overload; static;

    class function IsFechado(
      const vpValue: string): Boolean; overload; static;

    function IsAtivado: Boolean; overload;

    class function IsAtivado(
      const vpValue: Char): Boolean; overload; static;

    class function IsAtivado(
      const vpValue: string): Boolean; overload; static;

    class function IfThen(
      const vpValue: Boolean;
      const vpTrue: TSituacaoSeloLote;
      const vpFalse: TSituacaoSeloLote = TSituacaoSeloLote(-1)):
        TSituacaoSeloLote; static;
  public
    function ToChar: Char;
    function ToString: string;

    class function FromChar(
      const vpValue: Char): TSituacaoSeloLote; static;

    class function FromString(
      const vpValue: string): TSituacaoSeloLote; static;

    class function GetNull: TSituacaoSeloLote; static;
  end;

implementation

uses
  System.SysUtils,
  System.Character,
  System.StrUtils,
  System.Types,
  System.Math;

{ TSituacaoSeloLoteHelper }

function TSituacaoSeloLoteHelper.Equals(
  const vpValue: TSituacaoSeloLote): Boolean;
begin
  Result := Self = vpValue;
end;

class function TSituacaoSeloLoteHelper.FromChar(
  const vpValue: Char): TSituacaoSeloLote;
begin
  Result := IfThen(IsAguardandoUso(vpValue),
    TSituacaoSeloLote.tsslAguardandoUso,
    IfThen(IsFechado(vpValue), TSituacaoSeloLote.tsslFechado,
    IfThen(IsAtivado(vpValue), TSituacaoSeloLote.tsslAtivado)));
end;

class function TSituacaoSeloLoteHelper.FromString(
  const vpValue: string): TSituacaoSeloLote;
begin
  Result := IfThen(IsAguardandoUso(vpValue),
    TSituacaoSeloLote.tsslAguardandoUso,
    IfThen(IsFechado(vpValue), TSituacaoSeloLote.tsslFechado,
    IfThen(IsAtivado(vpValue), TSituacaoSeloLote.tsslAtivado)));
end;

class function TSituacaoSeloLoteHelper.GetNull: TSituacaoSeloLote;
begin
  Result := TSituacaoSeloLote(-1);
end;

class function TSituacaoSeloLoteHelper.IfThen(
  const vpValue: Boolean;
  const vpTrue: TSituacaoSeloLote;
  const vpFalse: TSituacaoSeloLote = TSituacaoSeloLote(-1)): TSituacaoSeloLote;
begin
  if vpValue then
    Result := vpTrue
  else
    Result := vpFalse;
end;

function TSituacaoSeloLoteHelper.IsAguardandoUso: Boolean;
begin
  Result := Equals(TSituacaoSeloLote.tsslAguardandoUso);
end;

class function TSituacaoSeloLoteHelper.IsAguardandoUso(
  const vpValue: string): Boolean;
begin
  Result := CL_STRING_AGUARDANDO_USO.Equals(vpValue);
end;

class function TSituacaoSeloLoteHelper.IsAguardandoUso(
  const vpValue: Char): Boolean;
begin
  Result := CL_CHAR_AGUARDANDO_USO.IsInArray([vpValue]);
end;

class function TSituacaoSeloLoteHelper.IsAtivado(
  const vpValue: string): Boolean;
begin
  Result := CL_STRING_ATIVADO.Equals(vpValue);
end;

class function TSituacaoSeloLoteHelper.IsAtivado(
  const vpValue: Char): Boolean;
begin
  Result := CL_CHAR_ATIVADO.IsInArray([vpValue]);
end;

function TSituacaoSeloLoteHelper.IsAtivado: Boolean;
begin
  Result := Equals(TSituacaoSeloLote.tsslAtivado);
end;

class function TSituacaoSeloLoteHelper.IsFechado(
  const vpValue: string): Boolean;
begin
  Result := CL_STRING_FECHADO.Equals(vpValue);
end;

class function TSituacaoSeloLoteHelper.IsFechado(
  const vpValue: Char): Boolean;
begin
  Result := CL_CHAR_FECHADO.IsInArray([vpValue]);
end;

function TSituacaoSeloLoteHelper.IsFechado: Boolean;
begin
  Result := Equals(TSituacaoSeloLote.tsslFechado);
end;

function TSituacaoSeloLoteHelper.ToChar: Char;
begin
  Result := System.StrUtils.IfThen(IsAguardandoUso, CL_CHAR_AGUARDANDO_USO,
    System.StrUtils.IfThen(IsFechado, CL_CHAR_FECHADO,
    System.StrUtils.IfThen(IsAtivado, CL_CHAR_ATIVADO,
      NullChar))).Chars[ZeroValue];
end;

function TSituacaoSeloLoteHelper.ToString: string;
begin
  Result := System.StrUtils.IfThen(IsAguardandoUso, CL_CHAR_AGUARDANDO_USO,
    System.StrUtils.IfThen(IsFechado, CL_CHAR_FECHADO,
    System.StrUtils.IfThen(IsAtivado, CL_CHAR_ATIVADO)));
end;

end.
