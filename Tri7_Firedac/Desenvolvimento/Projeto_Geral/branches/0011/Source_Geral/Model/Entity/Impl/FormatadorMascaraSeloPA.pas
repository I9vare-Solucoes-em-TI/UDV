unit FormatadorMascaraSeloPA;

interface

uses
  FormatadorMascaraSelo,
  SeloLivro,
  SeloLivroList;

type
  TFormatadorMascaraSeloPA = class(TInterfacedObject, IFormatadorMascaraSelo)
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
  System.Classes,
  System.Types;

{ TFormatadorMascaraSeloPA }

function TFormatadorMascaraSeloPA.FormatarMascaraSelo(
  const vpValue: ISeloLivro): string;
{$REGION 'Constantes'}
const
  CI_FORMAT: string = '000 000 000';
{$ENDREGION}
begin
  Result := vpValue.Sigla + Space + FormatFloat(CI_FORMAT, vpValue.Numero);
end;

function TFormatadorMascaraSeloPA.FormatarMascaraSelos(
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

function TFormatadorMascaraSeloPA.GetQuantidadeDigitosNumero: Integer;
begin
  Result := 9;
end;

class function TFormatadorMascaraSeloPA.New: IFormatadorMascaraSelo;
begin
  Result := TFormatadorMascaraSeloPA.Create;
end;

end.
