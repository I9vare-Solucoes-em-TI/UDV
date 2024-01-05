unit Pessoa;

interface

uses
  I9Query,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, Menus, cxLookAndFeelPainters, FMTBcd, dxSkinsCore,
  dxSkinsDefaultPainters, cxGraphics, cxDBEdit, cxGroupBox, cxImageComboBox,
  cxDropDownEdit, cxCalendar, cxMaskEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, DB,
  DBClient, Provider, SqlExpr, ActnList, ComCtrls, StdCtrls, cxButtons, ExtCtrls,
  Buttons, cxImage, ExtDlgs, cxCheckBox, dxSkinOffice2007Blue, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxPC, cxCheckComboBox, cxDBCheckComboBox, cxCheckListBox,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, SimpleDS, cxLookAndFeels,
  dxSkinBlueprint, dxSkinDarkRoom, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinHighContrast, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013White, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSpringTime,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxPCdxBarPopupMenu,
  cxNavigator, dxSkinDevExpressDarkStyle, dxBarBuiltInMenu, DbxDevartInterBase,
  System.Actions, cxRadioGroup;

type
  TDadosDuplicar = Record
    cpf, endereco, bairro, cidade, uf, cep, telefone, ddd, sexo : String;
  end;

  TfrmCadPessoa = class(TfrmCadBasico)
    ClientAncestralPESSOA_ID: TBCDField;
    ClientAncestralNOME: TStringField;
    ClientAncestralEMPRESA: TStringField;
    ClientAncestralCPFCNPJ: TStringField;
    ClientAncestralDOCUMENTO: TStringField;
    ClientAncestralEMAIL2: TStringField;
    ClientAncestralTELEFONE: TStringField;
    ClientAncestralEMAIL1: TStringField;
    ClientAncestralTIPO_DOCUMENTO_ID: TBCDField;
    ClientAncestralTIPO_PETICIONADOR: TStringField;
    ClientAncestralTIPO_CAPTADOR: TStringField;
    ClientAncestralTIPO_SOCIO: TStringField;
    ClientAncestralTIPO_PARTICIPANTE: TStringField;
    ClientAncestralPESSOA_FUNCAO_ID: TBCDField;
    btnSelecionar: TcxButton;
    ClientAncestralIDENTIFICACAO: TStringField;
    pgcDados: TcxPageControl;
    tabIdentificacao: TcxTabSheet;
    tabComplemento: TcxTabSheet;
    ClientAncestralENDERECO_LOGRADOURO: TStringField;
    ClientAncestralENDERECO_CIDADE_ID: TBCDField;
    ClientAncestralENDERECO_CIDADE_UF: TStringField;
    ClientAncestralENDERECO_CEP: TStringField;
    ClientAncestralNATURALIDADE_ID: TBCDField;
    ClientAncestralNATURALIDADE_UF: TStringField;
    ClientAncestralNOME_PAI: TStringField;
    ClientAncestralNOME_MAE: TStringField;
    ClientAncestralDATA_NASCIMENTO: TSQLTimeStampField;
    ClientAncestralENDERECO_BAIRRO: TStringField;
    ClientAncestralTB_ESTADOCIVIL_ID: TBCDField;
    ClientAncestralTB_PROFISSAO_ID: TBCDField;
    sqlCidadeEndereco: TI9Query;
    sqlCidadeEnderecoMUNICIPIO_ID: TBCDField;
    sqlCidadeEnderecoMUNICIPIO: TStringField;
    dtsCidadeEndereco: TDataSource;
    sqlCidadeNaturalidade: TI9Query;
    FMTBCDField1: TBCDField;
    StringField1: TStringField;
    dtsCidadeNaturalidade: TDataSource;
    ClientAncestralTIPO_PESSOA: TStringField;
    ClientAncestralSEXO: TStringField;
    pnlIdentificacao: TPanel;
    pnlDadosComplementares: TPanel;
    cxGroupBox2: TcxGroupBox;
    cxLabel12: TcxLabel;
    cxLabel20: TcxLabel;
    cxLabel19: TcxLabel;
    cxLabel27: TcxLabel;
    cxLabel22: TcxLabel;
    cxLabel17: TcxLabel;
    lcxEstadoCivil: TcxDBLookupComboBox;
    lcxProfissao: TcxDBLookupComboBox;
    edtDataNascimento: TcxDBDateEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cbxNaturalidadeUf: TcxDBComboBox;
    cxDBLookupComboBox2: TcxDBLookupComboBox;
    edtPai: TcxDBTextEdit;
    edtNomeMae: TcxDBTextEdit;
    cxGroupBox4: TcxGroupBox;
    pnlDocumentosAdicionais: TPanel;
    cxLabel18: TcxLabel;
    cxLabel21: TcxLabel;
    DocumentoTipo_lcx: TcxLookupComboBox;
    DocumentoNumero_edt: TcxTextEdit;
    btnDocumentoAdicionar: TcxButton;
    btnDocumentoExcluir: TcxButton;
    gridDoucmentosGeral: TcxGrid;
    cxGridDBTableView4: TcxGridDBTableView;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBTableView4Column1: TcxGridDBColumn;
    cxGridLevel4: TcxGridLevel;
    ClientAncestralNACIONALIDADE: TStringField;
    sqlPessoaDocumento: TI9Query;
    dtsPessoaDocumento: TDataSource;
    sqlPessoaDocumentoPESSOA_DOCUMENTO_ID: TBCDField;
    sqlPessoaDocumentoPESSOA_ID: TBCDField;
    sqlPessoaDocumentoTIPO_DOCUMENTO_ID: TBCDField;
    sqlPessoaDocumentoDOCUMENTO: TStringField;
    pgcDadosPessoa: TcxPageControl;
    tabPessoaFisica: TcxTabSheet;
    cxLabel3: TcxLabel;
    cxLabel5: TcxLabel;
    lcxTipoDocumento: TcxDBLookupComboBox;
    edtDocumento: TcxDBTextEdit;
    tabPessoaJuridica: TcxTabSheet;
    cxLabel6: TcxLabel;
    cxLabel24: TcxLabel;
    edtEmpresa: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    ClientAncestralTIPO: TStringField;
    pnlDadosPrincipais: TPanel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    lblIdentificacao: TcxLabel;
    lbllConcordancia: TcxLabel;
    cxLabel23: TcxLabel;
    ClientAncestralUTILIZA_BOLETO: TStringField;
    tabBoleto: TcxTabSheet;
    ClientAncestralBOLETO_DESCRICAO: TStringField;
    ClientAncestralBOLETO_EMAIL: TStringField;
    ClientAncestralBOLETO_UTILIZA_EMAIL_PADRAO: TStringField;
    chbUtilizaBoleto: TcxDBCheckBox;
    cxLabel9: TcxLabel;
    ClientAncestralOBSERVACAO: TStringField;
    icxTipoPessoa: TcxDBImageComboBox;
    cbxTipoCPF: TcxComboBox;
    edtCPF: TcxDBMaskEdit;
    btnPesquiasrCNPJ: TcxButton;
    lcxNomeIdentificacao: TcxDBLookupComboBox;
    edtNome: TcxDBTextEdit;
    icxSexo: TcxDBImageComboBox;
    cxDBTextEdit1: TcxDBTextEdit;
    ClientAncestralCADASTRO_SIMPLIFICADO: TStringField;
    rdbCadastroSimplificado: TcxRadioButton;
    rdbCadastroCompleto: TcxRadioButton;
    pgcEndereco: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    pnlEndereco: TPanel;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    cxLabel15: TcxLabel;
    cxLabel16: TcxLabel;
    edtLogradouro: TcxDBTextEdit;
    edtBairro: TcxDBTextEdit;
    cbxsCidadeUF: TcxDBComboBox;
    lcxCidade: TcxDBLookupComboBox;
    edtCep: TcxDBMaskEdit;
    cxTabSheet2: TcxTabSheet;
    pnlContato: TPanel;
    Panel2: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel4: TcxLabel;
    btnAdcionarResponsavel: TcxButton;
    btnExcluirResponsavel: TcxButton;
    icxTipoContato: TcxImageComboBox;
    icxOperadora: TcxImageComboBox;
    edtContatoDescricao: TcxTextEdit;
    btnContatoAdicionar: TcxButton;
    chxListContatos: TcxCheckListBox;
    btnContatoExcluir: TcxButton;
    pnlDadosBoleto: TPanel;
    cxLabel11: TcxLabel;
    cxLabel25: TcxLabel;
    edtDescricaoBoelto: TcxDBTextEdit;
    chbEmailPrincipal: TcxDBCheckBox;
    edtEmailBoleto: TcxDBTextEdit;
    cxLabel10: TcxLabel;
    cxDBImageComboBox1: TcxDBImageComboBox;
    ClientAncestralBOLETO_LOGOMARCA: TStringField;
    procedure ExecutePesquisaExecute(Sender: TObject);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ClientAncestralBeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ExecuteCancelarExecute(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure ClientAncestralCalcFields(DataSet: TDataSet);
    procedure cxComboBox1PropertiesChange(Sender: TObject);
    procedure lcxxTipoDocumentoPropertiesChange(Sender: TObject);
    procedure lcxTipoDocumentoExit(Sender: TObject);
    procedure lcxTipoDocumentoEnter(Sender: TObject);
    procedure btnContatoAdicionarClick(Sender: TObject);
    procedure icxTipoContatoPropertiesEditValueChanged(Sender: TObject);
    procedure edtContatoDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnContatoExcluirClick(Sender: TObject);
    procedure ClientAncestralAfterScroll(DataSet: TDataSet);
    procedure ExecuteFecharExecute(Sender: TObject);
    procedure edtCPFExit(Sender: TObject);
    procedure lcxTipoDocumentoDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cxDBComboBox2PropertiesEditValueChanged(Sender: TObject);
    procedure cxDBComboBox1PropertiesEditValueChanged(Sender: TObject);
    procedure lcxProfissaoDblClick(Sender: TObject);
    procedure lcxProfissaoEnter(Sender: TObject);
    procedure lcxProfissaoExit(Sender: TObject);
    procedure lcxProfissaoPropertiesChange(Sender: TObject);
    procedure icxTipoPessoaPropertiesEditValueChanged(Sender: TObject);
    procedure DocumentoTipo_lcxDblClick(Sender: TObject);
    procedure DocumentoTipo_lcxEnter(Sender: TObject);
    procedure DocumentoTipo_lcxExit(Sender: TObject);
    procedure DocumentoTipo_lcxPropertiesChange(Sender: TObject);
    procedure btnDocumentoAdicionarClick(Sender: TObject);
    procedure sqlPessoaDocumentoAfterScroll(DataSet: TDataSet);
    procedure lcxNomeIdentificacaoEnter(Sender: TObject);
    procedure lcxNomeIdentificacaoPropertiesChange(Sender: TObject);
    procedure lcxNomeIdentificacaoDblClick(Sender: TObject);
    procedure chbUtilizaBoletoClick(Sender: TObject);
    procedure chbEmailPrincipalClick(Sender: TObject);
    procedure pgcDadosChange(Sender: TObject);
    procedure btnPesquiasrCNPJClick(Sender: TObject);
    procedure rdbCadastroSimplificadoClick(Sender: TObject);
    procedure rdbCadastroCompletoClick(Sender: TObject);
  private
    vlUsarCampoDDD, vlPermRotinaAux, vlLocal : String;
    vlContatoAuto : Boolean;
    procedure SetState (AState : TDataSetState);override;
    procedure LoadData; override;
    procedure Validar;
    procedure ContatoGravar;
    procedure ContatoCarregar;
    procedure HabilitarTipoCadastro(vpHabilitado : Boolean);
    procedure TipoCadastro(vpTipo : string);
  public
    procedure LimparCamposDuplicar;
  end;

var
  vgNovoCadastro, vgDadosObrigatorio, vgCadastrarFuncao : Boolean;
  vlSelecionado  : Boolean;
  vgDadosDuplicar : TDadosDuplicar;
  frmCadPessoa: TfrmCadPessoa;

implementation

uses Controles, Rotinas, Pesquisa, Lookup, Cadastro, PesquisaGeral,
     PessoaPreCadastro, Lookup_Servico, LookupFinanceiro, Lookup_Contabil,
  ConsultaCNPJ, ConsultorCNPJ, RetornoConsultaCNPJ, ConsultorCNPJReceitaWS,
  ConsultaCNPJException, MensagemUtils, BooleanHelper,
  Geral.Model.Entity.Impl.Maybe,
  Geral.Model.Entity.Spec.ParametrosProxy;

{$R *.dfm}

{ TfrmCadPessoa }


procedure TfrmCadPessoa.btnSelecionarClick(Sender: TObject);
var
  viTipo : String;
begin
  inherited;
{  if pos(vgPessoa.PessoaTipoVinculo, ClientAncestralTIPO.AsString) = 0 then
  begin
    viTipo := Copy(vgPessoa.PessoaTipoVinculo, pos(':', vgPessoa.PessoaTipoVinculo)+1, 50);
    Application.MessageBox(Pchar('O Tipo da Pessoa deve constar '+viTipo+'.'), 'Atenção', mb_ok + MB_ICONWARNING);
    exit;
  end;}

  if cxBtnGravar.Enabled then
    ExecuteGravarExecute(Self);

  vgPessoa.PessoaId := ClientAncestralPESSOA_ID.AsInteger;
  Close;
end;

procedure TfrmCadPessoa.chbUtilizaBoletoClick(Sender: TObject);
begin
  inherited;
  tabBoleto.TabVisible := chbUtilizaBoleto.Checked;

  rdbCadastroSimplificado.Enabled := not chbUtilizaBoleto.Checked;
  rdbCadastroCompleto.Enabled     := not chbUtilizaBoleto.Checked;
  if chbUtilizaBoleto.Checked then
  begin
    rdbCadastroCompleto.Checked := True;
    rdbCadastroCompletoClick(self);
  end;

end;

procedure TfrmCadPessoa.chbEmailPrincipalClick(Sender: TObject);
begin
  inherited;
  edtEmailBoleto.Enabled := not chbEmailPrincipal.Checked;
  if (chbEmailPrincipal.Checked) and (State in [dsEdit, dsInsert]) then
    ClientAncestralBOLETO_UTILIZA_EMAIL_PADRAO.AsString := 'N';
end;

procedure TfrmCadPessoa.ClientAncestralAfterScroll(DataSet: TDataSet);
begin
  inherited;
  ContatoCarregar;
end;

procedure TfrmCadPessoa.ClientAncestralBeforePost(DataSet: TDataSet);
begin
  inherited;
  if State in [dsInsert] then
    ClientAncestral.FieldByName('PESSOA_ID').AsCurrency :=  dtmControles.GerarSequencia('J_PESSOA');
end;

procedure TfrmCadPessoa.ClientAncestralCalcFields(DataSet: TDataSet);
begin
  inherited;
  ClientAncestralCPFCNPJ.AsString := RetornaCPFCNPJFormatado(ClientAncestralCPFCNPJ.AsString);
end;

procedure TfrmCadPessoa.ContatoCarregar;
var
  viTelefone : String;
begin
  chxListContatos.Items.Clear;
  viTelefone := ClientAncestralTELEFONE.AsString;
  if trim(viTelefone) <> '' then
  begin
    repeat
      chxListContatos.AddItem(Trim(copy(viTelefone,1,pos(';',viTelefone)-1)));
      Delete(viTelefone,1,pos(';',viTelefone));
    until (viTelefone = '');
  end;

  if ClientAncestralEMAIL1.AsString <> '' then
    chxListContatos.AddItem(ClientAncestralEMAIL1.AsString + ' - email principal');

  if ClientAncestralEMAIL2.AsString <> '' then
    chxListContatos.AddItem(ClientAncestralEMAIL2.AsString + ' - email secundário');

  btnContatoExcluir.Enabled := chxListContatos.Items.Count > 0;
end;

procedure TfrmCadPessoa.ContatoGravar;
var
  viContato, viTelefone : String;
  i, viTipo : integer;
begin
  inherited;
  chxListContatos.ItemIndex := 0;
  viContato  := '';
  viTelefone := '';
  ClientAncestralEMAIL1.AsString := '';
  ClientAncestralEMAIL2.AsString := '';
  for i := 0 to chxListContatos.Items.Count -1 do
  begin
    viContato := chxListContatos.Items[i].Text;
    viTipo := pos('email', viContato);
    if viTipo > 0 then
    begin
      if pos('principal', viContato) > 0 then
           ClientAncestralEMAIL1.AsString := trim(copy(viContato, 1, pos('-', viContato)-1))
      else ClientAncestralEMAIL2.AsString := trim(copy(viContato, 1, pos('-', viContato)-1));
    end
    else viTelefone := viTelefone + viContato + '; ';
  end;

  ClientAncestralTELEFONE.AsString := viTelefone;
end;

procedure TfrmCadPessoa.btnDocumentoAdicionarClick(Sender: TObject);
begin
  inherited;
  VerificarPreenchimentoLCX_TX(DocumentoTipo_lcx.Text, 'Tipo Documento', DocumentoTipo_lcx);
  VerificarPreenchimentoEDT_TX(DocumentoNumero_edt.Text, 'Documento (Nº/Orgão/Emissão...)', DocumentoNumero_edt);

  sqlPessoaDocumento.Insert;
  sqlPessoaDocumentoPESSOA_DOCUMENTO_ID.AsInteger := dtmControles.GerarSequencia('J_PESSOA_DOCUMENTO');
  sqlPessoaDocumentoPESSOA_ID.AsInteger           := ClientAncestralPESSOA_ID.AsInteger;
  sqlPessoaDocumentoTIPO_DOCUMENTO_ID.AsInteger   := DocumentoTipo_lcx.EditValue;
  sqlPessoaDocumentoDOCUMENTO.AsString            := DocumentoNumero_edt.EditValue;
  sqlPessoaDocumento.ApplyUpdates(-1);

  DocumentoTipo_lcx.Clear;
  DocumentoNumero_edt.Clear;
  DocumentoTipo_lcx.SetFocus;
end;

procedure TfrmCadPessoa.btnPesquiasrCNPJClick(Sender: TObject);
var
  viDadosCNPJ : TDadosCNPJ;
  viEndereco : String;
  viCidadeId : Integer;

  viConsultorCNPJ: IConsultorCNPJ;
  viRetornoConsultaCNPJ: IRetornoConsultaCNPJ;
begin
  inherited;
  if edtCPF.EditValue = '' then
    exit;

  viConsultorCNPJ := TConsultorCNPJReceitaWS.New(
    TNone<IParametrosProxy>.New);

  try
    Screen.Cursor := crHourGlass;
    viRetornoConsultaCNPJ := viConsultorCNPJ.ConsultarCNPJ(edtCPF.Text);

    if Assigned(viRetornoConsultaCNPJ).&Not then
    begin
      Screen.Cursor := crDefault;
      Exit;
    end;

    with viRetornoConsultaCNPJ do
    begin
      ClientAncestralNOME.AsString      := Nome;
      ClientAncestralEMPRESA.AsString   := NomeFantasia;

      viEndereco := Logradouro;
      if Numero <> '' then
        viEndereco := viEndereco + ', Nº '+ Numero;
      if Complemento <> '' then
        viEndereco := viEndereco + ', '+ Complemento;

      ClientAncestralENDERECO_LOGRADOURO.AsString := viEndereco;
      ClientAncestralENDERECO_CIDADE_UF.AsString  := UF;

      viCidadeId := dtmControles.GetInt(' SELECT CIDADE_ID FROM G_CIDADE '+
                                        ' WHERE UPPER(CIDADE_NOME) = '+QuotedStr(AnsiUpperCase(Municipio)));
      if viCidadeId > 0 then
        ClientAncestralENDERECO_CIDADE_ID.AsInteger := viCidadeId;
      ClientAncestralENDERECO_CEP.AsString          := CEP;
      ClientAncestralENDERECO_BAIRRO.AsString       := Bairro;

      if Telefone <> '' then
      begin
        icxTipoContato.ItemIndex      := 3;
        edtContatoDescricao.EditValue := Telefone;
        vlContatoAuto := True;
        btnContatoAdicionarClick(self);
        vlContatoAuto := False;
      end;

      if Email <> '' then
      begin
        icxTipoContato.ItemIndex      := 0;
        edtContatoDescricao.EditValue := Email;
        vlContatoAuto := True;
        btnContatoAdicionarClick(self);
        vlContatoAuto := False;
      end;
    end;
    Screen.Cursor := crDefault;
  except
    on E: EConsultaCNPJException do
    begin
      Screen.Cursor := crDefault;
      TMensagemUtils.ExibirMensagemErro(E.Message);
    end;
  end;

end;

procedure TfrmCadPessoa.btnContatoAdicionarClick(Sender: TObject);
var
  viContato : String;

  procedure VerificarContato;
  var
    i : Integer;

    procedure Mensagem(vpMensagem : String);
    begin
      Application.MessageBox(Pchar(vpMensagem), 'Atenção', mb_ok + MB_ICONWARNING);
      icxTipoContato.SetFocus;
      abort;
    end;

  begin
    chxListContatos.ItemIndex := 0;
    for i := 0 to chxListContatos.Items.Count -1 do
    begin
      chxListContatos.ItemIndex := i;
      case icxTipoContato.ItemIndex of
        0 : begin
              if pos('email principal', chxListContatos.Items[i].Text) > 0 then
                 Mensagem('Email principal ja cadastrado.')
            end;
        1 : begin
              if pos('email secundário', chxListContatos.Items[i].Text) > 0 then
                 Mensagem('Email secundário ja cadastrado.');
            end;
        else
          if chxListContatos.Items[i].Text = viContato then
             Mensagem('Telefone ja cadastrado.')
      end;
    end;
  end;

begin
  inherited;
  if not vlContatoAuto then
  begin
    VerificarPreenchimentoICX_TX(icxTipoContato.Text,'Tipo do Contato', icxTipoContato);
    if icxOperadora.Enabled then
      VerificarPreenchimentoICX_TX(icxOperadora.Text,'Operadora', icxOperadora);
    VerificarPreenchimentoEDT_TX(edtContatoDescricao.Text,'Descrição', edtContatoDescricao);
  end;

  viContato := edtContatoDescricao.Text;
  if icxOperadora.Text <> '' then
    viContato := viContato + icxTipoContato.EditValue + icxOperadora.EditValue
  else
    if icxTipoContato.ItemIndex > 2 then
       viContato := viContato + ' ' + icxTipoContato.EditValue
  else viContato := viContato + ' - '+ icxTipoContato.EditValue;

  if not vlContatoAuto then
    VerificarContato;

  chxListContatos.AddItem(viContato);

  edtContatoDescricao.Clear;
  icxOperadora.Clear;
  icxTipoContato.Clear;
  btnContatoExcluir.Enabled := True;

  if not vlContatoAuto then
    icxTipoContato.SetFocus;
end;

procedure TfrmCadPessoa.btnContatoExcluirClick(Sender: TObject);
var
  i, j : integer;
  viResultado : Boolean;
begin
  inherited;
  viResultado := False;
  chxListContatos.ItemIndex := 0;
  j := 0;
  for i := 0 to chxListContatos.Items.Count -1 do
  begin
    chxListContatos.ItemIndex := i-j;
    if chxListContatos.Items[i-j].Checked then
    begin
      chxListContatos.DeleteSelected;
      inc(j);
      viResultado := True;
    end;
  end;

  if not viResultado then
    Application.MessageBox('Nenhum contato selecionado.', 'Atenção', mb_ok + MB_ICONWARNING);

  btnContatoExcluir.Enabled := chxListContatos.Items.Count > 0;
end;

procedure TfrmCadPessoa.cxComboBox1PropertiesChange(Sender: TObject);
begin
  inherited;
  if cbxTipoCPF.ItemIndex = 0 then
      edtCPF.Properties.EditMask := '999\.999\.999\-99;0;_'
  else if cbxTipoCPF.ItemIndex = 1 then
          edtCPF.Properties.EditMask := '99\.999\.999\/9999\-99;0;_'
       else edtCPF.Properties.EditMask := '';

  tabPessoaJuridica.TabVisible := cbxTipoCPF.ItemIndex = 1;
  tabPessoaFisica.TabVisible   := cbxTipoCPF.ItemIndex = 0;
  btnPesquiasrCNPJ.Enabled     := cbxTipoCPF.ItemIndex = 1;

  pgcDadosPessoa.ActivePageIndex := cbxTipoCPF.ItemIndex;
end;

procedure TfrmCadPessoa.cxDBComboBox1PropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if cbxsCidadeUF.EditValue <> null then
  begin
    sqlCidadeEndereco.Close;
    sqlCidadeEndereco.ParamByName('UF').AsString := cbxsCidadeUF.EditValue;
    sqlCidadeEndereco.Open;
  end;

  if ClientAncestral.State in [dsInsert, dsEdit] then
    ClientAncestralENDERECO_CIDADE_ID.AsVariant := null;
end;

procedure TfrmCadPessoa.cxDBComboBox2PropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if cbxNaturalidadeUf.EditValue <> null then
  begin
    sqlCidadeNaturalidade.Close;
    sqlCidadeNaturalidade.ParamByName('UF').AsString := cbxNaturalidadeUf.EditValue;
    sqlCidadeNaturalidade.Open;
  end;

  if ClientAncestral.State in [dsInsert, dsEdit] then
    ClientAncestralNATURALIDADE_ID.AsVariant := null;
end;

procedure TfrmCadPessoa.DocumentoTipo_lcxDblClick(Sender: TObject);
begin
  inherited;
  if DocumentoTipo_lcx.Text = '' then
    exit;

  vlLocal := DocumentoTipo_lcx.text;
  dtmLookup.CadastrarRegBasicoGeral(nil, ClientAncestral, DocumentoTipo_lcx.EditValue, 'J_TIPO_DOCUMENTO', 'TIPO_DOCUMENTO_ID', vlLocal, True, True, True);
  dtmLookupFinanceiro.AtualizarTabelas;
end;

procedure TfrmCadPessoa.DocumentoTipo_lcxEnter(Sender: TObject);
begin
  inherited;
  vlLocal := '';
end;

procedure TfrmCadPessoa.DocumentoTipo_lcxExit(Sender: TObject);
begin
  inherited;
  dtmLookup.CadastrarRegBasicoGeralLookup(DocumentoTipo_lcx,'J_TIPO_DOCUMENTO', 'TIPO_DOCUMENTO_ID', vlLocal);
  dtmLookupFinanceiro.AtualizarTabelas;
end;

procedure TfrmCadPessoa.DocumentoTipo_lcxPropertiesChange(Sender: TObject);
begin
  inherited;
  if DocumentoTipo_lcx.text <> '' then
    vlLocal := DocumentoTipo_lcx.text;
end;

procedure TfrmCadPessoa.edtContatoDescricaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = 13 then
    btnContatoAdicionarClick(self);
end;

procedure TfrmCadPessoa.edtCPFExit(Sender: TObject);
begin
  inherited;
  if trim(edtCPF.Text) = '' then
    exit;

  if (cbxTipoCPF.ItemIndex = 0) then
  begin
    if not TestaCpf(edtCPF.Text) then
    begin
      if Application.MessageBox('CPF Inválido. Deseja Continuar?', 'Pergunta', mb_IconQuestion + mb_YesNo + MB_DEFBUTTON2) = idNo then
      begin
        edtCPF.SetFocus;
        abort;
      end;
    end;
  end
  else
    if not TestaCnpj(edtCPF.Text) then
    begin
      if Application.MessageBox('CNPJ Inválido. Deseja Continuar?', 'Pergunta', mb_IconQuestion + mb_YesNo + MB_DEFBUTTON2) = idNo then
      begin
        edtCPF.SetFocus;
        abort;
      end;
    end;

end;

procedure TfrmCadPessoa.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  case pgcDados.ActivePageIndex of
    0 : edtNome.SetFocus;
    1 : lcxEstadoCivil.SetFocus;
    2 : edtDescricaoBoelto.SetFocus;
  end;
end;

procedure TfrmCadPessoa.ExecuteCancelarExecute(Sender: TObject);
begin
  inherited;
  LimparCamposDuplicar;
  if (vgNovoCadastro) or (vlSelecionado) then
  begin
    vgPessoa.PessoaId := 0;
    ExecuteFecharExecute(self);
  end;
end;

procedure TfrmCadPessoa.ExecuteFecharExecute(Sender: TObject);
begin
  vgPessoa.PessoaId := -1;
  inherited;

end;

procedure TfrmCadPessoa.ExecuteGravarExecute(Sender: TObject);
var
  viTipo : String;

begin
  Validar;
  LimparCamposDuplicar;

  if cbxTipoCPF.ItemIndex = 1 then
  begin
    ClientAncestralDOCUMENTO.AsVariant         := null;
    ClientAncestralTIPO_DOCUMENTO_ID.AsVariant := null;
  end
  else ClientAncestralEMPRESA.AsVariant := null;

  ContatoGravar;

  if pos(vgPessoa.PessoaTipoVinculo, ClientAncestralTIPO.AsString) = 0 then
  begin
    viTipo :=  ClientAncestralTIPO.AsString;
    delete(viTipo,1,1);
    ClientAncestralTIPO.AsString := ';'+vgPessoa.PessoaTipoVinculo+viTipo;
  end;

  if rdbCadastroSimplificado.Checked then
       ClientAncestralCADASTRO_SIMPLIFICADO.AsString := 'S'
  else ClientAncestralCADASTRO_SIMPLIFICADO.AsString := 'N';

  inherited;
  vgPessoa.Nome := ClientAncestralNOME.AsString;

  sqlPessoaDocumento.Active := False;
  sqlPessoaDocumento.ParamByName('PESSOA_ID').AsInteger := ClientAncestralPESSOA_ID.AsInteger;
  sqlPessoaDocumento.Active := True;

  if vlSelecionado then
    ExecuteFecharExecute(self)
  else if btnSelecionar.Visible then
    btnSelecionar.SetFocus;

  dtmLookupFinanceiro.AtualizarTabelas;
end;

procedure TfrmCadPessoa.ExecuteIncluirExecute(Sender: TObject);
begin
  inherited;
  pgcDados.ActivePageIndex := 0;
  vgChave := '';
  if not vgNovoCadastro then
  begin
    frmPessoaPreCadastro := TfrmPessoaPreCadastro.Create(self);
    frmPessoaPreCadastro.ShowModal;
  end;

  // Selecionou uma Pessoa ja existente
  if vgPessoa.PessoaId > 0 then
  begin
    vgChave := IntToStr(vgPessoa.PessoaId);
    LoadData;
    exit;
  end;

  // Cancelou a Inserção
  if vgPessoa.PessoaId = -1 then
    ExecuteCancelarExecute(self)
  else
  begin
    ClientAncestralNOME.AsString := vgPessoa.CadastrarNovo;

    if Length(vgPessoa.CPF_CNPJ) >= 14 then
         cbxTipoCPF.ItemIndex := 1
    else cbxTipoCPF.ItemIndex := 0;
    ClientAncestralCPFCNPJ.AsString := vgPessoa.CPF_CNPJ;

    if (vgPessoa.PessoaTipoVinculo <> '') and (pos('6:Padrão',vgPessoa.PessoaTipoVinculo) = 0) then
         ClientAncestralTIPO.AsString := ';6:Padrão'+vgPessoa.PessoaTipoVinculo
    else ClientAncestralTIPO.AsString := ';6:Padrão';

    icxTipoPessoa.SetFocus;
  end;
end;

procedure TfrmCadPessoa.ExecutePesquisaExecute(Sender: TObject);
begin
  inherited;
  vgChave := PesqPessoa();
  if vgChave <> '' then
  begin
    LoadData;
    ContatoCarregar;
  end;
  SetState(dsBrowse);
  chbUtilizaBoletoClick(Self);
end;


procedure TfrmCadPessoa.FormActivate(Sender: TObject);
begin
  inherited;
  lcxNomeIdentificacao.Visible := not vgCadastrarFuncao;

  if lcxNomeIdentificacao.Visible then
       lblIdentificacao.Caption := 'Grupo de Identificação'
  else lblIdentificacao.Caption := 'Nome de Identificação no Sistema';
  chbUtilizaBoletoClick(Self);

  if pnlDadosPrincipais.Enabled then
    icxTipoPessoa.SetFocus;
end;

procedure TfrmCadPessoa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  LimparCamposDuplicar;
  dtmLookupContabil.AtualizarTabelas;
  dtmLookupFinanceiro.AtualizarTabelas;

  vgCadastrarFuncao   := False;
  vgNovoCadastro      := False;
  vlSelecionado       := False;
  vgDadosObrigatorio  := False;
  vgPessoa.Selecionar := False;
  vgPessoa.PessoaTipo := '';

  sqlCidadeEndereco.Close;
  sqlCidadeNaturalidade.Close;
  sqlPessoaDocumento.Close;

  Action       := caFree;
  frmCadPessoa := nil;
end;

procedure TfrmCadPessoa.FormCreate(Sender: TObject);
begin
  inherited;
  vgChave := '0';

  if pgcDados.ActivePageIndex = 1 then
    pgcDados.ActivePageIndex := 0;

  pgcDados.ActivePageIndex         := 0;
  sqlCidadeEndereco.Connection     := dtmControles.DB;
  sqlCidadeNaturalidade.Connection := dtmControles.DB;
  sqlPessoaDocumento.Connection    := dtmControles.DB;

  TipoCadastro(dtmControles.BuscarConfig('CADASTRO_PESSOA','GERAL','TIPO_CADASTRO','S'));
end;

procedure TfrmCadPessoa.FormShow(Sender: TObject);
var
  i : Integer;
begin
  chxListContatos.Items.Clear;
  inherited;
  if vgPessoa.PessoaId > 0 then
       vgchave := IntToStr(vgPessoa.PessoaId)
  else vgchave := '';

  LoadData;
  btnSelecionar.Visible  := vgPessoa.Selecionar;

  if vgNovoCadastro then
  begin
    ExecuteIncluirExecute(self);

    if vgPessoa.PessoaId = -1 then
      exit;
  end;
end;

procedure TfrmCadPessoa.HabilitarTipoCadastro(vpHabilitado: Boolean);
begin
  pgcDadosPessoa.Visible    := vpHabilitado;
  pgcEndereco.Visible       := vpHabilitado;
  tabComplemento.TabVisible := (icxTipoPessoa.EditValue = 'F') and vpHabilitado;

  if vpHabilitado then
  begin
    frmCadPessoa.Height := 522;
    rdbCadastroSimplificado.Font.Color := clBlack;;
    rdbCadastroCompleto.Font.Color     := clRed;
  end
  else
  begin
    frmCadPessoa.Height := 310;
    rdbCadastroSimplificado.Font.Color := clRed;
    rdbCadastroCompleto.Font.Color     := clBlack;;
  end;
end;

procedure TfrmCadPessoa.icxTipoContatoPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  icxOperadora.Enabled := icxTipoContato.ItemIndex = 4;
  if icxOperadora.ItemIndex < 4 then
    icxOperadora.EditValue := null; 
  
end;

procedure TfrmCadPessoa.icxTipoPessoaPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  tabComplemento.TabVisible := (icxTipoPessoa.EditValue = 'F') and (rdbCadastroCompleto.Checked);
  if icxTipoPessoa.EditValue = 'J' then
  begin
    cbxTipoCPF.ItemIndex     := 1;
    lbllConcordancia.Caption := 'Concordância';
  end
  else
  begin
    cbxTipoCPF.ItemIndex := 0;
    lbllConcordancia.Caption := 'Sexo';
  end;

  lcxNomeIdentificacao.Enabled := (lcxNomeIdentificacao.Visible);
end;

procedure TfrmCadPessoa.lcxNomeIdentificacaoDblClick(Sender: TObject);
var
  viGrupo : String;
begin
  inherited;
  if lcxNomeIdentificacao.EditValue <> null then
  begin
    viGrupo := lcxNomeIdentificacao.Text;
    if InputQuery('GRUPO DE IDENTIFICAÇÃO', 'Digite o Grupo de Identificação',viGrupo) then
    begin
      ExecutaSqlAuxiliar(' UPDATE J_PESSOA SET IDENTIFICACAO = '+QuotedStr(AnsiUpperCase(viGrupo))+
                         ' WHERE IDENTIFICACAO = '+ QuotedStr(lcxNomeIdentificacao.Text)+
                         '   AND NOT PESSOA_ID = '+ ClientAncestralPESSOA_ID.AsString,1);
      dtmLookupFinanceiro.AtualizarTabelas;
      ClientAncestralIDENTIFICACAO.AsString := viGrupo;
    end;
  end;
end;

procedure TfrmCadPessoa.lcxNomeIdentificacaoEnter(Sender: TObject);
begin
  inherited;
  vlLocal := '';
end;

procedure TfrmCadPessoa.lcxNomeIdentificacaoPropertiesChange(Sender: TObject);
begin
  inherited;
  if lcxNomeIdentificacao.text <> '' then
    vlLocal := lcxNomeIdentificacao.text;
end;

procedure TfrmCadPessoa.lcxProfissaoDblClick(Sender: TObject);
begin
  inherited;
  if lcxProfissao.Text = '' then
    exit;

  vlLocal := lcxProfissao.text;
  dtmLookup.CadastrarRegBasicoGeral(nil, ClientAncestral, lcxTipoDocumento.EditValue, 'G_TB_PROFISSAO', 'TB_PROFISSAO_ID', vlLocal, True, True, True);
end;

procedure TfrmCadPessoa.lcxProfissaoEnter(Sender: TObject);
begin
  inherited;
  vlLocal := '';
end;

procedure TfrmCadPessoa.lcxProfissaoExit(Sender: TObject);
begin
  inherited;
  dtmLookup.CadastrarRegBasicoGeralClient(ClientAncestral,'G_TB_PROFISSAO', 'TB_PROFISSAO_ID', vlLocal);
  dtmLookup.AtualizarTabelas;
end;

procedure TfrmCadPessoa.lcxProfissaoPropertiesChange(Sender: TObject);
begin
  inherited;
  if lcxProfissao.text <> '' then
    vlLocal := lcxProfissao.text;
end;

procedure TfrmCadPessoa.lcxTipoDocumentoDblClick(Sender: TObject);
begin
  inherited;
  if lcxTipoDocumento.Text = '' then
    exit;

  vlLocal := lcxTipoDocumento.text;
  dtmLookup.CadastrarRegBasicoGeral(nil, ClientAncestral, lcxTipoDocumento.EditValue, 'J_TIPO_DOCUMENTO', 'TIPO_DOCUMENTO_ID', vlLocal, True, True, True);
  dtmLookupFinanceiro.AtualizarTabelas;
end;

Procedure TfrmCadPessoa.lcxTipoDocumentoEnter(Sender: TObject);
begin
  inherited;
  vlLocal := '';
end;

procedure TfrmCadPessoa.lcxTipoDocumentoExit(Sender: TObject);
begin
  inherited;
  dtmLookup.CadastrarRegBasicoGeralClient(ClientAncestral,'J_TIPO_DOCUMENTO', 'TIPO_DOCUMENTO_ID', vlLocal);
  dtmLookupFinanceiro.AtualizarTabelas;
end;

procedure TfrmCadPessoa.lcxxTipoDocumentoPropertiesChange(Sender: TObject);
begin
  inherited;
  if lcxTipoDocumento.text <> '' then
    vlLocal := lcxTipoDocumento.text;
end;

procedure TfrmCadPessoa.LimparCamposDuplicar;
begin
  vgDadosDuplicar.endereco := '';
  vgDadosDuplicar.bairro   := '';
  vgDadosDuplicar.cidade   := '';
  vgDadosDuplicar.uf       := '';
  vgDadosDuplicar.cep      := '';
  vgDadosDuplicar.telefone := '';
  vgDadosDuplicar.ddd      := '';
  vgDadosDuplicar.CPF      := '';
  vgDadosDuplicar.SEXO     := '';
end;

procedure TfrmCadPessoa.LoadData;
begin
  inherited;
  if vgChave <> '' then
  begin
    pgcDados.ActivePageIndex := 0;
    ClientAncestral.close;
    DataSetAncestral.ParamByName('PESSOA_ID').AsBCD := StrToCurr(vgChave);
    ClientAncestral.open;

    if vgChave <> '0' then
    begin
      sqlPessoaDocumento.Active := False;
      sqlPessoaDocumento.ParamByName('PESSOA_ID').AsInteger := ClientAncestralPESSOA_ID.AsInteger;
      sqlPessoaDocumento.Active := True;
    end;

    if not ClientAncestral.IsEmpty then
      TipoCadastro(ClientAncestralCADASTRO_SIMPLIFICADO.AsString);
    SetState(dsBrowse);
  end;
  vgChave := '';
  pgcEndereco.ActivePageIndex := 0;
end;


procedure TfrmCadPessoa.pgcDadosChange(Sender: TObject);
begin
  inherited;
  chbEmailPrincipalClick(self);
end;

procedure TfrmCadPessoa.rdbCadastroCompletoClick(Sender: TObject);
begin
  inherited;
  HabilitarTipoCadastro(True);
end;

procedure TfrmCadPessoa.rdbCadastroSimplificadoClick(Sender: TObject);
begin
  inherited;
  HabilitarTipoCadastro(False);
end;

procedure TfrmCadPessoa.SetState(AState: TDataSetState);
begin
  inherited;
  btnSelecionar.Enabled := State in [dsBrowse];

  if ClientAncestral.Active then
  begin
    btnSelecionar.Enabled := not ClientAncestral.IsEmpty;

    if ClientAncestralTIPO_PESSOA.AsString = 'J' then
         cbxTipoCPF.ItemIndex := 1
    else cbxTipoCPF.ItemIndex := 0;
  end;

  PanelData.Enabled              := True;
  pnlDadosPrincipais.Enabled     := State in [dsEdit, dsInsert];
  pnlDadosComplementares.Enabled := State in [dsEdit, dsInsert];
  pnlDadosBoleto.Enabled         := State in [dsEdit, dsInsert];
  pnlEndereco.Enabled            := State in [dsEdit, dsInsert];
  pnlContato.Enabled             := State in [dsEdit, dsInsert];
  tabPessoaFisica.Enabled        := State in [dsEdit, dsInsert];
  tabPessoaJuridica.Enabled      := State in [dsEdit, dsInsert];
end;

procedure TfrmCadPessoa.sqlPessoaDocumentoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  btnDocumentoExcluir.Enabled := sqlPessoaDocumento.RecordCount > 0;
end;

procedure TfrmCadPessoa.TipoCadastro(vpTipo: string);
begin
  if vpTipo = 'S' then
  begin
    rdbCadastroSimplificado.Checked := True;
    rdbCadastroSimplificadoClick(self);
  end
  else
  begin
    rdbCadastroCompleto.Checked := True;;
    rdbCadastroCompletoClick(self);
  end;
end;

procedure TfrmCadPessoa.Validar;
var
  viPessoaID : Integer;
begin
  try
    VerificarPreenchimentoICX_DB(icxTipoPessoa.Text,'Tipo Pessoa', icxTipoPessoa);
    VerificarPreenchimentoEDT_db(edtNome.Text,'Nome', edtNome);
    VerificarPreenchimentoICX_db(icxSexo.Text,lbllConcordancia.Caption, icxSexo);
  except
    abort;
  end;

  viPessoaID := dtmLookupFinanceiro.GetPessoaID(RetornaNumerico(edtCPF.Text));
  if viPessoaID > 0 then
  begin
    if State = dsInsert then
    begin
      Application.MessageBox('CPF/CNPJ já conta no sistema!', 'Atenção', mb_ok + MB_ICONWARNING);
      edtCPF.SetFocus;
      Abort;
    end
    else
    if viPessoaID <> ClientAncestralPESSOA_ID.AsInteger then
    begin
      Application.MessageBox('CPF/CNPJ já conta no sistema!', 'Atenção', mb_ok + MB_ICONWARNING);
      edtCPF.SetFocus;
      Abort;
    end;
  end;

  if (ClientAncestralUTILIZA_BOLETO.AsString = 'S') then
  begin
    if Trim(ClientAncestralCPFCNPJ.AsString) = '' then begin
      Application.MessageBox('Por favor, Informar CPF/CNPJ para continuar!','Aviso', MB_OK + MB_ICONINFORMATION);
      pgcDados.ActivePage := tabIdentificacao;
      edtCPF.SetFocus;
      Abort;
    end;

    if Trim(ClientAncestralENDERECO_LOGRADOURO.AsString) = '' then begin
      Application.MessageBox('Por favor, Informar o logradouro para continuar!','Aviso', MB_OK + MB_ICONINFORMATION);
      pgcDados.ActivePage := tabIdentificacao;
      edtLogradouro.SetFocus;
      Abort;
    end;

    if Trim(ClientAncestralENDERECO_BAIRRO.AsString) = '' then begin
      Application.MessageBox('Por favor, Informar o bairro para continuar!','Aviso', MB_OK + MB_ICONINFORMATION);
      pgcDados.ActivePage := tabIdentificacao;
      edtBairro.SetFocus;
      Abort;
    end;

    if Trim(ClientAncestralENDERECO_CIDADE_UF.AsString) = '' then begin
      Application.MessageBox('Por favor, Informar o UF para continuar!','Aviso', MB_OK + MB_ICONINFORMATION);
      pgcDados.ActivePage := tabIdentificacao;
      cbxsCidadeUF.SetFocus;
      Abort;
    end;

    if ClientAncestralENDERECO_CIDADE_ID.AsInteger = 0  then begin
      Application.MessageBox('Por favor, Informar a cidade para continuar!','Aviso', MB_OK + MB_ICONINFORMATION);
      pgcDados.ActivePage := tabIdentificacao;
      lcxCidade.SetFocus;
      Abort;
    end;

    if Trim(ClientAncestralENDERECO_CEP.AsString) = '' then begin
      Application.MessageBox('Por favor, Informar o CEP para continuar!','Aviso', MB_OK + MB_ICONINFORMATION);
      pgcDados.ActivePage := tabIdentificacao;
      edtCep.SetFocus;
      Abort;
    end
  end;
end;

end.
