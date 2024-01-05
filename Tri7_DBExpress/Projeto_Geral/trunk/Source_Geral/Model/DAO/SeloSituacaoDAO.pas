unit SeloSituacaoDAO;

interface

uses
  Data.SqlExpr,
  SeloSituacao;

type
  TSeloSituacaoDAO = class
  private
    FSQLConnection: TSQLConnection;
  public
    constructor Create(
      const vpSQLConnection: TSQLConnection); reintroduce;

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
  const vpSQLConnection: TSQLConnection);
begin
  inherited Create;
  FSQLConnection := vpSQLConnection;
end;

function TSeloSituacaoDAO.Get(
  const vpSeloSituacaoID: Integer): ISeloSituacao;
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
            with TSistemaDAO.Create(FSQLConnection) do
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
