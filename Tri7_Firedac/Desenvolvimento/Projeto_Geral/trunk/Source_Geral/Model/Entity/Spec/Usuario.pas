unit Usuario;

interface

type
  IUsuario = interface
    ['{7CA95906-CE61-4C77-8242-561C4E6BDEDC}']

    function GetUsuarioID: Integer;
    function GetNomeCompleto: string;

    function Equals(
      const vpValue: IUsuario): Boolean;

    function NotEquals(
      const vpValue: IUsuario): Boolean;

    procedure SetUsuarioID(
      const Value: Integer);

    procedure SetNomeCompleto(
      const Value: string);

    property UsuarioID: Integer read GetUsuarioID write SetUsuarioID;
    property NomeCompleto: string read GetNomeCompleto write SetNomeCompleto;
  end;

implementation

end.
