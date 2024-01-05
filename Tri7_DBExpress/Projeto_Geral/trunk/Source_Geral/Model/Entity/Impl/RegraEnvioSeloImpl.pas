unit RegraEnvioSeloImpl;

interface

uses
  RegraEnvioSelo,
  SeloGrupo;

type
  TRegraEnvioSelo = class(TInterfacedObject, IRegraEnvioSelo)
  private
    FRegraEnvioSeloID: Integer;
    FSeloGrupo: ISeloGrupo;
    FIntervalo: Integer;

    function GetRegraEnvioSeloID: Integer;
    function GetSeloGrupo: ISeloGrupo;
    function GetIntervalo: Integer;

    procedure SetRegraEnvioSeloID(
      const Value: Integer);

    procedure SetSeloGrupo(
      const Value: ISeloGrupo);

    procedure SetIntervalo(
      const Value: Integer);
  public
    property RegraEnvioSeloID: Integer read GetRegraEnvioSeloID
      write SetRegraEnvioSeloID;

    property SeloGrupo: ISeloGrupo read GetSeloGrupo write SetSeloGrupo;
    property Intervalo: Integer read GetIntervalo write SetIntervalo;

    function Equals(
      const vpValue: IRegraEnvioSelo): Boolean; reintroduce;

    function NotEquals(
      const vpValue: IRegraEnvioSelo): Boolean;
  end;

implementation

uses
  System.Math,
  System.Types,
  BooleanHelper;

{ TRegraEnvioSelo }

function TRegraEnvioSelo.Equals(
  const vpValue: IRegraEnvioSelo): Boolean;
begin
  Result := CompareValue(RegraEnvioSeloID,
    vpValue.RegraEnvioSeloID) = EqualsValue;
end;

function TRegraEnvioSelo.GetIntervalo: Integer;
begin
  Result := FIntervalo;
end;

function TRegraEnvioSelo.GetRegraEnvioSeloID: Integer;
begin
  Result := FRegraEnvioSeloID;
end;

function TRegraEnvioSelo.GetSeloGrupo: ISeloGrupo;
begin
  Result := FSeloGrupo;
end;

function TRegraEnvioSelo.NotEquals(
  const vpValue: IRegraEnvioSelo): Boolean;
begin
  Result := Equals(vpValue);
  Result.Negate;
end;

procedure TRegraEnvioSelo.SetIntervalo(
  const Value: Integer);
begin
  FIntervalo := Value;
end;

procedure TRegraEnvioSelo.SetRegraEnvioSeloID(
  const Value: Integer);
begin
  FRegraEnvioSeloID := Value;
end;

procedure TRegraEnvioSelo.SetSeloGrupo(
  const Value: ISeloGrupo);
begin
  FSeloGrupo := Value;
end;

end.
