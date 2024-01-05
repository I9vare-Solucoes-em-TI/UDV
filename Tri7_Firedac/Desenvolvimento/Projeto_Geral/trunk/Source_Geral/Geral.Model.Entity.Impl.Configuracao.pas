unit Geral.Model.Entity.Impl.Configuracao;

interface

uses
  Geral.Model.Entity.Spec.Configuracao,
  Geral.Model.Entity.Spec.ConfiguracaoGrupo,
  Geral.Model.Entity.Spec.TipoValorConfiguracao,
  Geral.Model.Entity.Spec.Maybe,
  Geral.Model.Entity.Spec.Blob;

type
  TCaminhoConfiguracao = class(TInterfacedObject, ICaminhoConfiguracao)
  private
    FConfiguracaoGrupo: IConfiguracaoGrupo;
    FSecao: string;
    FNome: string;
  public
    constructor Create(
      const vpConfiguracaoGrupo: IConfiguracaoGrupo;
      const vpSecao: string;
      const vpNome: string); reintroduce;

    function ConfiguracaoGrupo: IConfiguracaoGrupo;
    function Secao: string;
    function Nome: string;

    class function New(
      const vpConfiguracaoGrupo: IConfiguracaoGrupo;
      const vpSecao: string;
      const vpNome: string): ICaminhoConfiguracao;
  end;

  TDescricaoConfiguracao = class(TInterfacedObject, IDescricaoConfiguracao)
  private
    FDescricao: string;
    FTipoValor: ITipoValorConfiguracao;
    FTerminal: string;
  public
    constructor Create(
      const vpDescricao: string;
      const vpTipoValor: ITipoValorConfiguracao;
      const vpTerminal: string); reintroduce;

    function Descricao: string;
    function TipoValor: ITipoValorConfiguracao;
    function Terminal: string;

    class function New(
      const vpDescricao: string;
      const vpTipoValor: ITipoValorConfiguracao;
      const vpTerminal: string): IDescricaoConfiguracao;
  end;

  TValorConfiguracao = class(TInterfacedObject, IValorConfiguracao)
  private
    FValor: string;
    FTexto: IMaybe<IBlob>;
    FAtualizado: Boolean;
    FObrigatorio: Boolean;
  public
    constructor Create(
      const vpValor: string;
      const vpTexto: IMaybe<IBlob>;
      const vpAtualizado: Boolean;
      const vpObrigatorio: Boolean); reintroduce;

    function Valor: string;
    function Texto: IMaybe<IBlob>;
    function Atualizado: Boolean;
    function Obrigatorio: Boolean;

    class function New(
      const vpValor: string;
      const vpTexto: IMaybe<IBlob>;
      const vpAtualizado: Boolean;
      const vpObrigatorio: Boolean): IValorConfiguracao;
  end;

  TConfiguracao = class(TInterfacedObject, IConfiguracao)
  private
    FID: Integer;
    FCaminho: ICaminhoConfiguracao;
    FDescricao: IDescricaoConfiguracao;
    FValor: IValorConfiguracao;
  public
    constructor Create(
      const vpID: Integer;
      const vpCaminho: ICaminhoConfiguracao;
      const vpDescricao: IDescricaoConfiguracao;
      const vpValor: IValorConfiguracao); reintroduce;

    function ID: Integer;
    function Caminho: ICaminhoConfiguracao;
    function Descricao: IDescricaoConfiguracao;
    function Valor: IValorConfiguracao;

    class function New(
      const vpID: Integer;
      const vpCaminho: ICaminhoConfiguracao;
      const vpDescricao: IDescricaoConfiguracao;
      const vpValor: IValorConfiguracao): IConfiguracao;
  end;

implementation

{ TConfiguracao }

function TConfiguracao.Caminho: ICaminhoConfiguracao;
begin
  Result := FCaminho;
end;

constructor TConfiguracao.Create(
  const vpID: Integer;
  const vpCaminho: ICaminhoConfiguracao;
  const vpDescricao: IDescricaoConfiguracao;
  const vpValor: IValorConfiguracao);
begin
  inherited Create;
  FID := vpID;
  FCaminho := vpCaminho;
  FDescricao := vpDescricao;
  FValor := vpValor;
end;

function TConfiguracao.Descricao: IDescricaoConfiguracao;
begin
  Result := FDescricao;
end;

function TConfiguracao.ID: Integer;
begin
  Result := FID;
end;

class function TConfiguracao.New(
  const vpID: Integer;
  const vpCaminho: ICaminhoConfiguracao;
  const vpDescricao: IDescricaoConfiguracao;
  const vpValor: IValorConfiguracao): IConfiguracao;
begin
  Result := Create(
    vpID,
    vpCaminho,
    vpDescricao,
    vpValor);
end;

function TConfiguracao.Valor: IValorConfiguracao;
begin
  Result := FValor;
end;

{ TCaminhoConfiguracao }

function TCaminhoConfiguracao.ConfiguracaoGrupo: IConfiguracaoGrupo;
begin
  Result := FConfiguracaoGrupo;
end;

constructor TCaminhoConfiguracao.Create(
  const vpConfiguracaoGrupo: IConfiguracaoGrupo;
  const vpSecao: string;
  const vpNome: string);
begin
  inherited Create;
  FConfiguracaoGrupo := vpConfiguracaoGrupo;
  FSecao := vpSecao;
  FNome := vpNome;
end;

class function TCaminhoConfiguracao.New(
  const vpConfiguracaoGrupo: IConfiguracaoGrupo;
  const vpSecao: string;
  const vpNome: string): ICaminhoConfiguracao;
begin
  Result := Create(
    vpConfiguracaoGrupo,
    vpSecao,
    vpNome);
end;

function TCaminhoConfiguracao.Nome: string;
begin
  Result := FNome;
end;

function TCaminhoConfiguracao.Secao: string;
begin
  Result := FSecao;
end;

{ TDescricaoConfiguracao }

constructor TDescricaoConfiguracao.Create(
  const vpDescricao: string;
  const vpTipoValor: ITipoValorConfiguracao;
  const vpTerminal: string);
begin
  inherited Create;
  FDescricao := vpDescricao;
  FTipoValor := vpTipoValor;
  FTerminal := vpTerminal;
end;

function TDescricaoConfiguracao.Descricao: string;
begin
  Result := FDescricao;
end;

class function TDescricaoConfiguracao.New(
  const vpDescricao: string;
  const vpTipoValor: ITipoValorConfiguracao;
  const vpTerminal: string): IDescricaoConfiguracao;
begin
  Result := Create(
    vpDescricao,
    vpTipoValor,
    vpTerminal);
end;

function TDescricaoConfiguracao.Terminal: string;
begin
  Result := FTerminal;
end;

function TDescricaoConfiguracao.TipoValor: ITipoValorConfiguracao;
begin
  Result := FTipoValor;
end;

{ TValorConfiguracao }

function TValorConfiguracao.Atualizado: Boolean;
begin
  Result := FAtualizado;
end;

constructor TValorConfiguracao.Create(
  const vpValor: string;
  const vpTexto: IMaybe<IBlob>;
  const vpAtualizado: Boolean;
  const vpObrigatorio: Boolean);
begin
  inherited Create;
  FValor := vpValor;
  FTexto := vpTexto;
  FAtualizado := vpAtualizado;
  FObrigatorio := vpObrigatorio;
end;

class function TValorConfiguracao.New(
  const vpValor: string;
  const vpTexto: IMaybe<IBlob>;
  const vpAtualizado: Boolean;
  const vpObrigatorio: Boolean): IValorConfiguracao;
begin
  Result := Create(
    vpValor,
    vpTexto,
    vpAtualizado,
    vpObrigatorio);
end;

function TValorConfiguracao.Obrigatorio: Boolean;
begin
  Result := FObrigatorio;
end;

function TValorConfiguracao.Texto: IMaybe<IBlob>;
begin
  Result := FTexto;
end;

function TValorConfiguracao.Valor: string;
begin
  Result := FValor;
end;

end.
