unit FormatadorMascaraSeloAL;

interface

uses
  FormatadorMascaraSelo,
  SeloLivro,
  SeloLivroList;

type
  TFormatadorMascaraSeloAL = class(TInterfacedObject, IFormatadorMascaraSelo)
  private
    function GetQuantidadeDigitosNumero: Integer;
    function GetQuantidadeDigitosNumeroSeloDigital: Integer;
  public
    function FormatarMascaraSelo(
      const vpValue: ISeloLivro): string;

    function FormatarMascaraSelos(
      const vpValues: TSeloLivroList): string;

    property QuantidadeDigitosNumero: Integer read GetQuantidadeDigitosNumero;
    property QuantidadeDigitosNumeroSeloDigital: Integer read GetQuantidadeDigitosNumeroSeloDigital;

    class function New: IFormatadorMascaraSelo; static;
  end;

implementation

uses
  System.SysUtils,
  System.Classes;

{ TFormatadorMascaraSeloAL }

function TFormatadorMascaraSeloAL.FormatarMascaraSelo(
  const vpValue: ISeloLivro): string;
{$REGION 'Constantes'}
const
  CI_FORMAT: string = '%.*d';
{$ENDREGION}
begin
  if vpValue.Validador.IsEmpty then
  begin
    Result := vpValue.Sigla + string.Format(
      CI_FORMAT,
      [QuantidadeDigitosNumero,
      vpValue.Numero]);
  end
  else
  begin
    Result := vpValue.Sigla + string.Format(
      CI_FORMAT,
      [QuantidadeDigitosNumeroSeloDigital,
      vpValue.Numero]) + '-' +
      vpValue.Validador;
  end;
end;

function TFormatadorMascaraSeloAL.FormatarMascaraSelos(
  const vpValues: TSeloLivroList): string;
{$REGION 'Constantes'}
const
  CI_SEPARATOR: string = ', ';
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viStrings: TStrings;
  viSeloLivro: ISeloLivro;
  viStringArray: TArray<string>;
{$ENDREGION}
begin
  viStrings := TStringList.Create;
  try
    for viSeloLivro in vpValues do
      viStrings.Add(FormatarMascaraSelo(viSeloLivro));

    viStringArray := viStrings.ToStringArray;
    try
      Result := string.Join(CI_SEPARATOR, viStringArray);
    finally
      Finalize(viStringArray);
    end;
  finally
    FreeAndNil(viStrings);
  end;
end;

function TFormatadorMascaraSeloAL.GetQuantidadeDigitosNumero: Integer;
begin
  Result := 6;
end;

function TFormatadorMascaraSeloAL.GetQuantidadeDigitosNumeroSeloDigital: Integer;
begin
  Result := 5;
end;

class function TFormatadorMascaraSeloAL.New: IFormatadorMascaraSelo;
begin
  Result := TFormatadorMascaraSeloAL.Create;
end;

end.
