unit CampoValorHelper;

interface

uses
  CampoValor;

type
  TCampoValorHelper = record helper for TCampoValor
  private
    const CL_VALOR_EMOLUMENTO: string = 'VALOR_EMOLUMENTO';
    const CL_VALOR_TAXA_JUDICIARIA: string = 'VALOR_TX_JUDICIARIA';
    const CL_VALOR_FUNDOS: string = 'VALOR_FUNDOS';
    const CL_VALOR_ISSQN: string = 'VALOR_ISSQN';

    class function IfThen(
      const vpValue: Boolean;
      const vpTrue: TCampoValor;
      const vpFalse: TCampoValor = TCampoValor(-1)): TCampoValor; static;

    class function IsValorEmolumento(
      const vpValue: string): Boolean; overload; static;

    class function IsValorTaxaJudiciaria(
      const vpValue: string): Boolean; overload; static;

    class function IsValorFundos(
      const vpValue: string): Boolean; overload; static;

    class function IsValorISSQN(
      const vpValue: string): Boolean; overload; static;

    function Equals(
      const vpValue: TCampoValor): Boolean;
  public
    class function FromString(
      const vpValue: string): TCampoValor; static;

    function IsValorEmolumento: Boolean; overload;
    function IsValorTaxaJudiciaria: Boolean; overload;
    function IsValorFundos: Boolean; overload;
    function IsValorISSQN: Boolean; overload;
  end;

implementation

uses
  System.SysUtils;

{ TCampoValorHelper }

function TCampoValorHelper.Equals(
  const vpValue: TCampoValor): Boolean;
begin
  Result := Self = vpValue;
end;

class function TCampoValorHelper.FromString(
  const vpValue: string): TCampoValor;
begin
  Result := IfThen(IsValorEmolumento(vpValue), cvValorEmolumento,
    IfThen(IsValorTaxaJudiciaria(vpValue), cvValorTaxaJudiciaria,
    IfThen(IsValorFundos(vpValue), cvValorFundos,
    IfThen(IsValorISSQN(vpValue), cvValorISSQN))));
end;

class function TCampoValorHelper.IfThen(
  const vpValue: Boolean;
  const vpTrue: TCampoValor;
  const vpFalse: TCampoValor = TCampoValor(-1)): TCampoValor;
begin
  if vpValue then
    Result := vpTrue
  else
    Result := vpFalse;
end;

class function TCampoValorHelper.IsValorEmolumento(
  const vpValue: string): Boolean;
begin
  Result := vpValue.Equals(CL_VALOR_EMOLUMENTO);
end;

class function TCampoValorHelper.IsValorFundos(
  const vpValue: string): Boolean;
begin
  Result := vpValue.Equals(CL_VALOR_FUNDOS);
end;

class function TCampoValorHelper.IsValorISSQN(
  const vpValue: string): Boolean;
begin
  Result := vpValue.Equals(CL_VALOR_ISSQN);
end;

class function TCampoValorHelper.IsValorTaxaJudiciaria(
  const vpValue: string): Boolean;
begin
  Result := vpValue.Equals(CL_VALOR_TAXA_JUDICIARIA);
end;

function TCampoValorHelper.IsValorEmolumento: Boolean;
begin
  Result := Equals(cvValorEmolumento);
end;

function TCampoValorHelper.IsValorFundos: Boolean;
begin
  Result := Equals(cvValorFundos);
end;

function TCampoValorHelper.IsValorISSQN: Boolean;
begin
  Result := Equals(cvValorISSQN);
end;

function TCampoValorHelper.IsValorTaxaJudiciaria: Boolean;
begin
  Result := Equals(cvValorTaxaJudiciaria);
end;

end.
