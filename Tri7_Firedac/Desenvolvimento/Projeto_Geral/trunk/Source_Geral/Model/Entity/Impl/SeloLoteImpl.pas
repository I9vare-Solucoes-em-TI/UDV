unit SeloLoteImpl;

interface

uses
  SeloLote,
  SituacaoSeloLote,
  SeloGrupo;

type
  TSeloLote = class(TInterfacedObject, ISeloLote)
  private
    FSeloLoteID: Integer;
    FNumeroAtual: Integer;
    FSituacao: TSituacaoSeloLote;
    FDataLote: TDateTime;
    FNumeroInicial: Integer;
    FNumeroFinal: Integer;
    FObservacao: string;
    FSeloGrupo: ISeloGrupo;
    FSigla: string;
    FNotaFiscal: string;
    FQuantidade: Integer;

    function GetSeloLoteID: Integer;
    function GetNumeroAtual: Integer;
    function GetSituacao: TSituacaoSeloLote;
    function GetDataLote: TDateTime;
    function GetNumeroInicial: Integer;
    function GetNumeroFinal: Integer;
    function GetObservacao: string;
    function GetSeloGrupo: ISeloGrupo;
    function GetSigla: string;
    function GetNotaFiscal: string;
    function GetQuantidade: Integer;

    procedure SetSeloLoteID(
      const Value: Integer);

    procedure SetNumeroAtual(
      const Value: Integer);

    procedure SetSituacao(
      const Value: TSituacaoSeloLote);

    procedure SetDataLote(
      const Value: TDateTime);

    procedure SetNumeroInicial(
      const Value: Integer);

    procedure SetNumeroFinal(
      const Value: Integer);

    procedure SetObservacao(
      const Value: string);

    procedure SetSeloGrupo(
      const Value: ISeloGrupo);

    procedure SetSigla(
      const Value: string);

    procedure SetNotaFiscal(
      const Value: string);

    procedure SetQuantidade(
      const Value: Integer);
  public
    property SeloLoteID: Integer read GetSeloLoteID write SetSeloLoteID;
    property NumeroAtual: Integer read GetNumeroAtual write SetNumeroAtual;
    property Situacao: TSituacaoSeloLote read GetSituacao write SetSituacao;
    property DataLote: TDateTime read GetDataLote write SetDataLote;

    property NumeroInicial: Integer read GetNumeroInicial
      write SetNumeroInicial;

    property NumeroFinal: Integer read GetNumeroFinal write SetNumeroFinal;
    property Observacao: string read GetObservacao write SetObservacao;
    property SeloGrupo: ISeloGrupo read GetSeloGrupo write SetSeloGrupo;
    property Sigla: string read GetSigla write SetSigla;
    property NotaFiscal: string read GetNotaFiscal write SetNotaFiscal;
    property Quantidade: Integer read GetQuantidade write SetQuantidade;

    function Equals(
      const vpValue: ISeloLote): Boolean; reintroduce;

    function NotEquals(
      const vpValue: ISeloLote): Boolean;
  end;

implementation

uses
  System.Math,
  System.Types,
  BooleanHelper;

{ TSeloLote }

procedure TSeloLote.SetSeloLoteID(
  const Value: Integer);
begin
  FSeloLoteID := Value;
end;

procedure TSeloLote.SetNumeroAtual(
  const Value: Integer);
begin
  FNumeroAtual := Value;
end;

procedure TSeloLote.SetSituacao(
  const Value: TSituacaoSeloLote);
begin
  FSituacao := Value;
end;

function TSeloLote.Equals(
  const vpValue: ISeloLote): Boolean;
begin
  Result := CompareValue(SeloLoteID, vpValue.SeloLoteID) = EqualsValue;
end;

function TSeloLote.GetDataLote: TDateTime;
begin
  Result := FDataLote;
end;

function TSeloLote.GetNotaFiscal: string;
begin
  Result := FNotaFiscal;
end;

function TSeloLote.GetNumeroAtual: Integer;
begin
  Result := FNumeroAtual;
end;

function TSeloLote.GetNumeroFinal: Integer;
begin
  Result := FNumeroFinal;
end;

function TSeloLote.GetNumeroInicial: Integer;
begin
  Result := FNumeroInicial;
end;

function TSeloLote.GetObservacao: string;
begin
  Result := FObservacao;
end;

function TSeloLote.GetQuantidade: Integer;
begin
  Result := FQuantidade;
end;

function TSeloLote.GetSeloGrupo: ISeloGrupo;
begin
  Result := FSeloGrupo;
end;

function TSeloLote.GetSeloLoteID: Integer;
begin
  Result := FSeloLoteID;
end;

function TSeloLote.GetSigla: string;
begin
  Result := FSigla;
end;

function TSeloLote.GetSituacao: TSituacaoSeloLote;
begin
  Result := FSituacao;
end;

function TSeloLote.NotEquals(
  const vpValue: ISeloLote): Boolean;
begin
  Result := Equals(vpValue);
  Result.Negate;
end;

procedure TSeloLote.SetDataLote(
  const Value: TDateTime);
begin
  FDataLote := Value;
end;

procedure TSeloLote.SetNumeroInicial(
  const Value: Integer);
begin
  FNumeroInicial := Value;
end;

procedure TSeloLote.SetNumeroFinal(
  const Value: Integer);
begin
  FNumeroFinal := Value;
end;

procedure TSeloLote.SetObservacao(
  const Value: string);
begin
  FObservacao := Value;
end;

procedure TSeloLote.SetSeloGrupo(
  const Value: ISeloGrupo);
begin
  FSeloGrupo := Value;
end;

procedure TSeloLote.SetSigla(
  const Value: string);
begin
  FSigla := Value;
end;

procedure TSeloLote.SetNotaFiscal(
  const Value: string);
begin
  FNotaFiscal := Value;
end;

procedure TSeloLote.SetQuantidade(
  const Value: Integer);
begin
  FQuantidade := Value;
end;

end.
