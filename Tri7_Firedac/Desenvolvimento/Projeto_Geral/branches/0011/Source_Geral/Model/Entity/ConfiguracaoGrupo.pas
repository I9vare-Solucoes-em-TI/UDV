unit ConfiguracaoGrupo;

interface

type
  TConfiguracaoGrupo = class
  private
    FConfiguracaoGrupoID: Integer;
    FDescricao: string;
    FSistemaID: Integer;

    procedure SetConfiguracaoGrupoID(
      const Value: Integer);

    procedure SetDescricao(
      const Value: string);

    procedure SetSistemaID(
      const Value: Integer);
  public
    constructor Create(
      const vpConfiguracaoGrupoID: Integer;
      const vpDescricao: string;
      const vpSistemaID: Integer); reintroduce;

    property ConfiguracaoGrupoID: Integer read FConfiguracaoGrupoID
      write SetConfiguracaoGrupoID;

    property Descricao: string read FDescricao write SetDescricao;
    property SistemaID: Integer read FSistemaID write SetSistemaID;

    function Equals(
      Obj: TObject): Boolean; override;
  end;

implementation

{ TConfiguracaoGrupo }

constructor TConfiguracaoGrupo.Create(
  const vpConfiguracaoGrupoID: Integer;
  const vpDescricao: string;
  const vpSistemaID: Integer);
begin
  inherited Create;

  ConfiguracaoGrupoID := vpConfiguracaoGrupoID;
  Descricao := vpDescricao;
  SistemaID := vpSistemaID;
end;

function TConfiguracaoGrupo.Equals(
  Obj: TObject): Boolean;
begin
  Result := (Obj is Self.ClassType) and
    (ConfiguracaoGrupoID = TConfiguracaoGrupo(Obj).ConfiguracaoGrupoID);
end;

procedure TConfiguracaoGrupo.SetConfiguracaoGrupoID(
  const Value: Integer);
begin
  FConfiguracaoGrupoID := Value;
end;

procedure TConfiguracaoGrupo.SetDescricao(
  const Value: string);
begin
  FDescricao := Value;
end;

procedure TConfiguracaoGrupo.SetSistemaID(
  const Value: Integer);
begin
  FSistemaID := Value;
end;

end.
