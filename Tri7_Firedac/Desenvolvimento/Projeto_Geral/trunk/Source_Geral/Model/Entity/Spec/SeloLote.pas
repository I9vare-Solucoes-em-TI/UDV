unit SeloLote;

interface

uses
  SituacaoSeloLote,
  SeloGrupo;

type
  ISeloLote = interface
    ['{133D1C62-F7F7-4A04-ADD5-B0A016246664}']

    function GetSeloLoteID: Integer;
    function GetNumeroAtual: Integer;
    function GetSituacao: TSituacaoSeloLote;
    function GetDataLote: TDateTime;
    function GetNumeroInicial: Integer;
    function GetNumeroFinal: Integer;
    function GetObservacao: string;
    function GetSeloGrupo: ISeloGrupo;
    function GetSigla: string;
    function GetNotaFiscal: string;
    function GetQuantidade: Integer;

    function Equals(
      const vpValue: ISeloLote): Boolean;

    function NotEquals(
      const vpValue: ISeloLote): Boolean;

    procedure SetSeloLoteID(
      const Value: Integer);

    procedure SetNumeroAtual(
      const Value: Integer);

    procedure SetSituacao(
      const Value: TSituacaoSeloLote);

    procedure SetDataLote(
      const Value: TDateTime);

    procedure SetNumeroInicial(
      const Value: Integer);

    procedure SetNumeroFinal(
      const Value: Integer);

    procedure SetObservacao(
      const Value: string);

    procedure SetSeloGrupo(
      const Value: ISeloGrupo);

    procedure SetSigla(
      const Value: string);

    procedure SetNotaFiscal(
      const Value: string);

    procedure SetQuantidade(
      const Value: Integer);

    property SeloLoteID: Integer read GetSeloLoteID write SetSeloLoteID;
    property NumeroAtual: Integer read GetNumeroAtual write SetNumeroAtual;
    property Situacao: TSituacaoSeloLote read GetSituacao write SetSituacao;
    property DataLote: TDateTime read GetDataLote write SetDataLote;

    property NumeroInicial: Integer read GetNumeroInicial
      write SetNumeroInicial;

    property NumeroFinal: Integer read GetNumeroFinal write SetNumeroFinal;
    property Observacao: string read GetObservacao write SetObservacao;
    property SeloGrupo: ISeloGrupo read GetSeloGrupo write SetSeloGrupo;
    property Sigla: string read GetSigla write SetSigla;
    property NotaFiscal: string read GetNotaFiscal write SetNotaFiscal;
    property Quantidade: Integer read GetQuantidade write SetQuantidade;
  end;

implementation

end.
