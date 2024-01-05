unit FundoTipo;

interface

uses
  System.Generics.Collections;

type
  TFundoTipo = class
  private
    FFundoTipoID: Integer;
    FDescricao: string;
    FPercentual: Double;
    FSituacao: Boolean;
    FSigla: string;
    FDataInicial: TDateTime;
    FDataFinal: TDateTime;

    procedure SetFundoTipoID(
      const Value: Integer);

    procedure SetDescricao(
      const Value: string);

    procedure SetPercentual(
      const Value: Double);

    procedure SetSituacao(
      const Value: Boolean);

    procedure SetSigla(
      const Value: string);

    procedure SetDataInicial(
      const Value: TDateTime);

    procedure SetDataFinal(
      const Value: TDateTime);
  public
    constructor Create(
      const vpFundoTipoID: Integer;
      const vpDescricao: string;
      const vpPercentual: Double;
      const vpSituacao: Boolean;
      const vpSigla: string;
      const vpDataInicial: TDateTime;
      const vpDataFinal: TDateTime);

    property FundoTipoID: Integer read FFundoTipoID write SetFundoTipoID;
    property Descricao: string read FDescricao write SetDescricao;
    property Percentual: Double read FPercentual write SetPercentual;
    property Situacao: Boolean read FSituacao write SetSituacao;
    property Sigla: string read FSigla write SetSigla;
    property DataInicial: TDateTime read FDataInicial write SetDataInicial;
    property DataFinal: TDateTime read FDataFinal write SetDataFinal;

    function Equals(
      Obj: TObject): Boolean; override;
  end;

  TFundoTipoHelper = class helper for TFundoTipo
  public
    class function GetSituacaoAsString(
      const vpSituacao: Boolean): string; static;

    class function GetSituacaoAsBoolean(
      const vpSituacao: string): Boolean; static;
  end;

  TFundoTipos = class(TObjectList<TFundoTipo>)
  public
    function Get(
      const vpFundoTipoID: Integer): TFundoTipo;

    procedure Extract(
      const vpFundoTipos: TFundoTipos); overload;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils;

{ TFundoTipo }

constructor TFundoTipo.Create(
  const vpFundoTipoID: Integer;
  const vpDescricao: string;
  const vpPercentual: Double;
  const vpSituacao: Boolean;
  const vpSigla: string;
  const vpDataInicial: TDateTime;
  const vpDataFinal: TDateTime);
begin
  inherited Create;

  FundoTipoID := vpFundoTipoID;
  Descricao := vpDescricao;
  Percentual := vpPercentual;
  Situacao := vpSituacao;
  Sigla := vpSigla;
  DataInicial := vpDataInicial;
  DataFinal := vpDataFinal;
end;

function TFundoTipo.Equals(
  Obj: TObject): Boolean;
begin
  Result := (Obj is Self.ClassType) and
    (TFundoTipo(Obj).FundoTipoID = FundoTipoID);
end;

procedure TFundoTipo.SetDataFinal(
  const Value: TDateTime);
begin
  FDataFinal := Value;
end;

procedure TFundoTipo.SetDataInicial(
  const Value: TDateTime);
begin
  FDataInicial := Value;
end;

procedure TFundoTipo.SetDescricao(
  const Value: string);
begin
  FDescricao := Value;
end;

procedure TFundoTipo.SetFundoTipoID(
  const Value: Integer);
begin
  FFundoTipoID := Value;
end;

procedure TFundoTipo.SetPercentual(
  const Value: Double);
begin
  FPercentual := Value;
end;

procedure TFundoTipo.SetSigla(
  const Value: string);
begin
  FSigla := Value;
end;

procedure TFundoTipo.SetSituacao(
  const Value: Boolean);
begin
  FSituacao := Value;
end;

{ TFundoTipoHelper }

class function TFundoTipoHelper.GetSituacaoAsBoolean(
  const vpSituacao: string): Boolean;
begin
  Result := vpSituacao.Trim.ToUpper.Equals('A');
end;

class function TFundoTipoHelper.GetSituacaoAsString(
  const vpSituacao: Boolean): string;
begin
  Result := IfThen(vpSituacao, 'A', 'I');
end;

{ TFundoTipos }

procedure TFundoTipos.Extract(
  const vpFundoTipos: TFundoTipos);
{$REGION 'Variáveis'}
var
  viFundoTipo: TFundoTipo;
{$ENDREGION}
begin
  for viFundoTipo in vpFundoTipos do
    Extract(viFundoTipo);
end;

function TFundoTipos.Get(
  const vpFundoTipoID: Integer): TFundoTipo;
{$REGION 'Variáveis'}
var
  viFundoTipo: TFundoTipo;
{$ENDREGION}
begin
  Result := nil;

  for viFundoTipo in Self do
    if viFundoTipo.FundoTipoID = vpFundoTipoID then
      Result := viFundoTipo;
end;

end.
