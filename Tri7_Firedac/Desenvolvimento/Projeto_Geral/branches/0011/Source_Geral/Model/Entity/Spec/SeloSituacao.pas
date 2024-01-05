unit SeloSituacao;

interface

uses
  Sistema;

type
  ISeloSituacao = interface
    ['{AB92CC84-243C-4FD1-826E-2B8707377730}']

    function GetSeloSituacaoID: Integer;
    function GetDescricao: string;
    function GetSituacao: Boolean;
    function GetSistema: ISistema;

    function Equals(
      const vpValue: ISeloSituacao): Boolean;

    function NotEquals(
      const vpValue: ISeloSituacao): Boolean;

    procedure SetSeloSituacaoID(
      const Value: Integer);

    procedure SetDescricao(
      const Value: string);

    procedure SetSituacao(
      const Value: Boolean);

    procedure SetSistema(
      const Value: ISistema);

    property SeloSituacaoID: Integer read GetSeloSituacaoID
      write SetSeloSituacaoID;

    property Descricao: string read GetDescricao write SetDescricao;
    property Situacao: Boolean read GetSituacao write SetSituacao;
    property Sistema: ISistema read GetSistema write SetSistema;
  end;

implementation

end.
