unit SistemaImpl;

interface

uses
  Sistema;

type
  TSistema = class(TInterfacedObject, ISistema)
  private
    FSistemaID: Integer;
    FDescricao: string;
    FSituacao: Boolean;
    FVersao: string;

    function GetSistemaID: Integer;
    function GetDescricao: string;
    function GetSituacao: Boolean;
    function GetVersao: string;

    procedure SetSistemaID(
      const vpValue: Integer);

    procedure SetDescricao(
      const vpValue: string);

    procedure SetSituacao(
      const vpValue: Boolean);

    procedure SetVersao(
      const vpValue: string);
  public
    property SistemaID: Integer read GetSistemaID write SetSistemaID;
    property Descricao: string read GetDescricao write SetDescricao;
    property Situacao: Boolean read GetSituacao write SetSituacao;
    property Versao: string read GetVersao write SetVersao;

    function Equals(
      const vpValue: ISistema): Boolean; reintroduce;

    function NotEquals(
      const vpValue: ISistema): Boolean;

    class function New: ISistema; static;
  end;

implementation

uses
  BooleanHelper,
  System.Math,
  System.Types;

{ TSistema }

function TSistema.Equals(
  const vpValue: ISistema): Boolean;
begin
  Result := CompareValue(
    SistemaID,
    vpValue.SistemaID) = EqualsValue;
end;

function TSistema.GetDescricao: string;
begin
  Result := FDescricao;
end;

function TSistema.GetSistemaID: Integer;
begin
  Result := FSistemaID;
end;

function TSistema.GetSituacao: Boolean;
begin
  Result := FSituacao;
end;

function TSistema.GetVersao: string;
begin
  Result := FVersao;
end;

class function TSistema.New: ISistema;
begin
  Result := TSistema.Create;
end;

function TSistema.NotEquals(
  const vpValue: ISistema): Boolean;
begin
  Result := Equals(vpValue);
  Result.Negate;
end;

procedure TSistema.SetDescricao(
  const vpValue: string);
begin
  FDescricao := vpValue;
end;

procedure TSistema.SetSistemaID(
  const vpValue: Integer);
begin
  FSistemaID := vpValue;
end;

procedure TSistema.SetSituacao(
  const vpValue: Boolean);
begin
  FSituacao := vpValue;
end;

procedure TSistema.SetVersao(
  const vpValue: string);
begin
  FVersao := vpValue;
end;

end.
