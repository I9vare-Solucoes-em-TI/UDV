unit VisualizacaoAmpliada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxControls,
  cxContainer, cxEdit, cxLabel, StdCtrls, cxButtons, ExtCtrls, FrameEditor,
  WPRTEDefs, WPCTRMemo, WPCTRRich;

type
  TfrmVisualizacaoAmpliada = class(TForm)
    pnl: TPanel;
    imgPagar: TImage;
    Image1: TImage;
    btnGravarTexto: TcxButton;
    lblInformacaoRegistro: TcxLabel;
    btnImprimirTexto: TcxButton;
    btnFechar: TcxButton;
    WPRichText1: TWPRichText;
    cxButton1: TcxButton;
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure elaCheia1Click(Sender: TObject);
    procedure btnImprimirTextoClick(Sender: TObject);
  private
    { Private declarations }
  public
    vgCaption : String;
  end;

var
  frmVisualizacaoAmpliada: TfrmVisualizacaoAmpliada;

implementation

uses Lookup_RC;

{$R *.dfm}

procedure TfrmVisualizacaoAmpliada.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmVisualizacaoAmpliada.btnImprimirTextoClick(Sender: TObject);
begin
  dtmLookupRC.ImprimirDocumento(fmeEditor.WptTexto, vgCaption, lblInformacaoRegistro.Caption);
end;

procedure TfrmVisualizacaoAmpliada.elaCheia1Click(Sender: TObject);
begin
  btnFecharClick(Self);
end;

procedure TfrmVisualizacaoAmpliada.FormActivate(Sender: TObject);
begin
  fmeEditor.wptTexto.SetFocus;
end;

procedure TfrmVisualizacaoAmpliada.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
