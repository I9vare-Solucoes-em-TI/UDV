unit SistemaDAOImpl;

interface

uses
  I9Query,
  I9Connection,
  SistemaDAO,
  FireDAC.Comp.Client,
  Data.DB,
  Sistema,
  SistemaList;

type
  TSistemaDAO = class(TInterfacedObject, ISistemaDAO)
  private
    FFDConnection: TI9Connection;
  public
    constructor Create(
      const vpFDConnection: TI9Connection); reintroduce;

    function Get(
      const vpValue: TDataSet): ISistema;

    function GetByID(
      const vpValue: Variant): ISistema;

    function GetList: TSistemaList; virtual; abstract;

    procedure Inserir(
      const vpValue: ISistema); virtual; abstract;

    procedure Alterar(
      const vpValue: ISistema); virtual; abstract;

    procedure Excluir(
      const vpValue: ISistema); virtual; abstract;
  end;

implementation

uses
  System.SysUtils,
  BooleanHelper,
  SistemaImpl;

{ TSistemaDAO }

constructor TSistemaDAO.Create(
  const vpFDConnection: TI9Connection);
begin
  inherited Create;
  FFDConnection := vpFDConnection;
end;

function TSistemaDAO.Get(
  const vpValue: TDataSet): ISistema;
{$REGION 'Variáveis'}
var
  viField: TField;
{$ENDREGION}
begin
  Result := TSistema.Create;

  with vpValue, Result do
  begin
    viField := FindField('G_S_SISTEMA_ID');
    if Assigned(viField) then
      SistemaID := viField.AsInteger;

    viField := FindField('G_S_DESCRICAO');
    if Assigned(viField) then
      Descricao := viField.AsString;

    viField := FindField('G_S_SITUACAO');
    if Assigned(viField) then
      Situacao := Boolean.FromStringAtivoInativo(viField.AsString);

    viField := FindField('G_S_VERSAO');
    if Assigned(viField) then
      Versao := viField.AsString;
  end;
end;

function TSistemaDAO.GetByID(
  const vpValue: Variant): ISistema;
{$REGION 'Constantes'}
const
  CI_CAPACITY: Integer = 8;
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viFDQuery: TI9Query;
{$ENDREGION}
begin
  Result := nil;

  viFDQuery := TI9Query.Create(nil);
  viFDQuery.Connection := FFDConnection;

  try
    with viFDQuery do
    begin
      with SQL do
      begin
        Capacity := CI_CAPACITY;

        {$REGION 'Comando SQL SELECT'}
        Add('SELECT');

        {$REGION 'Colunas'}
        Add('G_S.DESCRICAO G_S_DESCRICAO,');
        Add('G_S.SITUACAO G_S_SITUACAO,');
        Add('G_S.VERSAO G_S_VERSAO');
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        Add('FROM');
        Add('G_SISTEMA G_S');
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        Add('WHERE');
        Add('G_S.SISTEMA_ID = :P_SISTEMA_ID;');
        {$ENDREGION}

        {$ENDREGION}
      end;

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_SISTEMA_ID').AsInteger := vpValue;
      {$ENDREGION}

      Open;

      try
        if IsEmpty then
          Exit;

        First;
        Result := Get(viFDQuery);
        Result.SistemaID := vpValue;
      finally
        Close;
      end;
    end;
  finally
    FreeAndNil(viFDQuery);
  end;
end;

end.
