unit FormatadorMascaraSeloGO;

interface

uses
  FormatadorMascaraSelo,
  SeloLivro,
  SeloLivroList;

type
  TFormatadorMascaraSeloGO = class(TInterfacedObject, IFormatadorMascaraSelo)
  private
    function GetQuantidadeDigitosNumero: Integer;
  public
    function FormatarMascaraSelo(
      const vpValue: ISeloLivro): string;

    function FormatarMascaraSelos(
      const vpValues: TSeloLivroList): string;

    property QuantidadeDigitosNumero: Integer read GetQuantidadeDigitosNumero;

    class function New: IFormatadorMascaraSelo; static;
  end;

implementation

uses
  System.SysUtils,
  System.Classes;

{ TFormatadorMascaraSeloGO }

function TFormatadorMascaraSeloGO.FormatarMascaraSelo(
  const vpValue: ISeloLivro): string;
{$REGION 'Constantes'}
const
  CI_FORMAT: string = '%.*d';
{$ENDREGION}
begin
  Result := vpValue.Sigla + string.Format(
    CI_FORMAT,
    [QuantidadeDigitosNumero,
    vpValue.Numero]);
end;

function TFormatadorMascaraSeloGO.FormatarMascaraSelos(
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

function TFormatadorMascaraSeloGO.GetQuantidadeDigitosNumero: Integer;
begin
  Result := 6;
end;

class function TFormatadorMascaraSeloGO.New: IFormatadorMascaraSelo;
begin
  Result := TFormatadorMascaraSeloGO.Create;
end;

end.
