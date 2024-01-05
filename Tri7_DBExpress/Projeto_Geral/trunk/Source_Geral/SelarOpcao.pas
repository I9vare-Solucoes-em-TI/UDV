unit SelarOpcao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, cxButtons, ExtCtrls,







  cxControls, cxContainer, cxEdit, cxLabel, DB,
  DBClient, cxRadioGroup, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters;

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
  public
    { Public declarations }
  end;

var
  frmSelarOpcao: TfrmSelarOpcao;
  vgDadosSelar : TDadosSelar;
implementation



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
