unit Lookup;

interface

uses
  SysUtils, Classes, cxDBEditRepository, DB, DBClient, SimpleDS,
  cxEditRepositoryItems, cxEdit, cxImageComboBox, cxDbEdit, cxClasses;

type
  TLivroDiario = RECORD
   Descricao, Apresentante, Operacao, LIvro, Folha, Serventia, Selo, CodigoRegistroAuto, CodigoTabela : String;
   Valor : Currency;
   Protocolo, Qtd, Escrevente, CaixaServicoId, ControleID : Integer;
   Data : TDateTime;
  end;

  TdtmLookup = class(TDataModule)
    cxEditRepository1: TcxEditRepository;
    cxEditRepository1CurrencyItem1: TcxEditRepositoryCurrencyItem;
    cxEditRepository1DateItem1: TcxEditRepositoryDateItem;
    sqlG_Banco: TSimpleDataSet;
    dtsG_Banco: TDataSource;
    sqlG_TB_DocumentoTipo: TSimpleDataSet;
    dtsG_TB_DocumentoTipo: TDataSource;
    sqlG_TB_EstadoCivil: TSimpleDataSet;
    dtsG_TB_EstadoCivil: TDataSource;
    sqlG_BancoDESCRICAO: TStringField;
    sqlG_TB_DocumentoTipoTB_DOCUMENTOTIPO_ID: TFMTBCDField;
    sqlG_TB_DocumentoTipoDESCRICAO: TStringField;
    sqlG_TB_DocumentoTipoTEXTO: TBlobField;
    sqlG_TB_DocumentoTipoSITUACAO: TStringField;
    sqlG_TB_EstadoCivilTB_ESTADOCIVIL_ID: TFMTBCDField;
    sqlG_TB_EstadoCivilDESCRICAO: TStringField;
    sqlG_TB_EstadoCivilSITUACAO: TStringField;
    sqlG_TB_Profissao: TSimpleDataSet;
    dtsG_TB_Profissao: TDataSource;
    sqlG_TB_ProfissaoTB_PROFISSAO_ID: TFMTBCDField;
    sqlG_TB_ProfissaoDESCRICAO: TStringField;
    sqlG_TB_ProfissaoSITUACAO: TStringField;
    sqlG_TB_RegimeComunhao: TSimpleDataSet;
    dtsG_TB_RegimeComunhao: TDataSource;
    sqlG_TB_RegimeComunhaoTB_REGIMECOMUNHAO_ID: TFMTBCDField;
    sqlG_TB_RegimeComunhaoDESCRICAO: TStringField;
    sqlG_TB_RegimeComunhaoTEXTO: TBlobField;
    sqlG_TB_RegimeComunhaoSITUACAO: TStringField;
    sqlG_TB_TipoLogradouro: TSimpleDataSet;
    dtsG_TB_TipoLogradouro: TDataSource;
    sqlG_TB_TipoLogradouroTB_TIPOLOGRADOURO_ID: TFMTBCDField;
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
    sqlG_TB_TxModeloGrupo: TSimpleDataSet;
    sqlG_TB_TxModeloGrupoTB_TXMODELOGRUPO_ID: TFMTBCDField;
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
    sqlG_Natureza_Titulo: TSimpleDataSet;
    sqlG_Natureza_TituloCODIGO_NATUREZA_SEF: TFMTBCDField;
    sqlG_Natureza_TituloEMOLUMENTO_ID: TFMTBCDField;
    sqlG_Natureza_TituloNATUREZA_TITULO_ID: TFMTBCDField;
    sqlG_Natureza_TituloDESCRICAO: TStringField;
    sqlG_Natureza_TituloPRAZO: TFMTBCDField;
    sqlG_Natureza_TituloSITUACAO: TStringField;
    sqlG_Natureza_TituloABRIR_MATRICULA: TStringField;
    sqlG_Natureza_TituloSISTEMA_ID: TFMTBCDField;
    sqlG_Natureza_TituloCODIGO_DOI: TFMTBCDField;
    dtsG_Natureza_Titulo: TDataSource;
    ListaG_Natureza_Titulo: TcxEditRepositoryLookupComboBoxItem;
    sqlG_Emolumento: TSimpleDataSet;
    sqlG_EmolumentoEMOLUMENTO_ID: TFMTBCDField;
    sqlG_EmolumentoDESCRICAO: TStringField;
    sqlG_EmolumentoTIPO: TStringField;
    dtsG_Emolumento: TDataSource;
    listaG_Emolumento: TcxEditRepositoryLookupComboBoxItem;
    sqlG_Emolumento_Periodo: TSimpleDataSet;
    dtsG_Emolumento_Periodo: TDataSource;
    sqlG_Emolumento_PeriodoEMOLUMENTO_PERIODO_ID: TFMTBCDField;
    sqlG_Emolumento_PeriodoDESCRICAO: TStringField;
    sqlG_Emolumento_PeriodoSITUACAO: TStringField;
    ListaG_Emolumento_Periodo: TcxEditRepositoryLookupComboBoxItem;
    Combo_UF: TcxEditRepositoryComboBoxItem;
    Formata_Fone: TcxEditRepositoryMaskItem;
    Formata_CPF: TcxEditRepositoryMaskItem;
    Formata_CNPJ: TcxEditRepositoryMaskItem;
    sqlG_Medida_Tipo: TSimpleDataSet;
    dtsG_Medida_Tipo: TDataSource;
    sqlG_Medida_TipoMEDIDA_TIPO_ID: TFMTBCDField;
    sqlG_Medida_TipoDESCRICAO: TStringField;
    sqlG_Medida_TipoSIGLA: TStringField;
    Lista_MedidaTipoDescricao: TcxEditRepositoryLookupComboBoxItem;
    sqlG_TB_Bairro: TSimpleDataSet;
    dtsG_TB_Bairro: TDataSource;
    sqlG_TB_BairroTB_BAIRRO_ID: TFMTBCDField;
    sqlG_TB_BairroDESCRICAO: TStringField;
    sqlG_TB_BairroSITUACAO: TStringField;
    listaG_TB_Bairro: TcxEditRepositoryLookupComboBoxItem;
    Formata_DataSEMhora: TcxEditRepositoryDateItem;
    sqlG_Emolumento_PeriodoDATA_INICIAL: TSQLTimeStampField;
    Combo_TipoTitulo: TcxEditRepositoryImageComboBoxItem;
    sqlG_Natureza_TituloTIPO_COBRANCA: TStringField;
    sqlG_Natureza_TituloTIPO_TITULO: TStringField;
    sqlG_Usuario: TSimpleDataSet;
    dtsG_Usuario: TDataSource;
    sqlG_UsuarioUSUARIO_ID: TFMTBCDField;
    sqlG_UsuarioTROCARSENHA: TStringField;
    sqlG_UsuarioLOGIN: TStringField;
    sqlG_UsuarioSENHA: TStringField;
    sqlG_UsuarioSITUACAO: TStringField;
    sqlG_UsuarioNOME_COMPLETO: TStringField;
    sqlG_UsuarioFUNCAO: TStringField;
    sqlG_UsuarioASSINA: TStringField;
    listaG_Usuario: TcxEditRepositoryLookupComboBoxItem;
    sqlG_Natureza: TSimpleDataSet;
    dtsG_Natureza: TDataSource;
    sqlG_NaturezaNATUREZA_ID: TFMTBCDField;
    sqlG_NaturezaDESCRICAO: TStringField;
    sqlG_NaturezaSISTEMA_ID: TFMTBCDField;
    Lista_Natureza: TcxEditRepositoryLookupComboBoxItem;
    sqlUsuarioSistema: TSimpleDataSet;
    dtsUsuarioSistema: TDataSource;
    sqlUsuarioSistemaUSUARIO_ID: TFMTBCDField;
    sqlUsuarioSistemaLOGIN: TStringField;
    Lista_UsuarioSistema: TcxEditRepositoryLookupComboBoxItem;
    Combo_Sistema: TcxEditRepositoryImageComboBoxItem;
    sqlUsuarioAssinante: TSimpleDataSet;
    FMTBCDField1: TFMTBCDField;
    dtsUsuarioAssinante: TDataSource;
    sqlUsuarioAssinanteNOME_COMPLETO: TStringField;
    Lista_UsuarioAssinante: TcxEditRepositoryLookupComboBoxItem;
    sqlG_BancoBANCO_ID: TStringField;
    Combo_CreditoDebito: TcxEditRepositoryImageComboBoxItem;
    Combo_TiposValoresMarcacoes: TcxEditRepositoryImageComboBoxItem;
    sqlUsuarioAssinanteFUNCAO: TStringField;
    Combo_Permissao: TcxEditRepositoryCheckBoxItem;
    sqlC_Caixa_Servico: TSimpleDataSet;
    dtsC_Caixa_Servico: TDataSource;
    sqlC_Caixa_ServicoINTERNO_SISTEMA: TStringField;
    sqlC_Caixa_ServicoCAIXA_SERVICO_ID: TFMTBCDField;
    sqlC_Caixa_ServicoDESCRICAO: TStringField;
    sqlC_Caixa_ServicoSITUACAO: TStringField;
    sqlC_Caixa_ServicoTIPO_TRANSACAO: TStringField;
    sqlC_Caixa_ServicoSISTEMA_ID: TFMTBCDField;
    listaC_Caixa_Servico: TcxEditRepositoryLookupComboBoxItem;
    Check_SimNao: TcxEditRepositoryCheckBoxItem;
    Combo_Correcao: TcxEditRepositoryImageComboBoxItem;
    Lista_ArquivoCorrecao: TcxEditRepositoryImageComboBoxItem;
    sqlSeloGrupo: TSimpleDataSet;
    dtsSeloGrupo: TDataSource;
    sqlSeloGrupoSELO_GRUPO_ID: TFMTBCDField;
    sqlSeloGrupoDESCRICAO: TStringField;
    Lista_SeloGrupo: TcxEditRepositoryLookupComboBoxItem;
    sqlSeloTipoCartorio: TSimpleDataSet;
    dtsSeloTipoCartorio: TDataSource;
    sqlSeloTipoCartorioSELO_TIPO_CARTORIO_ID: TFMTBCDField;
    sqlSeloTipoCartorioDESCRICAO: TStringField;
    Lista_SeloTipoCartorio: TcxEditRepositoryLookupComboBoxItem;
    sqlSeloGrupoDESCRICAO_COMPLETA: TStringField;
    sqlSeloGrupoNUMERO: TFMTBCDField;
    ClientTemp: TClientDataSet;
    ClientTempCHAVE_ID: TIntegerField;
    ClientTempVALOR: TStringField;
    Combo_Boleto_Situacao: TcxEditRepositoryImageComboBoxItem;
    Combo_SimNaoOpcional: TcxEditRepositoryImageComboBoxItem;
    sqlMunicipioIBGE: TSimpleDataSet;
    dtsMunicipioIBGE: TDataSource;
    sqlMunicipioIBGEMUNICIPIO_ID: TFMTBCDField;
    sqlMunicipioIBGEMUNICIPIO: TStringField;
    sqlMunicipioIBGECODIGO_IBGE: TStringField;
    sqlMunicipioIBGESIGLA: TStringField;
    Lista_MunicipioUF: TcxEditRepositoryLookupComboBoxItem;
    Lista_MunicipioDescricao: TcxEditRepositoryLookupComboBoxItem;
    sqlPaisIBGE: TSimpleDataSet;
    dtsPaisIBGE: TDataSource;
    sqlPaisIBGEIBGE_PAIS_ID: TFMTBCDField;
    sqlPaisIBGEDESCRICAO: TStringField;
    Lista_IBGE_Pais: TcxEditRepositoryLookupComboBoxItem;
    sqlRegineBens: TSimpleDataSet;
    dtsRegimeBens: TDataSource;
    sqlRegineBensTB_REGIMEBENS_ID: TFMTBCDField;
    sqlRegineBensDESCRICAO: TStringField;
    sqlRegineBensSITUACAO: TStringField;
    ListaRegimeBens: TcxEditRepositoryLookupComboBoxItem;
    sqlCaixaServicoTodos: TSimpleDataSet;
    StringField1: TStringField;
    FMTBCDField2: TFMTBCDField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    FMTBCDField3: TFMTBCDField;
    dtsCaixaServicosTodos: TDataSource;
    Lista_CaixaServicoTodos: TcxEditRepositoryLookupComboBoxItem;
    Combo_Serventias: TcxEditRepositoryImageComboBoxItem;
    Combo_Especie: TcxEditRepositoryImageComboBoxItem;
    Combo_ServicoLivroDiario: TcxEditRepositoryImageComboBoxItem;
    Lista_SeloDescricaoCompleta: TcxEditRepositoryLookupComboBoxItem;
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
  end;

var
  dtmLookup: TdtmLookup;
  vgLivroDiario : TLivroDiario;

implementation
uses Controles, CadastroBasicoGeral, Rotinas;

{$R *.dfm}

procedure TdtmLookup.AtualizarParametro(vpNome, vpSecao, vpGrupo, vpSistema : String; vpValor : String);
var
  viValor : String;

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

  if vgId in [1,2,5,7,12,13,15] then
       viTipoCartorio := dtmControles.BuscarConfig('PRINCIPAL', 'CARTORIO', 'TIPO_CARTORIO', 'S')
  else viTipoCartorio := '0';
  sqlSeloGrupo.Close;
  viSql := ' SELECT * '+
           ' FROM G_SELO_GRUPO ';
  if viTipoCartorio <> '' then
    viSql := viSql + ' WHERE (TIPO_CARTORIO IS NULL OR '+
                     '      TIPO_CARTORIO IN('+viTipoCartorio+'))';
  viSql := viSql + ' ORDER BY SELO_GRUPO_ID ';
  sqlSeloGrupo.DataSet.CommandText := viSql;
  sqlSeloGrupo.Open;

  sqlG_TB_Bairro.Close;
  sqlG_TB_Bairro.DataSet.Params.ParamByName('SISTEMA_ID').AsBCD := vgId;
  sqlG_TB_Bairro.Open;

  sqlG_TB_EstadoCivil.Close;
  sqlG_TB_EstadoCivil.DataSet.Params.ParamByName('SISTEMA_ID').AsBCD := vgId;
  sqlG_TB_EstadoCivil.Open;

  sqlG_Natureza_Titulo.Close;
  sqlG_Natureza_Titulo.DataSet.Params.ParamByName('SISTEMA_ID').AsCurrency := vgId;
  sqlG_Natureza_Titulo.Open;

  sqlG_Emolumento.Close;
  sqlG_Emolumento.DataSet.Params.ParamByName('SISTEMA_ID').AsCurrency := vgId;
  sqlG_Emolumento.Open;

  sqlG_Natureza.Close;
  sqlG_Natureza.DataSet.Params.ParamByName('SISTEMA_ID').AsCurrency := vgId;
  sqlG_Natureza.Open;

  sqlUsuarioSistema.Close;
  sqlUsuarioSistema.DataSet.Params.ParamByName('SISTEMA_ID').AsBCD := vgId;
  sqlUsuarioSistema.Open;

  sqlUsuarioAssinante.Close;
  sqlUsuarioAssinante.DataSet.Params.ParamByName('SISTEMA_ID').AsBCD := vgId;
  sqlUsuarioAssinante.Open;

  sqlC_Caixa_Servico.Close;
  sqlC_Caixa_Servico.DataSet.Params.ParamByName('SISTEMA_ID').AsCurrency := vgId;
  sqlC_Caixa_Servico.Open;

  sqlG_Emolumento_Periodo.Open;
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
{  with dtmControles.sqlAuxiliar do
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
  end;}
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
                     '        OPERACAO, '+
                     '        LIVRO, '+
                     '        FOLHA, '+
                     '        USUARIO_ID, '+
                     '        PROTOCOLO, '+
                     '        DATA, '+
                     '        QTD, '+
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
                     '         :OPERACAO, '+
                              RetNull(QuotedStr(vgLivroDiario.Livro))+','+
                              RetNull(QuotedStr(vgLivroDiario.Folha))+','+
                     '         :USUARIO_ID, '+
                              RetNull(viProtocolo)+','+
                     '         :DATA, '+
                     '         :QTD, '+
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
    ParamByName('OPERACAO').AsString          := vgLivroDiario.Operacao;
    ParamByName('USUARIO_ID').AsString        := vgUsuarioID;
    ParamByName('DATA').AsDate                := vgLivroDiario.Data;
    ParamByName('QTD').AsInteger              := vgLivroDiario.Qtd;
    ParamByName('ESCREVENTE').AsInteger       := vgLivroDiario.Escrevente;
    ParamByName('CAIXA_SERVICO_ID').AsInteger := vgLivroDiario.CaixaServicoID;

    if vgLivroDiario.Operacao = 'C' then
         ParamByName('SERVENTIA').AsString  := vgLivroDiario.Serventia
    else ParamByName('SERVENTIA').AsInteger := 9;

    if vgLivroDiario.ControleID = 0 then
         ParamByName('CONTROLE_ID').AsInteger  := dtmControles.GerarSequencia('C_REGISTRO_DIARIO_CONTROLE')
    else ParamByName('CONTROLE_ID').AsInteger  := vgLivroDiario.ControleID;

    ExecSQL(FALSE);
  end;
  Result := InttoStr(viRegistroDiarioID);
end;

end.
