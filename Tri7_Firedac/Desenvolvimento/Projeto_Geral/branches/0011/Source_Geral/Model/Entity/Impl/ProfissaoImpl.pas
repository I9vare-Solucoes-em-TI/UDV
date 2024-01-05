unit ProfissaoImpl;

interface

uses
  Profissao;

type
  TProfissao = class(TInterfacedObject, IProfissao)
  private
    FProfissaoID: Integer;
    FDescricao: string;
    FSituacao: Boolean;
    FCodigoCBO: string;

    function GetProfissaoID: Integer;
    function GetDescricao: string;
    function GetSituacao: Boolean;
    function GetCodigoCBO: string;

    procedure SetProfissaoID(
      const Value: Integer);

    procedure SetDescricao(
      const Value: string);

    procedure SetSituacao(
      const Value: Boolean);

    procedure SetCodigoCBO(
      const Value: string);
  public
    property ProfissaoID: Integer read GetProfissaoID write SetProfissaoID;
    property Descricao: string read GetDescricao write SetDescricao;
    property Situacao: Boolean read GetSituacao write SetSituacao;
    property CodigoCBO: string read GetCodigoCBO write SetCodigoCBO;

    function Equals(
      const vpValue: IProfissao): Boolean; reintroduce;

    function NotEquals(
      const vpValue: IProfissao): Boolean;

    class function New: IProfissao; static;
  end;

implementation

uses
  System.Math,
  System.Types,
  BooleanHelper;

{ TProfissao }

procedure TProfissao.SetProfissaoID(
  const Value: Integer);
begin
  FProfissaoID := Value;
end;

procedure TProfissao.SetDescricao(
  const Value: string);
begin
  FDescricao := Value;
end;

procedure TProfissao.SetSituacao(
  const Value: Boolean);
begin
  FSituacao := Value;
end;

function TProfissao.Equals(
  const vpValue: IProfissao): Boolean;
begin
  Result := CompareValue(
    ProfissaoID,
    vpValue.ProfissaoID) = EqualsValue;
end;

function TProfissao.GetCodigoCBO: string;
begin
  Result := FCodigoCBO;
end;

function TProfissao.GetDescricao: string;
begin
  Result := FDescricao;
end;

function TProfissao.GetProfissaoID: Integer;
begin
  Result := FProfissaoID;
end;

function TProfissao.GetSituacao: Boolean;
begin
  Result := FSituacao;
end;

class function TProfissao.New: IProfissao;
begin
  Result := TProfissao.Create;
end;

function TProfissao.NotEquals(
  const vpValue: IProfissao): Boolean;
begin
  Result := Equals(vpValue);
  Result.Negate;
end;

procedure TProfissao.SetCodigoCBO(
  const Value: string);
begin
  FCodigoCBO := Value;
end;

end.
