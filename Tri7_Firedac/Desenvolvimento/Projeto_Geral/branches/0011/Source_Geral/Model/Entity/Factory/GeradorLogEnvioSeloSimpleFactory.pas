unit GeradorLogEnvioSeloSimpleFactory;

interface

uses
  GeradorLogEnvioSelo;

type
  TGeradorLogEnvioSeloSimpleFactory = class sealed
  private
    class function GetGeradorLogEnvioSeloBD(
      const vpBDLog: string;
      const vpSistema: string): IGeradorLogEnvioSelo; static;
  public
    {$REGION 'Constantes'}
    const CG_BD: string = 'BD';
    {$ENDREGION}

    class function Get(
      const vpTipo: string;
      const vpBDLog: string;
      const vpSistema: string): IGeradorLogEnvioSelo; static;
  end;

implementation

uses
  System.SysUtils,
  GeradorLogEnvioSeloBD;

{ TGeradorLogEnvioSeloSimpleFactory }

class function TGeradorLogEnvioSeloSimpleFactory.Get(
  const vpTipo: string;
  const vpBDLog: string;
  const vpSistema: string): IGeradorLogEnvioSelo;
begin
  Result := nil;

  if vpTipo.Equals(CG_BD) then
    Result := GetGeradorLogEnvioSeloBD(
      vpBDLog,
      vpSistema);
end;

class function TGeradorLogEnvioSeloSimpleFactory.GetGeradorLogEnvioSeloBD(
  const vpBDLog: string;
  const vpSistema: string): IGeradorLogEnvioSelo;
begin
  Result := TGeradorLogEnvioSeloBD.New(
    vpBDLog,
    vpSistema);
end;

end.
