unit EmolumentoItemImpl;

interface

uses
  EmolumentoItem,
  Emolumento,
  EmolumentoPeriodo;

type
  TEmolumentoItem = class(TInterfacedObject, IEmolumentoItem)
  private
    FEmolumentoItemID: Integer;
    FEmolumento: IEmolumento;
    FEmolumentoPeriodo: IEmolumentoPeriodo;
    FValorInicio: Currency;
    FValorFim: Currency;
    FValorEmolumento: Currency;
    FValorTaxaJudiciaria: Currency;
    FCodigo: Integer;
    FPaginaExtra: Integer;
    FValorPaginaExtra: Currency;
    FValorOutraTaxa1: Currency;
    FCodigoSelo: string;

    function GetEmolumentoItemID: Integer;
    function GetEmolumento: IEmolumento;
    function GetEmolumentoPeriodo: IEmolumentoPeriodo;
    function GetValorInicio: Currency;
    function GetValorFim: Currency;
    function GetValorEmolumento: Currency;
    function GetValorTaxaJudiciaria: Currency;
    function GetCodigo: Integer;
    function GetPaginaExtra: Integer;
    function GetValorPaginaExtra: Currency;
    function GetValorOutraTaxa1: Currency;
    function GetCodigoSelo: string;

    procedure SetEmolumentoItemID(
      const Value: Integer);

    procedure SetEmolumento(
      const Value: IEmolumento);

    procedure SetEmolumentoPeriodo(
      const Value: IEmolumentoPeriodo);

    procedure SetValorInicio(
      const Value: Currency);

    procedure SetValorFim(
      const Value: Currency);

    procedure SetValorEmolumento(
      const Value: Currency);

    procedure SetValorTaxaJudiciaria(
      const Value: Currency);

    procedure SetCodigo(
      const Value: Integer);

    procedure SetPaginaExtra(
      const Value: Integer);

    procedure SetValorPaginaExtra(
      const Value: Currency);

    procedure SetValorOutraTaxa1(
      const Value: Currency);

    procedure SetCodigoSelo(
      const Value: string);
  public
    property EmolumentoItemID: Integer read GetEmolumentoItemID
      write SetEmolumentoItemID;

    property Emolumento: IEmolumento read GetEmolumento write SetEmolumento;

    property EmolumentoPeriodo: IEmolumentoPeriodo read GetEmolumentoPeriodo
      write SetEmolumentoPeriodo;

    property ValorInicio: Currency read GetValorInicio write SetValorInicio;
    property ValorFim: Currency read GetValorFim write SetValorFim;

    property ValorEmolumento: Currency read GetValorEmolumento
      write SetValorEmolumento;

    property ValorTaxaJudiciaria: Currency read GetValorTaxaJudiciaria
      write SetValorTaxaJudiciaria;

    property Codigo: Integer read GetCodigo write SetCodigo;
    property PaginaExtra: Integer read GetPaginaExtra write SetPaginaExtra;

    property ValorPaginaExtra: Currency read GetValorPaginaExtra
      write SetValorPaginaExtra;

    property ValorOutraTaxa1: Currency read GetValorOutraTaxa1
      write SetValorOutraTaxa1;

    property CodigoSelo: string read GetCodigoSelo write SetCodigoSelo;

    function Equals(
      const vpValue: IEmolumentoItem): Boolean; reintroduce;

    function NotEquals(
      const vpValue: IEmolumentoItem): Boolean;

    class function New: IEmolumentoItem; static;
  end;

implementation

uses
  System.Math,
  System.Types,
  BooleanHelper;

{ TEmolumentoItem }

function TEmolumentoItem.Equals(
  const vpValue: IEmolumentoItem): Boolean;
begin
  Result := CompareValue(EmolumentoItemID,
    vpValue.EmolumentoItemID) = EqualsValue;
end;

function TEmolumentoItem.GetCodigo: Integer;
begin
  Result := FCodigo;
end;

function TEmolumentoItem.GetCodigoSelo: string;
begin
  Result := FCodigoSelo;
end;

function TEmolumentoItem.GetEmolumento: IEmolumento;
begin
  Result := FEmolumento;
end;

function TEmolumentoItem.GetEmolumentoItemID: Integer;
begin
  Result := FEmolumentoItemID;
end;

function TEmolumentoItem.GetEmolumentoPeriodo: IEmolumentoPeriodo;
begin
  Result := FEmolumentoPeriodo;
end;

function TEmolumentoItem.GetPaginaExtra: Integer;
begin
  Result := FPaginaExtra;
end;

function TEmolumentoItem.GetValorEmolumento: Currency;
begin
  Result := FValorEmolumento;
end;

function TEmolumentoItem.GetValorFim: Currency;
begin
  Result := FValorFim;
end;

function TEmolumentoItem.GetValorInicio: Currency;
begin
  Result := FValorInicio;
end;

function TEmolumentoItem.GetValorOutraTaxa1: Currency;
begin
  Result := FValorOutraTaxa1;
end;

function TEmolumentoItem.GetValorPaginaExtra: Currency;
begin
  Result := FValorPaginaExtra;
end;

function TEmolumentoItem.GetValorTaxaJudiciaria: Currency;
begin
  Result := FValorTaxaJudiciaria;
end;

class function TEmolumentoItem.New: IEmolumentoItem;
begin
  Result := TEmolumentoItem.Create;
end;

function TEmolumentoItem.NotEquals(
  const vpValue: IEmolumentoItem): Boolean;
begin
  Result := Equals(vpValue);
  Result.Negate;
end;

procedure TEmolumentoItem.SetCodigo(
  const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TEmolumentoItem.SetCodigoSelo(
  const Value: string);
begin
  FCodigoSelo := Value;
end;

procedure TEmolumentoItem.SetEmolumento(
  const Value: IEmolumento);
begin
  FEmolumento := Value;
end;

procedure TEmolumentoItem.SetEmolumentoItemID(
  const Value: Integer);
begin
  FEmolumentoItemID := Value;
end;

procedure TEmolumentoItem.SetEmolumentoPeriodo(
  const Value: IEmolumentoPeriodo);
begin
  FEmolumentoPeriodo := Value;
end;

procedure TEmolumentoItem.SetPaginaExtra(
  const Value: Integer);
begin
  FPaginaExtra := Value;
end;

procedure TEmolumentoItem.SetValorEmolumento(
  const Value: Currency);
begin
  FValorEmolumento := Value;
end;

procedure TEmolumentoItem.SetValorFim(
  const Value: Currency);
begin
  FValorFim := Value;
end;

procedure TEmolumentoItem.SetValorInicio(
  const Value: Currency);
begin
  FValorInicio := Value;
end;

procedure TEmolumentoItem.SetValorOutraTaxa1(
  const Value: Currency);
begin
  FValorOutraTaxa1 := Value;
end;

procedure TEmolumentoItem.SetValorPaginaExtra(
  const Value: Currency);
begin
  FValorPaginaExtra := Value;
end;

procedure TEmolumentoItem.SetValorTaxaJudiciaria(
  const Value: Currency);
begin
  FValorTaxaJudiciaria := Value;
end;

end.
