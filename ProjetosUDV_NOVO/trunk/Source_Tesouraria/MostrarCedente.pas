unit MostrarCedente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadAuxiliar, Menus, cxLookAndFeelPainters, FMTBcd, DB, DBClient,
  Provider, SqlExpr, StdCtrls, cxButtons, ExtCtrls, cxGraphics, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxLookAndFeels, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, frxClass;

type
  TfrmAlterarCedente = class(TfrmCadAuxiliar)
    btnCadastrar: TcxButton;
    lcxCedente: TcxLookupComboBox;
    Panel2: TPanel;
    Bevel4: TBevel;
    lblInformacaoLancamento: TcxLabel;
    Panel4: TPanel;
    imgReceber: TImage;
    procedure FormActivate(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAlterarCedente: TfrmAlterarCedente;

implementation

uses Lookup, Controles, ControleVariaveis, Principal, Lookup_Contabil;

{$R *.dfm}

procedure TfrmAlterarCedente.btnCadastrarClick(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Confirma alteração do Cedente?', 'Confirmação', MB_YESNO) = IDNO then
    exit;

  ExecutaSqlAuxiliar(' UPDATE G_CONFIG SET VALOR = '+ IntToStr(lcxCedente.EditValue)+
                     ' WHERE NOME = '+ QuotedStr('CEDENTE_ATIVO'),1);

  frmPrincipal.MostrarCedenteAtivo(IntToStr(lcxCedente.EditValue));
  frmPrincipal.AdvToolBarPager1.Refresh;
  frmPrincipal.Update;
  close;
end;

procedure TfrmAlterarCedente.FormActivate(Sender: TObject);
begin
  inherited;
  if vgCedenteAtivo > 0 then
    lcxCedente.EditValue := vgCedenteAtivo;
  lcxCedente.SetFocus;
end;

end.

