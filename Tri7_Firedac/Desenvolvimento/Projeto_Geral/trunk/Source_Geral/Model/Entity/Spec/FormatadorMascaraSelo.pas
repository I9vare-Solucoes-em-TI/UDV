unit FormatadorMascaraSelo;

interface

uses
  SeloLivro,
  SeloLivroList;

type
  IFormatadorMascaraSelo = interface
    ['{3C2CB39F-9411-42C9-90A6-6362DF40154D}']

    function FormatarMascaraSelo(
      const vpValue: ISeloLivro): string;

    function FormatarMascaraSelos(
      const vpValues: TSeloLivroList): string;

    function GetQuantidadeDigitosNumero: Integer;

    property QuantidadeDigitosNumero: Integer read GetQuantidadeDigitosNumero;
  end;

implementation

end.
