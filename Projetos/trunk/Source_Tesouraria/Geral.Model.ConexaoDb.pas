unit Geral.Model.ConexaoDb;

interface

uses
  I9Connection,
  FireDAC.Stan.Intf,
  System.Types,
  Winapi.Windows,
  I9Query;

type
  TConexaoDb = class
  private
    FConnection: TI9Connection;
    FOwnsConnection: Boolean;

    const
      CI_COD_SISTEMA_REGISTRO_IMOVEIS: Integer = 1;
      CI_COD_SISTEMA_TABELIONATO_DE_NOTAS: Integer = 2;
      CI_COD_SISTEMA_CAIXA: Integer = 5;
      CI_COD_SISTEMA_RTD: Integer = 7;
      CI_COD_SISTEMA_RC: Integer = 12;
      CI_COD_SISTEMA_PROTESTO: Integer = 13;

    function BuscarNomeEstacao: string;

    procedure BuscarParametro(
      vpQuery: TI9Query;
      const vpColuna: string;
      const vpSistemaId: Integer;
      const vpGrupo: string;
      const vpSecao: string;
      const vpNome: string;
      const vpTerminal: string);

    function Buscar(
      const vpColuna: string;
      const vpSistemaId: Integer;
      const vpGrupo: string;
      const vpSecao: string;
      const vpNome: string): TI9Query;

    function BuscarDefinicaoConexao: IFDStanConnectionDef;

    procedure BuscarDadosIni(
      out vpBaseDados: string;
      out vpUsuario: string;
      out vpSenha: string);

    procedure BuscarDadosConexao(
      out vpBaseDados: string;
      out vpUsuario: string;
      out vpSenha: string);
  public
    constructor Create; overload;

    constructor Create(
      const vpConnection: TI9Connection;
      const vpOwnsConnection: Boolean); overload;

    function BuscarDataHoraBanco: TDateTime;

    function BuscarConfigValor(
      const vpSistemaId: Integer;
      const vpGrupo: string;
      const vpSecao: string;
      const vpNome: string): string;

    function BuscarConfigTexto(
      const vpSistemaId: Integer;
      const vpGrupo: string;
      const vpSecao: string;
      const vpNome: string): AnsiString;

    class function BuscarConfigCaminho(
      const vpSistemaId: Integer;
      const vpGrupo: string;
      const vpSecao: string;
      const vpNome: string): string;

    property Connection: TI9Connection read FConnection;

    destructor Destroy; override;
  end;

implementation

uses
  FireDAC.Comp.Client,
  FireDAC.Phys.IBWrapper,
  FireDAC.Phys.FBDef,
  System.IniFiles,
  System.SysUtils,
  ECripto,
  System.IOUtils,
  FireDAC.Stan.Option,
  Geral.Model.Util.Firebird,
  Data.DB,
  System.Generics.Collections;

{ TConexaoDb }

constructor TConexaoDb.Create;
var
  viConnection: TI9Connection;
  viDefinicaoConexao: IFDStanConnectionDef;
  viMapRule: TFDMapRule;
begin
  inherited Create;

  viDefinicaoConexao := BuscarDefinicaoConexao;

  viConnection := TI9Connection.Create(nil);
  viConnection.ConnectionDefName := viDefinicaoConexao.Name;

  viConnection.FetchOptions.AssignedValues := [TFDFetchOptionValue.evMode];
  viConnection.FetchOptions.Mode := TFDFetchMode.fmAll;

  viConnection.FormatOptions.AssignedValues := [TFDFormatOptionValue.fvMapRules];
  viConnection.FormatOptions.OwnMapRules := True;

  viMapRule := viConnection.FormatOptions.MapRules.Add;
  viMapRule.SourceDataType := TFDDataType.dtInt64;
  viMapRule.TargetDataType := TFDDataType.dtInt32;

  viConnection.ResourceOptions.AssignedValues := [
    TFDResourceOptionValue.rvMacroCreate,
    TFDResourceOptionValue.rvMacroExpand,
    TFDResourceOptionValue.rvAutoReconnect
  ];

  viConnection.ResourceOptions.AutoReconnect := True;

  viConnection.TxOptions.Params.Add('wait');
  viConnection.LoginPrompt := False;

  Create(viConnection, True);
end;

function TConexaoDb.Buscar(
  const vpColuna: string;
  const vpSistemaId: Integer;
  const vpGrupo: string;
  const vpSecao: string;
  const vpNome: string): TI9Query;
var
  viNomeEstacao: string;
begin
  Result := nil;
  try
    viNomeEstacao := BuscarNomeEstacao;

    Result := TI9Query.Create(nil);
    Result.Connection := FConnection;

    BuscarParametro(
      Result,
      vpColuna,
      vpSistemaId,
      vpGrupo,
      vpSecao,
      vpNome,
      viNomeEstacao);

    if not Result.IsEmpty then
      Exit;

    BuscarParametro(
      Result,
      vpColuna,
      vpSistemaId,
      vpGrupo,
      vpSecao,
      vpNome,
      string.Empty);
  except
    FreeAndNil(Result);
    raise;
  end;
end;

class function TConexaoDb.BuscarConfigCaminho(
  const vpSistemaId: Integer;
  const vpGrupo: string;
  const vpSecao: string;
  const vpNome: string): string;
var
  viListaSistema: TDictionary<Integer, string>;
  viSistema: string;
begin
  viListaSistema := nil;
  try
    viListaSistema := TDictionary<Integer, string>.Create;

    viListaSistema.Add(CI_COD_SISTEMA_REGISTRO_IMOVEIS, 'RI');
    viListaSistema.Add(CI_COD_SISTEMA_TABELIONATO_DE_NOTAS, 'TN');
    viListaSistema.Add(CI_COD_SISTEMA_CAIXA, 'CX');
    viListaSistema.Add(CI_COD_SISTEMA_RTD, 'RTD');
    viListaSistema.Add(CI_COD_SISTEMA_RC, 'RC');
    viListaSistema.Add(CI_COD_SISTEMA_PROTESTO, 'PT');

    viSistema := viListaSistema[vpSistemaId];

    Result := string.Format(
      '%s\%s\%s\%s',
      [viSistema,
      vpGrupo,
      vpSecao,
      vpNome]);
  finally
    FreeAndNil(viListaSistema);
  end;
end;

function TConexaoDb.BuscarConfigTexto(
  const vpSistemaId: Integer;
  const vpGrupo: string;
  const vpSecao: string;
  const vpNome: string): AnsiString;
var
  viQuery: TI9Query;
begin
  viQuery := nil;
  try
    viQuery := Buscar(
      'G_CO.TEXTO',
      vpSistemaId,
      vpGrupo,
      vpSecao,
      vpNome);

    Result := viQuery.FieldByName('TEXTO').AsString;
  finally
    FreeAndNil(viQuery);
  end;
end;

function TConexaoDb.BuscarConfigValor(
  const vpSistemaId: Integer;
  const vpGrupo: string;
  const vpSecao: string;
  const vpNome: string): string;
var
  viQuery: TI9Query;
begin
  viQuery := nil;
  try
    viQuery := Buscar(
      'G_CO.VALOR',
      vpSistemaId,
      vpGrupo,
      vpSecao,
      vpNome);

    Result := viQuery.FieldByName('VALOR').AsString;
  finally
    FreeAndNil(viQuery);
  end;
end;

procedure TConexaoDb.BuscarDadosConexao(
  out vpBaseDados: string;
  out vpUsuario: string;
  out vpSenha: string);
var
  viCripto: TEvCriptografa;
begin
  vpBaseDados := string.Empty;
  vpUsuario := string.Empty;
  vpSenha := string.Empty;

  viCripto := nil;
  try
    BuscarDadosIni(
      vpBaseDados,
      vpUsuario,
      vpSenha);

    viCripto := TEvCriptografa.Create(nil);
    viCripto.Key := 'Grupo@I9vare@Tri7';

    vpBaseDados := viCripto.CriptoHexToText(vpBaseDados);
    vpUsuario := viCripto.CriptoHexToText(vpUsuario);
    vpSenha := viCripto.CriptoHexToText(vpSenha);
  finally
    FreeAndNil(viCripto);
  end;
end;

procedure TConexaoDb.BuscarDadosIni(
  out vpBaseDados: string;
  out vpUsuario: string;
  out vpSenha: string);
const
  CI_SECTION: string = 'Geral';

var
  viIniFile: TIniFile;
begin
  vpBaseDados := string.Empty;
  vpUsuario := string.Empty;
  vpSenha := string.Empty;

  viIniFile := nil;
  try
    viIniFile := TIniFile.Create(TPath.GetLibraryPath + 'Config.ini');
    vpBaseDados := viIniFile.ReadString(CI_SECTION, 'BaseDados', string.Empty);
    vpUsuario := viIniFile.ReadString(CI_SECTION, 'Usuario', string.Empty);
    vpSenha := viIniFile.ReadString(CI_SECTION, 'Senha', string.Empty);
  finally
    FreeAndNil(viIniFile);
  end;
end;

function TConexaoDb.BuscarDataHoraBanco: TDateTime;
var
  viFirebirdUtil: TFirebirdUtil;
begin
  viFirebirdUtil := nil;
  try
    viFirebirdUtil := TFirebirdUtil.Create(FConnection);
    Result := viFirebirdUtil.BuscarDataHoraBanco;
  finally
    FreeAndNil(viFirebirdUtil);
  end;
end;

function TConexaoDb.BuscarDefinicaoConexao: IFDStanConnectionDef;
const
  CI_NAME: string = 'tri7';

var
  viParams: TFDPhysFBConnectionDefParams;
  viBaseDados: string;
  viUsuario: string;
  viSenha: string;
begin
  Result := FDManager.ConnectionDefs.FindConnectionDef(CI_NAME);
  if Assigned(Result) then
    Exit;

  Result := FDManager.ConnectionDefs.AddConnectionDef;
  Result.Name := CI_NAME;

  BuscarDadosConexao(
    viBaseDados,
    viUsuario,
    viSenha);

  viParams := TFDPhysFBConnectionDefParams(Result.Params);
  viParams.DriverID := 'FB';
  viParams.Database := viBaseDados;
  viParams.UserName := viUsuario;
  viParams.Password := viSenha;
  viParams.CharacterSet := TIBCharacterSet.csISO8859_1;

  Result.Apply;
end;

function TConexaoDb.BuscarNomeEstacao: string;
var
  lpBuffer : PChar;
  nSize : DWord;
const
  Buff_Size = MAX_COMPUTERNAME_LENGTH + 1;
begin
  nSize := Buff_Size;
  lpBuffer := StrAlloc(Buff_Size);
  GetComputerName(lpBuffer,nSize);
  Result := String(lpBuffer);
  StrDispose(lpBuffer);
end;

procedure TConexaoDb.BuscarParametro(
  vpQuery: TI9Query;
  const vpColuna: string;
  const vpSistemaId: Integer;
  const vpGrupo: string;
  const vpSecao: string;
  const vpNome: string;
  const vpTerminal: string);
var
  viSql: string;
  viMensagem: string;
begin
  viSql :=
    'SELECT '+
    vpColuna +
    ' FROM '+
    '    G_CONFIG G_CO '+
    'INNER JOIN '+
    '    G_CONFIG_GRUPO G_CG ON G_CG.CONFIG_GRUPO_ID = G_CO.CONFIG_GRUPO_ID '+
    'WHERE '+
    '    G_CG.SISTEMA_ID = :P_SISTEMA_ID AND '+
    '    G_CG.DESCRICAO = :P_GRUPO AND '+
    '    G_CO.SECAO = :P_SECAO AND '+
    '    G_CO.NOME = :P_NOME ';

  if not vpTerminal.IsEmpty then
    viSql := viSql + ' AND G_CO.TERMINAL = :P_TERMINAL';

  vpQuery.SQL.Text := viSql;

  vpQuery.ParamByName('P_SISTEMA_ID').AsInteger := vpSistemaId;
  vpQuery.ParamByName('P_GRUPO').AsString := vpGrupo;
  vpQuery.ParamByName('P_SECAO').AsString := vpSecao;
  vpQuery.ParamByName('P_NOME').AsString := vpNome;

  if not vpTerminal.IsEmpty then
    vpQuery.ParamByName('P_TERMINAL').AsString := vpTerminal;

  vpQuery.Open;

  if vpQuery.IsEmpty and vpTerminal.IsEmpty then
  begin
    viMensagem := string.Format(
      'Parâmetro %d\%s\%s\%s não existe!',
      [
        vpSistemaId,
        vpGrupo,
        vpSecao,
        vpNome]);

    raise Exception.Create(viMensagem);
  end;

  if vpQuery.RecordCount > 1 then
  begin
    viMensagem := string.Format(
      'Parâmetro %d\%s\%s\%s\%s está duplicado!',
      [
        vpSistemaId,
        vpGrupo,
        vpSecao,
        vpNome,
        vpTerminal]);

    raise Exception.Create(viMensagem);
  end;
end;

constructor TConexaoDb.Create(
  const vpConnection: TI9Connection;
  const vpOwnsConnection: Boolean);
begin
  inherited Create;
  FConnection := vpConnection;
  FOwnsConnection := vpOwnsConnection;
end;

destructor TConexaoDb.Destroy;
begin
  if FOwnsConnection then
    FreeAndNil(FConnection);

  inherited;
end;

end.
