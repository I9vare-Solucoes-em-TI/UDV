unit Geral.View.Selecao.Paginas;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  Vcl.Menus,
  cxControls,
  cxContainer,
  cxEdit,
  cxTextEdit,
  Vcl.StdCtrls,
  cxRadioGroup,
  cxButtons,
  Vcl.ExtCtrls,
  Geral.Model.Entity.Spec.SelecaoPaginas,
  Geral.Model.Entity.Spec.Maybe;

type
  TfrmSelecaoPaginas = class(TForm)
    pnlRodape: TPanel;
    btnConfirmar: TcxButton;
    btnCancelar: TcxButton;
    pnlOpcoes: TPanel;
    rdbTodas: TcxRadioButton;
    rdbPaginas: TcxRadioButton;
    edtPaginas: TcxTextEdit;
    procedure btnConfirmarClick(Sender: TObject);
    procedure edtPaginasKeyPress(Sender: TObject; var Key: Char);
    procedure rdbTodasClick(Sender: TObject);
  private
    { Private declarations }
    FQuantidadeTotalPaginas: Integer;

    constructor Create(
      AOwner: TComponent;
      const vpQuantidadeTotalPaginas: Integer); reintroduce;

    class function New(
      AOwner: TComponent;
      const vpQuantidadeTotalPaginas: Integer): TfrmSelecaoPaginas;

    function OpcaoPaginasMarcada: Boolean;
    function TextoPaginas: string;
    function SelecaoPaginas: ISelecaoPaginas;
  public
    { Public declarations }
    class function Selecionar(
      const vpQuantidadeTotalPaginas: Integer): IMaybe<ISelecaoPaginas>;
  end;

implementation

uses
  Controles,
  Geral.Model.Entity.Impl.Maybe,
  MensagemUtils,
  System.Types,
  Geral.Model.Entity.Impl.SelecaoPaginas;

{$R *.dfm}

{ TfrmSelecaoPaginas }

procedure TfrmSelecaoPaginas.btnConfirmarClick(Sender: TObject);
begin
  if OpcaoPaginasMarcada and
    TextoPaginas.IsEmpty then
  begin
    TMensagemUtils.ExibirMensagemAtencao(
      'Por favor, informe as páginas.');

    ModalResult := mrNone;
    Exit;
  end;
end;

constructor TfrmSelecaoPaginas.Create(
  AOwner: TComponent;
  const vpQuantidadeTotalPaginas: Integer);
begin
  inherited Create(
    AOwner);

  FQuantidadeTotalPaginas := vpQuantidadeTotalPaginas;
end;

procedure TfrmSelecaoPaginas.edtPaginasKeyPress(Sender: TObject; var Key: Char);
{$REGION 'Constantes'}
const
  CI_CTRL_C: Char = Char(3);
  CI_BACKSPACE: Char = Char(8);
  CI_CTRL_V: Char = Char(22);
  CI_CTRL_X: Char = Char(24);
{$ENDREGION}
begin
  if not CharInSet(
    Key,
    [CI_CTRL_C,
    CI_BACKSPACE,
    CI_CTRL_V,
    CI_CTRL_X,
    '0'..'9',
    Space,
    '-',
    ',']) then
    Key := NullChar;
end;

class function TfrmSelecaoPaginas.New(
  AOwner: TComponent;
  const vpQuantidadeTotalPaginas: Integer): TfrmSelecaoPaginas;
begin
  Result := Self.Create(
    AOwner,
    vpQuantidadeTotalPaginas);
end;

function TfrmSelecaoPaginas.OpcaoPaginasMarcada: Boolean;
begin
  Result := rdbPaginas.Checked;
end;

procedure TfrmSelecaoPaginas.rdbTodasClick(Sender: TObject);
begin
  edtPaginas.Enabled := rdbPaginas.Checked;
end;

function TfrmSelecaoPaginas.SelecaoPaginas: ISelecaoPaginas;
begin
  if OpcaoPaginasMarcada then
    Exit(
      TPaginas.New(
        TextoPaginas));

  Result := TTodas.New(
    FQuantidadeTotalPaginas);
end;

class function TfrmSelecaoPaginas.Selecionar(
  const vpQuantidadeTotalPaginas: Integer): IMaybe<ISelecaoPaginas>;
{$REGION 'Variáveis'}
var
  viFrmSelecaoPaginas: TfrmSelecaoPaginas;
{$ENDREGION}
begin
  viFrmSelecaoPaginas := New(
    Application,
    vpQuantidadeTotalPaginas);

  try
    if viFrmSelecaoPaginas.ShowModal = mrCancel then
      Exit(
        TNone<ISelecaoPaginas>.New);

    Result := TSome<ISelecaoPaginas>.New(
      viFrmSelecaoPaginas.SelecaoPaginas);
  finally
    viFrmSelecaoPaginas.Free;
  end;
end;

function TfrmSelecaoPaginas.TextoPaginas: string;
begin
  Result := VarToStr(
    edtPaginas.EditValue)
  .Trim;
end;

end.
