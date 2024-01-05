unit Principal;

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
  cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxContainer,
  cxEdit,
  cxLabel,
  cxTextEdit,
  cxMaskEdit,
  Vcl.Menus,
  Vcl.StdCtrls,
  cxButtons;

type
  TfrmPrincipal = class(TForm)
    edtCNPJ: TcxMaskEdit;
    lblCNPJ: TcxLabel;
    btnConsultar: TcxButton;
    procedure btnConsultarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Consultar;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  ConsultorCNPJ,
  ConsultorCNPJSimpleFactory,
  RetornoConsultaCNPJ,
  ConsultaCNPJException,
  MensagemUtils,
  BooleanHelper;

{$R *.dfm}

{ TfrmPrincipal }

procedure TfrmPrincipal.btnConsultarClick(Sender: TObject);
begin
  Consultar;
end;

procedure TfrmPrincipal.Consultar;
{$REGION 'Variáveis'}
var
  viConsultorCNPJ: IConsultorCNPJ;
  viRetornoConsultaCNPJ: IRetornoConsultaCNPJ;
{$ENDREGION}
begin
  viConsultorCNPJ := TConsultorCNPJSimpleFactory.Get;
  try
    viRetornoConsultaCNPJ := viConsultorCNPJ.ConsultarCNPJ(edtCNPJ.Text);

    if Assigned(viRetornoConsultaCNPJ).&Not then
      Exit;

    TMensagemUtils.ExibirMensagemInformacao(
      string.Format(
        'Nome: %s.%sNome Fantasia: %s.%sLogradouro: %s.',
        [
        viRetornoConsultaCNPJ.Nome,
        sLineBreak,
        viRetornoConsultaCNPJ.NomeFantasia,
        sLineBreak,
        viRetornoConsultaCNPJ.Logradouro
        ]));
  except
    on E: EConsultaCNPJException do
      TMensagemUtils.ExibirMensagemErro(E.Message);
  end;
end;

end.
