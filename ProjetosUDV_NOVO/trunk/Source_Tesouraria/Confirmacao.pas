unit Confirmacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxCheckBox, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, ExtCtrls,
  cxControls, cxContainer, cxEdit, cxLabel, cxSpinEdit, cxGraphics,
  cxLookAndFeels, dxSkinBlueprint, dxSkinDarkRoom, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinHighContrast, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSpringTime, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  ComCtrls, dxCore, cxDateUtils;

type

  TDadosConfimacao = Record
    Data: TDateTime;
    Qtd : Integer;
    Confirmado, Multa, GerarBoleto, Detalhar : Boolean;
    Saida : Boolean;
  End;

  TfrmConfirmacao = class(TForm)
    Panel2: TPanel;
    Bevel4: TBevel;
    lblInformacaoLancamento: TcxLabel;
    Panel4: TPanel;
    imgReceber: TImage;
    Panel1: TPanel;
    chxInserirMulta: TcxCheckBox;
    lblData: TcxLabel;
    edtDataRecebimento: TcxDateEdit;
    lblQtd: TcxLabel;
    edtQtd: TcxSpinEdit;
    btnConfirmar: TcxButton;
    btnCancelar: TcxButton;
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfirmacao: TfrmConfirmacao;
  vgDadosConfirmacao : TDadosConfimacao;

implementation

uses Controles, Lookup;

{$R *.dfm}

procedure TfrmConfirmacao.btnCancelarClick(Sender: TObject);
begin
  vgDadosConfirmacao.Confirmado := False;
  close;
end;

procedure TfrmConfirmacao.btnConfirmarClick(Sender: TObject);
begin
  VerificarPreenchimentoDTA_TX(edtDataRecebimento.Text, 'Data da Entrada', edtDataRecebimento);
  dtmLookup.VerificarEdicao(IntToStr(dtmLookup.PegarAnoMes(DateToStr(edtDataRecebimento.EditValue))), 'Data de registro');

  if Application.MessageBox('Confirma o Registro?',
      'Confirmação', MB_YESNO) = IDNO then
    exit;

  vgDadosConfirmacao.Confirmado := True;
  vgDadosConfirmacao.Multa      := chxInserirMulta.Checked;
  vgDadosConfirmacao.Data       := edtDataRecebimento.Date;
  vgDadosConfirmacao.Qtd        := edtQtd.EditValue;
  close;
end;

procedure TfrmConfirmacao.FormActivate(Sender: TObject);
begin
  chxInserirMulta.Checked := vgDadosConfirmacao.Multa;
  chxInserirMulta.Enabled := vgDadosConfirmacao.Multa;

  if not vgDadosConfirmacao.Saida then
       edtQtd.EditValue := 2
  else edtQtd.EditValue := 1;

  edtQtd.Enabled := not vgDadosConfirmacao.Saida;

  if vgDadosConfirmacao.GerarBoleto then
  begin
    edtDataRecebimento.enabled  := False;
    lblData.enabled             := False;
    lblQtd.Enabled              := False;
    edtQtd.Enabled              := False;
  end
  else edtDataRecebimento.SetFocus;
  edtDataRecebimento.EditValue := dtmControles.DataHoraBanco(3);

  if vgDadosConfirmacao.Detalhar then
    lblInformacaoLancamento.Caption := 'Confirmação com Detalhamento do(s) Item(s)';

end;

procedure TfrmConfirmacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  vgDadosConfirmacao.Detalhar := False;
  Action := caFree;
  frmConfirmacao := nil;
end;

end.
