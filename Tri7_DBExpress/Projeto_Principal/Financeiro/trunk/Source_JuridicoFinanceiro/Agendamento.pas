unit Agendamento;

interface

uses
  I9Query,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinCoffee, dxSkinMcSkin, dxSkinOffice2007Silver,
  cxGraphics, cxLookAndFeelPainters, dxSkinscxPCPainter, Menus, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxImageComboBox, cxTextEdit, cxCalendar, cxCurrencyEdit, dxSkinsdxBarPainter,
  dxBar, dxBarExtItems, cxClasses, dxGDIPlusClasses, cxImage, GIFImg, ExtCtrls,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxControls, cxGridCustomView, cxGrid, cxPC, cxDropDownEdit, StdCtrls,
  cxButtons, cxGroupBox, cxMaskEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxContainer, cxLabel, DBClient, SimpleDS, cxRadioGroup,
  cxLookAndFeels, dxSkinBlueprint, dxSkinDarkRoom, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinHighContrast, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013White, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSpringTime,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxPCdxBarPopupMenu,
  cxNavigator, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinDevExpressDarkStyle, dxBarBuiltInMenu,
  DbxDevartInterBase, cxBarEditItem, Vcl.ImgList, cxCheckBox;

type

  TVetMeses = array[1..12,1..2] of string;

  TfrmAgendamento = class(TForm)
    pnlFiltro: TPanel;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Shape1: TShape;
    PanelBotaoFechar: TPanel;
    pgcFiltro: TcxPageControl;
    tbcFiltro: TcxTabSheet;
    pnlDadosFiltro: TPanel;
    Panel2: TPanel;
    cxBtnIncluir: TcxButton;
    cxBtnExcluir: TcxButton;
    cxBtnFechar: TcxButton;
    pnlDadosFiltroPersonalizado: TPanel;
    sqlLivroAgendamento: TI9Query;
    dtsLivroAgendamento: TDataSource;
    rdbPesquisaSimplificada: TcxRadioButton;
    rdbPesquisaPersonalizada: TcxRadioButton;
    pnlPesquisaPersonalizada: TPanel;
    cxLabel6: TcxLabel;
    Panel6: TPanel;
    cxLabel2: TcxLabel;
    sqlLivroAgendamentoLIVRO_AGENDAMENTO_ID: TBCDField;
    sqlLivroAgendamentoTIPO: TStringField;
    sqlLivroAgendamentoDATA_INICIAL: TSQLTimeStampField;
    sqlLivroAgendamentoDATA_FINAL: TSQLTimeStampField;
    sqlLivroAgendamentoPERIODO: TStringField;
    sqlLivroAgendamentoVALOR_PARCELA: TBCDField;
    sqlLivroAgendamentoQTD: TBCDField;
    sqlLivroAgendamentoVALOR_PROLABORE: TBCDField;
    sqlLivroAgendamentoSITUACAO: TStringField;
    sqlLivroAgendamentoESPECIE: TStringField;
    sqlLivroAgendamentoBALANCETE_GRUPO_ID: TBCDField;
    sqlLivroAgendamentoHISTORICO: TStringField;
    sqlLivroAgendamentoOBSERVACAO: TStringField;
    sqlLivroAgendamentoOPERACAO: TStringField;
    sqlLivroAgendamentoCONTABIL_CONTA_ID: TBCDField;
    sqlLivroAgendamentoPESSOA_ID: TBCDField;
    sqlLivroAgendamentoCENTRO_CUSTO_ID: TBCDField;
    tabOpcoes: TcxTabControl;
    pgcDados: TcxPageControl;
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    cxBtnAlterar: TcxButton;
    popContratoItem: TPopupMenu;
    mniCancelarItemContratual: TMenuItem;
    mniReativarItemContratual: TMenuItem;
    sqlLivroAgendamentoCAIXA_ID: TBCDField;
    dxBarManager1: TdxBarManager;
    dxBarManager1BarFinanceiro: TdxBar;
    lblPrevisaoSaldo: TcxBarEditItem;
    lblSaldoDespesas: TcxBarEditItem;
    cxBarEditItem1: TcxBarEditItem;
    dxPrevisaoPagar: TdxBarStatic;
    dxBarStatic1: TdxBarStatic;
    dxPrevisaoAporte: TdxBarStatic;
    dxPrevisaoReceitas: TdxBarStatic;
    dxPrevisaoRetirada: TdxBarStatic;
    dxPrevisaoDiferenca: TdxBarStatic;
    N1: TMenuItem;
    MNIDuplicarItemSelecionado: TMenuItem;
    sqlLivroAgendamentoQTD_RESTANTE: TStringField;
    pgcItens: TcxPageControl;
    tab1: TcxTabSheet;
    tab2: TcxTabSheet;
    cxGridContrato: TcxGrid;
    cxGridDBTableAgenda: TcxGridDBTableView;
    cxGridDBTableAgendaContaLancamento: TcxGridDBColumn;
    cxGridDBTableAgendaColumn1: TcxGridDBColumn;
    cxGridDBTableAgendaColumn2: TcxGridDBColumn;
    cxGridDBTableAgendaPESSOA: TcxGridDBColumn;
    cxGridDBTableAgendaHISTORICO: TcxGridDBColumn;
    cxGridDBTableAgendaDATAINICIAL: TcxGridDBColumn;
    cxGridDBTableAgendaPERIODO: TcxGridDBColumn;
    cxGridDBTableAgendaDATAFINAL: TcxGridDBColumn;
    cxGridDBTableAgendaVALOR: TcxGridDBColumn;
    QTDcxGridDBTableContratoQtd: TcxGridDBColumn;
    cxGridDBTableAgendaVALORTOTAL: TcxGridDBColumn;
    cxGridDBTableAgendaESPECIE: TcxGridDBColumn;
    cxGridDBTableAgendaColumn3: TcxGridDBColumn;
    cxGridDBTableAgendaSITUACAO: TcxGridDBColumn;
    cxGridLevel12: TcxGridLevel;
    cxGridOrcamento: TcxGrid;
    cxGridDBTableOrcamentos: TcxGridDBTableView;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn14: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxOrçamento: TcxButton;
    imgOperacoes: TImageList;
    dxPrevisaoOrcamento: TdxBarStatic;
    sqlLivroAgendamentoORCAMENTO_ID: TBCDField;
    sqlLivroAgendamentoCONTABIL_GRUPO_ID: TBCDField;
    cxGridDBTableAgendaColumn4: TcxGridDBColumn;
    sqlLivroAgendamentoCALC_ORCAMENTO: TBooleanField;
    sqlLivroAgendamentoCALC_VALOR: TCurrencyField;
    N2: TMenuItem;
    mniRedefinirParcelaInicial: TMenuItem;
    sqlLivroAgendamentoPARCELA_INICIAL: TBCDField;
    sqlLivroAgendamentoCALC_OBSERVACAO: TStringField;
    cxGridDBTableAgendaColumn5: TcxGridDBColumn;
    sqlLivroAgendamentoDATA_REGISTRO: TSQLTimeStampField;
    sqlLivroAgendamentoDATA_PROXIMA: TSQLTimeStampField;
    sqlLivroAgendamentoVALOR_PROXIMO: TBCDField;
    sqlLivroAgendamentoUSUARIO_ID: TBCDField;
    cxGridDBTableAgendaColumn6: TcxGridDBColumn;
    cxGridDBTableAgendaSelecionar: TcxGridDBColumn;
    sqlLivroAgendamentocalc_Selecionado: TBooleanField;
    sqlLivroAgendamentoBOLETA_ID: TBCDField;
    sqlLivroAgendamentoCALC_BOLETO: TBooleanField;
    cxGridDBTableAgendaBoleto: TcxGridDBColumn;
    cxLabel4: TcxLabel;
    edtBuscaRapida: TcxTextEdit;
    lcxBuscaGrupo: TcxLookupComboBox;
    cbxFrequencia: TcxComboBox;
    cbxTempo: TcxComboBox;
    btnPesquisar: TcxButton;
    btnLimpar: TcxButton;
    btnAtivar: TcxButton;
    sqlLivroAgendamentoCONTABIL_RL: TStringField;
    cxLabel5: TcxLabel;
    cxLabel7: TcxLabel;
    sqlPlanoContas: TI9Query;
    sqlPlanoContasCONTABIL_CONTA_ID: TBCDField;
    sqlPlanoContasDESCRICAO: TStringField;
    sqlPlanoContasIR: TStringField;
    sqlPlanoContasCNJ: TStringField;
    dtsPlanoContas: TDataSource;
    lcxGrupoContabil: TcxLookupComboBox;
    lcxCompromisso: TcxLookupComboBox;
    lcxModalidadeCompromisso: TcxLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure rdbPesquisaSimplificadaClick(Sender: TObject);
    procedure rdbPesquisaPersonalizadaClick(Sender: TObject);
    procedure tbcPeriodoChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxBtnFecharClick(Sender: TObject);
    procedure edtBuscaRapidaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxBtnExcluirClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure tabOpcoesChange(Sender: TObject);
    procedure cxBtnIncluirClick(Sender: TObject);
    procedure cxBtnAlterarClick(Sender: TObject);
    procedure mniCancelarItemContratualClick(Sender: TObject);
    procedure mniReativarItemContratualClick(Sender: TObject);
    procedure sqlLivroAgendamentoAfterScroll(DataSet: TDataSet);
    procedure cxGridDBTableAgendaDblClick(Sender: TObject);
    procedure MNIDuplicarItemSelecionadoClick(Sender: TObject);
    procedure cxOrçamentoClick(Sender: TObject);
    procedure sqlLivroAgendamentoCalcFields(DataSet: TDataSet);
    procedure mniRedefinirParcelaInicialClick(Sender: TObject);
    procedure cxGridDBTableAgendaSelecionarPropertiesChange(Sender: TObject);
    procedure btnAtivarClick(Sender: TObject);
    procedure cxLookupComboBox1PropertiesEditValueChanged(Sender: TObject);
  private
    vlCriandoForm, vlPermitirAtivarAgendamento, vlPermitirModificarContaUsuario : Boolean;
    vlCondicao   : String;
    vlVetPeriodo : array[1..12] of string;
    procedure MontarSqlContas;
    procedure CarregarSaldoPrevissao;
    procedure RedefinirParcela(vpAutomatico : Boolean = False);
    procedure VerificarExisteBoleto;
  public
    procedure CadastroAgendamento(vpId : Integer; vpOrcamento : Boolean = False);
  end;

var
  frmAgendamento: TfrmAgendamento;
  vgAgendamentoLocalizarId : Integer;
  vgAgendamentoLocalizarOperacao : String;

implementation

uses Controles, Lookup_Contabil, Rotinas, CadastroRapidoContas,
  Lookup_Servico, Lookup, Cadastro, LookupFinanceiro;

{$R *.dfm}

procedure TfrmAgendamento.btnAtivarClick(Sender: TObject);
var
  viSelecionados : String;
begin
  if Application.MessageBox(Pchar('Ativar item(s) marcado(s). Confirma?'), 'Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
    exit;

  sqlLivroAgendamento.DisableControls;
  sqlLivroAgendamento.First;
  viSelecionados := '';
  while not sqlLivroAgendamento.Eof do
  begin
    if sqlLivroAgendamentocalc_Selecionado.AsBoolean then
    begin
      if viSelecionados = '' then
           viSelecionados := sqlLivroAgendamentoLIVRO_AGENDAMENTO_ID.AsString
      else viSelecionados := viSelecionados + ','+ sqlLivroAgendamentoLIVRO_AGENDAMENTO_ID.AsString;
    end;
    sqlLivroAgendamento.Next;
  end;

  if viSelecionados = '' then
  begin
    sqlLivroAgendamento.EnableControls;
    Application.MessageBox('Nenhum item marcado pra ativação !!!','Atenção', MB_OK + MB_ICONWARNING);
    exit;
  end;

  ExecutaSqlAuxiliar(' UPDATE J_LIVRO_AGENDAMENTO SET SITUACAO = '+QuotedStr('1')+
                     ' WHERE LIVRO_AGENDAMENTO_ID IN ('+viSelecionados+')',1);
  sqlLivroAgendamento.EnableControls;
  tabOpcoesChange(SELF);
end;

procedure TfrmAgendamento.btnLimparClick(Sender: TObject);
begin
  edtBuscaRapida.Clear;
  lcxCompromisso.EditValue := null;
  cbxFrequencia.ItemIndex      := 0;
  cbxTempo.ItemIndex           := 0;
  lcxBuscaGrupo.EditValue      := null;
  lcxGrupoContabil.EditValue      := null;
  lcxModalidadeCompromisso.EditValue := null;

  if not vlCriandoForm then
    btnPesquisarClick(Self);
 end;

procedure TfrmAgendamento.btnPesquisarClick(Sender: TObject);
begin
  MontarSqlContas;
end;

procedure TfrmAgendamento.CadastroAgendamento(vpId : Integer; vpOrcamento : Boolean = False);

  function VerificarAlteracao:Boolean;
  var
    viSql : String;
  begin
    if (not vgAgendamentoAlterar) and (not dtmLookupServico.sqlLivroAgendamento.IsEmpty) then
    begin
      viSql := ' UPDATE J_LIVRO_FINANCEIRO SET '+
               '              HISTORICO  = :HISTORICO, '+
               '              CAIXA_ID   = :CAIXA_ID, '+
               '              CENTRO_RESERVA_ID = :CENTRO_RESERVA_ID, '+
               '              CENTRO_CUSTO_ID = :CENTRO_CUSTO_ID, '+
               '              TIPO_MODALIDADE_ID = :TIPO_MODALIDADE_ID, '+
               '              OBSERVACAO = :OBSERVACAO, '+
               '              CONTABIL_RL = :CONTABIL_RL, '+
               '              CNJ = :CNJ, '+
               '              IR = :IR, '+
               '              DOCUMENTO_NUMERO = :DOCUMENTO_NUMERO, '+
               '              REGISTRO_PARCIAL = :REGISTRO_PARCIAL ';
      if not (dtmLookupServico.sqlLivroAgendamento.FieldByName('PERIODO').AsInteger in [8,9]) then
        viSql := viSql+ ' ,VALOR_AGENDADO = :VALOR_AGENDADO';

      if dtmLookupServico.sqlLivroAgendamento.FieldByName('ORCAMENTO_ID').AsInteger > 0 then
           viSql := viSql+ ' ,ORCAMENTO_ID = '+dtmLookupServico.sqlLivroAgendamento.FieldByName('ORCAMENTO_ID').AsString
      else viSql := viSql+ ' ,ORCAMENTO_ID = NULL';

      viSql := viSql + ' WHERE LIVRO_AGENDAMENTO_ID = '+ IntToStr(vgDadosCadastro.ChaveIdPrincipal)+
                       '   AND SITUACAO IN (1,2)';

      ExecutaSqlAuxiliar(viSql,2);
      with dtmControles.sqlAuxiliar do
      begin
        ParamByName('HISTORICO').AsString           := dtmLookupServico.sqlLivroAgendamento.FieldByName('HISTORICO').AsString;
        ParamByName('CAIXA_ID').AsString            := dtmLookupServico.sqlLivroAgendamento.FieldByName('CAIXA_ID').AsString;
        ParamByName('OBSERVACAO').AsString          := dtmLookupServico.sqlLivroAgendamento.FieldByName('OBSERVACAO').AsString;
        ParamByName('CONTABIL_RL').AsString         := dtmLookupServico.sqlLivroAgendamento.FieldByName('CONTABIL_RL').AsString;
        ParamByName('CNJ').AsString                 := dtmLookupServico.sqlLivroAgendamento.FieldByName('CNJ').AsString;
        ParamByName('IR').AsString                  := dtmLookupServico.sqlLivroAgendamento.FieldByName('IR').AsString;
        ParamByName('DOCUMENTO_NUMERO').AsString    := dtmLookupServico.sqlLivroAgendamento.FieldByName('DOCUMENTO_NUMERO').AsString;
        ParamByName('CENTRO_RESERVA_ID').AsInteger  := dtmLookupServico.sqlLivroAgendamento.FieldByName('CENTRO_RESERVA_ID').AsInteger;
        ParamByName('CENTRO_CUSTO_ID').AsInteger    := dtmLookupServico.sqlLivroAgendamento.FieldByName('CENTRO_CUSTO_ID').AsInteger;
        ParamByName('TIPO_MODALIDADE_ID').AsInteger := dtmLookupServico.sqlLivroAgendamento.FieldByName('TIPO_MODALIDADE_ID').AsInteger;
        ParamByName('REGISTRO_PARCIAL').AsString    := dtmLookupServico.sqlLivroAgendamento.FieldByName('REGISTRO_PARCIAL').AsString;

        if not (dtmLookupServico.sqlLivroAgendamento.FieldByName('PERIODO').AsInteger in [8,9]) then
          ParamByName('VALOR_AGENDADO').AsCurrency := dtmLookupServico.sqlLivroAgendamento.FieldByName('VALOR_PARCELA').AsCurrency;
        ExecSQL;
      end;
      Result := True;
    end
    else Result := False;
  end;

  {$REGION 'SetarTabOperacao'}
  procedure SetarTabOperacao;
  var
    viOperacao : String;
  begin
    if vpOrcamento then
      tabOpcoes.TabIndex := 2
    else
      if (not vlPermitirAtivarAgendamento) and (vpId = 0) then
        tabOpcoes.TabIndex := 6
    else
    begin
      viOperacao := dtmLookupServico.sqlLivroAgendamento.FieldByName('OPERACAO').AsString;
      case viOperacao[1] of
        'D' : tabOpcoes.TabIndex := 0;
        'R' : tabOpcoes.TabIndex := 1;
        'A' : begin
                if pos('D', viOperacao) > 0 then
                     tabOpcoes.TabIndex := 3
                else tabOpcoes.TabIndex := 4;
              end;
      end;
    end;
  end;
  {$ENDREGION}

begin
  vgDadosCadastro.SomentePesquisa := False;
  dtmLookupServico.ClientParcelas.EmptyDataSet;
  dtmLookupServico.sqlFinanceiroAgendamento.Active := False;

  if (vpId > 0) and (not vpOrcamento) then
  begin
    dtmLookupServico.sqlFinanceiroAgendamento.ParamByName('LIVRO_AGENDAMENTO_ID').AsInteger := sqlLivroAgendamentoLIVRO_AGENDAMENTO_ID.AsInteger;
    dtmLookupServico.sqlFinanceiroAgendamento.Active := True;
    dtmLookupServico.VerificarParcelasGeral(sqlLivroAgendamentoPERIODO.AsInteger, '', dtmLookupServico.sqlFinanceiroAgendamento);
  end;

  dtmLookup.CadastrarFormRapido('J_LIVRO_AGENDAMENTO','LIVRO_AGENDAMENTO_ID', 0,0, vpId);
  if vpOrcamento then
       CadOrcamento(True)
  else ExibirFormulario(TfrmCadastroRapidoContas, frmCadastroRapidoContas, True);

  if not vgDadosCadastro.Confirmado then
    exit;

  With dtmLookupServico.sqlLivroAgendamento do
  begin
    Active := False;
    ParamByName('LIVRO_AGENDAMENTO_ID').AsInteger := vgDadosCadastro.ChaveIdPrincipal;
    Active := True;
  end;

  if not VerificarAlteracao then
  begin
   // Apagar Compromissos do Agendamento ainda não Concluídos
    ExecutaSqlAuxiliar(' DELETE FROM J_LIVRO_FINANCEIRO '+
                       ' WHERE LIVRO_AGENDAMENTO_ID = '+InttoStr(vgDadosCadastro.ChaveIdPrincipal)+
                       '   AND SITUACAO = '+QuotedStr('1'),1);
    dtmLookupServico.RealizarLancamentoContas;
  end;

  SetarTabOperacao;

  tabOpcoesChange(self);
  sqlLivroAgendamento.Refresh;
  sqlLivroAgendamento.Locate('LIVRO_AGENDAMENTO_ID', vgDadosCadastro.ChaveIdPrincipal, [loCaseInsensitive]);

  if sqlLivroAgendamentoQTD.AsInteger = 1 then
    exit;
  RedefinirParcela(True);
  cxGridDBTableAgenda.DataController.Groups.FullExpand;
end;

procedure TfrmAgendamento.CarregarSaldoPrevissao;
var
  viValorPrevisao : Currency;
begin
  viValorPrevisao := dtmLookupContabil.CalcularPrevisaoAgendamento(vlCondicao, 'D');
  dtmLookupContabil.PreencherSaldoLabel('A Pagar R$ ',viValorPrevisao, dxPrevisaoPagar);

  viValorPrevisao := dtmLookupContabil.CalcularPrevisaoAgendamento(vlCondicao, 'AD');
  dtmLookupContabil.PreencherSaldoLabel('Retirada R$ ',viValorPrevisao, dxPrevisaoRetirada);

  viValorPrevisao := dtmLookupContabil.CalcularPrevisaoAgendamento(vlCondicao, 'O');
  dtmLookupContabil.PreencherSaldoLabel('Orçamentos R$ ',viValorPrevisao, dxPrevisaoOrcamento);

  viValorPrevisao := dtmLookupContabil.CalcularPrevisaoAgendamento(vlCondicao, 'R');
  dtmLookupContabil.PreencherSaldoLabel('A Receber R$ ',viValorPrevisao, dxPrevisaoReceitas);

  viValorPrevisao := dtmLookupContabil.CalcularPrevisaoAgendamento(vlCondicao, 'AR');
  dtmLookupContabil.PreencherSaldoLabel('Aporte R$ ',viValorPrevisao, dxPrevisaoAporte);

  viValorPrevisao := dtmLookupContabil.CalcularPrevisaoAgendamento(vlCondicao, '');
  dtmLookupContabil.PreencherSaldoLabel('Diferença R$ ',viValorPrevisao, dxPrevisaoDiferenca);
end;

procedure TfrmAgendamento.cxBtnAlterarClick(Sender: TObject);
begin
  VerificarExisteBoleto;
  if not vlPermitirModificarContaUsuario then
     if sqlLivroAgendamentoUSUARIO_ID.AsString <> vgUsuarioID then
     begin
       Application.MessageBox('Sem permissão pra alterar este agendamento!!!','Atenção', MB_OK + MB_ICONWARNING);
       exit;
     end;

  if (sqlLivroAgendamentoOPERACAO.AsString = 'O') and (sqlLivroAgendamentoSITUACAO.AsInteger = 4) then
  begin
    Application.MessageBox('Orçamento Desativado. Alteração não permitida!!!','Atenção', MB_OK + MB_ICONWARNING);
    exit;
  end;

  vgAgendamentoAlterar := dtmLookupServico.VerificarPagamentosContas(sqlLivroAgendamentoSITUACAO.AsInteger,
                                                                   sqlLivroAgendamentoLIVRO_AGENDAMENTO_ID.AsString,'', True);
  CadastroAgendamento(sqlLivroAgendamentoLIVRO_AGENDAMENTO_ID.AsInteger, sqlLivroAgendamentoOPERACAO.AsString = 'O')
end;

procedure TfrmAgendamento.cxBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAgendamento.cxBtnIncluirClick(Sender: TObject);
begin
  repeat
    vgAgendamentoAlterar := True;
    CadastroAgendamento(0);
  until not vgSalvarNovo;
end;

procedure TfrmAgendamento.cxBtnExcluirClick(Sender: TObject);
var
  viAgendamentoId : String;
begin
  VerificarExisteBoleto;

  if not vlPermitirModificarContaUsuario then
     if sqlLivroAgendamentoUSUARIO_ID.AsString <> vgUsuarioID then
     begin
       Application.MessageBox('Sem permissão pra excluir este agendamento!!!','Atenção', MB_OK + MB_ICONWARNING);
       exit;
     end;

  viAgendamentoId := sqlLivroAgendamentoLIVRO_AGENDAMENTO_ID.AsString;
  dtmLookupServico.VerificarPagamentosContas(sqlLivroAgendamentoSITUACAO.AsInteger, viAgendamentoId,  'Exclusão nao permitida. Já existe pagamentos vinculados ao mesmo!!!');

  if Application.MessageBox(Pchar('Excluir item de agendamento selecionado. Confirma?'), 'Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
    exit;

  dtmLookupServico.ApagarAgendamentoItem(viAgendamentoId);
  sqlLivroAgendamento.Refresh;
end;

procedure TfrmAgendamento.cxGridDBTableAgendaDblClick(Sender: TObject);
begin
  cxBtnAlterarClick(self);
end;

procedure TfrmAgendamento.cxGridDBTableAgendaSelecionarPropertiesChange(
  Sender: TObject);
begin
  sqlLivroAgendamento.Post;
end;

procedure TfrmAgendamento.cxLookupComboBox1PropertiesEditValueChanged(
  Sender: TObject);
begin
  lcxCompromisso.Enabled := not (lcxGrupoContabil.EditValue = null);

  if vlCriandoForm or (lcxGrupoContabil.Text = '') then
  begin
    if lcxGrupoContabil.Text = '' then
      lcxCompromisso.EditValue := null;
    exit;
  end;

  sqlPlanoContas.Active := False;
  sqlPlanoContas.ParamByName('CONTABIL_GRUPO_ID').AsInteger := lcxGrupoContabil.EditValue;
  sqlPlanoContas.Active  := True;

  if sqlPlanoContas.RecordCount = 1 then
       lcxCompromisso.EditValue := sqlPlanoContasCONTABIL_CONTA_ID.AsInteger
  else lcxCompromisso.EditValue := null;
end;

procedure TfrmAgendamento.cxOrçamentoClick(Sender: TObject);
begin
  CadastroAgendamento(0, True);
  dtmLookupFinanceiro.AtualizarTabelas;
end;

procedure TfrmAgendamento.MNIDuplicarItemSelecionadoClick(Sender: TObject);
begin
  vgAgendamentoAlterar := True;
  vgDuplicarContaId := sqlLivroAgendamentoLIVRO_AGENDAMENTO_ID.AsInteger;
  cxBtnIncluirClick(self);
end;

procedure TfrmAgendamento.edtBuscaRapidaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    btnPesquisarClick(Self);
end;

procedure TfrmAgendamento.FormActivate(Sender: TObject);
begin
  if vlCriandoForm then
  begin
    btnLimparClick(self);
    btnPesquisarClick(Self);
  end;

  if vgAgendamentoLocalizarId > 0 then
  begin
    if vgAgendamentoLocalizarOperacao = 'D' then
      tabOpcoes.TabIndex := 0
    else
      if vgAgendamentoLocalizarOperacao = 'R' then
        tabOpcoes.TabIndex := 1
    else
      if vgAgendamentoLocalizarOperacao = 'O' then
        tabOpcoes.TabIndex := 2
    else
      if vgAgendamentoLocalizarOperacao = 'AD' then
        tabOpcoes.TabIndex := 3
    else
      if vgAgendamentoLocalizarOperacao = 'AR' then
        tabOpcoes.TabIndex := 4;

    sqlLivroAgendamento.Locate('LIVRO_AGENDAMENTO_ID', vgAgendamentoLocalizarId, [loCaseInsensitive]);
    vgAgendamentoLocalizarId := 0;

    if vgAgendamentoLocalizarOperacao = 'O' then
         cxGridOrcamento.SetFocus
    else cxGridContrato.SetFocus;
  end
  else edtBuscaRapida.SetFocus;

  vlCriandoForm := False;
  LockWindowUpdate(0);
end;

procedure TfrmAgendamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmAgendamento := nil;
end;

procedure TfrmAgendamento.FormCreate(Sender: TObject);
begin
  LockWindowUpdate(Handle);
  pgcDados.HideTabs        := True;
  pgcItens.HideTabs        := True;
  tabOpcoes.TabIndex       := 0;
  pgcDados.ActivePageIndex := 0;
  pgcItens.ActivePageIndex := 0;
  tabOpcoesChange(self);

  sqlLivroAgendamento.Connection := dtmControles.DB;
  sqlPlanoContas.Connection      := dtmControles.DB;

  vlCriandoForm := True;

  rdbPesquisaSimplificada.Checked := True;
  rdbPesquisaSimplificadaClick(self);
  vlPermitirAtivarAgendamento     := dtmControles.CodPermissao('ESP_ATIVAR_AGENDAMENTO')[6] = '1';
  vlPermitirModificarContaUsuario := dtmControles.CodPermissao('ESP_MODIFICAR_CONTA_USUARIO')[6] = '1';
end;

procedure TfrmAgendamento.mniCancelarItemContratualClick(Sender: TObject);
var
  viQtd : Integer;

begin

  VerificarExisteBoleto;

  if not vlPermitirModificarContaUsuario then
     if sqlLivroAgendamentoUSUARIO_ID.AsString <> vgUsuarioID then
     begin
       Application.MessageBox('Sem permissão pra alterar este agendamento!!!','Atenção', MB_OK + MB_ICONWARNING);
       exit;
     end;

  if sqlLivroAgendamentoOPERACAO.AsString <> 'O' then
  begin
    if Application.MessageBox(Pchar('Cancelar Agendamento Selecionado. Confirma?'), 'Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
      exit;
  end
  else
  begin
    // Verifica se existem itens agendados vinculados a este orçamento
    viQtd := dtmControles.GetInt(' SELECT COUNT(LIVRO_AGENDAMENTO_ID) FROM J_LIVRO_AGENDAMENTO '+
                                 ' WHERE ORCAMENTO_ID = '+ sqlLivroAgendamentoLIVRO_AGENDAMENTO_ID.AsString);
    if viQtd > 0 then
    begin
      Application.MessageBox('Existe(m) Agendamento(s) vinculado(s) a este Orçamento!!!','Atenção', MB_OK + MB_ICONWARNING);
      exit;
    end;

    if Application.MessageBox(Pchar('Desativar Orçamento Selecionado. Confirma?'), 'Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
      exit;
  end;

  dtmLookupServico.ReativarCancelarConta(sqlLivroAgendamentoLIVRO_AGENDAMENTO_ID.AsString, '4','1,2');
  sqlLivroAgendamento.Refresh;
  CarregarSaldoPrevissao;
end;

procedure TfrmAgendamento.mniReativarItemContratualClick(Sender: TObject);
var
  viPosicao : Integer;
begin
  if Application.MessageBox(Pchar('Reativar Agendamento Selecionado. Confirma?'), 'Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
    exit;

  dtmLookupServico.ReativarCancelarConta(sqlLivroAgendamentoLIVRO_AGENDAMENTO_ID.AsString, '1','4');
  sqlLivroAgendamento.Refresh;
  CarregarSaldoPrevissao;
end;

procedure TfrmAgendamento.mniRedefinirParcelaInicialClick(Sender: TObject);
begin
  RedefinirParcela;
end;

procedure TfrmAgendamento.MontarSqlContas;
var
  viSql, viValor : String;
begin
  Screen.Cursor := crHourGlass;
  visql := ' SELECT LA.*, '+
           ' CASE LA.QTD '+
           '   WHEN 1 THEN ''1'''+
           '   ELSE (SELECT COUNT(LV.LIVRO_FINANCEIRO_ID) FROM J_LIVRO_FINANCEIRO LV '+
           '        WHERE LV.LIVRO_AGENDAMENTO_ID = LA.LIVRO_AGENDAMENTO_ID '+
           '          AND SITUACAO IN (1,2)) END AS QTD_RESTANTE, '+
           '   (SELECT MIN(LF.DATA_VENCIMENTO) FROM J_LIVRO_FINANCEIRO LF '+
           '    WHERE LF.LIVRO_AGENDAMENTO_ID = LA.LIVRO_AGENDAMENTO_ID '+
           '      AND SITUACAO IN (1,2)) AS DATA_PROXIMA, '+
           '   (SELECT FIRST 1 VALOR_PARCELA FROM J_LIVRO_FINANCEIRO LF '+
           '    WHERE LF.LIVRO_AGENDAMENTO_ID = LA.LIVRO_AGENDAMENTO_ID '+
           '      AND SITUACAO IN (1,2) '+
           '     ORDER BY DATA_VENCIMENTO) AS VALOR_PROXIMO, '+
           '    (SELECT FIRST 1 LF.BOLETA_ID FROM J_LIVRO_FINANCEIRO LF '+
           '      WHERE NOT LF.BOLETA_ID IS NULL '+
           '     AND LF.LIVRO_AGENDAMENTO_ID = LA.LIVRO_AGENDAMENTO_ID '+
           '     AND LF.SITUACAO = ''1'') AS BOLETA_ID '+
           ' FROM J_LIVRO_AGENDAMENTO LA  '+
           '   LEFT OUTER JOIN J_PESSOA P ON' +
           '   LA.PESSOA_ID = P.PESSOA_ID ';

  case tabOpcoes.TabIndex of
    0 : viSql := viSql+ ' WHERE SITUACAO = '+ QuotedStr('1') +' AND LA.OPERACAO = '+ QuotedStr('D');
    1 : viSql := viSql+ ' WHERE SITUACAO = '+ QuotedStr('1') +' AND LA.OPERACAO = '+ QuotedStr('R');
    2 : viSql := viSql+ ' WHERE LA.OPERACAO = '+ QuotedStr('O');
    3 : viSql := viSql+ ' WHERE SITUACAO = '+ QuotedStr('1') +' AND LA.OPERACAO = '+ QuotedStr('AD');
    4 : viSql := viSql+ ' WHERE SITUACAO = '+ QuotedStr('1') +' AND LA.OPERACAO = '+ QuotedStr('AR');
    5 : viSql := viSql+ ' WHERE (SITUACAO IN (2,3,4)) and (LA.OPERACAO <> '+ QuotedStr('O')+')';
    6 : viSql := viSql+ ' WHERE SITUACAO = '+ QuotedStr('0');
  end;

  if not vlPermitirModificarContaUsuario then
    viSql := viSql + ' AND LA.USUARIO_ID = '+ vgUsuarioID;

  vlCondicao := '';

  if lcxGrupoContabil.EditValue <> null then
    vlCondicao := vlCondicao + ' AND LA.CONTABIL_GRUPO_ID = '+IntToStr(lcxGrupoContabil.EditValue);

  if lcxCompromisso.EditValue <> null then
    vlCondicao := vlCondicao + ' AND LA.CONTABIL_CONTA_ID = '+IntToStr(lcxCompromisso.EditValue);

  if lcxModalidadeCompromisso.EditValue <> null then
    vlCondicao := vlCondicao + ' AND LA.TIPO_MODALIDADE_ID = '+IntToStr(lcxModalidadeCompromisso.EditValue);

  if trim(edtBuscaRapida.Text) <> '' then
  begin
    vlCondicao := vlCondicao + ' AND ((LA.HISTORICO LIKE '+ QuotedStr('%'+edtBuscaRapida.Text+'%')+')'+
                                     ' OR (P.NOME LIKE '+ QuotedStr('%'+edtBuscaRapida.Text+'%') +')'+
                                     ' OR (P.EMPRESA LIKE '+ QuotedStr('%'+edtBuscaRapida.Text+'%') +')';
    viValor := TrocaVirgPPto(RetornaNumericoValor(edtBuscaRapida.Text));
    if viValor <> '' then
         vlCondicao := vlCondicao + ' OR ((LA.VALOR_PROLABORE = '+ viValor +') OR (LA.VALOR_PARCELA= '+ viValor +')))'
    else vlCondicao := vlCondicao + ')';
  end;

  if lcxBuscaGrupo.Text <> '' then
    vlCondicao := vlCondicao + ' AND P.IDENTIFICACAO = '+QuotedStr(lcxBuscaGrupo.Text);

  if lcxCompromisso.EditValue <> null then
    vlCondicao := vlCondicao + ' AND LA.CONTABIL_CONTA_ID = '+ IntToStr(lcxCompromisso.EditValue);

  case cbxFrequencia.ItemIndex of
   1 : vlCondicao := vlCondicao+ ' AND ((QTD = 1) AND ((PERIODO = 8) OR (PERIODO = 9)))';
   2 : begin
        case cbxTempo.ItemIndex of
          1 : vlCondicao := vlCondicao+ ' AND ((((PERIODO = 8) OR (PERIODO = 9)) AND QTD > 1))';
          2 : vlCondicao := vlCondicao+ ' AND (PERIODO = 1)';
          else  vlCondicao := vlCondicao+ ' AND ((PERIODO = 1) OR (((PERIODO = 8) OR (PERIODO = 9)) AND QTD > 1))';
        end;
       end;
    3 : vlCondicao := ' AND (PERIODO = 5)';
  end;

  viSql := viSql + vlCondicao + ' ORDER BY LA.DATA_INICIAL ';

  sqlLivroAgendamento.AfterScroll := nil;
  sqlLivroAgendamento.Active := False;
  sqlLivroAgendamento.SQL.Text := viSql;
  sqlLivroAgendamento.Active := True;
  sqlLivroAgendamento.AfterScroll := sqlLivroAgendamentoAfterScroll;
  sqlLivroAgendamentoAfterScroll(sqlLivroAgendamento);
  Screen.Cursor := crDefault;
  cxGridDBTableAgenda.DataController.Groups.FullExpand;
  cxGridDBTableOrcamentos.DataController.Groups.FullExpand;
  CarregarSaldoPrevissao;
end;

procedure TfrmAgendamento.rdbPesquisaPersonalizadaClick(Sender: TObject);
begin
  pnlDadosFiltroPersonalizado.Visible := True;
  pnlFiltro.Height := 173;
  lcxGrupoContabil.SetFocus;
end;

procedure TfrmAgendamento.rdbPesquisaSimplificadaClick(Sender: TObject);
begin
  pnlDadosFiltroPersonalizado.Visible := False;
  pnlFiltro.Height := 129;
  if not vlCriandoForm then
    edtBuscaRapida.SetFocus;
end;

procedure TfrmAgendamento.RedefinirParcela(vpAutomatico: Boolean);
var
  viNumParcela : String;
  viFlag : Boolean;

  procedure RedefinirParcelas;
  var
    viCount : Integer;
  begin
    ExecutaSimpleDSAux(' SELECT LIVRO_FINANCEIRO_ID, PARCELA '+
                       ' FROM J_LIVRO_FINANCEIRO '+
                       ' WHERE LIVRO_AGENDAMENTO_ID = '+sqlLivroAgendamentoLIVRO_AGENDAMENTO_ID.AsString+
                       ' ORDER BY LIVRO_AGENDAMENTO_ID',0);
    viCount := 0;
    with dtmControles.SimpleAuxiliar do
    begin
      First;
      while not eof do
      begin
        edit;
        FieldByName('PARCELA').AsInteger := StrToInt(viNumParcela)+viCount;
        ApplyUpdates(-1);
        next;
        inc(viCount);
      end;
    end;
    dtmControles.SimpleAuxiliar.Close;
  end;

begin
  if sqlLivroAgendamentoPARCELA_INICIAL.IsNull then
       viNumParcela := '1'
  else viNumParcela := sqlLivroAgendamentoPARCELA_INICIAL.AsString;

  if not vpAutomatico then
  begin
    repeat
      viFlag := True;
      if InputQueryAux('Parcela Inicial', 'Número', viNumParcela, 'I') then
      begin
        try
          if (StrToInt(viNumParcela) > 300) or (StrToInt(viNumParcela) <= 0) then
          begin
            viFlag := False;
            ShowMessage('Nº da Parcela Inválida!!!');
          end;
        except
          viFlag := False;
          ShowMessage('Parcela Inválida!!!');
        end;
      end
      else Abort;
    until viFlag;
  end;

  ExecutaSqlAuxiliar(' UPDATE J_LIVRO_AGENDAMENTO SET PARCELA_INICIAL = '+ viNumParcela+
                     ' WHERE LIVRO_AGENDAMENTO_ID = '+sqlLivroAgendamentoLIVRO_AGENDAMENTO_ID.AsString,1);
  RedefinirParcelas;
  sqlLivroAgendamento.Refresh;
end;

procedure TfrmAgendamento.sqlLivroAgendamentoAfterScroll(DataSet: TDataSet);
begin
  mniCancelarItemContratual.Enabled  := (not sqlLivroAgendamento.IsEmpty) and (sqlLivroAgendamentoSITUACAO.AsInteger = 1);
  mniReativarItemContratual.Enabled  := (not sqlLivroAgendamento.IsEmpty) and (sqlLivroAgendamentoSITUACAO.AsInteger = 4);
  mniDuplicarItemSelecionado.Enabled := (not sqlLivroAgendamento.IsEmpty) and (sqlLivroAgendamentoOPERACAO.AsString <> 'O');
  mniRedefinirParcelaInicial.Enabled := (not sqlLivroAgendamento.IsEmpty) and
                                        (sqlLivroAgendamentoPERIODO.AsInteger in [8,9]) and (sqlLivroAgendamentoSITUACAO.AsInteger = 1);

  cxBtnAlterar.Enabled              := (not sqlLivroAgendamento.IsEmpty) and (tabOpcoes.TabIndex <= 5) and (sqlLivroAgendamentoSITUACAO.AsInteger in [1,2]);
  cxBtnExcluir.Enabled              := (not sqlLivroAgendamento.IsEmpty);
end;

procedure TfrmAgendamento.sqlLivroAgendamentoCalcFields(DataSet: TDataSet);
begin
  sqlLivroAgendamentoCALC_ORCAMENTO.AsBoolean := sqlLivroAgendamentoORCAMENTO_ID.AsInteger > 0;
  sqlLivroAgendamentoCALC_BOLETO.AsBoolean    := sqlLivroAgendamentoBOLETA_ID.AsInteger > 0;

  if sqlLivroAgendamentoOPERACAO.AsString = 'O' then
  begin
    if sqlLivroAgendamentoSITUACAO.AsInteger = 4 then
         sqlLivroAgendamentoCALC_VALOR.AsCurrency := 0
    else sqlLivroAgendamentoCALC_VALOR.AsCurrency :=sqlLivroAgendamentoVALOR_PROLABORE.AsCurrency;
  end;

  if sqlLivroAgendamentoOBSERVACAO.AsString <> ''  then
    sqlLivroAgendamentoCALC_OBSERVACAO.AsString := 'Obs.: '+sqlLivroAgendamentoOBSERVACAO.AsString;

  if sqlLivroAgendamentoPARCELA_INICIAL.AsInteger > 1 then
    sqlLivroAgendamentoCALC_OBSERVACAO.AsString := sqlLivroAgendamentoCALC_OBSERVACAO.AsString + ' - O Número da Parcela inicial é a '+ sqlLivroAgendamentoPARCELA_INICIAL.AsString;
end;

procedure TfrmAgendamento.tabOpcoesChange(Sender: TObject);
begin
  if tabOpcoes.Tabs.Tabs[tabOpcoes.TabIndex].Caption = 'Orçamentos' then
  begin
    pgcItens.ActivePageIndex := 1;
    mniCancelarItemContratual.Caption := 'Desativar Orçamento Selecionado';
    mniReativarItemContratual.Caption := 'Reativar Orçamento Selecionado';
  end
  else
  begin
    pgcItens.ActivePageIndex := 0;
    mniCancelarItemContratual.Caption := 'Desativar Agendamento Selecionado';
    mniReativarItemContratual.Caption := 'Reativar Agendamento Selecionado';
  end;
  btnPesquisarClick(Self);

  if tabOpcoes.TabIndex = 6 then
    dtmLookup.MarcarDesmarcarItensSimpleDataSet('N', sqlLivroAgendamento);

  cxGridDBTableAgendaSelecionar.Visible := (tabOpcoes.TabIndex = 6) and (vlPermitirAtivarAgendamento);
  btnAtivar.Enabled                     := (tabOpcoes.TabIndex = 6) and (vlPermitirAtivarAgendamento);
  cxGridDBTableAgenda.OptionsSelection.CellSelect := (tabOpcoes.TabIndex = 6) and (vlPermitirAtivarAgendamento);
end;

procedure TfrmAgendamento.tbcPeriodoChange(Sender: TObject);
begin
  btnPesquisarClick(self);
end;

procedure TfrmAgendamento.VerificarExisteBoleto;

  procedure CancelamentoBoleto;
  var
    viSql, viBoletos :  string;
  begin
    dtmControles.StartTransaction;
    try
      viSql := ' update J_BOLETO set SITUACAO = ' + QuotedStr('3') + ','+
               ' DATA_CANCELADO = ' + QuotedStr(FormatDateTime('DD.MM.YYYY HH:MM:SS', Now)) + ',' +
               ' CONT_REMESSA = NULL ' ;

      viBoletos := dtmControles.GetStr(' SELECT list(BOLETO_ID) '+
                                         ' FROM '+
                                         ' (SELECT  DISTINCT(CAST(boleta_id AS INTEGER)) as BOLETO_ID '+
                                         ' FROM J_LIVRO_FINANCEIRO '+
                                         ' WHERE LIVRO_AGENDAMENTO_ID = '+sqlLivroAgendamentoLIVRO_AGENDAMENTO_ID.AsString+
                                         ' AND NOT BOLETA_ID IS NULL '+
                                         ' and SITUACAO <> 3)');

      viSql := viSql + ' where BOLETO_ID IN ('+viBoletos+')';
      ExecutaSqlAuxiliar(viSql, 1);
      ExecutaSqlAuxiliar('update J_LIVRO_FINANCEIRO set BOLETA_ID = NULL where BOLETA_ID IN ('+viBoletos+')',1);
      dtmControles.Commit;
    except
      dtmControles.Roolback;
      ShowMessage('Problema no cancelamento do boleto');
      abort;
    end;
  end;
begin
  if sqlLivroAgendamentoCALC_BOLETO.AsBoolean then
  begin
    if Application.MessageBox(PChar('Existe Boleto Vinculado. Deseja cancelar?'),'Confirmação',
         MB_YESNO + MB_ICONQUESTION) = IDNO
    then
    begin
      Screen.Cursor := crDefault;
      Abort;
    end;

    CancelamentoBoleto;

//    Application.MessageBox('Existe Boleto Gerado pra este Agendamento !!!','Atenção', MB_OK + MB_ICONWARNING);
  end;
end;

end.
