unit FotoAmpliada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, cxButtons, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, hyieutils, iexBitmaps, hyiedefs, iesettings,
  iexLayers, iexRulers, ieview, imageenview;

type
  TfrmFotoAmpliada = class(TForm)
    cxBtnFechar: TcxButton;
    imgFoto: TImageEnView;
    procedure cxBtnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFotoAmpliada: TfrmFotoAmpliada;

implementation

{$R *.dfm}

procedure TfrmFotoAmpliada.cxBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TfrmFotoAmpliada.FormShow(Sender: TObject);
begin
  imgFoto.Fit;
end;

end.
