unit Atualizacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls,
  cxControls, cxContainer, cxEdit, cxLabel, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, frxClass, dxSkinsCore, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, cxProgressBar;

type
  TfrmAtualizacao = class(TForm)
    Panel1: TPanel;
    lblTexto: TcxLabel;
    Image1: TImage;
    cxProgress: TcxProgressBar;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure HabilitarProgressBar;
    procedure SetValorMaximoProgressBar(vpMax: Double);
    procedure AddProgressBar;
    procedure DesabilitarProgressBar;
  end;

var
  frmAtualizacao: TfrmAtualizacao;

implementation

{$R *.dfm}

{ TfrmAtualizacao }

procedure TfrmAtualizacao.AddProgressBar;
begin
  cxProgress.Position := frmAtualizacao.cxProgress.Position + 1;
  cxProgress.Refresh;
end;

procedure TfrmAtualizacao.DesabilitarProgressBar;
begin
  ClientHeight       := 175;
  cxProgress.Visible := False;
end;

procedure TfrmAtualizacao.FormCreate(Sender: TObject);
begin
  DesabilitarProgressBar;
end;

procedure TfrmAtualizacao.HabilitarProgressBar;
begin
  ClientHeight       := 200;
  cxProgress.Visible := Enabled;
end;

procedure TfrmAtualizacao.SetValorMaximoProgressBar(vpMax: Double);
begin
  cxProgress.Properties.Max := vpMax;
  cxProgress.Refresh;
end;

end.
