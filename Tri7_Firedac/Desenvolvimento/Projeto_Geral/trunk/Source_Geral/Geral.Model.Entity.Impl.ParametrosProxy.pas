unit Geral.Model.Entity.Impl.ParametrosProxy;

interface

uses
  Geral.Model.Entity.Spec.ParametrosProxy;

type
  TParametrosProxy = class(TInterfacedObject, IParametrosProxy)
  private
    FServer: string;
    FPort: Integer;
    FUsername: string;
    FPassword: string;

    constructor Create(
      const vpServer: string;
      const vpPort: Integer;
      const vpUsername: string;
      const vpPassword: string); reintroduce;
  public
    function Server: string;
    function Port: Integer;
    function Username: string;
    function Password: string;

    class function New(
      const vpServer: string;
      const vpPort: Integer;
      const vpUsername: string;
      const vpPassword: string): IParametrosProxy;
  end;

implementation

{ TParametrosProxy }

constructor TParametrosProxy.Create(
  const vpServer: string;
  const vpPort: Integer;
  const vpUsername: string;
  const vpPassword: string);
begin
  inherited Create;
  FServer := vpServer;
  FPort := vpPort;
  FUsername := vpUsername;
  FPassword := vpPassword;
end;

class function TParametrosProxy.New(
  const vpServer: string;
  const vpPort: Integer;
  const vpUsername: string;
  const vpPassword: string): IParametrosProxy;
begin
  Result := Create(
    vpServer,
    vpPort,
    vpUsername,
    vpPassword);
end;

function TParametrosProxy.Password: string;
begin
  Result := FPassword;
end;

function TParametrosProxy.Port: Integer;
begin
  Result := FPort;
end;

function TParametrosProxy.Server: string;
begin
  Result := FServer;
end;

function TParametrosProxy.Username: string;
begin
  Result := FUsername;
end;

end.
