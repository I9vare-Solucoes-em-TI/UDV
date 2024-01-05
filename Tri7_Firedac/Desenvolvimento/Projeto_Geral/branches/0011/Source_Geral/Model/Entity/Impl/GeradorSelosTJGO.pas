unit GeradorSelosTJGO;

interface

uses
  GeradorSelosTJ,
  SeloLivroList,
  Xml.XMLIntf,
  FormatadorMascaraSelo;

type
  TGeradorSelosTJGO = class(TInterfacedObject, IGeradorSelosTJ)
  private
    FSeloLivroList: TSeloLivroList;
    FXMLDocument: IXMLDocument;
    FCodigoCartorio: string;
    FChaveSegurancaCartorio: string;
    FFormatadorMascaraSelo: IFormatadorMascaraSelo;

    function GetSeloLivroList: TSeloLivroList;
    function GetCodigoCartorio: string;
    function GetChaveSegurancaCartorio: string;

    procedure SetSeloLivroList(
      const Value: TSeloLivroList);

    procedure SetCodigoCartorio(
      const Value: string);

    procedure SetChaveSegurancaCartorio(
      const Value: string);

    procedure CarregarXMLDocument;
  public
    constructor Create(
      const vpCodigoCartorio: string;
      const vpChaveSegurancaCartorio: string;
      const vpFormatadorMascaraSelo: IFormatadorMascaraSelo); reintroduce;

    property SeloLivroList: TSeloLivroList read GetSeloLivroList
      write SetSeloLivroList;

    property CodigoCartorio: string read GetCodigoCartorio
      write SetCodigoCartorio;

    property ChaveSegurancaCartorio: string read GetChaveSegurancaCartorio
      write SetChaveSegurancaCartorio;

    function Gerar: string;

    class function New(
      const vpCodigoCartorio: string;
      const vpChaveSegurancaCartorio: string;
      const vpFormatadorMascaraSelo: IFormatadorMascaraSelo):
        IGeradorSelosTJ; static;

    procedure Salvar(
      const vpCaminhoArquivo: string);
  end;

implementation

uses
  SeloLivro,
  System.SysUtils,
  System.DateUtils,
  System.Types,
  System.Math,
  GeradorHash,
  Xml.XMLDoc,
  GeradorHashSimpleFactory,
  TipoHash,
  System.StrUtils;

{ TGeradorSelosTJGO }

procedure TGeradorSelosTJGO.CarregarXMLDocument;
{$REGION 'Constantes'}
const
  CI_VERSION: string = '1.0';
  CI_ENCODING: string = 'UTF-8';
  CI_DATE_TIME_FORMAT: string = 'yyyy-mm-dd hh:nn:ss';
  CI_CURRENCY_FORMAT: string = '#0.00';
  CI_SISTEMA_RI: Integer = 1;
  CI_SISTEMA_PROTESTO: Integer = 13;
  CI_ASSINATURA_DIGITAL: string = 'false';
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viNodeSeloEletronico: IXMLNode;
  viNodeLoteAtos: IXMLNode;
  viSeloLivro: ISeloLivro;
  viNodeAtoUtilizado: IXMLNode;
  viGeradorHash: IGeradorHash;
  viHash: string;
{$ENDREGION}
begin
  with FXMLDocument do
  begin
    Active := True;
    Version := CI_VERSION;
    Encoding := CI_ENCODING;
    Options := Options + [doNodeAutoIndent];

    // Nó Raiz
    viNodeSeloEletronico := AddChild('selo_eletronico');

    viNodeLoteAtos := viNodeSeloEletronico.AddChild('lote_dos_atos');
    viHash := string.Empty;

    for viSeloLivro in SeloLivroList do
    begin
      viNodeAtoUtilizado := viNodeLoteAtos.AddChild('ato_utilizado');
      with viNodeAtoUtilizado, viSeloLivro do
      begin
        ChildValues['identificacao_pedido_na_cgj'] := SeloLote.NotaFiscal;
        ChildValues['codigo_do_selo'] := NumeroAgrupador;

        ChildValues['codigo_do_ato'] := FFormatadorMascaraSelo.
          FormatarMascaraSelo(viSeloLivro);

        ChildValues['tipo_de_ato'] := SeloLote.SeloGrupo.Numero.ToString;
        ChildValues['nome_do_civil_do_ato'] := Apresentante;

        ChildValues['nome_do_serventuario_que_praticou_ato'] :=
          Usuario.NomeCompleto;

        ChildValues['data_hora_da_solicitacao'] := FormatDateTime(
          CI_DATE_TIME_FORMAT, Data) + ' UTC';

        ChildValues['ip_da_maquina_que_praticou_ato'] := IP_Maquina;

        ChildValues['valor_de_entrada_do_ato'] := FormatCurr(
          CI_CURRENCY_FORMAT, ValorTotal);

        ChildValues['emolumento_do_ato'] := FormatCurr(
          CI_CURRENCY_FORMAT, ValorEmolumento);

        ChildValues['taxa_judiciaria_do_ato'] := FormatCurr(
          CI_CURRENCY_FORMAT, ValorTaxaJudiciaria);

        if CompareDate(Date,
          EncodeDateTime(2016, 3, 26,
            ZeroValue, ZeroValue, ZeroValue, ZeroValue)) = LessThanValue then
          ChildValues['fundesp_do_ato'] := FormatCurr(
            CI_CURRENCY_FORMAT, ValorFundos)
        else
        begin
          ChildValues['fundos_estaduais_do_ato'] := FormatCurr(
            CI_CURRENCY_FORMAT, ValorFundos);

          ChildValues['id_do_ato_isentado'] := IfThen(
            CompareValue(CodigoGratuito, ZeroValue) = GreaterThanValue,
            CodigoGratuito.ToString, string.Empty);

          if CompareValue(SeloLote.SeloGrupo.Sistema.SistemaID,
            CI_SISTEMA_RI) = EqualsValue then
            ChildValues['protocolo_do_imovel'] := IfThen(
              CompareValue(Protocolo, ZeroValue) = GreaterThanValue,
              Protocolo.ToString, string.Empty)
          else
            if CompareValue(SeloLote.SeloGrupo.Sistema.SistemaID,
              CI_SISTEMA_PROTESTO) = EqualsValue then
              ChildValues['protocolo_do_protesto'] := IfThen(
                CompareValue(Protocolo, ZeroValue) = GreaterThanValue,
                Protocolo.ToString, string.Empty);
        end;

        ChildValues['assinatura_digital'] := CI_ASSINATURA_DIGITAL;
      end;

      viHash := viHash + viNodeAtoUtilizado.XML;
    end;

    viGeradorHash := TGeradorHashSimpleFactory.Get(TTipoHash.thSHA1);

    viNodeSeloEletronico.ChildValues['hash_conferencia_do_arquivo_xml'] :=
      viGeradorHash.GerarHash(viHash + CodigoCartorio + ChaveSegurancaCartorio);
  end;
end;

constructor TGeradorSelosTJGO.Create(
  const vpCodigoCartorio: string;
  const vpChaveSegurancaCartorio: string;
  const vpFormatadorMascaraSelo: IFormatadorMascaraSelo);
begin
  inherited Create;
  FXMLDocument := TXMLDocument.Create(nil);
  CodigoCartorio := vpCodigoCartorio;
  ChaveSegurancaCartorio := vpChaveSegurancaCartorio;
  FFormatadorMascaraSelo := vpFormatadorMascaraSelo;
end;

function TGeradorSelosTJGO.Gerar: string;
begin
  CarregarXMLDocument;
  try
    FXMLDocument.SaveToXML(Result);
  finally
    FXMLDocument.Active := False;
  end;
end;

function TGeradorSelosTJGO.GetChaveSegurancaCartorio: string;
begin
  Result := FChaveSegurancaCartorio;
end;

function TGeradorSelosTJGO.GetCodigoCartorio: string;
begin
  Result := FCodigoCartorio;
end;

function TGeradorSelosTJGO.GetSeloLivroList: TSeloLivroList;
begin
  Result := FSeloLivroList;
end;

class function TGeradorSelosTJGO.New(
  const vpCodigoCartorio: string;
  const vpChaveSegurancaCartorio: string;
  const vpFormatadorMascaraSelo: IFormatadorMascaraSelo): IGeradorSelosTJ;
begin
  Result := TGeradorSelosTJGO.Create(
    vpCodigoCartorio,
    vpChaveSegurancaCartorio,
    vpFormatadorMascaraSelo);
end;

procedure TGeradorSelosTJGO.Salvar(
  const vpCaminhoArquivo: string);
begin
  CarregarXMLDocument;
  try
    FXMLDocument.SaveToFile(vpCaminhoArquivo);
  finally
    FXMLDocument.Active := False;
  end;
end;

procedure TGeradorSelosTJGO.SetChaveSegurancaCartorio(
  const Value: string);
begin
  FChaveSegurancaCartorio := Value;
end;

procedure TGeradorSelosTJGO.SetCodigoCartorio(
  const Value: string);
begin
  FCodigoCartorio := Value;
end;

procedure TGeradorSelosTJGO.SetSeloLivroList(
  const Value: TSeloLivroList);
begin
  FSeloLivroList := Value;
end;

end.
