unit CadPessoaFuncao;

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
  cxNavigator;

type
  TfrmCadPessoaFuncao = class(TfrmCadBasico)
    cxLabel1: TcxLabel;
    grdBasica: TcxGrid;
    cxGridPesquisa: TcxGridDBTableView;
    cxGridPesquisaColumn1: TcxGridDBColumn;
    grdBasicaLevel1: TcxGridLevel;
    cxGridPesquisaColumn3: TcxGridDBColumn;
    lblSigla: TcxLabel;
    cxGridPesquisaColumn4: TcxGridDBColumn;
    edtDescricao: TcxDBTextEdit;
    edtValor: TcxDBCurrencyEdit;
    chbSituacao: TcxDBCheckBox;
    ClientAncestralPESSOA_FUNCAO_ID: TBCDField;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralVALOR: TBCDField;
    ClientAncestralSITUACAO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure ClientAncestralBeforePost(DataSet: TDataSet);
  private

  public
    { Public declarations }
    procedure SetState (AState : TDataSetState);override;
    procedure LoadData; override;
  end;

var
  frmCadPessoaFuncao: TfrmCadPessoaFuncao;

implementation

uses Rotinas, Lookup, Controles, Lookup_Contabil;

{$R *.dfm}

procedure TfrmCadPessoaFuncao.ClientAncestralBeforePost(DataSet: TDataSet);
begin
  inherited;
  if State in [dsInsert] then
    ClientAncestral.FieldByName('PESSOA_FUNCAO_ID').AsCurrency := dtmControles.GerarSequencia('J_PESSOA_FUNCAO');
end;

procedure TfrmCadPessoaFuncao.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

procedure TfrmCadPessoaFuncao.ExecuteGravarExecute(Sender: TObject);
begin
  VerificarPreenchimentoEDT_DB(edtDescricao.text,'Descrição',edtDescricao);
  if ClientAncestralVALOR.AsVariant = null then
    ClientAncestralVALOR.AsCurrency := 0 ;

  inherited;
end;

procedure TfrmCadPessoaFuncao.ExecuteIncluirExecute(Sender: TObject);
begin
  inherited;
  ClientAncestralSITUACAO.AsString    := 'A';
  edtDescricao.SetFocus;
end;

procedure TfrmCadPessoaFuncao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dtmLookupContabil.AtualizarTabelas;
  inherited;
  Action               := caFree;
  frmCadPessoaFuncao := nil;
end;

procedure TfrmCadPessoaFuncao.FormCreate(Sender: TObject);
begin
  vgNomeTabela    := 'J_PESSOA_FUNCAO';
  vgChavePrimaria := 'PESSOA_FUNCAO_ID';
  inherited;

  cxGridPesquisa.DataController.Groups.FullExpand;
end;

procedure TfrmCadPessoaFuncao.LoadData;
begin
  ClientAncestral.Open;
  State := dsBrowse;
  SetState(State);
end;

procedure TfrmCadPessoaFuncao.SetState(AState: TDataSetState);
begin
  State := AState;
  CheckState;
  grdBasica.Enabled         := State = dsBrowse;
end;

end.
