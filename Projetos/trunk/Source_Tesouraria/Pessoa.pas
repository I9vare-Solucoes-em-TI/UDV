unit Pessoa;

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
  dxSkinscxPCPainter, cxGraphics, cxDBEdit, cxGroupBox, cxDropDownEdit,
  cxMaskEdit, cxImageComboBox, cxTextEdit, cxContainer, cxEdit, cxLabel, cxPC,
  cxControls, DB, DBClient, Provider, SqlExpr, ActnList, ComCtrls, StdCtrls,
  cxButtons, ExtCtrls, cxCalendar, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, Buttons, cxCheckBox, cxLookAndFeels, dxSkinBlueprint,
  dxSkinDarkRoom, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinHighContrast, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013White, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSpringTime,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxPCdxBarPopupMenu,
  dxBarBuiltInMenu, System.Actions;

type
  TfrmCadPessoaUDV = class(TfrmCadBasico)
    ClientAncestralPESSOA_ID: TBCDField;
    ClientAncestralNOME: TStringField;
    ClientAncestralCPF: TStringField;
    ClientAncestralRG: TStringField;
    ClientAncestralENDERECO: TStringField;
    ClientAncestralBAIRRO: TStringField;
    ClientAncestralCIDADE: TStringField;
    ClientAncestralUF: TStringField;
    ClientAncestralTELEFONES: TStringField;
    ClientAncestralEMAIL: TStringField;
    ClientAncestralGRAU: TStringField;
    ClientAncestralSITUACAO: TStringField;
    ClientAncestralCEDENTE_ID: TBCDField;
    ClientAncestralSEXO: TStringField;
    ClientAncestralTIPO: TStringField;
    ClientAncestralOBSERVACAO: TStringField;
    ClientAncestralDATA_CADASTRO: TSQLTimeStampField;
    ClientAncestralBOLETO_EMAIL: TStringField;
    ClientAncestralCEP: TStringField;
    ClientAncestralPESSOA_GRUPO_ID: TBCDField;
    btnUltimo: TcxButton;
    btnProximo: TcxButton;
    btnAnterior: TcxButton;
    btnPrimeiro: TcxButton;
    ClientAncestralCODIGO_UDV: TStringField;
    pgcDados: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    pnlDadosPessoais: TPanel;
    Bevel2: TBevel;
    lblEndereco: TcxLabel;
    cxLabel34: TcxLabel;
    cxLabel35: TcxLabel;
    cxLabel36: TcxLabel;
    lblTelefone: TcxLabel;
    cxLabel38: TcxLabel;
    cxLabel30: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    icxSexo: TcxDBImageComboBox;
    edtCPFCNPJ: TcxDBMaskEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    edtEndereco: TcxDBTextEdit;
    cxDBTextEdit15: TcxDBTextEdit;
    cxDBTextEdit16: TcxDBTextEdit;
    cxDBComboBox3: TcxDBComboBox;
    cxDBMaskEdit1: TcxDBMaskEdit;
    edtTelefone: TcxDBMaskEdit;
    Panel2: TPanel;
    Bevel1: TBevel;
    sbnLimparFiltro: TSpeedButton;
    btnAdGrupo: TSpeedButton;
    cxLabel29: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel11: TcxLabel;
    edtData: TcxDBDateEdit;
    edtNome: TcxDBTextEdit;
    icxGrau: TcxDBImageComboBox;
    icxSituacao: TcxDBImageComboBox;
    cxLabel10: TcxLabel;
    lblEmailOutroAssociado: TcxLabel;
    ClientAncestralEMAIL_TERCEIRO: TStringField;
    ClientAncestralPESSOA_TERCEIRO_ID: TBCDField;
    lcxGrupo: TcxDBLookupComboBox;
    edtEmailGrupo: TcxTextEdit;
    icxBoleto: TcxImageComboBox;
    chxEmailOutroAssociado: TcxDBCheckBox;
    edtEmail: TcxDBTextEdit;
    lcxOutroAssociado: TcxDBLookupComboBox;
    edtEmailOutroAssociado: TcxTextEdit;
    cxDBTextEdit1: TcxDBTextEdit;
    lbllInformacao: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure lcxGrupoPropertiesEditValueChanged(Sender: TObject);
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ExecuteCancelarExecute(Sender: TObject);
    procedure btnAdGrupoClick(Sender: TObject);
    procedure ClientAncestralAfterScroll(DataSet: TDataSet);
    procedure sbnLimparFiltroClick(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure chxEmailOutroAssociadoClick(Sender: TObject);
    procedure lcxOutroAssociadoPropertiesEditValueChanged(Sender: TObject);
    procedure chxEmailOutroAssociadoPropertiesEditValueChanged(Sender: TObject);
  private
    vlPermRotinaAux : String;
    vlAlterando : Boolean;
    procedure SetState (AState : TDataSetState);override;
    procedure LoadData; override;
  public

  end;

var
  frmCadPessoaUDV: TfrmCadPessoaUDV;
  vgNovoCadastro, vgSelecionado : Boolean;

implementation

uses Rotinas, Controles, Lookup, Pesquisa, PessoaPreCadastro, Cadastro;


{$R *.dfm}

{ TfrmCadPessoa }

procedure TfrmCadPessoaUDV.btnAdGrupoClick(Sender: TObject);
begin
  inherited;
  vlPermRotinaAux := vgPermissaoRotina;
  vgChaveRetorno := -1;
  vgHabilitarSelecionarGrupo := True;
  CadGrupoFamiliar(True);
  if vgChaveRetorno > 0 then
    ClientAncestralPESSOA_GRUPO_ID.AsInteger := vgChaveRetorno;
  vgPermissaoRotina := vlPermRotinaAux;
end;

procedure TfrmCadPessoaUDV.btnAnteriorClick(Sender: TObject);
begin
  inherited;
  ClientAncestral.Prior;
  btnProximo.Enabled   := True;
  btnUltimo.Enabled    := True;
  btnAnterior.Enabled  := ClientAncestral.RecNo > 1;
  btnPrimeiro.Enabled  := ClientAncestral.RecNo > 1;
end;

procedure TfrmCadPessoaUDV.btnPrimeiroClick(Sender: TObject);
begin
  inherited;
  ClientAncestral.First;
  btnProximo.Enabled   := True;
  btnUltimo.Enabled    := True;
  btnAnterior.Enabled  := ClientAncestral.RecNo > 1;
  btnPrimeiro.Enabled  := ClientAncestral.RecNo > 1;
end;

procedure TfrmCadPessoaUDV.btnProximoClick(Sender: TObject);
begin
  inherited;
  ClientAncestral.Next;
  btnProximo.Enabled   := not ClientAncestral.Eof;
  btnUltimo.Enabled    := not ClientAncestral.Eof;
  btnAnterior.Enabled  := True;
  btnPrimeiro.Enabled  := True;
end;

procedure TfrmCadPessoaUDV.btnUltimoClick(Sender: TObject);
begin
  inherited;
  ClientAncestral.Last;
  btnProximo.Enabled := not ClientAncestral.Eof;
  btnUltimo.Enabled  := not ClientAncestral.Eof;
  btnAnterior.Enabled  := True;
  btnPrimeiro.Enabled  := True;
end;

procedure TfrmCadPessoaUDV.ClientAncestralAfterScroll(DataSet: TDataSet);
begin
  inherited;
  lcxGrupoPropertiesEditValueChanged(Self);
  icxBoleto.EditValue := ClientAncestralBOLETO_EMAIL.AsString;
  chxEmailOutroAssociadoClick(Self);
end;

procedure TfrmCadPessoaUDV.chxEmailOutroAssociadoClick(Sender: TObject);
begin
  inherited;
  lcxOutroAssociado.Enabled      := chxEmailOutroAssociado.checked;
  lblEmailOutroAssociado.Enabled := chxEmailOutroAssociado.checked;

  if (not chxEmailOutroAssociado.checked) and (lcxOutroAssociado.EditValue <> null) then
  begin
    if State in [dsInsert, dsEdit] then
      ClientAncestralPESSOA_TERCEIRO_ID.AsVariant := null;
    edtEmailOutroAssociado.Clear;
  end;

  if (chxEmailOutroAssociado.checked) and (State in [dsInsert, dsEdit]) then
    lcxOutroAssociado.SetFocus;

end;

procedure TfrmCadPessoaUDV.chxEmailOutroAssociadoPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if (ClientAncestralEMAIL_TERCEIRO.AsString = 'S') and (ClientAncestralPESSOA_GRUPO_ID.AsInteger > 0) then
  begin
    Application.MessageBox(Pchar('Associado utilizando o email do Grupo!!!'+#13+#13+
                           'Operação não permitida.'), 'Atenção', MB_OK + MB_ICONWARNING);
    ClientAncestralEMAIL_TERCEIRO.AsString := 'N';
    lcxOutroAssociado.Enabled      := False;
    lblEmailOutroAssociado.Enabled := False;
    abort;
  end;
end;

procedure TfrmCadPessoaUDV.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  if vgSincronizarReuni = 'N' then
       edtNome.SetFocus
  else lcxGrupo.SetFocus;
  vlAlterando := True;  
end;

procedure TfrmCadPessoaUDV.ExecuteCancelarExecute(Sender: TObject);
begin
  vlAlterando := False;
  inherited;
  if (vgNovoCadastro) or (vgSelecionado) then
    ExecuteFecharExecute(self);
end;

procedure TfrmCadPessoaUDV.ExecuteGravarExecute(Sender: TObject);
begin
  if vgCedenteAtivo = 0 then
  begin
    Application.MessageBox('Não existe cedente cadastrado!!!', 'Atenção', MB_OK + MB_ICONWARNING);
    exit;
  end;

  VerificarPreenchimentoDTA_DB(edtData.text, 'Data Cadastro', edtData);
  VerificarPreenchimentoEDT_DB(edtNome.text, 'Nome', edtNome);
  VerificarPreenchimentoEDT_DB(edtNome.text, 'CPF', edtNome);
  VerificarPreenchimentoICX_DB(icxGrau.text, 'Grau', icxGrau);
  VerificarPreenchimentoICX_DB(icxGrau.text, 'Situação', icxGrau);
  VerificarPreenchimentoICX_TX(icxBoleto.text, 'Boleto', icxBoleto);
  ClientAncestralBOLETO_EMAIL.AsString := icxBoleto.EditValue;

  // Se manda boleto por email, verifica se existe email vinculado.
  if ClientAncestralBOLETO_EMAIL.AsString = 'S' then
  begin
    if (ClientAncestralEMAIL.AsString = '') and (edtEmailGrupo.text = '') and (edtEmailOutroAssociado.Text = '') then
    begin
      Application.MessageBox('Não existe nenhum email vinculado para envio do boleto!!!', 'Atenção', MB_OK + MB_ICONWARNING);
      exit;
    end;

    if (ClientAncestralPESSOA_GRUPO_ID.AsInteger > 0) and (edtEmailGrupo.text = '') then
    begin
      Application.MessageBox('Email do Grupo não pode ser vazio!!!', 'Atenção', MB_OK + MB_ICONWARNING);
      exit;
    end;
    
  end;

  ClientAncestralCEDENTE_ID.AsInteger  := vgCedenteAtivo;
  vlAlterando := False;

  inherited;

  if vgSelecionado then
  begin
    vgPessoa.PessoaId := 0;
    ExecuteFecharExecute(self);
  end;
end;

procedure TfrmCadPessoaUDV.ExecuteIncluirExecute(Sender: TObject);
begin
  inherited;
  ClientAncestralDATA_CADASTRO.AsVariant := dtmControles.DataHoraBanco(4);
  ClientAncestralGRAU.AsVariant     := '2';
  ClientAncestralSITUACAO.AsVariant := '1';
  edtData.SetFocus;
  icxBoleto.enabled := True;
  vlAlterando       := True;
end;

procedure TfrmCadPessoaUDV.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dtmLookup.AtualizarTabelas;
  vgSelecionado := False;

  Action       := caFree;
  frmCadPessoa := nil;
end;

procedure TfrmCadPessoaUDV.FormCreate(Sender: TObject);
begin
  inherited;
  vgNomeTabela    := 'T_PESSOA';
  vgChavePrimaria := 'PESSOA_ID';

  edtData.Enabled          := vgSincronizarReuni = 'N';
  edtNome.Enabled          := vgSincronizarReuni = 'N';
  icxGrau.Enabled          := vgSincronizarReuni = 'N';
  icxSituacao.Enabled      := vgSincronizarReuni = 'N';
  edtEmail.Enabled         := vgSincronizarReuni = 'N';
  pnlDadosPessoais.Enabled := vgSincronizarReuni = 'N';
  pgcDados.ActivePageIndex := 0;
end;

procedure TfrmCadPessoaUDV.FormShow(Sender: TObject);
begin
  inherited;
  if vgPessoa.PessoaId > 0 then
       vgchave := IntToStr(vgPessoa.PessoaId)
  else vgchave := '';
  LoadData;

  if vgNovoCadastro then
  begin
    ExecuteIncluirExecute(self);

    if vgPessoa.PessoaId = -1 then
      close;
  end;

  if (vgPessoa.PessoaId > 0) and vgSelecionado then
    ExecuteAlterarExecute(self);

 lbllInformacao.Visible  := dtmLookup.VefificaExistenciaBoleto(ClientAncestralPESSOA_ID.AsString);
 lcxGrupo.Enabled        := not dtmLookup.VefificaExistenciaBoleto(ClientAncestralPESSOA_ID.AsString);
 sbnLimparFiltro.Enabled := not dtmLookup.VefificaExistenciaBoleto(ClientAncestralPESSOA_ID.AsString);
 btnAdGrupo.Enabled      := not dtmLookup.VefificaExistenciaBoleto(ClientAncestralPESSOA_ID.AsString);
end;

procedure TfrmCadPessoaUDV.lcxGrupoPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  icxBoleto.enabled := lcxGrupo.EditValue = null;

  if lcxGrupo.EditValue <> null then
  begin
    icxBoleto.editValue := dtmControles.GetStr(' SELECT BOLETO_EMAIL FROM T_PESSOA_GRUPO '+
                                               ' WHERE PESSOA_GRUPO_ID = '+ IntToStr(lcxGrupo.EditValue));
    edtEmailGrupo.editValue := dtmControles.GetStr(' SELECT EMAIL FROM T_PESSOA_GRUPO '+
                                               ' WHERE PESSOA_GRUPO_ID = '+ IntToStr(lcxGrupo.EditValue));
    if vlAlterando then
    begin
      ClientAncestralEMAIL_TERCEIRO.AsString := 'N';
      chxEmailOutroAssociadoClick(self);
    end;
  end
  else
  begin
    icxBoleto.ItemIndex := -1;
    edtEmailGrupo.clear;
    if State in [dsEdit, dsInsert] then
      icxBoleto.SetFocus;
  end;
end;

procedure TfrmCadPessoaUDV.lcxOutroAssociadoPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if lcxOutroAssociado.editValue <> null then
    edtEmailOutroAssociado.Text := dtmControles.GetStr('SELECT EMAIL FROM T_PESSOA WHERE PESSOA_ID ='+ InttoStr(lcxOutroAssociado.editValue));

end;

procedure TfrmCadPessoaUDV.LoadData;
var
  viSql : string;
begin
   viSql := ' SELECT * '+
            ' FROM T_PESSOA ';

  if vgChave <> '' then
    viSql := viSql + ' WHERE PESSOA_ID = '+vgChave;

  ClientAncestral.close;
  DataSetAncestral.SQL.Text := viSql + ' ORDER BY NOME ';
  ClientAncestral.open;
  SetState(dsBrowse);
  vgChave := '';

  inherited;
end;

procedure TfrmCadPessoaUDV.sbnLimparFiltroClick(Sender: TObject);
begin
  inherited;
  ClientAncestralPESSOA_GRUPO_ID.AsVariant := null;
  lcxGrupo.SetFocus;
end;

procedure TfrmCadPessoaUDV.SetState(AState: TDataSetState);
begin
  btnPrimeiro.Visible := False;
  btnAnterior.Visible := False;
  btnProximo.Visible  := False;
  btnUltimo.Visible   := False;
  inherited;

end;

end.
