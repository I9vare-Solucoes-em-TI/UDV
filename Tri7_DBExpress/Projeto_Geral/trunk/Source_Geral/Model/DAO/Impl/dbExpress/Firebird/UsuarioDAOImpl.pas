unit UsuarioDAOImpl;

interface

uses
  UsuarioDAO,
  Data.SqlExpr,
  Data.DB,
  Usuario,
  UsuarioList;

type
  TUsuarioDAO = class(TInterfacedObject, IUsuarioDAO)
  private
    FSQLConnection: TSQLConnection;
  public
    constructor Create(
      const vpSQLConnection: TSQLConnection); reintroduce;

    function Get(
      const vpValue: TDataSet;
      const vpPrefix: string = ''): IUsuario;

    function GetByID(
      const vpValue: Variant): IUsuario;

    function GetList: TUsuarioList; virtual; abstract;

    class function GetColunas(
      const vpPrefix: string = ''): string; static;

    class function New(
      const vpSQLConnection: TSQLConnection): IUsuarioDAO; static;

    procedure Inserir(
      const vpValue: IUsuario); virtual; abstract;

    procedure Alterar(
      const vpValue: IUsuario); virtual; abstract;

    procedure Excluir(
      const vpValue: IUsuario); virtual; abstract;
  end;

implementation

uses
  UsuarioImpl,
  System.SysUtils,
  System.Classes;

{ TUsuarioDAO }

constructor TUsuarioDAO.Create(
  const vpSQLConnection: TSQLConnection);
begin
  inherited Create;
  FSQLConnection := vpSQLConnection;
end;

function TUsuarioDAO.Get(
  const vpValue: TDataSet;
  const vpPrefix: string): IUsuario;
{$REGION 'Variáveis'}
var
  viField: TField;
{$ENDREGION}
begin
  Result := TUsuario.Create;
  with vpValue, Result do
  begin
    viField := FindField(string.Format('G_U%s_USUARIO_ID', [vpPrefix]));
    if Assigned(viField) then
      UsuarioID := viField.AsInteger;

    viField := FindField(string.Format('G_U%s_NOME_COMPLETO', [vpPrefix]));
    if Assigned(viField) then
      NomeCompleto := viField.AsString;
  end;
end;

function TUsuarioDAO.GetByID(
  const vpValue: Variant): IUsuario;
{$REGION 'Constantes'}
const
  CI_CAPACITY: Integer = 6;
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viSQL: TStrings;
  viCommandText: string;
  viSQLDataSet: TSQLDataSet;
{$ENDREGION}
begin
  Result := nil;

  viSQL := TStringList.Create;
  try
    with viSQL do
    begin
      Capacity := CI_CAPACITY;

      {$REGION 'Comando SQL SELECT'}
      Add('SELECT');

      {$REGION 'Colunas'}
      Add('G_U.NOME_COMPLETO G_U_NOME_COMPLETO');
      {$ENDREGION}

      {$REGION 'Cláusula FROM'}
      Add('FROM');
      Add('G_USUARIO G_U');
      {$ENDREGION}

      {$REGION 'Cláusula WHERE e Parâmetros'}
      Add('WHERE');
      Add('G_U.USUARIO_ID = :P_USUARIO_ID');
      {$ENDREGION}

      {$ENDREGION}

      viCommandText := Text;
    end;
  finally
    FreeAndNil(viSQL);
  end;

  viSQLDataSet := TSQLDataSet.Create(nil);
  try
    with viSQLDataSet do
    begin
      SQLConnection := FSQLConnection;
      CommandText := viCommandText;

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_USUARIO_ID').AsInteger := vpValue;
      {$ENDREGION}

      Open;
      try
        if IsEmpty then
          Exit;

        First;
        Result := Get(viSQLDataSet);
        Result.UsuarioID := vpValue;
      finally
        Close;
      end;
    end;
  finally
    FreeAndNil(viSQLDataSet);
  end;
end;

class function TUsuarioDAO.GetColunas(
  const vpPrefix: string): string;
begin
  Result := {$REGION 'Colunas'}
    string.Format('G_U%s.USUARIO_ID G_U%s_USUARIO_ID, ', [vpPrefix, vpPrefix]) +

    string.Format('G_U%s.NOME_COMPLETO G_U%s_NOME_COMPLETO',
      [vpPrefix, vpPrefix]);
  {$ENDREGION}
end;

class function TUsuarioDAO.New(
  const vpSQLConnection: TSQLConnection): IUsuarioDAO;
begin
  Result := TUsuarioDAO.Create(vpSQLConnection);
end;

end.
