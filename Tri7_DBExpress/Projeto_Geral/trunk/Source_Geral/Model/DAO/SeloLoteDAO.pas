unit SeloLoteDAO;

interface

uses
  Data.SqlExpr,
  SeloLote;

type
  TSeloLoteDAO = class
  private
    FSQLConnection: TSQLConnection;
  public
    constructor Create(
      const vpSQLConnection: TSQLConnection); reintroduce;

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
  const vpSQLConnection: TSQLConnection);
begin
  inherited Create;
  FSQLConnection := vpSQLConnection;
end;

function TSeloLoteDAO.Get(
  const vpSeloLoteID: Integer): ISeloLote;
{$REGION 'Variáveis'}
var
  viSQLDataSet: TSQLDataSet;
{$ENDREGION}
begin
  Result := nil;

  viSQLDataSet := TSQLDataSet.Create(nil);
  viSQLDataSet.SQLConnection := FSQLConnection;

  try
    with viSQLDataSet do
    begin
      {$REGION 'Comando SQL SELECT'}
      CommandText :=
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
            with TSeloGrupoDAO.Create(FSQLConnection) do
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
