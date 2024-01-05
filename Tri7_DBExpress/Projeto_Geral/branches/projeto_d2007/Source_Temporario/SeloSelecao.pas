unit SeloSelecao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, DB, DBClient,
  SimpleDS, cxVGrid, cxDBVGrid, cxControls, cxInplaceContainer, DBCGrids,
  cxContainer, cxLabel, cxDBLabel, StdCtrls, DBCtrls, Menus,
  cxLookAndFeelPainters, cxButtons, ExtCtrls, cxLookAndFeels, dxSkinBlueprint,
  dxSkinDarkRoom, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinHighContrast, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013White, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSpringTime,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

type
  TfrmSeloSelecao = class(TForm)
    dtsSeloItens: TDataSource;
    sqlSeloItens: TSimpleDataSet;
    DBCtrlGrid1: TDBCtrlGrid;
    DBText1: TDBText;
    sqlSeloItensSELO_LIVRO_ID: TFMTBCDField;
    Panel1: TPanel;
    sqlSeloItensNUMERO: TStringField;
    btnCancelar: TcxButton;
    btnConfirmar: TcxButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBText1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSeloSelecao: TfrmSeloSelecao;

implementation

uses Controles, SeloSelecionado, Rotinas;

{$R *.dfm}

procedure TfrmSeloSelecao.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSeloSelecao.btnConfirmarClick(Sender: TObject);
begin
  vgDadosSelo.Confirmado    := True;
  vgDadosSelo.SeloLivroId   := sqlSeloItensSELO_LIVRO_ID.AsString;
  vgDadosSelo.SeloAgrupador := TiraCaractere(sqlSeloItensNUMERO.AsString,'-');
  frmSeloSelecionado. lblSelo.Caption := sqlSeloItensNUMERO.aSString;
  Close;
end;

procedure TfrmSeloSelecao.DBText1Click(Sender: TObject);
begin
  btnConfirmarClick(Self);
end;

procedure TfrmSeloSelecao.FormActivate(Sender: TObject);
begin
  DBCtrlGrid1.SetFocus;
end;

procedure TfrmSeloSelecao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action         := caFree;
  frmSeloSelecao := nil;
end;

procedure TfrmSeloSelecao.FormCreate(Sender: TObject);
begin
  sqlSeloItens.Connection := dtmControles.DB;

  sqlSeloItens.Active := False;
  sqlSeloItens.DataSet.ParamByName('SELO_GRUPO_ID').AsBCD := vgDadosSelo.SeloGrupoId;
  sqlSeloItens.Active := True;
end;

end.