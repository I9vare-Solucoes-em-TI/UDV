unit RetornoConsultaCNPJ;

interface

type
  IRetornoConsultaCNPJ = interface
    ['{36A3F2C2-051D-49F9-861E-90CE613F45D5}']

    function GetDataSituacao: TDateTime;
    function GetNome: string;
    function GetUF: string;
    function GetTelefone: string;
    function GetSituacao: string;
    function GetBairro: string;
    function GetLogradouro: string;
    function GetNumero: string;
    function GetCEP: string;
    function GetMunicipio: string;
    function GetDataAbertura: TDateTime;
    function GetNomeFantasia: string;
    function GetCNPJ: string;
    function GetTipo: string;
    function GetComplemento: string;
    function GetEmail: string;
    function GetMotivoSituacao: string;

    procedure SetDataSituacao(
      const Value: TDateTime);

    procedure SetNome(
      const Value: string);

    procedure SetUF(
      const Value: string);

    procedure SetTelefone(
      const Value: string);

    procedure SetSituacao(
      const Value: string);

    procedure SetBairro(
      const Value: string);

    procedure SetLogradouro(
      const Value: string);

    procedure SetNumero(
      const Value: string);

    procedure SetCEP(
      const Value: string);

    procedure SetMunicipio(
      const Value: string);

    procedure SetDataAbertura(
      const Value: TDateTime);

    procedure SetNomeFantasia(
      const Value: string);

    procedure SetCNPJ(
      const Value: string);

    procedure SetTipo(
      const Value: string);

    procedure SetComplemento(
      const Value: string);

    procedure SetEmail(
      const Value: string);

    procedure SetMotivoSituacao(
      const Value: string);

    property DataSituacao: TDateTime read GetDataSituacao write SetDataSituacao;
    property Nome: string read GetNome write SetNome;
    property UF: string read GetUF write SetUF;
    property Telefone: string read GetTelefone write SetTelefone;
    property Situacao: string read GetSituacao write SetSituacao;
    property Bairro: string read GetBairro write SetBairro;
    property Logradouro: string read GetLogradouro write SetLogradouro;
    property Numero: string read GetNumero write SetNumero;
    property CEP: string read GetCEP write SetCEP;
    property Municipio: string read GetMunicipio write SetMunicipio;
    property DataAbertura: TDateTime read GetDataAbertura write SetDataAbertura;
    property NomeFantasia: string read GetNomeFantasia write SetNomeFantasia;
    property CNPJ: string read GetCNPJ write SetCNPJ;
    property Tipo: string read GetTipo write SetTipo;
    property Complemento: string read GetComplemento write SetComplemento;
    property Email: string read GetEmail write SetEmail;

    property MotivoSituacao: string read GetMotivoSituacao
      write SetMotivoSituacao;
  end;

implementation

end.
