unit SeloLoteDAO;

interface

uses
  I9Query,
  I9Connection,
  Data.SqlExpr,
  SeloLote;

type
  TSeloLoteDAO = class
  private
    FConnection: TI9Connection;
  public
    constructor Create(
      const vpConnection: TI9Connection); reintroduce;

    function Get(
      const vpSeloLoteID: Integer): ISeloLote;
  end;

implementation

uses
  Data.DB,
  SeloLoteImpl,
  System.SysUtils,
  BooleanHelper,
  SeloGrupoDAO,
  SituacaoSeloLote,
  SituacaoSeloLoteHelper,
  System.Math;

{ TSeloGrupoDAO }

constructor TSeloLoteDAO.Create(
  const vpConnection: TI9Connection);
begin
  inherited Create;
  FConnection := vpConnection;
end;

function TSeloLoteDAO.Get(
  const vpSeloLoteID: Integer): ISeloLote;
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
        'NUMERO_ATUAL, ' +
        'SITUACAO, ' +
        'DATA_LOTE, ' +
        'NUMERO_INICIAL, ' +
        'NUMERO_FINAL, ' +
        'OBSERVACAO, ' +
        'SELO_GRUPO_ID, ' +
        'SIGLA, ' +
        'NOTA_FISCAL, ' +
        'QUANTIDADE ' +
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_SELO_LOTE ' +
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +
        'SELO_LOTE_ID = :P_SELO_LOTE_ID;';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_SELO_LOTE_ID').AsInteger := vpSeloLoteID;
      {$ENDREGION}

      Open;

      try
        if IsEmpty then
          Exit;

        First;
        Result := TSeloLote.Create;

        with Result do
        begin
          SeloLoteID := vpSeloLoteID;
          NumeroAtual := FieldByName('NUMERO_ATUAL').AsInteger;

          Situacao := TSituacaoSeloLote.FromChar(
            FieldByName('SITUACAO').AsString.Chars[ZeroValue]);

          DataLote := FieldByName('DATA_LOTE').AsDateTime;
          NumeroInicial := FieldByName('NUMERO_INICIAL').AsInteger;
          NumeroFinal := FieldByName('NUMERO_FINAL').AsInteger;
          Observacao := FieldByName('OBSERVACAO').AsString;

          if FieldByName('SELO_GRUPO_ID').IsNull.&Not then
            with TSeloGrupoDAO.Create(FConnection) do
              try
                SeloGrupo := Get(FieldByName('SELO_GRUPO_ID').AsInteger);
              finally
                Free;
              end;

          Sigla := FieldByName('SIGLA').AsString;
          NotaFiscal := FieldByName('NOTA_FISCAL').AsString;
          Quantidade := FieldByName('QUANTIDADE').AsInteger;
        end;
      finally
        Close;
      end;
    end;
  finally
    FreeAndNil(viSQLDataSet);
  end;
end;

end.
