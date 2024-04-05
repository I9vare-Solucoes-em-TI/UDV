unit Geral.Model.Tri7;

interface

uses
  Geral.Model.ConexaoDb,
  Geral.Model.ConexaoHistoricoDb,
  Geral.Model.Spec.QueryBuilder,
  Data.DB,
  System.Generics.Collections,
  Geral.Model.Validacao,
  Geral.Model.Autorizacao,
  System.Classes,
  System.Rtti;

type
  TabelaAttribute = class(TCustomAttribute)
  private
    FNome: string;
  public
    constructor Create(
      const vpNome: string);

    property Nome: string read FNome;
  end;

  ColunaAttribute = class(TCustomAttribute)
  private
    FNome: string;
  public
    constructor Create(
      const vpNome: string);

    property Nome: string read FNome;
  end;

  DataCriacaoAttribute = class(TCustomAttribute);
  UsuarioCriacaoAttribute = class(TCustomAttribute);
  DataAlteracaoAttribute = class(TCustomAttribute);
  UsuarioAlteracaoAttribute = class(TCustomAttribute);
  FieldTrimAttribute = class(TCustomAttribute);
  EmptyToNullAttribute = class(TCustomAttribute);
  DateZeroToNullAttribute = class(TCustomAttribute);

  EnumeradoAttribute = class(TCustomAttribute)
  private
    FValor: string;
    FDescricao: string;
  public
    constructor Create(
      const vpValor: string;
      const vpDescricao: string);

    property Valor: string read FValor;
    property Descricao: string read FDescricao;
  end;

  TTri7Util = class
  private
    class function DeCompressStringOld(Source: AnsiString): string;
  public
    class function BuscarEnum<T>(
      const vpEnumValor: string): T;

    class function BuscarEnumByDescricao<T>(
      const vpEnumDescricao: string): T;

    class function BuscarEnumValor<T>(
      const vpEnum: T): string;

    class function BuscarEnumDescricao<T>(
      const vpEnum: T): string; overload;

    class function BuscarEnumDescricao<T>(
      const vpEnumValor: string): string; overload;

    class function CompressString(
      const vpString: AnsiString): AnsiString;

    class function CompressStringStream(
      const vpString: AnsiString): TStringStream;

    class function DeCompressString(
      const vpString: string): string;
  end;

  TTri7Entity = class abstract
  private
    FDataSet: TDataSet;

    procedure CriarCampos(
      const vpDataSet: TDataSet);

    procedure CopiarDados(
      const vpDataSet: TDataSet);
  public
    constructor Create;

    property DataSet: TDataSet read FDataSet;

    destructor Destroy; override;
  end;

  TTri7Business<T: TTri7Entity, constructor> = class abstract
  private
    FConexaoDb: TConexaoDb;
    FConexaoHistoricoDb: TConexaoHistoricoDb;
    FUsuarioId: Integer;
    FTabela: string;
    FChavePrimaria: string;
    FListaDataCriacao: TList<string>;
    FListaUsuarioCriacao: TList<string>;
    FListaDataAlteracao: TList<string>;
    FListaUsuarioAlteracao: TList<string>;
    FListaTrim: TList<string>;
    FListaEmptyToNull: TList<string>;
    FListaDateZeroToNull: TList<string>;
    const CL_RECORDS_PER_EXECUTE: Integer = 1000;

    function CondicaoList(
      const vpIDsList: TList<Integer>;
      const vpCampo: string): string;

    function BuscarQuery(
      const vpFirst: Integer;
      const vpSkip: Integer;
      const vpColunas: TArray<string>;
      const vpWhere: string;
      const vpOrderBy: TArray<string>;
      const vpParams: TArray<TParamValue>): TDataSet;

    function PrepararCadastro(
      const vpId: Int64;
      const vpColunas: TArray<string>): TDataSet;

    function PrepararCadastroLote(
      const vpListaId: TList<Integer>;
      const vpColunas: TArray<string>): TDataSet;

    function PrepararExclusao(
      const vpId: Int64;
      const vpColunas: TArray<string>): TDataSet;

    function GerarSequencia: Int64;

    function BuscarWhereChavePrimaria: string;

    function BuscarParamsChavePrimaria(
      const vpId: Int64): TArray<TParamValue>;

    function BuscarTri7EntityClass: TClass;

    function BuscarChavePrimaria(
      const vpTabela: string): string;

    procedure AtualizarSequencia;

    procedure PreencherMetadados;

    procedure LancarExcecaoRegistroNaoEncontrado(
      const vpId: Int64);

    procedure VerificarCadastro(
      const vpRegistro: T);

    procedure VerificarExclusao(
      const vpRegistro: T);
  protected
    function ExisteColunaModificada(
      const vpRegistro: T;
      const vpColunas: TArray<string>): Boolean;

    function ListarColunaModificada(
      const vpRegistro: T;
      const vpColunas: TArray<string>): TArray<string>;

    procedure BeforePost(
      const vpRegistro: T); virtual;

    procedure BeforePostLote(
      const vpRegistro: T); virtual;

    procedure AfterPost(
      const vpRegistro: T;
      const vpListaAutorizacao: TObjectList<TAutorizacao>); virtual;

    procedure BeforeDelete(
      const vpRegistro: T;
      const vpListaAutorizacao: TObjectList<TAutorizacao>); virtual;

    procedure AfterDelete(
      const vpRegistro: T); virtual;

    property ConexaoDb: TConexaoDb read FConexaoDb;
    property ConexaoHistoricoDb: TConexaoHistoricoDb read FConexaoHistoricoDb;
    property UsuarioId: Integer read FUsuarioId;
  public
    constructor Create(
      const vpConexaoDb: TConexaoDb;
      const vpConexaoHistoricoDb: TConexaoHistoricoDb;
      const vpUsuarioId: Integer); reintroduce;

    function CriarRegistro(
      const vpColunas: TArray<string>): T; virtual; final;

    function ValidarCadastro(
      const vpRegistro: T;
      out vpListaErroValidacao: TObjectList<TErroValidacao>): Boolean; virtual;

    function Pesquisar(
      const vpFirst: Integer;
      const vpSkip: Integer;
      const vpColunas: TArray<string>;
      const vpWhere: string;
      const vpOrderBy: TArray<string>;
      const vpParams: TArray<TParamValue>): T; virtual; final;

    function Listar(
      const vpColunas: TArray<string>;
      const vpWhere: string;
      const vpParams: TArray<TParamValue>;
      const vpOrderBy: TArray<string>): T; virtual; final;

    function Buscar(
      const vpId: Int64;
      const vpColunas: TArray<string>): T; virtual; final;

    function BuscarOuFalhar(
      const vpId: Int64;
      const vpColunas: TArray<string>): T; virtual; final;

    function BuscarUnico(
      const vpColunas: TArray<string>;
      const vpWhere: string;
      const vpParams: TArray<TParamValue>): T; virtual; final;

    function BuscarUnicoOuFalhar(
      const vpColunas: TArray<string>;
      const vpWhere: string;
      const vpParams: TArray<TParamValue>): T; virtual; final;

    function ValidarExclusao(
      const vpRegistro: T;
      out vpListaErroValidacao: TObjectList<TErroValidacao>): Boolean; virtual;

    function Contar(
      const vpWhere: string;
      const vpParams: TArray<TParamValue>): Int64; virtual; final;

    function Existe(
      const vpWhere: string;
      const vpParams: TArray<TParamValue>): Boolean; virtual; final;

    function BuscarValor(
      const vpId: Int64;
      const vpColuna: string): TValue;

    function BuscarValorAsType<V>(
      const vpId: Int64;
      const vpColuna: string): V;

    function BuscarEnum<E>(
      const vpId: Int64;
      const vpColuna: string): E;

    procedure Cadastrar(
      const vpRegistro: T;
      const vpListaAutorizacao: TObjectList<TAutorizacao>); virtual; final;

    procedure CadastrarLote(
      const vpRegistro: T); virtual; final;

    procedure Excluir(
      const vpRegistro: T;
      const vpListaAutorizacao: TObjectList<TAutorizacao>); virtual; final;

    destructor Destroy; override;
  end;

  TPaginacaoParams = class
  private
    FPaginacaoHabilitada: Boolean;
    FQuantidadeRegistroPorPagina: Integer;
    FPagina: Integer;
  public
    property PaginacaoHabilitada: Boolean read FPaginacaoHabilitada write FPaginacaoHabilitada;
    property QuantidadeRegistroPorPagina: Integer read FQuantidadeRegistroPorPagina write FQuantidadeRegistroPorPagina;
    property Pagina: Integer read FPagina write FPagina;
  end;

implementation

uses
  Geral.Model.Impl.QueryBuilder.I9,
  Geral.Model.Sequencia,
  System.SysUtils,
  Geral.Model.Util.DataSet,
  System.TypInfo,
  I9MemTable,
  System.StrUtils,
  FireDAC.Comp.Client,
  FireDAC.Stan.Error,
  ZLibEx,
  Soap.EncdDecd,
  FireDAC.Comp.DataSet,
  Geral.Model.Util.Str,
  Geral.Model.Util.List,
  I9Query,
  FireDAC.Stan.Option;

{ TabelaAttribute }

constructor TabelaAttribute.Create(
  const vpNome: string);
begin
  inherited Create;
  FNome := vpNome;
end;

{ TTri7Business }

procedure TTri7Business<T>.AfterPost(
  const vpRegistro: T;
  const vpListaAutorizacao: TObjectList<TAutorizacao>);
var
  viAutorizacaoBusiness: TAutorizacaoBusiness;
  viAutorizacao: TAutorizacao;
  viId: Int64;
begin
  viAutorizacaoBusiness := nil;
  try
    if Assigned(vpListaAutorizacao) then
    begin
      viAutorizacaoBusiness := TAutorizacaoBusiness.Create(
        FConexaoDb,
        FUsuarioId);

      viId := vpRegistro.DataSet.FieldByName(FChavePrimaria).AsLargeInt;

      for viAutorizacao in vpListaAutorizacao do
      begin
        viAutorizacao.Tabela := FTabela;
        viAutorizacao.CampoId := viId;
        viAutorizacaoBusiness.SalvarAutorizacao(viAutorizacao);
      end;
    end;
  finally
    FreeAndNil(viAutorizacaoBusiness);
  end;
end;

procedure TTri7Business<T>.AtualizarSequencia;
var
  viSequenciaBusiness: TSequenciaBusiness;
begin
  viSequenciaBusiness := nil;
  try
    viSequenciaBusiness := TSequenciaBusiness.Create(FConexaoDb);

    viSequenciaBusiness.AtualizarOuInserirSequenciaMax(
      FTabela,
      FTabela,
      FChavePrimaria);
  finally
    FreeAndNil(viSequenciaBusiness);
  end;
end;

procedure TTri7Business<T>.AfterDelete(
  const vpRegistro: T);
begin

end;

procedure TTri7Business<T>.BeforeDelete(
  const vpRegistro: T;
  const vpListaAutorizacao: TObjectList<TAutorizacao>);
var
  viId: Integer;
  viAutorizacaoBusiness: TAutorizacaoBusiness;
begin
  viAutorizacaoBusiness := nil;
  try
    viAutorizacaoBusiness := TAutorizacaoBusiness.Create(
      FConexaoDb,
      FUsuarioId);

    viId := vpRegistro.DataSet.FieldByName(FChavePrimaria).AsLargeInt;

    viAutorizacaoBusiness.Excluir(
      FTabela,
      viId);
  finally
    FreeAndNil(viAutorizacaoBusiness);
  end;
end;

procedure TTri7Business<T>.BeforePost(
  const vpRegistro: T);
var
  viId: Int64;
  viColunas: TArray<string>;
  viColuna: string;
  viField: TField;
  viIsDataCriacao: Boolean;
  viIsUsuarioCriacao: Boolean;
  viIsDataAlteracao: Boolean;
  viIsUsuarioAlteracao: Boolean;
  viIsTrim: Boolean;
  viIsEmptyToNull: Boolean;
  viIsDateZeroToNull: Boolean;
begin
  viColunas := TDataSetUtil.ListarColunas(vpRegistro.DataSet);

  if vpRegistro.DataSet.State = TDataSetState.dsInsert then
  begin
    viId := GerarSequencia;
    vpRegistro.DataSet.FieldByName(FChavePrimaria).AsLargeInt := viId;

    for viColuna in viColunas do
    begin
      viField := vpRegistro.DataSet.FieldByName(viColuna);

      viIsDataCriacao := FListaDataCriacao.Contains(viColuna);
      if viIsDataCriacao and viField.IsNull then
      begin
        viField.AsDateTime := FConexaoDb.BuscarDataHoraBanco;
        Continue;
      end;

      viIsUsuarioCriacao := FListaUsuarioCriacao.Contains(viColuna);
      if viIsUsuarioCriacao and viField.IsNull then
      begin
        viField.AsInteger := FUsuarioId;
        Continue;
      end;

      viIsTrim := FListaTrim.Contains(viColuna);
      if viIsTrim then
        viField.AsString := viField.AsString.Trim;

      viIsEmptyToNull := FListaEmptyToNull.Contains(viColuna);
      if viIsEmptyToNull then
      begin
        if viField.AsString = '' then
          viField.Clear;
      end;

      viIsDateZeroToNull := FListaDateZeroToNull.Contains(viColuna);
      if viIsDateZeroToNull then
      begin
        if viField.AsDateTime = 0 then
          viField.Clear;
      end;
    end;
  end;

  if vpRegistro.DataSet.State = TDataSetState.dsEdit then
  begin
    for viColuna in viColunas do
    begin
      viField := vpRegistro.DataSet.FieldByName(viColuna);

      viIsDataAlteracao := FListaDataAlteracao.Contains(viColuna);
      if viIsDataAlteracao then
      begin
        viField.AsDateTime := FConexaoDb.BuscarDataHoraBanco;
        Continue;
      end;

      viIsUsuarioAlteracao := FListaUsuarioAlteracao.Contains(viColuna);
      if viIsUsuarioAlteracao then
      begin
        viField.AsInteger := FUsuarioId;
        Continue;
      end;
    end;
  end;
end;

procedure TTri7Business<T>.BeforePostLote(const vpRegistro: T);
var
  viId: Int64;
  viColunas: TArray<string>;
  viColuna: string;
  viField: TField;
  viIsDataCriacao: Boolean;
  viIsUsuarioCriacao: Boolean;
  viIsDataAlteracao: Boolean;
  viIsUsuarioAlteracao: Boolean;
  viIsTrim: Boolean;
  viIsEmptyToNull: Boolean;
  viIsDateZeroToNull: Boolean;
  viInserindo: Boolean;
  viDataAtual: TDateTime;
begin
  viColunas := TDataSetUtil.ListarColunas(vpRegistro.DataSet);
  viDataAtual := FConexaoDb.BuscarDataHoraBanco;
  viId := 0;

  vpRegistro.DataSet.First;
  while not vpRegistro.DataSet.Eof do
  begin
    try
      viInserindo := vpRegistro.DataSet.FieldByName(FChavePrimaria).AsLargeInt <= 0;
      if viInserindo then
      begin
        if viId = 0 then
          viId := GerarSequencia
        else
          Inc(viId);

        vpRegistro.DataSet.Edit;

        vpRegistro.DataSet.FieldByName(FChavePrimaria).AsLargeInt := viId;

        for viColuna in viColunas do
        begin
          viField := vpRegistro.DataSet.FieldByName(viColuna);

          viIsDataCriacao := FListaDataCriacao.Contains(viColuna);
          if viIsDataCriacao and viField.IsNull then
          begin
            viField.AsDateTime := viDataAtual;
            Continue;
          end;

          viIsUsuarioCriacao := FListaUsuarioCriacao.Contains(viColuna);
          if viIsUsuarioCriacao and viField.IsNull then
          begin
            viField.AsInteger := FUsuarioId;
            Continue;
          end;

          viIsTrim := FListaTrim.Contains(viColuna);
          if viIsTrim then
            viField.AsString := viField.AsString.Trim;

          viIsEmptyToNull := FListaEmptyToNull.Contains(viColuna);
          if viIsEmptyToNull then
          begin
            if viField.AsString = '' then
              viField.Clear;
          end;

          viIsDateZeroToNull := FListaDateZeroToNull.Contains(viColuna);
          if viIsDateZeroToNull then
          begin
            if viField.AsDateTime = 0 then
              viField.Clear;
          end;
        end;
        vpRegistro.DataSet.Post;
      end
      else
      begin
        vpRegistro.DataSet.Edit;
        for viColuna in viColunas do
        begin
          viField := vpRegistro.DataSet.FieldByName(viColuna);

          viIsDataAlteracao := FListaDataAlteracao.Contains(viColuna);
          if viIsDataAlteracao then
          begin
            viField.AsDateTime := viDataAtual;
            Continue;
          end;

          viIsUsuarioAlteracao := FListaUsuarioAlteracao.Contains(viColuna);
          if viIsUsuarioAlteracao then
          begin
            viField.AsInteger := FUsuarioId;
            Continue;
          end;
        end;
        vpRegistro.DataSet.Post;
      end;
    finally
      vpRegistro.DataSet.Next;
    end;
  end;

end;

function TTri7Business<T>.Buscar(
  const vpId: Int64;
  const vpColunas: TArray<string>): T;
const
  CI_ORDER_BY: TArray<string> = [];

var
  viWhere: string;
  viParams: TArray<TParamValue>;
begin
  Result := nil;
  try
    viWhere := BuscarWhereChavePrimaria;
    viParams := BuscarParamsChavePrimaria(vpId);

    Result := Pesquisar(
      0,
      0,
      vpColunas,
      viWhere,
      CI_ORDER_BY,
      viParams);
  except
    FreeAndNil(Result);
    raise;
  end;
end;

function TTri7Business<T>.BuscarChavePrimaria(
  const vpTabela: string): string;
var
  viLista: TStrings;
begin
  Result := string.Empty;
  viLista := nil;

  try
    viLista := TStringList.Create;

    FConexaoDb.Connection.GetKeyFieldNames(
      string.Empty,
      string.Empty,
      vpTabela,
      string.Empty,
      viLista);

    if viLista.Count = 0 then
      raise Exception.CreateFmt(
        'A tabela %s não possui chave primária definida.',
        [vpTabela]);

    if viLista.Count > 1 then
      raise Exception.CreateFmt(
        'A tabela %s possui mais de um campo definido como chave primária.',
        [vpTabela]);

    Result := viLista[0];
  finally
    FreeAndNil(viLista);
  end;
end;

function TTri7Business<T>.BuscarEnum<E>(
  const vpId: Int64;
  const vpColuna: string): E;
var
  viValor: TValue;
begin
  viValor := BuscarValor(
    vpId,
    vpColuna);

  Result := TTri7Util.BuscarEnum<E>(viValor.AsString);
end;

function TTri7Business<T>.BuscarWhereChavePrimaria: string;
begin
  Result := string.Format(
    '%s = :%s',
    [FChavePrimaria,
    FChavePrimaria]);
end;

function TTri7Business<T>.BuscarOuFalhar(
  const vpId: Int64;
  const vpColunas: TArray<string>): T;
begin
  Result := nil;
  try
    Result := Buscar(
      vpId,
      vpColunas);

    if Result.DataSet.IsEmpty then
      LancarExcecaoRegistroNaoEncontrado(vpId);
  except
    FreeAndNil(Result);
    raise;
  end;
end;

function TTri7Business<T>.BuscarParamsChavePrimaria(
  const vpId: Int64): TArray<TParamValue>;
var
  viParamValue: TParamValue;
begin
  viParamValue := NewParam(
    FChavePrimaria,
    vpId);

  Result := [viParamValue];
end;

function TTri7Business<T>.BuscarQuery(
  const vpFirst: Integer;
  const vpSkip: Integer;
  const vpColunas: TArray<string>;
  const vpWhere: string;
  const vpOrderBy: TArray<string>;
  const vpParams: TArray<TParamValue>): TDataSet;
var
  viBeforeOpen: TBeforeOpen<TI9Query>;
begin
  Result := nil;
  try
    viBeforeOpen := procedure(
      const vpQuery: TI9Query)
    begin
      vpQuery.FormatOptions.AssignedValues := [TFDFormatOptionValue.fvMapRules];
    end;

    Result := TI9QueryBuilder.New(FConexaoDb.Connection)
      .First(vpFirst)
      .Skip(vpSkip)
      .Columns(vpColunas)
      .Table(FTabela)
      .Where(vpWhere)
      .OrderBy(vpOrderBy)
      .Params(vpParams)
      .RegisterBeforeOpen(viBeforeOpen)
      .Open;
  except
    FreeAndNil(Result);
    raise;
  end;
end;

function TTri7Business<T>.BuscarTri7EntityClass: TClass;
var
  viRttiContext: TRttiContext;
  viRttiType: TRttiType;
  viRttiMethod: TRttiMethod;
begin
  viRttiContext := TRttiContext.Create;
  try
    viRttiType := viRttiContext.GetType(ClassType);
    viRttiMethod := viRttiType.GetMethod('CriarRegistro');
    Result := viRttiMethod.ReturnType.AsInstance.MetaclassType;
  finally
    viRttiContext.Free;
  end;
end;

function TTri7Business<T>.BuscarUnico(
  const vpColunas: TArray<string>;
  const vpWhere: string;
  const vpParams: TArray<TParamValue>): T;
const
  CI_ORDER_BY: TArray<string> = [];
begin
  Result := nil;
  try
    Result := Pesquisar(
      0,
      0,
      vpColunas,
      vpWhere,
      CI_ORDER_BY,
      vpParams);

    if Result.DataSet.RecordCount > 1 then
      raise Exception.Create('Foi encontrado mais de um registro.');
  except
    FreeAndNil(Result);
    raise;
  end;
end;

function TTri7Business<T>.BuscarUnicoOuFalhar(
  const vpColunas: TArray<string>;
  const vpWhere: string;
  const vpParams: TArray<TParamValue>): T;
begin
  Result := nil;
  try
    Result := BuscarUnico(
      vpColunas,
      vpWhere,
      vpParams);

    if Result.DataSet.IsEmpty then
      raise Exception.Create('Não foi possível encontrar nenhum registro.');
  except
    FreeAndNil(Result);
    raise;
  end;
end;

function TTri7Business<T>.BuscarValor(
  const vpId: Int64;
  const vpColuna: string): TValue;
var
  viRegistro: T;
  viColunas: TArray<string>;
  viValue: Variant;
begin
  viRegistro := nil;
  try
    viColunas := [
      vpColuna
    ];

    viRegistro := BuscarOuFalhar(
      vpId,
      viColunas);

    viValue := viRegistro.DataSet[vpColuna];
    Result := TValue.FromVariant(viValue);
  finally
    FreeAndNil(viRegistro);
  end;
end;

function TTri7Business<T>.BuscarValorAsType<V>(
  const vpId: Int64;
  const vpColuna: string): V;
var
  viValor: TValue;
begin
  viValor := BuscarValor(
    vpId,
    vpColuna);

  Result := viValor.AsType<V>;
end;

procedure TTri7Business<T>.Cadastrar(
  const vpRegistro: T;
  const vpListaAutorizacao: TObjectList<TAutorizacao>);
var
  viDataSet: TDataSet;
  viColunas: TArray<string>;
  viCadastroValido: Boolean;
  viListaErroValidacao: TObjectList<TErroValidacao>;
  viAutorizacaoValida: Boolean;
  viInTransaction: Boolean;
  viId: Int64;
  viInserindo: Boolean;
  viErroValidacaoBusiness: TErroValidacaoBusiness;
begin
  viDataSet := nil;
  viListaErroValidacao := nil;
  viErroValidacaoBusiness := nil;

  try
    VerificarCadastro(vpRegistro);

    viId := vpRegistro.DataSet.FieldByName(FChavePrimaria).AsLargeInt;
    viColunas := TDataSetUtil.ListarColunas(vpRegistro.DataSet);

    viDataSet := PrepararCadastro(
      viId,
      viColunas);

    viInserindo := viId <= 0;

    if not viInserindo and viDataSet.IsEmpty then
      LancarExcecaoRegistroNaoEncontrado(viId);

    viCadastroValido := ValidarCadastro(
      vpRegistro,
      viListaErroValidacao);

    if not viCadastroValido then
    begin
      viErroValidacaoBusiness := TErroValidacaoBusiness.Create(
        FConexaoDb,
        FUsuarioId);

      viAutorizacaoValida := viErroValidacaoBusiness.ValidarAutorizacao(
        viListaErroValidacao,
        vpListaAutorizacao);

      if not viAutorizacaoValida then
        raise Exception.Create('Erro ao cadastrar.');
    end;

    viInTransaction := FConexaoDb.Connection.InTransaction;
    if not viInTransaction then
      FConexaoDb.Connection.StartTransaction;

    try
      BeforePost(vpRegistro);

      if viInserindo then
        viDataSet.Append
      else
        viDataSet.Edit;

      viDataSet.CopyFields(vpRegistro.DataSet);
      viDataSet.Post;

      AfterPost(
        vpRegistro,
        vpListaAutorizacao);

      vpRegistro.DataSet.Post;

      if not viInTransaction then
        FConexaoDb.Connection.Commit;
    except
      if not viInTransaction then
        FConexaoDb.Connection.Rollback;

      raise;
    end;
  finally
    FreeAndNil(viDataSet);
    FreeAndNil(viListaErroValidacao);
    FreeAndNil(viErroValidacaoBusiness);
  end;
end;

procedure TTri7Business<T>.CadastrarLote(const vpRegistro: T);
var
  I: Integer;
  viDataSet: TFDQuery;
  viColunas: TArray<string>;
  viAutorizacaoValida: Boolean;
  viInTransaction: Boolean;
  viId: Int64;
  viListaId: TList<Integer>;
  viInserindo: Boolean;
  viExisteErro: Boolean;
  viErro: EFDException;
begin
  viDataSet := nil;
  viListaId := nil;

  try
    viListaId := TList<Integer>.Create;

    vpRegistro.DataSet.First;
    while not vpRegistro.DataSet.Eof do
    begin
      viId := vpRegistro.DataSet.FieldByName(FChavePrimaria).AsLargeInt;
      if viId > 0 then
        viListaId.Add(viId);

      vpRegistro.DataSet.Next;
    end;

    viColunas := TDataSetUtil.ListarColunas(vpRegistro.DataSet);

    viDataSet := TFDQuery(PrepararCadastroLote(
      viListaId,
      viColunas));

    viDataSet.CachedUpdates := True;

    BeforePostLote(vpRegistro);

    I := 0;
    vpRegistro.DataSet.First;
    while not vpRegistro.DataSet.Eof do
    begin
      viId := vpRegistro.DataSet.FieldByName(FChavePrimaria).AsLargeInt;
      viInserindo := not viDataSet.Locate(FChavePrimaria, viId);

      if viInserindo then
        viDataSet.Append
      else
        viDataSet.Edit;

      viDataSet.CopyFields(vpRegistro.DataSet);
      viDataSet.Post;

      Inc(I);

      if I = CL_RECORDS_PER_EXECUTE then
      begin
        viExisteErro := viDataSet.ApplyUpdates > 0;
        if viExisteErro then
        begin
          viDataSet.FilterChanges := [rtModified, rtInserted, rtDeleted, rtHasErrors];
          viDataSet.First;
          while not viDataSet.Eof do
          begin
            viErro := viDataSet.RowError;
            if Assigned(viErro) then
            begin
              viDataSet.CancelUpdates;
//              raise Exception.Create(viErro.Message);
            end;
            viDataSet.Next;
          end;
        end;

        viDataSet.CommitUpdates;
        I := 0;
      end;

      vpRegistro.DataSet.Next;
    end;

    if I > 0 then
    begin
      viExisteErro := viDataSet.ApplyUpdates > 0;
      if viExisteErro then
      begin
        viDataSet.FilterChanges := [rtModified, rtInserted, rtDeleted, rtHasErrors];
        viDataSet.First;
        while not viDataSet.Eof do
        begin
          viErro := viDataSet.RowError;
          if Assigned(viErro) then
          begin
            viDataSet.CancelUpdates;
            raise Exception.Create(viErro.Message);
          end;
          viDataSet.Next;
        end;
      end;

      viDataSet.CommitUpdates;
      I := 0;
    end;

    AtualizarSequencia;
  finally
    FreeAndNil(viDataSet);
    FreeAndNil(viListaId);
  end;
end;

function TTri7Business<T>.CondicaoList(
  const vpIDsList: TList<Integer>;
  const vpCampo: string): string;
var
  viListaListaSeloLivroId: TList<TList<Integer>>;
  viListaSeloLivroIdPaginada: TList<Integer>;
  viListaCondicao: TStrings;
  viCondicao: string;
  viValorListaInteiro: string;
begin
  Result := string.Empty;
  viListaListaSeloLivroId := nil;
  viListaCondicao := nil;

  try
    if vpIDsList.Count = 0 then
      Exit;

    viListaListaSeloLivroId := TListUtil.Paginar<Integer>(
      vpIDsList,
      1500);

    viListaCondicao := TStringList.Create;

    for viListaSeloLivroIdPaginada in viListaListaSeloLivroId do
    begin
      viValorListaInteiro := TUtilString.RetornarValorListaInteiro(
        viListaSeloLivroIdPaginada,
        ', ');

      viCondicao := string.Format(
        '%s IN (%s)',
        [vpCampo,
        viValorListaInteiro]);

      viListaCondicao.Add(viCondicao);
    end;

    Result := string.Join(
      ' OR ',
      viListaCondicao.ToStringArray);
  finally
    FreeAndNil(viListaListaSeloLivroId);
    FreeAndNil(viListaCondicao);
  end;
end;

function TTri7Business<T>.Contar(
  const vpWhere: string;
  const vpParams: TArray<TParamValue>): Int64;
const
  CI_ORDER_BY: TArray<string> = [];

var
  viQuery: TDataSet;
  viColunas: TArray<string>;
begin
  viQuery := nil;
  try
    viColunas := ['COUNT(*) AS QUANTIDADE'];

    viQuery := BuscarQuery(
      0,
      0,
      viColunas,
      vpWhere,
      CI_ORDER_BY,
      vpParams);

    Result := viQuery.FieldByName('QUANTIDADE').AsLargeInt;
  finally
    FreeAndNil(viQuery);
  end;
end;

constructor TTri7Business<T>.Create(
  const vpConexaoDb: TConexaoDb;
  const vpConexaoHistoricoDb: TConexaoHistoricoDb;
  const vpUsuarioId: Integer);
begin
  FConexaoDb := vpConexaoDb;
  FConexaoHistoricoDb := vpConexaoHistoricoDb;
  FUsuarioId := vpUsuarioId;

  FTabela := string.Empty;
  FChavePrimaria := string.Empty;
  FListaDataCriacao := nil;
  FListaUsuarioCriacao := nil;
  FListaDataAlteracao := nil;
  FListaUsuarioAlteracao := nil;
  FListaTrim := nil;
  FListaEmptyToNull := nil;
  FListaDateZeroToNull := nil;

  PreencherMetadados;
end;

function TTri7Business<T>.CriarRegistro(
  const vpColunas: TArray<string>): T;
var
  viDataSet: TDataSet;
begin
  Result := nil;
  viDataSet := nil;

  try
    try
      viDataSet := PrepararCadastro(0, vpColunas);

      Result := T.Create;
      Result.CriarCampos(viDataSet);
    except
      FreeAndNil(Result);
      raise;
    end;
  finally
    FreeAndNil(viDataSet);
  end;
end;

destructor TTri7Business<T>.Destroy;
begin
  FreeAndNil(FListaDataCriacao);
  FreeAndNil(FListaUsuarioCriacao);
  FreeAndNil(FListaDataAlteracao);
  FreeAndNil(FListaUsuarioAlteracao);
  FreeAndNil(FListaTrim);
  FreeAndNil(FListaEmptyToNull);
  FreeAndNil(FListaDateZeroToNull);

  inherited;
end;

procedure TTri7Business<T>.Excluir(
  const vpRegistro: T;
  const vpListaAutorizacao: TObjectList<TAutorizacao>);
var
  viDataSet: TDataSet;
  viExclusaoValida: Boolean;
  viListaErroValidacao: TObjectList<TErroValidacao>;
  viAutorizacaoValida: Boolean;
  viInTransaction: Boolean;
  viColunas: TArray<string>;
  viId: Int64;
  viErroValidacaoBusiness: TErroValidacaoBusiness;
begin
  viDataSet := nil;
  viListaErroValidacao := nil;
  viErroValidacaoBusiness := nil;

  try
    VerificarExclusao(vpRegistro);

    viId := vpRegistro.DataSet.FieldByName(FChavePrimaria).AsLargeInt;
    viColunas := TDataSetUtil.ListarColunas(vpRegistro.DataSet);

    viDataSet := PrepararExclusao(
      viId,
      viColunas);

    if viDataSet.IsEmpty then
      LancarExcecaoRegistroNaoEncontrado(viId);

    viExclusaoValida := ValidarExclusao(
      vpRegistro,
      viListaErroValidacao);

    if not viExclusaoValida then
    begin
      viErroValidacaoBusiness := TErroValidacaoBusiness.Create(
        FConexaoDb,
        FUsuarioId);

      viAutorizacaoValida := viErroValidacaoBusiness.ValidarAutorizacao(
        viListaErroValidacao,
        vpListaAutorizacao);

      if not viAutorizacaoValida then
        raise Exception.Create('Erro ao excluir.');
    end;

    viInTransaction := FConexaoDb.Connection.InTransaction;
    if not viInTransaction then
      FConexaoDb.Connection.StartTransaction;

    try
      BeforeDelete(vpRegistro, vpListaAutorizacao);
      viDataSet.Delete;
      AfterDelete(vpRegistro);
      vpRegistro.DataSet.Delete;

      if not viInTransaction then
        FConexaoDb.Connection.Commit;
    except
      if not viInTransaction then
        FConexaoDb.Connection.Rollback;

      raise;
    end;
  finally
    FreeAndNil(viDataSet);
    FreeAndNil(viListaErroValidacao);
    FreeAndNil(viErroValidacaoBusiness);
  end;
end;

function TTri7Business<T>.Existe(
  const vpWhere: string;
  const vpParams: TArray<TParamValue>): Boolean;
const
  CI_ORDER_BY: TArray<string> = [];

var
  viQuery: TDataSet;
  viColunas: TArray<string>;
begin
  viQuery := nil;
  try
    viColunas := ['1'];

    viQuery := BuscarQuery(
      1,
      0,
      viColunas,
      vpWhere,
      CI_ORDER_BY,
      vpParams);

    Result := not viQuery.IsEmpty;
  finally
    FreeAndNil(viQuery);
  end;
end;

function TTri7Business<T>.ExisteColunaModificada(
  const vpRegistro: T;
  const vpColunas: TArray<string>): Boolean;
var
  viColuna: string;
  viField: TField;
  viColunaCarregada: Boolean;
  viColunaModificada: Boolean;
begin
  Result := False;
  VerificarCadastro(vpRegistro);

  for viColuna in vpColunas do
  begin
    viField := vpRegistro.DataSet.FindField(viColuna);
    viColunaCarregada := Assigned(viField);

    if not viColunaCarregada then
      Continue;

    viColunaModificada := viField.OldValue <> viField.Value;
    if viColunaModificada then
    begin
      Result := True;
      Exit;
    end;
  end;
end;

function TTri7Business<T>.GerarSequencia: Int64;
var
  viSequenciaBusiness: TSequenciaBusiness;
begin
  viSequenciaBusiness := nil;
  try
    viSequenciaBusiness := TSequenciaBusiness.Create(FConexaoDb);
    Result := viSequenciaBusiness.GerarSequencia(FTabela);
  finally
    FreeAndNil(viSequenciaBusiness);
  end;
end;

procedure TTri7Business<T>.LancarExcecaoRegistroNaoEncontrado(
  const vpId: Int64);
begin
  raise Exception.CreateFmt(
    'Não foi possível encontrar o registro da tabela %s com o ID %d.',
    [FTabela,
    vpId]);
end;

function TTri7Business<T>.Listar(
  const vpColunas: TArray<string>;
  const vpWhere: string;
  const vpParams: TArray<TParamValue>;
  const vpOrderBy: TArray<string>): T;
begin
  Result := nil;
  try
    Result := Pesquisar(
      0,
      0,
      vpColunas,
      vpWhere,
      vpOrderBy,
      vpParams);
  except
    FreeAndNil(Result);
    raise;
  end;
end;

function TTri7Business<T>.ListarColunaModificada(
  const vpRegistro: T;
  const vpColunas: TArray<string>): TArray<string>;
var
  viColuna: string;
  viField: TField;
  viColunaCarregada: Boolean;
  viColunaModificada: Boolean;
  viListaColunaModificada: TList<string>;
begin
  viListaColunaModificada := nil;
  try
    VerificarCadastro(vpRegistro);
    viListaColunaModificada := TList<string>.Create;

    for viColuna in vpColunas do
    begin
      viField := vpRegistro.DataSet.FindField(viColuna);
      viColunaCarregada := Assigned(viField);

      if not viColunaCarregada then
        Continue;

      viColunaModificada := viField.OldValue <> viField.Value;
      if not viColunaModificada then
        Continue;

      viListaColunaModificada.Add(viColuna);
    end;

    Result := viListaColunaModificada.ToArray;
  finally
    FreeAndNil(viListaColunaModificada);
  end;
end;

function TTri7Business<T>.Pesquisar(
  const vpFirst: Integer;
  const vpSkip: Integer;
  const vpColunas: TArray<string>;
  const vpWhere: string;
  const vpOrderBy: TArray<string>;
  const vpParams: TArray<TParamValue>): T;
var
  viQuery: TDataSet;
begin
  Result := nil;
  viQuery := nil;

  try
    try
      viQuery := BuscarQuery(
        vpFirst,
        vpSkip,
        vpColunas,
        vpWhere,
        vpOrderBy,
        vpParams);

      Result := T.Create;
      Result.CriarCampos(viQuery);
      Result.CopiarDados(viQuery);
    except
      FreeAndNil(Result);
      raise;
    end;
  finally
    FreeAndNil(viQuery);
  end;
end;

procedure TTri7Business<T>.PreencherMetadados;
var
  viRttiContext: TRttiContext;
  viTri7EntityClass: TClass;
  viRttiType: TRttiType;
  viListaAttribute: TArray<TCustomAttribute>;
  viAttribute: TCustomAttribute;
  viIsTabelaAttribute: Boolean;
  viTabelaAttribute: TabelaAttribute;
  viListaDeclaredField: TArray<TRttiField>;
  viDeclaredField: TRttiField;
  viMemberVisibility: TMemberVisibility;
  viIsPublic: Boolean;
  viIsColunaAttribute: Boolean;
  viColunaAttribute: ColunaAttribute;
  viIsDataCriacaoAttribute: Boolean;
  viIsUsuarioCriacaoAttribute: Boolean;
  viIsDataAlteracaoAttribute: Boolean;
  viIsUsuarioAlteracaoAttribute: Boolean;
  viIsTrimAttribute: Boolean;
  viIsEmptyToNullAttribute: Boolean;
  viIsDateZeroToNullAttribute: Boolean;
  viIsTrimTabelaAttribute: Boolean;
  viIsEmptyToNullTabelaAttribute: Boolean;
  viIsDateZeroToNullTabelaAttribute: Boolean;
  viRttiInstanceType: TRttiInstanceType;
  viMetaClassType: TClass;
  viFieldType: TFieldType;
  viField: TField;
  viMensagem: string;
begin
  viRttiContext := TRttiContext.Create;
  try
    FTabela := string.Empty;
    FChavePrimaria := string.Empty;
    FListaDataCriacao := TList<string>.Create;
    FListaUsuarioCriacao := TList<string>.Create;
    FListaDataAlteracao := TList<string>.Create;
    FListaUsuarioAlteracao := TList<string>.Create;
    FListaTrim := TList<string>.Create;
    FListaEmptyToNull := TList<string>.Create;
    FListaDateZeroToNull := TList<string>.Create;
    viIsTrimTabelaAttribute := False;
    viIsEmptyToNullTabelaAttribute := False;
    viIsDateZeroToNullTabelaAttribute := False;

    viTri7EntityClass := BuscarTri7EntityClass;
    viRttiType := viRttiContext.GetType(viTri7EntityClass);

    viListaAttribute := viRttiType.GetAttributes;
    for viAttribute in viListaAttribute do
    begin
      viIsTabelaAttribute := viAttribute is TabelaAttribute;
      if viIsTabelaAttribute then
      begin
        viTabelaAttribute := TabelaAttribute(viAttribute);
        FTabela := viTabelaAttribute.Nome;
        Continue;
      end;

      if viAttribute is FieldTrimAttribute then
        viIsTrimTabelaAttribute := True;

      if viAttribute is EmptyToNullAttribute then
        viIsEmptyToNullTabelaAttribute := True;

      if viAttribute is DateZeroToNullAttribute then
        viIsDateZeroToNullTabelaAttribute := True;
    end;

    if FTabela.IsEmpty then
      raise Exception.CreateFmt(
        'Não foi encontrado o atributo Tabela na classe %s.',
        [viTri7EntityClass.ClassName]);

    FChavePrimaria := BuscarChavePrimaria(FTabela);

    viListaDeclaredField := viRttiType.GetDeclaredFields;
    for viDeclaredField in viListaDeclaredField do
    begin
      viField := nil;

      try
        viMemberVisibility := viDeclaredField.Visibility;
        viIsPublic := viMemberVisibility = TMemberVisibility.mvPublic;

        if not viIsPublic then
          Continue;

        viColunaAttribute := nil;

        viListaAttribute := viDeclaredField.GetAttributes;

        viRttiInstanceType := viDeclaredField.FieldType.AsInstance;
        viMetaClassType := viRttiInstanceType.MetaclassType;
        viField := TFieldClass(viMetaClassType).Create(nil);
        viFieldType := viField.DataType;

        for viAttribute in viListaAttribute do
        begin
          viIsColunaAttribute := viAttribute is ColunaAttribute;
          if viIsColunaAttribute then
          begin
            viColunaAttribute := ColunaAttribute(viAttribute);

            if viIsTrimTabelaAttribute and (viFieldType = TFieldType.ftString) then
              FListaTrim.Add(viColunaAttribute.Nome);

            if viIsEmptyToNullTabelaAttribute and (viFieldType = TFieldType.ftString) then
              FListaEmptyToNull.Add(viColunaAttribute.Nome);

            if viIsDateZeroToNullTabelaAttribute and (viFieldType = TFieldType.ftDateTime) then
              FListaDateZeroToNull.Add(viColunaAttribute.Nome);

            Continue;
          end;

          viIsDataCriacaoAttribute := viAttribute is DataCriacaoAttribute;
          if viIsDataCriacaoAttribute then
          begin
            FListaDataCriacao.Add(viColunaAttribute.Nome);
            Continue;
          end;

          viIsUsuarioCriacaoAttribute := viAttribute is UsuarioCriacaoAttribute;
          if viIsUsuarioCriacaoAttribute then
          begin
            FListaUsuarioCriacao.Add(viColunaAttribute.Nome);
            Continue;
          end;

          viIsDataAlteracaoAttribute := viAttribute is DataAlteracaoAttribute;
          if viIsDataAlteracaoAttribute then
          begin
            FListaDataAlteracao.Add(viColunaAttribute.Nome);
            Continue;
          end;

          viIsUsuarioAlteracaoAttribute := viAttribute is UsuarioAlteracaoAttribute;
          if viIsUsuarioAlteracaoAttribute then
          begin
            FListaUsuarioAlteracao.Add(viColunaAttribute.Nome);
            Continue;
          end;

          viIsTrimAttribute := viAttribute is FieldTrimAttribute;
          if viIsTrimAttribute then
          begin
            if not (viFieldType = TFieldType.ftString) then
            begin
              viMensagem := string.Format(
                'O campo %s não pode ser mapeado com anotação FieldTrim.',
                [viColunaAttribute.Nome]);

              raise Exception.Create(viMensagem);
            end;

            FListaTrim.Add(viColunaAttribute.Nome);
          end;

          viIsEmptyToNullAttribute := viAttribute is EmptyToNullAttribute;
          if viIsEmptyToNullAttribute then
          begin
            if not (viFieldType = TFieldType.ftString) then
            begin
              viMensagem := string.Format(
                'O campo %s não pode ser mapeado com anotação EmptyToNull.',
                [viColunaAttribute.Nome]);

              raise Exception.Create(viMensagem);
            end;

            FListaEmptyToNull.Add(viColunaAttribute.Nome);
          end;

          viIsDateZeroToNullAttribute := viAttribute is DateZeroToNullAttribute;
          if viIsDateZeroToNullAttribute then
          begin
            if not (viFieldType = TFieldType.ftDateTime) then
            begin
              viMensagem := string.Format(
                'O campo %s não pode ser mapeado com anotação DateZeroToNull.',
                [viColunaAttribute.Nome]);

              raise Exception.Create(viMensagem);
            end;

            FListaDateZeroToNull.Add(viColunaAttribute.Nome);
          end;
        end;
      finally
        FreeAndNil(viField);
      end;
    end;
  finally
    viRttiContext.Free;
  end;
end;

function TTri7Business<T>.PrepararCadastro(
  const vpId: Int64;
  const vpColunas: TArray<string>): TDataSet;
const
  CI_ORDER_BY: TArray<string> = [];

var
  viWhere: string;
  viParams: TArray<TParamValue>;
begin
  Result := nil;
  try
    if vpId > 0 then
    begin
      viWhere := BuscarWhereChavePrimaria;
      viParams := BuscarParamsChavePrimaria(vpId);
    end
    else
    begin
      viWhere := string.Format(
        '%s IS NULL',
        [FChavePrimaria]);

      viParams := [];
    end;

    Result := BuscarQuery(
      0,
      0,
      vpColunas,
      viWhere,
      CI_ORDER_BY,
      viParams);
  except
    FreeAndNil(Result);
    raise;
  end;
end;

function TTri7Business<T>.PrepararCadastroLote(
  const vpListaId: TList<Integer>;
  const vpColunas: TArray<string>): TDataSet;
const
  CI_ORDER_BY: TArray<string> = [];

var
  viWhere: string;
begin
  Result := nil;
  try
    if vpListaId.Count > 0 then
      viWhere := CondicaoList(vpListaId, FChavePrimaria)
    else
    begin
      viWhere := string.Format(
        '%s IS NULL',
        [FChavePrimaria]);
    end;

    Result := BuscarQuery(
      0,
      0,
      vpColunas,
      viWhere,
      CI_ORDER_BY,
      nil);
  except
    FreeAndNil(Result);
    raise;
  end;
end;

function TTri7Business<T>.PrepararExclusao(
  const vpId: Int64;
  const vpColunas: TArray<string>): TDataSet;
begin
  Result := nil;
  try
    Result := PrepararCadastro(
      vpId,
      vpColunas);
  except
    FreeAndNil(Result);
    raise;
  end;
end;

function TTri7Business<T>.ValidarCadastro(
  const vpRegistro: T;
  out vpListaErroValidacao: TObjectList<TErroValidacao>): Boolean;
begin
  vpListaErroValidacao := nil;
  try
    VerificarCadastro(vpRegistro);

    Result := True;
    vpListaErroValidacao := TObjectList<TErroValidacao>.Create;
  except
    FreeAndNil(vpListaErroValidacao);
    raise;
  end;
end;

function TTri7Business<T>.ValidarExclusao(
  const vpRegistro: T;
  out vpListaErroValidacao: TObjectList<TErroValidacao>): Boolean;
begin
  vpListaErroValidacao := nil;
  try
    VerificarExclusao(vpRegistro);

    Result := True;
    vpListaErroValidacao := TObjectList<TErroValidacao>.Create;
  except
    FreeAndNil(vpListaErroValidacao);
    raise;
  end;
end;

procedure TTri7Business<T>.VerificarCadastro(
  const vpRegistro: T);
const
  CI_SET_DATASET_STATE: set of TDataSetState = [
    TDataSetState.dsEdit,
    TDataSetState.dsInsert
  ];

var
  viState: TDataSetState;
  viStateValido: Boolean;
begin
  viState := vpRegistro.DataSet.State;
  viStateValido := viState in CI_SET_DATASET_STATE;

  if not viStateValido then
    raise Exception.CreateFmt(
      'A tabela %s não está em modo de inserção ou edição para realizar o cadastro.',
      [vpRegistro.ClassName]);
end;

procedure TTri7Business<T>.VerificarExclusao(
  const vpRegistro: T);
var
  viState: TDataSetState;
  viStateValido: Boolean;
begin
  viState := vpRegistro.DataSet.State;
  viStateValido := viState = TDataSetState.dsBrowse;

  if not viStateValido then
    raise Exception.CreateFmt(
      'A tabela %s não está em modo de navegação para realizar a exclusão.',
      [vpRegistro.ClassName]);

  if vpRegistro.DataSet.IsEmpty then
    raise Exception.CreateFmt(
      'A tabela %s não possui registro para realizar a exclusão.',
      [vpRegistro.ClassName]);
end;

{ TTri7Entity }

procedure TTri7Entity.CopiarDados(
  const vpDataSet: TDataSet);
begin
  TI9MemTable(FDataSet).CopyDataSet(vpDataSet);
end;

constructor TTri7Entity.Create;
begin
  inherited Create;
  FDataSet := nil;
end;

destructor TTri7Entity.Destroy;
begin
  FreeAndNil(FDataSet);
  inherited;
end;

procedure TTri7Entity.CriarCampos(
  const vpDataSet: TDataSet);
var
  viRttiContext: TRttiContext;
  viRttiType: TRttiType;
  viListaDeclaredField: TArray<TRttiField>;
  viDeclaredField: TRttiField;
  viAttribute: TCustomAttribute;
  viMemberVisibility: TMemberVisibility;
  viListaAttribute: TArray<TCustomAttribute>;
  viIsColunaAttribute: Boolean;
  viColunaAttribute: ColunaAttribute;
  viField: TField;
  viValue: TValue;
  viFieldOrigem: TField;
  viRttiInstanceType: TRttiInstanceType;
  viMetaClassType: TClass;
begin
  viRttiContext := TRttiContext.Create;
  try
    FDataSet := TI9MemTable.Create(nil);
    viRttiType := viRttiContext.GetType(ClassType);
    viListaDeclaredField := viRttiType.GetDeclaredFields;

    for viDeclaredField in viListaDeclaredField do
    begin
      viMemberVisibility := viDeclaredField.Visibility;
      if viMemberVisibility <> TMemberVisibility.mvPublic then
        Continue;

      viListaAttribute := viDeclaredField.GetAttributes;
      for viAttribute in viListaAttribute do
      begin
        viIsColunaAttribute := viAttribute is ColunaAttribute;
        if not viIsColunaAttribute then
          Continue;

        viColunaAttribute := ColunaAttribute(viAttribute);

        viFieldOrigem := vpDataSet.FindField(viColunaAttribute.Nome);
        if not Assigned(viFieldOrigem) then
          Continue;

        viRttiInstanceType := viDeclaredField.FieldType.AsInstance;
        viMetaClassType := viRttiInstanceType.MetaclassType;

        viField := TFieldClass(viMetaClassType).Create(FDataSet);
        viField.FieldName := viFieldOrigem.FieldName;
        viField.DataSet := FDataSet;

        if viFieldOrigem.DataType in [TFieldType.ftString, TFieldType.ftWideString] then
          viField.Size := viFieldOrigem.Size;

        viValue := TValue.From<TField>(viField);
        viDeclaredField.SetValue(Self, viValue);
        Break;
      end;
    end;

    FDataSet.Open;
  finally
    viRttiContext.Free;
  end;
end;

{ ColunaAttribute }

constructor ColunaAttribute.Create(
  const vpNome: string);
begin
  inherited Create;
  FNome := vpNome;
end;

{ EnumeradoAttribute }

constructor EnumeradoAttribute.Create(
  const vpValor: string;
  const vpDescricao: string);
begin
  inherited Create;
  FValor := vpValor;
  FDescricao := vpDescricao;
end;

{ TTri7Util }

class function TTri7Util.BuscarEnum<T>(
  const vpEnumValor: string): T;
var
  viRttiContext: TRttiContext;
  viTypeInfo: Pointer;
  viRttiType: TRttiType;
  viRttiEnumerationType: TRttiEnumerationType;
  viAttribute: TCustomAttribute;
  viEnumeradoAttribute: EnumeradoAttribute;
  viIndex: Integer;
  viName: string;
begin
  viRttiContext := TRttiContext.Create;
  try
    viTypeInfo := TypeInfo(T);
    viRttiType := viRttiContext.GetType(viTypeInfo);
    viRttiEnumerationType := TRttiEnumerationType(viRttiType);

    if Length(viRttiEnumerationType.GetAttributes) = 0 then
      raise Exception.CreateFmt(
        'Não foi possível carregar os atributos do tipo %s',
        [viRttiType.Name]);

    for viIndex := 0 to Length(viRttiEnumerationType.GetAttributes) - 1 do
    begin
      viAttribute := viRttiEnumerationType.GetAttributes[viIndex];
      viEnumeradoAttribute := EnumeradoAttribute(viAttribute);

      if viEnumeradoAttribute.Valor = vpEnumValor then
      begin
        viName := viRttiEnumerationType.GetNames[viIndex];
        Result := viRttiEnumerationType.GetValue<T>(viName);
        Exit;
      end;
    end;

    raise Exception.CreateFmt(
      'Não foi possível mapear o valor %s para o tipo %s',
      [vpEnumValor, viRttiType.Name]);

  finally
    viRttiContext.Free;
  end;
end;

class function TTri7Util.BuscarEnumDescricao<T>(
  const vpEnum: T): string;
var
  viRttiContext: TRttiContext;
  viTypeInfo: Pointer;
  viRttiType: TRttiType;
  viRttiEnumerationType: TRttiEnumerationType;
  viAttribute: TCustomAttribute;
  viEnumeradoAttribute: EnumeradoAttribute;
  viIndex: Integer;
  viName: string;
begin
  viRttiContext := TRttiContext.Create;
  try
    viTypeInfo := TypeInfo(T);
    viRttiType := viRttiContext.GetType(viTypeInfo);
    viRttiEnumerationType := TRttiEnumerationType(viRttiType);
    viName := viRttiEnumerationType.GetName<T>(vpEnum);

    viIndex := IndexText(
      viName,
      viRttiEnumerationType.GetNames);

    if Length(viRttiEnumerationType.GetAttributes) <> Length(viRttiEnumerationType.GetNames) then
      raise Exception.CreateFmt(
        'Não foi possível carregar os atributos do tipo %s',
        [viRttiType.Name]);

    viAttribute := viRttiEnumerationType.GetAttributes[viIndex];
    viEnumeradoAttribute := EnumeradoAttribute(viAttribute);

    Result := viEnumeradoAttribute.Descricao;
  finally
    viRttiContext.Free;
  end;
end;

class function TTri7Util.BuscarEnumByDescricao<T>(
  const vpEnumDescricao: string): T;
var
  viRttiContext: TRttiContext;
  viTypeInfo: Pointer;
  viRttiType: TRttiType;
  viRttiEnumerationType: TRttiEnumerationType;
  viAttribute: TCustomAttribute;
  viEnumeradoAttribute: EnumeradoAttribute;
  viIndex: Integer;
  viName: string;
begin
  viRttiContext := TRttiContext.Create;
  try
    viTypeInfo := TypeInfo(T);
    viRttiType := viRttiContext.GetType(viTypeInfo);
    viRttiEnumerationType := TRttiEnumerationType(viRttiType);

    if Length(viRttiEnumerationType.GetAttributes) = 0 then
      raise Exception.CreateFmt(
        'Não foi possível carregar os atributos do tipo %s',
        [viRttiType.Name]);

    for viIndex := 0 to Length(viRttiEnumerationType.GetAttributes) - 1 do
    begin
      viAttribute := viRttiEnumerationType.GetAttributes[viIndex];
      viEnumeradoAttribute := EnumeradoAttribute(viAttribute);

      if viEnumeradoAttribute.Descricao = vpEnumDescricao then
      begin
        viName := viRttiEnumerationType.GetNames[viIndex];
        Result := viRttiEnumerationType.GetValue<T>(viName);
        Exit;
      end;
    end;

    raise Exception.CreateFmt(
      'Não foi possível mapear a descrição %s para o tipo %s',
      [vpEnumDescricao, viRttiType.Name]);

  finally
    viRttiContext.Free;
  end;
end;

class function TTri7Util.BuscarEnumDescricao<T>(
  const vpEnumValor: string): string;
var
  viEnum: T;
begin
  viEnum := BuscarEnum<T>(vpEnumValor);
  Result := BuscarEnumDescricao<T>(viEnum);
end;

class function TTri7Util.BuscarEnumValor<T>(
  const vpEnum: T): string;
var
  viRttiContext: TRttiContext;
  viTypeInfo: Pointer;
  viRttiType: TRttiType;
  viRttiEnumerationType: TRttiEnumerationType;
  viAttribute: TCustomAttribute;
  viEnumeradoAttribute: EnumeradoAttribute;
  viIndex: Integer;
  viName: string;
begin
  viRttiContext := TRttiContext.Create;
  try
    viTypeInfo := TypeInfo(T);
    viRttiType := viRttiContext.GetType(viTypeInfo);
    viRttiEnumerationType := TRttiEnumerationType(viRttiType);
    viName := viRttiEnumerationType.GetName<T>(vpEnum);

    viIndex := IndexText(
      viName,
      viRttiEnumerationType.GetNames);

    if Length(viRttiEnumerationType.GetAttributes) <> Length(viRttiEnumerationType.GetNames) then
      raise Exception.CreateFmt(
        'Não foi possível carregar os atributos do tipo %s',
        [viRttiType.Name]);

    viAttribute := viRttiEnumerationType.GetAttributes[viIndex];
    viEnumeradoAttribute := EnumeradoAttribute(viAttribute);

    Result := viEnumeradoAttribute.Valor;
  finally
    viRttiContext.Free;
  end;
end;

class function TTri7Util.CompressString(
  const vpString: AnsiString): AnsiString;
var
  Utf8Stream: TStringStream;
  Compressed: TMemoryStream;
  Base64Stream: TStringStream;
begin
  Utf8Stream := TStringStream.Create(vpString, TEncoding.UTF8);
  try
    Compressed := TMemoryStream.Create;
    try
      ZCompressStream(Utf8Stream, Compressed);
      Compressed.Position := 0;
      Base64Stream := TStringStream.Create('', TEncoding.ASCII);
      try
        EncodeStream(Compressed, Base64Stream);
        Result := Base64Stream.DataString;
      finally
        Base64Stream.Free;
      end;
    finally
      Compressed.Free;
    end;
  finally
    Utf8Stream.Free;
  end;
end;

class function TTri7Util.CompressStringStream(const vpString: AnsiString): TStringStream;
var
  Utf8Stream: TStringStream;
  Compressed: TMemoryStream;
  Base64Stream: TStringStream;
begin
  Utf8Stream := TStringStream.Create(vpString, TEncoding.UTF8);
  try
    Compressed := TMemoryStream.Create;
    try
      ZCompressStream(Utf8Stream, Compressed);
      Compressed.Position := 0;
      Base64Stream := TStringStream.Create('', TEncoding.ASCII);
      EncodeStream(Compressed, Base64Stream);
      Result := Base64Stream;
    finally
      Compressed.Free;
    end;
  finally
    Utf8Stream.Free;
  end;
end;

class function TTri7Util.DeCompressString(
  const vpString: string): string;
var
  Utf8Stream: TStringStream;
  Compressed: TMemoryStream;
  Base64Stream: TStringStream;
begin
  try
    if (vpString <> '') and (Pos('{\rtf',string(vpString)) = 0) and (Pos('<?xml',string(vpString)) = 0) and (vpString <> #0) then
    begin
      Base64Stream := TStringStream.Create(vpString, TEncoding.ASCII);
      try
        Compressed := TMemoryStream.Create;
        try
          DecodeStream(Base64Stream, Compressed);
          Compressed.Position := 0;
          Utf8Stream := TStringStream.Create('', TEncoding.UTF8);
          try
            ZDecompressStream(Compressed, Utf8Stream);
            Result := Utf8Stream.DataString;
          finally
            Utf8Stream.Free;
          end;
        finally
          Compressed.Free;
        end;
      finally
        Base64Stream.Free;
      end;
    end
    else
      Result := DeCompressStringOld(vpString);
  except
    Result := DeCompressStringOld(vpString);
  end;
end;

class function TTri7Util.DeCompressStringOld(Source: AnsiString): string;
var
  ms: tMemoryStream;
  Decomp: TZDecompressionStream;
  C: AnsiChar;
begin
  Result := '';
  ms := nil;
  Decomp := nil;

  try
    if (Source <> '') and (Pos('{\rtf',string(Source)) = 0) and (Pos('<?xml',string(Source)) = 0) and (Source <> #0) then
    begin
      ms := tMemoryStream.Create;
      try
        ms.Write ( Source[1],Length(Source));
        ms.position := 0;
        try
          DeComp := TZDecompressionStream.Create(ms);
          try
            while deComp.Read ( c ,1 ) <> 0 DO
            begin
              Result := Result + c;
            end;
          finally
            decomp.free;
          end;
        except
          Result := Source;
        end;
      finally
        ms.free;
      end;
    end
    else Result := Source;
  except
    Result := Source;
    if Assigned(decomp) then
      decomp.free;
    if Assigned(ms) then
      ms.free;
  end;
end;

end.
