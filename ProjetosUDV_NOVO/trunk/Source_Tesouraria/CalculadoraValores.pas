unit CalculadoraValores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CadastroAuxSimplificado, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, Data.FMTBcd, Data.DB, Datasnap.DBClient, Datasnap.Provider,
  Data.SqlExpr, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxLabel, FrameCalculadora;

type
  TfrmCalculadoraValores = class(TfrmCadastroAuxSimplificado)
    fmeCalculadora1: TfmeCalculadora;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCalculadoraValores: TfrmCalculadoraValores;

implementation

{$R *.dfm}

procedure TfrmCalculadoraValores.FormActivate(Sender: TObject);
begin
  inherited;
  fmeCalculadora1.CarregarDadosSalvo;
  fmeCalculadora1.rdbRegistrarQtdClick(Self);
end;

procedure TfrmCalculadoraValores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmCalculadoraValores := nil;
end;

end.
