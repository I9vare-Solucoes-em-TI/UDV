unit SelecionarAssociado;

interface

uses
  I9Query,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  ExtCtrls, cxContainer, cxLabel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, DBClient, SimpleDS, cxCheckBox, cxLookAndFeels,
  dxSkinBlueprint, dxSkinDarkRoom, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinHighContrast, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSpringTime, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  cxNavigator, Data.DBXInterBase, frxClass, DbxDevartInterBase;

type
  TAssociado = Record
    Selecao : String;
    Flag : Boolean;
  End;

  TfrmSelecionarAssociado = class(TForm)
    cxGrid1: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridLevel3: TcxGridLevel;
    cxGridDBTableView3Column1: TcxGridDBColumn;
    cxGridDBTableView3Column2: TcxGridDBColumn;
    Panel2: TPanel;
    Bevel4: TBevel;
    lblInformacaoLancamento: TcxLabel;
    Panel4: TPanel;
    imgReceber: TImage;
    Panel1: TPanel;
    sqlAssociadosAtivos: TI9Query;
    dtsAssociadosAtivos: TDataSource;
    sqlAssociadosAtivosselecionar: TBooleanField;
    sqlAssociadosAtivosNOME: TStringField;
    sqlAssociadosAtivosPESSOA_ID: TBCDField;
    cxGridDBTableView3Column3: TcxGridDBColumn;
    sqlAssociadosAtivosGRAU: TStringField;
    btnConfirmarCompromisso: TcxButton;
    cxButton1: TcxButton;
    procedure btnConfirmarCompromissoClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cxGridDBTableView3CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure cxGridDBTableView3Column2PropertiesChange(Sender: TObject);
    procedure cxGridDBTableView3Column2HeaderClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelecionarAssociado: TfrmSelecionarAssociado;
  vgAssociado : TAssociado;

implementation

uses Controles, Lookup, Lookup_Contabil;

{$R *.dfm}

procedure TfrmSelecionarAssociado.btnConfirmarCompromissoClick(Sender: TObject);
begin
  sqlAssociadosAtivos.DisableControls;
  sqlAssociadosAtivos.First;
  vgAssociado.Selecao := '';
  while not sqlAssociadosAtivos.eof do
  begin
    if sqlAssociadosAtivosselecionar.AsBoolean then
    begin
      if vgAssociado.Selecao = '' then
           vgAssociado.Selecao := sqlAssociadosAtivosPESSOA_ID.AsString
      else vgAssociado.Selecao := vgAssociado.Selecao + ', '+ sqlAssociadosAtivosPESSOA_ID.AsString;
    end;
    sqlAssociadosAtivos.Next;    
  end;
  vgAssociado.Flag := True;
  close;
end;

procedure TfrmSelecionarAssociado.cxButton1Click(Sender: TObject);
begin
  vgAssociado.Flag := False;
  close;
end;

procedure TfrmSelecionarAssociado.cxGridDBTableView3Column2HeaderClick(
  Sender: TObject);
begin
  sqlAssociadosAtivos.Filtered := False;
  sqlAssociadosAtivos.Filter   := cxGridDBTableView3.DataController.Filter.FilterText;
  sqlAssociadosAtivos.Filtered := True;

  dtmLookup.MarcarDesmarcarCompromissos(sqlAssociadosAtivos, not sqlAssociadosAtivosselecionar.AsBoolean);
  sqlAssociadosAtivos.Filtered := False;
end;

procedure TfrmSelecionarAssociado.cxGridDBTableView3Column2PropertiesChange(
  Sender: TObject);
begin
  sqlAssociadosAtivos.Post;
end;

procedure TfrmSelecionarAssociado.cxGridDBTableView3CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.RecordViewInfo.GridRecord.Values[1] = True then
    ACanvas.Font.Color := clRed;
end;

procedure TfrmSelecionarAssociado.FormActivate(Sender: TObject);
begin
  dtmLookup.MarcarDesmarcarCompromissos(sqlAssociadosAtivos, False);
end;

procedure TfrmSelecionarAssociado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sqlAssociadosAtivos.Active  := False;
  Action                      := caFree;
  frmSelecionarAssociado      := nil
end;

procedure TfrmSelecionarAssociado.FormCreate(Sender: TObject);
begin
  sqlAssociadosAtivos.Connection := dtmControles.DB;

  sqlAssociadosAtivos.Active := False;
  sqlAssociadosAtivos.ParamByName('CEDENTE_ID').AsBCD := vgCedenteAtivo;
  sqlAssociadosAtivos.Active := True;
end;

end.
