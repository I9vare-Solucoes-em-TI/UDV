unit VisualizaBoleto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, gtScrollingPanel, gtPDFViewer,
  gtPDFPrinter, gtPDFClasses, gtCstPDFDoc, gtExPDFDoc, gtExProPDFDoc, gtPDFDoc,
  Buttons, ExtCtrls;

type
  TfrmVisualizaBoleto = class(TForm)
    gtPDFDocument1: TgtPDFDocument;
    gtPDFPrinter1: TgtPDFPrinter;
    gtPDFViewer1: TgtPDFViewer;
    Panel1: TPanel;
    sbnImprimirPDF: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbnImprimirPDFClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVisualizaBoleto: TfrmVisualizaBoleto;
  vgCaminhoArquivo : String;

implementation

{$R *.dfm}

procedure TfrmVisualizaBoleto.FormActivate(Sender: TObject);
begin
  gtPDFViewer1.Active := False;
  gtPDFDocument1.LoadFromFile(vgCaminhoArquivo);
  gtPDFViewer1.PDFDocument := gtPDFDocument1;
  gtPDFViewer1.Active := True; // Display the document
  Screen.Cursor := crDefault;
end;

procedure TfrmVisualizaBoleto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmVisualizaBoleto := nil;
end;

procedure TfrmVisualizaBoleto.sbnImprimirPDFClick(Sender: TObject);
begin
  gtPDFPrinter1.PrintDoc;
end;

end.
