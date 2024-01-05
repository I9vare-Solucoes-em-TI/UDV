unit UsuarioImpl;

interface

uses
  Usuario;

type
  TUsuario = class(TInterfacedObject, IUsuario)
  private
    FUsuarioID: Integer;
    FNomeCompleto: string;

    function GetUsuarioID: Integer;
    function GetNomeCompleto: string;

    procedure SetUsuarioID(
      const Value: Integer);

    procedure SetNomeCompleto(
      const Value: string);
  public
    property UsuarioID: Integer read GetUsuarioID write SetUsuarioID;
    property NomeCompleto: string read GetNomeCompleto write SetNomeCompleto;

    function Equals(
      const vpValue: IUsuario): Boolean; reintroduce;

    function NotEquals(
      const vpValue: IUsuario): Boolean;

    class function New: IUsuario;
  end;

implementation

uses
  System.Math,
  System.Types,
  BooleanHelper;

{ TUsuario }

function TUsuario.Equals(
  const vpValue: IUsuario): Boolean;
begin
  Result := CompareValue(UsuarioID, vpValue.UsuarioID) = EqualsValue;
end;

function TUsuario.GetNomeCompleto: string;
begin
  Result := FNomeCompleto;
end;

function TUsuario.GetUsuarioID: Integer;
begin
  Result := FUsuarioID;
end;

class function TUsuario.New: IUsuario;
begin
  Result := Create;
end;

function TUsuario.NotEquals(
  const vpValue: IUsuario): Boolean;
begin
  Result := Equals(vpValue);
  Result.Negate;
end;

procedure TUsuario.SetNomeCompleto(
  const Value: string);
begin
  FNomeCompleto := Value;
end;

procedure TUsuario.SetUsuarioID(
  const Value: Integer);
begin
  FUsuarioID := Value;
end;

end.
