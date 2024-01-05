unit CadastroInicial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxGraphics, Menus, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxDropDownEdit, cxCheckComboBox, cxMaskEdit, cxTextEdit, ExtCtrls,
  cxControls, cxContainer, cxEdit, cxLabel, dxGDIPlusClasses;

type
  TfrmCadastroInicial = class(TForm)
    pnlInformacao: TPanel;
    imgPagar: TImage;
    lblInformacaoCertidao: TcxLabel;
    Shape1: TShape;
    cxLabel3: TcxLabel;
    pnlCadastro: TPanel;
    cxLabel1: TcxLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    edtNomeCartorio: TcxTextEdit;
    edtNomeOficial: TcxTextEdit;
    edtCNPJ: TcxMaskEdit;
    edtServentias: TcxCheckComboBox;
    btnConfirmarItem: TcxButton;
    btnCancelar: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure btnConfirmarItemClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroInicial: TfrmCadastroInicial;

implementation

uses
  Controles, Lookup;

{$R *.dfm}

procedure TfrmCadastroInicial.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadastroInicial.btnConfirmarItemClick(Sender: TObject);
var
  viServentiaNova : String;

  procedure VerificarServentias;
  begin
    viServentiaNova := '';
    if pos('0', edtServentias.EditValue) > 0 then
      viServentiaNova := '1,';
    if pos('1', edtServentias.EditValue) > 0 then
      viServentiaNova := viServentiaNova + '2,';
    if pos('2', edtServentias.EditValue) > 0 then
      viServentiaNova := viServentiaNova + '3,';
    if pos('3', edtServentias.EditValue) > 0 then
      viServentiaNova := viServentiaNova + '4,';
    if pos('4', edtServentias.EditValue) > 0 then
      viServentiaNova := viServentiaNova + '5,';

    viServentiaNova := copy(viServentiaNova,1, length(viServentiaNova)-1);
  end;

begin
  VerificarPreenchimentoEDT_TX(edtNomeCartorio.Text, 'Nome do Cartório',edtNomeCartorio);
  VerificarPreenchimentoEDT_TX(edtNomeOficial.Text, 'Oficial/Escrevente Padrão',edtNomeOficial);

  if edtServentias.EditValue = '' then
  begin
    Application.MessageBox('Nenhuma Serventia Selecionada!!!', 'Atenção', MB_Ok + MB_ICONWARNING);
    edtServentias.SetFocus;
    exit;
  end;

  if Application.MessageBox(PCHAR('Confirmando dados preenchidos?'),'Confirmar', MB_ICONQUESTION + MB_YESNO) = IDNO then
    exit;

  VerificarServentias;
  dtmLookup.AtualizarParametro('OFICIAL_ESCREVENTE_ASSINA', 'RELATORIO', 'REGISTRO_DIARIO', '17', edtNomeOficial.Text);
  dtmLookup.AtualizarParametro('NOME', 'CARTORIO', 'PRINCIPAL', '17', edtNomeCartorio.Text);
  dtmLookup.AtualizarParametro('CPFCNPJ', 'CARTORIO', 'PRINCIPAL', '17', edtCNPJ.EditValue);
  dtmLookup.AtualizarParametro('TIPO_CARTORIO', 'CARTORIO', 'PRINCIPAL', '17', viServentiaNova);
  close;
end;

procedure TfrmCadastroInicial.FormActivate(Sender: TObject);
var
  viRegistroNovo : Boolean;

  procedure CarregarServentias;
  var
    viServentiaAtual, viServentiaCombo : String;
  begin
    viServentiaAtual := dtmControles.BuscarConfig('PRINCIPAL', 'CARTORIO', 'TIPO_CARTORIO', 'S');
    if viServentiaAtual = '' then
      exit;

    if pos('1', viServentiaAtual) > 0 then
      viServentiaCombo := ',0';
    if pos('2', viServentiaAtual) > 0 then
      viServentiaCombo := viServentiaCombo + ',1';
    if pos('3', viServentiaAtual) > 0 then
      viServentiaCombo := viServentiaCombo + ',2';
    if pos('4', viServentiaAtual) > 0 then
      viServentiaCombo := viServentiaCombo + ',3';
    if pos('5',viServentiaAtual) > 0 then
      viServentiaCombo := viServentiaCombo + ',4';

    edtServentias.EditValue := ';'+ copy(viServentiaCombo, 2,  10);
  end;

begin
  edtNomeCartorio.Text := dtmControles.BuscarConfig('PRINCIPAL', 'CARTORIO', 'NOME', 'S');
  viRegistroNovo := edtNomeCartorio.Text = '';

  edtNomeOficial.Text  := dtmControles.BuscarConfig('REGISTRO_DIARIO', 'RELATORIO', 'OFICIAL_ESCREVENTE_ASSINA', 'S');
  edtCNPJ.Text         := dtmControles.BuscarConfig('PRINCIPAL', 'CARTORIO', 'CPFCNPJ', 'S');
  CarregarServentias;

  pnlCadastro.Visible  := viRegistroNovo;
  btnCancelar.Visible  := not viRegistroNovo;
end;

procedure TfrmCadastroInicial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmCadastroInicial := nil;
end;

end.
