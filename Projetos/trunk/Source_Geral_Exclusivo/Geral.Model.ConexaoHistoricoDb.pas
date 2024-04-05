unit Geral.Model.ConexaoHistoricoDb;

interface

uses
  I9Connection,
  FireDAC.Stan.Intf;

type
  TConexaoHistoricoDb = class
  private
    FConnection: TI9Connection;
    FOwnsConnection: Boolean;

    function BuscarDefinicaoConexao: IFDStanConnectionDef;

    procedure BuscarDadosIni(
      out vpBaseDadosHistorico: string;
      out vpUsuario: string;
      out vpSenha: string);

    procedure BuscarDadosConexao(
      out vpBaseDadosHistorico: string;
      out vpUsuario: string;
      out vpSenha: string);

  public
    constructor Create; overload;

    constructor Create(
      const vpConnection: TI9Connection;
      const vpOwnsConnection: Boolean); overload;

    function BuscarDataHoraBanco: TDateTime;

    property Connection: TI9Connection read FConnection;

    destructor Destroy; override;
  end;

implementation
uses
  ECripto,
  System.SysUtils,
  System.IniFiles,
  System.IOUtils,
  Geral.Model.Util.Firebird,
  FireDAC.Stan.Option,
  FireDAC.Phys.FBDef,
  FireDAC.Comp.Client,
  FireDAC.Phys.IBWrapper;

{ TConexaoHistoricoDb }

procedure TConexaoHistoricoDb.BuscarDadosConexao(
  out vpBaseDadosHistorico: string;
  out vpUsuario: string;
  out vpSenha: string);
var
  viCripto: TEvCriptografa;
begin
  vpBaseDadosHistorico := string.Empty;
  vpUsuario := string.Empty;
  vpSenha := string.Empty;

  viCripto := nil;
  try
    BuscarDadosIni(
      vpBaseDadosHistorico,
      vpUsuario,
      vpSenha);

    viCripto := TEvCriptografa.Create(nil);
    viCripto.Key := 'Grupo@I9vare@Tri7';

    vpBaseDadosHistorico := viCripto.CriptoHexToText(vpBaseDadosHistorico);
    vpUsuario := viCripto.CriptoHexToText(vpUsuario);
    vpSenha := viCripto.CriptoHexToText(vpSenha);
  finally
    FreeAndNil(viCripto);
  end;
end;

procedure TConexaoHistoricoDb.BuscarDadosIni(
  out vpBaseDadosHistorico: string;
  out vpUsuario: string;
  out vpSenha: string);
const
  CI_SECTION: string = 'Geral';

var
  viIniFile: TIniFile;
begin
  vpBaseDadosHistorico := string.Empty;
  vpUsuario := string.Empty;
  vpSenha := string.Empty;

  viIniFile := nil;
  try
    viIniFile := TIniFile.Create(TPath.GetLibraryPath + 'Config.ini');
    vpBaseDadosHistorico := viIniFile.ReadString(CI_SECTION, 'BaseDadosHistorico', string.Empty);
    vpUsuario := viIniFile.ReadString(CI_SECTION, 'Usuario', string.Empty);
    vpSenha := viIniFile.ReadString(CI_SECTION, 'Senha', string.Empty);
  finally
    FreeAndNil(viIniFile);
  end;
end;

function TConexaoHistoricoDb.BuscarDataHoraBanco: TDateTime;
var
  viFirebirdUtil: TFirebirdUtil;
begin
  viFirebirdUtil := nil;

  try
    viFirebirdUtil := TFirebirdUtil.Create(
      FConnection);

    Result := viFirebirdUtil.BuscarDataHoraBanco;

  finally
    FreeAndNil(viFirebirdUtil);
  end;
end;

constructor TConexaoHistoricoDb.Create;
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

function TConexaoHistoricoDb.BuscarDefinicaoConexao: IFDStanConnectionDef;
const
  CI_NAME: string = 'tri7Historico';

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

constructor TConexaoHistoricoDb.Create(const vpConnection: TI9Connection;
  const vpOwnsConnection: Boolean);
begin
  inherited Create;
  FConnection := vpConnection;
  FOwnsConnection := vpOwnsConnection;
end;

destructor TConexaoHistoricoDb.Destroy;
begin
  if FOwnsConnection then
    FreeAndNil(FConnection);

  inherited;
end;

end.
