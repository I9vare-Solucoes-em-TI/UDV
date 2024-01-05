unit Controles;

interface

uses
  I9Query,
  I9Connection,
  Windows, SysUtils, Forms, Classes, DBXpress, DB, SqlExpr, WinSkinData, ImgList,
  Controls, Cripto, cxContainer, cxEdit, cxClasses, cxStyles, Math,
  cxGridTableView, cxHint, DBClient, SimpleDS, cxEditRepositoryItems, WPCTRRich,
  FMTBcd, cxGridCardView, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxDbEdit, IniFiles,
  IdBaseComponent, IdComponent, IdIPWatch, Winsock, IdRawBase, IdRawClient,
  IdIcmpClient, cxDropDownEdit, Variants, cxMaskEdit, frxRich, frxClass,
  frxExportImage, frxDesgn, ad3SpellBase, ad3Spell, frxDCtrl,
  frxFDComponents, frxChBox, frxCross, frxChart, frxOLE, frxBarcode,
  ActnMan, ActnColorMaps, cxImageComboBox, Dialogs, ActnCtrls, ActnList,
  cxLookAndFeels;

type
  TPessoa = Record
    CadastrarNovo, PessoaTipo, Sexo, ConjugeRepresentante : string;
    CPF_CNPJ, VinculoAuxiliar : String;
    PessoaId, NotPessoaId, PessoaSelecionada, PessoaVinculo : integer;
    Selecionar, NovaParte : Boolean;
    NomeTabela: string;
  end;

  TImovel = Record
    CadastrarNovo, Numero, TipoClasse : string;
    ImovelId, NotImovelId, ImovelSelecionado : integer;
    Selecionado, Selecionar, NovaUnidade, AdicionarUnidade, QualificacaoGeral : Boolean;
    Registro, ValorAvaliacao, ValorAlienacao, Aliquota : String;
  end;

  TAto = Record
    AtoTipoId, AtoId, NaturezaId : integer;
    PesqTabela, PesqCampoId, ValorFiltro : string;
  end;

  TGravarTextoAutomatico = Record
    Gravar, Intervalo : string;
  end;

  TImpressao = Record
    TipoImpressora, RelatorioID : integer;
    Cabecalho, Rodape : string;
  end;

  TCertidao = Record
    ImovelId, NomePessoa, TipoRegistro : String;
  end;

type
  TGeralThread = class(TThread)
  private
  protected
    procedure Execute; override;
  end;

  TExecuteProcedure = procedure of object;

  TdtmControles = class(TDataModule)
    Cripto: TCriptografa;
    SkinData1: TSkinData;
    imgCadBasicos: TImageList;
    DB: TI9Connection;
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
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxHintStyleController: TcxHintStyleController;
    SimpleAuxiliar: TI9Query;
    sqlSequencia: TI9Query;
    GridCardViewStyleSheetDevExpress: TcxGridCardViewStyleSheet;
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
    IdIPWatch: TIdIPWatch;
    IdIcmpClient1: TIdIcmpClient;
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
    sqlConfigVALOR: TStringField;
    sqlConfigDESCRICAO: TStringField;
    sqlConfigTEXTO: TBlobField;
    sqlConfigTERMINAL: TStringField;
    sqlConfigTIPO_VALOR: TStringField;
    sqlConfigGRUPO: TStringField;
    frxRichObject1: TfrxRichObject;
    frxTIFFExport1: TfrxTIFFExport;
    frxBMPExport1: TfrxBMPExport;
    frxDesigner1: TfrxDesigner;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyleDestaque: TcxStyle;
    AddictSpell31: TAddictSpell3;
    frxDialogControls1: TfrxDialogControls;
    frxBarCodeObject1: TfrxBarCodeObject;
    frxOLEObject1: TfrxOLEObject;
    frxChartObject1: TfrxChartObject;
    frxCrossObject1: TfrxCrossObject;
    frxCheckBoxObject1: TfrxCheckBoxObject;
    frxFDComponents1: TfrxFDComponents;
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
    StandardColorMap1: TStandardColorMap;
    sqlRelatorio: TI9Query;
    sqlRelatorioGRUPO_RELATORIO_ID: TBCDField;
    sqlRelatorioGRUPO: TStringField;
    sqlRelatorioCONFIG_RELATORIO_ID: TBCDField;
    sqlRelatorioDESCRICAO: TStringField;
    sqlRelatorioRELATORIO: TBlobField;
    LookAndFeelController: TcxLookAndFeelController;
    frxRelatorio: TfrxReport;
    procedure DBBeforeConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    function frxRelatorioUserFunction(const MethodName: String;
      var Params: Variant): Variant;
  private
    { Private declarations }
    TD: TTransactionDesc;

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

    //Auditoria
    procedure Auditoria(Tabela, Campo, Operacao, Valor, ID, Observacao: String);

    //Relatorio
    procedure ShowRelatorio(ID : String);
    procedure ParametrosRelatorio;
    procedure CriarMenuRelatorio(var ActManager : TActionManager; var ActRel : TAction; id : Integer);

  end;
var
  vgChamarLogin, vgExecutarSistema: boolean;
  vgId : Integer;
  vgVersao1, vgVersao2 : TDateTime;
  vgHelpID,
  vgTelaSistema,
  vgCodAtalho,
  vgMarcacaoAutoGrupo : String;

  // Variaveis de Tipo Pré-Definidos
  vgPessoa : TPessoa;
  vgImovel : TImovel;
  vgAto    : TAto;
  vgGravarTextoAutomatico : TGravarTextoAutomatico;
  vgChaveRetorno,
  vgNumeRegHistorico: integer;
  vgImpressao : TImpressao;
  vgCertidaoReg : TCertidao; 

  // Conexao com o Banco
  vgTipoBanco, vgBaseDados, vgUsuarioID ,vgLogin, vgUsuarioNome, vgUsuario, vgSenha, vgDiretorioCorrente, vgKey : string;

  // Dados do Cartorio
  vgCartorio, vgCidade, vgCep, vgUF : string;

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

implementation

uses Rotinas, VisualizaRelatorios, Versao;

{$R *.dfm}

{ TdtmControles }

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

function TdtmControles.CodPermissao(Rotina: string): string;
var Str : TStringList;
begin
  Result := '000000';
  if vgLogin <> 'SERENITY' then
  begin
    Str := dtmControles.GetFields(' SELECT P.PERMISSAO, R.ATALHO_SISTEMA FROM G_USUARIO U ' +
                                  ' LEFT JOIN G_USUARIO_SISTEMA US ON ' +
                                    '    U.USUARIO_ID = US.USUARIO_ID ' +
                                  ' LEFT JOIN G_PERMISSAO_USUARIO P ON ' +
                                  '    U.USUARIO_ID = P.USUARIO_ID ' +
                                  ' INNER JOIN G_SISTEMA_ROTINA R ON ' +
                                  '    P.SISTEMA_ROTINA_ID = R.SISTEMA_ROTINA_ID ' +
                                  ' WHERE U.LOGIN = ' + QuotedStr(vgLogin) +
                                  ' AND R.CHAVE_ROTINA = ' + QuotedStr(Rotina) +
                                  ' AND US.SISTEMA_ID = ' + IntToStr(vgId));

    if Trim(Str.Values['PERMISSAO']) = '' then
    begin
      Str.Clear;
      Str := dtmControles.GetFields(' SELECT P.PERMISSAO, R.ATALHO_SISTEMA FROM G_USUARIO U ' +
                                    ' LEFT JOIN G_USUARIO_SISTEMA US ON ' +
                                    '    U.USUARIO_ID = US.USUARIO_ID ' +
                                    ' LEFT JOIN G_PERMISSAO_GRUPO P ON ' +
                                    '   US.USUARIO_GRUPO_ID = P.USUARIO_GRUPO_ID ' +
                                    ' INNER JOIN G_SISTEMA_ROTINA R ON ' +
                                    '   P.SISTEMA_ROTINA_ID = R.SISTEMA_ROTINA_ID ' +
                                    ' WHERE U.LOGIN = ' + QuotedStr(vgLogin) +
                                    ' AND R.CHAVE_ROTINA = ' + QuotedStr(Rotina) +
                                    ' AND US.SISTEMA_ID = ' + IntToStr(vgId));
    end;
    Result      := Str.Values['PERMISSAO'];
    vgCodAtalho := Str.Values['ATALHO_SISTEMA'];

    if Trim(Result) = '' then
       Result := '000000';
  end
  else
    Result := '111111';
end;

procedure TdtmControles.Commit;
begin
  DB.Commit(TD);
end;

function TdtmControles.ExecSQL(Qry: string): Boolean;
var
  SQL: TI9Query;
begin
  Result := True;
  SQL := NewQuery;
  try
    SQL.SQL.Text := Qry;
    SQL.Execute;
  except
    on E: exception do
    begin
      Result := False;
      MostraErro(E);
    end;
  end;
  SQL.Free;
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
begin
  if Tabela <> '' then
     Result := GetInt('SELECT * FROM G_SP_SEQUENCIAS (' + QuotedStr(Tabela) + ')');
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
  SQL.Free;
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

procedure TdtmControles.DBBeforeConnect(Sender: TObject);
begin
  //Passa os parametros para o Banco de Dados
  DB.Params.Clear;
  if UpperCase(Cripto.CriptoHexToText(vgTipoBanco)) = 'ORACLE' then
  begin
    DB.ConnectionName  := 'Oracle';
    DB.DriverName      := 'Oracle';
    DB.LibraryName     := 'dbexpora.dll';
    DB.VendorLib       := 'OCI.DLL';
    DB.GetDriverFunc   := 'getSQLDriverORACLE';
    DB.Params.Values['BLobSize']               := '-1';
    DB.Params.Values['ErrorResourceFile']      := '';
    DB.Params.Values['LocaleCode']             := '0000';
    DB.Params.Values['Oracle TransIsolation']  := 'ReadCommited';
  end
  else
  begin
    DB.ConnectionName  := 'IBLocal';
    DB.DriverName      := 'Interbase';
    DB.LibraryName     := 'dbexpint.dll';
    DB.VendorLib       := 'GDS32.DLL';
    DB.GetDriverFunc   := 'getSQLDriverINTERBASE';
    DB.Params.Values['BLobSize']           := '-1';
    DB.Params.Values['ErrorResourceFile']  := '';
    DB.Params.Values['LocaleCode']         := '0000';
    DB.Params.Values['Interbase TransIsolation'] := 'ReadCommited';
    DB.Params.Values['CommitRetain']   := 'False';
    DB.Params.Values['RoleName']       := 'RoleName';
    DB.Params.Values['ServerCharSet']  := 'ISO8859_1';
    DB.Params.Values['SQLDialect']     := '3';
    DB.Params.Values['WaitOnLocks']    := 'True';
  end;
  DB.Params.Values['DataBase']   := Cripto.CriptoHexToText(vgBaseDados);
  DB.Params.Values['User_Name']  := Cripto.CriptoHexToText(vgUsuario);
  DB.Params.Values['Password']   := Cripto.CriptoHexToText(vgSenha);
end;

procedure TdtmControles.BuscarIpRede(var vpComboBox : TcxComboBox);
var
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
  Screen.Cursor := crDefault;
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

procedure TdtmControles.DataModuleCreate(Sender: TObject);
begin
  vgExecutarSistema := True;
  if not TravaSistema(Cripto.CriptoHexToText(vgKey)) then
  begin
    vgExecutarSistema := False;
    Application.MessageBox(PChar('Sistema não pode ser utilizado nesta máquina!' + #13#10 +
                                 'Favor entrar em contato com o administrados do sistema.'), 'Atenção', MB_OK + MB_ICONWARNING);
    Application.Terminate;
  end;
  try
    DB.Connected := True;
  except
    on e: exception do
    begin
      Application.MessageBox(Pchar('Não foi possível conectar no banco de Dados!'+#13+
        'Informe ao Suporte Técnico!'+ #13+' (' + e.Message + ')'), 'Erro', MB_ICONERROR);
      Application.Terminate;
    end;
  end;
  vgLogin := 'SERENITY';
  vgDiretorioCorrente := GetCurrentDir;
  SimpleAuxiliar.Connection := DB;
  sqlConfig.Connection      := DB;
  CriarFuncoesRelatorio(frxRelatorio);
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
                                 'Favor informar o Suporte Técnico!'), 'Aviso', mb_IconExclamation);
    if vpTipoValor in ['S', 'T'] then
       BuscarConfig := ''
    else BuscarConfig := 0;
  end;
end;

function MontarSqlData(DataIni, DataFim: TDateTime): string;
begin
  if UpperCase(vgTipoBanco) = 'ORACLE' then
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
{1 = Data em string; 2 = Hora em string ; 3 = DataHora em TDateTime; 4 = Data em String Normal}
var
  vlData, vlHora, vlDataNormal: string;
  vlDataHora : TDateTime;
begin
  if UpperCase(vgBaseDados) = 'ORACLE' then
  begin
    vlDataHora   := StrToDateTime(GetStr('SELECT SYSDATE FROM DUAL'));
    vlData       := FormatDateTime('DD/MM/YYYY',vlDataHora);
    vlDataNormal := vlData;
  end
  else
  begin
    vlDataHora := StrToDateTime(GetStr('SELECT CURRENT_TIMESTAMP FROM RDB$DATABASE'));
    vlData := FormatDateTime('YYYY/MM/DD',vlDataHora);
    vlDataNormal := FormatDateTime('DD/MM/YYYY',vlDataHora);
  end;
  vlHora := FormatDateTime('hh:mm',vlDataHora);

  case vpParametro of
   1 : DataHoraBanco := vlData;
   2 : DataHoraBanco := vlHora;
   3 : DataHoraBanco := vlDataHora;
   4 : DataHoraBanco := vlDataNormal;
  end;
end;

procedure TdtmControles.CriarImagem(wptTexto : TWPRichText; Arquivo : String; Tipo : Byte = 1);
var RichView1 : TfrxRichView;
    Page1 : TfrxReportPage;
    ReportTitle1 : TfrxReportTitle;
begin
  Page1 := TfrxReportPage(frxRelatorio.FindObject('Page1'));
  if Page1 <> nil then
  begin
    Page1.PaperWidth  := StrToFloat(FormatFloat('0.00', (wptTexto.Header.PageWidth / 56.7)));
    Page1.PaperHeight := StrToFloat(FormatFloat('0.00', (wptTexto.Header.PageHeight / 56.7)));
  end;

  ReportTitle1 := TfrxReportTitle(frxRelatorio.FindObject('ReportTitle1'));
  if Page1 <> nil then
    ReportTitle1.Height := (Page1.PaperHeight / 0.26) -
                           (Page1.PaperHeight / 10) - 0.5;

  RichView1 := TfrxRichView(frxRelatorio.FindObject('Rich1'));
  if RichView1 <> nil then
  begin
     RichView1.Top    := 0;
     RichView1.Height := ReportTitle1.Height;
     RichView1.RichEdit.Text:= wptTexto.AsString;
  end;
  frxRelatorio.PrepareReport;
  frxTIFFExport1.CropImages := True;
  frxTIFFExport1.FileName := Arquivo;
  frxBMPExport1.FileName  := Arquivo;

  //frxRelatorio.DesignReport;
  //if Application.MessageBox('Deseja visualizar o arquivo?','Visualizar', MB_YESNO) = ID_YES then
  //   frxRelatorio.ShowReport;

  if Tipo = 1 then
  begin
     frxRelatorio.Export(frxTIFFExport1);
     Arquivo := Copy(Arquivo,1, Pos('.', Arquivo)) + '1.tif';
  end
  else begin
       frxRelatorio.Export(frxBMPExport1);
       Arquivo := Copy(Arquivo,1, Pos('.', Arquivo)) + '1.bmp';
  end;

  Application.ProcessMessages;
  CopyFile(PChar(Arquivo), PChar(frxTIFFExport1.FileName), FALSE);
  DeleteFile(Arquivo);
end;

procedure TdtmControles.DataModuleDestroy(Sender: TObject);
begin
  DB.Close;
end;

procedure TdtmControles.CarregarConfig;
begin
  dtmControles.sqlConfig.Close;
  dtmControles.sqlConfig.ParamByName('TERMINAL').AsString    := Getcomputer;
  dtmControles.sqlConfig.ParamByName('SISTEMA_ID').AsInteger := vgId;
  dtmControles.sqlConfig.Open;
end;

procedure TdtmControles.Auditoria(Tabela, Campo, Operacao, Valor, ID, Observacao: String);

  function ControleAuditor(TabelaAuditoria : String): Boolean;
  var Sql : String;
      sqlHistorico : TI9Query;
  begin
    Result := True;

    sqlHistorico := TI9Query.Create(Application);
    sqlHistorico.Connection := DB;

    Sql := ' SELECT * FROM ' + TabelaAuditoria +
           ' WHERE TABELA = :TABELA '+
           ' AND ID = :ID '+
           ' AND CAMPO = :CAMPO '+
           ' ORDER BY HISTORICO_ID ';

    sqlHistorico.SQL.Text :=  Sql;
    sqlHistorico.ParamByName('TABELA').AsString := Tabela;
    sqlHistorico.ParamByName('ID').AsString     := ID;
    sqlHistorico.ParamByName('CAMPO').AsString  := Campo;
    sqlHistorico.Open;

    if not sqlHistorico.IsEmpty then
    begin
      if sqlHistorico.RecordCount = vgNumeRegHistorico then
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
    sqlAuditor : TI9Query;
begin
  case vgId of
    1: TabelaAuditoria := 'R_HISTORICO';
    2: TabelaAuditoria := 'T_HISTORICO';
    5: TabelaAuditoria := 'C_HISTORICO';
  end;

  if ControleAuditor(TabelaAuditoria) then
  begin
    sqlAuditor := TI9Query.Create(Application);
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

    sqlAuditor.SQL.Text := Sql;

    sqlAuditor.ParamByName('HISTORICO_ID').AsString := GerarSequencia(TabelaAuditoria);
    sqlAuditor.ParamByName('TABELA').AsString := Tabela;
    sqlAuditor.ParamByName('CAMPO').AsString := Campo;
    sqlAuditor.ParamByName('OPERACAO').AsString := Operacao;
    sqlAuditor.ParamByName('NEW_VALUE').AsBlob   := Valor;
    sqlAuditor.ParamByName('DATA').AsDate   := DataHoraBanco(3);
    sqlAuditor.ParamByName('USUARIO_ID').AsString := vgUsuarioID;
    sqlAuditor.ParamByName('ID').AsString := ID;
    sqlAuditor.ParamByName('OBSERVACAO').AsString := Observacao;

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
      SQL.Text := 'SELECT * FROM G_LOG_ERRO '+
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
begin
  ExibirRelatorio(frxRelatorio, ID, ParametrosRelatorio);
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

end.

