unit ConfiguracaoGrupoImpl;

interface

uses
  ConfiguracaoGrupo,
  Sistema;

type
  TConfiguracaoGrupo = class(TInterfacedObject, IConfiguracaoGrupo)
  private
    FConfiguracaoGrupoID: Integer;
    FDescricao: string;
    FSistema: ISistema;

    function GetConfiguracaoGrupoID: Integer;
    function GetDescricao: string;
    function GetSistema: ISistema;

    procedure SetConfiguracaoGrupoID(
      const Value: Integer);

    procedure SetDescricao(
      const Value: string);

    procedure SetSistema(
      const Value: ISistema);
  public
    property ConfiguracaoGrupoID: Integer read GetConfiguracaoGrupoID
      write SetConfiguracaoGrupoID;

    property Descricao: string read GetDescricao write SetDescricao;
    property Sistema: ISistema read GetSistema write SetSistema;

    function Equals(
      const vpValue: IConfiguracaoGrupo): Boolean; reintroduce;

    function NotEquals(
      const vpValue: IConfiguracaoGrupo): Boolean;
  end;

implementation

uses
  System.Math,
  System.Types,
  BooleanHelper;

{ TConfiguracaoGrupo }

function TConfiguracaoGrupo.Equals(
  const vpValue: IConfiguracaoGrupo): Boolean;
begin
  Result := CompareValue(ConfiguracaoGrupoID,
    vpValue.ConfiguracaoGrupoID) = EqualsValue;
end;

function TConfiguracaoGrupo.GetConfiguracaoGrupoID: Integer;
begin
  Result := FConfiguracaoGrupoID;
end;

function TConfiguracaoGrupo.GetDescricao: string;
begin
  Result := FDescricao;
end;

function TConfiguracaoGrupo.GetSistema: ISistema;
begin
  Result := FSistema;
end;

function TConfiguracaoGrupo.NotEquals(
  const vpValue: IConfiguracaoGrupo): Boolean;
begin
  Result := Equals(vpValue);
  Result.Negate;
end;

procedure TConfiguracaoGrupo.SetConfiguracaoGrupoID(
  const Value: Integer);
begin
  FConfiguracaoGrupoID := Value;
end;

procedure TConfiguracaoGrupo.SetDescricao(
  const Value: string);
begin
  FDescricao := Value;
end;

procedure TConfiguracaoGrupo.SetSistema(
  const Value: ISistema);
begin
  FSistema := Value;
end;

end.
