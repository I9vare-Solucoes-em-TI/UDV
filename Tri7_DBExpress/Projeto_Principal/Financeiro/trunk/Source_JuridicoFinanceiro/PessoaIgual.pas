unit PessoaIgual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadAuxiliar, cxLookAndFeelPainters, FMTBcd, DB, DBClient,
  Provider, SqlExpr, StdCtrls, cxButtons, ExtCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxImageComboBox, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxMaskEdit, Menus, dxSkinsCore, dxSkinsDefaultPainters, MaskUtils,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter;

type
  TfrmPessoaIgual = class(TfrmCadAuxiliar)
    cxGridRepresentante: TcxGrid;
    cxGridRepresentanteDBTableView1: TcxGridDBTableView;
    cxGridNome: TcxGridDBColumn;
    cxGriCpf: TcxGridDBColumn;
    cxGridDocumento: TcxGridDBColumn;
    cxGridCPFProptio: TcxGridDBColumn;
    cxGridRepresentanteLevel1: TcxGridLevel;
    btnSelecionar: TcxButton;
    ClientAncestralNOME: TStringField;
    ClientAncestralCPF_CNPJ: TStringField;
    ClientAncestralDOCUMENTO: TStringField;
    ClientAncestralPESSOA_ID: TFMTBCDField;
    ClientAncestralCPF_TERCEIRO: TStringField;
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cxGridRepresentanteDBTableView1DblClick(Sender: TObject);
    procedure cxGridRepresentanteDBTableView1KeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    vlCpfIgual : string; 
  end;

var
  vgNomePessoa : String;
  frmPessoaIgual: TfrmPessoaIgual;
  function PesquisarCpf(vpCpf, vpTabela  : string; vpCampo : TcxCustomMaskEdit; vpMensagem, vpCpfTerceiro : Boolean;
           vpChave : Currency = 0)   : Integer;

implementation

uses Controles, Rotinas;

{$R *.dfm}

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
  DataSetAncestral.CommandText := 'SELECT NOME, CPF_CNPJ, DOCUMENTO, '+
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

function PesquisarCpf(vpCpf, vpTabela: string;  vpCampo: TcxCustomMaskEdit; vpMensagem, vpCpfTerceiro: Boolean;  vpChave: Currency): Integer;
var
  viSql, viMensagem, viCpfSugerido : string;
begin
  vpCpf := trim(vpCpf);
  if vpCpf = '' then
  begin
    PesquisarCpf := -1;
    exit;
  end;

  // Verifica Validade do CPF/CNPJ
  if vpMensagem then
  begin
    if Length(vpCpf) <= 11 then
    begin
      if not TestaCpf(vpCpf) then
      begin
        if (dtmControles.BuscarConfig('CADASTRO_PESSOA', 'DOCUMENTO', 'SUGERIR_CPF', 'S') = 'S') then
        begin
          viCpfSugerido := FormatMaskText('000.000.000-00;0', copy(vpCpf,1,9) + vgCpfSugerido);
          viMensagem := 'Cpf Inválido. Deseja Continuar!'+#13+#13+'Provável CPF Correto: '+ viCpfSugerido;
        end
        else viMensagem := 'Cpf Inválido. Deseja Continuar';

        if Application.MessageBox(Pchar(viMensagem), 'Pergunta', mb_IconQuestion + mb_YesNo + MB_DEFBUTTON2) = idNo then
        begin
          vpCampo.SetFocus;
          abort;
        end;
      end;
    end
    else
    begin
      if not TestaCnpj(vpCpf) then
        if Application.MessageBox('CNPJ Inválido. Deseja Continuar?', 'Pergunta', mb_IconQuestion + mb_YesNo + MB_DEFBUTTON2) = idNo then
        begin
          vpCampo.SetFocus;
          abort;
        end;
    end;
  end;

  // Verifica se existe o CPF Cadastrado
  Screen.Cursor := crHourGlass;

  viSql := ' SELECT PESSOA_ID, NOME '+
           ' FROM '+vpTabela+
           ' WHERE CPFCNPJ = '+ QuotedStr(vpCpf);

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
        abort;
      end;
    end
    else PesquisarCpf := dtmControles.SimpleAuxiliar.FieldByName('PESSOA_ID').AsInteger;

  Screen.Cursor := crDefault;
end;

end.
