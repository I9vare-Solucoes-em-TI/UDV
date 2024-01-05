unit SeloSituacaoDAO;

interface

uses
  I9Query,
  I9Query,
  I9Connection,
  Data.SqlExpr,
  SeloSituacao;

type
  TSeloSituacaoDAO = class
  private
    FConnection: TI9Connection;
  public
    constructor Create(
      const vpConnection: TI9Connection); reintroduce;

    function Get(
      const vpSeloSituacaoID: Integer): ISeloSituacao;
  end;

implementation

uses
  Data.DB,
  SeloSituacaoImpl,
  System.SysUtils,
  BooleanHelper,
  SistemaDAO;

{ TSeloSituacaoDAO }

constructor TSeloSituacaoDAO.Create(
  const vpConnection: TI9Connection);
begin
  inherited Create;
  FConnection := vpConnection;
end;

function TSeloSituacaoDAO.Get(
  const vpSeloSituacaoID: Integer): ISeloSituacao;
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
        'DESCRICAO, ' +
        'SITUACAO, ' +
        'SISTEMA_ID '+
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_SELO_SITUACAO ' +
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +
        'SELO_SITUACAO_ID = :P_SELO_SITUACAO_ID;';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_SELO_SITUACAO_ID').AsInteger := vpSeloSituacaoID;
      {$ENDREGION}

      Open;

      try
        if IsEmpty then
          Exit;

        First;
        Result := TSeloSituacao.Create;

        with Result do
        begin
          SeloSituacaoID := vpSeloSituacaoID;
          Descricao := FieldByName('DESCRICAO').AsString;

          Situacao := Boolean.FromStringAtivoInativo(
            FieldByName('SITUACAO').AsString);

          if FieldByName('SISTEMA_ID').IsNull.&Not then
            with TSistemaDAO.Create(FConnection) do
              try
                Sistema := Get(FieldByName('SISTEMA_ID').AsInteger);
              finally
                Free;
              end;
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
