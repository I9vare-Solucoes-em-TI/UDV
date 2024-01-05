unit TituloRelatorio;

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
  cxTextEdit, cxMemo, cxRichEdit, cxControls, cxContainer, cxEdit, cxLabel,
  ExtCtrls, cxGraphics, cxLookAndFeels, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxSkinscxPCPainter,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxSkinsdxBarPainter, dxSkinsdxRibbonPainter,
  dxPSCore, dxPScxCommon, cxClasses;

type
  TfrmTituloRelatorio = class(TForm)
    Panel2: TPanel;
    Bevel4: TBevel;
    lblInformacaoLancamento: TcxLabel;
    cxRichTitulo: TcxRichEdit;
    Panel1: TPanel;
    btnConfirmarCompromisso: TcxButton;
    cxButton1: TcxButton;
    procedure cxButton1Click(Sender: TObject);
    procedure btnConfirmarCompromissoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTituloRelatorio: TfrmTituloRelatorio;
  vgRelatorioImprimir : Boolean;
  vgRelatorioTitulo : String;

implementation

uses Lookup, Controles, Rotinas, Lookup_Contabil;

{$R *.dfm}

procedure TfrmTituloRelatorio.btnConfirmarCompromissoClick(Sender: TObject);
begin
  vgRelatorioImprimir := True;
  dtmLookup.dxComponentPrinter.CurrentLink.ReportTitleText := cxRichTitulo.Text;
  Close;
end;

procedure TfrmTituloRelatorio.cxButton1Click(Sender: TObject);
begin
  vgRelatorioImprimir := False;
  Close;
end;

procedure TfrmTituloRelatorio.FormActivate(Sender: TObject);
begin
  dtmLookup.CarregarCabecalho(vgBalancetePrincipal);
  vgRelatorioImprimir := False;
  cxRichTitulo.Text   := DeCompressString(dtmLookup.sqlCabecalhoCABECALHO.AsString);
  if vgRelatorioTitulo <> '' then
   cxRichTitulo.Text := cxRichTitulo.Text + vgRelatorioTitulo;
  cxRichTitulo.SetFocus;
end;

procedure TfrmTituloRelatorio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  vgRelatorioTitulo := '';

  Action := caFree;
  frmTituloRelatorio := nil;
end;

end.
