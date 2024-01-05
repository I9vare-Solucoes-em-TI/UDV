unit Geral.Model.Config;

interface

uses
  Geral.Model.DAO,
  Data.DB,
  FireDAC.Stan.Param,
  System.Classes,
  System.Generics.Collections;

type
  TConfigGrupo = class
  strict private
    FConfigGrupoId: Integer;
    FDescricao: string;
    FSistemaId: Integer;
  public
    property ConfigGrupoId: Integer read FConfigGrupoId write FConfigGrupoId;
    property Descricao: string read FDescricao write FDescricao;
    property SistemaId: Integer read FSistemaId write FSistemaId;
  end;

  TConfig = class
  strict private
    FConfigId: Integer;
    FConfigGrupoId: Integer;
    FConfigPadraoId: Integer;
    FSecao: string;
    FNome: string;
    FValor: string;
    FDescricao: string;
    FTexto: TStream;
    FTerminal: string;
    FTipo_valor: string;
    FAtualizado: string;
    FObrigatorio: string;
  public
    Destructor Destroy; override;

    property ConfigId: Integer read FConfigId write FConfigId;
    property ConfigGrupoId: Integer read FConfigGrupoId write FConfigGrupoId;
    property ConfigPadraoId: Integer read FConfigPadraoId write FConfigPadraoId;
    property Secao: string read FSecao write FSecao;
    property Nome: string read FNome write FNome;
    property Valor: string read FValor write FValor;
    property Descricao: string read FDescricao write FDescricao;
    property Texto: TStream read FTexto write FTexto;
    property Terminal: string read FTerminal write FTerminal;
    property Tipo_valor: string read FTipo_valor write FTipo_valor;
    property Atualizado: string read FAtualizado write FAtualizado;
    property Obrigatorio: string read FObrigatorio write FObrigatorio;
  end;

  TConfigGrupoDAO = class(TDAO<TConfigGrupo>)
  protected
    function CreateObject(
      const vpDataSet: TDataSet): TConfigGrupo; override;

    function GetTableName: string; override;
    function GetColumns: TArray<string>; override;

    procedure FillParams(
      const vpParams: TFDParams;
      const vpIndex: Integer;
      const vpValue: TConfigGrupo); override;
  end;

  TConfigDAO = class(TDAO<TConfig>)
  protected
    function CreateObject(
      const vpDataSet: TDataSet): TConfig; override;

    function GetTableName: string; override;
    function GetColumns: TArray<string>; override;

    procedure FillParams(
      const vpParams: TFDParams;
      const vpIndex: Integer;
      const vpValue: TConfig); override;
  end;

  TConfigGrupoBusiness = class
  public
    class function Buscar(
      const vpGrupo: String;
      const vpSistemaId: Integer): TConfigGrupo;
  end;

  TConfigBusiness = class
  public
    class function Buscar(
      const vpGrupo: String;
      const vpSecao: String;
      const vpNome: String;
      const vpSistemaId: Integer): TConfig;

    class procedure Salvar(
      const vpConfig: TConfig);
  end;

implementation

uses
  Controles,
  System.SysUtils;

{ TConfigBusiness }

class function TConfigBusiness.Buscar(
  const vpGrupo: String;
  const vpSecao: String;
  const vpNome: String;
  const vpSistemaId: Integer): TConfig;
var
  viConfigGrupo: TConfigGrupo;
  viConfigDAO: TConfigDAO;
begin
  Result := nil;
  viConfigGrupo := nil;
  viConfigDAO := nil;
  try
    try
      viConfigGrupo := TConfigGrupoBusiness.Buscar(
        vpGrupo,
        vpSistemaId);

      if not Assigned(viConfigGrupo) then
        Exit;

      viConfigDAO := TConfigDAO.Create(dtmControles.DB);
      Result := viConfigDAO.GetObject(
        'SECAO = :P_SECAO AND NOME = :P_NOME AND CONFIG_GRUPO_ID = :P_CONFIG_GRUPO_ID',
        [vpSecao, vpNome, viConfigGrupo.ConfigGrupoId],
        'CONFIG_ID');

    except
      FreeAndNil(Result);
      raise;
    end;

  finally
    FreeAndNil(viConfigGrupo);
    FreeAndNil(viConfigDAO);
  end;
end;

class procedure TConfigBusiness.Salvar(
  const vpConfig: TConfig);
var
  viConfigDAO: TConfigDAO;
  viInTransaction: Boolean;
begin
  viConfigDAO := TConfigDAO.Create(dtmControles.DB);
  try
    viInTransaction := dtmControles.DB.InTransaction;
    if not viInTransaction then
      dtmControles.DB.StartTransaction;
    try
      if vpConfig.ConfigId = 0 then
      begin
        vpConfig.ConfigId := dtmControles.GerarSequencia('G_CONFIG');

        viConfigDAO.Insert(vpConfig);
      end
      else
        viConfigDAO.Update(vpConfig);

      if not viInTransaction then
        dtmControles.DB.Commit;
    except
      if not viInTransaction then
        dtmControles.DB.Rollback;

      raise;
    end;
  finally
    FreeAndNil(viConfigDAO);
  end;
end;

{ TConfigDAO }

function TConfigDAO.CreateObject(
  const vpDataSet: TDataSet): TConfig;
begin
  Result := TConfig.Create;
  Result.ConfigId := vpDataSet.FieldByName('CONFIG_ID').AsInteger;
  Result.ConfigGrupoId := vpDataSet.FieldByName('CONFIG_GRUPO_ID').AsInteger;
  Result.ConfigPadraoId := vpDataSet.FieldByName('CONFIG_PADRAO_ID').AsInteger;
  Result.Secao := vpDataSet.FieldByName('SECAO').AsString;
  Result.Nome := vpDataSet.FieldByName('NOME').AsString;
  Result.Valor := vpDataSet.FieldByName('VALOR').AsString;
  Result.Descricao := vpDataSet.FieldByName('DESCRICAO').AsString;
  Result.Texto := vpDataSet.CreateBlobStream(vpDataSet.FieldByName('TEXTO'), TBlobStreamMode.bmRead);
  Result.Terminal := vpDataSet.FieldByName('TERMINAL').AsString;
  Result.Tipo_valor := vpDataSet.FieldByName('TIPO_VALOR').AsString;
  Result.Atualizado := vpDataSet.FieldByName('ATUALIZADO').AsString;
  Result.Obrigatorio := vpDataSet.FieldByName('OBRIGATORIO').AsString;
end;

procedure TConfigDAO.FillParams(
  const vpParams: TFDParams;
  const vpIndex: Integer;
  const vpValue: TConfig);
begin
  inherited;
  vpParams.ParamByName('CONFIG_ID').AsIntegers[vpIndex] := vpValue.ConfigId;
  vpParams.ParamByName('CONFIG_GRUPO_ID').AsIntegers[vpIndex] := vpValue.ConfigGrupoId;
  vpParams.ParamByName('CONFIG_PADRAO_ID').AsIntegers[vpIndex] := vpValue.ConfigPadraoId;
  vpParams.ParamByName('SECAO').AsStrings[vpIndex] := vpValue.Secao;
  vpParams.ParamByName('NOME').AsStrings[vpIndex] := vpValue.Nome;
  vpParams.ParamByName('VALOR').AsStrings[vpIndex] := vpValue.Valor;
  vpParams.ParamByName('DESCRICAO').AsStrings[vpIndex] := vpValue.Descricao;
  vpParams.ParamByName('TEXTO').AsStreams[vpIndex] := vpValue.Texto;
  vpParams.ParamByName('TERMINAL').AsStrings[vpIndex] := vpValue.Terminal;
  vpParams.ParamByName('TIPO_VALOR').AsStrings[vpIndex] := vpValue.Tipo_valor;
  vpParams.ParamByName('ATUALIZADO').AsStrings[vpIndex] := vpValue.Atualizado;
  vpParams.ParamByName('OBRIGATORIO').AsStrings[vpIndex] := vpValue.Obrigatorio;
end;

function TConfigDAO.GetColumns: TArray<string>;
begin
  Result := [];
end;

function TConfigDAO.GetTableName: string;
begin
  Result := 'G_CONFIG';
end;

{ TConfigGrupoDAO }

function TConfigGrupoDAO.CreateObject(
  const vpDataSet: TDataSet): TConfigGrupo;
begin
  Result := TConfigGrupo.Create;
  Result.ConfigGrupoId := vpDataSet.FieldByName('CONFIG_GRUPO_ID').AsInteger;
  Result.SistemaId := vpDataSet.FieldByName('SISTEMA_ID').AsInteger;
  Result.Descricao := vpDataSet.FieldByName('DESCRICAO').AsString;
end;

procedure TConfigGrupoDAO.FillParams(
  const vpParams: TFDParams;
  const vpIndex: Integer;
  const vpValue: TConfigGrupo);
begin
  inherited;
  vpParams.ParamByName('CONFIG_GRUPO_ID').AsIntegers[vpIndex] := vpValue.ConfigGrupoId;
  vpParams.ParamByName('SISTEMA_ID').AsIntegers[vpIndex] := vpValue.SistemaId;
  vpParams.ParamByName('DESCRICAO').AsStrings[vpIndex] := vpValue.Descricao;
end;

function TConfigGrupoDAO.GetColumns: TArray<string>;
begin
  Result := [];
end;

function TConfigGrupoDAO.GetTableName: string;
begin
  Result := 'G_CONFIG_GRUPO';
end;

{ TConfigGrupoBusiness }

class function TConfigGrupoBusiness.Buscar(
  const vpGrupo: String;
  const vpSistemaId: Integer): TConfigGrupo;
var
  viConfigGrupoDAO: TConfigGrupoDAO;
  viConfigGrupoList: TObjectList<TConfigGrupo>;
begin
  Result := nil;
  viConfigGrupoDAO := nil;
  try
    try
      viConfigGrupoDAO := TConfigGrupoDAO.Create(dtmControles.DB);
      viConfigGrupoList := viConfigGrupoDAO.GetList(
        1,
        0,
        'DESCRICAO = :P_DESCRICAO AND SISTEMA_ID = :P_SISTEMA_ID',
        [vpGrupo, vpSistemaId],
        'CONFIG_GRUPO_ID');

      Result := TConfigGrupo.Create;
      Result.ConfigGrupoId := viConfigGrupoList[0].ConfigGrupoId;
      Result.Descricao := viConfigGrupoList[0].Descricao;
      Result.SistemaId := viConfigGrupoList[0].SistemaId;

    except
      Result.Free;
      raise;
    end;

  finally
    FreeAndNil(viConfigGrupoDAO);
    FreeAndNil(viConfigGrupoList);
  end;
end;

{ TConfig }

destructor TConfig.Destroy;
begin
  FreeAndNil(FTexto);

  inherited;
end;

end.
