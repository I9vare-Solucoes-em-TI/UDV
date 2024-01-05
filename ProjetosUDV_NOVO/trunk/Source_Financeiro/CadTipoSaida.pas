unit CadTipoSaida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, Menus, cxLookAndFeelPainters, FMTBcd, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, cxDBEdit, cxCurrencyEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxImageComboBox, cxContainer, cxLabel, ExtCtrls, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxPC, DBClient, Provider, SqlExpr,
  ActnList, ComCtrls, StdCtrls, cxButtons, FrameEditorSimples, cxSplitter,
  cxLookAndFeels, dxSkinBlueprint, dxSkinDarkRoom, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinHighContrast, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSpringTime, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  cxNavigator, System.Actions;

type
  TfrmCadTipoSaida = class(TfrmCadBasico)
    cxLabel1: TcxLabel;
    grdBasica: TcxGrid;
    cxGridPesquisa: TcxGridDBTableView;
    cxGridPesquisaColumn1: TcxGridDBColumn;
    grdBasicaLevel1: TcxGridLevel;
    cxGridPesquisaColumn3: TcxGridDBColumn;
    cxGridPesquisaColumn4: TcxGridDBColumn;
    ClientAncestralTIPO_DESPESA_ID: TFMTBCDField;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralINTERNO: TStringField;
    ClientAncestralPESSOA_ID: TFMTBCDField;
    ClientAncestralEXIGE_RESPONSAVEL: TStringField;
    cxLabel2: TcxLabel;
    ClientAncestralSITUACAO: TStringField;
    edtDescricao: TcxDBTextEdit;
    lcxResponsavel: TcxDBLookupComboBox;
    chbSituacao: TcxDBCheckBox;
    chxExigeResponsavel: TcxDBCheckBox;
    chxPadraoSistema: TcxDBCheckBox;
    cxButton3: TcxButton;
    cxGridPesquisaColumn2: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure ClientAncestralBeforePost(DataSet: TDataSet);
    procedure cxButton3Click(Sender: TObject);
    procedure ClientAncestralAfterScroll(DataSet: TDataSet);
  private

  public
    { Public declarations }
    procedure SetState (AState : TDataSetState);override;
    procedure LoadData; override;
  end;

var
  frmCadTipoSaida: TfrmCadTipoSaida;

implementation

uses Rotinas, Lookup, Controles, Lookup_Contabil;

{$R *.dfm}

procedure TfrmCadTipoSaida.ClientAncestralAfterScroll(DataSet: TDataSet);
begin
  inherited;
  cxBtnExcluir.Enabled := ClientAncestralINTERNO.AsString <> 'S';
end;

procedure TfrmCadTipoSaida.ClientAncestralBeforePost(DataSet: TDataSet);
begin
  inherited;
  if State in [dsInsert] then
    ClientAncestral.FieldByName('TIPO_DESPESA_ID').AsCurrency := dtmControles.GerarSequencia('J_TIPO_DESPESA');
end;

procedure TfrmCadTipoSaida.cxButton3Click(Sender: TObject);
begin
  inherited;
  ClientAncestralEXIGE_RESPONSAVEL.AsVariant := NULL;
end;

procedure TfrmCadTipoSaida.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  chbSituacao.Enabled  := ClientAncestralINTERNO.AsString <> 'S';
  edtDescricao.Enabled := ClientAncestralINTERNO.AsString <> 'S';

  if edtDescricao.Enabled then
       edtDescricao.SetFocus
  else lcxResponsavel.SetFocus;
end;

procedure TfrmCadTipoSaida.ExecuteGravarExecute(Sender: TObject);
begin
  VerificarPreenchimentoEDT_DB(edtDescricao.text,'Descrição',edtDescricao);

  if chxExigeResponsavel.Checked then
    VerificarPreenchimentoLCX_DB(lcxResponsavel.Text, 'Responsável',lcxResponsavel);

  ClientAncestralDESCRICAO.AsString := MaiusculoMinusculo(ClientAncestralDESCRICAO.AsString);

  inherited;
end;

procedure TfrmCadTipoSaida.ExecuteIncluirExecute(Sender: TObject);
begin
  inherited;
  ClientAncestralSITUACAO.AsString           := 'A';
  ClientAncestralINTERNO.AsString            := 'N';
  ClientAncestralEXIGE_RESPONSAVEL.AsString  := 'N';
  edtDescricao.SetFocus;
end;

procedure TfrmCadTipoSaida.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dtmLookupContabil.AtualizarTabelas;
  inherited;
  Action          := caFree;
  frmCadTipoSaida := nil;
end;

procedure TfrmCadTipoSaida.FormCreate(Sender: TObject);
begin
  vgNomeTabela    := 'J_TIPO_DESPESA';
  vgChavePrimaria := 'TIPO_DESPESA_ID';
  inherited;

  cxGridPesquisa.DataController.Groups.FullExpand;
end;

procedure TfrmCadTipoSaida.LoadData;
begin
  ClientAncestral.Open;
  State := dsBrowse;
  SetState(State);
end;

procedure TfrmCadTipoSaida.SetState(AState: TDataSetState);
begin
  State := AState;
  CheckState;
  grdBasica.Enabled  := State = dsBrowse;
end;

end.

