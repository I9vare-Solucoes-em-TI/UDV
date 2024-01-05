unit PessoaPesquisaAux;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CadastroAuxSimplificado, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, Data.FMTBcd, Data.DB, Datasnap.DBClient, Datasnap.Provider,
  Data.SqlExpr, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxLabel;

type
  TfrmPessoaPesquisaAux = class(TfrmCadastroAuxSimplificado)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPessoaPesquisaAux: TfrmPessoaPesquisaAux;

implementation

{$R *.dfm}

procedure TfrmPessoaPesquisaAux.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  Action := caFree;
  frmCadastroRapidoContas := nil;
end;

end.
