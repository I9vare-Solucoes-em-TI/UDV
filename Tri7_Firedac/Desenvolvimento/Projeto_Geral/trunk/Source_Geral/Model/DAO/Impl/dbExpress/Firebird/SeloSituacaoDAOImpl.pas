unit SeloSituacaoDAOImpl;

interface

uses
  FireDAC.Stan.Param,
  I9Connection,
  SeloSituacaoDAO,
  Data.SqlExpr,
  Data.DB,
  SeloSituacao,
  SeloSituacaoList;

type
  TSeloSituacaoDAO = class(TInterfacedObject, ISeloSituacaoDAO)
  private
    FConnection: TI9Connection;
  public
    constructor Create(
      const vpConnection: TI9Connection); reintroduce;

    function Get(
      const vpValue: TDataSet): ISeloSituacao;

    function GetByID(
      const vpValue: Variant): ISeloSituacao;

    function GetList: TSeloSituacaoList; virtual; abstract;

    class function GetColunas: string; static;

    procedure Inserir(
      const vpValue: ISeloSituacao); virtual; abstract;

    procedure Alterar(
      const vpValue: ISeloSituacao); virtual; abstract;

    procedure Excluir(
      const vpValue: ISeloSituacao); virtual; abstract;
  end;

implementation

uses
  SeloSituacaoImpl,
  System.SysUtils,
  BooleanHelper;

{ TSeloSituacaoDAO }

constructor TSeloSituacaoDAO.Create(
  const vpConnection: TI9Connection);
begin
  inherited Create;
  FConnection := vpConnection;
end;

function TSeloSituacaoDAO.Get(
  const vpValue: TDataSet): ISeloSituacao;
{$REGION 'Variáveis'}
var
  viField: TField;
{$ENDREGION}
begin
  Result := TSeloSituacao.Create;
  with vpValue, Result do
  begin
    viField := FindField('G_SS_SELO_SITUACAO_ID');
    if Assigned(viField) then
      SeloSituacaoID := viField.AsInteger;

    viField := FindField('G_SS_DESCRICAO');
    if Assigned(viField) then
      Descricao := viField.AsString;

    viField := FindField('G_SS_SITUACAO');
    if Assigned(viField) then
      Situacao := Boolean.FromStringAtivoInativo(viField.AsString);
  end;
end;

function TSeloSituacaoDAO.GetByID(
  const vpValue: Variant): ISeloSituacao;
{$REGION 'Variáveis'}
var
  viSQL: string;
  viParams: TFDParams;
  viDataSet: TDataSet;
{$ENDREGION}
begin
  Result := nil;

  viSQL := {$REGION 'Comando SQL SELECT'}
    'SELECT ' +

    GetColunas + ' ' +

    {$REGION 'Cláusula FROM'}
    'FROM ' +
    'G_SELO_SITUACAO G_SS ' +
    {$ENDREGION}

    {$REGION 'Cláusula WHERE e Parâmetros'}
    'WHERE ' +
    'G_SS.SELO_SITUACAO_ID = :P_SELO_SITUACAO_ID';
    {$ENDREGION}

  {$ENDREGION}

  viParams := TFDParams.Create;
  try
    viParams.CreateParam(TFieldType.ftInteger, 'P_SELO_SITUACAO_ID',
      TParamType.ptInput).AsInteger := vpValue;

    FConnection.Execute(viSQL, viParams, viDataSet);
    try
      if viDataSet.IsEmpty then
        Exit;

      try
        viDataSet.First;
        Result := Get(viDataSet);
        Result.SeloSituacaoID := vpValue;
      finally
        viDataSet.Close;
      end;
    finally
      FreeAndNil(viDataSet);
    end;
  finally
    FreeAndNil(viParams);
  end;
end;

class function TSeloSituacaoDAO.GetColunas: string;
begin
  Result := {$REGION 'Colunas'}
    'G_SS.SELO_SITUACAO_ID G_SS_SELO_SITUACAO_ID, ' +
    'G_SS.DESCRICAO G_SS_DESCRICAO, ' +
    'G_SS.SITUACAO G_SS_SITUACAO';
  {$ENDREGION}
end;

end.
