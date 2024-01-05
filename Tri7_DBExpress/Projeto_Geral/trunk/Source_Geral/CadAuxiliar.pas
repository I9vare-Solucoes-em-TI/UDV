unit CadAuxiliar;

interface

uses
  I9Query,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, DBClient, cxButtons, Provider, SqlExpr,
  Menus, Data.FMTBcd, Vcl.StdCtrls, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinMcSkin, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinsDefaultPainters;

type
  TfrmCadAuxiliar = class(TForm)
    Panel1: TPanel;
    Shape1: TShape;
    DataSetAncestral: TI9Query;
    ProviderAncestral: TDataSetProvider;
    ClientAncestral: TClientDataSet;
    SourceAncestral: TDataSource;
    btnCancelar: TcxButton;
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  frmCadAuxiliar: TfrmCadAuxiliar;

implementation



{$R *.dfm}

procedure TfrmCadAuxiliar.btnCancelarClick(Sender: TObject);
begin
  close;
end;

end.
