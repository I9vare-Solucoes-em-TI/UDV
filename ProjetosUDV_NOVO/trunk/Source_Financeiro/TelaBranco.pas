unit TelaBranco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, Vcl.ExtCtrls;

type
  TfrmTelaBranco = class(TForm)
    Image1: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTelaBranco: TfrmTelaBranco;

implementation

{$R *.dfm}

procedure TfrmTelaBranco.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmTelaBranco := nil;
end;

end.
