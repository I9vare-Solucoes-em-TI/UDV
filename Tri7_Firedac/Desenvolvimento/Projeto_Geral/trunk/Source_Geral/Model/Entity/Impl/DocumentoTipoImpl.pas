unit DocumentoTipoImpl;

interface

uses
  DocumentoTipo;

type
  TDocumentoTipo = class(TInterfacedObject, IDocumentoTipo)
  private
    FDocumentoTipoID: Integer;
    FDescricao: string;
    FTexto: string;
    FSituacao: Boolean;
    FOrgaoPadrao: string;
    FDescricaoSimplificada: string;

    function GetDocumentoTipoID: Integer;
    function GetDescricao: string;
    function GetTexto: string;
    function GetSituacao: Boolean;
    function GetOrgaoPadrao: string;
    function GetDescricaoSimplificada: string;

    procedure SetDocumentoTipoID(
      const Value: Integer);

    procedure SetDescricao(
      const Value: string);

    procedure SetTexto(
      const Value: string);

    procedure SetSituacao(
      const Value: Boolean);

    procedure SetOrgaoPadrao(
      const Value: string);

    procedure SetDescricaoSimplificada(
      const Value: string);
  public
    property DocumentoTipoID: Integer read GetDocumentoTipoID
      write SetDocumentoTipoID;

    property Descricao: string read GetDescricao write SetDescricao;
    property Texto: string read GetTexto write SetTexto;
    property Situacao: Boolean read GetSituacao write SetSituacao;
    property OrgaoPadrao: string read GetOrgaoPadrao write SetOrgaoPadrao;

    property DescricaoSimplificada: string read GetDescricaoSimplificada
      write SetDescricaoSimplificada;

    function Equals(
      const vpValue: IDocumentoTipo): Boolean; reintroduce;

    function NotEquals(
      const vpValue: IDocumentoTipo): Boolean;
  end;

implementation

uses
  System.Math,
  System.Types,
  BooleanHelper;

{ TDocumentoTipo }

function TDocumentoTipo.Equals(
  const vpValue: IDocumentoTipo): Boolean;
begin
  Result := CompareValue(DocumentoTipoID,
    vpValue.DocumentoTipoID) = EqualsValue;
end;

function TDocumentoTipo.GetDescricao: string;
begin
  Result := FDescricao;
end;

function TDocumentoTipo.GetDescricaoSimplificada: string;
begin
  Result := FDescricaoSimplificada;
end;

function TDocumentoTipo.GetDocumentoTipoID: Integer;
begin
  Result := FDocumentoTipoID;
end;

function TDocumentoTipo.GetOrgaoPadrao: string;
begin
  Result := FOrgaoPadrao;
end;

function TDocumentoTipo.GetSituacao: Boolean;
begin
  Result := FSituacao;
end;

function TDocumentoTipo.GetTexto: string;
begin
  Result := FTexto;
end;

function TDocumentoTipo.NotEquals(
  const vpValue: IDocumentoTipo): Boolean;
begin
  Result := Equals(vpValue);
  Result.Negate;
end;

procedure TDocumentoTipo.SetDescricao(
  const Value: string);
begin
  FDescricao := Value;
end;

procedure TDocumentoTipo.SetDescricaoSimplificada(
  const Value: string);
begin
  FDescricaoSimplificada := Value;
end;

procedure TDocumentoTipo.SetDocumentoTipoID(
  const Value: Integer);
begin
  FDocumentoTipoID := Value;
end;

procedure TDocumentoTipo.SetOrgaoPadrao(
  const Value: string);
begin
  FOrgaoPadrao := Value;
end;

procedure TDocumentoTipo.SetSituacao(
  const Value: Boolean);
begin
  FSituacao := Value;
end;

procedure TDocumentoTipo.SetTexto(
  const Value: string);
begin
  FTexto := Value;
end;

end.
