unit Confirmacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxCheckBox, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, ExtCtrls,
  cxControls, cxContainer, cxEdit, cxLabel, cxSpinEdit, cxGraphics,
  cxImageComboBox, cxCurrencyEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxGroupBox, cxDBEdit, ComCtrls, DBCGrids, DB, DBClient, SimpleDS,
  cxLookAndFeels, dxSkinBlueprint, dxSkinDarkRoom, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinHighContrast, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013White, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSpringTime,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinDevExpressDarkStyle, dxCore, cxDateUtils, DbxDevartInterBase;

type

  TDadosConfimacao = Record
    Data: TDateTime;
    Qtd : Integer;
    Confirmado, Multa, GerarBoleto : Boolean;
    Saida, Fechamento : Boolean;
  End;

  TfrmConfirmacao = class(TForm)
    Panel2: TPanel;
    Bevel4: TBevel;
    lblInformacaoLancamento: TcxLabel;
    Panel4: TPanel;
    imgReceber: TImage;
    Panel1: TPanel;
    btnConfirmar: TcxButton;
    btnCancelar: TcxButton;
    cbxParcelas: TcxGroupBox;
    gridParcelas: TDBCtrlGrid;
    HeaderControl1: THeaderControl;
    lcxCompromisso: TcxDBLookupComboBox;
    edtVencimento: TcxDBDateEdit;
    edtValorItem: TcxDBCurrencyEdit;
    edtProtocolo: TcxDBTextEdit;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    pnlFechamento: TPanel;
    cxLabel1: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel4: TcxLabel;
    Panel3: TPanel;
    lblRestante: TcxLabel;
    edtTotalParcelas: TcxCurrencyEdit;
    edtRestante: TcxCurrencyEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    edtDataPagamento: TcxDateEdit;
    lcxConta: TcxLookupComboBox;
    chxAgrupado: TcxCheckBox;
    edtDescricaoAgrupada: TcxTextEdit;
    cxLabel6: TcxLabel;
    icxNovaEspecie: TcxImageComboBox;
    lcxNovoGrupoContabil: TcxLookupComboBox;
    lcxNovoCompromisso: TcxLookupComboBox;
    lcxNovaModalidade: TcxLookupComboBox;
    edtNovaObservacao: TcxTextEdit;
    cxLabel7: TcxLabel;
    sqlPlanoContas: TSimpleDataSet;
    sqlPlanoContasCONTABIL_CONTA_ID: TFMTBCDField;
    sqlPlanoContasDESCRICAO: TStringField;
    sqlPlanoContasIR: TStringField;
    sqlPlanoContasCNJ: TStringField;
    dtsPlanoContas: TDataSource;
    sqlGrupoContabil: TSimpleDataSet;
    sqlGrupoContabilDESCRICAO: TStringField;
    sqlGrupoContabilCONTABIL_GRUPO_ID: TFMTBCDField;
    sqlGrupoContabilBALANCETE_GRUPO_ID: TFMTBCDField;
    dtsGrupoContabil: TDataSource;
    sqlTipoModalidade: TSimpleDataSet;
    sqlTipoModalidadeTIPO_MODALIDADE_ID: TFMTBCDField;
    sqlTipoModalidadeDESCRICAO: TStringField;
    sqlTipoModalidadeTIPO: TStringField;
    sqlTipoModalidadeSITUACAO: TStringField;
    dtsTipoModalidade: TDataSource;
    icxOperacao: TcxImageComboBox;
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chxAgrupadoClick(Sender: TObject);
    procedure lcxNovoGrupoContabilPropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
  public
    Procedure ArmazenarDadosRegistro;
  end;

var
  frmConfirmacao: TfrmConfirmacao;
  vgDadosConfirmacao : TDadosConfimacao;
  vgXimenes : Boolean;

implementation

uses Controles, LookupFinanceiro, Lookup_Contabil, Lookup_Servico;

{$R *.dfm}

procedure TfrmConfirmacao.ArmazenarDadosRegistro;
begin
  with dtmLookupFinanceiro do
  begin
    if vgDadosLivroCaixa.CaixaId = 0 then
    begin
      vgDadosLivroCaixa.CaixaId := dtmControles.GetInt(' SELECT CAIXA_ID FROM J_CAIXA WHERE PRINCIPAL = '+QuotedStr('S'));
      ClientItem.EmptyDataSet;
    end;

    ClientItem.Append;
    ClientItemDATA_REALIZACAO.AsDateTime    := StrToDate(dtmControles.DataHoraBanco(4));
    ClientItemDATA_VENCIMENTO.AsDateTime    := StrToDate(vgDadosLivroCaixa.DataVencimento);
    ClientItemVALOR_ITEM.AsCurrency         := vgDadosLivroCaixa.ValorCompromisso - vgDadosLivroCaixa.ValorPago;
    ClientItemVALOR_REGISTRAR.AsCurrency    := vgDadosLivroCaixa.ValorCompromisso - vgDadosLivroCaixa.ValorPago;
    ClientItemESPECIE.AsString              := vgDadosLivroCaixa.Especie;
    ClientItemCOMPROMISSO.AsInteger         := vgDadosLivroCaixa.ContabilContaID;
    ClientItemOPERACAO.AsString             := vgDadosLivroCaixa.Operacao;
    ClientItemCAIXA.AsInteger               := vgDadosLivroCaixa.CaixaId;
    ClientItemCENTRO_CUSTO_ID.AsInteger     := vgDadosLivroCaixa.CentroCustoId;
    ClientItemBALANCETE_GRUPO_ID.AsInteger  := vgDadosLivroCaixa.BalanceteGrupoId;
    ClientItemCONTABIL_CONTA_ID.AsInteger   := vgDadosLivroCaixa.ContabilContaID;
    ClientItemLIVRO_FINANCEIRO_ID.AsInteger := vgDadosLivroCaixa.LivroFinanceiroID;
    ClientItemPESSOA_ID.AsInteger           := vgDadosLivroCaixa.PessoaId;
    ClientItemHISTORICO.AsString            := vgDadosLivroCaixa.Historico;
    ClientItemDETALHES.AsString             := vgDadosLivroCaixa.Observacao;
    ClientItemDOCUMENTO_NUMERO.AsString     := vgDadosLivroCaixa.DocumentoNumero;
    ClientItemDOC_TIPO.AsString             := vgDadosLivroCaixa.DocTipo;
    ClientItemTIPO_MODALIDADE_ID.AsVariant  := vgDadosLivroCaixa.TipoModalidadeId;
    ClientItemTIPO_CARGA_ID.AsVariant       := vgDadosLivroCaixa.TipoCargaId;
    ClientItemRESERVA_ID.AsVariant          := vgDadosLivroCaixa.ReservaId;
    ClientItemORCAMENTO_ID.AsVariant        := vgDadosLivroCaixa.OrcamentoId;
    ClientItemIR.AsString                   := vgDadosLivroCaixa.IR;
    ClientItemCNJ.AsString                  := vgDadosLivroCaixa.CNJ;
    ClientItemPERIODO_ID.AsInteger          := vgDadosLivroCaixa.PeriodoId;
    ClientItemLIVRO_AGENDAMENTO_ID.AsInteger:= vgDadosLivroCaixa.LivroAgendamentoId;
    ClientItem.post;
  end;
end;

procedure TfrmConfirmacao.btnConfirmarClick(Sender: TObject);
var
  viSituacao, viMsg : String;
  viIdentificadorId : Integer;

  procedure CarregarDadosRegistroLivroCaixa;
  begin
    with dtmLookupFinanceiro do
    begin
      vgDadosLivroCaixa.CaixaID           := lcxConta.EditValue;
      vgDadosLivroCaixa.DataPagamento     := FormatDateTime('DD.MM.YYYY', ClientItemDATA_REALIZACAO.AsDateTime);
      vgDadosLivroCaixa.DataVencimento    := vgDadosLivroCaixa.DataVencimento;
      vgDadosLivroCaixa.DataLancamento    := FormatDateTime('DD.MM.YYYY',dtmControles.DataHoraBanco(3));
      vgDadosLivroCaixa.ValorPago         := ClientItemVALOR_REGISTRAR.AsCurrency;
      vgDadosLivroCaixa.ValorCompromisso  := ClientItemVALOR_ITEM.AsCurrency;
      vgDadosLivroCaixa.PessoaId          := ClientItemPESSOA_ID.AsInteger;
      vgDadosLivroCaixa.ResponsavelId     := 0;
      vgDadosLivroCaixa.Especie           := ClientItemESPECIE.AsString;

      vgDadosLivroCaixa.Referencia        := IntToStr(dtmLookupContabil.PegarAnoMes(ClientItemDATA_VENCIMENTO.AsString));
      vgDadosLivroCaixa.Operacao          := ClientItemOPERACAO.AsString;

      vgDadosLivroCaixa.ContabilContaID   := ClientItemCONTABIL_CONTA_ID.AsInteger;
      vgDadosLivroCaixa.ContabilGrupoId   := dtmControles.GetInt(' SELECT CONTABIL_GRUPO_ID FROM J_CONTABIL_CONTA WHERE CONTABIL_CONTA_ID = '+IntToStr(vgDadosLivroCaixa.ContabilContaID));
      vgDadosLivroCaixa.TipoModalidadeId  := ClientItemTIPO_MODALIDADE_ID.AsInteger;

      vgDadosLivroCaixa.CentroCustoId     := ClientItemCENTRO_CUSTO_ID.AsInteger;
      vgDadosLivroCaixa.BalanceteGrupoId  := ClientItemBALANCETE_GRUPO_ID.AsInteger;
      vgDadosLivroCaixa.Historico         := ClientItemHISTORICO.AsString;
      vgDadosLivroCaixa.AnoMesRegistro    := IntToStr(dtmLookupContabil.PegarAnoMes(ClientItemDATA_REALIZACAO.AsString));
      vgDadosLivroCaixa.Observacao        := ClientItemDETALHES.AsString;
      vgDadosLivroCaixa.IR                := ClientItemIR.AsString;
      vgDadosLivroCaixa.CNJ               := ClientItemCNJ.AsString;
      vgDadosLivroCaixa.DocumentoNumero   := ClientItemDOCUMENTO_NUMERO.AsString;
      vgDadosLivroCaixa.DocTipo           := ClientItemDOC_TIPO.AsString;
      vgDadosLivroCaixa.LivroFinanceiroID := ClientItemLIVRO_FINANCEIRO_ID.AsInteger;
      vgDadosLivroCaixa.LivroAgendamentoId:= ClientItemLIVRO_AGENDAMENTO_ID.AsInteger;
      vgDadosLivroCaixa.ReservaId         := ClientItemRESERVA_ID.AsInteger;
      vgDadosLivroCaixa.OrcamentoId       := ClientItemORCAMENTO_ID.AsInteger;
      vgDadosLivroCaixa.PeriodoId         := ClientItemPERIODO_ID.AsInteger;

      if ClientItemDOC_TIPO.AsString = 'P' then
           vgDadosLivroCaixa.IdentificacaoTipo := 'XF'
      else vgDadosLivroCaixa.IdentificacaoTipo := '';
    end;
  end;

  procedure CarregarDadosRegistroFechamento;
  begin
    with dtmLookupFinanceiro do
    begin
      vgCompromissoVencido.ProcessoContratoId     := 0;
      vgCompromissoVencido.ProcessoContratoItemId := 0;
      vgCompromissoVencido.BalanceteGrupoId       := ClientItemBALANCETE_GRUPO_ID.AsInteger;
      vgCompromissoVencido.ContabilContaId        := lcxNovoCompromisso.EditValue;
      vgCompromissoVencido.OrcamentoId            := ClientItemORCAMENTO_ID.AsInteger;
      vgCompromissoVencido.ReservaId              := ClientItemRESERVA_ID.AsInteger;
      vgCompromissoVencido.TipoModalidadeId       := lcxNovaModalidade.EditValue;
      vgCompromissoVencido.ValorAgendado          := edtRestante.EditValue;
      vgCompromissoVencido.DataVencimento         := edtDataPagamento.Date;
      vgCompromissoVencido.PeriodoInicial         := copy(edtDataPagamento.text,7,4) + copy(edtDataPagamento.Text, 4,2);

      vgCompromissoVencido.PeriodoTipo            := 0;
      vgCompromissoVencido.AnoMesLancamento       := InttoStr(vgPeriodoAtual);
      vgCompromissoVencido.CentroCustoId          := ClientItemCENTRO_CUSTO_ID.AsInteger;

      vgCompromissoVencido.PessoaID               := ClientItemPESSOA_ID.AsInteger;
      vgCompromissoVencido.Especie                := icxNovaEspecie.EditValue;
      vgCompromissoVencido.Operacao               := ClientItemOPERACAO.AsString;
      vgCompromissoVencido.TipoPagamento          := 0;
      vgCompromissoVencido.Observacao             := QuotedStr(edtNovaObservacao.Text);
      vgCompromissoVencido.Historico              := QuotedStr(edtDescricaoAgrupada.Text);
      vgCompromissoVencido.IR                     := ClientItemIR.AsString;
      vgCompromissoVencido.CNJ                    := ClientItemCNJ.AsString;
      vgCompromissoVencido.RegistroParcial        := 'S';
      vgCompromissoVencido.CaixaID                := lcxConta.EditValue;
      vgCompromissoVencido.DocumentoNumero        := '';
      vgCompromissoVencido.ParcelaInicial         := 1;

      vgCompromissoVencido.BoletoId                := '';
      vgCompromissoVencido.ReciboId                := '';
      vgCompromissoVencido.SituacaoLocal           := '7';
      vgCompromissoVencido.FinanceiroRemuneracaoId := 0;
      vgCompromissoVencido.LivroRemuneracaoId      := 0;
      vgCompromissoVencido.LivroAgendamentoId      := 0;

      vgCompromissoVencido.PeriodoFinal            := vgCompromissoVencido.PeriodoFinal;
      vgCompromissoVencido.AtualizarAgendado       := False;
      vgCompromissoVencido.MostrarMensagem         := False;
    end;
  end;

begin
  if dtmLookupFinanceiro.ClientItem.State in [dsEdit] then
    dtmLookupFinanceiro.ClientItem.Post;

  vgDadosLivroCaixa.Ordem := 0;
  if chxAgrupado.Checked then
  begin
    if vgDadosConfirmacao.Fechamento then
    begin
      viMsg := 'Confirma Fechamento dos Itens?';
      VerificarPreenchimentoEDT_TX(edtDescricaoAgrupada.Text, 'Hist�rico do Fechamento', edtDescricaoAgrupada);
    end
    else
    begin
      viMsg := 'Confirma Registro dos Itens?';
      VerificarPreenchimentoEDT_TX(edtDescricaoAgrupada.Text, 'Descri��o Agrupado', edtDescricaoAgrupada);
    end;


    if pnlFechamento.Visible then
    begin
      VerificarPreenchimentoICX_TX(icxNovaEspecie.Text, 'Esp�cie', icxNovaEspecie);
      VerificarPreenchimentoLCX_TX(lcxNovoGrupoContabil.Text, 'Grupo de Compromisso', lcxNovoGrupoContabil);
      VerificarPreenchimentoLCX_TX(lcxNovoCompromisso.Text, 'Compromisso', lcxNovoCompromisso);
      VerificarPreenchimentoLCX_TX(lcxNovaModalidade.Text, 'Modalidade do Compromisso', lcxNovaModalidade);
    end;
  end
  else viMsg := 'Confirma Registro dos Itens?';

  if Application.MessageBox(PChar(viMsg), 'Confirma��o', MB_YESNO) = IDNO then
    exit;

  dtmControles.StartTransaction;
  try
    with dtmLookupFinanceiro do
    begin
      ClientItem.DisableControls;
      ClientItem.First;

      if (vgXimenes) and (not vgDadosConfirmacao.Fechamento) then
           vgDadosLivroCaixa.IdentificacaoId   := dtmControles.GerarSequencia('J_IDENTIFICADOR')
      else vgDadosLivroCaixa.IdentificacaoId   := 0;

      if chxAgrupado.Checked then
      begin
        vgDadosLivroCaixa.DescricaoAgrupada := edtDescricaoAgrupada.EditValue;
        vgDadosLivroCaixa.Ordem := dtmControles.GerarSequencia('J_LIVRO_CAIXA_ORDEM');
      end;

      vgCompromissoVencido.LivroFinanceiroId := 0;

      while not ClientItem.Eof do
      begin
        if not chxAgrupado.Checked then
          vgDadosLivroCaixa.Ordem := dtmControles.GerarSequencia('J_LIVRO_CAIXA_ORDEM');

        if vgDadosConfirmacao.Fechamento then
        begin
          if vgCompromissoVencido.LivroFinanceiroId = 0 then
          begin
            CarregarDadosRegistroFechamento;
            dtmLookupContabil.RegistrarCompromissoVencido(0, '', '', 0, 0, False);
            viSituacao := '6';
          end;
        end
        else
        begin
          viSituacao := '';
          CarregarDadosRegistroLivroCaixa;
          dtmLookupContabil.RegistrarRecebimentoFinanceiro;
          dtmLookupFinanceiro.VerificarCentroCustoReserva(0, ClientItem, '1');

          if not dtmLookupFinanceiro.ClientCentroCustos.IsEmpty then
          begin
            vgCentroCusto.Confirmado := True;
            dtmLookupFinanceiro.GravarCentroCustoReserva(vgDadosLivroCaixa.LivroCaixaId, 'LIVRO_CAIXA_ID','1', dtmLookupFinanceiro.ClientCentroCustos);
            vgCentroCusto.Confirmado := False;
          end;
        end;

        BaixarEstornar('R', viSituacao, ClientItemLIVRO_FINANCEIRO_ID.AsInteger, ClientItemLIVRO_AGENDAMENTO_ID.AsInteger,
                        ClientItemVALOR_ITEM.AsCurrency, ClientItemVALOR_REGISTRAR.AsCurrency, vgCompromissoVencido.LivroFinanceiroId);

        if not vgXimenes then
          dtmLookupServico.VerificarAtualizacaoAgendamento;

        ClientItem.Next;
      end;

      dtmControles.Commit;

      vgDadosLivroCaixa.Confirmado := True;
      ClientItem.EnableControls;
      Close;
    end;
  except
    dtmControles.Roolback;
    ShowMessage('Problemas na Grava��o. Tente Novamente!!!');
  end;
end;

procedure TfrmConfirmacao.chxAgrupadoClick(Sender: TObject);
begin
  edtDescricaoAgrupada.Enabled := chxAgrupado.Checked;
  pnlFechamento.Visible        :=(chxAgrupado.Checked) and (vgDadosConfirmacao.Fechamento);
  if not chxAgrupado.Checked then
    edtDescricaoAgrupada.Clear;
end;

procedure TfrmConfirmacao.cxButton1Click(Sender: TObject);
begin
  vgDadosLivroCaixa.Confirmado := False;
  close;
end;

procedure TfrmConfirmacao.FormActivate(Sender: TObject);
begin
  chxAgrupado.Enabled             := not vgDadosConfirmacao.Fechamento;
  icxOperacao.EditValue           := dtmLookupFinanceiro.ClientItemOPERACAO.AsString;

  if vgDadosConfirmacao.Fechamento then
  begin
    chxAgrupado.Caption := 'Informe um Hist�rico para o Fechamento?';
    chxAgrupado.Checked := True;
    lblInformacaoLancamento.Caption := 'Confirma��o de Fechamento/Faturamento do(s) Item(s) - Opera��o '+icxOperacao.Text;
  end
  else lblInformacaoLancamento.Caption := 'Confirma��o de Registro do(s) Item(s) - Opera��o '+icxOperacao.Text;

  dtmLookupFinanceiro.ClientItem.First;
  dtmLookupFinanceiro.SomarGridValores(edtTotalParcelas, edtRestante);
  dtmLookupFinanceiro.ClientItem.Edit;

  edtDataPagamento.EditValue := dtmControles.DataHoraBanco(3);
  lcxConta.EditValue         := dtmLookupFinanceiro.ClientItemCAIXA.AsInteger;
  chxAgrupadoClick(self);

  sqlGrupoContabil.Active  := False;
  sqlGrupoContabil.DataSet.ParamByName('TIPO').AsString                := IntToStr((icxOperacao.ItemIndex+1));
  sqlGrupoContabil.DataSet.ParamByName('BALANCETE_GRUPO_ID').AsInteger := dtmLookupFinanceiro.ClientItemBALANCETE_GRUPO_ID.AsInteger;
  sqlGrupoContabil.Active := True;

  sqlTipoModalidade.Active := False;
  sqlTipoModalidade.DataSet.ParamByName('TIPO').AsString := dtmLookupFinanceiro.ClientItemOPERACAO.AsString;
  sqlTipoModalidade.Active := True;

  edtDataPagamento.SetFocus;
end;

procedure TfrmConfirmacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmConfirmacao := nil;
end;

procedure TfrmConfirmacao.FormCreate(Sender: TObject);
begin
  sqlPlanoContas.Connection      := dtmControles.DB;
  sqlGrupoContabil.Connection    := dtmControles.DB;
  sqlTipoModalidade.Connection   := dtmControles.DB;

  if not vgXimenes then
  begin
    HeaderControl1.Sections[4].Text := '';
    edtProtocolo.Visible := False;
  end;
end;

procedure TfrmConfirmacao.lcxNovoGrupoContabilPropertiesEditValueChanged(
  Sender: TObject);
begin
  sqlPlanoContas.Active := False;
  sqlPlanoContas.DataSet.ParamByName('CONTABIL_GRUPO_ID').AsInteger := lcxNovoGrupoContabil.EditValue;
  sqlPlanoContas.Active  := True;
  lcxCompromisso.Enabled := True;

  if sqlPlanoContas.RecordCount = 1 then
    lcxCompromisso.EditValue := sqlPlanoContasCONTABIL_CONTA_ID.AsInteger;
end;

end.

