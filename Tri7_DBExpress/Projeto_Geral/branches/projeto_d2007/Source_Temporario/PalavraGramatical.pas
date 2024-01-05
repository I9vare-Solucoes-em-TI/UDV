unit PalavraGramatical;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, DB, DBClient, SimpleDS,
  StdCtrls, cxButtons, cxLabel, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxGroupBox, cxDBEdit, Menus, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue;

type
  TfrmPalavraGramatical = class(TForm)
    Panel1: TPanel;
    sqlGramatica: TSimpleDataSet;
    dtsPalavraGramatical: TDataSource;
    sqlGramaticaGRAMATICA_ID: TFMTBCDField;
    sqlGramaticaPALAVRA: TStringField;
    sqlGramaticaPREFIXO: TStringField;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    Shape1: TShape;
    sqlGramaticaSUFIXO_MS: TStringField;
    sqlGramaticaSUFIXO_MP: TStringField;
    sqlGramaticaSUFIXO_FS: TStringField;
    sqlGramaticaSUFIXO_FP: TStringField;
    Label1: TLabel;
    edtPalavra: TcxDBTextEdit;
    edtPrefixo: TcxDBTextEdit;
    cxGroupBox1: TcxGroupBox;
    Panel2: TPanel;
    cxLabel3: TcxLabel;
    ediSufixoMS: TcxDBTextEdit;
    cxLabel4: TcxLabel;
    edtSufixoMP: TcxDBTextEdit;
    Panel3: TPanel;
    cxLabel5: TcxLabel;
    edtSufixoFS: TcxDBTextEdit;
    cxLabel6: TcxLabel;
    edtSufixoFP: TcxDBTextEdit;
    btnGravar: TcxButton;
    btnCancelar: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sqlGramaticaBeforePost(DataSet: TDataSet);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    vgTipoMarcacao, vgMarcacaoDisplay, vgMarcacaoInterna : string;
    vgConferencia : Boolean;

  end;

var
  frmPalavraGramatical: TfrmPalavraGramatical;

implementation

uses Controles;

{$R *.dfm}

procedure TfrmPalavraGramatical.FormCreate(Sender: TObject);
begin
  sqlGramatica.Connection := dtmControles.DB;
  sqlGramatica.Active     := True;
  sqlGramatica.Insert;
  vgMarcacaodisplay := '';
end;

procedure TfrmPalavraGramatical.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPalavraGramatical.FormActivate(Sender: TObject);
begin
  edtPrefixo.SetFocus;
end;

procedure TfrmPalavraGramatical.sqlGramaticaBeforePost(
  DataSet: TDataSet);
begin
  sqlGramatica.FieldByName('GRAMATICA_ID').AsCurrency :=  dtmControles.GerarSequencia('G_GRAMATICA');
end;

procedure TfrmPalavraGramatical.btnGravarClick(Sender: TObject);
begin
  sqlGramatica.ApplyUpdates(-1);
end;

end.
