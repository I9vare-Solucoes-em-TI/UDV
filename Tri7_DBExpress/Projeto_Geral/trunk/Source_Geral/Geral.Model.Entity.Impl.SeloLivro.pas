unit Geral.Model.Entity.Impl.SeloLivro;

interface

uses
  Geral.Model.Entity.Spec.SeloLivro;

type
  TSeloLivro = class(TInterfacedObject, ISeloLivro)
  private
    FID: Integer;
    FNumero: Integer;
    FSigla: string;
    FValidado: Boolean;
  public
    constructor Create(
      const vpID: Integer;
      const vpNumero: Integer;
      const vpSigla: string;
      const vpValidado: Boolean); reintroduce;

    function ID: Integer;
    function Numero: Integer;
    function Sigla: string;
    function Validado: Boolean;

    class function New(
      const vpID: Integer;
      const vpNumero: Integer;
      const vpSigla: string;
      const vpValidado: Boolean): ISeloLivro;
  end;

implementation

{ TSeloLivro }

constructor TSeloLivro.Create(
  const vpID: Integer;
  const vpNumero: Integer;
  const vpSigla: string;
  const vpValidado: Boolean);
begin
  inherited Create;
  FID := vpID;
  FNumero := vpNumero;
  FSigla := vpSigla;
  FValidado := vpValidado;
end;

function TSeloLivro.ID: Integer;
begin
  Result := FID;
end;

class function TSeloLivro.New(
  const vpID: Integer;
  const vpNumero: Integer;
  const vpSigla: string;
  const vpValidado: Boolean): ISeloLivro;
begin
  Result := Create(
    vpID,
    vpNumero,
    vpSigla,
    vpValidado);
end;

function TSeloLivro.Numero: Integer;
begin
  Result := FNumero;
end;

function TSeloLivro.Sigla: string;
begin
  Result := FSigla;
end;

function TSeloLivro.Validado: Boolean;
begin
  Result := FValidado;
end;

end.
