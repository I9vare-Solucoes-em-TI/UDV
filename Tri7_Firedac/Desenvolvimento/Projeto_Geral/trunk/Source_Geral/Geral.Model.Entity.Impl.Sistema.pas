unit Geral.Model.Entity.Impl.Sistema;

interface

uses
  Geral.Model.Entity.Spec.Sistema,
  Geral.Model.Entity.Spec.Situacao;

type
  TSistema = class(TInterfacedObject, ISistema)
  private
    FID: Integer;
    FDescricao: string;
    FSituacao: ISituacao;
    FVersao: string;
  public
    constructor Create(
      const vpID: Integer;
      const vpDescricao: string;
      const vpSituacao: ISituacao;
      const vpVersao: string); reintroduce;

    function ID: Integer;
    function Descricao: string;
    function Situacao: ISituacao;
    function Versao: string;

    class function New(
      const vpID: Integer;
      const vpDescricao: string;
      const vpSituacao: ISituacao;
      const vpVersao: string): ISistema;
  end;

implementation

{ TSistema }

constructor TSistema.Create(
  const vpID: Integer;
  const vpDescricao: string;
  const vpSituacao: ISituacao;
  const vpVersao: string);
begin
  inherited Create;
  FID := vpID;
  FDescricao := vpDescricao;
  FSituacao := vpSituacao;
  FVersao := vpVersao;
end;

function TSistema.Descricao: string;
begin
  Result := FDescricao;
end;

function TSistema.Situacao: ISituacao;
begin
  Result := FSituacao;
end;

function TSistema.Versao: string;
begin
  Result := FVersao;
end;

class function TSistema.New(
  const vpID: Integer;
  const vpDescricao: string;
  const vpSituacao: ISituacao;
  const vpVersao: string): ISistema;
begin
  Result := TSistema.Create(
    vpID,
    vpDescricao,
    vpSituacao,
    vpVersao);
end;

function TSistema.ID: Integer;
begin
  Result := FID;
end;

end.
