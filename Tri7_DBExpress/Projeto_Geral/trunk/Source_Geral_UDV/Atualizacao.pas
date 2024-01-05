unit Atualizacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, frxpngimage,
  cxControls, cxContainer, cxEdit, cxLabel, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinCaramel, dxSkinCoffee,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinOffice2007Black;

type
  TfrmAtualizacao = class(TForm)
    Panel1: TPanel;
    lblTexto: TcxLabel;
    Image1: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAtualizacao: TfrmAtualizacao;

implementation

{$R *.dfm}

end.
