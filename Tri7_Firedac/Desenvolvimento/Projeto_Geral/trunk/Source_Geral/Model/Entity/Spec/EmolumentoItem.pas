unit EmolumentoItem;

interface

uses
  Emolumento,
  EmolumentoPeriodo;

type
  IEmolumentoItem = interface
    ['{C5070D5D-9178-43ED-B523-7CCCDA39A73C}']

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

    function Equals(
      const vpValue: IEmolumentoItem): Boolean;

    function NotEquals(
      const vpValue: IEmolumentoItem): Boolean;

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
  end;

implementation

end.
