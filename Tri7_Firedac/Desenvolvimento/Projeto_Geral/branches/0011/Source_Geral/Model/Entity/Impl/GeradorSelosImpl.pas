unit GeradorSelosImpl;

interface

uses
  GeradorSelos,
  Usuario;

type
  TGeradorSelos = class abstract(TInterfacedObject, IGeradorSelos)
  private
    FUsuario: IUsuario;
    FAtosGratuitos: Boolean;

    function GetUsuario: IUsuario; virtual; final;
    function GetAtoGratuitos: Boolean; virtual; final;

    procedure SetUsuario(
      const Value: IUsuario); virtual; final;

    procedure SetAtosGratuitos(
      const Value: Boolean); virtual; final;
  protected
    function GetTabela: string; virtual; abstract;
    function GetCampoID: Integer; virtual; abstract;
    function GetDescricao: string; virtual; abstract;
  public
    property Usuario: IUsuario read GetUsuario write SetUsuario;
    property Tabela: string read GetTabela;
    property CampoID: Integer read GetCampoID;
    property Descricao: string read GetDescricao;
    property AtosGratuitos: Boolean read GetAtoGratuitos write SetAtosGratuitos;

    procedure GerarSelos; virtual; abstract;
  end;

implementation

{ TGeradorSelos }

function TGeradorSelos.GetAtoGratuitos: Boolean;
begin
  Result := FAtosGratuitos;
end;

function TGeradorSelos.GetUsuario: IUsuario;
begin
  Result := FUsuario;
end;

procedure TGeradorSelos.SetAtosGratuitos(
  const Value: Boolean);
begin
  FAtosGratuitos := Value;
end;

procedure TGeradorSelos.SetUsuario(
  const Value: IUsuario);
begin
  FUsuario := Value;
end;

end.
