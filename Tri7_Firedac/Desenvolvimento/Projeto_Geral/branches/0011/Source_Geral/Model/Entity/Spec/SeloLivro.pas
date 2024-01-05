unit SeloLivro;

interface

uses
  SeloSituacao,
  SeloLote,
  Usuario;

type
  ISeloLivro = interface
    ['{15F51125-B5CD-4483-9690-DF8BCB7F574B}']

    function GetSeloLivroID: Integer;
    function GetNumero: Integer;
    function GetSeloSituacao: ISeloSituacao;
    function GetData: TDateTime;
    function GetObservacao: string;
    function GetSeloLote: ISeloLote;
    function GetSigla: string;
    function GetDescricao: string;
    function GetTabela: string;
    function GetCampoID: Integer;
    function GetUsuario: IUsuario;
    function GetNumeroAgrupador: string;
    function GetApresentante: string;
    function GetIP_Maquina: string;
    function GetValorEmolumento: Currency;
    function GetValorTaxaJudiciaria: Currency;
    function GetValorFundos: Currency;
    function GetValorISSQN: Currency;
    function GetDataExportacao: TDateTime;
    function GetCodigoExportacao: Integer;
    function GetCodigoGratuito: Integer;
    function GetValidado: Boolean;
    function GetProtocolo: Integer;
    function GetValorTotal: Currency;
    function GetCodigoAto: string;
    function IsInutilizado: Boolean;
    function GetValidador: string;

    function Equals(
      const vpValue: ISeloLivro): Boolean;

    function NotEquals(
      const vpValue: ISeloLivro): Boolean;

    procedure SetSeloLivroID(
      const vpValue: Integer);

    procedure SetNumero(
      const Value: Integer);

    procedure SetSeloSituacao(
      const Value: ISeloSituacao);

    procedure SetData(
      const Value: TDateTime);

    procedure SetObservacao(
      const Value: string);

    procedure SetSeloLote(
      const Value: ISeloLote);

    procedure SetSigla(
      const Value: string);

    procedure SetDescricao(
      const Value: string);

    procedure SetTabela(
      const Value: string);

    procedure SetCampoID(
      const Value: Integer);

    procedure SetUsuario(
      const Value: IUsuario);

    procedure SetNumeroAgrupador(
      const Value: string);

    procedure SetApresentante(
      const Value: string);

    procedure SetIP_Maquina(
      const Value: string);

    procedure SetValorEmolumento(
      const Value: Currency);

    procedure SetValorTaxaJudiciaria(
      const Value: Currency);

    procedure SetValorFundos(
      const Value: Currency);

    procedure SetValorISSQN(
      const Value: Currency);

    procedure SetDataExportacao(
      const Value: TDateTime);

    procedure SetCodigoExportacao(
      const Value: Integer);

    procedure SetCodigoGratuito(
      const Value: Integer);

    procedure SetValidado(
      const Value: Boolean);

    procedure SetProtocolo(
      const Value: Integer);

    procedure SetValidador(
      const Value: string);

    property SeloLivroID: Integer read GetSeloLivroID write SetSeloLivroID;
    property Numero: Integer read GetNumero write SetNumero;

    property SeloSituacao: ISeloSituacao read GetSeloSituacao
      write SetSeloSituacao;

    property Data: TDateTime read GetData write SetData;
    property Observacao: string read GetObservacao write SetObservacao;
    property SeloLote: ISeloLote read GetSeloLote write SetSeloLote;
    property Sigla: string read GetSigla write SetSigla;
    property Descricao: string read GetDescricao write SetDescricao;
    property Tabela: string read GetTabela write SetTabela;
    property CampoID: Integer read GetCampoID write SetCampoID;
    property Usuario: IUsuario read GetUsuario write SetUsuario;

    property NumeroAgrupador: string read GetNumeroAgrupador
      write SetNumeroAgrupador;

    property Apresentante: string read GetApresentante write SetApresentante;
    property IP_Maquina: string read GetIP_Maquina write SetIP_Maquina;

    property ValorEmolumento: Currency read GetValorEmolumento
      write SetValorEmolumento;

    property ValorTaxaJudiciaria: Currency read GetValorTaxaJudiciaria
      write SetValorTaxaJudiciaria;

    property ValorFundos: Currency read GetValorFundos write SetValorFundos;
    property ValorISSQN: Currency read GetValorISSQN write SetValorISSQN;

    property DataExportacao: TDateTime read GetDataExportacao
      write SetDataExportacao;

    property CodigoExportacao: Integer read GetCodigoExportacao
      write SetCodigoExportacao;

    property CodigoGratuito: Integer read GetCodigoGratuito
      write SetCodigoGratuito;

    property Validado: Boolean read GetValidado write SetValidado;
    property Protocolo: Integer read GetProtocolo write SetProtocolo;

    property ValorTotal: Currency read GetValorTotal;
    property CodigoAto: string read GetCodigoAto;
    property Inutilizado: Boolean read IsInutilizado;
    property Validador: string read GetValidador write SetValidador;
  end;

implementation

end.
