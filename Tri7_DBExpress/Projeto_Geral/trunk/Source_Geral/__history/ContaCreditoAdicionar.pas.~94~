unit ContaCreditoAdicionar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadAuxiliar,
  Menus,









  FMTBcd, DB, DBClient, Provider, SqlExpr,
  StdCtrls, cxButtons, ExtCtrls, cxControls, cxContainer, cxEdit,
  cxLabel, cxTextEdit, cxMaskEdit, cxCurrencyEdit, cxGroupBox, cxDropDownEdit,
  cxCalendar, ComCtrls, cxImageComboBox, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, dxCore, cxDateUtils;

type
  TfrmContaCreditoAdicionar = class(TfrmCadAuxiliar)
    Shape2: TShape;
    cxLabel23: TcxLabel;
    cxLabel2: TcxLabel;
    edtParteTipoCPFCNPJ: TcxComboBox;
    edtParteCPFCNPJ: TcxMaskEdit;
    btnBuscarCPFPessoa: TcxButton;
    edtDataCadastro: TcxDateEdit;
    edtNomePessoa: TcxTextEdit;
    rdbSelecionarRelaizar: TRadioButton;
    gbxDadosDeposito: TcxGroupBox;
    cxLabel12: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    cxGroupBox1: TcxGroupBox;
    edtSaldo: TcxCurrencyEdit;
    cxLabel4: TcxLabel;
    btnConfirmar: TcxButton;
    edtValor: TcxCurrencyEdit;
    icxOperacao: TcxImageComboBox;
    edtDescricao: TcxTextEdit;
    edtObservacao: TcxTextEdit;
    rdbDevolucao: TRadioButton;
    btnSelecionar: TcxButton;
    btnCancelarSelecao: TcxButton;
    cxLabel5: TcxLabel;
    procedure btnBuscarCPFPessoaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure edtParteTipoCPFCNPJPropertiesChange(Sender: TObject);
    procedure rdbSelecionarRelaizarClick(Sender: TObject);
    procedure rdbDevolucaoClick(Sender: TObject);
    procedure edtParteCPFCNPJKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnCancelarSelecaoClick(Sender: TObject);
  private
    vgVerificarSaldo : Boolean;
    procedure LimparCampos; 
  public
    { Public declarations }
  end;

var
  frmContaCreditoAdicionar: TfrmContaCreditoAdicionar;

implementation

uses ContaCredito, Controles;

{$R *.dfm}

procedure TfrmContaCreditoAdicionar.btnBuscarCPFPessoaClick(Sender: TObject);
begin
  inherited;
  if edtParteCPFCNPJ.EditValue = null then
  begin
    Application.MessageBox(PChar(edtParteTipoCPFCNPJ.Text+' não pode ser vazio'), 'Atenção', mb_Ok + MB_ICONEXCLAMATION);
    exit;
  end;

  if PesquisarPessoaContaCredito(edtParteCPFCNPJ.EditValue) then
  begin
    LimparCampos;
    if vgVerificarSaldo then
      edtSaldo.EditValue        := VerificarSaldoContaCliente(edtParteCPFCNPJ.EditValue, '', '');

    if vgDadosContaCredito.Selecionar then
    begin
      btnSelecionar.Enabled       := True;
      btnCancelarSelecao.Enabled  := True;
    end;

    rdbDevolucao.Enabled        := edtSaldo.EditValue > 0;
    edtNomePessoa.EditValue     := vgDadosContaCredito.Nome;
    edtDataCadastro.Date        := vgDadosContaCredito.DataAbertura;
    edtNomePessoa.Enabled       := False;
    edtParteTipoCPFCNPJ.Enabled := False;
    edtParteCPFCNPJ.Enabled     := False;
    gbxDadosDeposito.Visible    := True;
    gbxDadosDeposito.Enabled    := True;
    if not vgDadosContaCredito.Selecionar then
         rdbSelecionarRelaizarClick(self)
    else
    begin
      btnSelecionar.SetFocus;
      exit;
    end;
  end
  else
  begin
    if not vgDadosContaCredito.Selecionar then
    begin
      if Application.MessageBox('Cliente não possui Conta Crédito. Deseja Abrir?', 'Pergunta', mb_IconQuestion + mb_YesNo + MB_DEFBUTTON1) = idNo then
      begin
        edtParteCPFCNPJ.SetFocus;
        exit;
      end;
    end
    else
    begin
      btnSelecionar.Enabled       := False;
      btnCancelarSelecao.Enabled  := False;
      Application.MessageBox('Cliente não possui Conta Crédito!!!', 'Atenção', mb_Ok + MB_ICONEXCLAMATION);
      edtParteCPFCNPJ.SetFocus;
      exit;
    end;

    LimparCampos;
    edtSaldo.EditValue       := 0;
    edtNomePessoa.Enabled    := True;
    edtDataCadastro.EditValue:= dtmControles.DataHoraBanco(3);
    edtNomePessoa.SetFocus;
    gbxDadosDeposito.Visible := True;
    gbxDadosDeposito.Enabled := True;
  end;

  if not vgDadosContaCredito.Selecionar then
    Height := 384;

  btnCancelar.Visible           := True;
  btnConfirmar.Visible          := True;
  rdbSelecionarRelaizar.Enabled := True;
  rdbDevolucao.Enabled          := True;
  btnConfirmar.Enabled          := True;
  btnCancelarSelecao.Visible    := vgDadosContaCredito.Selecionar;  
end;

procedure TfrmContaCreditoAdicionar.btnCancelarSelecaoClick(Sender: TObject);
begin
  inherited;
  vgDadosContaCredito.ContaSelecionadaId := 0; 
  Close;
end;

procedure TfrmContaCreditoAdicionar.btnConfirmarClick(Sender: TObject);
var
  viMensagem : String;
begin
  inherited;
  VerificarPreenchimentoEDT_TX(edtNomePessoa.Text, 'Nome', edtNomePessoa);
  VerificarPreenchimentoICX_TX(icxOperacao.Text, 'Operação', icxOperacao);
  VerificarPreenchimentoEDT_TX(edtDescricao.Text, 'Descrição', edtDescricao);

  if edtValor.EditValue <= 0 then
  begin
    Application.MessageBox('O Valor não pode ser zerado!!!', 'Atenção', mb_Ok + MB_ICONEXCLAMATION);
    edtValor.SetFocus;
    exit;
  end;

  if (icxOperacao.ItemIndex = 1) and ((edtValor.EditValue > edtSaldo.EditValue)) then
  begin
    Application.MessageBox('Saldo insuficiente para esta operação!!!', 'Atenção', mb_Ok + MB_ICONEXCLAMATION);
    edtValor.SetFocus;
    exit;
  end;

  if vgDadosContaCredito.ContaClienteId = 0 then
       viMensagem := 'Confirma Abertura da Conta Crédito e Depósito de '+FormatFloat(',#0.00', edtValor.EditValue)
  else viMensagem := 'Confirma Depósito de '+FormatFloat(',#0.00', edtValor.EditValue) + ' na Conta Crédito do Cliente '+ #13+#13+
                      edtNomePessoa.Text+'?';

  if Application.MessageBox(Pchar(viMensagem), 'Pergunta', mb_IconQuestion + mb_YesNo + MB_DEFBUTTON1) = idNo then
    exit;

  vgDadosContaCredito.CPF_CNPJ     := edtParteCPFCNPJ.EditValue;
  vgDadosContaCredito.Nome         := edtNomePessoa.Text;
  vgDadosContaCredito.Observacao   := edtObservacao.Text;
  vgDadosContaCredito.Descricao    := edtDescricao.Text;
  vgDadosContaCredito.DataAbertura := edtDataCadastro.Date;
  vgDadosContaCredito.Valor        := edtValor.EditValue;
  vgDadosContaCredito.DataHistorico:= dtmControles.DataHoraBanco(3);
  vgDadosContaCredito.Operacao     := icxOperacao.EditValue;
  vgDadosContaCredito.TipoServico  := '23';

  if vgDadosContaCredito.ContaClienteId = 0 then
    RegistrarNovaContaCliente;

  RegistrarCaixa;
  RegistrarEntradaSaidaContaCliente;
  Close;
end;

procedure TfrmContaCreditoAdicionar.btnSelecionarClick(Sender: TObject);
begin
  inherited;
  vgDadosContaCredito.Saldo := edtSaldo.EditValue;
  vgDadosContaCredito.Nome  := edtNomePessoa.Text;
  close;
end;

procedure TfrmContaCreditoAdicionar.edtParteCPFCNPJKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = 13 then
  begin
    btnBuscarCPFPessoa.SetFocus;
    btnBuscarCPFPessoaClick(self);
  end;
end;

procedure TfrmContaCreditoAdicionar.edtParteTipoCPFCNPJPropertiesChange(
  Sender: TObject);
begin
  inherited;
  if edtParteTipoCPFCNPJ.ItemIndex = 0 then
      edtParteCPFCNPJ.Properties.EditMask := '999\.999\.999\-99;0;_'
  else
    if edtParteTipoCPFCNPJ.ItemIndex = 1 then
          edtParteCPFCNPJ.Properties.EditMask := '99\.999\.999\/9999\-99;0;_'
     else edtParteCPFCNPJ.Properties.EditMask := '';
  edtParteCPFCNPJ.Enabled := edtParteTipoCPFCNPJ.ItemIndex <= 1 ;
end;

procedure TfrmContaCreditoAdicionar.FormActivate(Sender: TObject);
var
  viCpfCNPJ : String;
begin
  inherited;
  vgVerificarSaldo := True;
  LimparCampos;
  edtParteCPFCNPJ.Clear;
  gbxDadosDeposito.Visible := False;

  if (vgDadosContaCredito.Tabela <> '') then
  begin
    edtSaldo.EditValue := VerificarSaldoContaCliente('', vgDadosContaCredito.Tabela, vgDadosContaCredito.Campo);
    if vgDadosContaCredito.ContaSelecionadaId > 0 then
    begin
      viCpfCNPJ := dtmControles.GetStr('SELECT CPF_CNPJ FROM C_CONTA_CLIENTE WHERE CONTA_CLIENTE_ID = '+ IntToStr(vgDadosContaCredito.ContaSelecionadaId));
      if Length(viCpfCNPJ) > 11 then
           edtParteTipoCPFCNPJ.ItemIndex := 1
      else edtParteTipoCPFCNPJ.ItemIndex := 0;
      edtParteCPFCNPJ.EditValue := viCpfCNPJ;
      vgVerificarSaldo := False;
      btnBuscarCPFPessoaClick(self);
      exit;
    end;
  end;

  edtParteCPFCNPJ.SetFocus;
end;

procedure TfrmContaCreditoAdicionar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  vgDadosContaCredito.Selecionar := False;
  Action                         := caFree;
  frmContaCreditoAdicionar       := nil;
end;

procedure TfrmContaCreditoAdicionar.FormCreate(Sender: TObject);
begin
  inherited;
  btnSelecionar.Visible         := vgDadosContaCredito.Selecionar;
  rdbSelecionarRelaizar.Enabled := False;
  rdbDevolucao.Enabled          := False;
  edtNomePessoa.Enabled         := False;
  btnCancelar.Visible           := False;
  btnConfirmar.Visible          := False;
  Height := 147
end;

procedure TfrmContaCreditoAdicionar.LimparCampos;
begin
  edtNomePessoa.Clear;
  edtValor.EditValue := 0 ;
  edtDescricao.Clear;
  edtObservacao.Clear;
  edtDataCadastro.Clear;
  edtValor.Clear;
end;

procedure TfrmContaCreditoAdicionar.rdbDevolucaoClick(Sender: TObject);
begin
  inherited;
  edtValor.Enabled      := False;
  edtValor.EditValue    := edtSaldo.EditValue;
  icxOperacao.EditValue := 'D';
  icxOperacao.Enabled   := False;
  edtDescricao.Enabled  := False;
  edtDescricao.EditValue:= 'Devolução do saldo remanescente na conta cliente.';
  edtObservacao.SetFocus;
end;

procedure TfrmContaCreditoAdicionar.rdbSelecionarRelaizarClick(Sender: TObject);
begin
  inherited;
  edtValor.Clear;
  edtDescricao.Clear;
  gbxDadosDeposito.Enabled := True;
  edtValor.Enabled         := True;
  edtDescricao.Enabled     := True;
  icxOperacao.Enabled      := True;
  edtValor.SetFocus;
end;

end.
