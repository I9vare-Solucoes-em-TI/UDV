unit CapturarBiometriaVerifica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls,AnimationThread,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue;

type
  TfrmCapturarBiometriaVerifica = class(TForm)
    Shape1: TShape;
    Panel1: TPanel;
    lblInformacao: TcxLabel;
    pnlDigital: TPanel;
    lblDedo: TcxLabel;
    Progress: TPanel;
    pnlPrimeiraCaptura: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ProgressClick(Sender: TObject);
  private
    i, j  : integer;
    ani   : TAnimationThread;
    r     : TRect;
  public
    { Public declarations }
  end;

var
  frmCapturarBiometriaVerifica: TfrmCapturarBiometriaVerifica;

implementation

uses RotinasFingkey;

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
