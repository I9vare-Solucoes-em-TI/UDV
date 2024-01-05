unit Geral.Model.Entity.Impl.AmbienteWebService;

interface

uses
  Geral.Model.Entity.Spec.AmbienteWebService;

type
  TProducao = class(TInterfacedObject, IAmbienteWebService)
  public
    function Value: string;
    function AsString: string;
    class function New: IAmbienteWebService;
  end;

  THomologacao = class(TInterfacedObject, IAmbienteWebService)
  public
    function Value: string;
    function AsString: string;
    class function New: IAmbienteWebService;
  end;

implementation

{ TProducao }

function TProducao.AsString: string;
begin
  Result := 'Produção';
end;

class function TProducao.New: IAmbienteWebService;
begin
  Result := Create;
end;

function TProducao.Value: string;
begin
  Result := 'P';
end;

{ THomologacao }

function THomologacao.AsString: string;
begin
  Result := 'Homologação';
end;

class function THomologacao.New: IAmbienteWebService;
begin
  Result := Create;
end;

function THomologacao.Value: string;
begin
  Result := 'H';
end;

end.
