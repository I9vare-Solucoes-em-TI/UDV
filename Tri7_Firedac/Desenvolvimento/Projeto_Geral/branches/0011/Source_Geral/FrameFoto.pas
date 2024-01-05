unit FrameFoto;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Menus,
  ImgList, StdCtrls,
  cxButtons, Vcl.Buttons, Vcl.ExtCtrls, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver;

type
  TfmeFoto = class(TFrame)
    Panel1: TPanel;
    ImageList1: TImageList;
    btnPreview: TSpeedButton;
    imgFoto: TImage;
    btnApagarImagem: TcxButton;
  private
    { Private declarations }
  public
    { Public declarations }
    vg_NumImagem, vg_QtdImagem  : Integer;
    vgArquivoFoto : String;
    procedure Conectar;
    procedure Desconectar;
  end;

implementation

uses CapturaFoto;

{$R *.dfm}

procedure TfmeFoto.Conectar;
begin
  if frmCapturaFoto = nil then
     Application.CreateForm(TfrmCapturaFoto, frmCapturaFoto);

  if (frmCapturaFoto.Capture1.NumDevices < 1) then
  begin
    ShowMessage('Não foi encontrado nenhum dispositivo de captura instalado nesta máquina!');
    frmCapturaFoto.Close;
    Abort;
  end;

  if (frmCapturaFoto.Capture1.DeviceIndex < 0) then
  begin
    frmCapturaFoto.Visible:=True;
    Screen.Cursor:=-11;
    frmCapturaFoto.Capture1.Connect(0);
    Screen.Cursor:=0;
    frmCapturaFoto.btnConfigurar.Enabled := frmCapturaFoto.Capture1.HasFilterPropertyPage(PROP_VIDEO_DEVICE);
  end;
end;

procedure TfmeFoto.Desconectar;
begin

end;

end.
