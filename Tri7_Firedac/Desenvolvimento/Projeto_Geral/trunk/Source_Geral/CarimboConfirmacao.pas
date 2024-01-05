unit CarimboConfirmacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus,





  StdCtrls,
  cxRadioGroup, cxControls, cxContainer, cxEdit, cxLabel, cxButtons, ExtCtrls,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters;

type
  TfrmCarimboConfirmacao = class(TForm)
    Panel1: TPanel;
    Shape1: TShape;
    btnCancelar: TcxButton;
    cxButton1: TcxButton;
    btnImprimir: TcxButton;
    lcxInformacao: TcxLabel;
    cxLabel2: TcxLabel;
    rdbNormal: TcxRadioButton;
    rdbInvertida: TcxRadioButton;
    procedure rdbNormalClick(Sender: TObject);
    procedure rdbInvertidaClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCarimboConfirmacao: TfrmCarimboConfirmacao;
  vgCarimboInformacao : String;
  vgCarimboInvertida, vgCarimboConfirma : Boolean;
implementation



{$R *.dfm}

procedure TfrmCarimboConfirmacao.btnImprimirClick(Sender: TObject);
begin
  vgCarimboConfirma  := True;
  close;
end;

procedure TfrmCarimboConfirmacao.cxButton1Click(Sender: TObject);
begin
  vgCarimboConfirma := False;
  close;
end;

procedure TfrmCarimboConfirmacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmCarimboConfirmacao := nil;
end;

procedure TfrmCarimboConfirmacao.FormCreate(Sender: TObject);
begin
  rdbNormalClick(self);
end;

procedure TfrmCarimboConfirmacao.rdbInvertidaClick(Sender: TObject);
begin
  lcxInformacao.Caption    := vgCarimboInformacao + ' Impressão INVERTIDA';
  rdbNormal.Font.Color     := clNavy;
  rdbInvertida.Font.Color  := clMaroon;
  vgCarimboInvertida     := True;
end;

procedure TfrmCarimboConfirmacao.rdbNormalClick(Sender: TObject);
begin
  lcxInformacao.Caption    := vgCarimboInformacao + ' - Impressão NORMAL';
  rdbNormal.Font.Color     := clMaroon;
  rdbInvertida.Font.Color  := clNavy;
  vgCarimboInvertida       := False;
end;

end.
