unit RegistroParcial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadastroAuxSimplificado, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, Menus, FMTBcd, DB, DBClient, Provider,
  SqlExpr, StdCtrls, cxButtons, ExtCtrls, cxLabel, cxRadioGroup, cxTextEdit,
  cxCurrencyEdit, cxDBEdit;

type
  TfrmCadastroRapidoRegistroParcial = class(TfrmCadastroAuxSimplificado)
    cxLabel10: TcxLabel;
    edtValorFixo: TcxCurrencyEdit;
    rdbAgendamentoAberto: TcxRadioButton;
    rdbAgendamentoFinalizar: TcxRadioButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroRapidoRegistroParcial: TfrmCadastroRapidoRegistroParcial;
  vgAgendamentoSituacaoParcial : String;
  vgAgendamentoValorPagar, vgAgendamentoValorAgendado : Currency;

implementation

uses Lookup;

{$R *.dfm}

procedure TfrmCadastroRapidoRegistroParcial.btnConfirmarClick(Sender: TObject);
var
  viMensagem : string;
begin
  if rdbAgendamentoAberto.Checked then
       vgAgendamentoSituacaoParcial := '2'
  else vgAgendamentoSituacaoParcial := '3';

  inherited;
end;

procedure TfrmCadastroRapidoRegistroParcial.FormActivate(Sender: TObject);
begin
  inherited;
  edtValorFixo.EditValue := vgAgendamentoValorPagar;
end;

procedure TfrmCadastroRapidoRegistroParcial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  vgDadosCadastro.SomentePesquisa := False;

  Action := caFree;
  frmCadastroRapidoRegistroParcial := nil;
end;

procedure TfrmCadastroRapidoRegistroParcial.FormCreate(Sender: TObject);
begin
  inherited;
  edtValorFixo.EditValue := vgAgendamentoValorPagar;

  if vgAgendamentoValorPagar >= vgAgendamentoValorAgendado then
       rdbAgendamentoFinalizar.Checked := True
  else rdbAgendamentoFinalizar.Checked := False;

end;

end.
