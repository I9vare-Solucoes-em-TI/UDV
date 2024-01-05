unit Configuracao;

interface

uses
  ConfiguracaoGrupo;

type
  IConfiguracao = interface
    ['{897F8DA4-FD84-47DB-A733-0CE6EEE4D31B}']

    function GetConfiguracaoID: Integer;
    function GetConfiguracaoGrupo: IConfiguracaoGrupo;
    function GetSecao: string;
    function GetNome: string;
    function GetValor: string;
    function GetDescricao: string;
    function GetTexto: string;

    function Equals(
      const vpValue: IConfiguracao): Boolean;

    function NotEquals(
      const vpValue: IConfiguracao): Boolean;

    procedure SetConfiguracaoID(
      const Value: Integer);

    procedure SetConfiguracaoGrupo(
      const Value: IConfiguracaoGrupo);

    procedure SetSecao(
      const Value: string);

    procedure SetNome(
      const Value: string);

    procedure SetValor(
      const Value: string);

    procedure SetDescricao(
      const Value: string);

    procedure SetTexto(
      const Value: string);

    property ConfiguracaoID: Integer read GetConfiguracaoID
      write SetConfiguracaoID;

    property ConfiguracaoGrupo: IConfiguracaoGrupo read GetConfiguracaoGrupo
      write SetConfiguracaoGrupo;

    property Secao: string read GetSecao write SetSecao;
    property Nome: string read GetNome write SetNome;
    property Valor: string read GetValor write SetValor;
    property Descricao: string read GetDescricao write SetDescricao;
    property Texto: string read GetTexto write SetTexto;
  end;

implementation

end.
