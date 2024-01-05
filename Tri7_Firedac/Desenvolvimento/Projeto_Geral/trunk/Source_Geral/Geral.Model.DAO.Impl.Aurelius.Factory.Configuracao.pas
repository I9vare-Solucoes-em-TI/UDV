unit Geral.Model.DAO.Impl.Aurelius.Factory.Configuracao;

interface

uses
  Geral.Model.Entity.Spec.Factory,
  Geral.Model.Entity.Spec.Configuracao,
  Geral.Model.DAO.Impl.Aurelius.Table.Configuracao,
  Geral.Model.Entity.Spec.ConfiguracaoGrupo;

type
  TConfiguracaoFactory = class(TInterfacedObject, IFactory<IConfiguracao>)
  private
    FTableConfiguracao: TTableConfiguracao;
    FConfiguracaoGrupo: IConfiguracaoGrupo;
  public
    constructor Create(
      const vpTableConfiguracao: TTableConfiguracao;
      const vpConfiguracaoGrupo: IConfiguracaoGrupo); reintroduce;

    function GetInstance: IConfiguracao;

    class function New(
      const vpTableConfiguracao: TTableConfiguracao;
      const vpConfiguracaoGrupo: IConfiguracaoGrupo): IFactory<IConfiguracao>;
  end;

implementation

uses
  Geral.Model.Entity.Impl.Configuracao,
  Geral.Model.Entity.Impl.Factory.TipoValorConfiguracao,
  System.SysUtils,
  Geral.Model.Entity.Spec.Maybe,
  Geral.Model.Entity.Spec.Blob,
  Geral.Model.Entity.Impl.Maybe,
  Geral.Model.Entity.Impl.Blob;

type
  TCaminhoConfiguracaoFactory = class(TInterfacedObject,
    IFactory<ICaminhoConfiguracao>)
  private
    FTableConfiguracao: TTableConfiguracao;
    FConfiguracaoGrupo: IConfiguracaoGrupo;
  public
    constructor Create(
      const vpTableConfiguracao: TTableConfiguracao;
      const vpConfiguracaoGrupo: IConfiguracaoGrupo); reintroduce;

    function GetInstance: ICaminhoConfiguracao;

    class function New(
      const vpTableConfiguracao: TTableConfiguracao;
      const vpConfiguracaoGrupo: IConfiguracaoGrupo):
      IFactory<ICaminhoConfiguracao>;
  end;

  TDescricaoConfiguracaoFactory = class(TInterfacedObject,
    IFactory<IDescricaoConfiguracao>)
  private
    FTableConfiguracao: TTableConfiguracao;
  public
    constructor Create(
      const vpTableConfiguracao: TTableConfiguracao); reintroduce;

    function GetInstance: IDescricaoConfiguracao;

    class function New(
      const vpTableConfiguracao: TTableConfiguracao):
      IFactory<IDescricaoConfiguracao>;
  end;

  TValorConfiguracaoFactory = class(TInterfacedObject,
    IFactory<IValorConfiguracao>)
  private
    FTableConfiguracao: TTableConfiguracao;
  public
    constructor Create(
      const vpTableConfiguracao: TTableConfiguracao); reintroduce;

    function GetInstance: IValorConfiguracao;

    class function New(
      const vpTableConfiguracao: TTableConfiguracao):
      IFactory<IValorConfiguracao>;
  end;

  TTextoFactory = class(TInterfacedObject, IFactory<IMaybe<IBlob>>)
  private
    FTableConfiguracao: TTableConfiguracao;
  public
    constructor Create(
      const vpTableConfiguracao: TTableConfiguracao); reintroduce;

    function GetInstance: IMaybe<IBlob>;

    class function New(
      const vpTableConfiguracao: TTableConfiguracao):
      IFactory<IMaybe<IBlob>>;
  end;

{ TConfiguracaoFactory }

constructor TConfiguracaoFactory.Create(
  const vpTableConfiguracao: TTableConfiguracao;
  const vpConfiguracaoGrupo: IConfiguracaoGrupo);
begin
  inherited Create;
  FTableConfiguracao := vpTableConfiguracao;
  FConfiguracaoGrupo := vpConfiguracaoGrupo;
end;

function TConfiguracaoFactory.GetInstance: IConfiguracao;
begin
  Result := TConfiguracao.New(
    FTableConfiguracao.ConfigID,
    TCaminhoConfiguracaoFactory.New(
      FTableConfiguracao,
      FConfiguracaoGrupo).GetInstance,
    TDescricaoConfiguracaoFactory.New(
      FTableConfiguracao).GetInstance,
    TValorConfiguracaoFactory.New(
      FTableConfiguracao).GetInstance);
end;

class function TConfiguracaoFactory.New(
  const vpTableConfiguracao: TTableConfiguracao;
  const vpConfiguracaoGrupo: IConfiguracaoGrupo): IFactory<IConfiguracao>;
begin
  Result := Create(
    vpTableConfiguracao,
    vpConfiguracaoGrupo);
end;

{ TCaminhoConfiguracaoFactory }

constructor TCaminhoConfiguracaoFactory.Create(
  const vpTableConfiguracao: TTableConfiguracao;
  const vpConfiguracaoGrupo: IConfiguracaoGrupo);
begin
  inherited Create;
  FTableConfiguracao := vpTableConfiguracao;
  FConfiguracaoGrupo := vpConfiguracaoGrupo;
end;

function TCaminhoConfiguracaoFactory.GetInstance: ICaminhoConfiguracao;
begin
  Result := TCaminhoConfiguracao.New(
     FConfiguracaoGrupo,
     FTableConfiguracao.Secao,
     FTableConfiguracao.Nome);
end;

class function TCaminhoConfiguracaoFactory.New(
  const vpTableConfiguracao: TTableConfiguracao;
  const vpConfiguracaoGrupo: IConfiguracaoGrupo):
  IFactory<ICaminhoConfiguracao>;
begin
  Result := Create(
    vpTableConfiguracao,
    vpConfiguracaoGrupo);
end;

{ TDescricaoConfiguracaoFactory }

constructor TDescricaoConfiguracaoFactory.Create(
  const vpTableConfiguracao: TTableConfiguracao);
begin
  inherited Create;
  FTableConfiguracao := vpTableConfiguracao;
end;

function TDescricaoConfiguracaoFactory.GetInstance: IDescricaoConfiguracao;
begin
  Result := TDescricaoConfiguracao.New(
    FTableConfiguracao.Descricao,
    TTipoValorConfiguracaoFactory.New(
      FTableConfiguracao.TipoValor).GetInstance,
    FTableConfiguracao.Terminal);
end;

class function TDescricaoConfiguracaoFactory.New(
  const vpTableConfiguracao: TTableConfiguracao):
  IFactory<IDescricaoConfiguracao>;
begin
  Result := Create(
    vpTableConfiguracao);
end;

{ TValorConfiguracaoFactory }

constructor TValorConfiguracaoFactory.Create(
  const vpTableConfiguracao: TTableConfiguracao);
begin
  inherited Create;
  FTableConfiguracao := vpTableConfiguracao;
end;

function TValorConfiguracaoFactory.GetInstance: IValorConfiguracao;
begin
  Result := TValorConfiguracao.New(
    FTableConfiguracao.Valor,
    TTextoFactory.New(
      FTableConfiguracao).GetInstance,
    FTableConfiguracao.Atualizado.Equals(
      'S'),
    FTableConfiguracao.Obrigatorio.Equals(
      'S'));
end;

class function TValorConfiguracaoFactory.New(
  const vpTableConfiguracao: TTableConfiguracao): IFactory<IValorConfiguracao>;
begin
  Result := Create(
    vpTableConfiguracao);
end;

{ TTextoFactory }

constructor TTextoFactory.Create(
  const vpTableConfiguracao: TTableConfiguracao);
begin
  inherited Create;
  FTableConfiguracao := vpTableConfiguracao;
end;

function TTextoFactory.GetInstance: IMaybe<IBlob>;
begin
  if FTableConfiguracao.Texto.IsNull then
    Exit(
      TNone<IBlob>.New);

  Result := TSome<IBlob>.New(
    TBlob.New(
      FTableConfiguracao.Texto.AsBytes))
end;

class function TTextoFactory.New(
  const vpTableConfiguracao: TTableConfiguracao): IFactory<IMaybe<IBlob>>;
begin
  Result := Create(
    vpTableConfiguracao);
end;

end.
