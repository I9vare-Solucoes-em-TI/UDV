unit Agendamento;

interface

uses
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
  DbxDevartInterBase, cxBarEditItem, Vcl.ImgList;

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
    sqlLivroAgendamento: TSimpleDataSet;
    dtsLivroAgendamento: TDataSource;
    rdbPesquisaSimplificada: TcxRadioButton;
    rdbPesquisaPersonalizada: TcxRadioButton;
    pnlPesquisaPersonalizada: TPanel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    edtHistorico: TcxTextEdit;
    lcxPesqCompromisso: TcxLookupComboBox;
    Panel6: TPanel;
    cxLabel2: TcxLabel;
    sqlLivroAgendamentoLIVRO_AGENDAMENTO_ID: TFMTBCDField;
    sqlLivroAgendamentoTIPO: TStringField;
    sqlLivroAgendamentoDATA_INICIAL: TSQLTimeStampField;
    sqlLivroAgendamentoDATA_FINAL: TSQLTimeStampField;
    sqlLivroAgendamentoPERIODO: TStringField;
    sqlLivroAgendamentoVALOR_PARCELA: TFMTBCDField;
    sqlLivroAgendamentoQTD: TFMTBCDField;
    sqlLivroAgendamentoVALOR_PROLABORE: TFMTBCDField;
    sqlLivroAgendamentoSITUACAO: TStringField;
    sqlLivroAgendamentoESPECIE: TStringField;
    sqlLivroAgendamentoBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlLivroAgendamentoHISTORICO: TStringField;
    sqlLivroAgendamentoOBSERVACAO: TStringField;
    sqlLivroAgendamentoOPERACAO: TStringField;
    sqlLivroAgendamentoCONTABIL_CONTA_ID: TFMTBCDField;
    sqlLivroAgendamentoPESSOA_ID: TFMTBCDField;
    sqlLivroAgendamentoDATA_REGISTRO: TSQLTimeStampField;
    sqlLivroAgendamentoCENTRO_CUSTO_ID: TFMTBCDField;
    tabOpcoes: TcxTabControl;
    pgcDados: TcxPageControl;
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    edtBuscaRapida: TcxTextEdit;
    cbxFrequencia: TcxComboBox;
    cbxTempo: TcxComboBox;
    btnPesquisar: TcxButton;
    btnLimpar: TcxButton;
    cxButton3: TcxButton;
    cxBtnAlterar: TcxButton;
    popContratoItem: TPopupMenu;
    mniCancelarItemContratual: TMenuItem;
    mniReativarItemContratual: TMenuItem;
    sqlLivroAgendamentoCAIXA_ID: TFMTBCDField;
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
    cxOr�amento: TcxButton;
    imgOperacoes: TImageList;
    dxPrevisaoOrcamento: TdxBarStatic;
    sqlLivroAgendamentoORCAMENTO_ID: TFMTBCDField;
    sqlLivroAgendamentoCONTABIL_GRUPO_ID: TFMTBCDField;
    cxGridDBTableAgendaColumn4: TcxGridDBColumn;
    sqlLivroAgendamentoCALC_ORCAMENTO: TBooleanField;
    sqlLivroAgendamentoCALC_VALOR: TCurrencyField;
    N2: TMenuItem;
    mniRedefinirParcelaInicial: TMenuItem;
    sqlLivroAgendamentoPARCELA_INICIAL: TFMTBCDField;
    sqlLivroAgendamentoCALC_OBSERVACAO: TStringField;
    cxGridDBTableAgendaColumn5: TcxGridDBColumn;
    sqlLivroAgendamentoDATA_PROXIMA: TSQLTimeStampField;
    sqlLivroAgendamentoVALOR_PROXIMO: TFMTBCDField;
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
    procedure cxButton3Click(Sender: TObject);
    procedure tabOpcoesChange(Sender: TObject);
    procedure cxBtnIncluirClick(Sender: TObject);
    procedure cxBtnAlterarClick(Sender: TObject);
    procedure mniCancelarItemContratualClick(Sender: TObject);
    procedure mniReativarItemContratualClick(Sender: TObject);
    procedure sqlLivroAgendamentoAfterScroll(DataSet: TDataSet);
    procedure cxGridDBTableAgendaDblClick(Sender: TObject);
    procedure MNIDuplicarItemSelecionadoClick(Sender: TObject);
    procedure cxOr�amentoClick(Sender: TObject);
    procedure sqlLivroAgendamentoCalcFields(DataSet: TDataSet);
    procedure mniRedefinirParcelaInicialClick(Sender: TObject);
  private
    vlCriandoForm : Boolean;
    vlVetMeses   : TVetMeses;
    vlCondicao   : String;
    vlVetPeriodo : array[1..12] of string;
    procedure MontarSqlContas;
    procedure CadastroAgendamento(vpId : Integer; vpOrcamento : Boolean = False);
    procedure CarregarSaldoPrevissao;
  public
    { Public declarations }
  end;

var
  frmAgendamento: TfrmAgendamento;

implementation

uses Controles, Lookup_Contabil, Rotinas, CadastroRapidoContas,
  Lookup_Servico, Lookup, Cadastro;

{$R *.dfm}

procedure TfrmAgendamento.btnLimparClick(Sender: TObject);
begin
  edtHistorico.Clear;
  edtBuscaRapida.Clear;
  lcxPesqCompromisso.EditValue := null;
  cbxFrequencia.ItemIndex      := 0;
  cbxTempo.ItemIndex           := 0;

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
    if not vgAgendamentoAlterar then
    begin
      viSql := ' UPDATE J_LIVRO_FINANCEIRO SET '+
               '              HISTORICO = :HISTORICO, '+
               '              CAIXA_ID   = :CAIXA_ID, '+
               '              RESERVA_ID = :RESERVA_ID, '+
               '              CENTRO_CUSTO_ID = :CENTRO_CUSTO_ID, '+
               '              OBSERVACAO = :OBSERVACAO ';
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
        ParamByName('HISTORICO').AsString         := dtmLookupServico.sqlLivroAgendamento.FieldByName('HISTORICO').AsString;
        ParamByName('CAIXA_ID').AsString          := dtmLookupServico.sqlLivroAgendamento.FieldByName('CAIXA_ID').AsString;
        ParamByName('OBSERVACAO').AsString        := dtmLookupServico.sqlLivroAgendamento.FieldByName('OBSERVACAO').AsString;
        ParamByName('RESERVA_ID').AsInteger       := dtmLookupServico.sqlLivroAgendamento.FieldByName('RESERVA_ID').AsInteger;
        ParamByName('CENTRO_CUSTO_ID').AsInteger  := dtmLookupServico.sqlLivroAgendamento.FieldByName('CENTRO_CUSTO_ID').AsInteger;

        if not (dtmLookupServico.sqlLivroAgendamento.FieldByName('PERIODO').AsInteger in [8,9]) then
          ParamByName('VALOR_AGENDADO').AsCurrency := dtmLookupServico.sqlLivroAgendamento.FieldByName('VALOR_PARCELA').AsCurrency;
        ExecSQL(False);
      end;
      Result := True;
    end
    else Result := False;
  end;

begin
  vgDadosCadastro.SomentePesquisa := False;
  dtmLookupServico.ClientParcelas.EmptyDataSet;
  dtmLookupServico.sqlFinanceiroAgendamento.Active := False;

  if (vpId > 0) and (not vpOrcamento) then
  begin
    dtmLookupServico.sqlFinanceiroAgendamento.DataSet.ParamByName('LIVRO_AGENDAMENTO_ID').AsInteger := sqlLivroAgendamentoLIVRO_AGENDAMENTO_ID.AsInteger;
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
    DataSet.ParamByName('LIVRO_AGENDAMENTO_ID').AsInteger := vgDadosCadastro.ChaveIdPrincipal;
    Active := True;
  end;

  if not VerificarAlteracao then
  begin
   // Apagar Compromissos do Agendamento ainda n�o Conclu�dos
    ExecutaSqlAuxiliar(' DELETE FROM J_LIVRO_FINANCEIRO '+
                       '  WHERE LIVRO_AGENDAMENTO_ID = '+InttoStr(vgDadosCadastro.ChaveIdPrincipal)+
                       '   AND SITUACAO = '+QuotedStr('1'),1);
    dtmLookupServico.RealizarLancamentoContas;
    vgCompromissoVencido.LivroAgendamentoId := 0;
  end;
  btnLimparClick(self);

  if vpOrcamento then
    tabOpcoes.TabIndex := 0;

  sqlLivroAgendamento.Locate('LIVRO_AGENDAMENTO_ID', vgDadosCadastro.ChaveIdPrincipal, [loCaseInsensitive]);
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
  dtmLookupContabil.PreencherSaldoLabel('Or�amentos R$ ',viValorPrevisao, dxPrevisaoOrcamento);

  viValorPrevisao := dtmLookupContabil.CalcularPrevisaoAgendamento(vlCondicao, 'R');
  dtmLookupContabil.PreencherSaldoLabel('A Receber R$ ',viValorPrevisao, dxPrevisaoReceitas);

  viValorPrevisao := dtmLookupContabil.CalcularPrevisaoAgendamento(vlCondicao, 'AR');
  dtmLookupContabil.PreencherSaldoLabel('Aporte R$ ',viValorPrevisao, dxPrevisaoAporte);

  viValorPrevisao := dtmLookupContabil.CalcularPrevisaoAgendamento(vlCondicao, '');
  dtmLookupContabil.PreencherSaldoLabel('Diferen�a R$ ',viValorPrevisao, dxPrevisaoDiferenca);
end;

procedure TfrmAgendamento.cxBtnAlterarClick(Sender: TObject);
begin
  if (sqlLivroAgendamentoOPERACAO.AsString = 'O') and (sqlLivroAgendamentoSITUACAO.AsInteger = 4) then
  begin
    Application.MessageBox('Or�amento Desativado. Altera��o n�o permitida!!!','Aten��o', MB_OK + MB_ICONWARNING);
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
  vgAgendamentoAlterar := True;
  CadastroAgendamento(0);
end;

procedure TfrmAgendamento.cxBtnExcluirClick(Sender: TObject);
var
  viAgendamentoId : String;
begin
  viAgendamentoId := sqlLivroAgendamentoLIVRO_AGENDAMENTO_ID.AsString;
  dtmLookupServico.VerificarPagamentosContas(sqlLivroAgendamentoSITUACAO.AsInteger, viAgendamentoId,  'Exclus�o nao permitida. J� existe pagamentos vinculados ao mesmo!!!');

  if Application.MessageBox(Pchar('Excluir item de agendamento selecionado. Confirma?'), 'Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
    exit;

  dtmLookupServico.ApagarAgendamentoItem(viAgendamentoId);
  sqlLivroAgendamento.Refresh;
end;

procedure TfrmAgendamento.cxButton3Click(Sender: TObject);
begin
  sqlLivroAgendamento.Refresh;
end;

procedure TfrmAgendamento.cxGridDBTableAgendaDblClick(Sender: TObject);
begin
  cxBtnAlterarClick(self);
end;

procedure TfrmAgendamento.cxOr�amentoClick(Sender: TObject);
begin
  CadastroAgendamento(0, True);
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
  btnLimparClick(self);
  vlCriandoForm := False;
  btnLimparClick(Self);  
  edtBuscaRapida.SetFocus;
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

  sqlLivroAgendamento.Connection := dtmControles.DB;
  vlCriandoForm            := True;

  rdbPesquisaSimplificada.Checked := True;
  rdbPesquisaSimplificadaClick(self);
end;

procedure TfrmAgendamento.mniCancelarItemContratualClick(Sender: TObject);
var
  viQtd : Integer;

begin
  if sqlLivroAgendamentoOPERACAO.AsString <> 'O' then
  begin
    if Application.MessageBox(Pchar('Cancelar Agendamento Selecionado. Confirma?'), 'Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
      exit;
  end
  else
  begin
    // Verifica se existem itens agendados vinculados a este or�amento
    viQtd := dtmControles.GetInt(' SELECT COUNT(LIVRO_AGENDAMENTO_ID) FROM J_LIVRO_AGENDAMENTO '+
                                 ' WHERE ORCAMENTO_ID = '+ sqlLivroAgendamentoLIVRO_AGENDAMENTO_ID.AsString);
    if viQtd > 0 then
    begin
      Application.MessageBox('Existe(m) Agendamento(s) vinculado(s) a este Or�amento!!!','Aten��o', MB_OK + MB_ICONWARNING);
      exit;
    end;

    if Application.MessageBox(Pchar('Desativar Or�amento Selecionado. Confirma?'), 'Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
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

  repeat
    viFlag := True;
    if InputQueryAux('Alterar Valor do Registro Selecionado', 'Valor', viNumParcela, 'I') then
    begin
      try
        if (StrToInt(viNumParcela) > 300) or (StrToInt(viNumParcela) <= 0) then
        begin
          viFlag := False;
          ShowMessage('N� da Parcela Inv�lida!!!');
        end;
      except
        viFlag := False;
        ShowMessage('Parcela Inv�lida!!!');
      end;
    end
    else Abort;
  until viFlag;

  ExecutaSqlAuxiliar(' UPDATE J_LIVRO_AGENDAMENTO SET PARCELA_INICIAL = '+ viNumParcela+
                     ' WHERE LIVRO_AGENDAMENTO_ID = '+sqlLivroAgendamentoLIVRO_AGENDAMENTO_ID.AsString,1);
  RedefinirParcelas;
  sqlLivroAgendamento.Refresh;
end;

procedure TfrmAgendamento.MontarSqlContas;
var
  viSql : String;
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
           '     ORDER BY DATA_VENCIMENTO) AS VALOR_PROXIMO '+
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
  end;

  vlCondicao := '';

  if trim(edtHistorico.Text) <> '' then
    vlCondicao := vlCondicao + ' AND LA.HISTORICO LIKE '+ QuotedStr('%'+edtHistorico.Text+'%');

  if trim(edtBuscaRapida.Text) <> '' then
    vlCondicao := vlCondicao + ' AND ((LA.HISTORICO LIKE '+ QuotedStr('%'+edtBuscaRapida.Text+'%')+')'+
                                     ' OR (P.NOME LIKE '+ QuotedStr('%'+edtBuscaRapida.Text+'%') +'))';

  if lcxPesqCompromisso.EditValue <> null then
    vlCondicao := vlCondicao + ' AND LA.CONTABIL_CONTA_ID = '+ IntToStr(lcxPesqCompromisso.EditValue);

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
  sqlLivroAgendamento.DataSet.CommandText := viSql;
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
  edtHistorico.SetFocus;
end;

procedure TfrmAgendamento.rdbPesquisaSimplificadaClick(Sender: TObject);
begin
  pnlDadosFiltroPersonalizado.Visible := False;
  pnlFiltro.Height := 129;
  if not vlCriandoForm then
    edtBuscaRapida.SetFocus;
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

  if sqlLivroAgendamentoOPERACAO.AsString = 'O' then
  begin
    if sqlLivroAgendamentoSITUACAO.AsInteger = 4 then
         sqlLivroAgendamentoCALC_VALOR.AsCurrency := 0
    else sqlLivroAgendamentoCALC_VALOR.AsCurrency :=sqlLivroAgendamentoVALOR_PROLABORE.AsCurrency;
  end;

  if sqlLivroAgendamentoPARCELA_INICIAL.AsInteger > 1 then
    sqlLivroAgendamentoCALC_OBSERVACAO.AsString := 'O N�mero da Parcela inicial � a '+ sqlLivroAgendamentoPARCELA_INICIAL.AsString;
end;

procedure TfrmAgendamento.tabOpcoesChange(Sender: TObject);
begin
  if tabOpcoes.Tabs.Tabs[tabOpcoes.TabIndex].Caption = 'Or�amentos' then
  begin
    pgcItens.ActivePageIndex := 1;
    mniCancelarItemContratual.Caption := 'Desativar Or�amento Selecionado';
    mniReativarItemContratual.Caption := 'Reativar Or�amento Selecionado';
  end
  else
  begin
    pgcItens.ActivePageIndex := 0;
    mniCancelarItemContratual.Caption := 'Desativar Agendamento Selecionado';
    mniReativarItemContratual.Caption := 'Reativar Agendamento Selecionado';
  end;
  btnPesquisarClick(Self);
end;

procedure TfrmAgendamento.tbcPeriodoChange(Sender: TObject);
begin
  btnPesquisarClick(self);
end;

end.