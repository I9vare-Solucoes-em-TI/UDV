unit EmolumentoImpl;

interface

uses
  Emolumento,
  Sistema;

type
  TEmolumento = class(TInterfacedObject, IEmolumento)
  private
    FEmolumentoID: Integer;
    FDescricao: string;
    FSistema: ISistema;
    FSituacao: Boolean;

    function GetEmolumentoID: Integer;
    function GetDescricao: string;
    function GetSistema: ISistema;
    function GetSituacao: Boolean;

    procedure SetEmolumentoID(
      const Value: Integer);

    procedure SetDescricao(
      const Value: string);

    procedure SetSistema(
      const Value: ISistema);

    procedure SetSituacao(
      const Value: Boolean);
  public
    constructor Create; overload;

    constructor Create(
      const vpEmolumentoID: Integer); overload;

    constructor Create(
      const vpEmolumentoID: Integer;
      const vpDescricao: string); overload;

    property EmolumentoID: Integer read GetEmolumentoID write SetEmolumentoID;
    property Descricao: string read GetDescricao write SetDescricao;
    property Sistema: ISistema read GetSistema write SetSistema;
    property Situacao: Boolean read GetSituacao write SetSituacao;

    function Equals(
      const vpValue: IEmolumento): Boolean; reintroduce;

    function NotEquals(
      const vpValue: IEmolumento): Boolean;

    destructor Destroy; override;
  end;

implementation

uses
  System.Math,
  System.Types,
  BooleanHelper;

{ TEmolumento }

constructor TEmolumento.Create(
  const vpEmolumentoID: Integer;
  const vpDescricao: string);
begin
  Create;

  EmolumentoID := vpEmolumentoID;
  Descricao := vpDescricao;
end;

constructor TEmolumento.Create(
  const vpEmolumentoID: Integer);
begin
  Create;

  EmolumentoID := vpEmolumentoID;
end;

constructor TEmolumento.Create;
begin
  inherited
end;

destructor TEmolumento.Destroy;
begin
  inherited
end;

function TEmolumento.Equals(
  const vpValue: IEmolumento): Boolean;
begin
  Result := CompareValue(EmolumentoID, vpValue.EmolumentoID) = EqualsValue;
end;

function TEmolumento.GetDescricao: string;
begin
  Result := FDescricao;
end;

function TEmolumento.GetEmolumentoID: Integer;
begin
  Result := FEmolumentoID;
end;

function TEmolumento.GetSistema: ISistema;
begin
  Result := FSistema;
end;

function TEmolumento.GetSituacao: Boolean;
begin
  Result := FSituacao;
end;

function TEmolumento.NotEquals(
  const vpValue: IEmolumento): Boolean;
begin
  Result := Equals(vpValue);
  Result.Negate;
end;

procedure TEmolumento.SetDescricao(
  const Value: string);
begin
  FDescricao := Value;
end;

procedure TEmolumento.SetEmolumentoID(
  const Value: Integer);
begin
  FEmolumentoID := Value;
end;

procedure TEmolumento.SetSistema(
  const Value: ISistema);
begin
  FSistema := Value;
end;

procedure TEmolumento.SetSituacao(
  const Value: Boolean);
begin
  FSituacao := Value;
end;

end.
