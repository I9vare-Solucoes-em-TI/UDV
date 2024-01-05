unit SeloGrupo;

interface

uses
  Sistema;

type
  ISeloGrupo = interface
    ['{B24F4358-CFEC-4620-B38E-69B34A847AA0}']

    function GetSeloGrupoID: Integer;
    function GetDescricao: string;
    function GetNumero: Integer;
    function GetSituacao: Boolean;
    function GetControleAutomatico: Boolean;
    function GetTipoCartorio: string;
    function GetDescricaoCompleta: string;
    function GetEstoqueMinimo: Integer;
    function GetNomeGrupo: string;
    function GetIDGrupoSelo: Integer;
    function GetPaginaAcresce: Boolean;
    function GetSistema: ISistema;
    function GetSeloUsuario: Boolean;

    function Equals(
      const vpValue: ISeloGrupo): Boolean;

    function NotEquals(
      const vpValue: ISeloGrupo): Boolean;

    procedure SetSeloGrupoID(
      const Value: Integer);

    procedure SetDescricao(
      const Value: string);

    procedure SetNumero(
      const Value: Integer);

    procedure SetSituacao(
      const Value: Boolean);

    procedure SetControleAutomatico(
      const Value: Boolean);

    procedure SetTipoCartorio(
      const Value: string);

    procedure SetDescricaoCompleta(
      const Value: string);

    procedure SetEstoqueMinimo(
      const Value: Integer);

    procedure SetNomeGrupo(
      const Value: string);

    procedure SetIDGrupoSelo(
      const Value: Integer);

    procedure SetPaginaAcresce(
      const Value: Boolean);

    procedure SetSistema(
      const Value: ISistema);

    procedure SetSeloUsuario(
      const Value: Boolean);

    property SeloGrupoID: Integer read GetSeloGrupoID write SetSeloGrupoID;
    property Descricao: string read GetDescricao write SetDescricao;
    property Numero: Integer read GetNumero write SetNumero;
    property Situacao: Boolean read GetSituacao write SetSituacao;

    property ControleAutomatico: Boolean read GetControleAutomatico
      write SetControleAutomatico;

    property TipoCartorio: string read GetTipoCartorio write SetTipoCartorio;

    property DescricaoCompleta: string read GetDescricaoCompleta
      write SetDescricaoCompleta;

    property EstoqueMinimo: Integer read GetEstoqueMinimo
      write SetEstoqueMinimo;

    property NomeGrupo: string read GetNomeGrupo write SetNomeGrupo;
    property IDGrupoSelo: Integer read GetIDGrupoSelo write SetIDGrupoSelo;

    property PaginaAcresce: Boolean read GetPaginaAcresce
      write SetPaginaAcresce;

    property Sistema: ISistema read GetSistema write SetSistema;
    property SeloUsuario: Boolean read GetSeloUsuario write SetSeloUsuario;
  end;

implementation

end.
