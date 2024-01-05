unit SistemaDAO;

interface

uses
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
    FSQLConnection: TSQLConnection;
  public
    constructor Create(
      const vpSQLConnection: TSQLConnection); reintroduce;

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
  const vpSQLConnection: TSQLConnection);
begin
  inherited Create;
  FSQLConnection := vpSQLConnection;
end;

function TSistemaDAO.Get(
  const vpSistemaID: Integer): ISistema;
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
