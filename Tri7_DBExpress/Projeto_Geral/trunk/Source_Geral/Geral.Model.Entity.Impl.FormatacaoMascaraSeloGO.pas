unit Geral.Model.Entity.Impl.FormatacaoMascaraSeloGO;

interface

uses
  Geral.Model.Entity.Spec.FormatacaoMascaraSelo,
  Geral.Model.Entity.Spec.SeloLivro;

type
  TFormatacaoMascaraSeloGO = class(TInterfacedObject, IFormatacaoMascaraSelo)
  public
    function Formatar(
      const vpValue: ISeloLivro): string;

    function QuantidadeDigitosNumero: Integer;
    class function New: IFormatacaoMascaraSelo;
  end;

implementation

uses
  System.SysUtils;

{ TFormatacaoMascaraSeloGO }

function TFormatacaoMascaraSeloGO.Formatar(
  const vpValue: ISeloLivro): string;
begin
  Result := string.Format(
    vpValue.Sigla +
    '%.*d',
    [QuantidadeDigitosNumero,
    vpValue.Numero]);
end;

class function TFormatacaoMascaraSeloGO.New: IFormatacaoMascaraSelo;
begin
  Result := Create;
end;

function TFormatacaoMascaraSeloGO.QuantidadeDigitosNumero: Integer;
begin
  Result := 6;
end;

end.
