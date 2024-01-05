unit SelarOpcao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxGraphics, cxDropDownEdit, cxImageComboBox, cxTextEdit,
  cxMaskEdit, cxCalendar, cxControls, cxContainer, cxEdit, cxLabel, DB,
  DBClient, SimpleDS, cxRadioGroup, cxLookAndFeels;

type
  TDadosSelar = Record
    Confirmado : Boolean;
    Opcao : Integer;
  end;

  TfrmSelarOpcao = class(TForm)
    Panel1: TPanel;
    cxLabel8: TcxLabel;
    rdbSelarFinal: TcxRadioButton;
    rdbSelarSelecionado: TcxRadioButton;
    btnConfirmar: TcxButton;
    btnCancelar: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure CarregarSituacao;
  public
    { Public declarations }
  end;

var
  frmSelarOpcao: TfrmSelarOpcao;
  vgDadosSelar : TDadosSelar;
implementation

uses Controles;

{$R *.dfm}

procedure TfrmSelarOpcao.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSelarOpcao.btnConfirmarClick(Sender: TObject);
begin
  vgDadosSelar.Confirmado := True;
  if rdbSelarFinal.Checked then
       vgDadosSelar.Opcao := 1
  else vgDadosSelar.Opcao := 2;
  Close;
end;

procedure TfrmSelarOpcao.CarregarSituacao;
begin

end;

procedure TfrmSelarOpcao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action        := caFree;
  frmSelarOpcao := nil;
end;

procedure TfrmSelarOpcao.FormCreate(Sender: TObject);
begin
  vgDadosSelar.Confirmado := False;
end;

end.
