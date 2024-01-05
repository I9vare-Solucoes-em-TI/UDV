unit RegimeBensImpl;

interface

uses
  RegimeBens;

type
  TRegimeBens = class(TInterfacedObject, IRegimeBens)
  private
    FRegimeBensID: Integer;
    FDescricao: string;
    FSituacao: Boolean;

    function GetRegimeBensID: Integer;
    function GetDescricao: string;
    function GetSituacao: Boolean;

    procedure SetRegimeBensID(
      const Value: Integer);

    procedure SetDescricao(
      const Value: string);

    procedure SetSituacao(
      const Value: Boolean);
  public
    property RegimeBensID: Integer read GetRegimeBensID write SetRegimeBensID;
    property Descricao: string read GetDescricao write SetDescricao;
    property Situacao: Boolean read GetSituacao write SetSituacao;

    function Equals(
      const vpValue: IRegimeBens): Boolean; reintroduce;

    function NotEquals(
      const vpValue: IRegimeBens): Boolean;
  end;

implementation

uses
  System.Math,
  System.Types,
  BooleanHelper;

{ TRegimeBens }

function TRegimeBens.Equals(
  const vpValue: IRegimeBens): Boolean;
begin
  Result := CompareValue(RegimeBensID, vpValue.RegimeBensID) = EqualsValue;
end;

function TRegimeBens.GetDescricao: string;
begin
  Result := FDescricao;
end;

function TRegimeBens.GetRegimeBensID: Integer;
begin
  Result := FRegimeBensID;
end;

function TRegimeBens.GetSituacao: Boolean;
begin
  Result := FSituacao;
end;

function TRegimeBens.NotEquals(
  const vpValue: IRegimeBens): Boolean;
begin
  Result := Equals(vpValue);
  Result.Negate;
end;

procedure TRegimeBens.SetDescricao(
  const Value: string);
begin
  FDescricao := Value;
end;

procedure TRegimeBens.SetRegimeBensID(
  const Value: Integer);
begin
  FRegimeBensID := Value;
end;

procedure TRegimeBens.SetSituacao(
  const Value: Boolean);
begin
  FSituacao := Value;
end;

end.
