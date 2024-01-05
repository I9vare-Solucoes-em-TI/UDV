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
  dxSkinscxPCPainter, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, I9Query;

type
  TfrmPessoaIgual = class(TfrmCadAuxiliar)
    cxGridRepresentante: TcxGrid;
    cxGridRepresentanteDBTableView1: TcxGridDBTableView;
    cxGridNome: TcxGridDBColumn;
    cxGriCpf: TcxGridDBColumn;
    cxGridDocumento: TcxGridDBColumn;
    cxGridCPFProptio: TcxGridDBColumn;
    cxGridRepresentanteLevel1: TcxGridLevel;
    ClientAncestralCPF_CNPJ: TStringField;
    ClientAncestralDOCUMENTO: TStringField;
    ClientAncestralPESSOA_ID: TBCDField;
    ClientAncestralCPF_TERCEIRO: TStringField;
    cxButton1: TcxButton;
    btnSelecionar: TcxButton;
    ClientAncestralNOME: TStringField;
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
    vpChave: Currency = 0;
    vpCpfNomeCampo: String = 'CPF_CNPJ'): Integer;

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

  function CampoCPFCNPJ(vpTipo: Integer): string;
  begin
    if vgPessoa.NomeTabela = 'D_PESSOA' then
    begin
      case vpTipo of
        1: Result := ' CPFCNPJ AS CPF_CNPJ, ';
        2: Result := ' CPFCNPJ ';
      end;
    end
    else
    begin
      case vpTipo of
        1: Result := ' CPF_CNPJ, ';
        2: Result := ' CPF_CNPJ ';
      end;
    end;
  end;

  function CampoCPF_TERCEIRO: string;
  begin
    Result := ', CPF_TERCEIRO';

    if vgPessoa.NomeTabela = 'D_PESSOA' then
      Result := ' , ''N'' AS CPF_TERCEIRO';
  end;

begin
  inherited;
  ClientAncestral.Active := False;
  if vgPessoa.NomeTabela = 'R_PESSOA' then
    cxGridCPFProptio.Visible := False;

  DataSetAncestral.SQL.Text := 'SELECT NOME, ' + CampoCPFCNPJ(1) + ' DOCUMENTO, '+
                                  ' PESSOA_ID ' + CampoCPF_TERCEIRO +
                                  ' FROM ' + vgPessoa.NomeTabela +
                                  ' WHERE ' + CampoCPFCNPJ(2) + ' = :CPF '+
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
    vpChave: Currency = 0;
    vpCpfNomeCampo: String = 'CPF_CNPJ'): Integer;
{$REGION 'Vari�veis'}
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
          viMensagem    := 'Cpf Inv�lido. Deseja Continuar!' + #13 + #13 + 'Prov�vel CPF Correto: '+ viCpfSugerido;
        end
        else viMensagem := 'Cpf Inv�lido. Deseja Continuar';

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
        if Application.MessageBox('CNPJ Inv�lido. Deseja Continuar?', 'Pergunta', mb_IconQuestion + mb_YesNo + MB_DEFBUTTON2) = idNo then
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
           ' WHERE '+vpCpfNomeCampo+' = '+ QuotedStr(vpCpf);

  // Busca ou n�o os registros que possuem cpf de terceiro
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