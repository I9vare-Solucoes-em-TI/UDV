unit CapturaFoto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls, FrameFoto,
  OleCtrls, CAPTUREPRO3Lib_TLB, Menus;

type
  TExecuteProcedure = procedure of object;

  TfrmCapturaFoto = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    btnFechar: TcxButton;
    btnDigitalizar: TcxButton;
    btnConfigurar: TcxButton;
    Capture1: TCapturePRO;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConfigurarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnDigitalizarClick(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  frmCapturaFoto: TfrmCapturaFoto;
  PROP_VIDEO_DEVICE: Longint = $1;
  vgClose, vgImagemCapturada : Boolean;

implementation

{$R *.dfm}

procedure TfrmCapturaFoto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  Action := caFree;
  frmCapturaFoto := nil;
end;

procedure TfrmCapturaFoto.btnConfigurarClick(Sender: TObject);
begin
  if Capture1.HasFilterPropertyPage(PROP_VIDEO_DEVICE) Then
     Capture1.ShowFilterPropertyPage(PROP_VIDEO_DEVICE, '');
end;

procedure TfrmCapturaFoto.btnFecharClick(Sender: TObject);
begin
  vgImagemCapturada := False;
  Capture1.Preview  := False;
  frmCapturaFoto.Capture1.Disconnect;
  Close;
end;

procedure TfrmCapturaFoto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F6 then
    btnDigitalizarClick(self);
end;

procedure TfrmCapturaFoto.FormShow(Sender: TObject);
begin
  if (frmCapturaFoto.Capture1.DeviceIndex < 0) then
  begin
    Screen.Cursor:=-11;
    frmCapturaFoto.Capture1.Connect(0);
    Screen.Cursor:=0;
    frmCapturaFoto.btnConfigurar.Enabled := frmCapturaFoto.Capture1.HasFilterPropertyPage(PROP_VIDEO_DEVICE);
    Capture1.Preview:=True;
  end;

end;

procedure TfrmCapturaFoto.FormCreate(Sender: TObject);
begin
  vgClose := False;
  if (Capture1.NumDevices < 1) then
  begin
    ShowMessage('Não foi encontrado nenhum dispositivo de captura instalado nesta máquina!');
    vgImagemCapturada := False;
    vgClose := True;
  end;
end;

procedure TfrmCapturaFoto.btnDigitalizarClick(Sender: TObject);
begin
  Capture1.CaptureFrame;
  // Salva a Imagem
  frmCapturaFoto.Capture1.FrameFile := extractFilePath(Application.ExeName)+'ImgFoto.jpg';
  frmCapturaFoto.Capture1.SaveFrame;

  Capture1.Preview  := False;
  frmCapturaFoto.Capture1.Disconnect;
  vgImagemCapturada := True;
  Close;
end;

end.
