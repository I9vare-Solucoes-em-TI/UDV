unit CampoOrdenacao;

interface

uses
  TipoOrdenacao;

type
  ICampoOrdenacao = interface
    ['{216E8A72-94D0-4B2E-B918-83551777926E}']

    function GetNome: string;
    function GetTipo: TTipoOrdenacao;

    function Equals(
      const vpValue: ICampoOrdenacao): Boolean;

    procedure SetNome(
      const Value: string);

    procedure SetTipo(
      const Value: TTipoOrdenacao);

    property Nome: string read GetNome write SetNome;
    property Tipo: TTipoOrdenacao read GetTipo write SetTipo;
  end;

implementation

end.
