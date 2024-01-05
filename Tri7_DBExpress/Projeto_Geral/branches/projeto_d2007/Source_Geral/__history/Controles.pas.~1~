unit Controles;

interface

uses                             
  Windows, SysUtils, Forms, Classes, DBXpress, DB, SqlExpr, ImgList,
  Controls, cxContainer, cxEdit, cxClasses, cxStyles, Math, Messages,
  cxGridTableView, cxHint, DBClient, SimpleDS, cxEditRepositoryItems, WPCTRRich,
  FMTBcd, cxGridCardView, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxDbEdit, IniFiles,
  cxDropDownEdit, Variants, cxMaskEdit, frxRich, frxClass, cxTextEdit, frxExportImage,
  frxDesgn, ad3SpellBase, ad3Spell, frxDCtrl, cxCalendar,
  frxDBXComponents, frxChBox, frxChart, frxOLE, frxBarcode,
  ActnMan, ActnColorMaps, cxImageComboBox, Dialogs, ActnCtrls, ActnList,
  cxLookAndFeels, MSNPopUp, ExtCtrls, cxScheduler, cxSchedulerCustomControls,
  cxSchedulerDialogs, frxExportRTF, frxExportPDF, frxExportXLS, ECripto,
  WideStrings, IdSMTPBase,
  IdSMTP, IdComponent, IdTCPConnection, IdTCPClient, CharPrinter, 
  IdExplicitTLSClientServerBase, IdMessageClient, IdPOP3, IdMessage,
  IdBaseComponent, IdAntiFreezeBase, IdAntiFreeze, idText, IdAttachmentFile, 
  OleServer, frxExportTXT, frxExportText, gtPDFClasses, gtCstPDFDoc, gtExPDFDoc,
  gtExProPDFDoc, gtPDFDoc, ImagXpr7_TLB, Graphics, DateUtils,
  Provider, cxGridBandedTableView, cxTL, dxScreenTip, dxCustomHint, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue;

type
  TFeriado = Record
   Tipo : String;
   Ano  : Integer;
   Mes  : Integer;
   Dia  : Integer;
  end;

  TPessoa = Record
    CadastrarNovo, PessoaTipo, Sexo, ConjugeRepresentante : string;
    CPF_CNPJ, VinculoAuxiliar, Nome, Documento : String;
    PessoaId, NotPessoaId, PessoaSelecionada, PessoaVinculo, EstadoCivil, CensecTipoAtoId : integer;
    Selecionar, NovaParte, TipoSeparacao, TipoRevogacao : Boolean;
    NomeTabela: string;
  end;

  TImovel = Record
    CadastrarNovo, Numero, TipoClasse : string;
    ImovelId, NotImovelId, ImovelSelecionado : integer;
    Selecionado, Selecionar, NovaUnidade, AdicionarUnidade, QualificacaoGeral : Boolean;
    Registro, DataRegistro, ValorAvaliacao, ValorAlienacao, Aliquota : String;
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
    HostSmtp, HostPop3, UserName, PassWord, AssuntoPadrao, EmailEnvio, EmailDestino, Tabela, Porta : String;
    Autenticar, UsarEmailUsuario, AdAssinaturaUsuario : Boolean;
    EspacoAssinatura : Integer;
    TextoEmail, TextoRodape : TStringList;
  end;

  TDadosBase = Record
    Local, Senha, NomeBase, BaseDados : String;
  end;

type
  TGeralThread = class(TThread)
  private
  protected
    procedure Execute; override;
  end;

  TExecuteProcedure = procedure of object;

  TdtmControles = class(TDataModule)
    DB: TSQLConnection;
    cxHintStyleController: TcxHintStyleController;
    SimpleAuxiliar: TSimpleDataSet;
    sqlSequencia: TSQLQuery;
    sqlAuxiliar: TSQLQuery;
    cxEsc_EditsNormal: TcxEditStyleController;
    cxEsc_EditsObrigatorio: TcxEditStyleController;
    cxEditRepository1: TcxEditRepository;
    cxEditRepository1CurrencyItem1: TcxEditRepositoryCurrencyItem;
    cxEditRepository1DateItem1: TcxEditRepositoryDateItem;
    sqlConfig: TSimpleDataSet;
    sqlConfigCONFIG_ID: TFMTBCDField;
    sqlConfigCONFIG_GRUPO_ID: TFMTBCDField;
    sqlConfigCONFIG_PADRAO_ID: TFMTBCDField;
    sqlConfigSECAO: TStringField;
    sqlConfigNOME: TStringField;
    sqlConfigVALOR: TStringField;
    sqlConfigDESCRICAO: TStringField;
    sqlConfigTEXTO: TBlobField;
    sqlConfigTERMINAL: TStringField;
    sqlConfigTIPO_VALOR: TStringField;
    sqlConfigGRUPO: TStringField;
    frxRichObject1: TfrxRichObject;
    AddictSpell31: TAddictSpell3;
    frxRelatorio: TfrxReport;
    frxDialogControls1: TfrxDialogControls;
    frxBarCodeObject1: TfrxBarCodeObject;
    frxOLEObject1: TfrxOLEObject;
    frxChartObject1: TfrxChartObject;
    frxCheckBoxObject1: TfrxCheckBoxObject;
    frxDBXComponents1: TfrxDBXComponents;
    StandardColorMap1: TStandardColorMap;
    sqlRelatorio: TSimpleDataSet;
    sqlRelatorioGRUPO_RELATORIO_ID: TFMTBCDField;
    sqlRelatorioGRUPO: TStringField;
    sqlRelatorioCONFIG_RELATORIO_ID: TFMTBCDField;
    sqlRelatorioDESCRICAO: TStringField;
    sqlRelatorioRELATORIO: TBlobField;
    LookAndFeelController: TcxLookAndFeelController;
    frxDesigner1: TfrxDesigner;
    frxImagem: TfrxReport;
    timerAgenda: TTimer;
    sqlG_Agenda: TSimpleDataSet;
    sqlG_AgendaAGENDA_ID: TFMTBCDField;
    sqlG_AgendaTIPO_EVENTO: TFMTBCDField;
    sqlG_AgendaDATA_INICIO: TSQLTimeStampField;
    sqlG_AgendaDATA_FIM: TSQLTimeStampField;
    sqlG_AgendaASSUNTO: TStringField;
    sqlG_AgendaMENSAGEM: TStringField;
    sqlG_AgendaCOR: TFMTBCDField;
    sqlG_AgendaOPCAO: TFMTBCDField;
    sqlG_AgendaSTATUS: TFMTBCDField;
    sqlG_AgendaUSUARIO_ID: TFMTBCDField;
    sqlG_AgendaUSUARIO_AGENDOU_ID: TFMTBCDField;
    sqlG_AgendaMENSAGEM_FINALIZADO: TBlobField;
    sqlG_AgendaDATA_HORA_CADASTRO: TSQLTimeStampField;
    sqlG_AgendaDATA_HORA_ENVIADO: TSQLTimeStampField;
    sqlG_AgendaDATA_HORA_FINALIZADO: TSQLTimeStampField;
    dtsG_Agenda: TDataSource;
    sqlG_AgendaDATA_HORA_AVISADO: TSQLTimeStampField;
    sqlConfigATUALIZADO: TStringField;
    frxXLSExport1: TfrxXLSExport;
    frxPDFExport1: TfrxPDFExport;
    cxEsc_EditsEspecial: TcxEditStyleController;
    msnAgenda: TMSNPopUp;
    Cripto: TEvCriptografa;
    timerSessao: TTimer;
    imgCadBasicos: TImageList;
    SP_SEQUENCIA: TSQLStoredProc;
    IdMessage: TIdMessage;
    idPOP3: TIdPOP3;
    idSmtp: TIdSMTP;
    PrintDialog1: TPrintDialog;
    frxBMPExport1: TfrxBMPExport;
    frxSimpleTextExport1: TfrxSimpleTextExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxTIFFExport1: TfrxTIFFExport;
    gtPDFDocument: TgtPDFDocument;
    ClientAncestral: TClientDataSet;
    ProviderAncestral: TDataSetProvider;
    DataSetAncestral: TSQLDataSet;
    ClientAncestralCONFIG_RELATORIO_ID: TFMTBCDField;
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
    procedure DBBeforeConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    function frxRelatorioUserFunction(const MethodName: String;
      var Params: Variant): Variant;
    procedure msnAgendaURLClick(Sender: TObject; URL: String);
    procedure timerAgendaTimer(Sender: TObject);
    procedure timerSessaoTimer(Sender: TObject);
  private
    { Private declarations }
    TD: TTransactionDesc;
    ExecuteControleSessao : TAction;
    Feriado : array of TFeriado;

    procedure AppIdle(Sender: TObject; var Done: Boolean);
    procedure AppMessage(var Msg: TMsg; var Handled: Boolean);
    procedure CarregaFeriado;
  public
    { Public declarations }
    ThGeral: TGeralThread;
    ExecuteProcThread : TExecuteProcedure;

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
    function CodPermissao(Rotina: string): string;
    function GerarSequencia(Tabela: string): Variant;
    function BuscarRotina(Chave : String): String;
    function DataHoraBanco(vpParametro: integer): Variant;
    function DataParaString(vpData: TDateTime): string;
    function RetornaTexto(Str: String): String;

    {Funções/Procedimento de Rede}
    procedure BuscarIpRede(var vpComboBox : TcxComboBox);

    // Procedimento para leitura das Configurações do Sistema
    function BuscarConfig(vpGrupo, vpSecao, vpNome : string; vpTipoValor: char): Variant;
    procedure CarregarConfig;
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

    function getDiasUteis(DataIni : TDateTime; Dias : Integer) : Integer;

    procedure EnviarEmail(vBodyHtml : String; vEmailCC: string; vAttachment: String; vAnexo: TStrings);

    procedure ImprimirEpson(wptTexto : TWPRichText; vpInvertido : Boolean);

    procedure VerificarRegistroDicionario(vpSistema : String);

    function ValidaFeriado(vfDia: TDateTime): Boolean;

    function VerificarProximoDiaUtil(vpData : TDateTime): TDateTime;
    function VerificarFeriado(vDataBusca: string): Boolean;
    Function VerificarDiaUtil(vpData : TDateTime):Boolean;    

  end;
var
  vgChamarLogin, vgExecutarSistema: boolean;
  vgId : Integer;
  vgVersao1, vgVersao2 : TDateTime;
  vgHelpID,
  vgTelaSistema,
  vgCodAtalho,
  vgMarcacaoAutoGrupo, vgLocalBase, vgP : String;

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
  vgTipoBanco,
  vgBaseDados,
  vgBaseNome,
  vgUsuarioID ,
  vgLogin,
  vgSenhaAtual,
  vgUsuarioNome,
  vgUsuario,
  vgSenha,
  vgVERSAO,
  vgSenhaAnterior,
  vgDiretorioCorrente,
  vgKey,
  vgSecao,
  vgChaveSecao,
  vgControlarVersao,
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
  procedure VerificarPermissao(Permissao : String);
  function GetCodigoControle : String;
  function InputQueryA(const ACaption, APrompt: string; var Value: string): Boolean;

implementation

uses Rotinas, VisualizaRelatorios, Agenda, Atualizacao,
  AtualizacaoSistema, InputForm;

{$R *.dfm}

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

function NewQuery: TSimpleDataSet;
begin
  Result := TSimpleDataSet.Create(Application);
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

function TdtmControles.CodPermissao(Rotina: string): string;
var Str : TStringList;
begin
  Result := '000000';
  if vgLogin <> 'I937' then
  begin
    Str := dtmControles.GetFields(' SELECT P.PERMISSAO, R.ATALHO_SISTEMA FROM G_USUARIO U ' +
                                  ' LEFT JOIN G_USUARIO_SISTEMA US ON ' +
                                  '    U.USUARIO_ID = US.USUARIO_ID ' +
                                  ' LEFT JOIN G_PERMISSAO_GRUPO P ON ' +
                                  '   US.USUARIO_GRUPO_ID = P.USUARIO_GRUPO_ID ' +
                                  ' LEFT JOIN G_SISTEMA_ROTINA R ON ' +
                                  '   P.SISTEMA_ROTINA_ID = R.SISTEMA_ROTINA_ID ' +
                                  ' LEFT JOIN G_SISTEMA_MENU M ON ' +
                                  '   R.SISTEMA_MENU_ID = M.SISTEMA_MENU_ID '+
                                  ' WHERE U.LOGIN = ' + QuotedStr(vgLogin) +
                                  ' AND R.CHAVE_ROTINA = ' + QuotedStr(Rotina) +
                                  ' AND US.SISTEMA_ID = ' + IntToStr(vgId) +
                                  ' AND M.SISTEMA_ID = ' + IntToStr(vgId));

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

    IdMessage.ContentType := 'multipart/mixed';

    IdMessage.Recipients.EMailAddresses := vgEmailConfig.EmailDestino;
    IdMessage.CCList.EMailAddresses     := vEmailCC;
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

function TdtmControles.ExecSQL(Qry: string): Boolean;
begin
  DB.ExecuteDirect(Qry);
end;

procedure ExecutaSimpleDSAux(vpSql: string; vpTipo: integer);
begin
  with dtmControles.SimpleAuxiliar do
  begin
    Active := False;
    DataSet.CommandText := '';
    DataSet.CommandText := vpSql;
    case vpTipo of
      0 : Active := True;
      1 : Execute;
      // Tipo = 2, significa que vai receber parametros.
    end;
  end;
end;

function TdtmControles.GerarSequencia(Tabela: string): Variant;
begin
  if Tabela <> '' then
  begin
//    Result := GetInt('select * from G_SP_SEQUENCIAS (' + QuotedStr(Tabela) + ')');
    SP_SEQUENCIA.Params[0].AsString := Tabela;
    SP_SEQUENCIA.ExecProc;
    Result := SP_SEQUENCIA.Params[1].AsString;
  end;
end;

function TdtmControles.getDiasUteis(DataIni: TDateTime; Dias: Integer): Integer;
begin
  Result := dtmControles.GetInt('SELECT * FROM SP_DIAS_UTEIS(' + QuotedStr(DataParaString(DataIni)) + ' , ' + IntToStr(Dias) + ' )');
end;

function TdtmControles.ValidaFeriado(vfDia: TDateTime): Boolean;
var
  viSql : String;
  viAno,
  viMes,
  viDia : word;
  i : Integer;
begin
  Result := False;
  DecodeDate(vfDia, viAno, viMes, viDia);

  for i := 0 to Length(Feriado) - 1 do
    if (viDia = Feriado[i].Dia) and (viMes = Feriado[i].Mes) then
    begin
      if  Feriado[i].Tipo = 'V' then
      begin
        if Feriado[i].Ano = viAno then
          Result := True;
      end
      else
        Result := True;
      Break;
    end;

  {viSql := ' SELECT TIPO, ANO FROM G_FERIADO '+
           ' WHERE SITUACAO = ''A'' ' +
           '   AND DIA = ' + IntToStr(viDia) +
           '   AND MES = ' + IntToStr(viMes);
  ExecutaSimpleDSAux(viSql, 0);
  if not SimpleAuxiliar.IsEmpty then
  begin
    if SimpleAuxiliar.FieldByName('TIPO').AsString = 'V' then
    begin
      if SimpleAuxiliar.FieldByName('ANO').AsInteger = viAno then
        Result := True
    end
    else
      Result := True
  end;
  SimpleAuxiliar.Active := False;}
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
   Result := not VerificarFeriado(FormatDateTime('YYYY/MM/DD',vpData));
end;

function TdtmControles.VerificarFeriado(vDataBusca: string): Boolean;
begin
  with dtmControles.sqlAuxiliar do
  begin
    Active := False;
    Sql.Clear;
    Sql.Add('SELECT SIM_NAO FROM R_VERIFICA_SE_EH_FERIADO('+QuotedStr(vDataBusca)+')');
    Active := True;
  end;
  if dtmControles.sqlAuxiliar.Fields[0].AsString = 'S' then
    Result := True
  else
    Result := False;
  dtmControles.sqlAuxiliar.Active := False;
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

function TdtmControles.GetInt(Qry: string): integer;
begin
  Result := StrToIntDef(GetStr(Qry), 0);
end;

function TdtmControles.GetStr(Qry: string): string;
var
  SQL: TSimpleDataSet;
begin
  Result := '';
  SQL := NewQuery;
  try
    SQL.DataSet.CommandText := Qry;
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
        Prn.Write (' ');
        prn.WriteRight('Controle:'+vgDadosCarimbo.ChaveEtiqueta,'-',viBobina-1);
      end
      else prn.Write(vlDivisoria);;
      prn.CRLF;
      Prn.Write (#27'K'#13);
      prn.Write(#186);
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

procedure TdtmControles.MostraErro(E: Exception);
var Erro: string;
begin
  Erro := E.Message;
  if (Pos('PRIMARY OR UNIQUE', UpperCase(Erro)) > 0) or (Pos(EKeyViolation, UpperCase(Erro)) > 0) then
    Application.MessageBox('Este ítem já consta no cadastro!', 'Erro', mb_Ok +
      mb_IconError)
  else if Pos(EFKeyViolation, UpperCase(Erro)) > 0 then
          Application.MessageBox('Este registro não pode ser excluido pois esta sendo usado em outro local!', 'Erro', mb_Ok + mb_IconError)
       else Application.MessageBox(PAnsiChar(copy(Erro, pos('@',Erro)+1,Length(Erro))), 'Erro', mb_Ok + mb_IconError);
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
    Application.MessageBox(Pchar('Campo '+vpNomeCampo+ ' não pode ser vazio!!!'), 'Aviso', MB_OK + MB_DEFBUTTON1 + MB_ICONINFORMATION);
    vpCampo.SetFocus;
    Abort;
  end;
end;

function GetCodigoControle : String;
var
  Chave : String;
begin
  Randomize;
  Chave  := IntToStr(DayOf(Date)) + IntToStr(MinuteOf(Time)) + IntToStr(Random(99)) + IntToStr(Random(99));
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

procedure TdtmControles.DBBeforeConnect(Sender: TObject);
var
  Ini  : TIniFile;
  viSerialMaster, viTipoUnidade : String;
begin
  Cripto.Key := vgChaveSecao;
  //Busca Valores para variáveis de acesso ao banco
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Master.ini');
  viSerialMaster := Cripto.CriptoHexToText(Ini.ReadString('MASTER', 'Maquina', ''));
  Ini.Free;

  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Config.ini');

  viTipoUnidade := Cripto.CriptoHexToText(Ini.ReadString('GERAL', 'TipoUnidade', ''));
  Ini.Free;

  vgExecutarSistema := True;

  if vgChaveSecao = 'Grupo@I9vare@Tri7' then 
  begin
    if not (TravaSistema(dtmControles.Cripto.CriptoHexToText(vgKey), viSerialMaster)) then
    begin
      vgExecutarSistema := False;
      Application.MessageBox(PChar('Sistema não pode ser utilizado nesta máquina!' + #13#10 +
                                   'Favor entrar em contato com o administrador do sistema.'), 'Atenção', MB_OK + MB_ICONWARNING);
      Application.Terminate;
    end;
  end;

  //Passa os parametros para o Banco de Dados
  DB.Params.Clear;
  DB.DriverName      := 'InterBase by Core Lab';
  DB.ConnectionName  := 'InterBase by Core Lab';
  DB.LibraryName     := 'dbexpida40.dll';
  DB.VendorLib       := 'fbclient.dll';

  DB.GetDriverFunc   := 'getSQLDriverInterBase';
  DB.Params.Values['BLobSize']           := '-1';
  DB.Params.Values['ErrorResourceFile']  := '';
  DB.Params.Values['LocaleCode']         := '0000';
  DB.Params.Values['Interbase TransIsolation'] := 'ReadCommited';
  DB.Params.Values['CommitRetain']   := 'False';
  DB.Params.Values['RoleName']       := 'RoleName';
  DB.Params.Values['ServerCharSet']  := 'ISO8859_1';
  DB.Params.Values['SQLDialect']     := '3';
  DB.Params.Values['WaitOnLocks']    := 'True';

  DB.Params.Values['OptimizedNumerics'] := 'False';
  DB.Params.Values['useUnicode']        := 'False';
//  DB.Params.Values['DeferredBlobRead']  := 'True';
//  DB.Params.Values['DeferredArrayRead'] := 'True';

  vgDadosBase.BaseDados := Cripto.CriptoHexToText(vgBaseDados);
  vgDadosBase.NomeBase  := Cripto.CriptoHexToText(vgBaseNome);

  if (viTipoUnidade = 'USB') then
    vgDadosBase.BaseDados := GetCurrentDir+'\Base\'+vgDadosBase.NomeBase+'.FDB'
  else
    if (viTipoUnidade = 'LOCAL') or ((viTipoUnidade = '') and (vgDadosBase.BaseDados = '')) then
     vgDadosBase.BaseDados := '127.0.0.1:'+GetCurrentDir+'\Base\'+vgDadosBase.NomeBase+'.FDB';

  vgDadosBase.Senha := Cripto.CriptoHexToText(vgSenha);
  vgDadosBase.Local := copy(vgDadosBase.BaseDados, pos(':',vgDadosBase.BaseDados)+1, (Length(vgDadosBase.BaseDados)));

  DB.Params.Values['DataBase']   := vgDadosBase.BaseDados;
  DB.Params.Values['User_Name']  := Cripto.CriptoHexToText(vgUsuario);
  DB.Params.Values['Password']   := Cripto.CriptoHexToText(vgSenha);
end;

procedure TdtmControles.BuscarIpRede(var vpComboBox : TcxComboBox);
var
  i, viFlag : integer;
  viRede  : string;
begin
 { Screen.Cursor := crHourGlass;

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
end;

function TdtmControles.BuscarParametroOutroSistema(vpNome, vpSecao, vpGrupo,
  vpSistema: String): Variant;
begin
  ExecutaSqlAuxiliar(' SELECT VALOR FROM G_CONFIG '+
                     ' WHERE NOME = '+ QuotedStr(vpNome)+
                     '   AND SECAO    = '+ QuotedStr(vpSecao)+
                     '   AND CONFIG_GRUPO_ID = (SELECT CONFIG_GRUPO_ID FROM G_CONFIG_GRUPO '+
                     '                          WHERE DESCRICAO = '+QuotedStr(vpGrupo)+
                     '                            AND SISTEMA_ID = '+ vpSistema+')',0);
  result := dtmControles.sqlAuxiliar.FieldByName('VALOR').AsVariant;
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
      1 : ExecSQL(FALSE);
      // Tipo = 2, significa que vai receber parametros.
    end;
  end;
end;

procedure TdtmControles.DataModuleCreate(Sender: TObject);
begin
    ModificarDataSistema;
  Shortdateformat := 'dd/mm/yyyy';

  try
    DB.Connected := False;
    DB.Connected := True;
  except
    on e: exception do
    begin
      Application.MessageBox(Pchar('Não foi possível conectar no banco de Dados!'+#13+
        'Informe ao Suporte Técnico!'+ #13+' (' + e.Message + ')'), 'Erro', MB_ICONERROR);
      Application.Terminate;
    end;
  end;

  AtualizarEstruturaSistema;

  vgLogin := 'I937';
  vgDiretorioCorrente := GetCurrentDir;
  SimpleAuxiliar.Connection := DB;
  sqlConfig.Connection      := DB;

  //Inicializando Agenda
  sqlG_Agenda.Connection    := DB;
  CarregaFeriado;
  CriarFuncoesRelatorio(frxRelatorio);
end;

function TdtmControles.GetFields(Qry: string): TStringList;
var
  SQL: TSimpleDataSet;
  C: integer;
begin
  Result := TStringList.Create;
  SQL := NewQuery;
  try
    SQL.DataSet.CommandText := Qry;
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

function TdtmControles.RetornaTexto(Str: String): String;
var wptAux : TWPRichText;
begin
  wptAux := TWPRichText.Create(nil);
  wptAux.AsString := Str;
  Result := wptAux.Text;
  wptAux.Free;
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
     end
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

function TdtmControles.DataHoraBanco(vpParametro: integer): Variant;
{1 = Data em string; 2 = Hora em string ; 3 = DataHora em TDateTime;
4 = Data em String Normal; 5 = DataHora em String; 6 = Hora/Minuto/Segundo em String}
var
  vlData, vlHora, vlHoraMinSeg, vlDataNormal: string;
  vlDataHora, vlDataTemp : TDateTime;
  vlDataHoraStr : String;
  viProximoDiaUtil : Boolean;
  viDataInclemento : Integer;
begin
  try
    viProximoDiaUtil := dtmControles.BuscarConfig('PRINCIPAL','GERAL','ATIVAR_PROXIMO_DIA_UTIL', 'S') = 'S';
  except
    ShowMessage('Parametro PRINCIPAL/GERAL/ATIVAR_PROXIMO_DIA_UTIL não configurado!!!');
    viProximoDiaUtil := False;
  end;

  if UpperCase(vgBaseDados) = 'ORACLE' then
  begin
    vlDataHora   := StrToDateTime(GetStr('SELECT SYSDATE FROM DUAL'));
    vlData       := FormatDateTime('DD/MM/YYYY',vlDataHora);
    vlDataNormal := vlData;
  end
  else
  begin
    vlDataHora := StrToDateTime(GetStr('SELECT CURRENT_TIMESTAMP FROM RDB$DATABASE'));

{    if viProximoDiaUtil then
      vlDataHora := VerificarProximoDiaUtil(vlDataHora);}

    // Temporario
    if viProximoDiaUtil then
    begin
      if (DateToStr(vlDataHora) = '06/12/2014') then
        vlDataHora := vlDataHora + 3
      else
        if (DateToStr(vlDataHora) = '07/12/2014') then
          vlDataHora := vlDataHora + 2
      else
        if (DateToStr(vlDataHora) = '08/12/2014') then
          vlDataHora := vlDataHora + 1
    end;

    vlData := FormatDateTime('YYYY/MM/DD',vlDataHora);
    vlDataNormal := FormatDateTime('DD/MM/YYYY',vlDataHora);
    vlDataHoraStr:= FormatDateTime('DD.MM.YYYY HH:MM:SS', vlDataHora);
  end;
  vlHora       := FormatDateTime('hh:mm',vlDataHora);
  vlHoraMinSeg := FormatDateTime('hh:mm:ss',vlDataHora);

  case vpParametro of
   1 : DataHoraBanco := vlData;
   2 : DataHoraBanco := vlHora;
   3 : DataHoraBanco := vlDataHora;
   4 : DataHoraBanco := vlDataNormal;
   5 : DataHoraBanco := vlDataHoraStr;
   6 : DataHoraBanco := vlHoraMinSeg;
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
  Finalize(Feriado);
  DB.Close;
end;

procedure TdtmControles.CarregaFeriado;
var
  viSql : String;
begin
  viSql := ' SELECT TIPO, ANO, MES, DIA FROM G_FERIADO '+
           ' WHERE SITUACAO = ''A'' ';
  ExecutaSimpleDSAux(viSql, 0);
  if not SimpleAuxiliar.IsEmpty then
  begin
    SetLength(Feriado, SimpleAuxiliar.RecordCount);
    SimpleAuxiliar.First;
    while not SimpleAuxiliar.Eof do
    begin
      Feriado[SimpleAuxiliar.RecNo - 1].Tipo := SimpleAuxiliar.FieldByName('TIPO').AsString;
      Feriado[SimpleAuxiliar.RecNo - 1].Ano  := SimpleAuxiliar.FieldByName('ANO').AsInteger;
      Feriado[SimpleAuxiliar.RecNo - 1].Mes  := SimpleAuxiliar.FieldByName('MES').AsInteger;
      Feriado[SimpleAuxiliar.RecNo - 1].Dia  := SimpleAuxiliar.FieldByName('DIA').AsInteger;
      SimpleAuxiliar.Next;
    end;
  end;
  SimpleAuxiliar.Active := False;
end;

procedure TdtmControles.CarregarConfig;
begin
  dtmControles.sqlConfig.Close;
  dtmControles.sqlConfig.DataSet.ParamByName('TERMINAL').AsString    := Rotinas.NomeEstacao;
  dtmControles.sqlConfig.DataSet.ParamByName('SISTEMA_ID').AsInteger := vgId;
  dtmControles.sqlConfig.Open;

  vgNumeRegHistorico := BuscarConfig('PRINCIPAL', 'GERAL', 'QTDEREG_HISTORICO', 'I');
end;

procedure TdtmControles.Auditoria(Tabela, Campo, Operacao, Valor, ID, Observacao: String);

  function ControleAuditor(TabelaAuditoria : String): Boolean;
  var Sql : String;
      sqlHistorico : TSimpleDataSet;
  begin
    Result := True;

    sqlHistorico := TSimpleDataSet.Create(Application);
    sqlHistorico.Connection := DB;

    Sql := ' SELECT * FROM ' + TabelaAuditoria +
           ' WHERE TABELA = :TABELA '+
           ' AND ID = :ID '+
           ' AND CAMPO = :CAMPO '+
           ' ORDER BY HISTORICO_ID ';

    sqlHistorico.DataSet.CommandText :=  Sql;
    sqlHistorico.DataSet.Prepared := True;
    sqlHistorico.DataSet.ParamByName('TABELA').AsString := Tabela;
    sqlHistorico.DataSet.ParamByName('ID').AsString     := ID;
    sqlHistorico.DataSet.ParamByName('CAMPO').AsString  := Campo;
    sqlHistorico.Open;

    if not sqlHistorico.IsEmpty then
    begin
      if sqlHistorico.RecordCount >= vgNumeRegHistorico then
      begin
        Result := False;
        sqlHistorico.First;
        sqlHistorico.Edit;
        sqlHistorico.FieldByName('HISTORICO_ID').AsString := GerarSequencia(TabelaAuditoria);
        sqlHistorico.FieldByName('TABELA').AsString := Tabela;
        sqlHistorico.FieldByName('CAMPO').AsString := Campo;
        sqlHistorico.FieldByName('OPERACAO').AsString := Operacao;
        sqlHistorico.FieldByName('NEW_VALUE').AsString := Valor;
        sqlHistorico.FieldByName('DATA').AsDateTime := DataHoraBanco(3);
        sqlHistorico.FieldByName('USUARIO_ID').AsString := vgUsuarioID;
        sqlHistorico.FieldByName('ID').AsString := ID;
        sqlHistorico.FieldByName('OBSERVACAO').AsString := Observacao;
        sqlHistorico.Post;
        sqlHistorico.ApplyUpdates(-1);
      end;
    end;
    sqlHistorico.Free;
    Application.ProcessMessages;
  end;

var
  Sql,
  TabelaAuditoria : String;
  sqlAuditor : TSimpleDataSet;
begin
  case vgId of
    1 : TabelaAuditoria := 'R_HISTORICO';
    2 : TabelaAuditoria := 'T_HISTORICO';
    5 : TabelaAuditoria := 'C_HISTORICO';
    7 : TabelaAuditoria := 'D_HISTORICO';
    12: TabelaAuditoria := 'V_HISTORICO';
    13: TabelaAuditoria := 'P_HISTORICO';
    15: TabelaAuditoria := 'S_HISTORICO';
  end;

  if ControleAuditor(TabelaAuditoria) then
  begin
    sqlAuditor := TSimpleDataSet.Create(Application);
    sqlAuditor.Connection := DB;

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

    sqlAuditor.DataSet.CommandText := Sql;

    sqlAuditor.DataSet.ParamByName('HISTORICO_ID').AsString := GerarSequencia(TabelaAuditoria);
    sqlAuditor.DataSet.ParamByName('TABELA').AsString := Tabela;
    sqlAuditor.DataSet.ParamByName('CAMPO').AsString := Campo;
    sqlAuditor.DataSet.ParamByName('OPERACAO').AsString := Operacao;
    sqlAuditor.DataSet.ParamByName('NEW_VALUE').AsBlob   := Valor;
    sqlAuditor.DataSet.ParamByName('DATA').AsString := DataHoraBanco(5);
    sqlAuditor.DataSet.ParamByName('USUARIO_ID').AsString := vgUsuarioID;
    sqlAuditor.DataSet.ParamByName('ID').AsString := ID;
    sqlAuditor.DataSet.ParamByName('OBSERVACAO').AsString := Observacao;

    sqlAuditor.Execute;
    Application.ProcessMessages;
    sqlAuditor.Free;
  end;
end;

procedure TdtmControles.CapturaErro(Sender: TObject; E: Exception);
var
  msg: string;
begin
  try
    StartTransaction;
    with SimpleAuxiliar do
    begin
      Active := False;
      DataSet.CommandText := ' SELECT * FROM G_LOG_ERRO '+
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
          Memo1.Text:= BuscarConfig('PRINCIPAL', 'RELATORIO', 'CABECALHO_RELATORIO', 'W');;
  end;
  frxRelatorio.Variables.Variables['vgNomeCartorio'] := QuotedStr(dtmControles.BuscarConfig('PRINCIPAL', 'CARTORIO', 'NOME', 'S'));
  frxRelatorio.Variables.Variables['vgLogin'] := QuotedStr(vgLogin);

end;

function TdtmControles.frxRelatorioUserFunction(const MethodName: String;
  var Params: Variant): Variant;
begin
  Result := ExecutarFuncoesRelatorio(MethodName, Params);
end;

procedure TdtmControles.ShowRelatorio(ID : String);
var Retorno : String;
begin
  Retorno := CodPermissao('REL_' + ID);;
  if Retorno = '000000' then
  begin
    Application.MessageBox('Usuário não tem permissão de acessar esta rotina!', 'Atenção', MB_OK + MB_ICONWARNING);
    Abort;
  end;
  ExibirRelatorio(frxRelatorio, ID, ParametrosRelatorio);
end;

procedure TdtmControles.CriarMenuRelatorio(var ActManager : TActionManager; var ActRel : TAction; id : Integer);
var
  Act : TAction;
  i, Grupo, GrupoAnterior : integer;
  Str : TStringList;
begin
  sqlRelatorio.Connection := dtmControles.DB;
  sqlRelatorio.DataSet.Params[0].AsInteger := vgId;
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
          DataSet.Params[0].AsCurrency := StrToInt(vgUsuarioID);
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

end.

