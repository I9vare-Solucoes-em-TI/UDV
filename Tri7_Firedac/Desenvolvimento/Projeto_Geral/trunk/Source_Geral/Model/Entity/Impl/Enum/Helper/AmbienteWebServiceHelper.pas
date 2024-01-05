unit AmbienteWebServiceHelper;

interface

uses
  AmbienteWebService;

type
  TAmbienteWebServiceHelper = record helper for TAmbienteWebService
  private
    const CL_PRODUCAO: Char = 'P';
    const CL_HOMOLOGACAO: Char = 'H';

    function Equals(
      const vpValue: TAmbienteWebService): Boolean;

    class function IfThen(
      const vpValue: Boolean;
      const vpTrue: TAmbienteWebService;
      const vpFalse: TAmbienteWebService = TAmbienteWebService(-1)):
      TAmbienteWebService; static;

    class function IsProducao(
      const vpValue: Char): Boolean; overload; static;

    class function IsHomologacao(
      const vpValue: Char): Boolean; overload; static;
  public
    function IsProducao: Boolean; overload;
    function IsHomologacao: Boolean; overload;

    class function FromChar(
      const vpValue: Char): TAmbienteWebService; static;
  end;

implementation

uses
  System.Character;

{ TAmbienteWebServiceHelper }

function TAmbienteWebServiceHelper.Equals(
  const vpValue: TAmbienteWebService): Boolean;
begin
  Result := Self = vpValue;
end;

class function TAmbienteWebServiceHelper.FromChar(
  const vpValue: Char): TAmbienteWebService;
begin
  Result := IfThen(IsProducao(vpValue), awsProducao,
    IfThen(IsHomologacao(vpValue), awsHomologacao));
end;

class function TAmbienteWebServiceHelper.IfThen(
  const vpValue: Boolean;
  const vpTrue: TAmbienteWebService;
  const vpFalse: TAmbienteWebService = TAmbienteWebService(-1)):
  TAmbienteWebService;
begin
  if vpValue then
    Result := vpTrue
  else
    Result := vpFalse;
end;

function TAmbienteWebServiceHelper.IsHomologacao: Boolean;
begin
  Result := Equals(awsHomologacao);
end;

class function TAmbienteWebServiceHelper.IsHomologacao(
  const vpValue: Char): Boolean;
begin
  Result := CL_HOMOLOGACAO.IsInArray([vpValue]);
end;

class function TAmbienteWebServiceHelper.IsProducao(
  const vpValue: Char): Boolean;
begin
  Result := CL_PRODUCAO.IsInArray([vpValue]);
end;

function TAmbienteWebServiceHelper.IsProducao: Boolean;
begin
  Result := Equals(awsProducao);
end;

end.
