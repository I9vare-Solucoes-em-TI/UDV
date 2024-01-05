unit RegimeComunhaoImpl;

interface

uses
  RegimeComunhao,
  RegimeBens;

type
  TRegimeComunhao = class(TInterfacedObject, IRegimeComunhao)
  private
    FRegimeComunhaoID: Integer;
    FDescricao: string;
    FTexto: string;
    FSituacao: Boolean;
    FRegimeBens: IRegimeBens;

    function GetRegimeComunhaoID: Integer;
    function GetDescricao: string;
    function GetTexto: string;
    function GetSituacao: Boolean;
    function GetRegimeBens: IRegimeBens;

    procedure SetRegimeComunhaoID(
      const Value: Integer);

    procedure SetDescricao(
      const Value: string);

    procedure SetTexto(
      const Value: string);

    procedure SetSituacao(
      const Value: Boolean);

    procedure SetRegimeBens(
      const Value: IRegimeBens);
  public
    property RegimeComunhaoID: Integer read GetRegimeComunhaoID
      write SetRegimeComunhaoID;

    property Descricao: string read GetDescricao write SetDescricao;
    property Texto: string read GetTexto write SetTexto;
    property Situacao: Boolean read GetSituacao write SetSituacao;
    property RegimeBens: IRegimeBens read GetRegimeBens write SetRegimeBens;

    function Equals(
      const vpValue: IRegimeComunhao): Boolean; reintroduce;

    function NotEquals(
      const vpValue: IRegimeComunhao): Boolean;
  end;

implementation

uses
  System.Math,
  System.Types,
  BooleanHelper;

{ TRegimeComunhao }

function TRegimeComunhao.Equals(
  const vpValue: IRegimeComunhao): Boolean;
begin
  Result := CompareValue(RegimeComunhaoID,
    vpValue.RegimeComunhaoID) = EqualsValue;
end;

function TRegimeComunhao.GetDescricao: string;
begin
  Result := FDescricao;
end;

function TRegimeComunhao.GetRegimeBens: IRegimeBens;
begin
  Result := FRegimeBens;
end;

function TRegimeComunhao.GetRegimeComunhaoID: Integer;
begin
  Result := FRegimeComunhaoID;
end;

function TRegimeComunhao.GetSituacao: Boolean;
begin
  Result := FSituacao;
end;

function TRegimeComunhao.GetTexto: string;
begin
  Result := FTexto;
end;

function TRegimeComunhao.NotEquals(
  const vpValue: IRegimeComunhao): Boolean;
begin
  Result := Equals(vpValue);
  Result.Negate;
end;

procedure TRegimeComunhao.SetDescricao(
  const Value: string);
begin
  FDescricao := Value;
end;

procedure TRegimeComunhao.SetRegimeBens(
  const Value: IRegimeBens);
begin
  FRegimeBens := Value;
end;

procedure TRegimeComunhao.SetRegimeComunhaoID(
  const Value: Integer);
begin
  FRegimeComunhaoID := Value;
end;

procedure TRegimeComunhao.SetSituacao(
  const Value: Boolean);
begin
  FSituacao := Value;
end;

procedure TRegimeComunhao.SetTexto(
  const Value: string);
begin
  FTexto := Value;
end;

end.
