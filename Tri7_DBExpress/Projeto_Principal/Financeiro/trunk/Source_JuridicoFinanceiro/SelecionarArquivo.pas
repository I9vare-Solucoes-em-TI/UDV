unit SelecionarArquivo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadastroAuxSimplificado, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, Menus,
  cxLookAndFeelPainters, FMTBcd, DB, DBClient, Provider, SqlExpr, StdCtrls,
  cxButtons, ExtCtrls, cxControls, cxContainer, cxEdit, cxLabel, cxCheckBox,
  cxDBEdit, cxTextEdit, cxGroupBox, cxGraphics, cxMaskEdit, cxDropDownEdit,
  cxImageComboBox, cxCalendar, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  ComCtrls, ShlObj, cxShellCommon, cxShellListView, cxShellTreeView, cxListView,
  cxShellBrowserDialog;

type
  TfrmSelecionarArquivo = class(TfrmCadastroAuxSimplificado)
    ClientAncestralPROCESSO_ANDAMENTO_ID: TFMTBCDField;
    ClientAncestralTIPO_ANDAMENTO_ID: TFMTBCDField;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralPROCESSO_ID: TFMTBCDField;
    ClientAncestralPROCESSO_TRAMITE_ID: TFMTBCDField;
    ClientAncestralDATA_ANDAMENTO: TSQLTimeStampField;
    ClientAncestralDATA_PUBLICACAO: TSQLTimeStampField;
    ClientAncestralDATA_CIRCULACAO: TSQLTimeStampField;
    cxShellTreeView1: TcxShellTreeView;
    cxShellListView: TcxShellListView;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConfirmarClick(Sender: TObject);
    procedure cxShellListViewDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    vlLocal : String;
  public
    { Public declarations }
  end;

var
  frmSelecionarArquivo: TfrmSelecionarArquivo;
  vgArquivosSelecionados : TStringList;

implementation

uses
  Lookup, Controles;

{$R *.dfm}

procedure TfrmSelecionarArquivo.btnConfirmarClick(Sender: TObject);
var
  i : Integer;
begin
  vgArquivosSelecionados := TStringList.Create;
  for i := 0 to cxShellListView.InnerListView.Items.Count - 1 do
  begin
    if cxShellListView.InnerListView.Items.Item[i].Selected then
      vgArquivosSelecionados.Add(cxShellTreeView1.AbsolutePath + '\'+ cxShellListView.InnerListView.Items.Item[i].Caption);
  end;
  vgDadosCadastro.PastaCarregada := cxShellTreeView1.AbsolutePath;
  inherited;
end;

procedure TfrmSelecionarArquivo.cxShellListViewDblClick(Sender: TObject);
begin
  inherited;
  btnConfirmarClick(self);
end;

procedure TfrmSelecionarArquivo.FormActivate(Sender: TObject);
begin
  inherited;
  if vgDadosCadastro.PastaCarregada <> '' then
    cxShellTreeView1.AbsolutePath := vgDadosCadastro.PastaCarregada;
  cxShellTreeView1.SetFocus;
end;

procedure TfrmSelecionarArquivo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmSelecionarArquivo := nil;
end;

end.
