unit CampoValorSetHelper;

interface

uses
  CampoValorSet,
  CampoValor;

type
  TCampoValorSetHelper = record helper for TCampoValorSet
  private
    const CL_EMPTY: TCampoValorSet = [];

    const CL_ALL: TCampoValorSet = [cvValorEmolumento, cvValorTaxaJudiciaria,
      cvValorFundos, cvValorISSQN];

    class function GetEmpty: TCampoValorSet; static;
    class function GetAll: TCampoValorSet; static;

    function Equals(
      const vpValue: TCampoValorSet): Boolean;
  public
    class function FromString(
      const vpValue: string): TCampoValorSet; static;

    function Contains(
      const vpValue: TCampoValor): Boolean;

    function IsAll: Boolean;
  end;

implementation

uses
  System.SysUtils,
  CampoValorHelper;

{ TCampoValorSetHelper }

function TCampoValorSetHelper.Contains(
  const vpValue: TCampoValor): Boolean;
begin
  Result := vpValue in Self;
end;

function TCampoValorSetHelper.Equals(
  const vpValue: TCampoValorSet): Boolean;
begin
  Result := Self = vpValue;
end;

class function TCampoValorSetHelper.FromString(
  const vpValue: string): TCampoValorSet;
{$REGION 'Constantes'}
const
  CI_SEPARATOR: Char = ';';
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viValue: TArray<string>;
  viString: string;
{$ENDREGION}
begin
  Result := GetEmpty;
  viValue := vpValue.Split([CI_SEPARATOR]);

  try
    for viString in viValue do
      Include(Result, TCampoValor.FromString(viString));
  finally
    Finalize(viValue);
  end;
end;

class function TCampoValorSetHelper.GetAll: TCampoValorSet;
begin
  Result := CL_ALL;
end;

class function TCampoValorSetHelper.GetEmpty: TCampoValorSet;
begin
  Result := CL_EMPTY;
end;

function TCampoValorSetHelper.IsAll: Boolean;
begin
  Result := Equals(GetAll);
end;

end.
