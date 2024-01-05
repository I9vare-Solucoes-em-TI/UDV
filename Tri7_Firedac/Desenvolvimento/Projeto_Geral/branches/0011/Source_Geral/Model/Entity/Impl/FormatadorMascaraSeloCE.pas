unit FormatadorMascaraSeloCE;

interface

uses
  FormatadorMascaraSelo,
  SeloLivro,
  SeloLivroList;

type
  TFormatadorMascaraSeloCE = class(TInterfacedObject, IFormatadorMascaraSelo)
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

{ TFormatadorMascaraSeloCE }

function TFormatadorMascaraSeloCE.FormatarMascaraSelo(
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

function TFormatadorMascaraSeloCE.FormatarMascaraSelos(
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

function TFormatadorMascaraSeloCE.GetQuantidadeDigitosNumero: Integer;
begin
  Result := 6;
end;

class function TFormatadorMascaraSeloCE.New: IFormatadorMascaraSelo;
begin
  Result := TFormatadorMascaraSeloCE.Create;
end;

end.
