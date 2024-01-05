unit CadastroAuxSimplificado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxCheckBox, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, ExtCtrls,
  cxControls, cxContainer, cxEdit, cxLabel, cxSpinEdit, cxGraphics,
  cxImageComboBox, cxCurrencyEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxGroupBox, FMTBcd, DB, DBClient, Provider, SqlExpr;

type

  TfrmCadastroAuxSimplificado = class(TForm)
    Panel2: TPanel;
    Bevel4: TBevel;
    lblInformaca: TcxLabel;
    Panel4: TPanel;
    imgTitulo: TImage;
    Panel1: TPanel;
    DataSetAncestral: TSQLDataSet;
    ProviderAncestral: TDataSetProvider;
    ClientAncestral: TClientDataSet;
    SourceAncestral: TDataSource;
    btnCancelar: TcxButton;
    btnConfirmar: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  frmCadastroAuxSimplificado: TfrmCadastroAuxSimplificado;

implementation

uses Controles, LookupJuridico, Lookup_Contabil, Lookup;

{$R *.dfm}

procedure TfrmCadastroAuxSimplificado.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmCadastroAuxSimplificado.btnConfirmarClick(Sender: TObject);
begin
  vgDadosCadastro.Confirmado := True;
  if vgDadosCadastro.SomentePesquisa then
    Close
  else
  begin
    if ClientAncestral.State in [dsInsert] then
      ClientAncestral.Fields[0].AsInteger := dtmControles.GerarSequencia(vgDadosCadastro.Tabela);
    ClientAncestral.ApplyUpdates(-1);
    vgDadosCadastro.ChaveIdPrincipal := ClientAncestral.Fields[0].AsInteger;
    Close;
  end;
end;

procedure TfrmCadastroAuxSimplificado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  vgDadosCadastro.SomentePesquisa := False;

  Action := caFree;
  frmCadastroAuxSimplificado := nil;
end;

procedure TfrmCadastroAuxSimplificado.FormCreate(Sender: TObject);
begin
  vgDadosCadastro.Confirmado := False;

  if vgDadosCadastro.SomentePesquisa then
    exit;

  ClientAncestral.Active := False;
  DataSetAncestral.CommandText := 'SELECT * FROM '+vgDadosCadastro.Tabela + ' WHERE '+ vgDadosCadastro.CampoId +' = :'+vgDadosCadastro.CampoId;

  if vgDadosCadastro.ChaveIdPrincipal > 0 then
  begin
    DataSetAncestral.Params[0].AsBCD := vgDadosCadastro.ChaveIdPrincipal;
    ClientAncestral.Active := True;
    ClientAncestral.Edit;
  end
  else
  begin
    DataSetAncestral.Params[0].AsBCD := 0;
    ClientAncestral.Active := True;
    ClientAncestral.Insert;
  end;

end;

end.