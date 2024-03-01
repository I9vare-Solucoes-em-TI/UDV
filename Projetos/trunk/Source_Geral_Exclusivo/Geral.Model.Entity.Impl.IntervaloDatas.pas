{* @hash       2b3a4f080d4b5e2a8e9e0d19eed146145d119703095919aaedf5e5e6a83c
 * @version    1.0.0.0
 * @unit       Geral.Model.Entity.Impl.IntervaloDatas.pas
 * @author     I9vare
 * @copyright  Copyright (c) 2013 I9vare Gestão e Soluções em TI. (https://www.i9vare.com)
 *}

unit Geral.Model.Entity.Impl.IntervaloDatas;

interface

uses
  Geral.Model.Entity.Spec.IntervaloDatas;

type
  TIntervaloDatas = class(TInterfacedObject, IIntervaloDatas)
  private
    FDataInicial: TDateTime;
    FDataFinal: TDateTime;
  public
    constructor Create(
      const vpDataInicial: TDateTime;
      const vpDataFinal: TDateTime); reintroduce;

    function DataInicial: TDateTime;
    function DataFinal: TDateTime;

    class function New(
      const vpDataInicial: TDateTime;
      const vpDataFinal: TDateTime): IIntervaloDatas;
  end;

implementation

{ TIntervaloDatas }

constructor TIntervaloDatas.Create(
  const vpDataInicial: TDateTime;
  const vpDataFinal: TDateTime);
begin
  inherited Create;
  FDataInicial := vpDataInicial;
  FDataFinal := vpDataFinal;
end;

function TIntervaloDatas.DataFinal: TDateTime;
begin
  Result := FDataFinal;
end;

function TIntervaloDatas.DataInicial: TDateTime;
begin
  Result := FDataInicial;
end;

class function TIntervaloDatas.New(
  const vpDataInicial: TDateTime;
  const vpDataFinal: TDateTime): IIntervaloDatas;
begin
  Result := Create(
    vpDataInicial,
    vpDataFinal);
end;

end.
