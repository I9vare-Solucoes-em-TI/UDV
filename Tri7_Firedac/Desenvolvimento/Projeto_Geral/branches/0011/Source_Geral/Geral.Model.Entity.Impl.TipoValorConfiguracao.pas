unit Geral.Model.Entity.Impl.TipoValorConfiguracao;

interface

uses
  Geral.Model.Entity.Spec.TipoValorConfiguracao;

type
  TComum = class(TInterfacedObject, ITipoValorConfiguracao)
  public
    function Value: string;
    function AsString: string;
    class function New: ITipoValorConfiguracao;
  end;

  TImpressora = class(TInterfacedObject, ITipoValorConfiguracao)
  public
    function Value: string;
    function AsString: string;
    class function New: ITipoValorConfiguracao;
  end;

  TPadronizado = class(TInterfacedObject, ITipoValorConfiguracao)
  public
    function Value: string;
    function AsString: string;
    class function New: ITipoValorConfiguracao;
  end;

  TOutrasTabelas = class(TInterfacedObject, ITipoValorConfiguracao)
  public
    function Value: string;
    function AsString: string;
    class function New: ITipoValorConfiguracao;
  end;

  TCor = class(TInterfacedObject, ITipoValorConfiguracao)
  public
    function Value: string;
    function AsString: string;
    class function New: ITipoValorConfiguracao;
  end;

  TTexto = class(TInterfacedObject, ITipoValorConfiguracao)
  public
    function Value: string;
    function AsString: string;
    class function New: ITipoValorConfiguracao;
  end;

  TFonte = class(TInterfacedObject, ITipoValorConfiguracao)
  public
    function Value: string;
    function AsString: string;
    class function New: ITipoValorConfiguracao;
  end;

implementation

{ TComum }

function TComum.AsString: string;
begin
  Result := 'Comum';
end;

class function TComum.New: ITipoValorConfiguracao;
begin
  Result := Create;
end;

function TComum.Value: string;
begin
  Result := '1';
end;

{ TImpressora }

function TImpressora.AsString: string;
begin
  Result := 'Impressora';
end;

class function TImpressora.New: ITipoValorConfiguracao;
begin
  Result := Create;
end;

function TImpressora.Value: string;
begin
  Result := '2';
end;

{ TPadronizado }

function TPadronizado.AsString: string;
begin
  Result := 'Padronizado';
end;

class function TPadronizado.New: ITipoValorConfiguracao;
begin
  Result := Create;
end;

function TPadronizado.Value: string;
begin
  Result := '3';
end;

{ TOutrasTabelas }

function TOutrasTabelas.AsString: string;
begin
  Result := 'Outras Tabelas';
end;

class function TOutrasTabelas.New: ITipoValorConfiguracao;
begin
  Result := Create;
end;

function TOutrasTabelas.Value: string;
begin
  Result := '4';
end;

{ TCor }

function TCor.AsString: string;
begin
  Result := 'Cor';
end;

class function TCor.New: ITipoValorConfiguracao;
begin
  Result := Create;
end;

function TCor.Value: string;
begin
  Result := '5';
end;

{ TTexto }

function TTexto.AsString: string;
begin
  Result := 'Texto';
end;

class function TTexto.New: ITipoValorConfiguracao;
begin
  Result := Create;
end;

function TTexto.Value: string;
begin
  Result := '6';
end;

{ TFonte }

function TFonte.AsString: string;
begin
  Result := 'Fonte';
end;

class function TFonte.New: ITipoValorConfiguracao;
begin
  Result := Create;
end;

function TFonte.Value: string;
begin
  Result := '7';
end;

end.
