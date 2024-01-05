unit VisualizaEstoqueSelo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls,
  cxContainer, cxEdit,
  cxTextEdit, cxMemo, cxRichEdit, Menus, StdCtrls,
  cxButtons, ExtCtrls, printers, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters;

type
  TfrmVisualizaEstoqueSelo = class(TForm)
    rchTexto: TcxRichEdit;
    Panel1: TPanel;
    btnImprimirProtocolo: TcxButton;
    btnFechar: TcxButton;
    PrintDialog1: TPrintDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure btnImprimirProtocoloClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetRichEditMargins(const mLeft, mRight, mTop, mBottom: extended;
      const re: TcxRichEdit);
  public
    { Public declarations }
  end;

var
  frmVisualizaEstoqueSelo: TfrmVisualizaEstoqueSelo;

implementation

{$R *.dfm}

procedure TfrmVisualizaEstoqueSelo.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmVisualizaEstoqueSelo.btnImprimirProtocoloClick(Sender: TObject);
begin
  if PrintDialog1.Execute then
  begin
    SetRichEditMargins(1, 1, 0.5, 0.5, rchTexto) ;
    rchTexto.Print('Selos Estoque Mínimo');
  end;
end;

procedure TfrmVisualizaEstoqueSelo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmVisualizaEstoqueSelo := nil;
end;

procedure TfrmVisualizaEstoqueSelo.SetRichEditMargins(const mLeft, mRight, mTop, mBottom: extended; const re : TcxRichEdit) ;
var
  ppiX,
  ppiY : integer;
  spaceLeft,
  spaceTop : integer;
  r : TRect;
begin
  // pixels per inch
  ppiX := GetDeviceCaps(Printer.Handle, LOGPIXELSX) ;
  ppiY := GetDeviceCaps(Printer.Handle, LOGPIXELSY) ;
  // non-printable margins
  spaceLeft := GetDeviceCaps(Printer.Handle, PHYSICALOFFSETX) ;
  spaceTop := GetDeviceCaps(Printer.Handle, PHYSICALOFFSETY) ;
  //calc margins
  R.Left := Round(ppiX * mLeft) - spaceLeft;
  R.Right := Printer.PageWidth - Round(ppiX * mRight) - spaceLeft;
  R.Top := Round(ppiY * mTop) - spaceTop;
  R.Bottom := Printer.PageHeight - Round(ppiY * mBottom) - spaceTop;
  // set margins
  re.PageRect := r;
end;

end.
