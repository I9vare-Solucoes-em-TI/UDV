unit RegimeBensDAOImpl;

interface

uses
  I9Query,
  I9Query,
  I9Connection,
  RegimeBensDAO,
  Data.SqlExpr,
  Data.DB,
  RegimeBens,
  RegimeBensList;

type
  TRegimeBensDAO = class(TInterfacedObject, IRegimeBensDAO)
  private
    FConnection: TI9Connection;
  public
    constructor Create(
      const vpConnection: TI9Connection); reintroduce;

    function Get(
      const vpValue: TDataSet): IRegimeBens; overload;

    function Get(
      const vpValue: TDataSet;
      const vpPrefix: string): IRegimeBens; overload;

    function GetByID(
      const vpValue: Variant): IRegimeBens;

    function GetList: TRegimeBensList; virtual; abstract;

    procedure Inserir(
      const vpValue: IRegimeBens); virtual; abstract;

    procedure Alterar(
      const vpValue: IRegimeBens); virtual; abstract;

    procedure Excluir(
      const vpValue: IRegimeBens); virtual; abstract;
  end;

implementation

uses
  RegimeBensImpl,
  System.Classes,
  System.SysUtils,
  BooleanHelper;

{ TRegimeBensDAO }

constructor TRegimeBensDAO.Create(
  const vpConnection: TI9Connection);
begin
  inherited Create;
  FConnection := vpConnection;
end;

function TRegimeBensDAO.Get(
  const vpValue: TDataSet): IRegimeBens;
{$REGION 'Variáveis'}
var
  viField: TField;
{$ENDREGION}
begin
  Result := TRegimeBens.Create;
  with vpValue, Result do
  begin
    viField := FindField('G_RB_TB_REGIMEBENS_ID');
    if Assigned(viField) then
      RegimeBensID := viField.AsInteger;

    viField := FindField('G_RB_DESCRICAO');
    if Assigned(viField) then
      Descricao := viField.AsString;

    viField := FindField('G_RB_SITUACAO');
    if Assigned(viField) then
      Situacao := Boolean.FromStringAtivoInativo(viField.AsString);
  end;
end;

function TRegimeBensDAO.Get(
  const vpValue: TDataSet;
  const vpPrefix: string): IRegimeBens;
{$REGION 'Variáveis'}
var
  viField: TField;
{$ENDREGION}
begin
  Result := TRegimeBens.Create;
  with vpValue, Result do
  begin
    viField := FindField(string.Format('G_RB%s_TB_REGIMEBENS_ID', [vpPrefix]));
    if Assigned(viField) then
      RegimeBensID := viField.AsInteger;

    viField := FindField(string.Format('G_RB%s_DESCRICAO', [vpPrefix]));
    if Assigned(viField) then
      Descricao := viField.AsString;

    viField := FindField(string.Format('G_RB%s_SITUACAO', [vpPrefix]));
    if Assigned(viField) then
      Situacao := Boolean.FromStringAtivoInativo(viField.AsString);
  end;
end;

function TRegimeBensDAO.GetByID(
  const vpValue: Variant): IRegimeBens;
{$REGION 'Constantes'}
const
  CI_CAPACITY: Integer = 7;
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viSQL: TStrings;
  viSQLText: string;
  viSQLDataSet: TI9Query;
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
      Add('G_RB.DESCRICAO G_RB_DESCRICAO,');
      Add('G_RB.SITUACAO G_RB_SITUACAO');
      {$ENDREGION}

      {$REGION 'Cláusula FROM'}
      Add('FROM');
      Add('G_TB_REGIMEBENS G_RB');
      {$ENDREGION}

      {$REGION 'Cláusula WHERE e Parâmetros'}
      Add('WHERE');
      Add('G_RB.TB_REGIMEBENS_ID = :P_TB_REGIMEBENS_ID');
      {$ENDREGION}

      {$ENDREGION}

      viSQLText := Text;
    end;
  finally
    FreeAndNil(viSQL);
  end;

  viSQLDataSet := TI9Query.Create(nil);
  try
    with viSQLDataSet do
    begin
      Connection := FConnection;
      SQL.Text := viSQLText;

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_TB_REGIMEBENS_ID').AsInteger := vpValue;
      {$ENDREGION}

      Open;

      try
        if IsEmpty then
          Exit;

        First;
        Result := Get(viSQLDataSet);
        Result.RegimeBensID := vpValue;
      finally
        Close;
      end;
    end;
  finally
    FreeAndNil(viSQLDataSet);
  end;
end;

end.
