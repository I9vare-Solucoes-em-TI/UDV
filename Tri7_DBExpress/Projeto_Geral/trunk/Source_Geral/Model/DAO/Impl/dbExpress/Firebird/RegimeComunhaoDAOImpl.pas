unit RegimeComunhaoDAOImpl;

interface

uses
  RegimeComunhaoDAO,
  Data.SqlExpr,
  Data.DB,
  RegimeComunhao,
  RegimeComunhaoList;

type
  TRegimeComunhaoDAO = class(TInterfacedObject, IRegimeComunhaoDAO)
  private
    FSQLConnection: TSQLConnection;
  public
    constructor Create(
      const vpSQLConnection: TSQLConnection); reintroduce;

    function Get(
      const vpValue: TDataSet): IRegimeComunhao; overload;

    function Get(
      const vpValue: TDataSet;
      const vpPrefix: string): IRegimeComunhao; overload;

    function GetByID(
      const vpValue: Variant): IRegimeComunhao;

    function GetList: TRegimeComunhaoList; virtual; abstract;

    function GetListBySituacao(
      const vpValue: Boolean): TRegimeComunhaoList;

    procedure Inserir(
      const vpValue: IRegimeComunhao); virtual; abstract;

    procedure Alterar(
      const vpValue: IRegimeComunhao); virtual; abstract;

    procedure Excluir(
      const vpValue: IRegimeComunhao); virtual; abstract;
  end;

implementation

uses
  RegimeComunhaoImpl,
  System.Classes,
  System.SysUtils,
  BooleanHelper,
  RegimeBensDAOImpl;

{ TRegimeComunhaoDAO }

constructor TRegimeComunhaoDAO.Create(
  const vpSQLConnection: TSQLConnection);
begin
  inherited Create;
  FSQLConnection := vpSQLConnection;
end;

function TRegimeComunhaoDAO.Get(
  const vpValue: TDataSet): IRegimeComunhao;
{$REGION 'Variáveis'}
var
  viField: TField;
  viRegimeBensDAO: TRegimeBensDAO;
{$ENDREGION}
begin
  Result := TRegimeComunhao.Create;
  with vpValue, Result do
  begin
    viField := FindField('G_RC_TB_REGIMECOMUNHAO_ID');
    if Assigned(viField) then
      RegimeComunhaoID := viField.AsInteger;

    viField := FindField('G_RC_DESCRICAO');
    if Assigned(viField) then
      Descricao := viField.AsString;

    viField := FindField('G_RC_TEXTO');
    if Assigned(viField) then
      Texto := viField.AsString;

    viField := FindField('G_RC_SITUACAO');
    if Assigned(viField) then
      Situacao := Boolean.FromStringAtivoInativo(viField.AsString);

    viField := FindField('G_RB_TB_REGIMEBENS_ID');
    if Assigned(viField) and
      viField.IsNull.&Not then
    begin
      viRegimeBensDAO := TRegimeBensDAO.Create(FSQLConnection);
      try
        RegimeBens := viRegimeBensDAO.Get(vpValue);
      finally
        FreeAndNil(viRegimeBensDAO);
      end;
    end;
  end;
end;

function TRegimeComunhaoDAO.Get(
  const vpValue: TDataSet;
  const vpPrefix: string): IRegimeComunhao;
{$REGION 'Variáveis'}
var
  viField: TField;
  viRegimeBensDAO: TRegimeBensDAO;
{$ENDREGION}
begin
  Result := TRegimeComunhao.Create;
  with vpValue, Result do
  begin
    viField := FindField(string.Format(
      'G_RC%s_TB_REGIMECOMUNHAO_ID', [vpPrefix]));
    if Assigned(viField) then
      RegimeComunhaoID := viField.AsInteger;

    viField := FindField(string.Format('G_RC%s_DESCRICAO', [vpPrefix]));
    if Assigned(viField) then
      Descricao := viField.AsString;

    viField := FindField(string.Format('G_RC%s_TEXTO', [vpPrefix]));
    if Assigned(viField) then
      Texto := viField.AsString;

    viField := FindField(string.Format('G_RC%s_SITUACAO', [vpPrefix]));
    if Assigned(viField) then
      Situacao := Boolean.FromStringAtivoInativo(viField.AsString);

    viField := FindField(string.Format('G_RB%s_TB_REGIMEBENS_ID', [vpPrefix]));
    if Assigned(viField) and
      viField.IsNull.&Not then
    begin
      viRegimeBensDAO := TRegimeBensDAO.Create(FSQLConnection);
      try
        RegimeBens := viRegimeBensDAO.Get(vpValue, vpPrefix);
      finally
        FreeAndNil(viRegimeBensDAO);
      end;
    end;
  end;
end;

function TRegimeComunhaoDAO.GetByID(
  const vpValue: Variant): IRegimeComunhao;
{$REGION 'Constantes'}
const
  CI_CAPACITY: Integer = 15;
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
      Add('G_RC.DESCRICAO G_RC_DESCRICAO,');
      Add('G_RC.TEXTO G_RC_TEXTO,');
      Add('G_RC.SITUACAO G_RC_SITUACAO,');
      Add('G_RB.TB_REGIMEBENS_ID G_RB_TB_REGIMEBENS_ID,');
      Add('G_RB.DESCRICAO G_RB_DESCRICAO,');
      Add('G_RB.SITUACAO G_RB_SITUACAO');
      {$ENDREGION}

      {$REGION 'Cláusula FROM'}
      Add('FROM');
      Add('G_TB_REGIMECOMUNHAO G_RC');
      {$ENDREGION}

      {$REGION 'Cláusula LEFT JOIN'}
      Add('LEFT JOIN');
      Add('G_TB_REGIMEBENS G_RB');

      {$REGION 'Cláusula ON'}
      Add('ON');
      Add('G_RC.TB_REGIMEBENS_ID = G_RB.TB_REGIMEBENS_ID');
      {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Cláusula WHERE e Parâmetros'}
      Add('WHERE');
      Add('G_RC.TB_REGIMECOMUNHAO_ID = :P_TB_REGIMECOMUNHAO_ID');
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
      ParamByName('P_TB_REGIMECOMUNHAO_ID').AsInteger := vpValue;
      {$ENDREGION}

      Open;

      try
        if IsEmpty then
          Exit;

        First;
        Result := Get(viSQLDataSet);
        Result.RegimeComunhaoID := vpValue;
      finally
        Close;
      end;
    end;
  finally
    FreeAndNil(viSQLDataSet);
  end;
end;

function TRegimeComunhaoDAO.GetListBySituacao(
  const vpValue: Boolean): TRegimeComunhaoList;
{$REGION 'Constantes'}
const
  CI_CAPACITY: Integer = 15;
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viSQL: TStrings;
  viCommandText: string;
  viSQLDataSet: TSQLDataSet;
  viRegimeComunhao: IRegimeComunhao;
{$ENDREGION}
begin
  Result := TRegimeComunhaoList.Create;

  viSQL := TStringList.Create;
  try
    with viSQL do
    begin
      Capacity := CI_CAPACITY;

      {$REGION 'Comando SQL SELECT'}
      Add('SELECT');

      {$REGION 'Colunas'}
      Add('G_RC.TB_REGIMECOMUNHAO_ID G_RC_TB_REGIMECOMUNHAO_ID,');
      Add('G_RC.DESCRICAO G_RC_DESCRICAO,');
      Add('G_RC.TEXTO G_RC_TEXTO,');
      Add('G_RB.TB_REGIMEBENS_ID G_RB_TB_REGIMEBENS_ID,');
      Add('G_RB.DESCRICAO G_RB_DESCRICAO,');
      Add('G_RB.SITUACAO G_RB_SITUACAO');
      {$ENDREGION}

      {$REGION 'Cláusula FROM'}
      Add('FROM');
      Add('G_TB_REGIMECOMUNHAO G_RC');
      {$ENDREGION}

      {$REGION 'Cláusula LEFT JOIN'}
      Add('LEFT JOIN');
      Add('G_TB_REGIMEBENS G_RB');

      {$REGION 'Cláusula ON'}
      Add('ON');
      Add('G_RC.TB_REGIMEBENS_ID = G_RB.TB_REGIMEBENS_ID');
      {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Cláusula WHERE e Parâmetros'}
      Add('WHERE');
      Add('G_RC.SITUACAO = :P_SITUACAO');
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
            viRegimeComunhao := Get(viSQLDataSet);
            viRegimeComunhao.Situacao := vpValue;
            Result.Add(viRegimeComunhao);
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
