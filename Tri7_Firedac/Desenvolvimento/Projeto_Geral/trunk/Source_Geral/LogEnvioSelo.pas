unit LogEnvioSelo;

interface

type
  TLogEnvioSelo = class

  private
    vlLogEnvioSeloId : Integer;
    vlSeloLivroId    : Integer;
    vlDataEnvio      : TDateTime;
    vlSituacao       : string;
    vlObservacao     : string;
  public
    procedure SetLogEnvioSeloId(vpLogEnvioSeloId: Integer);
    function getLogEnvioSeloId : Integer;

    procedure SetSeloLivroId(vpSeloLivroId: Integer);
    function getSeloLivroId : Integer;

    procedure SetDataEnvio(vpDataEnvio: TDateTime);
    function getDataEnvio : TDateTime;

    procedure SetSituacao(vpSituacao: string);
    function getSituacao : string;

    procedure SetObservacao(vpObservacao: string);
    function getObservacao : string;
  end;

implementation

{ TLogEnvioSelo }

function TLogEnvioSelo.getDataEnvio: TDateTime;
begin
  Result := self.vlDataEnvio;
end;

function TLogEnvioSelo.getLogEnvioSeloId: Integer;
begin
  Result := Self.vlLogEnvioSeloId;
end;

function TLogEnvioSelo.getObservacao: string;
begin
  Result := Self.vlObservacao;
end;

function TLogEnvioSelo.getSeloLivroId: Integer;
begin
  Result := Self.vlSeloLivroId;
end;

function TLogEnvioSelo.getSituacao: string;
begin
  Result := Self.vlSituacao;
end;

procedure TLogEnvioSelo.SetDataEnvio(vpDataEnvio: TDateTime);
begin
  Self.vlDataEnvio := vpDataEnvio;
end;

procedure TLogEnvioSelo.SetLogEnvioSeloId(vpLogEnvioSeloId: Integer);
begin
  Self.vlLogEnvioSeloId := vpLogEnvioSeloId;
end;

procedure TLogEnvioSelo.SetObservacao(vpObservacao: string);
begin
  Self.vlObservacao := vpObservacao;
end;

procedure TLogEnvioSelo.SetSeloLivroId(vpSeloLivroId: Integer);
begin
  Self.vlSeloLivroId := vpSeloLivroId;
end;

procedure TLogEnvioSelo.SetSituacao(vpSituacao: string);
begin
  Self.vlSituacao := vpSituacao;
end;

end.
