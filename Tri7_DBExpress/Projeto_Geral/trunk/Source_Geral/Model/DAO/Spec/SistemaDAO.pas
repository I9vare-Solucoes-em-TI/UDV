unit SistemaDAO;

interface

uses
  I9Query,
  I9Connection,
  DAO,
  Sistema,
  SistemaList,
  Data.SqlExpr;

type
  ISistemaDAO = interface(IDAO<ISistema, TSistemaList>)
    ['{DE049CFD-69B6-4201-A689-D7C3E724DEF8}']
  end;

  TSistemaDAO = class
  private
    FConnection: TI9Connection;
  public
    constructor Create(
      const vpConnection: TI9Connection); reintroduce;

    function Get(
      const vpSistemaID: Integer): ISistema;
  end;

implementation

uses
  System.SysUtils,
  Data.DB,
  SistemaImpl,
  BooleanHelper;

{ TSistemaDAO }

constructor TSistemaDAO.Create(
  const vpConnection: TI9Connection);
begin
  inherited Create;
  FConnection := vpConnection;
end;

function TSistemaDAO.Get(
  const vpSistemaID: Integer): ISistema;
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
        'VERSAO ' +
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_SISTEMA ' +
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +
        'SISTEMA_ID = :P_SISTEMA_ID;';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_SISTEMA_ID').AsInteger := vpSistemaID;
      {$ENDREGION}

      Open;

      try
        if IsEmpty then
          Exit;

        First;
        Result := TSistema.Create;

        with Result do
        begin
          SistemaID := vpSistemaID;
          Descricao := FieldByName('DESCRICAO').AsString;

          Situacao := Boolean.FromStringAtivoInativo(
            FieldByName('SITUACAO').AsString);

          Versao := FieldByName('VERSAO').AsString;
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
