unit NaturezaTituloDAO;

interface

uses
  I9Query,
  I9Connection,
  NaturezaTitulo,
  NaturezasTitulo;

type
  TNaturezaTituloDAO = class
  public
    function Get(
      const vpNaturezaTituloID: Integer): TNaturezaTitulo; overload;

    function Get(
      const vpSituacao: Boolean;
      const vpSistemaID: Integer): TNaturezasTitulo; overload;
  end;

implementation

uses
  Data.DB,
  Data.SqlExpr,
  Controles,
  System.SysUtils,
  ConfiguracaoRelatorioDAO,
  System.StrUtils;

{ TNaturezaTituloDAO }

function TNaturezaTituloDAO.Get(
  const vpNaturezaTituloID: Integer): TNaturezaTitulo;
{$REGION 'Variáveis'}
var
  viSQLDataSet: TI9Query;
  viConfiguracaoRelatorioDAO: TConfiguracaoRelatorioDAO;
{$ENDREGION}
begin
  Result := nil;

  viSQLDataSet := TI9Query.Create(nil);
  viSQLDataSet.Connection := dtmControles.DB;

  try
    with viSQLDataSet do
    begin
      {$REGION 'Comando SQL SELECT'}
      SQL.Text :=
        'SELECT ' +

        {$REGION 'Colunas'}
        'DESCRICAO, ' +
        'RELATORIO_CERTIDAO_IMAGEM, ' +
        'TIPO_TITULO ' +
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_NATUREZA_TITULO ' +
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +
        'NATUREZA_TITULO_ID = :P_NATUREZA_TITULO_ID;';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_NATUREZA_TITULO_ID').AsInteger := vpNaturezaTituloID;
      {$ENDREGION}

      Open;

      try
        if IsEmpty then
          Exit;

        First;

        Result := TNaturezaTitulo.Create(vpNaturezaTituloID,
          FieldByName('DESCRICAO').AsString);

        if FieldByName('RELATORIO_CERTIDAO_IMAGEM').AsInteger > 0 then
        begin
          viConfiguracaoRelatorioDAO := TConfiguracaoRelatorioDAO.Create(
            dtmControles.DB);

          try
            Result.RelatorioCertidaoImagem := viConfiguracaoRelatorioDAO.Get(
              FieldByName('RELATORIO_CERTIDAO_IMAGEM').AsInteger);
          finally
            viConfiguracaoRelatorioDAO.Free;
          end;
        end;

        Result.TipoTitulo := FieldByName(
          'TIPO_TITULO').AsString;
      finally
        Close;
      end;
    end;
  finally
    viSQLDataSet.Free;
  end;
end;

function TNaturezaTituloDAO.Get(
  const vpSituacao: Boolean;
  const vpSistemaID: Integer): TNaturezasTitulo;
{$REGION 'Variáveis'}
var
  viSQLDataSet: TI9Query;
{$ENDREGION}
begin
  Result := nil;

  viSQLDataSet := TI9Query.Create(nil);
  viSQLDataSet.Connection := dtmControles.DB;

  try
    with viSQLDataSet do
    begin
      {$REGION 'Comando SQL SELECT'}
      SQL.Text :=
        'SELECT ' +

        {$REGION 'Colunas'}
        'NATUREZA_TITULO_ID, ' +
        'DESCRICAO ' +
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_NATUREZA_TITULO ' +
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +
        'SISTEMA_ID = :P_SISTEMA_ID AND ' +
        'SITUACAO = :P_SITUACAO;';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_SISTEMA_ID').AsInteger := vpSistemaID;
      ParamByName('P_SITUACAO').AsString := IfThen(vpSituacao, 'A', 'I');
      {$ENDREGION}

      Open;

      try
        if IsEmpty then
          Exit;

        First;
        Result := TNaturezasTitulo.Create;

        while not Eof do
          try
            Result.Add(TNaturezaTitulo.Create(
              FieldByName('NATUREZA_TITULO_ID').AsInteger,
              FieldByName('DESCRICAO').AsString,
              vpSituacao,
              vpSistemaID));
          finally
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

end.
