unit ProfissaoDAOImpl;

interface

uses
  ProfissaoDAO,
  Data.SqlExpr,
  Data.DB,
  Profissao,
  ProfissaoList;

type
  TProfissaoDAO = class(TInterfacedObject, IProfissaoDAO)
  private
    FSQLConnection: TSQLConnection;
  public
    constructor Create(
      const vpSQLConnection: TSQLConnection); reintroduce;

    function Get(
      const vpValue: TDataSet): IProfissao; overload;

    function Get(
      const vpValue: TDataSet;
      const vpPrefix: string): IProfissao; overload;

    function GetByID(
      const vpValue: Variant): IProfissao; virtual; abstract;

    function GetList: TProfissaoList; virtual; abstract;

    function GetListBySituacao(
      const vpValue: Boolean): TProfissaoList;

    procedure Inserir(
      const vpValue: IProfissao); virtual; abstract;

    procedure Alterar(
      const vpValue: IProfissao); virtual; abstract;

    procedure Excluir(
      const vpValue: IProfissao); virtual; abstract;
  end;

implementation

uses
  ProfissaoImpl,
  System.SysUtils,
  BooleanHelper,
  System.Classes;

{ TProfissaoDAO }

constructor TProfissaoDAO.Create(
  const vpSQLConnection: TSQLConnection);
begin
  inherited Create;
  FSQLConnection := vpSQLConnection;
end;

function TProfissaoDAO.Get(
  const vpValue: TDataSet): IProfissao;
{$REGION 'Variáveis'}
var
  viField: TField;
{$ENDREGION}
begin
  Result := TProfissao.Create;
  with vpValue, Result do
  begin
    viField := FindField('G_P_TB_PROFISSAO_ID');
    if Assigned(viField) then
      ProfissaoID := viField.AsInteger;

    viField := FindField('G_P_DESCRICAO');
    if Assigned(viField) then
      Descricao := viField.AsString;

    viField := FindField('G_P_SITUACAO');
    if Assigned(viField) then
      Situacao := Boolean.FromStringAtivoInativo(viField.AsString);

    viField := FindField('G_P_CODIGO_CBO');
    if Assigned(viField) then
      CodigoCBO := viField.AsString;
  end;
end;

function TProfissaoDAO.Get(
  const vpValue: TDataSet;
  const vpPrefix: string): IProfissao;
{$REGION 'Variáveis'}
var
  viField: TField;
{$ENDREGION}
begin
  Result := TProfissao.Create;
  with vpValue, Result do
  begin
    viField := FindField(string.Format('G_P%s_TB_PROFISSAO_ID', [vpPrefix]));
    if Assigned(viField) then
      ProfissaoID := viField.AsInteger;

    viField := FindField(string.Format('G_P%s_DESCRICAO', [vpPrefix]));
    if Assigned(viField) then
      Descricao := viField.AsString;

    viField := FindField(string.Format('G_P%s_SITUACAO', [vpPrefix]));
    if Assigned(viField) then
      Situacao := Boolean.FromStringAtivoInativo(viField.AsString);

    viField := FindField(string.Format('G_P%s_CODIGO_CBO', [vpPrefix]));
    if Assigned(viField) then
      CodigoCBO := viField.AsString;
  end;
end;

function TProfissaoDAO.GetListBySituacao(
  const vpValue: Boolean): TProfissaoList;
{$REGION 'Constantes'}
const
  CI_CAPACITY: Integer = 8;
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viSQL: TStrings;
  viCommandText: string;
  viSQLDataSet: TSQLDataSet;
  viProfissao: IProfissao;
{$ENDREGION}
begin
  Result := TProfissaoList.Create;

  viSQL := TStringList.Create;
  try
    with viSQL do
    begin
      Capacity := CI_CAPACITY;

      {$REGION 'Comando SQL SELECT'}
      Add('SELECT');

      {$REGION 'Colunas'}
      Add('G_P.TB_PROFISSAO_ID G_P_TB_PROFISSAO_ID,');
      Add('G_P.DESCRICAO G_P_DESCRICAO,');
      Add('G_P.CODIGO_CBO G_P_CODIGO_CBO');
      {$ENDREGION}

      {$REGION 'Cláusula FROM'}
      Add('FROM');
      Add('G_TB_PROFISSAO G_P');
      {$ENDREGION}

      {$REGION 'Cláusula WHERE e Parâmetros'}
      Add('WHERE');
      Add('G_P.SITUACAO = :P_SITUACAO');
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
      ParamByName('P_SITUACAO').AsString := vpValue.ToCharAtivoInativo;
      {$ENDREGION}

      Open;

      try
        if IsEmpty then
          Exit;

        First;
        while Eof.&Not do
          try
            viProfissao := Get(viSQLDataSet);
            viProfissao.Situacao := vpValue;
            Result.Add(viProfissao);
          finally
            Next;
          end;

        Result.TrimExcess;
      finally
        Close;
      end;
    end;
  finally
    FreeAndNil(viSQLDataSet);
  end;
end;

end.
