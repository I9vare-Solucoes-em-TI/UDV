unit GeradorSelosTJSimpleFactory;

interface

uses
  ConfiguracaoList,
  GeradorSelosTJ;

type
  TGeradorSelosTJSimpleFactory = class sealed
  private
    class function GetGeradorSelosTJGO(
      const vpValue: TConfiguracaoList): IGeradorSelosTJ; static;
  public
    class function Get(
      const vpValue: TConfiguracaoList): IGeradorSelosTJ; static;
  end;

implementation

uses
  System.SysUtils,
  GeradorSelosTJGO,
  FormatadorMascaraSeloSimpleFactory;

{ TGeradorSelosTJSimpleFactory }

class function TGeradorSelosTJSimpleFactory.Get(
  const vpValue: TConfiguracaoList): IGeradorSelosTJ;
begin
  Result := nil;

  if vpValue.GetByConfiguracaoGrupoDescricaoESecaoENome(
    'PRINCIPAL', 'CARTORIO', 'UF').Valor.Equals('GO') then
    Result := GetGeradorSelosTJGO(vpValue);
end;

class function TGeradorSelosTJSimpleFactory.GetGeradorSelosTJGO(
  const vpValue: TConfiguracaoList): IGeradorSelosTJ;
{$REGION 'Variáveis'}
var
  viConfiguracaoList: TConfiguracaoList;
{$ENDREGION}
begin
  viConfiguracaoList := vpValue.GetListByConfiguracaoGrupoDescricaoESecao(
    'SELO', 'GOIAS');

  try
    Result := TGeradorSelosTJGO.Create(
      viConfiguracaoList.GetByNome('CODIGO_CARTORIO').Valor,
      viConfiguracaoList.GetByNome('CHAVE_SEGURANCA').Valor,
      TFormatadorMascaraSeloSimpleFactory.Get('GO'));
  finally
    FreeAndNil(viConfiguracaoList);
  end;
end;

end.
