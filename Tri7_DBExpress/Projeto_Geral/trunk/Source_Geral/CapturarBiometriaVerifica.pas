unit CapturarBiometriaVerifica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls,AnimationThread,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters;

type
  TfrmCapturarBiometriaVerifica = class(TForm)
    Shape1: TShape;
    Panel1: TPanel;
    lblInformacao: TcxLabel;
    pnlDigital: TPanel;
    lblDedo: TcxLabel;
    Progress: TPanel;
    pnlPrimeiraCaptura: TPanel;
    lblDedo2: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ProgressClick(Sender: TObject);
  private
    ani   : TAnimationThread;
    r     : TRect;
  public
    { Public declarations }
  end;

var
  frmCapturarBiometriaVerifica: TfrmCapturarBiometriaVerifica;

implementation



{$R *.dfm}

procedure TfrmCapturarBiometriaVerifica.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ani.Terminate;

  Action := caFree;
  frmCapturarBiometriaVerifica := nil;
end;

procedure TfrmCapturarBiometriaVerifica.ProgressClick(Sender: TObject);
begin
  r := Progress.clientrect;
  InflateRect(r, - Progress.bevelwidth, - Progress.bevelwidth);
  ani := TanimationThread.Create(Progress, r, Progress.color, clBlue, 15);
  Application.ProcessMessages;
end;

end.
