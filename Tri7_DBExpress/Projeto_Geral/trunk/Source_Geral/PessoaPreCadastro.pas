unit PessoaPreCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadAuxiliar, StdCtrls, cxButtons,
  ExtCtrls, FMTBcd, DB, DBClient, Provider, SqlExpr, cxLabel, cxControls,
  cxContainer, cxEdit, cxTextEdit,

  cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, Menus, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxDBData, cxMaskEdit, cxImageComboBox,
  dxSkinsCore, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinscxPCPainter, dxSkinCaramel, dxSkinCoffee, dxSkiniMaginary;

type
  TfrmPessoaPreCadastro = class(TfrmCadAuxiliar)
    lblNome: TcxLabel;
    cxGridRepresentante: TcxGrid;
    cxGridRepresentanteDBTableView1: TcxGridDBTableView;
    cxGridNome: TcxGridDBColumn;
    cxGriCpf: TcxGridDBColumn;
    cxGridDocumento: TcxGridDBColumn;
    cxGridRepresentanteLevel1: TcxGridLevel;
    ClientAncestralNOME: TStringField;
    ClientAncestralCPF_CNPJ: TStringField;
    ClientAncestralDOCUMENTO: TStringField;
    ClientAncestralPESSOA_TIPO: TStringField;
    ClientAncestralPESSOA_ID: TFMTBCDField;
    cxGridCPFProptio: TcxGridDBColumn;
    ClientAncestralCPF_TERCEIRO: TStringField;
    edtNome: TcxTextEdit;
    btnCadastrar: TcxButton;
    btnSelecionar: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure edtNomePropertiesChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
  edtNome.SetFocus;
end;

procedure TfrmPessoaPreCadastro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ClientAncestral.close;
  Action         := caFree;
  frmCadAuxiliar := nil;
end;

procedure TfrmPessoaPreCadastro.btnSelecionarClick(Sender: TObject);
begin
  inherited;
  vgPessoa.PessoaId := ClientAncestralPESSOA_ID.AsInteger;
  close;
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
    CASE Controles.vgId OF
     1 : // Registro de Im�veis
          viSql := ' SELECT NOME, CPF_CNPJ, DOCUMENTO, PESSOA_TIPO, PESSOA_ID, CPF_TERCEIRO '+
                   ' FROM R_PESSOA '+
                   ' WHERE NOME LIKE '+ QuotedStr(edtNome.Text+'%');
     2 : // Tabelionato de Notas
          viSql := ' SELECT FIRST 50 NOME, CPF_CNPJ, DOCUMENTO, PESSOA_TIPO, PESSOA_ID, CPF_TERCEIRO '+
                   ' FROM T_PESSOA '+
                   ' WHERE NOME LIKE '+ QuotedStr(edtNome.Text+'%');
     12 : // Registro Civil
          viSql := ' SELECT FIRST 50 NOME, CPF_CNPJ, DOCUMENTO, PESSOA_TIPO, PESSOA_ID, CPF_TERCEIRO '+
                   ' FROM V_PESSOA '+
                   ' WHERE NOME LIKE '+ QuotedStr(edtNome.Text+'%');
    END;

    if vgPessoa.ConjugeRepresentante = 'C' then
    begin
      // Somente para Conjuge
      viSql := viSql + ' AND NOT PESSOA_ID = '+ IntToStr(vgPessoa.NotPessoaId) +
                       ' AND (PESSOA_TIPO = '+ QuotedStr(vgPessoa.PessoaTipo) +
                       ' OR PESSOA_TIPO IS NULL)';

      // Filtro do Sexo
      if (vgPessoa.Sexo = 'M') or (vgPessoa.Sexo = '') then
           viSql := viSql + ' AND (SEXO = '+ QuotedStr('F')+ ' OR SEXO IS NULL)'
      else viSql := viSql + ' AND (SEXO = '+ QuotedStr('M')+ ' OR SEXO IS NULL)';
    end
    else
      // Somente para Representante
      if vgPessoa.ConjugeRepresentante = 'R' then
      begin
        viSql := viSql + ' AND NOT PESSOA_ID = ' + IntToStr(vgPessoa.NotPessoaId) +
          ' AND (PESSOA_TIPO = ' + QuotedStr('F')+' OR PESSOA_TIPO = ' +
          QuotedStr('J')+ ' OR PESSOA_TIPO IS NULL)';
      end
      else viSql := viSql + ' AND (PESSOA_TIPO = '+ QuotedStr(vgPessoa.PessoaTipo) + ' OR PESSOA_TIPO IS NULL)';

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

procedure TfrmPessoaPreCadastro.FormShow(Sender: TObject);
begin
  inherited;
  edtNome.Left := 56;
  edtNome.Width := 622;
  if vgPessoa.ConjugeRepresentante = 'C' then
  begin
    lblNome.Caption := 'C�njuge:';
    Caption := 'Pr�-Cadastro C�njuge';
  end
  else if vgPessoa.ConjugeRepresentante = 'R' then
  begin
    lblNome.Caption := 'Representante:';
    Caption := 'Pr�-Cadastro Representante';
    edtNome.Left := 86;
    edtNome.Width := 592;
  end
  else
  begin
    Caption         := 'Pr�-Cadastro Pessoa';
    lblNome.Caption := 'Nome:';
  end;
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
