unit SeloLivroImpl;

interface

uses
  SeloLivro,
  SeloSituacao,
  SeloLote,
  Usuario;

type
  TSeloLivro = class(TInterfacedObject, ISeloLivro)
  private
    FSeloLivroID: Integer;
    FNumero: Integer;
    FSeloSituacao: ISeloSituacao;
    FData: TDateTime;
    FObservacao: string;
    FSeloLote: ISeloLote;
    FSigla: string;
    FDescricao: string;
    FTabela: string;
    FCampoID: Integer;
    FUsuario: IUsuario;
    FNumeroAgrupador: string;
    FApresentante: string;
    FIP_Maquina: string;
    FValorEmolumento: Currency;
    FValorTaxaJudiciaria: Currency;
    FValorFundos: Currency;
    FValorISSQN: Currency;
    FDataExportacao: TDateTime;
    FCodigoExportacao: Integer;
    FCodigoGratuito: Integer;
    FValidado: Boolean;
    FProtocolo: Integer;
    FValidador: string;

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

    procedure SetSeloLivroID(
      const Value: Integer);

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
  public
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

    function Equals(
      const vpValue: ISeloLivro): Boolean; reintroduce;

    function NotEquals(
      const vpValue: ISeloLivro): Boolean;

    class function New: ISeloLivro; static;
  end;

implementation

uses
  CurrencyList,
  System.Math,
  System.Types,
  System.SysUtils,
  BooleanHelper;

{ TSeloLivro }

function TSeloLivro.Equals(
  const vpValue: ISeloLivro): Boolean;
begin
  Result := CompareValue(SeloLivroID, vpValue.SeloLivroID) = EqualsValue;
end;

function TSeloLivro.GetApresentante: string;
begin
  Result := FApresentante;
end;

function TSeloLivro.GetCampoID: Integer;
begin
  Result := FCampoID;
end;

function TSeloLivro.GetCodigoAto: string;
begin
  Result := Sigla + string.Format('%.*d', [6, Numero]);
end;

function TSeloLivro.GetCodigoExportacao: Integer;
begin
  Result := FCodigoExportacao;
end;

function TSeloLivro.GetCodigoGratuito: Integer;
begin
  Result := FCodigoGratuito;
end;

function TSeloLivro.GetData: TDateTime;
begin
  Result := FData;
end;

function TSeloLivro.GetDataExportacao: TDateTime;
begin
  Result := FDataExportacao;
end;

function TSeloLivro.GetDescricao: string;
begin
  Result := FDescricao;
end;

function TSeloLivro.GetIP_Maquina: string;
begin
  Result := FIP_Maquina;
end;

function TSeloLivro.GetNumero: Integer;
begin
  Result := FNumero;
end;

function TSeloLivro.GetNumeroAgrupador: string;
begin
  Result := FNumeroAgrupador;
end;

function TSeloLivro.GetObservacao: string;
begin
  Result := FObservacao;
end;

function TSeloLivro.GetProtocolo: Integer;
begin
  Result := FProtocolo;
end;

function TSeloLivro.GetSeloLivroID: Integer;
begin
  Result := FSeloLivroID;
end;

function TSeloLivro.GetSeloLote: ISeloLote;
begin
  Result := FSeloLote;
end;

function TSeloLivro.GetSeloSituacao: ISeloSituacao;
begin
  Result := FSeloSituacao;
end;

function TSeloLivro.GetSigla: string;
begin
  Result := FSigla;
end;

function TSeloLivro.GetTabela: string;
begin
  Result := FTabela;
end;

function TSeloLivro.GetUsuario: IUsuario;
begin
  Result := FUsuario;
end;

function TSeloLivro.GetValidado: Boolean;
begin
  Result := FValidado;
end;

function TSeloLivro.GetValidador: string;
begin
  Result := FValidador;
end;

function TSeloLivro.GetValorEmolumento: Currency;
begin
  Result := FValorEmolumento;
end;

function TSeloLivro.GetValorFundos: Currency;
begin
  Result := FValorFundos;
end;

function TSeloLivro.GetValorISSQN: Currency;
begin
  Result := FValorISSQN;
end;

function TSeloLivro.GetValorTaxaJudiciaria: Currency;
begin
  Result := FValorTaxaJudiciaria;
end;

function TSeloLivro.GetValorTotal: Currency;
begin
  with TCurrencyList.Create do
    try
      AddRange([ValorEmolumento, ValorTaxaJudiciaria, ValorFundos, ValorISSQN]);
      Result := Sum;
    finally
      Free;
    end;
end;

function TSeloLivro.IsInutilizado: Boolean;
begin
  // 4 = Selo Inutilizado
  Result := CompareValue(SeloSituacao.SeloSituacaoID, 4) = EqualsValue;
end;

class function TSeloLivro.New: ISeloLivro;
begin
  Result := TSeloLivro.Create;
end;

function TSeloLivro.NotEquals(
  const vpValue: ISeloLivro): Boolean;
begin
  Result := Equals(vpValue);
  Result.Negate;
end;

procedure TSeloLivro.SetApresentante(
  const Value: string);
begin
  FApresentante := Value;
end;

procedure TSeloLivro.SetCampoID(
  const Value: Integer);
begin
  FCampoID := Value;
end;

procedure TSeloLivro.SetCodigoExportacao(
  const Value: Integer);
begin
  FCodigoExportacao := Value;
end;

procedure TSeloLivro.SetCodigoGratuito(
  const Value: Integer);
begin
  FCodigoGratuito := Value;
end;

procedure TSeloLivro.SetData(
  const Value: TDateTime);
begin
  FData := Value;
end;

procedure TSeloLivro.SetDataExportacao(
  const Value: TDateTime);
begin
  FDataExportacao := Value;
end;

procedure TSeloLivro.SetDescricao(
  const Value: string);
begin
  FDescricao := Value;
end;

procedure TSeloLivro.SetIP_Maquina(
  const Value: string);
begin
  FIP_Maquina := Value;
end;

procedure TSeloLivro.SetNumero(
  const Value: Integer);
begin
  FNumero := Value;
end;

procedure TSeloLivro.SetNumeroAgrupador(
  const Value: string);
begin
  FNumeroAgrupador := Value;
end;

procedure TSeloLivro.SetObservacao(
  const Value: string);
begin
  FObservacao := Value;
end;

procedure TSeloLivro.SetProtocolo(
  const Value: Integer);
begin
  FProtocolo := Value;
end;

procedure TSeloLivro.SetSeloLivroID(
  const Value: Integer);
begin
  FSeloLivroID := Value;
end;

procedure TSeloLivro.SetSeloLote(
  const Value: ISeloLote);
begin
  FSeloLote := Value;
end;

procedure TSeloLivro.SetSeloSituacao(
  const Value: ISeloSituacao);
begin
  FSeloSituacao := Value;
end;

procedure TSeloLivro.SetSigla(
  const Value: string);
begin
  FSigla := Value;
end;

procedure TSeloLivro.SetTabela(
  const Value: string);
begin
  FTabela := Value;
end;

procedure TSeloLivro.SetUsuario(
  const Value: IUsuario);
begin
  FUsuario := Value;
end;

procedure TSeloLivro.SetValidado(
  const Value: Boolean);
begin
  FValidado := Value;
end;

procedure TSeloLivro.SetValidador(const Value: string);
begin
  FValidador := Value;
end;

procedure TSeloLivro.SetValorEmolumento(
  const Value: Currency);
begin
  FValorEmolumento := Value;
end;

procedure TSeloLivro.SetValorFundos(
  const Value: Currency);
begin
  FValorFundos := Value;
end;

procedure TSeloLivro.SetValorISSQN(
  const Value: Currency);
begin
  FValorISSQN := Value;
end;

procedure TSeloLivro.SetValorTaxaJudiciaria(
  const Value: Currency);
begin
  FValorTaxaJudiciaria := Value;
end;

end.
