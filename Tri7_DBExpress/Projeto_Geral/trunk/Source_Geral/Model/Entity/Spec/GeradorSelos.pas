unit GeradorSelos;

interface

uses
  Usuario;

type
  IGeradorSelos = interface
    ['{082BCC44-660E-4D3D-9F6C-85F14D8BCB1D}']

    function GetUsuario: IUsuario;
    function GetTabela: string;
    function GetCampoID: Integer;
    function GetDescricao: string;
    function GetAtoGratuitos: Boolean;

    procedure SetUsuario(
      const Value: IUsuario);

    procedure SetAtosGratuitos(
      const Value: Boolean);

    property Usuario: IUsuario read GetUsuario write SetUsuario;
    property Tabela: string read GetTabela;
    property CampoID: Integer read GetCampoID;
    property Descricao: string read GetDescricao;
    property AtosGratuitos: Boolean read GetAtoGratuitos write SetAtosGratuitos;

    procedure GerarSelos;
  end;

implementation

end.
