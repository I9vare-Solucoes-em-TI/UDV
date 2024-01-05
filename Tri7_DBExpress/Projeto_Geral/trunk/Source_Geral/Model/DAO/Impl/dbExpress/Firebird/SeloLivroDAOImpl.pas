unit SeloLivroDAOImpl;

interface

uses
  FireDAC.Stan.Param,
  I9Connection,
  SeloLivroDAO,
  Data.SqlExpr,
  Data.DB,
  SeloLivro,
  SeloLivroList,
  SeloSituacao,
  SeloGrupo,
  IntervaloDatas,
  CampoOrdenacaoList;

type
  TSeloLivroDAO = class(TInterfacedObject, ISeloLivroDAO)
  private
    FConnection: TI9Connection;

    function GetOrderBy(
      const vpCampoOrdenacaoList: TCampoOrdenacaoList): string;

    procedure PreencherParametros(
      const vpParams: TFDParams;
      const vpValue: ISeloLivro);
  public
    constructor Create(
      const vpConnection: TI9Connection); reintroduce;

    function Get(
      const vpValue: TDataSet): ISeloLivro;

    function GetByID(
      const vpValue: Variant): ISeloLivro; virtual; abstract;

    function GetList: TSeloLivroList; overload; virtual; abstract;

    function GetListByTabelaECampoID(
      const vpTabela: string;
      const vpCampoID: Integer): TSeloLivroList; virtual; abstract;

    function GetList(
      const vpSeloSituacao: ISeloSituacao;
      const vpSeloGrupo: ISeloGrupo;
      const vpIntervaloDatas: IIntervaloDatas;
      const vpDataExportacaoIsNull: Boolean;
      const vpCampoOrdenacaoList: TCampoOrdenacaoList):
        TSeloLivroList; overload;

    function GetList(
      const vpSeloSituacao: ISeloSituacao;
      const vpSeloGrupo: ISeloGrupo;
      const vpMenorIgualData: TDateTime;
      const vpDataExportacaoIsNull: Boolean;
      const vpCampoOrdenacaoList: TCampoOrdenacaoList):
      TSeloLivroList; overload;

    class function GetColunas(
      const vpLoadSeloSituacao: Boolean;
      const vpLoadSeloLote: Boolean;
      const vpLoadSeloGrupo: Boolean;
      const vpLoadUsuario: Boolean): string; static;

    procedure Inserir(
      const vpValue: ISeloLivro); virtual; abstract;

    procedure Alterar(
      const vpValue: ISeloLivro);

    procedure Excluir(
      const vpValue: ISeloLivro); virtual; abstract;

    procedure AlterarExportacao(
      const vpValue: TSeloLivroList;
      const vpDataExportacao: TDateTime;
      const vpCodigoExportacao: Integer);

    procedure AlterarValidado(
      const vpValue: ISeloLivro);
  end;

implementation

uses
  SeloLivroImpl,
  System.SysUtils,
  BooleanHelper,
  SeloSituacaoDAOImpl,
  SeloLoteDAOImpl,
  UsuarioDAOImpl,
  System.StrUtils,
  System.Math,
  System.Types,
  CampoOrdenacao,
  SeloLivroComparer,
  TipoOrdenacao,
  TipoOrdenacaoHelper,
  System.DateUtils,
  PaginadorList,
  PaginadorListImpl,
  System.Generics.Collections,
  IntegerList,
  IntegerListHelper,
  SeloLivroListHelper;

{ TSeloLivroDAO }

procedure TSeloLivroDAO.Alterar(
  const vpValue: ISeloLivro);
{$REGION 'Variáveis'}
var
  viSQL: string;
  viParams: TFDParams;
{$ENDREGION}
begin
  viSQL := {$REGION 'Comando SQL UPDATE'}

    {$REGION 'Cláusula UPDATE'}
    'UPDATE ' +
    'G_SELO_LIVRO ' +
    {$ENDREGION}

    {$REGION 'Cláusula SET, Colunas e Parâmetros'}
    'SET ' +
    'SELO_SITUACAO_ID = :P_SELO_SITUACAO_ID, ' +
    'OBSERVACAO = :P_OBSERVACAO, ' +
    'DESCRICAO = :P_DESCRICAO, ' +
    'TABELA = :P_TABELA, ' +
    'CAMPO_ID = :P_CAMPO_ID, ' +
    'USUARIO_ID = :P_USUARIO_ID, ' +
    'NUMERO_AGRUPADOR = :P_NUMERO_AGRUPADOR, ' +
    'APRESENTANTE = :P_APRESENTANTE, ' +
    'IP_MAQUINA = :P_IP_MAQUINA, ' +
    'VALOR_TOTAL = :P_VALOR_TOTAL, ' +
    'VALOR_EMOLUMENTO = :P_VALOR_EMOLUMENTO, ' +
    'VALOR_TAXA_JUDICIARIA = :P_VALOR_TAXA_JUDICIARIA, ' +
    'VALOR_FUNDESP = :P_VALOR_FUNDESP, ' +
    'DATA = :P_DATA, ' +
    'DATA_EXPORTACAO = :P_DATA_EXPORTACAO, ' +
    'CODIGO_EXPORTACAO = :P_CODIGO_EXPORTACAO, ' +
    'CODIGO_GRATUITO = :P_CODIGO_GRATUITO, ' +
    'VALOR_ISSQN = :P_VALOR_ISSQN, ' +
    'VALIDADO = :P_VALIDADO, ' +
    'PROTOCOLO = :P_PROTOCOLO ' +
    {$ENDREGION}

    {$REGION 'Cláusula WHERE e Parâmetros'}
    'WHERE ' +
    'SELO_LIVRO_ID = :P_SELO_LIVRO_ID';
    {$ENDREGION}

  {$ENDREGION}

  viParams := TFDParams.Create;
  try
    with viParams do
    begin
      CreateParam(TFieldType.ftInteger, 'P_SELO_SITUACAO_ID',
        TParamType.ptInput);

      CreateParam(TFieldType.ftString, 'P_OBSERVACAO', TParamType.ptInput);
      CreateParam(TFieldType.ftString, 'P_DESCRICAO', TParamType.ptInput);
      CreateParam(TFieldType.ftString, 'P_TABELA', TParamType.ptInput);
      CreateParam(TFieldType.ftInteger, 'P_CAMPO_ID', TParamType.ptInput);
      CreateParam(TFieldType.ftInteger, 'P_USUARIO_ID', TParamType.ptInput);

      CreateParam(TFieldType.ftString, 'P_NUMERO_AGRUPADOR',
        TParamType.ptInput);

      CreateParam(TFieldType.ftString, 'P_APRESENTANTE', TParamType.ptInput);
      CreateParam(TFieldType.ftString, 'P_IP_MAQUINA', TParamType.ptInput);
      CreateParam(TFieldType.ftCurrency, 'P_VALOR_TOTAL', TParamType.ptInput);

      CreateParam(TFieldType.ftCurrency, 'P_VALOR_EMOLUMENTO',
        TParamType.ptInput);

      CreateParam(TFieldType.ftCurrency, 'P_VALOR_TAXA_JUDICIARIA',
        TParamType.ptInput);

      CreateParam(TFieldType.ftCurrency, 'P_VALOR_FUNDESP', TParamType.ptInput);
      CreateParam(TFieldType.ftDateTime, 'P_DATA', TParamType.ptInput);

      CreateParam(TFieldType.ftDateTime, 'P_DATA_EXPORTACAO',
        TParamType.ptInput);

      CreateParam(TFieldType.ftInteger, 'P_CODIGO_EXPORTACAO',
        TParamType.ptInput);

      CreateParam(TFieldType.ftInteger, 'P_CODIGO_GRATUITO',
        TParamType.ptInput);

      CreateParam(TFieldType.ftCurrency, 'P_VALOR_ISSQN', TParamType.ptInput);
      CreateParam(TFieldType.ftString, 'P_VALIDADO', TParamType.ptInput);
      CreateParam(TFieldType.ftInteger, 'P_PROTOCOLO', TParamType.ptInput);
      CreateParam(TFieldType.ftInteger, 'P_SELO_LIVRO_ID', TParamType.ptInput);
    end;

    PreencherParametros(viParams, vpValue);
    FConnection.Execute(viSQL, viParams);
  finally
    FreeAndNil(viParams);
  end;
end;

procedure TSeloLivroDAO.AlterarExportacao(
  const vpValue: TSeloLivroList;
  const vpDataExportacao: TDateTime;
  const vpCodigoExportacao: Integer);
{$REGION 'Constantes'}
const
  CI_LIMIT: Integer = 1000;
  CI_SEPARATOR: string = ', ';
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viSQL: string;
  viParams: TFDParams;

  viPaginadorList: IPaginadorList<ISeloLivro, TSeloLivroList,
    TList<TSeloLivroList>>;

  viSeloLivroListList: TList<TSeloLivroList>;
  viSeloLivroListPaginado: TSeloLivroList;
  viIDs: TIntegerList;
  I: Integer;
{$ENDREGION}
begin
  viSQL := {$REGION 'Comando SQL UPDATE'}

    {$REGION 'Cláusula UPDATE'}
    'UPDATE ' +
    'G_SELO_LIVRO ' +
    {$ENDREGION}

    {$REGION 'Cláusula SET, Colunas e Parâmetros'}
    'SET ' +
    'DATA_EXPORTACAO = :P_DATA_EXPORTACAO, ' +
    'CODIGO_EXPORTACAO = :P_CODIGO_EXPORTACAO ' +
    {$ENDREGION}

    {$REGION 'Cláusula WHERE e Parâmetros'}
    'WHERE ' +
    'SELO_LIVRO_ID IN (%s)';
    {$ENDREGION}

  {$ENDREGION}

  viParams := TFDParams.Create;
  try
    with viParams do
    begin
      with CreateParam(TFieldType.ftDateTime, 'P_DATA_EXPORTACAO',
        TParamType.ptInput) do
        if CompareDateTime(vpDataExportacao, ZeroValue) = GreaterThanValue then
          AsDateTime := vpDataExportacao
        else
          Clear;

      with CreateParam(TFieldType.ftInteger, 'P_CODIGO_EXPORTACAO',
        TParamType.ptInput) do
        if CompareValue(vpCodigoExportacao, ZeroValue) = GreaterThanValue then
          AsInteger := vpCodigoExportacao
        else
          Clear;
    end;

    viPaginadorList := TPaginadorList<ISeloLivro, TSeloLivroList,
      TList<TSeloLivroList>>.Create;

    viSeloLivroListList := viPaginadorList.Get(vpValue, CI_LIMIT);
    try
      for I := ZeroValue to Pred(viSeloLivroListList.Count) do
      begin
        viSeloLivroListPaginado := viSeloLivroListList[I];
        try
          viIDs := viSeloLivroListPaginado.GetIDs;
          try
            FConnection.Execute(
              string.Format(viSQL, [viIDs.ToString(CI_SEPARATOR)]), viParams);
          finally
            FreeAndNil(viIDs);
          end;
        finally
          FreeAndNil(viSeloLivroListPaginado);
        end;
      end;
    finally
      FreeAndNil(viSeloLivroListList);
    end;
  finally
    FreeAndNil(viParams);
  end;
end;

procedure TSeloLivroDAO.AlterarValidado(
  const vpValue: ISeloLivro);
{$REGION 'Variáveis'}
var
  viSQL: string;
  viParams: TFDParams;
{$ENDREGION}
begin
  viSQL := {$REGION 'Comando SQL UPDATE'}

    {$REGION 'Cláusula UPDATE'}
    'UPDATE ' +
    'G_SELO_LIVRO ' +
    {$ENDREGION}

    {$REGION 'Cláusula SET, Colunas e Parâmetros'}
    'SET ' +
    'VALIDADO = :P_VALIDADO ' +
    {$ENDREGION}

    {$REGION 'Cláusula WHERE e Parâmetros'}
    'WHERE ' +
    'SELO_LIVRO_ID = :P_SELO_LIVRO_ID';
    {$ENDREGION}

  {$ENDREGION}

  viParams := TFDParams.Create;
  try
    with viParams do
    begin
      CreateParam(TFieldType.ftString, 'P_VALIDADO', TParamType.ptInput);
      CreateParam(TFieldType.ftInteger, 'P_SELO_LIVRO_ID', TParamType.ptInput);
    end;

    PreencherParametros(viParams, vpValue);
    FConnection.Execute(viSQL, viParams);
  finally
    FreeAndNil(viParams);
  end;
end;

constructor TSeloLivroDAO.Create(
  const vpConnection: TI9Connection);
begin
  inherited Create;
  FConnection := vpConnection;
end;

function TSeloLivroDAO.Get(
  const vpValue: TDataSet): ISeloLivro;
{$REGION 'Variáveis'}
var
  viField: TField;
  viSeloSituacaoDAO: TSeloSituacaoDAO;
  viSeloLoteDAO: TSeloLoteDAO;
  viUsuarioDAO: TUsuarioDAO;
{$ENDREGION}
begin
  Result := TSeloLivro.Create;
  with vpValue, Result do
  begin
    viField := FindField('G_SL_SELO_LIVRO_ID');
    if Assigned(viField) then
      SeloLivroID := viField.AsInteger;

    viField := FindField('G_SL_NUMERO');
    if Assigned(viField) then
      Numero := viField.AsInteger;

    viField := FindField('G_SS_SELO_SITUACAO_ID');
    if Assigned(viField) and
      viField.IsNull.&Not then
    begin
      viSeloSituacaoDAO := TSeloSituacaoDAO.Create(FConnection);
      try
        SeloSituacao := viSeloSituacaoDAO.Get(vpValue);
      finally
        FreeAndNil(viSeloSituacaoDAO);
      end;
    end;

    viField := FindField('G_SL_OBSERVACAO');
    if Assigned(viField) then
      Observacao := viField.AsString;

    viField := FindField('G_SLO_SELO_LOTE_ID');
    if Assigned(viField) and
      viField.IsNull.&Not then
    begin
      viSeloLoteDAO := TSeloLoteDAO.Create(FConnection);
      try
        SeloLote := viSeloLoteDAO.Get(vpValue);
      finally
        FreeAndNil(viSeloLoteDAO);
      end;
    end;

    viField := FindField('G_SL_SIGLA');
    if Assigned(viField) then
      Sigla := viField.AsString;

    viField := FindField('G_SL_DESCRICAO');
    if Assigned(viField) then
      Descricao := viField.AsString;

    viField := FindField('G_SL_TABELA');
    if Assigned(viField) then
      Tabela := viField.AsString;

    viField := FindField('G_SL_CAMPO_ID');
    if Assigned(viField) then
      CampoID := viField.AsInteger;

    viField := FindField('G_U_USUARIO_ID');
    if Assigned(viField) and
      viField.IsNull.&Not then
    begin
      viUsuarioDAO := TUsuarioDAO.Create(FConnection);
      try
        Usuario := viUsuarioDAO.Get(vpValue);
      finally
        FreeAndNil(viUsuarioDAO);
      end;
    end;

    viField := FindField('G_SL_NUMERO_AGRUPADOR');
    if Assigned(viField) then
      NumeroAgrupador := viField.AsString;

    viField := FindField('G_SL_APRESENTANTE');
    if Assigned(viField) then
      Apresentante := viField.AsString;

    viField := FindField('G_SL_IP_MAQUINA');
    if Assigned(viField) then
      IP_Maquina := viField.AsString;

    viField := FindField('G_SL_VALOR_EMOLUMENTO');
    if Assigned(viField) then
      ValorEmolumento := viField.AsCurrency;

    viField := FindField('G_SL_VALOR_TAXA_JUDICIARIA');
    if Assigned(viField) then
      ValorTaxaJudiciaria := viField.AsCurrency;

    viField := FindField('G_SL_VALOR_FUNDESP');
    if Assigned(viField) then
      ValorFundos := viField.AsCurrency;

    viField := FindField('G_SL_DATA');
    if Assigned(viField) then
      Data := viField.AsDateTime;

    viField := FindField('G_SL_DATA_EXPORTACAO');
    if Assigned(viField) then
      DataExportacao := viField.AsDateTime;

    viField := FindField('G_SL_CODIGO_EXPORTACAO');
    if Assigned(viField) then
      CodigoExportacao := viField.AsInteger;

    viField := FindField('G_SL_CODIGO_GRATUITO');
    if Assigned(viField) then
      CodigoGratuito := viField.AsInteger;

    viField := FindField('G_SL_VALOR_ISSQN');
    if Assigned(viField) then
      ValorISSQN := viField.AsCurrency;

    viField := FindField('G_SL_VALIDADO');
    if Assigned(viField) then
      Validado := Boolean.FromStringSimNao(viField.AsString);

    viField := FindField('G_SL_PROTOCOLO');
    if Assigned(viField) then
      Protocolo := viField.AsInteger;
  end;
end;

class function TSeloLivroDAO.GetColunas(
  const vpLoadSeloSituacao: Boolean;
  const vpLoadSeloLote: Boolean;
  const vpLoadSeloGrupo: Boolean;
  const vpLoadUsuario: Boolean): string;
begin
  Result := {$REGION 'Colunas'}
    'G_SL.SELO_LIVRO_ID G_SL_SELO_LIVRO_ID, ' +
    'G_SL.NUMERO G_SL_NUMERO, ' +

    IfThen(vpLoadSeloSituacao, TSeloSituacaoDAO.GetColunas,
      'G_SL.SELO_SITUACAO_ID G_SL_SELO_SITUACAO_ID') + ', ' +

    'G_SL.OBSERVACAO G_SL_OBSERVACAO, ' +

    IfThen(vpLoadSeloLote, TSeloLoteDAO.GetColunas(vpLoadSeloGrupo),
      'G_SL.SELO_LOTE_ID G_SL_SELO_LOTE_ID') + ', ' +

    'G_SL.SIGLA G_SL_SIGLA, ' +
    'G_SL.DESCRICAO G_SL_DESCRICAO, ' +
    'G_SL.TABELA G_SL_TABELA, ' +
    'G_SL.CAMPO_ID G_SL_CAMPO_ID, ' +

    IfThen(vpLoadUsuario, TUsuarioDAO.GetColunas,
      'G_SL.USUARIO_ID G_SL_USUARIO_ID') + ', ' +

    'G_SL.NUMERO_AGRUPADOR G_SL_NUMERO_AGRUPADOR, ' +
    'G_SL.APRESENTANTE G_SL_APRESENTANTE, ' +
    'G_SL.IP_MAQUINA G_SL_IP_MAQUINA, ' +
    'G_SL.VALOR_EMOLUMENTO G_SL_VALOR_EMOLUMENTO, ' +
    'G_SL.VALOR_TAXA_JUDICIARIA G_SL_VALOR_TAXA_JUDICIARIA, ' +
    'G_SL.VALOR_FUNDESP G_SL_VALOR_FUNDESP, ' +
    'G_SL.DATA G_SL_DATA, ' +
    'G_SL.DATA_EXPORTACAO G_SL_DATA_EXPORTACAO, ' +
    'G_SL.CODIGO_EXPORTACAO G_SL_CODIGO_EXPORTACAO, ' +
    'G_SL.CODIGO_GRATUITO G_SL_CODIGO_GRATUITO, ' +
    'G_SL.VALOR_ISSQN G_SL_VALOR_ISSQN, ' +
    'G_SL.VALIDADO G_SL_VALIDADO, ' +
    'G_SL.PROTOCOLO G_SL_PROTOCOLO';
  {$ENDREGION}
end;

function TSeloLivroDAO.GetList(
  const vpSeloSituacao: ISeloSituacao;
  const vpSeloGrupo: ISeloGrupo;
  const vpMenorIgualData: TDateTime;
  const vpDataExportacaoIsNull: Boolean;
  const vpCampoOrdenacaoList: TCampoOrdenacaoList): TSeloLivroList;
{$REGION 'Constantes'}
const
  CI_LOAD_SELO_SITUACAO: Boolean = False;
  CI_LOAD_SELO_LOTE: Boolean = True;
  CI_LOAD_SELO_GRUPO: Boolean = False;
  CI_LOAD_USUARIO: Boolean = True;
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viSQL: string;
  viParams: TFDParams;
  viDataSet: TDataSet;
  viOrderBy: string;
  viSeloLivro: ISeloLivro;
{$ENDREGION}
begin
  Result := TSeloLivroList.Create;

  viSQL := {$REGION 'Comando SQL SELECT'}
    'SELECT ' +

    GetColunas(
      CI_LOAD_SELO_SITUACAO,
      CI_LOAD_SELO_LOTE,
      CI_LOAD_SELO_GRUPO,
      CI_LOAD_USUARIO) + ' ' +

    {$REGION 'Cláusula FROM'}
    'FROM ' +
    'G_SELO_LIVRO G_SL ' +
    {$ENDREGION}

    {$REGION 'Cláusula INNER JOIN'}
    'INNER JOIN ' +
    'G_SELO_LOTE G_SLO ' +

    {$REGION 'Cláusula ON'}
    'ON ' +
    'G_SL.SELO_LOTE_ID = G_SLO.SELO_LOTE_ID ' +
    {$ENDREGION}

    {$ENDREGION}

    {$REGION 'Cláusula INNER JOIN'}
    'INNER JOIN ' +
    'G_USUARIO G_U ' +

    {$REGION 'Cláusula ON'}
    'ON ' +
    'G_SL.USUARIO_ID = G_U.USUARIO_ID ' +
    {$ENDREGION}

    {$ENDREGION}

    {$REGION 'Cláusula WHERE e Parâmetros'}
    'WHERE ' +
    'G_SL.SELO_SITUACAO_ID = :P_SELO_SITUACAO_ID AND ' +
    'G_SLO.SELO_GRUPO_ID = :P_SELO_GRUPO_ID AND ' +
    'G_SL.DATA <= :P_DATA AND ' +

    'G_SL.DATA_EXPORTACAO IS ' + IfThen(
      vpDataExportacaoIsNull.&Not, 'NOT') + ' NULL';
    {$ENDREGION}

    viOrderBy := GetOrderBy(vpCampoOrdenacaoList);
    if viOrderBy.IsEmpty.&Not then
      viSQL := viSQL + ' ' + viOrderBy;

  {$ENDREGION}

  viParams := TFDParams.Create;
  try
    viParams.CreateParam(TFieldType.ftInteger, 'P_SELO_SITUACAO_ID',
      TParamType.ptInput).AsInteger := vpSeloSituacao.SeloSituacaoID;

    viParams.CreateParam(TFieldType.ftInteger, 'P_SELO_GRUPO_ID',
      TParamType.ptInput).AsInteger := vpSeloGrupo.SeloGrupoID;

    viParams.CreateParam(TFieldType.ftDateTime, 'P_DATA',
      TParamType.ptInput).AsDateTime := vpMenorIgualData;

    FConnection.Execute(viSQL, viParams, viDataSet);
    try
      if viDataSet.IsEmpty then
        Exit;

      try
        viDataSet.First;
        while viDataSet.Eof.&Not do
          try
            viSeloLivro := Get(viDataSet);
            viSeloLivro.SeloSituacao := vpSeloSituacao;
            viSeloLivro.SeloLote.SeloGrupo := vpSeloGrupo;
            Result.Add(viSeloLivro);
          finally
            viDataSet.Next;
          end;

        Result.TrimExcess;
      finally
        viDataSet.Close;
      end;
    finally
      FreeAndNil(viDataSet);
    end;
  finally
    FreeAndNil(viParams);
  end;
end;

function TSeloLivroDAO.GetList(
  const vpSeloSituacao: ISeloSituacao;
  const vpSeloGrupo: ISeloGrupo;
  const vpIntervaloDatas: IIntervaloDatas;
  const vpDataExportacaoIsNull: Boolean;
  const vpCampoOrdenacaoList: TCampoOrdenacaoList): TSeloLivroList;
{$REGION 'Constantes'}
const
  CI_LOAD_SELO_SITUACAO: Boolean = False;
  CI_LOAD_SELO_LOTE: Boolean = True;
  CI_LOAD_SELO_GRUPO: Boolean = False;
  CI_LOAD_USUARIO: Boolean = True;
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viSQL: string;
  viParams: TFDParams;
  viDataSet: TDataSet;
  viOrderBy: string;
  viSeloLivro: ISeloLivro;
{$ENDREGION}
begin
  Result := TSeloLivroList.Create;

  viSQL := {$REGION 'Comando SQL SELECT'}
    'SELECT ' +

    GetColunas(
      CI_LOAD_SELO_SITUACAO,
      CI_LOAD_SELO_LOTE,
      CI_LOAD_SELO_GRUPO,
      CI_LOAD_USUARIO) + ' ' +

    {$REGION 'Cláusula FROM'}
    'FROM ' +
    'G_SELO_LIVRO G_SL ' +
    {$ENDREGION}

    {$REGION 'Cláusula INNER JOIN'}
    'LEFT JOIN ' +
    'G_SELO_LOTE G_SLO ' +

    {$REGION 'Cláusula ON'}
    'ON ' +
    'G_SL.SELO_LOTE_ID = G_SLO.SELO_LOTE_ID ' +
    {$ENDREGION}

    {$ENDREGION}

    {$REGION 'Cláusula INNER JOIN'}
    'LEFT JOIN ' +
    'G_USUARIO G_U ' +

    {$REGION 'Cláusula ON'}
    'ON ' +
    'G_SL.USUARIO_ID = G_U.USUARIO_ID ' +
    {$ENDREGION}

    {$ENDREGION}

    {$REGION 'Cláusula WHERE e Parâmetros'}
    'WHERE ' +
    'G_SL.SELO_SITUACAO_ID = :P_SELO_SITUACAO_ID AND ' +
    'G_SLO.SELO_GRUPO_ID = :P_SELO_GRUPO_ID AND ' +
    'G_SL.DATA BETWEEN :P_DATA_INICIAL AND :P_DATA_FINAL AND ' +

    'G_SL.DATA_EXPORTACAO IS ' + IfThen(
      vpDataExportacaoIsNull.&Not, 'NOT') + ' NULL';
    {$ENDREGION}

    viOrderBy := GetOrderBy(vpCampoOrdenacaoList);
    if viOrderBy.IsEmpty.&Not then
      viSQL := viSQL + ' ' + viOrderBy;

  {$ENDREGION}

  viParams := TFDParams.Create;
  try
    viParams.CreateParam(TFieldType.ftInteger, 'P_SELO_SITUACAO_ID',
      TParamType.ptInput).AsInteger := vpSeloSituacao.SeloSituacaoID;

    viParams.CreateParam(TFieldType.ftInteger, 'P_SELO_GRUPO_ID',
      TParamType.ptInput).AsInteger := vpSeloGrupo.SeloGrupoID;

    viParams.CreateParam(TFieldType.ftDateTime, 'P_DATA_INICIAL',
      TParamType.ptInput).AsDateTime := vpIntervaloDatas.DataInicial;

    viParams.CreateParam(TFieldType.ftDateTime, 'P_DATA_FINAL',
      TParamType.ptInput).AsDateTime := vpIntervaloDatas.DataFinal;

    FConnection.Execute(viSQL, viParams, viDataSet);
    try
      if viDataSet.IsEmpty then
        Exit;

      try
        viDataSet.First;
        while viDataSet.Eof.&Not do
          try
            viSeloLivro := Get(viDataSet);
            viSeloLivro.SeloSituacao := vpSeloSituacao;
            viSeloLivro.SeloLote.SeloGrupo := vpSeloGrupo;
            Result.Add(viSeloLivro);
          finally
            viDataSet.Next;
          end;

        Result.TrimExcess;
      finally
        viDataSet.Close;
      end;
    finally
      FreeAndNil(viDataSet);
    end;
  finally
    FreeAndNil(viParams);
  end;
end;

function TSeloLivroDAO.GetOrderBy(
  const vpCampoOrdenacaoList: TCampoOrdenacaoList): string;
{$REGION 'Variáveis'}
var
  I: Integer;
  viCampoOrdenacao: ICampoOrdenacao;
{$ENDREGION}
begin
  Result := string.Empty;

  if Assigned(vpCampoOrdenacaoList).&Not then
    Exit;

  if CompareValue(vpCampoOrdenacaoList.Count, ZeroValue) = EqualsValue then
    Exit;

  Result := 'ORDER BY ';

  for I := ZeroValue to Pred(vpCampoOrdenacaoList.Count) do
  begin
    viCampoOrdenacao := vpCampoOrdenacaoList[I];
    if CompareValue(I, ZeroValue) = GreaterThanValue then
      Result := Result + ', ';

    if viCampoOrdenacao.Nome.Equals(TSeloLivroComparer.CG_NUMERO_AGRUPADOR) then
      Result := Result + 'G_SLO.NUMERO_AGRUPADOR' + IfThen(
        viCampoOrdenacao.Tipo.IsDescendente, ' DESC');
  end;
end;

procedure TSeloLivroDAO.PreencherParametros(
  const vpParams: TFDParams;
  const vpValue: ISeloLivro);
{$REGION 'Variáveis'}
var
  viParam: TFDParam;
{$ENDREGION}
begin
  with vpParams, vpValue do
  begin
    viParam := FindParam('P_SELO_LIVRO_ID');
    if Assigned(viParam) then
      viParam.AsInteger := SeloLivroID;

    viParam := FindParam('P_NUMERO');
    if Assigned(viParam) then
      with viParam do
        if CompareValue(Numero, ZeroValue) = GreaterThanValue then
          AsInteger := Numero
        else
          Clear;

    viParam := FindParam('P_SELO_SITUACAO_ID');
    if Assigned(viParam) then
      with viParam do
        if Assigned(SeloSituacao) then
          AsInteger := SeloSituacao.SeloSituacaoID
        else
          Clear;

    viParam := FindParam('P_OBSERVACAO');
    if Assigned(viParam) then
      with viParam do
        if Observacao.IsEmpty then
          Clear
        else
          AsString := Observacao;

    viParam := FindParam('P_SELO_LOTE_ID');
    if Assigned(viParam) then
      with viParam do
        if Assigned(SeloLote) then
          AsInteger := SeloLote.SeloLoteID
        else
          Clear;

    viParam := FindParam('P_SIGLA');
    if Assigned(viParam) then
      with viParam do
        if Sigla.IsEmpty then
          Clear
        else
          AsString := Sigla;

    viParam := FindParam('P_DESCRICAO');
    if Assigned(viParam) then
      with viParam do
        if Descricao.IsEmpty then
          Clear
        else
          AsString := Descricao;

    viParam := FindParam('P_TABELA');
    if Assigned(viParam) then
      with viParam do
        if Tabela.IsEmpty then
          Clear
        else
          AsString := Tabela;

    viParam := FindParam('P_CAMPO_ID');
    if Assigned(viParam) then
      with viParam do
        if CompareValue(CampoID, ZeroValue) = GreaterThanValue then
          AsInteger := CampoID
        else
          Clear;

    viParam := FindParam('P_USUARIO_ID');
    if Assigned(viParam) then
      with viParam do
        if Assigned(Usuario) then
          AsInteger := Usuario.UsuarioID
        else
          Clear;

    viParam := FindParam('P_NUMERO_AGRUPADOR');
    if Assigned(viParam) then
      with viParam do
        if NumeroAgrupador.IsEmpty then
          Clear
        else
          AsString := NumeroAgrupador;

    viParam := FindParam('P_APRESENTANTE');
    if Assigned(viParam) then
      with viParam do
        if Apresentante.IsEmpty then
          Clear
        else
          AsString := Apresentante;

    viParam := FindParam('P_IP_MAQUINA');
    if Assigned(viParam) then
      with viParam do
        if IP_Maquina.IsEmpty then
          Clear
        else
          AsString := IP_Maquina;

    viParam := FindParam('P_VALOR_TOTAL');
    if Assigned(viParam) then
      with viParam do
        if ValorTotal > ZeroValue then
          AsCurrency := ValorTotal
        else
          Clear;

    viParam := FindParam('P_VALOR_EMOLUMENTO');
    if Assigned(viParam) then
      with viParam do
        if ValorEmolumento > ZeroValue then
          AsCurrency := ValorEmolumento
        else
          Clear;

    viParam := FindParam('P_VALOR_TAXA_JUDICIARIA');
    if Assigned(viParam) then
      with viParam do
        if ValorTaxaJudiciaria > ZeroValue then
          AsCurrency := ValorTaxaJudiciaria
        else
          Clear;

    viParam := FindParam('P_VALOR_FUNDESP');
    if Assigned(viParam) then
      with viParam do
        if ValorFundos > ZeroValue then
          AsCurrency := ValorFundos
        else
          Clear;

    viParam := FindParam('P_DATA');
    if Assigned(viParam) then
      with viParam do
        if CompareDateTime(Data, ZeroValue) = GreaterThanValue then
          AsDateTime := Data
        else
          Clear;

    viParam := FindParam('P_DATA_EXPORTACAO');
    if Assigned(viParam) then
      with viParam do
        if CompareDateTime(DataExportacao, ZeroValue) = GreaterThanValue then
          AsDateTime := DataExportacao
        else
          Clear;

    viParam := FindParam('P_CODIGO_EXPORTACAO');
    if Assigned(viParam) then
      with viParam do
        if CompareValue(CodigoExportacao, ZeroValue) = GreaterThanValue then
          AsInteger := CodigoExportacao
        else
          Clear;

    viParam := FindParam('P_CODIGO_GRATUITO');
    if Assigned(viParam) then
      with viParam do
        if CompareValue(CodigoGratuito, ZeroValue) = GreaterThanValue then
          AsInteger := CodigoGratuito
        else
          Clear;

    viParam := FindParam('P_VALOR_ISSQN');
    if Assigned(viParam) then
      with viParam do
        if ValorISSQN > ZeroValue then
          AsCurrency := ValorISSQN
        else
          Clear;

    viParam := FindParam('P_VALIDADO');
    if Assigned(viParam) then
      viParam.AsString := Validado.ToCharSimNao;

    viParam := FindParam('P_PROTOCOLO');
    if Assigned(viParam) then
      with viParam do
        if CompareValue(Protocolo, ZeroValue) = GreaterThanValue then
          AsInteger := Protocolo
        else
          Clear;
  end;
end;

end.
