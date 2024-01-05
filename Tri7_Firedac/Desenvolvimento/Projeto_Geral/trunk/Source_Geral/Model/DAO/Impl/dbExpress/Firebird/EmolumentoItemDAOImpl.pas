unit EmolumentoItemDAOImpl;

interface

uses
  FireDAC.Stan.Param,
  I9Query,
  I9Connection,
  EmolumentoItemDAO,
  Data.SqlExpr,
  Data.DB,
  EmolumentoItem,
  EmolumentoItemList,
  Emolumento,
  EmolumentoPeriodo;

type
  // Implementar Prefix
  TEmolumentoItemDAO = class(TInterfacedObject, IEmolumentoItemDAO)
  private
    FConnection: TI9Connection;

    procedure PreencherParametros(
      const vpI9Query: TI9Query;
      const vpValue: IEmolumentoItem);
  public
    constructor Create(
      const vpConnection: TI9Connection); reintroduce;

    function Get(
      const vpValue: TDataSet): IEmolumentoItem;

    function GetByID(
      const vpValue: Variant): IEmolumentoItem; virtual; abstract;

    function GetList: TEmolumentoItemList; virtual; abstract;

    function GetByValorIntervalo(
      const vpEmolumento: IEmolumento;
      const vpEmolumentoPeriodo: IEmolumentoPeriodo;
      const vpValor: Currency): IEmolumentoItem;

    class function New(
      const vpConnection: TI9Connection): IEmolumentoItemDAO; static;

    procedure Inserir(
      const vpValue: IEmolumentoItem);

    procedure Alterar(
      const vpValue: IEmolumentoItem); virtual; abstract;

    procedure Excluir(
      const vpValue: IEmolumentoItem); virtual; abstract;
  end;

implementation

{$WARN CONSTRUCTING_ABSTRACT OFF}

uses
  System.Classes,
  System.SysUtils,
  EmolumentoDAOImpl,
  EmolumentoItemImpl,
  EmolumentoPeriodoDAOImpl;

{ TEmolumentoItemDAO }

constructor TEmolumentoItemDAO.Create(
  const vpConnection: TI9Connection);
begin
  inherited Create;
  FConnection := vpConnection;
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
  Result := TEmolumentoItem.New;

  with vpValue, Result do
  begin
    viField := FindField('G_EI_EMOLUMENTO_ITEM_ID');
    if Assigned(viField) then
      EmolumentoItemID := viField.AsInteger;

    viField := FindField('G_E_EMOLUMENTO_ID');
    if Assigned(viField) then
    begin
      viEmolumentoDAO := TEmolumentoDAO.Create(FConnection);
      try
        Emolumento := viEmolumentoDAO.Get(vpValue);
      finally
        FreeAndNil(viEmolumentoDAO);
      end;
    end;

    viField := FindField('G_EP_EMOLUMENTO_PERIODO_ID');
    if Assigned(viField) then
    begin
      viEmolumentoPeriodoDAO := TEmolumentoPeriodoDAO.Create(FConnection);
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

      viSQLText := Text;
    end;
  finally
    FreeAndNil(viSQL);
  end;

  viSQLDataSet := TI9Query.Create(nil);
  viSQLDataSet.Connection := FConnection;

  try
    with viSQLDataSet do
    begin
      SQL.Text := viSQLText;

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
        Result := Get(viSQLDataSet);
        Result.Emolumento := vpEmolumento;
        Result.EmolumentoPeriodo := vpEmolumentoPeriodo;
      finally
        Close;
      end;
    end;
  finally
    FreeAndNil(viSQLDataSet);
  end;
end;

procedure TEmolumentoItemDAO.Inserir(
  const vpValue: IEmolumentoItem);
{$REGION 'Variáveis'}
var
  viSQLDataSet: TI9Query;
  viSQL: TStrings;
{$ENDREGION}
begin
  viSQLDataSet := TI9Query.Create(nil);
  viSQLDataSet.Connection := FConnection;

  viSQL := TStringList.Create;

  try
    with viSQLDataSet do
    begin
      with viSQL do
      begin
        {$REGION 'Comando SQL INSERT'}
        Add('INSERT');

        {$REGION 'Cláusula INTO'}
        Add('INTO');
        Add('G_EMOLUMENTO_ITEM');
        {$ENDREGION}

        {$REGION 'Colunas'}
        Add('(');
        Add('EMOLUMENTO_ITEM_ID,');
        Add('EMOLUMENTO_ID,');
        Add('EMOLUMENTO_PERIODO_ID,');
        Add('VALOR_INICIO,');
        Add('VALOR_FIM,');
        Add('VALOR_EMOLUMENTO,');
        Add('VALOR_TAXA_JUDICIARIA,');
        Add('CODIGO,');
        Add('PAGINA_EXTRA,');
        Add('VALOR_PAGINA_EXTRA,');
        Add('VALOR_OUTRA_TAXA1,');;
        Add('CODIGO_SELO');
        Add(')');
        {$ENDREGION}

        {$REGION 'Cláusula VALUES e Parâmetros'}
        Add('VALUES');
        Add('(');
        Add(':P_EMOLUMENTO_ITEM_ID,');
        Add(':P_EMOLUMENTO_ID,');
        Add(':P_EMOLUMENTO_PERIODO_ID,');
        Add(':P_VALOR_INICIO,');
        Add(':P_VALOR_FIM,');
        Add(':P_VALOR_EMOLUMENTO,');
        Add(':P_VALOR_TAXA_JUDICIARIA,');
        Add(':P_CODIGO,');
        Add(':P_PAGINA_EXTRA,');
        Add(':P_VALOR_PAGINA_EXTRA,');
        Add(':P_VALOR_OUTRA_TAXA1,');;
        Add(':P_CODIGO_SELO');
        Add(');');
        {$ENDREGION}

        {$ENDREGION}
      end;

      SQL.Text := viSQL.Text;
      PreencherParametros(viSQLDataSet, vpValue);
      ExecSQL;
    end;
  finally
    FreeAndNil(viSQLDataSet);
    FreeAndNil(viSQL);
  end;
end;

class function TEmolumentoItemDAO.New(
  const vpConnection: TI9Connection): IEmolumentoItemDAO;
begin
  Result := TEmolumentoItemDAO.Create(vpConnection);
end;

procedure TEmolumentoItemDAO.PreencherParametros(
  const vpI9Query: TI9Query;
  const vpValue: IEmolumentoItem);
{$REGION 'Variáveis'}
var
  viParam: TFDParam;
{$ENDREGION}
begin
  with vpI9Query.Params, vpValue do
  begin
    viParam := FindParam('P_EMOLUMENTO_ITEM_ID');
    if Assigned(viParam) then
      viParam.AsInteger := EmolumentoItemID;

    viParam := FindParam('P_EMOLUMENTO_ID');
    if Assigned(viParam) then
      with viParam do
        if Assigned(Emolumento) then
          AsInteger := Emolumento.EmolumentoID
        else
        begin
          DataType := ftInteger;
          Clear;
          Bound := True;
        end;

    viParam := FindParam('P_EMOLUMENTO_PERIODO_ID');
    if Assigned(viParam) then
      with viParam do
        if Assigned(EmolumentoPeriodo) then
          AsInteger := EmolumentoPeriodo.EmolumentoPeriodoID
        else
        begin
          DataType := ftInteger;
          Clear;
          Bound := True;
        end;

    viParam := FindParam('P_VALOR_INICIO');
    if Assigned(viParam) then
      viParam.AsCurrency := ValorInicio;

    viParam := FindParam('P_VALOR_FIM');
    if Assigned(viParam) then
      viParam.AsCurrency := ValorFim;

    viParam := FindParam('P_VALOR_TAXA_JUDICIARIA');
    if Assigned(viParam) then
      viParam.AsCurrency := ValorTaxaJudiciaria;

    viParam := FindParam('P_CODIGO');
    if Assigned(viParam) then
      viParam.AsInteger := Codigo;

    viParam := FindParam('P_PAGINA_EXTRA');
    if Assigned(viParam) then
      viParam.AsInteger := PaginaExtra;

    viParam := FindParam('P_VALOR_PAGINA_EXTRA');
    if Assigned(viParam) then
      viParam.AsCurrency := ValorPaginaExtra;

    viParam := FindParam('P_VALOR_OUTRA_TAXA1');
    if Assigned(viParam) then
      viParam.AsCurrency := ValorOutraTaxa1;

    viParam := FindParam('P_CODIGO_SELO');
    if Assigned(viParam) then
      viParam.AsString := CodigoSelo;
  end;
end;

end.
