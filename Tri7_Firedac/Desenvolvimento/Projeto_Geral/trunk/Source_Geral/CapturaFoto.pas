unit CapturaFoto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxButtons, ExtCtrls,
  OleCtrls, CAPTUREPRO3Lib_TLB, Menus, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver;

type
  TExecuteProcedure = procedure of object;

  TfrmCapturaFoto = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    btnFechar: TcxButton;
    btnDigitalizar: TcxButton;
    btnConfigurar: TcxButton;
    Capture1: TCapturePRO;
    ResolLabel: TLabel;
    ResolutionCombo: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnDigitalizarClick(Sender: TObject);
    procedure ResolutionComboChange(Sender: TObject);
    procedure btnConfigurarClick(Sender: TObject);
  private
    procedure HabilitarResolucao;
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
  HabilitarResolucao;
end;

procedure TfrmCapturaFoto.HabilitarResolucao;
var
  i: Integer;
begin
  ResolutionCombo.Enabled := True;
  ResolLabel.Enabled := True;
  if (Capture1.NumVideoResolutions > 0) Then
    for i := 0 to Capture1.NumVideoResolutions -1 do
       ResolutionCombo.Items.Add(capture1.ObtainVideoResolutionName(i));

  ResolutionCombo.ItemIndex := Capture1.VideoResolutionIndex;
end;

procedure TfrmCapturaFoto.ResolutionComboChange(Sender: TObject);
begin
  If Not(ResolutionCombo.ItemIndex = Capture1.VideoResolutionIndex) Then
     Capture1.VideoResolutionIndex := ResolutionCombo.ItemIndex;
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

procedure TfrmCapturaFoto.btnConfigurarClick(Sender: TObject);
begin
  if Capture1.HasFilterPropertyPage(PROP_VIDEO_DEVICE) Then
     Capture1.ShowFilterPropertyPage(PROP_VIDEO_DEVICE, '');
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
