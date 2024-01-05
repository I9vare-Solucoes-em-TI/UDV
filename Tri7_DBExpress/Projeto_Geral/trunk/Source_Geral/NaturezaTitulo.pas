unit NaturezaTitulo;

interface

uses
  ConfigRelatorios;

type
  TNaturezaTitulo = class
  private
    FNaturezaTituloID: Integer;
    FDescricao: string;
    FSituacao: Boolean;
    FSistemaID: Integer;
    FRelatorioCertidaoImagem: TConfiguracaoRelatorio;
    FTipoTitulo: string;

    procedure SetNaturezaTituloID(
      const Value: Integer);

    procedure SetDescricao(
      const Value: string);

    procedure SetSituacao(
      const Value: Boolean);

    procedure SetSistemaID(
      const Value: Integer);

    procedure SetRelatorioCertidaoImagem(
      const Value: TConfiguracaoRelatorio);

    procedure SetTipoTitulo(
      const Value: string);
  public
    constructor Create; overload;

    constructor Create(
      const vpNaturezaTituloID: Integer); overload;

    constructor Create(
      const vpNaturezaTituloID: Integer;
      const vpDescricao: string); overload;

    constructor Create(
      const vpNaturezaTituloID: Integer;
      const vpDescricao: string;
      const vpSituacao: Boolean;
      const vpSistemaID: Integer); overload;

    property NaturezaTituloID: Integer read FNaturezaTituloID
      write SetNaturezaTituloID;

    property Descricao: string read FDescricao write SetDescricao;

    property Situacao: Boolean read FSituacao write SetSituacao;
    property SistemaID: Integer read FSistemaID write SetSistemaID;

    property RelatorioCertidaoImagem: TConfiguracaoRelatorio
      read FRelatorioCertidaoImagem write SetRelatorioCertidaoImagem;

    property TipoTitulo: string read FTipoTitulo write SetTipoTitulo;

    function Equals(
      Obj: TObject): Boolean; override;

    destructor Destroy; override;
  end;

implementation

{ TNaturezaTitulo }

constructor TNaturezaTitulo.Create(
  const vpNaturezaTituloID: Integer;
  const vpDescricao: string);
begin
  Create(vpNaturezaTituloID);
  Descricao := vpDescricao;
end;

constructor TNaturezaTitulo.Create;
begin
  inherited;
end;

constructor TNaturezaTitulo.Create(
  const vpNaturezaTituloID: Integer;
  const vpDescricao: string;
  const vpSituacao: Boolean;
  const vpSistemaID: Integer);
begin
  Create(vpNaturezaTituloID, vpDescricao);

  Situacao := vpSituacao;
  SistemaID := vpSistemaID;
end;

constructor TNaturezaTitulo.Create(
  const vpNaturezaTituloID: Integer);
begin
  Create;
  NaturezaTituloID := vpNaturezaTituloID;
end;

destructor TNaturezaTitulo.Destroy;
begin
  RelatorioCertidaoImagem.Free;
  inherited;
end;

function TNaturezaTitulo.Equals(
  Obj: TObject): Boolean;
begin
  Result := (Obj is Self.ClassType) and
    (TNaturezaTitulo(Obj).NaturezaTituloID = NaturezaTituloID);
end;

procedure TNaturezaTitulo.SetDescricao(
  const Value: string);
begin
  FDescricao := Value;
end;

procedure TNaturezaTitulo.SetNaturezaTituloID(
  const Value: Integer);
begin
  FNaturezaTituloID := Value;
end;

procedure TNaturezaTitulo.SetRelatorioCertidaoImagem(
  const Value: TConfiguracaoRelatorio);
begin
  FRelatorioCertidaoImagem := Value;
end;

procedure TNaturezaTitulo.SetSistemaID(
  const Value: Integer);
begin
  FSistemaID := Value;
end;

procedure TNaturezaTitulo.SetSituacao(
  const Value: Boolean);
begin
  FSituacao := Value;
end;

procedure TNaturezaTitulo.SetTipoTitulo(
  const Value: string);
begin
  FTipoTitulo := Value;
end;

end.
