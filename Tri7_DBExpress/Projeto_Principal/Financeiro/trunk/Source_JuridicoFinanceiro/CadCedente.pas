unit CadCedente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, Menus, cxLookAndFeelPainters, FMTBcd, DB, DBClient,
  Provider, SqlExpr, ActnList, ComCtrls, StdCtrls, cxButtons, ExtCtrls,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxTextEdit, cxDBEdit, cxControls, cxContainer, cxEdit,
  cxLabel, cxGraphics, dxSkinscxPCPainter, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, cxPC, cxImageComboBox,
  cxMaskEdit, cxDropDownEdit, cxGroupBox, cxCheckBox, cxCurrencyEdit, cxSpinEdit,
  SimpleDS, cxCalendar, cxLookAndFeels, dxSkinBlueprint, dxSkinDarkRoom,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinHighContrast, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013White, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSpringTime,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxPCdxBarPopupMenu,
  cxNavigator, dxBarBuiltInMenu, DbxDevartInterBase, System.Actions;

type
  TfrmCadCedente = class(TfrmCadBasico)
    cxLabel1: TcxLabel;
    pgcGrid: TcxPageControl;
    tbcContas: TcxTabSheet;
    grdBasica: TcxGrid;
    grdBasicaDBTableView1: TcxGridDBTableView;
    grdBasicaLevel1: TcxGridLevel;
    grdBasicaDBTableView1Column1: TcxGridDBColumn;
    grdBasicaDBTableView1Column3: TcxGridDBColumn;
    grdBasicaDBTableView1Column5: TcxGridDBColumn;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    chbSituacao: TcxDBCheckBox;
    cxGroupBox6: TcxGroupBox;
    lblEndereco: TcxLabel;
    cxLabel34: TcxLabel;
    cxLabel35: TcxLabel;
    cxLabel36: TcxLabel;
    cxLabel38: TcxLabel;
    edtEndereco: TcxDBTextEdit;
    edtBairro: TcxDBTextEdit;
    edtCidade: TcxDBTextEdit;
    edtUF: TcxDBComboBox;
    edtCEP: TcxDBMaskEdit;
    cxLabel39: TcxLabel;
    cxDBTextEdit19: TcxDBTextEdit;
    ClientAncestralCEDENTE_ID: TBCDField;
    ClientAncestralSITUACAO: TStringField;
    ClientAncestralPRINCIPAL: TStringField;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralEND_LOG: TStringField;
    ClientAncestralEND_CEP: TStringField;
    ClientAncestralEND_CIDADE: TStringField;
    ClientAncestralEND_BAIRRO: TStringField;
    ClientAncestralEND_UF: TStringField;
    ClientAncestralEND_EMAIL: TStringField;
    ClientAncestralCNPJ_CPF: TStringField;
    ClientAncestralTELEFONE: TStringField;
    cxLabel2: TcxLabel;
    ClientAncestralRAZAO_SOCIAL: TStringField;
    edtRazao: TcxDBTextEdit;
    edtCPFCNPJ: TcxDBMaskEdit;
    edtDescricao: TcxDBTextEdit;
    cxDBTextEdit1: TcxDBTextEdit;
    popCedente: TPopupMenu;
    mniDefinirCentroCustoPrincipal: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure mniDefinirCentroCustoPrincipalClick(Sender: TObject);
  private
    procedure SetState (AState : TDataSetState);override;
    procedure LoadData; override;
  public
    { Public declarations }
  end;

var
  frmCadCedente: TfrmCadCedente;

implementation

uses Controles, Lookup, Rotinas, Principal, Lookup_Contabil, LookupFinanceiro;

{$R *.dfm}

procedure TfrmCadCedente.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  pgcGrid.ActivePageIndex := 0;
  edtDescricao.SetFocus;
end;

procedure TfrmCadCedente.ExecuteGravarExecute(Sender: TObject);
  procedure ValidarDados;
  begin
    if (ClientAncestralSITUACAO.AsString = 'I') and (ClientAncestralPRINCIPAL.AsString = 'S') then
    begin
      Application.MessageBox('O Cedente Principal n�o pode ser inativado!!!', 'Aten��o', MB_OK + MB_ICONWARNING);
      abort;
    end;

    VerificarPreenchimentoEDT_DB(edtDescricao.text,'Descri��o',edtDescricao);
    VerificarPreenchimentoEDT_DB(edtRazao.Text, 'Raz�o Social', edtRazao);
    VerificarPreenchimentoEDT_DB(edtEndereco.Text, 'Logradouro', edtEndereco);
    VerificarPreenchimentoEDT_DB(edtCidade.Text, 'Cidade', edtCidade);
    VerificarPreenchimentoCBX_DB(edtUF.Text, 'UF', edtUF);
    if ClientAncestralEND_CEP.AsString = '' then
    begin
      Application.MessageBox('CEP inv�lido!!!', 'Aten��o', MB_OK + MB_ICONWARNING);
      edtCEP.SetFocus;
      abort;
    end;

    if ClientAncestralCNPJ_CPF.AsString = '' then
    begin
      Application.MessageBox('CNPJ inv�lido!!!', 'Aten��o', MB_OK + MB_ICONWARNING);
      edtCPFCNPJ.SetFocus;
      abort;
    end;
  end;
begin

  ValidarDados;

  inherited;

  // Se existir somente um Cedente, seta ele como principal
  if ClientAncestral.RecordCount = 1 then
  begin
    ClientAncestral.Edit;
    ClientAncestralPRINCIPAL.AsString := 'S';
    ClientAncestral.ApplyUpdates(-1);
    frmPrincipal.AdvToolBarPager1.Refresh;
    frmPrincipal.Update;
  end;
end;

procedure TfrmCadCedente.ExecuteIncluirExecute(Sender: TObject);
begin
  inherited;
  pgcGrid.ActivePageIndex := 0;
  ClientAncestralSITUACAO.AsString := 'A';
  edtDescricao.SetFocus;
end;

procedure TfrmCadCedente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dtmLookup.AtualizarTabelas;
  dtmLookupFinanceiro.AtualizarTabelas;

  Action        := caFree;
  frmCadCedente := nil;
end;

procedure TfrmCadCedente.FormCreate(Sender: TObject);
begin
  inherited;
  vgNomeTabela    := 'J_CEDENTE';
  vgChavePrimaria := 'CEDENTE_ID';
end;

procedure TfrmCadCedente.LoadData;
begin
  ClientAncestral.Open;
  inherited;
end;

procedure TfrmCadCedente.mniDefinirCentroCustoPrincipalClick(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Definir Cedente selecionado como Principal?', 'Confirma��o', MB_YESNO) = IDNO then
    exit;

  ExecutaSqlAuxiliar(' UPDATE J_CEDENTE SET PRINCIPAL = '+QuotedStr('N'),1);
  ClientAncestral.Refresh;

  ClientAncestral.Edit;
  ClientAncestralPRINCIPAL.AsString := 'S';
  ClientAncestral.ApplyUpdates(-1);
end;

procedure TfrmCadCedente.SetState(AState: TDataSetState);
begin
  inherited;
  pgcGrid.Enabled := State = dsBrowse;
end;

end.
