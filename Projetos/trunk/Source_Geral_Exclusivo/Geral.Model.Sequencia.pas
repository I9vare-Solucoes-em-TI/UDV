unit Geral.Model.Sequencia;

interface

uses
  Geral.Model.ConexaoDb,
  Data.DB;

type
  TSequenciaBusiness = class
  private
    FConexaoDb: TConexaoDb;

    function BuscarSequencia(
      const vpTabela: string): TDataSet;

    procedure Aguardar;
  public
    constructor Create(
      const vpConexaoDb: TConexaoDb); reintroduce;

    function GerarSequencia(
      const vpTabela: string): Integer;

    function VoltarSequencia(
      const vpTabela: string): Integer;

    procedure AtualizarOuInserirSequencia(
      const vpTabela: string;
      const vpSequencia: Integer);

    procedure AtualizarOuInserirSequenciaMax(
      const vpTabela: string;
      const vpTabelaMax: string;
      const vpChave: string);
  end;

implementation

uses
  I9StoredProc,
  System.SysUtils,
  Geral.Model.Impl.QueryBuilder.I9,
  System.Math,
  I9Query;

{ TSequenciaBusiness }

procedure TSequenciaBusiness.Aguardar;
var
  viRandom: Integer;
begin
  Randomize;
  viRandom := RandomRange(10, 100);
  Sleep(viRandom);
end;

procedure TSequenciaBusiness.AtualizarOuInserirSequencia(
  const vpTabela: string;
  const vpSequencia: Integer);
var
  viInTransaction: Boolean;
begin
  viInTransaction := FConexaoDb.Connection.InTransaction;
  if not viInTransaction then
    FConexaoDb.Connection.StartTransaction;

  try
    FConexaoDb.Connection.ExecSQL(
      'UPDATE OR INSERT INTO G_SEQUENCIA ' +
      '(TABELA, SEQUENCIA) ' +
      'VALUES (:P_TABELA, :P_SEQUENCIA) ' +
      'MATCHING (TABELA)',
      [vpTabela,
      vpSequencia]);

    if not viInTransaction then
      FConexaoDb.Connection.Commit;
  except
    if not viInTransaction then
      FConexaoDb.Connection.Rollback;

    raise
  end;
end;

procedure TSequenciaBusiness.AtualizarOuInserirSequenciaMax(
  const vpTabela: string;
  const vpTabelaMax: string;
  const vpChave: string);
var
  viQuery: TI9Query;
  viInTransaction: Boolean;
begin
  viQuery := nil;
  try
    viInTransaction := FConexaoDb.Connection.InTransaction;
    if not viInTransaction then
      FConexaoDb.Connection.StartTransaction;

    try
      viQuery := TI9Query.Create(nil);
      viQuery.Connection := FConexaoDb.Connection;

      viQuery.SQL.Text := {$REGION 'Comando SQL UPDATE OR INSERT'}
        string.Format(
          'UPDATE OR INSERT INTO G_SEQUENCIA ( '+
          '    TABELA, '+
          '    SEQUENCIA) '+
          'VALUES ( '+
          '    :TABELA, '+
          '    (SELECT '+
          '         COALESCE(MAX(%s), 0) '+
          '     FROM '+
          '         %s)) '+
          'MATCHING ( '+
          '    TABELA) ',
          [vpChave,
          vpTabelaMax]);
      {$ENDREGION}

      viQuery.ParamByName('TABELA').AsString := vpTabela;
      viQuery.ExecSQL;

      if not viInTransaction then
        FConexaoDb.Connection.Commit;
    except
      if not viInTransaction then
        FConexaoDb.Connection.Rollback;

      raise;
    end;
  finally
    FreeAndNil(viQuery);
  end;
end;

function TSequenciaBusiness.BuscarSequencia(
  const vpTabela: string): TDataSet;
var
  viSql: string;
  viParams: TArray<TParamValue>;
begin
  Result := nil;
  try
    viSql := {$REGION 'SQL'}
      'SELECT '+
      '    G_S.TABELA, '+
      '    G_S.SEQUENCIA '+
      'FROM '+
      '    G_SEQUENCIA G_S '+
      'WHERE '+
      '    G_S.TABELA = :TABELA FOR UPDATE WITH LOCK ';
    {$ENDREGION}

    viParams := [
      NewParam('TABELA', vpTabela)
    ];

    Result := TI9QueryBuilder.New(FConexaoDb.Connection)
      .Sql(viSql)
      .Params(viParams)
      .Open;

    if Result.IsEmpty then
      raise Exception.CreateFmt(
        'Não foi possível encontrar a sequência da tabela %s.',
        [vpTabela]);
  except
    FreeAndNil(Result);
    raise;
  end;
end;

constructor TSequenciaBusiness.Create(
  const vpConexaoDb: TConexaoDb);
begin
  inherited Create;
  FConexaoDb := vpConexaoDb;
end;

function TSequenciaBusiness.GerarSequencia(
  const vpTabela: string): Integer;
var
  viInTransaction: Boolean;
  viStoredProc: TI9StoredProc;
begin
  Result := 0;
  viStoredProc := nil;

  try
    viInTransaction := FConexaoDb.Connection.InTransaction;
    if not viInTransaction then
      FConexaoDb.Connection.StartTransaction;

    try
      viStoredProc := TI9StoredProc.Create(nil);
      viStoredProc.Connection := FConexaoDb.Connection;
      viStoredProc.StoredProcName := 'G_SP_SEQUENCIAS';
      viStoredProc.Prepare;

      viStoredProc.ParamByName('TABELA').AsString := vpTabela;

      Aguardar;
      viStoredProc.ExecProc;

      if not viInTransaction then
        FConexaoDb.Connection.Commit;

      Result := viStoredProc.ParamByName('SEQUENCIA').AsInteger;
    except
      if not viInTransaction then
        FConexaoDb.Connection.Rollback;

      raise;
    end;
  finally
    FreeAndNil(viStoredProc);
  end;
end;

function TSequenciaBusiness.VoltarSequencia(
  const vpTabela: string): Integer;
var
  viSequencia: TDataSet;
  viInTransaction: Boolean;
  viCampo: TField;
  viNovaSequencia: Integer;
begin
  Result := 0;
  viSequencia := nil;

  try
    viInTransaction := FConexaoDb.Connection.InTransaction;
    if not viInTransaction then
      FConexaoDb.Connection.StartTransaction;

    try
      Aguardar;
      viSequencia := BuscarSequencia(vpTabela);
      viCampo := viSequencia.FieldByName('SEQUENCIA');

      viNovaSequencia := viCampo.AsInteger;
      Dec(viNovaSequencia);

      viSequencia.Edit;
      viCampo.AsInteger := viNovaSequencia;
      viSequencia.Post;

      Result := viNovaSequencia;

      if not viInTransaction then
        FConexaoDb.Connection.Commit;
    except
      if not viInTransaction then
        FConexaoDb.Connection.Rollback;

      raise;
    end;
  finally
    FreeAndNil(viSequencia);
  end;
end;

end.
