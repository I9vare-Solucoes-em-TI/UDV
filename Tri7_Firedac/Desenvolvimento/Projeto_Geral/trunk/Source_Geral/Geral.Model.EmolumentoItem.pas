unit Geral.Model.EmolumentoItem;

interface

uses
  Geral.Model.DAO,
  Data.DB,
  FireDAC.Stan.Param;

type
  TEmolumentoItem = class
  strict private
    FEmolumentoItemID: Integer;
    FEmolumentoID: Integer;
    FEmolumentoPeriodoID: Integer;
    FValorInicio: Currency;
    FValorFim: Currency;
    FValorEmolumento: Currency;
    FValorTaxaJudiciaria: Currency;
  public
    property EmolumentoItemID: Integer read FEmolumentoItemID write FEmolumentoItemID;
    property EmolumentoID: Integer read FEmolumentoID write FEmolumentoID;
    property EmolumentoPeriodoID: Integer read FEmolumentoPeriodoID write FEmolumentoPeriodoID;
    property ValorInicio: Currency read FValorInicio write FValorInicio;
    property ValorFim: Currency read FValorFim write FValorFim;
    property ValorEmolumento: Currency read FValorEmolumento write FValorEmolumento;
    property ValorTaxaJudiciaria: Currency read FValorTaxaJudiciaria write FValorTaxaJudiciaria;
  end;

  TEmolumentoItemDAO = class(TDAO<TEmolumentoItem>)
  protected
    function CreateObject(
      const vpDataSet: TDataSet): TEmolumentoItem; override;

    function GetTableName: string; override;
    function GetColumns: TArray<string>; override;

    procedure FillParams(
      const vpParams: TFDParams;
      const vpIndex: Integer;
      const vpValue: TEmolumentoItem); override;
  end;

implementation

{ TEmolumentoItemDAO }

function TEmolumentoItemDAO.CreateObject(
  const vpDataSet: TDataSet): TEmolumentoItem;
begin
  Result := TEmolumentoItem.Create;

  Result.EmolumentoItemID := vpDataSet.FieldByName(
    'EMOLUMENTO_ITEM_ID').AsInteger;

  Result.EmolumentoID := vpDataSet.FieldByName(
    'EMOLUMENTO_ID').AsInteger;

  Result.EmolumentoPeriodoID := vpDataSet.FieldByName(
    'EMOLUMENTO_PERIODO_ID').AsInteger;

  Result.ValorInicio := vpDataSet.FieldByName(
    'VALOR_INICIO').AsCurrency;

  Result.ValorFim := vpDataSet.FieldByName(
    'VALOR_FIM').AsCurrency;

  Result.ValorEmolumento := vpDataSet.FieldByName(
    'VALOR_EMOLUMENTO').AsCurrency;

  Result.ValorTaxaJudiciaria := vpDataSet.FieldByName(
    'VALOR_TAXA_JUDICIARIA').AsCurrency;
end;

procedure TEmolumentoItemDAO.FillParams(
  const vpParams: TFDParams;
  const vpIndex: Integer;
  const vpValue: TEmolumentoItem);
begin
  vpParams.ParamByName(
    'EMOLUMENTO_ITEM_ID').AsIntegers[vpIndex] := vpValue.EmolumentoItemID;

  vpParams.ParamByName(
    'EMOLUMENTO_ID').AsIntegers[vpIndex] := vpValue.EmolumentoID;

  vpParams.ParamByName(
    'EMOLUMENTO_PERIODO_ID').AsIntegers[vpIndex] := vpValue.EmolumentoPeriodoID;

  vpParams.ParamByName(
    'VALOR_INICIO').AsCurrencys[vpIndex] := vpValue.ValorInicio;

  vpParams.ParamByName(
    'VALOR_FIM').AsCurrencys[vpIndex] := vpValue.ValorFim;

  vpParams.ParamByName(
    'VALOR_EMOLUMENTO').AsCurrencys[vpIndex] := vpValue.ValorEmolumento;

  vpParams.ParamByName(
    'VALOR_TAXA_JUDICIARIA').AsCurrencys[vpIndex] := vpValue.ValorTaxaJudiciaria;
end;

function TEmolumentoItemDAO.GetColumns: TArray<string>;
begin
  Result := ['EMOLUMENTO_ITEM_ID',
    'EMOLUMENTO_ID',
    'EMOLUMENTO_PERIODO_ID',
    'VALOR_INICIO',
    'VALOR_FIM',
    'VALOR_EMOLUMENTO',
    'VALOR_TAXA_JUDICIARIA'];
end;

function TEmolumentoItemDAO.GetTableName: string;
begin
  Result := 'G_EMOLUMENTO_ITEM';
end;

end.
