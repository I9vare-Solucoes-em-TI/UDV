unit Apresentante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxControls, cxContainer, cxEdit, cxLabel,
  dxGDIPlusClasses, ExtCtrls, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons;

type
  TfrmApresentante = class(TForm)
    Panel1: TPanel;
    imgPagar: TImage;
    Panel2: TPanel;
    btnConcluirServico: TcxButton;
    Panel3: TPanel;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmApresentante: TfrmApresentante;
  vgApresentante : String;

implementation

{$R *.dfm}

procedure TfrmApresentante.FormActivate(Sender: TObject);
begin
  lblInformacaoRegistro.Caption := vgApresentante;
end;

end.
