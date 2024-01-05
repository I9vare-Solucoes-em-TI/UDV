unit EmolumentoPeriodoDAOImpl;

interface

uses
  EmolumentoPeriodoDAO,
  FireDAC.Comp.Client,
  Data.DB,
  EmolumentoPeriodo,
  EmolumentoPeriodoList,
  Sistema;

type
  TEmolumentoPeriodoDAO = class(TInterfacedObject, IEmolumentoPeriodoDAO)
  private
    FFDConnection: TFDConnection;
  public
    constructor Create(
      const vpFDConnection: TFDConnection); reintroduce;

    function Get(
      const vpValue: TDataSet): IEmolumentoPeriodo;

    function GetByID(
      const vpValue: Variant): IEmolumentoPeriodo; virtual; abstract;

    function GetList: TEmolumentoPeriodoList; virtual; abstract;

    function GetListDistinctByEmolumentoSistema(
      const vpValue: ISistema): TEmolumentoPeriodoList;

    procedure Inserir(
      const vpValue: IEmolumentoPeriodo); virtual; abstract;

    procedure Alterar(
      const vpValue: IEmolumentoPeriodo); virtual; abstract;

    procedure Excluir(
      const vpValue: IEmolumentoPeriodo); virtual; abstract;
  end;

implementation

uses
  EmolumentoPeriodoImpl,
  System.SysUtils,
  BooleanHelper,
  FireDAC.Stan.Option;

{ TEmolumentoPeriodoDAO }

constructor TEmolumentoPeriodoDAO.Create(
  const vpFDConnection: TFDConnection);
begin
  inherited Create;
  FFDConnection := vpFDConnection;
end;

function TEmolumentoPeriodoDAO.Get(
  const vpValue: TDataSet): IEmolumentoPeriodo;
{$REGION 'Variáveis'}
var
  viField: TField;
{$ENDREGION}
begin
  Result := TEmolumentoPeriodo.Create;

  with vpValue, Result do
  begin
    viField := FindField('G_EP_EMOLUMENTO_PERIODO_ID');
    if Assigned(viField) then
      EmolumentoPeriodoID := viField.AsInteger;

    viField := FindField('G_EP_DESCRICAO');
    if Assigned(viField) then
      Descricao := viField.AsString;

    viField := FindField('G_EP_SITUACAO');
    if Assigned(viField) then
      Situacao := Boolean.FromStringAtivoInativo(viField.AsString);

    viField := FindField('G_EP_DATA_INICIAL');
    if Assigned(viField) then
      DataInicial := viField.AsDateTime;
  end;
end;

function TEmolumentoPeriodoDAO.GetListDistinctByEmolumentoSistema(
  const vpValue: ISistema): TEmolumentoPeriodoList;
{$REGION 'Constantes'}
const
  CI_CAPACITY: Integer = 18;
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viFDQuery: TFDQuery;
  viEmolumentoPeriodo: IEmolumentoPeriodo;
{$ENDREGION}
begin
  Result := TEmolumentoPeriodoList.Create;

  viFDQuery := TFDQuery.Create(nil);
  viFDQuery.Connection := FFDConnection;

  viFDQuery.FetchOptions.Unidirectional := True;
  viFDQuery.FetchOptions.RecordCountMode := cmTotal;

  try
    with viFDQuery do
    begin
      with SQL do
      begin
        Capacity := CI_CAPACITY;

        {$REGION 'Comando SQL SELECT'}
        Add('SELECT');

        {$REGION 'Colunas'}
        Add('DISTINCT');
        Add('G_EP.EMOLUMENTO_PERIODO_ID G_EP_EMOLUMENTO_PERIODO_ID,');
        Add('G_EP.DESCRICAO G_EP_DESCRICAO,');
        Add('G_EP.SITUACAO G_EP_SITUACAO,');
        Add('G_EP.DATA_INICIAL G_EP_DATA_INICIAL');
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        Add('FROM');
        Add('G_EMOLUMENTO_PERIODO G_EP');
        {$ENDREGION}

        {$REGION 'Cláusula INNER JOIN'}
        Add('INNER JOIN');
        Add('G_EMOLUMENTO_ITEM G_EI');

        {$REGION 'Cláusula ON'}
        Add('ON');
        Add('G_EP.EMOLUMENTO_PERIODO_ID = G_EI.EMOLUMENTO_PERIODO_ID');
        {$ENDREGION}

        {$ENDREGION}

        {$REGION 'Cláusula INNER JOIN'}
        Add('INNER JOIN');
        Add('G_EMOLUMENTO G_E');

        {$REGION 'Cláusula ON'}
        Add('ON');
        Add('G_EI.EMOLUMENTO_ID = G_E.EMOLUMENTO_ID');
        {$ENDREGION}

        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        Add('WHERE');
        Add('G_E.SISTEMA_ID = :P_SISTEMA_ID');
        {$ENDREGION}

        {$ENDREGION}
      end;

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_SISTEMA_ID').AsInteger := vpValue.SistemaID;
      {$ENDREGION}

      Open;

      try
        if IsEmpty then
          Exit;

        First;
        Result.Capacity := RecordCount;

        while Eof.&Not do
          try
            viEmolumentoPeriodo := Get(viFDQuery);
            Result.Add(viEmolumentoPeriodo);
          finally
            Next;
          end;
      finally
        Close;
      end;
    end;
  finally
    FreeAndNil(viFDQuery);
  end;
end;

end.
