unit Splash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxLabel, frxpngimage, AnimationThread;

type
  TfrmSplash = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Progress: TPanel;
    cxLabel19: TcxLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;
  ani   : TAnimationThread;
  r     : TRect;

implementation


{$R *.dfm}

procedure TfrmSplash.FormActivate(Sender: TObject);
begin
  Application.ProcessMessages;
  r := Progress.clientrect;
  InflateRect(r, - Progress.bevelwidth, - Progress.bevelwidth);
  ani := TanimationThread.Create(Progress, r, Progress.color, $009D9D00, 20);
  Application.ProcessMessages;
end;

procedure TfrmSplash.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ani.Terminate;
end;

end.
