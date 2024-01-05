unit Lookup_Servico;

interface

uses
  SysUtils, Classes, DB, DBClient, SimpleDS, cxPC, MaskUtils, Forms, Windows, Controls, cxCurrencyEdit, Variants,
  cxDBEdit, cxButtons, cxImage, DbxDevartInterBase;

type
  TdtmLookupServico = class(TDataModule)
    dtsParcelas: TDataSource;
    ClientParcelas: TClientDataSet;
    ClientParcelasDATA_VENCIMENTO: TDateField;
    ClientParcelasVALOR_PARCELA: TCurrencyField;
    ClientParcelasSITUACAO: TStringField;
    ClientParcelasCHAVE: TStringField;
    sqlLivroAgendamento: TSimpleDataSet;
    dtsLivroAgendamento: TDataSource;
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
    sqlFinanceiroAgendamento: TSimpleDataSet;
    dtsFinanceiroAgendamento: TDataSource;
    sqlFinanceiroAgendamentoLIVRO_FINANCEIRO_ID: TFMTBCDField;
    sqlFinanceiroAgendamentoDATA_VENCIMENTO: TSQLTimeStampField;
    sqlFinanceiroAgendamentoVALOR_AGENDADO: TFMTBCDField;
    sqlFinanceiroAgendamentoSITUACAO: TStringField;
    sqlFinanceiroAgendamentoCONTABIL_CONTA_ID: TFMTBCDField;
    sqlFinanceiroAgendamentoCENTRO_CUSTO_ID: TFMTBCDField;
    sqlFinanceiroAgendamentoANO_MES_REFERENCIA: TStringField;
    sqlFinanceiroAgendamentoBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlFinanceiroAgendamentoESPECIE: TStringField;
    sqlFinanceiroAgendamentoBOLETA_ID: TFMTBCDField;
    sqlFinanceiroAgendamentoATUALIZADO: TStringField;
    sqlFinanceiroAgendamentoOPERACAO: TStringField;
    sqlFinanceiroAgendamentoPESSOA_ID: TFMTBCDField;
    sqlFinanceiroAgendamentoVALOR_DOCUMENTO: TFMTBCDField;
    sqlFinanceiroAgendamentoHISTORICO: TStringField;
    sqlFinanceiroAgendamentoOBSERVACAO: TStringField;
    sqlFinanceiroAgendamentoDATA_OPERACAO: TSQLTimeStampField;
    sqlFinanceiroAgendamentoLIVRO_AGENDAMENTO_ID: TFMTBCDField;
    sqlFinanceiroAgendamentoDESCONTO: TFMTBCDField;
    sqlLivroAgendamentoIR: TStringField;
    sqlFinanceiroAgendamentoCAIXA_ID: TFMTBCDField;
    sqlLivroAgendamentoCAIXA_ID: TFMTBCDField;
    sqlFinanceiroAgendamentoDOCUMENTO_NUMERO: TStringField;
    sqlFinanceiroAgendamentoIR: TStringField;
    sqlLivroAgendamentoDOCUMENTO_NUMERO: TStringField;
    sqlLivroAgendamentoREGISTRO_PARCIAL: TStringField;
    sqlFinanceiroAgendamentoREGISTRO_PARCIAL: TStringField;
    sqlFinanceiroAgendamentoORCAMENTO_ID: TFMTBCDField;
    sqlLivroAgendamentoORCAMENTO_ID: TFMTBCDField;
    sqlLivroAgendamentoRESERVA_ID: TFMTBCDField;
    sqlFinanceiroAgendamentoRESERVA_ID: TFMTBCDField;
    procedure DataModuleCreate(Sender: TObject);
    procedure ClientParcelasAfterPost(DataSet: TDataSet);
    procedure ClientParcelasAfterScroll(DataSet: TDataSet);
    procedure ClientParcelasBeforePost(DataSet: TDataSet);
  private
    procedure AdicionarCompromissoTipoParcelas;
  public
    procedure CarregarTabItens(vpTab : TcxTabControl; vpCampo : String; vpSqlDataset : TSimpleDataSet);
    procedure RealizarLancamentoContas(vpDataMesSeguinte : String = ''; vpDataMesInicial : String = '');
    procedure SomarGridValores(vpClientDataset : TClientDataSet; vpCriandoForm : Boolean;
        vpEdtTotalParcela, vpEdtRestante : TcxCurrencyEdit; vpForm : Integer);
    procedure FiltrarClienteParcelas(vpTipo, vpCondicao : String; vpEdicao : Boolean = True);
    procedure ConfirmarRecebimentoPagamento(vpSqlDataset : TSimpleDataSet;
               vpProcessoId, vpContratoItemId, vpItemTipo  : Integer; vpRegistroSelecionado : Boolean = False);
    // Agendamento
    Function VerificarPagamentosContas(vpSituacao : Integer; vpAgendamentoId, vpMensagem : String; vpAlterar : Boolean = False):Boolean;
    procedure ApagarAgendamentoItem(vpAgendamentoId : String);
    procedure ReativarCancelarConta(vpAgendamentoId, vpSituacaoItem, vpSituacaoFinanceira1 : String);
    procedure VerificarParcelasGeral(vpPeriodo : Integer; vpChave : String; vpSqlDataset : TSimpleDataSet);

    // Lan�amento
    procedure CarregarDadosLancamento(vpLancamentoTipo : Integer; vpLivroCaixaId : Integer;
                                          vpSqlDataset : TSimpleDataSet);
    procedure VerificarConclusaoItemContrato(vpTabelaPrincipal, vpCampoId, vpValorId, vpCondicao : string;
              vpSimpleDataSet : TSimpleDataSet; vpAtualizar : Boolean);
    procedure VerificarAtualizacaoAgendamento;
  end;

var
  dtmLookupServico: TdtmLookupServico;
  vgAtualizarSQl : Boolean;

implementation

uses
  Controles, Lookup_Contabil, Rotinas, Lookup, Confirmacao,
  CadastroRapidoContas;

{$R *.dfm}

procedure TdtmLookupServico.AdicionarCompromissoTipoParcelas;
begin
  with dtmLookupServico do
  begin
    ClientParcelas.First;
    while not ClientParcelas.Eof do
    begin
      if ClientParcelasSITUACAO.AsInteger = 1 then
      begin
        vgCompromissoVencido.ValorAgendado     := ClientParcelasVALOR_PARCELA.AsCurrency;
        vgCompromissoVencido.DataVencimento    := ClientParcelasDATA_VENCIMENTO.AsDateTime;
        dtmLookupContabil.RegistrarCompromissoVencido(0, '0', '0', 0, 0, False);
      end;
      ClientParcelas.Next;
    end;
  end;
end;

procedure TdtmLookupServico.ApagarAgendamentoItem(vpAgendamentoId: String);
var
  viCondicao : String;
begin
  viCondicao := ' WHERE LIVRO_AGENDAMENTO_ID = '+vpAgendamentoId;

  // Apagar Compromissos do Agendamento
  ExecutaSqlAuxiliar('DELETE FROM J_LIVRO_FINANCEIRO '+viCondicao,1);

  // Apagar Item do Contrato
  ExecutaSqlAuxiliar('DELETE FROM J_LIVRO_AGENDAMENTO '+viCondicao,1);
end;

procedure TdtmLookupServico.CarregarDadosLancamento(vpLancamentoTipo : Integer;
  vpLivroCaixaId: Integer; vpSqlDataset: TSimpleDataSet);
begin
  case vpLancamentoTipo of
    1 : begin
          vgDadosLivroCaixa.Novo := True;
          vgDadosLivroCaixa.DataLancamento    := FormatDateTime('DD.MM.YYYY',StrToDate(dtmControles.DataHoraBanco(4)));
          vgDadosLivroCaixa.DataPagamento     := FormatDateTime('DD.MM.YYYY',StrToDate(dtmControles.DataHoraBanco(4)));
          vgDadosLivroCaixa.DataVencimento    := dtmControles.DataHoraBanco(4);
          vgDadosLivroCaixa.ValorCompromisso  := 0;
          vgDadosLivroCaixa.ValorPago         := 0;
          vgDadosLivroCaixa.Especie           := 'D';
          vgDadosLivroCaixa.ContabilContaID   := 0;
          vgDadosLivroCaixa.Operacao          := '';
          vgDadosLivroCaixa.CentroCustoId     := 0;
          vgDadosLivroCaixa.ReservaId         := 0;
          vgDadosLivroCaixa.BalanceteGrupoId  := 0;
          vgDadosLivroCaixa.LivroFinanceiroID := 0;
          vgDadosLivroCaixa.PessoaId          := 0;
          vgDadosLivroCaixa.AssociadoId       := 0;
          vgDadosLivroCaixa.Observacao        := '';
          vgDadosLivroCaixa.Historico         := '';
          vgDadosLivroCaixa.LivroCaixaId      := 0;
          vgDadosLivroCaixa.LIvroAgendamentoId:= 0;
          vgDadosLivroCaixa.ProcessoID        := 0;
          vgDadosLivroCaixa.IR                := 'N';
          vgDadosLivroCaixa.RegistroParcial   := 'N';
          vgDadosLivroCaixa.DocumentoNumero   := '';
          vgDadosLivroCaixa.OrcamentoId       := 0;
          vgDadosLivroCaixa.ReservaId         := 0;
          vgDadosLivroCaixa.RefPeriodo           := '1';
          vgDadosLivroCaixa.TipoDespesaID        := 0;
          vgDadosLivroCaixa.CompromissoVencidoId := 0;
          vgDadosLivroCaixa.IdentificacaoId      := 0;
          vgDadosLivroCaixa.IdentificacaoTipo    := '';
          vgDadosLivroCaixa.DocTipo              := '';
          vgDadosLivroCaixa.ResponsavelId        := 0;
          vgDadosLivroCaixa.TipoDespesaID        := 0;
          vgDadosLivroCaixa.AssociadoFavorecido  := 'N';
          vgDadosLivroCaixa.Ordem                := 0;
          vgDadosLivroCaixa.CaixaTransferenciaId := 0;
          vgDadosLivroCaixa.DescricaoAgrupador   := '';
        end;
    2 : begin
          vgDadosLivroCaixa.Historico           := vpSqlDataset.FieldByName('HISTORICO').AsString;

          if vpLivroCaixaId = 0 then
          begin
            vgDadosLivroCaixa.ValorCompromisso  := vpSqlDataset.FieldByName('VALOR_AGENDADO').AsCurrency;
            vgDadosLivroCaixa.ValorPago         := vpSqlDataset.FieldByName('VALOR_PAGO_SOMA').AsCurrency;
            vgDadosLivroCaixa.LivroCaixaId      := 0;
            vgDadosLivroCaixa.PeriodoId         := vpSqlDataset.FieldByName('PERIODO').AsInteger;
            if vpSqlDataset.FieldByName('PARCELA').AsInteger > 0 then
              vgDadosLivroCaixa.Historico := vgDadosLivroCaixa.Historico + ' - '+vpSqlDataset.FieldByName('CALC_PARCELA').AsString;
            vgDadosLivroCaixa.RegistroParcial   := vpSqlDataset.FieldByName('REGISTRO_PARCIAL').AsString;

            vgDadosLivroCaixa.DataVencimento      := vpSqlDataset.FieldByName('DATA_VENCIMENTO').AsString;
            vgDadosLivroCaixa.DataLancamento      := dtmControles.DataHoraBanco(4);
            vgDadosLivroCaixa.DataPagamento       := dtmControles.DataHoraBanco(4);
            vgDadosLivroCaixa.RefPeriodo          := vpSqlDataset.FieldByName('REFERENCIA_PERIODO').AsString;
            vgDadosLivroCaixa.AssociadoFavorecido := 'N';
            vgDadosLivroCaixa.AssociadoId         := 0;
            vgDadosLivroCaixa.Ordem               := 0;
          end
          else
          begin
            vgDadosLivroCaixa.ValorCompromisso    := vpSqlDataset.FieldByName('VALOR').AsCurrency;
            vgDadosLivroCaixa.ValorPago           := 0;
            vgDadosLivroCaixa.LivroCaixaId        := vpLivroCaixaId;
            vgDadosLivroCaixa.PeriodoId           := 0;
            vgDadosLivroCaixa.DataVencimento      := vpSqlDataset.FieldByName('DATA_VENCIMENTO').AsString;
            vgDadosLivroCaixa.DataLancamento      := vpSqlDataset.FieldByName('DATA_LANCAMENTO').AsString;
            vgDadosLivroCaixa.DataPagamento       := vpSqlDataset.FieldByName('DATA_PAGAMENTO').AsString;
            vgDadosLivroCaixa.RefPeriodo          := '';
            vgDadosLivroCaixa.AnoMesReferencia    := vpSqlDataset.FieldByName('REFERENCIA').AsString;
            vgDadosLivroCaixa.RegistroParcial     := '';
            vgDadosLivroCaixa.AssociadoFavorecido := vpSqlDataset.FieldByName('FAVORECIDO_ASSOCIADO').AsString;
            vgDadosLivroCaixa.AssociadoId         := vpSqlDataset.FieldByName('ASSOCIADO_ID').AsInteger;
            vgDadosLivroCaixa.Ordem               := vpSqlDataset.FieldByName('ORDEM').AsInteger;
          end;

          vgDadosLivroCaixa.Novo              := False;
          vgDadosLivroCaixa.Especie           := vpSqlDataset.FieldByName('ESPECIE').AsString;
          vgDadosLivroCaixa.ContabilContaID   := vpSqlDataset.FieldByName('CONTABIL_CONTA_ID').AsInteger;
          vgDadosLivroCaixa.Operacao          := vpSqlDataset.FieldByName('OPERACAO').AsString;
          vgDadosLivroCaixa.CentroCustoId     := vpSqlDataset.FieldByName('CENTRO_CUSTO_ID').AsInteger;
          vgDadosLivroCaixa.BalanceteGrupoId  := vpSqlDataset.FieldByName('BALANCETE_GRUPO_ID').AsInteger;
          vgDadosLivroCaixa.LivroFinanceiroID := vpSqlDataset.FieldByName('LIVRO_FINANCEIRO_ID').AsInteger;
          vgDadosLivroCaixa.PessoaId          := vpSqlDataset.FieldByName('PESSOA_ID').AsInteger;
          vgDadosLivroCaixa.Observacao        := vpSqlDataset.FieldByName('OBSERVACAO').AsString;
          vgDadosLivroCaixa.TipoDespesaID     := vpSqlDataset.FieldByName('TIPO_DESPESA_ID').AsInteger;

          if not vgDadosLivroCaixa.Favorito then
               vgDadosLivroCaixa.LivroAgendamentoId := vpSqlDataset.FieldByName('LIVRO_AGENDAMENTO_ID').AsInteger
          else vgDadosLivroCaixa.ValorCompromisso   := vpSqlDataset.FieldByName('FAVORITO_VALOR').AsCurrency;

          vgDadosLivroCaixa.ProcessoID        := 0;
          vgDadosLivroCaixa.IR                := vpSqlDataset.FieldByName('IR').AsString;
          vgDadosLivroCaixa.DocumentoNumero   := vpSqlDataset.FieldByName('DOCUMENTO_NUMERO').AsString;
          vgDadosLivroCaixa.DocTipo           := vpSqlDataset.FieldByName('DOC_TIPO').AsString;
          vgDadosLivroCaixa.CaixaID           := vpSqlDataset.FieldByName('CAIXA_ID').AsInteger;
          vgDadosLivroCaixa.OrcamentoId          := vpSqlDataset.FieldByName('ORCAMENTO_ID').AsInteger;
          vgDadosLivroCaixa.ReservaId            := vpSqlDataset.FieldByName('RESERVA_ID').AsInteger;
          vgDadosLivroCaixa.CaixaTransferenciaId := 0;
        end;
    3 : begin
          vgDadosLivroCaixa.Novo              := False;
          vgDadosLivroCaixa.DataLancamento    := dtmControles.DataHoraBanco(4);
          vgDadosLivroCaixa.DataPagamento     := dtmControles.DataHoraBanco(4);
          vgDadosLivroCaixa.DataVencimento    := FormatDateTime('DD.MM.YYYY',vpSqlDataset.FieldByName('DATA_VENCIMENTO').AsDateTime);
          vgDadosLivroCaixa.ValorCompromisso  := 0;
          vgDadosLivroCaixa.DataVencimento    := FormatDateTime('DD.MM.YYYY',vpSqlDataset.FieldByName('DATA_VENCIMENTO').AsDateTime);
          vgDadosLivroCaixa.ValorPago         := vpSqlDataset.FieldByName('VALOR').AsCurrency;
          vgDadosLivroCaixa.Especie           := vpSqlDataset.FieldByName('ESPECIE').AsString;
          vgDadosLivroCaixa.ContabilContaID   := vpSqlDataset.FieldByName('CONTABIL_CONTA_ID').AsInteger;
          vgDadosLivroCaixa.Operacao          := vpSqlDataset.FieldByName('OPERACAO').AsString;
          vgDadosLivroCaixa.CentroCustoId     := vpSqlDataset.FieldByName('CENTRO_CUSTO_ID').AsInteger;
          vgDadosLivroCaixa.BalanceteGrupoId  := vpSqlDataset.FieldByName('BALANCETE_GRUPO_ID').AsInteger;
          vgDadosLivroCaixa.LivroFinanceiroID := vpSqlDataset.FieldByName('LIVRO_FINANCEIRO_ID').AsInteger;
          vgDadosLivroCaixa.PessoaId          := vpSqlDataset.FieldByName('PESSOA_ID').AsInteger;
          vgDadosLivroCaixa.Observacao        := vpSqlDataset.FieldByName('OBSERVACAO').AsString;
          vgDadosLivroCaixa.Historico         := vpSqlDataset.FieldByName('HISTORICO').AsString;
          vgDadosLivroCaixa.LivroCaixaId      := vpLivroCaixaId;
          vgDadosLivroCaixa.LivroAgendamentoId:= vpSqlDataset.FieldByName('LIVRO_AGENDAMENTO_ID').AsInteger;
          vgDadosLivroCaixa.ProcessoID        := vpSqlDataset.FieldByName('PROCESSO_ID').AsInteger;
          vgDadosLivroCaixa.CaixaID           := vpSqlDataset.FieldByName('CAIXA_ID').AsInteger;
          vgDadosLivroCaixa.OrcamentoId       := vpSqlDataset.FieldByName('ORCAMENTO_ID').AsInteger;
          vgDadosLivroCaixa.PeriodoId         := vpSqlDataset.FieldByName('PERIODO').AsInteger;
          vgDadosLivroCaixa.RefPeriodo        := vpSqlDataset.FieldByName('REFERENCIA_PERIODO').AsString;
          vgDadosLivroCaixa.Ordem                := 0;
          vgDadosLivroCaixa.CaixaTransferenciaId := 0;
        end;
  end;

  if vgDadosLivroCaixa.RefPeriodo = '' then
    exit;

  if vgDadosLivroCaixa.RefPeriodo = '1' then
       vgDadosLivroCaixa.AnoMesReferencia := IntToStr(dtmLookupContabil.PegarAnoMes(vgDadosLivroCaixa.DataVencimento))
  else vgDadosLivroCaixa.AnoMesReferencia := IntToStr(dtmLookupContabil.PegarAnoMes(vgDadosLivroCaixa.DataVencimento, True));
end;

procedure TdtmLookupServico.CarregarTabItens(vpTab : TcxTabControl; vpCampo : String;
     vpSqlDataset : TSimpleDataSet);
begin
  vpTab.Tabs.Clear;
  vpSqlDataset.First;
  while not vpSqlDataset.Eof do
  begin
    vpTab.Tabs.Add('C-'+FormatFloat('000000', vpSqlDataset.FieldByName(vpCampo).AsInteger)+'-Ativo');
    vpSqlDataset.next;
  end;

  vpTab.TabIndex := 0 ;
end;

procedure TdtmLookupServico.ClientParcelasAfterPost(DataSet: TDataSet);

  procedure CadastroContratoItemGeral(vpClientDataSet : TClientDataSet; vpCriandForm : Boolean;  vpImage : TcxImage; vpButton : TcxButton;
                        vpEdtParcela, vpEdtRestante : TcxCurrencyEdit; vpForm : Integer);
  begin
    vpImage.Visible  := False;
    vpButton.Enabled := True;
    dtmLookupServico.SomarGridValores(vpClientDataSet, vpCriandForm, vpEdtParcela,  vpEdtRestante, vpForm);
  end;

begin
  if frmCadastroRapidoContas <> nil then
    with frmCadastroRapidoContas do
      CadastroContratoItemGeral(ClientAncestral, vlCriandoForm, imgSituacaoEdicao, btnDuplicarParcela,
                                edtTotalParcelas, edtRestante, 1);

end;

procedure TdtmLookupServico.ClientParcelasAfterScroll(DataSet: TDataSet);

  procedure CadastroContratoItemGeral(vpClientDataSet : TClientDataSet; vpForm : TForm;
            btnExcluir, btnDuplicar : tcxButton);
  begin
    if vpForm = nil then
      exit;

    with vpForm do
    begin
      btnExcluir.Enabled    := dtmLookupServico.ClientParcelas.RecordCount > 0;
      btnDuplicar.Enabled   := dtmLookupServico.ClientParcelas.RecordCount > 0;

      if vpClientDataSet.State in [dsInsert] then
        vpClientDataSet.FieldByName('QTD').AsInteger := dtmLookupServico.ClientParcelas.RecordCount;
    end;
  end;

begin
  if frmCadastroRapidoContas <> nil then
    CadastroContratoItemGeral(frmCadastroRapidoContas.ClientAncestral, frmCadastroRapidoContas,
                              frmCadastroRapidoContas.btnExcluirParcela, frmCadastroRapidoContas.btnDuplicarParcela);
end;

procedure TdtmLookupServico.ClientParcelasBeforePost(DataSet: TDataSet);

  procedure CadastrarContratoItemGeral(var vpEdit : TcxDBDateEdit; vpChaveRemuneracao : String);
  begin
    VerificarPreenchimentoDTA_DB(vpEdit.Text, 'Data de Vencimento', vpEdit);

    if dtmLookupServico.ClientParcelasVALOR_PARCELA.AsCurrency <= 0 then
    begin
      Application.MessageBox('Valor da Parcela Inv�lido!!!', 'Aten��o', MB_OK + MB_ICONWARNING);
      vpEdit.SetFocus;
      Abort;
    end;
    dtmLookupServico.ClientParcelasSITUACAO.AsString := '1';
    if vpChaveRemuneracao <> '' then
      dtmLookupServico.ClientParcelasCHAVE.AsString := vpChaveRemuneracao;
  end;

begin
  if frmCadastroRapidoContas <> nil then
    CadastrarContratoItemGeral(frmCadastroRapidoContas.edtParcelaDataVencimento, '');
end;

procedure TdtmLookupServico.DataModuleCreate(Sender: TObject);
begin
  sqlLivroAgendamento.Connection                  := dtmControles.DB;
  sqlFinanceiroAgendamento.Connection             := dtmControles.DB;
end;

procedure TdtmLookupServico.FiltrarClienteParcelas(vpTipo, vpCondicao : String; vpEdicao : Boolean = True);
begin
  if vpTipo = '3' then
  begin
    ClientParcelas.Filtered := False;
    ClientParcelas.Filter   := vpCondicao;
    ClientParcelas.Filtered := True;

    if vpEdicao then
      ClientParcelas.Edit;
  end;
end;

procedure TdtmLookupServico.RealizarLancamentoContas(vpDataMesSeguinte : String = '';
    vpDataMesInicial : String = '');
var
  viDataFinal : TDateTime;

  procedure CarregarDadosCompromisso;
  begin
    vgCompromissoVencido.ValorAgendado     := sqlLivroAgendamentoVALOR_PARCELA.AsCurrency;

{    if sqlLivroAgendamentoOPERACAO.AsString = 'O' then
    begin
      vgCompromissoVencido.PeriodoInicial    := copy(sqlLivroAgendamentoDATA_REGISTRO.AsString,7,4) + copy(sqlLivroAgendamentoDATA_REGISTRO.AsString,4,2);
      vgCompromissoVencido.DataVencimento    := sqlLivroAgendamentoDATA_REGISTRO.AsDateTime;
    end
    else
    begin
      if vpDataMesInicial = '' then
      begin
        vgCompromissoVencido.DataVencimento    := sqlLivroAgendamentoDATA_INICIAL.AsDateTime;
        vgCompromissoVencido.PeriodoInicial    := copy(sqlLivroAgendamentoDATA_INICIAL.AsString,7,4) + copy(sqlLivroAgendamentoDATA_INICIAL.AsString,4,2);
      end
      else
      begin
        vgCompromissoVencido.DataVencimento    := StrToDate(vpDataMesInicial);
        vgCompromissoVencido.PeriodoInicial    := copy(sqlLivroAgendamentoDATA_INICIAL.AsString,7,4) + copy(vpDataMesInicial,4,2);
      end;
    end;}

    if sqlLivroAgendamentoOPERACAO.AsString = 'O' then
    begin
      vgCompromissoVencido.PeriodoInicial    := copy(sqlLivroAgendamentoDATA_REGISTRO.AsString,7,4) + copy(sqlLivroAgendamentoDATA_REGISTRO.AsString,4,2);
      vgCompromissoVencido.DataVencimento    := sqlLivroAgendamentoDATA_REGISTRO.AsDateTime;
    end
    else
    begin
      if vpDataMesInicial = '' then
      begin
        vgCompromissoVencido.DataVencimento    := sqlLivroAgendamentoDATA_INICIAL.AsDateTime;
        vgCompromissoVencido.PeriodoInicial    := copy(sqlLivroAgendamentoDATA_INICIAL.AsString,7,4) + copy(sqlLivroAgendamentoDATA_INICIAL.AsString,4,2);
      end
      else
      begin
        vgCompromissoVencido.DataVencimento    := StrToDate(vpDataMesInicial);
        vgCompromissoVencido.PeriodoInicial    := copy(vpDataMesInicial,7,4) + copy(vpDataMesInicial,4,2);
      end;
    end;

    vgCompromissoVencido.PeriodoTipo       := sqlLivroAgendamentoPERIODO.AsInteger;
    vgCompromissoVencido.AnoMesLancamento  := InttoStr(vgPeriodoAtual);
    vgCompromissoVencido.CentroCustoId     := sqlLivroAgendamentoCENTRO_CUSTO_ID.AsInteger;
    vgCompromissoVencido.PessoaID          := sqlLivroAgendamentoPESSOA_ID.AsInteger;
    vgCompromissoVencido.Especie           := sqlLivroAgendamentoESPECIE.AsString;
    vgCompromissoVencido.Operacao          := sqlLivroAgendamentoOPERACAO.AsString;
    vgCompromissoVencido.TipoPagamento     := 0;
    vgCompromissoVencido.Observacao        := QuotedStr(sqlLivroAgendamentoOBSERVACAO.AsString);
    vgCompromissoVencido.Historico         := QuotedStr(sqlLivroAgendamentoHISTORICO.AsString);
    vgCompromissoVencido.IR                := sqlLivroAgendamentoIR.AsString;
    vgCompromissoVencido.RegistroParcial   := sqlLivroAgendamentoREGISTRO_PARCIAL.AsString;
    vgCompromissoVencido.CaixaID           := sqlLivroAgendamentoCAIXA_ID.AsInteger;
    vgCompromissoVencido.DocumentoNumero   := sqlLivroAgendamentoDOCUMENTO_NUMERO.AsString;

    vgCompromissoVencido.BoletoId          := '';
    vgCompromissoVencido.ReciboId          := '';
    vgCompromissoVencido.SituacaoLocal     := '1';
    vgCompromissoVencido.LivroAgendamentoId:= sqlLivroAgendamentoLIVRO_AGENDAMENTO_ID.AsInteger;

    vgCompromissoVencido.PeriodoFinal      := copy(DatetoStr(viDataFinal),7,4) + copy(DatetoStr(viDataFinal),4,2);
    vgCompromissoVencido.AtualizarAgendado := True;
    vgCompromissoVencido.MostrarMensagem   := True;
  end;

begin
  // Se for Mensal ilimitado, Adiciona somente se for do m�s
  if sqlLivroAgendamentoOPERACAO.AsString = 'O' then
    viDataFinal := CalcularDataVencimento(sqlLivroAgendamentoDATA_REGISTRO.AsDateTime, sqlLivroAgendamentoPERIODO.AsInteger, 12, True)
  else
  begin
    if (sqlLivroAgendamentoPERIODO.AsInteger in [1,2,3,4,5,6]) then
    begin
      if vpDataMesSeguinte = '' then
           viDataFinal := CalcularDataVencimento(sqlLivroAgendamentoDATA_INICIAL.AsDateTime, sqlLivroAgendamentoPERIODO.AsInteger, 12, True)
      else viDataFinal := StrToDate(vpDataMesSeguinte);
    end
    else viDataFinal := sqlLivroAgendamentoDATA_FINAL.AsDateTime;
  end;

  vgCompromissoVencido.BalanceteGrupoId := sqlLivroAgendamentoBALANCETE_GRUPO_ID.AsInteger;
  vgCompromissoVencido.ContabilContaId  := sqlLivroAgendamentoCONTABIL_CONTA_ID.AsInteger;
  vgCompromissoVencido.OrcamentoId      := sqlLivroAgendamentoORCAMENTO_ID.AsInteger;
  vgCompromissoVencido.ReservaId        := sqlLivroAgendamentoRESERVA_ID.AsInteger;

  CarregarDadosCompromisso;
{  if vpDataMesSeguinte <> '' then
  begin
    vgCompromissoVencido.PeriodoInicial :=  vgCompromissoVencido.PeriodoFinal;
    vgCompromissoVencido.DataVencimento :=  viDataFinal;
  end;}

  if sqlLivroAgendamentoPERIODO.AsInteger < 9 then
       dtmLookupContabil.AdicionarCompromisso(True, False, (sqlLivroAgendamentoPERIODO.AsInteger >= 1), 'C')
  else AdicionarCompromissoTipoParcelas;
end;

procedure TdtmLookupServico.ReativarCancelarConta(vpAgendamentoId,
  vpSituacaoItem, vpSituacaoFinanceira1: String);
var
  viPosicao : Integer;
begin
  ExecutaSqlAuxiliar(' UPDATE J_LIVRO_AGENDAMENTO SET SITUACAO = '+QuotedStr(vpSituacaoItem)+
                     ' WHERE LIVRO_AGENDAMENTO_ID = '+vpAgendamentoId,1);

  ExecutaSqlAuxiliar(' UPDATE J_LIVRO_FINANCEIRO SET SITUACAO = '+QuotedStr(vpSituacaoItem)+
                     ' WHERE LIVRO_AGENDAMENTO_ID = '+vpAgendamentoId+
                     '   AND SITUACAO IN ('+vpSituacaoFinanceira1+')',1);


end;

procedure TdtmLookupServico.SomarGridValores(vpClientDataset : TClientDataSet; vpCriandoForm : Boolean;
        vpEdtTotalParcela, vpEdtRestante : TcxCurrencyEdit; vpForm : Integer);
var
  viPosicao : Integer;
  viValor   : Currency;
begin
  dtmLookupServico.ClientParcelas.DisableControls;
  viPosicao := dtmLookupServico.ClientParcelas.RecNo;
  dtmLookupServico.ClientParcelas.First;
  viValor := 0;

  if (not (vpClientDataset.State in [dsInsert, dsEdit])) and not vpCriandoForm then
    vpClientDataset.Edit;

  While not dtmLookupServico.ClientParcelas.Eof do
  begin
    if dtmLookupServico.ClientParcelas.RecNo = 1 then
      vpClientDataset.FieldByName('DATA_INICIAL').AsDateTime := dtmLookupServico.ClientParcelasDATA_VENCIMENTO.AsDateTime;

    viValor := viValor + dtmLookupServico.ClientParcelasVALOR_PARCELA.AsCurrency;
    dtmLookupServico.ClientParcelas.Next;
  end;

  if dtmLookupServico.ClientParcelas.RecordCount > 0 then
    vpClientDataset.FieldByName('DATA_FINAL').AsDateTime := dtmLookupServico.ClientParcelasDATA_VENCIMENTO.AsDateTime
  else
  begin
    vpClientDataset.FieldByName('DATA_FINAL').AsVariant   := null;
    vpClientDataset.FieldByName('DATA_INICIAL').AsVariant := null;
  end;

  if (vpForm = 2) and (ClientParcelas.RecordCount > 0) then
    vpClientDataset.FieldByName('DATA_PREVISTA').AsVariant := vpClientDataset.FieldByName('DATA_FINAL').AsDateTime;

  vpEdtTotalParcela.EditValue           := viValor;
  dtmLookupServico.ClientParcelas.RecNo := viPosicao;
  dtmLookupServico.ClientParcelas.EnableControls;

  vpEdtRestante.EditValue := vpClientDataset.FieldByName('VALOR_PROLABORE').AsCurrency - vpEdtTotalParcela.EditValue;
end;

procedure TdtmLookupServico.VerificarAtualizacaoAgendamento;
var
  viQtdPendente : Integer;
  viDataInicial : String;
begin
  if (vgDadosLivroCaixa.LivroFinanceiroID = 0) or
     (vgDadosLivroCaixa.PeriodoId in [8,9]) then
    Exit;

  With dtmLookupServico.sqlLivroAgendamento do
  begin
    Active := False;
    DataSet.ParamByName('LIVRO_AGENDAMENTO_ID').AsInteger := vgDadosLivroCaixa.LivroAgendamentoId;
    Active := True;
  end;

  dtmLookupServico.RealizarLancamentoContas(DateToStr(CalcularDataVencimento(
                              StrToDate(TrocaPtoPBarra(vgDadosLivroCaixa.DataVencimento)), vgDadosLivroCaixa.PeriodoId, 12, True)),
                                 TrocaPtoPBarra(vgDadosLivroCaixa.DataVencimento));
end;

procedure TdtmLookupServico.VerificarConclusaoItemContrato(vpTabelaPrincipal,
  vpCampoId, vpValorId, vpCondicao: string; vpSimpleDataSet: TSimpleDataSet;
  vpAtualizar: Boolean);
var
  viPosicao : Integer;
begin
  // Verifica se todos os itens est�o pagos. Caso sim, coloca o item do contrato como concluido
  ExecutaSqlAuxiliar(' SELECT COUNT('+vpCampoId+') AS QTD '+
                     ' FROM J_LIVRO_FINANCEIRO '+
                     ' WHERE '+ vpCampoId +' = '+vpValorId+
                     '   AND SITUACAO IN ('+QuotedStr('1')+','+QuotedStr('2')+')'+vpCondicao,0);
  if dtmControles.sqlAuxiliar.FieldByName('QTD').AsInteger = 0 then
  begin
    ExecutaSqlAuxiliar(' UPDATE '+vpTabelaPrincipal+' SET SITUACAO = '+QuotedStr('3')+
                       ' WHERE '+vpCampoId+' = '+vpValorId,1);

    if not vpAtualizar then
      exit;

    try
      viPosicao := vpSimpleDataSet.RecNo;
      vpSimpleDataSet.Refresh;

      if vpSimpleDataSet.RecordCount >= viPosicao then
        vpSimpleDataSet.RecNo := viPosicao;
    except
    end;
  end
  else
  begin
    if vpTabelaPrincipal = 'J_LIVRO_AGENDAMENTO' then
      ExecutaSqlAuxiliar(' UPDATE '+vpTabelaPrincipal+' SET SITUACAO = '+QuotedStr('1')+
                         ' WHERE '+vpCampoId+' = '+vpValorId,1);
  end;

end;

function TdtmLookupServico.VerificarPagamentosContas(vpSituacao : Integer;
  vpAgendamentoId, vpMensagem : String; vpAlterar : Boolean = False):Boolean;
var
  viSql : string;
  viQtd : Integer;
begin
  viSql := ' SELECT COUNT(LIVRO_AGENDAMENTO_ID) AS QTD '+
           ' FROM J_LIVRO_FINANCEIRO '+
           ' WHERE LIVRO_AGENDAMENTO_ID = '+vpAgendamentoId;
  viSql := viSql + '   AND SITUACAO IN ('+QuotedStr('2')+','+QuotedStr('3')+')';

  viQtd := dtmControles.GetInt(viSql);
  if (viQtd > 0) then
  begin
    if (not vpAlterar) then
    begin
      Application.MessageBox(Pchar(vpMensagem), 'Aten��o', MB_OK + MB_ICONWARNING);
      abort;
    end
    else Result := False;
  end
  else Result := vpSituacao = 1;
end;

procedure TdtmLookupServico.VerificarParcelasGeral(vpPeriodo: Integer;
  vpChave: String; vpSqlDataset: TSimpleDataSet);
begin
  // Carregar as Parcelas dos Itens de Parcelas Variaveis (Tipo Remunera��o = 3)
  with dtmLookupServico do
  begin
    ClientParcelas.EmptyDataSet;
    if vpPeriodo = 9 then
    begin
      vpSqlDataset.First;
      while not vpSqlDataset.eof do
      begin
        ClientParcelas.Append;
        ClientParcelasDATA_VENCIMENTO.AsDateTime := vpSqlDataset.FieldByName('DATA_VENCIMENTO').AsDateTime;
        ClientParcelasVALOR_PARCELA.AsCurrency   := vpSqlDataset.FieldByName('VALOR_AGENDADO').AsCurrency;
        ClientParcelasSITUACAO.AsInteger         := vpSqlDataset.FieldByName('SITUACAO').AsInteger;
        ClientParcelasCHAVE.AsString             := vpChave;
        ClientParcelas.Post;
        vpSqlDataset.Next;
      end;
    end;
  end;
end;

procedure TdtmLookupServico.ConfirmarRecebimentoPagamento(vpSqlDataset : TSimpleDataSet;
               vpProcessoId, vpContratoItemId, vpItemTipo : Integer; vpRegistroSelecionado : Boolean = False);
var
  viQtd : Integer;
  viTipoPagamento : String;
begin
  vgDadosLivroCaixa.CaixaId := 0;
  viQtd := 0;
  vpSqlDataset.DisableControls;

  if not vpRegistroSelecionado then
    vpSqlDataset.First;

  while not vpSqlDataset.Eof do
  begin
    viTipoPagamento := vpSqlDataset.FieldByName('TIPO_PAGAMENTO').AsString;
    if (viTipoPagamento <> '') and (viTipoPagamento[1] in ['1','2']) then
    begin
      vpSqlDataset.EnableControls;
      Application.MessageBox('Pagamento n�o liberado', 'Aten��o', MB_OK + MB_ICONWARNING);
      abort;
    end;

    if (vpSqlDataset.FieldByName('Calc_Selecionado').AsBoolean) or vpRegistroSelecionado then
    begin
      inc(viQtd);
      vgDadosLivroCaixa.DataVencimento   := vpSqlDataset.FieldByName('DATA_VENCIMENTO').AsString;
      vgDadosLivroCaixa.ValorCompromisso := vpSqlDataset.FieldByName('VALOR_AGENDADO').AsCurrency;
      vgDadosLivroCaixa.ValorPago        := vpSqlDataset.FieldByName('VALOR_PAGO_SOMA').AsCurrency;
      vgDadosLivroCaixa.Especie          := vpSqlDataset.FieldByName('ESPECIE').AsString;
      vgDadosLivroCaixa.ContabilContaID  := vpSqlDataset.FieldByName('CONTABIL_CONTA_ID').AsInteger;
      vgDadosLivroCaixa.Operacao         := vpSqlDataset.FieldByName('OPERACAO').AsString;
      vgDadosLivroCaixa.CentroCustoId    := vpSqlDataset.FieldByName('CENTRO_CUSTO_ID').AsInteger;
      vgDadosLivroCaixa.BalanceteGrupoId := vpSqlDataset.FieldByName('BALANCETE_GRUPO_ID').AsInteger;
      vgDadosLivroCaixa.LivroFinanceiroID:= vpSqlDataset.FieldByName('LIVRO_FINANCEIRO_ID').AsInteger;
      vgDadosLivroCaixa.PessoaId         := vpSqlDataset.FieldByName('PESSOA_ID').AsInteger;

      if vpSqlDataset.FieldByName('HISTORICO').AsString = '' then
           vgDadosLivroCaixa.Historico := dtmControles.GetStr('SELECT DESCRICAO FROM T_CONTABIL_CONTA WHERE CONTABIL_CONTA_ID = '+IntToStr(vgDadosLivroCaixa.ContabilContaID))
      else vgDadosLivroCaixa.Historico := vpSqlDataset.FieldByName('HISTORICO').AsString;

      if vgDadosLivroCaixa.ClienteID <> '' then
        vgDadosLivroCaixa.Historico := vgDadosLivroCaixa.Historico + ' - '+
                                       dtmControles.GetStr(' SELECT NOME FROM J_PESSOA WHERE PESSOA_ID = '+ vgDadosLivroCaixa.ClienteID);

      if vgDadosLivroCaixa.Contrato <> '' then
        vgDadosLivroCaixa.Observacao := 'Contrato n� '+vgDadosLivroCaixa.Contrato;

      frmConfirmacao.ArmazenarDadosRegistro;

      vgDadosLivroCaixa.ClienteID := '';
      vgDadosLivroCaixa.ClienteID := '';
    end;

    if vpRegistroSelecionado then
      Break;

    vpSqlDataset.Next;
  end;

  vgAtualizarSQl := not vpRegistroSelecionado;

  if viQtd = 0 then
  begin
    vpSqlDataset.First;
    vpSqlDataset.EnableControls;
    Application.MessageBox('Nenhum item selecionado!!!', 'Aten��o', MB_OK + MB_ICONWARNING);
    Exit;
  end
  else vgDadosLivroCaixa.Tipo := vpItemTipo;

  ExibirFormulario(TfrmConfirmacao, frmConfirmacao, true);
  vpSqlDataset.First;
  vpSqlDataset.EnableControls;

  if vgDadosLivroCaixa.Confirmado then
  begin
    vpSqlDataset.Refresh;
    dtmLookup.MarcarDesmarcarItensSimpleDataSet('N', vpSqlDataset);
  end;
end;

end.


