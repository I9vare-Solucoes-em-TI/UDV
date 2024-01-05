unit CadContaBancaria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CadBasico, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, Data.FMTBcd, Data.DB, Datasnap.DBClient,
  Datasnap.Provider, Data.SqlExpr, System.Actions, Vcl.ActnList, Vcl.ComCtrls,
  Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxControls, cxContainer, cxEdit,
  cxLabel, cxTextEdit, cxDBEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxGroupBox;

type
  TfrmCadContaBancaria = class(TfrmCadBasico)
    ClientAncestralBANCO_ID: TFMTBCDField;
    ClientAncestralBANCO_NUMERO: TStringField;
    ClientAncestralBANCO_DIGITO: TStringField;
    ClientAncestralBANCO_NOME: TStringField;
    ClientAncestralAGENCIA_NOME: TStringField;
    ClientAncestralAGENCIA_DIGITO: TStringField;
    ClientAncestralAGENCIA_NUMERO: TStringField;
    ClientAncestralCONTA_NUMERO: TStringField;
    ClientAncestralCONTA_DIGITO: TStringField;
    ClientAncestralAGENCIA_UF: TStringField;
    ClientAncestralCONVENIO: TStringField;
    ClientAncestralCODIGO_CEDENTE_NUMERO: TStringField;
    ClientAncestralCODIGO_CEDENTE_DIGITO: TStringField;
    ClientAncestralNOSSO_NUMERO: TFMTBCDField;
    ClientAncestralCARTEIRA: TStringField;
    cxLabel1: TcxLabel;
    cxLabel10: TcxLabel;
    cxGridBancoDBTableView1: TcxGridDBTableView;
    cxGridBancoLevel1: TcxGridLevel;
    cxGridBanco: TcxGrid;
    cxGridBancoDBTableView1BANCO_NOME: TcxGridDBColumn;
    cxGridBancoDBTableView1AGENCIA_NOME: TcxGridDBColumn;
    cxGridBancoDBTableView1CONVENIO: TcxGridDBColumn;
    cxGridBancoDBTableView1CODIGO_CEDENTE_NUMERO: TcxGridDBColumn;
    cxGridBancoDBTableView1CARTEIRA: TcxGridDBColumn;
    ClientAncestralCONFIG_RELATORIO_ID: TFMTBCDField;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    ClientAncestralCEDENTE_ID: TFMTBCDField;
    ClientAncestralMODALIDADE: TStringField;
    ClientAncestralLOCAL_PADRAO: TStringField;
    ClientAncestralLOCAL_REMESSA: TStringField;
    cxLabel4: TcxLabel;
    cxLabel13: TcxLabel;
    cxBANCO_NOME: TcxDBTextEdit;
    cxBANCO_NUMERO: TcxDBTextEdit;
    cxBANCO_DIGITO: TcxDBTextEdit;
    cxAGENCIA_NOME: TcxDBTextEdit;
    cxAGENCIA_NUMERO: TcxDBTextEdit;
    cxAGENCIA_DIGITO: TcxDBTextEdit;
    cxAGENCIA_UF: TcxDBComboBox;
    cxCONVENIO: TcxDBTextEdit;
    cxCARTEIRA: TcxDBTextEdit;
    cxCODIGO_CEDENTE_NUMERO: TcxDBTextEdit;
    cxCODIGO_CEDENTE_DIGITO: TcxDBTextEdit;
    cxDBTextEdit1: TcxDBTextEdit;
    cxCONTA_NUMERO: TcxDBTextEdit;
    cxCONTA_DIGITO: TcxDBTextEdit;
    cxGroupBox1: TcxGroupBox;
    cxLabel6: TcxLabel;
    edtLocalBoleto: TcxDBTextEdit;
    cxLabel7: TcxLabel;
    edtLocalRemessa: TcxDBTextEdit;
    lcxCedente: TcxDBLookupComboBox;
    lcxLayout: TcxDBLookupComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ClientAncestralBeforePost(DataSet: TDataSet);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ValidarDados;
    procedure SetState (AState : TDataSetState);override;
  public
    { Public declarations }
  end;

var
  frmCadContaBancaria: TfrmCadContaBancaria;

implementation

uses
  Controles, Lookup, LookupFinanceiro;

{$R *.dfm}

procedure TfrmCadContaBancaria.ClientAncestralBeforePost(DataSet: TDataSet);
begin
  inherited;
  if State in [dsInsert] then
    ClientAncestral.FieldByName('BANCO_ID').AsCurrency := dtmControles.GerarSequencia('J_BANCO');
end;

procedure TfrmCadContaBancaria.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  cxBANCO_NOME.SetFocus;
end;

procedure TfrmCadContaBancaria.ExecuteGravarExecute(Sender: TObject);
begin
  ValidarDados;
  inherited;
end;

procedure TfrmCadContaBancaria.ExecuteIncluirExecute(Sender: TObject);
begin
  inherited;
  cxBANCO_NOME.SetFocus;
end;

procedure TfrmCadContaBancaria.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ClientAncestral.Close;
  Action := caFree;
  frmCadContaBancaria := nil;
end;

procedure TfrmCadContaBancaria.FormCreate(Sender: TObject);
begin
  inherited;
  DataSetAncestral.SQLConnection := dtmControles.DB;
  ClientAncestral.Open;
end;

procedure TfrmCadContaBancaria.SetState(AState: TDataSetState);
begin
  inherited;
  cxGridBanco.Enabled    := State = dsBrowse;
end;

procedure TfrmCadContaBancaria.ValidarDados;
begin
  VerificarPreenchimentoEDT_DB(cxBANCO_NOME.Text,'Descri��o Banco',cxBANCO_NOME);
  VerificarPreenchimentoEDT_DB(cxBANCO_NUMERO.Text,'N�mero do Banco', cxBANCO_NUMERO);
  VerificarPreenchimentoEDT_DB(cxBANCO_DIGITO.Text,'D�gito do Banco ', cxBANCO_DIGITO);
  VerificarPreenchimentoEDT_DB(cxAGENCIA_NOME.Text,'Descri��o Ag�ncia',cxAGENCIA_NOME);
  VerificarPreenchimentoEDT_DB(cxAGENCIA_NUMERO.Text,'N�mero da Ag�ncia', cxAGENCIA_NUMERO);
  VerificarPreenchimentoCBX_DB(cxAGENCIA_UF.Text,'UF Ag�ncia',cxAGENCIA_UF);
  VerificarPreenchimentoEDT_DB(cxCARTEIRA.Text,'Carteira', cxCARTEIRA);
  VerificarPreenchimentoEDT_DB(edtLocalBoleto.Text, 'Local Grava��o do Boleto', edtLocalBoleto);
  VerificarPreenchimentoEDT_DB(edtLocalRemessa.Text, 'Local Grava��o do Boleto', edtLocalRemessa);
  VerificarPreenchimentoLCX_DB(lcxCedente.Text,'Vinculo do Cedente', lcxCedente);
  VerificarPreenchimentoLCX_DB(lcxLayout.Text, 'Layout Padr�o do Boleto', lcxLayout);
end;

end.
