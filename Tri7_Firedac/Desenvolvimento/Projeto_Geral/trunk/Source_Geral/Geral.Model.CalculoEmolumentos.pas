unit Geral.Model.CalculoEmolumentos;

interface

uses
  SeloFundo,
  Data.DB,
  Rotinas;

type
  TCalculoEmolumentos = class
  private
    FEmolumentoID: Integer;
    FDataBase: TDateTime;
    FValorBase: Currency;
    FQuantidade: Integer;
    FSistemaId: Integer;
    FEmolumentoPeriodoID: Integer;
    FEmolumentoItemID: Integer;
    FValorEmolumento: Currency;
    FValorTaxaJudiciaria: Currency;
    FSeloFundos: TSeloFundos;
    FValorOutraTaxa1: Currency;
  public
    property EmolumentoID: Integer read FEmolumentoID write FEmolumentoID;
    property DataBase: TDateTime read FDataBase write FDataBase;
    property ValorBase: Currency read FValorBase write FValorBase;
    property Quantidade: Integer read FQuantidade write FQuantidade;
    property SistemaId: Integer read FSistemaId write FSistemaId;
    property EmolumentoPeriodoID: Integer read FEmolumentoPeriodoID write FEmolumentoPeriodoID;
    property EmolumentoItemID: Integer read FEmolumentoItemID write FEmolumentoItemID;
    property ValorEmolumento: Currency read FValorEmolumento write FValorEmolumento;
    property ValorTaxaJudiciaria: Currency read FValorTaxaJudiciaria write FValorTaxaJudiciaria;
    property SeloFundos: TSeloFundos read FSeloFundos write FSeloFundos;
    property ValorOutraTaxa1: Currency read FValorOutraTaxa1 write FValorOutraTaxa1;

    destructor Destroy; override;
  end;

  TTipoCalculo = (
    tcNenhum,
    tcPercentual,
    tcValorFixo);

  TTipoBaseCalculo = (
    tbcNenhum,
    tbcValorEmolumento,
    tbcValorEmolumentoDeducaoFundos,
    tbcValorEmolumentoAcrescTaxaJudiciaria);

  TCalculoOutraTaxa1Business = class
  private
    class function BuscarCalcularValorOutraTaxa1(
      const vpSistemaId: Integer;
      const vpEmolumentoId: Integer): Boolean;

    class function BuscarTipoCalculo(
      const vpSistemaId: Integer;
      const vpUf: string): TTipoCalculo;

    class function BuscarValorOutraTaxa1(
      const vpEmolumentoItemId: Integer): Currency;

    class function BuscarTipoBaseCalculo(
      const vpSistemaId: Integer): TTipoBaseCalculo;

    class function BuscarBaseCalculoUnitaria(
      const vpValorEmolumentoUnitario: Currency;
      const vpValorFundosDeducaoUnitario: Currency;
      const vpValorTaxaJudiciariaUnitario: Currency;
      const vpTipoBaseCalculo: TTipoBaseCalculo): Currency;

    class function BuscarPercentual(
      const vpSistemaId: Integer;
      const vpEmolumentoItemId: Integer): Double;

    class function BuscarRtdOutraTaxaTipo: Integer;
  public
    class function Calcular(
      const vpEmolumentoId: Integer;
      const vpEmolumentoItemId: Integer;
      const vpValorEmolumentoUnitario: Currency;
      const vpValorFundosDeducaoUnitario: Currency;
      const vpValorTaxaJudiciariaUnitario: Currency;
      const vpQuantidade: Integer;
      const vpSistemaId: Integer;
      const vpUf: string): Currency;
  end;

  TCalculoEmolumentosBusiness = class
  private
    class function BuscarSeloFundos(
      const vpEmolumentoId: Integer;
      const vpDataBase: TDateTime;
      const vpQuantidade: Integer;
      const vpValorEmolumento: Currency;
      const vpSistemaId: Integer;
      const vpUf: string): TSeloFundos;
  public
    class function Calcular(
      const vpEmolumentoId: Integer;
      const vpDataBase: TDateTime;
      const vpValorBase: Currency;
      const vpQuantidade: Integer;
      const vpSistemaId: Integer;
      const vpUf: string): TCalculoEmolumentos;
  end;

  function GetEmolumentoPeriodoID(
    const vpDataBase: TDateTime): Integer;

  function GetEmolumentoItem(
    const vpEmolumentoId: Integer;
    const vpEmolumentoPeriodoID: Integer;
    const vpValorBase: Currency): TDataSet;

implementation

uses
  Geral.Model.EmolumentoPeriodo,
  Controles,
  Geral.Model.EmolumentoItem,
  FundoTipo,
  System.Generics.Collections,
  I9Query,
  System.SysUtils,
  Geral.Model.Sistema,
  EmolumentoImpl,
  Lookup,
  System.StrUtils;

{ TCalculoEmolumentosBusiness }

class function TCalculoEmolumentosBusiness.Calcular(
  const vpEmolumentoId: Integer;
  const vpDataBase: TDateTime;
  const vpValorBase: Currency;
  const vpQuantidade: Integer;
  const vpSistemaId: Integer;
  const vpUf: string): TCalculoEmolumentos;
var
  viEmolumentoItem: TDataSet;
  viValorEmolumentoUnitario: Currency;
  viValorTaxaJudiciariaUnitario: Currency;
  viEmolumentoItemId: Integer;
  viValorFundosDeducaoUnitario: Currency;
begin
  Result := nil;
  viEmolumentoItem := nil;

  try
    try
      Result := TCalculoEmolumentos.Create;
      Result.EmolumentoID := vpEmolumentoId;
      Result.DataBase := vpDataBase;
      Result.ValorBase := vpValorBase;
      Result.Quantidade := vpQuantidade;
      Result.SistemaId := vpSistemaId;
      Result.EmolumentoPeriodoID := GetEmolumentoPeriodoID(vpDataBase);

      viEmolumentoItem := GetEmolumentoItem(
        vpEmolumentoId,
        Result.EmolumentoPeriodoID,
        vpValorBase);

      viEmolumentoItemId := viEmolumentoItem.FieldByName('EMOLUMENTO_ITEM_ID').AsInteger;
      Result.EmolumentoItemID := viEmolumentoItemId;

      viValorEmolumentoUnitario := viEmolumentoItem.FieldByName('VALOR_EMOLUMENTO').AsCurrency;
      Result.ValorEmolumento := viValorEmolumentoUnitario * vpQuantidade;

      viValorTaxaJudiciariaUnitario := viEmolumentoItem.FieldByName('VALOR_TAXA_JUDICIARIA').AsCurrency;
      Result.ValorTaxaJudiciaria := viValorTaxaJudiciariaUnitario * vpQuantidade;

      Result.SeloFundos := BuscarSeloFundos(
        vpEmolumentoId,
        vpDataBase,
        vpQuantidade,
        Result.ValorEmolumento,
        vpSistemaId,
        vpUf);

      viValorFundosDeducaoUnitario := Result.SeloFundos.ValorDeducao / vpQuantidade;

      Result.ValorOutraTaxa1 := TCalculoOutraTaxa1Business.Calcular(
        vpEmolumentoId,
        viEmolumentoItemId,
        viValorEmolumentoUnitario,
        viValorFundosDeducaoUnitario,
        viValorTaxaJudiciariaUnitario,
        vpQuantidade,
        vpSistemaId,
        vpUf);
    except
      FreeAndNil(Result);
      raise;
    end;
  finally
    FreeAndNil(viEmolumentoItem);
  end;
end;

function GetEmolumentoItem(
  const vpEmolumentoId: Integer;
  const vpEmolumentoPeriodoID: Integer;
  const vpValorBase: Currency): TDataSet;
var
  viEmolumentoItemDAO: TEmolumentoItemDAO;
begin
  viEmolumentoItemDAO := TEmolumentoItemDAO.Create(
    dtmControles.DB);

  try
    Result := viEmolumentoItemDAO.GetListAsDataSet(
      ['EMOLUMENTO_ITEM_ID',
      'VALOR_EMOLUMENTO',
      'VALOR_TAXA_JUDICIARIA'],
      1,
      0,
      'EMOLUMENTO_ID = :P_EMOLUMENTO_ID AND ' +
      'EMOLUMENTO_PERIODO_ID = :P_EMOLUMENTO_PERIODO_ID AND ' +
      ':P_VALOR_BASE BETWEEN VALOR_INICIO AND VALOR_FIM',
      [vpEmolumentoId,
      vpEmolumentoPeriodoID,
      vpValorBase],
      'EMOLUMENTO_ITEM_ID');
  finally
    viEmolumentoItemDAO.Free;
  end;
end;

function GetEmolumentoPeriodoID(
  const vpDataBase: TDateTime): Integer;
var
  viEmolumentoPeriodo: TDataSet;
  viEmolumentoPeriodoDAO: TEmolumentoPeriodoDAO;
begin
  Result := 0;
  viEmolumentoPeriodo := nil;
  viEmolumentoPeriodoDAO := nil;

  try
    viEmolumentoPeriodoDAO := TEmolumentoPeriodoDAO.Create(
      dtmControles.DB);

    viEmolumentoPeriodo := viEmolumentoPeriodoDAO.GetListAsDataSet(
      ['EMOLUMENTO_PERIODO_ID'],
      1,
      0,
      'DATA_INICIAL <= :P_DATA_INICIAL',
      [vpDataBase],
      'DATA_INICIAL DESC');

    if viEmolumentoPeriodo.IsEmpty then
      Exit;

    Result := viEmolumentoPeriodo.FieldByName(
      'EMOLUMENTO_PERIODO_ID').AsInteger;
  finally
    if Assigned(viEmolumentoPeriodo) then
      viEmolumentoPeriodo.Close;

    viEmolumentoPeriodo.Free;
    viEmolumentoPeriodoDAO.Free;
  end;
end;

class function TCalculoEmolumentosBusiness.BuscarSeloFundos(
  const vpEmolumentoId: Integer;
  const vpDataBase: TDateTime;
  const vpQuantidade: Integer;
  const vpValorEmolumento: Currency;
  const vpSistemaId: Integer;
  const vpUf: string): TSeloFundos;
var
  viValorEmolumentoList: TList<Currency>;
  viFundoTipoList: TFundoTipos;
  viEmolumento: EmolumentoImpl.TEmolumento;
begin
  viValorEmolumentoList := nil;
  viFundoTipoList := nil;
  viEmolumento := nil;

  try
    viValorEmolumentoList := Rotinas.RetornarListCurrency(
      vpValorEmolumento,
      vpQuantidade);

    if vpEmolumentoId > 0 then
      viEmolumento := EmolumentoImpl.TEmolumento.Create(vpEmolumentoId);

    viFundoTipoList := dtmLookup.GetFundoTipos(viEmolumento);

    Result := TCalculadoraSeloFundos.Get(
      viValorEmolumentoList,
      viFundoTipoList,
      vpDataBase,
      vpUf,
      vpSistemaId);
  finally
    FreeAndNil(viValorEmolumentoList);
    FreeAndNil(viFundoTipoList);
    FreeAndNil(viEmolumento);
  end;
end;

{ TCalculoEmolumentos }

destructor TCalculoEmolumentos.Destroy;
begin
  FreeAndNil(FSeloFundos);
  inherited;
end;

{ TCalculoOutraTaxa1Business }

class function TCalculoOutraTaxa1Business.BuscarBaseCalculoUnitaria(
  const vpValorEmolumentoUnitario: Currency;
  const vpValorFundosDeducaoUnitario: Currency;
  const vpValorTaxaJudiciariaUnitario: Currency;
  const vpTipoBaseCalculo: TTipoBaseCalculo): Currency;
begin
  Result := 0;

  if vpTipoBaseCalculo = TTipoBaseCalculo.tbcNenhum then
    Exit;

  if vpTipoBaseCalculo = TTipoBaseCalculo.tbcValorEmolumento then
  begin
    Result := vpValorEmolumentoUnitario;
    Exit;
  end;

  if vpTipoBaseCalculo = TTipoBaseCalculo.tbcValorEmolumentoDeducaoFundos then
  begin
    Result := vpValorEmolumentoUnitario - vpValorFundosDeducaoUnitario;
    Exit;
  end;

  if vpTipoBaseCalculo = TTipoBaseCalculo.tbcValorEmolumentoAcrescTaxaJudiciaria then
    Result := vpValorEmolumentoUnitario + vpValorTaxaJudiciariaUnitario;
end;

class function TCalculoOutraTaxa1Business.BuscarCalcularValorOutraTaxa1(
  const vpSistemaId: Integer;
  const vpEmolumentoId: Integer): Boolean;
var
  viQuery: TI9Query;
  viUsarOutraTaxa1: Boolean;
  viGrupo: string;
  viSecao: string;
  viParametro: string;
begin
  Result := False;
  viQuery := nil;

  try
    viGrupo := string.Empty;
    viSecao := string.Empty;
    viParametro := string.Empty;

    case vpSistemaId of
      CI_COD_SISTEMA_REGISTRO_IMOVEIS:
      begin
        viGrupo := 'PEDIDO';
        viSecao := 'ITENS DO PEDIDO';
        viParametro := 'USAR_ISSQN';
      end;

      CI_COD_SISTEMA_TABELIONATO_DE_NOTAS, CI_COD_SISTEMA_RTD, CI_COD_SISTEMA_RC:
      begin
        viGrupo := 'PRINCIPAL';
        viSecao := 'VALOR';
        viParametro := 'USAR_OUTRA_TAXA';
      end;

      CI_COD_SISTEMA_PROTESTO:
      begin
        viGrupo := 'TITULO';
        viSecao := 'VALORES';
        viParametro := 'CALCULAR_ISSQN';
      end;
    end;

    if viGrupo.IsEmpty or
      viSecao.IsEmpty or
      viParametro.IsEmpty then
      Exit;

    if vpEmolumentoId <= 0 then
      Exit;

    // S = Sim
    viUsarOutraTaxa1 := dtmControles.BuscarParametroOutroSistema(
      viParametro,
      viSecao,
      viGrupo,
      vpSistemaId.ToString) = 'S';

    if not viUsarOutraTaxa1 then
      Exit;

    viQuery := TI9Query.Create(nil);
    viQuery.Connection := dtmControles.DB;

    viQuery.SQL.Text := {$REGION 'Comando SQL SELECT'}
      'SELECT '+
      '    G_E.EMOLUMENTO_ID, '+
      '    G_E.CALCULAR_VALOR_OUTRA_TAXA1 '+
      'FROM '+
      '    G_EMOLUMENTO G_E '+
      'WHERE '+
      '    G_E.EMOLUMENTO_ID = :EMOLUMENTO_ID ';
    {$ENDREGION}

    viQuery.ParamByName('EMOLUMENTO_ID').AsInteger := vpEmolumentoId;
    viQuery.Open;

    if viQuery.IsEmpty then
      Exit;

    // S = Sim
    Result := MatchText(
      viQuery.FieldByName('CALCULAR_VALOR_OUTRA_TAXA1').AsString,
      ['S',
      string.Empty]);
  finally
    FreeAndNil(viQuery);
  end;
end;

class function TCalculoOutraTaxa1Business.BuscarPercentual(
  const vpSistemaId: Integer;
  const vpEmolumentoItemId: Integer): Double;
begin
  Result := 0;

  if vpSistemaId in
    [CI_COD_SISTEMA_REGISTRO_IMOVEIS,
    CI_COD_SISTEMA_TABELIONATO_DE_NOTAS,
    CI_COD_SISTEMA_RTD,
    CI_COD_SISTEMA_RC] then
  begin
    Result := dtmControles.BuscarParametroOutroSistema(
      'ISSQN_TAXA',
      'ISSQN',
      'ATO_PRATICADO',
      IntToStr(CI_COD_SISTEMA_CAIXA));

    Exit;
  end;

  if vpSistemaId = CI_COD_SISTEMA_PROTESTO then
  begin
    Result := dtmControles.BuscarParametroOutroSistema(
      'PORC_ISSQN',
      'VALORES',
      'TITULO',
      IntToStr(CI_COD_SISTEMA_PROTESTO));

    Exit;
  end;
end;

class function TCalculoOutraTaxa1Business.BuscarRtdOutraTaxaTipo: Integer;
begin
  Result := dtmControles.BuscarParametroOutroSistema(
    'OUTRA_TAXA_TIPO',
    'VALOR',
    'PRINCIPAL',
    IntToStr(CI_COD_SISTEMA_RTD));
end;

class function TCalculoOutraTaxa1Business.BuscarTipoBaseCalculo(
  const vpSistemaId: Integer): TTipoBaseCalculo;
var
  viTipoBaseCalculoOutraTaxa1: Integer;
  viRtdOutraTaxaTipo: Integer;
begin
  Result := TTipoBaseCalculo.tbcNenhum;

  if vpSistemaId = CI_COD_SISTEMA_RTD then
  begin
    viRtdOutraTaxaTipo := BuscarRtdOutraTaxaTipo;

    // 2 = % Valor Total
    if viRtdOutraTaxaTipo = 2 then
      Result := TTipoBaseCalculo.tbcValorEmolumentoAcrescTaxaJudiciaria;

    // 3 = % Valor Emolumentos
    if viRtdOutraTaxaTipo = 3 then
      Result := TTipoBaseCalculo.tbcValorEmolumento;

    // 4 = % Valor Emol. Deduc. Fundos
    if viRtdOutraTaxaTipo = 4 then
      Result := TTipoBaseCalculo.tbcValorEmolumentoDeducaoFundos;

    Exit;
  end;

  viTipoBaseCalculoOutraTaxa1 := dtmControles.BuscarParametroOutroSistema(
    'TIPO_BASE_CALCULO_VALOR_OUTRA_TAXA1',
    'VALOR',
    'PRINCIPAL',
    vpSistemaId.ToString);

  if viTipoBaseCalculoOutraTaxa1 = 1 then
  begin
    Result := TTipoBaseCalculo.tbcValorEmolumento;
    Exit;
  end;

  if viTipoBaseCalculoOutraTaxa1 = 2 then
    Result := TTipoBaseCalculo.tbcValorEmolumentoDeducaoFundos;
end;

class function TCalculoOutraTaxa1Business.BuscarTipoCalculo(
  const vpSistemaId: Integer;
  const vpUf: string): TTipoCalculo;
var
  viRtdOutraTaxaTipo: Integer;
  viGoias: Boolean;
  viPara: Boolean;
begin
  Result := TTipoCalculo.tcNenhum;

  if vpSistemaId in
    [CI_COD_SISTEMA_REGISTRO_IMOVEIS,
    CI_COD_SISTEMA_PROTESTO] then
  begin
    Result := TTipoCalculo.tcPercentual;
    Exit;
  end;

  if vpSistemaId in
    [CI_COD_SISTEMA_TABELIONATO_DE_NOTAS,
    CI_COD_SISTEMA_RC] then
  begin
    viGoias := SameText(
      vpUf,
      'GO');

    viPara := SameText(
      vpUf,
      'PA');

    if viGoias or viPara then
      Result := TTipoCalculo.tcPercentual
    else
      Result := TTipoCalculo.tcValorFixo;

    Exit;
  end;

  if vpSistemaId = CI_COD_SISTEMA_RTD then
  begin
    viRtdOutraTaxaTipo := BuscarRtdOutraTaxaTipo;

    // 1 = Valor Numérico
    if viRtdOutraTaxaTipo = 1 then
      Result := TTipoCalculo.tcValorFixo
    else
      Result := TTipoCalculo.tcPercentual;
  end;
end;

class function TCalculoOutraTaxa1Business.BuscarValorOutraTaxa1(
  const vpEmolumentoItemId: Integer): Currency;
var
  viQuery: TI9Query;
begin
  Result := 0;
  viQuery := nil;

  try
    if vpEmolumentoItemId <= 0 then
      Exit;

    viQuery := TI9Query.Create(nil);
    viQuery.Connection := dtmControles.DB;

    viQuery.SQL.Text := {$REGION 'Comando SQL SELECT'}
      'SELECT '+
      '    G_EI.EMOLUMENTO_ITEM_ID, '+
      '    G_EI.VALOR_OUTRA_TAXA1 '+
      'FROM '+
      '    G_EMOLUMENTO_ITEM G_EI '+
      'WHERE '+
      '    G_EI.EMOLUMENTO_ITEM_ID = :EMOLUMENTO_ITEM_ID ';
    {$ENDREGION}

    viQuery.ParamByName('EMOLUMENTO_ITEM_ID').AsInteger := vpEmolumentoItemId;
    viQuery.Open;

    if viQuery.IsEmpty then
      Exit;

    Result := viQuery.FieldByName('VALOR_OUTRA_TAXA1').AsCurrency;
  finally
    FreeAndNil(viQuery);
  end;
end;

class function TCalculoOutraTaxa1Business.Calcular(
  const vpEmolumentoId: Integer;
  const vpEmolumentoItemId: Integer;
  const vpValorEmolumentoUnitario: Currency;
  const vpValorFundosDeducaoUnitario: Currency;
  const vpValorTaxaJudiciariaUnitario: Currency;
  const vpQuantidade: Integer;
  const vpSistemaId: Integer;
  const vpUf: string): Currency;
var
  viCalcularValorOutraTaxa1: Boolean;
  viTipoCalculo: TTipoCalculo;
  viValorOutraTaxa1: Currency;
  viValorUnitario: Currency;
  viTipoBaseCalculo: TTipoBaseCalculo;
  viBaseCalculoUnitaria: Currency;
  viPercentual: Double;
begin
  Result := 0;

  viCalcularValorOutraTaxa1 := BuscarCalcularValorOutraTaxa1(
    vpSistemaId,
    vpEmolumentoId);

  if not viCalcularValorOutraTaxa1 then
    Exit;

  viTipoCalculo := BuscarTipoCalculo(
    vpSistemaId,
    vpUf);

  if viTipoCalculo = TTipoCalculo.tcNenhum then
    Exit;

  if viTipoCalculo = TTipoCalculo.tcValorFixo then
  begin
    viValorOutraTaxa1 := BuscarValorOutraTaxa1(vpEmolumentoItemId);
    viValorUnitario := viValorOutraTaxa1;
  end
  else
  begin
    viTipoBaseCalculo := BuscarTipoBaseCalculo(vpSistemaId);
    if viTipoBaseCalculo = TTipoBaseCalculo.tbcNenhum then
      Exit;

    viBaseCalculoUnitaria := BuscarBaseCalculoUnitaria(
      vpValorEmolumentoUnitario,
      vpValorFundosDeducaoUnitario,
      vpValorTaxaJudiciariaUnitario,
      viTipoBaseCalculo);

    if viBaseCalculoUnitaria <= 0 then
      Exit;

    viPercentual := BuscarPercentual(
      vpSistemaId,
      vpEmolumentoItemId);

    if viPercentual <= 0 then
      Exit;

    viValorUnitario := Rotinas.GetPorcentagem(
      dtmControles.MetodoArredondamento,
      viBaseCalculoUnitaria,
      viPercentual);
  end;

  if viValorUnitario <= 0 then
    Exit;

  Result := viValorUnitario * vpQuantidade;
end;

end.
