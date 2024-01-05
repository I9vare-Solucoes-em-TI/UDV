unit SequenciaImpl;

interface

uses
  Sequencia;

type
  TSequencia = class(TInterfacedObject, ISequencia)
  private
    FTabela: string;
    FSequencia: Integer;

    function GetTabela: string;
    function GetSequencia: Integer;

    procedure SetTabela(
      const Value: string);

    procedure SetSequencia(
      const Value: Integer);
  public
    property Tabela: string read GetTabela write SetTabela;
    property Sequencia: Integer read GetSequencia write SetSequencia;

    function Equals(
      const vpValue: ISequencia): Boolean; reintroduce;

    function NotEquals(
      const vpValue: ISequencia): Boolean;
  end;

implementation

uses
  System.SysUtils,
  BooleanHelper;

{ TSequencia }

function TSequencia.Equals(
  const vpValue: ISequencia): Boolean;
begin
  Result := Tabela.Equals(vpValue.Tabela);
end;

function TSequencia.GetSequencia: Integer;
begin
  Result := FSequencia;
end;

function TSequencia.GetTabela: string;
begin
  Result := FTabela;
end;

function TSequencia.NotEquals(
  const vpValue: ISequencia): Boolean;
begin
  Result := Equals(vpValue);
  Result.Negate;
end;

procedure TSequencia.SetSequencia(
  const Value: Integer);
begin
  FSequencia := Value;
end;

procedure TSequencia.SetTabela(
  const Value: string);
begin
  FTabela := Value;
end;

end.
