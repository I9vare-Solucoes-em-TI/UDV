unit LookupFinanceiro;

interface

uses
  SysUtils, Classes, DB, DBClient, SimpleDS, cxEditRepositoryItems, cxEdit,
  cxDBEditRepository, cxClasses, cxCurrencyEdit, Controls, Dialogs, frxClass,
  DbxDevartInterBase, ACBrBase, ACBrBoleto, ACBrBoletoFCFR, cxGridDBTableView, cxCustomData, Graphics,
  Vcl.Forms, frxExportAPDF, cxDBLookupComboBox, System.Variants, Winapi.Windows,
  frxExportPDF, frxExportBaseDialog;

type
  TCentroCusto = Record
    Agendamento, Confirmado, Cancelado : Boolean;
    BalanceteId, TipoCentro : Integer;
    ClientCentro : TClientDataSet;
  end;

  TRenovarTitulo = record
    Renovar : Boolean;
    DadosTituloRenovado : TStringList;
  end;

  TRetornoImprimiuBoleto = record
    boletoId: Integer;
    ImprimiuBoleto: Boolean;
    LivroFinanceiro: string;
  end;

  TRetornoGerouRemessa = record
    remessaId: Integer;
    gerouRemessa: Boolean;
  end;

  TAgendaConciliacao = record
    Conciliacao : Boolean;
    Operacao, Historico, Identificador : String;
    CaixaId, LancamentoId : Integer;
    Valor : Currency;
    Data : TDate;
  end;

  TBoleto = record
    vencimento: TDateTime;
    dataDocumento: TDateTime;
    numeroDocumento: string;
    especieDoc: string;
    aceite: string;
    dataProcessamento: TDateTime;
    nossoNumero: string;
    carteira: string;
    valorDocumento: Double;
    parcela: Integer;
    totalParcelas: Integer;
    dataDesconto: TDateTime;
    dataMoraJuros: TDateTime;
    valorDesconto: Double;
    valorMoraJuros: Double;
    percentualMulta: Double;
    nomeSacado: string;
    CNPJCPF: string;
    cidade: string;
    logradouro: string;
    numero: string;
    bairro: string;
    UF: string;
    CEP: string;
    email: string;
    fone: string;
    situacao: string;
  end;
  TArrayOfBoleto = array of TBoleto;

  TdtmLookupFinanceiro = class(TDataModule)
    cxEditRepository2: TcxEditRepository;
    ListaPessoasTodas: TcxEditRepositoryLookupComboBoxItem;
    ComboCaixas: TcxEditRepositoryImageComboBoxItem;
    ListaCaixaFinanceiro: TcxEditRepositoryLookupComboBoxItem;
    ListaPessoaFuncao: TcxEditRepositoryLookupComboBoxItem;
    ListaGrupoIdentificacao: TcxEditRepositoryLookupComboBoxItem;
    sqlPessoasTodas: TSimpleDataSet;
    dtsPessoasTodas: TDataSource;
    sqlPessoaFuncao: TSimpleDataSet;
    dtsPessoaFuncao: TDataSource;
    sqlGrupoIdentificacao: TSimpleDataSet;
    dtsGrupoIdentificacao: TDataSource;
    ClientItem: TClientDataSet;
    dtsItem: TDataSource;
    sqlPessoasTodasNOME: TStringField;
    sqlPessoasTodasPESSOA_ID: TFMTBCDField;
    sqlGrupoIdentificacaoIDENTIFICACAO: TStringField;
    ClientItemCOMPROMISSO: TIntegerField;
    ClientItemESPECIE: TStringField;
    ClientItemDATA_VENCIMENTO: TDateField;
    ClientItemDATA_REALIZACAO: TDateField;
    ClientItemVALOR_ITEM: TCurrencyField;
    ClientItemVALOR_REGISTRAR: TCurrencyField;
    ClientItemCAIXA: TCurrencyField;
    ClientItemCONTABIL_CONTA_ID: TIntegerField;
    ClientItemOPERACAO: TStringField;
    ClientItemCENTRO_CUSTO_ID: TIntegerField;
    ClientItemBALANCETE_GRUPO_ID: TIntegerField;
    ClientItemLIVRO_FINANCEIRO_ID: TIntegerField;
    ClientItemTIPO: TStringField;
    ClientItemPESSOA_ID: TIntegerField;
    ClientItemHISTORICO: TStringField;
    ClientItemDETALHES: TStringField;
    sqlPessoaFuncaoPESSOA_FUNCAO_ID: TFMTBCDField;
    sqlPessoaFuncaoDESCRICAO: TStringField;
    sqlPessoaFuncaoVALOR: TFMTBCDField;
    sqlPessoaFuncaoSITUACAO: TStringField;
    sqlPessoaTarefa: TSimpleDataSet;
    FMTBCDField1: TFMTBCDField;
    sqlPessoaTarefaIDENTIFICACAO: TStringField;
    dtsPessoaTarefa: TDataSource;
    ListaPessoaTarefa: TcxEditRepositoryLookupComboBoxItem;
    ComboHonorarioPeriodo: TcxEditRepositoryImageComboBoxItem;
    ComboContratoItemSituacao: TcxEditRepositoryImageComboBoxItem;
    sqlCaixa: TSimpleDataSet;
    sqlCaixaCAIXA_ID: TFMTBCDField;
    sqlCaixaDESCRICAO: TStringField;
    sqlCaixaSITUACAO: TStringField;
    sqlCaixaRESPONSAVEL_ID: TFMTBCDField;
    sqlCaixaPRINCIPAL: TStringField;
    dtsCaixa: TDataSource;
    sqlBanco: TSimpleDataSet;
    sqlBancoBANCO_ID: TFMTBCDField;
    sqlBancoBANCO_NUMERO: TStringField;
    sqlBancoBANCO_DIGITO: TStringField;
    sqlBancoBANCO_NOME: TStringField;
    sqlBancoAGENCIA_NOME: TStringField;
    sqlBancoAGENCIA_DIGITO: TStringField;
    sqlBancoAGENCIA_NUMERO: TStringField;
    sqlBancoCONTA_NUMERO: TStringField;
    sqlBancoCONTA_DIGITO: TStringField;
    sqlBancoAGENCIA_UF: TStringField;
    sqlBancoCONVENIO: TStringField;
    sqlBancoCODIGO_CEDENTE_NUMERO: TStringField;
    sqlBancoCODIGO_CEDENTE_DIGITO: TStringField;
    sqlBancoNOSSO_NUMERO: TFMTBCDField;
    sqlBoleto: TSimpleDataSet;
    sqlBoletoBOLETO_ID: TFMTBCDField;
    sqlBoletoPATH_REMESSA: TStringField;
    sqlBoletoPATH_RETORNO: TStringField;
    sqlBoletoPATH_LOGOTIPO: TStringField;
    sqlBoletoPATH_GERARPDF: TStringField;
    sqlBoletoMENSAGEM: TStringField;
    sqlBoletoESPECIE: TStringField;
    sqlBoletoMOEDA: TStringField;
    sqlBoletoACEITE: TStringField;
    sqlBoletoCARTEIRA: TStringField;
    sqlBoletoLOCAL_PAGTO: TStringField;
    sqlBoletoCONT_REMESSA: TFMTBCDField;
    dtsBoleto: TDataSource;
    dtsBanco: TDataSource;
    sqlCedente: TSimpleDataSet;
    dtsCedente: TDataSource;
    sqlCedenteCEDENTE_ID: TFMTBCDField;
    sqlCedenteSITUACAO: TStringField;
    sqlCedentePRINCIPAL: TStringField;
    sqlCedenteDESCRICAO: TStringField;
    sqlCedenteEND_LOG: TStringField;
    sqlCedenteEND_CEP: TStringField;
    sqlCedenteEND_CIDADE: TStringField;
    sqlCedenteEND_BAIRRO: TStringField;
    sqlCedenteEND_UF: TStringField;
    sqlCedenteEND_EMAIL: TStringField;
    sqlCedenteCONFIG_RELATORIO_ID: TFMTBCDField;
    sqlLivroFinanceiro: TSimpleDataSet;
    dtsLivroFinanceiro: TDataSource;
    sqlLivroFinanceiroLIVRO_FINANCEIRO_ID: TFMTBCDField;
    sqlLivroFinanceiroDATA_VENCIMENTO: TSQLTimeStampField;
    sqlLivroFinanceiroVALOR_AGENDADO: TFMTBCDField;
    sqlLivroFinanceiroSITUACAO: TStringField;
    sqlLivroFinanceiroCONTABIL_CONTA_ID: TFMTBCDField;
    sqlLivroFinanceiroCENTRO_CUSTO_ID: TFMTBCDField;
    sqlLivroFinanceiroANO_MES_REFERENCIA: TStringField;
    sqlLivroFinanceiroBALANCETE_GRUPO_ID: TFMTBCDField;
    sqlLivroFinanceiroESPECIE: TStringField;
    sqlLivroFinanceiroBOLETA_ID: TFMTBCDField;
    sqlLivroFinanceiroATUALIZADO: TStringField;
    sqlLivroFinanceiroVALOR_PAGO: TFMTBCDField;
    sqlLivroFinanceiroPROCESSO_CONTRATO_ITEM_ID: TFMTBCDField;
    sqlLivroFinanceiroPROCESSO_CONTRATO_ID: TFMTBCDField;
    sqlLivroFinanceiroOPERACAO: TStringField;
    sqlLivroFinanceiroPESSOA_ID: TFMTBCDField;
    sqlLivroFinanceiroVALOR_DOCUMENTO: TFMTBCDField;
    sqlLivroFinanceiroLIVRO_REMUNERACAO_ID: TFMTBCDField;
    sqlLivroFinanceiroFINANCEIRO_REMUNERACAO_ID: TFMTBCDField;
    sqlLivroFinanceiroHISTORICO: TStringField;
    sqlLivroFinanceiroOBSERVACAO: TStringField;
    sqlLivroFinanceiroDATA_OPERACAO: TSQLTimeStampField;
    sqlLivroFinanceiroLIVRO_AGENDAMENTO_ID: TFMTBCDField;
    sqlLivroFinanceiroDESCONTO: TFMTBCDField;
    sqlLivroFinanceiroIR: TStringField;
    sqlLivroFinanceiroCNJ: TStringField;
    sqlLivroFinanceiroDOCUMENTO_NUMERO: TStringField;
    sqlLivroFinanceiroCAIXA_ID: TFMTBCDField;
    sqlLivroFinanceiroREGISTRO_PARCIAL: TStringField;
    sqlBancoCARTEIRA: TStringField;
    frxReport1: TfrxReport;
    ACBrBoleto1: TACBrBoleto;
    ACBrBoletoFCFR1: TACBrBoletoFCFR;
    sqlContaBancaria: TSimpleDataSet;
    tdsContaBancaria: TDataSource;
    sqlContaBancariaBANCO_ID: TFMTBCDField;
    sqlContaBancariaBANCO_NOME: TStringField;
    ListaContaBancaria: TcxEditRepositoryLookupComboBoxItem;
    dtsLayoutBoleto: TDataSource;
    sqlLayoutBoleto: TSimpleDataSet;
    sqlLayoutBoletoCONFIG_RELATORIO_ID: TFMTBCDField;
    sqlLayoutBoletoDESCRICAO: TStringField;
    ListaLayoutBancario: TcxEditRepositoryLookupComboBoxItem;
    sqlBancoCONFIG_RELATORIO_ID: TFMTBCDField;
    sqlBoletoVALOR: TFMTBCDField;
    sqlBoletoDATA_EMISSAO: TSQLTimeStampField;
    sqlBoletoDATA_VENCIMENTO: TSQLTimeStampField;
    sqlBoletoNOSSO_NUMERO: TFMTBCDField;
    sqlBoletoSITUACAO: TStringField;
    sqlCedenteCNPJ_CPF: TStringField;
    sqlCedenteTELEFONE: TStringField;
    sqlCedenteCOMPLEMENTO: TStringField;
    sqlOrcamento: TSimpleDataSet;
    sqlOrcamentoLIVRO_AGENDAMENTO_ID: TFMTBCDField;
    sqlOrcamentoHISTORICO: TStringField;
    dtsOrcamento: TDataSource;
    ListaOrcamentos: TcxEditRepositoryLookupComboBoxItem;
    sqlTipoDocumento: TSimpleDataSet;
    sqlTipoDocumentoDESCRICAO: TStringField;
    sqlTipoDocumentoTIPO_DOCUMENTO_ID: TFMTBCDField;
    dtsTipoDocumento: TDataSource;
    ListaTipoDocumento: TcxEditRepositoryLookupComboBoxItem;
    ListaCedenteAtivos: TcxEditRepositoryLookupComboBoxItem;
    sqlBancoMODALIDADE: TStringField;
    sqlCedenteRAZAO_SOCIAL: TStringField;
    ComboTipoModalidade: TcxEditRepositoryImageComboBoxItem;
    ClientItemDOCUMENTO_NUMERO: TStringField;
    ClientItemDOC_TIPO: TStringField;
    ClientItemTIPO_MODALIDADE_ID: TIntegerField;
    ListaGrupoIdentificacaoPesquisa: TcxEditRepositoryLookupComboBoxItem;
    ClientItemTIPO_CARGA_ID: TIntegerField;
    ClientItemRESERVA_ID: TIntegerField;
    ClientItemORCAMENTO_ID: TIntegerField;
    ClientItemIR: TStringField;
    ClientItemCNJ: TStringField;
    ClientItemPERIODO_ID: TIntegerField;
    ClientItemLIVRO_AGENDAMENTO_ID: TIntegerField;
    ClientCentroCustos: TClientDataSet;
    dtsCentroCusto: TDataSource;
    ClientCentroCustosCENTRO_CUSTO_ID: TIntegerField;
    ClientCentroCustosPORCENTAGEM: TCurrencyField;
    ClientCentroCustosSITUACAO: TStringField;
    ClientCentroCustosID: TIntegerField;
    ClientCentroReserva: TClientDataSet;
    dtsCentroReserva: TDataSource;
    ClientCentroReservaCENTRO_CUSTO_ID: TIntegerField;
    ClientCentroReservaPORCENTAGEM: TCurrencyField;
    ClientCentroReservaSITUACAO: TStringField;
    ClientCentroReservaID: TIntegerField;
    sqlBancoCEDENTE_ID: TFMTBCDField;
    sqlBancoLOCAL_REMESSA: TStringField;
    sqlBancoLOCAL_PADRAO: TStringField;
    sqlBoletoBANCO_ID: TFMTBCDField;
    ComboCaixaTipos: TcxEditRepositoryImageComboBoxItem;
    sqlBoletoPESSOA_ID: TFMTBCDField;
    frxPDFExport1: TfrxPDFExport;

    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    Titulo : TACBrTitulo;
    viValoresMontados : array[0..1000,1..4] of string;
    vlBoletoLogomarca : String;
    //frxPDFExport1: TfrxAPDFExport;

  public
    procedure AtualizarTabelas;
    procedure SomarGridValores(vpSoma1, vpSoma2 : TcxCurrencyEdit);
    procedure SomarSelecionados(vpGrid : TcxGridDBTableView; vpEdit : TcxCurrencyEdit;
          vpColunaValorReceita, vpColunaValorDespesa, vpColunaTipo :  TcxGridDBColumn; vpValorUnico : Boolean;
          vpLevel : Integer);

    Function GetPessoaID(vfCPfCNPJ: String) : Integer;

    // Configura��o Boleto
    function CriarTitulo(vpId, vpBancoId : Integer): TRetornoImprimiuBoleto;
    function CriarTituloLista( vpPessoaId, vpNome: String; vpLivroFinanceiroId: string; vpDataVencimento: TDateTime;
                               vpBancoId : Integer; vpValor: Double; vpGrupo : Boolean): TRetornoImprimiuBoleto;
    procedure ParametrosRelatorio;
    function GerarRemessa(vpBancoId: Integer; vpBoleto: TArrayOfBoleto): TRetornoGerouRemessa;
    procedure AbrirFecharTelaBranco(vpAbrir : Boolean = True);
    function VerificarQtdLancamentoPendente(vpLivroAgendamentoId, vpLivroFinanceiroID : Integer):Integer;
    procedure BaixarEstornar(vpTipoReg, vpSituacao : String;
         vpLivroFinanceiroId, vpLivroAgendamento : Integer; vpValorItem, vpValorRegistrar : Currency;
         vpLivroFinanceiroAgrupadorId : Integer = 0);

    // Centro de Custos
    function VerificarPreenchimentoCentroCusto(vpCentroCustoId, vpTipo : Variant; vpClientDataSet: TClientDataSet):String;
    procedure VerificarCentroCustoReserva(vpId : Integer; vpClientDataSet: TClientDataSet; vpTipoCentro : String;
             vpDuplicado : Boolean = False);
    procedure GravarCentroCustoReserva(vpId : Integer; vpCampoId, vpTipoCentro : String;
           vpClientDataSet : TClientDataSet);
    procedure ApagarCentroCustoReserva(vpCampoId, vpTipoCentro : string;
             vpClientDataSet : TClientDataSet; vpId : Integer = 0);
    procedure CarregarDadosDaConta(vpBancoId : Integer);
    procedure CancelarArquivoBoleto;
  end;

var
  dtmLookupFinanceiro: TdtmLookupFinanceiro;
  vgPermanecerDesktop : Boolean;
  vgBoletoID : Integer;
  vgPastaBoleto, vgPastaRemessa : String;
  vgCentroCusto : TCentroCusto;
  vgAgendaConc : TAgendaConciliacao;
  vgRenovarTitulo : TRenovarTitulo;

implementation

uses Controles, Rotinas, Lookup_Contabil, VisualizaRelatorios, TelaBranco;

{$R *.dfm}

procedure TdtmLookupFinanceiro.ApagarCentroCustoReserva(vpCampoId, vpTipoCentro : string;
             vpClientDataSet : TClientDataSet; vpId : Integer = 0);
var
  viCampoId : String;
begin
  if vpId = 0 then
    vpClientDataSet.EmptyDataSet
  else
    ExecutaSqlAuxiliar(' DELETE FROM J_CENTRO_RATEIO'+
                       ' WHERE '+vpCampoId+' = '+ IntToStr(vpId)+
                       '   AND TIPO_CENTRO = '+ QuotedStr(vpTipoCentro),1);
end;

procedure TdtmLookupFinanceiro.AtualizarTabelas;
begin
  sqlPessoasTodas.Refresh;
  sqlCaixa.Refresh;
  sqlPessoaFuncao.Refresh;
  sqlGrupoIdentificacao.Refresh;
  sqlTipoDocumento.Refresh;
  sqlCedente.Refresh;
  sqlOrcamento.Refresh;
end;

procedure TdtmLookupFinanceiro.BaixarEstornar(vpTipoReg, vpSituacao : String;
         vpLivroFinanceiroId, vpLivroAgendamento : Integer; vpValorItem, vpValorRegistrar : Currency;
         vpLivroFinanceiroAgrupadorId : Integer = 0);
var
  viSituacaoLF, viSituacaoAg, viSql : String;
  viValorPago : Currency;
  viAgendamentoID : Integer;
begin
  viSituacaoAG := '';
  if vpTipoReg = 'R' then
  begin
    if vpSituacao = '' then
    begin
      if vgDadosLivroCaixa.Situacao = '7' then
           viSituacaoLF := '8'
      else viSituacaoLF := '2';
      if (ClientItemVALOR_ITEM.AsCurrency = ClientItemVALOR_REGISTRAR.AsCurrency) then
      begin
        viSituacaoLF := '3';
        if VerificarQtdLancamentoPendente(vgDadosLivroCaixa.LivroAgendamentoId, vgDadosLivroCaixa.LivroFinanceiroID) = 0 then
          viSituacaoAG := '2';
      end
    end
    else
    begin
      viSituacaoLF := vpSituacao;
      if (StrToInt(viSituacaoLF) in [3,4]) and (VerificarQtdLancamentoPendente(vgDadosLivroCaixa.LivroAgendamentoId, vgDadosLivroCaixa.LivroFinanceiroID) = 0) then
        viSituacaoAG := '2';
    end;
  end
  else
  begin
    if vpSituacao = '' then
         viSituacaoLF := '1'
    else viSituacaoLF := '7';

    viSituacaoAG := '1';
    viValorPago := dtmControles.GetFloat(' SELECT coalesce(SUM(LC1.VALOR),0) FROM J_LIVRO_CAIXA LC1 '+
                                         ' WHERE LC1.LIVRO_FINANCEIRO_ID = '+IntToStr(vpLivroFinanceiroId));
    if viValorPago > 0 then
    begin
      if vpSituacao = '' then
           viSituacaoLF := '2'
      else viSituacaoLF := '8';
    end;
  end;

  viSql := ' UPDATE J_LIVRO_FINANCEIRO SET SITUACAO = '+ QuotedStr(viSituacaoLF);
  if vpLivroFinanceiroAgrupadorId > 0 then
    viSql := viSql + ', FECHAMENTO_ID = '+ IntToStr(vpLivroFinanceiroAgrupadorId);
  viSql := viSql + ' WHERE LIVRO_FINANCEIRO_ID = '+IntToStr(vpLivroFinanceiroId);
  ExecutaSqlAuxiliar(viSql, 1);

  if ((vpTipoReg = 'R') and (viSituacaoAG = '2')) or (vpTipoReg = 'E') then
    ExecutaSqlAuxiliar(' UPDATE J_LIVRO_AGENDAMENTO SET SITUACAO = '+ QuotedStr(viSituacaoAG)+
                       ' WHERE LIVRO_AGENDAMENTO_ID = '+IntToStr(vpLivroAgendamento),1);

  // Retorna os Itens de Vinculados ao Agendamento para o Status de "Faturado, Aguardando Pag."
  if vpTipoReg = 'E' then
    ExecutaSqlAuxiliar(' UPDATE J_LIVRO_FINANCEIRO SET SITUACAO = '+ QuotedStr('6')+
                       ' WHERE FECHAMENTO_ID = '+IntToStr(vpLivroFinanceiroId),1);

end;

function TdtmLookupFinanceiro.CriarTituloLista(vpPessoaId, vpNome: string; vpLivroFinanceiroId: string; vpDataVencimento: TDateTime;
                                               vpBancoId: Integer; vpValor: Double; vpGrupo : Boolean): TRetornoImprimiuBoleto;
var
  viBoletoId: Integer;
  viDadosPessoa : TStringList;
  viDiretorioPadrao, viPathArquivoPDF, viNossoNumero, viNumeroDocumento: string;

  {$REGION 'ConfiguraComponenteAcBr'}
  procedure ConfiguraComponenteAcBr;
  begin
    case sqlBancoBANCO_NUMERO.AsInteger of
      1   : ACBrBoleto1.Banco.TipoCobranca := cobBancoDoBrasil;
      104 : ACBrBoleto1.Banco.TipoCobranca := cobCaixaEconomica;
      237 : ACBrBoleto1.Banco.TipoCobranca := cobBradesco;
      341 : ACBrBoleto1.Banco.TipoCobranca := cobItau;
      399 : ACBrBoleto1.Banco.TipoCobranca := cobHSBC;
      748 : ACBrBoleto1.Banco.TipoCobranca := cobSicred;
      756 : ACBrBoleto1.Banco.TipoCobranca := cobBancoob;
    end;

    ACBrBoleto1.ACBrBoletoFC.DirLogo  := '';
    ACBrBoleto1.ACBrBoletoFC.Filtro   := fiNenhum;
    ACBrBoleto1.ACBrBoletoFC.LayOut   := lPadrao;
    ACBrBoleto1.Banco.Digito          := sqlBancoBANCO_DIGITO.AsInteger;
    ACBrBoleto1.Banco.Numero          := sqlBancoBANCO_NUMERO.AsInteger;
    ACBrBoleto1.Banco.Nome            := sqlBancoBANCO_NOME.AsString;

    // Dados do cedente
    sqlCedente.Locate('CEDENTE_ID', sqlBancoCEDENTE_ID.AsInteger, [loCaseInsensitive]);
    ACBrBoleto1.Cedente.Nome          := AnsiUpperCase(Trim(sqlCedenteRAZAO_SOCIAL.AsString));
    ACBrBoleto1.Cedente.CNPJCPF       := sqlCedenteCNPJ_CPF.AsString;
    ACBrBoleto1.Cedente.CodigoCedente := sqlBancoCODIGO_CEDENTE_NUMERO.AsString+sqlBancoCODIGO_CEDENTE_DIGITO.AsString;
    ACBrBoleto1.Cedente.Agencia       := sqlBancoAGENCIA_NUMERO.AsString;
    ACBrBoleto1.Cedente.AgenciaDigito := sqlBancoAGENCIA_DIGITO.AsString;
    ACBrBoleto1.Cedente.Conta         := sqlBancoCONTA_NUMERO.AsString;
    ACBrBoleto1.Cedente.ContaDigito   := sqlBancoCONTA_DIGITO.AsString;
    ACBrBoleto1.Cedente.Modalidade    := sqlBancoMODALIDADE.AsString;
    ACBrBoleto1.Cedente.UF            := sqlCedenteEND_UF.AsString;
    ACBrBoleto1.Cedente.Telefone      := sqlCedenteTELEFONE.AsString;
    ACBrBoleto1.NomeArqRemessa        := sqlCedenteDESCRICAO.AsString +'_' + FormatDateTime('DDMMYYYYHHMMSS',now) +'.REM';
  end;
  {$ENDREGION}

  {$REGION 'MontarCodigoBarras'}
  procedure MontarCodigoBarras;
  var
    i : Integer;
  begin
    with ACBrBoleto1 do
    begin
      viValoresMontados[i,1] := Banco.MontarCampoNossoNumero( ListadeBoletos[vgBoletoID-1] );
      viValoresMontados[i,2] := Banco.MontarCampoCodigoCedente( ListadeBoletos[vgBoletoID-1] );
      viValoresMontados[i,3] := Banco.MontarCodigoBarras( ListadeBoletos[vgBoletoID-1] );
      viValoresMontados[i,4] := Banco.MontarLinhaDigitavel(viValoresMontados[i,3],ListadeBoletos[vgBoletoID-1]);
    end;
  end;
  {$ENDREGION}

  {$REGION 'GravarDadosBoleto'}
  function GravarDadosBoleto(viPath: string): Integer;
  var
    viBoletoId: Integer;
  begin
    sqlBoleto.Active := False;
    if vgRenovarTitulo.Renovar then
    begin
      sqlBoleto.DataSet.ParamByName('BOLETO_ID').AsInteger := StrToInt(vgRenovarTitulo.DadosTituloRenovado.Values['BOLETO_ID']);
      sqlBoleto.Active := True;
      sqlBoleto.Edit;
      viBoletoId := sqlBoletoBOLETO_ID.AsInteger;
      sqlBoletoSITUACAO.AsString      := '5'; // Alterar Data Vencimento
      sqlBoletoCONT_REMESSA.AsVariant := null;
    end
    else
    begin
      sqlBoleto.DataSet.ParamByName('BOLETO_ID').AsInteger := 0;
      sqlBoleto.Active := True;
      sqlBoleto.Append;
      viBoletoId := dtmControles.GerarSequencia('J_BANCO');
      sqlBoletoBOLETO_ID.AsInteger     := viBoletoId;
      sqlBoletoESPECIE.AsString        := 'DM';
      sqlBoletoACEITE.AsString         := 'N';
      sqlBoletoSITUACAO.AsString       := '1';
      sqlBoletoCARTEIRA.AsString       := sqlBancoCARTEIRA.AsString;
      sqlBoletoNOSSO_NUMERO.AsString   := viNossoNumero;
      sqlBoletoVALOR.AsCurrency        := vpValor;
      sqlBoletoBANCO_ID.AsInteger      := sqlBancoBANCO_ID.AsInteger;
      sqlBoletoPESSOA_ID.AsInteger     := StrToInt(vpPessoaId);
    end;

    sqlBoletoDATA_EMISSAO.AsDateTime    := Now;
    sqlBoletoDATA_VENCIMENTO.AsDateTime := vpDataVencimento;
    sqlBoletoPATH_GERARPDF.AsString     := viPath;

    sqlBoleto.Post;
    sqlBoleto.ApplyUpdates(0);
    sqlBoleto.Active := False;

    Result := viBoletoId;
  end;
  {$ENDREGION}

  {$REGION 'RetorneLinhaObs'}
  function RetorneLinhaObs(vpDocumentoId: string; vpContabilContaId: string; vpValor: Double): string;
  begin
    Result := 'N� Doc: ' + vpDocumentoId + ' ' +
      Trim(dtmControles.GetStr('select DESCRICAO from J_CONTABIL_CONTA where ' +
      ' CONTABIL_CONTA_ID = ' + vpContabilContaId)) + ' R$: ' + FloatToStr(vpValor) + #13#10;
  end;
  {$ENDREGION}

  {$REGION 'CarregarDadosTitulo'}
  procedure CarregarDadosTitulo;
  begin
    viNumeroDocumento := '';
    Titulo := ACBrBoleto1.CriarTituloNaLista;
    viDadosPessoa := TStringList.Create;

    if vpPessoaId = '' then
      viDadosPessoa  := dtmControles.GetFields('select FIRST 1 PESSOA_ID, NOME, CPFCNPJ, ENDERECO_LOGRADOURO, ENDERECO_BAIRRO, BOLETO_DESCRICAO, BOLETO_LOGOMARCA, '+
                                ' ENDERECO_CEP, ENDERECO_CIDADE_ID, ENDERECO_CIDADE_UF '+
                                ' from J_PESSOA WHERE IDENTIFICACAO = '+ QuotedStr(vpNome))
    else
      viDadosPessoa  := dtmControles.GetFields('select NOME, CPFCNPJ, ENDERECO_LOGRADOURO, ENDERECO_BAIRRO, BOLETO_DESCRICAO, BOLETO_LOGOMARCA, '+
                                ' ENDERECO_CEP, ENDERECO_CIDADE_ID, ENDERECO_CIDADE_UF '+
                                ' from J_PESSOA WHERE PESSOA_ID = '+ vpPessoaId);

    if vpPessoaId = '' then
      vpPessoaId :=  viDadosPessoa.Values['PESSOA_ID'];

    Titulo.Vencimento         := vpDataVencimento;
    Titulo.DataDocumento      := Now;
    Titulo.NumeroDocumento    := FormatFloat('000,000', StrToInt(vpPessoaId));
    Titulo.EspecieDoc         := 'DM';
    Titulo.Aceite             := atNao;
    Titulo.DataProcessamento  := Now;
    Titulo.Carteira           := sqlBancoCARTEIRA.AsString;
    Titulo.ValorDocumento     := vpValor;

    if not vgRenovarTitulo.Renovar then
         viNossoNumero        := dtmControles.GerarSequencia('BOLETO_NOSSO_NUMERO')
    else viNossoNumero        := vgRenovarTitulo.DadosTituloRenovado.Values['NOSSO_NUMERO'];
    Titulo.NossoNumero        := viNossoNumero;

    Titulo.Sacado.NomeSacado  := viDadosPessoa.Values['NOME'];
    if viDadosPessoa.Values['BOLETO_DESCRICAO'] = '' then
         Titulo.Sacado.Avalista := Titulo.Sacado.NomeSacado
    else Titulo.Sacado.Avalista := viDadosPessoa.Values['BOLETO_DESCRICAO'];

    Titulo.Sacado.CNPJCPF     := viDadosPessoa.Values['CPFCNPJ'];
    Titulo.Sacado.Logradouro  := viDadosPessoa.Values['ENDERECO_LOGRADOURO'];
    Titulo.Sacado.Numero      := '';
    Titulo.Sacado.Bairro      := viDadosPessoa.Values['ENDERECO_BAIRRO'];
    Titulo.Sacado.CEP         := viDadosPessoa.Values['ENDERECO_CEP'];
    Titulo.Sacado.UF          := viDadosPessoa.Values['ENDERECO_CIDADE_UF'];
    vlBoletoLogomarca         := viDadosPessoa.Values['BOLETO_LOGOMARCA'];

    if viDadosPessoa.Values['ENDERECO_CIDADE_ID'] <> '' then
      Titulo.Sacado.Cidade      := dtmControles.GetStr('SELECT MUNICIPIO FROM G_MUNICIPIO WHERE MUNICIPIO_ID = ' +
      viDadosPessoa.Values['ENDERECO_CIDADE_ID']);

    Titulo.ValorAbatimento    := 0;
    Titulo.LocalPagamento     := 'PAG�VEL EM QUALQUER BANCO AT� O VENCIMENTO';
    Titulo.ValorMoraJuros     := 0;
    Titulo.ValorDesconto      := 0;
    Titulo.DataMoraJuros      := 0;
    Titulo.DataDesconto       := 0;
    Titulo.DataAbatimento     := 0;
    Titulo.DataProtesto       := vpDataVencimento + 90;
    Titulo.PercentualMulta    := 0;
    Titulo.Mensagem.Text      := '';

    if not vgRenovarTitulo.Renovar then
         Titulo.OcorrenciaOriginal.Tipo := toRemessaRegistrar
    else Titulo.OcorrenciaOriginal.Tipo := toRemessaAlterarVencimento;

    Titulo.Instrucao1         := '';
    Titulo.Instrucao2         := '';
    Titulo.Parcela            := 1;
  end;
  {$ENDREGION}

begin
  Result.ImprimiuBoleto := False;

  CarregarDadosDaConta(vpBancoId);
  ConfiguraComponenteAcBr;
  CarregarDadosTitulo;

  try
    MontarCodigoBarras;
    try
      if vpGrupo then
           viDiretorioPadrao := vgPastaBoleto+'\'+vpNome
      else viDiretorioPadrao := vgPastaBoleto+'\'+Titulo.Sacado.Avalista;

      if viDiretorioPadrao = '' then
        ExibirRelatorio(frxReport1, sqlBancoCONFIG_RELATORIO_ID.AsString, ParametrosRelatorio, True)
      else
      begin
      begin
        try
          if not FileExists(viDiretorioPadrao) then
            ForceDirectories(viDiretorioPadrao);
         except
           Application.MessageBox(Pchar('Local do Arquivo de Boleto n�o Encontrado!'+#13+#13+
                                        'Verifique o Local da Pasta em CADASTRO/CEDENTE/CONTAS BANC�RIAS'), 'Informar', MB_OK + MB_ICONINFORMATION);
           Abort;
         end;
      end;

        if vpGrupo then
          viPathArquivoPDF  := viDiretorioPadrao + '\' + vpNome +
                            '_' + RetirarBarra(Datetostr(Titulo.Vencimento))
        else
          viPathArquivoPDF  := viDiretorioPadrao + '\' + Titulo.Sacado.Avalista +
                            '_' + RetirarBarra(Datetostr(Titulo.Vencimento));

        viPathArquivoPDF := viPathArquivoPDF + '_' + Titulo.NossoNumero + '.PDF';
        viBoletoId := GravarDadosBoleto(viPathArquivoPDF);

        frxPDFExport1.FileName   := viPathArquivoPDF;
        frxPDFExport1.Quality    := 100;
        frxPDFExport1.Compressed := True;

        if vgRenovarTitulo.Renovar then
          CancelarArquivoBoleto;

        frxReport1.PrintOptions.ShowDialog := False;
        ExibirRelatorio(frxReport1, sqlBancoCONFIG_RELATORIO_ID.AsString, ParametrosRelatorio, False, '', False, True,viPathArquivoPDF, frxPDFExport1);
      end;

      try
        ExecutaSqlAuxiliar('update J_LIVRO_FINANCEIRO set SELECIONADO = ''N'', BOLETA_ID = ' +
                            IntToStr(viBoletoId) + ' where LIVRO_FINANCEIRO_ID  IN (' + vpLivroFinanceiroId + ')', 1);


        // Atualiza a Data do Historico do Livro Financeiro, dos itens que foram alterados.
{        ExecutaSqlAuxiliar(' UPDATE J_LIVRO_FINANCEIRO LF1 SET LF1.DATA_HISTORICO = (CAST(LF1.DATA_HISTORICO AS DATE) || ''*'' || CAST(LF1.DATA_VENCIMENTO AS DATE)), '+
                           '             LF1.DATA_VENCIMENTO = (SELECT FIRST 1 B1.DATA_VENCIMENTO '+
                           '             FROM J_BOLETO B1 WHERE B1.BOLETO_ID = LF1.BOLETA_ID) '+
                           '   WHERE LF1.LIVRO_FINANCEIRO_ID IN ( '+
                           '   SELECT LF.LIVRO_FINANCEIRO_ID '+
                           '   FROM J_LIVRO_FINANCEIRO LF '+
                           '     LEFT OUTER JOIN J_BOLETO B ON '+
                           '     LF.BOLETA_ID = B.BOLETO_ID '+
                           '   WHERE NOT LF.BOLETA_ID IS NULL '+
                           '     AND LF.DATA_VENCIMENTO <> B.DATA_VENCIMENTO) ',1);}

        ExecutaSqlAuxiliar(' UPDATE J_LIVRO_FINANCEIRO LF1 SET LF1.DATA_VENCIMENTO = (SELECT FIRST 1 B1.DATA_VENCIMENTO '+
                           '             FROM J_BOLETO B1 WHERE B1.BOLETO_ID = LF1.BOLETA_ID) '+
                           '   WHERE LF1.LIVRO_FINANCEIRO_ID IN ( '+
                           '   SELECT LF.LIVRO_FINANCEIRO_ID '+
                           '   FROM J_LIVRO_FINANCEIRO LF '+
                           '     LEFT OUTER JOIN J_BOLETO B ON '+
                           '     LF.BOLETA_ID = B.BOLETO_ID '+
                           '   WHERE NOT LF.BOLETA_ID IS NULL '+
                           '     AND LF.DATA_VENCIMENTO <> B.DATA_VENCIMENTO) ',1);

      except
        Result.ImprimiuBoleto := False;
      end;

      Result.boletoId       := viBoletoId;
      Result.ImprimiuBoleto := True;
    except
      Result.ImprimiuBoleto := False;
    end;
  finally
    FreeAndNil(viDadosPessoa);
  end;
end;

procedure TdtmLookupFinanceiro.CancelarArquivoBoleto;
var
  viPathArquivoPDF : String;
begin
  viPathArquivoPDF := vgRenovarTitulo.DadosTituloRenovado.Values['PATH_GERARPDF'];
  if FileExists(viPathArquivoPDF) then
    RenameFile(viPathArquivoPDF, ExtractFileDir(viPathArquivoPDF)+'\'+ExtractFileName(viPathArquivoPDF)+'_CANCELADO.PDF');
end;

procedure TdtmLookupFinanceiro.CarregarDadosDaConta(vpBancoId : Integer);
begin
  sqlBanco.Active := False;
  sqlBanco.DataSet.ParamByName('BANCO_ID').AsBCD := vpBancoId;
  sqlBanco.Active := True;

  vgPastaBoleto :=  Trim(sqlBancoLOCAL_PADRAO.AsString);
end;

function TdtmLookupFinanceiro.CriarTitulo(
  vpId,
  vpBancoId: Integer): TRetornoImprimiuBoleto;
var
  viBoletoId: Integer;
  viDadosPessoa : TStringList;
  viDiretorioPadrao: string;
  viPathArquivoPDF: string;

  procedure CarregarDadosConta;
  begin
    sqlLivroFinanceiro.Active := False;
    sqlLivroFinanceiro.DataSet.ParamByName('LIVRO_FINANCEIRO_ID').AsBCD := vpId;
    sqlLivroFinanceiro.Active := True;

    sqlBanco.Active := False;
    sqlBanco.DataSet.ParamByName('BANCO_ID').AsBCD := vpBancoId;
    sqlBanco.Active := True;
  end;

  procedure ConfiguraComponenteAcBr;
  begin
    ACBrBoleto1.ACBrBoletoFC.DirLogo  := '';
    ACBrBoleto1.ACBrBoletoFC.Filtro   := fiNenhum;
    ACBrBoleto1.ACBrBoletoFC.LayOut   := lPadrao;
    ACBrBoleto1.Banco.Digito          := sqlBancoBANCO_DIGITO.AsInteger;
    ACBrBoleto1.Banco.Numero          := sqlBancoBANCO_NUMERO.AsInteger;
    ACBrBoleto1.Banco.Nome            := sqlBancoBANCO_NOME.AsString;

    // Dados do Cedente
    sqlCedente.Locate('CEDENTE_ID', sqlBancoCEDENTE_ID.AsInteger, [loCaseInsensitive]);
    ACBrBoleto1.Cedente.Nome          := AnsiUpperCase(Trim(sqlCedenteRAZAO_SOCIAL.AsString));
    ACBrBoleto1.Cedente.CNPJCPF       := sqlCedenteCNPJ_CPF.AsString;
    ACBrBoleto1.Cedente.CodigoCedente := sqlBancoCODIGO_CEDENTE_NUMERO.AsString +
      sqlBancoCODIGO_CEDENTE_DIGITO.AsString;
    ACBrBoleto1.Cedente.Agencia       := sqlBancoAGENCIA_NUMERO.AsString;
    ACBrBoleto1.Cedente.AgenciaDigito := sqlBancoAGENCIA_DIGITO.AsString;
    ACBrBoleto1.Cedente.Conta         := sqlBancoCONTA_NUMERO.AsString;
    ACBrBoleto1.Cedente.ContaDigito   := sqlBancoCONTA_DIGITO.AsString;
    ACBrBoleto1.Cedente.Modalidade    := '';
    ACBrBoleto1.Cedente.UF            := sqlCedenteEND_UF.AsString;
    ACBrBoleto1.NomeArqRemessa        := sqlCedenteDESCRICAO.AsString +'_' + FormatDateTime('DDMMYYYYHHMMSS',now) +'.REM';
  end;

  procedure MontarCodigoBarras;
  var
    i : Integer;
  begin
    with ACBrBoleto1 do
    begin
      viValoresMontados[i,1] := Banco.MontarCampoNossoNumero( ListadeBoletos[vgBoletoID-1] );
      viValoresMontados[i,2] := Banco.MontarCampoCodigoCedente( ListadeBoletos[vgBoletoID-1] );
      viValoresMontados[i,3] := Banco.MontarCodigoBarras( ListadeBoletos[vgBoletoID-1] );
      viValoresMontados[i,4] := Banco.MontarLinhaDigitavel(viValoresMontados[i,3],ListadeBoletos[vgBoletoID-1]);
    end;
  end;

  function GravarDadosBoleto(viPath: string): Integer;
  var
    viBoletoId: Integer;
  begin
    sqlBoleto.Active := False;
    sqlBoleto.Active := True;
    sqlBoleto.Append;

    viBoletoId := dtmControles.GerarSequencia('J_BANCO');
    sqlBoletoBOLETO_ID.AsInteger     := viBoletoId;
  //  sqlBoletoPATH_REMESSA.AsString;
  //  sqlBoletoPATH_RETORNO.AsString;
  //  sqlBoletoPATH_LOGOTIPO.AsString;
    sqlBoletoPATH_GERARPDF.AsString  := viPath + '_' + IntToStr(viBoletoId) + '.PDF';
  //  sqlBoletoMENSAGEM.AsString;
    sqlBoletoESPECIE.AsString        := 'DM';
  //  sqlBoletoMOEDA.AsString;
    sqlBoletoACEITE.AsString         := 'N';
    sqlBoletoCARTEIRA.AsString       := sqlBancoCARTEIRA.AsString;
  //  sqlBoletoLOCAL_PAGTO.AsString;
  //  sqlBoletoCONT_REMESSA.AsInteger;
//    sqlBoletoNOSSO_NUMERO.AsString := NossoNumero;
    sqlBoletoSITUACAO.AsString := '1';
//    sqlBoletoVALOR.AsCurrency := 0;
//    sqlBoletoDATA_EMISSAO.AsDateTime := Now;
//    sqlBoletoDATA_VENCIMENTO.AsDateTime := sqlLivroFinanceiroDATA_VENCIMENTO.AsDateTime;

    sqlBoleto.Post;
    sqlBoleto.ApplyUpdates(0);
    sqlBoleto.Active := False;

    Result := viBoletoId;
  end;

begin
  Result.ImprimiuBoleto := False;
  CarregarDadosConta;
  Titulo := ACBrBoleto1.CriarTituloNaLista;
  viDadosPessoa := TStringList.Create;
  with Titulo do
  begin
    Vencimento         := sqlLivroFinanceiroDATA_VENCIMENTO.AsDateTime;
    DataDocumento      := sqlLivroFinanceiroDATA_OPERACAO.AsDateTime;
    NumeroDocumento    := 'N� Doc: ' + sqlLivroFinanceiroLIVRO_FINANCEIRO_ID.AsString;
    EspecieDoc         := 'DM';
    Aceite             := atNao;
    DataProcessamento  := Now;
    NossoNumero        := dtmControles.GerarSequencia('BOLETO_NOSSO_NUMERO');
    Carteira           := sqlBancoCARTEIRA.AsString;
    ValorDocumento     := sqlLivroFinanceiroVALOR_AGENDADO.AsCurrency;

    viDadosPessoa      := dtmControles.GetFields(' SELECT NOME, CPFCNPJ, ENDERECO_LOGRADOURO, ENDERECO_BAIRRO, '+
                           '        ENDERECO_CEP, ENDERECO_CIDADE_ID, ENDERECO_CIDADE_UF '+
                           ' FROM J_PESSOA WHERE PESSOA_ID = '+ sqlLivroFinanceiroPESSOA_ID.AsString);

    Sacado.NomeSacado  := viDadosPessoa.Values['NOME'];
    Sacado.CNPJCPF     := viDadosPessoa.Values['CPFCNPJ'];
    Sacado.Logradouro  := viDadosPessoa.Values['ENDERECO_LOGRADOURO'];
    Sacado.Numero      := '';
    Sacado.Bairro      := viDadosPessoa.Values['ENDERECO_BAIRRO'];
    Sacado.CEP         := viDadosPessoa.Values['ENDERECO_CEP'];
    Sacado.UF          := viDadosPessoa.Values['ENDERECO_CIDADE_UF'];

    if viDadosPessoa.Values['ENDERECO_CIDADE_ID'] <> '' then
      Sacado.Cidade      := dtmControles.GetStr('SELECT MUNICIPIO FROM G_MUNICIPIO WHERE MUNICIPIO_ID = ' +
      viDadosPessoa.Values['ENDERECO_CIDADE_ID']);

    ValorAbatimento    := 0;
    LocalPagamento     := 'PAG�VEL EM QUALQUER BANCO AT� O VENCIMENTO';
    ValorMoraJuros     := 0;
    ValorDesconto      := 0;
    DataMoraJuros      := 0;
    DataDesconto       := 0;
    DataAbatimento     := 0;
    DataProtesto       := sqlLivroFinanceiroDATA_VENCIMENTO.AsDateTime + 90;
    PercentualMulta    := 0;
    Mensagem.Text      := '';
    OcorrenciaOriginal.Tipo := toRemessaRegistrar;
    Instrucao1         := '';
    Instrucao2         := '';
    Parcela            := 1;
  end;

  ConfiguraComponenteAcBr;
  MontarCodigoBarras;

  try
    viDiretorioPadrao := Trim(sqlBancoLOCAL_PADRAO.AsString);

    if viDiretorioPadrao = '' then
      ExibirRelatorio(frxReport1, sqlBancoCONFIG_RELATORIO_ID.AsString, ParametrosRelatorio, True)
    else begin
      if not FileExists(viDiretorioPadrao) then
        ForceDirectories(viDiretorioPadrao);

      viPathArquivoPDF  := viDiretorioPadrao + '\' +
        Titulo.Sacado.NomeSacado +
        '_' + RetirarBarra(Datetostr(Titulo.Vencimento));

      viBoletoId := GravarDadosBoleto(viPathArquivoPDF);
      viPathArquivoPDF := viPathArquivoPDF + '_' + IntToStr(viBoletoId) + '.PDF';

      frxPDFExport1.FileName := viPathArquivoPDF;
      ExibirRelatorio(frxReport1, sqlBancoCONFIG_RELATORIO_ID.AsString, ParametrosRelatorio, False, '', False, False, '', frxPDFExport1);
    end;

    Result.boletoId := viBoletoId;
    Result.ImprimiuBoleto := True;
  except
    Result.ImprimiuBoleto := False;
  end;
  FreeAndNil(viDadosPessoa);
end;

procedure TdtmLookupFinanceiro.DataModuleCreate(Sender: TObject);
begin
  sqlPessoasTodas.Connection      := dtmControles.DB;
  sqlCaixa.Connection             := dtmControles.DB;
  sqlPessoaFuncao.Connection      := dtmControles.DB;
  sqlGrupoIdentificacao.Connection:= dtmControles.DB;
  sqlPessoaTarefa.Connection      := dtmControles.DB;
  sqlContaBancaria.Connection     := dtmControles.DB;
  sqlLayoutBoleto.Connection      := dtmControles.DB;
  sqlCedente.Connection           := dtmControles.DB;
  sqlOrcamento.Connection         := dtmControles.DB;
  sqlTipoDocumento.Connection     := dtmControles.DB;
  sqlBoleto.Connection            := dtmControles.DB;
  sqlBanco.Connection             := dtmControles.DB;
  sqlLivroFinanceiro.Connection   := dtmControles.DB;

  sqlPessoasTodas.Open;
  sqlCaixa.Open;
  sqlPessoaFuncao.Open;
  sqlGrupoIdentificacao.Open;
  sqlPessoaTarefa.Open;
  sqlContaBancaria.Open;
  sqlLayoutBoleto.Open;
  sqlCedente.Open;
  sqlOrcamento.Open;
  sqlTipoDocumento.Open;

  {frxPDFExport1 := TfrxAPDFExport.Create(nil);
  frxPDFExport1.ShowDialog := False;
  frxPDFExport1.ShowProgress := False;
  frxPDFExport1.Compressed := True;
  frxPDFExport1.PDFA := True;
  frxPDFExport1.EmbeddedFonts := False;
  frxPDFExport1.OpenAfterExport := False; }
end;

procedure TdtmLookupFinanceiro.DataModuleDestroy(Sender: TObject);
begin
  sqlPessoasTodas.Close;
  sqlCaixa.Close;
  sqlPessoaFuncao.Close;
  sqlGrupoIdentificacao.Close;
  sqlPessoaTarefa.Close;
  sqlContaBancaria.Close;
  sqlLayoutBoleto.Close;
  sqlCedente.Close;
  sqlTipoDocumento.Close;
  //FreeAndNil(frxPDFExport1);
end;

procedure TdtmLookupFinanceiro.AbrirFecharTelaBranco(vpAbrir : Boolean = True);
begin
  if dtmControles.BuscarConfig('PRINCIPAL', 'DESIGNER','MOSTRAR_FUNDO_BRANCO', 'S') <> 'S' then
    exit;

  if vpAbrir then
    ExibirFormulario(TfrmTelaBranco, frmTelaBranco)
  else
    if frmTelaBranco <> nil then
      frmTelaBranco.Close;
end;

function TdtmLookupFinanceiro.GerarRemessa(vpBancoId: Integer; vpBoleto: TArrayOfBoleto): TRetornoGerouRemessa;
var
  i: Integer;
  viContadorRemessa: Integer;

  procedure CarregarDadosDoCedente;
  begin
     // Dados do Cedente .......................................................
     ACBrBoleto1.Cedente.Agencia       := sqlBancoAGENCIA_NUMERO.AsString;
     ACBrBoleto1.Cedente.AgenciaDigito := sqlBancoAGENCIA_DIGITO.AsString;
     ACBrBoleto1.Cedente.CodigoCedente := sqlBancoCODIGO_CEDENTE_NUMERO.AsString +
                                          sqlBancoCODIGO_CEDENTE_DIGITO.AsString;
     ACBrBoleto1.Cedente.Conta         := sqlBancoCONTA_NUMERO.AsString;
     ACBrBoleto1.Cedente.ContaDigito   := sqlBancoCONTA_DIGITO.AsString;
     ACBrBoleto1.Cedente.Convenio      := sqlBancoCONVENIO.AsString;

     ACBrBoleto1.Cedente.Nome          := AnsiUpperCase(Trim(sqlCedenteRAZAO_SOCIAL.AsString));
     ACBrBoleto1.Cedente.CNPJCPF       := sqlCedenteCNPJ_CPF.AsString;
     ACBrBoleto1.Cedente.Logradouro    := sqlCedenteEND_LOG.AsString;
     ACBrBoleto1.Cedente.Modalidade    := sqlBancoMODALIDADE.AsString;
     ACBrBoleto1.Cedente.Complemento   := sqlCedenteCOMPLEMENTO.AsString;
     ACBrBoleto1.Cedente.Bairro        := sqlCedenteEND_BAIRRO.AsString;
     ACBrBoleto1.Cedente.Cidade        := sqlCedenteEND_CIDADE.AsString;
     ACBrBoleto1.Cedente.UF            := sqlCedenteEND_UF.AsString;
     ACBrBoleto1.Cedente.CEP           := sqlCedenteEND_CEP.AsString;
     ACBrBoleto1.Cedente.ResponEmissao := tbCliEmite;
     ACBrBoleto1.Cedente.CaracTitulo   := tcSimples;
     ACBrBoleto1.Cedente.TipoCarteira  := tctRegistrada;
     ACBrBoleto1.Cedente.TipoInscricao := pJuridica;

     ACBrBoleto1.Cedente.CodigoTransmissao := '';
     ACBrBoleto1.Cedente.NumeroRes         := '';
     ACBrBoleto1.Cedente.Telefone          := sqlCedenteTELEFONE.AsString;
  end;

begin

  try
     CarregarDadosDaConta(vpBancoId);
     CarregarDadosDoCedente;

    case sqlBancoBANCO_NUMERO.AsInteger of
      1   : ACBrBoleto1.Banco.TipoCobranca := cobBancoDoBrasil;
      104 : ACBrBoleto1.Banco.TipoCobranca := cobCaixaEconomica;
      237 : ACBrBoleto1.Banco.TipoCobranca := cobBradesco;
      341 : ACBrBoleto1.Banco.TipoCobranca := cobItau;
      399 : ACBrBoleto1.Banco.TipoCobranca := cobHSBC;
      748 : ACBrBoleto1.Banco.TipoCobranca := cobSicred;
      756 : ACBrBoleto1.Banco.TipoCobranca := cobBancoob;
    end;

     vgPastaRemessa := Trim(sqlBancoLOCAL_REMESSA.AsString);
     if vgPastaRemessa = '' then
     begin
       Result.gerouRemessa := False;
       Abort;
     end;

     try
       if not DirectoryExists(vgPastaRemessa) then
         MkDir(vgPastaRemessa);
     except
       Application.MessageBox(Pchar('Local do Arquivo de Remessa n�o Encontrado!'+#13+#13+
                                   'Verifique o Local da Pasta em CADASTRO/CEDENTE/CONTAS BANC�RIAS'), 'Informar', MB_OK + MB_ICONINFORMATION);
       Abort;
     end;

     ACBrBoleto1.DirArqRemessa   := vgPastaRemessa;
     ACBrBoleto1.ChecarDadosObrigatorios;
     ACBrBoleto1.ListadeBoletos.Clear;
     for i := Low(vpBoleto) to High(vpBoleto) do begin
       with ACBrBoleto1.ListadeBoletos do begin

         Add(TACBrTitulo.Create(ACBrBoleto1));

         Objects[i].OcorrenciaOriginal.Tipo := toRemessaRegistrar;
         if vpBoleto[i].situacao = '3' then
           Objects[i].OcorrenciaOriginal.Tipo := toRemessaBaixar
         else
           if vpBoleto[i].situacao = '5' then
             Objects[i].OcorrenciaOriginal.Tipo := toRemessaAlterarVencimento;

         Objects[i].Vencimento        := vpBoleto[i].vencimento;
         Objects[i].DataDocumento     := vpBoleto[i].dataDocumento;
         Objects[i].NumeroDocumento   := vpBoleto[i].numeroDocumento;
         Objects[i].EspecieDoc        := vpBoleto[i].especieDoc;
         Objects[i].Aceite            := atNao;
         Objects[i].DataProcessamento := vpBoleto[i].dataProcessamento;
         Objects[i].NossoNumero       := vpBoleto[i].nossoNumero;
         Objects[i].Carteira          := vpBoleto[i].carteira;
         Objects[i].ValorDocumento    := vpBoleto[i].valorDocumento;

         Objects[i].Sacado.NomeSacado := vpBoleto[i].nomeSacado;
         Objects[i].Sacado.CNPJCPF    := vpBoleto[i].CNPJCPF;
         if Length(vpBoleto[i].CNPJCPF) <= 11 then
              Objects[i].Sacado.Pessoa := pFisica
         else Objects[i].Sacado.Pessoa := pJuridica;
         Objects[i].Sacado.Cidade     := vpBoleto[i].cidade;
         Objects[i].Sacado.Logradouro := vpBoleto[i].logradouro;
         Objects[i].Sacado.Numero     := vpBoleto[i].numero;
         Objects[i].Sacado.Bairro     := vpBoleto[i].bairro;
         Objects[i].Sacado.UF         := vpBoleto[i].UF;
         Objects[i].Sacado.CEP        := vpBoleto[i].CEP;
         Objects[i].Sacado.Email      := vpBoleto[i].email;
         Objects[i].Sacado.Fone       := vpBoleto[i].fone;

         Objects[i].Parcela           := vpBoleto[i].parcela;
         Objects[i].TotalParcelas     := vpBoleto[i].totalParcelas;
         Objects[i].DataDesconto      := vpBoleto[i].dataDesconto;
         Objects[i].DataMoraJuros     := vpBoleto[i].dataMoraJuros;
         Objects[i].ValorDesconto     := vpBoleto[i].valorDesconto;
         Objects[i].ValorMoraJuros    := vpBoleto[i].valorMoraJuros;
         Objects[i].PercentualMulta   := vpBoleto[i].percentualMulta;
       end;
     end;

    // captura o contador de remessa e gera a mesma
    viContadorRemessa := dtmControles.GerarSequencia('BOLETO_REMESSA_'+IntToStr(vpBancoId));
    ACBrBoleto1.NomeArqRemessa := sqlContaBancariaBANCO_ID.AsString+'R_' + FormatFloat('00000',viContadorRemessa) + '.REM';
    ACBrBoleto1.GerarRemessa(viContadorRemessa);

    try
      Result.gerouRemessa := FileExists(ACBrBoleto1.DirArqRemessa + '\' + ACBrBoleto1.NomeArqRemessa);
      Result.remessaId := viContadorRemessa;
    except
      Result.gerouRemessa := False;
      Application.MessageBox(Pchar('Local do Arquivo de Remessa n�o Encontrado!'+#13+#13+
                                   'Verifique o Local da Pasta em CADASTRO/CEDENTE/CONTAS BANC�RIAS'), 'Informar', MB_OK + MB_ICONINFORMATION);
    end
  except
    MessageDlg('Erro ao gerar arquivo de remessa. Verifique!',mtWarning,[mbOK],0);
  end;
end;

function TdtmLookupFinanceiro.GetPessoaID(vfCPfCNPJ: String): Integer;
var
  viSql : String;
begin
  if trim(vfCPfCNPJ) = '' then
    Result := 0
  else
  begin
    viSql := 'SELECT PESSOA_ID FROM J_PESSOA WHERE CPFCNPJ = ' + QuotedStr(RetornaNumerico(vfCPfCNPJ));
    Result := dtmControles.GetInt(viSql);
  end;
end;

procedure TdtmLookupFinanceiro.GravarCentroCustoReserva(vpId : Integer; vpCampoId, vpTipoCentro : String;
           vpClientDataSet : TClientDataSet);
  procedure GravarRegistro;
  begin
    ExecutaSqlAuxiliar(' INSERT INTO J_CENTRO_RATEIO (CENTRO_RATEIO_ID, '+
                       '              CENTRO_CUSTO_ID, '+
                       '              PERCENTUAL, '+
                       '              TIPO_CENTRO, '+
                       '              '+vpCampoId+') '+
                       ' VALUES(      :CENTRO_RATEIO_ID, '+
                       '              :CENTRO_CUSTO_ID, '+
                       '              :PERCENTUAL, '+
                       '              :TIPO_CENTRO, '+
                       '              :'+vpCampoId+')',2);
    with dtmControles.sqlAuxiliar do
    begin
      ParamByName('CENTRO_RATEIO_ID').AsBCD     := dtmControles.GerarSequencia('J_CENTRO_RATEIO');
      ParamByName('CENTRO_CUSTO_ID').AsBCD      := vpClientDataSet.FieldByName('CENTRO_CUSTO_ID').AsCurrency;
      ParamByName('PERCENTUAL').AsBCD           := vpClientDataSet.FieldByName('PORCENTAGEM').AsCurrency;
      ParamByName('TIPO_CENTRO').AsString       := vpTipoCentro;
      ParamByName(vpCampoId).AsBCD              := vpId;
      ExecSQL(FALSE);
    end;
  end;

begin
  if not vgCentroCusto.Confirmado then
    exit;

  ApagarCentroCustoReserva(vpCampoId, vpTipoCentro, vpClientDataSet, vpId);

  vpClientDataSet.First;
  While not vpClientDataSet.eof do
  begin
    GravarRegistro;
    vpClientDataSet.Next;
  end;
end;

procedure TdtmLookupFinanceiro.ParametrosRelatorio;
var
  vpDataInicio, vpDataFim : string;
  vpValorDivida : Currency;
  viResumo : String;
begin
  with ACBrBoleto1 do
  begin
    CriarFuncoesRelatorio(frxReport1);
    frxReport1.Variables.Variables['NomeBanco']             := QuotedStr(Banco.Nome);
    frxReport1.Variables.Variables['CodigoBanco']           := QuotedStr(IntToStr(Banco.Numero)+'-'+IntToStr(Banco.Digito));
    frxReport1.Variables.Variables['LocalPagamento']        := QuotedStr(Titulo.LocalPagamento);
    frxReport1.Variables.Variables['DataVencimento']        := QuotedStr(DateToStr(Titulo.Vencimento));
    frxReport1.Variables.Variables['NomeCedente']           := QuotedStr(Cedente.Nome);
    frxReport1.Variables.Variables['CNPJCedente']           := QuotedStr(Cedente.CNPJCPF);
    frxReport1.Variables.Variables['TelefoneCedente']       := QuotedStr(Cedente.Telefone);
    frxReport1.Variables.Variables['AgenciaCodigoCedente']  := QuotedStr(viValoresMontados[0,2]);
    frxReport1.Variables.Variables['DataDocumento']         := QuotedStr(DateToStr(Titulo.DataDocumento));
    frxReport1.Variables.Variables['NumeroDocumento']       := QuotedStr(Titulo.NumeroDocumento);
    frxReport1.Variables.Variables['EspecieDocumento']      := QuotedStr(Titulo.EspecieDoc);
    frxReport1.Variables.Variables['Aceite']                := QuotedStr('N');
    frxReport1.Variables.Variables['DataProcessamento']     := QuotedStr(DateToStr(Titulo.DataProcessamento));
    frxReport1.Variables.Variables['NossoNumero']           := QuotedStr(viValoresMontados[0,1]);
    frxReport1.Variables.Variables['Carteira']              := QuotedStr(Titulo.Carteira);
    frxReport1.Variables.Variables['EspecieMoeda']          := QuotedStr('REAL');
    frxReport1.Variables.Variables['ValorDocumento']        := QuotedStr(CurrToStr(Titulo.ValorDocumento));
    frxReport1.Variables.Variables['SacadoLogradouro']      := QuotedStr(Titulo.Sacado.Logradouro);
    frxReport1.Variables.Variables['SacadoBairro']          := QuotedStr(Titulo.Sacado.Bairro);
    frxReport1.Variables.Variables['SacadoCidade']          := QuotedStr(Titulo.Sacado.Cidade);
    frxReport1.Variables.Variables['SacadoUF']              := QuotedStr(Titulo.Sacado.UF);
    frxReport1.Variables.Variables['SacadoCEP']             := QuotedStr(Titulo.Sacado.CEP);
    frxReport1.Variables.Variables['SacadoCEP']             := QuotedStr(Titulo.Sacado.CEP);
    frxReport1.Variables.Variables['Multa']                 := QuotedStr(FormatFloat(',#0.00', ((Titulo.ValorDocumento*1)/100)/30));

    if Titulo.Sacado.CNPJCPF <> '' then
      if length(Titulo.Sacado.CNPJCPF) <= 11 then
           frxReport1.Variables.Variables['SacadoCPFCGC']   := QuotedStr(FormataCPF(Titulo.Sacado.CNPJCPF))
      else frxReport1.Variables.Variables['SacadoCPFCGC']   := QuotedStr(FormataCNPJ(Titulo.Sacado.CNPJCPF));

    frxReport1.Variables.Variables['SacadoNome']            := QuotedStr(Titulo.Sacado.NomeSacado);
    frxReport1.Variables.Variables['LinhaDigitavel']        := QuotedStr(viValoresMontados[0,4]);
    frxReport1.Variables.Variables['CodigoBarra']           := QuotedStr(viValoresMontados[0,3]);

    viResumo := 'Teste de Boleto';
    frxReport1.Variables.Variables['Resumo'] := QuotedStr(viResumo);
    frxReport1.Variables.Variables['Logomarca']             := QuotedStr(vlBoletoLogomarca);
  end;
end;

procedure TdtmLookupFinanceiro.SomarGridValores(vpSoma1,
  vpSoma2: TcxCurrencyEdit);
var
  viPosicao : Integer;
  viValorItem, viValorRegistrar : Currency;
begin
  ClientItem.DisableControls;
  viPosicao := ClientItem.RecNo;
  ClientItem.First;
  viValorItem      := 0;
  viValorRegistrar := 0;

  While not ClientItem.Eof do
  begin
    if ClientItemOPERACAO.AsString = 'R' then
    begin
      viValorItem      := viValorItem + ClientItemVALOR_ITEM.AsCurrency;
      viValorRegistrar := viValorRegistrar + ClientItemVALOR_REGISTRAR.AsCurrency;
    end
    else
    begin
      viValorItem      := viValorItem - ClientItemVALOR_ITEM.AsCurrency;
      viValorRegistrar := viValorRegistrar - ClientItemVALOR_REGISTRAR.AsCurrency;
    end;
    ClientItem.Next;
  end;

  if viValorRegistrar < 0 then
  begin
    viValorItem      := viValorItem * (-1);
    viValorRegistrar := viValorRegistrar * (-1);
  end;

  vpSoma1.EditValue := viValorItem;
  vpSoma2.EditValue := viValorRegistrar;
  ClientItem.RecNo  := viPosicao;
  ClientItem.EnableControls;
end;

procedure TdtmLookupFinanceiro.SomarSelecionados(vpGrid: TcxGridDBTableView;
  vpEdit: TcxCurrencyEdit; vpColunaValorReceita, vpColunaValorDespesa,
  vpColunaTipo: TcxGridDBColumn; vpValorUnico : Boolean; vpLevel : Integer);
var
  i, ARowIndex: integer;
  ARowInfo : TcxRowInfo;
  viExpand : Boolean;
  viSoma : Currency;
begin
  viSoma := 0;
  with vpGrid.DataController do
  begin
    for i := 0 to Pred(GetSelectedCount) do
    begin
      ARowIndex := GetSelectedRowIndex(i); // retorna o �ndice da linha selecionada
      ARowInfo  := GetRowInfo(ARowIndex); // retorna informa��o da linha selecionada}
      if vpLevel <> ARowInfo.Level then
        Continue;

      try
        if vpValorUnico then
          if Values[ARowInfo.RecordIndex, vpColunaTipo.index] = 'R' then
               viSoma := viSoma + Values[ARowInfo.RecordIndex, vpColunaValorReceita.index]
          else viSoma := viSoma - Values[ARowInfo.RecordIndex, vpColunaValorDespesa.index]
        else
          if (Values[ARowInfo.RecordIndex, vpColunaValorReceita.index]) > 0 then
               viSoma := viSoma + Values[ARowInfo.RecordIndex, vpColunaValorReceita.index]
          else viSoma := viSoma - Values[ARowInfo.RecordIndex, vpColunaValorDespesa.index];
      except
      end;
    end;
  end;
  vpEdit.EditValue := viSoma;

  if viSoma >= 0 then
       vpEdit.StyleDisabled.TextColor := clBlue
  else vpEdit.StyleDisabled.TextColor := clRed;

end;

procedure TdtmLookupFinanceiro.VerificarCentroCustoReserva(vpId : Integer; vpClientDataSet: TClientDataSet; vpTipoCentro : String;
             vpDuplicado : Boolean = False);
var
  viSql : String;
begin
  inherited;
  if vpId = 0 then
    exit;

  viSql := 'SELECT * FROM J_CENTRO_RATEIO ';

  if vgCentroCusto.Agendamento then
       viSql := viSql + ' WHERE LIVRO_AGENDAMENTO_ID = '+ IntToStr(vpId)
  else viSql := viSql + ' WHERE LIVRO_CAIXA_ID = '+ IntToStr(vpId);

  viSql := viSql + 'AND TIPO_CENTRO = '+QuotedStr(vpTipoCentro);
  ExecutaSqlAuxiliar(viSql, 0);

  with dtmControles.sqlAuxiliar do
  begin
    vpClientDataSet.Active := True;
    vpClientDataSet.EmptyDataSet;
    First;
    while not eof do
    begin
      vpClientDataSet.Insert;
      vpClientDataSet.FieldByName('CENTRO_CUSTO_ID').AsInteger := FieldByName('CENTRO_CUSTO_ID').AsInteger;
      vpClientDataSet.FieldByName('PORCENTAGEM').AsCurrency    := FieldByName('PERCENTUAL').AsCurrency;

      if not vpDuplicado then
      begin
        vpClientDataSet.FieldByName('SITUACAO').AsString   := '2';
        if vgCentroCusto.Agendamento then
             vpClientDataSet.FieldByName('ID').AsInteger   := FieldByName('LIVRO_AGENDAMENTO_ID').AsInteger
        else vpClientDataSet.FieldByName('ID').AsInteger   := FieldByName('LIVRO_CAIXA_ID').AsInteger;
        vpClientDataSet.Post;
      end
      else vpClientDataSet.FieldByName('SITUACAO').AsString := '1';
      Next;
    end;
  end;
end;

function TdtmLookupFinanceiro.VerificarPreenchimentoCentroCusto(vpCentroCustoId, vpTipo : Variant;
        vpClientDataSet: TClientDataSet):String;
var
  viTexto : String;
begin
  Result := '';

  if (vpCentroCustoId = null) or (vpTipo = '1') then
    exit;

  vpClientDataSet.First;
  viTexto := '';

  if vpTipo = '3' then
  begin
    While not vpClientDataSet.eof do
    begin
      viTexto := viTexto +' '+ dtmControles.GetStr(' SELECT DESCRICAO FROM J_CENTRO_CUSTO WHERE CENTRO_CUSTO_ID = '+ vpClientDataSet.FieldByName('CENTRO_CUSTO_ID').AsString) +' ('+
                           FormatFloat(',#0.00',vpClientDataSet.FieldByName('PORCENTAGEM').AsCurrency)+'%); ';
      vpClientDataSet.Next;
    end;
  end
  else
  begin
    ExecutaSimpleDSAux(' SELECT * FROM J_CENTRO_CUSTO_PERSONALIZADO '+
                       ' WHERE CENTRO_CUSTO_PADRAO_ID = '+ IntToStr(vpCentroCustoId),0);
    While not dtmControles.SimpleAuxiliar.Eof do
    begin
      viTexto := viTexto +' '+ dtmControles.GetStr(' SELECT DESCRICAO FROM J_CENTRO_CUSTO WHERE CENTRO_CUSTO_ID = '+ dtmControles.SimpleAuxiliar.FieldByName('CENTRO_CUSTO_RATEIO_ID').AsString) +' ('+
                           FormatFloat(',#0.00', dtmControles.SimpleAuxiliar.FieldByName('PERCENTUAL').AsCurrency)+'%); ';
      dtmControles.SimpleAuxiliar.Next;
    end;
    dtmControles.SimpleAuxiliar.Close;
  end;
  Result := viTexto;
end;

function TdtmLookupFinanceiro.VerificarQtdLancamentoPendente(vpLivroAgendamentoId, vpLivroFinanceiroID : Integer):Integer;
begin
  Result := dtmControles.GetInt(' SELECT COUNT(LIVRO_FINANCEIRO_ID) FROM J_LIVRO_FINANCEIRO '+
                                ' WHERE LIVRO_AGENDAMENTO_ID = '+IntToStr(vpLivroAgendamentoId)+
                                '  AND SITUACAO IN ('+QuotedStr('1')+','+QuotedStr('2')+')'+
                                '  AND NOT LIVRO_FINANCEIRO_ID = '+IntToStr(vpLivroFinanceiroID));

end;

end.


