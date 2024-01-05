unit Geral.Model.Entity.Impl.Factory.TipoValorConfiguracao;

interface

uses
  Geral.Model.Entity.Spec.Factory,
  Geral.Model.Entity.Spec.TipoValorConfiguracao;

type
  TTipoValorConfiguracaoFactory = class(TInterfacedObject,
    IFactory<ITipoValorConfiguracao>)
  private
    FValue: string;
  public
    constructor Create(
      const vpValue: string); reintroduce;

    function GetInstance: ITipoValorConfiguracao;

    class function New(
      const vpValue: string): IFactory<ITipoValorConfiguracao>;
  end;

implementation

uses
  System.SysUtils,
  Geral.Model.Entity.Impl.TipoValorConfiguracao;

{ TTipoValorConfiguracaoFactory }

constructor TTipoValorConfiguracaoFactory.Create(
  const vpValue: string);
begin
  inherited Create;
  FValue := vpValue;
end;

function TTipoValorConfiguracaoFactory.GetInstance: ITipoValorConfiguracao;
begin
  if FValue.Equals(
    '1') then
    Exit(
      TComum.New);

  if FValue.Equals(
    '2') then
    Exit(
      TImpressora.New);

  if FValue.Equals(
    '3') then
    Exit(
      TPadronizado.New);

  if FValue.Equals(
    '4') then
    Exit(
      TOutrasTabelas.New);

  if FValue.Equals(
    '5') then
    Exit(
      TCor.New);

  if FValue.Equals(
    '6') then
    Exit(
      TTexto.New);

  Result := TFonte.New;
end;

class function TTipoValorConfiguracaoFactory.New(
  const vpValue: string): IFactory<ITipoValorConfiguracao>;
begin
  Result := Create(
    vpValue);
end;

end.
