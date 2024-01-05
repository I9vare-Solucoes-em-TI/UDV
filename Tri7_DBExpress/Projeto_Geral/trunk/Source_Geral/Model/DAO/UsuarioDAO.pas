unit UsuarioDAO;

interface

uses
  Data.SqlExpr,
  Usuario;

type
  TUsuarioDAO = class
  private
    FSQLConnection: TSQLConnection;
  public
    constructor Create(
      const vpSQLConnection: TSQLConnection); reintroduce;

    function Get(
      const vpUsuarioID: Integer): IUsuario;
  end;

implementation

uses
  Data.DB,
  UsuarioImpl;

{ TUsuarioDAO }

constructor TUsuarioDAO.Create(
  const vpSQLConnection: TSQLConnection);
begin
  inherited Create;
  FSQLConnection := vpSQLConnection;
end;

function TUsuarioDAO.Get(
  const vpUsuarioID: Integer): IUsuario;
{$REGION 'Vari�veis'}
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
        'NOME_COMPLETO ' +
        {$ENDREGION}

        {$REGION 'Cl�usula FROM'}
        'FROM ' +
        'G_USUARIO ' +
        {$ENDREGION}

        {$REGION 'Cl�usula WHERE e Par�metros'}
        'WHERE ' +
        'USUARIO_ID = :P_USUARIO_ID;';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos par�metros'}
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
