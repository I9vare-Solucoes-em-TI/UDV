unit Desktop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, frxClass;

type
  TfrmDesktop = class(TForm)
    Image1: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDeactivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDesktop: TfrmDesktop;

implementation

uses LookupFinanceiro;

{$R *.dfm}

procedure TfrmDesktop.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmDesktop := nil;
end;

procedure TfrmDesktop.FormDeactivate(Sender: TObject);
begin
  if vgPermanecerDesktop then
    exit;

  Close;
end;

end.
