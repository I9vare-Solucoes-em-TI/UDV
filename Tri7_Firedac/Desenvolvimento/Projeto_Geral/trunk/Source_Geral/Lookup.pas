unit Lookup;

interface

uses
  I9Query,
  I9Query,
  SysUtils, Classes, cxDBEditRepository, DB, DBClient, SimpleDS,
  cxEditRepositoryItems, cxEdit, cxImageComboBox, cxDbEdit, cxClasses,
  Vcl.Forms, Vcl.Controls, System.Variants,  Vcl.Dialogs, Winapi.Windows,
  DbxDevartInterBase, SeloFundo, Rotinas, FundoTipo, EmolumentoImpl,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  ConfiguradorFundo, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxProgressBar;
type
  TAtualizarTabelas = class(TThread)
  private
  protected
    procedure Execute; override;
  end;

  TExecuteProc = procedure of object;

  TDadosCadastro = Record
    Descricao, Tabela, CampoId, PastaCarregada, RenumeracaoIdChaves: String;
    ChaveIdPrincipal, ChaveIdSecundaria, ChaveIdTerciaria: Integer;
    Confirmado, SomentePesquisa, Consultoria, SalvarNovo, AtualizarSaldo : Boolean;
  end;

  TImagem = Record
    SubPasta, Pasta, LocalImagem: string;
    Localizado : Boolean;
  end;

  TLivroDiario = RECORD
   Descricao, Apresentante, Operacao, LIvro, Folha, Serventia, Selo, CodigoRegistroAuto, CodigoTabela : String;
   Valor, ValorAnterior : Currency;
   Protocolo, Qtd, QtdCalculo, Escrevente, CaixaServicoId, ControleID : Integer;
   Data : TDateTime;
  end;

  TLivroDiarioPesquisa = RECORD
    DataInicial, DataFinal, Serventia, TipoServico, Usuario, Protocolo,
    Selo, Detalhes, Operacao, CodigoPlanilha : String;
  end;

  TCaixaControle = record
    MultiploCaixa, EdicaoSangriaAporte, FormNovo : Boolean;
    CaixaId : Integer;
    SaldoDinheiro, SaldoCheque, SaldoCaixa, Arrendontamento, Desconto, SaldoFinal : Currency;
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
    Combo_CapacidadeCivil: TcxEditRepositoryImageComboBoxItem;
    Combo_SimNao: TcxEditRepositoryImageComboBoxItem;
    Combo_TipoQualificacao: TcxEditRepositoryImageComboBoxItem;
    sqlG_TB_TxModeloGrupo: TI9Query;
    sqlG_TB_TxModeloGrupoTB_TXMODELOGRUPO_ID: TBCDField;
    sqlG_TB_TxModeloGrupoDESCRICAO: TStringField;
    dtsG_TB_TxModeloGrupo: TDataSource;
    ListaG_TB_TBTxModeloGrupo: TcxEditRepositoryLookupComboBoxItem;
    Combo_AtivoInativo: TcxEditRepositoryImageComboBoxItem;
    Combo_Nacionalidade: TcxEditRepositoryImageComboBoxItem;
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
    Lista_IBGE_Pais_Desc: TcxEditRepositoryLookupComboBoxItem;
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
    Lista_AndamentoRI: TcxEditRepositoryLookupComboBoxItem;
    sqlTipoCartao: TI9Query;
    dtsTipoCartao: TDataSource;
    cxEditRepository1LookupComboBoxItem1: TcxEditRepositoryLookupComboBoxItem;
    Lista_TipoCartao: TcxEditRepositoryLookupComboBoxItem;
    ListaTipoRegistroHoraCerta: TcxEditRepositoryImageComboBoxItem;
    ListaTipoRegistro: TcxEditRepositoryImageComboBoxItem;
    sqlG_TB_DocumentoTipoDESCRICAO_SIMPLIFICADA: TStringField;
    sqlPaisEstrangeiro: TI9Query;
    dtsPaisEstrangeiro: TDataSource;
    Lista_IBGE_Pais_Estrangeiro: TcxEditRepositoryLookupComboBoxItem;
    sqlPaisEstrangeiroIBGE_PAIS_ID: TBCDField;
    sqlPaisEstrangeiroDESCRICAO: TStringField;
    listaG_TB_Profissao_Fixo: TcxEditRepositoryLookupComboBoxItem;
    ListaG_TB_Orgao_Expedidor: TcxEditRepositoryLookupComboBoxItem;
    sqlG_TB_Orgao_Expedidor: TI9Query;
    dtsG_TB_Orgao_Expedidor: TDataSource;
    sqlG_TB_Orgao_ExpedidorORGAO: TStringField;
    sqlG_TB_Orgao_ExpedidorDESCRICAO: TStringField;
    sqlG_TB_Orgao_ExpedidorSTATUS: TStringField;
    Combo_Sexo_Animal: TcxEditRepositoryImageComboBoxItem;
    sqlTipoCartaoDESCRICAO: TStringField;
    sqlTipoCartaoPERCENTUAL: TBCDField;
    sqlTipoCartaoSITUACAO: TStringField;
    sqlTipoCartaoTIPO_CARTAO_ID: TBCDField;
    sqlTipoCartaoQTD_PARCELA: TBCDField;
    Combo_Tipo_OS_Todos: TcxEditRepositoryImageComboBoxItem;
    Combo_GrupoCampoObrigatorio: TcxEditRepositoryImageComboBoxItem;
    Combo_Tipo_OS_Imagem: TcxEditRepositoryImageComboBoxItem;
    sqlTipoCartaoTIPO: TStringField;
    sqlG_TB_DocumentoTipoPrincipal: TI9Query;
    FMTBCDField6: TBCDField;
    StringField9: TStringField;
    BlobField1: TBlobField;
    StringField10: TStringField;
    StringField11: TStringField;
    dtsG_TB_DocumentoTipoPrincipal: TDataSource;
    dtsG_TB_DocumentoTipoOutros: TDataSource;
    sqlG_TB_DocumentoTiposOutros: TI9Query;
    FMTBCDField7: TBCDField;
    StringField12: TStringField;
    BlobField2: TBlobField;
    StringField13: TStringField;
    StringField14: TStringField;
    listaG_TB_DocumentoTipoPrincipal: TcxEditRepositoryLookupComboBoxItem;
    listaG_TB_DocumentoTipoOutros: TcxEditRepositoryLookupComboBoxItem;
    Formata_FoneSemDDD8: TcxEditRepositoryMaskItem;
    Formata_FoneSemDDD9: TcxEditRepositoryMaskItem;
    dtsUsuariosTodos: TDataSource;
    sqlUsuariosTodos: TI9Query;
    sqlUsuariosTodosUSUARIO_ID: TBCDField;
    sqlUsuariosTodosTROCARSENHA: TStringField;
    sqlUsuariosTodosLOGIN: TStringField;
    sqlUsuariosTodosSENHA: TStringField;
    sqlUsuariosTodosSITUACAO: TStringField;
    sqlUsuariosTodosNOME_COMPLETO: TStringField;
    sqlUsuariosTodosFUNCAO: TStringField;
    sqlUsuariosTodosASSINA: TStringField;
    sqlUsuariosTodosFOTO: TBlobField;
    Lista_UsuariosTodos: TcxEditRepositoryLookupComboBoxItem;
    Combo_SimNaoSimples: TcxEditRepositoryImageComboBoxItem;
    sqlG_TB_ProfissaoTB_PROFISSAO_ID: TBCDField;
    sqlG_TB_ProfissaoDESCRICAO: TStringField;
    sqlG_TB_ProfissaoSITUACAO: TStringField;
    sqlG_TB_ProfissaoCODIGO_CBO: TStringField;
    sqlConfiguracaoSalvaCONFIGURACAO_SALVA_ID: TBCDField;
    sqlConfiguracaoSalvaLOCAL: TStringField;
    sqlConfiguracaoSalvaDESCRICAO: TStringField;
    sqlConfiguracaoSalvaVALOR: TStringField;
    sqlConfiguracaoSalvaSISTEMA_ID: TBCDField;
    sqlConfiguracaoSalvaORDEM: TStringField;
    Combo_SimNaoNulo: TcxEditRepositoryImageComboBoxItem;
    ListaTipoRegistroCompleto: TcxEditRepositoryImageComboBoxItem;
    ListaTipoRegistroPosseLegal: TcxEditRepositoryImageComboBoxItem;
    sqlPlanilhaRegistroDiario: TI9Query;
    dtsPlanilhaRegistroDiario: TDataSource;
    sqlPlanilhaRegistroDiarioCONTROLE_ID: TBCDField;
    sqlPlanilhaRegistroDiarioMES: TSmallintField;
    sqlPlanilhaRegistroDiarioANO: TSmallintField;
    Lista_Planilha_Registro_Diario: TcxEditRepositoryLookupComboBoxItem;
    Combo_SubTipoAtoSeloDigital_AL: TcxEditRepositoryImageComboBoxItem;
    Combo_CodigoTipoSeloDigital_AL: TcxEditRepositoryImageComboBoxItem;
    Combo_TipoSeloDigital_AL: TcxEditRepositoryImageComboBoxItem;
    listaG_TB_DocumentoTipoDesc: TcxEditRepositoryLookupComboBoxItem;
    Combo_SubTipoAtoRegistroRTD_AL: TcxEditRepositoryImageComboBoxItem;
    Combo_SubTipoAtoRegistroRPJ_AL: TcxEditRepositoryImageComboBoxItem;
    Combo_SubTipoAtoAverbacaoRTD_AL: TcxEditRepositoryImageComboBoxItem;
    Combo_SubTipoAtoAverbacaoRPJ_AL: TcxEditRepositoryImageComboBoxItem;
    Combo_SubTipoAtoCertidao_AL: TcxEditRepositoryImageComboBoxItem;
    sqlUsuariosAtivos: TI9Query;
    BCDField1: TBCDField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    StringField21: TStringField;
    dtsUsuariosAtivos: TDataSource;
    Lista_UsuariosAtivos: TcxEditRepositoryLookupComboBoxItem;
    Combo_StatusSolicitacaoSelos: TcxEditRepositoryImageComboBoxItem;
    Combo_ModoDeExecucao: TcxEditRepositoryImageComboBoxItem;
    Combo_SubTipoAtoNotarial_AL: TcxEditRepositoryImageComboBoxItem;
    Combo_GrupoCampoObrigatorioValidacao: TcxEditRepositoryImageComboBoxItem;
    Lista_UsuariosTodosNomeCompleto: TcxEditRepositoryLookupComboBoxItem;
    sqlG_TB_Modalidade: TI9Query;
    dtsG_TB_Modalidade: TDataSource;
    sqlG_TB_ModalidadeTB_MODALIDADE_ID: TBCDField;
    sqlG_TB_ModalidadeSITUACAO: TStringField;
    sqlG_TB_ModalidadeDESCRICAO: TStringField;
    sqlG_TB_ModalidadeSISTEMA_ID: TBCDField;
    ListaG_TB_Modalidade: TcxEditRepositoryLookupComboBoxItem;
    Combo_TipoPeriodo: TcxEditRepositoryImageComboBoxItem;
    Combo_SituacaoTarefa: TcxEditRepositoryImageComboBoxItem;
    Combo_CoafTpEnv: TcxEditRepositoryImageComboBoxItem;
    Combo_OSSituacao: TcxEditRepositoryImageComboBoxItem;
    procedure DataModuleCreate(Sender: TObject);
  private
    Th: TAtualizarTabelas;

    vlSistemas : String;
    vlReceitasDiretoAtos, vlVersaoNova : Boolean;
    function GetValoresFundos(
      const vpValorEmolumento: Currency;
      const vpQuantidade: Integer): TListCurrency;
    procedure RefreshTabelas;
  public
    function SelecionarSistema(Sistemas, Campo: String): String;
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
    function CalcularSaldoInicial:Currency;overload;
    function CalcularSaldoInicial(vpCaixaId : Integer):Currency;overload;

    function CalcularDebitosCreditos(vpTipoTransacao : String; vpCondicaoServico : string = ''):Currency; overload;
    function CalcularDebitosCreditos(vpTipoTransacao : String; vpCaixaId : Integer):Currency; overload;

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

    // Configurações Salvas
    procedure CarregarConfiguracaoSalva(vpLocal : String);
    procedure GravarConfiguracaoSalva(vpLocal, vpDescricao, vpValor, vpOrdem : Variant);
    procedure BuscarConficuracaoSalva(vpLocal, vpDescricao : String);

    // Imagem
    function VerificarPastaImagem(vpPastaImagem : string; vpNumero : Integer; vpVerificarExistencia : Boolean = False):Boolean;

    procedure UpdateSimplesTabela(vpTabela, vpCampoAtualiza, vpCondicaoExtra, vpValor, vpId : String);

    function GetFundos(
      const vpValorEmolumento: Currency;
      const vpQuantidade: Integer): TSeloFundos; overload;

    function GetFundos(
      const vpValorEmolumento: Currency;
      const vpQuantidade: Integer;
      const vpEmolumento: TEmolumento): TSeloFundos; overload;

    function GetFundos(
      const vpValorEmolumento: Currency): TSeloFundos; overload;

    function GetFundos(
      const vpValorEmolumento: Currency;
      const vpEmolumento: TEmolumento): TSeloFundos; overload;

    function GetFundoTipos: TFundoTipos; overload;

    function GetFundoTipos(
      const vpEmolumento: TEmolumento): TFundoTipos; overload;

    procedure PesquisarLivroDiarioFinanceiro(vpClientDataSet : TClientDataSet; vpProgress : TcxProgressBar;
          vpSelosInutilizados : Boolean = False; vpAtosCancelados : Boolean = False; vpDedutivel : String = '');
    procedure AtualizarProgress(vpInicio : Boolean; vpDescricao : String; vpProgress : TcxProgressBar);

    function SetCapacidadaCivil(vpData : Variant):Integer;
  end;

var
  dtmLookup: TdtmLookup;
  ExecAtualizar: TExecuteProc;
  vgLivroDiario : TLivroDiario;
  vgLivroDiaPesquisa : TLivroDiarioPesquisa;
  vgFechamentoCaixa  : TCaixaFechamento;
  vgCaixaControle    : TCaixaControle;
  vgDadosCadastro    : TDadosCadastro;
  vgDadosImagem      : TImagem;

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

procedure TdtmLookup.AtualizarProgress(vpInicio: Boolean; vpDescricao: String;
  vpProgress: TcxProgressBar);
begin
  if vpInicio then
  begin
    vpProgress.Properties.Max  := dtmControles.SimpleAuxiliar.RecordCount;
    vpProgress.Properties.Text := vpDescricao;
    vpProgress.Position := 0;
  end
  else
  begin
    Application.ProcessMessages;
    vpProgress.Position := vpProgress.Position + 1;
  end;
end;

procedure TdtmLookup.AtualizarTabelas;
begin
  DBApplication.ProcessMessages;
  Th := TAtualizarTabelas.Create (true);  // start
  th.FreeOnTerminate:= true;
  th.Start;
end;

procedure TdtmLookup.RefreshTabelas;
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
  sqlPaisEstrangeiro.Refresh;
  sqlG_TB_Orgao_Expedidor.Refresh;
  sqlG_TB_DocumentoTipoPrincipal.Refresh;
  sqlG_TB_DocumentoTiposOutros.Refresh;
  sqlUsuariosTodos.Refresh;
  sqlPlanilhaRegistroDiario.Refresh;
  sqlG_TB_Modalidade.Refresh;
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
      Application.MessageBox('Tipo Inválido!!!', 'Atenção',
        MB_OK + MB_ICONWARNING);

    if VerificarTipo(vpValor) then
    begin
      Application.MessageBox('Tipo ja Cadastrado!!!', 'Atenção',
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

  ExecAtualizar;
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
    //ExecAtualizar;
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
    Result := Arredondamento(dtmControles.MetodoArredondamento,dtmControles.GetFloat(viSql),2);
  end
  else
  begin
    viEntradas := dtmControles.GetFloat(viSql + ' AND OPERACAO = '+QuotedStr('E'));
    viSaidas   := dtmControles.GetFloat(viSql + ' AND OPERACAO = '+QuotedStr('R'));
    Result     := Arredondamento(dtmControles.MetodoArredondamento,(viEntradas - viSaidas),2);
  end;

end;

function TdtmLookup.CalcularDebitosCreditos(vpTipoTransacao : String; vpCondicaoServico : string = ''):Currency;
var
  viSql : String;
begin
  viSql := ' SELECT SUM(VALOR_PAGO) ' +
           ' FROM C_CAIXA_ITEM '+
           ' WHERE (TIPO_TRANSACAO = '+ QuotedStr(vpTipoTransacao);
  if vpTipoTransacao= 'C' then
        viSql := viSql + ' AND VALOR_PAGO > 0)'
  else viSql := viSql + ' OR VALOR_PAGO < 0)';

  if vpCondicaoServico <> '' then
    viSql := viSql + vpCondicaoServico;

  viSql := viSql +
         '    AND (SITUACAO = ''4'') '+ vgFechamentoCaixa.Condicao +
         '    AND DATA_PAGAMENTO '+MontarSqlData(vgFechamentoCaixa.Data1 ,vgFechamentoCaixa.Data2);
  Result := dtmControles.GetFloat(viSql);
end;

function TdtmLookup.CalcularDebitosCreditos(vpTipoTransacao : String; vpCaixaId : integer):Currency;
var
  viSql : String;
begin
  viSql := ' SELECT SUM(VALOR_RECIBO) ' +
           ' FROM C_RECIBO R1 '+
           ' WHERE OS_TRANSACAO = '+ QuotedStr(vpTipoTransacao)+
           '   AND SITUACAO = '+QuotedStr('A')+
           '    AND DATA >= ' + QuotedStr(dtmControles.DataParaString(vgFechamentoCaixa.Data1))+
           '    AND DATA <= ' + QuotedStr(dtmControles.DataParaString(vgFechamentoCaixa.Data2))+
           '    AND EXISTS ( SELECT 1 FROM C_CAIXA_ITEM C WHERE C.RECIBO_ID = R1.RECIBO_ID '+
           '                 AND C.SITUACAO = ''4'' '+
           '                 AND C.CAIXA_ID = '+vpCaixaId.ToString+')';
  Result := dtmControles.GetFloat(viSql);
end;

function TdtmLookup.CalcularSaldoInicial : Currency;
begin
  ExecutaSqlAuxiliar(' SELECT SUM(VALOR_PRIMEIRO + COALESCE(VALOR_SEGUNDO,0)) AS VALOR ' +
                     ' FROM C_CAIXA_ITEM '+
                     '  WHERE TIPO_TRANSACAO = '+QuotedStr('C')+
                     '    AND VALOR_PAGO > 0' +
                     '    AND ((SITUACAO = ''1'') OR (SITUACAO = ''2''))'+ vgFechamentoCaixa.Condicao +
                     '    AND DATA_PAGAMENTO >= ' + QuotedStr(dtmControles.DataParaString(vgFechamentoCaixa.Data1))+
                     '    AND DATA_PAGAMENTO <= ' + QuotedStr(dtmControles.DataParaString(vgFechamentoCaixa.Data2)),0);
  Result := dtmControles.sqlAuxiliar.FieldByName('VALOR').AsCurrency;
end;

function TdtmLookup.CalcularSaldoInicial(vpCaixaId: Integer): Currency;
begin
  ExecutaSqlAuxiliar(' SELECT VALOR_PAGO ' +
                     ' FROM C_CAIXA_ITEM '+
                     '  WHERE TIPO_TRANSACAO = '+QuotedStr('C')+
                     '    AND VALOR_PAGO > 0' +
                     '    AND ((SITUACAO = ''1'') OR (SITUACAO = ''2''))'+
                     '    AND CAIXA_ID = '+vpCaixaId.ToString+
                     '    AND DATA_PAGAMENTO '+MontarSqlData(vgFechamentoCaixa.Data1 ,vgFechamentoCaixa.Data2),0);
  Result := dtmControles.sqlAuxiliar.FieldByName('VALOR_PAGO').AsCurrency;
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

      if CharInSet(vpEspecie[1],['D', 'C', 'O', 'B']) then
        viSql := viSql + '    AND ((SITUACAO = ''4'') OR (SITUACAO = ''1'') OR (SITUACAO = ''2'') OR (SITUACAO = ''12'') OR (SITUACAO = ''9'') OR (SITUACAO = ''10''))'+
                         '    AND '+vpCampoEspecie+' = '+QuotedStr(vpEspecie)
      else
        case vpEspecie[1] of
          'M' : viSql := viSql + ' AND ((SITUACAO = ''6'') OR ((SITUACAO = ''10'') AND ('+vpCampoEspecie+' <> '+ QuotedStr('')+')))';
          'S' : viSql := viSql + ' AND ((SITUACAO = ''7'') OR (SITUACAO = ''11''))';
          '7' : viSql := viSql + ' AND (SITUACAO = ''7'')';
          'T' : viSql := viSql + ' AND (((SITUACAO = ''9'') OR (((SITUACAO = ''4'') OR (SITUACAO = ''10'')) and ('+vpCampoEspecie+' ='+QuotedStr(vpEspecie)+')))'+
                                 ' OR (((SITUACAO = ''10'') OR (SITUACAO = ''11'')) AND ('+vpCampoEspecie+' = '+ QuotedStr('')+')))';
//          'T' : viSql := viSql + ' AND ((SITUACAO = ''9'') OR (((SITUACAO = ''10'') OR (SITUACAO = ''11'')) AND (ESPECIE_PAGAMENTO = '+ QuotedStr('')+')))';
        end;

      viSql := viSql + vpCondicao +
                    '    AND DATA_PAGAMENTO >= ' + QuotedStr(dtmControles.DataParaString(viData1))+
                    '    AND DATA_PAGAMENTO <= ' + QuotedStr(dtmControles.DataParaString(viData2));

      ExecutaSqlAuxiliar(viSql,0);
      Result := Arredondamento(dtmControles.MetodoArredondamento,dtmControles.sqlAuxiliar.FieldByName('VALOR').AsCurrency,2);
      dtmControles.sqlAuxiliar.Close;
    end;
  begin
    viValorPrimeiro := 0;

    if (CharInSet(vpTipoCaixa[1],['2','3'])) and (CharInSet(vpEspecie[1],['D', 'C', 'T', 'O', 'B'])) then
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
       viCredito := Arredondamento(dtmControles.MetodoArredondamento,RealizarCalculo('D'),2)
  else viCredito := Arredondamento(dtmControles.MetodoArredondamento,RealizarCalculo('C'),2);

  if vpDeduzirDebitos then
       viDebito := Arredondamento(dtmControles.MetodoArredondamento,RealizarCalculo('D'),2)
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
    dtmLookup.CarregarIcxComboBox('2', 'Registro de Imóveis', vpLista);
  if pos('3', viSistemas) > 0 then
    dtmLookup.CarregarIcxComboBox('3', 'Registro Civil', vpLista);
  if pos('4', viSistemas) > 0 then
    dtmLookup.CarregarIcxComboBox('4', 'RTD & Pessoa Jurídica', vpLista);
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
    dtmLookup.CarregarIcxComboBoxDB('2', 'Registro de Imóveis', vpLista);
  if pos('3', viSistemas) > 0 then
    dtmLookup.CarregarIcxComboBoxDB('3', 'Registro Civil', vpLista);
  if pos('4', viSistemas) > 0 then
    dtmLookup.CarregarIcxComboBoxDB('4', 'RTD & Pessoa Jurídica', vpLista);
  if pos('5', viSistemas) > 0 then
    dtmLookup.CarregarIcxComboBoxDB('5', 'Protesto', vpLista);
  if pos('6', viSistemas) > 0 then
    dtmLookup.CarregarIcxComboBoxDB('6', 'Administrativo', vpLista);
  if pos('7', viSistemas) > 0 then
    dtmLookup.CarregarIcxComboBoxDB('7', 'Financeiro', vpLista);
  if pos('8', viSistemas) > 0 then
    dtmLookup.CarregarIcxComboBoxDB('8', 'Caixa', vpLista);

  if vpTodos then
    dtmLookup.CarregarIcxComboBoxDB('9', 'Geral', vpLista);

  vpLista.ItemIndex := 0;
end;



procedure TdtmLookup.DataModuleCreate(Sender: TObject);
var
  viTipoCartorio, viSql : String;
begin
  sqlG_Banco.Connection                     := dtmControles.DB;
  sqlG_TB_DocumentoTipo.Connection          := dtmControles.DB;
  sqlG_TB_EstadoCivil.Connection            := dtmControles.DB;
  sqlG_TB_Profissao.Connection              := dtmControles.DB;
  sqlG_TB_RegimeComunhao.Connection         := dtmControles.DB;
  sqlG_TB_TipoLogradouro.Connection         := dtmControles.DB;
  sqlG_TB_TxModeloGrupo.Connection          := dtmControles.DB;
  sqlG_Natureza_Titulo.Connection           := dtmControles.DB;
  sqlG_Emolumento.Connection                := dtmControles.DB;
  sqlG_Emolumento_Periodo.Connection        := dtmControles.DB;
  sqlG_Emolumento_PeriodoAtivos.Connection  := dtmControles.DB;
  sqlG_Medida_Tipo.Connection               := dtmControles.DB;
  sqlG_TB_Bairro.Connection                 := dtmControles.DB;
  sqlG_Usuario.Connection                   := dtmControles.DB;
  sqlG_Natureza.Connection                  := dtmControles.DB;
  sqlUsuarioSistema.Connection              := dtmControles.DB;
  sqlUsuarioAssinante.Connection            := dtmControles.DB;
  sqlC_Caixa_Servico.Connection             := dtmControles.DB;
  sqlSeloGrupo.Connection                   := dtmControles.DB;
  sqlSeloTipoCartorio.Connection            := dtmControles.DB;
  sqlMunicipioIBGE.Connection               := dtmControles.DB;
  sqlPaisIBGE.Connection                    := dtmControles.DB;
  sqlRegineBens.Connection                  := dtmControles.DB;
  sqlCaixaServicoTodos.Connection           := dtmControles.DB;
  sqlEmailTextoPadrao.Connection            := dtmControles.DB;
  sqlSistema.Connection                     := dtmControles.DB;
  sqlProvimentoEsferaNivel.Connection       := dtmControles.DB;
  sqlProvimentoOrigem.Connection            := dtmControles.DB;
  sqlProvimentoTipo.Connection              := dtmControles.DB;
  sqlEmolumentoTodos.Connection             := dtmControles.DB;
  sqlNaturezaTituloTodos.Connection         := dtmControles.DB;
  sqlR_TB_Tipo_Andamento.Connection         := dtmControles.DB;
  sqlConfiguracaoSalva.Connection           := dtmControles.DB;
  sqlConfiguracaoDados.Connection           := dtmControles.DB;
  sqlMensalista.Connection                  := dtmControles.DB;
  sqlContaCliente.Connection                := dtmControles.DB;
  sqlContaClienteAtiva.Connection           := dtmControles.DB;
  sqlTipoCartao.Connection                  := dtmControles.DB;
  sqlPaisEstrangeiro.Connection             := dtmControles.DB;
  sqlG_TB_Orgao_Expedidor.Connection        := dtmControles.DB;
  sqlG_TB_DocumentoTipoPrincipal.Connection := dtmControles.DB;
  sqlG_TB_DocumentoTiposOutros.Connection   := dtmControles.DB;
  sqlUsuariosTodos.Connection               := dtmControles.DB;
  sqlPlanilhaRegistroDiario.Connection      := dtmControles.DB;
  sqlUsuariosAtivos.Connection              := dtmControles.DB;
  sqlG_TB_Modalidade.Connection             := dtmControles.DB;

  sqlG_Banco.Open;
  sqlUsuariosAtivos.Open;
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
  sqlPaisEstrangeiro.Open;
  sqlG_TB_Orgao_Expedidor.Open;
  sqlG_TB_DocumentoTipoPrincipal.Open;
  sqlG_TB_DocumentoTiposOutros.Open;
  sqlUsuariosTodos.Open;
  sqlPlanilhaRegistroDiario.Open;

  if vgId in [1,2,5,7,12,13,15,20] then
       viTipoCartorio := dtmControles.BuscarConfig('PRINCIPAL', 'CARTORIO', 'TIPO_CARTORIO', 'S')
  else viTipoCartorio := '0';
  sqlSeloGrupo.Close;
  viSql := ' SELECT * '+
           ' FROM G_SELO_GRUPO ';
  if viTipoCartorio <> '' then
    viSql := viSql + ' WHERE (TIPO_CARTORIO IS NULL OR '+
                     '      TIPO_CARTORIO IN('+viTipoCartorio+',6))';
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

  sqlG_TB_Modalidade.Close;
  sqlG_TB_Modalidade.Params.ParamByName('SISTEMA_ID').AsCurrency := vgId;
  sqlG_TB_Modalidade.Open;

  sqlG_Emolumento_Periodo.Open;
  sqlG_Emolumento_PeriodoAtivos.Open;

  vlSistemas           := dtmControles.BuscarParametroOutroSistema('SISTEMAS_ATO_PRATICADO','GERAL','ATO_PRATICADO', '5');
  vlReceitasDiretoAtos := dtmControles.BuscarParametroOutroSistema('RECEITAS_ATOS_DIRETO','DADOS','REGISTRO_DIARIO', '5') = 'S';
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

function TdtmLookup.GetFundos(
  const vpValorEmolumento: Currency;
  const vpQuantidade: Integer): TSeloFundos;
var
  viValoresFundos: TListCurrency;
begin
  viValoresFundos := GetValoresFundos(
    vpValorEmolumento,
    vpQuantidade);

  try
    Result := TCalculadoraSeloFundos.Get(
      viValoresFundos,
      GetFundoTipos,
      0,
      Controles.vgUF,
      Controles.vgId);
  finally
    FreeAndNil(viValoresFundos);
  end;
end;

function TdtmLookup.GetFundos(
  const vpValorEmolumento: Currency;
  const vpQuantidade: Integer;
  const vpEmolumento: TEmolumento): TSeloFundos;
var
  viValoresFundos: TListCurrency;
  viFundoTipoList: TFundoTipos;
begin
  viValoresFundos := GetValoresFundos(
    vpValorEmolumento,
    vpQuantidade);

  viFundoTipoList := GetFundoTipos(
    vpEmolumento);

  try
    Result := TCalculadoraSeloFundos.Get(
      viValoresFundos,
      viFundoTipoList,
      0,
      Controles.vgUf,
      Controles.vgId);
  finally
    FreeAndNil(viValoresFundos);
    FreeAndNil(viFundoTipoList);
  end;
end;

function TdtmLookup.GetFundos(
  const vpValorEmolumento: Currency): TSeloFundos;
begin
  Result := GetFundos(vpValorEmolumento, 1);
end;

function TdtmLookup.GetFundos(
  const vpValorEmolumento: Currency;
  const vpEmolumento: TEmolumento): TSeloFundos;
begin
  Result := GetFundos(vpValorEmolumento, 1, vpEmolumento);
end;

function TdtmLookup.GetFundoTipos: TFundoTipos;
begin
  Result := Controles.vgFundoTipos;
end;

function TdtmLookup.GetFundoTipos(
  const vpEmolumento: TEmolumento): TFundoTipos;
begin
  Result := TConfiguradorFundo.RemoverExcludentes(
    GetFundoTipos,
    vpEmolumento);
end;

function TdtmLookup.GetValoresFundos(const vpValorEmolumento: Currency;
  const vpQuantidade: Integer): TListCurrency;
begin
  Result := RetornarListCurrency(vpValorEmolumento, vpQuantidade);
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

    if vgEmailConfig.TextoEmail <> nil then
      FreeAndNil(vgEmailConfig.TextoEmail);
    if vgEmailConfig.TextoRodape <> nil then
      FreeAndNil(vgEmailConfig.TextoRodape);

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

procedure TdtmLookup.PesquisarLivroDiarioFinanceiro(vpClientDataSet : TClientDataSet; vpProgress : TcxProgressBar;
          vpSelosInutilizados : Boolean = False; vpAtosCancelados : Boolean = False; vpDedutivel : String = '');
var
  viSql : String;
  viDataInicial, viDataFinal  : String;
  viRegSequencia, viRegNatureza, viRegProtocolo, viRegEmolumento : Currency;
  vlProtestoTituloAgrupado : Boolean; 

  {$REGION 'PESQUISAR LIVRO DIÁRIO REGISTRO DE IMOVEIS'}
  procedure PesquisarLivroDiarioRI(vpTipo, vpPesquisa, vpSistema : String; vpAgrupado : Boolean = False);
  var
    viCampos : String;
    viCancelado : TStringList;

    {$REGION 'MONTAR SQL LIVRO DIÁRIO DO REGISTRO DE IMOVEIS'}
    procedure MontarvpClientDataSetRI;
    begin
      if vpPesquisa = '3' then
      begin
        viCampos := ' SELECT CAST(SL.DATA AS DATE) AS DATA, ';

        if not vpAgrupado then
          viCampos := viCampos +  '    PR.NUMERO_ORDEM AS DOCUMENTO, ';

        viCampos := viCampos +
                    '  COALESCE(SUM(SL.VALOR_EMOLUMENTO),0) AS VALOR_EMOLUMENT0, '+
                    '           NT.DESCRICAO AS NATUREZA_PRINCIPAL, '+
                    '           COUNT(SL.SELO_LIVRO_ID) AS QTD '+
                    ' FROM G_SELO_LIVRO SL '+
                    ' LEFT JOIN R_PEDIDO_ITEM_NUMERO PIN ON '+
                    ' SL.CAMPO_ID = PIN.PEDIDO_ITEM_NUMERO_ID '+
                    ' AND SL.TABELA = '+ QuotedStr('R_PEDIDO_ITEM_NUMERO')+
                    ' LEFT JOIN R_PEDIDO_ITEM PI ON '+
                    ' PIN.PEDIDO_ITEM_ID = PI.PEDIDO_ITEM_ID '+
                    '   LEFT JOIN R_PEDIDO PE ON '+
                    '   PI.PEDIDO_ID = PE.PEDIDO_ID '+
                    '   LEFT JOIN G_NATUREZA_TITULO NT ON '+
                    '   PI.NATUREZA_TITULO_ID = NT.NATUREZA_TITULO_ID '+
                    '   LEFT JOIN R_PROTOCOLO PR ON '+
                    '   PE.PEDIDO_ID = PR.PEDIDO_ID ';
      end
      else
        viCampos := ' SELECT CAST(SL.DATA AS DATE) AS DATA, '+
                    '       PR.NUMERO_ORDEM AS DOCUMENTO, '+
                    '       SUM(SL.VALOR_EMOLUMENTO) AS VALOR_EMOLUMENT0, '+
                    '       PE.PEDIDO_ID,'+
                    '       COUNT(SL.SELO_LIVRO_ID) AS QTD, '+
                    '   CASE PR.TIPO_PROTOCOLO '+
                    '      WHEN ''1'' THEN T.DESCRICAO '+
                    '    ELSE NT.DESCRICAO '+
                    '   END AS NATUREZA_PRINCIPAL '+
                    ' FROM G_SELO_LIVRO SL  '+
                    ' LEFT JOIN R_PEDIDO_ITEM PI ON  '+
                    ' SL.CAMPO_ID = PI.PEDIDO_ITEM_ID  '+
                    ' AND SL.TABELA = '+ QuotedStr('R_PEDIDO_ITEM')+
                    '   LEFT JOIN R_PEDIDO PE ON '+
                    '   PI.PEDIDO_ID = PE.PEDIDO_ID '+
                    '   LEFT JOIN R_PROTOCOLO PR ON '+
                    '   PE.PEDIDO_ID = PR.PEDIDO_ID '+
                    '   LEFT JOIN G_NATUREZA_TITULO NT ON '+
                    '   PI.NATUREZA_TITULO_ID = NT.NATUREZA_TITULO_ID '+
                    '   LEFT JOIN R_TB_TITULO T ON '+
                    '   PE.TB_TITULO_ID = T.TB_TITULO_ID ';

      viSql := viCampos + ' WHERE  (PR.TIPO_PROTOCOLO IN('+vpTipo+'))'+
              ' AND (PI.EXCLUI_DO_RELATORIO <> ''S'' OR PI.EXCLUI_DO_RELATORIO IS NULL) '+
              ' AND SL.DATA ' + Controles.MontarSqlData(StrToDate(vgLivroDiaPesquisa.DataInicial),StrToDate(vgLivroDiaPesquisa.DataFinal))+
              ' AND SL.SELO_SITUACAO_ID = 2';

      if vpPesquisa = '3' then
      begin
        if not vpAgrupado then
          viSql := viSql +
                    ' GROUP BY DATA, DOCUMENTO, NATUREZA_PRINCIPAL  '+
                    ' HAVING SUM(SL.VALOR_EMOLUMENTO) > 0 '+
                    ' ORDER BY DATA, DOCUMENTO, NATUREZA_PRINCIPAL '
        else
          viSql := viSql +
                    ' GROUP BY DATA, NATUREZA_PRINCIPAL  '+
                    ' HAVING SUM(SL.VALOR_EMOLUMENTO) > 0 '+
                    ' ORDER BY DATA, NATUREZA_PRINCIPAL '
      end
      else
        viSql := viSql +
                    ' GROUP BY DATA, PR.NUMERO_ORDEM, NATUREZA_PRINCIPAL, PE.PEDIDO_ID '+
                    ' HAVING SUM(SL.VALOR_EMOLUMENTO) > 0 '+
                    ' ORDER BY DATA, PR.NUMERO_ORDEM ';

      ExecutaSimpleDSAux(viSql, 0);
    end;
   {$ENDREGION}

    {$REGION 'Buscar Lista de Matricula'}
    Function PegarListaMatriculas(vpProtocoloId : string; vpCampoPesquisa : String):string;
    var
      viTexto : String;
      viNumero : Currency;
    begin
      ExecutaSqlAuxiliar(' SELECT PIN.'+ vpCampoPesquisa+', PIN.NUMERO '+
                         '  FROM R_PEDIDO P '+
                         '    INNER JOIN R_PEDIDO_ITEM PI '+
                         '    ON P.PEDIDO_ID = PI.PEDIDO_ID '+
                         '    INNER JOIN R_PEDIDO_ITEM_NUMERO PIN '+
                         '    ON PI.PEDIDO_ITEM_ID = PIN.PEDIDO_ITEM_ID '+
                         '    INNER JOIN R_PROTOCOLO PR '+
                         '    ON P.PEDIDO_ID = PR.PEDIDO_ID '+
                         '  WHERE PR.NUMERO_ORDEM = '+ vpProtocoloId +
                         '   AND PIN.'+ vpCampoPesquisa + ' IS NOT NULL '+
                         '   AND PIN.NUMERO IS NOT NULL'+
                         ' GROUP BY PIN.'+vpCampoPesquisa+', PIN.NUMERO',0);
      while not dtmControles.sqlAuxiliar.Eof do
      begin
        viNumero := dtmControles.sqlAuxiliar.FieldByName('NUMERO').AsCurrency;
        if dtmControles.sqlAuxiliar.FieldByName(vpCampoPesquisa).AsString = '' then
          viTexto := viTexto + FormatFloat('###,###', viNumero)+' '
        else
          case dtmControles.sqlAuxiliar.FieldByName(vpCampoPesquisa).AsString[1] OF
            'M' : viTexto := viTexto + 'M. '+FormatFloat('###,###', viNumero)+'; ';
            'R' : viTexto := viTexto + 'R. '+FormatFloat('###,###', viNumero)+'; ';
            'A' : begin
                    if vpCampoPesquisa = 'PIN.ATO_TIPO' then
                         viTexto := viTexto + 'Av. '+FormatFloat('###,###', viNumero)+'; '
                    else viTexto := viTexto + 'R.Aux. '+FormatFloat('###,###', viNumero)+'; ';
                  end;
            'S' : viTexto := viTexto + 'R.Aux. '+FormatFloat('###,###', viNumero)+'; ';
          end;
        dtmControles.sqlAuxiliar.Next;
      end;
      dtmControles.sqlAuxiliar.Active := False;
      Result := viTexto;
    end;
    {$ENDREGION}

  begin
    MontarvpClientDataSetRI;
    with dtmControles.SimpleAuxiliar do
    begin
      First;
      AtualizarProgress(True, 'Carregando '+vpSistema, vpProgress);

      viRegSequencia     := 0;
      viRegNatureza      := 0;
      viRegProtocolo     := 0;
      viRegEmolumento    := 0;

      while not eof do
      begin
        try
          vpClientDataSet.Append;
          vpClientDataSet.FieldByName('DATA').AsDateTime             := FieldByName('DATA').AsDateTime;
          if not vpAgrupado then
            vpClientDataSet.FieldByName('DOCUMENTO').AsString        := FormatFloat('###,###', FieldByName('DOCUMENTO').AsCurrency);

          vpClientDataSet.FieldByName('PLANO_CONTA').AsString        := vpSistema;
          vpClientDataSet.FieldByName('VALOR_ENTRADA').AsCurrency    := FieldByName('VALOR_EMOLUMENT0').AsCurrency;
          vpClientDataSet.FieldByName('OPERACAO').AsString           := 'RECEITAS REGISTRO DE IMÓVEIS';

          if vpPesquisa = '3' then
          begin
            vpClientDataSet.FieldByName('SERVICO_REFERENCIA').AsString := FieldByName('NATUREZA_PRINCIPAL').AsString;
            vpClientDataSet.FieldByName('QTD_FAVORECIDO').AsString     := FieldByName('QTD').AsString;
          end
          else
          begin
            viCancelado := dtmControles.GetFields(' SELECT TIPO, TA.DESCRICAO FROM R_ANDAMENTO A '+
                                                  '   LEFT JOIN R_TB_TIPO_ANDAMENTO TA ON '+
                                                  '   A.TB_TIPO_ANDAMENTO_ID = TA.TB_TIPO_ANDAMENTO_ID '+
                                                  ' WHERE TA.TIPO = ''C'''+
                                                  '   AND A.PEDIDO_ID = '+FieldByName('PEDIDO_ID').AsString);
            try
              if viCancelado.Values['TIPO'] <> '' then
              begin
                vpClientDataSet.FieldByName('SERVICO_REFERENCIA').AsString := 'Protocolo e Busca';
                vpClientDataSet.FieldByName('QTD_FAVORECIDO').AsString     := viCancelado.Values['DESCRICAO'];
              end
              else
              begin
                vpClientDataSet.FieldByName('SERVICO_REFERENCIA').AsString := FieldByName('NATUREZA_PRINCIPAL').AsString;

                if vpPesquisa = '1' then
                     vpClientDataSet.FieldByName('QTD_FAVORECIDO').AsString := PegarListaMatriculas(FieldByName('DOCUMENTO').AsString, 'ATO_TIPO')
                else vpClientDataSet.FieldByName('QTD_FAVORECIDO').AsString := FieldByName('QTD').AsString;
              end;
            finally
              FreeAndNil(viCancelado);
            end
          end;

          vpClientDataSet.Post;
          AtualizarProgress(False,'', vpProgress);
          Next;
        except on E: Exception do
          begin
            Application.MessageBox(Pchar('Falha na pesquisa! ' + FieldByName('PEDIDO_ID').AsString +' - '+ E.Message),
              'Falha', MB_OK + MB_ICONWARNING);
            Next;
          end;
        end;
      end;
    end;
  end;
  {$ENDREGION}

  {$REGION 'PESQUISAR LIVRO DIARIO TABELIONATO DE NOTAS'}
  procedure PesquisarLivroDiarioNotas(vpTipo : String);
    procedure MontarSqlNotasBalcao;
    begin
      viSql := ' SELECT SUM(SL.VALOR_EMOLUMENTO) AS VALOR_EMOLUMENT0, '+
               '        STI.DESCRICAO AS NATUREZA_PRINCIPAL, '+
               '        COUNT(SL.SELO_LIVRO_ID) AS QTD, '+
               '        CAST(SL.DATA AS DATE) AS DATA '+
               ' FROM G_SELO_LIVRO SL '+
               '   LEFT OUTER JOIN T_SERVICO_ITEMPEDIDO SI ON '+
               '   SL.CAMPO_ID = SI.SERVICO_ITEMPEDIDO_ID '+
               '   AND SL.TABELA = '+QuotedStr('T_SERVICO_ITEMPEDIDO') +
               '   LEFT JOIN T_SERVICO_PEDIDO SP ON '+
               '   SI.SERVICO_PEDIDO_ID = SP.SERVICO_PEDIDO_ID '+
               '   LEFT OUTER JOIN T_SERVICO_TIPO STI ON '+
               '   SI.SERVICO_TIPO_ID = STI.SERVICO_TIPO_ID '+
               '   LEFT OUTER JOIN C_CAIXA_SERVICO CS ON '+
               '   STI.SERVICO_CAIXA_ID = CS.CAIXA_SERVICO_ID '+
               ' WHERE SL.DATA ' + Controles.MontarSqlData(StrToDate(vgLivroDiaPesquisa.DataInicial),StrToDate(vgLivroDiaPesquisa.DataFinal))+
               '   AND SL.SELO_SITUACAO_ID = 2 '+
               '   AND SI.SITUACAO = ''F'''+
               '   AND STI.ATO_PRATICADO = ''S'''+
               ' GROUP BY DATA, NATUREZA_PRINCIPAL '+
               ' ORDER BY DATA, NATUREZA_PRINCIPAL ';
    end;

    procedure MontarSqlNotasLivro;
    begin
      viSql := ' SELECT SUM(SL.VALOR_EMOLUMENTO) AS VALOR_EMOLUMENT0, '+
               '       (GN.DESCRICAO || '' - '' || TAT.DESCRICAO) AS NATUREZA_PRINCIPAL, '+
               '       TA.FOLHA_INICIAL, TA.FOLHA_FINAL, TA.PROTOCOLO, LA.NUMERO_LIVRO, '+
               '       CAST(SL.DATA AS DATE) AS DATA '+
               '   FROM G_SELO_LIVRO SL '+
               '     LEFT OUTER JOIN T_ATO TA ON '+
               '     SL.CAMPO_ID = TA.ATO_ID '+
               '     AND SL.TABELA = ''T_ATO'''+
               '     LEFT OUTER JOIN T_ATO_TIPO TAT ON '+
               '     TA.ATO_TIPO_ID = TAT.ATO_TIPO_ID '+
               '     LEFT JOIN G_NATUREZA GN ON '+
               '     TA.NATUREZA_ID = GN.NATUREZA_ID '+
               '     LEFT JOIN T_LIVRO_ANDAMENTO LA ON '+
               '     TA.LIVRO_ANDAMENTO_ID = LA.LIVRO_ANDAMENTO_ID '+
               ' WHERE SL.DATA ' + Controles.MontarSqlData(StrToDate(vgLivroDiaPesquisa.DataInicial),StrToDate(vgLivroDiaPesquisa.DataFinal));
      if vpAtosCancelados then
           viSql := viSql + ' AND (TA.SITUACAO_ATO IN (3,4,6,7,8,9))'
      else viSql := viSql + ' AND (TA.SITUACAO_ATO IN (3,6,7,8,9))';

      viSql := viSql +
               '   AND SL.SELO_SITUACAO_ID = 2 '+
               ' GROUP BY DATA, NATUREZA_PRINCIPAL, TA.FOLHA_INICIAL, TA.FOLHA_FINAL, TA.PROTOCOLO, LA.NUMERO_LIVRO '+
               ' ORDER BY DATA, NATUREZA_PRINCIPAL ';
    end;

  begin
    if vpTipo = 'Balcão' then
         MontarSqlNotasBalcao
    else MontarSqlNotasLivro;

    ExecutaSimpleDSAux(viSql, 0);
    AtualizarProgress(True, 'Carregando Tabelionato de Notas - '+vpTipo, vpProgress);
    with dtmControles.SimpleAuxiliar do
    begin
      First;
      while not eof do
      begin
        vpClientDataSet.Append;
        vpClientDataSet.FieldByName('DATA').AsDateTime             := FieldByName('DATA').AsDateTime;
        vpClientDataSet.FieldByName('VALOR_ENTRADA').AsCurrency    := FieldByName('VALOR_EMOLUMENT0').AsCurrency;
        vpClientDataSet.FieldByName('SERVICO_REFERENCIA').AsString := FieldByName('NATUREZA_PRINCIPAL').AsString;
        vpClientDataSet.FieldByName('OPERACAO').AsString           := 'RECEITAS TABELIONATO';
        vpClientDataSet.FieldByName('PLANO_CONTA').AsString        := 'TABELIONATO DE NOTAS';
        if vpTipo = 'Atos' then
        begin
          vpClientDataSet.FieldByName('DOCUMENTO').AsString        := FormatFloat('####,###', FieldByName('PROTOCOLO').AsCurrency);
          vpClientDataSet.FieldByName('QTD_FAVORECIDO').AsString   := 'Livro '+ FieldByName('NUMERO_LIVRO').AsString + ', Folha(s) '+
                                                    FieldByName('FOLHA_INICIAL').AsString + ' a ' + FieldByName('FOLHA_FINAL').AsString;
        end
        else vpClientDataSet.FieldByName('QTD_FAVORECIDO').AsString   :=  FieldByName('QTD').AsString;
        vpClientDataSet.Post;
        AtualizarProgress(False, '', vpProgress);
        Next;
      end;
    end;
  end;
  {$ENDREGION}

  {$REGION 'PESQUISAR LIVRO DIARIO RTD'}
  procedure PesquisarLivroDiarioRTD(vpTipo : String);

    procedure MontarSqlRTDDocumentos;
    begin
      viSql := ' SELECT SUM(SL.VALOR_EMOLUMENTO) AS VALOR_EMOLUMENT0, '+
               '       TD.DESCRICAO AS NATUREZA_PRINCIPAL, '+
               '       D.LIVRO_NUMERO, D.LIVRO_PAGINA_INI, D.LIVRO_PAGINA_FIM, D.PROTOCOLO, '+
               '       CAST(SL.DATA AS DATE) AS DATA '+
               '   FROM G_SELO_LIVRO SL '+
               '     LEFT OUTER JOIN D_DOCUMENTO D ON '+
               '     SL.CAMPO_ID = D.DOCUMENTO_ID '+
               '     AND SL.TABELA = ''D_DOCUMENTO'''+
               '     LEFT JOIN D_TIPO_DOCUMENTO TD ON '+
               '     D.TIPO_DOCUMENTO_ID = TD.TIPO_DOCUMENTO_ID '+
               ' WHERE SL.DATA ' + Controles.MontarSqlData(StrToDate(vgLivroDiaPesquisa.DataInicial),StrToDate(vgLivroDiaPesquisa.DataFinal))+
               '   AND NOT D.DATA_REGISTRO IS NULL ' +
               '   AND SL.SELO_SITUACAO_ID = 2 '+
               ' GROUP BY DATA, NATUREZA_PRINCIPAL, D.PROTOCOLO, D.LIVRO_NUMERO, D.LIVRO_PAGINA_INI, D.LIVRO_PAGINA_FIM '+
               ' ORDER BY DATA, NATUREZA_PRINCIPAL ';
    end;

    procedure MontarSqlRTDCertidao;
    begin
      viSql := ' SELECT SUM(SL.VALOR_EMOLUMENTO) AS VALOR_EMOLUMENT0, '+
               '       COUNT(SL.SELO_LIVRO_ID) AS QTD, '+
               '       C.DESCRICAO AS NATUREZA_PRINCIPAL, '+
               '       CAST(SL.DATA AS DATE) AS DATA '+
               '   FROM G_SELO_LIVRO SL '+
               '     LEFT OUTER JOIN D_CERTIDAO C ON '+
               '     SL.CAMPO_ID = C.CERTIDAO_ID '+
               '     AND SL.TABELA = ''D_CERTIDAO'''+
               ' WHERE SL.DATA ' + Controles.MontarSqlData(StrToDate(vgLivroDiaPesquisa.DataInicial),StrToDate(vgLivroDiaPesquisa.DataFinal))+
               '   AND SL.SELO_SITUACAO_ID = 2 '+
               '   AND C.SITUACAO IN ('+QuotedStr('2')+','+QuotedStr('3')+')'+
               ' GROUP BY DATA, NATUREZA_PRINCIPAL '+
               ' ORDER BY DATA, NATUREZA_PRINCIPAL ';
    end;

  begin
    if vpTipo = 'DOCUMENTO' then
         MontarSqlRTDDocumentos
    else MontarSqlRTDCertidao;

    ExecutaSimpleDSAux(viSql, 0);
    AtualizarProgress(True, 'Carregando RTD - '+vpTipo, vpProgress);
    with dtmControles.SimpleAuxiliar do
    begin
      First;
      while not eof do
      begin
        vpClientDataSet.Append;
        vpClientDataSet.FieldByName('DATA').AsDateTime             := FieldByName('DATA').AsDateTime;
        vpClientDataSet.FieldByName('VALOR_ENTRADA').AsCurrency    := FieldByName('VALOR_EMOLUMENT0').AsCurrency;
        vpClientDataSet.FieldByName('SERVICO_REFERENCIA').AsString := FieldByName('NATUREZA_PRINCIPAL').AsString;
        vpClientDataSet.FieldByName('OPERACAO').AsString           := 'RECEITAS RTD';
        vpClientDataSet.FieldByName('PLANO_CONTA').AsString        := 'RTD&PJ';
        if vpTipo = 'DOCUMENTO' then
        begin
          vpClientDataSet.FieldByName('DOCUMENTO').AsString        := FormatFloat('####,###', FieldByName('PROTOCOLO').AsCurrency);
          vpClientDataSet.FieldByName('QTD_FAVORECIDO').AsString   := 'Livro '+ FieldByName('LIVRO_NUMERO').AsString + ', Folha(s) '+
                                                    FieldByName('LIVRO_PAGINA_INI').AsString + ' a ' + FieldByName('LIVRO_PAGINA_FIM').AsString;
        end
        else vpClientDataSet.FieldByName('QTD_FAVORECIDO').AsString := FieldByName('QTD').AsString;
        vpClientDataSet.Post;
        AtualizarProgress(False, '', vpProgress);
        Next;
      end;
    end;
  end;
  {$ENDREGION}

  {$REGION 'PESQUISAR LIVRO DIARIO CIVIL'}
  procedure PesquisarLivroDiarioCIVIL(vpCampo: string; vpTabela: string; vpTipoSql: string; vpCondicao : String);

    procedure MontarSql1;
    begin
      viSql := ' SELECT SUM(SL.VALOR_EMOLUMENTO) AS VALOR_EMOLUMENT0, '+
               '        COUNT(SL.SELO_LIVRO_ID) AS QTD, '+
               '        SP.DESCRICAO AS NATUREZA_PRINCIPAL, '+
               '       CAST(SL.DATA AS DATE) AS DATA '+
               '   FROM G_SELO_LIVRO SL '+
               '   LEFT OUTER JOIN V_SERVICO_REALIZADO SR ON '+
               '    SL.CAMPO_ID = '+vpCampo+' AND '+
               '    SL.TABELA = '+QuotedStr(vpTabela)+
               '   LEFT JOIN V_SERVICO_TIPO SP ON '+
               '   SR.SERVICO_TIPO_ID = SP.SERVICO_TIPO_ID '+
               ' WHERE SL.DATA ' + Controles.MontarSqlData(StrToDate(vgLivroDiaPesquisa.DataInicial),StrToDate(vgLivroDiaPesquisa.DataFinal))+
               '   AND SL.SELO_SITUACAO_ID = 2 '+
               '   AND SP.ATO_PRATICADO = ''S'''+
               '   AND SR.SITUACAO = ''4'''+ vpCondicao+
               ' GROUP BY DATA, NATUREZA_PRINCIPAL '+
               ' ORDER BY DATA, NATUREZA_PRINCIPAL ';
    end;

    procedure MontarSql2;
    begin
      viSql := ' SELECT SUM(SL.VALOR_EMOLUMENTO) AS VALOR_EMOLUMENT0, '+
               '        COUNT(SL.SELO_LIVRO_ID) AS QTD, '+
               '        (LN.DESCRICAO || '' - '' || SG.DESCRICAO_COMPLETA) AS NATUREZA_PRINCIPAL, '+
               '        CAST(SL.DATA AS DATE) AS DATA '+
               ' FROM '+vpTabela+' A '+
               '  LEFT OUTER JOIN G_SELO_LIVRO SL ON '+
               '    SL.CAMPO_ID = A.'+vpCampo+' AND '+
               '    SL.TABELA = '+QuotedStr(vpTabela) +
               '    LEFT JOIN G_SELO_LOTE ST ON '+
               '    SL.SELO_LOTE_ID = ST.SELO_LOTE_ID '+
               '    LEFT JOIN G_SELO_GRUPO SG ON '+
               '    ST.SELO_GRUPO_ID = SG.SELO_GRUPO_ID '+
               '    LEFT OUTER JOIN V_LIVRO_NATUREZA LN ON '+
               '    A.A_LIVRO_NATUREZA_ID = LN.LIVRO_NATUREZA_ID '+
               ' WHERE A.A_DATA_ASSENTO ' + Controles.MontarSqlData(StrToDate(vgLivroDiaPesquisa.DataInicial),StrToDate(vgLivroDiaPesquisa.DataFinal))+
               '   AND NOT SL.SELO_LIVRO_ID IS NULL '+
               ' GROUP BY DATA, NATUREZA_PRINCIPAL '+
               ' ORDER BY DATA, NATUREZA_PRINCIPAL ';
    end;

  begin
    if vpTipoSql = '1' then
         MontarSql1
    else MontarSql2;

    ExecutaSimpleDSAux(viSql, 0);
    AtualizarProgress(True, 'Carregando CIVIL...', vpProgress);
    with dtmControles.SimpleAuxiliar do
    begin
      First;
      while not eof do
      begin
        vpClientDataSet.Append;
        vpClientDataSet.FieldByName('DATA').AsDateTime             := FieldByName('DATA').AsDateTime;
        vpClientDataSet.FieldByName('VALOR_ENTRADA').AsCurrency    := FieldByName('VALOR_EMOLUMENT0').AsCurrency;
        vpClientDataSet.FieldByName('SERVICO_REFERENCIA').AsString := FieldByName('NATUREZA_PRINCIPAL').AsString;
        vpClientDataSet.FieldByName('OPERACAO').AsString           := 'RECEITAS REGISTRO CIVIL';
        vpClientDataSet.FieldByName('PLANO_CONTA').AsString        := 'CIVIL';
        vpClientDataSet.FieldByName('QTD_FAVORECIDO').AsString     :=  FieldByName('QTD').AsString;
        vpClientDataSet.Post;
        AtualizarProgress(False, '', vpProgress);
        Next;
      end;
    end;
  end;
  {$ENDREGION}

  {$REGION 'PESQUISAR LIVRO DIARIO PROTESTO'}
  procedure PesquisarLivroDiarioPROTESTO(vpTabela: string; vpCampo: string; vpTipo: string);

    procedure MontarDadosSqlAntigo;
    begin
      viSql := viSql +
               '   CAST(SL.DATA AS DATE) AS DATA '+
               ' FROM '+vpTabela+' A '+
               '  LEFT OUTER JOIN G_SELO_LIVRO SL ON '+
               '    SL.CAMPO_ID = A.'+vpCampo+' AND '+
               '    SL.TABELA = '+QuotedStr(vpTabela) +
               '    LEFT JOIN G_SELO_LOTE ST ON '+
               '    SL.SELO_LOTE_ID = ST.SELO_LOTE_ID '+
               '    LEFT JOIN G_SELO_GRUPO SG ON '+
               '    ST.SELO_GRUPO_ID = SG.SELO_GRUPO_ID ';

      if vpTabela = 'P_TITULO' then
        viSql := viSql +
               '    LEFT JOIN P_ESPECIE N ON '+
               '    N.ESPECIE_ID = A.ESPECIE_ID '
      else
        if vpTabela = 'P_SERVICO' then
          viSql := viSql +
               '    LEFT OUTER JOIN P_SERVICO_ITEM SI ON '+
               '    A.SERVICO_ID = SI.SERVICO_ID '+
               '    LEFT OUTER JOIN G_NATUREZA_TITULO N ON '+
               '    SI.NATUREZA_TITULO_ID = N.NATUREZA_TITULO_ID ';

      viSql := viSql +
               ' WHERE SL.DATA ' + Controles.MontarSqlData(StrToDate(vgLivroDiaPesquisa.DataInicial),StrToDate(vgLivroDiaPesquisa.DataFinal))+
               '   AND NOT SL.SELO_LIVRO_ID IS NULL '+
               ' GROUP BY DATA, NATUREZA_PRINCIPAL '+
               ' ORDER BY DATA, NATUREZA_PRINCIPAL ';
    end;

    procedure MontarDadosSqlNovo;
    begin
      if vpTabela = 'P_TITULO' then
      begin
        viSql := viSql +
                 '   CAST(SL.DATA AS DATE) AS DATA '+
                 ' FROM P_TITULO_ITEM A '+
                 '   INNER JOIN G_SELO_LIVRO SL ON '+
                 '   SL.SELO_LIVRO_ID = A.SELO_LIVRO_ID ';
        if not vlProtestoTituloAgrupado then
          viSql := viSql +
                 '  LEFT OUTER JOIN P_TITULO P ON '+
                 '  A.TITULO_ID = P.TITULO_ID '+
                 '  LEFT OUTER JOIN P_LIVRO_ANDAMENTO LA ON '+
                 '  P.LIVRO_ID_PROTESTO = LA.LIVRO_ANDAMENTO_ID ';                   
      end
      else
        viSql := viSql +
                 '   CAST(SL.DATA AS DATE) AS DATA '+
                 ' FROM '+vpTabela+' A '+
                 '  LEFT OUTER JOIN G_SELO_LIVRO SL ON '+
                 '    SL.CAMPO_ID = A.'+vpCampo+' AND '+
                 '    SL.TABELA = '+QuotedStr(vpTabela);

      viSql := viSql +
               '   INNER JOIN G_SELO_LOTE ST ON '+
               '   SL.SELO_LOTE_ID = ST.SELO_LOTE_ID '+
               '   INNER JOIN G_SELO_GRUPO SG ON '+
               '   ST.SELO_GRUPO_ID = SG.SELO_GRUPO_ID ';

      if vpTabela = 'P_TITULO' then
        viSql := viSql +
               ' INNER JOIN G_EMOLUMENTO N ON '+
               ' A.EMOLUMENTO_ID = N.EMOLUMENTO_ID '
      else
        if vpTabela = 'P_SERVICO' then
          viSql := viSql +
               '    LEFT OUTER JOIN P_SERVICO_ITEM SI ON '+
               '    A.SERVICO_ID = SI.SERVICO_ID '+
               '    LEFT OUTER JOIN G_NATUREZA_TITULO N ON '+
               '    SI.NATUREZA_TITULO_ID = N.NATUREZA_TITULO_ID ';

      viSql := viSql +
               ' WHERE SL.DATA ' + Controles.MontarSqlData(StrToDate(vgLivroDiaPesquisa.DataInicial),StrToDate(vgLivroDiaPesquisa.DataFinal))+
               '   AND NOT SL.SELO_LIVRO_ID IS NULL ';

      if vlProtestoTituloAgrupado or (vpTabela <> 'P_TITULO') then
        viSql := viSql + ' GROUP BY DATA, NATUREZA_PRINCIPAL ';

      viSql := viSql + ' ORDER BY DATA, NATUREZA_PRINCIPAL ';
    end;


    procedure MontarSql(vpNovo : Boolean);
    begin
      if vpTabela = 'P_TITULO' then
      begin
        if (not vlProtestoTituloAgrupado) and (vpNovo) then
          viSql := ' SELECT SL.VALOR_EMOLUMENTO AS VALOR_EMOLUMENT0, '+
                   '        P.NUMERO_PROTESTO, P.FOLHA_PROTESTO, LA.NUMERO_LIVRO, P.NUMERO_APONTAMENTO, '
        else
          viSql := ' SELECT SUM(SL.VALOR_EMOLUMENTO) AS VALOR_EMOLUMENT0, '+
                   ' COUNT(SL.SELO_LIVRO_ID) AS QTD, ';
      end
      else
        viSql := ' SELECT SUM(SL.VALOR_EMOLUMENTO) AS VALOR_EMOLUMENT0, '+
                 '        COUNT(SL.SELO_LIVRO_ID) AS QTD, ';

      if vpTabela = 'P_CERTIDAO' then
            viSql := viSql + ' A.TIPO_CERTIDAO AS NATUREZA_PRINCIPAL, '
       else viSql := viSql + ' N.DESCRICAO AS NATUREZA_PRINCIPAL, ';

      if not vpNovo then
           MontarDadosSqlAntigo
      else MontarDadosSqlNovo;
    end;

  begin
    MontarSql(vlVersaoNova);

    ExecutaSimpleDSAux(viSql, 0);
    AtualizarProgress(True, 'Carregando Protesto...', vpProgress);
    with dtmControles.SimpleAuxiliar do
    begin
      First;
      while not eof do
      begin
        vpClientDataSet.Append;
        vpClientDataSet.FieldByName('DATA').AsDateTime             := FieldByName('DATA').AsDateTime;
        vpClientDataSet.FieldByName('VALOR_ENTRADA').AsCurrency    := FieldByName('VALOR_EMOLUMENT0').AsCurrency;

        if vpTabela = 'P_CERTIDAO' then
        begin
          case FieldByName('NATUREZA_PRINCIPAL').AsString[1] of
            'P' : vpClientDataSet.FieldByName('SERVICO_REFERENCIA').AsString := 'Positiva';
            'N' : vpClientDataSet.FieldByName('SERVICO_REFERENCIA').AsString := 'Negativa';
            'R' : vpClientDataSet.FieldByName('SERVICO_REFERENCIA').AsString := 'Relação';
            'T' : vpClientDataSet.FieldByName('SERVICO_REFERENCIA').AsString := 'Traslado';
          end;
        end
        else  vpClientDataSet.FieldByName('SERVICO_REFERENCIA').AsString := FieldByName('NATUREZA_PRINCIPAL').AsString;

        vpClientDataSet.FieldByName('OPERACAO').AsString           := 'RECEITAS PROTESTO';
        vpClientDataSet.FieldByName('PLANO_CONTA').AsString        := 'PROTESTO - '+vpTipo;

        if (vpTabela = 'P_TITULO') and ((not vlProtestoTituloAgrupado) and (vlVersaoNova)) then
        begin
          if FieldByName('NUMERO_PROTESTO').AsString = '' then
            vpClientDataSet.FieldByName('QTD_FAVORECIDO').AsString :=  ' Apontamento nº'+ FieldByName('NUMERO_APONTAMENTO').AsString
          else
           vpClientDataSet.FieldByName('QTD_FAVORECIDO').AsString :=  ' Protesto. nº'+ FieldByName('NUMERO_PROTESTO').AsString +
                                                                      ' - Livro '+ FieldByName('NUMERO_LIVRO').AsString +
                                                                      ' - Folha '+ FieldByName('FOLHA_PROTESTO').AsString;
        end
        else vpClientDataSet.FieldByName('QTD_FAVORECIDO').AsString :=  FieldByName('QTD').AsString;

        vpClientDataSet.Post;
        AtualizarProgress(False, '', vpProgress);
        Next;
      end;
    end;
  end;
  {$ENDREGION}

  procedure PesquisarSelosInutilizados;
  begin
    viSql := ' SELECT SL.NUMERO_AGRUPADOR, '+
             '        SL.APRESENTANTE, '+
             '        SL.VALOR_EMOLUMENTO, '+
             '        SL.DATA, '+
             '        SG.DESCRICAO_COMPLETA AS TIPO_SELO, '+
             '        SL.NUMERO_AGRUPADOR, '+
             '       (SL.SIGLA || LPAD(cast(SL.numero as integer),  6, ''0'')) AS NUMERO_SELO,'+
             '        SG.TIPO_CARTORIO '+
             ' FROM G_SELO_LIVRO SL '+
             '   LEFT JOIN G_SELO_LOTE SO ON '+
             '   SL.SELO_LOTE_ID = SO.SELO_LOTE_ID '+
             '   LEFT JOIN G_SELO_GRUPO SG ON '+
             '   SO.SELO_GRUPO_ID = SG.SELO_GRUPO_ID '+
             ' WHERE NOT SG.TIPO_CARTORIO IS NULL '+
             '  AND SL.SELO_SITUACAO_ID = 4 '+
             '  AND SL.DATA '+Controles.MontarSqlData(StrToDate(vgLivroDiaPesquisa.DataInicial),StrToDate(vgLivroDiaPesquisa.DataFinal));

    ExecutaSimpleDSAux(viSql, 0);
    AtualizarProgress(True, 'Carregando Selos Inutilizados', vpProgress);
    with dtmControles.SimpleAuxiliar do
    begin
      First;
      while not eof do
      begin
        vpClientDataSet.Append;
        vpClientDataSet.FieldByName('DATA').AsDateTime             := FieldByName('DATA').AsDateTime;
        vpClientDataSet.FieldByName('VALOR_ENTRADA').AsCurrency    := FieldByName('VALOR_EMOLUMENTO').AsCurrency;
        vpClientDataSet.FieldByName('SERVICO_REFERENCIA').AsString := FieldByName('TIPO_SELO').AsString;
        vpClientDataSet.FieldByName('OPERACAO').AsString           := 'RECEITAS DE SELOS INUTILIZADOS';
        vpClientDataSet.FieldByName('PLANO_CONTA').AsString        := 'SELOS INUTILIZADO';
        vpClientDataSet.FieldByName('QTD_FAVORECIDO').AsString     := 'SELO INUTILIZADO - '+ FieldByName('NUMERO_SELO').AsString;
        vpClientDataSet.Post;
        AtualizarProgress(False, '', vpProgress);
        Next;
      end;
    end;
  end;

  {$REGION 'PesquisarLivroDiario Financeiro'}
  procedure PesquisarLivroDiarioFinanceiro;
  begin
    viSql := ' SELECT LC.DATA_PAGAMENTO, LC.VALOR, LC.OPERACAO, '+
             ' LC.DOCUMENTO_NUMERO, LC.HISTORICO, '+
             '  CC.DESCRICAO AS CONTABIL_CONTA_DESCRICAO, '+
             '  CG.DESCRICAO AS GRUPO_PRINCIPAL, '+
             '  P.NOME '+
             ' FROM J_LIVRO_CAIXA LC '+
             '   LEFT OUTER JOIN J_CONTABIL_CONTA CC ON '+
             '   LC.CONTABIL_CONTA_ID = CC.CONTABIL_CONTA_ID '+
             '   LEFT OUTER JOIN J_CONTABIL_GRUPO CG ON '+
             '   CC.CONTABIL_GRUPO_ID = CG.CONTABIL_GRUPO_ID '+
             '   LEFT OUTER JOIN J_PESSOA P ON '+
             '   LC.PESSOA_ID = P.PESSOA_ID '+
             ' WHERE NOT LC.LIVRO_CAIXA_ID IS NULL '+
             '   AND LC.DATA_PAGAMENTO '+ MontarSqlData(StrToDate(vgLivroDiaPesquisa.DataInicial), StrToDate(vgLivroDiaPesquisa.DataFinal))+
             '   AND CG.TIPO = ''1'''+
             '   AND LC.CNJ = ''S'''+
             ' ORDER BY LC.DATA_PAGAMENTO, LC.LIVRO_CAIXA_ID ';

    ExecutaSimpleDSAux(viSql, 0);
    AtualizarProgress(True, 'Carregando Despesas Financeiras', vpProgress);
    with dtmControles.SimpleAuxiliar do
    begin
      First;
      while not eof do
      begin
        vpClientDataSet.Append;
        vpClientDataSet.FieldByName('DATA').AsDateTime             := FieldByName('DATA_PAGAMENTO').AsDateTime;
        vpClientDataSet.FieldByName('DOCUMENTO').AsString          := FieldByName('DOCUMENTO_NUMERO').AsString;
        vpClientDataSet.FieldByName('PLANO_CONTA').AsString        := FieldByName('GRUPO_PRINCIPAL').AsString;
        vpClientDataSet.FieldByName('SERVICO_REFERENCIA').AsString := FieldByName('HISTORICO').AsString;
        vpClientDataSet.FieldByName('QTD_FAVORECIDO').AsString     := FieldByName('NOME').AsString;
        vpClientDataSet.FieldByName('VALOR_SAIDA').AsCurrency      := FieldByName('VALOR').AsCurrency;
        vpClientDataSet.FieldByName('OPERACAO').AsString           := 'DESPESAS FINANCEIRAS';
        vpClientDataSet.Post;
        AtualizarProgress(False, '', vpProgress);
        Next;
      end;
    end;
  end;
  {$ENDREGION}

  {$REGION 'PesquisarLivroDiario Registro'}
  procedure PesquisarLivroDiarioRegistro;
  begin
    viSql := ' SELECT CS.DESCRICAO AS GRUPO_PRINCIPAL, CR.* '+
             ' FROM C_REGISTRO_DIARIO CR '+
             '   LEFT OUTER JOIN C_CAIXA_SERVICO CS ON '+
             '    CR.CAIXA_SERVICO_ID = CS.CAIXA_SERVICO_ID '+
             ' WHERE NOT REGISTRO_DIARIO_ID IS NULL '+
             ' AND DATA BETWEEN '+ QuotedStr(dtmControles.DataParaString(StrToDate(viDataInicial))) + ' AND '+
                                              QuotedStr(dtmControles.DataParaString(StrToDate(viDataFinal)))+
             ' AND OPERACAO = '+QuotedStr('D');

    if vpDedutivel <> '' then
    begin 
      if vpDedutivel = 'S' then      
           viSql := viSql + ' AND CS.DEDUTIVEL = '+QuotedStr('S')
      else viSql := viSql + ' AND NOT CS.DEDUTIVEL = '+QuotedStr('S');                                                      
    end;
    
    viSql := viSql + ' ORDER BY DATA, GRUPO_PRINCIPAL';

    AtualizarProgress(True, 'Carregando Despesas Financeiras', vpProgress);
    ExecutaSimpleDSAux(viSql, 0);
    with dtmControles.SimpleAuxiliar do
    begin
      First;
      while not eof do
      begin
        vpClientDataSet.Append;
        vpClientDataSet.FieldByName('DATA').AsDateTime             := FieldByName('DATA').AsDateTime;
        vpClientDataSet.FieldByName('DOCUMENTO').AsString          := '';
        vpClientDataSet.FieldByName('PLANO_CONTA').AsString        := FieldByName('GRUPO_PRINCIPAL').AsString;
        vpClientDataSet.FieldByName('SERVICO_REFERENCIA').AsString := FieldByName('DESCRICAO').AsString;
        vpClientDataSet.FieldByName('QTD_FAVORECIDO').AsString     := '1';
        vpClientDataSet.FieldByName('VALOR_SAIDA').AsCurrency      := FieldByName('VALOR').AsCurrency;
        vpClientDataSet.FieldByName('REGISTRO_DIARIO_ID').AsInteger:= FieldByName('REGISTRO_DIARIO_ID').AsInteger;
        vpClientDataSet.FieldByName('OPERACAO').AsString           := 'DESPESAS FINANCEIRAS';
        vpClientDataSet.FieldByName('TRANSACAO').AsString          := FieldByName('OPERACAO').AsString;

        vpClientDataSet.FieldByName('SERVENTIA').AsString          := FieldByName('SERVENTIA').AsString;
        vpClientDataSet.FieldByName('APRESENTANTE').AsString       := FieldByName('APRESENTANTE').AsString;
        vpClientDataSet.FieldByName('CAIXA_SERVICO_ID').AsInteger  := FieldByName('CAIXA_SERVICO_ID').AsInteger;
        vpClientDataSet.FieldByName('QTD').AsInteger               := FieldByName('QTD').AsInteger;
        vpClientDataSet.Post;
        AtualizarProgress(False, '', vpProgress);
        Next;
      end;
    end;
  end;
  {$ENDREGION}

begin
  Screen.Cursor := crHourGlass;
  vpClientDataSet.DisableControls;
  vpClientDataSet.EmptyDataSet;

  viDataInicial := vgLivroDiaPesquisa.DataInicial;
  viDataFinal   := vgLivroDiaPesquisa.DataFinal;

  if (vgLivroDiaPesquisa.Operacao <> 'D') then
  begin
    if (pos('1', vlSistemas) > 0) and ((vgLivroDiaPesquisa.Serventia = '') or (vgLivroDiaPesquisa.Serventia = '2')) then
    begin
      PesquisarLivroDiarioRI(QuotedStr('1'), '1', 'Registro de Imóveis'); // Protocoloes
      PesquisarLivroDiarioRI(QuotedStr('3')+','+QuotedStr('4'), '3', 'Registro de Imóveis', True);  // Certidões
      PesquisarLivroDiarioRI(QuotedStr('5'), '5', 'Registro de Imóveis'); // Protocoloes
    end;

    if (pos('2', vlSistemas) > 0) and ((vgLivroDiaPesquisa.Serventia = '') or (vgLivroDiaPesquisa.Serventia = '1')) then
    begin
      PesquisarLivroDiarioNotas('Balcão');
      PesquisarLivroDiarioNotas('Atos');
    end;

    if (pos('3', vlSistemas) > 0) and ((vgLivroDiaPesquisa.Serventia = '') or (vgLivroDiaPesquisa.Serventia = '4')) then
    begin
      PesquisarLivroDiarioRTD('DOCUMENTO');
      PesquisarLivroDiarioRTD('CERTIDAO');
    end;

    if (pos('4', vlSistemas) > 0) and ((vgLivroDiaPesquisa.Serventia = '') or (vgLivroDiaPesquisa.Serventia = '3')) then
    begin
      PesquisarLivroDiarioCIVIL('SERVICO_REALIZADO_ID', 'V_SERVICO_REALIZADO', '1', ' AND (SL.TABELA = '+QuotedStr('V_SERVICO_REALIZADO')+')');
      PesquisarLivroDiarioCIVIL('AVERBACAO_ID', 'V_AVERBACAO', '1', ' AND (SL.TABELA = '+QuotedStr('V_AVERBACAO')+') AND SP.LIVRO_NATUREZA_ID = 11');
      PesquisarLivroDiarioCIVIL('CASAMENTO_ID', 'V_CASAMENTO', 'NOIVO_NOME_ATUAL','');
      PesquisarLivroDiarioCIVIL('LIVROE_ID', 'V_LIVROE', '2 ','');
      PesquisarLivroDiarioCIVIL('NASCIMENTO_ID', 'V_NASCIMENTO', '2','');
      PesquisarLivroDiarioCIVIL('OBITO_ID', 'V_OBITO', '2','');
    end;

    if (pos('5', vlSistemas) > 0) and ((vgLivroDiaPesquisa.Serventia = '') or (vgLivroDiaPesquisa.Serventia = '5')) then
    begin
      vlVersaoNova             := dtmControles.BuscarConfig('ATO_PRATICADO', 'GERAL', 'MODELO_PROTESTO_NOVO', 'S') = 'S';
      vlProtestoTituloAgrupado := (dtmControles.BuscarConfig('REGISTRO_DIARIO', 'IMPRESSAO_LIVRO_DIARIO', 'PROTESTO_TITULO_AGRUPADO', 'S') = 'S') and vlVersaoNova;
      PesquisarLivroDiarioPROTESTO('P_TITULO', 'TITULO_ID', 'TITULOS');
      PesquisarLivroDiarioPROTESTO('P_CERTIDAO', 'CERTIDAO_ID', 'CERTIDÃO');
      PesquisarLivroDiarioPROTESTO('P_SERVICO', 'SERVICO_ID', 'SERVIÇOS DIVERSOS');
    end;

   if vpSelosInutilizados then
     PesquisarSelosInutilizados;
  end;

  // Pesquisa Despesas Registradas
  if (vgLivroDiaPesquisa.Operacao <> 'C') then
  begin
    if vlReceitasDiretoAtos then
         PesquisarLivroDiarioRegistro
    else PesquisarLivroDiarioFinanceiro;
  end;

  vpClientDataSet.First;
  vpClientDataSet.EnableControls;
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

function TdtmLookup.SelecionarSistema(Sistemas, Campo: String): String;
begin
  Result := '';
  if copy(Sistemas, length(Sistemas),1) = ';' then
    Delete(Sistemas, length(Sistemas),1);

  while Pos(';', Sistemas) <> 0 do
  begin
    Result := Result + Campo + ' = ' + (copy(Sistemas, 1, Pos(';', Sistemas)-1)) + ' OR ';
    delete(Sistemas,1,Pos(';', Sistemas));
  end;
  Result := Result + Campo + ' = ' + Sistemas + ')';
end;

function TdtmLookup.SetCapacidadaCivil(vpData : Variant):Integer;
{$REGION 'Constantes'}
const
  vcMaiorCapaz    = 1;
  vcMenorImpubere = 4;
  vcMenorPubere   = 6;
{$ENDREGION}
begin
  Result := 0;

  if vpData = null then
    exit;

  if
    (IdadeAtual(vpData) >= 0) and
    (IdadeAtual(vpData) <= 15)
  then
    Result := vcMenorImpubere
  else
  if
    (IdadeAtual(vpData) >= 16) and
    (IdadeAtual(vpData) <= 17)
  then
    Result := vcMenorPubere
  else
    if
      (Result <> null) and
      (IdadeAtual(vpData) >= 18)
    then
    Result := vcMaiorCapaz;
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
  vgDadosImagem.LocalImagem := Trim(dtmControles.BuscarConfig('IMAGEM', 'GERAL', 'LOCAL_IMAGEM', 'S'));

  vgDadosImagem.Pasta := IncludeTrailingPathDelimiter(vgDadosImagem.LocalImagem) + vpPastaImagem;

  if ((vgDadosImagem.Pasta = '') or (not DirectoryExists(vgDadosImagem.Pasta))) and (not vpVerificarExistencia) then
  begin
    Application.MessageBox(PChar('Local de Imagens de '+ vpPastaImagem+' não encontrado!!!'), 'Erro', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    Screen.Cursor := crDefault;
    Result := False;
    exit;
  end;

  vgDadosImagem.SubPasta := Copy(FormatFloat('000000',vpNumero),1,3);

  vgDadosImagem.Pasta := IncludeTrailingPathDelimiter(IncludeTrailingPathDelimiter(vgDadosImagem.Pasta) + vgDadosImagem.SubPasta);

  if vpVerificarExistencia then
    exit;

  if not DirectoryExists(vgDadosImagem.Pasta) then
    MkDir(vgDadosImagem.Pasta);
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
      Application.MessageBox(Pchar('Conta Cliente não possui Saldo Suficiente!!!'+#13+#13+
                                   'Saldo Disponivel = '+ FormatFloat('R$ ,#0.00',vpSaldo)), 'Atenção', MB_OK + MB_ICONWARNING);
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
      Application.MessageBox('Ja existe uma Configuração com este Nome!!!', 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
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

{ TAtualizarTabelas }

procedure TAtualizarTabelas.Execute;
begin
  inherited;
  Synchronize(dtmLookup.RefreshTabelas);
end;


end.
