unit Configuracao;

interface

uses
  ConfiguracaoGrupo;

type
  TConfiguracao = class
  private
    FConfiguracaoID: Integer;
    FConfiguracaoGrupo: TConfiguracaoGrupo;
    FSecao: string;
    FNome: string;
    FValor: string;
    FDescricao: string;

    procedure SetConfiguracaoID(
      const Value: Integer);

    procedure SetConfiguracaoGrupo(
      const Value: TConfiguracaoGrupo);

    procedure SetSecao(
      const Value: string);

    procedure SetNome(
      const Value: string);

    procedure SetValor(
      const Value: string);

    procedure SetDescricao(
      const Value: string);
  public
    constructor Create(
      const vpConfiguracaoID: Integer;
      const vpConfiguracaoGrupo: TConfiguracaoGrupo;
      const vpSecao: string;
      const vpNome: string;
      const vpValor: string;
      const vpDescricao: string); reintroduce;

    property ConfiguracaoID: Integer read FConfiguracaoID
      write SetConfiguracaoID;

    property ConfiguracaoGrupo: TConfiguracaoGrupo read FConfiguracaoGrupo
      write SetConfiguracaoGrupo;

    property Secao: string read FSecao write SetSecao;
    property Nome: string read FNome write SetNome;
    property Valor: string read FValor write SetValor;
    property Descricao: string read FDescricao write SetDescricao;
  end;

implementation

{ TConfiguracao }

constructor TConfiguracao.Create(
  const vpConfiguracaoID: Integer;
  const vpConfiguracaoGrupo: TConfiguracaoGrupo;
  const vpSecao: string;
  const vpNome: string;
  const vpValor: string;
  const vpDescricao: string);
begin
  inherited Create;

  ConfiguracaoID := vpConfiguracaoID;
  ConfiguracaoGrupo := vpConfiguracaoGrupo;
  Secao := vpSecao;
  Nome := vpNome;
  Valor := vpValor;
  Descricao := vpDescricao;
end;

procedure TConfiguracao.SetConfiguracaoGrupo(
  const Value: TConfiguracaoGrupo);
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

procedure TConfiguracao.SetValor(
  const Value: string);
begin
  FValor := Value;
end;

end.
