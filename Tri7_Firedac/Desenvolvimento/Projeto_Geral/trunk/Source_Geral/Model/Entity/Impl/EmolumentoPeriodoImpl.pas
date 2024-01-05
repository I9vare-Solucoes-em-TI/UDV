unit EmolumentoPeriodoImpl;

interface

uses
  EmolumentoPeriodo;

type
  TEmolumentoPeriodo = class(TInterfacedObject, IEmolumentoPeriodo)
  private
    FEmolumentoPeriodoID: Integer;
    FDescricao: string;
    FSituacao: Boolean;
    FDataInicial: TDateTime;
    FAno: Word;

    function GetEmolumentoPeriodoID: Integer;
    function GetDescricao: string;
    function GetSituacao: Boolean;
    function GetDataInicial: TDateTime;
    function GetAno: Word;

    procedure SetEmolumentoPeriodoID(
      const Value: Integer);

    procedure SetDescricao(
      const Value: string);

    procedure SetSituacao(
      const Value: Boolean);

    procedure SetDataInicial(
      const Value: TDateTime);

    procedure SetAno(
      const Value: Word);
  public
    property EmolumentoPeriodoID: Integer read GetEmolumentoPeriodoID
      write SetEmolumentoPeriodoID;

    property Descricao: string read GetDescricao write SetDescricao;
    property Situacao: Boolean read GetSituacao write SetSituacao;
    property DataInicial: TDateTime read GetDataInicial write SetDataInicial;
    property Ano: Word read GetAno write SetAno;

    function Equals(
      const vpValue: IEmolumentoPeriodo): Boolean; reintroduce;

    function NotEquals(
      const vpValue: IEmolumentoPeriodo): Boolean;

    class function New: IEmolumentoPeriodo;
  end;

implementation

uses
  System.Math,
  System.Types,
  BooleanHelper;

{ TEmolumentoPeriodo }

function TEmolumentoPeriodo.Equals(
  const vpValue: IEmolumentoPeriodo): Boolean;
begin
  Result := CompareValue(
    EmolumentoPeriodoID,
    vpValue.EmolumentoPeriodoID) = EqualsValue;
end;

function TEmolumentoPeriodo.GetAno: Word;
begin
  Result := FAno;
end;

function TEmolumentoPeriodo.GetDataInicial: TDateTime;
begin
  Result := FDataInicial;
end;

function TEmolumentoPeriodo.GetDescricao: string;
begin
  Result := FDescricao;
end;

function TEmolumentoPeriodo.GetEmolumentoPeriodoID: Integer;
begin
  Result := FEmolumentoPeriodoID;
end;

function TEmolumentoPeriodo.GetSituacao: Boolean;
begin
  Result := FSituacao;
end;

class function TEmolumentoPeriodo.New: IEmolumentoPeriodo;
begin
  Result := Create;
end;

function TEmolumentoPeriodo.NotEquals(
  const vpValue: IEmolumentoPeriodo): Boolean;
begin
  Result := Equals(vpValue);
  Result.Negate;
end;

procedure TEmolumentoPeriodo.SetAno(
  const Value: Word);
begin
  FAno := Value;
end;

procedure TEmolumentoPeriodo.SetDataInicial(
  const Value: TDateTime);
begin
  FDataInicial := Value;
end;

procedure TEmolumentoPeriodo.SetDescricao(
  const Value: string);
begin
  FDescricao := Value;
end;

procedure TEmolumentoPeriodo.SetEmolumentoPeriodoID(
  const Value: Integer);
begin
  FEmolumentoPeriodoID := Value;
end;

procedure TEmolumentoPeriodo.SetSituacao(
  const Value: Boolean);
begin
  FSituacao := Value;
end;

end.
