unit Geral.Controller.Impl.CalculoEmolumentos;

interface

uses
  FireDAC.Stan.Param,
  I9Query,
  Geral.Model.Entity.Spec.CalculoEmolumentos,
  Geral.Model.Entity.Spec.DataSet,
  Data.DB,
  SeloFundo,
  System.Generics.Collections,
  FundoTipo,
  Geral.Model.Entity.AnonymousMethods,
  Geral.Model.Entity.Spec.Factory;

type
  TValoresCobranca = Record
    ItemPadrao, ItemManual, TabelaBase : string;
    ItemComplementar : Variant;
    Fundos, ValorTotal, Desconto, Emolumento,  TaxaJud, OutraTaxa, Quantidade, Taxa2 : Currency;
    EmolumentoItemId: Integer;
    TipoCobranca, QtdIMovel : Integer;
    CobrarFundos, CobrarOutraTaxa, vlValorDocumentoUnico, CobrarTaxa2 : Boolean;
  end;

  TCalculoEmolumentos = class(TInterfacedObject,
    ICalculoEmolumentos<IDataSetAPI<TDataSet>>)
  private
    FEmolumentoID: Integer;
    FEmolumentoPeriodoID: Integer;
    FValorBaseCalculo: Currency;
    FQuantidade: Integer;
    FEmolumentoIDPaginaExtra: TFunction<IDataSetAPI<TDataSet>, Integer>;
    FQuantidadePaginaExtra: Integer;
    FPaginaExtra: Integer;
    FDataAto: TDateTime;
    FUf: string;
    FSistemaId: Integer;

    constructor Create(
      const vpEmolumentoID: Integer;
      const vpEmolumentoPeriodoID: Integer;
      const vpValorBaseCalculo: Currency;
      const vpQuantidade: Integer;
      const vpEmolumentoIDPaginaExtra:
        TFunction<IDataSetAPI<TDataSet>, Integer>;
      const vpQuantidadePaginaExtra: Integer;
      const vpPaginaExtra: Integer;
      const vpDataAto: TDateTime;
      const vpUf: string;
      const vpSistemaId: Integer); reintroduce;

    function Pesquisar: IDataSetAPI<TDataSet>;

    function PesquisarPaginaExtra(
      const vpEmolumentoIDPaginaExtra: Integer): IDataSetAPI<TDataSet>;
  public
    function Calcular: IDataSetAPI<TDataSet>;

    class function New(
      const vpEmolumentoID: Integer;
      const vpEmolumentoPeriodoID: Integer;
      const vpValorBaseCalculo: Currency;
      const vpQuantidade: Integer;
      const vpDataAto: TDateTime;
      const vpUf: string;
      const vpSistemaId: Integer): ICalculoEmolumentos<IDataSetAPI<TDataSet>>; overload;

    class function New(
      const vpEmolumentoID: Integer;
      const vpEmolumentoPeriodoID: Integer;
      const vpValorBaseCalculo: Currency;
      const vpQuantidade: Integer;
      const vpEmolumentoIDPaginaExtra:
        TFunction<IDataSetAPI<TDataSet>, Integer>;
      const vpQuantidadePaginaExtra: Integer;
      const vpPaginaExtra: Integer;
      const vpDataAto: TDateTime;
      const vpUf: string;
      const vpSistemaId: Integer): ICalculoEmolumentos<IDataSetAPI<TDataSet>>; overload;
  end;

  TCalculoFundos = class(TInterfacedObject,
    ICalculoEmolumentos<TSeloFundos>)
  private
    FEmolumentoID: Integer;
    FQuantidade: Integer;
    FValorEmolumento: Currency;
    FDataAto: TDateTime;
    FUf: string;
    FSistemaId: Integer;

    function ValoresBaseCalculoFundos: TList<Currency>;
    function FundoTipos: TFundoTipos;

    constructor Create(
      const vpEmolumentoID: Integer;
      const vpQuantidade: Integer;
      const vpValorEmolumento: Currency;
      const vpDataAto: TDateTime;
      const vpUf: string;
      const vpSistemaId: Integer); reintroduce;
  public
    function Calcular: TSeloFundos;

    class function New(
      const vpEmolumentoID: Integer;
      const vpQuantidade: Integer;
      const vpValorEmolumento: Currency;
      const vpDataAto: TDateTime;
      const vpUf: string;
      const vpSistemaId: Integer): ICalculoEmolumentos<TSeloFundos>;
  end;

  TCamposFundosFactory = class(TInterfacedObject,
    IFactory<IDataSetAPI<TDataSet>>)
  private
    FDataSet: TDataSet;

    constructor Create(
      const vpDataSet: TDataSet); reintroduce;
  public
    function GetInstance: IDataSetAPI<TDataSet>;

    class function New(
      const vpDataSet: TDataSet): IFactory<IDataSetAPI<TDataSet>>;
  end;

  TCalculoISSQN = class(TInterfacedObject, ICalculoEmolumentos<Currency>)
  private
    FQuantidade: Integer;
    FValorEmolumento: Currency;
    FEmolumentoID: Integer;
    FEmolumentoItemId: Integer;
    FValorFundosDeducaoUnitario: Currency;
    FValorTaxaJudiciariaUnitario: Currency;
    FSistemaId: Integer;
    FUf: string;

    constructor Create(
      const vpQuantidade: Integer;
      const vpValorEmolumento: Currency;
      const vpEmolumentoID: Integer;
      const vpEmolumentoItemId: Integer;
      const vpValorFundosDeducaoUnitario: Currency;
      const vpValorTaxaJudiciariaUnitario: Currency;
      const vpSistemaId: Integer;
      const vpUf: string); reintroduce;
  public
    function Calcular: Currency; deprecated 'Use Geral.Controller.CalculoEmolumentos.TCalculoOutraTaxa1Controller.Calcular';

    class function New(
      const vpQuantidade: Integer;
      const vpValorEmolumento: Currency;
      const vpEmolumentoID: Integer;
      const vpEmolumentoItemId: Integer;
      const vpValorFundosDeducaoUnitario: Currency;
      const vpValorTaxaJudiciariaUnitario: Currency;
      const vpSistemaId: Integer;
      const vpUf: string): ICalculoEmolumentos<Currency>;
  end;

  procedure CalculoEmolumentosEscritura(
    vpValorDocumento: Currency;
    vpPeriodoPadrao: Currency;
    vpEmolumentoId: Integer;
    vpQtd: Integer;
    vpAdTexto: Boolean;
    vpValorPersonalizado: string;
    vpEmolumento: Currency;
    vpTaxa: Currency;
    vpOutraTaxa: Currency;
    vpAtoId: string = '';
    vpAtoVinculoValorId: Integer = 0;
    vpTabela: string = '');

var
  vgValoresCobranca : TValoresCobranca;

implementation

uses
  Geral.Model.Entity.Impl.DataSet,
  FireDAC.Comp.Client,
  Controles,
  EmolumentoImpl,
  Rotinas,
  System.SysUtils,
  System.Math,
  System.Types,
  SeloFundoDAO,
  CalculoCeara,
  System.Variants,
  System.StrUtils,
  Lookup,
  System.Classes,
  Geral.Controller.CalculoEmolumentos;

{ TCalculoEmolumentos }

function TCalculoEmolumentos.Calcular: IDataSetAPI<TDataSet>;
var
  viDataSet: TFDMemTable;
  viEmolumentoIDPaginaExtra: Integer;
  viSeloFundos: TSeloFundos;
  viFundoTipo: TFundoTipo;
  viSeloFundosTipo: TSeloFundos;
  viValorIssqn: Currency;
  viValorFundosDeducaoUnitario: Currency;
begin
  viDataSet := TFDMemTable.Create(
    nil);

  Result := TDataSetAPI<TDataSet>.New(
    viDataSet)
  .AutoClose
  .AutoDestroy
  .BeginFieldCreation
    .CreateIntegerField(
      'EMOLUMENTO_ID')
    .CreateIntegerField(
      'EMOLUMENTO_PERIODO_ID')
    .CreateCurrencyField(
      'VALOR_BASE_CALCULO')
    .CreateIntegerField(
      'QUANTIDADE')
    .CreateIntegerField(
      'EMOLUMENTO_ITEM_ID')
    .CreateStringField(
      'CODIGO_SELO',
      30)
    .CreateStringField(
      'CODIGO_TABELA',
      30)
    .CreateIntegerField(
      'PAGINA_EXTRA')
    .CreateCurrencyField(
      'VALOR_EMOLUMENTO')
    .CreateCurrencyField(
      'VALOR_TAXA_JUDICIARIA')
    .CreateCurrencyField(
      'VALOR_FUNDOS')
  .EndFieldCreation
  .ExecuteAction(
    procedure(
      const vpDataSet: TDataSet)
    begin
      TCamposFundosFactory.New(
        vpDataSet)
      .GetInstance;
    end)
  .BeginFieldCreation
    .CreateCurrencyField(
      'VALOR_ISSQN')
    .CreateCurrencyField(
      'VALOR_TOTAL')
  .EndFieldCreation
  .Open;

  viDataSet.CopyDataSet(
    Pesquisar.DataSet);

  if (FQuantidadePaginaExtra > 0) and
    Assigned(
      FEmolumentoIDPaginaExtra) then
  begin
    viEmolumentoIDPaginaExtra := FEmolumentoIDPaginaExtra(
      Result);

    if viEmolumentoIDPaginaExtra > 0 then
      viDataSet.CopyDataSet(
        PesquisarPaginaExtra(
          viEmolumentoIDPaginaExtra)
        .DataSet);
  end;

  Result.First;
  while not Result.DataSet.Eof do
    try
      Result.Edit;

      viDataSet.FieldByName(
        'VALOR_BASE_CALCULO').AsCurrency := FValorBaseCalculo;

      viDataSet.FieldByName(
        'QUANTIDADE').AsInteger := FQuantidade;

      viSeloFundos := TCalculoFundos.New(
        FEmolumentoID,
        FQuantidade,
        viDataSet.FieldByName(
          'VALOR_EMOLUMENTO').AsCurrency,
        FDataAto,
        FUf,
        FSistemaId)
        .Calcular;

      try
        viDataSet.FieldByName(
          'VALOR_FUNDOS').AsCurrency := viSeloFundos.Valor;

        for viFundoTipo in dtmLookup.GetFundoTipos do
        begin
          if not viFundoTipo.Situacao then
            Continue;

          viSeloFundosTipo := viSeloFundos.Get(
            viFundoTipo);

          try
            viDataSet.FieldByName(
              viFundoTipo.Sigla).AsCurrency := viSeloFundosTipo.Valor;
          finally
            FreeAndNil(viSeloFundosTipo);
          end;
        end;

        viValorFundosDeducaoUnitario := viSeloFundos.ValorDeducao / FQuantidade;

        viValorIssqn := TCalculoISSQN.New(
          FQuantidade,
          viDataSet.FieldByName('VALOR_EMOLUMENTO').AsCurrency,
          FEmolumentoID,
          viDataSet.FieldByName('EMOLUMENTO_ITEM_ID').AsInteger,
          viValorFundosDeducaoUnitario,
          viDataSet.FieldByName('VALOR_TAXA_JUDICIARIA').AsCurrency,
          FSistemaId,
          FUf)
        .Calcular;

        viDataSet.FieldByName('VALOR_ISSQN').AsCurrency := viValorIssqn;
      finally
        FreeAndNil(viSeloFundos);
      end;

      viDataSet.FieldByName(
        'VALOR_EMOLUMENTO').AsCurrency := viDataSet.FieldByName(
          'VALOR_EMOLUMENTO').AsCurrency * FQuantidade;

      viDataSet.FieldByName(
        'VALOR_TAXA_JUDICIARIA').AsCurrency := viDataSet.FieldByName(
          'VALOR_TAXA_JUDICIARIA').AsCurrency * FQuantidade;

      viDataSet.FieldByName(
        'VALOR_TOTAL').AsCurrency := viDataSet.FieldByName(
          'VALOR_EMOLUMENTO').AsCurrency +
        viDataSet.FieldByName(
          'VALOR_TAXA_JUDICIARIA').AsCurrency +
        viDataSet.FieldByName(
          'VALOR_FUNDOS').AsCurrency +
        viDataSet.FieldByName(
          'VALOR_ISSQN').AsCurrency;

      Result.Post;
    finally
      Result.Next;
    end;
  Result.First;
end;

constructor TCalculoEmolumentos.Create(
  const vpEmolumentoID: Integer;
  const vpEmolumentoPeriodoID: Integer;
  const vpValorBaseCalculo: Currency;
  const vpQuantidade: Integer;
  const vpEmolumentoIDPaginaExtra:
    TFunction<IDataSetAPI<TDataSet>, Integer>;
  const vpQuantidadePaginaExtra: Integer;
  const vpPaginaExtra: Integer;
  const vpDataAto: TDateTime;
  const vpUf: string;
  const vpSistemaId: Integer);
begin
  inherited Create;
  FEmolumentoID := vpEmolumentoID;
  FEmolumentoPeriodoID := vpEmolumentoPeriodoID;
  FValorBaseCalculo := vpValorBaseCalculo;
  FQuantidade := vpQuantidade;
  FEmolumentoIDPaginaExtra := vpEmolumentoIDPaginaExtra;
  FQuantidadePaginaExtra := vpQuantidadePaginaExtra;
  FPaginaExtra := vpPaginaExtra;
  FDataAto := vpDataAto;
  FUf := vpUf;
  FSistemaId := vpSistemaId;
end;

class function TCalculoEmolumentos.New(
  const vpEmolumentoID: Integer;
  const vpEmolumentoPeriodoID: Integer;
  const vpValorBaseCalculo: Currency;
  const vpQuantidade: Integer;
  const vpDataAto: TDateTime;
  const vpUf: string;
  const vpSistemaId: Integer): ICalculoEmolumentos<IDataSetAPI<TDataSet>>;
begin
  Result := New(
    vpEmolumentoID,
    vpEmolumentoPeriodoID,
    vpValorBaseCalculo,
    vpQuantidade,
    nil,
    0,
    0,
    vpDataAto,
    vpUf,
    vpSistemaId);
end;

class function TCalculoEmolumentos.New(
  const vpEmolumentoID: Integer;
  const vpEmolumentoPeriodoID: Integer;
  const vpValorBaseCalculo: Currency;
  const vpQuantidade: Integer;
  const vpEmolumentoIDPaginaExtra:
    TFunction<IDataSetAPI<TDataSet>, Integer>;
  const vpQuantidadePaginaExtra: Integer;
  const vpPaginaExtra: Integer;
  const vpDataAto: TDateTime;
  const vpUf: string;
  const vpSistemaId: Integer): ICalculoEmolumentos<IDataSetAPI<TDataSet>>;
begin
  Result := Create(
    vpEmolumentoID,
    vpEmolumentoPeriodoID,
    vpValorBaseCalculo,
    vpQuantidade,
    vpEmolumentoIDPaginaExtra,
    vpQuantidadePaginaExtra,
    vpPaginaExtra,
    vpDataAto,
    vpUf,
    vpSistemaId);
end;

function TCalculoEmolumentos.Pesquisar: IDataSetAPI<TDataSet>;
{$REGION 'Vari�veis'}
var
  viSQLDataSet: TI9Query;
{$ENDREGION}
begin
  viSQLDataSet := TI9Query.Create(
    nil);

  Result := TDataSetAPI<TDataSet>.New(
    viSQLDataSet)
  .AutoClose
  .AutoDestroy
  .ExecuteAction(
    procedure
    {$REGION 'Vari�veis'}
    var
      viParam: TFDParam;
    {$ENDREGION}
    begin
      viSQLDataSet.Connection := dtmControles.DB;

      viSQLDataSet.SQL.Text := {$REGION 'Comando SQL SELECT'}
        'SELECT ' +

        {$REGION 'Colunas'}
        'G_EI.EMOLUMENTO_ITEM_ID, ' +
        'G_EI.EMOLUMENTO_ID, ' +
        'G_EI.EMOLUMENTO_PERIODO_ID, ' +
        'G_EI.CODIGO_SELO, ' +
        'G_EI.CODIGO_TABELA, ' +
        'G_EI.PAGINA_EXTRA, ' +
        'G_EI.VALOR_EMOLUMENTO, ' +
        'G_EI.VALOR_TAXA_JUDICIARIA ' +
        {$ENDREGION}

        {$REGION 'Cl�usula FROM'}
        'FROM ' +
        'G_EMOLUMENTO_ITEM G_EI ' +
        {$ENDREGION}

        {$REGION 'Cl�usula WHERE e Par�metros'}
        'WHERE ' +
        'G_EI.EMOLUMENTO_ID = :P_EMOLUMENTO_ID AND ' +
        'G_EI.EMOLUMENTO_PERIODO_ID = :P_EMOLUMENTO_PERIODO_ID AND ' +
        ':P_VALOR_BASE_CALCULO BETWEEN G_EI.VALOR_INICIO AND G_EI.VALOR_FIM' +

        IfThen(
          FPaginaExtra > 0,
          ' AND G_EI.PAGINA_EXTRA = :P_PAGINA_EXTRA');
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos par�metros'}
      viSQLDataSet.ParamByName(
        'P_EMOLUMENTO_ID').AsInteger := FEmolumentoID;

      viSQLDataSet.ParamByName(
        'P_EMOLUMENTO_PERIODO_ID').AsInteger := FEmolumentoPeriodoID;

      viSQLDataSet.ParamByName(
        'P_VALOR_BASE_CALCULO').AsCurrency := FValorBaseCalculo;

      viParam := viSQLDataSet.FindParam(
        'P_PAGINA_EXTRA');

      if Assigned(
        viParam) then
        viParam.AsInteger := FPaginaExtra;
      {$ENDREGION}
    end)
  .Open;
end;

function TCalculoEmolumentos.PesquisarPaginaExtra(
  const vpEmolumentoIDPaginaExtra: Integer): IDataSetAPI<TDataSet>;
{$REGION 'Vari�veis'}
var
  viSQLDataSet: TI9Query;
{$ENDREGION}
begin
  viSQLDataSet := TI9Query.Create(
    nil);

  Result := TDataSetAPI<TDataSet>.New(
    viSQLDataSet)
  .AutoClose
  .AutoDestroy
  .ExecuteAction(
    procedure
    begin
      viSQLDataSet.Connection := dtmControles.DB;

      viSQLDataSet.SQL.Text := {$REGION 'Comando SQL SELECT'}
        'SELECT ' +

        {$REGION 'Colunas'}
        'G_EI.EMOLUMENTO_ITEM_ID, ' +
        'G_EI.EMOLUMENTO_ID, ' +
        'G_EI.EMOLUMENTO_PERIODO_ID, ' +
        'G_EI.CODIGO_SELO, ' +
        'G_EI.CODIGO_TABELA, ' +
        'G_EI.PAGINA_EXTRA, ' +
        'G_EI.VALOR_EMOLUMENTO, ' +
        'G_EI.VALOR_TAXA_JUDICIARIA ' +
        {$ENDREGION}

        {$REGION 'Cl�usula FROM'}
        'FROM ' +
        'G_EMOLUMENTO_ITEM G_EI ' +
        {$ENDREGION}

        {$REGION 'Cl�usula WHERE e Par�metros'}
        'WHERE ' +
        'G_EI.EMOLUMENTO_ID = :P_EMOLUMENTO_ID AND ' +
        'G_EI.EMOLUMENTO_PERIODO_ID = :P_EMOLUMENTO_PERIODO_ID AND ' +

        ':P_VALOR_BASE_CALCULO BETWEEN G_EI.VALOR_INICIO AND ' +
          'G_EI.VALOR_FIM AND ' +

        'G_EI.PAGINA_EXTRA <= :P_PAGINA_EXTRA ' +
        {$ENDREGION}

        {$REGION 'Cl�usula ORDER BY'}
        'ORDER BY ' +
        'G_EI.PAGINA_EXTRA';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos par�metros'}
      viSQLDataSet.ParamByName(
        'P_EMOLUMENTO_ID').AsInteger := vpEmolumentoIDPaginaExtra;

      viSQLDataSet.ParamByName(
        'P_EMOLUMENTO_PERIODO_ID').AsInteger := FEmolumentoPeriodoID;

      viSQLDataSet.ParamByName(
        'P_VALOR_BASE_CALCULO').AsCurrency := FValorBaseCalculo;

      viSQLDataSet.ParamByName(
        'P_PAGINA_EXTRA').AsInteger := FQuantidadePaginaExtra;
      {$ENDREGION}
    end)
  .Open;
end;

{ TCalculoFundos }

function TCalculoFundos.Calcular: TSeloFundos;
var
  viValoresBaseCalculoFundos: TList<Currency>;
  viFundoTipos: TFundoTipos;
begin
  viValoresBaseCalculoFundos := ValoresBaseCalculoFundos;
  viFundoTipos := FundoTipos;

  try
    Result := TCalculadoraSeloFundos.Get(
      viValoresBaseCalculoFundos,
      viFundoTipos,
      FDataAto,
      FUf,
      FSistemaId);
  finally
    FreeAndNil(viValoresBaseCalculoFundos);
    FreeAndNil(viFundoTipos);
  end;
end;

constructor TCalculoFundos.Create(
  const vpEmolumentoID: Integer;
  const vpQuantidade: Integer;
  const vpValorEmolumento: Currency;
  const vpDataAto: TDateTime;
  const vpUf: string;
  const vpSistemaId: Integer);
begin
  inherited Create;
  FEmolumentoID := vpEmolumentoID;
  FQuantidade := vpQuantidade;
  FValorEmolumento := vpValorEmolumento;
  FDataAto := vpDataAto;
  FUf := vpUf;
  FSistemaId := vpSistemaId;
end;

function TCalculoFundos.FundoTipos: TFundoTipos;
{$REGION 'Vari�veis'}
var
  viEmolumento: TEmolumento;
{$ENDREGION}
begin
  if FEmolumentoID > 0 then
    viEmolumento := TEmolumento.Create(
      FEmolumentoID)
  else
    viEmolumento := nil;

  try
    Result := dtmLookup.GetFundoTipos(
      viEmolumento);
  finally
    viEmolumento.Free;
  end;
end;

class function TCalculoFundos.New(
  const vpEmolumentoID: Integer;
  const vpQuantidade: Integer;
  const vpValorEmolumento: Currency;
  const vpDataAto: TDateTime;
  const vpUf: string;
  const vpSistemaId: Integer): ICalculoEmolumentos<TSeloFundos>;
begin
  Result := Create(
    vpEmolumentoID,
    vpQuantidade,
    vpValorEmolumento,
    vpDataAto,
    vpUf,
    vpSistemaId);
end;

function TCalculoFundos.ValoresBaseCalculoFundos: TList<Currency>;
begin
  Result := RetornarListCurrency(
    FValorEmolumento,
    FQuantidade);
end;

{ TCalculoISSQN }

function TCalculoISSQN.Calcular: Currency;
begin
  Result := TCalculoOutraTaxa1Controller.Calcular(
    FEmolumentoID,
    FEmolumentoItemId,
    FValorEmolumento,
    FValorFundosDeducaoUnitario,
    FValorTaxaJudiciariaUnitario,
    FQuantidade,
    FSistemaId,
    FUf);
end;

constructor TCalculoISSQN.Create(
  const vpQuantidade: Integer;
  const vpValorEmolumento: Currency;
  const vpEmolumentoID: Integer;
  const vpEmolumentoItemId: Integer;
  const vpValorFundosDeducaoUnitario: Currency;
  const vpValorTaxaJudiciariaUnitario: Currency;
  const vpSistemaId: Integer;
  const vpUf: string);
begin
  inherited Create;
  FQuantidade := vpQuantidade;
  FValorEmolumento := vpValorEmolumento;
  FEmolumentoID := vpEmolumentoID;
  FEmolumentoItemId := vpEmolumentoItemId;
  FValorFundosDeducaoUnitario := vpValorFundosDeducaoUnitario;
  FValorTaxaJudiciariaUnitario := vpValorTaxaJudiciariaUnitario;
  FSistemaId := vpSistemaId;
  FUf := vpUf;
end;

class function TCalculoISSQN.New(
  const vpQuantidade: Integer;
  const vpValorEmolumento: Currency;
  const vpEmolumentoID: Integer;
  const vpEmolumentoItemId: Integer;
  const vpValorFundosDeducaoUnitario: Currency;
  const vpValorTaxaJudiciariaUnitario: Currency;
  const vpSistemaId: Integer;
  const vpUf: string): ICalculoEmolumentos<Currency>;
begin
  Result := Create(
    vpQuantidade,
    vpValorEmolumento,
    vpEmolumentoID,
    vpEmolumentoItemId,
    vpValorFundosDeducaoUnitario,
    vpValorTaxaJudiciariaUnitario,
    vpSistemaId,
    vpUf);
end;

{ TCamposFundosFactory }

constructor TCamposFundosFactory.Create(
  const vpDataSet: TDataSet);
begin
  inherited Create;
  FDataSet := vpDataSet;
end;

function TCamposFundosFactory.GetInstance: IDataSetAPI<TDataSet>;
{$REGION 'Vari�veis'}
var
  viFieldCreation: IFieldCreation<TDataSet>;
  viFundoTipo: TFundoTipo;
{$ENDREGION}
begin
  viFieldCreation := TDataSetAPI<TDataSet>.New(
    FDataSet)
  .BeginFieldCreation;

  for viFundoTipo in dtmLookup.GetFundoTipos do
    if viFundoTipo.Situacao then
      viFieldCreation.CreateCurrencyField(
        viFundoTipo.Sigla);

  Result := viFieldCreation.EndFieldCreation;
end;

class function TCamposFundosFactory.New(
  const vpDataSet: TDataSet): IFactory<IDataSetAPI<TDataSet>>;
begin
  Result := Create(
    vpDataSet);
end;

procedure CalculoEmolumentosEscritura(
  vpValorDocumento: Currency;
  vpPeriodoPadrao: Currency;
  vpEmolumentoId: Integer;
  vpQtd: Integer;
  vpAdTexto: Boolean;
  vpValorPersonalizado: string;
  vpEmolumento: Currency;
  vpTaxa: Currency;
  vpOutraTaxa: Currency;
  vpAtoId: string = '';
  vpAtoVinculoValorId: Integer = 0;
  vpTabela: string = '');
{$REGION 'Vari�veis'}
var
  viTotalEmolumento, viTotalTaxaJudiciaria, viTotalOutraTaxa, viDesconto: Currency;
  viValorAdicional : Array[1..100, 1..3] of Currency;
  viQtdFlag : Integer;
  viSeloFundos: TSeloFundos;
  viSeloFundo: TSeloFundo;
  viSeloFundoDAO: TSeloFundoDAO;
{$ENDREGION}

  procedure VerificarCodigo2003e2004;
  begin
    if ((dtmControles.sqlAuxiliar.Fields[3].AsInteger = 2003) or
       (dtmControles.sqlAuxiliar.Fields[3].AsInteger = 2004)) and (vpAtoId <> '') then
    begin
      vpQtd := dtmControles.GetInt(' SELECT COUNT(ATO_VINCULOPARTE_ID) FROM T_ATO_VINCULOPARTE '+
                                   ' WHERE ATO_ID = '+vpAtoId +' AND TIPO_VINCULO = 1');
      vgValoresCobranca.Quantidade :=  vpQtd;
    end
    else vgValoresCobranca.Quantidade := 0;
  end;

  procedure CalculoCodigo2017;
  begin
    CalculoTabelaCeara(vpValorDocumento, dtmControles.sqlAuxiliar.Fields[0].AsCurrency, dtmControles.sqlAuxiliar.Fields[4].AsCurrency, vpPeriodoPadrao);
    viTotalEmolumento     := Arredondamento(dtmControles.MetodoArredondamento,vgCalculoTabela.ResultadoEmol,2);
    viTotalTaxaJudiciaria := Arredondamento(dtmControles.MetodoArredondamento,vgCalculoTabela.ResultadoFermoju,2);
    viTotalOutraTaxa      := Arredondamento(dtmControles.MetodoArredondamento,dtmControles.sqlAuxiliar.Fields[2].AsCurrency,2);
  end;

  procedure CalculoVariosImoveisCeara(vpTipo : Integer);
  {$REGION 'Vari�veis'}
  var
    i : Integer;
  {$ENDREGION}
  begin
    if (vgValoresCobranca.TabelaBase <> 'CAUCAIA') or (vgValoresCobranca.QtdIMovel <= 1) then
      exit;

    case vpTipo of
     1 : begin
           if (viQtdFlag > 1) then
           begin
             vpValorDocumento := viValorAdicional[viQtdFlag, 1];
             exit;
           end
           else
           begin
             if vgValoresCobranca.vlValorDocumentoUnico then
             begin
               for i := 1 to vgValoresCobranca.QtdIMovel do
                 viValorAdicional[i, 1] := vpValorDocumento;
             end
             else
             begin
               ExecutaSimpleDSAux(' SELECT VALOR_MAIOR '+
                                  ' FROM T_ATO_VINCULOIMOVEL '+
                                  ' WHERE ATO_ID = '+vpAtoId+
                                  ' ORDER BY VALOR_MAIOR DESC', 0);
               for i := 1 to dtmControles.SimpleAuxiliar.RecordCount do
               begin
                 viValorAdicional[i, 1] := dtmControles.SimpleAuxiliar.FieldByName('VALOR_MAIOR').AsCurrency;
                 dtmControles.SimpleAuxiliar.Next;
               end;
               vpValorDocumento := viValorAdicional[viQtdFlag, 1];
             end;
           end;
         end;
     2 : begin
           if viQtdFlag = 1 then
           begin
             viValorAdicional[viQtdFlag, 2] := Arredondamento(dtmControles.MetodoArredondamento,viTotalEmolumento,2);
             viValorAdicional[viQtdFlag, 3] := Arredondamento(dtmControles.MetodoArredondamento,viTotalTaxaJudiciaria,2);
           end
           else
           begin
             viValorAdicional[viQtdFlag, 2] := Arredondamento(dtmControles.MetodoArredondamento,(viTotalEmolumento/2),2);
             viValorAdicional[viQtdFlag, 3] := Arredondamento(dtmControles.MetodoArredondamento,((viTotalEmolumento/2)*0.05),2);
           end;
         end;
     3 : begin
           viTotalEmolumento     := 0;
           viTotalTaxaJudiciaria := 0;
           for i := 1 to viQtdFlag do
           begin
             viTotalEmolumento      := viTotalEmolumento + viValorAdicional[i, 2];
             viTotalTaxaJudiciaria  := viTotalTaxaJudiciaria + viValorAdicional[i, 3];
           end;
         end;
    end;
  end;

  function RetornaValorDocumento(vfTipo: Integer) : Currency;
  begin
    if vfTipo = 5 then // C�lcula 2/3
      Result := Arredondamento(dtmControles.MetodoArredondamento,((vpValorDocumento/3)*2),2)
    else
      Result := vpValorDocumento;
  end;

begin
  vgValoresCobranca.TabelaBase := dtmControles.BuscarParametroOutroSistema(
    'TABELA_BASE',
    'VALOR',
    'PRINCIPAL',
    '2');

  // Tipo de Cobran�a Isento
  if vgValoresCobranca.TipoCobranca  = 1 then
  begin
    vgValoresCobranca.Emolumento := 0;
    vgValoresCobranca.TaxaJud    := 0;
  end
  else
  begin
    viQtdFlag := 1;
    repeat
      viTotalEmolumento     := 0;
      viTotalTaxaJudiciaria := 0;
      viTotalOutraTaxa      := 0;

      CalculoVariosImoveisCeara(1);
      ExecutaSqlAuxiliar(' SELECT VALOR_EMOLUMENTO, VALOR_TAXA_JUDICIARIA, VALOR_OUTRA_TAXA1,'+
                         '        CODIGO, VALOR_INICIO, EMOLUMENTO_ITEM_ID  '+
                         ' FROM G_EMOLUMENTO_ITEM '+
                         ' WHERE EMOLUMENTO_ID = :EMOLUMENTO_ID '+
                         ' AND :VALOR BETWEEN VALOR_INICIO AND VALOR_FIM '+
                         ' AND EMOLUMENTO_PERIODO_ID = :PERIODO_ID', 2);

      dtmControles.sqlAuxiliar.Params[0].AsCurrency := vpEmolumentoId;
      dtmControles.sqlAuxiliar.Params[1].AsCurrency := RetornaValorDocumento(vgValoresCobranca.TipoCobranca);
      dtmControles.sqlAuxiliar.Params[2].AsCurrency := vpPeriodoPadrao;
      dtmControles.sqlAuxiliar.Active := True;

      // Verifica C�dido 2003 e 2004 da Tabela (Para procura��o e substabelecimento quanto tem mais de um Outorgante)
      VerificarCodigo2003e2004;

      if vpValorPersonalizado = 'S' then
      begin
        viTotalEmolumento     := viTotalEmolumento + (vpEmolumento * vpQtd);
        viTotalTaxaJudiciaria := viTotalTaxaJudiciaria + (vpTaxa * vpQtd);
        viTotalOutraTaxa      := viTotalOutraTaxa + (vpOutraTaxa * vpQtd);
      end
      else
      begin
        if (dtmControles.sqlAuxiliar.Fields[3].AsInteger = 2017) or
           (dtmControles.sqlAuxiliar.Fields[3].AsInteger = 2031) then
          CalculoCodigo2017
        else
        begin
          viTotalEmolumento     := dtmControles.sqlAuxiliar.Fields[0].AsCurrency;
          viTotalTaxaJudiciaria := dtmControles.sqlAuxiliar.Fields[1].AsCurrency;
          viTotalOutraTaxa      := dtmControles.sqlAuxiliar.Fields[2].AsCurrency;
          if vpQtd > 1 then
          begin
            viTotalEmolumento     := dtmControles.sqlAuxiliar.Fields[0].AsCurrency * vpQtd;
            viTotalTaxaJudiciaria := dtmControles.sqlAuxiliar.Fields[1].AsCurrency * vpQtd;
            viTotalOutraTaxa      := dtmControles.sqlAuxiliar.Fields[2].AsCurrency * vpQtd;
          end;
        end
      end;
      CalculoVariosImoveisCeara(2);
      inc(viQtdFlag);
    until ((vgValoresCobranca.TabelaBase <> 'CAUCAIA') or (vgValoresCobranca.QtdIMovel < viQtdFlag));

    if vpValorPersonalizado <> 'S' then
       CalculoVariosImoveisCeara(3);

    vgValoresCobranca.EmolumentoItemId := dtmControles.sqlAuxiliar.Fields[5].AsInteger;
    vgValoresCobranca.Emolumento       := 0;
    vgValoresCobranca.TaxaJud          := 0;
    vgValoresCobranca.OutraTaxa        := 0;
    vgValoresCobranca.Fundos           := 0;

    vgValoresCobranca.Emolumento       := viTotalEmolumento;
    vgValoresCobranca.TaxaJud          := viTotalTaxaJudiciaria;
    if vgValoresCobranca.CobrarOutraTaxa then
      vgValoresCobranca.OutraTaxa      := viTotalOutraTaxa;

    {$REGION 'Tipo de Cobran�a Normal'}
//    case vgValoresCobranca.TipoCobranca of
//      2 : begin
//            vgValoresCobranca.Emolumento  := viTotalEmolumento;
//            vgValoresCobranca.TaxaJud     := viTotalTaxaJudiciaria;
//            if vgValoresCobranca.CobrarOutraTaxa then
//              vgValoresCobranca.OutraTaxa := viTotalOutraTaxa;
//          end;
//      3 : vgValoresCobranca.TaxaJud       := viTotalTaxaJudiciaria;
//      4 : vgValoresCobranca.Emolumento    := viTotalEmolumento;
//      5 : begin
//            vgValoresCobranca.Emolumento  := ((viTotalEmolumento/3)*2);
//            vgValoresCobranca.TaxaJud     := viTotalTaxaJudiciaria;
//          end;
//      6 : begin
//            if vgValoresCobranca.ItemComplementar = 'S' then
//              vgValoresCobranca.Emolumento := viTotalEmolumento/2
//            else
//              vgValoresCobranca.Emolumento := viTotalEmolumento;
//          end;
//    end;
    {$ENDREGION}
  end;

  viDesconto := vgValoresCobranca.Desconto;
  vgValoresCobranca.ValorTotal :=
    Arredondamento(dtmControles.MetodoArredondamento,((vgValoresCobranca.TaxaJud + vgValoresCobranca.Emolumento +
      vgValoresCobranca.OutraTaxa) - viDesconto), 2);

  viSeloFundos := TCalculoFundos
  .New(
    vpAtoVinculoValorId,
    vpQtd,
    vgValoresCobranca.Emolumento / vpQtd,
    0,
    Controles.vgUF,
    Controles.vgId)
  .Calcular;

  try
    vgValoresCobranca.Fundos := viSeloFundos.Valor;

    if Assigned(viSeloFundos) then
    begin
      if not vpTabela.IsEmpty and
        (CompareValue(
          vpAtoVinculoValorId,
          ZeroValue) = GreaterThanValue) then
      begin
        viSeloFundoDAO := TSeloFundoDAO.Create;

        try
          viSeloFundoDAO.Excluir(vpAtoVinculoValorId, vpTabela);

          {$REGION 'Inserir'}
          for viSeloFundo in viSeloFundos do
          begin
            viSeloFundo.ItemServico := vpAtoVinculoValorId;
            viSeloFundo.Tabela      := vpTabela;
            viSeloFundoDAO.Inserir(viSeloFundo);
          end;
          {$ENDREGION}
        finally
          viSeloFundoDAO.Free;
        end;
      end;
    end;
  finally
    viSeloFundos.Free;
  end;

  if vgValoresCobranca.CobrarFundos then
    vgValoresCobranca.ValorTotal := vgValoresCobranca.ValorTotal + vgValoresCobranca.Fundos;

  if (vgValoresCobranca.ItemManual  = 'S') then
  begin
    if (vpAdTexto) then
    begin
      vgValoresCobranca.ItemComplementar := 'S';
      vgValoresCobranca.ItemPadrao := 'S';
    end
    else
    begin
      vgValoresCobranca.ItemComplementar := Null;
      vgValoresCobranca.ItemPadrao := 'N';
    end;
  end;
end;

end.