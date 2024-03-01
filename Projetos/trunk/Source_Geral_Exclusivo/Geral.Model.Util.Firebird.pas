unit Geral.Model.Util.Firebird;

interface

uses
  I9Connection,
  System.Generics.Collections;

type
  TFirebirdUtil = class
  private
    FConexao: TI9Connection;

    function ExisteRestricao(
      const vpNome: string): Boolean;

    function BuscarVersaoFirebird: string;

    procedure AdicionarColuna(
      const vpTabela: string;
      const vpColuna: string;
      const vpTipo: string);

    procedure AdicionarRestricaoUnica(
      const vpTabela: string;
      const vpNome: string;
      const vpColunas: TArray<string>);

  public
    constructor Create(
      const vpConexao: TI9Connection); reintroduce;

    function ExisteColuna(
      const vpTabela: string;
      const vpColuna: string): Boolean;

    function BuscarDataHoraBanco: TDateTime;

    class function IncrementarGenerator(
      const vpConexao: TI9Connection;
      const vpGenerator: string): Integer;

    procedure RecomputarIndices(
      const vpTabela: string);

    procedure VerificarAdicaoColuna(
      const vpTabela: string;
      const vpColuna: string;
      const vpTipo: string);

    procedure VerificarAdicaoRestricaoUnica(
      const vpTabela: string;
      const vpNome: string;
      const vpColunas: TArray<string>);

    procedure AlterarCampo(
      const vpTabela: string;
      const vpCampo: string;
      const vpNotNul: Boolean);

    function ExisteIndice(
      const vpIndice: string): Boolean;

    function ExisteConstraint(
      const vpTabela: string;
      const vpContraintNome: string): Boolean;

    class function CondicaoListIN(
      const vpIDsList: TList<Integer>;
      const vpCampo: string): string; overload;

    class function CondicaoListIN(
      const vpIDsList: TArray<string>;
      const vpCampo: string): string;overload;

    procedure VerificarAdicaoIndice(
      const vpIndice: string;
      const vpTabela: string;
      const vpColuna: string);
  end;

implementation

uses
  I9Query,
  System.SysUtils,
  System.StrUtils,
  Data.DB,
  System.Classes,
  Geral.Model.Util.List,
  Geral.Model.Util.Str;

{ TFirebirdUtil }

procedure TFirebirdUtil.VerificarAdicaoColuna(
  const vpTabela: string;
  const vpColuna: string;
  const vpTipo: string);
var
  viExisteColuna: Boolean;
begin
  viExisteColuna := ExisteColuna(
    vpTabela,
    vpColuna);

  if viExisteColuna then
    Exit;

  AdicionarColuna(
    vpTabela,
    vpColuna,
    vpTipo);
end;

procedure TFirebirdUtil.VerificarAdicaoIndice(
  const vpIndice: string;
  const vpTabela: string;
  const vpColuna: string);
var
  viQuery: TI9Query;
  viExisteIndice: Boolean;
begin
  viQuery := nil;
  try
    viExisteIndice := ExisteIndice(vpIndice);
    if viExisteIndice then
      Exit;

    viQuery := TI9Query.Create(nil);
    viQuery.Connection := FConexao;

    viQuery.SQL.Text := string.Format(
      'CREATE INDEX %s ON %s (%s)',
      [vpIndice,
      vpTabela,
      vpColuna]);

    viQuery.ExecSQL;
  finally
    FreeAndNil(viQuery);
  end;
end;

procedure TFirebirdUtil.VerificarAdicaoRestricaoUnica(
  const vpTabela: string;
  const vpNome: string;
  const vpColunas: TArray<string>);
var
  viExisteRestricao: Boolean;
begin
  viExisteRestricao := ExisteRestricao(vpNome);
  if viExisteRestricao then
    Exit;

  AdicionarRestricaoUnica(
    vpTabela,
    vpNome,
    vpColunas);
end;

procedure TFirebirdUtil.AdicionarColuna(
  const vpTabela: string;
  const vpColuna: string;
  const vpTipo: string);
var
  viQuery: TI9Query;
begin
  viQuery := nil;
  try
    viQuery := TI9Query.Create(nil);
    viQuery.Connection := FConexao;

    viQuery.SQL.Text := string.Format(
      'ALTER TABLE %s ADD %s %s',
      [vpTabela,
      vpColuna,
      vpTipo]);

    viQuery.ExecSQL;
  finally
    FreeAndNil(viQuery);
  end;
end;

procedure TFirebirdUtil.AdicionarRestricaoUnica(
  const vpTabela: string;
  const vpNome: string;
  const vpColunas: TArray<string>);
var
  viQuery: TI9Query;
  viColunas: string;
begin
  viQuery := nil;
  try
    viQuery := TI9Query.Create(nil);
    viQuery.Connection := FConexao;

    viColunas := string.Join(
      ',',
      vpColunas);

    viQuery.SQL.Text := string.Format(
      'ALTER TABLE %s ADD CONSTRAINT %s UNIQUE (%s)',
      [vpTabela,
      vpNome,
      viColunas]);

    viQuery.ExecSQL;
  finally
    FreeAndNil(viQuery);
  end;
end;

procedure TFirebirdUtil.AlterarCampo(
  const vpTabela: string;
  const vpCampo: string;
  const vpNotNul: Boolean);
var
  viQuery: TI9Query;
  viVersao: string;
  viSql: string;
  viNumeroVersao: string;
begin
  viQuery := nil;
  try
    viVersao := BuscarVersaoFirebird;
    viNumeroVersao := viVersao[1];

    if viNumeroVersao = '3' then
      viSql := 'ALTER TABLE '+ vpTabela + ' ALTER ' + vpCampo + IfThen(vpNotNul, ' SET NOT NULL', ' DROP NOT NULL ')
    else
    begin
      viSql :=
        'UPDATE '+
        '    RDB$RELATION_FIELDS '+
        'SET '+
        '    RDB$NULL_FLAG = ' + IfThen(vpNotNul, '1', '0') +
        'WHERE '+
        '    (RDB$FIELD_NAME = ' + QuotedStr(vpCampo) + ' ) AND '+
        '    (RDB$RELATION_NAME = ' + QuotedStr(vpTabela) + ' ) ';
    end;

    viQuery := TI9Query.Create(nil);
    viQuery.Connection := FConexao;
    viQuery.SQL.Text := viSql;
    viQuery.ExecSQL;
  finally
    FreeAndNil(viQuery);
  end;
end;

function TFirebirdUtil.BuscarDataHoraBanco: TDateTime;
var
  viQuery: TI9Query;
begin
  viQuery := nil;
  try
    viQuery := TI9Query.Create(nil);
    viQuery.Connection := FConexao;

    viQuery.SQL.Text := {$REGION 'SQL'}
      'SELECT '+
      '    CURRENT_TIMESTAMP AS DATA_HORA '+
      'FROM '+
      '    RDB$DATABASE ';
    {$ENDREGION}

    viQuery.Open;

    Result := viQuery.FieldByName('DATA_HORA').AsDateTime;
  finally
    FreeAndNil(viQuery);
  end;
end;

function TFirebirdUtil.BuscarVersaoFirebird: string;
var
  viQuery: TI9Query;
begin
  viQuery := nil;
  try
    viQuery := TI9Query.Create(nil);
    viQuery.Connection := FConexao;

    viQuery.SQL.Text := {$REGION 'SQL'}
      'SELECT '+
      '    RDB$GET_CONTEXT(''SYSTEM'', ''ENGINE_VERSION'') AS VERSAO '+
      'FROM '+
      '    RDB$DATABASE ';
    {$ENDREGION}

    viQuery.Open;

    Result := viQuery.FieldByName('VERSAO').AsString;
  finally
    FreeAndNil(viQuery);
  end;
end;

class function TFirebirdUtil.CondicaoListIN(
  const vpIDsList: TList<Integer>;
  const vpCampo: string): string;
var
  viListaListaIds: TList<TList<Integer>>;
  viListaIdPaginada: TList<Integer>;
  viListaCondicao: TStrings;
  viCondicao: string;
  viValorListaInteiro: string;
begin
  Result := string.Empty;
  viListaListaIds := nil;
  viListaCondicao := nil;

  try
    if vpIDsList.Count = 0 then
      Exit;

    viListaListaIds := TListUtil.Paginar<Integer>(
      vpIDsList,
      1500);

    viListaCondicao := TStringList.Create;

    for viListaIdPaginada in viListaListaIds do
    begin
      viValorListaInteiro := TUtilString.RetornarValorListaInteiro(
        viListaIdPaginada,
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
    FreeAndNil(viListaListaIds);
    FreeAndNil(viListaCondicao);
  end;
end;

class function TFirebirdUtil.CondicaoListIN(
  const vpIDsList: TArray<string>;
  const vpCampo: string): string;
var
  viListaId: TList<Integer>;
  viId: string;
begin
  viListaId := nil;
  try
    viListaId := TList<Integer>.Create;

    for viId in vpIDsList do
      viListaId.Add(viId.ToInteger);

    Result := CondicaoListIN(
      viListaId,
      vpCampo);
  finally
    FreeAndNil(viListaId);
  end;
end;

constructor TFirebirdUtil.Create(
  const vpConexao: TI9Connection);
begin
  inherited Create;
  FConexao := vpConexao;
end;

function TFirebirdUtil.ExisteColuna(
  const vpTabela: string;
  const vpColuna: string): Boolean;
var
  viQuery: TI9Query;
begin
  viQuery := nil;
  try
    viQuery := TI9Query.Create(nil);
    viQuery.Connection := FConexao;

    viQuery.SQL.Text := {$REGION 'SQL'}
      'SELECT FIRST 1 '+
      '    1 '+
      'FROM '+
      '    RDB$RELATION_FIELDS RF '+
      'WHERE '+
      '    RF.RDB$RELATION_NAME = :TABELA AND '+
      '    RF.RDB$FIELD_NAME = :COLUNA ';
    {$ENDREGION}

    viQuery.ParamByName('TABELA').AsString := vpTabela;
    viQuery.ParamByName('COLUNA').AsString := vpColuna;
    viQuery.Open;

    Result := not viQuery.IsEmpty;
  finally
    FreeAndNil(viQuery);
  end;
end;

function TFirebirdUtil.ExisteConstraint(
  const vpTabela: string;
  const vpContraintNome: string): Boolean;
var
  viQuery: TI9Query;
begin
  viQuery := nil;
  try
    viQuery := TI9Query.Create(nil);
    viQuery.Connection := FConexao;

    viQuery.SQL.Text := {$REGION 'SELECT'}
      'SELECT FIRST 1 '+
      '    1 '+
      'FROM '+
      '    RDB$RELATION_CONSTRAINTS '+
      'WHERE '+
      '    RDB$CONSTRAINT_NAME = :P_CONSTRAINT_NAME AND '+
      '    RDB$RELATION_NAME = :P_TABELA; ';
    {$ENDREGION}

    viQuery.ParamByName('P_CONSTRAINT_NAME').AsString := vpContraintNome;
    viQuery.ParamByName('P_TABELA').AsString := vpTabela;
    viQuery.Open;

    Result := not viQuery.IsEmpty;
  finally
    FreeAndNil(viQuery);
  end;
end;

function TFirebirdUtil.ExisteIndice(
  const vpIndice: string): Boolean;
var
  viQuery: TI9Query;
begin
  viQuery := nil;
  try
    viQuery := TI9Query.Create(nil);
    viQuery.Connection := FConexao;

    viQuery.SQL.Text := {$REGION 'SELECT'}
      'SELECT '+
      '    RDB$INDEX_NAME '+
      'FROM '+
      '    RDB$INDICES '+
      'WHERE '+
      '    RDB$INDEX_NAME = :P_INDICE ';
    {$ENDREGION}

    viQuery.ParamByName('P_INDICE').AsString := vpIndice;
    viQuery.Open;

    Result := not viQuery.IsEmpty;
  finally
    FreeAndNil(viQuery);
  end;
end;

function TFirebirdUtil.ExisteRestricao(
  const vpNome: string): Boolean;
var
  viQuery: TI9Query;
begin
  viQuery := nil;
  try
    viQuery := TI9Query.Create(nil);
    viQuery.Connection := FConexao;

    viQuery.SQL.Text := {$REGION 'SQL'}
      'SELECT FIRST 1 '+
      '    1 '+
      'FROM '+
      '    RDB$RELATION_CONSTRAINTS RC '+
      'WHERE '+
      '    RC.RDB$CONSTRAINT_NAME = :NOME ';
    {$ENDREGION}

    viQuery.ParamByName('NOME').AsString := vpNome;
    viQuery.Open;

    Result := not viQuery.IsEmpty;
  finally
    FreeAndNil(viQuery);
  end;
end;

class function TFirebirdUtil.IncrementarGenerator(
  const vpConexao: TI9Connection;
  const vpGenerator: string): Integer;
var
  viQuery: TI9Query;
begin
  viQuery := nil;
  try
    viQuery := TI9Query.Create(nil);
    viQuery.Connection := vpConexao;
    viQuery.SQL.Text := 'SELECT GEN_ID(' + vpGenerator + ', 1) FROM RDB$DATABASE';
    viQuery.Open;

    Result := viQuery.FieldByName('GEN_ID').AsInteger;
  finally
    FreeAndNil(viQuery);
  end;
end;

procedure TFirebirdUtil.RecomputarIndices(
  const vpTabela: string);
var
  viQuery: TI9Query;
begin
  viQuery := nil;
  try
    viQuery := TI9Query.Create(nil);
    viQuery.Connection := FConexao;

    viQuery.SQL.Text := {$REGION 'SQL'}
      'EXECUTE BLOCK ( '+
      '    RELATION_NAME VARCHAR(31) = :RELATION_NAME) '+
      'AS '+
      'DECLARE VARIABLE INDEX_NAME VARCHAR(31); '+
      'BEGIN '+
      '  FOR SELECT '+
      '          RDB$INDEX_NAME '+
      '      FROM '+
      '          RDB$INDICES '+
      '      WHERE '+
      '          RDB$RELATION_NAME = :RELATION_NAME '+
      '      INTO '+
      '          :INDEX_NAME '+
      '  DO '+
      '  BEGIN '+
      '    EXECUTE STATEMENT ''SET STATISTICS INDEX '' || :INDEX_NAME; '+
      '  END '+
      'END ';
    {$ENDREGION}

    viQuery.ParamByName('RELATION_NAME').AsString := vpTabela;
    viQuery.ExecSQL;
  finally
    FreeAndNil(viQuery);
  end;
end;

end.
