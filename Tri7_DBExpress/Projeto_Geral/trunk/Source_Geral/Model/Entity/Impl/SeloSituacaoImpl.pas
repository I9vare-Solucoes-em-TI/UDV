unit SeloSituacaoImpl;

interface

uses
  SeloSituacao,
  Sistema;

type
  TSeloSituacao = class(TInterfacedObject, ISeloSituacao)
  private
    FSeloSituacaoID: Integer;
    FDescricao: string;
    FSituacao: Boolean;
    FSistema: ISistema;

    function GetSeloSituacaoID: Integer;
    function GetDescricao: string;
    function GetSituacao: Boolean;
    function GetSistema: ISistema;

    procedure SetSeloSituacaoID(
      const Value: Integer);

    procedure SetDescricao(
      const Value: string);

    procedure SetSituacao(
      const Value: Boolean);

    procedure SetSistema(
      const Value: ISistema);
  public
    property SeloSituacaoID: Integer read GetSeloSituacaoID
      write SetSeloSituacaoID;

    property Descricao: string read GetDescricao write SetDescricao;
    property Situacao: Boolean read GetSituacao write SetSituacao;
    property Sistema: ISistema read GetSistema write SetSistema;

    function Equals(
      const vpValue: ISeloSituacao): Boolean; reintroduce;

    function NotEquals(
      const vpValue: ISeloSituacao): Boolean;
  end;

implementation

uses
  System.Math,
  System.Types,
  BooleanHelper;

{ TSeloSituacao }

function TSeloSituacao.Equals(
  const vpValue: ISeloSituacao): Boolean;
begin
  Result := CompareValue(SeloSituacaoID, vpValue.SeloSituacaoID) = EqualsValue;
end;

function TSeloSituacao.GetDescricao: string;
begin
  Result := FDescricao;
end;

function TSeloSituacao.GetSeloSituacaoID: Integer;
begin
  Result := FSeloSituacaoID;
end;

function TSeloSituacao.GetSistema: ISistema;
begin
  Result := FSistema;
end;

function TSeloSituacao.GetSituacao: Boolean;
begin
  Result := FSituacao;
end;

function TSeloSituacao.NotEquals(
  const vpValue: ISeloSituacao): Boolean;
begin
  Result := Equals(vpValue);
  Result.Negate;
end;

procedure TSeloSituacao.SetDescricao(
  const Value: string);
begin
  FDescricao := Value;
end;

procedure TSeloSituacao.SetSeloSituacaoID(
  const Value: Integer);
begin
  FSeloSituacaoID := Value;
end;

procedure TSeloSituacao.SetSistema(
  const Value: ISistema);
begin
  FSistema := Value;
end;

procedure TSeloSituacao.SetSituacao(
  const Value: Boolean);
begin
  FSituacao := Value;
end;

end.
