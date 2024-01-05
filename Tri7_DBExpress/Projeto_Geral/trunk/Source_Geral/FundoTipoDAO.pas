unit FundoTipoDAO;

interface

uses
  I9Query,
  I9Connection,
  FundoTipo;

type
  TFundoTipoDAO = class
  public
    function Get: TFundoTipos;
  end;

implementation

uses
  Data.DB,
  Data.SqlExpr,
  Controles;

{ TFundoTipoDAO }

function TFundoTipoDAO.Get: TFundoTipos;
{$REGION 'Variáveis'}
var
  viSQLDataSet: TI9Query;
{$ENDREGION}
begin
  Result := TFundoTipos.Create;

  viSQLDataSet := TI9Query.Create(nil);
  viSQLDataSet.Connection := dtmControles.DB;

  try
    with viSQLDataSet do
    begin
      {$REGION 'Comando SQL SELECT'}
      SQL.Text :=
        'SELECT ' +

        {$REGION 'Colunas'}
        'FUNDO_TIPO_ID, ' +
        'DESCRICAO, ' +
        'SITUACAO, ' +
        'PERCENTUAL, ' +
        'SIGLA ' +
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_FUNDO_TIPO;';
        {$ENDREGION}

      {$ENDREGION}

      Open;

      try
        if IsEmpty then
          Exit;

        First;

        while not Eof do
        begin
          Result.Add(TFundoTipo.Create(
            FieldByName('FUNDO_TIPO_ID').AsInteger,
            FieldByName('DESCRICAO').AsString,
            FieldByName('PERCENTUAL').AsFloat,
            TFundoTipo.GetSituacaoAsBoolean(FieldByName('SITUACAO').AsString),
            FieldByName(
              'SIGLA').AsString));
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

