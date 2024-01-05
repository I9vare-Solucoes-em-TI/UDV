unit VisualizarBoleto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, gtPDFPrinter, gtPDFClasses, gtCstPDFDoc,
  gtExPDFDoc, gtExProPDFDoc, gtPDFDoc, gtScrollingPanel, gtPDFViewer,
  Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmVisualizaBoleto = class(TForm)
    Panel1: TPanel;
    sbnImprimirPDF: TSpeedButton;
    gtPDFViewer: TgtPDFViewer;
    gtPDFDocument: TgtPDFDocument;
    gtPDFPrinter: TgtPDFPrinter;
    procedure sbnImprimirPDFClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVisualizaBoleto: TfrmVisualizaBoleto;
  vgCaminhoArquivo: string;

implementation

{$R *.dfm}

procedure TfrmVisualizaBoleto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmVisualizaBoleto := nil;
end;

procedure TfrmVisualizaBoleto.FormCreate(Sender: TObject);
begin
  gtPDFViewer.Active := False;
  gtPDFDocument.LoadFromFile(vgCaminhoArquivo);
  gtPDFViewer.PDFDocument := gtPDFDocument;
  gtPDFViewer.Active := True;
  Screen.Cursor := crDefault;
end;

procedure TfrmVisualizaBoleto.sbnImprimirPDFClick(Sender: TObject);
begin
  gtPDFPrinter.PrintDoc;
end;

end.
