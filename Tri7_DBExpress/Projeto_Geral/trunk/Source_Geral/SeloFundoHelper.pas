unit SeloFundoHelper;

interface

uses
  SeloFundo,
  FundoTipo;

type
  TSeloFundosHelper = class helper for TSeloFundos
  public
    function GetFundoTipos: TFundoTipos;
  end;

implementation

{ TSeloFundosHelper }

function TSeloFundosHelper.GetFundoTipos: TFundoTipos;
{$REGION 'Variáveis'}
var
  viSeloFundo: TSeloFundo;
  viFundoTipo: TFundoTipo;
{$ENDREGION}
begin
  Result := TFundoTipos.Create;

  for viSeloFundo in Self do
  begin
    viFundoTipo := viSeloFundo.FundoTipo;
    if not Result.Contains(viFundoTipo) then
      Result.Add(viFundoTipo);
  end;
end;

end.
