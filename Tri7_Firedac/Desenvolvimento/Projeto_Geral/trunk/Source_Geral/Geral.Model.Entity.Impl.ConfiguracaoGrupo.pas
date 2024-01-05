unit Geral.Model.Entity.Impl.ConfiguracaoGrupo;

interface

uses
  Geral.Model.Entity.Spec.ConfiguracaoGrupo,
  Geral.Model.Entity.Spec.Sistema;

type
  TConfiguracaoGrupo = class(TInterfacedObject, IConfiguracaoGrupo)
  private
    FID: Integer;
    FDescricao: string;
    FSistema: ISistema;
  public
    constructor Create(
      const vpID: Integer;
      const vpDescricao: string;
      const vpSistema: ISistema); reintroduce;

    function ID: Integer;
    function Descricao: string;
    function Sistema: ISistema;

    class function New(
      const vpID: Integer;
      const vpDescricao: string;
      const vpSistema: ISistema): IConfiguracaoGrupo;
  end;

implementation

{ TConfiguracaoGrupo }

constructor TConfiguracaoGrupo.Create(
  const vpID: Integer;
  const vpDescricao: string;
  const vpSistema: ISistema);
begin
  inherited Create;
  FID := vpID;
  FDescricao := vpDescricao;
  FSistema := vpSistema;
end;

function TConfiguracaoGrupo.Descricao: string;
begin
  Result := FDescricao;
end;

function TConfiguracaoGrupo.ID: Integer;
begin
  Result := FID;
end;

class function TConfiguracaoGrupo.New(
  const vpID: Integer;
  const vpDescricao: string;
  const vpSistema: ISistema): IConfiguracaoGrupo;
begin
  Result := Create(
    vpID,
    vpDescricao,
    vpSistema);
end;

function TConfiguracaoGrupo.Sistema: ISistema;
begin
  Result := FSistema;
end;

end.
