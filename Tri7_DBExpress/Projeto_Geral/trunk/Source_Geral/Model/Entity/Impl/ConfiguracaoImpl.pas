unit ConfiguracaoImpl;

interface

uses
  Configuracao,
  ConfiguracaoGrupo;

type
  TConfiguracao = class(TInterfacedObject, IConfiguracao)
  private
    FConfiguracaoID: Integer;
    FConfiguracaoGrupo: IConfiguracaoGrupo;
    FSecao: string;
    FNome: string;
    FValor: string;
    FDescricao: string;
    FTexto: string;

    function GetConfiguracaoID: Integer;
    function GetConfiguracaoGrupo: IConfiguracaoGrupo;
    function GetSecao: string;
    function GetNome: string;
    function GetValor: string;
    function GetDescricao: string;
    function GetTexto: string;

    procedure SetConfiguracaoID(
      const Value: Integer);

    procedure SetConfiguracaoGrupo(
      const Value: IConfiguracaoGrupo);

    procedure SetSecao(
      const Value: string);

    procedure SetNome(
      const Value: string);

    procedure SetValor(
      const Value: string);

    procedure SetDescricao(
      const Value: string);

    procedure SetTexto(
      const Value: string);
  public
    property ConfiguracaoID: Integer read GetConfiguracaoID
      write SetConfiguracaoID;

    property ConfiguracaoGrupo: IConfiguracaoGrupo read GetConfiguracaoGrupo
      write SetConfiguracaoGrupo;

    property Secao: string read GetSecao write SetSecao;
    property Nome: string read GetNome write SetNome;
    property Valor: string read GetValor write SetValor;
    property Descricao: string read GetDescricao write SetDescricao;
    property Texto: string read GetTexto write SetTexto;

    function Equals(
      const vpValue: IConfiguracao): Boolean; reintroduce;

    function NotEquals(
      const vpValue: IConfiguracao): Boolean;
  end;

implementation

uses
  System.Math,
  System.Types,
  BooleanHelper;

{ TConfiguracao }

function TConfiguracao.Equals(
  const vpValue: IConfiguracao): Boolean;
begin
  Result := CompareValue(ConfiguracaoID, vpValue.ConfiguracaoID) = EqualsValue;
end;

function TConfiguracao.GetConfiguracaoGrupo: IConfiguracaoGrupo;
begin
  Result := FConfiguracaoGrupo;
end;

function TConfiguracao.GetConfiguracaoID: Integer;
begin
  Result := FConfiguracaoID;
end;

function TConfiguracao.GetDescricao: string;
begin
  Result := FDescricao;
end;

function TConfiguracao.GetNome: string;
begin
  Result := FNome;
end;

function TConfiguracao.GetSecao: string;
begin
  Result := FSecao;
end;

function TConfiguracao.GetTexto: string;
begin
  Result := FTexto;
end;

function TConfiguracao.GetValor: string;
begin
  Result := FValor;
end;

function TConfiguracao.NotEquals(
  const vpValue: IConfiguracao): Boolean;
begin
  Result := Equals(vpValue);
  Result.Negate;
end;

procedure TConfiguracao.SetConfiguracaoGrupo(
  const Value: IConfiguracaoGrupo);
begin
  FConfiguracaoGrupo := Value;
end;

procedure TConfiguracao.SetConfiguracaoID(
  const Value: Integer);
begin
  FConfiguracaoID := Value;
end;

procedure TConfiguracao.SetDescricao(
  const Value: string);
begin
  FDescricao := Value;
end;

procedure TConfiguracao.SetNome(
  const Value: string);
begin
  FNome := Value;
end;

procedure TConfiguracao.SetSecao(
  const Value: string);
begin
  FSecao := Value;
end;

procedure TConfiguracao.SetTexto(
  const Value: string);
begin
  FTexto := Value;
end;

procedure TConfiguracao.SetValor(
  const Value: string);
begin
  FValor := Value;
end;

end.
