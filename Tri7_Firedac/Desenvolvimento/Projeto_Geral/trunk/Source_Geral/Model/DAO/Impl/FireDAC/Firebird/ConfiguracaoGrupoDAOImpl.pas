unit ConfiguracaoGrupoDAOImpl;

interface

uses
  ConfiguracaoGrupoDAO,
  FireDAC.Comp.Client,
  Data.DB,
  ConfiguracaoGrupo,
  ConfiguracaoGrupoList,
  Sistema;

type
  TConfiguracaoGrupoDAO = class(TInterfacedObject, IConfiguracaoGrupoDAO)
  private
    FFDConnection: TFDConnection;
  public
    constructor Create(
      const vpFDConnection: TFDConnection); reintroduce;

    function Get(
      const vpValue: TDataSet): IConfiguracaoGrupo;

    function GetByID(
      const vpValue: Variant): IConfiguracaoGrupo; virtual; abstract;

    function GetList: TConfiguracaoGrupoList; overload; virtual; abstract;

    function GetList(
      const vpValue: ISistema): TConfiguracaoGrupoList; overload;

    procedure Inserir(
      const vpValue: IConfiguracaoGrupo); virtual; abstract;

    procedure Alterar(
      const vpValue: IConfiguracaoGrupo); virtual; abstract;

    procedure Excluir(
      const vpValue: IConfiguracaoGrupo); virtual; abstract;
  end;

implementation

uses
  System.SysUtils,
  ConfiguracaoGrupoImpl,
  SistemaDAOImpl,
  BooleanHelper,
  FireDAC.Stan.Option;

{ TConfiguracaoGrupoDAO }

constructor TConfiguracaoGrupoDAO.Create(
  const vpFDConnection: TFDConnection);
begin
  inherited Create;
  FFDConnection := vpFDConnection;
end;

function TConfiguracaoGrupoDAO.Get(
  const vpValue: TDataSet): IConfiguracaoGrupo;
{$REGION 'Variáveis'}
var
  viField: TField;
  viSistemaDAO: TSistemaDAO;
{$ENDREGION}
begin
  Result := TConfiguracaoGrupo.Create;

  with vpValue, Result do
  begin
    viField := FindField('G_CG_CONFIG_GRUPO_ID');
    if Assigned(viField) then
      ConfiguracaoGrupoID := viField.AsInteger;

    viField := FindField('G_CG_DESCRICAO');
    if Assigned(viField) then
      Descricao := viField.AsString;

    viField := FindField('G_S_SISTEMA_ID');
    if Assigned(viField) then
    begin
      viSistemaDAO := TSistemaDAO.Create(FFDConnection);
      try
        Sistema := viSistemaDAO.Get(vpValue);
      finally
        FreeAndNil(viSistemaDAO);
      end;
    end;
  end;
end;

function TConfiguracaoGrupoDAO.GetList(
  const vpValue: ISistema): TConfiguracaoGrupoList;
{$REGION 'Constantes'}
const
  CI_CAPACITY: Integer = 7;
{$ENDREGION}

{$REGION 'Variáveis'}
var
  viFDQuery: TFDQuery;
  viConfiguracaoGrupo: IConfiguracaoGrupo;
{$ENDREGION}
begin
  Result := TConfiguracaoGrupoList.Create;

  viFDQuery := TFDQuery.Create(nil);
  viFDQuery.Connection := FFDConnection;

  viFDQuery.FetchOptions.Unidirectional := True;
  viFDQuery.FetchOptions.RecordCountMode := cmTotal;

  try
    with viFDQuery do
    begin
      with SQL do
      begin
        Capacity := CI_CAPACITY;

        {$REGION 'Comando SQL SELECT'}
        Add('SELECT');

        {$REGION 'Colunas'}
        Add('G_CG.CONFIG_GRUPO_ID G_CG_CONFIG_GRUPO_ID,');
        Add('G_CG.DESCRICAO G_CG_DESCRICAO');
        {$ENDREGION}

        {$REGION 'Cláusula FROM'}
        Add('FROM');
        Add('G_CONFIG_GRUPO G_CG');
        {$ENDREGION}

        {$REGION 'Cláusula WHERE e Parâmetros'}
        Add('WHERE');
        Add('G_CG.SISTEMA_ID = :P_SISTEMA_ID');
        {$ENDREGION}

        {$ENDREGION}
      end;

      {$REGION 'Preencher valores dos parâmetros'}
      ParamByName('P_SISTEMA_ID').AsInteger := vpValue.SistemaID;
      {$ENDREGION}

      Open;

      try
        if IsEmpty then
          Exit;

        First;
        Result.Capacity := RecordCount;

        while Eof.&Not do
          try
            viConfiguracaoGrupo := Get(viFDQuery);
            viConfiguracaoGrupo.Sistema := vpValue;
            Result.Add(viConfiguracaoGrupo);
          finally
            Next;
          end;
      finally
        Close;
      end;
    end;
  finally
    FreeAndNil(viFDQuery);
  end;
end;

end.
