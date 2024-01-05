unit Geral.Model.Entity.Impl.Factory.Situacao;

interface

uses
  Geral.Model.Entity.Spec.Factory,
  Geral.Model.Entity.Spec.Situacao;

type
  TSituacaoFactory = class(TInterfacedObject, IFactory<ISituacao>)
  private
    FValue: string;
  public
    constructor Create(
      const vpValue: string); reintroduce;

    function GetInstance: ISituacao;

    class function New(
      const vpValue: string): IFactory<ISituacao>;
  end;

implementation

uses
  Geral.Model.Entity.Impl.Situacao,
  System.SysUtils;

{ TSituacaoFactory }

constructor TSituacaoFactory.Create(
  const vpValue: string);
begin
  inherited Create;
  FValue := vpValue;
end;

function TSituacaoFactory.GetInstance: ISituacao;
begin
  if FValue.Equals(
    'A') then
    Exit(
      TAtivo.New);

  Result := TInativo.New;
end;

class function TSituacaoFactory.New(
  const vpValue: string): IFactory<ISituacao>;
begin
  Result := Create(
    vpValue);
end;

end.
