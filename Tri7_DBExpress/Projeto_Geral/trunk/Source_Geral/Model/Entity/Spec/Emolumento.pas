unit Emolumento;

interface

uses
  Sistema;

type
  IEmolumento = interface
    ['{95EF94CF-5BCD-4FD1-88F7-8F29E2D786BD}']

    function GetEmolumentoID: Integer;
    function GetDescricao: string;
    function GetSistema: ISistema;
    function GetSituacao: Boolean;

    function Equals(
      const vpValue: IEmolumento): Boolean;

    function NotEquals(
      const vpValue: IEmolumento): Boolean;

    procedure SetEmolumentoID(
      const Value: Integer);

    procedure SetDescricao(
      const Value: string);

    procedure SetSistema(
      const Value: ISistema);

    procedure SetSituacao(
      const Value: Boolean);

    property EmolumentoID: Integer read GetEmolumentoID write SetEmolumentoID;
    property Descricao: string read GetDescricao write SetDescricao;
    property Sistema: ISistema read GetSistema write SetSistema;
    property Situacao: Boolean read GetSituacao write SetSituacao;
  end;

implementation

end.
