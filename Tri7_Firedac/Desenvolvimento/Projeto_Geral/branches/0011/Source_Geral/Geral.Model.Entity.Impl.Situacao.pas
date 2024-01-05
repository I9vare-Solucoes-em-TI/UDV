unit Geral.Model.Entity.Impl.Situacao;

interface

uses
  Geral.Model.Entity.Spec.Situacao;

type
  TAtivo = class(TInterfacedObject, ISituacao)
  public
    function Value: string;
    function AsString: string;
    function AsBoolean: Boolean;
    class function New: ISituacao;
  end;

  TInativo = class(TInterfacedObject, ISituacao)
  public
    function Value: string;
    function AsString: string;
    function AsBoolean: Boolean;
    class function New: ISituacao;
  end;

implementation

{ TAtivo }

function TAtivo.AsBoolean: Boolean;
begin
  Result := True;
end;

function TAtivo.AsString: string;
begin
  Result := 'Ativo';
end;

class function TAtivo.New: ISituacao;
begin
  Result := Create;
end;

function TAtivo.Value: string;
begin
  Result := 'A';
end;

{ TInativo }

function TInativo.AsBoolean: Boolean;
begin
  Result := False;
end;

function TInativo.AsString: string;
begin
  Result := 'Inativo';
end;

class function TInativo.New: ISituacao;
begin
  Result := Create;
end;

function TInativo.Value: string;
begin
  Result := 'I';
end;

end.
