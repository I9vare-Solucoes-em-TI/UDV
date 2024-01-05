unit ConfiguracoesFundo;

interface

uses
  System.Generics.Collections,
  ConfiguracaoFundo,
  FundoTipo;

type
  TConfiguracoesFundo = class(TObjectList<TConfiguracaoFundo>)
  public
    function GetFundoTipos: TFundoTipos;
  end;

implementation

{ TConfiguracoesFundo }

function TConfiguracoesFundo.GetFundoTipos: TFundoTipos;
{$REGION 'Variáveis'}
var
  viConfiguracaoFundo: TConfiguracaoFundo;
{$ENDREGION}
begin
  Result := nil;

  if Count = 0 then
    Exit;

  Result := TFundoTipos.Create(False);
  for viConfiguracaoFundo in Self do
    Result.Add(viConfiguracaoFundo.FundoTipo);
end;

end.
