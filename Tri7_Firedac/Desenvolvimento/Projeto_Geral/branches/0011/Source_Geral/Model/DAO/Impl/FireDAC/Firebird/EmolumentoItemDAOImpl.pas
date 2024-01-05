unit EmolumentoItemDAOImpl;

interface

uses
  EmolumentoItemDAO,
  FireDAC.Comp.Client,
  Data.DB,
  EmolumentoItem,
  EmolumentoItemList,
  Emolumento,
  EmolumentoPeriodo;

type
  TEmolumentoItemDAO = class(TInterfacedObject, IEmolumentoItemDAO)
  private
    FFDConnection: TFDConnection;
  public
    constructor Create(
      const vpFDConnection: TFDConnection); reintroduce;

    function Get(
      const vpValue: TDataSet): IEmolumentoItem;

    function GetByID(
      const vpValue: Variant): IEmolumentoItem; virtual; abstract;

    function GetList: TEmolumentoItemList; virtual; abstract;

    function GetByValorIntervalo(
      const vpEmolumento: IEmolumento;
      const vpEmolumentoPeriodo: IEmolumentoPeriodo;
      const vpValor: Currency): IEmolumentoItem;

    procedure Inserir(
      const vpValue: IEmolumentoItem); virtual; abstract;

    procedure Alterar(
      const vpValue: IEmolumentoItem); virtual; abstract;

    procedure Excluir(
      const vpValue: IEmolumentoItem); virtual; abstract;
  end;

implementation

uses
  EmolumentoItemImpl,
  System.SysUtils,
  EmolumentoDAOImpl,
  EmolumentoPeriodoDAOImpl;

{ TEmolumentoItemDAO }

constructor TEmolumentoItemDAO.Create(
  const vpFDConnection: TFDConnection);
begin
  inherited Create;
  FFDConnection := vpFDConnection;
end;

function TEmolumentoItemDAO.Get(
  const vpValue: TDataSet): IEmolumentoItem;
{$REGION 'Variáveis'}
var
  viField: TField;
  viEmolumentoDAO: TEmolumentoDAO;
  viEmolumentoPeriodoDAO: TEmolumentoPeriodoDAO;
{$ENDREGION}
begin
  Result := TEmolumentoItem.Create;

  with vpValue, Result do
  begin
    viField := FindField('G_EI_EMOLUMENTO_ITEM_ID');
    if Assigned(viField) then
      EmolumentoItemID := viField.AsInteger;

    viField := FindField('G_E_EMOLUMENTO_ID');
    if Assigned(viField) then
    begin
      viEmolumentoDAO := TEmolumentoDAO.Create(FFDConnection);
      try
        Emolumento := viEmolumentoDAO.Get(vpValue);
      finally
        FreeAndNil(viEmolumentoDAO);
      end;
    end;

    viField := FindField('G_EP_EMOLUMENTO_PERIODO_ID');
    if Assigned(viField) then
    begin
      viEmolumentoPeriodoDAO := TEmolumentoPeriodoDAO.Create(FFDConnection);
      try
        EmolumentoPeriodo := viEmolumentoPeriodoDAO.Get(vpValue);
      finally
        FreeAndNil(viEmolumentoPeriodoDAO);
      end;
    end;

    viField := FindField('G_EI_VALOR_INICIO');
    if Assigned(viField) then
      ValorInicio := viField.AsCurrency;

    viField := FindField('G_EI_VALOR_FIM');
    if Assigned(viField) then
      ValorFim := viField.AsCurrency;

    viField := FindField('G_EI_VALOR_EMOLUMENTO');
    if Assigned(viField) then
      ValorEmolumento := viField.AsCurrency;

    viField := FindField('G_EI_VALOR_TAXA_JUDICIARIA');
    if Assigned(viField) then
      ValorTaxaJudiciaria := viField.AsCurrency;

    viField := FindField('G_EI_CODIGO');
    if Assigned(viField) then
      Codigo := viField.AsInteger;

    viField := FindField('G_EI_PAGINA_EXTRA');
    if Assigned(viField) then
      PaginaExtra := viField.AsInteger;

    viField := FindField('G_EI_VALOR_PAGINA_EXTRA');
    if Assigned(viField) then
      ValorPaginaExtra := viField.AsCurrency;

    viField := FindField('G_EI_VALOR_OUTRA_TAXA1');
    if Assigned(viField) then
      ValorOutraTaxa1 := viField.AsCurrency;

    viField := FindField('G_EI_CODIGO_SELO');
    if Assigned(viField) then
      CodigoSelo := viField.AsString;
  end;
end;

function TEmolumentoItemDAO.GetByValorIntervalo(
  const vpEmolumento: IEmolumento;
  const vpEmolumentoPeriodo: IEmolumentoPeriodo;
  const vpValor: Currency): IEmolumentoItem;
{$REGION 'Constantes'}
const
  CI_CAPACITY: Integer = 17;
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viFDQuery: TFDQuery;
{$ENDREGION}
begin
  Result := nil;

  viFDQuery := TFDQuery.Create(nil);
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
        Add('G_EI.EMOLUMENTO_ITEM_ID G_EI_EMOLUMENTO_ITEM_ID,');
        Add('G_EI.VALOR_INICIO G_EI_VALOR_INICIO,');
        Add('G_EI.VALOR_FIM G_EI_VALOR_FIM,');
        Add('G_EI.VALOR_EMOLUMENTO G_EI_VALOR_EMOLUMENTO,');
        Add('G_EI.VALOR_TAXA_JUDICIARIA G_EI_VALOR_TAXA_JUDICIARIA,');
        Add('G_EI.CODIGO G_EI_CODIGO,');
        Add('G_EI.PAGINA_EXTRA G_EI_PAGINA_EXTRA,');
        Add('G_EI.VALOR_PAGINA_EXTRA G_EI_VALOR_PAGINA_EXTRA,');
        Add('G_EI.VALOR_OUTRA_TAXA1 G_EI_VALOR_OUTRA_TAXA1,');
        Add('G_EI.CODIGO_SELO G_EI_CODIGO_SELO');
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        Add('FROM');
        Add('G_EMOLUMENTO_ITEM G_EI');
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        Add('WHERE');
        Add('G_EI.EMOLUMENTO_ID = :P_EMOLUMENTO_ID AND');
        Add('G_EI.EMOLUMENTO_PERIODO_ID = :P_EMOLUMENTO_PERIODO_ID AND');
        Add(':P_VALOR BETWEEN G_EI.VALOR_INICIO AND G_EI.VALOR_FIM;');
        {$ENDREGION}

        {$ENDREGION}
      end;

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_EMOLUMENTO_ID').AsInteger := vpEmolumento.EmolumentoID;

      ParamByName('P_EMOLUMENTO_PERIODO_ID').AsInteger :=
        vpEmolumentoPeriodo.EmolumentoPeriodoID;

      ParamByName('P_VALOR').AsCurrency := vpValor;
      {$ENDREGION}

      Open;

      try
        if IsEmpty then
          Exit;

        First;
        Result := Get(viFDQuery);
        Result.Emolumento := vpEmolumento;
        Result.EmolumentoPeriodo := vpEmolumentoPeriodo;
      finally
        Close;
      end;
    end;
  finally
    FreeAndNil(viFDQuery);
  end;
end;

end.
