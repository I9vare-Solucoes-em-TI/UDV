unit EstadoCivilImpl;

interface

uses
  EstadoCivil,
  Sistema;

type
  TEstadoCivil = class(TInterfacedObject, IEstadoCivil)
  private
    FEstadoCivilID: Integer;
    FDescricao: string;
    FSituacao: Boolean;
    FSistema: ISistema;

    function GetEstadoCivilID: Integer;
    function GetDescricao: string;
    function GetSituacao: Boolean;
    function GetSistema: ISistema;

    procedure SetEstadoCivilID(
      const Value: Integer);

    procedure SetDescricao(
      const Value: string);

    procedure SetSituacao(
      const Value: Boolean);

    procedure SetSistema(
      const Value: ISistema);
  public
    property EstadoCivilID: Integer read GetEstadoCivilID
      write SetEstadoCivilID;

    property Descricao: string read GetDescricao write SetDescricao;
    property Situacao: Boolean read GetSituacao write SetSituacao;
    property Sistema: ISistema read GetSistema write SetSistema;

    function Equals(
      const vpValue: IEstadoCivil): Boolean; reintroduce;

    function NotEquals(
      const vpValue: IEstadoCivil): Boolean;

    class function New: IEstadoCivil; static;
  end;

implementation

uses
  System.Math,
  System.Types,
  BooleanHelper;

{ TEstadoCivil }

procedure TEstadoCivil.SetEstadoCivilID(
  const Value: Integer);
begin
  FEstadoCivilID := Value;
end;

function TEstadoCivil.Equals(
  const vpValue: IEstadoCivil): Boolean;
begin
  Result := CompareValue(
    EstadoCivilID,
    vpValue.EstadoCivilID) = EqualsValue;
end;

function TEstadoCivil.GetDescricao: string;
begin
  Result := FDescricao;
end;

function TEstadoCivil.GetEstadoCivilID: Integer;
begin
  Result := FEstadoCivilID;
end;

function TEstadoCivil.GetSistema: ISistema;
begin
  Result := FSistema;
end;

function TEstadoCivil.GetSituacao: Boolean;
begin
  Result := FSituacao;
end;

class function TEstadoCivil.New: IEstadoCivil;
begin
  Result := TEstadoCivil.Create;
end;

function TEstadoCivil.NotEquals(
  const vpValue: IEstadoCivil): Boolean;
begin
  Result := Equals(vpValue);
  Result.Negate;
end;

procedure TEstadoCivil.SetDescricao(
  const Value: string);
begin
  FDescricao := Value;
end;

procedure TEstadoCivil.SetSituacao(
  const Value: Boolean);
begin
  FSituacao := Value;
end;

procedure TEstadoCivil.SetSistema(
  const Value: ISistema);
begin
  FSistema := Value;
end;

end.
