unit SeloLivroDAO;

interface

uses
  I9Query,
  I9Query,
  I9Connection,
  Data.SqlExpr,
  IntegerList,
  SeloLivroList,
  SeloLivro,
  SeloSituacao;

type
  TSeloLivroDAO = class
  private
    FConnection: TI9Connection;
  public
    constructor Create(
      const vpConnection: TI9Connection); reintroduce;

    function GetCount(
      const vpSeloSituacao: ISeloSituacao;
      const vpTabela: string;
      const vpCampoID: Integer): Integer;

    function GetList(
      const vpTabela: string;
      const vpIntegerList: TIntegerList): TSeloLivroList; overload;

    function Get(
      const vpSeloLivroID: Integer): ISeloLivro; overload;
  end;

implementation

{$WARN CONSTRUCTING_ABSTRACT OFF}

uses
  Data.DB,
  IntegerListHelper,
  SeloLote,
  SeloGrupo,
  UsuarioDAOImpl,
  System.SysUtils,
  BooleanHelper,
  SeloLivroImpl,
  SeloSituacaoDAO,
  SeloLoteDAO;

{ TSeloLivroDAO }

constructor TSeloLivroDAO.Create(
  const vpConnection: TI9Connection);
begin
  inherited Create;
  FConnection := vpConnection;
end;

function TSeloLivroDAO.GetList(
  const vpTabela: string;
  const vpIntegerList: TIntegerList): TSeloLivroList;
{$REGION 'Variáveis'}
var
  viSQLDataSet: TI9Query;
  viSeloLivro: ISeloLivro;
{$ENDREGION}
begin
  Result := TSeloLivroList.Create;

  if vpIntegerList.Count = 0 then
    Exit;

  viSQLDataSet := TI9Query.Create(nil);
  viSQLDataSet.Connection := FConnection;

  try
    with viSQLDataSet do
    begin
      {$REGION 'Comando SQL SELECT'}
      SQL.Text :=
        'SELECT ' +

        {$REGION 'Colunas'}
        'SELO_LIVRO_ID, ' +
        'NUMERO, ' +
        'SELO_SITUACAO_ID, ' +
        'DATA, ' +
        'OBSERVACAO, ' +
        'SELO_LOTE_ID, ' +
        'SIGLA, ' +
        'DESCRICAO, ' +
        'CAMPO_ID, ' +
        'USUARIO_ID, ' +
        'NUMERO_AGRUPADOR, ' +
        'APRESENTANTE, ' +
        'IP_MAQUINA, ' +
        'VALOR_EMOLUMENTO, ' +
        'VALOR_TAXA_JUDICIARIA, ' +
        'VALOR_FUNDESP, ' +
        'VALOR_ISSQN, ' +
        'VALIDADOR ' +
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_SELO_LIVRO ' +
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +
        'TABELA = :P_TABELA AND ' +
        'CAMPO_ID IN (' + vpIntegerList.ToString + ');';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_TABELA').AsString := vpTabela;
      {$ENDREGION}

      Open;

      try
        if IsEmpty then
          Exit;

        First;

        while Eof.&Not do
          try
            viSeloLivro := TSeloLivro.Create;

            with viSeloLivro do
            begin
              SeloLivroID := FieldByName('SELO_LIVRO_ID').AsInteger;
              Numero := FieldByName('NUMERO').AsInteger;

              if FieldByName('SELO_SITUACAO_ID').IsNull.&Not then
                with TSeloSituacaoDAO.Create(FConnection) do
                  try
                    SeloSituacao := Get(FieldByName(
                      'SELO_SITUACAO_ID').AsInteger);
                  finally
                    Free;
                  end;

              Data := FieldByName('DATA').AsDateTime;
              Observacao := FieldByName('OBSERVACAO').AsString;

              if FieldByName('SELO_LOTE_ID').IsNull.&Not then
                with TSeloLoteDAO.Create(FConnection) do
                  try
                    SeloLote := Get(FieldByName('SELO_LOTE_ID').AsInteger);
                  finally
                    Free;
                  end;

              Sigla := FieldByName('SIGLA').AsString;
              Descricao := FieldByName('DESCRICAO').AsString;
              Tabela := vpTabela;
              CampoID := FieldByName('CAMPO_ID').AsInteger;

              if FieldByName('USUARIO_ID').IsNull.&Not then
                with TUsuarioDAO.Create(FConnection) do
                  try
                    Usuario := GetByID(FieldByName('USUARIO_ID').AsInteger);
                  finally
                    Free;
                  end;

              NumeroAgrupador := FieldByName('NUMERO_AGRUPADOR').AsString;
              Apresentante := FieldByName('APRESENTANTE').AsString;
              IP_Maquina := FieldByName('IP_MAQUINA').AsString;

              ValorEmolumento := FieldByName('VALOR_EMOLUMENTO').AsCurrency;

              ValorTaxaJudiciaria := FieldByName(
                'VALOR_TAXA_JUDICIARIA').AsCurrency;

              ValorFundos := FieldByName('VALOR_FUNDESP').AsCurrency;
              ValorISSQN := FieldByName('VALOR_ISSQN').AsCurrency;

              Validador := FieldByName(
                'VALIDADOR').AsString;
            end;

            Result.Add(viSeloLivro);
          finally
            Next;
          end;
      finally
        Close;
      end;
    end;
  finally
    FreeAndNil(viSQLDataSet);
  end;
end;

function TSeloLivroDAO.Get(
  const vpSeloLivroID: Integer): ISeloLivro;
{$REGION 'Variáveis'}
var
  viSQLDataSet: TI9Query;
{$ENDREGION}
begin
  Result := nil;

  viSQLDataSet := TI9Query.Create(nil);
  viSQLDataSet.Connection := FConnection;

  try
    with viSQLDataSet do
    begin
      {$REGION 'Comando SQL SELECT'}
      SQL.Text :=
        'SELECT ' +

        {$REGION 'Colunas'}
        'NUMERO ' +
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_SELO_LIVRO ' +
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +
        'SELO_LIVRO_ID = :P_SELO_LIVRO_ID;';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_SELO_LIVRO_ID').AsInteger := vpSeloLivroID;
      {$ENDREGION}

      Open;

      try
        if IsEmpty then
          Exit;

        First;
        Result := TSeloLivro.Create;

        with Result do
        begin
          SeloLivroID := vpSeloLivroID;
          Numero := FieldByName('NUMERO').AsInteger;
        end;
      finally
        Close;
      end;
    end;
  finally
    FreeAndNil(viSQLDataSet);
  end;
end;

function TSeloLivroDAO.GetCount(
  const vpSeloSituacao: ISeloSituacao;
  const vpTabela: string;
  const vpCampoID: Integer): Integer;
{$REGION 'Variáveis'}
var
  viSQLDataSet: TI9Query;
{$ENDREGION}
begin
  Result := 0;

  viSQLDataSet := TI9Query.Create(nil);
  viSQLDataSet.Connection := FConnection;

  try
    with viSQLDataSet do
    begin
      {$REGION 'Comando SQL SELECT'}
      SQL.Text :=
        'SELECT ' +

        {$REGION 'Colunas'}
        'COUNT(*) ' +
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_SELO_LIVRO ' +
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +
        'SELO_SITUACAO_ID = :P_SELO_SITUACAO_ID AND ' +
        'TABELA = :P_TABELA AND ' +
        'CAMPO_ID = :P_CAMPO_ID;';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_SELO_SITUACAO_ID').AsInteger := vpSeloSituacao.
        SeloSituacaoID;

      ParamByName('P_TABELA').AsString := vpTabela;
      ParamByName('P_CAMPO_ID').AsInteger := vpCampoID;
      {$ENDREGION}

      Open;

      try
        if IsEmpty then
          Exit;

        First;
        Result := FieldByName('COUNT').AsInteger;
      finally
        Close;
      end;
    end;
  finally
    FreeAndNil(viSQLDataSet);
  end;
end;

end.
