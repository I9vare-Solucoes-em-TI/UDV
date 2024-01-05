unit ConciliacaoDataConciliacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.Menus, Vcl.StdCtrls,
  cxRadioGroup, cxButtons, Vcl.ExtCtrls, cxLabel;

type
  TfrmConciliacaoData = class(TForm)
    Panel2: TPanel;
    lblInformaca: TcxLabel;
    Panel4: TPanel;
    imgTitulo: TImage;
    Panel6: TPanel;
    btnCancelar: TcxButton;
    btnConfirmar: TcxButton;
    cxLabel1: TcxLabel;
    rdbDataBanco: TcxRadioButton;
    rdbDataRegistro: TcxRadioButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rdbDataBancoClick(Sender: TObject);
    procedure rdbDataRegistroClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConciliacaoData: TfrmConciliacaoData;
  vgConciliacaoDataFlag, vgConciliacaoDataAlterar : Boolean;
  vgConciliacaoValorAlterar : Currency;

implementation

uses
  Controles;

{$R *.dfm}

procedure TfrmConciliacaoData.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConciliacaoData.btnConfirmarClick(Sender: TObject);
begin
  vgConciliacaoDataFlag := True;
  Close;
end;

procedure TfrmConciliacaoData.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action             := caFree;
  frmConciliacaoData := nil;
end;

procedure TfrmConciliacaoData.FormCreate(Sender: TObject);
begin
  rdbDataBanco.Checked := vgConciliacaoDataAlterar;

  if rdbDataBanco.Checked then
    rdbDataBancoClick(self)
  else
  begin
    rdbDataRegistro.Checked := True;
    rdbDataRegistroClick(self);
  end;
  vgConciliacaoDataFlag := False;
end;

procedure TfrmConciliacaoData.rdbDataBancoClick(Sender: TObject);
begin
  rdbDataBanco.Font.Color    := clBlue;
  rdbDataRegistro.Font.Color := clBlack;
  vgConciliacaoDataAlterar   := True;
end;

procedure TfrmConciliacaoData.rdbDataRegistroClick(Sender: TObject);
begin
  rdbDataBanco.Font.Color    := clBlack;
  rdbDataRegistro.Font.Color := clBlue;
  vgConciliacaoDataAlterar   := False;
end;

end.
