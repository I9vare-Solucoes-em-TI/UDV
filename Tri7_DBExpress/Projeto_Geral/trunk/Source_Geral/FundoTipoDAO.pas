unit FundoTipoDAO;

interface

uses
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
{$REGION 'Vari�veis'}
var
  viSQLDataSet: TSQLDataSet;
{$ENDREGION}
begin
  Result := TFundoTipos.Create;

  viSQLDataSet := TSQLDataSet.Create(nil);
  viSQLDataSet.SQLConnection := dtmControles.DB;

  try
    with viSQLDataSet do
    begin
      {$REGION 'Comando SQL SELECT'}
      CommandText :=
        'SELECT ' +

        {$REGION 'Colunas'}
        'FUNDO_TIPO_ID, ' +
        'DESCRICAO, ' +
        'SITUACAO, ' +
        'PERCENTUAL, ' +
        'SIGLA ' +
        {$ENDREGION}

        {$REGION 'Cl�usula FROM'}
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

