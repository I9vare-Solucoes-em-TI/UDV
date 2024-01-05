unit Geral.Model.Entity.Impl.Factory.FormatacaoMascaraSelo;

interface

uses
  Geral.Model.Entity.Spec.Factory,
  Geral.Model.Entity.Spec.Maybe,
  Geral.Model.Entity.Spec.FormatacaoMascaraSelo;

type
  TFormatacaoMascaraSeloFactory = class(TInterfacedObject,
    IFactory<IMaybe<IFormatacaoMascaraSelo>>)
  private
    FUF: string;

    function FormatacaoMascaraSeloGO: IFormatacaoMascaraSelo;
  public
    constructor Create(
      const vpUF: string); reintroduce;

    function GetInstance: IMaybe<IFormatacaoMascaraSelo>;

    class function New(
      const vpUF: string): IFactory<IMaybe<IFormatacaoMascaraSelo>>;
  end;

implementation

uses
  Geral.Model.Entity.Impl.FormatacaoMascaraSeloGO,
  System.SysUtils,
  Geral.Model.Entity.Impl.Maybe;

{ TFormatacaoMascaraSeloFactory }

constructor TFormatacaoMascaraSeloFactory.Create(
  const vpUF: string);
begin
  inherited Create;
  FUF := vpUF;
end;

function TFormatacaoMascaraSeloFactory.FormatacaoMascaraSeloGO:
  IFormatacaoMascaraSelo;
begin
  Result := TFormatacaoMascaraSeloGO.New;
end;

function TFormatacaoMascaraSeloFactory.GetInstance:
  IMaybe<IFormatacaoMascaraSelo>;
begin
  if SameText(
    FUF,
    'GO') then
    Exit(
      TSome<IFormatacaoMascaraSelo>.New(
        FormatacaoMascaraSeloGO));

  Result := TNone<IFormatacaoMascaraSelo>.New;
end;

class function TFormatacaoMascaraSeloFactory.New(
  const vpUF: string): IFactory<IMaybe<IFormatacaoMascaraSelo>>;
begin
  Result := Create(
    vpUF);
end;

end.
