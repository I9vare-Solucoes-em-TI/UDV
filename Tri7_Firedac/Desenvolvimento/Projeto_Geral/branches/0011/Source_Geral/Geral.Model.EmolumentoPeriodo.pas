unit Geral.Model.EmolumentoPeriodo;

interface

uses
  Geral.Model.DAO,
  FireDAC.Stan.Param,
  Data.DB,
  System.Generics.Collections;

type
  TEmolumentoPeriodo = class
  private
    FEmolumentoPeriodoID: Integer;
    FDescricao: string;
    FSituacao: string;
    FDataInicial: TDateTime;
  public
    property EmolumentoPeriodoID: Integer read FEmolumentoPeriodoID write FEmolumentoPeriodoID;
    property Descricao: string read FDescricao write FDescricao;
    property Situacao: string read FSituacao write FSituacao;
    property DataInicial: TDateTime read FDataInicial write FDataInicial;
  end;

  TEmolumentoPeriodoDAO = class(TDAO<TEmolumentoPeriodo>)
  protected
    function CreateObject(
      const vpDataSet: TDataSet): TEmolumentoPeriodo; override;

    function GetTableName: string; override;
    function GetColumns: TArray<string>; override;

    procedure FillParams(
      const vpParams: TFDParams;
      const vpIndex: Integer;
      const vpValue: TEmolumentoPeriodo); override;
  public
    function Listar(
      const vpSituacao: string;
      const vpOrder: string): TObjectList<TEmolumentoPeriodo>;
  end;

  TEmolumentoPeriodoBusiness = class
  public
    function ListarAtivos: TObjectList<TEmolumentoPeriodo>;

    function Buscar(
      const vpEmolumentoPeriodoID: Integer): TEmolumentoPeriodo;
  end;

implementation

uses
  System.StrUtils,
  Controles;

{ TEmolumentoPeriodoDAO }

function TEmolumentoPeriodoDAO.CreateObject(
  const vpDataSet: TDataSet): TEmolumentoPeriodo;
begin
  Result := TEmolumentoPeriodo.Create;

  Result.EmolumentoPeriodoID := vpDataSet.FieldByName(
    'EMOLUMENTO_PERIODO_ID').AsInteger;

  Result.Descricao := vpDataSet.FieldByName(
    'DESCRICAO').AsString;

  Result.Situacao := vpDataSet.FieldByName(
    'SITUACAO').AsString;

  Result.DataInicial := vpDataSet.FieldByName(
    'DATA_INICIAL').AsDateTime;
end;

procedure TEmolumentoPeriodoDAO.FillParams(
  const vpParams: TFDParams;
  const vpIndex: Integer;
  const vpValue: TEmolumentoPeriodo);
begin
  vpParams.ParamByName(
    'EMOLUMENTO_PERIODO_ID').AsIntegers[vpIndex] := vpValue.EmolumentoPeriodoID;

  vpParams.ParamByName(
    'DESCRICAO').AsStrings[vpIndex] := vpValue.Descricao;

  vpParams.ParamByName(
    'SITUACAO').AsStrings[vpIndex] := vpValue.Situacao;

  vpParams.ParamByName(
    'DATA_INICIAL').AsDateTimes[vpIndex] := vpValue.DataInicial;
end;

function TEmolumentoPeriodoDAO.GetColumns: TArray<string>;
begin
  Result := ['EMOLUMENTO_PERIODO_ID',
    'DESCRICAO',
    'SITUACAO',
    'DATA_INICIAL'];
end;

function TEmolumentoPeriodoDAO.GetTableName: string;
begin
  Result := 'G_EMOLUMENTO_PERIODO';
end;

function TEmolumentoPeriodoDAO.Listar(
  const vpSituacao: string;
  const vpOrder: string): TObjectList<TEmolumentoPeriodo>;
begin
  Result := GetList(
    0,
    0,
    'SITUACAO = :P_SITUACAO',
    [vpSituacao],
    vpOrder);
end;

{ TEmolumentoPeriodoBusiness }

function TEmolumentoPeriodoBusiness.Buscar(
  const vpEmolumentoPeriodoID: Integer): TEmolumentoPeriodo;
var
  viEmolumentoPeriodoDAO: TEmolumentoPeriodoDAO;
begin
  viEmolumentoPeriodoDAO := nil;
  try
    viEmolumentoPeriodoDAO := TEmolumentoPeriodoDAO.Create(
      dtmControles.DB);

    Result := viEmolumentoPeriodoDAO.GetByID(
      vpEmolumentoPeriodoID);
  finally
    viEmolumentoPeriodoDAO.Free;
  end;
end;

function TEmolumentoPeriodoBusiness.ListarAtivos: TObjectList<TEmolumentoPeriodo>;
var
  viEmolumentoPeriodoDAO: TEmolumentoPeriodoDAO;
begin
  viEmolumentoPeriodoDAO := nil;
  try
    viEmolumentoPeriodoDAO := TEmolumentoPeriodoDAO.Create(
      dtmControles.DB);

    Result := viEmolumentoPeriodoDAO.Listar(
      'A',
      'DATA_INICIAL');
  finally
    viEmolumentoPeriodoDAO.Free;
  end;
end;

end.
