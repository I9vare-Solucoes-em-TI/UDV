unit GeradorLogErroSimpleFactory;

interface

uses
  GeradorLogErro;

type
  TGeradorLogErroSimpleFactory = class sealed
  private
    class function GetGeradorLogErroTXT(
      const vpDiretorio: string;
      const vpSistema: string): IGeradorLogErro; static;
  public
    {$REGION 'Constantes'}
    const CG_TXT: string = 'TXT';
    {$ENDREGION}

    class function Get(
      const vpTipo: string;
      const vpDiretorio: string;
      const vpSistema: string): IGeradorLogErro; static;
  end;

implementation

uses
  System.SysUtils,
  GeradorLogErroTXT;

{ TGeradorLogErroSimpleFactory }

class function TGeradorLogErroSimpleFactory.Get(
  const vpTipo: string;
  const vpDiretorio: string;
  const vpSistema: string): IGeradorLogErro;
begin
  Result := nil;

  if vpTipo.Equals(CG_TXT) then
    Result := GetGeradorLogErroTXT(
      vpDiretorio,
      vpSistema);
end;

class function TGeradorLogErroSimpleFactory.GetGeradorLogErroTXT(
  const vpDiretorio: string;
  const vpSistema: string): IGeradorLogErro;
begin
  Result := TGeradorLogErroTXT.New(
    vpDiretorio,
    vpSistema);
end;

end.
