unit AlertaBloqueio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxGDIPlusClasses, ExtCtrls, StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxLabel,
  dxSkinsCore;

type
  TfrmAlertaBloqueio = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Timer1: TTimer;
    lblTempo: TcxLabel;
    Label1: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vlTempoRestante,
    vlTempoInicial : TTime;
  end;

var
  frmAlertaBloqueio: TfrmAlertaBloqueio;

implementation

uses ControleBloqueio, UsuarioHorario, Principal;

{$R *.dfm}

procedure TfrmAlertaBloqueio.FormCreate(Sender: TObject);
begin
  Timer1.Enabled := True;
  frmPrincipal.actTrocarUsuario.Enabled := False;
end;

procedure TfrmAlertaBloqueio.Label1Click(Sender: TObject);
begin
  if Application.MessageBox('Confirma fechar o sistema!', 'Atenção', MB_YESNO) = IDNO then
    Exit;

  Application.Terminate;
end;

procedure TfrmAlertaBloqueio.Timer1Timer(Sender: TObject);
var
  hor,
  min,
  seg,
  mseg : Word;
  Contador : Extended;
begin
  vlTempoInicial := vlTempoInicial + (1 / SecsPerDay);
  Contador := vlTempoRestante - vlTempoInicial;

  if (Contador < 0) then
  begin
    vlBloqueioHorario.Destroy; 
    Application.Terminate;
  end;

  DecodeTime(Contador, hor, min, seg, mseg);
  min := min + hor * 60;

  if (seg < 10) then
    lblTempo.Caption := IntToStr(min) + ':0' + IntToStr(seg)
  else
    lblTempo.Caption := IntToStr(min) + ':' + IntToStr(seg);
  lblTempo.Update;
end;

end.
