unit Geral.Model.Entity.Spec.FormatacaoMascaraSelo;

interface

uses
  Geral.Model.Entity.Spec.SeloLivro;

type
  IFormatacaoMascaraSelo = interface
    ['{7F1CA4E8-079C-4C38-ADA1-0D4186123E81}']

    function Formatar(
      const vpValue: ISeloLivro): string;

    function QuantidadeDigitosNumero: Integer;
  end;

implementation

end.
