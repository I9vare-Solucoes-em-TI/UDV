unit Etiqueta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadAuxiliar, cxLookAndFeelPainters, FMTBcd, DB, DBClient,
  Provider, SqlExpr, StdCtrls, cxButtons, ExtCtrls, cxTextEdit, cxMaskEdit,
  cxSpinEdit, cxControls, cxContainer, cxEdit, cxGroupBox, frxClass,
  frxDBSet, cxLabel, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, Menus, dxSkinsCore, dxSkinsDefaultPainters, cxGraphics,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue, SimpleDS;

type
  TEtiqueta = Record
    EscreventeId, InicioEtiqueta, QtdEtiqueta, QtdImprimir, QtdImpressa,  ModeloEtiqueta : Integer;
    EscreventeNome, GrupoModeloEtiqueta : String;
  end;


  TfrmEtiqueta = class(TfrmCadAuxiliar)
    cbxInicio: TcxGroupBox;
    speInicio: TcxSpinEdit;
    ClientAncestralDOCUMENTO_ID: TFMTBCDField;
    ClientAncestralNUMERO_REGISTRO: TFMTBCDField;
    ClientAncestralLIVRO: TStringField;
    ClientAncestralNUMERO_PAGINAS: TFMTBCDField;
    ClientAncestralNUMERO_VIAS: TFMTBCDField;
    ClientAncestralDATA_REGISTRO: TSQLTimeStampField;
    ClientAncestralAPRESENTANTE: TStringField;
    ClientAncestralOBSERVACAO: TBlobField;
    ClientAncestralVALOR_DOCUMENTO: TFMTBCDField;
    ClientAncestralTAXA_JUDICIARIA: TFMTBCDField;
    ClientAncestralVALOR_CUSTAS: TFMTBCDField;
    ClientAncestralTIPO_DOCUMENTO_ID: TFMTBCDField;
    ClientAncestralEMOLUMENTO_ID: TFMTBCDField;
    ClientAncestralVALOR_TOTAL: TFMTBCDField;
    ClientAncestralLIVRO_NUMERO: TFMTBCDField;
    ClientAncestralLIVRO_PAGINA: TFMTBCDField;
    ClientAncestralNUMERO_PESSOAS: TFMTBCDField;
    ClientAncestralPAGINA_ID: TIntegerField;
    btnConfirmarItem: TcxButton;
    lcxEscrevente: TcxLookupComboBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    lcxModeloEtiqueta: TcxLookupComboBox;
    sqlModeloEtiqueta: TSimpleDataSet;
    sqlModeloEtiquetaDESCRICAO: TStringField;
    sqlModeloEtiquetaTEXTO: TBlobField;
    sqlModeloEtiquetaMARCACAO_TIPO_ID: TFMTBCDField;
    dtsModeloEtiqueta: TDataSource;
    cxGroupBox1: TcxGroupBox;
    speQtd: TcxSpinEdit;
    procedure btnConfirmarItemClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure lcxEscreventeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private

  public
    { Public declarations }
  end;

var
  frmEtiqueta: TfrmEtiqueta;
  vgEtiqueta : TEtiqueta;

implementation

uses Lookup, Controles;

{$R *.dfm}

procedure TfrmEtiqueta.btnConfirmarItemClick(Sender: TObject);
begin
  inherited;
  if (speInicio.Value > vgEtiqueta.QtdEtiqueta) or (speInicio.Value < 1) then
  begin
    Application.MessageBox('Início da Impressão de Etiqueta inválido!!!', 'Atenção', MB_OK + MB_ICONWARNING);
    speInicio.SetFocus;
    Exit;
  end;

  vgEtiqueta.EscreventeId   := lcxEscrevente.EditValue;
  vgEtiqueta.EscreventeNome := lcxEscrevente.Text;
  vgEtiqueta.InicioEtiqueta := speInicio.EditValue;
  vgEtiqueta.QtdImprimir    := speQtd.EditValue;
  vgEtiqueta.ModeloEtiqueta := lcxModeloEtiqueta.EditValue;
  Close;
end;

procedure TfrmEtiqueta.btnCancelarClick(Sender: TObject);
begin
  vgEtiqueta.InicioEtiqueta := -1;
  close;
end;

procedure TfrmEtiqueta.FormActivate(Sender: TObject);
begin
  inherited;
  lcxEscrevente.EditValue := vgEtiqueta.EscreventeId;
  speInicio.EditValue     := vgEtiqueta.InicioEtiqueta;
  speQtd.EditValue        := vgEtiqueta.QtdImprimir;

  if cbxInicio.Enabled then
       speInicio.SetFocus
  else btnConfirmarItem.SetFocus;
end;

procedure TfrmEtiqueta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  sqlModeloEtiqueta.Close;
  Action := caFree;
  frmEtiqueta := nil;
end;

procedure TfrmEtiqueta.FormCreate(Sender: TObject);
var
  viTextoPadraoEtiqueta : String;
begin
  inherited;
  sqlModeloEtiqueta.Connection :=  dtmControles.DB;

  sqlModeloEtiqueta.Active := False;
  sqlModeloEtiqueta.DataSet.ParamByName('GRUPO_MODELO').AsString := vgEtiqueta.GrupoModeloEtiqueta;
  sqlModeloEtiqueta.Active := True;

  speQtd.Enabled    := vgEtiqueta.QtdEtiqueta > 1;
  speInicio.Enabled := vgEtiqueta.QtdEtiqueta > 1;
  cbxInicio.Enabled := speInicio.Enabled;

  viTextoPadraoEtiqueta := dtmControles.BuscarConfig('SELO','ETIQUETA','TEXTO_PADRAO_ETIQUETA','S');
  if viTextoPadraoEtiqueta = '' then
       lcxModeloEtiqueta.EditValue := sqlModeloEtiquetaMARCACAO_TIPO_ID.AsInteger
  else lcxModeloEtiqueta.EditValue := StrToInt(viTextoPadraoEtiqueta);
end;

procedure TfrmEtiqueta.lcxEscreventeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = 13 then
    btnConfirmarItemClick(Self);
end;

end.
