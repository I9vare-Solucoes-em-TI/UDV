unit PessoaUDV;

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
    Panel2: TPanel;
    Bevel1: TBevel;
    cxLabel29: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel10: TcxLabel;
    ClientAncestralEMAIL_TERCEIRO: TStringField;
    ClientAncestralPESSOA_TERCEIRO_ID: TBCDField;
    lbllInformacao: TcxLabel;
    edtData: TcxDBDateEdit;
    edtNome: TcxDBTextEdit;
    icxGrau: TcxDBImageComboBox;
    icxSituacao: TcxDBImageComboBox;
    cbxGrupo: TcxGroupBox;
    cxLabel4: TcxLabel;
    lcxGrupo: TcxDBLookupComboBox;
    cxGroupBox2: TcxGroupBox;
    cxLabel3: TcxLabel;
    cxLabel11: TcxLabel;
    lblEmailOutroAssociado: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    ClientAncestralPRINCIPAL: TStringField;
    ClientAncestralEMAIL_GRUPO_PADRAO: TStringField;
    chxEmailGrupo: TcxDBCheckBox;
    chxPessoaPadrao: TcxDBCheckBox;
    btnAdGrupo: TcxButton;
    sbnLimparFiltro: TcxButton;
    ClientAncestralFATURA_TIPO: TStringField;
    cxLabel5: TcxLabel;
    icxBoleto: TcxImageComboBox;
    icxFatura: TcxDBImageComboBox;
    edtEmail: TcxDBTextEdit;
    chxEmailOutroAssociado: TcxDBCheckBox;
    lcxOutroAssociado: TcxDBLookupComboBox;
    edtCPFCNPJ: TcxDBMaskEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    icxSexo: TcxDBImageComboBox;
    edtEndereco: TcxDBTextEdit;
    cxDBTextEdit15: TcxDBTextEdit;
    cxDBTextEdit16: TcxDBTextEdit;
    cxDBComboBox3: TcxDBComboBox;
    cxDBMaskEdit1: TcxDBMaskEdit;
    edtTelefone: TcxDBMaskEdit;
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
    procedure chxEmailOutroAssociadoClick(Sender: TObject);
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

uses Rotinas, Controles, Lookup, Pesquisa, PessoaPreCadastro, Cadastro,
  Lookup_Contabil;


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
    if State in [dsInsert, dsEdit] then
      ClientAncestralPESSOA_TERCEIRO_ID.AsVariant := null;

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
                           'Opera��o n�o permitida.'), 'Aten��o', MB_OK + MB_ICONWARNING);
    ClientAncestralEMAIL_TERCEIRO.AsString := 'N';
    lcxOutroAssociado.Enabled      := False;
    lblEmailOutroAssociado.Enabled := False;
    abort;
  end;
end;

procedure TfrmCadPessoaUDV.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  if (vgSincronizarReuni = 'N') or (vgPermiteAlteracao) then
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
    Application.MessageBox('N�o existe cedente cadastrado!!!', 'Aten��o', MB_OK + MB_ICONWARNING);
    exit;
  end;

  VerificarPreenchimentoDTA_DB(edtData.text, 'Data Cadastro', edtData);
  VerificarPreenchimentoEDT_DB(edtNome.text, 'Nome', edtNome);
  VerificarPreenchimentoEDT_DB(edtNome.text, 'CPF', edtNome);
  VerificarPreenchimentoICX_DB(icxGrau.text, 'Grau', icxGrau);
  VerificarPreenchimentoICX_DB(icxGrau.text, 'Situa��o', icxGrau);
  VerificarPreenchimentoICX_TX(icxBoleto.text, 'Boleto', icxBoleto);
  VerificarPreenchimentoICX_DB(icxFatura.text, 'Fatura Tipo', icxFatura);
  ClientAncestralBOLETO_EMAIL.AsString := icxBoleto.EditValue;

  if ClientAncestralCPF.AsString = '' then
  begin
    Application.MessageBox('Preenchimento do CPF Obrigat�rio!!!', 'Aten��o', MB_OK + MB_ICONWARNING);
    exit;
  end
  else
  begin
    if not ValidarCPFCNPJ(ClientAncestralCPF.AsString) then
    begin
      Application.MessageBox('CPF/CNPJ inv�lido!!!', 'Aten��o', MB_OK + MB_ICONWARNING);
      exit;
    end;
  end;

  // Se manda boleto por email, verifica se existe email vinculado.
  if ClientAncestralBOLETO_EMAIL.AsString = 'S' then
  begin
    if (lcxGrupo.EditValue = Null) and ((ClientAncestralEMAIL.AsString = '') and (lcxOutroAssociado.EditValue = null)) then
    begin
      Application.MessageBox('N�o existe nenhum email vinculado para envio do boleto!!!', 'Aten��o', MB_OK + MB_ICONWARNING);
      exit;
    end
    else
      if (ClientAncestralPESSOA_GRUPO_ID.AsInteger > 0) and ((chxEmailGrupo.Checked) and (ClientAncestralEMAIL.AsString = '')) then
      begin
        Application.MessageBox('Email n�o cadastrado!!!', 'Aten��o', MB_OK + MB_ICONWARNING);
        exit;
      end;

  end;

  ClientAncestralCEDENTE_ID.AsInteger  := vgCedenteAtivo;
  vlAlterando := False;

  inherited;

  if ClientAncestralPRINCIPAL.AsString = 'S' then
    dtmLookup.DefinirPessoaGrupoPrincipal(ClientAncestralPESSOA_ID.AsString,
                                          ClientAncestralPESSOA_GRUPO_ID.AsString, 'PRINCIPAL');

  if ClientAncestralEMAIL_GRUPO_PADRAO.AsString = 'S' then
    dtmLookup.DefinirPessoaGrupoPrincipal(ClientAncestralPESSOA_ID.AsString,
                                          ClientAncestralPESSOA_GRUPO_ID.AsString, 'EMAIL_GRUPO_PADRAO');

  if not ClientAncestralPESSOA_GRUPO_ID.IsNull then
    dtmLookup.DefinirPessoaGrupoFatura(ClientAncestralPESSOA_GRUPO_ID.AsString,
                                       ClientAncestralFATURA_TIPO.AsString,
                                       ClientAncestralBOLETO_EMAIL.AsString);

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

  if vgSincronizarReuni = 'N' then
       ClientAncestralSITUACAO.AsVariant := '1'
  else ClientAncestralSITUACAO.AsVariant := '0';
  edtData.SetFocus;
  icxBoleto.enabled := True;
  vlAlterando       := True;
end;

procedure TfrmCadPessoaUDV.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dtmLookup.AtualizarTabelas;
  vgSelecionado := False;

  Action          := caFree;
  frmCadPessoaUDV := nil;
end;

procedure TfrmCadPessoaUDV.FormCreate(Sender: TObject);
begin
  inherited;
  vgNomeTabela    := 'T_PESSOA';
  vgChavePrimaria := 'PESSOA_ID';

  edtData.Enabled          := (vgSincronizarReuni = 'N') or (vgPermiteAlteracao);
  edtNome.Enabled          := (vgSincronizarReuni = 'N') or (vgPermiteAlteracao);
  icxGrau.Enabled          := (vgSincronizarReuni = 'N') or (vgPermiteAlteracao);
  icxSituacao.Enabled      := (vgSincronizarReuni = 'N');
  edtEmail.Enabled         := (vgSincronizarReuni = 'N') or (vgPermiteAlteracao);
  pnlDadosPessoais.Enabled := (vgSincronizarReuni = 'N') or (vgPermiteAlteracao);
  pgcDados.ActivePageIndex := 0;
end;

procedure TfrmCadPessoaUDV.FormShow(Sender: TObject);
var
  vlBoleto : Boolean;
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
  begin
    ExecuteAlterarExecute(self);
    vlBoleto :=  dtmLookup.VefificaExistenciaBoleto(ClientAncestralPESSOA_ID.AsString);
    lcxGrupo.Enabled        := not vlBoleto;
    lbllInformacao.Visible  := vlBoleto;
    sbnLimparFiltro.Enabled := not vlBoleto;
    btnAdGrupo.Enabled      := not vlBoleto;
    icxFatura.Enabled       := not vlBoleto;
  end
  else
  begin
    lcxGrupo.Enabled        := False;
    lbllInformacao.Visible  := False;
    sbnLimparFiltro.Enabled := False;
    btnAdGrupo.Enabled      := False;
    icxFatura.Enabled       := not vlBoleto;
  end;
end;

procedure TfrmCadPessoaUDV.lcxGrupoPropertiesEditValueChanged(Sender: TObject);
var
  viQtdPessoa : Integer;
begin
  inherited;
  if lcxGrupo.EditValue <> null then
    viQtdPessoa := dtmControles.GetInt(' SELECT COUNT(PESSOA_GRUPO_ID) FROM T_PESSOA '+
                                       ' WHERE PESSOA_GRUPO_ID = '+IntToStr(lcxGrupo.EditValue));

  icxBoleto.enabled       := lcxGrupo.EditValue = null;
  chxPessoaPadrao.Enabled := (not icxBoleto.enabled) and (viQtdPessoa > 0);
  chxEmailGrupo.Enabled   := (not icxBoleto.enabled)  and (viQtdPessoa > 0);

  if lcxGrupo.EditValue <> null then
  begin
    icxBoleto.editValue := dtmControles.GetStr(' SELECT BOLETO_EMAIL FROM T_PESSOA_GRUPO '+
                                               ' WHERE PESSOA_GRUPO_ID = '+ IntToStr(lcxGrupo.EditValue));
    if vlAlterando then
    begin
      ClientAncestralEMAIL_TERCEIRO.AsString := 'N';
      chxEmailOutroAssociadoClick(self);
      if (viQtdPessoa = 0) then
      begin
        ClientAncestralPRINCIPAL.AsString := 'S';
        ClientAncestralEMAIL_GRUPO_PADRAO.AsString := 'S';
      end;
    end;
  end
  else
  begin
    icxBoleto.ItemIndex := -1;
    if vlAlterando then
    begin
      icxBoleto.SetFocus;
      ClientAncestralEMAIL_GRUPO_PADRAO.AsString := 'N';
      ClientAncestralPRINCIPAL.AsString          := 'N';
    end;
  end;
end;

procedure TfrmCadPessoaUDV.LoadData;
var
  viSql : string;
begin
   viSql := ' SELECT * '+
            ' FROM T_PESSOA ';

  if vgChave <> '' then
    viSql := viSql + ' WHERE PESSOA_ID = '+vgChave;

  ClientAncestral.AfterScroll := nil;
  ClientAncestral.close;
  DataSetAncestral.SQL.Text := viSql + ' ORDER BY NOME ';
  ClientAncestral.open;
  ClientAncestral.AfterScroll := ClientAncestralAfterScroll;
  ClientAncestralAfterScroll(ClientAncestral);
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

  inherited;

end;

end.
