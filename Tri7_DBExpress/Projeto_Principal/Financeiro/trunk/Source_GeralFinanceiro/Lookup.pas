unit Lookup;

interface

uses
  I9Query,
  SysUtils, Classes, cxDBEditRepository, DB, DBClient, SimpleDS,
  cxEditRepositoryItems, cxEdit, cxImageComboBox, cxDbEdit, cxClasses,
  Vcl.Forms, Vcl.Controls, System.Variants,  Vcl.Dialogs, Winapi.Windows,
  DbxDevartInterBase, Rotinas, ConfiguradorFundo, cxLookAndFeelPainters,
  cxContainer, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TExecuteProc = procedure of object;

  TDadosCadastro = Record
    Descricao, Tabela, CampoId, PastaCarregada, RenumeracaoIdChaves: String;
    ChaveIdPrincipal, ChaveIdSecundaria, ChaveIdTerciaria: Integer;
    Confirmado, SomentePesquisa, Consultoria, SalvarNovo, AtualizarSaldo : Boolean;
  end;

  TImagem = Record
    SubPasta, Pasta, LocalImagem : string;
    Localizado : Boolean;
  end;

  TLivroDiario = RECORD
   Descricao, Apresentante, Operacao, LIvro, Folha, Serventia, Selo, CodigoRegistroAuto, CodigoTabela : String;
   Valor, ValorAnterior : Currency;
   Protocolo, Qtd, QtdCalculo, Escrevente, CaixaServicoId, ControleID : Integer;
   Data : TDateTime;
  end;

  TCaixaFechamento = record
    Data1, Data2 : TDate;
    Condicao : String;
    TipoCaixa : Integer;
  end;

  TdtmLookup = class(TDataModule)
    cxEditRepository1: TcxEditRepository;
    cxEditRepository1CurrencyItem1: TcxEditRepositoryCurrencyItem;
    cxEditRepository1DateItem1: TcxEditRepositoryDateItem;
    sqlG_Banco: TI9Query;
    dtsG_Banco: TDataSource;
    sqlG_TB_DocumentoTipo: TI9Query;
    dtsG_TB_DocumentoTipo: TDataSource;
    sqlG_TB_EstadoCivil: TI9Query;
    dtsG_TB_EstadoCivil: TDataSource;
    sqlG_BancoDESCRICAO: TStringField;
    sqlG_TB_DocumentoTipoTB_DOCUMENTOTIPO_ID: TBCDField;
    sqlG_TB_DocumentoTipoDESCRICAO: TStringField;
    sqlG_TB_DocumentoTipoTEXTO: TBlobField;
    sqlG_TB_DocumentoTipoSITUACAO: TStringField;
    sqlG_TB_EstadoCivilTB_ESTADOCIVIL_ID: TBCDField;
    sqlG_TB_EstadoCivilDESCRICAO: TStringField;
    sqlG_TB_EstadoCivilSITUACAO: TStringField;
    sqlG_TB_Profissao: TI9Query;
    dtsG_TB_Profissao: TDataSource;
    sqlG_TB_ProfissaoTB_PROFISSAO_ID: TBCDField;
    sqlG_TB_ProfissaoDESCRICAO: TStringField;
    sqlG_TB_ProfissaoSITUACAO: TStringField;
    sqlG_TB_RegimeComunhao: TI9Query;
    dtsG_TB_RegimeComunhao: TDataSource;
    sqlG_TB_RegimeComunhaoTB_REGIMECOMUNHAO_ID: TBCDField;
    sqlG_TB_RegimeComunhaoDESCRICAO: TStringField;
    sqlG_TB_RegimeComunhaoTEXTO: TBlobField;
    sqlG_TB_RegimeComunhaoSITUACAO: TStringField;
    sqlG_TB_TipoLogradouro: TI9Query;
    dtsG_TB_TipoLogradouro: TDataSource;
    sqlG_TB_TipoLogradouroTB_TIPOLOGRADOURO_ID: TBCDField;
    sqlG_TB_TipoLogradouroDESCRICAO: TStringField;
    listaG_Banco: TcxEditRepositoryLookupComboBoxItem;
    listaG_TB_DocumentoTipo: TcxEditRepositoryLookupComboBoxItem;
    listaG_TB_EstadoCivil: TcxEditRepositoryLookupComboBoxItem;
    listaG_TB_TipoLogradouro: TcxEditRepositoryLookupComboBoxItem;
    listaG_TB_Profissao: TcxEditRepositoryLookupComboBoxItem;
    listaG_TB_RegimeComunhao: TcxEditRepositoryLookupComboBoxItem;
    sqlG_TB_TipoLogradouroSITUACAO: TStringField;
    Combo_Sexo: TcxEditRepositoryImageComboBoxItem;
    Combo_SimNao: TcxEditRepositoryImageComboBoxItem;
    Combo_TipoQualificacao: TcxEditRepositoryImageComboBoxItem;
    sqlG_TB_TxModeloGrupo: TI9Query;
    sqlG_TB_TxModeloGrupoTB_TXMODELOGRUPO_ID: TBCDField;
    sqlG_TB_TxModeloGrupoDESCRICAO: TStringField;
    dtsG_TB_TxModeloGrupo: TDataSource;
    ListaG_TB_TBTxModeloGrupo: TcxEditRepositoryLookupComboBoxItem;
    Combo_AtivoInativo: TcxEditRepositoryImageComboBoxItem;
    Combo_Doi_TipoTransacao: TcxEditRepositoryImageComboBoxItem;
    Combo_Doi_TipoImovel: TcxEditRepositoryImageComboBoxItem;
    Combo_Doi_Situacao: TcxEditRepositoryImageComboBoxItem;
    Combo_Doi_Atribuicao: TcxEditRepositoryImageComboBoxItem;
    Combo_Doi_RetificacaoAto: TcxEditRepositoryImageComboBoxItem;
    Combo_Doi_FormaAlienacao: TcxEditRepositoryImageComboBoxItem;
    Combo_Doi_ValorAlienacaoNaoConsta: TcxEditRepositoryImageComboBoxItem;
    Combo_Doi_SituacaoConstrucao: TcxEditRepositoryImageComboBoxItem;
    Combo_Doi_Localizacao: TcxEditRepositoryImageComboBoxItem;
    Combo_Doi_AreaNaoConsta: TcxEditRepositoryImageComboBoxItem;
    Combo_Doi_ITBIeITCDnaoConsta: TcxEditRepositoryImageComboBoxItem;
    sqlG_Natureza_Titulo: TI9Query;
    sqlG_Natureza_TituloCODIGO_NATUREZA_SEF: TBCDField;
    sqlG_Natureza_TituloEMOLUMENTO_ID: TBCDField;
    sqlG_Natureza_TituloNATUREZA_TITULO_ID: TBCDField;
    sqlG_Natureza_TituloDESCRICAO: TStringField;
    sqlG_Natureza_TituloPRAZO: TBCDField;
    sqlG_Natureza_TituloSITUACAO: TStringField;
    sqlG_Natureza_TituloABRIR_MATRICULA: TStringField;
    sqlG_Natureza_TituloSISTEMA_ID: TBCDField;
    sqlG_Natureza_TituloCODIGO_DOI: TBCDField;
    dtsG_Natureza_Titulo: TDataSource;
    ListaG_Natureza_Titulo: TcxEditRepositoryLookupComboBoxItem;
    sqlG_Emolumento: TI9Query;
    sqlG_EmolumentoEMOLUMENTO_ID: TBCDField;
    sqlG_EmolumentoDESCRICAO: TStringField;
    sqlG_EmolumentoTIPO: TStringField;
    dtsG_Emolumento: TDataSource;
    listaG_Emolumento: TcxEditRepositoryLookupComboBoxItem;
    sqlG_Emolumento_Periodo: TI9Query;
    dtsG_Emolumento_Periodo: TDataSource;
    sqlG_Emolumento_PeriodoEMOLUMENTO_PERIODO_ID: TBCDField;
    sqlG_Emolumento_PeriodoDESCRICAO: TStringField;
    sqlG_Emolumento_PeriodoSITUACAO: TStringField;
    ListaG_Emolumento_Periodo: TcxEditRepositoryLookupComboBoxItem;
    Combo_UF: TcxEditRepositoryComboBoxItem;
    Formata_Fone: TcxEditRepositoryMaskItem;
    Formata_CPF: TcxEditRepositoryMaskItem;
    Formata_CNPJ: TcxEditRepositoryMaskItem;
    sqlG_Medida_Tipo: TI9Query;
    dtsG_Medida_Tipo: TDataSource;
    sqlG_Medida_TipoMEDIDA_TIPO_ID: TBCDField;
    sqlG_Medida_TipoDESCRICAO: TStringField;
    sqlG_Medida_TipoSIGLA: TStringField;
    Lista_MedidaTipoDescricao: TcxEditRepositoryLookupComboBoxItem;
    sqlG_TB_Bairro: TI9Query;
    dtsG_TB_Bairro: TDataSource;
    sqlG_TB_BairroTB_BAIRRO_ID: TBCDField;
    sqlG_TB_BairroDESCRICAO: TStringField;
    sqlG_TB_BairroSITUACAO: TStringField;
    listaG_TB_Bairro: TcxEditRepositoryLookupComboBoxItem;
    Formata_DataSEMhora: TcxEditRepositoryDateItem;
    sqlG_Emolumento_PeriodoDATA_INICIAL: TSQLTimeStampField;
    Combo_TipoTitulo: TcxEditRepositoryImageComboBoxItem;
    sqlG_Natureza_TituloTIPO_COBRANCA: TStringField;
    sqlG_Natureza_TituloTIPO_TITULO: TStringField;
    sqlG_Usuario: TI9Query;
    dtsG_Usuario: TDataSource;
    sqlG_UsuarioUSUARIO_ID: TBCDField;
    sqlG_UsuarioTROCARSENHA: TStringField;
    sqlG_UsuarioLOGIN: TStringField;
    sqlG_UsuarioSENHA: TStringField;
    sqlG_UsuarioSITUACAO: TStringField;
    sqlG_UsuarioNOME_COMPLETO: TStringField;
    sqlG_UsuarioFUNCAO: TStringField;
    sqlG_UsuarioASSINA: TStringField;
    listaG_Usuario: TcxEditRepositoryLookupComboBoxItem;
    sqlG_Natureza: TI9Query;
    dtsG_Natureza: TDataSource;
    sqlG_NaturezaNATUREZA_ID: TBCDField;
    sqlG_NaturezaDESCRICAO: TStringField;
    sqlG_NaturezaSISTEMA_ID: TBCDField;
    Lista_Natureza: TcxEditRepositoryLookupComboBoxItem;
    sqlUsuarioSistema: TI9Query;
    dtsUsuarioSistema: TDataSource;
    sqlUsuarioSistemaUSUARIO_ID: TBCDField;
    sqlUsuarioSistemaLOGIN: TStringField;
    Lista_UsuarioSistema: TcxEditRepositoryLookupComboBoxItem;
    Combo_Sistema: TcxEditRepositoryImageComboBoxItem;
    sqlUsuarioAssinante: TI9Query;
    FMTBCDField1: TBCDField;
    dtsUsuarioAssinante: TDataSource;
    sqlUsuarioAssinanteNOME_COMPLETO: TStringField;
    Lista_UsuarioAssinante: TcxEditRepositoryLookupComboBoxItem;
    sqlG_BancoBANCO_ID: TStringField;
    Combo_CreditoDebito: TcxEditRepositoryImageComboBoxItem;
    Combo_TiposValoresMarcacoes: TcxEditRepositoryImageComboBoxItem;
    sqlUsuarioAssinanteFUNCAO: TStringField;
    Combo_Permissao: TcxEditRepositoryCheckBoxItem;
    sqlC_Caixa_Servico: TI9Query;
    dtsC_Caixa_Servico: TDataSource;
    sqlC_Caixa_ServicoINTERNO_SISTEMA: TStringField;
    sqlC_Caixa_ServicoCAIXA_SERVICO_ID: TBCDField;
    sqlC_Caixa_ServicoDESCRICAO: TStringField;
    sqlC_Caixa_ServicoSITUACAO: TStringField;
    sqlC_Caixa_ServicoTIPO_TRANSACAO: TStringField;
    sqlC_Caixa_ServicoSISTEMA_ID: TBCDField;
    listaC_Caixa_Servico: TcxEditRepositoryLookupComboBoxItem;
    Check_SimNao: TcxEditRepositoryCheckBoxItem;
    Combo_Correcao: TcxEditRepositoryImageComboBoxItem;
    Lista_ArquivoCorrecao: TcxEditRepositoryImageComboBoxItem;
    sqlSeloGrupo: TI9Query;
    dtsSeloGrupo: TDataSource;
    sqlSeloGrupoSELO_GRUPO_ID: TBCDField;
    sqlSeloGrupoDESCRICAO: TStringField;
    Lista_SeloGrupo: TcxEditRepositoryLookupComboBoxItem;
    sqlSeloTipoCartorio: TI9Query;
    dtsSeloTipoCartorio: TDataSource;
    sqlSeloTipoCartorioSELO_TIPO_CARTORIO_ID: TBCDField;
    sqlSeloTipoCartorioDESCRICAO: TStringField;
    Lista_SeloTipoCartorio: TcxEditRepositoryLookupComboBoxItem;
    sqlSeloGrupoDESCRICAO_COMPLETA: TStringField;
    sqlSeloGrupoNUMERO: TBCDField;
    ClientTemp: TClientDataSet;
    ClientTempCHAVE_ID: TIntegerField;
    ClientTempVALOR: TStringField;
    Combo_Boleto_Situacao: TcxEditRepositoryImageComboBoxItem;
    Combo_SimNaoOpcional: TcxEditRepositoryImageComboBoxItem;
    sqlMunicipioIBGE: TI9Query;
    dtsMunicipioIBGE: TDataSource;
    sqlMunicipioIBGEMUNICIPIO_ID: TBCDField;
    sqlMunicipioIBGEMUNICIPIO: TStringField;
    sqlMunicipioIBGECODIGO_IBGE: TStringField;
    sqlMunicipioIBGESIGLA: TStringField;
    Lista_MunicipioUF: TcxEditRepositoryLookupComboBoxItem;
    Lista_MunicipioDescricao: TcxEditRepositoryLookupComboBoxItem;
    sqlPaisIBGE: TI9Query;
    dtsPaisIBGE: TDataSource;
    sqlPaisIBGEIBGE_PAIS_ID: TBCDField;
    sqlPaisIBGEDESCRICAO: TStringField;
    Lista_IBGE_Pais: TcxEditRepositoryLookupComboBoxItem;
    sqlRegineBens: TI9Query;
    dtsRegimeBens: TDataSource;
    sqlRegineBensTB_REGIMEBENS_ID: TBCDField;
    sqlRegineBensDESCRICAO: TStringField;
    sqlRegineBensSITUACAO: TStringField;
    ListaRegimeBens: TcxEditRepositoryLookupComboBoxItem;
    sqlCaixaServicoTodos: TI9Query;
    StringField1: TStringField;
    FMTBCDField2: TBCDField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    FMTBCDField3: TBCDField;
    dtsCaixaServicosTodos: TDataSource;
    Lista_CaixaServicoTodos: TcxEditRepositoryLookupComboBoxItem;
    Combo_Serventias: TcxEditRepositoryImageComboBoxItem;
    Combo_Especie: TcxEditRepositoryImageComboBoxItem;
    Combo_ServicoLivroDiario: TcxEditRepositoryImageComboBoxItem;
    Lista_SeloDescricaoCompleta: TcxEditRepositoryLookupComboBoxItem;
    sqlEmailTextoPadrao: TI9Query;
    sqlEmailTextoPadraoEMAIL_TEXTO_PADRAO_ID: TBCDField;
    sqlEmailTextoPadraoDESCRICAO: TStringField;
    sqlEmailTextoPadraoTEXTO: TBlobField;
    sqlEmailTextoPadraoASSUNTO: TStringField;
    dtsEmailTextoPadrao: TDataSource;
    Lista_EmailTextoPadrao: TcxEditRepositoryLookupComboBoxItem;
    sqlSistema: TI9Query;
    sqlSistemaSISTEMA_ID: TBCDField;
    sqlSistemaDESCRICAO: TStringField;
    dtsSistema: TDataSource;
    sqlProvimentoEsferaNivel: TI9Query;
    sqlProvimentoEsferaNivelPROVIMENTO_ESFERA_NIVEL_ID: TBCDField;
    sqlProvimentoEsferaNivelDESCRICAO: TStringField;
    sqlProvimentoEsferaNivelSITUACAO: TStringField;
    dtsProvimentoEsferaNivel: TDataSource;
    sqlProvimentoOrigem: TI9Query;
    sqlProvimentoOrigemPROVIMENTO_ORIGEM_ID: TBCDField;
    sqlProvimentoOrigemDESCRICAO: TStringField;
    sqlProvimentoOrigemSITUACAO: TStringField;
    dtsProvimentoOrigem: TDataSource;
    sqlProvimentoTipo: TI9Query;
    sqlProvimentoTipoPROVIMENTO_TIPO_ID: TBCDField;
    sqlProvimentoTipoDESCRICAO: TStringField;
    sqlProvimentoTipoSITUACAO: TStringField;
    dtsProvimentoTipo: TDataSource;
    listaProvimentoEsferaNivel: TcxEditRepositoryLookupComboBoxItem;
    listaProvimentoOrigem: TcxEditRepositoryLookupComboBoxItem;
    listaProvimentoTipo: TcxEditRepositoryLookupComboBoxItem;
    sqlEmolumentoTodos: TI9Query;
    FMTBCDField4: TBCDField;
    StringField5: TStringField;
    StringField6: TStringField;
    dtsEmolumentoTodos: TDataSource;
    ListaG_EmolumentoTodos: TcxEditRepositoryLookupComboBoxItem;
    Lista_NaturezaTituloSistema: TcxEditRepositoryLookupComboBoxItem;
    dtsNaturezaTituloTodos: TDataSource;
    sqlNaturezaTituloTodos: TI9Query;
    sqlNaturezaTituloTodosCODIGO_NATUREZA_SEF: TBCDField;
    sqlNaturezaTituloTodosEMOLUMENTO_ID: TBCDField;
    sqlNaturezaTituloTodosNATUREZA_TITULO_ID: TBCDField;
    sqlNaturezaTituloTodosDESCRICAO: TStringField;
    sqlNaturezaTituloTodosPRAZO: TBCDField;
    sqlNaturezaTituloTodosSITUACAO: TStringField;
    sqlNaturezaTituloTodosABRIR_MATRICULA: TStringField;
    sqlNaturezaTituloTodosSISTEMA_ID: TBCDField;
    sqlNaturezaTituloTodosCODIGO_DOI: TBCDField;
    sqlNaturezaTituloTodosTIPO_COBRANCA: TStringField;
    sqlNaturezaTituloTodosTIPO_TITULO: TStringField;
    sqlNaturezaTituloTodosSISTEMA: TStringField;
    ListaTodasNatureza: TcxEditRepositoryLookupComboBoxItem;
    LIsta_NaturezaTituloTodos: TcxEditRepositoryLookupComboBoxItem;
    Combo_ImagemDespesaReceita: TcxEditRepositoryImageComboBoxItem;
    sqlR_TB_Tipo_Andamento: TI9Query;
    sqlR_TB_Tipo_AndamentoTB_TIPO_ANDAMENTO_ID: TBCDField;
    sqlR_TB_Tipo_AndamentoDESCRICAO: TStringField;
    sqlR_TB_Tipo_AndamentoSITUACAO: TStringField;
    sqlR_TB_Tipo_AndamentoTIPO: TStringField;
    dtsR_TB_Tipo_Andamento: TDataSource;
    listaR_TB_Tipo_Andamento: TcxEditRepositoryLookupComboBoxItem;
    Combo_AndamentoCaixa: TcxEditRepositoryImageComboBoxItem;
    Combo_Especie1: TcxEditRepositoryImageComboBoxItem;
    sqlConfiguracaoSalva: TI9Query;
    sqlConfiguracaoSalvaCONFIGURACAO_SALVA_ID: TBCDField;
    sqlConfiguracaoSalvaLOCAL: TStringField;
    sqlConfiguracaoSalvaDESCRICAO: TStringField;
    sqlConfiguracaoSalvaVALOR: TStringField;
    sqlConfiguracaoSalvaSISTEMA_ID: TBCDField;
    sqlConfiguracaoDados: TI9Query;
    sqlConfiguracaoDadosCONFIGURACAO_SALVA_ID: TBCDField;
    sqlConfiguracaoDadosLOCAL: TStringField;
    sqlConfiguracaoDadosDESCRICAO: TStringField;
    sqlConfiguracaoDadosVALOR: TStringField;
    sqlConfiguracaoDadosSISTEMA_ID: TBCDField;
    dtsConfiguracaoSalva: TDataSource;
    dtsConfiguracaoDados: TDataSource;
    sqlMensalista: TI9Query;
    dtsMensalista: TDataSource;
    sqlMensalistaMENSALISTA_ID: TBCDField;
    sqlMensalistaDESCRICAO: TStringField;
    sqlMensalistaVALOR_CREDITO_INICIAL: TBCDField;
    sqlMensalistaSITUACAO: TStringField;
    Lista_Mensalista: TcxEditRepositoryLookupComboBoxItem;
    Combo_FinanceiroLancamento: TcxEditRepositoryImageComboBoxItem;
    sqlContaCliente: TI9Query;
    dtsContaCliente: TDataSource;
    sqlContaClienteCONTA_CLIENTE_ID: TBCDField;
    sqlContaClienteSITUACAO: TStringField;
    Lista_ContaCliente: TcxEditRepositoryLookupComboBoxItem;
    sqlContaClienteDESCRICAO: TStringField;
    sqlContaClienteAtiva: TI9Query;
    FMTBCDField5: TBCDField;
    StringField7: TStringField;
    StringField8: TStringField;
    dtsContaClienteAtiva: TDataSource;
    Lista_ContaClienteAtivos: TcxEditRepositoryLookupComboBoxItem;
    sqlMunicipioIBGECEP: TStringField;
    sqlG_Emolumento_PeriodoAtivos: TI9Query;
    dtsG_Emolumento_PeriodoAtivos: TDataSource;
    ListaG_EmolumentoPeriodoAtivo: TcxEditRepositoryLookupComboBoxItem;
    sqlG_Emolumento_PeriodoAtivosEMOLUMENTO_PERIODO_ID: TBCDField;
    sqlG_Emolumento_PeriodoAtivosDESCRICAO: TStringField;
    sqlG_Emolumento_PeriodoAtivosSITUACAO: TStringField;
    sqlG_Emolumento_PeriodoAtivosDATA_INICIAL: TSQLTimeStampField;
    Combo_PossuiGemeo: TcxEditRepositoryImageComboBoxItem;
    Combo_SituacaoCaixa: TcxEditRepositoryImageComboBoxItem;
    Combo_SituacaoServico: TcxEditRepositoryImageComboBoxItem;
    Formata_Fone_9Digito: TcxEditRepositoryMaskItem;
    sqlG_TB_ProfissaoCODIGO_CBO: TStringField;
    Lista_AndamentoRI: TcxEditRepositoryLookupComboBoxItem;
    sqlTipoCartao: TI9Query;
    dtsTipoCartao: TDataSource;
    sqlTipoCartaoDESCRICAO: TStringField;
    sqlTipoCartaoPERCENTUAL: TBCDField;
    sqlTipoCartaoSITUACAO: TStringField;
    cxEditRepository1LookupComboBoxItem1: TcxEditRepositoryLookupComboBoxItem;
    sqlTipoCartaoTIPO_CARTAO_ID: TBCDField;
    Lista_TipoCartao: TcxEditRepositoryLookupComboBoxItem;
    ListaTipoRegistroHoraCerta: TcxEditRepositoryImageComboBoxItem;
    ListaTipoRegistro: TcxEditRepositoryImageComboBoxItem;
    procedure DataModuleCreate(Sender: TObject);
  private

  public
    procedure AtualizarParametro(vpNome, vpSecao, vpGrupo, vpSistema : String; vpValor : String);
    procedure AtualizarTabelas;
    procedure LerDadadosConfigEmail(vpTabela : String);
    Function GetConfigCaixa(vpGrupo, vpSecao, vpNome : string; vpTipoValor: char): Variant;
    procedure CarregarIcxComboBox(vpValue, vpDescricao : string; vpIcxComboBox : TcxImageComboBox; vpImageIndex : Integer = -1);
    procedure CarregarIcxComboBoxDB(vpValue, vpDescricao : string; vpIcxComboBox : TcxDBImageComboBox; vpImageIndex : Integer = -1);
    procedure CarregarListaSistemas(vpLista : TcxImageComboBox; vpSetarPrimeiroItem : Boolean = True; vpGeral : Boolean = False);
    procedure CarregarListaSistemasDb(vpLista : TcxDBImageComboBox; vpTodos : Boolean = False);
    Function RegistrarLivroDiario(vpVerificarRegistro : Boolean = False):String;

    // Caixa e Fechamento
    function CalculoSaldoEspecie(vpEspecie, vpTipoCaixa, vpCondicao : String; vpData1, vpData2 : TDate;
             vpDeduzirDebitos: Boolean = True):Currency;
    function CalcularSaldoInicial:Currency;
    function CalcularDebitosCreditos(vpTipoTransacao : String; vpCondicaoServico : string = ''):Currency;
    Function CalcularSangria(vpEspecie, vpCaixa, vpTipo : String):Currency;
    Function CalcularContaCliente(vpEspecie, vpCaixa, vpOperacao, vpCliente,
          vpDataFinal, vpCaixaServico : String; vpTodosServico : Boolean = False):Currency;
    procedure VerificarPermitirNegativar(vpCliente, vpOperacao : String; vpValor, vpSaldo : Currency);

    procedure MarcarDesmarcarItensSimpleDataSet(vpMarcar: String;
      vpSimpleDataset: TI9Query);

    procedure MarcarDesmarcarItensClietDataSet(vpMarcar: String;
      vpSimpleDataset: TClientDataSet);

    Function CadastrarRegBasicoGeral(vpI9Query: TI9Query; vpClientDataset: TClientDataSet; vpValorId: Variant;
      vpTabela, vpCampoId, vpValor: String; vpAtualizarValor, vpAtualizarCampo, vpUpper: Boolean): Integer;
    procedure CadastrarRegBasicoGeralClient(vpI9Query: TClientDataSet; vpTabela, vpCampoId, vpValor: String);
    procedure CadastrarRegBasicoGeralLookup(vpLookup: TcxLookupComboBox; vpTabela, vpCampoId, vpValor: String);

    procedure CadastrarFormRapido(vpTabela, vpCampoId : String; vpIdLigacao, vpIdLigacao2 : Integer; vpId : Integer = 0);

    // Configura��es Salvas
    procedure CarregarConfiguracaoSalva(vpLocal : String);
    procedure GravarConfiguracaoSalva(vpLocal, vpDescricao, vpValor, vpOrdem : Variant);
    procedure BuscarConficuracaoSalva(vpLocal, vpDescricao : String);

    // Imagem
    function VerificarPastaImagem(vpPastaImagem : string; vpNumero : Integer; vpVerificarExistencia : Boolean = False):Boolean;

    procedure UpdateSimplesTabela(vpTabela, vpCampoAtualiza, vpCondicaoExtra, vpValor, vpId : String);

  end;

var
  dtmLookup: TdtmLookup;
  ExecAtualizar: TExecuteProc;
  vgLivroDiario : TLivroDiario;
  vgFechamentoCaixa : TCaixaFechamento;
  vgDadosCadastro: TDadosCadastro;
  vgDadosImagem : TImagem;

implementation
uses Controles;

{$R *.dfm}

procedure TdtmLookup.AtualizarParametro(vpNome, vpSecao, vpGrupo, vpSistema : String; vpValor : String);

  function VerificarParametroMaquina:Boolean;
  begin
    Result := dtmControles.GetStr(' SELECT NOME FROM G_CONFIG '+
                                  ' WHERE NOME = '+ QuotedStr(vpNome)+
                                  '   AND UPPER(TERMINAL) = '+ QuotedStr(Rotinas.NomeEstacao)) <> '';
  end;

begin
  if VerificarParametroMaquina then
    ExecutaSqlAuxiliar(' UPDATE G_CONFIG SET VALOR = '+ QuotedStr(vpValor)+
                       ' WHERE NOME     = '+ QuotedStr(vpNome)+
                       '   AND TERMINAL = '+ QuotedStr(Rotinas.NomeEstacao)+
                       '   AND SECAO    = '+ QuotedStr(vpSecao)+
                       '   AND CONFIG_GRUPO_ID = (SELECT CONFIG_GRUPO_ID FROM G_CONFIG_GRUPO '+
                       '                          WHERE DESCRICAO = '+QuotedStr(vpGrupo)+
                       '                            AND SISTEMA_ID = '+ vpSistema+')',1)
  else
    ExecutaSqlAuxiliar(' UPDATE G_CONFIG SET VALOR = '+ QuotedStr(vpValor)+
                       ' WHERE NOME = '+ QuotedStr(vpNome)+
                       '  AND (TERMINAL IS NULL OR TERMINAL = '+QuotedStr('')+')'+
                       '   AND SECAO    = '+ QuotedStr(vpSecao)+
                       '   AND CONFIG_GRUPO_ID = (SELECT CONFIG_GRUPO_ID FROM G_CONFIG_GRUPO '+
                       '                          WHERE DESCRICAO = '+QuotedStr(vpGrupo)+
                       '                            AND SISTEMA_ID = '+ vpSistema+')',1);
  dtmControles.sqlConfig.Refresh;
end;

procedure TdtmLookup.AtualizarTabelas;
begin
  sqlG_Banco.Refresh;
  sqlG_TB_DocumentoTipo.Refresh;
  sqlG_TB_EstadoCivil.Refresh;
  sqlG_TB_Profissao.Refresh;
  sqlG_TB_RegimeComunhao.Refresh;
  sqlG_TB_TipoLogradouro.Refresh;
  sqlG_TB_TxModeloGrupo.Refresh;
  sqlG_Natureza_Titulo.Refresh;
  sqlG_Emolumento.Refresh;
  sqlG_Emolumento_Periodo.Refresh;
  sqlG_Emolumento_PeriodoAtivos.Refresh;
  sqlG_Medida_Tipo.Refresh;
  sqlG_TB_Bairro.Refresh;
  sqlG_Usuario.Refresh;
  sqlG_Natureza.Refresh;
  sqlUsuarioSistema.Refresh;
  sqlUsuarioAssinante.Refresh;
  sqlC_Caixa_Servico.Refresh;
  sqlSeloGrupo.Refresh;
  sqlSeloTipoCartorio.Refresh;
  sqlPaisIBGE.Refresh;
  sqlRegineBens.Refresh;
  sqlCaixaServicoTodos.Refresh;
  sqlEmailTextoPadrao.Refresh;
  sqlNaturezaTituloTodos.Refresh;
  sqlMensalista.Refresh;
  sqlContaCliente.Refresh;
  sqlContaClienteAtiva.Refresh;
end;

procedure TdtmLookup.CadastrarFormRapido(vpTabela, vpCampoId: String;
  vpIdLigacao, vpIdLigacao2, vpId: Integer);
begin
  vgDadosCadastro.ChaveIdPrincipal  := vpId;
  vgDadosCadastro.ChaveIdSecundaria := vpIdLigacao;
  vgDadosCadastro.ChaveIdTerciaria  := vpIdLigacao2;

  vgDadosCadastro.CampoId := vpCampoId;
  vgDadosCadastro.Tabela  := vpTabela;
end;

Function TdtmLookup.CadastrarRegBasicoGeral(vpI9Query: TI9Query;
  vpClientDataset: TClientDataSet; vpValorId: Variant;
  vpTabela, vpCampoId, vpValor: String; vpAtualizarValor, vpAtualizarCampo,
  vpUpper: Boolean): Integer;
var
  viID: Integer;
  viMensagem: String;

  // Verifica se o Tipo ja esta cadastrado
  function VerificarTipo(vpTipo: String): Boolean;
  var
    viTipo: Integer;
  begin
    vpTipo := AnsiUpperCase(vpTipo);
    viTipo := dtmControles.GetInt(' SELECT ' + vpCampoId + ' FROM ' + vpTabela +
      ' WHERE UPPER(DESCRICAO) = ' + QuotedStr(vpTipo) + ' AND NOT ' + vpCampoId
      + ' = ' + IntToStr(vpValorId));
    Result := viTipo > 0;
  end;

begin

  Result := 0;

  if vpValorId = null then
    vpValorId := 0;

  if length(vpValor) <= 2 then
    vpValor := '';

  if ((vpValor = '') or (vpValorId > 0)) and
    not((vpValorId > 0) and vpAtualizarValor) then
    exit;

  if dtmControles.CodPermissao('CAD_CADASTRO_RAPIDO') = '000000' then
    exit;

  if vpAtualizarValor then
    viMensagem := 'Alterar'
  else
    viMensagem := 'Cadastrar';

  repeat
    if not InputQuery(Pchar(viMensagem + ' Tipo'), 'Tipo:', vpValor) then
      exit;

    if vpValor = '' then
      Application.MessageBox('Tipo Inv�lido!!!', 'Aten��o',
        MB_OK + MB_ICONWARNING);

    if VerificarTipo(vpValor) then
    begin
      Application.MessageBox('Tipo ja Cadastrado!!!', 'Aten��o',
        MB_OK + MB_ICONWARNING);
      vpValor := '';
    end;
  until (vpValor <> '');

  if vpUpper then
    vpValor := AnsiUpperCase(vpValor);

  if ((vpValorId = 0) and (vpValor <> '')) and (not vpAtualizarValor) then
  begin
    viID := dtmControles.GerarSequencia(vpTabela);
    ExecutaSqlAuxiliar(' INSERT INTO ' + vpTabela + '(' + vpCampoId + ', ' +
      '              DESCRICAO, SITUACAO) ' + ' VALUES( ' + IntToStr(viID) + ','
      + QuotedStr(vpValor) + ',' + QuotedStr('A') + ')', 1);
  end
  else
  begin
    viID := vpValorId;
    if vpAtualizarValor then
      ExecutaSqlAuxiliar(' UPDATE ' + vpTabela + ' SET DESCRICAO = ' +
        QuotedStr(vpValor) + ' WHERE ' + vpCampoId + ' = ' +
        IntToStr(vpValorId), 1);
  end;

  if vpAtualizarCampo then
    if vpI9Query <> nil then
      vpI9Query.FieldByName(vpCampoId).AsInteger := viID
    else
      vpClientDataset.FieldByName(vpCampoId).AsInteger := viID;

  Result := viID;
end;

procedure TdtmLookup.CadastrarRegBasicoGeralClient(vpI9Query: TClientDataSet;
  vpTabela, vpCampoId, vpValor: String);
var
  viID: Integer;
begin
  if length(vpValor) <= 1 then
    vpValor := '';

  if (vpValor = '') and (vpI9Query.FieldByName(vpCampoId).AsInteger = 0) then
    exit;

  if (vpI9Query.FieldByName(vpCampoId).AsInteger = 0) and (vpValor <> '')
  then
  begin
    viID := dtmControles.GerarSequencia(vpTabela);
    ExecutaSqlAuxiliar(' INSERT INTO ' + vpTabela + '(' + vpCampoId + ', ' +
      '              DESCRICAO, SITUACAO) ' + ' VALUES( ' + IntToStr(viID) + ','
      + QuotedStr(vpValor) + ',' + QuotedStr('A') + ')', 1);

    vpI9Query.FieldByName(vpCampoId).AsInteger := viID;
  end;

end;

procedure TdtmLookup.CadastrarRegBasicoGeralLookup(vpLookup: TcxLookupComboBox;
        vpTabela, vpCampoId, vpValor: String);
var
  viID: Integer;
begin
  if length(vpValor) <= 1 then
    vpValor := '';

  if (vpValor = '') and (vpLookup.EditValue = null) then
    exit;

  if (vpLookup.EditValue = null) and (vpValor <> '')
  then
  begin
    viID := dtmControles.GerarSequencia(vpTabela);
    ExecutaSqlAuxiliar(' INSERT INTO ' + vpTabela + '(' + vpCampoId + ', ' +
      '              DESCRICAO, SITUACAO) ' + ' VALUES( ' + IntToStr(viID) + ','
      + QuotedStr(vpValor) + ',' + QuotedStr('A') + ')', 1);

    vpLookup.EditValue := viID;
  end;
end;

function TdtmLookup.CalcularContaCliente(vpEspecie, vpCaixa, vpOperacao, vpCliente,
            vpDataFinal, vpCaixaServico : String; vpTodosServico : Boolean = False):Currency;
var
  viSql : String;
  viEntradas, viSaidas : Currency;

begin
  viSql := '';
  viSql := ' SELECT SUM(VALOR) FROM C_CONTA_HISTORICO '+
           ' WHERE ((SITUACAO IS NULL) OR (SITUACAO = '+QuotedStr('F')+') OR (SITUACAO = '+QuotedStr('I')+'))';

  if vpCaixa <> '' then
    viSql := viSql + ' AND CAIXA_ITEM_ID = '+vpCaixa;

  if vpEspecie <> ''  then
    viSql := viSql + '  AND ESPECIE_PAGAMENTO = '+ QuotedStr(vpEspecie);

  if vpCliente <> '' then
    viSql := viSql + '  AND CONTA_CLIENTE_ID = '+ vpCliente;

  if (vpDataFinal <> '') then
    viSql := viSql + '  AND DATA <= '+ QuotedStr(vpDataFinal);

  if (vpCaixaServico <> '') then
    viSql := viSql + '  AND CAIXA_SERVICO_ID = '+ vpCaixaServico;

  if vpTodosServico then
    viSql := viSql + '  AND NOT CAIXA_SERVICO_ID IS NULL ';

  if vpOperacao <> '' then
  begin
    viSql := viSql + '  AND OPERACAO = '+QuotedStr(vpOperacao);
    Result := dtmControles.GetFloat(viSql);
  end
  else
  begin
    viEntradas := dtmControles.GetFloat(viSql + ' AND OPERACAO = '+QuotedStr('E'));
    viSaidas   := dtmControles.GetFloat(viSql + ' AND OPERACAO = '+QuotedStr('R'));
    Result     := viEntradas - viSaidas;
  end;

end;

function TdtmLookup.CalcularDebitosCreditos(vpTipoTransacao : String; vpCondicaoServico : string = ''):Currency;
var
  viSql : String;
begin
  viSql := 'SELECT SUM(VALOR_PAGO) ' +
         'FROM C_CAIXA_ITEM '+
         '  WHERE (TIPO_TRANSACAO = '+ QuotedStr(vpTipoTransacao);
  if vpTipoTransacao= 'C' then
        viSql := viSql + ' AND VALOR_PAGO > 0)'
  else viSql := viSql + ' OR VALOR_PAGO < 0)';

  if vpCondicaoServico <> '' then
    viSql := viSql + vpCondicaoServico;

  viSql := viSql +
//         '    AND ((SITUACAO = ''4'') OR (SITUACAO = ''12''))'+ vgFechamentoCaixa.Condicao +
         '    AND (SITUACAO = ''4'') '+ vgFechamentoCaixa.Condicao +
         '    AND DATA_PAGAMENTO >= ' + QuotedStr(dtmControles.DataParaString(vgFechamentoCaixa.Data1))+
         '    AND DATA_PAGAMENTO <= ' + QuotedStr(dtmControles.DataParaString(vgFechamentoCaixa.Data2));
  Result := dtmControles.GetFloat(viSql);
end;

function TdtmLookup.CalcularSaldoInicial : Currency;
begin
  ExecutaSqlAuxiliar(' SELECT SUM(VALOR_PRIMEIRO) AS VALOR ' +
                     ' FROM C_CAIXA_ITEM '+
                     '  WHERE TIPO_TRANSACAO = '+QuotedStr('C')+
                     '    AND VALOR_PAGO > 0' +
                     '    AND ((SITUACAO = ''1'') OR (SITUACAO = ''2''))'+ vgFechamentoCaixa.Condicao +
                     '    AND DATA_PAGAMENTO >= ' + QuotedStr(dtmControles.DataParaString(vgFechamentoCaixa.Data1))+
                     '    AND DATA_PAGAMENTO <= ' + QuotedStr(dtmControles.DataParaString(vgFechamentoCaixa.Data2)),0);
  Result := dtmControles.sqlAuxiliar.FieldByName('VALOR').AsCurrency;
end;

function TdtmLookup.CalcularSangria(vpEspecie, vpCaixa, vpTipo: String): Currency;
begin
  Result := dtmControles.GetFloat(' SELECT SUM(VALOR) FROM C_CAIXA_SANGRIA '+
                                  ' WHERE CAIXA_ITEM_ID = '+ vpCaixa+
                                  '  AND TIPO = '+QuotedStr(vpTipo)+
                                  '  AND ESPECIE_PAGAMENTO = '+ QuotedStr(vpEspecie));
end;

function TdtmLookup.CalculoSaldoEspecie(vpEspecie, vpTipoCaixa, vpCondicao : String; vpData1, vpData2 : TDate;
             vpDeduzirDebitos: Boolean = True):Currency;
var
  viCredito, viDebito : Double;
  viData1, viData2 : TDate;

  Function RealizarCalculo(vpTipoTransacao : String): Double;
  var
    viValorPrimeiro, viValorSegundo : Currency;

    Function CalcularValor(vpCampoValor, vpCampoEspecie : String):Currency;
    var
      viSql : String;
    begin
      viSql:= ' SELECT SUM('+vpCampoValor+') AS VALOR ' +
              ' FROM C_CAIXA_ITEM '+
              '  WHERE TIPO_TRANSACAO = '+QuotedStr(vpTipoTransacao)+
              '    AND ((VALOR_PRIMEIRO > 0)'+
              '    OR (VALOR_PAGO > 0))';

      if CharInSet(vpEspecie[1],['D', 'C']) then
        viSql := viSql + '    AND ((SITUACAO = ''4'') OR (SITUACAO = ''1'') OR (SITUACAO = ''2'') OR (SITUACAO = ''12'') OR (SITUACAO = ''9'') OR (SITUACAO = ''10''))'+
                         '    AND '+vpCampoEspecie+' = '+QuotedStr(vpEspecie)
      else
        case vpEspecie[1] of
          'M' : viSql := viSql + ' AND ((SITUACAO = ''6'') OR ((SITUACAO = ''10'') AND (ESPECIE_PAGAMENTO <> '+ QuotedStr('')+')))';
          'S' : viSql := viSql + ' AND ((SITUACAO = ''7'') OR (SITUACAO = ''11''))';
          '7' : viSql := viSql + ' AND (SITUACAO = ''7'')';
          'T' : viSql := viSql + ' AND ((SITUACAO = ''9'') OR (((SITUACAO = ''10'') OR (SITUACAO = ''11'')) AND (ESPECIE_PAGAMENTO = '+ QuotedStr('')+')))';
        end;

      viSql := viSql + vpCondicao +
                    '    AND DATA_PAGAMENTO >= ' + QuotedStr(dtmControles.DataParaString(viData1))+
                    '    AND DATA_PAGAMENTO <= ' + QuotedStr(dtmControles.DataParaString(viData2));

      ExecutaSqlAuxiliar(viSql,0);
      Result := Arredondamento(dtmControles.MetodoArredondamento, dtmControles.sqlAuxiliar.FieldByName('VALOR').AsCurrency,2);
      dtmControles.sqlAuxiliar.Close;
    end;
  begin
    viValorPrimeiro := 0;

    if (CharInSet(vpTipoCaixa[1],['2','3'])) and (CharInSet(vpEspecie[1],['D', 'C', 'T'])) then
    begin
      viValorPrimeiro := CalcularValor('VALOR_PRIMEIRO', 'ESPECIE_PAGAMENTO');
      viValorSegundo  := CalcularValor('VALOR_SEGUNDO', 'ESPECIE_PAGAMENTO2');
    end
    else viValorSegundo  := CalcularValor('VALOR_PAGO', 'ESPECIE_PAGAMENTO');
    Result := viValorPrimeiro + viValorSegundo;
  end;

begin
  viData1   := vpData1;
  viData2   := vpData2;

  if vpEspecie[1] = '7'  then
       viCredito := Arredondamento(dtmControles.MetodoArredondamento, RealizarCalculo('D'),2)
  else viCredito := Arredondamento(dtmControles.MetodoArredondamento, RealizarCalculo('C'),2);

  if vpDeduzirDebitos then
       viDebito := Arredondamento(dtmControles.MetodoArredondamento, RealizarCalculo('D'),2)
  else viDebito := 0;

  Result := viCredito - viDebito;
end;

procedure TdtmLookup.CarregarIcxComboBox(vpValue, vpDescricao: string;
  vpIcxComboBox: TcxImageComboBox; vpImageIndex: Integer);
var
  viIndice : Integer;
begin
  viIndice := vpIcxComboBox.Properties.Items.Count;
  vpIcxComboBox.Properties.Items.Insert(viIndice);
  vpIcxComboBox.Properties.Items[viIndice].Description  := vpDescricao;
  vpIcxComboBox.Properties.Items[viIndice].Value        := vpValue;
  vpIcxComboBox.Properties.Items[viIndice].ImageIndex   := vpImageIndex;
end;

procedure TdtmLookup.CarregarIcxComboBoxDB(vpValue, vpDescricao: string;
  vpIcxComboBox: TcxDBImageComboBox; vpImageIndex: Integer);
var
  viIndice : Integer;
begin
  viIndice := vpIcxComboBox.Properties.Items.Count;
  vpIcxComboBox.Properties.Items.Insert(viIndice);
  vpIcxComboBox.Properties.Items[viIndice].Description  := vpDescricao;
  vpIcxComboBox.Properties.Items[viIndice].Value        := vpValue;
  vpIcxComboBox.Properties.Items[viIndice].ImageIndex   := vpImageIndex;
end;

procedure TdtmLookup.CarregarListaSistemas(vpLista : TcxImageComboBox;
     vpSetarPrimeiroItem : Boolean = True; vpGeral : Boolean = False);
var
  viSistemas : String;
begin
  viSistemas := dtmControles.BuscarConfig('PRINCIPAL', 'CARTORIO', 'TIPO_CARTORIO', 'S');
  vpLista.Properties.Items.Clear;

  if pos('1', viSistemas) > 0 then
    dtmLookup.CarregarIcxComboBox('1', 'Tabelionato de Notas', vpLista);
  if pos('2', viSistemas) > 0 then
    dtmLookup.CarregarIcxComboBox('2', 'Registro de Im�veis', vpLista);
  if pos('3', viSistemas) > 0 then
    dtmLookup.CarregarIcxComboBox('3', 'Registro Civil', vpLista);
  if pos('4', viSistemas) > 0 then
    dtmLookup.CarregarIcxComboBox('4', 'RTD & Pessoa Jur�dica', vpLista);
  if pos('5', viSistemas) > 0 then
    dtmLookup.CarregarIcxComboBox('5', 'Protesto', vpLista);

  if vpGeral then
    dtmLookup.CarregarIcxComboBox('9', 'Geral', vpLista);

  if vpSetarPrimeiroItem then
    vpLista.ItemIndex := 0;
end;

procedure TdtmLookup.CarregarListaSistemasDb(vpLista : TcxDBImageComboBox; vpTodos : Boolean = False);
var
  viSistemas : String;
begin
  viSistemas := dtmControles.BuscarConfig('PRINCIPAL', 'CARTORIO', 'TIPO_CARTORIO', 'S');
  vpLista.Properties.Items.Clear;

  if pos('1', viSistemas) > 0 then
    dtmLookup.CarregarIcxComboBoxDB('1', 'Tabelionato de Notas', vpLista);
  if pos('2', viSistemas) > 0 then
    dtmLookup.CarregarIcxComboBoxDB('2', 'Registro de Im�veis', vpLista);
  if pos('3', viSistemas) > 0 then
    dtmLookup.CarregarIcxComboBoxDB('3', 'Registro Civil', vpLista);
  if pos('4', viSistemas) > 0 then
    dtmLookup.CarregarIcxComboBoxDB('4', 'RTD & Pessoa Jur�dica', vpLista);
  if pos('5', viSistemas) > 0 then
    dtmLookup.CarregarIcxComboBoxDB('5', 'Protesto', vpLista);

  if vpTodos then
    dtmLookup.CarregarIcxComboBoxDB('9', 'Geral', vpLista);

  vpLista.ItemIndex := 0;
end;

procedure TdtmLookup.DataModuleCreate(Sender: TObject);
var
  viTipoCartorio, viSql : String;
begin
  sqlG_Banco.Connection              := dtmControles.DB;
  sqlG_TB_DocumentoTipo.Connection   := dtmControles.DB;
  sqlG_TB_EstadoCivil.Connection     := dtmControles.DB;
  sqlG_TB_Profissao.Connection       := dtmControles.DB;
  sqlG_TB_RegimeComunhao.Connection  := dtmControles.DB;
  sqlG_TB_TipoLogradouro.Connection  := dtmControles.DB;
  sqlG_TB_TxModeloGrupo.Connection   := dtmControles.DB;
  sqlG_Natureza_Titulo.Connection    := dtmControles.DB;
  sqlG_Emolumento.Connection         := dtmControles.DB;
  sqlG_Emolumento_Periodo.Connection := dtmControles.DB;
  sqlG_Emolumento_PeriodoAtivos.Connection := dtmControles.DB;
  sqlG_Medida_Tipo.Connection        := dtmControles.DB;
  sqlG_TB_Bairro.Connection          := dtmControles.DB;
  sqlG_Usuario.Connection            := dtmControles.DB;
  sqlG_Natureza.Connection           := dtmControles.DB;
  sqlUsuarioSistema.Connection       := dtmControles.DB;
  sqlUsuarioAssinante.Connection     := dtmControles.DB;
  sqlC_Caixa_Servico.Connection      := dtmControles.DB;
  sqlSeloGrupo.Connection            := dtmControles.DB;
  sqlSeloTipoCartorio.Connection     := dtmControles.DB;
  sqlMunicipioIBGE.Connection        := dtmControles.DB;
  sqlPaisIBGE.Connection             := dtmControles.DB;
  sqlRegineBens.Connection           := dtmControles.DB;
  sqlCaixaServicoTodos.Connection    := dtmControles.DB;
  sqlEmailTextoPadrao.Connection     := dtmControles.DB;
  sqlSistema.Connection              := dtmControles.DB;
  sqlProvimentoEsferaNivel.Connection:= dtmControles.DB;
  sqlProvimentoOrigem.Connection     := dtmControles.DB;
  sqlProvimentoTipo.Connection       := dtmControles.DB;
  sqlEmolumentoTodos.Connection      := dtmControles.DB;
  sqlNaturezaTituloTodos.Connection  := dtmControles.DB;
  sqlR_TB_Tipo_Andamento.Connection  := dtmControles.DB;
  sqlConfiguracaoSalva.Connection    := dtmControles.DB;
  sqlConfiguracaoDados.Connection    := dtmControles.DB;
  sqlMensalista.Connection           := dtmControles.DB;
  sqlContaCliente.Connection         := dtmControles.DB;
  sqlContaClienteAtiva.Connection    := dtmControles.DB;
  sqlTipoCartao.Connection           := dtmControles.DB;

  sqlG_Banco.Open;
  sqlG_TB_DocumentoTipo.Open;
  sqlG_TB_Profissao.Open;
  sqlG_TB_RegimeComunhao.Open;
  sqlG_TB_TipoLogradouro.Open;
  sqlG_TB_TxModeloGrupo.Open;
  sqlG_Medida_Tipo.Open;
  sqlG_Usuario.Open;
  sqlSeloTipoCartorio.Open;
  sqlMunicipioIBGE.Open;
  sqlPaisIBGE.Open;
  sqlRegineBens.Open;
  sqlCaixaServicoTodos.Open;
  sqlEmailTextoPadrao.Open;
  sqlSistema.Open;
  sqlNaturezaTituloTodos.Open;
  sqlMensalista.Open;
  sqlContaCliente.Open;
  sqlContaClienteAtiva.Open;
  sqlTipoCartao.Open;

  if vgId in [1,2,5,7,12,13,15,20] then
       viTipoCartorio := dtmControles.BuscarConfig('PRINCIPAL', 'CARTORIO', 'TIPO_CARTORIO', 'S')
  else viTipoCartorio := '0';
  sqlSeloGrupo.Close;
  viSql := ' SELECT * '+
           ' FROM G_SELO_GRUPO ';
  if viTipoCartorio <> '' then
    viSql := viSql + ' WHERE (TIPO_CARTORIO IS NULL OR '+
                     '      TIPO_CARTORIO IN('+viTipoCartorio+'))';
  viSql := viSql + ' ORDER BY SELO_GRUPO_ID ';
  sqlSeloGrupo.SQL.Text := viSql;
  sqlSeloGrupo.Open;

  sqlG_TB_Bairro.Close;
  sqlG_TB_Bairro.Params.ParamByName('SISTEMA_ID').AsBCD := vgId;
  sqlG_TB_Bairro.Open;

  sqlG_TB_EstadoCivil.Close;
  sqlG_TB_EstadoCivil.Params.ParamByName('SISTEMA_ID').AsBCD := vgId;
  sqlG_TB_EstadoCivil.Open;

  sqlG_Natureza_Titulo.Close;
  sqlG_Natureza_Titulo.Params.ParamByName('SISTEMA_ID').AsCurrency := vgId;
  sqlG_Natureza_Titulo.Open;

  sqlG_Emolumento.Close;
  sqlG_Emolumento.Params.ParamByName('SISTEMA_ID').AsCurrency := vgId;
  sqlG_Emolumento.Open;

  sqlEmolumentoTodos.Close;
  sqlEmolumentoTodos.Params.ParamByName('SISTEMA_ID').AsCurrency := vgId;
  sqlEmolumentoTodos.Open;

  sqlG_Natureza.Close;
  sqlG_Natureza.Params.ParamByName('SISTEMA_ID').AsCurrency := vgId;
  sqlG_Natureza.Open;

  sqlUsuarioSistema.Close;
  sqlUsuarioSistema.Params.ParamByName('SISTEMA_ID').AsBCD := vgId;
  sqlUsuarioSistema.Open;

  sqlUsuarioAssinante.Close;
  sqlUsuarioAssinante.Params.ParamByName('SISTEMA_ID').AsBCD := vgId;
  sqlUsuarioAssinante.Open;

  sqlC_Caixa_Servico.Close;
  sqlC_Caixa_Servico.Params.ParamByName('SISTEMA_ID').AsCurrency := vgId;
  sqlC_Caixa_Servico.Open;

  sqlG_Emolumento_Periodo.Open;
  sqlG_Emolumento_PeriodoAtivos.Open;
end;

function TdtmLookup.GetConfigCaixa(vpGrupo, vpSecao, vpNome: string;
  vpTipoValor: char): Variant;
var
  viSql : String;
begin
  viSql := ' SELECT VALOR '+
           ' FROM G_CONFIG C LEFT JOIN G_CONFIG_GRUPO G ON '+
           '    C.CONFIG_GRUPO_ID = G.CONFIG_GRUPO_ID '+
           ' WHERE G.SISTEMA_ID = 5 '+
           '   AND (TERMINAL = '+QuotedStr('')+' OR TERMINAL IS NULL OR TERMINAL = '+QuotedStr(Rotinas.NomeEstacao)+')'+
           '   AND G.DESCRICAO = '+ QuotedStr(vpGrupo) +
           '   AND C.SECAO = '+ QuotedStr(vpSecao) +
           '   AND C.NOME = '+ QuotedStr(vpNome);
  case vpTipoValor of
   'S' : Result := dtmControles.GetStr(viSql);
   'D' : Result := dtmControles.GetFloat(viSql);
   'I' : Result := dtmControles.GetInt(viSql);
  end
end;

procedure TdtmLookup.LerDadadosConfigEmail(vpTabela : String);
begin
  ExecutaSqlAuxiliar('SELECT * FROM '+vpTabela,0);
  with dtmControles.sqlAuxiliar do
  begin
    vgEmailConfig.HostSmtp          := FieldByName('HOST_SMTP').AsString;
    vgEmailConfig.Porta             := FieldByName('PORTA').AsString;
    vgEmailConfig.UserName          := FieldByName('USER_NAME').AsString;
    vgEmailConfig.PassWord          := FieldByName('PASSWORD').AsString;
    vgEmailConfig.AssuntoPadrao     := FieldByName('ASSUNTO_PADRAO').AsString;
    vgEmailConfig.Autenticar        := FieldByName('AUTENTICAR_SERVIDOR').AsString = 'S';
    vgEmailConfig.EspacoAssinatura  := FieldByName('ESPACO_TEXTO_RODAPE').AsInteger;
    if FieldByName('USAR_EMAIL_USUARIO').AsString = 'S' then
         vgEmailConfig.EmailEnvio := dtmControles.GetStr(' SELECT EMAIL FROM G_USUARIO WHERE USUARIO_ID = '+vgUsuarioID)
    else vgEmailConfig.EmailEnvio := FieldByName('EMAIL_PADRAO').AsString;

    vgEmailConfig.TextoEmail          := TStringList.Create;
    vgEmailConfig.TextoRodape         := TStringList.Create;
    vgEmailConfig.TextoEmail.Text     := FieldByName('TEXTO_EMAIL').AsString;
    vgEmailConfig.TextoRodape.Text    := FieldByName('TEXTO_RODAPE').AsString;
    vgEmailConfig.AdAssinaturaUsuario := FieldByName('ADICIONAR_ASSINATURA_USUARIO').AsString = 'S';
  end;
  dtmControles.sqlAuxiliar.Active := False;
end;

procedure TdtmLookup.MarcarDesmarcarItensClietDataSet(vpMarcar: String;
  vpSimpleDataset: TClientDataSet);
var
  viPosicao: Integer;
begin
  Screen.Cursor := crHourGlass;
  viPosicao := vpSimpleDataset.RecNo;
  vpSimpleDataset.DisableControls;
  vpSimpleDataset.First;
  while not vpSimpleDataset.Eof do
  begin
    vpSimpleDataset.FieldByName('CALC_SELECIONADO').ReadOnly := False;
    vpSimpleDataset.Edit;
    vpSimpleDataset.FieldByName('CALC_SELECIONADO').AsBoolean := vpMarcar = 'S';
    vpSimpleDataset.Next;
  end;
  vpSimpleDataset.First;
  vpSimpleDataset.EnableControls;
  vpSimpleDataset.RecNo := viPosicao;
  Screen.Cursor := crDefault
end;

procedure TdtmLookup.MarcarDesmarcarItensSimpleDataSet(vpMarcar: String;
  vpSimpleDataset: TI9Query);
var
  viPosicao: Integer;
begin
  Screen.Cursor := crHourGlass;
  viPosicao := vpSimpleDataset.RecNo;
  vpSimpleDataset.DisableControls;
  vpSimpleDataset.First;
  while not vpSimpleDataset.Eof do
  begin
    vpSimpleDataset.FieldByName('CALC_SELECIONADO').ReadOnly := False;
    vpSimpleDataset.Edit;
    vpSimpleDataset.FieldByName('CALC_SELECIONADO').AsBoolean := vpMarcar = 'S';
    vpSimpleDataset.Next;
  end;
  vpSimpleDataset.First;
  vpSimpleDataset.EnableControls;
  vpSimpleDataset.RecNo := viPosicao;
  Screen.Cursor := crDefault;
end;

Function TdtmLookup.RegistrarLivroDiario(vpVerificarRegistro : Boolean = False):String;
var
  viServentiaRegistroLivro, viRegistroDiarioID : Integer;
  viProtocolo : String;
begin
  if vpVerificarRegistro then
  begin
    viServentiaRegistroLivro := dtmControles.GetInt(' SELECT SERVENTIA_REGISTRO_DIARIO FROM C_CAIXA_SERVICO '+
                                                    ' WHERE CAIXA_SERVICO_ID = '+ InttoStr(vgLivroDiario.CaixaServicoID));
    if viServentiaRegistroLivro = 0 then
      exit;
  end;

  if vgLivroDiario.Protocolo = 0 then
       viProtocolo := ''
  else viProtocolo := IntToStr(vgLivroDiario.Protocolo);
  

  ExecutaSqlAuxiliar(' INSERT INTO C_REGISTRO_DIARIO ( '+
                     '        REGISTRO_DIARIO_ID, '+
                     '        DESCRICAO, '+
                     '        APRESENTANTE, '+
                     '        VALOR, '+
                     '        VALOR_ANTERIOR, '+
                     '        OPERACAO, '+
                     '        LIVRO, '+
                     '        FOLHA, '+
                     '        USUARIO_ID, '+
                     '        PROTOCOLO, '+
                     '        DATA, '+
                     '        QTD, '+
                     '        QTD_CALCULO, '+
                     '        ESCREVENTE, '+
                     '        SERVENTIA, '+
                     '        CAIXA_SERVICO_ID, '+
                     '        SELO, '+
                     '        CODIGO_REGISTRO_AUTO, '+
                     '        CODIGO_TABELA, '+
                     '        CONTROLE_ID) '+
                     '       VALUES ( '+
                     '         :REGISTRO_DIARIO_ID, '+
                     '         :DESCRICAO, '+
                     '         :APRESENTANTE, '+
                     '         :VALOR, '+
                     '         :VALOR_ANTERIOR, '+
                     '         :OPERACAO, '+
                              RetNull(QuotedStr(vgLivroDiario.Livro))+','+
                              RetNull(QuotedStr(vgLivroDiario.Folha))+','+
                     '         :USUARIO_ID, '+
                              RetNull(viProtocolo)+','+
                     '         :DATA, '+
                     '         :QTD, '+
                     '         :QTD_CALCULO, '+
                     '         :ESCREVENTE, '+
                     '         :SERVENTIA, '+
                     '         :CAIXA_SERVICO_ID, '+
                              RetNull(QuotedStr(vgLivroDiario.Selo))+','+
                              RetNull(QuotedStr(vgLivroDiario.CodigoRegistroAuto))+','+
                              RetNull(vgLivroDiario.CodigoTabela)+','+
                     '         :CONTROLE_ID)',2);
  with dtmControles.sqlAuxiliar do
  begin
    viRegistroDiarioID := dtmControles.GerarSequencia('C_REGISTRO_DIARIO');
    ParamByName('REGISTRO_DIARIO_ID').AsBCD   := viRegistroDiarioID;
    ParamByName('DESCRICAO').AsString         := vgLivroDiario.Descricao;
    ParamByName('APRESENTANTE').AsString      := vgLivroDiario.Apresentante;
    ParamByName('VALOR').AsCurrency           := vgLivroDiario.Valor;
    ParamByName('VALOR_ANTERIOR').AsCurrency  := vgLivroDiario.ValorAnterior;
    ParamByName('OPERACAO').AsString          := vgLivroDiario.Operacao;
    ParamByName('USUARIO_ID').AsString        := vgUsuarioID;
    ParamByName('DATA').AsDate                := vgLivroDiario.Data;
    ParamByName('QTD').AsInteger              := vgLivroDiario.Qtd;
    ParamByName('QTD_CALCULO').AsInteger      := vgLivroDiario.QtdCalculo;
    ParamByName('ESCREVENTE').AsInteger       := vgLivroDiario.Escrevente;
    ParamByName('CAIXA_SERVICO_ID').AsInteger := vgLivroDiario.CaixaServicoID;

    if vgLivroDiario.Operacao = 'C' then
         ParamByName('SERVENTIA').AsString  := vgLivroDiario.Serventia
    else ParamByName('SERVENTIA').AsInteger := 9;

    if vgLivroDiario.ControleID = 0 then
         ParamByName('CONTROLE_ID').AsInteger  := dtmControles.GerarSequencia('C_REGISTRO_DIARIO_CONTROLE')
    else ParamByName('CONTROLE_ID').AsInteger  := vgLivroDiario.ControleID;

    ExecSQL;
  end;
  Result := InttoStr(viRegistroDiarioID);
end;

procedure TdtmLookup.UpdateSimplesTabela(vpTabela, vpCampoAtualiza,
            vpCondicaoExtra, vpValor, vpId : String);
begin
  ExecutaSqlAuxiliar(' UPDATE '+ vpTabela + ' SET '+ vpCampoAtualiza + ' = '+ vpValor+
                     ' WHERE '+ copy(vpTabela,3,30)+'_ID ='+ vpId + vpCondicaoExtra,1)

end;

function TdtmLookup.VerificarPastaImagem(vpPastaImagem: string;
  vpNumero: Integer; vpVerificarExistencia: Boolean): Boolean;
begin
  Result := False;
  vgDadosImagem.LocalImagem := dtmControles.BuscarConfig('IMAGEM', 'GERAL', 'LOCAL_IMAGEM', 'S');

  vgDadosImagem.Pasta := Trim(vgDadosImagem.LocalImagem +'\'+vpPastaImagem);
  if ((vgDadosImagem.Pasta = '') or (not DirectoryExists(vgDadosImagem.Pasta))) and (not vpVerificarExistencia) and not vgDadosImagem.Localizado then
  begin
    Application.MessageBox(PChar('Local de Imagens de '+ vpPastaImagem+' n�o encontrado!!!'), 'Erro', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    Screen.Cursor := crDefault;
    Result := False;
    exit;
  end;

  vgDadosImagem.SubPasta := Copy(FormatFloat('000000',vpNumero),1,3);
  if Copy(vgDadosImagem.Pasta,Length(vgDadosImagem.Pasta),1) <> '\' then
    vgDadosImagem.Pasta := vgDadosImagem.Pasta + '\';
  vgDadosImagem.Pasta := vgDadosImagem.Pasta + vgDadosImagem.SubPasta + '\';

  if vpVerificarExistencia then
    exit;

  try
    if not DirectoryExists(vgDadosImagem.Pasta) then
      MkDir(vgDadosImagem.Pasta);
  except
    Application.MessageBox(PChar('Local de Imagens de '+ vgDadosImagem.Pasta+' n�o encontrado!!!'), 'Erro', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    Result := False;
    exit;
  end;
  Result := True;
end;

procedure TdtmLookup.VerificarPermitirNegativar(vpCliente, vpOperacao : String;
       vpValor, vpSaldo : Currency);
var
  viPermiteNegativar : Boolean;
begin
  if (vpOperacao = 'R') and ((vpSaldo - vpValor) < 0) then
  begin
    viPermiteNegativar := dtmControles.GetStr(' SELECT PERMITE_NEGATIVAR FROM C_CONTA_CLIENTE WHERE CONTA_CLIENTE_ID = '+vpCliente) = 'S';
    if not viPermiteNegativar then
    begin
      Application.MessageBox(Pchar('Conta Cliente n�o possui Saldo Suficiente!!!'+#13+#13+
                                   'Saldo Disponivel = '+ FormatFloat('R$ ,#0.00',vpSaldo)), 'Aten��o', MB_OK + MB_ICONWARNING);
      abort;
    end
    else
      if Application.MessageBox(Pchar('Saldo Indisponivel. Confirmar assim mesmo?'+#13+#13+
                                 'Saldo Disponivel = '+ FormatFloat('R$ ,#0.00',vpSaldo)), 'Pergunta', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION) = IDNO then

        abort;

   end;
end;

procedure TdtmLookup.CarregarConfiguracaoSalva(vpLocal: String);
begin
  sqlConfiguracaoSalva.Active := False;
  sqlConfiguracaoSalva.ParamByName('SISTEMA_ID').AsBCD := vgId;
  sqlConfiguracaoSalva.ParamByName('LOCAL').AsString   := vpLocal;
  sqlConfiguracaoSalva.Active := True;
end;

procedure TdtmLookup.GravarConfiguracaoSalva(vpLocal, vpDescricao, vpValor, vpOrdem : Variant);
var
  viRelatorio : Integer;
begin
  if vpOrdem = '0' then
  begin
    viRelatorio := dtmControles.GetInt(' SELECT CONFIGURACAO_SALVA_ID FROM G_CONFIGURACAO_SALVA '+
                                       ' WHERE LOCAL ='+QuotedStr(vpLocal)+
                                       '   AND DESCRICAO = '+QuotedStr(vpDescricao)+
                                       '   AND ORDEM = '+QuotedStr('0')+
                                       '   AND SISTEMA_ID = '+IntToStr(vgId));
    if viRelatorio > 0  then
    begin
      Application.MessageBox('Ja existe uma Configura��o com este Nome!!!', 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      Abort;
    end;
  end;

  ExecutaSqlAuxiliar(' INSERT INTO G_CONFIGURACAO_SALVA( '+
                     '              CONFIGURACAO_SALVA_ID, '+
                     '              SISTEMA_ID, '+
                     '              DESCRICAO, '+
                     '              LOCAL, ' +
                     '              ORDEM, ' +
                     '              VALOR) '+
                     ' VALUES(      :CONFIGURACAO_SALVA_ID, '+
                     '              :SISTEMA_ID, '+
                     '              :DESCRICAO, '+
                     '              :LOCAL, '+
                     '              :ORDEM, '+
                     '              :VALOR)',2);
  with dtmControles.sqlAuxiliar do
  begin
    ParamByName('CONFIGURACAO_SALVA_ID').AsBCD  := dtmControles.GerarSequencia('G_CONFIGURACAO_SALVA');
    ParamByName('SISTEMA_ID').AsBCD             := vgId;
    ParamByName('DESCRICAO').AsString           := vpDescricao;
    ParamByName('LOCAL').AsString               := vpLocal;
    ParamByName('ORDEM').AsString               := vpOrdem;
    if vpValor <> NULL then
         ParamByName('VALOR').AsString          := VarToStr(vpValor)
    else ParamByName('VALOR').AsString          := '';
    ExecSQL;
  end;
  sqlConfiguracaoSalva.Refresh;
end;

procedure TdtmLookup.BuscarConficuracaoSalva(vpLocal, vpDescricao: String);
begin
  sqlConfiguracaoDados.Active := False;
  sqlConfiguracaoDados.ParamByName('SISTEMA_ID').AsBCD   := vgId;
  sqlConfiguracaoDados.ParamByName('LOCAL').AsString     := vpLocal;
  sqlConfiguracaoDados.ParamByName('DESCRICAO').AsString := vpDescricao;
  sqlConfiguracaoDados.Active := True;
end;

end.
