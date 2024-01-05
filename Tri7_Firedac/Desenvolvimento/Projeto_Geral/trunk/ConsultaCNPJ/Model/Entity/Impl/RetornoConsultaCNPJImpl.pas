unit RetornoConsultaCNPJImpl;

interface

uses
  RetornoConsultaCNPJ;

type
  TRetornoConsultaCNPJ = class(TInterfacedObject, IRetornoConsultaCNPJ)
  private
    FDataSituacao: TDateTime;
    FNome: string;
    FUF: string;
    FTelefone: string;
    FSituacao: string;
    FBairro: string;
    FLogradouro: string;
    FNumero: string;
    FCEP: string;
    FMunicipio: string;
    FDataAbertura: TDateTime;
    FNomeFantasia: string;
    FCNPJ: string;
    FTipo: string;
    FComplemento: string;
    FEmail: string;
    FMotivoSituacao: string;

    function GetDataSituacao: TDateTime;
    function GetNome: string;
    function GetUF: string;
    function GetTelefone: string;
    function GetSituacao: string;
    function GetBairro: string;
    function GetLogradouro: string;
    function GetNumero: string;
    function GetCEP: string;
    function GetMunicipio: string;
    function GetDataAbertura: TDateTime;
    function GetNomeFantasia: string;
    function GetCNPJ: string;
    function GetTipo: string;
    function GetComplemento: string;
    function GetEmail: string;
    function GetMotivoSituacao: string;

    procedure SetDataSituacao(
      const Value: TDateTime);

    procedure SetNome(
      const Value: string);

    procedure SetUF(
      const Value: string);

    procedure SetTelefone(
      const Value: string);

    procedure SetSituacao(
      const Value: string);

    procedure SetBairro(
      const Value: string);

    procedure SetLogradouro(
      const Value: string);

    procedure SetNumero(
      const Value: string);

    procedure SetCEP(
      const Value: string);

    procedure SetMunicipio(
      const Value: string);

    procedure SetDataAbertura(
      const Value: TDateTime);

    procedure SetNomeFantasia(
      const Value: string);

    procedure SetCNPJ(
      const Value: string);

    procedure SetTipo(
      const Value: string);

    procedure SetComplemento(
      const Value: string);

    procedure SetEmail(
      const Value: string);

    procedure SetMotivoSituacao(
      const Value: string);
  end;

implementation

{ TRetornoConsultaCNPJ }

function TRetornoConsultaCNPJ.GetBairro: string;
begin
  Result := FBairro;
end;

function TRetornoConsultaCNPJ.GetCEP: string;
begin
  Result := FCEP;
end;

function TRetornoConsultaCNPJ.GetCNPJ: string;
begin
  Result := FCNPJ;
end;

function TRetornoConsultaCNPJ.GetComplemento: string;
begin
  Result := FComplemento;
end;

function TRetornoConsultaCNPJ.GetDataAbertura: TDateTime;
begin
  Result := FDataAbertura;
end;

function TRetornoConsultaCNPJ.GetDataSituacao: TDateTime;
begin
  Result := FDataSituacao;
end;

function TRetornoConsultaCNPJ.GetEmail: string;
begin
  Result := FEmail;
end;

function TRetornoConsultaCNPJ.GetLogradouro: string;
begin
  Result := FLogradouro;
end;

function TRetornoConsultaCNPJ.GetMotivoSituacao: string;
begin
  Result := FMotivoSituacao;
end;

function TRetornoConsultaCNPJ.GetMunicipio: string;
begin
  Result := FMunicipio;
end;

function TRetornoConsultaCNPJ.GetNome: string;
begin
  Result := FNome;
end;

function TRetornoConsultaCNPJ.GetNomeFantasia: string;
begin
  Result := FNomeFantasia;
end;

function TRetornoConsultaCNPJ.GetNumero: string;
begin
  Result := FNumero;
end;

function TRetornoConsultaCNPJ.GetSituacao: string;
begin
  Result := FSituacao;
end;

function TRetornoConsultaCNPJ.GetTelefone: string;
begin
  Result := FTelefone;
end;

function TRetornoConsultaCNPJ.GetTipo: string;
begin
  Result := FTipo;
end;

function TRetornoConsultaCNPJ.GetUF: string;
begin
  Result := FUF;
end;

procedure TRetornoConsultaCNPJ.SetBairro(
  const Value: string);
begin
  FBairro := Value;
end;

procedure TRetornoConsultaCNPJ.SetCEP(
  const Value: string);
begin
  FCEP := Value;
end;

procedure TRetornoConsultaCNPJ.SetCNPJ(
  const Value: string);
begin
  FCNPJ := Value;
end;

procedure TRetornoConsultaCNPJ.SetComplemento(
  const Value: string);
begin
  FComplemento := Value;
end;

procedure TRetornoConsultaCNPJ.SetDataAbertura(
  const Value: TDateTime);
begin
  FDataAbertura := Value;
end;

procedure TRetornoConsultaCNPJ.SetDataSituacao(
  const Value: TDateTime);
begin
  FDataSituacao := Value;
end;

procedure TRetornoConsultaCNPJ.SetEmail(
  const Value: string);
begin
  FEmail := Value;
end;

procedure TRetornoConsultaCNPJ.SetLogradouro(
  const Value: string);
begin
  FLogradouro := Value;
end;

procedure TRetornoConsultaCNPJ.SetMotivoSituacao(
  const Value: string);
begin
  FMotivoSituacao := Value;
end;

procedure TRetornoConsultaCNPJ.SetMunicipio(
  const Value: string);
begin
  FMunicipio := Value;
end;

procedure TRetornoConsultaCNPJ.SetNome(
  const Value: string);
begin
  FNome := Value;
end;

procedure TRetornoConsultaCNPJ.SetNomeFantasia(
  const Value: string);
begin
  FNomeFantasia := Value;
end;

procedure TRetornoConsultaCNPJ.SetNumero(
  const Value: string);
begin
  FNumero := Value;
end;

procedure TRetornoConsultaCNPJ.SetSituacao(
  const Value: string);
begin
  FSituacao := Value;
end;

procedure TRetornoConsultaCNPJ.SetTelefone(
  const Value: string);
begin
  FTelefone := Value;
end;

procedure TRetornoConsultaCNPJ.SetTipo(
  const Value: string);
begin
  FTipo := Value;
end;

procedure TRetornoConsultaCNPJ.SetUF(
  const Value: string);
begin
  FUF := Value;
end;

end.
