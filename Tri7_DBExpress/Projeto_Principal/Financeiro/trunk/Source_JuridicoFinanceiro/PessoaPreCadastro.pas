unit PessoaPreCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadAuxiliar, cxLookAndFeelPainters, StdCtrls, cxButtons,
  ExtCtrls, FMTBcd, DB, DBClient, Provider, SqlExpr, cxLabel, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxDBEdit, cxImageComboBox, Menus, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinOffice2007Blue, dxSkinscxPCPainter, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue,
  cxLookAndFeels, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, cxNavigator;

type
  TfrmPessoaPreCadastro = class(TfrmCadAuxiliar)
    cxGridRepresentante: TcxGrid;
    cxGridRepresentanteDBTableView1: TcxGridDBTableView;
    cxGridNome: TcxGridDBColumn;
    cxGriCpf: TcxGridDBColumn;
    cxGridDocumento: TcxGridDBColumn;
    cxGridRepresentanteLevel1: TcxGridLevel;
    edtNome: TcxTextEdit;
    cxLabel14: TcxLabel;
    ClientAncestralNOME: TStringField;
    ClientAncestralCPFCNPJ: TStringField;
    ClientAncestralDOCUMENTO: TStringField;
    ClientAncestralPESSOA_ID: TFMTBCDField;
    btnSelecionar: TcxButton;
    btnCadastrar: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure edtNomePropertiesChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure cxGridRepresentanteDBTableView1DblClick(Sender: TObject);
    procedure cxGridRepresentanteDBTableView1KeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure edtNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    
  end;

var
  frmPessoaPreCadastro: TfrmPessoaPreCadastro;

implementation

uses Controles;

{$R *.dfm}

procedure TfrmPessoaPreCadastro.FormActivate(Sender: TObject);
begin
  inherited;
  edtNome.EditValue := vgPessoa.Nome;
end;

procedure TfrmPessoaPreCadastro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ClientAncestral.close;
  vgPessoa.Nome := '';

  Action         := caFree;
  frmCadAuxiliar := nil;
end;

procedure TfrmPessoaPreCadastro.btnSelecionarClick(Sender: TObject);
begin
  inherited;
  vgPessoa.PessoaId := ClientAncestralPESSOA_ID.AsInteger;
  Close;
end;

procedure TfrmPessoaPreCadastro.btnCadastrarClick(Sender: TObject);
begin
  inherited;
  vgPessoa.PessoaId := 0;
  vgPessoa.CadastrarNovo := trim(edtNome.Text);
  close;
end;

procedure TfrmPessoaPreCadastro.edtNomePropertiesChange(Sender: TObject);
var
  viSql : string;
begin
  inherited;
  if trim(edtNome.Text) = '' then
  begin
    ClientAncestral.Close;
    exit;
  end;

  with ClientAncestral do
  begin
    ClientAncestral.Close;

    viSql := ' SELECT FIRST 50 NOME, CPFCNPJ, DOCUMENTO, PESSOA_ID '+
             ' FROM J_PESSOA '+
             ' WHERE NOME LIKE '+ QuotedStr(edtNome.Text+'%');

    viSql := viSql + ' ORDER BY NOME ';
    DataSetAncestral.CommandText := viSql;
    ClientAncestral.Open;

    if ClientAncestral.IsEmpty then
         btnSelecionar.Enabled := False
    else btnSelecionar.Enabled := True;
  end;
end;

procedure TfrmPessoaPreCadastro.btnCancelarClick(Sender: TObject);
begin
  vgPessoa.PessoaId := -1;
  inherited;
end;

procedure TfrmPessoaPreCadastro.cxGridRepresentanteDBTableView1DblClick(
  Sender: TObject);
begin
  inherited;
  if not ClientAncestral.IsEmpty then
    btnSelecionarClick(self);
end;

procedure TfrmPessoaPreCadastro.cxGridRepresentanteDBTableView1KeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = 13 then
    cxGridRepresentante.SetFocus;
end;

procedure TfrmPessoaPreCadastro.edtNomeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (trim(edtNome.Text) <> '') and (key = 13) then
    btnCadastrarClick(self);
end;

end.
