unit ConfiguracaoFundoDAO;

interface

uses
  I9Query,
  I9Query,
  I9Connection,
  EmolumentoImpl,
  ConfiguracoesFundo,
  Data.SqlExpr;

type
  TConfiguracaoFundoDAO = class
  public
    function Get(
      const vpValue: TEmolumento): TConfiguracoesFundo;
  end;

implementation

uses
  Data.DB,
  Controles,
  ConfiguracaoFundo,
  Lookup;

{ TConfiguracaoFundoDAO }

function TConfiguracaoFundoDAO.Get(
  const vpValue: TEmolumento): TConfiguracoesFundo;
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
        'CONFIGURACAO_FUNDO_ID, ' +
        'FUNDO_TIPO_ID ' +
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_FUNDO_CONFIG ' +
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +
        'EMOLUMENTO_ID = :P_EMOLUMENTO_ID;';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_EMOLUMENTO_ID').AsInteger := vpValue.EmolumentoID;
      {$ENDREGION}

      Open;

      try
        if IsEmpty then
          Exit;

        First;
        Result := TConfiguracoesFundo.Create;

        while not Eof do
          try
            Result.Add(TConfiguracaoFundo.Create(
              FieldByName('CONFIGURACAO_FUNDO_ID').AsInteger,
              dtmLookup.GetFundoTipos.Get(
                FieldByName('FUNDO_TIPO_ID').AsInteger),
              vpValue));
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
