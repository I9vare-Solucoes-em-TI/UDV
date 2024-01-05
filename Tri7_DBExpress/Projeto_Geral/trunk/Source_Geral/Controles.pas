unit Controles;

interface

uses
  I9StoredProc,
  I9Query,
  I9Connection,
  Windows, SysUtils, Forms, Classes, DB, SqlExpr, ImgList, SBUtils,
  Controls, cxContainer, cxEdit, cxClasses, cxStyles, Math, Messages,
  cxGridTableView, cxHint, DBClient, SimpleDS, cxEditRepositoryItems, WPCTRRich,
  FMTBcd, cxGridCardView,cxDBLookupComboBox, frxRich, frxClass, cxTextEdit, frxExportImage,
  frxDesgn, ad3SpellBase,  cxDbEdit, IniFiles, cxSchedulerCustomControls,
  cxDropDownEdit,  frxDCtrl, cxCalendar, Variants,
  frxFDComponents, frxChBox, frxChart, frxOLE, frxBarcode,
  ActnMan, ActnColorMaps, cxImageComboBox, Dialogs, ActnCtrls, ActnList,
  cxLookAndFeels, MSNPopUp, ExtCtrls,
  frxExportPDF, frxExportXLS, ECripto,
  WideStrings, IdSMTPBase, WPCTRMemo, WPRTEDefs, ShellApi,
  IdSMTP, IdComponent, IdTCPConnection, IdTCPClient, CharPrinter,
  IdExplicitTLSClientServerBase, IdMessageClient, IdPOP3, IdMessage,
  IdBaseComponent, IdAntiFreeze, idText, IdAttachmentFile,
  OleServer, frxExportText, gtPDFClasses, gtCstPDFDoc, gtExPDFDoc,
  gtExProPDFDoc, gtPDFDoc, ImagXpr7_TLB, Graphics, DateUtils,
  Provider, cxGridBandedTableView, cxTL, dxCustomHint,
  CRSQLConnection, ad4Live, IdAntiFreezeBase, cxPC,
  cxCurrencyEdit, dxScreenTip, DbxDevartInterBase, ad3Spell,
  frxExportRTF, IdHTTP,
  FundoTipo, Data.DBXFirebird, frxExportDOCX,
  FormatadorMascaraSelo, dxSkinsCore, dxSkinCoffee, dxSkiniMaginary,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinBlack,
  dxSkinLondonLiquidSky,
  Geral.Model.Entity.Spec.Factory,
  Geral.Model.DAO.Spec.Sistema,
  Geral.Model.DAO.Spec.ConfiguracaoGrupo,
  Geral.Model.DAO.Spec.Configuracao,
  Geral.Model.Entity.Spec.Configuracao,
  Geral.Model.Entity.Spec.Maybe,
  Geral.Model.Entity.Spec.CapturaConfiguracoes, dxSkinCaramel,
  frxExportBaseDialog, dxSkinGlassOceans, frxExportXLSX,
  Rotinas;

type
  TPessoa = Record
    CadastrarNovo, PessoaTipo, PessoaTipoVinculo, Sexo, ConjugeRepresentante, PessoaSinalPublico : string;
    CPF_CNPJ, VinculoAuxiliar, Nome, Documento : string;
    PessoaId, NotPessoaId, PessoaSelecionada, PessoaVinculo,
    EstadoCivil, Profissao, CensecTipoAtoId : Integer;
    Selecionar, NovaParte, TipoSeparacao, TipoRevogacao : Boolean;
    NomeTabela, RepresentantesCartao, AvoM, AvoP : string;
  end;

  TImovel = Record
    CadastrarNovo, Numero, TipoClasse : string;
    ImovelId, NotImovelId, ImovelSelecionado : integer;
    Selecionado, Selecionar, NovaUnidade, AdicionarUnidade, QualificacaoGeral : Boolean;
    Registro, DataRegistro, ValorAvaliacao, ValorAlienacao, Aliquota, ValorMercado : String;
  end;

  TAto = Record
    AtoTipoId, AtoId, NaturezaId : integer;
    PesqTabela, PesqCampoId, ValorFiltro : string;
  end;

  TGravarTextoAutomatico = Record
    Gravar, Intervalo : string;
  end;

  TImpressao = Record
    TipoImpressora, RelatorioID, RelCartaoEscritura, RelCartaoProcuracao,
    RelCartaoOutorgante, RelNotaPromissoria : integer;
    Cabecalho, Rodape : string;
  end;

  TCertidao = Record
    ImovelId, NomePessoa, TipoRegistro : String;
  end;

  TCarimbo = Record
    ChaveEtiqueta : String;
  end;


  TAndamentoAto = Record
    PesquisaAndamento : Boolean;
    ProtocoloId : Integer;
  end;

  TEmailConfig = Record
    HostSmtp, HostPop3, UserName, PassWord, AssuntoPadrao, EmailEnvio, EmailDestino, EmailCopiaOculto, Tabela, Porta : String;
    Autenticar, UsarEmailUsuario, AdAssinaturaUsuario, Transmitido : Boolean;
    EspacoAssinatura, Qtd, ChaveId : Integer;
    TextoEmail, TextoRodape : TStringList;
    DadosEmail : array[1..10,1..3] of string;
  end;

  TDadosBase = Record
    Local, Senha, NomeBase, BaseDados : String;
  end;

  TRetornoErro = record
    houveErro: Boolean;
    mensagem: string;
    caminho: array of string;
  end;

  TOrdemServico = Record
    Identificacao, OSTipo, TransacaoOS, TransacaoItem, AutorizacaoTipo, OSSaida : String;
    Flag, Solicitar, CalculoRapido : Boolean;
    TipoInclusao, AutorizacaoId, MensalistaId, ItemCompensador : Integer;
    Observacao : String;
    Ordem, Valor, OSValor, OSSaldo : Currency;
  End;

  TOrdemSaldo = Record
    SaldoOSDisponivel, SaldoOSRI, SaldoOSNotas, SaldoOSGeral : Currency;
    SaldoOSAguardandoC, SaldoOSAguardandoD, SaldoOSCompensar, SaldoOSAntiga, SaldoOSDevolver : Currency;
  end;


type
  TGeralThread = class(TThread)
  private
  protected
    procedure Execute; override;
  end;

  TExecuteProcedure = procedure of object;

  TdtmControles = class(TDataModule)
    cxHintStyleController: TcxHintStyleController;
    SimpleAuxiliar: TI9Query;
    sqlSequencia: TI9Query;
    sqlAuxiliar: TI9Query;
    cxEsc_EditsNormal: TcxEditStyleController;
    cxEsc_EditsObrigatorio: TcxEditStyleController;
    cxEditRepository1: TcxEditRepository;
    cxEditRepository1CurrencyItem1: TcxEditRepositoryCurrencyItem;
    cxEditRepository1DateItem1: TcxEditRepositoryDateItem;
    sqlConfig: TI9Query;
    sqlConfigCONFIG_ID: TBCDField;
    sqlConfigCONFIG_GRUPO_ID: TBCDField;
    sqlConfigCONFIG_PADRAO_ID: TBCDField;
    sqlConfigSECAO: TStringField;
    sqlConfigNOME: TStringField;
    sqlConfigTEXTO: TBlobField;
    sqlConfigTERMINAL: TStringField;
    sqlConfigTIPO_VALOR: TStringField;
    sqlConfigGRUPO: TStringField;
    frxRichObject1: TfrxRichObject;
    frxRelatorio: TfrxReport;
    frxDialogControls1: TfrxDialogControls;
    frxBarCodeObject1: TfrxBarCodeObject;
    frxOLEObject1: TfrxOLEObject;
    frxChartObject1: TfrxChartObject;
    frxCheckBoxObject1: TfrxCheckBoxObject;
    frxFDComponents1: TfrxFDComponents;
    StandardColorMap1: TStandardColorMap;
    sqlRelatorio: TI9Query;
    sqlRelatorioGRUPO_RELATORIO_ID: TBCDField;
    sqlRelatorioGRUPO: TStringField;
    sqlRelatorioCONFIG_RELATORIO_ID: TBCDField;
    sqlRelatorioDESCRICAO: TStringField;
    sqlRelatorioRELATORIO: TBlobField;
    LookAndFeelController: TcxLookAndFeelController;
    frxDesigner1: TfrxDesigner;
    frxImagem: TfrxReport;
    timerAgenda: TTimer;
    sqlG_Agenda: TI9Query;
    sqlG_AgendaAGENDA_ID: TBCDField;
    sqlG_AgendaTIPO_EVENTO: TBCDField;
    sqlG_AgendaDATA_INICIO: TSQLTimeStampField;
    sqlG_AgendaDATA_FIM: TSQLTimeStampField;
    sqlG_AgendaASSUNTO: TStringField;
    sqlG_AgendaMENSAGEM: TStringField;
    sqlG_AgendaCOR: TBCDField;
    sqlG_AgendaOPCAO: TBCDField;
    sqlG_AgendaSTATUS: TBCDField;
    sqlG_AgendaUSUARIO_ID: TBCDField;
    sqlG_AgendaUSUARIO_AGENDOU_ID: TBCDField;
    sqlG_AgendaMENSAGEM_FINALIZADO: TBlobField;
    sqlG_AgendaDATA_HORA_CADASTRO: TSQLTimeStampField;
    sqlG_AgendaDATA_HORA_ENVIADO: TSQLTimeStampField;
    sqlG_AgendaDATA_HORA_FINALIZADO: TSQLTimeStampField;
    dtsG_Agenda: TDataSource;
    sqlG_AgendaDATA_HORA_AVISADO: TSQLTimeStampField;
    sqlConfigATUALIZADO: TStringField;
    frxPDFExport1: TfrxPDFExport;
    cxEsc_EditsEspecial: TcxEditStyleController;
    msnAgenda: TMSNPopUp;
    Cripto: TEvCriptografa;
    timerSessao: TTimer;
    imgCadBasicos: TImageList;
    PrintDialog1: TPrintDialog;
    frxBMPExport1: TfrxBMPExport;
    frxSimpleTextExport1: TfrxSimpleTextExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxTIFFExport1: TfrxTIFFExport;
    gtPDFDocument: TgtPDFDocument;
    ClientAncestral: TClientDataSet;
    ProviderAncestral: TDataSetProvider;
    DataSetAncestral: TI9Query;
    ClientAncestralCONFIG_RELATORIO_ID: TBCDField;
    ClientAncestralRELATORIO: TBlobField;
    ImageListAndamento: TImageList;
    cxStyleLabel: TcxEditStyleController;
    cxEditStyleGroup: TcxEditStyleController;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyleDestaque: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    GridCardViewStyleSheetDevExpress: TcxGridCardViewStyleSheet;
    GridTableViewStyleSheetLigth: TcxGridTableViewStyleSheet;
    cxGridBandedTableViewStyleSheet1: TcxGridBandedTableViewStyleSheet;
    cxTreeListStyleSheet1: TcxTreeListStyleSheet;
    frxRTFExport1: TfrxRTFExport;
    cxEditStyleBotao: TcxEditStyleController;
    DB: TI9Connection;
    AddictSpell: TAddictSpell;
    IdSMTP1: TIdSMTP;
    sqlFeriado: TI9Query;
    sqlSistema: TI9Query;
    sqlSistemaSISTEMA_ID: TBCDField;
    sqlSistemaDESCRICAO: TStringField;
    dtsSistema: TDataSource;
    DBH: TI9Connection;
    sqlAuxiliarHistorico: TI9Query;
    IdMessage: TIdMessage;
    idPOP3: TIdPOP3;
    idSmtp: TIdSMTP;
    idAntiFreeze: TIdAntiFreeze;
    IdHTTP1: TIdHTTP;
    SP_SEQUENCIA: TI9StoredProc;
    tmrAlertaVersao: TTimer;
    frxDOCXExport1: TfrxDOCXExport;
    sqlConfigDESCRICAO: TStringField;
    sqlConfigVALOR: TStringField;
    frxXLSXExport1: TfrxXLSXExport;
    cxStyle47: TcxStyle;

    function GetFormatadorMascaraSelo: IFormatadorMascaraSelo;

    procedure CRTemp_DBBeforeConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    function frxRelatorioUserFunction(const MethodName: String;
      var Params: Variant): Variant;
    procedure msnAgendaURLClick(Sender: TObject; URL: String);
    procedure timerAgendaTimer(Sender: TObject);
    procedure timerSessaoTimer(Sender: TObject);
    procedure DBHBeforeConnect(Sender: TObject);
    procedure IdMessageInitializeISO(var VHeaderEncoding: Char;
      var VCharSet: string);
    procedure tmrAlertaVersaoTimer(Sender: TObject);
    procedure DBAfterConnect(Sender: TObject);
  private
    { Private declarations }
    TD: TTransactionDesc;
    ExecuteControleSessao : TAction;
    FCapturaConfiguracoes: IMaybe<ICapturaConfiguracoes>;
    FSistemaDAOFactory: IFactory<ISistemaDAO>;
    FConfiguracaoGrupoDAOFactory: IFactory<IConfiguracaoGrupoDAO>;
    FConfiguracaoDAOFactory: IFactory<IConfiguracaoDAO>;
    FMetodoArredondamento: TMetodoArredondamento;

    function IsVersaoTeste(
      const vpVersao: string): Boolean;

    function Configuracao(
      const vpSistemaID: Integer;
      const vpGrupo: string;
      const vpSecao: string;
      const vpNome: string): IConfiguracao;

    function ConfiguracaoCapturada(
      const vpSistemaID: Integer;
      const vpGrupo: string;
      const vpSecao: string;
      const vpNome: string): Boolean;

    function AtualizarValorConfiguracao(
      const vpValor: string;
      const vpSistemaID: Integer;
      const vpGrupo: string;
      const vpSecao: string;
      const vpNome: string): Integer;

    function LinkSuporte: string;
    function LinkSuportePadrao: string;

    function AtualizarLinkSuporte(
      const vpValor: string): Integer;

    function VerificarLinkSuporte: Integer;
    function SiteTri7: string;
    function MetodoArredondamentoParametro: Integer;

    procedure AppIdle(Sender: TObject; var Done: Boolean);
    procedure AppMessage(var Msg: TMsg; var Handled: Boolean);
    procedure ConfiguraRegiaoBR;
    procedure VerificarCapturaConfiguracoesIniciada;

    procedure VerificarCapturaConfiguracao(
      const vpSistemaID: Integer;
      const vpGrupo: string;
      const vpSecao: string;
      const vpNome: string);
  public
    { Public declarations }
    ThGeral: TGeralThread;
    ExecuteProcThread : TExecuteProcedure;

    //Parâmetros do Proxy
    vlUsarProxy : Boolean;
    vlProxyServer,
    vlProxyPort,
    vlProxyUsername,
    vlProxyPassword: string;

    {Rotinas para controlar as trasações}
    procedure StartTransaction;
    procedure Commit;
    procedure Roolback;
    procedure MostraErro(E: Exception);

    {Rotina para Logar os Erros do Sistema}
    procedure CapturaErro(Sender: TObject; E: Exception);

    {Rotinas para relatorios}
    Procedure CriarImagem(wptTexto : TWPRichText; Arquivo : String; Tipo : Byte = 1);

    {Funções de busca no base de dados}
    function ExecSQL(Qry: string):Boolean;
    function GetStr(Qry: string): string;
    function GetInt(Qry: string): integer;
    function GetFloat(Qry: string): double;
    function GetFields(Qry: string): TStringList;

    function CodPermissao(
      Rotina: string;
      const vpSistemaID: Integer = 0): string;

    function GerarSequencia(Tabela: string): Variant;
    function BuscarRotina(Chave : String): String;
    function DataHoraBanco(vpParametro: Integer): Variant;
    function DataParaString(vpData: TDateTime): string;
    function RetornaTexto(Str: String): String;

    {Funções/Procedimento de Rede}
    procedure BuscarIpRede(var vpComboBox : TcxComboBox);

    // Procedimento para leitura das Configurações do Sistema
    function BuscarConfig(vpGrupo, vpSecao, vpNome : string; vpTipoValor: char): Variant;
    procedure CarregarConfig;
    procedure CarregarParametrosDoSistema;
    function BuscarParametroOutroSistema(vpNome, vpSecao, vpGrupo, vpSistema : String ):Variant;

    //Auditoria
    procedure Auditoria(Tabela, Campo, Operacao, Valor, ID, Observacao: String);

    //Relatorio
    procedure ShowRelatorio(ID : String);
    procedure ParametrosRelatorio;
    procedure CriarMenuRelatorio(var ActManager : TActionManager; var ActRel : TAction; id : Integer);

    //Lembretes
    procedure MsnPouUpLembrete(Texto, Titulo : String);

    //PDF
    procedure ConverterPdfToTiff(vpOrigem, vpDestino: string);

    //Controle Sessão
    procedure AtivaSessao(vpExecutar : TAction);

    procedure EnviarEmail(vBodyHtml : String; vEmailCC: string; vAttachment: String; vAnexo: TStrings);
    procedure EnviarEmailIndy(const vEmailOrigem, vAssunto, vEmailDestino: string; vBodyHtml: String=''; vEmailCC: string='';
                  vEmailCCO: string=''; vAttachment: String = ''; vAnexo: TStrings = Nil);

    procedure ImprimirEpson(wptTexto : TWPRichText; vpInvertido : Boolean);

    procedure VerificarRegistroDicionario(vpSistema : String);

    function VerificarProximoDiaUtil(vpData : TDateTime): TDateTime;
    Function VerificarDiaUtil(vpData : TDateTime):Boolean;
    function DiasUteis(DataInicio, DataFim: TDate): integer;
    function ValidaFeriado(vfData: TDateTime): Boolean;

    procedure RegistrarControleVersao(vpId : Integer; vpVersao : string);
    Procedure CarregarSistemasTab(vpTabControl : TcxTabControl;
      vpAdicionarTodas : Boolean = False; vpSomenteSistemasEmol : Boolean = False);
    function VerificarSeloTJ(vpSelo : string):String;

    procedure AbrirSeloTribunalJustica(
      const vpNumeroSelo: string);

    function IsNotVersaoTeste(
      const vpVersao: string): Boolean;

    function FormatarMascaraSelo(
      const vpSigla: string;
      const vpNumero: Integer): string;

    function GetQuantidadeDigitosNumeroSelo: Integer;
    function CapturaConfiguracoesIniciada: Boolean;
    function UsuarioAdministrador: Boolean;

    function LoginAdmin: string;
    function SenhaAdmin: string;

    function IsLoginAdmin(
      const vpLogin: string): Boolean;

    function IsSenhaAdmin(
      const vpSenha: string): Boolean;

    function IsAdmin(
      const vpLogin: string;
      const vpSenha: string): Boolean;

    function Suporte(
      const vpTipo: string = '1'): Integer;

    function MetodoArredondamento: TMetodoArredondamento;

    procedure IniciarCapturaConfiguracoes(
      const vpSistemaDAOFactory: IFactory<ISistemaDAO>;
      const vpConfiguracaoGrupoDAOFactory: IFactory<IConfiguracaoGrupoDAO>;
      const vpConfiguracaoDAOFactory: IFactory<IConfiguracaoDAO>);

    procedure VisualizarConfiguracoesCapturadas;
    procedure LimparConfiguracoesCapturadas;
    procedure TerminarCapturaConfiguracoes;
  end;
var
  vgChamarLogin, vgExecutarSistema: boolean;
  vgId    : Integer;
  vgVersao1, vgVersao2 : TDateTime;
  vgHelpID,
  vgCodAtalho,
  vgMarcacaoAutoGrupo, vgLocalBase, vgP, vgSistemaNome : String;
  vgListaSistemas : array[0..9] of integer;
  vgImgExt : String;

  vgEmailConfig : TEmailConfig;

  // Variaveis de Tipo Pré-Definidos
  vgPessoa : TPessoa;
  vgImovel : TImovel;
  vgAto    : TAto;
  vgGravarTextoAutomatico : TGravarTextoAutomatico;
  vgChaveRetorno,
  vgNumeRegHistorico: integer;
  vgImpressao : TImpressao;
  vgAndamento : TAndamentoAto;
  vgDadosBase : TDadosBase;
  vgCertidaoReg : TCertidao;
  vgDadosCarimbo : TCarimbo;

  // Conexao com o Banco
  vgTipoConexao,
  vgTipoBanco,
  vgBaseDados,
  vgBaseDadosHistorico,
  vgBaseNome,
  vgUsuarioID ,
  vgLogin,
  vgLoginSigla,
  vgSenhaAtual,
  vgUsuarioNome,
  vgUsuarioFuncao,
  vgUsuario,
  vgSenha,
  vgVERSAO,
  vgSenhaAnterior,
  vgDiretorioCorrente,
  vgKey,
  vgSecao,
  vgChaveSecao,
  vgControlarVersao,
  vgIPServidorHorario,
  vgDirCeps: string;
  vgVersaoSistema: string;
  vgSistemas: string;

  // Dados do Cartorio
  vgCartorio,
  vgCidade,
  vgCep,
  vgUF,
  vgUsarAvisarAgenda: string;

  // IMpressao Recibo Caixa - Usada para Controle de Data Prevista da Certidão do Tabelioanto
  vgCertidaoDataPrevista : String;

  dtmControles: TdtmControles;

  vgProximoDiaUtil,
  vgAbrirChat : Boolean;

  vpCaminhoDicionario: string;
  vpNomeArquivoDicionario: string;

  vgFundoTipos   : TFundoTipos;
  vgOrdemServico : TOrdemServico;
  vgOrdemSaldo   : TOrdemSaldo;

  const
     EKeyViolation  = 'KEY VIOLATION';
     EFKeyViolation = 'FOREIGN KEY';

  function RetornaCampo(Valor: String; Tipo : TFieldType) : String;
  function GetLine(var S: string): string;
  function GetField(var S: string): string;
  function MontarSqlData(DataIni, DataFim: TDateTime): string;

  procedure ExecutaSimpleDSAux(vpSql : string; vpTipo : integer);
  procedure ExecutaSqlAuxiliar(vpSql : string; vpTipo : integer);
  procedure VerificarPreenchimentoLCX_DB(vpDado, vpNomeCampo : string; var vpCampo : TcxDBLookupComboBox);
  procedure VerificarPreenchimentoLCX_TX(vpDado, vpNomeCampo : string; var vpCampo : TcxLookupComboBox);
  procedure VerificarPreenchimentoEDT_DB(vpDado, vpNomeCampo : string; var vpCampo : TcxDBTextEdit);
  procedure VerificarPreenchimentoICX_DB(vpDado, vpNomeCampo : string; var vpCampo : TcxDBImageComboBox);
  procedure VerificarPreenchimentoICX_TX(vpDado, vpNomeCampo : string; var vpCampo : TcxImageComboBox);
  procedure VerificarPreenchimentoEDT_TX(vpDado, vpNomeCampo : string; var vpCampo : TcxTextEdit);
  procedure VerificarPreenchimentoDTA_DB(vpDado, vpNomeCampo : string; var vpCampo : TcxDBDateEdit);
  procedure VerificarPreenchimentoDTA_TX(vpDado, vpNomeCampo : string; var vpCampo : TcxDateEdit);
  procedure VerificarPreenchimentoTIME_DB(vpDado, vpNomeCampo : string; var vpCampo : TcxDBTimeEdit);
  procedure VerificarPreenchimentoCBX_DB(vpDado, vpNomeCampo : string; var vpCampo : TcxDBComboBox);
  procedure VerificarPreenchimentoCBX_TX(vpDado, vpNomeCampo : string; var vpCampo : TcxComboBox);
  procedure VerificarPreenchimentoCUR_DB(vpDado: Currency; vpNomeCampo: string; var vpCampo: TcxDBCurrencyEdit);
  procedure VerificarPreenchimentoCUR_TX(vpDado: Currency; vpNomeCampo: string; var vpCampo: TcxCurrencyEdit);
  procedure VerificarPermissao(Permissao : String);
  function GetCodigoControle(vpControleId : String = '0') : String;
  function InputQueryA(const ACaption, APrompt: string; var Value: string): Boolean;

  // Ordem de Serviço
  Function VerificarOrdemServico(vpOrdem: Currency; vpTipoInclusao : Integer;
                vpIdentificacao, vpTransacao : String; vpValor : Currency):Boolean;

  function FormatarOrdemServicoID(
    const vpData: TDateTime;
    const vpSequencia: Integer): Currency;

  function GerarOrdemServicoID(
    const vpData: TDateTime): Currency;

  function SequenciaOrdemServicoID(
    const vpOrdemServicoID: Currency): Integer;

  function InicializarOrdemServico: TOrdemServico;
  function SolicitarOrdemServico: Boolean;
  function ExisteOrdemServico(
    const vpTipoServico: string;
    const vpChaveServico: Integer): Boolean;

  procedure GravarOrdemServico(vpOsAntiga : Integer = 0);
  Function MascaraOS(vpOS : Currency):String;

  procedure CalcularSaldoOS(vpOS : String; vpSaldoOSDisponivel : Boolean;
         vpSaldoOSServentia : Boolean = False);

  function RetornarOrdemServicoNova(vpOrdem : String):string;
  function UltimaDataOS: TDateTime;
  procedure IncluirPesquisarOS(vpOS: Currency; vpCaixaItemId : Integer);

  function UltimaOS(
    const vpData: TDateTime): Currency;

  procedure VerificarSequenciaOS;
  function Reprotocolo(const viValorPago : Currency; const vpChaveServico : Integer):Currency;
  procedure LancarItemOSAReceber(vpOS, vpDescricao : String; vpSaldo : Currency; vpCaixaItemId : Integer);
  procedure IncluirItemCaixaOS;

implementation

uses
  VisualizaRelatorios,
  Agenda,
  Atualizacao,
  AtualizacaoSistema,
  InputForm,
  HttpVersao,
  Conexao,
  FundoTipoDAO,
  Winapi.UrlMon,
  Principal,
  SeloLivro,
  SeloLivroImpl,
  FormatadorMascaraSeloSimpleFactory,
  System.StrUtils,
  System.Types,
  Geral.Model.Entity.Impl.Configuracao,
  MensagemUtils,
  Geral.Model.Entity.Impl.Maybe,
  Geral.Model.Entity.Impl.CapturaConfiguracoes,
  Geral.Model.Entity.Impl.Factory.List,
  Geral.Controller.Impl.VisualizacaoCapturaConfiguracoes,
  Geral.Model.Entity.Exception.VisualizacaoCapturaConfiguracoes,
  OrdemServicoSolicitar,
  FireDAC.comp.Client,
  Geral.Model.Entity.Impl.DataSet,
  FDControle;

{$R *.dfm}
{$WARN IMPLICIT_STRING_CAST OFF}
{$WARN IMPLICIT_STRING_CAST_LOSS OFF}

{ TdtmControles }

function InputQueryA(const ACaption, APrompt: string;
  var Value: string): Boolean;
begin
  try
    Result := False;
    if frmInputForm = nil then
      Application.CreateForm(TfrmInputForm, frmInputForm);

    frmInputForm.Caption := ACaption;
    frmInputForm.mmoTexto.Text := Value;
    frmInputForm.lblDescricao.Caption := APrompt;

    if frmInputForm.ShowModal = mrOk then
    begin
      Value := frmInputForm.mmoTexto.Text;
      Result := True;
    end;
  finally
     FreeAndNil(frmInputForm);
  end;

end;

function TdtmControles.Configuracao(
  const vpSistemaID: Integer;
  const vpGrupo: string;
  const vpSecao: string;
  const vpNome: string): IConfiguracao;
begin
  Result := FConfiguracaoDAOFactory
    .GetInstance
    .ByCaminhoConfiguracao(
      TCaminhoConfiguracao
      .New(
        FConfiguracaoGrupoDAOFactory
        .GetInstance
        .BySistemaAndDescricao(
          FSistemaDAOFactory
          .GetInstance
          .ByID(
            vpSistemaID),
          vpGrupo),
        vpSecao,
        vpNome));
end;

function TdtmControles.ConfiguracaoCapturada(
  const vpSistemaID: Integer;
  const vpGrupo: string;
  const vpSecao: string;
  const vpNome: string): Boolean;
begin
  Result := FCapturaConfiguracoes
    .Value
    .ConfiguracoesCapturadas
    .Any(
      function(
        const vpValue: IConfiguracao): Boolean
      begin
        Result := (CompareValue(
          vpValue.Caminho.ConfiguracaoGrupo.Sistema.ID,
          vpSistemaID) = EqualsValue) and
          vpValue.Caminho.ConfiguracaoGrupo.Descricao.Equals(
            vpGrupo) and
          vpValue.Caminho.Secao.Equals(
            vpSecao) and
          vpValue.Caminho.Nome.Equals(
            vpNome);
      end);
end;

procedure IncluirItemCaixaOS;
var
  viSql : String;
begin
  vgCaixaNovoItem.CaixaItemId := dtmControles.GerarSequencia('C_CAIXA_ITEM');

  viSql :=
    ' INSERT INTO C_CAIXA_ITEM (' +
    '  CAIXA_ITEM_ID, ' +
    '  CAIXA_SERVICO_ID, ' +
    '  USUARIO_SERVICO_ID, ' +
    '  DESCRICAO, ' +
    '  DATA_PAGAMENTO, ' +
    '  HORA_PAGAMENTO, ' +
    '  SITUACAO, ' +
    '  CAIXA_ID, ' +
    '  TIPO_TRANSACAO, ' +
    '  VALOR_SERVICO,' +
    '  APRESENTANTE,' +
    '  QTD,' +
    '  REGISTRADO,' +
    '  VALOR_PAGO,'+
    '  OS_TIPO,'+
    '  OS_TRANSACAO,'+
    '  OS_SAIDA, ' +
    '  RECIBO_ID,'+
    '  CAIXA_SERVICO_RETORNO_ID,'+
    '  OBSERVACAO,'+
    '  AUTORIZACAO_TIPO,'+
    '  AUTORIZACAO_ID,'+
    '  ORDEM_SERVICO_ID) ' +
    ' VALUES (' +
       vgCaixaNovoItem.CaixaItemId + ', ' +
       vgCaixaNovoItem.ChaveServico.ToString + ', ' +
       RetNull(vgUsuarioID) + ', ' +
       QuotedStr(vgCaixaNovoItem.Descricao) + ', ' +
       QuotedStr(dtmControles.DataHoraBanco(1)) + ', ' +
       QuotedStr(dtmControles.DataHoraBanco(2)) + ', ' +
       QuotedStr(vgCaixaNovoItem.Situacao) + ', ' +
       RetNullInteger(vgCaixaNovoItem.CaixaID) + ', ' +
       QuotedStr(vgCaixaNovoItem.TipoTransacao) + ', ' +
       QuotedStr(TrocaVirgPPto(CurrToStr(vgCaixaNovoItem.Valor))) + ', ' +
       QuotedStr(vgCaixaNovoItem.Apresentante) + ', ' +
       vgCaixaNovoItem.Qtd.ToString + ', ' +
       QuotedStr(vgCaixaNovoItem.Registrado) + ', ' +
       QuotedStr(TrocaVirgPPto(CurrToStr(vgCaixaNovoItem.Valor))) + ', '+
       QuotedStr(vgCaixaNovoItem.OSTipo) + ', ' +
       QuotedStr(vgCaixaNovoItem.OSTransacao) + ', ' +
       RetNull(QuotedStr(vgCaixaNovoItem.OSSaida)) + ', ' +
       RetNullInteger(vgCaixaNovoItem.ReciboId)  + ', ' +
       RetNullInteger(vgCaixaNovoItem.RetornoId)+', '+
       QuotedStr(vgCaixaNovoItem.Observacao)+', '+
       QuotedStr(vgOrdemServico.AutorizacaoTipo)+', '+
       RetNullInteger(vgOrdemServico.AutorizacaoId)+', '+
       vgCaixaNovoItem.OrdemServicoID + ')';
  dtmControles.ExecSQL(viSql);

end;

procedure ExecutaSqlAuxiliar(vpSql : string; vpTipo : integer);
begin
  with dtmControles.sqlAuxiliar do
  begin
    Active := False;
    sql.Clear;
    SQL.Add(vpSql);
    case vpTipo of
      0 : Active := True;
      1 : ExecSQL;
      // Tipo = 2, significa que vai receber parametros.
    end;
  end;
end;

procedure LancarItemOSAReceber(vpOS, vpDescricao : String; vpSaldo : Currency; vpCaixaItemId : Integer);
begin
  if (vpSaldo >= 0) or (vgOrdemServico.OSTipo <> '3') then
    exit;

  vgCaixaNovoItem.ChaveServico    := dtmControles.BuscarParametroOutroSistema('SERVICO_CAIXA_CREDITO_NOTAS', 'GERAL','NOVO_CAIXA','5');
  vgCaixaNovoItem.Descricao       := 'Diferença de Valor a Receber';
  vgCaixaNovoItem.Observacao      := 'Lançamento Automático - Diferença do Saldo OS Negativa - Item '+vpCaixaItemId.ToString;
  vgCaixaNovoItem.Situacao        := '3';
  vgCaixaNovoItem.TipoTransacao   := 'C';
  vgCaixaNovoItem.Valor           := vpSaldo*-1;
  vgCaixaNovoItem.Apresentante    := vpDescricao;
  vgCaixaNovoItem.Qtd             := 1;
  vgCaixaNovoItem.Registrado      := '1';
  vgCaixaNovoItem.OSTipo          := '2';
  vgCaixaNovoItem.OSTransacao     := 'C';
  vgCaixaNovoItem.OSSaida         := '';
  vgCaixaNovoItem.ReciboId        := 0;
  vgCaixaNovoItem.RetornoId       := 0;
  vgCaixaNovoItem.OrdemServicoID  := vpOS;
  IncluirItemCaixaOS;
end;

function Reprotocolo(const viValorPago : Currency; const vpChaveServico : Integer):Currency;
var
  viPedidoID, viPedidoID_Anterior, viProtocoloID_Anterior : Integer;
  viValorCredito, viValorDebito : Currency;
begin
  viPedidoID := dtmFD.FDConnection.ExecSQLScalar(
    'SELECT PEDIDO_ID FROM R_PROTOCOLO WHERE PROTOCOLO_ID = :P_PROTOCOLO_ID',
    [vpChaveServico]);

  viPedidoID_Anterior := dtmFD.FDConnection.ExecSQLScalar(
    'SELECT PEDIDO_ID FROM R_PEDIDO WHERE NOVO_PEDIDO_ID = :P_NOVO_PEDIDO_ID',
    [viPedidoID]);

  viProtocoloID_Anterior := dtmFD.FDConnection.ExecSQLScalar(
    'SELECT PROTOCOLO_ID FROM R_PROTOCOLO WHERE PEDIDO_ID = :P_PEDIDO_ID AND TIPO_PROTOCOLO = :P_TIPO_PROTOCOLO',
    [viPedidoID_Anterior,'1']);

  viValorCredito := dtmFD.FDConnection.ExecSQLScalar(
    'SELECT COALESCE(SUM(VALOR_PAGO), 0) FROM C_CAIXA_ITEM WHERE ' +
    'TIPO_SERVICO = ''1'' AND CHAVE_SERVICO = :P_CHAVE_SERVICO AND ' +
    'TIPO_TRANSACAO = ''C'' AND ' +
    'SITUACAO = ''7'' AND REGISTRADO = ''6''',
    [viProtocoloID_Anterior]);

  viValorDebito := dtmFD.FDConnection.ExecSQLScalar(
    'SELECT COALESCE(SUM(VALOR_PAGO), 0) FROM C_CAIXA_ITEM WHERE ' +
    'TIPO_SERVICO = ''1'' AND CHAVE_SERVICO = :P_CHAVE_SERVICO AND ' +
    'TIPO_TRANSACAO = ''D'' AND ' +
    'SITUACAO = ''7'' AND REGISTRADO = ''6''',
    [viProtocoloID_Anterior]);

  vgOrdemServico.ItemCompensador :=  dtmFD.FDConnection.ExecSQLScalar(' SELECT FIRST 1 QUITADO_CAIXA_ID FROM C_CAIXA_ITEM WHERE ' +
                                        ' TIPO_SERVICO = ''1'' AND CHAVE_SERVICO = :P_CHAVE_SERVICO AND ' +
                                        ' SITUACAO = ''7'' AND REGISTRADO = ''6''',
                                        [viProtocoloID_Anterior]);

  Result := viValorPago + viValorCredito - viValorDebito;
end;

procedure TdtmControles.ConfiguraRegiaoBR;
var
  WFormatoBR: TFormatSettings;
begin
  WFormatoBR                     := TFormatSettings.Create;
  WFormatoBR.DecimalSeparator    := ',';
  WFormatoBR.ThousandSeparator   := '.';
  WFormatoBR.CurrencyDecimals    := 2;
  WFormatoBR.DateSeparator       := '/';
  WFormatoBR.ShortDateFormat     := 'dd/mm/yyyy';
  WFormatoBR.LongDateFormat      := 'dd/mm/yyyy';
  WFormatoBR.TimeSeparator       := ':';
  WFormatoBR.TimeAMString        := 'AM';
  WFormatoBR.TimePMString        := 'PM';
  WFormatoBR.ShortTimeFormat     := 'hh:nn';
  WFormatoBR.LongTimeFormat      := 'hh:nn:ss';
  WFormatoBR.CurrencyString      := 'R$';
  System.SysUtils.FormatSettings := WFormatoBR;
end;

function TdtmControles.DiasUteis(DataInicio, DataFim:TDate):integer;
var
 contador,
 viDia : Integer;
begin
  Contador := 0;
  while (DataInicio <= DataFim) do
  begin
    viDia := DayOfWeek(DataInicio);
    if (viDia <> 1) and (viDia <> 7) then
      if (not ValidaFeriado(DataInicio)) then
        Inc(Contador);
    DataInicio := DataInicio + 1
  end;
  result := Contador;
end;

procedure TdtmControles.VerificarCapturaConfiguracoesIniciada;
begin
  if not CapturaConfiguracoesIniciada then
  begin
    TMensagemUtils.ExibirMensagemAtencao(
      'A captura de configurações não está iniciada.');

    Abort;
  end;
end;

function TdtmControles.VerificarDiaUtil(vpData: TDateTime): Boolean;
begin
   Result := True;
   if DayOfWeek(vpData) = 1 then
     Result := False
   else
   if DayOfWeek(vpData) = 7 then
     Result := False
   else
   Result := not ValidaFeriado(vpData);
end;

function TdtmControles.VerificarLinkSuporte: Integer;
begin
  if not LinkSuporte.IsEmpty then
    Exit(
      ZeroValue);

  Result := AtualizarLinkSuporte(
    LinkSuportePadrao);
end;

function TdtmControles.ValidaFeriado(vfData: TDateTime): Boolean;
var
   viDia,
   viMes,
   viAno : Word;
begin
  Result := False;
  DecodeDate(vfData, viAno, viMes, viDia);

  with dtmControles.sqlFeriado do
  begin
    Close;
    SQL.Text := 'SELECT TIPO, ANO '
               +'  FROM G_FERIADO '
               +' WHERE SITUACAO = ''A'' '
               +'   AND DIA = ' + FloatToStr(viDia)
               +'   AND MES = ' + FloatToStr(viMes);
    Open;

    if not IsEmpty then
      if FieldByName('TIPO').AsString = 'V' then
      begin
        if FieldByName('ANO').AsInteger = viAno then
          Result := True;
      end
      else Result := True;

    Close;
  end;
end;

procedure TdtmControles.AbrirSeloTribunalJustica(
  const vpNumeroSelo: string);
{$REGION 'Variáveis'}
var
  viHTTP_ValidarSelo: string;
  viSelo: string;
  viLink: array[0..500] of WideChar;
{$ENDREGION}
begin
  viHTTP_ValidarSelo := string(BuscarParametroOutroSistema(
    'HTTP_VALIDAR_SELO', 'GERAL', 'PRINCIPAL', '5')).Trim;

  if viHTTP_ValidarSelo.IsEmpty then
    Exit;

  try
    viSelo := viHTTP_ValidarSelo + vpNumeroSelo.Trim;
    StringToWideChar(viSelo, viLink, 500);
    HlinkNavigateString(nil, viLink);
  except
  end;
end;

procedure TdtmControles.VerificarRegistroDicionario(vpSistema : String);
var
  viUsuarioWindows, viChave1, viChave2 : String;

  procedure DadosRegistro(vpChave, vpValor : String);
  begin
    GravaRegistro(HKEY_CURRENT_USER, 'Software\Addictive Software\'+vpSistema+'\'+viUsuarioWindows, vpChave, vpValor);
  end;

begin

  viUsuarioWindows := PegarUsuarioWindows;
  viChave1         := Rotinas.LerRegistro(HKEY_CURRENT_USER, 'Software\Addictive Software\'+vpSistema+'\'+viUsuarioWindows,'_Main_0');
  viChave2         := Rotinas.LerRegistro(HKEY_CURRENT_USER, 'Software\Addictive Software\'+vpSistema+'\'+viUsuarioWindows,'_Main_count');
  if (viChave1 = 'brazport.adm') and (viChave2 = '1') then
    exit;

  DadosRegistro('_ActiveCustom', '');
  DadosRegistro('_Custom_0', 'Autocorrect.adu');
  DadosRegistro('_Custom_count', '2');
  DadosRegistro('_DialogX', '-1');
  DadosRegistro('_DialogY', '-1');
  DadosRegistro('_FirstRun', '+');
  DadosRegistro('_Main_0', 'brazport.adm');
  DadosRegistro('_Main_count', '1');
  DadosRegistro('_MSWordCustom_count', '0');
  DadosRegistro('_NewPaths_count', '0');
  DadosRegistro('_QuoteChars', '>');
  DadosRegistro('_soAbbreviations', '+');
  DadosRegistro('_soDUalCaps', '+');
  DadosRegistro('_soHTML', '-');
  DadosRegistro('_soInternet', '+');
  DadosRegistro('_soLiveCorrect', '+');
  DadosRegistro('_soLiveSpelling', '+');
  DadosRegistro('_soNumbers', '-');
  DadosRegistro('_soPrimaryOnly', '-');
  DadosRegistro('_soQuoted', '-');
  DadosRegistro('_soRepeated', '+');
  DadosRegistro('_soUpcase', '-');
  DadosRegistro('_soUser1', '-');
  DadosRegistro('_UserData_count', '0');
end;

function TdtmControles.VerificarSeloTJ(vpSelo: string): String;
var
  lURL : String;
  lResponse : String;
begin
  lURL := 'http://extrajudicial.tjgo.jus.br/controle_de_atos_utilizados/verificacao?codigo_selo='+vpSelo;
  IdHTTP1.Request.ContentEncoding := 'utf-8';

  IdHTTP1.Request.Accept := 'text/html, */*';
  IdHTTP1.Request.UserAgent := 'Mozilla/3.0 (compatible; IndyLibrary)';
  IdHTTP1.Request.ContentType := 'application/x-www-form-urlencoded';
  IdHTTP1.HandleRedirects := True;

  if vlUsarProxy then
  begin
    IdHTTP1.ProxyParams.ProxyServer   := vlProxyServer;
    IdHTTP1.ProxyParams.ProxyPort     := vlProxyPort.ToInteger;
    IdHTTP1.ProxyParams.ProxyUsername := vlProxyUsername;
    IdHTTP1.ProxyParams.ProxyPassword := vlProxyPassword;
    if (IdHTTP1.ProxyParams.ProxyUsername <> '') and (IdHTTP1.ProxyParams.ProxyPassword <> '') then
      IdHTTP1.ProxyParams.BasicAuthentication := True;
  end;

  try
    lResponse := idHttp1.Get(lURL);
    if pos('class="resultado_consulta_selo"', lResponse) > 0 then
         Result := 'S'
    else Result := 'N';
  except
    Result := 'I';
  end;
end;

procedure TdtmControles.VisualizarConfiguracoesCapturadas;
begin
  VerificarCapturaConfiguracoesIniciada;

  try
    TVisualizacaoCapturaConfiguracoes.New(
      FCapturaConfiguracoes.Value).Visualizar;
  except
    on E: ENenhumaConfiguracaoCapturada do
      TMensagemUtils.ExibirMensagemAtencao(
        E.Message);
  end;
end;

function RetornaCampo(Valor: String; Tipo : TFieldType) : String;
begin
  Result := RetNull(Valor);
  if Tipo in  [ftString, ftwideString, ftFixedChar] then
     Result := ' LIKE ' +  QuotedStr(valor + '%')
  else
  if Tipo in [ftTimeStamp, ftDate, ftDateTime] then
     Result := ' = ' + dtmControles.DataParaString(StrToDate(Valor))
  else
  if Tipo in [ftFloat, ftCurrency, ftFMTBcd] then
     Result := ' = ' + TrocaVirgPPto(Valor);
end;


function GetLine(var S: string): string;
var
  P: integer;
begin
  P := Pos(#13, S);
  if P > 0 then
  begin
    Result := Copy(S, 1, P - 1);
    System.Delete(S, 1, P);
  end
  else
  begin
    Result := S;
    S := '';
  end;
end;

function GetField(var S: string): string;
var
  P: integer;
begin
  P := Pos(^I, S);
  if P > 0 then
  begin
    Result := Copy(S, 1, P - 1);
    System.Delete(S, 1, P);
  end
  else
  begin
    Result := S;
    S := '';
  end;
end;

function NewQuery: TI9Query;
begin
  Result := TI9Query.Create(Application);
  Result.Connection := dtmControles.DB;
end;

function PrepField(F: TField): string;
begin
  case F.DataType of
    ftDate: Result := DateToStr(F.AsDateTime);
    ftTime: Result := TimeToStr(F.AsDateTime);
    ftDateTime: if F.AsDateTime < 0.0000000000001 then
        Result := ''
      else if F.AsDateTime < 1 then
        Result := TimeToStr(F.AsDateTime)
      else if Frac(F.AsDateTime) < 0.000000001 then
        Result := DateToStr(F.AsDateTime)
      else
        Result := F.AsString;
  else
    Result := F.AsString;
  end;
end;

function TdtmControles.CodPermissao(
  Rotina: string;
  const vpSistemaID: Integer = 0): string;
var
  Str : TStringList;

  Function VerificarPermissão(vpCondicao : string): Boolean;
  {$REGION 'Variáveis'}
  var
    viSistemaID: Integer;
  {$ENDREGION}
  begin
    if Str <> nil then
      FreeAndNil(Str);

    viSistemaID := IfThen(
      CompareValue(
        vpSistemaID,
        ZeroValue) = GreaterThanValue,
      vpSistemaID,
      vgId);

    Str := dtmControles.GetFields(' SELECT P.PERMISSAO, R.ATALHO_SISTEMA FROM G_USUARIO U ' +
                                  ' LEFT JOIN G_USUARIO_SISTEMA US ON ' +
                                  '    U.USUARIO_ID = US.USUARIO_ID ' + vpCondicao +
                                  ' LEFT JOIN G_SISTEMA_ROTINA R ON ' +
                                  '   P.SISTEMA_ROTINA_ID = R.SISTEMA_ROTINA_ID ' +
                                  ' LEFT JOIN G_SISTEMA_MENU M ON ' +
                                  '   R.SISTEMA_MENU_ID = M.SISTEMA_MENU_ID '+
                                  ' WHERE U.LOGIN = ' + QuotedStr(vgLogin) +
                                  ' AND R.CHAVE_ROTINA = ' + QuotedStr(Rotina) +
                                  ' AND US.SISTEMA_ID = ' + viSistemaID.ToString +
                                  ' AND M.SISTEMA_ID = ' + viSistemaID.ToString);
    Result := Str.Values['PERMISSAO'] <> '';
  end;

begin
  Str := nil;
  Result := '000000';
  if vgLogin <> 'TRI7' then
  begin
    if not VerificarPermissão(' LEFT JOIN G_PERMISSAO_GRUPO P ON US.USUARIO_GRUPO_ID = P.USUARIO_GRUPO_ID ') then
      VerificarPermissão(' LEFT JOIN G_PERMISSAO_USUARIO P ON US.USUARIO_ID = P.USUARIO_ID ');

    Result      := Str.Values['PERMISSAO'];
    vgCodAtalho := Str.Values['ATALHO_SISTEMA'];

    if Trim(Result) = '' then
       Result := '000000';

    FreeAndNil(Str);
  end
  else Result := '111111';
end;

procedure TdtmControles.Commit;
begin
  DB.Commit(TD);
end;

procedure TdtmControles.ConverterPdfToTiff(vpOrigem, vpDestino: string);
var
  Bmp: TBitmap;
  Output_DPI,
  Desktop_DPI,
  viPaginas,
  i : Integer;
  viArquivoTemp : string;
  XpressImagem : TImagXpress;
begin
  Output_DPI    := 300;   // Required DPI of hi-res image
  Desktop_DPI   := 96;   // Current DPI of screen or in PDF viewer

  if not DirectoryExists('c:\Temp') then
    CreateDir('c:\Temp');

  viArquivoTemp := 'c:\Temp\PagePdfTemp.bmp';

  DeleteFile(vpDestino);

  try
    XpressImagem := TImagXpress.Create(Self);
    XpressImagem.LoadResizeEnabled   := False;
    // Load a PDF document
    gtPDFDocument.LoadFromFile(vpOrigem);
    viPaginas := gtPDFDocument.PageCount;

    if frmAtualizacao = nil then
      frmAtualizacao := TfrmAtualizacao.Create(nil);
    frmAtualizacao.lblTexto.Caption := 'Convertendo PDF, aguarde...';
    frmAtualizacao.Show;

    Application.ProcessMessages;

    for i := 1 to viPaginas do
    begin
      DeleteFile(viArquivoTemp);
      Application.ProcessMessages;

      // Create a bitmap with size equal to that of
      // second page of the document at the required DPI
      Bmp := TBitmap.Create;
      Bmp.Width := Round(gtPDFDocument.GetPageSize(i, muPixels).Width *
                             (Output_DPI/Desktop_DPI));   // Warning
      Bmp.Height := Round(gtPDFDocument.GetPageSize(i, muPixels).Height *
                              (Output_DPI/Desktop_DPI));  // Warning

      // Render contents of page 2 to bitmap
      gtPDFDocument.RenderToDC(
                        Bmp.Canvas.Handle,  // Handle of the bitmap canvas
                        Bmp.Width,          // Width of page at required DPI
                        Bmp.Height,         // Height of page at required DPI
                                i,              // Number of the page
                                Output_DPI,     // Horizontal DPI
                                Output_DPI,     // Vertical DPI
                                0,              // Angle of rotation
                                True,           // Enable anti-aliasing
                                False);         // Not for printing

      Bmp.PixelFormat := pf8bit;
      // Save bitmap to file
      Bmp.SaveToFile(viArquivoTemp);
      // Free image
      Bmp.FreeImage;

      if FileExists(viArquivoTemp) then
      begin
        //Salva JPeg
        XpressImagem.FileName            := viArquivoTemp;
        XpressImagem.SaveFileType        := FT_TIFF_JPEG;
        XpressImagem.SaveTIFFCompression := TIFF_JPEG;
        XpressImagem.SaveFileName        := vpDestino;
        XpressImagem.SaveMultiPage       := True;
        XpressImagem.IResX               := 300;
        XpressImagem.IResY               := 300;
        XpressImagem.SaveFile;
      end;
    end;

    frmAtualizacao.Free;
    frmAtualizacao := nil;

    XpressImagem.Free;
    gtPDFDocument.Reset;
  except on Err:Exception do
    begin
      frmAtualizacao.Free;
      frmAtualizacao := nil;

      XpressImagem.Free;
      gtPDFDocument.Reset;
      ShowMessage('Erro ao converter PDF: ' + Err.Message);
    end;
  end;
end;

procedure TdtmControles.EnviarEmail(vBodyHtml : String; vEmailCC: string; vAttachment: String; vAnexo: TStrings);

  function GetContentType(vfArquivo: String) : String;
  var viExt : String;
  begin
    viExt := UpperCase(ExtractFileExt(vfArquivo));

    if viExt = '.PDF' then
       Result := 'application/pdf'
    else
    if (viExt = '.DOC') or (viExt = '.RTF') then
      Result := 'application/msword'
    else
    if viExt = '.ZIP' then
      Result := 'application/x-zip-compressed'
    else
      Result :='text/html';
  end;

var
   i : Integer;
begin
  Screen.Cursor := crSQLWait;
  IdMessage.Clear;

  //Cria o objeto mensagem
  if (vgEmailConfig.EmailDestino <> '')  then
  begin
    //Define os parâmetros da mensagem
    IdMessage.MessageParts.Clear;
    //IdMessage.ContentType := 'text/html';

    with TIdText.Create(IdMessage.MessageParts, nil) do begin
       ContentType := 'multipart/alternative';
    end;

    if vBodyHtml <> '' then
    with TIdText.Create(IdMessage.MessageParts, nil) do begin
      Body.Text := vBodyHtml;
      ContentType := 'text/html';
	  ParentPart := 0;
    end;

    if FileExists(vAttachment) then
    with TIdAttachmentFile.Create(IdMessage.MessageParts, vAttachment) do begin
      ContentType := GetContentType(vAttachment);
      FileName := ExtractFileName(vAttachment);
    end;

    if vAnexo <> Nil then
    begin
      if vAnexo.Count > 0 then
      for i := 0 to vAnexo.Count - 1 do
        with TIdAttachmentFile.Create(IdMessage.MessageParts, vAnexo.Strings[i]) do begin
          ContentType := GetContentType(vAnexo.Strings[i]);
          FileName := ExtractFileName(vAnexo.Strings[i]);
        end;
    end;

//    IdMessage.ContentType := 'multipart/mixed';
    IdMessage.ContentType    := 'text/plain; charset=ISO-8859-1';
    IdMessage.CharSet        := 'ISO-8859-1';
    IdMessage.Encoding       := meMIME;
    IdMessage.OnInitializeISO:= Self.IdMessageInitializeISO;

    IdMessage.Recipients.EMailAddresses := vgEmailConfig.EmailDestino;
    IdMessage.CCList.EMailAddresses     := vEmailCC;
    IdMessage.BccList.EMailAddresses    := vEmailCC;
    IdMessage.From.Text                 := vgEmailConfig.EmailEnvio;
    IdMessage.Subject                   := vgEmailConfig.AssuntoPadrao;

    //Faz a conexão com o servidor, caso precise de autenticação para o envio
{    if vgEmailConfig.Autenticar then
    begin
      idPOP3.Host     := vgEmailConfig.HostPop3;
      idPOP3.Username := vgEmailConfig.UserName;
      idPOP3.Password := vgEmailConfig.PassWord;
      idPOP3.Connect;
    end;}

    with idSmtp do
    begin
      // Define os parâmetros de autenticação se o seu provedor requer.
      Host     := vgEmailConfig.HostSmtp;
      UserName := vgEmailConfig.UserName;
      PassWord := vgEmailConfig.PassWord;
      // Faz a conexão com o servidor e envia a mensagem
      try
        Connect;
        Send(IdMessage);
      finally
        Disconnect;
      end;
    end;
  end;
  Screen.Cursor := crDefault;
end;

procedure TdtmControles.EnviarEmailIndy(const vEmailOrigem, vAssunto, vEmailDestino: string; vBodyHtml: String=''; vEmailCC: string='';
                  vEmailCCO: string=''; vAttachment: String = ''; vAnexo: TStrings = Nil);
  function GetContentType(vfArquivo: String) : String;
  var viExt : String;
  begin
    viExt := UpperCase(ExtractFileExt(vfArquivo));

    if viExt = '.PDF' then
       Result := 'application/pdf'
    else
    if viExt = '.DOC' then
      Result := 'application/msword'
    else
    if viExt = '.ZIP' then
      Result := 'application/x-zip-compressed'
    else
      Result :='text/html';
  end;

var
   i : Integer;
begin
  Screen.Cursor := crSQLWait;
  IdMessage.Clear;

  //Cria o objeto mensagem
  if (vEmailDestino <> '')  then
  begin
    //Define os parâmetros da mensagem
    IdMessage.MessageParts.Clear;
    //IdMessage.ContentType := 'text/html';

    IdMessage.ContentType    := 'text/plain; charset=ISO-8859-1';
    IdMessage.CharSet        := 'ISO-8859-1';
    IdMessage.Encoding       := meMIME;
    IdMessage.OnInitializeISO:= Self.IdMessageInitializeISO;

    with TIdText.Create(IdMessage.MessageParts, nil) do begin
       ContentType := 'multipart/alternative';
    end;

    if vBodyHtml <> '' then
    with TIdText.Create(IdMessage.MessageParts, nil) do begin
      Body.LoadFromFile(vBodyHtml);
      ContentType := 'text/html';
	  ParentPart := 0;
    end;

    if FileExists(vAttachment) then
    with TIdAttachmentFile.Create(IdMessage.MessageParts, vAttachment) do begin
      ContentType := 'application/x-zip-compressed';
      FileName := ExtractFileName(vAttachment);
    end;

    if vAnexo <> Nil then
    begin
      if vAnexo.Count > 0 then
      for i := 0 to vAnexo.Count - 1 do
        with TIdAttachmentFile.Create(IdMessage.MessageParts, vAnexo.Strings[i]) do begin
          ContentType := GetContentType(vAnexo.Strings[i]);
          FileName := ExtractFileName(vAnexo.Strings[i]);
        end;
    end;

    IdMessage.ContentType := 'multipart/mixed';

    IdMessage.Recipients.EMailAddresses := vEmailDestino;
    IdMessage.CCList.EMailAddresses  := vEmailCC;
    IdMessage.BccList.EMailAddresses := vEmailCCO;
    IdMessage.From.Text := vEmailOrigem;
    IdMessage.Subject   := vAssunto;

    //idPOP3.Host     := 'mail.cartorioximenes.com.br';
    //idPOP3.Username := 'notificacao@cartorioximenes.com.br';
    //idPOP3.Password := 'ximenes';
    //idPOP3.Connect;

    vgEmailConfig.Transmitido := False;
    with idSmtp do
    begin
      // Define os parâmetros de autenticação se o seu provedor requer.
      Port     := StrToInt(vgEmailConfig.Porta);
      Host     := vgEmailConfig.HostSmtp;
      UserName := vgEmailConfig.UserName;
      PassWord := vgEmailConfig.PassWord;

      if vgEmailConfig.Autenticar then
           AuthType := satDefault
      else AuthType := satNone;

{      Port     := 587;
      Host     := 'mail.cartorioximenes.com.br';
      UserName := 'notificacao@cartorioximenes.com.br';
      PassWord := 'ximenes';}

      // Faz a conexão com o servidor e envia a mensagem
      try
        Connect;
        Send(IdMessage);
        vgEmailConfig.Transmitido := True;
      finally
        Disconnect;
      end;
    end;
  end;
  Screen.Cursor := crDefault;
end;

function TdtmControles.ExecSQL(Qry: string): Boolean;
begin
  DB.ExecuteDirect(Qry);
end;

function TdtmControles.FormatarMascaraSelo(
  const vpSigla: string;
  const vpNumero: Integer): string;
{$REGION 'Variáveis'}
var
  viSeloLivro: ISeloLivro;
{$ENDREGION}
begin
  viSeloLivro := TSeloLivro.New;
  viSeloLivro.Sigla := vpSigla;
  viSeloLivro.Numero := vpNumero;
  Result := GetFormatadorMascaraSelo.FormatarMascaraSelo(viSeloLivro);
end;

procedure ExecutaSimpleDSAux(vpSql: string; vpTipo: integer);
begin
  with dtmControles.SimpleAuxiliar do
  begin
    Active := False;
    SQL.Text := '';
    SQL.Text := vpSql;
    case vpTipo of
      0 : Active := True;
      1 : Execute;
      // Tipo = 2, significa que vai receber parametros.
    end;
  end;
end;

function TdtmControles.GerarSequencia(Tabela: string): Variant;
{$REGION 'Variáveis'}
var
  viInTransaction: Boolean;
{$ENDREGION}
begin
  if Tabela.IsEmpty then
    Exit(
      Null);

  viInTransaction := DB.InTransaction;
  if not viInTransaction then
    StartTransaction;

  try
    SP_SEQUENCIA.ParamByName(
      'TABELA').AsString := Tabela;

    SP_SEQUENCIA.ExecProc;
    try
      Result := SP_SEQUENCIA.ParamByName(
        'SEQUENCIA').AsString;
    finally
      SP_SEQUENCIA.Close;
    end;

    if not viInTransaction then
      Commit;
  except
    if not viInTransaction then
      Roolback;
    raise;
  end;
end;

function TdtmControles.VerificarProximoDiaUtil(vpData : TDateTime): TDateTime;
var
  viData : TDateTime;
begin
  viData := vpData;
  while not VerificarDiaUtil(viData) do
    viData := viData + 1;
  Result := viData;
end;

function TdtmControles.GetFloat(Qry: string): double;
var Aux : String;
begin
  Aux := GetStr(Qry);
  if Aux <> '' then
     Result := StrToFloat(Aux)
  else Result := 0;
end;

function TdtmControles.GetFormatadorMascaraSelo: IFormatadorMascaraSelo;
{$REGION 'Variáveis'}
var
  viUF: string;
{$ENDREGION}
begin
  viUF := BuscarParametroOutroSistema(
    'UF',
    'CARTORIO',
    'PRINCIPAL',
    '5');

  if not MatchText(
    viUF,
    ['GO',
    'CE',
    'AL',
    'PA']) then
    raise Exception.Create(
      string.Format(
        'O parâmetro %s/%s/%s possui um valor inválido.',
        ['PRINCIPAL',
        'CARTORIO',
        'UF']));

  Result := TFormatadorMascaraSeloSimpleFactory.Get(
    viUF);
end;

function TdtmControles.GetInt(Qry: string): integer;
begin
  Result := StrToIntDef(GetStr(Qry), 0);
end;

function TdtmControles.GetQuantidadeDigitosNumeroSelo: Integer;
begin
  Result := GetFormatadorMascaraSelo.QuantidadeDigitosNumero;
end;

function TdtmControles.GetStr(Qry: string): string;
var
  SQL: TI9Query;
begin
  Result := '';
  SQL := NewQuery;
  try
    SQL.SQL.Text := Qry;
    SQL.Open;
    if SQL.Active then
    begin
      if not SQL.EOF then
        Result := PrepField(SQL.Fields[0]);
    end
  except
    on E: exception do
      Application.MessageBox(Pchar(E.Message), 'Aviso', mb_IconExclamation);
  end;
  SQL.Close;
  SQL.Free;
  SQL := nil;
end;

procedure TdtmControles.IdMessageInitializeISO(var VHeaderEncoding: Char;
  var VCharSet: string);
begin
  VCharSet := 'ISO-8859-1';
end;

procedure TdtmControles.ImprimirEpson(wptTexto: TWPRichText;
  vpInvertido: Boolean);
var
  Buffer, Aux, Texto, TextoNome, Codigo : string;
  i, j, viBobina, viCont, viQtdTextoTemp : integer;
  prn : TAdvancedPrinter;
  viFontePadrao : TprtFontSize;
  viFormatacaoPadrao : TprtTextStyles;
  viFlag, viDividir, viContinuar : Boolean;
  viTextInvertido1, viTextInvertido2, viTextInvertido3 : String;
  viTextoTemp : array[1..6] of string;

  // Impressao do Carimbo (Impressora Epson)
  vlEpsonPorta, vlImpControleSuperior, vlControleCarimbo, vlDivisoria : string;
  vlEpsonFormatacaoPadrao, vlEpsonFontePadrao, vlEpsonBobina : Integer;

  Function AdicionarFinal(vpTexto : String):String;
  begin
    while (length(vpTexto) < (viBobina-2)) do
      vpTexto := vpTexto + '.';
    Result := vpTexto;
  end;

  procedure PosicaoImpressao;
  begin
    if not vpInvertido then
         prn.Write(#27'{'#0) // Desativa impressão invertida
    else prn.Write(#27'{'#1); // Ativa impressão invertida
  end;

  // Configurações Padrão
  Procedure IniciarConfiguracaoPadrao(vpFonte, vpFormatacao : Integer);
  begin
    Case vpFonte of
     1 : viFontePadrao := pfs12cpi;
     2 : viFontePadrao := pfs10cpi;
     3 : viFontePadrao := pfs5cpi;
    end;

    Case vlEpsonBobina of
     1 : viBobina := 42;
     2 : viBobina := 35;
     3 : viBobina := 17;
    end;

    Case vpFormatacao of
     1 : viFormatacaoPadrao := [];
     2 : viFormatacaoPadrao := [psUnderline];
     3 : viFormatacaoPadrao := [psBold];
     4 : viFormatacaoPadrao := [psBold, psUnderline];
    end;
    prn.FontSize  := viFontePadrao;
    prn.TextStyle := viFormatacaoPadrao;
  end;

  // Inicia a Impressão
  Procedure IniciarImpressao;
  begin
    prn := TAdvancedPrinter.Create;
    prn.OpenDoc('Normal');
    IniciarConfiguracaoPadrao(vlEpsonFontePadrao, vlEpsonFormatacaoPadrao);

    PosicaoImpressao;
    if (vlImpControleSuperior = 'N') and (not vpInvertido) then
    begin
      prn.Write(#186);
      prn.WriteRight(#186,' ', viBobina-1);
      prn.CRLF;
      Prn.Write (#27'K'#13);
      prn.Write(vlDivisoria);
    end
    else
    begin
      prn.Write(#186);
      prn.CRLF;
      Prn.Write (#27'K'#13);
      if vlControleCarimbo = 'S' then
      begin
        Prn.Write (' ');
        prn.WriteRight('Controle:'+vgDadosCarimbo.ChaveEtiqueta,'-',viBobina-1);
      end
      else prn.Write(vlDivisoria);
    end;
    Prn.Write (#27'J'#2);
  end;

  // Finaliza a Impressao
  Procedure FinalizarImpressao;
  begin
    PosicaoImpressao;
    if (vlImpControleSuperior = 'S') or (vpInvertido) then
    begin
      prn.Write(vlDivisoria);
      prn.CRLF;
      Prn.Write (#27'K'#13);
      prn.Write(#186);
      prn.WriteRight(#186,' ', viBobina-1);
    end
    else
    begin
      if vlControleCarimbo = 'S' then
      begin
//        Prn.Write (' ');
        prn.WriteRight('Controle:'+vgDadosCarimbo.ChaveEtiqueta,'-',viBobina-1);
      end
      else prn.Write(vlDivisoria);
      prn.CRLF;
      Prn.Write (#27'K'#13);
      prn.Write(#186);
      prn.WriteRight(#186,' ', viBobina-1);
    end;
    Prn.Write (#27'J'#5);
    prn.Write(#27#113);
    prn.CloseDoc;
    Sleep(2000);
  end;

  // Imprime Texto da Linha
  procedure ImprimirLinha(vpTexto : string);
  begin
    PosicaoImpressao;
    if (Length(Codigo) <> 3) then
    begin
      if Codigo = '' then
        prn.WriteLeft(vpTexto,' ',viBobina, True)
      else
        if Codigo[1] = 'R' then
          prn.WriteLeft('-','-',viBobina, True)
      else
        if Codigo[1] = 'C' then
          prn.WriteLeft(vpTexto,'.',viBobina, True);
    end
    else
    begin
      IniciarConfiguracaoPadrao(StrToInt(codigo[1]), StrToInt(codigo[2]));
      case Codigo[3] of
       '1' : prn.WriteLeft(vpTexto,' ',viBobina, True);
       '2' : prn.WriteRight(vpTexto,' ',viBobina, True);
       '3' : prn.WriteCenter(vpTexto,' ',viBobina, True);
      end;
      IniciarConfiguracaoPadrao(StrToInt(Codigo[1]), StrToInt(Codigo[2]));
    end;
    Prn.Write (#27'J'#5);
  end;

  // Separador de Nomes do Reconhecimento
  function SepararNomeS(vpTexto : String):String;
  var
    k : integer;
  begin
    Result := '';
    for k := 1 to (length(vpTexto)) do
    begin
      if vpTexto[k] <> '#' then
      begin
        Result := Result + Copy(vpTexto,k,1);
        delete(TextoNome,1,1);
      end
      else
      begin
        delete(TextoNome,1,1);
        Break;
      end;
    end;
  end;

  procedure VerificarTextoInvertido;
  var
    viPosicao : Integer;
  begin
    if (vpInvertido) and (pos('#', Texto) > 0) then
    begin
      repeat
        viPosicao := pos('#', Texto);
        if viPosicao = 0 then
          viPosicao := Length(Texto)+1;
        inc(viQtdTextoTemp);
        viTextoTemp[viQtdTextoTemp] := copy(Texto, 1, viPosicao-1);
        Delete(Texto, 1, viPosicao);
      until (Texto = '');
      viContinuar := False;
      viTextoTemp[5] := Codigo;
      viTextoTemp[6] := Aux;
    end;
  end;

begin
  if vgId = 2 then
  begin
    // ImpressoraEpson
    vlEpsonFormatacaoPadrao := dtmControles.BuscarConfig('SERVICO_GERAL','EPSON','FORMATACAO_PADRAO','I');
    vlEpsonFontePadrao      := dtmControles.BuscarConfig('SERVICO_GERAL','EPSON','FONTE_PADRAO','I');
    vlEpsonBobina           := dtmControles.BuscarConfig('SERVICO_GERAL','EPSON','QTD_CARACTERES','I');
    vlEpsonPorta            := dtmControles.BuscarConfig('SERVICO_GERAL','EPSON','PORTA_IMPRESSORA','S');
    vlImpControleSuperior   := dtmControles.BuscarConfig('SERVICO_GERAL','EPSON','IMP_CONTROLE_SUPERIOR','S');
    vlControleCarimbo   := dtmControles.BuscarConfig('SERVICO_GERAL','EPSON','CONTROLE_CARIMBO','S');
  end
  else
  begin
    // ImpressoraEpson
    vlEpsonFormatacaoPadrao := dtmControles.BuscarParametroOutroSistema('FORMATACAO_PADRAO', 'EPSON','IMPRESSORA','5');
    vlEpsonFontePadrao      := dtmControles.BuscarParametroOutroSistema('FONTE_PADRAO','EPSON','IMPRESSORA','5');
    vlEpsonBobina           := dtmControles.BuscarParametroOutroSistema('QTD_CARACTERES','EPSON','IMPRESSORA','5');
    vlEpsonPorta            := dtmControles.BuscarParametroOutroSistema('PORTA_IMPRESSORA','EPSON','IMPRESSORA', '5');
    vlImpControleSuperior   := dtmControles.BuscarParametroOutroSistema('IMP_CONTROLE_SUPERIOR','EPSON','IMPRESSORA','5');
    vlControleCarimbo       := dtmControles.BuscarParametroOutroSistema('CONTROLE_CARIMBO','EPSON','IMPRESSORA','5');
  end;

  case vlEpsonBobina of
   1 : vlDivisoria := ' ---------------------------------------- ';
   2 : vlDivisoria := ' --------------------------------- ';
   3 : vlDivisoria := ' --------------- ';
  end;

  MudarImpressora(vlEpsonPorta, '');

  IniciarImpressao;
  viFlag          := True;
  TextoNome       := '';
  viCont          := 0;
  viDividir       := False;
  viQtdTextoTemp  := 0;
  Buffer          := '';

  // Executa até a ultima linha encontrada
  for i := 0 to wptTexto.Lines.Count - 1 do
  begin

    if vpInvertido then
         Aux := wptTexto.Lines.Strings[wptTexto.Lines.Count - 1 - i]
    else Aux := wptTexto.Lines.Strings[i];

    Codigo      := '';
    Texto       := Aux;
    viContinuar := True;

    repeat
      if viQtdTextoTemp > 0 then
      begin
        Texto := viTextoTemp[viQtdTextoTemp];
        Codigo      := 'C.';
        Aux         := '';
        viContinuar := True;
      end;

      // Faz a Leitura do Codigo da Linha
      while (Pos('[', Aux) <> 0) or (viQtdTextoTemp > 0) do
      begin
        if viQtdTextoTemp = 0 then
        begin
          Codigo := Copy(Aux,Pos('[', Aux)+1, Pos(']', Aux)-2);
          Delete(Aux, Pos('[', Aux), Pos(']', Aux));
          if Pos('[', Aux) <> 0 then
            Texto  := Copy(Aux,1 , Pos('[', Aux)-1)
          else
          begin
            Texto := Aux;
            Aux   := '';
          end;
          Delete(Aux, 1, Pos('[', Aux) -1);
        end
        else Dec(viQtdTextoTemp);

        VerificarTextoInvertido;
        if not viContinuar then
          Break;

        // Verifica se o Texto é maior que o permitido de caracteres e se a impressão é invertida
        if (Length(Texto) > (viBobina-2)) and vpInvertido then
        begin
          viTextInvertido1 := copy(Texto, 1, (viBobina-2));
          viTextInvertido2 := AdicionarFinal(copy(Texto, (viBobina-1), ((viBobina-2)*2)));
          if Length(Texto) > ((viBobina-2)*2) then
               viTextInvertido3 := AdicionarFinal(copy(Texto, ((viBobina-2)*2)+1, ((viBobina-2)*3)))
          else viTextInvertido3 := '';
          Texto := viTextInvertido3+viTextInvertido2+viTextInvertido1;
        end;

        // *** Quando acumula as Linhas até encontrar o Codigo de Final (T)
        if (Codigo = 'S') or (not viFlag) then
        begin
          Buffer := Buffer + Texto;
          viFlag := False;
        end;

        if Codigo = 'T' then
        begin
          viFlag    := True;
          viDividir := true;
        end;

        if viQtdTextoTemp > 0 then
          Break;
      end;
      // *** Final acumula as Linhas até encontrar o Codigo de Final (T)

      // Inicio do Procedimento da Impressao da Linha
      if viFlag and viContinuar then
      begin
        if viDividir then
          TextoNome := Buffer;

        repeat
          if TextoNome <> '' then
            Texto := SepararNomeS(TextoNome);

          repeat
            if (Length(texto)) > (viBobina-2) then
            begin
              Buffer := '';
              for j := 1 to (viBobina-2) do
              begin
                Buffer := Buffer + Copy(Texto,1,1);
                delete(Texto,1,1);
              end;
            end
            else
            begin
              Buffer := Texto;
              Texto  := '';
            end;

            // Controle de Buffer da Impressora
            inc(viCont);
            if viCont > 7 then
            begin
              viCont := 0;
              prn.CloseDoc;
              FreeAndNil(prn);
              Sleep(4300);
              prn := TAdvancedPrinter.Create;
              prn.OpenDoc('Normal');
              IniciarConfiguracaoPadrao(vlEpsonFontePadrao, vlEpsonFormatacaoPadrao);
            end;

            ImprimirLinha(Buffer);
          until Texto = '';

        until TextoNome = '';
      end;
      Buffer    := '';
      viDividir := False;
    until viQtdTextoTemp = 0;
  end;
  FinalizarImpressao;

  if prn <> nil then
    FreeAndNil(prn);
end;

procedure TdtmControles.IniciarCapturaConfiguracoes(
  const vpSistemaDAOFactory: IFactory<ISistemaDAO>;
  const vpConfiguracaoGrupoDAOFactory: IFactory<IConfiguracaoGrupoDAO>;
  const vpConfiguracaoDAOFactory: IFactory<IConfiguracaoDAO>);
begin
  FSistemaDAOFactory := vpSistemaDAOFactory;
  FConfiguracaoGrupoDAOFactory := vpConfiguracaoGrupoDAOFactory;
  FConfiguracaoDAOFactory := vpConfiguracaoDAOFactory;

  FCapturaConfiguracoes := TSome<ICapturaConfiguracoes>
    .New(
      TCapturaConfiguracoes
      .New(
        TListFactory<IConfiguracao>
        .New
        .GetInstance));
end;

function TdtmControles.IsAdmin(
  const vpLogin: string;
  const vpSenha: string): Boolean;
begin
  Result := IsLoginAdmin(
    vpLogin) and
    IsSenhaAdmin(
      vpSenha);
end;

function TdtmControles.IsLoginAdmin(
  const vpLogin: string): Boolean;
begin
  Result := vpLogin.Equals(
    LoginAdmin);
end;

function TdtmControles.IsNotVersaoTeste(
  const vpVersao: string): Boolean;
begin
  Result := not IsVersaoTeste(vpVersao);
end;

function TdtmControles.IsSenhaAdmin(
  const vpSenha: string): Boolean;
begin
  Result := vpSenha.Equals(
    SenhaAdmin);
end;

function TdtmControles.IsVersaoTeste(
  const vpVersao: string): Boolean;
{$REGION 'Constantes'}
const
  CI_TESTE: string = 'T';
{$ENDREGION}
begin
  Result := vpVersao.Contains(CI_TESTE);
end;

procedure TdtmControles.LimparConfiguracoesCapturadas;
begin
  VerificarCapturaConfiguracoesIniciada;
  FCapturaConfiguracoes.Value.ConfiguracoesCapturadas.Clear;
end;

function TdtmControles.LinkSuporte: string;
begin
  Result := BuscarParametroOutroSistema(
    'LINK_SUPORTE',
    'GERAL',
    'PRINCIPAL',
    '5');
end;

function TdtmControles.LinkSuportePadrao: string;
begin
  Result := 'http://tri7.mysuite2.com.br/clientlegume.php?param=' +
    'hd_chat_gc_cad_chatdep&cdu=&inf=&sl=tri7&lf=&ca=&cr=&idm=&cdu=' +
    '1&redirect=http://tri7.mysuite2.com.br/empresas/tri7/central.php';
end;

function TdtmControles.LoginAdmin: string;
begin
  Result := 'TRI7';
end;

function TdtmControles.MetodoArredondamento: TMetodoArredondamento;
begin
  Result := FMetodoArredondamento;
end;

function TdtmControles.MetodoArredondamentoParametro: Integer;
begin
  Result := BuscarParametroOutroSistema(
    'METODO_ARREDONDAMENTO',
    'GERAL',
    'PRINCIPAL',
    '5');
end;

procedure TdtmControles.MostraErro(E: Exception);
var Erro: string;
begin
  Erro := E.Message;
  if (Pos('PRIMARY OR UNIQUE', UpperCase(Erro)) > 0) or (Pos(EKeyViolation, UpperCase(Erro)) > 0) then
    Application.MessageBox('Este ítem já consta no cadastro!', 'Erro', mb_Ok +
      mb_IconError)
  else if Pos(EFKeyViolation, UpperCase(Erro)) > 0 then
          Application.MessageBox('Este registro não pode ser excluido pois esta sendo usado em outro local!', 'Erro', mb_Ok + mb_IconError)
       else Application.MessageBox(PWideChar(copy(Erro, pos('@',Erro)+1,Length(Erro))), 'Erro', mb_Ok + mb_IconError);
end;

procedure TdtmControles.Roolback;
begin
  DB.Rollback(TD);
end;

procedure TdtmControles.StartTransaction;
begin
  {Verifica se já não está em uma transação}
  if not DB.InTransaction then
  begin
    Randomize;
    TD.TransactionID  := RandomRange(1, 9999);
    TD.IsolationLevel := xilREADCOMMITTED;
    DB.StartTransaction(TD);
  end;
end;

function TdtmControles.Suporte(
  const vpTipo: string = '1'): Integer;
begin
  Result := ShellExecute(
    Application.Handle,
    PWideChar(
      'open'),
    PWideChar(
      IfThen(
        vpTipo.Equals(
          '1'),
        LinkSuporte,
        SiteTri7)),
    nil,
    nil,
    SW_SHOW);
end;

procedure TdtmControles.TerminarCapturaConfiguracoes;
begin
  FCapturaConfiguracoes := TNone<ICapturaConfiguracoes>.New;
end;

procedure VerificarPreenchimentoDTA_DB(vpDado, vpNomeCampo : string; var vpCampo : TcxDBDateEdit);
begin
  if trim(vpDado) = '' then
  begin
    Application.MessageBox(Pchar('Campo '+vpNomeCampo+ ' não pode ser vazio!!!'), 'Aviso', MB_OK + MB_DEFBUTTON1 + MB_ICONINFORMATION);
    vpCampo.SetFocus;
    Abort;
  end;
end;

procedure VerificarPreenchimentoDTA_TX(vpDado, vpNomeCampo : string; var vpCampo : TcxDateEdit);
begin
  if (trim(vpDado) = '') or (vpDado = '  /  /    ') then
  begin
    Application.MessageBox(Pchar('Campo '+vpNomeCampo+ ' não pode ser vazio!!!'), 'Aviso', MB_OK + MB_DEFBUTTON1 + MB_ICONINFORMATION);
    vpCampo.SetFocus;
    Abort;
  end;
end;

procedure VerificarPreenchimentoTIME_DB(vpDado, vpNomeCampo : string; var vpCampo : TcxDBTimeEdit);
begin
  if trim(vpDado) = '' then
  begin
    Application.MessageBox(Pchar('Campo '+vpNomeCampo+ ' não pode ser vazio!!!'), 'Aviso', MB_OK + MB_DEFBUTTON1 + MB_ICONINFORMATION);
    vpCampo.SetFocus;
    Abort;
  end;
end;

procedure VerificarPreenchimentoLCX_DB(vpDado, vpNomeCampo : string; var vpCampo : TcxDBLookupComboBox);
begin
  if trim(vpDado) = '' then
  begin
    Application.MessageBox(Pchar('Campo '+vpNomeCampo+ ' não pode ser vazio!!!'), 'Aviso', MB_OK + MB_DEFBUTTON1 + MB_ICONINFORMATION);
    if vpCampo.Enabled then
      vpCampo.SetFocus;
    Abort;
  end;
end;

procedure VerificarPreenchimentoICX_DB(vpDado, vpNomeCampo : string; var vpCampo : TcxDBImageComboBox);
begin
  if trim(vpDado) = '' then
  begin
    Application.MessageBox(Pchar('Campo '+vpNomeCampo+ ' não pode ser vazio!!!'), 'Aviso', MB_OK + MB_DEFBUTTON1 + MB_ICONINFORMATION);
    vpCampo.SetFocus;
    Abort;
  end;
end;

procedure VerificarPreenchimentoEDT_DB(vpDado, vpNomeCampo : string; var vpCampo : TcxDbTextEdit);
begin
  if trim(vpDado) = '' then
  begin
    Application.MessageBox(Pchar('Campo '+vpNomeCampo+ ' não pode ser vazio!!!'), 'Aviso', MB_OK + MB_DEFBUTTON1 + MB_ICONINFORMATION);
    vpCampo.SetFocus;
    Abort;
  end;
end;

procedure VerificarPreenchimentoLCX_TX(vpDado, vpNomeCampo : string; var vpCampo : TcxLookupComboBox);
begin
  if trim(vpDado) = '' then
  begin
    Application.MessageBox(Pchar('Campo '+vpNomeCampo+ ' não pode ser vazio!!!'), 'Aviso', MB_OK + MB_DEFBUTTON1 + MB_ICONINFORMATION);
    vpCampo.SetFocus;
    Abort;
  end;
end;

procedure VerificarPreenchimentoICX_TX(vpDado, vpNomeCampo : string; var vpCampo : TcxImageComboBox);
begin
  if trim(vpDado) = '' then
  begin
    Application.MessageBox(Pchar('Campo '+vpNomeCampo+ ' não pode ser vazio!!!'), 'Aviso', MB_OK + MB_DEFBUTTON1 + MB_ICONINFORMATION);
    vpCampo.SetFocus;
    Abort;
  end;
end;

procedure VerificarPreenchimentoEDT_TX(vpDado, vpNomeCampo : string; var vpCampo : TcxTextEdit);
begin
  if trim(vpDado) = '' then
  begin
    Application.MessageBox(Pchar('Campo '+vpNomeCampo+ ' não pode ser vazio!!!'), 'Aviso ', MB_OK + MB_DEFBUTTON1 + MB_ICONINFORMATION);
    vpCampo.SetFocus;
    Abort;
  end;
end;

function GetCodigoControle(vpControleId : String = '0') : String;
var
  Chave : String;
begin
  Randomize;
  Chave  := vpControleId + IntToStr(DayOf(Date)) + IntToStr(MinuteOf(Time)) + IntToStr(Random(99)) + IntToStr(Random(99));
  Result := dtmControles.Cripto.TextToCriptoHex(Chave);
end;

procedure VerificarPreenchimentoCBX_DB(vpDado, vpNomeCampo : string; var vpCampo : TcxDBComboBox);
begin
  if trim(vpDado) = '' then
  begin
    Application.MessageBox(Pchar('Campo '+vpNomeCampo+ ' não pode ser vazio!!!'), 'Aviso', MB_OK + MB_DEFBUTTON1 + MB_ICONINFORMATION);
    vpCampo.SetFocus;
    Abort;
  end;
end;

procedure VerificarPreenchimentoCBX_TX(vpDado, vpNomeCampo : string; var vpCampo : TcxComboBox);
begin
  if trim(vpDado) = '' then
  begin
    Application.MessageBox(Pchar('Campo '+vpNomeCampo+ ' não pode ser vazio!!!'), 'Aviso', MB_OK + MB_DEFBUTTON1 + MB_ICONINFORMATION);
    vpCampo.SetFocus;
    Abort;
  end;
end;

procedure VerificarPreenchimentoCUR_DB(vpDado: Currency; vpNomeCampo: string;
  var vpCampo: TcxDBCurrencyEdit);
begin
  if (vpDado <= 0) then
  begin
    Application.MessageBox(Pchar('Campo ' + vpNomeCampo +
      ' com valor inválido!!!'), 'Aviso', mb_Ok + MB_DEFBUTTON1 +
      MB_ICONINFORMATION);
    vpCampo.SetFocus;
    Abort;
  end;
end;

procedure VerificarPreenchimentoCUR_TX(vpDado: Currency; vpNomeCampo: string;
  var vpCampo: TcxCurrencyEdit);
begin
  if (vpDado <= 0) then
  begin
    Application.MessageBox(Pchar('Campo ' + vpNomeCampo +
      ' com valor inválido!!!'), 'Aviso', mb_Ok + MB_DEFBUTTON1 +
      MB_ICONINFORMATION);
    vpCampo.SetFocus;
    Abort;
  end;
end;



procedure TdtmControles.CRTemp_DBBeforeConnect(Sender: TObject);
var
  Ini  : TIniFile;
  viSerialMaster, viTipoUnidade, viBaseNome, viBaseDados : String;
  viDesenvolvedor : Boolean;
begin
  Cripto.Key := vgChaveSecao;
  //Busca Valores para variáveis de acesso ao banco
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Master.ini');
  viSerialMaster  := Cripto.CriptoHexToText(Ini.ReadString('MASTER', 'Maquina', ''));
  viDesenvolvedor := Ini.ReadString('MASTER', 'Desenvolvedor', '') = 'S';
  Ini.Free;

  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Config.ini');
  viTipoUnidade := Cripto.CriptoHexToText(Ini.ReadString('GERAL', 'TipoUnidade', ''));
  viBaseNome    := Cripto.CriptoHexToText(Ini.ReadString('GERAL', 'BaseNome', ''));
  Ini.Free;

  vgExecutarSistema := True;

  if (vgChaveSecao = 'Grupo@I9vare@Tri7') and not(viDesenvolvedor) then
  begin
    if (DebugHook  = 0) then
      if not (TravaSistema(dtmControles.Cripto.CriptoHexToText(vgKey), viSerialMaster)) then
      begin
        vgExecutarSistema := False;
        Application.MessageBox(PChar('Sistema não pode ser utilizado nesta máquina!' + #13#10 +
                                     'Favor entrar em contato com o administrador do sistema.'), 'Atenção', MB_OK + MB_ICONWARNING);
        Application.Terminate;
      end;
  end;

  //Passa os parametros para o Banco de Dados
  //DB.Params.Clear;
  if UpperCase(vgTipoConexao) = 'DEVART' then
  begin
    //Devart
    DB.DriverName      := 'DevartInterBase';
    DB.ConnectionName  := 'Devart InterBase';
    DB.LibraryName     := 'dbexpida40.dll';
    DB.VendorLib       := 'fbclient.dll';

    DB.GetDriverFunc   := 'getSQLDriverInterBase';
    DB.Params.Values['OptimizedNumerics'] := 'False';
    DB.Params.Values['useUnicode']        := 'False';
    DB.Params.Values['DeferredBlobRead']  := 'True';
    DB.Params.Values['DeferredArrayRead'] := 'True';
    DB.Params.Values['Prepared']          := 'False';
    DB.Params.Values['Reconnect']         := 'True';
  end
  else
  begin
    //Embarcadeiro
    DB.DriverName      := 'Firebird';
    DB.ConnectionName  := 'FBConnection';
    DB.LibraryName     := 'dbxfb.dll';
    DB.VendorLib       := 'fbclient.dll';
  end;

  DB.Params.Values['BLobSize']           := '-1';
  DB.Params.Values['ErrorResourceFile']  := '';
  DB.Params.Values['LocaleCode']         := '0000';
  DB.Params.Values['Interbase TransIsolation'] := 'ReadCommited';
  DB.Params.Values['CommitRetain']   := 'False';
  DB.Params.Values['RoleName']       := 'RoleName';
  DB.Params.Values['ServerCharSet']  := 'ISO8859_1';
  DB.Params.Values['SQLDialect']     := '3';
  DB.Params.Values['WaitOnLocks']    := 'True';

  if (viTipoUnidade = 'USB') then
    viBaseDados := ExtractFilePath(Application.ExeName)+'\'+viBaseNome+'.FDB'
  else
    if (vgBaseDados = '') then
         viBaseDados := '127.0.0.1:'+ExtractFilePath(Application.ExeName)+'\BASE\'+viBaseNome+'.FDB'
    else viBaseDados := Cripto.CriptoHexToText(vgBaseDados);

  DB.Params.Values['DataBase']           := viBaseDados;
  DB.Params.Values['User_Name']          := Cripto.CriptoHexToText(vgUsuario);
  DB.Params.Values['Password']           := Cripto.CriptoHexToText(vgSenha);
end;

procedure TdtmControles.BuscarIpRede(var vpComboBox : TcxComboBox);
{var
  i, viFlag : integer;
  viRede  : string;
begin
  Screen.Cursor := crHourGlass;

  viFlag := 0;
  with dtmControles do
  begin
   for i := 1 to 15 do
   begin
     if IdIPWatch.LocalIP[i] = '.' then
       inc(viFlag);
      viRede := viRede + IdIPWatch.LocalIP[i];

      if viFlag = 3 then
        Break;
    end;

    for i := 1 to 254 do
    begin
      dtmControles.IdIcmpClient1.Host := viRede+IntToStr(i);
      IdIcmpClient1.TTL := 50;
      IdIcmpClient1.ReceiveTimeout := 50;
      IdIcmpClient1.Ping;

      if IdIcmpClient1.ReplyStatus.ReplyStatusType = rsEcho then
        vpComboBox.Properties.Items.Add(IdIcmpClient1.ReplyStatus.FromIpAddress);
    end;
  end;
  Screen.Cursor := crDefault;}
begin
end;

function TdtmControles.BuscarParametroOutroSistema(vpNome, vpSecao, vpGrupo, vpSistema: String): Variant;
begin
  try
    ExecutaSqlAuxiliar(' SELECT VALOR FROM G_CONFIG '+
                       ' WHERE NOME = '+ QuotedStr(vpNome)+
                       '   AND SECAO    = '+ QuotedStr(vpSecao)+
                       '   AND CONFIG_GRUPO_ID = (SELECT CONFIG_GRUPO_ID FROM G_CONFIG_GRUPO '+
                       '                          WHERE DESCRICAO = '+QuotedStr(vpGrupo)+
                       '                            AND SISTEMA_ID = '+ vpSistema+')',0);
    result := dtmControles.sqlAuxiliar.FieldByName('VALOR').AsVariant;
    if Result = null then
      Result := '';

  finally
    dtmControles.sqlAuxiliar.Active := False;
  end;

  VerificarCapturaConfiguracao(
    vpSistema.ToInteger,
    vpGrupo,
    vpSecao,
    vpNome);
end;


procedure TdtmControles.DataModuleCreate(Sender: TObject);
{$REGION 'Variáveis'}
var
  viFundoTipoDAO: TFundoTipoDAO;
  viMetodoArredondamento: Integer;
{$ENDREGION}
begin
  TerminarCapturaConfiguracoes;
  ConfiguraRegiaoBR;
  ModificarDataSistema;
  //FormatSettings.Shortdateformat := 'dd/mm/yyyy';

  try
    DB.Connected := False;
    DB.Connected := True;

    DBH.Connected := False;
    DBH.Connected := True;
  except
    on e: exception do
    begin
      Application.MessageBox(Pchar('Não foi possível conectar no banco de Dados!'+#13+
        'Informe ao Suporte Técnico!'+ #13+' (' + e.Message + ')'), 'Erro', MB_ICONERROR);
      Application.Terminate;
    end;
  end;

  AtualizarEstruturaSistema;

  vgProximoDiaUtil := False;
  vgIPServidorHorario := '127.0.0.1';
  vgLogin := 'TRI7';

  vgDiretorioCorrente       := GetCurrentDir;
  SimpleAuxiliar.Connection := DB;
  sqlConfig.Connection      := DB;
  sqlFeriado.Connection  := DB;
  sqlAuxiliar.Connection := DB;
  sqlG_Agenda.Connection    := DB;
  sqlSistema.Connection     := DB;
  sqlSistema.Open;

  CriarFuncoesRelatorio(frxRelatorio);

  // Controle Fundos
  viFundoTipoDAO := TFundoTipoDAO.Create;
  try
    vgFundoTipos := viFundoTipoDAO.Get;
  finally
    viFundoTipoDAO.Free;
  end;

  StartTransaction;
  try
    VerificarLinkSuporte;
    Commit;
  except
    Roolback;
  end;

  //Carrega e Valida parâmetro IP do Servidor de Horário
  try
    vgIPServidorHorario := dtmControles.BuscarParametroOutroSistema('IP_SERVIDOR_HORARIO', 'GERAL','PRINCIPAL','5');
    if Trim (vgIPServidorHorario) = EmptyStr then
      vgIPServidorHorario := '127.0.0.1'
    else
    if IsWrongIP(vgIPServidorHorario) then
    begin
      ShowMessage('Parametro (Administrativo): PRINCIPAL/GERAL/IP_SERVIDOR_HORARIO não possui um IP valido!!!');
      vgIPServidorHorario := '127.0.0.1';
    end;

  except
    ShowMessage('Parametro (Administrativo): PRINCIPAL/GERAL/IP_SERVIDOR_HORARIO não configurado!!!');
    vgIPServidorHorario := '127.0.0.1';
  end;

  //Carrega e Valida parâmetro de Proximo dia últil para a rotina de DataHoraBanco
  try
    vgProximoDiaUtil := dtmControles.BuscarParametroOutroSistema('ATIVAR_PROXIMO_DIA_UTIL', 'GERAL','PRINCIPAL', vgId.ToString) = 'S';
  except
    ShowMessage('Parametro PRINCIPAL/GERAL/ATIVAR_PROXIMO_DIA_UTIL não configurado!!!');
    vgProximoDiaUtil := False;
  end;

  viMetodoArredondamento := MetodoArredondamentoParametro;
  if viMetodoArredondamento = 1 then
    FMetodoArredondamento := TMetodoArredondamento.maArimeticoSimetrico
  else
    FMetodoArredondamento := TMetodoArredondamento.maBanqueiro;
end;

function TdtmControles.GetFields(Qry: string): TStringList;
var
  SQL: TI9Query;
  C: integer;
begin
  Result := TStringList.Create;
  SQL := NewQuery;
  try
    SQL.SQL.Text := Qry;
    SQL.Open;
    if SQL.Active then
    begin
      C := 0;
      while C < SQL.Fields.Count do
      begin
        Result.Add(SQL.Fields[C].FieldName + '=' + PrepField(SQL.Fields[C]));
        Inc(C);
      end;

      SQL.Close;
    end
  except
    on E: exception do
      Application.MessageBox(Pchar(E.Message), 'Aviso', mb_IconExclamation);
  end;
  SQL.Free;
end;

function TdtmControles.BuscarRotina(Chave : String): String;
var Sql : String;
begin
  Result := '';
  Sql := 'SELECT CHAVE_ROTINA '+
         'FROM G_SISTEMA_ROTINA '+
         'WHERE (ATALHO_SISTEMA = ' + QuotedStr(Chave) + ') OR (ATALHO_USUARIO = ' + QuotedStr(Chave) + ')';
  Result := dtmControles.GetStr(Sql);
end;

procedure TdtmControles.RegistrarControleVersao(vpId : Integer; vpVersao : string);
{$REGION 'Variáveis'}
var
  viVersao: THttpVersao;
  viFechar: Boolean;
{$ENDREGION}
begin
  if vgControlarVersao.Equals('S') and
    IsNotVersaoTeste(vpVersao) then
  begin
    viVersao := THttpVersao.Create;
    viVersao.IdSistema    := IntToStr(vpId);
    viVersao.IdCartorio   := dtmControles.BuscarConfig('PRINCIPAL', 'CARTORIO', 'CODIGO', 'S');
    viVersao.NomeCartorio := dtmControles.BuscarConfig('PRINCIPAL', 'CARTORIO', 'NOME', 'S');
    viVersao.Cidade       := dtmControles.BuscarConfig('PRINCIPAL', 'CARTORIO', 'CIDADE', 'S');
    viVersao.Uf           := dtmControles.BuscarConfig('PRINCIPAL', 'CARTORIO', 'UF', 'S');
    viVersao.Versao       := vpVersao;
    viFechar := not viVersao.Execute;
    FreeAndNil(viVersao);

    if viFechar then
    begin
      vgChamarLogin := False;
      Application.Terminate;
    end;
  end;
end;

function TdtmControles.RetornaTexto(Str: String): String;
var wptAux : TWPRichText;
begin
  wptAux := TWPRichText.Create(nil);
  try
    wptAux.AsString := Str;
    Result := wptAux.Text;
  finally
    wptAux.Free;
  end;
end;

function TdtmControles.BuscarConfig(vpGrupo, vpSecao, vpNome : string; vpTipoValor: char): Variant;
begin
  try
    if sqlConfig.Locate('GRUPO;SECAO;NOME', VarArrayOf([UpperCase(vpGrupo), UpperCase(vpSecao), UpperCase(vpNome)]), [loCaseInsensitive]) then
    begin
      case vpTipoValor of
        'S' : BuscarConfig := dtmControles.sqlConfig.FieldByName('VALOR').AsString;
        'D' : BuscarConfig := dtmControles.sqlConfig.FieldByName('VALOR').AsCurrency;
        'I' : BuscarConfig := dtmControles.sqlConfig.FieldByName('VALOR').AsInteger;
        'T' : BuscarConfig := DeCompressString(dtmControles.sqlConfig.FieldByName('TEXTO').AsString);
        'W' : BuscarConfig := RetornaTexto(DeCompressString(dtmControles.sqlConfig.FieldByName('TEXTO').AsString));
      end;

      VerificarCapturaConfiguracao(
        sqlConfig.ParamByName(
          'SISTEMA_ID').AsInteger,
        vpGrupo,
        vpSecao,
        vpNome);
    end
    else
      StrToInt('');
  except
    Application.MessageBox(Pchar('Parâmetro: '+vpGrupo+'/'+vpSecao+'/'+vpNome+' Desatualizado. '+ #13 +
                                 'Favor informar o Suporte Técnico!'), 'Aviso', MB_OK + MB_DEFBUTTON1 + MB_ICONINFORMATION);
    if vpTipoValor in ['S', 'T'] then
         BuscarConfig := ''
    else BuscarConfig := 0;
  end;
end;

function MontarSqlData(DataIni, DataFim: TDateTime): string;
begin
  if UpperCase(dtmControles.Cripto.CriptoHexToText(vgTipoBanco)) = 'ORACLE' then
  begin
    Result := ' BETWEEN TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',DataIni)) + ',' + QuotedStr('DD/MM/RRRR') + ') ' +
              '     AND TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',DataFim)) + ',' + QuotedStr('DD/MM/RRRR') + ') + 0.9999 ';
  end
  else
  begin
    Result := ' BETWEEN CAST(' + QuotedStr(FormatDateTime('YYYY/MM/DD',DataIni)) + ' AS TIMESTAMP) ' +
              '     AND CAST(' + QuotedStr(FormatDateTime('YYYY/MM/DD',DataFim)) + ' AS TIMESTAMP) + 0.9999 ';
  end;
end;

function TdtmControles.DataHoraBanco(vpParametro: Integer): Variant;
{1 = Data em string; 2 = Hora em string ; 3 = DataHora em TDateTime;
4 = Data em String Normal; 5 = DataHora em String; 6 = Hora/Minuto/Segundo em String}
{$REGION 'Variáveis'}
var
  vlData, vlHora, vlHoraMinSeg, vlDataNormal: string;
  vlDataHora: TDateTime;
  vlDataHoraStr: String;
{$ENDREGION}
begin
  //Determina a forma de obter a Data e Hora do banco
  if UpperCase(vgIPServidorHorario) = '127.0.0.1' then
    vlDataHora := Rotinas.GetDataHoraRede(vgIPServidorHorario)
  else
    vlDataHora := StrToDateTime(GetStr('SELECT CURRENT_TIMESTAMP FROM RDB$DATABASE'));

  if vgProximoDiaUtil then
    vlDataHora := VerificarProximoDiaUtil(vlDataHora);

  vlData        := FormatDateTime('YYYY/MM/DD',vlDataHora);
  vlDataNormal  := FormatDateTime('DD/MM/YYYY',vlDataHora);
  vlDataHoraStr := FormatDateTime('DD.MM.YYYY HH:MM:SS', vlDataHora);

  vlHora          := FormatDateTime('hh:mm',vlDataHora);
  vlHoraMinSeg    := FormatDateTime('hh:mm:ss',vlDataHora);

  case vpParametro of
    1: DataHoraBanco := vlData;
    2: DataHoraBanco := vlHora;
    3: DataHoraBanco := vlDataHora;
    4: DataHoraBanco := vlDataNormal;
    5: DataHoraBanco := vlDataHoraStr;
    6: DataHoraBanco := vlHoraMinSeg;
  end;
end;

procedure TdtmControles.CriarImagem(wptTexto : TWPRichText; Arquivo : String; Tipo : Byte = 1);
var bit: TBitmap;
    w, h: Integer;
const pagno = 0;
begin
  bit := TBitmap.Create;
  bit.PixelFormat := pf8bit;

  w := Round(MulDiv(wptTexto.Header.PageWidth, 300, 1440)/3);
  bit.Width := w;

  h := Round(MulDiv(wptTexto.Header.PageHeight, 300, 1440)/3);
  bit.Height := h;

  bit.Canvas.Brush.Color := clWhite;
  bit.Canvas.FillRect(Rect(0, 0, bit.Width, bit.Height));
  bit.Canvas.FillRect(Rect(0, 0, w, h));

  wptTexto.ReformatAll;
  wptTexto.PrintPageOnCanvas(bit.Canvas,
  Rect(0, 0, w, h), pagno, [ppmPaintTransparent, // ppmPrintFrame,
  ppmStretchWidth, ppmStretchHeight, ppmIgnoreSelection, ppmUseEvents], 0);

  DeleteFile(Arquivo);
  bit.SaveToFile(Arquivo);
  bit.free;
end;

procedure TdtmControles.DataModuleDestroy(Sender: TObject);
begin
  if vgUsuarioID <> '' then
    DesativarConexao(StrToInt(vgUsuarioID),vgId);

  DB.Close;
  DBH.Close;
  vgFundoTipos.Free;
  CleanupRegisteredGlobalObjects;
end;

procedure TdtmControles.CarregarConfig;

begin
  dtmControles.sqlConfig.Close;
  dtmControles.sqlConfig.ParamByName('TERMINAL').AsString    := Rotinas.NomeEstacao;

  if vgId = 20 then
       dtmControles.sqlConfig.ParamByName('SISTEMA_ID').AsInteger := 5
  else dtmControles.sqlConfig.ParamByName('SISTEMA_ID').AsInteger := vgId;

  dtmControles.sqlConfig.Open;
  vgNumeRegHistorico := BuscarConfig('PRINCIPAL', 'GERAL', 'QTDEREG_HISTORICO', 'I');
end;

procedure TdtmControles.CarregarParametrosDoSistema;
begin
//  vgCartorio := dtmControles.BuscarConfig('PRINCIPAL', 'CARTORIO', 'CARTORIO_NUMERO', 'S');
  vgCidade   := dtmControles.BuscarConfig('PRINCIPAL', 'CARTORIO', 'CIDADE', 'S');
  vgUF       := AnsiUpperCase(dtmControles.BuscarConfig('PRINCIPAL', 'CARTORIO', 'UF', 'S'));
end;

procedure TdtmControles.CarregarSistemasTab(vpTabControl: TcxTabControl;
  vpAdicionarTodas, vpSomenteSistemasEmol: Boolean);
var
  i : Integer;
begin
  vpTabControl.Tabs.Clear;
  if vpAdicionarTodas then
    vpTabControl.Tabs.Add('<< Todas Serventias >>');

  sqlSistema.First;
  i := 0;
  while not sqlSistema.Eof do
  begin
    if (not vpSomenteSistemasEmol) or ((vpSomenteSistemasEmol) and (sqlSistemaSISTEMA_ID.AsInteger in [1,2,7,12,13])) then
    begin
      inc(i);
      vgListaSistemas[i-1] := sqlSistemaSISTEMA_ID.AsInteger;
      vpTabControl.Tabs.Add(sqlSistemaDESCRICAO.AsString);
    end;
    sqlSistema.Next;
  end;
end;

procedure TdtmControles.Auditoria(Tabela, Campo, Operacao, Valor, ID, Observacao: String);
var
  Sql,
  TabelaAuditoria : String;
  sqlAuditor : TI9Query;
  viTexto : TStringStream;
begin
  case vgId of
    1    : TabelaAuditoria := 'R_HISTORICO';
    2    : TabelaAuditoria := 'T_HISTORICO';
    5,20 : TabelaAuditoria := 'C_HISTORICO';
    7    : TabelaAuditoria := 'D_HISTORICO';
    12   : TabelaAuditoria := 'V_HISTORICO';
    13   : TabelaAuditoria := 'P_HISTORICO';
    15   : TabelaAuditoria := 'S_HISTORICO';
  end;

  viTexto := CompressStringStream(Valor);

  sqlAuditor := TI9Query.Create(Application);
  sqlAuditor.Connection := DBH;

  Sql := 'INSERT INTO '+  TabelaAuditoria + ' ( '+
         '            HISTORICO_ID, '+
         '            TABELA, '+
         '            CAMPO, '+
         '            OPERACAO, '+
         '            NEW_VALUE, '+
         '            DATA, '+
         '            USUARIO_ID, '+
         '            ID, '+
         '            OBSERVACAO) '+
         'VALUES ( '+
         '             :HISTORICO_ID, '+
         '             :TABELA, '+
         '             :CAMPO, '+
         '             :OPERACAO, '+
         '             :NEW_VALUE, '+
         '             :DATA, '+
         '             :USUARIO_ID, '+
         '             :ID, '+
         '             :OBSERVACAO); ';

  sqlAuditor.SQL.Text := Sql;

  sqlAuditor.ParamByName('HISTORICO_ID').AsInteger := GerarSequencia(TabelaAuditoria);
  sqlAuditor.ParamByName('TABELA').AsString := Tabela;
  sqlAuditor.ParamByName('CAMPO').AsString := Campo;
  sqlAuditor.ParamByName('OPERACAO').AsString := Operacao;
  sqlAuditor.ParamByName('NEW_VALUE').LoadFromStream(viTexto, ftBlob);
  sqlAuditor.ParamByName('DATA').AsString := DataHoraBanco(5);
  sqlAuditor.ParamByName('USUARIO_ID').AsString := vgUsuarioID;
  sqlAuditor.ParamByName('ID').AsString := ID;
  sqlAuditor.ParamByName('OBSERVACAO').AsString := Observacao;

  sqlAuditor.Execute;
  Application.ProcessMessages;
  sqlAuditor.Free;

  FreeAndNil(viTexto);
end;

function TdtmControles.CapturaConfiguracoesIniciada: Boolean;
begin
  Result := FCapturaConfiguracoes.HasValue;
end;

procedure TdtmControles.CapturaErro(Sender: TObject; E: Exception);
var
  msg: string;
begin
  StartTransaction;
  try
    with SimpleAuxiliar do
    begin
      Active := False;
      SQL.Text := ' SELECT * FROM G_LOG_ERRO '+
                             ' WHERE LOG_ERRO_ID = 0 ';
      Active := True;
      Insert;
      FieldByName('LOG_ERRO_ID').AsCurrency := GerarSequencia('G_LOG_ERRO');
      FieldByName('DATA').AsDateTime := DataHoraBanco(3);
      FieldByName('FORM').AsString := Screen.ActiveForm.Name;
      FieldByName('OBJETO').AsString := Screen.ActiveControl.Name;
      FieldByName('USUARIO').AsString := vgLogin;
      FieldByName('MENSAGEM').AsString := Copy(e.Message,1,120);
      FieldByName('SISTEMA_ID').AsCurrency := vgId;
      ApplyUpdates(-1);
    end;
    Commit;
  except
    Roolback;
  end;
  msg := e.Message + #10;
  msg := msg + 'Form: ' + Screen.ActiveForm.Name + #10;
  msg := msg + 'Objeto: ' + Screen.ActiveControl.Name;
  MessageDlg(msg, mtError, [mbOK], 0);
end;

procedure TdtmControles.VerificarCapturaConfiguracao(
  const vpSistemaID: Integer;
  const vpGrupo: string;
  const vpSecao: string;
  const vpNome: string);
begin
  if not CapturaConfiguracoesIniciada then
    Exit;

  if ConfiguracaoCapturada(
    vpSistemaID,
    vpGrupo,
    vpSecao,
    vpNome) then
    Exit;

  FCapturaConfiguracoes.Value.ConfiguracoesCapturadas.Add(
    Configuracao(
      vpSistemaID,
      vpGrupo,
      vpSecao,
      vpNome));
end;

procedure TdtmControles.MsnPouUpLembrete(Texto, Titulo : String);
begin
  msnAgenda.Options := [msnCascadePopups, msnAllowScroll];
  msnAgenda.OnURLClick := nil;
  msnAgenda.Text := Texto;
  msnAgenda.URL := '';
  msnAgenda.Title := Titulo;
  msnAgenda.ShowPopUp;
end;

procedure TdtmControles.AppIdle(Sender: TObject; var Done: Boolean);
begin
  timerSessao.Enabled := True;
end;

procedure TdtmControles.AppMessage(var Msg: TMsg; var Handled: Boolean);
begin
  Case Msg.message of
     WM_KEYDOWN,
     WM_MOUSEMOVE,
     WM_DRAWITEM  :timerSessao.Enabled := False;
  end;
end;

procedure TdtmControles.AtivaSessao(vpExecutar : TAction);
var viAtivar : Boolean;
    viTempo : Integer;
begin
  viAtivar := dtmControles.BuscarConfig('PRINCIPAL', 'GERAL', 'ATIVAR_SESSAO', 'S') = 'S';
  viTempo  := dtmControles.BuscarConfig('PRINCIPAL', 'GERAL', 'TEMPO_SESSAO', 'I');

  if vIAtivar then
  begin
    timerSessao.Interval  := vITempo;
    ExecuteControleSessao := vpExecutar;
    Application.OnMessage := AppMessage;
    Application.OnIdle    := AppIdle;
  end
  else
  begin
    Application.OnMessage := nil;
    Application.OnIdle    := nil;
    ExecuteControleSessao := nil;
    timerSessao.Enabled   := False;
  end;
end;

function TdtmControles.AtualizarLinkSuporte(
  const vpValor: string): Integer;
begin
  Result := AtualizarValorConfiguracao(
    vpValor,
    5,
    'PRINCIPAL',
    'GERAL',
    'LINK_SUPORTE');
end;

function TdtmControles.AtualizarValorConfiguracao(
  const vpValor: string;
  const vpSistemaID: Integer;
  const vpGrupo: string;
  const vpSecao: string;
  const vpNome: string): Integer;
begin
  Result := TDataSetAPI<TI9Query>.New(
    TI9Query.Create(
      nil))
  .AutoDestroy
  .ExecuteAction(
    procedure(
      const vpI9Query: TI9Query)
    begin
      vpI9Query.Connection := DB;

      vpI9Query.SQL.Text := {$REGION 'Comando SQL UPDATE'}
        {$REGION 'Cláusula UPDATE'}
        'UPDATE ' +
        'G_CONFIG ' +
        {$ENDREGION}

        {$REGION 'Cláusula SET, Colunas e Parâmetros'}
        'SET ' +
        'VALOR = :P_VALOR ' +
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +
        'CONFIG_GRUPO_ID = ' +
        '(' +

        {$REGION 'Comando SQL SELECT'}
        'SELECT ' +

        {$REGION 'Colunas'}
        'CONFIG_GRUPO_ID ' +
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'G_CONFIG_GRUPO ' +
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +
        'SISTEMA_ID = :P_SISTEMA_ID AND ' +
        'DESCRICAO = :P_GRUPO' +
        {$ENDREGION}

        {$ENDREGION}

        ') ' +

        'AND ' +
        'SECAO = :P_SECAO AND ' +
        'NOME = :P_NOME';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos parâmetros'}
      vpI9Query.ParamByName(
        'P_VALOR').AsString := vpValor;

      vpI9Query.ParamByName(
        'P_SISTEMA_ID').AsInteger := vpSistemaID;

      vpI9Query.ParamByName(
        'P_GRUPO').AsString := vpGrupo;

      vpI9Query.ParamByName(
        'P_SECAO').AsString := vpSecao;

      vpI9Query.ParamByName(
        'P_NOME').AsString := vpNome;
      {$ENDREGION}
    end)
  .DataSet
  .ExecSQL;
end;

{ TGeralThread }

procedure TGeralThread.Execute;
begin
  inherited;
  Synchronize(dtmControles.ExecuteProcThread);
end;

function TdtmControles.DataParaString(vpData: TDateTime): string;
var
  vlData: string;
begin
  Result := '';
  if UpperCase(vgBaseDados) = 'ORACLE' then
    vlData := FormatDateTime('DD/MM/YYYY',vpData)
  else
    vlData := FormatDateTime('YYYY/MM/DD',vpData);
  Result := vlData;
end;

procedure TdtmControles.DBAfterConnect(Sender: TObject);
begin
  try
    vlUsarProxy := dtmControles.BuscarParametroOutroSistema('PROXY_USAR', 'PROXY', 'PRINCIPAL', '5') = 'S';
    if vlUsarProxy then
    begin
      vlProxyServer   := dtmControles.BuscarParametroOutroSistema('PROXY_SERVER',   'PROXY', 'PRINCIPAL', '5');
      vlProxyPort     := dtmControles.BuscarParametroOutroSistema('PROXY_PORT',     'PROXY', 'PRINCIPAL', '5');
      vlProxyUsername := dtmControles.BuscarParametroOutroSistema('PROXY_USERNAME', 'PROXY', 'PRINCIPAL', '5');
      vlProxyPassword := dtmControles.BuscarParametroOutroSistema('PROXY_PASSWORD', 'PROXY', 'PRINCIPAL', '5');
    end;
  except
    ShowMessage('Erro ao carregar os parâmetros do proxy!');
  end;
end;

procedure TdtmControles.DBHBeforeConnect(Sender: TObject);
begin
  //Passa os parametros para o Banco de Dados
  if UpperCase(vgTipoConexao) = 'DEVART' then
  begin
    //Devart
    DBH.DriverName      := 'DevartInterBase';
    DBH.ConnectionName  := 'Devart InterBase';
    DBH.LibraryName     := 'dbexpida40.dll';
    DBH.VendorLib       := 'fbclient.dll';

    DBH.GetDriverFunc   := 'getSQLDriverInterBase';
    DBH.Params.Values['OptimizedNumerics'] := 'False';
    DBH.Params.Values['useUnicode']        := 'False';
    DBH.Params.Values['DeferredBlobRead']  := 'True';
    DBH.Params.Values['DeferredArrayRead'] := 'True';
    DBH.Params.Values['Prepared']          := 'False';
    DBH.Params.Values['Reconnect']         := 'True';
  end
  else
  begin
    //Embarcadeiro
    DBH.DriverName      := 'Firebird';
    DBH.ConnectionName  := 'FBConnection';
    DBH.LibraryName     := 'dbxfb.dll';
    DBH.VendorLib       := 'fbclient.dll';
  end;

  DBH.Params.Values['BLobSize']           := '-1';
  DBH.Params.Values['ErrorResourceFile']  := '';
  DBH.Params.Values['LocaleCode']         := '0000';
  DBH.Params.Values['Interbase TransIsolation'] := 'ReadCommited';
  DBH.Params.Values['CommitRetain']   := 'False';
  DBH.Params.Values['RoleName']       := 'RoleName';
  DBH.Params.Values['ServerCharSet']  := 'ISO8859_1';
  DBH.Params.Values['SQLDialect']     := '3';
  DBH.Params.Values['WaitOnLocks']    := 'True';

  DBH.Params.Values['DataBase']           := Cripto.CriptoHexToText(vgBaseDadosHistorico);
  DBH.Params.Values['User_Name']          := Cripto.CriptoHexToText(vgUsuario);
  DBH.Params.Values['Password']           := Cripto.CriptoHexToText(vgSenha);
end;

//Relatorios

procedure TdtmControles.ParametrosRelatorio;
var RichView1 : TfrxRichView;
    Memo1 : TfrxMemoView;
begin
  RichView1 := TfrxRichView(frxRelatorio.FindObject('rchCabecalho'));
  if RichView1 <> nil then
     RichView1.RichEdit.Text:= BuscarConfig('PRINCIPAL', 'RELATORIO', 'CABECALHO_RELATORIO', 'T')
  else begin
       Memo1 := TfrxMemoView(frxRelatorio.FindObject('mmoCabecalho'));
       if Memo1 <> nil then
          Memo1.Text:= BuscarConfig('PRINCIPAL', 'RELATORIO', 'CABECALHO_RELATORIO', 'W');
  end;
  frxRelatorio.Variables.Variables['vgNomeCartorio'] := QuotedStr(dtmControles.BuscarConfig('PRINCIPAL', 'CARTORIO', 'NOME', 'S'));
  frxRelatorio.Variables.Variables['vgLogin'] := QuotedStr(vgLogin);
end;

function TdtmControles.frxRelatorioUserFunction(const MethodName: String;
  var Params: Variant): Variant;
begin
  Result := ExecutarFuncoesRelatorio(MethodName, Params);
end;

function TdtmControles.SenhaAdmin: string;
{$REGION 'Variáveis'}
var
  viData: TDateTime;
{$ENDREGION}
begin
  viData := DataHoraBanco(
    3);

  Result := string.Format(
    '%.2d%.2d@%s',
    [DayOf(
      viData),
    MonthOf(
      viData),
    Cripto.CriptoHexToText(
      BuscarParametroOutroSistema(
        'LOZINKA',
        'GERAL',
        'PRINCIPAL',
        '5'))]);
end;

procedure TdtmControles.ShowRelatorio(ID : String);
var Retorno : String;
begin
  Retorno := CodPermissao('REL_' + ID);
  if Retorno = '000000' then
  begin
    Application.MessageBox('Usuário não tem permissão de acessar esta rotina!', 'Atenção', MB_OK + MB_ICONWARNING);
    Abort;
  end;
  ExibirRelatorio(frxRelatorio, ID, ParametrosRelatorio);
end;

function TdtmControles.SiteTri7: string;
begin
  Result := 'http://www.tri7.com.br';
end;

procedure TdtmControles.CriarMenuRelatorio(var ActManager : TActionManager; var ActRel : TAction; id : Integer);
var
  Act : TAction;
  i, Grupo, GrupoAnterior : integer;
  Str : TStringList;
begin
  sqlRelatorio.Connection := dtmControles.DB;
  sqlRelatorio.Params[0].AsInteger := vgId;
  sqlRelatorio.Open;

  if not sqlRelatorio.IsEmpty then
  begin
    Str := TStringList.Create;
    while not sqlRelatorio.Eof do
    begin
      Grupo := sqlRelatorioGRUPO_RELATORIO_ID.AsInteger;
      if Str.Values['G' + IntToStr(Grupo)] = '' then
         Str.Add('G' + IntToStr(Grupo) + '=1')
      else Str.Values['G' + IntToStr(Grupo)] := IntToStr(StrToInt(Str.Values['G' + IntToStr(Grupo)]) + 1);
      sqlRelatorio.Next;
    end;
    sqlRelatorio.First;

    GrupoAnterior := 0;
    i := ActManager.ActionBars[0].Items[id].Items.Count - 1;
    repeat
      Grupo := sqlRelatorioGRUPO_RELATORIO_ID.AsInteger;

      Act := TAction.Create(Application);
      Act.Caption := sqlRelatorioDESCRICAO.AsString;
      Act.Tag := sqlRelatorioCONFIG_RELATORIO_ID.AsInteger;
      Act.OnExecute := ActRel.OnExecute;

      if StrToInt(Str.Values['G' + IntToStr(Grupo)]) > 1 then
      begin
        if Grupo <> GrupoAnterior then
        begin
          ActManager.ActionBars[0].Items[id].Items.Add.Caption := sqlRelatorioGRUPO.AsString;
          Inc(i);
        end;
        ActManager.ActionBars[0].Items[id].Items[i].Items.Add.Action := Act;
      end
      else begin
           ActManager.ActionBars[0].Items[id].Items.Add.Action := Act;
           Inc(i);
      end;

      GrupoAnterior := Grupo;
      sqlRelatorio.Next;
    Until sqlRelatorio.Eof;

    Str.Free;
  end;
  ActRel.Visible := False;
  sqlRelatorio.Close;
end;

procedure VerificarPermissao(Permissao: String);
begin
  if Permissao = '0' then
  begin
    Application.MessageBox('Usuário não possui permissão para esta rotina!!', 'Atenção', MB_OK + MB_ICONWARNING);
    Abort;
  end;
end;

procedure TdtmControles.msnAgendaURLClick(Sender: TObject; URL: String);
var
  vData: TDateTime;
  vDataString: String;
  AMode: TcxSchedulerViewMode;
  i: integer;
begin
  try
    ShowWindow(Application.Handle, SW_HIDE);
    vDataString := '';
    for i := 1 to Length(Trim(msnAgenda.URL)) do
    begin
      if Copy(Trim(msnAgenda.URL), i, 1) = '*' then
        Break;
      vDataString := vDataString + Copy(Trim(msnAgenda.URL), i, 1);
    end;
    vData := StrToDate(vDataString);
    ExibirFormulario(TfrmAgenda, frmAgenda, False);
//    if cxShowGoToDateDialog(frmAgenda.Scheduler, frmAgenda.Scheduler.LookAndFeel, vData, AMode) then
      frmAgenda.Scheduler.GoToDate(vData, AMode);
  Except

  end;
end;

procedure TdtmControles.timerAgendaTimer(Sender: TObject);
begin
  try
    msnAgenda.OnURLClick := msnAgendaURLClick;
    if vgUsarAvisarAgenda = 'S' then
    begin
      if sqlG_Agenda.Active = True then
      begin
        sqlG_Agenda.Refresh;
        sqlG_Agenda.First;
        while not sqlG_Agenda.Eof do
        begin
          if (sqlG_AgendaDATA_HORA_ENVIADO.AsCurrency = 0) and
             (sqlG_AgendaSTATUS.AsInteger <> 1) and
             (sqlG_AgendaUSUARIO_ID.AsCurrency <> sqlG_AgendaUSUARIO_AGENDOU_ID.AsCurrency) then
          begin
            msnAgenda.Text := '(' + sqlG_AgendaDATA_INICIO.AsString + ') ' + sqlG_AgendaASSUNTO.AsString;
            msnAgenda.URL := DateToStr(sqlG_AgendaDATA_INICIO.AsDateTime) + '*' + sqlG_AgendaAGENDA_ID.AsString;
            if sqlG_AgendaSTATUS.AsInteger = 0 then
              msnAgenda.Title := 'Novo Lembrete'
            else if sqlG_AgendaSTATUS.AsInteger = 2 then
              msnAgenda.Title := 'Nova Agenda'
            else if sqlG_AgendaSTATUS.AsInteger = 3 then
              msnAgenda.Title := '"PRIORIDADE"';
            msnAgenda.ShowPopUp;
            sqlG_Agenda.Edit;
            sqlG_AgendaDATA_HORA_ENVIADO.AsDateTime := dtmControles.DataHoraBanco(3);
            sqlG_Agenda.ApplyUpdates(-1);
          end;
          // O lembrete é disparado 1 hora antes
          if (sqlG_AgendaDATA_HORA_AVISADO.AsCurrency = 0) and (sqlG_AgendaDATA_HORA_CADASTRO.AsCurrency < (dtmControles.DataHoraBanco(3) + 0.0208333)) then
          begin
            msnAgenda.Text := '(' + sqlG_AgendaDATA_INICIO.AsString + ') ' + sqlG_AgendaASSUNTO.AsString;
            msnAgenda.URL := DateToStr(sqlG_AgendaDATA_INICIO.AsDateTime) + '*' + sqlG_AgendaAGENDA_ID.AsString;
            msnAgenda.Title := 'Não Esquecer';
            msnAgenda.ShowPopUp;
            sqlG_Agenda.Edit;
            sqlG_AgendaDATA_HORA_AVISADO.AsDateTime := dtmControles.DataHoraBanco(3);
            sqlG_Agenda.ApplyUpdates(-1);
          end;
          sqlG_Agenda.Next;
        end;
      end
      else
      begin
        with sqlG_Agenda do
        begin
          Active := False;
          Params[0].AsCurrency := StrToInt(vgUsuarioID);
          Active := True;
        end;
      end;
    end;
  Except

  end;
end;

procedure TdtmControles.timerSessaoTimer(Sender: TObject);
begin
  if ExecuteControleSessao <> nil then
    ExecuteControleSessao.Execute;
  timerSessao.Enabled := False;
end;

procedure TdtmControles.tmrAlertaVersaoTimer(Sender: TObject);
begin
  with frmPrincipal do
    if btnSobre.ImageIndex = 61 then
      btnSobre.ImageIndex := 62
    else
      btnSobre.ImageIndex := 61;
end;

function TdtmControles.UsuarioAdministrador: Boolean;
begin
  Result := IsLoginAdmin(
    vgLogin);
end;

Function VerificarOrdemServico(vpOrdem: Currency; vpTipoInclusao : Integer;
                vpIdentificacao, vpTransacao : String; vpValor : Currency):Boolean;
begin
  vgOrdemServico := InicializarOrdemServico;
  vgOrdemServico.Solicitar := dtmControles.BuscarParametroOutroSistema('SOLICITAR_ORDEM_SERVICO', 'GERAL', 'NOVO_CAIXA',  '5') = 'S';
  if not vgOrdemServico.Solicitar then
  begin
    Result := True;
    abort;
  end;

  vgOrdemServico.Ordem         := vpOrdem;
  vgOrdemServico.Identificacao := vpIdentificacao;
  vgOrdemServico.TipoInclusao  := vpTipoInclusao;
  vgOrdemServico.OSValor       := vpValor;
  vgOrdemServico.TransacaoItem := vpTransacao;

  if frmOrdemServicoSolicitar <> nil then
    FreeAndNil(frmOrdemServicoSolicitar);
  ExibirFormulario(TfrmOrdemServicoSolicitar, frmOrdemServicoSolicitar, True);

  Result := vgOrdemServico.Flag;
end;

function FormatarOrdemServicoID(
  const vpData: TDateTime;
  const vpSequencia: Integer): Currency;
begin
  Result := StrToCurr(string.Format(
    '%s%d',
    [FormatDateTime(
      'YYYYMMDD',
      vpData),
    Trunc(
      vpSequencia)]));
end;

function GerarOrdemServicoID(
  const vpData: TDateTime): Currency;
begin
  Result := FormatarOrdemServicoID(
    vpData,
    dtmControles.GerarSequencia(
      'C_ORDEM_SERVICO'));
end;

function SequenciaOrdemServicoID(
  const vpOrdemServicoID: Currency): Integer;
begin
  Result := Trunc(vpOrdemServicoID)
  .ToString
  .Substring(
    8)
  .ToInteger;
end;

function InicializarOrdemServico: TOrdemServico;
begin
  Result := Default(
    TOrdemServico);
end;

procedure GravarOrdemServico(vpOsAntiga : Integer = 0);
{var
  viData : String;}
begin
  if not vgOrdemServico.Solicitar then
    exit;

  if vgOrdemServico.Ordem = 0 then
  begin
    with dtmControles.SimpleAuxiliar do
    begin
      Active := False;
      SQL.Text := ' SELECT * FROM C_ORDEM_SERVICO '+
                             ' WHERE ORDEM_SERVICO_ID = 0 ';
      Active := True;
      Insert;

      FieldByName(
        'DATA').AsDateTime := dtmControles.DataHoraBanco(
          3);

      vgOrdemServico.Ordem := GerarOrdemServicoID(
        FieldByName(
          'DATA').AsDateTime);

      FieldByName('ORDEM_SERVICO_ID').AsCurrency := vgOrdemServico.Ordem;
      FieldByName('SITUACAO').AsString           := 'A';
      FieldByName('DESCRICAO').AsString          := vgOrdemServico.Identificacao;
      FieldByName('USUARIO_ID').AsString         := vgUsuarioID;
      if vgOrdemServico.MensalistaId > 0 then
        FieldByName('MENSALISTA_ID').AsInteger   := vgOrdemServico.MensalistaId;
      ApplyUpdates(-1);
    end;
  end
  else
    if vpOsAntiga > 0 then
      ExecutaSqlAuxiliar(' UPDATE C_ORDEM_SERVICO SET OS_ANTIGA = '+vpOsAntiga.ToString+
                         ' WHERE ORDEM_SERVICO_ID = '+ CurrToStr(vgOrdemServico.Ordem),1);
end;

Function MascaraOS(vpOS : Currency):String;
var
  viOS : String;
begin
  if vpOS = 0 then
    Result := ''
  else
  begin
    viOS := IntToStr(Trunc(vpOS));
    viOS   := copy(viOS, 1,8)+'-'+copy(viOS, 9,5);
    Result := viOS;
  end;
end;

function ExisteOrdemServico(
  const vpTipoServico: string;
  const vpChaveServico: Integer): Boolean;
begin
  Result := False;
  vgOrdemServico := InicializarOrdemServico;

  vgOrdemServico.Solicitar := SolicitarOrdemServico;
  if not vgOrdemServico.Solicitar then
    Exit;

  vgOrdemServico.Ordem := TDataSetAPI<TI9Query>
  .New(
    TI9Query.Create(
      nil))
  .AutoClose
  .AutoDestroy
  .ExecuteAction(
    procedure(
      const vpFDQuery: TI9Query)
    begin
      vpFDQuery.Connection := dtmFD.FDConnection;

      vpFDQuery.SQL.Text := {$REGION 'Comando SQL SELECT'}
        'SELECT ' +

        {$REGION 'Colunas'}
        'FIRST 1 ' +
        'CAIXA_ITEM_ID, ' +
        'ORDEM_SERVICO_ID ' +
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        'FROM ' +
        'C_CAIXA_ITEM ' +
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        'WHERE ' +
        'TIPO_SERVICO = :P_TIPO_SERVICO AND ' +
        'CHAVE_SERVICO = :P_CHAVE_SERVICO AND ' +
        'ORDEM_SERVICO_ID IS NOT NULL';
        {$ENDREGION}

      {$ENDREGION}

      {$REGION 'Preencher valores dos parâmetros'}
      vpFDQuery.ParamByName(
        'P_TIPO_SERVICO').AsString := vpTipoServico;

      vpFDQuery.ParamByName(
        'P_CHAVE_SERVICO').AsInteger := vpChaveServico;
      {$ENDREGION}
    end)
  .Open
  .DataSet
  .FieldByName(
    'ORDEM_SERVICO_ID')
  .AsCurrency;

  Result := CompareValue(
    vgOrdemServico.Ordem,
    ZeroValue) = GreaterThanValue;

  vgOrdemServico.Flag := Result;
end;

function SolicitarOrdemServico : Boolean;
begin
  Result := string(
    dtmControles.BuscarParametroOutroSistema(
      'SOLICITAR_ORDEM_SERVICO',
      'GERAL',
      'NOVO_CAIXA',
      '5'))
  .Equals(
    'S');
end;

procedure CalcularSaldoOS(vpOS : String; vpSaldoOSDisponivel : Boolean;
              vpSaldoOSServentia : Boolean = False);
var
  viSql : String;
  viSaldoOSCompensarC, viSaldoOSCompensarD : Currency;
  viOSPesquisa : String;

  Function SaldoOSDisponivel(vpSistema : String = ''; vpSituacao : String = '') : Currency;
  var
    viCondicao, viFrom : String;
    viSaldoCredito, viSaldoDebito, viValor : Currency;
  begin
    viFrom     := '';
    viCondicao := '';

    if vpSaldoOSServentia and (vpSistema <> '') then
    begin
      viCondicao  := ' AND CS.SISTEMA_ID  = '+vpSistema;
      viFrom      := ' LEFT OUTER JOIN C_CAIXA_SERVICO CS ON '+
                     ' C.CAIXA_SERVICO_ID = CS.CAIXA_SERVICO_ID ';
    end;

    viSql := ' SELECT COALESCE(SUM(C.VALOR_PAGO),0) '+
             ' FROM C_CAIXA_ITEM C '+viFrom+
             ' WHERE C.ORDEM_SERVICO_ID = '+viOSPesquisa+viCondicao+
             '   AND (((C.TIPO_TRANSACAO = ''C'') AND (C.OS_TIPO IN (''2'',''4'',''9''))) '+
             '    OR ((C.TIPO_TRANSACAO = ''D'') AND (C.OS_TIPO = ''6'') AND (C.OS_SAIDA IS NULL))) '+
             '   AND C.SITUACAO = ''4''';
    viSaldoCredito := dtmControles.GetFloat(viSql);

    viSql := ' SELECT COALESCE(C.VALOR_PAGO,0) AS VALOR_PAGO, C.CHAVE_SERVICO, C.TIPO_SERVICO '+
             ' FROM C_CAIXA_ITEM C '+viFrom+
             ' WHERE C.ORDEM_SERVICO_ID = '+viOSPesquisa+viCondicao+
             '   AND (((C.OS_TRANSACAO = ''D'') AND (C.OS_TIPO IN (''3'',''9'')))) '+
             '   AND C.SITUACAO = ''4'''+
             ' AND C.REGISTRADO <> ''6'' AND ' +
             ' NOT EXISTS ' +
             '(' +
             'SELECT 1 FROM C_CAIXA_ITEM C_CI2 WHERE C_CI2.SITUACAO = ''7'' AND ' +
             'C_CI2.REGISTRADO = ''6'' AND ' +
             'C_CI2.QUITADO_CAIXA_ID = C.CAIXA_ITEM_ID' +
             ')';

    ExecutaSimpleDSAux(viSql,0);
    with dtmControles.SimpleAuxiliar do
    begin
      First;
      viSaldoDebito := 0;
      while not eof do
      try
        viValor := FieldByName('VALOR_PAGO').AsCurrency;
        if FieldByName('TIPO_SERVICO').AsString <> '5' then
          Continue;

        viValor := Reprotocolo(viValor, FieldByName('CHAVE_SERVICO').AsInteger);
      finally
        viSaldoDebito := viSaldoDebito + viValor;
        Next;
      end;
     end;

    Result := viSaldoCredito - viSaldoDebito;
  end;

  Function SaldoOSAguardandoCompensar(vpOperacao, vpSituacao : String):Currency;
  begin
    viSql := ' SELECT COALESCE(SUM(VALOR_PAGO),0) '+
             ' FROM C_CAIXA_ITEM '+
             ' WHERE TIPO_TRANSACAO = ' +QuotedStr(vpOperacao) +
             '   AND ORDEM_SERVICO_ID = '+viOSPesquisa+
             '   AND SITUACAO = '+QuotedStr(vpSituacao);
    if vpSituacao = '7' then
       viSql := viSql + '   AND REGISTRADO = '+QuotedStr('2');

    Result := dtmControles.GetFloat(viSql);
  end;

  Function SaldoOSAguardandoDevolver(vpOperacao, vpSituacao : String):Currency;
  begin
    viSql := ' SELECT COALESCE(SUM(VALOR_PAGO),0) '+
             ' FROM C_CAIXA_ITEM '+
             ' WHERE TIPO_TRANSACAO = ' +QuotedStr(vpOperacao) +
             '   AND ORDEM_SERVICO_ID = '+viOSPesquisa+
             '   AND OS_TIPO = ''6'''+
             '   AND SITUACAO = '+QuotedStr(vpSituacao);
    Result := dtmControles.GetFloat(viSql);
  end;

begin
  if vpOS = '' then
    Exit;

  viOSPesquisa := RetornarOrdemServicoNova(vpOS);

  if vpSaldoOSDisponivel then
    vgOrdemSaldo.SaldoOSDisponivel := SaldoOSDisponivel;

  if vpSaldoOSServentia then
  begin
    vgOrdemSaldo.SaldoOSRI          := SaldoOSDisponivel('1');
    vgOrdemSaldo.SaldoOSNotas       := SaldoOSDisponivel('2');
    vgOrdemSaldo.SaldoOSGeral       := SaldoOSDisponivel('9');
    vgOrdemSaldo.SaldoOSAguardandoC := SaldoOSAguardandoCompensar('C', '3');
    vgOrdemSaldo.SaldoOSAguardandoD := SaldoOSAguardandoCompensar('D', '3');

//    viSaldoOSCompensarC := SaldoOSAguardandoCompensar('C', '7');
//    viSaldoOSCompensarD := SaldoOSAguardandoCompensar('D', '7');
//    vgOrdemSaldo.SaldoOSCompensar := viSaldoOSCompensarC - viSaldoOSCompensarD;
    vgOrdemSaldo.SaldoOSDevolver  := SaldoOSAguardandoDevolver('D', '3');
    vgOrdemSaldo.SaldoOSDisponivel := SaldoOSDisponivel; // + vgOrdemSaldo.SaldoOSDevolver;
  end;
end;

function RetornarOrdemServicoNova(vpOrdem : String):string;
begin
  if vpOrdem = '' then
    exit;

  if Length(vpOrdem) < 9 then
       Result := dtmControles.GetStr(' SELECT ORDEM_SERVICO_ID FROM C_ORDEM_SERVICO WHERE OS_ANTIGA = '+vpOrdem)
  else Result := vpOrdem;
end;

function UltimaDataOS: TDateTime;
{$REGION 'Variáveis'}
var
  viResult: Variant;
{$ENDREGION}
begin
  viResult := dtmFD.FDConnection.ExecSQLScalar(
    'SELECT MAX(DATA) FROM C_ORDEM_SERVICO');

  if VarIsNull(
    viResult) then
    Exit(
      ZeroValue);

  Result := VarToDateTime(
    viResult);
end;

procedure IncluirPesquisarOS(vpOS: Currency; vpCaixaItemId : Integer);
var
  viOS : String;
begin
  vgCaixaDados.CaixaId     := vpCaixaItemId;
  vgCaixaDados.CaixaItemID := 0;
  vgCaixaDados.Data        := dtmControles.DataHoraBanco(3);
  vgCaixaDados.TipoCaixa   := '';
  vgCaixaDados.NovoAuto    := vpOS = 0;
  VerificarOrdemServico(vpOS, 3, '', '', 0);
end;

function UltimaOS(
    const vpData: TDateTime): Currency;
begin
  Result := dtmFD.FDConnection.ExecSQLScalar(
    'SELECT COALESCE(MAX(ORDEM_SERVICO_ID), 0) FROM C_ORDEM_SERVICO WHERE ' +
    'DATA BETWEEN :P_DATA_INICIAL AND :P_DATA_FINAL',
    [StartOfTheDay(
      vpData),
    EndOfTheDay(
      vpData)]);
end;

procedure VerificarSequenciaOS;
var
  viUltimaDataOS: TDateTime;
  viData: TDateTime;
  viUltimaOS: Currency;
  viSequenciaOS: Integer;
begin
  viUltimaDataOS := StartOfTheDay(
    UltimaDataOS);

  viData := StartOfTheDay(
    dtmControles.DataHoraBanco(
      3));

  if CompareDate(
    viUltimaDataOS,
    viData) = EqualsValue then
    Exit;

  viUltimaOS := UltimaOS(
    viData);

  if viUltimaOS = ZeroValue then
    viSequenciaOS := ZeroValue
  else
    viSequenciaOS := SequenciaOrdemServicoID(
      viUltimaOS);

  dtmFD.FDConnection.ExecSQL(
    'UPDATE OR INSERT INTO G_SEQUENCIA (TABELA, SEQUENCIA) ' +
    'VALUES (:P_TABELA, :P_SEQUENCIA) MATCHING(TABELA)',
    ['C_ORDEM_SERVICO',
    viSequenciaOS]);
end;

end.
