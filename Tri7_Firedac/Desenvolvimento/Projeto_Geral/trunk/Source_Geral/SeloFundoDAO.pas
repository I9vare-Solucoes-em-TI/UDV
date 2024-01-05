unit SeloFundoDAO;

interface

uses
  I9Query,
  I9Connection,
  SeloFundo,
  System.Classes;

type
  TSeloFundoDAO = class
  public
    procedure Inserir(
      const vpSeloFundo: TSeloFundo;
      const vpUtilizarValorCalculado: Boolean = False);

    procedure Excluir(
      const vpSeloLivroID: Integer); overload;

    procedure Excluir(
      const vpSeloFundo: TSeloFundo); overload;

    procedure Excluir(
      const vpItemServico: Integer;
      const vpTabela: string); overload;

    function Get(
      const vpSeloLivroID: Integer): TSeloFundos; overload;

    function Get(
      const vpItemServico: Integer;
      const vpTabela: string): TSeloFundos; overload;

    function Get(
      const vpSelosLivroID: TStrings): TSeloFundos; overload;

    function GetCount(
      const vpItemServico: Integer;
      const vpTabela: string): Integer;
  end;

implementation

uses
  Data.DB,
  Data.SqlExpr,
  Controles,
  System.SysUtils,
  Lookup,
  System.StrUtils;

{ TSeloFundoDAO }


procedure TSeloFundoDAO.Excluir(
  const vpItemServico: Integer;
  const vpTabela: string);
{$REGION 'Variáveis'}
var
  viSQLDataSet: TI9Query;
{$ENDREGION}
begin
  viSQLDataSet := TI9Query.Create(nil);
  viSQLDataSet.Connection := dtmControles.DB;

  try
    with viSQLDataSet do
    begin
      {$REGION 'Comando SQL DELETE'}
      SQL.Text :=
        'DELETE ' +

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_SELO_FUNDO ' +
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +
        'ITEM_SERVICO = :P_ITEM_SERVICO '+
        'AND TABELA = :P_TABELA;';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_ITEM_SERVICO').AsInteger := vpItemServico;
      ParamByName('P_TABELA').AsString := vpTabela;
      {$ENDREGION}

      ExecSQL;
    end;
  finally
    viSQLDataSet.Free;
  end;
end;

procedure TSeloFundoDAO.Excluir(
  const vpSeloLivroID: Integer);
{$REGION 'Variáveis'}
var
  viSQLDataSet: TI9Query;
{$ENDREGION}
begin
  viSQLDataSet := TI9Query.Create(nil);
  viSQLDataSet.Connection := dtmControles.DB;

  try
    with viSQLDataSet do
    begin
      {$REGION 'Comando SQL DELETE'}
      SQL.Text :=
        'DELETE ' +

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_SELO_FUNDO ' +
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +
        'SELO_LIVRO_ID = :P_SELO_LIVRO_ID;';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_SELO_LIVRO_ID').AsInteger := vpSeloLivroID;
      {$ENDREGION}

      ExecSQL;
    end;
  finally
    viSQLDataSet.Free;
  end;
end;

function TSeloFundoDAO.Get(
  const vpSeloLivroID: Integer): TSeloFundos;
var
  viSQLDataSet: TI9Query;
  viSeloFundo: TSeloFundo;
begin
  Result := TSeloFundos.Create;

  viSQLDataSet := TI9Query.Create(nil);
  viSQLDataSet.Connection := dtmControles.DB;

  try
    with viSQLDataSet do
    begin
      {$REGION 'Comando SQL SELECT'}
      SQL.Text :=
        'SELECT ' +

        {$REGION 'Colunas'}
        'SELO_FUNDO_ID, ' +
        'FUNDO_TIPO_ID, ' +
        'VALOR, ' +
        'VALOR_DEDUCAO, ' +
        'COBRAR_PARTE ' +
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_SELO_FUNDO ' +
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

        while not Eof do
        begin
          viSeloFundo := TSeloFundo.Create(
            FieldByName('SELO_FUNDO_ID').AsInteger,
            vpSeloLivroID,
            dtmLookup.GetFundoTipos.Get(FieldByName('FUNDO_TIPO_ID').AsInteger),
            FieldByName('VALOR').AsCurrency,
            FieldByName('VALOR_DEDUCAO').AsCurrency);

          viSeloFundo.CobrarParte := MatchText(
            FieldByName('COBRAR_PARTE').AsString,
            ['S',
            string.Empty]);

          Result.Add(viSeloFundo);
          Next;
        end;
      finally
        Close;
      end;
    end;
  finally
    viSQLDataSet.Free;
  end;
end;

function TSeloFundoDAO.Get(
  const vpItemServico: Integer;
  const vpTabela: string): TSeloFundos;
var
  viSQLDataSet: TI9Query;
  viSeloFundo: TSeloFundo;
begin
  Result := TSeloFundos.Create;

  viSQLDataSet := TI9Query.Create(nil);
  viSQLDataSet.Connection := dtmControles.DB;

  try
    with viSQLDataSet do
    begin
      {$REGION 'Comando SQL SELECT'}
      SQL.Text :=
        'SELECT ' +

        {$REGION 'Colunas'}
        'SELO_FUNDO_ID, ' +
        'SELO_LIVRO_ID, ' +
        'FUNDO_TIPO_ID, ' +
        'VALOR, ' +
        'VALOR_DEDUCAO, ' +
        'COBRAR_PARTE ' +
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_SELO_FUNDO ' +
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +
        'ITEM_SERVICO = :P_ITEM_SERVICO AND ' +
        'TABELA = :P_TABELA;';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_ITEM_SERVICO').AsInteger := vpItemServico;
      ParamByName('P_TABELA').AsString  := vpTabela;
      {$ENDREGION}

      Open;

      try
        if IsEmpty then
          Exit;

        First;

        while not Eof do
        begin
          viSeloFundo := TSeloFundo.Create(
            FieldByName('SELO_FUNDO_ID').AsInteger,
            FieldByName('SELO_LIVRO_ID').AsInteger,
            dtmLookup.GetFundoTipos.Get(FieldByName('FUNDO_TIPO_ID').AsInteger),
            FieldByName('VALOR').AsCurrency,
            FieldByName('VALOR_DEDUCAO').AsCurrency);

          viSeloFundo.CobrarParte := MatchText(
            FieldByName('COBRAR_PARTE').AsString,
            ['S',
            string.Empty]);

          Result.Add(viSeloFundo);
          Next;
        end;
      finally
        Close;
      end;
    end;
  finally
    viSQLDataSet.Free;
  end;
end;

procedure TSeloFundoDAO.Excluir(
  const vpSeloFundo: TSeloFundo);
{$REGION 'Variáveis'}
var
  viSQLDataSet: TI9Query;
{$ENDREGION}
begin
  viSQLDataSet := TI9Query.Create(nil);
  viSQLDataSet.Connection := dtmControles.DB;

  try
    with viSQLDataSet do
    begin
      {$REGION 'Comando SQL DELETE'}
      SQL.Text :=
        'DELETE ' +

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_SELO_FUNDO ' +
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +
        'ITEM_SERVICO = :P_ITEM_SERVICO ' +
        'AND TABELA = :P_TABELA ' +
        'AND FUNDO_TIPO_ID = :P_FUNDO_TIPO_ID;';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_ITEM_SERVICO').AsInteger := vpSeloFundo.ItemServico;
      ParamByName('P_TABELA').AsString := vpSeloFundo.Tabela;
      ParamByName('P_FUNDO_TIPO_ID').AsInteger := vpSeloFundo.FundoTipo.FundoTipoID;
      {$ENDREGION}

      ExecSQL;
    end;
  finally
    viSQLDataSet.Free;
  end;
end;

function TSeloFundoDAO.Get(
  const vpSelosLivroID: TStrings): TSeloFundos;
var
  viSQLDataSet: TI9Query;
  viSeloFundo: TSeloFundo;
begin
  Result := TSeloFundos.Create;

  if vpSelosLivroID.Count = 0 then
    Exit;

  viSQLDataSet := TI9Query.Create(nil);
  viSQLDataSet.Connection := dtmControles.DB;

  try
    with viSQLDataSet do
    begin
      {$REGION 'Comando SQL SELECT'}
      SQL.Text :=
        'SELECT ' +

        {$REGION 'Colunas'}
        'SELO_FUNDO_ID, ' +
        'SELO_LIVRO_ID, ' +
        'FUNDO_TIPO_ID, ' +
        'VALOR, ' +
        'VALOR_DEDUCAO, ' +
        'COBRAR_PARTE ' +
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_SELO_FUNDO ' +
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +
        'SELO_LIVRO_ID IN (' + string.Join(', ',
          vpSelosLivroID.ToStringArray) + ');';
        {$ENDREGION}

      {$ENDREGION}

      Open;

      try
        if IsEmpty then
          Exit;

        First;

        while not Eof do
        begin
          viSeloFundo := TSeloFundo.Create(
            FieldByName('SELO_FUNDO_ID').AsInteger,
            FieldByName('SELO_LIVRO_ID').AsInteger,
            dtmLookup.GetFundoTipos.Get(FieldByName('FUNDO_TIPO_ID').AsInteger),
            FieldByName('VALOR').AsCurrency,
            FieldByName('VALOR_DEDUCAO').AsCurrency);

          viSeloFundo.CobrarParte := MatchText(
            FieldByName('COBRAR_PARTE').AsString,
            ['S',
            string.Empty]);

          Result.Add(viSeloFundo);
          Next;
        end;
      finally
        Close;
      end;
    end;
  finally
    viSQLDataSet.Free;
  end;
end;

function TSeloFundoDAO.GetCount(
  const vpItemServico: Integer;
  const vpTabela: string): Integer;
{$REGION 'Variáveis'}
var
  viSQLDataSet: TI9Query;
{$ENDREGION}
begin
  Result := 0;

  viSQLDataSet := TI9Query.Create(nil);
  viSQLDataSet.Connection := dtmControles.DB;

  try
    with viSQLDataSet do
    begin
      {$REGION 'Comando SQL SELECT'}
      SQL.Text :=
        'SELECT ' +

        {$REGION 'Colunas'}
        'COUNT(*) ' +
        {$ENDREGION}

        {$REGION 'FROM'}
        'FROM ' +
        'G_SELO_FUNDO ' +
        {$ENDREGION}

        {$REGION 'WHERE e Parâmetros'}
        'WHERE ' +
        'ITEM_SERVICO = :P_ITEM_SERVICO AND ' +
        'TABELA = :P_TABELA;';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_ITEM_SERVICO').AsInteger := vpItemServico;
      ParamByName('P_TABELA').AsString := vpTabela;

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
    viSQLDataSet.Free;
  end;
end;

procedure TSeloFundoDAO.Inserir(
  const vpSeloFundo: TSeloFundo;
  const vpUtilizarValorCalculado: Boolean = False);
var
  viSQLDataSet: TI9Query;
begin
  viSQLDataSet := TI9Query.Create(nil);
  viSQLDataSet.Connection := dtmControles.DB;

  try
    with viSQLDataSet do
    begin
      {$REGION 'Comando SQL INSERT'}
      SQL.Text :=
        'INSERT ' +

        {$REGION 'Cláusula INTO'}
        'INTO ' +
        'G_SELO_FUNDO ' +
        {$ENDREGION}

        {$REGION 'Colunas'}
        '(' +
        'SELO_FUNDO_ID, ' +
        'SELO_LIVRO_ID, ' +
        'FUNDO_TIPO_ID, ' +
        'VALOR, ' +
        'TABELA, ' +
        'ITEM_SERVICO, ' +
        'VALOR_DEDUCAO, ' +
        'COBRAR_PARTE ' +
        ') ' +
        {$ENDREGION}

        {$REGION 'Cláusula VALUES e Parâmetros'}
        'VALUES ' +
        '(' +
        ':P_SELO_FUNDO_ID, ' +
        ':P_SELO_LIVRO_ID, ' +
        ':P_FUNDO_TIPO_ID, ' +
        ':P_VALOR, ' +
        ':P_TABELA, ' +
        ':P_ITEM_SERVICO, ' +
        ':P_VALOR_DEDUCAO, ' +
        ':P_COBRAR_PARTE ' +
        ');';
        {$ENDREGION}

      {$ENDREGION}

      with vpSeloFundo do
      begin
        {$REGION 'Preencher valores dos parâmetros'}
        ParamByName('P_SELO_FUNDO_ID').AsInteger := 0;

        with ParamByName('P_SELO_LIVRO_ID') do
          if SeloLivroID > 0 then
            AsInteger := SeloLivroID
          else
          begin
            DataType := ftInteger;
            Clear;
            Bound := True;
          end;

        ParamByName('P_FUNDO_TIPO_ID').AsInteger := FundoTipo.FundoTipoID;

        if vpUtilizarValorCalculado then
          ParamByName('P_VALOR').AsCurrency := ValorCalculado
        else
          ParamByName('P_VALOR').AsCurrency := Valor;

        with ParamByName('P_TABELA') do
          if Tabela.IsEmpty then
          begin
            DataType := ftString;
            Clear;
            Bound := True;
          end
          else
            AsString := Tabela;

        with ParamByName('P_ITEM_SERVICO') do
          if ItemServico > 0 then
            AsInteger := ItemServico
          else
          begin
            DataType := ftInteger;
            Clear;
            Bound := True;
          end;

        if vpUtilizarValorCalculado then
          ParamByName('P_VALOR_DEDUCAO').AsCurrency := ValorDeducaoCalculado
        else
          ParamByName('P_VALOR_DEDUCAO').AsCurrency := ValorDeducao;

        ParamByName('P_COBRAR_PARTE').AsString := IfThen(
          CobrarParte,
          'S',
          'N');
        {$ENDREGION}

        ExecSQL;
      end;
    end;
  finally
    viSQLDataSet.Free;
  end;
end;

end.
