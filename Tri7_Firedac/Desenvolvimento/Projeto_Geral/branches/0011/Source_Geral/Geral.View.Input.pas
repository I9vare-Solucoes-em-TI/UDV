unit Geral.View.Input;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinMcSkin,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver, Vcl.StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxLabel, cxTextEdit;

type
  TFrmInput = class(TForm)
    PnlPrincipal: TPanel;
    PnlBotoes: TPanel;
    BtnConfirmar: TcxButton;
    BtnCancelar: TcxButton;
    procedure BtnConfirmarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
  public
  end;

var
  FrmInput: TFrmInput;

implementation

{$R *.dfm}

procedure TFrmInput.BtnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrmInput.BtnConfirmarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFrmInput.FormShow(Sender: TObject);
begin
  BtnConfirmar.SetFocus;
end;

end.
