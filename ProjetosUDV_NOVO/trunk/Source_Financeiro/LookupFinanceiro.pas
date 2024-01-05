unit LookupFinanceiro;

interface

uses
  SysUtils, Classes, DB, DBClient, SimpleDS, cxEditRepositoryItems, cxEdit,
  cxDBEditRepository, cxClasses, cxCurrencyEdit, Controls, Dialogs, frxClass, frxExportPDF,
  DbxDevartInterBase, ACBrBase, ACBrBoleto, ACBrBoletoFCFR, cxGridDBTableView, cxCustomData, Graphics,
  Vcl.Forms, Winapi.Windows, frxExportBaseDialog, ACBrBoletoConversao;

type
  TRetornoImprimiuBoleto = record
    boletoId: Integer;
    ImprimiuBoleto: Boolean;
    LivroFinanceiro: string;
  end;

  TRetornoGerouRemessa = record
    remessaId: Integer;
    gerouRemessa: Boolean;
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
    frxPDFExport1: TfrxPDFExport;
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
    sqlBancoLOCAL_PADRAO: TStringField;
    sqlBoletoVALOR: TFMTBCDField;
    sqlBoletoDATA_EMISSAO: TSQLTimeStampField;
    sqlBoletoDATA_VENCIMENTO: TSQLTimeStampField;
    sqlBoletoNOSSO_NUMERO: TFMTBCDField;
    sqlBoletoSITUACAO: TStringField;
    sqlCedenteCNPJ_CPF: TStringField;
    sqlCedenteCOMPLEMENTO: TStringField;
    sqlCedenteTELEFONE: TStringField;
    sqlOrcamento: TSimpleDataSet;
    sqlOrcamentoLIVRO_AGENDAMENTO_ID: TFMTBCDField;
    sqlOrcamentoHISTORICO: TStringField;
    dtsOrcamento: TDataSource;
    ListaOrcamentos: TcxEditRepositoryLookupComboBoxItem;
    ComboTipoCaixa: TcxEditRepositoryImageComboBoxItem;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    Titulo : TACBrTitulo;
    viValoresMontados : array[0..1000,1..4] of string;
  public
    procedure AtualizarTabelas;
    procedure SomarGridValores(vpSoma1, vpSoma2 : TcxCurrencyEdit);
    procedure SomarSelecionados(vpGrid : TcxGridDBTableView; vpEdit : TcxCurrencyEdit;
          vpColunaValorReceita, vpColunaValorDespesa, vpColunaTipo :  TcxGridDBColumn; vpValorUnico : Boolean;
          vpLevel : Integer);
    function AdicionarDeduzirValorSelecionados(vpValorAtual : Currency; vpOperacao : String):Currency;

    Function GetPessoaID(vfCPfCNPJ: String) : Integer;

    // Configuração Boleto
    function CriarTitulo(vpId, vpBancoId : Integer): TRetornoImprimiuBoleto;
    function CriarTituloLista(
      vpPessoaId: Integer;
      vpLivroFinanceiroId: string;
      vpDataVencimento: TDateTime;
      vpBancoId : Integer;
      vpAgruparCompromisso: Boolean;
      vpValor: Double;
      vpAnoMesReferencia: string): TRetornoImprimiuBoleto;
    procedure ParametrosRelatorio;
    function GerarRemessa(vpBancoId, vpRemessa: Integer;  vpBoleto: TArrayOfBoleto): TRetornoGerouRemessa;
    procedure AbrirFecharTelaBranco(vpAbrir : Boolean = True);
    function VerificarQtdLancamentoPendente(vpLivroAgendamentoId, vpLivroFinanceiroID : Integer):Integer;
    procedure BaixarEstornar(vpTipoReg, vpSituacao : String;
         vpLivroFinanceiroId, vpLivroAgendamento : Integer; vpValorItem, vpValorRegistrar : Currency);
    function CancelarBoleto(vpBoletaId : String; vpPerguntar : Boolean = True):Boolean;
  end;

var
  dtmLookupFinanceiro: TdtmLookupFinanceiro;
  vgPermanecerDesktop : Boolean;
  vgBoletoID : Integer;

implementation

uses Controles, Rotinas, Lookup_Contabil, VisualizaRelatorios, TelaBranco,
  LookupBoleto;

{$R *.dfm}

function TdtmLookupFinanceiro.AdicionarDeduzirValorSelecionados(vpValorAtual : Currency;
      vpOperacao : String):Currency;
var
  viFlag  : Boolean;
  viValor, viMsg : String;
begin
  repeat
    viFlag := True;
    if vpOperacao = 'A' then
         viMsg := 'Valor Somar:'
    else viMsg := 'Valor Subtrair:';

    if InputQueryAux(viMsg, 'Valor', viValor, '$') then
    begin
      try
        viValor := CurrToStr(StrToCurr(RetirarPonto(viValor)));
        if (StrToCurr(viValor) < 0) then
        begin
          viFlag := False;
          ShowMessage('Valor Inválido!!!');
        end;
      except
        viFlag := False;
        ShowMessage('Valor Inválido!!!');
      end;
    end
    else Abort;
  until viFlag;

  if vpOperacao = 'A' then
       Result := vpValorAtual + StrToCurr(RetirarPonto(viValor))
  else Result := vpValorAtual - StrToCurr(RetirarPonto(viValor));
end;

procedure TdtmLookupFinanceiro.AtualizarTabelas;
begin
  sqlPessoasTodas.Refresh;
  sqlCaixa.Refresh;
  sqlPessoaFuncao.Refresh;
  sqlGrupoIdentificacao.Refresh;
  sqlOrcamento.Refresh;
end;

function TdtmLookupFinanceiro.CriarTituloLista(
  vpPessoaId: Integer;
  vpLivroFinanceiroId: string;
  vpDataVencimento: TDateTime;
  vpBancoId: Integer;
  vpAgruparCompromisso: Boolean;
  vpValor: Double;
  vpAnoMesReferencia: string): TRetornoImprimiuBoleto;
var
  viBoletoId: Integer;
  viDadosPessoa : TStringList;
  viDiretorioPadrao: string;
  viPathArquivoPDF: string;
  viNossoNumero: string;
  viNumeroDocumento: string;
  viValorDocumento: Double;

  procedure CarregarDadosConta;
  begin
    sqlBanco.Active := False;
    sqlBanco.DataSet.ParamByName('BANCO_ID').AsBCD := vpBancoId;
    sqlBanco.Active := True;
  end;

  procedure ConfiguraComponenteAcBr;
  begin
    dtmLookupBoleto.ACBrBoleto1.ACBrBoletoFC.DirLogo  := '';
    dtmLookupBoleto.ACBrBoleto1.ACBrBoletoFC.Filtro   := fiNenhum;
    dtmLookupBoleto.ACBrBoleto1.ACBrBoletoFC.LayOut   := lPadrao;
    dtmLookupBoleto.ACBrBoleto1.Banco.Digito          := sqlBancoBANCO_DIGITO.AsInteger;
    dtmLookupBoleto.ACBrBoleto1.Banco.Numero          := sqlBancoBANCO_NUMERO.AsInteger;
    dtmLookupBoleto.ACBrBoleto1.Banco.Nome            := sqlBancoBANCO_NOME.AsString;

    // Dados do cedente
    dtmLookupBoleto.ACBrBoleto1.Cedente.Nome          := AnsiUpperCase(Trim(sqlCedenteDESCRICAO.AsString));
    dtmLookupBoleto.ACBrBoleto1.Cedente.CNPJCPF       := sqlCedenteCNPJ_CPF.AsString;
    dtmLookupBoleto.ACBrBoleto1.Cedente.CodigoCedente := sqlBancoCODIGO_CEDENTE_NUMERO.AsString+sqlBancoCODIGO_CEDENTE_DIGITO.AsString;
    dtmLookupBoleto.ACBrBoleto1.Cedente.Agencia       := sqlBancoAGENCIA_NUMERO.AsString;
    dtmLookupBoleto.ACBrBoleto1.Cedente.AgenciaDigito := sqlBancoAGENCIA_DIGITO.AsString;
    dtmLookupBoleto.ACBrBoleto1.Cedente.Conta         := sqlBancoCONTA_NUMERO.AsString;
    dtmLookupBoleto.ACBrBoleto1.Cedente.ContaDigito   := sqlBancoCONTA_DIGITO.AsString;
    dtmLookupBoleto.ACBrBoleto1.Cedente.Modalidade    := '';
    dtmLookupBoleto.ACBrBoleto1.Cedente.UF            := sqlCedenteEND_UF.AsString;
    dtmLookupBoleto.ACBrBoleto1.NomeArqRemessa        := 'ARQUIVO_REMESSA_' + FormatDateTime('DDMMYYYYHHMMSS',now) +'.TXT';
  end;

  procedure MontarCodigoBarras;
  var
    i : Integer;
  begin
{    with dtmLookupBoleto.ACBrBoleto1 do
    begin
      for i := 0 to ListadeBoletos.Count - 1 do
      begin
        viValoresMontados[i,1] := Banco.MontarCampoNossoNumero( ListadeBoletos[i] );
        viValoresMontados[i,2] := Banco.MontarCampoCodigoCedente( ListadeBoletos[i] );
        viValoresMontados[i,3] := Banco.MontarCodigoBarras( ListadeBoletos[i] );
        viValoresMontados[i,4] := Banco.MontarLinhaDigitavel(viValoresMontados[i,3],ListadeBoletos[i]);
      end;
    end;  }

    with dtmLookupBoleto.ACBrBoleto1 do
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
    sqlBoletoNOSSO_NUMERO.AsString := viNossoNumero;
    sqlBoletoSITUACAO.AsString := 'A';
    sqlBoletoVALOR.AsCurrency := viValorDocumento;
    sqlBoletoDATA_EMISSAO.AsDateTime := Now;
    sqlBoletoDATA_VENCIMENTO.AsDateTime := vpDataVencimento;

    sqlBoleto.Post;
    sqlBoleto.ApplyUpdates(0);
    sqlBoleto.Active := False;

    Result := viBoletoId;
  end;

  function RetorneLinhaObs(vpDocumentoId: string; vpContabilContaId: string; vpValor: Double): string;
  begin
    Result := 'Nº Doc: ' + vpDocumentoId + ' ' +
      Trim(dtmControles.GetStr('select DESCRICAO from T_CONTABIL_CONTA where ' +
      ' CONTABIL_CONTA_ID = ' + vpContabilContaId)) + ' R$: ' + FloatToStr(vpValor) + #13#10;
  end;

begin
  Result.ImprimiuBoleto := False;
  viNumeroDocumento := '';
  CarregarDadosConta;

  Titulo := dtmLookupBoleto.ACBrBoleto1.CriarTituloNaLista;
  viDadosPessoa := TStringList.Create;

  Titulo.Vencimento         := vpDataVencimento;
  Titulo.DataDocumento      := Now;

  if vpAgruparCompromisso then begin
    ExecutaSqlAuxiliar('select LIVRO_FINANCEIRO_ID, CONTABIL_CONTA_ID from J_LIVRO_FINANCEIRO ' +
      ' where SITUACAO in (''1'',''2'') and SELECIONADO = ''S''' +
      ' and PESSOA_ID = ' + IntToStr(vpPessoaId) +
      ' and ANO_MES_REFERENCIA = ' + vpAnoMesReferencia,0);

    while not dtmControles.sqlAuxiliar.Eof do begin
      if viNumeroDocumento = '' then
        viNumeroDocumento := RetorneLinhaObs(
          dtmControles.sqlAuxiliar.FieldByName('LIVRO_FINANCEIRO_ID').AsString,
          dtmControles.sqlAuxiliar.FieldByName('CONTABIL_CONTA_ID').AsString,
          vpValor)
      else begin
        viNumeroDocumento := viNumeroDocumento +
          RetorneLinhaObs(
            dtmControles.sqlAuxiliar.FieldByName('LIVRO_FINANCEIRO_ID').AsString,
            dtmControles.sqlAuxiliar.FieldByName('CONTABIL_CONTA_ID').AsString,
            vpValor);
      end;
      dtmControles.sqlAuxiliar.Next;
    end;

    dtmControles.sqlAuxiliar.Active := False;
    Titulo.NumeroDocumento  := viNumeroDocumento;
    viValorDocumento        := vpValor;
  end
  else begin
    Titulo.NumeroDocumento  := 'Nº Doc: ' + vpLivroFinanceiroId;
    viValorDocumento        := dtmControles.GetFloat('select VALOR_AGENDADO FROM J_LIVRO_FINANCEIRO ' +
                              ' where SITUACAO IN (''1'',''2'') and PESSOA_ID = ' + IntToStr(vpPessoaId) +
                              ' and SELECIONADO = ''S'' and LIVRO_FINANCEIRO_ID = ' + vpLivroFinanceiroId);
  end;

  Titulo.EspecieDoc         := 'DM';
  Titulo.Aceite             := atNao;
  Titulo.DataProcessamento  := Now;
  viNossoNumero             := dtmControles.GerarSequencia('BOLETO_NOSSO_NUMERO');
  Titulo.NossoNumero        := viNossoNumero;
  Titulo.Carteira           := sqlBancoCARTEIRA.AsString;
  Titulo.ValorDocumento     := viValorDocumento;
  viDadosPessoa             := dtmControles.GetFields('select NOME, CPFCNPJ, ENDERECO_LOGRADOURO, ENDERECO_BAIRRO, '+
                              ' ENDERECO_CEP, ENDERECO_CIDADE_ID, ENDERECO_CIDADE_UF '+
                              ' from J_PESSOA WHERE PESSOA_ID = '+ IntToStr(vpPessoaId));

  Titulo.Sacado.NomeSacado  := viDadosPessoa.Values['NOME'];
  Titulo.Sacado.CNPJCPF     := viDadosPessoa.Values['CPFCNPJ'];
  Titulo.Sacado.Logradouro  := viDadosPessoa.Values['ENDERECO_LOGRADOURO'];
  Titulo.Sacado.Numero      := '';
  Titulo.Sacado.Bairro      := viDadosPessoa.Values['ENDERECO_BAIRRO'];
  Titulo.Sacado.CEP         := viDadosPessoa.Values['ENDERECO_CEP'];
  Titulo.Sacado.UF          := viDadosPessoa.Values['ENDERECO_CIDADE_UF'];

  if viDadosPessoa.Values['ENDERECO_CIDADE_ID'] <> '' then
    Titulo.Sacado.Cidade      := dtmControles.GetStr('SELECT MUNICIPIO FROM G_MUNICIPIO WHERE MUNICIPIO_ID = ' +
    viDadosPessoa.Values['ENDERECO_CIDADE_ID']);

  Titulo.ValorAbatimento    := 0;
  Titulo.LocalPagamento     := 'PAGÁVEL EM QUALQUER BANCO ATÉ O VENCIMENTO';
  Titulo.ValorMoraJuros     := 0;
  Titulo.ValorDesconto      := 0;
  Titulo.DataMoraJuros      := 0;
  Titulo.DataDesconto       := 0;
  Titulo.DataAbatimento     := 0;
  Titulo.DataProtesto       := vpDataVencimento + 90;
  Titulo.PercentualMulta    := 0;
  Titulo.Mensagem.Text      := '';
  Titulo.OcorrenciaOriginal.Tipo := toRemessaRegistrar;
  Titulo.Instrucao1         := '';
  Titulo.Instrucao2         := '';
  Titulo.Parcela            := 1;

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

    try
      if dtmControles.sqlAuxiliar.RecordCount = 0 then begin
        ExecutaSqlAuxiliar('update J_LIVRO_FINANCEIRO set SELECIONADO = ''N'', BOLETA_ID = ' +
          IntToStr(viBoletoId) + ' where LIVRO_FINANCEIRO_ID = ' + vpLivroFinanceiroId, 1);
      end
      else begin
        ExecutaSqlAuxiliar('update J_LIVRO_FINANCEIRO set SELECIONADO = ''N'', BOLETA_ID = ' +
          IntToStr(viBoletoId) + ' where LIVRO_FINANCEIRO_ID  IN (' + vpLivroFinanceiroId + ')', 1);
      end;
    except
      Result.ImprimiuBoleto := False;
    end;

    Result.boletoId := viBoletoId;
    Result.ImprimiuBoleto := True;
  except
    Result.ImprimiuBoleto := False;
  end;
  FreeAndNil(viDadosPessoa);
end;

function TdtmLookupFinanceiro.CancelarBoleto(vpBoletaId : String; vpPerguntar : Boolean = True):Boolean;
begin
  if vpPerguntar then
  begin
    if Application.MessageBox(Pchar('Cancelar Boleto de nº '+
                                FormatFloat('###,###',StrToInt(vpBoletaId))+'?'),
        'Confirmação', MB_YESNO) = IDNO then
    begin
      Result := False;
      exit;
    end;
  end;

  ExecutaSqlAuxiliar(' UPDATE T_BOLETA SET SITUACAO = '+QuotedStr('3')+','+
                     '                        ORDEM = :ORDEM, '+
                     '              REMESSA_SITUACAO= :REMESSA,'+
                     '               DATA_CANCELADO = :DATA_CANCELADO '+
                     ' WHERE BOLETA_ID = '+vpBoletaId,2);
  with dtmControles.sqlAuxiliar do
  begin
    ParamByName('ORDEM').AsInteger         := dtmControles.GerarSequencia('BOLETO_ORDEM'+IntToStr(vgCedenteAtivo));
    ParamByName('DATA_CANCELADO').AsString := dtmControles.DataHoraBanco(5);
    ParamByName('REMESSA').AsString        := '3';
    ExecSQL(False);
  end;

  ExecutaSqlAuxiliar(' UPDATE T_COMPROMISSO_VENCIDO SET BOLETA_ID = NULL'+
                     ' WHERE BOLETA_ID = '+vpBoletaId,1);

  Result := True;
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
    dtmLookupBoleto.ACBrBoleto1.ACBrBoletoFC.DirLogo  := '';
    dtmLookupBoleto.ACBrBoleto1.ACBrBoletoFC.Filtro   := fiNenhum;
    dtmLookupBoleto.ACBrBoleto1.ACBrBoletoFC.LayOut   := lPadrao;
    dtmLookupBoleto.ACBrBoleto1.Banco.Digito          := sqlBancoBANCO_DIGITO.AsInteger;
    dtmLookupBoleto.ACBrBoleto1.Banco.Numero          := sqlBancoBANCO_NUMERO.AsInteger;
    dtmLookupBoleto.ACBrBoleto1.Banco.Nome            := sqlBancoBANCO_NOME.AsString;

    // Dados do Cedente
    dtmLookupBoleto.ACBrBoleto1.Cedente.Nome          := AnsiUpperCase(Trim(sqlCedenteDESCRICAO.AsString));
    dtmLookupBoleto.ACBrBoleto1.Cedente.CNPJCPF       := sqlCedenteCNPJ_CPF.AsString;
    dtmLookupBoleto.ACBrBoleto1.Cedente.CodigoCedente := sqlBancoCODIGO_CEDENTE_NUMERO.AsString +
      sqlBancoCODIGO_CEDENTE_DIGITO.AsString;
    dtmLookupBoleto.ACBrBoleto1.Cedente.Agencia       := sqlBancoAGENCIA_NUMERO.AsString;
    dtmLookupBoleto.ACBrBoleto1.Cedente.AgenciaDigito := sqlBancoAGENCIA_DIGITO.AsString;
    dtmLookupBoleto.ACBrBoleto1.Cedente.Conta         := sqlBancoCONTA_NUMERO.AsString;
    dtmLookupBoleto.ACBrBoleto1.Cedente.ContaDigito   := sqlBancoCONTA_DIGITO.AsString;
    dtmLookupBoleto.ACBrBoleto1.Cedente.Modalidade    := '';
    dtmLookupBoleto.ACBrBoleto1.Cedente.UF            := sqlCedenteEND_UF.AsString;
    dtmLookupBoleto.ACBrBoleto1.NomeArqRemessa        := 'ARQUIVO_REMESSA_' + FormatDateTime('DDMMYYYYHHMMSS',now) +'.TXT';
  end;

  procedure MontarCodigoBarras;
  var
    i : Integer;
  begin
{    with dtmLookupBoleto.ACBrBoleto1 do
    begin
      for i := 0 to ListadeBoletos.Count - 1 do
      begin
        viValoresMontados[i,1] := Banco.MontarCampoNossoNumero( ListadeBoletos[i] );
        viValoresMontados[i,2] := Banco.MontarCampoCodigoCedente( ListadeBoletos[i] );
        viValoresMontados[i,3] := Banco.MontarCodigoBarras( ListadeBoletos[i] );
        viValoresMontados[i,4] := Banco.MontarLinhaDigitavel(viValoresMontados[i,3],ListadeBoletos[i]);
      end;
    end;  }

    with dtmLookupBoleto.ACBrBoleto1 do
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
    sqlBoletoSITUACAO.AsString := 'A';
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
  Titulo := dtmLookupBoleto.ACBrBoleto1.CriarTituloNaLista;
  viDadosPessoa := TStringList.Create;
  with Titulo do
  begin
    Vencimento         := sqlLivroFinanceiroDATA_VENCIMENTO.AsDateTime;
    DataDocumento      := sqlLivroFinanceiroDATA_OPERACAO.AsDateTime;
    NumeroDocumento    := sqlLivroFinanceiroLIVRO_FINANCEIRO_ID.AsString;
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
    LocalPagamento     := 'PAGÁVEL EM QUALQUER BANCO ATÉ O VENCIMENTO';
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

  sqlPessoasTodas.Open;
  sqlCaixa.Open;
  sqlPessoaFuncao.Open;
  sqlGrupoIdentificacao.Open;
  sqlPessoaTarefa.Open;
  sqlContaBancaria.Open;
  sqlLayoutBoleto.Open;
  sqlCedente.Open;
  sqlOrcamento.Open;
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
end;

procedure TdtmLookupFinanceiro.AbrirFecharTelaBranco(vpAbrir : Boolean = True);
begin
{  if dtmControles.BuscarConfig('PRINCIPAL', 'DESIGNER','MOSTRAR_FUNDO_BRANCO', 'S') <> 'S' then
    exit;

  if vpAbrir then
    ExibirFormulario(TfrmTelaBranco, frmTelaBranco)
  else
    if frmTelaBranco <> nil then
      frmTelaBranco.Close; }
end;

function TdtmLookupFinanceiro.GerarRemessa(vpBancoId, vpRemessa: Integer;  vpBoleto: TArrayOfBoleto): TRetornoGerouRemessa;
var
  i: Integer;
  viContadorRemessa: Integer;
  viDiretorioPadrao: string;

begin
  Result.gerouRemessa := False;

  try
    viContadorRemessa := dtmControles.GerarSequencia('T_BOLETA_REMESSA_RETORNO');
    with dtmLookupBoleto do
    begin
      ConfiguraComponenteAcBr;
      ACBrBoleto1.NomeArqRemessa := 'RM_' + FormatFloat('00000', viContadorRemessa) + '.REM';
      ACBrBoleto1.DirArqRemessa  := vgBoletoDados.DiretorioRemessa;
      ACBrBoleto1.ChecarDadosObrigatorios;
      ACBrBoleto1.ListadeBoletos.Clear;
      case vgBoletoDados.BancoNumero of
        1   : ACBrBoleto1.Banco.TipoCobranca := cobBancoDoBrasil;
        104 : ACBrBoleto1.Banco.TipoCobranca := cobCaixaEconomica;
        237 : ACBrBoleto1.Banco.TipoCobranca := cobBradesco;
        341 : ACBrBoleto1.Banco.TipoCobranca := cobItau;
        399 : ACBrBoleto1.Banco.TipoCobranca := cobHSBC;
        748 : ACBrBoleto1.Banco.TipoCobranca := cobSicred;
        756 : ACBrBoleto1.Banco.TipoCobranca := cobBancoob;
      end;
    end;

     for i := Low(vpBoleto) to High(vpBoleto) do
     begin
       with dtmLookupBoleto.ACBrBoleto1.ListadeBoletos do begin

         Add(TACBrTitulo.Create(dtmLookupBoleto.ACBrBoleto1));
         Objects[i].Vencimento        := vpBoleto[i].vencimento;
         Objects[i].DataDocumento     := vpBoleto[i].dataDocumento;
         Objects[i].NumeroDocumento   := vpBoleto[i].numeroDocumento;
         Objects[i].EspecieDoc        := vpBoleto[i].especieDoc;

         Objects[i].Aceite            := atNao;

         Objects[i].DataProcessamento := vpBoleto[i].dataProcessamento;
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
//         Objects[i].DataDesconto      := vpBoleto[i].dataDesconto;
         Objects[i].DataMoraJuros     := vpBoleto[i].dataMoraJuros;
//         Objects[i].ValorDesconto     := vpBoleto[i].valorDesconto;
//         Objects[i].ValorMoraJuros    := vpBoleto[i].valorMoraJuros;
         Objects[i].ValorMoraJuros    := 0;
//         Objects[i].PercentualMulta   := vpBoleto[i].percentualMulta;
         Objects[i].PercentualMulta   := 0;

         case vpBoleto[i].situacao[1] of
           '1' : Objects[i].OcorrenciaOriginal.Tipo := toRemessaRegistrar;
           '3' : Objects[i].OcorrenciaOriginal.Tipo := toRemessaBaixar;
         end;
         Objects[i].NossoNumero       := vpBoleto[i].nossoNumero;
       end;
     end;

     // captura o contador de remessa e gera a mesma
     dtmLookupBoleto.ACBrBoleto1.GerarRemessa(viContadorRemessa);

     Result.gerouRemessa := FileExists(dtmLookupBoleto.ACBrBoleto1.DirArqRemessa + '\' + dtmLookupBoleto.ACBrBoleto1.NomeArqRemessa);
     Result.remessaId := viContadorRemessa;
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

procedure TdtmLookupFinanceiro.ParametrosRelatorio;
var
  vpDataInicio, vpDataFim : string;
  vpValorDivida : Currency;
  viResumo : String;
begin
  with dtmLookupBoleto.ACBrBoleto1 do
  begin
    CriarFuncoesRelatorio(frxReport1);
    frxReport1.Variables.Variables['NomeBanco']             := QuotedStr(Banco.Nome);
    frxReport1.Variables.Variables['CodigoBanco']           := QuotedStr(IntToStr(Banco.Numero)+'-'+IntToStr(Banco.Digito));
    frxReport1.Variables.Variables['LocalPagamento']        := QuotedStr(Titulo.LocalPagamento);
    frxReport1.Variables.Variables['DataVencimento']        := QuotedStr(DateToStr(Titulo.Vencimento));
    frxReport1.Variables.Variables['NomeCedente']           := QuotedStr(Cedente.Nome);
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


    if Titulo.Sacado.CNPJCPF <> '' then
      if length(Titulo.Sacado.CNPJCPF) <= 11 then
           frxReport1.Variables.Variables['SacadoCPFCGC']   := QuotedStr(' - '+ FormataCPF(Titulo.Sacado.CNPJCPF))
      else frxReport1.Variables.Variables['SacadoCPFCGC']   := QuotedStr(' - '+ FormataCNPJ(Titulo.Sacado.CNPJCPF));

    frxReport1.Variables.Variables['SacadoNome']            := QuotedStr(Titulo.Sacado.NomeSacado);
    frxReport1.Variables.Variables['LinhaDigitavel']        := QuotedStr(viValoresMontados[0,4]);
    frxReport1.Variables.Variables['CodigoBarra']           := QuotedStr(viValoresMontados[0,3]);

    viResumo := 'Teste de Boleto';
    frxReport1.Variables.Variables['Resumo'] := QuotedStr(viResumo);
  end;
end;

procedure TdtmLookupFinanceiro.SomarGridValores(vpSoma1,
  vpSoma2: TcxCurrencyEdit);
var
  viPosicao : Integer;
  viValorItem, viValorRegistrar   : Currency;
begin
  ClientItem.DisableControls;
  viPosicao := ClientItem.RecNo;
  ClientItem.First;
  viValorItem := 0;

  While not ClientItem.Eof do
  begin
    viValorItem      := viValorItem + ClientItemVALOR_ITEM.AsCurrency;
    viValorRegistrar := viValorRegistrar + ClientItemVALOR_REGISTRAR.AsCurrency;
    ClientItem.Next;
  end;

  vpSoma1.EditValue := viValorItem;
  vpSoma2.EditValue := viValorRegistrar;
  ClientItem.RecNo  := viPosicao;
  ClientItem.EnableControls;
end;

procedure TdtmLookupFinanceiro.SomarSelecionados(vpGrid: TcxGridDBTableView;
  vpEdit: TcxCurrencyEdit; vpColunaValorReceita, vpColunaValorDespesa,
  vpColunaTipo: TcxGridDBColumn; vpValorUnico: Boolean; vpLevel : Integer);
var
  i, ARowIndex: integer;
  ARowInfo : TcxRowInfo;
  viSoma : Currency;
begin
  viSoma := 0;
  with vpGrid.DataController do
  begin
    for i := 0 to Pred(GetSelectedCount) do
    begin
      ARowIndex := GetSelectedRowIndex(i); // retorna o índice da linha selecionada
      ARowInfo  := GetRowInfo(ARowIndex); // retorna informação da linha selecionada}
      if vpLevel <> ARowInfo.Level then
        Continue;

      if vpValorUnico then
        if Values[ARowInfo.RecordIndex, vpColunaTipo.index] = 'R' then
             viSoma := viSoma + Values[ARowInfo.RecordIndex, vpColunaValorReceita.index]
        else viSoma := viSoma - Values[ARowInfo.RecordIndex, vpColunaValorDespesa.index]
      else
        if (Values[ARowInfo.RecordIndex, vpColunaValorReceita.index]) > 0 then
             viSoma := viSoma + Values[ARowInfo.RecordIndex, vpColunaValorReceita.index]
        else viSoma := viSoma - Values[ARowInfo.RecordIndex, vpColunaValorDespesa.index];
    end;
  end;
  vpEdit.EditValue := viSoma;

  if viSoma >= 0 then
       vpEdit.StyleDisabled.TextColor := clBlue
  else vpEdit.StyleDisabled.TextColor := clRed;

end;

procedure TdtmLookupFinanceiro.BaixarEstornar(vpTipoReg, vpSituacao : String;
         vpLivroFinanceiroId, vpLivroAgendamento : Integer; vpValorItem, vpValorRegistrar : Currency);
var
  viSituacaoLF, viSituacaoAg : String;
  viValorPago : Currency;
  viAgendamentoID : Integer;
begin
  viSituacaoAG := '';
  if vpTipoReg = 'R' then
  begin
    if vpSituacao = '' then
    begin
      viSituacaoLF := '2';
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
      if (viSituacaoLF = '3') and (VerificarQtdLancamentoPendente(vgDadosLivroCaixa.LivroAgendamentoId, vgDadosLivroCaixa.LivroFinanceiroID) = 0) then
        viSituacaoAG := '2';
    end;
  end
  else
  begin
    viSituacaoLF := '1';
    viSituacaoAG := '1';
    viValorPago := dtmControles.GetFloat(' SELECT coalesce(SUM(LC1.VALOR),0) FROM J_LIVRO_CAIXA LC1 '+
                                         ' WHERE LC1.LIVRO_FINANCEIRO_ID = '+IntToStr(vpLivroFinanceiroId));
    if viValorPago > 0 then
      viSituacaoLF := '2';
  end;

  ExecutaSqlAuxiliar(' UPDATE J_LIVRO_FINANCEIRO SET SITUACAO = '+ QuotedStr(viSituacaoLF)+
                     ' WHERE LIVRO_FINANCEIRO_ID = '+IntToStr(vpLivroFinanceiroId),1);

  if ((vpTipoReg = 'R') and (viSituacaoAG = '2')) or (vpTipoReg = 'E') then
    ExecutaSqlAuxiliar(' UPDATE J_LIVRO_AGENDAMENTO SET SITUACAO = '+ QuotedStr(viSituacaoAG)+
                       ' WHERE LIVRO_AGENDAMENTO_ID = '+IntToStr(vpLivroAgendamento),1);
end;

function TdtmLookupFinanceiro.VerificarQtdLancamentoPendente(vpLivroAgendamentoId, vpLivroFinanceiroID : Integer):Integer;
begin
  Result := dtmControles.GetInt(' SELECT COUNT(LIVRO_FINANCEIRO_ID) FROM J_LIVRO_FINANCEIRO '+
                                ' WHERE LIVRO_AGENDAMENTO_ID = '+IntToStr(vpLivroAgendamentoId)+
                                '  AND SITUACAO IN ('+QuotedStr('1')+','+QuotedStr('2')+')'+
                                '  AND NOT LIVRO_FINANCEIRO_ID = '+IntToStr(vpLivroFinanceiroID));

end;

end.

