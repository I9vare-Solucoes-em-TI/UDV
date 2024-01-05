unit UsuarioDAO;

interface

uses
  I9Query,
  I9Connection,
  Data.SqlExpr,
  Usuario;

type
  TUsuarioDAO = class
  private
    FConnection: TI9Connection;
  public
    constructor Create(
      const vpConnection: TI9Connection); reintroduce;

    function Get(
      const vpUsuarioID: Integer): IUsuario;
  end;

implementation

uses
  Data.DB,
  UsuarioImpl;

{ TUsuarioDAO }

constructor TUsuarioDAO.Create(
  const vpConnection: TI9Connection);
begin
  inherited Create;
  FConnection := vpConnection;
end;

function TUsuarioDAO.Get(
  const vpUsuarioID: Integer): IUsuario;
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
        'NOME_COMPLETO ' +
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_USUARIO ' +
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +
        'USUARIO_ID = :P_USUARIO_ID;';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_USUARIO_ID').AsInteger := vpUsuarioID;
      {$ENDREGION}

      Open;

      try
        if IsEmpty then
          Exit;

        First;
        Result := TUsuario.Create;

        with Result do
        begin
          UsuarioID := vpUsuarioID;
          NomeCompleto := FieldByName('NOME_COMPLETO').AsString;
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
