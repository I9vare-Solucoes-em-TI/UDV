unit SeloGrupoImpl;

interface

uses
  SeloGrupo,
  Sistema;

type
  TSeloGrupo = class(TInterfacedObject, ISeloGrupo)
  private
    FSeloGrupoID: Integer;
    FDescricao: string;
    FNumero: Integer;
    FSituacao: Boolean;
    FControleAutomatico: Boolean;
    FTipoCartorio: string;
    FDescricaoCompleta: string;
    FEstoqueMinimo: Integer;
    FNomeGrupo: string;
    FIDGrupoSelo: Integer;
    FPaginaAcresce: Boolean;
    FSistema: ISistema;
    FSeloUsuario: Boolean;

    function GetSeloGrupoID: Integer;
    function GetDescricao: string;
    function GetNumero: Integer;
    function GetSituacao: Boolean;
    function GetControleAutomatico: Boolean;
    function GetTipoCartorio: string;
    function GetDescricaoCompleta: string;
    function GetEstoqueMinimo: Integer;
    function GetNomeGrupo: string;
    function GetIDGrupoSelo: Integer;
    function GetPaginaAcresce: Boolean;
    function GetSistema: ISistema;
    function GetSeloUsuario: Boolean;

    procedure SetSeloGrupoID(
      const Value: Integer);

    procedure SetDescricao(
      const Value: string);

    procedure SetNumero(
      const Value: Integer);

    procedure SetSituacao(
      const Value: Boolean);

    procedure SetControleAutomatico(
      const Value: Boolean);

    procedure SetTipoCartorio(
      const Value: string);

    procedure SetDescricaoCompleta(
      const Value: string);

    procedure SetEstoqueMinimo(
      const Value: Integer);

    procedure SetNomeGrupo(
      const Value: string);

    procedure SetIDGrupoSelo(
      const Value: Integer);

    procedure SetPaginaAcresce(
      const Value: Boolean);

    procedure SetSistema(
      const Value: ISistema);

    procedure SetSeloUsuario(
      const Value: Boolean);
  public
    property SeloGrupoID: Integer read GetSeloGrupoID write SetSeloGrupoID;
    property Descricao: string read GetDescricao write SetDescricao;
    property Numero: Integer read GetNumero write SetNumero;
    property Situacao: Boolean read GetSituacao write SetSituacao;

    property ControleAutomatico: Boolean read GetControleAutomatico
      write SetControleAutomatico;

    property TipoCartorio: string read GetTipoCartorio write SetTipoCartorio;

    property DescricaoCompleta: string read GetDescricaoCompleta
      write SetDescricaoCompleta;

    property EstoqueMinimo: Integer read GetEstoqueMinimo
      write SetEstoqueMinimo;

    property NomeGrupo: string read GetNomeGrupo write SetNomeGrupo;
    property IDGrupoSelo: Integer read GetIDGrupoSelo write SetIDGrupoSelo;

    property PaginaAcresce: Boolean read GetPaginaAcresce
      write SetPaginaAcresce;

    property Sistema: ISistema read GetSistema write SetSistema;
    property SeloUsuario: Boolean read GetSeloUsuario write SetSeloUsuario;

    function Equals(
      const vpValue: ISeloGrupo): Boolean; reintroduce;

    function NotEquals(
      const vpValue: ISeloGrupo): Boolean;
  end;

implementation

uses
  System.Math,
  System.Types,
  BooleanHelper;

{ TSeloGrupo }

procedure TSeloGrupo.SetSeloGrupoID(
  const Value: Integer);
begin
  FSeloGrupoID := Value;
end;

procedure TSeloGrupo.SetDescricao(
  const Value: string);
begin
  FDescricao := Value;
end;

procedure TSeloGrupo.SetNumero(
  const Value: Integer);
begin
  FNumero := Value;
end;

procedure TSeloGrupo.SetSituacao(
  const Value: Boolean);
begin
  FSituacao := Value;
end;

function TSeloGrupo.Equals(
  const vpValue: ISeloGrupo): Boolean;
begin
  Result := CompareValue(SeloGrupoID, vpValue.SeloGrupoID) = EqualsValue;
end;

function TSeloGrupo.GetControleAutomatico: Boolean;
begin
  Result := FControleAutomatico;
end;

function TSeloGrupo.GetDescricao: string;
begin
  Result := FDescricao;
end;

function TSeloGrupo.GetDescricaoCompleta: string;
begin
  Result := FDescricaoCompleta;
end;

function TSeloGrupo.GetEstoqueMinimo: Integer;
begin
  Result := FEstoqueMinimo;
end;

function TSeloGrupo.GetIDGrupoSelo: Integer;
begin
  Result := FIDGrupoSelo;
end;

function TSeloGrupo.GetNomeGrupo: string;
begin
  Result := FNomeGrupo;
end;

function TSeloGrupo.GetNumero: Integer;
begin
  Result := FNumero;
end;

function TSeloGrupo.GetPaginaAcresce: Boolean;
begin
  Result := FPaginaAcresce;
end;

function TSeloGrupo.GetSeloGrupoID: Integer;
begin
   Result := FSeloGrupoID;
end;

function TSeloGrupo.GetSeloUsuario: Boolean;
begin
  Result := FSeloUsuario;
end;

function TSeloGrupo.GetSistema: ISistema;
begin
  Result := FSistema;
end;

function TSeloGrupo.GetSituacao: Boolean;
begin
  Result := FSituacao;
end;

function TSeloGrupo.GetTipoCartorio: string;
begin
  Result := FTipoCartorio;
end;

function TSeloGrupo.NotEquals(
  const vpValue: ISeloGrupo): Boolean;
begin
  Result := Equals(vpValue);
  Result.Negate;
end;

procedure TSeloGrupo.SetControleAutomatico(
  const Value: Boolean);
begin
  FControleAutomatico := Value;
end;

procedure TSeloGrupo.SetTipoCartorio(
  const Value: string);
begin
  FTipoCartorio := Value;
end;

procedure TSeloGrupo.SetDescricaoCompleta(
  const Value: string);
begin
  FDescricaoCompleta := Value;
end;

procedure TSeloGrupo.SetEstoqueMinimo(
  const Value: Integer);
begin
  FEstoqueMinimo := Value;
end;

procedure TSeloGrupo.SetNomeGrupo(
  const Value: string);
begin
  FNomeGrupo := Value;
end;

procedure TSeloGrupo.SetIDGrupoSelo(
  const Value: Integer);
begin
  FIDGrupoSelo := Value;
end;

procedure TSeloGrupo.SetPaginaAcresce(
  const Value: Boolean);
begin
  FPaginaAcresce := Value;
end;

procedure TSeloGrupo.SetSistema(
  const Value: ISistema);
begin
  FSistema := Value;
end;

procedure TSeloGrupo.SetSeloUsuario(
  const Value: Boolean);
begin
  FSeloUsuario := Value;
end;

end.
