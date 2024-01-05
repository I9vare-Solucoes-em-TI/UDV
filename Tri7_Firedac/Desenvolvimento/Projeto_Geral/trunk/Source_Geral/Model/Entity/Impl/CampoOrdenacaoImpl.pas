unit CampoOrdenacaoImpl;

interface

uses
  CampoOrdenacao,
  TipoOrdenacao;

type
  TCampoOrdenacao = class(TInterfacedObject, ICampoOrdenacao)
  private
    FNome: string;
    FTipo: TTipoOrdenacao;

    function GetNome: string;
    function GetTipo: TTipoOrdenacao;

    procedure SetNome(
      const Value: string);

    procedure SetTipo(
      const Value: TTipoOrdenacao);
  public
    constructor Create(
      const vpNome: string;
      const vpTipo: TTipoOrdenacao = TTipoOrdenacao.toAscendente);

    property Nome: string read GetNome write SetNome;
    property Tipo: TTipoOrdenacao read GetTipo write SetTipo;

    function Equals(
      const vpValue: ICampoOrdenacao): Boolean; reintroduce;

    class function New(
      const vpNome: string;
      const vpTipo: TTipoOrdenacao = TTipoOrdenacao.toAscendente):
      ICampoOrdenacao; static;
  end;

implementation

uses
  System.SysUtils,
  BooleanHelper,
  TipoOrdenacaoHelper;

{ TCampoOrdenacao }

constructor TCampoOrdenacao.Create(
  const vpNome: string;
  const vpTipo: TTipoOrdenacao);
begin
  inherited Create;

  Nome := vpNome;
  Tipo := vpTipo;
end;

function TCampoOrdenacao.Equals(
  const vpValue: ICampoOrdenacao): Boolean;
begin
  Result := Nome.Equals(vpValue.Nome).&And(
    Tipo.Equals(vpValue.Tipo));
end;

function TCampoOrdenacao.GetNome: string;
begin
  Result := FNome;
end;

function TCampoOrdenacao.GetTipo: TTipoOrdenacao;
begin
  Result := FTipo;
end;

class function TCampoOrdenacao.New(
  const vpNome: string;
  const vpTipo: TTipoOrdenacao): ICampoOrdenacao;
begin
  Result := TCampoOrdenacao.Create(vpNome, vpTipo);
end;

procedure TCampoOrdenacao.SetNome(
  const Value: string);
begin
  FNome := Value;
end;

procedure TCampoOrdenacao.SetTipo(
  const Value: TTipoOrdenacao);
begin
  FTipo := Value;
end;

end.
