unit ConfiguradorFundo;

interface

uses
 FundoTipo, EmolumentoImpl;

type
  TConfiguradorFundo = class sealed
  public
    class function RemoverExcludentes(
      const vpFundoTipos: TFundoTipos;
      const vpItemServico: TEmolumento): TFundoTipos; static;
  end;

implementation

uses
  ConfiguracaoFundoDAO,
  ConfiguracoesFundo;

{ TConfiguradorFundo }

class function TConfiguradorFundo.RemoverExcludentes(
  const vpFundoTipos: TFundoTipos;
  const vpItemServico: TEmolumento): TFundoTipos;
{$REGION 'Variáveis'}
var
  viConfiguracaoFundoDAO: TConfiguracaoFundoDAO;
  viConfiguracoesFundo: TConfiguracoesFundo;
  viFundoTipos: TFundoTipos;
{$ENDREGION}
begin
  Result := TFundoTipos.Create(vpFundoTipos, False);

  if not Assigned(vpItemServico) then
    Exit;

  viConfiguracaoFundoDAO := TConfiguracaoFundoDAO.Create;
  try
    viConfiguracoesFundo := viConfiguracaoFundoDAO.Get(vpItemServico);

    if not Assigned(viConfiguracoesFundo) then
      Exit;

    try
      viFundoTipos := viConfiguracoesFundo.GetFundoTipos;

      if not Assigned(viFundoTipos) then
        Exit;

      try
        Result.Extract(viFundoTipos);
      finally
        viFundoTipos.Free;
      end;
    finally
      viConfiguracoesFundo.Free;
    end;
  finally
    viConfiguracaoFundoDAO.Free;
  end;
end;

end.
