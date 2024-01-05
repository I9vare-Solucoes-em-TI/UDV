unit NaoAssociado;

interface

uses
  I9Query,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxGraphics, Menus, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxTextEdit, cxDropDownEdit, cxMaskEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, ExtCtrls, cxControls,
  cxContainer, cxEdit, cxLabel, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, DB, cxDBData, cxCurrencyEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxGroupBox, DBClient, cxPC, cxCheckBox, cxRadioGroup,
  SimpleDS, cxDBEdit, cxLookAndFeels, dxSkinBlueprint, dxSkinDarkRoom,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinHighContrast, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013White, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSpringTime,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxPCdxBarPopupMenu,
  cxNavigator, dxBarBuiltInMenu, Data.DBXInterBase, frxClass, DbxDevartInterBase;

type
  TfrmNaoAssociado = class(TForm)
    Panel2: TPanel;
    Bevel4: TBevel;
    lblInformacaoLancamento: TcxLabel;
    Panel4: TPanel;
    imgReceber: TImage;
    dtsNaoAssociado: TDataSource;
    ClientNaoAssociado: TClientDataSet;
    ClientNaoAssociadoContabil_Conta_Id: TIntegerField;
    ClientNaoAssociadoReferencia: TStringField;
    ClientNaoAssociadoValor: TCurrencyField;
    Panel1: TPanel;
    cxLabel3: TcxLabel;
    tabBalancete: TcxTabControl;
    Panel5: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    lcxCompromisso: TcxLookupComboBox;
    lcxCentroCusto: TcxLookupComboBox;
    cbxReferencia: TcxComboBox;
    edtValor: TcxCurrencyEdit;
    btnAdicionarCompromisso: TcxButton;
    btnConfirmar: TcxButton;
    btnCancelar: TcxButton;
    cxGroupBox4: TcxGroupBox;
    grdCompromissoVencido: TcxGrid;
    cxGridDBTableCompromissos: TcxGridDBTableView;
    cxGridDBCompromisso: TcxGridDBColumn;
    cxGridDBValor: TcxGridDBColumn;
    cxGridDBTableCompromissosColumn1: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    ClientNaoAssociadocalc_referencia: TStringField;
    cxGridDBTableCompromissosColumn2: TcxGridDBColumn;
    cxGridDBTableCompromissosColumn3: TcxGridDBColumn;
    ClientNaoAssociadoBalancete_grupo_id: TIntegerField;
    ClientNaoAssociadoCentro_Custo_Id: TIntegerField;
    sqlPessoa: TI9Query;
    dtsPessoa: TDataSource;
    cxLabel11: TcxLabel;
    sqlPessoaNOME: TStringField;
    sqlPessoaCPF: TStringField;
    sqlPessoaBOLETO_EMAIL: TStringField;
    sqlPessoaEMAIL: TStringField;
    sqlPessoaSITUACAO: TStringField;
    sqlPessoaPESSOA_ID: TBCDField;
    sqlPessoaGRAU: TStringField;
    Shape1: TShape;
    lcxIdentificacao: TcxLookupComboBox;
    rdbCPF: TcxRadioButton;
    rdbCNPJ: TcxRadioButton;
    edtCPF: TcxMaskEdit;
    edtEmail: TcxTextEdit;
    chxGravarRegistro: TcxCheckBox;
    chxGerarBoleto: TcxCheckBox;
    chxBoletoEmail: TcxCheckBox;
    sqlPessoaCEDENTE_ID: TBCDField;
    sqlPessoaSELECIONADO: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnAdicionarCompromissoClick(Sender: TObject);
    procedure ClientNaoAssociadoAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure tabBalanceteChange(Sender: TObject);
    procedure ClientNaoAssociadoCalcFields(DataSet: TDataSet);
    procedure chxGravarRegistroClick(Sender: TObject);
    procedure rdbCPFClick(Sender: TObject);
    procedure rdbCNPJClick(Sender: TObject);
    procedure chxGerarBoletoClick(Sender: TObject);
    procedure lcxIdentificacaoExit(Sender: TObject);
    procedure lcxIdentificacaoPropertiesChange(Sender: TObject);
    procedure lcxIdentificacaoEnter(Sender: TObject);
  private
    vlIdentificacao : String;
  public
    { Public declarations }
  end;

var
  frmNaoAssociado: TfrmNaoAssociado;
  vgReciboNaoAssociadoId : Integer;
  vgAtualizarRegistrosAvulsos : Boolean;

implementation

uses Lookup, Controles, Confirmacao, Rotinas, Lookup_Contabil;

{$R *.dfm}

procedure TfrmNaoAssociado.btnAdicionarCompromissoClick(Sender: TObject);
begin
  VerificarPreenchimentoLCX_TX(lcxIdentificacao.Text, 'Nome',lcxIdentificacao);
  VerificarPreenchimentoLCX_TX(lcxCompromisso.Text, 'Compromisso',lcxCompromisso);

  if Length(vlIdentificacao) < 5 then
  begin
    Application.MessageBox('Identificação inválida!!!', 'Atenção', MB_OK + MB_ICONWARNING);
    lcxIdentificacao.SetFocus;
    exit;
  end;

  if (edtValor.Text = '') or (edtValor.EditValue <= 0) then
  begin
    Application.MessageBox('Valor Inválido!!!', 'Atenção', MB_OK + MB_ICONWARNING);
    edtValor.SetFocus;
    abort;
  end;

  ClientNaoAssociado.Insert;
  ClientNaoAssociadoContabil_Conta_Id.AsInteger := lcxCompromisso.editValue;
  ClientNaoAssociadoValor.AsCurrency            := edtValor.EditValue;
  ClientNaoAssociadoReferencia.AsString         := dtmLookup.FormatarAnoMes(cbxReferencia.EditValue, 'S');
  ClientNaoAssociadoBalancete_Grupo_Id.AsInteger:= vgTabBalancete[tabBalancete.TabIndex];
  ClientNaoAssociadoCentro_Custo_Id.AsInteger   := lcxCentroCusto.EditValue;
  ClientNaoAssociado.Post;

  lcxCompromisso.EditValue := null;
  edtValor.EditValue       := 0;
  cbxReferencia.editValue  := dtmLookup.FormatarAnoMes(INtToStr(vgPeriodoAtual));
  lcxCompromisso.SetFocus;
end;

procedure TfrmNaoAssociado.btnCancelarClick(Sender: TObject);
begin
  vgAtualizarRegistrosAvulsos := False;
  vgReciboNaoAssociadoId := 0;
  close;
end;

procedure TfrmNaoAssociado.btnConfirmarClick(Sender: TObject);

  procedure GravarRegistro;
  begin
    if chxGravarRegistro.Checked then
    begin
      sqlPessoa.Insert;
      sqlPessoaPESSOA_ID.AsCurrency := dtmControles.GerarSequencia('T_PESSOA');
      sqlPessoaNOME.AsString        := lcxIdentificacao.Text;
      sqlPessoaCPF.AsString         := edtCPF.EditValue;
      sqlPessoaEMAIL.AsVariant      := edtEmail.EditValue;
      sqlPessoaBOLETO_EMAIL.AsString:= chxBoletoEmail.EditValue;
      sqlPessoaSITUACAO.AsString    := '0';
      sqlPessoaGRAU.AsString        := '0';
      sqlPessoaCEDENTE_ID.AsInteger := vgCedenteAtivo;
      sqlPessoaSELECIONADO.AsString := 'N';
      sqlPessoa.post;
    end;
  end;

  Procedure RegistrarPagamento;
  begin
    vgReciboNaoAssociadoId := dtmControles.GerarSequencia('RECIBO_NUMERO'+IntToStr(vgCedenteAtivo));
    while not ClientNaoAssociado.eof do
    begin
      ExecutaSqlAuxiliar(' INSERT INTO T_COMPROMISSO_VENCIDO( '+
                         '              COMPROMISSO_VENCIDO_ID, '+
                         '              CONTABIL_CONTA_ID, '+
                         '              VALOR_ATUAL, '+
                         '              VALOR_ORIGEM, '+
                         '              VALOR_ANTERIOR, '+
                         '              ANO_MES_REFERENCIA, '+
                         '              TIPO_OPERACAO, '+
                         '              OBRIGATORIO, '+
                         '              ATUALIZADO, '+
                         '              CENTRO_CUSTO_ID, '+
                         '              CEDENTE_ID, '+
                         '              BALANCETE_GRUPO_ID, '+
                         '              DATA_REALIZACAO, '+
                         '              RECIBO_NUMERO, '+
                         '              DESCRICAO, '+
                         '              ANO_MES_REALIZADO, '+
                         '              PESSOA_NOME, '+
                         '              SITUACAO) '+
                         ' VALUES(      :COMPROMISSO_VENCIDO_ID, '+
                         '              :CONTABIL_CONTA_ID, '+
                         '              :VALOR_ATUAL, '+
                         '              :VALOR_ORIGEM, '+
                         '              :VALOR_ANTERIOR, '+
                         '              :ANO_MES_REFERENCIA, '+
                         '              :TIPO_OPERACAO, '+
                         '              :OBRIGATORIO, '+
                         '              :ATUALIZADO, '+
                         '              :CENTRO_CUSTO_ID, '+
                         '              :CEDENTE_ID, '+
                         '              :BALANCETE_GRUPO_ID, '+
                         '              :DATA_REALIZACAO, '+
                         '              :RECIBO_NUMERO, '+
                         '              :DESCRICAO, '+
                         '              :ANO_MES_REALIZADO, '+
                         '              :PESSOA_NOME, '+
                         '              :SITUACAO)',2);
      with dtmControles.sqlAuxiliar do
      begin
        ParamByName('COMPROMISSO_VENCIDO_ID').AsBCD := dtmControles.GerarSequencia('T_COMPROMISSO_VENCIDO');
        ParamByName('CONTABIL_CONTA_ID').AsBCD      := ClientNaoAssociadoContabil_Conta_Id.AsInteger;
        ParamByName('VALOR_ATUAL').AsCurrency       := ClientNaoAssociadoValor.AsCurrency;
        ParamByName('VALOR_ORIGEM').AsCurrency      := ClientNaoAssociadoValor.AsCurrency;
        ParamByName('VALOR_ANTERIOR').AsCurrency    := 0;
        ParamByName('ANO_MES_REFERENCIA').AsString  := ClientNaoAssociadoReferencia.AsString;
        ParamByName('TIPO_OPERACAO').AsString       := 'C';
        ParamByName('OBRIGATORIO').AsString         := 'N';
        ParamByName('ATUALIZADO').AsString          := 'A';
        ParamByName('CENTRO_CUSTO_ID').AsBCD        := ClientNaoAssociadoCentro_Custo_Id.AsInteger;
        ParamByName('CEDENTE_ID').AsBCD             := vgCedenteAtivo;
        ParamByName('BALANCETE_GRUPO_ID').AsBCD     := ClientNaoAssociadoBalancete_Grupo_Id.AsInteger;
        ParamByName('DATA_REALIZACAO').AsString     := FormatDateTime('DD.MM.YYYY HH:MM:SS', vgDadosConfirmacao.Data);
        ParamByName('RECIBO_NUMERO').AsCurrency     := vgReciboNaoAssociadoId;
        ParamByName('ANO_MES_REALIZADO').AsInteger  :=  dtmLookup.PegarAnoMes(DateToStr(vgDadosConfirmacao.Data));

        ParamByName('DESCRICAO').AsString           := lcxIdentificacao.Text +' - '+ dtmControles.GetStr(' SELECT DESCRICAO FROM T_CONTABIL_CONTA WHERE '+
                                                    ' CONTABIL_CONTA_ID = ' +ClientNaoAssociadoContabil_Conta_Id.AsString);
        ParamByName('PESSOA_NOME').AsString         := lcxIdentificacao.Text;
        ParamByName('SITUACAO').AsString            := '2';
        ExecSQL;
      end;
      ClientNaoAssociado.Next;
    end;
  end;

  Procedure RegistrarCompromissoBoleto;
  begin
    vgDadosConfirmacao.Confirmado := False;  
    while not ClientNaoAssociado.eof do
    begin
      with dtmLookupContabil do
      begin
        vgCompromissoVencido.PessoaId          := sqlPessoaPESSOA_ID.AsInteger;
        vgCompromissoVencido.ContabilContaId   := ClientNaoAssociadoContabil_Conta_Id.AsInteger;
        vgCompromissoVencido.Valor             := ClientNaoAssociadoValor.AsCurrency;
        vgCompromissoVencido.CentroCustoId     := ClientNaoAssociadoCentro_Custo_Id.AsInteger;
        vgCompromissoVencido.BalanceteGrupoId  := ClientNaoAssociadoBalancete_Grupo_Id.AsInteger;
        vgCompromissoVencido.PeriodoInicial    := ClientNaoAssociadoReferencia.AsString;
        vgCompromissoVencido.PeriodoTipo       := 2;
        vgCompromissoVencido.PeriodoFinal      := ClientNaoAssociadoReferencia.AsString;
        vgCompromissoVencido.AtualizarAgendado := True;
        vgCompromissoVencido.MostrarMensagem   := True;
        vgCompromissoVencido.Obrigatorio       := 'N';
        vgCompromissoVencido.MostrarMensagem   := True;
        vgCompromissoVencido.BoletoId          := '';
        vgCompromissoVencido.ReciboId          := '';
        vgCompromissoVencido.SituacaoLocal     := '1';
        vgCompromissoVencido.LancamentoCompromissoId := '';
      end;
      dtmLookup.AdicionarCompromisso(True, False, True, 'C');
      ClientNaoAssociado.Next;      
    end;
  end;

begin
  vgDadosConfirmacao.Multa       := False;
  vgDadosConfirmacao.Saida       := False;
  vgDadosConfirmacao.GerarBoleto := chxGerarBoleto.Checked;

  ExibirFormulario(TfrmConfirmacao, frmConfirmacao, True);
  if not vgDadosConfirmacao.Confirmado then
    exit;

  GravarRegistro;

  ClientNaoAssociado.First;
  if chxGerarBoleto.Checked then
       RegistrarCompromissoBoleto
  else RegistrarPagamento;

  vgAtualizarRegistrosAvulsos := vgDadosConfirmacao.GerarBoleto;
  Close;
end;

procedure TfrmNaoAssociado.chxGerarBoletoClick(Sender: TObject);
begin
  chxBoletoEmail.Enabled := chxGerarBoleto.checked;

  if not chxGerarBoleto.checked then
    chxBoletoEmail.Checked := False;
end;

procedure TfrmNaoAssociado.chxGravarRegistroClick(Sender: TObject);
begin
  chxGerarBoleto.Enabled := chxGravarRegistro.checked;

  if not chxGravarRegistro.checked then
    chxGerarBoleto.Checked := False;
end;

procedure TfrmNaoAssociado.ClientNaoAssociadoAfterScroll(DataSet: TDataSet);
begin
  btnConfirmar.Enabled := ClientNaoAssociado.RecordCount > 0;
end;

procedure TfrmNaoAssociado.ClientNaoAssociadoCalcFields(DataSet: TDataSet);
begin
  ClientNaoAssociadocalc_referencia.AsString := dtmLookup.FormatarAnoMes(ClientNaoAssociado.FieldByName('REFERENCIA').AsString);
end;

procedure TfrmNaoAssociado.rdbCPFClick(Sender: TObject);
begin
  edtCPF.Properties.EditMask := '999\.999\.999\-99;0;_';
end;

procedure TfrmNaoAssociado.rdbCNPJClick(Sender: TObject);
begin
  edtCPF.Properties.EditMask := '99\.999\.999\/9999\-99;0;_';
end;

procedure TfrmNaoAssociado.tabBalanceteChange(Sender: TObject);
begin
  dtmLookup.sqlPlanoContasReceitas.Filtered := False;
  dtmLookup.sqlPlanoContasReceitas.Filter   := 'FIXO = '+QuotedStr('N') + 'AND BALANCETE_GRUPO_ID = ' +IntToStr(vgTabBalancete[tabBalancete.TabIndex]);
  dtmLookup.sqlPlanoContasReceitas.Filtered := True;
  lcxCompromisso.RepositoryItem := dtmLookup.Lista_PlanoContasReceitas;

  dtmLookup.sqlCentroCustoAtivo.Filtered := False;
  dtmLookup.sqlCentroCustoAtivo.Filter   := 'BALANCETE_GRUPO_ID = ' +IntToStr(vgTabBalancete[tabBalancete.TabIndex]);
  dtmLookup.sqlCentroCustoAtivo.Filtered := True;

  lcxCentroCusto.EditValue  := vgCentroCustoPrincipal[tabBalancete.TabIndex];
  cbxReferencia.editValue   := vgPeriodoAtualS;
  lcxCentroCusto.EditValue  := vgCentroCustoPrincipal[tabBalancete.TabIndex];
  lcxCompromisso.EditValue  := null;
end;

procedure TfrmNaoAssociado.FormActivate(Sender: TObject);
begin
  dtmLookup.CarregarPeriodo(cbxReferencia,2,'','');
  cbxReferencia.editValue := dtmLookup.FormatarAnoMes(IntToStr(vgPeriodoAtual));
  tabBalanceteChange(tabBalancete);
  edtValor.editValue := 0;
  rdbCPF.Checked     := True;
  rdbCPFClick(self);   
  vlIdentificacao := '';
  lcxIdentificacao.SetFocus;
  vgDadosConfirmacao.GerarBoleto := False;  
    
end;

procedure TfrmNaoAssociado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  sqlPessoa.Close;

  Action := caFree;
  frmNaoAssociado := nil;
end;

procedure TfrmNaoAssociado.FormCreate(Sender: TObject);
begin
  sqlPessoa.Connection := dtmControles.DB;
  sqlPessoa.Active     := True;
  dtmLookup.CarregarTabBalancete(tabBalancete);
end;

procedure TfrmNaoAssociado.lcxIdentificacaoEnter(Sender: TObject);
begin
  lcxIdentificacao.Text := vlIdentificacao;
end;

procedure TfrmNaoAssociado.lcxIdentificacaoExit(Sender: TObject);
begin
  if lcxIdentificacao.EditValue > 0 then
  begin
    edtCPF.EditValue   := sqlPessoaCPF.AsString;
    edtEmail.EditValue := sqlPessoaEMAIL.AsString;

    if Length(edtCPF.EditValue) > 11 then
         rdbCNPJ.Checked := True
    else rdbCPF.Checked := True;
    lcxCompromisso.SetFocus;
  end
  else
  begin
    if not edtCPF.Enabled then
    begin
      edtCPF.EditValue   := '';
      edtEmail.EditValue := '';
      chxGravarRegistro.Checked := False;      
    end;
  end;

  edtCPF.Enabled            := lcxIdentificacao.EditValue = null;
  chxGravarRegistro.Enabled := lcxIdentificacao.EditValue = null;
  chxGerarBoleto.Enabled    := lcxIdentificacao.EditValue > 0;

  lcxIdentificacao.Text := vlIdentificacao;
end;

procedure TfrmNaoAssociado.lcxIdentificacaoPropertiesChange(Sender: TObject);
begin
  if lcxIdentificacao.text <> '' then
    vlIdentificacao := lcxIdentificacao.text;
end;

end.

