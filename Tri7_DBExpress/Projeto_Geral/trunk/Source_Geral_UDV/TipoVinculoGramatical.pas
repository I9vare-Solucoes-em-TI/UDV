unit TipoVinculoGramatical;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, SimpleDS, cxButtons, cxContainer, cxListBox,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinBlack, dxSkinCaramel, dxSkinCoffee, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinOffice2007Black, Menus, DBClient,
  StdCtrls, cxEdit;

type
  TfrmTipoVinculoGramatical = class(TForm)
    Panel1: TPanel;
    Shape1: TShape;
    lbxTipoVinculo: TcxListBox;
    dtsVinculoGramatical: TDataSource;
    sqlVinculoGramatical: TSimpleDataSet;
    sqlVinculoGramaticalVALOR: TStringField;
    sqlVinculoGramaticalDESCRICAO: TStringField;
    sqlVinculoGramaticalTEXTO: TBlobField;
    btnCancelar: TcxButton;
    btnSelecionar: TcxButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure lbxTipoVinculoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    vgTipoGramatical : Integer;

  end;

var
  frmTipoVinculoGramatical: TfrmTipoVinculoGramatical;

implementation

uses Controles;

{$R *.dfm}

procedure TfrmTipoVinculoGramatical.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmTipoVinculoGramatical.btnSelecionarClick(Sender: TObject);
begin
  vgTipoGramatical := lbxTipoVinculo.ItemIndex;
  ModalResult      := 1;
end;

procedure TfrmTipoVinculoGramatical.FormActivate(Sender: TObject);
begin
  lbxTipoVinculo.SetFocus;
  lbxTipoVinculo.ItemIndex := 0;
end;

procedure TfrmTipoVinculoGramatical.lbxTipoVinculoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
    btnSelecionarClick(self);
end;

procedure TfrmTipoVinculoGramatical.FormCreate(Sender: TObject);
begin
  sqlVinculoGramatical.Active := False;
  sqlVinculoGramatical.DataSet.ParamByName('SISTEMA_ID').AsInteger := vgId;
  sqlVinculoGramatical.Active := True;

  lbxTipoVinculo.Items.Clear;
  While not sqlVinculoGramatical.Eof do
  begin
    lbxTipoVinculo.Items.Add(sqlVinculoGramaticalDESCRICAO.AsString);
    sqlVinculoGramatical.Next;
  end;
end;

procedure TfrmTipoVinculoGramatical.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sqlVinculoGramatical.Close;
end;

end.
