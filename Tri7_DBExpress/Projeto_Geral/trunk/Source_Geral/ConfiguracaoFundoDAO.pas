unit ConfiguracaoFundoDAO;

interface

uses
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
  ConfiguracaoFundo;

{ TConfiguracaoFundoDAO }

function TConfiguracaoFundoDAO.Get(
  const vpValue: TEmolumento): TConfiguracoesFundo;
{$REGION 'Vari�veis'}
var
  viSQLDataSet: TSQLDataSet;
{$ENDREGION}
begin
  Result := nil;

  viSQLDataSet := TSQLDataSet.Create(nil);
  viSQLDataSet.SQLConnection := dtmControles.DB;

  try
    with viSQLDataSet do
    begin
      {$REGION 'Comando SQL SELECT'}
      CommandText :=
        'SELECT ' +

        {$REGION 'Colunas'}
        'CONFIGURACAO_FUNDO_ID, ' +
        'FUNDO_TIPO_ID ' +
        {$ENDREGION}

        {$REGION 'Cl�usula FROM'}
        'FROM ' +
        'G_FUNDO_CONFIG ' +
        {$ENDREGION}

        {$REGION 'Cl�usula WHERE e Par�metros'}
        'WHERE ' +
        'EMOLUMENTO_ID = :P_EMOLUMENTO_ID;';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos par�metros'}
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
              vgFundoTipos.Get(FieldByName('FUNDO_TIPO_ID').AsInteger),
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
