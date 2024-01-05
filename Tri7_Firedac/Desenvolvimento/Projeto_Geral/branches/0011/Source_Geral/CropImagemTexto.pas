unit CropImagemTexto;

interface

uses
  Windows, Messages, SysUtils, {$IfNDef VER130} Variants, {$EndIf} Classes, Graphics, Controls, Forms,
  Dialogs, ieview, imageenview, ComCtrls, StdCtrls, Buttons, hyieutils, hyiedefs, iesettings,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Vcl.Menus, cxControls, cxContainer, cxEdit, cxCheckBox, cxButtons,
  Vcl.ExtCtrls, cxTrackBar, cxLabel;

type
  TfrmCropImagemTexto = class(TForm)
    ImageEnView1: TImageEnView;
    Panel1: TPanel;
    btnCrop: TcxButton;
    chxFit: TcxCheckBox;
    TrackBar_ImageEn_Zoom: TcxTrackBar;
    cxLabel1: TcxLabel;
    btnCancelar: TcxButton;
    btnConfirmar: TcxButton;
    procedure cxTrackBar1PropertiesChange(Sender: TObject);
    procedure chxFitClick(Sender: TObject);
    procedure btnCropClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    FFileImagem: string;
    procedure ExibirImagem(vpArquivo: string);
  public
    { Public declarations }
    class function CropImagemTexto(
      const vpFileImagem: string): Boolean;
  end;

//var
//  frmCropImagemTexto: TfrmCropImagemTexto;

implementation

uses
  Controles;

{$R *.DFM}

procedure TfrmCropImagemTexto.btnConfirmarClick(Sender: TObject);
begin
  ImageEnView1.IO.SaveToFileJpeg(FFileImagem);
  ModalResult := mrOk;
end;

procedure TfrmCropImagemTexto.btnCropClick(Sender: TObject);
begin
  if ( imageenview1.Selected ) then
  begin
    ImageEnView1.Proc.CropSel;
    btnConfirmar.Enabled := True;
  end
  else
    ShowMessage ('Por favor selecione uma àrea para recortar com o mouse antes!');
  ImageEnView1.Deselect;
end;

procedure TfrmCropImagemTexto.chxFitClick(Sender: TObject);
begin
  if chxFit.Checked then
  begin
    ImageEnView1.AutoFit := true;
    ImageEnView1.Fit;
    TrackBar_ImageEn_Zoom.Position := Round(ImageEnView1.Zoom);
    TrackBar_ImageEn_Zoom.Enabled  := false;
  end
  else
  begin
    ImageEnView1.AutoFit := false;
    TrackBar_ImageEn_Zoom.Enabled := true;
    ImageEnView1.Zoom := TrackBar_ImageEn_Zoom.Position;
  end;
end;

class function TfrmCropImagemTexto.CropImagemTexto(
  const vpFileImagem: string): Boolean;
var
  vifrmCropImagemTexto: TfrmCropImagemTexto;
begin
  Result := False;

  Application.CreateForm(
    Self,
    vifrmCropImagemTexto);

  vifrmCropImagemTexto.ExibirImagem(vpFileImagem);

  try
    if vifrmCropImagemTexto.ShowModal = mrOk  then
      Result := True;
  finally
    vifrmCropImagemTexto.Free;
  end;

end;

procedure TfrmCropImagemTexto.cxTrackBar1PropertiesChange(Sender: TObject);
begin
  ImageEnView1.Zoom := TrackBar_ImageEn_Zoom.Position;
end;

procedure TfrmCropImagemTexto.ExibirImagem(vpArquivo: string);
begin
  if FileExists(vpArquivo) then
  begin
    FFileImagem := vpArquivo;
    imageenview1.IO.LoadFromFile(vpArquivo);
    imageenview1.MouseInteract := [miSelect];   //go for rectangular area
    TrackBar_ImageEn_Zoom.Position := Round(ImageEnView1.Zoom); //zet trackbar for zoom in and out
  end;
end;

procedure TfrmCropImagemTexto.FormCreate(Sender: TObject);
begin
  FFileImagem := EmptyStr;
end;

end.
