unit PessoaIgual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadAuxiliar, FMTBcd, DB, DBClient,
  Provider, SqlExpr, StdCtrls, cxButtons, ExtCtrls,

  cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxMaskEdit, Menus, MaskUtils, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxImageComboBox, dxSkinsCore,
  dxSkinCoffee, dxSkiniMaginary, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinscxPCPainter;

type
  TfrmPessoaIgual = class(TfrmCadAuxiliar)
    cxGridRepresentante: TcxGrid;
    cxGridRepresentanteDBTableView1: TcxGridDBTableView;
    cxGridNome: TcxGridDBColumn;
    cxGriCpf: TcxGridDBColumn;
    cxGridDocumento: TcxGridDBColumn;
    cxGridCPFProptio: TcxGridDBColumn;
    cxGridRepresentanteLevel1: TcxGridLevel;
    ClientAncestralNOME: TStringField;
    ClientAncestralCPF_CNPJ: TStringField;
    ClientAncestralDOCUMENTO: TStringField;
    ClientAncestralPESSOA_ID: TBCDField;
    ClientAncestralCPF_TERCEIRO: TStringField;
    cxButton1: TcxButton;
    btnSelecionar: TcxButton;
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cxGridRepresentanteDBTableView1DblClick(Sender: TObject);
    procedure cxGridRepresentanteDBTableView1KeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    vlCpfIgual : string; 
  end;

var
  vgNomePessoa : String;
  frmPessoaIgual: TfrmPessoaIgual;
  function PesquisarCpf(
    vpCpf: string;
    vpTabela: string;
    vpCampo: TcxCustomMaskEdit;
    vpMensagem: Boolean;
    vpCpfTerceiro: Boolean;
    vpChave: Currency = 0): Integer;

implementation

uses Controles, Rotinas;

{$R *.dfm}

procedure TfrmPessoaIgual.btnCancelarClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmPessoaIgual.btnSelecionarClick(Sender: TObject);
begin
  inherited;
  vgPessoa.PessoaId := ClientAncestralPESSOA_ID.AsInteger;
  close;
end;

procedure TfrmPessoaIgual.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action         := caFree;
  frmPessoaIgual := nil;
end;

procedure TfrmPessoaIgual.FormShow(Sender: TObject);
begin
  inherited;
  ClientAncestral.Active := False;
  if vgPessoa.NomeTabela = 'R_PESSOA' then
    cxGridCPFProptio.Visible := False;
  DataSetAncestral.SQL.Text := 'SELECT NOME, CPF_CNPJ, DOCUMENTO, '+
                                  ' PESSOA_ID, CPF_TERCEIRO '+
                                  ' FROM '+vgPessoa.NomeTabela+
                                  ' WHERE CPF_CNPJ = :CPF '+
                                  ' ORDER BY PESSOA_ID ';
  DataSetAncestral.ParamByName('CPF').AsString := vgPessoa.CPF_CNPJ;
  ClientAncestral.Active := True;
end;

procedure TfrmPessoaIgual.cxGridRepresentanteDBTableView1DblClick(
  Sender: TObject);
begin
  inherited;
  btnSelecionarClick(self);
end;

procedure TfrmPessoaIgual.cxGridRepresentanteDBTableView1KeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = 13 then
    btnSelecionarClick(self);
end;

function PesquisarCpf(
  vpCpf: string;
  vpTabela: string;
  vpCampo: TcxCustomMaskEdit;
  vpMensagem: Boolean;
  vpCpfTerceiro: Boolean;
  vpChave: Currency = 0): Integer;
{$REGION 'Variáveis'}
var
  viSql, viMensagem, viCpfSugerido : string;
{$ENDREGION}

  function SugerirCpf: Boolean;
  begin
    Result := dtmControles.BuscarConfig('CADASTRO_PESSOA', 'DOCUMENTO', 'SUGERIR_CPF', 'S') = 'S';
  end;

begin
  Result := 0;

  vpCpf := Trim(vpCpf);
  if vpCpf = '' then
  begin
    PesquisarCpf := -1;
    Exit;
  end;

  // Verifica Validade do CPF/CNPJ
  if vpMensagem then
  begin
    if Length(vpCpf) <= 11 then
    begin
      if not TestaCpf(vpCpf) then
      begin
        if SugerirCpf then
        begin
          viCpfSugerido := FormatMaskText('000.000.000-00;0', Copy(vpCpf, 1, 9) + vgCpfSugerido);
          viMensagem    := 'Cpf Inválido. Deseja Continuar!' + #13 + #13 + 'Provável CPF Correto: '+ viCpfSugerido;
        end
        else viMensagem := 'Cpf Inválido. Deseja Continuar';

        if Application.MessageBox(Pchar(viMensagem), 'Pergunta', mb_IconQuestion + mb_YesNo + MB_DEFBUTTON2) = idNo then
        begin
          vpCampo.SetFocus;
          Abort;
        end;
      end;
    end
    else
    begin
      if not TestaCnpj(vpCpf) then
        if Application.MessageBox('CNPJ Inválido. Deseja Continuar?', 'Pergunta', mb_IconQuestion + mb_YesNo + MB_DEFBUTTON2) = idNo then
        begin
          vpCampo.SetFocus;
          Abort;
        end;
    end;
  end;

  // Verifica se existe o CPF Cadastrado
  Screen.Cursor := crHourGlass;

  viSql := ' SELECT PESSOA_ID, NOME '+
           ' FROM '+vpTabela+
           ' WHERE CPF_CNPJ = '+ QuotedStr(vpCpf);

  // Busca ou não os registros que possuem cpf de terceiro
  if not vpCpfTerceiro then
    viSql := viSql +
             '  AND (CPF_TERCEIRO IS NULL '+
             '   OR CPF_TERCEIRO = '+ QuotedStr('N')+')';
  if vpChave > 0 then
    viSql := viSql + ' AND NOT PESSOA_ID = '+ CurrToStr(vpChave);

  ExecutaSimpleDSAux(viSql,0);

  if dtmControles.SimpleAuxiliar.IsEmpty then
    PesquisarCpf := 0
  else
    // Verifica se existe mais de um registro com este cpf
    if (dtmControles.SimpleAuxiliar.RecordCount > 1) then
    begin
      vgPessoa.CPF_CNPJ := vpCpf;
      vgPessoa.NomeTabela := vpTabela;
      ExibirFormulario(TfrmPessoaIgual,frmPessoaIgual, True);
      if vgPessoa.PessoaId > 0 then
        PesquisarCpf := vgPessoa.PessoaId
      else
      begin
        vpCampo.SetFocus;
        Screen.Cursor := crDefault;
        Abort;
      end;
    end
    else PesquisarCpf := dtmControles.SimpleAuxiliar.FieldByName('PESSOA_ID').AsInteger;

  Screen.Cursor := crDefault;
end;

end.
