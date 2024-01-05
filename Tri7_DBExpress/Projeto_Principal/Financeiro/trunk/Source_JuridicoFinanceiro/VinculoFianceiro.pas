unit VinculoFianceiro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TfrmVinculoFinaceiro = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVinculoFinaceiro: TfrmVinculoFinaceiro;

implementation

{$R *.dfm}

procedure TfrmVinculoFinaceiro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmNaoAssociado := nil;
end;

end.
