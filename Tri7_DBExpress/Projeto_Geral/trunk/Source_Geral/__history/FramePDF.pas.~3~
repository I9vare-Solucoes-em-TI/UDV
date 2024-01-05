unit FramePDF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, gtScrollingPanel,
  gtPDFViewer, gtPDFClasses, gtCstPDFDoc, gtExPDFDoc, gtExProPDFDoc, gtPDFDoc,
  Vcl.ExtCtrls, gtPDFSearchPanel, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxLabel, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Buttons, gtViewerTypes, Vcl.Menus, gtPDFPrinter, cxButtons, Winapi.ShellAPI;

type
  TfmePDF = class(TFrame)
    gtPDFDocument1: TgtPDFDocument;
    gtPDFViewer1: TgtPDFViewer;
    Panel1: TPanel;
    btnPrimeiro: TBitBtn;
    btnAnterior: TBitBtn;
    btnProximo: TBitBtn;
    btnUltimo: TBitBtn;
    spbPreviewWhole: TSpeedButton;
    spbPreviewWidth: TSpeedButton;
    spbPreview100Percent: TSpeedButton;
    btnZoomMais: TBitBtn;
    edtZoom: TMaskEdit;
    pnlZoom: TPanel;
    btnZoomMenos: TBitBtn;
    edtPagAtual: TMaskEdit;
    edtTotalPag: TMaskEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    gtPDFPrinter1: TgtPDFPrinter;
    Panel2: TPanel;
    btnImprimir: TcxButton;
    btnAbrirPDF: TBitBtn;
    procedure gtPDFViewer1PageChange(Sender: TgtPDFViewer;
      const CurrentPageIndex: TPageIndex);
    procedure spbPreviewWholeClick(Sender: TObject);
    procedure spbPreviewWidthClick(Sender: TObject);
    procedure spbPreview100PercentClick(Sender: TObject);
    procedure btnZoomMaisClick(Sender: TObject);
    procedure btnZoomMenosClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnAbrirPDFClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vg_CaminhoDiretorio,
    vg_NomeArquivo : string;
    procedure CarregarPDF;
  end;

implementation

{$R *.dfm}

procedure TfmePDF.btnAbrirPDFClick(Sender: TObject);
begin
  try
    ShellExecute(Handle, 'Open', PChar(vg_NomeArquivo), nil, PChar(vg_CaminhoDiretorio), SW_SHOWNORMAL);
  except
    Application.MessageBox(
      'Problema ao abrir o PDF! ' + #13#10 +
      'Por favor instale o Adobe Acrobat Reader!',
      'Erro!',
      MB_OK + MB_ICONSTOP
    );
  end;
end;

procedure TfmePDF.btnAnteriorClick(Sender: TObject);
begin
  gtPDFViewer1.PageNo := gtPDFViewer1.PageNo - 1;
end;

procedure TfmePDF.btnImprimirClick(Sender: TObject);
begin
  gtPDFPrinter1.PrintDoc;
end;

procedure TfmePDF.btnPrimeiroClick(Sender: TObject);
begin
  gtPDFViewer1.PageNo := 1;
end;

procedure TfmePDF.btnProximoClick(Sender: TObject);
begin
  gtPDFViewer1.PageNo := gtPDFViewer1.PageNo + 1;
end;

procedure TfmePDF.btnUltimoClick(Sender: TObject);
begin
  gtPDFViewer1.PageNo := gtPDFDocument1.PageCount;
end;

procedure TfmePDF.btnZoomMaisClick(Sender: TObject);
begin
  gtPDFViewer1.ZoomType := sztCustom;
  gtPDFViewer1.Zoom := gtPDFViewer1.Zoom + 0.5;
  edtZoom.Text := FloatToStr(gtPDFViewer1.Zoom);
end;

procedure TfmePDF.btnZoomMenosClick(Sender: TObject);
begin
  gtPDFViewer1.ZoomType := sztCustom;
  gtPDFViewer1.Zoom := gtPDFViewer1.Zoom - 0.5;
  edtZoom.Text := FloatToStr(gtPDFViewer1.Zoom);
end;

procedure TfmePDF.CarregarPDF;
begin
  gtPDFViewer1.Active := False;

  if Trim(vg_CaminhoDiretorio + vg_NomeArquivo) = '' then
    Exit;

  gtPDFDocument1.LoadFromFile(vg_CaminhoDiretorio + vg_NomeArquivo);

  if gtPDFDocument1.IsLoaded then
  begin
    // Display number of pages
    edtTotalPag.Text := IntToStr(gtPDFDocument1.PageCount);
    edtZoom.Text := FloatToStr(gtPDFViewer1.Zoom);
    // Specify document that needs to be
    // displayed by the viewer
    gtPDFViewer1.PDFDocument := gtPDFDocument1;
    // Activate viewer
    gtPDFViewer1.Active := True;
  end;
end;

procedure TfmePDF.gtPDFViewer1PageChange(Sender: TgtPDFViewer;
  const CurrentPageIndex: TPageIndex);
begin
  edtPagAtual.Text := IntToStr(CurrentPageIndex);
end;

procedure TfmePDF.spbPreview100PercentClick(Sender: TObject);
begin
  gtPDFViewer1.ZoomType := sztCustom;
  gtPDFViewer1.Zoom := 100;
  edtZoom.Text := FloatToStr(gtPDFViewer1.Zoom);
end;

procedure TfmePDF.spbPreviewWholeClick(Sender: TObject);
begin
  gtPDFViewer1.ZoomType := sztFitPage;
  edtZoom.Text := FloatToStr(gtPDFViewer1.Zoom);
end;

procedure TfmePDF.spbPreviewWidthClick(Sender: TObject);
begin
  gtPDFViewer1.ZoomType := sztFitWidth;
  edtZoom.Text := FloatToStr(gtPDFViewer1.Zoom);
end;

end.
