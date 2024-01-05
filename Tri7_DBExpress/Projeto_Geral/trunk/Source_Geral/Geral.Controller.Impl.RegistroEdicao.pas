unit Geral.Controller.Impl.RegistroEdicao;

interface

uses
  I9Query,
  I9Connection,
  Geral.Controller.Spec.RegistroEdicao,
  System.JSON,
  Geral.Model.Entity.Spec.Maybe,
  Data.DB,
  Geral.Model.Entity.Spec.DataSet,
  Geral.Model.Entity.Spec.JSON;

type
  TRegistroEdicao = class(TInterfacedObject, IRegistroEdicao)
  private
    FTabela: string;
    FChave: Integer;
    FCampo: string;

    function CreateJSON(
      const vpDataSet: TDataSet): IJSONAPI<TJSONObject>;

    function RegistroEdicao: IDataSetAPI<TDataSet>;

    function Inserir(
      const vpRegistroEdicao: TDataSet): Integer;
  public
    constructor Create(
      const vpTabela: string;
      const vpChave: Integer;
      const vpCampo: string); reintroduce;

    function TryLock: IJSONAPI<TJSONObject>;
    function VerifyLock: IMaybe<IJSONAPI<TJSONObject>>;

    class function New(
      const vpTabela: string;
      const vpChave: Integer;
      const vpCampo: string): IRegistroEdicao;
  end;

  TDesbloqueioRegistroEdicao = class(TInterfacedObject,
    IDesbloqueioRegistroEdicao)
  private
    FTabela: string;
    FChave: Integer;
    FCampo: string;
    FUsuarioID: Integer;
  public
    constructor Create(
      const vpTabela: string;
      const vpChave: Integer;
      const vpCampo: string;
      const vpUsuarioID: Integer); reintroduce;

    function Unlock: Integer;

    class function New(
      const vpTabela: string;
      const vpChave: Integer;
      const vpCampo: string;
      const vpUsuarioID: Integer): IDesbloqueioRegistroEdicao;
  end;

implementation

uses
  System.SysUtils,
  Geral.Model.Entity.Impl.DataSet,
  FireDAC.Comp.Client,
  Data.SqlExpr,
  Controles,
  Rotinas,
  FireDAC.Comp.DataSet,
  Geral.Model.Entity.Impl.Maybe,
  Geral.Model.Entity.Impl.JSONSource.DataSet,
  Geral.Model.Entity.Impl.JSON;

{ TRegistroEdicao }

constructor TRegistroEdicao.Create(
  const vpTabela: string;
  const vpChave: Integer;
  const vpCampo: string);
begin
  inherited Create;
  FTabela := vpTabela;
  FChave := vpChave;
  FCampo := vpCampo;
end;

function TRegistroEdicao.CreateJSON(
  const vpDataSet: TDataSet): IJSONAPI<TJSONObject>;
begin
  Result := TJSONAPI<TJSONObject>.New(
    TDataSetRecordAsJSONSource<TDataSet>.New(
      vpDataSet)
    .Data)
  .AutoDestroy;
end;

function TRegistroEdicao.Inserir(
  const vpRegistroEdicao: TDataSet): Integer;
{$REGION 'Variáveis'}
var
  viResult: Integer;
{$ENDREGION}
begin
  TDataSetAPI<TI9Query>.New(
    TI9Query.Create(
      nil))
  .AutoClose
  .AutoDestroy
  .ExecuteAction(
    procedure(
      const vpI9Query: TI9Query)
    begin
      vpI9Query.Connection := dtmControles.DB;

      vpI9Query.SQL.Text := {$REGION 'Comando SQL INSERT'}
        'INSERT ' +

        {$REGION 'Cláusula INTO'}
        'INTO ' +
        'G_REGISTRO_EDICAO ' +
        {$ENDREGION}

        {$REGION 'Colunas'}
        '(' +
        'REGISTRO_EDICAO_ID, ' +
        'TABELA, ' +
        'CHAVE, ' +
        'CAMPO, ' +
        'USUARIO_ID, ' +
        'DATA, ' +
        'IP_MAQUINA, ' +
        'NOME_ESTACAO' +
        ') ' +
        {$ENDREGION}

        {$REGION 'Cláusula VALUES e Parâmetros'}
        'VALUES ' +
        '(' +
        ':P_REGISTRO_EDICAO_ID, ' +
        ':P_TABELA, ' +
        ':P_CHAVE, ' +
        ':P_CAMPO, ' +
        ':P_USUARIO_ID, ' +
        ':P_DATA, ' +
        ':P_IP_MAQUINA, ' +
        ':P_NOME_ESTACAO' +
        ')';
        {$ENDREGION}

        {$ENDREGION}

      {$REGION 'Preencher valores dos parâmetros'}
      vpI9Query.ParamByName(
        'P_REGISTRO_EDICAO_ID').AsInteger := vpRegistroEdicao.FieldByName(
          'REGISTRO_EDICAO_ID').AsInteger;

      vpI9Query.ParamByName(
        'P_TABELA').AsString := vpRegistroEdicao.FieldByName(
          'TABELA').AsString;

      vpI9Query.ParamByName(
        'P_CHAVE').AsInteger := vpRegistroEdicao.FieldByName(
          'CHAVE').AsInteger;

      vpI9Query.ParamByName(
        'P_CAMPO').AsString := vpRegistroEdicao.FieldByName(
          'CAMPO').AsString;

      vpI9Query.ParamByName(
        'P_USUARIO_ID').AsInteger := vpRegistroEdicao.FieldByName(
          'USUARIO_ID').AsInteger;

      vpI9Query.ParamByName(
        'P_DATA').AsDateTime := vpRegistroEdicao.FieldByName(
          'DATA').AsDateTime;

      vpI9Query.ParamByName(
        'P_IP_MAQUINA').AsString := vpRegistroEdicao.FieldByName(
          'IP_MAQUINA').AsString;

      vpI9Query.ParamByName(
        'P_NOME_ESTACAO').AsString := vpRegistroEdicao.FieldByName(
          'NOME_ESTACAO').AsString;
      {$ENDREGION}

      viResult := vpI9Query.ExecSQL;
    end);

  Result := viResult;
end;

class function TRegistroEdicao.New(
  const vpTabela: string;
  const vpChave: Integer;
  const vpCampo: string): IRegistroEdicao;
begin
  Result := Create(
    vpTabela,
    vpChave,
    vpCampo);
end;

function TRegistroEdicao.RegistroEdicao: IDataSetAPI<TDataSet>;
begin
  Result := TDataSetAPI<TDataSet>.New(
    TI9Query.Create(
      nil))
  .AutoClose
  .AutoDestroy
  .ExecuteAction(
    procedure(
      const vpDataSet: TDataSet)
    {$REGION 'Variáveis'}
    var
      viSQLDataSet: TI9Query;
    {$ENDREGION}
    begin
      viSQLDataSet := TI9Query(
        vpDataSet);

      viSQLDataSet.Connection := dtmControles.DB;

      viSQLDataSet.SQL.Text := {$REGION 'Comando SQL SELECT'}
        'SELECT ' +

        {$REGION 'Colunas'}
        'G_RE.*, ' +
        'G_U.LOGIN ' +
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_REGISTRO_EDICAO G_RE ' +
        {$ENDREGION}

        {$REGION 'Cláusula INNER JOIN'}
        'INNER JOIN ' +
        'G_USUARIO G_U ' +

        {$REGION 'Cláusula ON'}
        'ON ' +
        'G_U.USUARIO_ID = G_RE.USUARIO_ID ' +
        {$ENDREGION}

        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +
        'G_RE.TABELA = :P_TABELA AND ' +
        'G_RE.CHAVE = :P_CHAVE AND ' +
        'G_RE.CAMPO = :P_CAMPO';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos parâmetros'}
      viSQLDataSet.ParamByName(
        'P_TABELA').AsString := FTabela;

      viSQLDataSet.ParamByName(
        'P_CHAVE').AsInteger := FChave;

      viSQLDataSet.ParamByName(
        'P_CAMPO').AsString := FCampo;
      {$ENDREGION}
    end)
  .Open;
end;

function TRegistroEdicao.TryLock: IJSONAPI<TJSONObject>;
{$REGION 'Variáveis'}
var
  viRegistroEdicao: IDataSetAPI<TDataSet>;
{$ENDREGION}
begin
  viRegistroEdicao := RegistroEdicao;

  if not viRegistroEdicao.DataSet.IsEmpty then
  begin
    Result := CreateJSON(
      viRegistroEdicao.DataSet);

    Exit;
  end;

  viRegistroEdicao := TDataSetAPI<TDataSet>.New(
    TFDMemTable.Create(
      nil))
  .AutoClose
  .AutoDestroy
  .ExecuteAction(
    procedure(
      const vpDataSet: TDataSet)
    begin
      TFDMemTable(
        vpDataSet)
      .CopyDataSet(
        viRegistroEdicao.DataSet,
        [coStructure]);
    end)
  .Open
  .Append
  .ExecuteAction(
    procedure(
      const vpResult: TDataSet)
    begin
      vpResult.FieldByName(
        'REGISTRO_EDICAO_ID').AsInteger := dtmControles.GerarSequencia(
          'G_REGISTRO_EDICAO');

      vpResult.FieldByName(
        'TABELA').AsString := FTabela;

      vpResult.FieldByName(
        'CHAVE').AsInteger := FChave;

      vpResult.FieldByName(
        'CAMPO').AsString := FCampo;

      vpResult.FieldByName(
        'USUARIO_ID').AsInteger := vgUsuarioID.ToInteger;

      vpResult.FieldByName(
        'LOGIN').AsString := vgLogin;

      vpResult.FieldByName(
        'DATA').AsDateTime := dtmControles.DataHoraBanco(
          3);

      vpResult.FieldByName(
        'IP_MAQUINA').AsString := Rotinas.RetornaIP;

      vpResult.FieldByName(
        'NOME_ESTACAO').AsString := Rotinas.NomeEstacao;
    end)
  .Post;

  Inserir(
    viRegistroEdicao.DataSet);

  Result := CreateJSON(
    viRegistroEdicao.DataSet);
end;

function TRegistroEdicao.VerifyLock: IMaybe<IJSONAPI<TJSONObject>>;
{$REGION 'Variáveis'}
var
  viRegistroEdicao: IDataSetAPI<TDataSet>;
{$ENDREGION}
begin
  viRegistroEdicao := RegistroEdicao;

  if viRegistroEdicao.DataSet.IsEmpty then
    Exit(
      TNone<IJSONAPI<TJSONObject>>.New);

  Result := TSome<IJSONAPI<TJSONObject>>.New(
    CreateJSON(
      viRegistroEdicao.DataSet));
end;

{ TDesbloqueioRegistroEdicao }

constructor TDesbloqueioRegistroEdicao.Create(
  const vpTabela: string;
  const vpChave: Integer;
  const vpCampo: string;
  const vpUsuarioID: Integer);
begin
  inherited Create;
  FTabela := vpTabela;
  FChave := vpChave;
  FCampo := vpCampo;
  FUsuarioID := vpUsuarioID;
end;

class function TDesbloqueioRegistroEdicao.New(
  const vpTabela: string;
  const vpChave: Integer;
  const vpCampo: string;
  const vpUsuarioID: Integer): IDesbloqueioRegistroEdicao;
begin
  Result := Create(
    vpTabela,
    vpChave,
    vpCampo,
    vpUsuarioID);
end;

function TDesbloqueioRegistroEdicao.Unlock: Integer;
{$REGION 'Variáveis'}
var
  viResult: Integer;
{$ENDREGION}
begin
  TDataSetAPI<TI9Query>.New(
    TI9Query.Create(
      nil))
  .AutoDestroy
  .ExecuteAction(
    procedure(
      const vpI9Query: TI9Query)
    begin
      vpI9Query.Connection := dtmControles.DB;

      vpI9Query.SQL.Text := {$REGION 'Comando SQL DELETE'}
        'DELETE ' +

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_REGISTRO_EDICAO ' +
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +
        'TABELA = :P_TABELA AND ' +
        'CHAVE = :P_CHAVE AND ' +
        'CAMPO = :P_CAMPO AND ' +
        'USUARIO_ID = :P_USUARIO_ID';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos parâmetros'}
      vpI9Query.ParamByName(
        'P_TABELA').AsString := FTabela;

      vpI9Query.ParamByName(
        'P_CHAVE').AsInteger := FChave;

      vpI9Query.ParamByName(
        'P_CAMPO').AsString := FCampo;

      vpI9Query.ParamByName(
        'P_USUARIO_ID').AsInteger := FUsuarioID;
      {$ENDREGION}

      viResult := vpI9Query.ExecSQL;
    end);

  Result := viResult;
end;

end.
